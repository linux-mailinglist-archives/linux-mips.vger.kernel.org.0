Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83A0038DC0C
	for <lists+linux-mips@lfdr.de>; Sun, 23 May 2021 19:04:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231828AbhEWRGT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 23 May 2021 13:06:19 -0400
Received: from aposti.net ([89.234.176.197]:50420 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231829AbhEWRGT (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 23 May 2021 13:06:19 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Christoph Hellwig <hch@infradead.org>, list@opendingux.net,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v5 3/3] drm/ingenic: Add option to alloc cached GEM buffers
Date:   Sun, 23 May 2021 18:04:15 +0100
Message-Id: <20210523170415.90410-4-paul@crapouillou.net>
In-Reply-To: <20210523170415.90410-1-paul@crapouillou.net>
References: <20210523170415.90410-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Alloc GEM buffers backed by noncoherent memory on SoCs where it is
actually faster than write-combine.

This dramatically speeds up software rendering on these SoCs, even for
tasks where write-combine memory should in theory be faster (e.g. simple
blits).

v3: The option is now selected per-SoC instead of being a module
    parameter.

v5: - Fix drm_atomic_get_new_plane_state() used to retrieve the old
      state
    - Use custom drm_gem_fb_create()
    - Only check damage clips and sync DMA buffers if non-coherent
      buffers are used

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 59 +++++++++++++++++++++--
 drivers/gpu/drm/ingenic/ingenic-drm.h     |  1 +
 drivers/gpu/drm/ingenic/ingenic-ipu.c     | 21 ++++++--
 3 files changed, 74 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 389cad59e090..5244f4763477 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -9,6 +9,7 @@
 #include <linux/component.h>
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
+#include <linux/io.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of_device.h>
@@ -23,6 +24,7 @@
 #include <drm/drm_color_mgmt.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
+#include <drm/drm_damage_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_gem_cma_helper.h>
@@ -57,6 +59,7 @@ struct ingenic_dma_hwdescs {
 struct jz_soc_info {
 	bool needs_dev_clk;
 	bool has_osd;
+	bool map_noncoherent;
 	unsigned int max_width, max_height;
 	const u32 *formats_f0, *formats_f1;
 	unsigned int num_formats_f0, num_formats_f1;
@@ -410,6 +413,9 @@ static int ingenic_drm_plane_atomic_check(struct drm_plane *plane,
 	     old_plane_state->fb->format->format != new_plane_state->fb->format->format))
 		crtc_state->mode_changed = true;
 
+	if (priv->soc_info->map_noncoherent)
+		drm_atomic_helper_check_plane_damage(state, new_plane_state);
+
 	return 0;
 }
 
@@ -526,6 +532,13 @@ void ingenic_drm_plane_config(struct device *dev,
 	}
 }
 
