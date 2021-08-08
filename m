Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F2E73E3A8D
	for <lists+linux-mips@lfdr.de>; Sun,  8 Aug 2021 15:46:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231615AbhHHNqX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 8 Aug 2021 09:46:23 -0400
Received: from aposti.net ([89.234.176.197]:55796 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231634AbhHHNqW (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 8 Aug 2021 09:46:22 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc:     "H . Nikolaus Schaller" <hns@goldelico.com>,
        Paul Boddie <paul@boddie.org.uk>, list@opendingux.net,
        Sam Ravnborg <sam@ravnborg.org>, linux-mips@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 2/8] drm/ingenic: Simplify code by using hwdescs array
Date:   Sun,  8 Aug 2021 15:45:20 +0200
Message-Id: <20210808134526.119198-3-paul@crapouillou.net>
In-Reply-To: <20210808134526.119198-1-paul@crapouillou.net>
References: <20210808134526.119198-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Instead of having one 'hwdesc' variable for the plane #0 and one for the
plane #1, use a 'hwdesc[2]' array, where the DMA hardware descriptors
are indexed by the plane's number.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 38 ++++++++++++-----------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index e42eb43d8020..bc71ba44ccf4 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -49,8 +49,7 @@ struct ingenic_dma_hwdesc {
 } __aligned(16);
 
 struct ingenic_dma_hwdescs {
-	struct ingenic_dma_hwdesc hwdesc_f0;
-	struct ingenic_dma_hwdesc hwdesc_f1;
+	struct ingenic_dma_hwdesc hwdesc[2];
 	struct ingenic_dma_hwdesc hwdesc_pal;
 	u16 palette[256] __aligned(16);
 };
@@ -141,6 +140,13 @@ static inline struct ingenic_drm *drm_nb_get_priv(struct notifier_block *nb)
 	return container_of(nb, struct ingenic_drm, clock_nb);
 }
 
+static inline dma_addr_t dma_hwdesc_addr(const struct ingenic_drm *priv, bool use_f1)
+{
+	u32 offset = offsetof(struct ingenic_dma_hwdescs, hwdesc[use_f1]);
+
+	return priv->dma_hwdescs_phys + offset;
+}
+
 static int ingenic_drm_update_pixclk(struct notifier_block *nb,
 				     unsigned long action,
 				     void *data)
@@ -562,6 +568,7 @@ static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
 	struct ingenic_dma_hwdesc *hwdesc;
 	unsigned int width, height, cpp, offset;
 	dma_addr_t addr;
+	bool use_f1;
 	u32 fourcc;
 
 	if (newstate && newstate->fb) {
@@ -569,16 +576,14 @@ static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
 			drm_fb_cma_sync_non_coherent(&priv->drm, oldstate, newstate);
 
 		crtc_state = newstate->crtc->state;
+		use_f1 = priv->soc_info->has_osd && plane != &priv->f0;
 
 		addr = drm_fb_cma_get_gem_addr(newstate->fb, newstate, 0);
 		width = newstate->src_w >> 16;
 		height = newstate->src_h >> 16;
 		cpp = newstate->fb->format->cpp[0];
 
-		if (!priv->soc_info->has_osd || plane == &priv->f0)
-			hwdesc = &priv->dma_hwdescs->hwdesc_f0;
-		else
-			hwdesc = &priv->dma_hwdescs->hwdesc_f1;
+		hwdesc = &priv->dma_hwdescs->hwdesc[use_f1];
 
 		hwdesc->addr = addr;
 		hwdesc->cmd = JZ_LCD_CMD_EOF_IRQ | (width * height * cpp / 4);
@@ -591,9 +596,9 @@ static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
 			if (fourcc == DRM_FORMAT_C8)
 				offset = offsetof(struct ingenic_dma_hwdescs, hwdesc_pal);
 			else
-				offset = offsetof(struct ingenic_dma_hwdescs, hwdesc_f0);
+				offset = offsetof(struct ingenic_dma_hwdescs, hwdesc[0]);
 
-			priv->dma_hwdescs->hwdesc_f0.next = priv->dma_hwdescs_phys + offset;
+			priv->dma_hwdescs->hwdesc[0].next = priv->dma_hwdescs_phys + offset;
 
 			crtc_state->color_mgmt_changed = fourcc == DRM_FORMAT_C8;
 		}
@@ -964,20 +969,17 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 
 
 	/* Configure DMA hwdesc for foreground0 plane */
-	dma_hwdesc_phys_f0 = priv->dma_hwdescs_phys
-		+ offsetof(struct ingenic_dma_hwdescs, hwdesc_f0);
-	priv->dma_hwdescs->hwdesc_f0.next = dma_hwdesc_phys_f0;
-	priv->dma_hwdescs->hwdesc_f0.id = 0xf0;
+	dma_hwdesc_phys_f0 = dma_hwdesc_addr(priv, 0);
+	priv->dma_hwdescs->hwdesc[0].next = dma_hwdesc_phys_f0;
+	priv->dma_hwdescs->hwdesc[0].id = 0xf0;
 
 	/* Configure DMA hwdesc for foreground1 plane */
-	dma_hwdesc_phys_f1 = priv->dma_hwdescs_phys
-		+ offsetof(struct ingenic_dma_hwdescs, hwdesc_f1);
-	priv->dma_hwdescs->hwdesc_f1.next = dma_hwdesc_phys_f1;
-	priv->dma_hwdescs->hwdesc_f1.id = 0xf1;
+	dma_hwdesc_phys_f1 = dma_hwdesc_addr(priv, 1);
+	priv->dma_hwdescs->hwdesc[1].next = dma_hwdesc_phys_f1;
+	priv->dma_hwdescs->hwdesc[1].id = 0xf1;
 
 	/* Configure DMA hwdesc for palette */
-	priv->dma_hwdescs->hwdesc_pal.next = priv->dma_hwdescs_phys
-		+ offsetof(struct ingenic_dma_hwdescs, hwdesc_f0);
+	priv->dma_hwdescs->hwdesc_pal.next = dma_hwdesc_phys_f0;
 	priv->dma_hwdescs->hwdesc_pal.id = 0xc0;
 	priv->dma_hwdescs->hwdesc_pal.addr = priv->dma_hwdescs_phys
 		+ offsetof(struct ingenic_dma_hwdescs, palette);
-- 
2.30.2

