Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E80C34D650
	for <lists+linux-mips@lfdr.de>; Mon, 29 Mar 2021 19:52:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230406AbhC2Rvf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Mar 2021 13:51:35 -0400
Received: from aposti.net ([89.234.176.197]:38858 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231314AbhC2RvN (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 29 Mar 2021 13:51:13 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Simon Ser <contact@emersion.fr>
Cc:     Sam Ravnborg <sam@ravnborg.org>, od@zcrc.me,
        linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
        stable@vger.kernel.org
Subject: [PATCH 1/2] drm/ingenic: Switch IPU plane to type OVERLAY
Date:   Mon, 29 Mar 2021 18:50:45 +0100
Message-Id: <20210329175046.214629-2-paul@crapouillou.net>
In-Reply-To: <20210329175046.214629-1-paul@crapouillou.net>
References: <20210329175046.214629-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

It should have been an OVERLAY from the beginning. The documentation
stipulates that there should be an unique PRIMARY plane per CRTC.

Fixes: fc1acf317b01 ("drm/ingenic: Add support for the IPU")
Cc: <stable@vger.kernel.org> # 5.8+
Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 11 +++++------
 drivers/gpu/drm/ingenic/ingenic-ipu.c     |  2 +-
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 29742ec5ab95..09225b770bb8 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -419,7 +419,7 @@ static void ingenic_drm_plane_enable(struct ingenic_drm *priv,
 	unsigned int en_bit;
 
 	if (priv->soc_info->has_osd) {
-		if (plane->type == DRM_PLANE_TYPE_PRIMARY)
+		if (plane != &priv->f0)
 			en_bit = JZ_LCD_OSDC_F1EN;
 		else
 			en_bit = JZ_LCD_OSDC_F0EN;
@@ -434,7 +434,7 @@ void ingenic_drm_plane_disable(struct device *dev, struct drm_plane *plane)
 	unsigned int en_bit;
 
 	if (priv->soc_info->has_osd) {
-		if (plane->type == DRM_PLANE_TYPE_PRIMARY)
+		if (plane != &priv->f0)
 			en_bit = JZ_LCD_OSDC_F1EN;
 		else
 			en_bit = JZ_LCD_OSDC_F0EN;
@@ -461,8 +461,7 @@ void ingenic_drm_plane_config(struct device *dev,
 
 	ingenic_drm_plane_enable(priv, plane);
 
-	if (priv->soc_info->has_osd &&
-	    plane->type == DRM_PLANE_TYPE_PRIMARY) {
+	if (priv->soc_info->has_osd && plane != &priv->f0) {
 		switch (fourcc) {
 		case DRM_FORMAT_XRGB1555:
 			ctrl |= JZ_LCD_OSDCTRL_RGB555;
@@ -510,7 +509,7 @@ void ingenic_drm_plane_config(struct device *dev,
 	}
 
 	if (priv->soc_info->has_osd) {
-		if (plane->type == DRM_PLANE_TYPE_PRIMARY) {
+		if (plane != &priv->f0) {
 			xy_reg = JZ_REG_LCD_XYP1;
 			size_reg = JZ_REG_LCD_SIZE1;
 		} else {
@@ -561,7 +560,7 @@ static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
 		height = newstate->src_h >> 16;
 		cpp = newstate->fb->format->cpp[0];
 
-		if (!priv->soc_info->has_osd || plane->type == DRM_PLANE_TYPE_OVERLAY)
+		if (!priv->soc_info->has_osd || plane == &priv->f0)
 			hwdesc = &priv->dma_hwdescs->hwdesc_f0;
 		else
 			hwdesc = &priv->dma_hwdescs->hwdesc_f1;
diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c b/drivers/gpu/drm/ingenic/ingenic-ipu.c
index 5ae6adab8306..3b1091e7c0cd 100644
--- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
+++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
@@ -767,7 +767,7 @@ static int ingenic_ipu_bind(struct device *dev, struct device *master, void *d)
 
 	err = drm_universal_plane_init(drm, plane, 1, &ingenic_ipu_plane_funcs,
 				       soc_info->formats, soc_info->num_formats,
-				       NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
+				       NULL, DRM_PLANE_TYPE_OVERLAY, NULL);
 	if (err) {
 		dev_err(dev, "Failed to init plane: %i\n", err);
 		return err;
-- 
2.30.2

