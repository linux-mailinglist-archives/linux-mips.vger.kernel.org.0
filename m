Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 114AE33048E
	for <lists+linux-mips@lfdr.de>; Sun,  7 Mar 2021 21:30:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232858AbhCGU3f (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 7 Mar 2021 15:29:35 -0500
Received: from aposti.net ([89.234.176.197]:49668 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232877AbhCGU31 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 7 Mar 2021 15:29:27 -0500
From:   Paul Cercueil <paul@crapouillou.net>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Sam Ravnborg <sam@ravnborg.org>, od@zcrc.me,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 4/5] drm: Add and export function drm_gem_cma_sync_data
Date:   Sun,  7 Mar 2021 20:28:34 +0000
Message-Id: <20210307202835.253907-5-paul@crapouillou.net>
In-Reply-To: <20210307202835.253907-1-paul@crapouillou.net>
References: <20210307202835.253907-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This function can be used by drivers that use damage clips and have
CMA GEM objects backed by non-coherent memory. Calling this function
in a plane's .atomic_update ensures that all the data in the backing
memory have been written to RAM.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/drm_gem_cma_helper.c | 43 ++++++++++++++++++++++++++++
 include/drm/drm_gem_cma_helper.h     |  5 ++++
 2 files changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
index e39b0464e19d..fdae54a18670 100644
--- a/drivers/gpu/drm/drm_gem_cma_helper.c
+++ b/drivers/gpu/drm/drm_gem_cma_helper.c
@@ -18,9 +18,14 @@
 #include <linux/slab.h>
 
 #include <drm/drm.h>
+#include <drm/drm_damage_helper.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_plane.h>
 #include <drm/drm_vma_manager.h>
 
 /**
@@ -684,3 +689,41 @@ drm_gem_cma_prime_import_sg_table_vmap(struct drm_device *dev,
 	return obj;
 }
 EXPORT_SYMBOL(drm_gem_cma_prime_import_sg_table_vmap);
+
+/**
+ * drm_gem_cma_sync_data - Sync GEM object to non-coherent backing memory
+ * @dev: DRM device
+ * @old_state: Old plane state
+ * @state: New plane state
+ *
+ * This function can be used by drivers that use damage clips and have
+ * CMA GEM objects backed by non-coherent memory. Calling this function
+ * in a plane's .atomic_update ensures that all the data in the backing
+ * memory have been written to RAM.
+ */
+void drm_gem_cma_sync_data(struct device *dev,
+			   struct drm_plane_state *old_state,
+			   struct drm_plane_state *state)
+{
+	const struct drm_format_info *finfo = state->fb->format;
+	struct drm_atomic_helper_damage_iter iter;
+	unsigned int offset, i;
+	struct drm_rect clip;
+	dma_addr_t daddr;
+
+	drm_atomic_helper_damage_iter_init(&iter, old_state, state);
+
+	drm_atomic_for_each_plane_damage(&iter, &clip) {
+		for (i = 0; i < finfo->num_planes; i++) {
+			daddr = drm_fb_cma_get_gem_addr(state->fb, state, i);
+
+			/* Ignore x1/x2 values, invalidate complete lines */
+			offset = clip.y1 * state->fb->pitches[i];
+
+			dma_sync_single_for_device(dev, daddr + offset,
+				       (clip.y2 - clip.y1) * state->fb->pitches[i],
+				       DMA_TO_DEVICE);
+		}
+	}
+}
+EXPORT_SYMBOL_GPL(drm_gem_cma_sync_data);
diff --git a/include/drm/drm_gem_cma_helper.h b/include/drm/drm_gem_cma_helper.h
index 6a3f7e1312cc..cdd3fb456916 100644
--- a/include/drm/drm_gem_cma_helper.h
+++ b/include/drm/drm_gem_cma_helper.h
@@ -7,6 +7,7 @@
 #include <drm/drm_gem.h>
 
 struct drm_mode_create_dumb;
+struct drm_plane_state;
 
 /**
  * struct drm_gem_cma_object - GEM object backed by CMA memory allocations
@@ -190,4 +191,8 @@ drm_gem_cma_prime_import_sg_table_vmap(struct drm_device *drm,
 				       struct dma_buf_attachment *attach,
 				       struct sg_table *sgt);
 
+void drm_gem_cma_sync_data(struct device *dev,
+			   struct drm_plane_state *old_state,
+			   struct drm_plane_state *state);
+
 #endif /* __DRM_GEM_CMA_HELPER_H__ */
-- 
2.30.1

