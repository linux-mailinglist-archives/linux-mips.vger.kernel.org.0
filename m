Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEA5B393935
	for <lists+linux-mips@lfdr.de>; Fri, 28 May 2021 01:22:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234677AbhE0XYR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 27 May 2021 19:24:17 -0400
Received: from aposti.net ([89.234.176.197]:36320 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236309AbhE0XYR (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 27 May 2021 19:24:17 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <mripard@kernel.org>
Cc:     list@opendingux.net, linux-mips@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 09/11] drm/ingenic: Add ingenic_drm_gem_fb_destroy() function
Date:   Fri, 28 May 2021 00:21:03 +0100
Message-Id: <20210527232104.152577-10-paul@crapouillou.net>
In-Reply-To: <20210527232104.152577-1-paul@crapouillou.net>
References: <20210527232104.152577-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add a ingenic_drm_gem_fb_destroy() function, which currently only calls
gem_fb_destroy(), but will be extended in a subsequent patch.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 26 +++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 1cac369f6293..2761478b16e8 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -846,16 +846,38 @@ static void ingenic_drm_disable_vblank(struct drm_crtc *crtc)
 	regmap_update_bits(priv->map, JZ_REG_LCD_CTRL, JZ_LCD_CTRL_EOF_IRQ, 0);
 }
 
+static void ingenic_drm_gem_fb_destroy(struct drm_framebuffer *fb)
+{
+	drm_gem_fb_destroy(fb);
+}
+
+static const struct drm_framebuffer_funcs ingenic_drm_gem_fb_funcs = {
+	.destroy	= ingenic_drm_gem_fb_destroy,
+	.create_handle	= drm_gem_fb_create_handle,
+};
+
+static const struct drm_framebuffer_funcs ingenic_drm_gem_fb_funcs_dirty = {
+	.destroy	= ingenic_drm_gem_fb_destroy,
+	.create_handle	= drm_gem_fb_create_handle,
+	.dirty		= drm_atomic_helper_dirtyfb,
+};
+
 static struct drm_framebuffer *
 ingenic_drm_gem_fb_create(struct drm_device *drm, struct drm_file *file,
 			  const struct drm_mode_fb_cmd2 *mode_cmd)
 {
 	struct ingenic_drm *priv = drm_device_get_priv(drm);
+	const struct drm_framebuffer_funcs *fb_funcs;
+	struct drm_framebuffer *fb;
 
 	if (priv->soc_info->map_noncoherent)
-		return drm_gem_fb_create_with_dirty(drm, file, mode_cmd);
+		fb_funcs = &ingenic_drm_gem_fb_funcs_dirty;
+	else
+		fb_funcs = &ingenic_drm_gem_fb_funcs;
+
+	fb = drm_gem_fb_create_with_funcs(drm, file, mode_cmd, fb_funcs);
 
-	return drm_gem_fb_create(drm, file, mode_cmd);
+	return fb;
 }
 
 static struct drm_gem_object *
-- 
2.30.2

