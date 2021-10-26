Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDAE743B933
	for <lists+linux-mips@lfdr.de>; Tue, 26 Oct 2021 20:13:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236587AbhJZSQC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 Oct 2021 14:16:02 -0400
Received: from aposti.net ([89.234.176.197]:40394 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238135AbhJZSP4 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 26 Oct 2021 14:15:56 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Paul Boddie <paul@boddie.org.uk>, list@opendingux.net,
        linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [RESEND PATCH v3 5/6] drm/ingenic: Upload palette before frame
Date:   Tue, 26 Oct 2021 19:12:39 +0100
Message-Id: <20211026181240.213806-6-paul@crapouillou.net>
In-Reply-To: <20211026181240.213806-1-paul@crapouillou.net>
References: <20211026181240.213806-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When using C8 color mode, make sure that the palette is always uploaded
before a frame; otherwise the very first frame will have wrong colors.

Do that by changing the link order of the DMA descriptors.

v3: Fix ingenic_drm_get_new_priv_state() called instead of
    ingenic_drm_get_priv_state()

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 53 ++++++++++++++++++++---
 1 file changed, 47 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index cbc76cede99e..a5e2880e07a1 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -66,6 +66,7 @@ struct jz_soc_info {
 
 struct ingenic_drm_private_state {
 	struct drm_private_state base;
+	bool use_palette;
 };
 
 struct ingenic_drm {
@@ -113,6 +114,30 @@ to_ingenic_drm_priv_state(struct drm_private_state *state)
 	return container_of(state, struct ingenic_drm_private_state, base);
 }
 
+static struct ingenic_drm_private_state *
+ingenic_drm_get_priv_state(struct ingenic_drm *priv, struct drm_atomic_state *state)
+{
+	struct drm_private_state *priv_state;
+
+	priv_state = drm_atomic_get_private_obj_state(state, &priv->private_obj);
+	if (IS_ERR(priv_state))
+		return ERR_CAST(priv_state);
+
+	return to_ingenic_drm_priv_state(priv_state);
+}
+
+static struct ingenic_drm_private_state *
+ingenic_drm_get_new_priv_state(struct ingenic_drm *priv, struct drm_atomic_state *state)
+{
+	struct drm_private_state *priv_state;
+
+	priv_state = drm_atomic_get_new_private_obj_state(state, &priv->private_obj);
+	if (!priv_state)
+		return NULL;
+
+	return to_ingenic_drm_priv_state(priv_state);
+}
+
 static bool ingenic_drm_writeable_reg(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
@@ -183,11 +208,18 @@ static void ingenic_drm_crtc_atomic_enable(struct drm_crtc *crtc,
 					   struct drm_atomic_state *state)
 {
 	struct ingenic_drm *priv = drm_crtc_get_priv(crtc);
+	struct ingenic_drm_private_state *priv_state;
+	unsigned int next_id;
+
+	priv_state = ingenic_drm_get_priv_state(priv, state);
+	if (WARN_ON(IS_ERR(priv_state)))
+		return;
 
 	regmap_write(priv->map, JZ_REG_LCD_STATE, 0);
 
-	/* Set address of our DMA descriptor chain */
-	regmap_write(priv->map, JZ_REG_LCD_DA0, dma_hwdesc_addr(priv, 0));
+	/* Set addresses of our DMA descriptor chains */
+	next_id = priv_state->use_palette ? HWDESC_PALETTE : 0;
+	regmap_write(priv->map, JZ_REG_LCD_DA0, dma_hwdesc_addr(priv, next_id));
 	regmap_write(priv->map, JZ_REG_LCD_DA1, dma_hwdesc_addr(priv, 1));
 
 	regmap_update_bits(priv->map, JZ_REG_LCD_CTRL,
@@ -393,6 +425,7 @@ static int ingenic_drm_plane_atomic_check(struct drm_plane *plane,
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
 	struct ingenic_drm *priv = drm_device_get_priv(plane->dev);
+	struct ingenic_drm_private_state *priv_state;
 	struct drm_crtc_state *crtc_state;
 	struct drm_crtc *crtc = new_plane_state->crtc ?: old_plane_state->crtc;
 	int ret;
@@ -405,6 +438,10 @@ static int ingenic_drm_plane_atomic_check(struct drm_plane *plane,
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
+	priv_state = ingenic_drm_get_priv_state(priv, state);
+	if (IS_ERR(priv_state))
+		return PTR_ERR(priv_state);
+
 	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
 						  DRM_PLANE_HELPER_NO_SCALING,
 						  DRM_PLANE_HELPER_NO_SCALING,
@@ -423,6 +460,9 @@ static int ingenic_drm_plane_atomic_check(struct drm_plane *plane,
 	     (new_plane_state->src_h >> 16) != new_plane_state->crtc_h))
 		return -EINVAL;
 
+	priv_state->use_palette = new_plane_state->fb &&
+		new_plane_state->fb->format->format == DRM_FORMAT_C8;
+
 	/*
 	 * Require full modeset if enabling or disabling a plane, or changing
 	 * its position, size or depth.
@@ -583,6 +623,7 @@ static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
 	struct drm_plane_state *newstate = drm_atomic_get_new_plane_state(state, plane);
 	struct drm_plane_state *oldstate = drm_atomic_get_old_plane_state(state, plane);
 	unsigned int width, height, cpp, next_id, plane_id;
+	struct ingenic_drm_private_state *priv_state;
 	struct drm_crtc_state *crtc_state;
 	struct ingenic_dma_hwdesc *hwdesc;
 	dma_addr_t addr;
@@ -600,19 +641,19 @@ static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
 		height = newstate->src_h >> 16;
 		cpp = newstate->fb->format->cpp[0];
 
-		hwdesc = &priv->dma_hwdescs->hwdesc[plane_id];
+		priv_state = ingenic_drm_get_new_priv_state(priv, state);
+		next_id = (priv_state && priv_state->use_palette) ? HWDESC_PALETTE : plane_id;
 
+		hwdesc = &priv->dma_hwdescs->hwdesc[plane_id];
 		hwdesc->addr = addr;
 		hwdesc->cmd = JZ_LCD_CMD_EOF_IRQ | (width * height * cpp / 4);
+		hwdesc->next = dma_hwdesc_addr(priv, next_id);
 
 		if (drm_atomic_crtc_needs_modeset(crtc_state)) {
 			fourcc = newstate->fb->format->format;
 
 			ingenic_drm_plane_config(priv->dev, plane, fourcc);
 
-			next_id = fourcc == DRM_FORMAT_C8 ? HWDESC_PALETTE : 0;
-			priv->dma_hwdescs->hwdesc[0].next = dma_hwdesc_addr(priv, next_id);
-
 			crtc_state->color_mgmt_changed = fourcc == DRM_FORMAT_C8;
 		}
 
-- 
2.33.0