+bool ingenic_drm_map_noncoherent(const struct device *dev)
+{
+	const struct ingenic_drm *priv = dev_get_drvdata(dev);
+
+	return priv->soc_info->map_noncoherent;
+}
+
 static void ingenic_drm_update_palette(struct ingenic_drm *priv,
 				       const struct drm_color_lut *lut)
 {
@@ -544,8 +557,8 @@ static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
 					    struct drm_atomic_state *state)
 {
 	struct ingenic_drm *priv = drm_device_get_priv(plane->dev);
-	struct drm_plane_state *newstate = drm_atomic_get_new_plane_state(state,
-									  plane);
+	struct drm_plane_state *newstate = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_plane_state *oldstate = drm_atomic_get_old_plane_state(state, plane);
 	struct drm_crtc_state *crtc_state;
 	struct ingenic_dma_hwdesc *hwdesc;
 	unsigned int width, height, cpp, offset;
@@ -553,6 +566,9 @@ static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
 	u32 fourcc;
 
 	if (newstate && newstate->fb) {
+		if (priv->soc_info->map_noncoherent)
+			drm_fb_cma_sync_non_coherent(&priv->drm, oldstate, newstate);
+
 		crtc_state = newstate->crtc->state;
 
 		addr = drm_fb_cma_get_gem_addr(newstate->fb, newstate, 0);
@@ -742,6 +758,33 @@ static void ingenic_drm_disable_vblank(struct drm_crtc *crtc)
 	regmap_update_bits(priv->map, JZ_REG_LCD_CTRL, JZ_LCD_CTRL_EOF_IRQ, 0);
 }
 
+static struct drm_framebuffer *
+ingenic_drm_gem_fb_create(struct drm_device *drm, struct drm_file *file,
+			  const struct drm_mode_fb_cmd2 *mode_cmd)
+{
+	struct ingenic_drm *priv = drm_device_get_priv(drm);
+
+	if (priv->soc_info->map_noncoherent)
+		return drm_gem_fb_create_with_dirty(drm, file, mode_cmd);
+
+	return drm_gem_fb_create(drm, file, mode_cmd);
+}
+
+static struct drm_gem_object *
+ingenic_drm_gem_create_object(struct drm_device *drm, size_t size)
+{
+	struct ingenic_drm *priv = drm_device_get_priv(drm);
+	struct drm_gem_cma_object *obj;
+
+	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
+	if (!obj)
+		return ERR_PTR(-ENOMEM);
+
+	obj->map_noncoherent = priv->soc_info->map_noncoherent;
+
+	return &obj->base;
+}
+
 DEFINE_DRM_GEM_CMA_FOPS(ingenic_drm_fops);
 
 static const struct drm_driver ingenic_drm_driver_data = {
@@ -754,6 +797,7 @@ static const struct drm_driver ingenic_drm_driver_data = {
 	.patchlevel		= 0,
 
 	.fops			= &ingenic_drm_fops,
+	.gem_create_object	= ingenic_drm_gem_create_object,
 	DRM_GEM_CMA_DRIVER_OPS,
 
 	.irq_handler		= ingenic_drm_irq_handler,
@@ -804,7 +848,7 @@ static const struct drm_encoder_helper_funcs ingenic_drm_encoder_helper_funcs =
 };
 
 static const struct drm_mode_config_funcs ingenic_drm_mode_config_funcs = {
-	.fb_create		= drm_gem_fb_create,
+	.fb_create		= ingenic_drm_gem_fb_create,
 	.output_poll_changed	= drm_fb_helper_output_poll_changed,
 	.atomic_check		= drm_atomic_helper_check,
 	.atomic_commit		= drm_atomic_helper_commit,
@@ -961,6 +1005,9 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 		return ret;
 	}
 
+	if (soc_info->map_noncoherent)
+		drm_plane_enable_fb_damage_clips(&priv->f1);
+
 	drm_crtc_helper_add(&priv->crtc, &ingenic_drm_crtc_helper_funcs);
 
 	ret = drm_crtc_init_with_planes(drm, &priv->crtc, primary,
@@ -989,6 +1036,9 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 			return ret;
 		}
 
+		if (soc_info->map_noncoherent)
+			drm_plane_enable_fb_damage_clips(&priv->f0);
+
 		if (IS_ENABLED(CONFIG_DRM_INGENIC_IPU) && has_components) {
 			ret = component_bind_all(dev, drm);
 			if (ret) {
@@ -1245,6 +1295,7 @@ static const u32 jz4770_formats_f0[] = {
 static const struct jz_soc_info jz4740_soc_info = {
 	.needs_dev_clk = true,
 	.has_osd = false,
+	.map_noncoherent = false,
 	.max_width = 800,
 	.max_height = 600,
 	.formats_f1 = jz4740_formats,
@@ -1255,6 +1306,7 @@ static const struct jz_soc_info jz4740_soc_info = {
 static const struct jz_soc_info jz4725b_soc_info = {
 	.needs_dev_clk = false,
 	.has_osd = true,
+	.map_noncoherent = false,
 	.max_width = 800,
 	.max_height = 600,
 	.formats_f1 = jz4725b_formats_f1,
@@ -1266,6 +1318,7 @@ static const struct jz_soc_info jz4725b_soc_info = {
 static const struct jz_soc_info jz4770_soc_info = {
 	.needs_dev_clk = false,
 	.has_osd = true,
+	.map_noncoherent = true,
 	.max_width = 1280,
 	.max_height = 720,
 	.formats_f1 = jz4770_formats_f1,
diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.h b/drivers/gpu/drm/ingenic/ingenic-drm.h
index 1b4347f7f084..22654ac1dde1 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm.h
+++ b/drivers/gpu/drm/ingenic/ingenic-drm.h
@@ -184,6 +184,7 @@ struct platform_driver;
 void ingenic_drm_plane_config(struct device *dev,
 			      struct drm_plane *plane, u32 fourcc);
 void ingenic_drm_plane_disable(struct device *dev, struct drm_plane *plane);
+bool ingenic_drm_map_noncoherent(const struct device *dev);
 
 extern struct platform_driver *ingenic_ipu_driver_ptr;
 
diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c b/drivers/gpu/drm/ingenic/ingenic-ipu.c
index 3b1091e7c0cd..61b6d9fdbba1 100644
--- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
+++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
@@ -20,10 +20,13 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_damage_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_plane.h>
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_property.h>
@@ -285,8 +288,8 @@ static void ingenic_ipu_plane_atomic_update(struct drm_plane *plane,
 					    struct drm_atomic_state *state)
 {
 	struct ingenic_ipu *ipu = plane_to_ingenic_ipu(plane);
-	struct drm_plane_state *newstate = drm_atomic_get_new_plane_state(state,
-									  plane);
+	struct drm_plane_state *newstate = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_plane_state *oldstate = drm_atomic_get_old_plane_state(state, plane);
 	const struct drm_format_info *finfo;
 	u32 ctrl, stride = 0, coef_index = 0, format = 0;
 	bool needs_modeset, upscaling_w, upscaling_h;
@@ -317,6 +320,9 @@ static void ingenic_ipu_plane_atomic_update(struct drm_plane *plane,
 				JZ_IPU_CTRL_CHIP_EN | JZ_IPU_CTRL_LCDC_SEL);
 	}
 
+	if (ingenic_drm_map_noncoherent(ipu->master))
+		drm_fb_cma_sync_non_coherent(ipu->drm, oldstate, newstate);
+
 	/* New addresses will be committed in vblank handler... */
 	ipu->addr_y = drm_fb_cma_get_gem_addr(newstate->fb, newstate, 0);
 	if (finfo->num_planes > 1)
@@ -541,7 +547,7 @@ static int ingenic_ipu_plane_atomic_check(struct drm_plane *plane,
 
 	if (!new_plane_state->crtc ||
 	    !crtc_state->mode.hdisplay || !crtc_state->mode.vdisplay)
-		return 0;
+		goto out_check_damage;
 
 	/* Plane must be fully visible */
 	if (new_plane_state->crtc_x < 0 || new_plane_state->crtc_y < 0 ||
@@ -558,7 +564,7 @@ static int ingenic_ipu_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 
 	if (!osd_changed(new_plane_state, old_plane_state))
-		return 0;
+		goto out_check_damage;
 
 	crtc_state->mode_changed = true;
 
@@ -592,6 +598,10 @@ static int ingenic_ipu_plane_atomic_check(struct drm_plane *plane,
 	ipu->denom_w = denom_w;
 	ipu->denom_h = denom_h;
 
+out_check_damage:
+	if (ingenic_drm_map_noncoherent(ipu->master))
+		drm_atomic_helper_check_plane_damage(state, new_plane_state);
+
 	return 0;
 }
 
@@ -773,6 +783,9 @@ static int ingenic_ipu_bind(struct device *dev, struct device *master, void *d)
 		return err;
 	}
 
+	if (ingenic_drm_map_noncoherent(master))
+		drm_plane_enable_fb_damage_clips(plane);
+
 	/*
 	 * Sharpness settings range is [0,32]
 	 * 0       : nearest-neighbor
-- 
2.30.2

