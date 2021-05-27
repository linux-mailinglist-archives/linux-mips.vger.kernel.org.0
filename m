Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8CC239392E
	for <lists+linux-mips@lfdr.de>; Fri, 28 May 2021 01:22:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236709AbhE0XXo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 27 May 2021 19:23:44 -0400
Received: from aposti.net ([89.234.176.197]:36178 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236705AbhE0XXl (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 27 May 2021 19:23:41 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <mripard@kernel.org>
Cc:     list@opendingux.net, linux-mips@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 07/11] drm/ingenic: Upload palette before frame
Date:   Fri, 28 May 2021 00:21:01 +0100
Message-Id: <20210527232104.152577-8-paul@crapouillou.net>
In-Reply-To: <20210527232104.152577-1-paul@crapouillou.net>
References: <20210527232104.152577-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When using C8 color mode, make sure that the palette is always uploaded
before a frame; otherwise the very first frame will have wrong colors.

Do that by changing the link order of the DMA descriptors.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 45 ++++++++++++++++++-----
 1 file changed, 35 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 5ba3283da97d..ced2109e8f35 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -68,6 +68,7 @@ struct ingenic_drm_private_state {
 	struct drm_private_state base;
 
 	bool no_vblank;
+	bool use_palette;
 };
 
 struct ingenic_drm {
@@ -185,6 +186,13 @@ static inline dma_addr_t dma_hwdesc_addr(const struct ingenic_drm *priv, bool us
 	return priv->dma_hwdescs_phys + offset;
 }
 
+static inline dma_addr_t dma_hwdesc_pal_addr(const struct ingenic_drm *priv)
+{
+	u32 offset = offsetof(struct ingenic_dma_hwdescs, hwdesc_pal);
+
+	return priv->dma_hwdescs_phys + offset;
+}
+
 static int ingenic_drm_update_pixclk(struct notifier_block *nb,
 				     unsigned long action,
 				     void *data)
@@ -207,11 +215,19 @@ static void ingenic_drm_crtc_atomic_enable(struct drm_crtc *crtc,
 					   struct drm_atomic_state *state)
 {
 	struct ingenic_drm *priv = drm_crtc_get_priv(crtc);
+	struct ingenic_drm_private_state *priv_state;
+
+	priv_state = ingenic_drm_get_new_priv_state(priv, state);
+	if (WARN_ON(!priv_state))
+		return;
 
 	regmap_write(priv->map, JZ_REG_LCD_STATE, 0);
 
 	/* Set address of our DMA descriptor chain */
-	regmap_write(priv->map, JZ_REG_LCD_DA0, dma_hwdesc_addr(priv, 0));
+	if (priv_state->use_palette)
+		regmap_write(priv->map, JZ_REG_LCD_DA0, dma_hwdesc_pal_addr(priv));
+	else
+		regmap_write(priv->map, JZ_REG_LCD_DA0, dma_hwdesc_addr(priv, 0));
 	regmap_write(priv->map, JZ_REG_LCD_DA1, dma_hwdesc_addr(priv, 1));
 
 	regmap_update_bits(priv->map, JZ_REG_LCD_CTRL,
@@ -422,6 +438,7 @@ static int ingenic_drm_plane_atomic_check(struct drm_plane *plane,
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
 	struct ingenic_drm *priv = drm_device_get_priv(plane->dev);
+	struct ingenic_drm_private_state *priv_state;
 	struct drm_crtc_state *crtc_state;
 	struct drm_crtc *crtc = new_plane_state->crtc ?: old_plane_state->crtc;
 	int ret;
@@ -434,6 +451,10 @@ static int ingenic_drm_plane_atomic_check(struct drm_plane *plane,
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
+	priv_state = ingenic_drm_get_priv_state(priv, state);
+	if (IS_ERR(priv_state))
+		return PTR_ERR(priv_state);
+
 	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
 						  DRM_PLANE_HELPER_NO_SCALING,
 						  DRM_PLANE_HELPER_NO_SCALING,
@@ -452,6 +473,9 @@ static int ingenic_drm_plane_atomic_check(struct drm_plane *plane,
 	     (new_plane_state->src_h >> 16) != new_plane_state->crtc_h))
 		return -EINVAL;
 
+	priv_state->use_palette = new_plane_state->fb &&
+		new_plane_state->fb->format->format == DRM_FORMAT_C8;
+
 	/*
 	 * Require full modeset if enabling or disabling a plane, or changing
 	 * its position, size or depth.
@@ -611,10 +635,11 @@ static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
 	struct ingenic_drm *priv = drm_device_get_priv(plane->dev);
 	struct drm_plane_state *newstate = drm_atomic_get_new_plane_state(state, plane);
 	struct drm_plane_state *oldstate = drm_atomic_get_old_plane_state(state, plane);
+	struct ingenic_drm_private_state *priv_state;
 	struct drm_crtc_state *crtc_state;
 	struct ingenic_dma_hwdesc *hwdesc;
-	unsigned int width, height, cpp, offset;
-	dma_addr_t addr;
+	unsigned int width, height, cpp;
+	dma_addr_t addr, next_addr;
 	bool use_f1;
 	u32 fourcc;
 
@@ -630,23 +655,23 @@ static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
 		height = newstate->src_h >> 16;
 		cpp = newstate->fb->format->cpp[0];
 
+		priv_state = ingenic_drm_get_new_priv_state(priv, state);
+		if (priv_state && priv_state->use_palette)
+			next_addr = dma_hwdesc_pal_addr(priv);
+		else
+			next_addr = dma_hwdesc_addr(priv, use_f1);
+
 		hwdesc = &priv->dma_hwdescs->hwdesc[use_f1];
 
 		hwdesc->addr = addr;
 		hwdesc->cmd = JZ_LCD_CMD_EOF_IRQ | (width * height * cpp / 4);
+		hwdesc->next = next_addr;
 
 		if (drm_atomic_crtc_needs_modeset(crtc_state)) {
 			fourcc = newstate->fb->format->format;
 
 			ingenic_drm_plane_config(priv->dev, plane, fourcc);
 
-			if (fourcc == DRM_FORMAT_C8)
-				offset = offsetof(struct ingenic_dma_hwdescs, hwdesc_pal);
-			else
-				offset = offsetof(struct ingenic_dma_hwdescs, hwdesc[0]);
-
-			priv->dma_hwdescs->hwdesc[0].next = priv->dma_hwdescs_phys + offset;
-
 			crtc_state->color_mgmt_changed = fourcc == DRM_FORMAT_C8;
 		}
 
-- 
2.30.2

