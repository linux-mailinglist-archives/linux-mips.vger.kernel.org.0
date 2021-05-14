Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28AB5381188
	for <lists+linux-mips@lfdr.de>; Fri, 14 May 2021 22:12:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233298AbhENUNR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 14 May 2021 16:13:17 -0400
Received: from aposti.net ([89.234.176.197]:49250 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233286AbhENUNR (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 14 May 2021 16:13:17 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Christoph Hellwig <hch@infradead.org>, od@opendingux.net,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v3 2/3] drm: Add and export function drm_gem_cma_sync_data
Date:   Fri, 14 May 2021 21:11:37 +0100
Message-Id: <20210514201138.162230-3-paul@crapouillou.net>
In-Reply-To: <20210514201138.162230-1-paul@crapouillou.net>
References: <20210514201138.162230-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This function can be used by drivers that use damage clips and have
CMA GEM objects backed by non-coherent memory. Calling this function
in a plane's .atomic_update ensures that all the data in the backing
memory have been written to RAM.

v3: - Only sync data if using GEM objects backed by non-coherent memory.
    - Use a drm_device pointer instead of device pointer in prototype

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/drm_gem_cma_helper.c | 55 ++++++++++++++++++++++++++++
 include/drm/drm_gem_cma_helper.h     |  5 +++
 2 files changed, 60 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
index 81a31bcf7d68..9dbe766c3177 100644
--- a/drivers/gpu/drm/drm_gem_cma_helper.c
+++ b/drivers/gpu/drm/drm_gem_cma_helper.c
@@ -17,9 +17,14 @@
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
@@ -589,3 +594,53 @@ int drm_gem_cma_prime_mmap(struct drm_gem_object *obj,
 	return drm_gem_prime_mmap(obj, vma);
 }
 EXPORT_SYMBOL(drm_gem_cma_prime_mmap);
+
+/**
+ * drm_gem_cma_sync_data - Sync GEM object to non-coherent backing memory
+ * @drm: DRM device
+ * @old_state: Old plane state
+ * @state: New plane state
+ *
+ * This function can be used by drivers that use damage clips and have
+ * CMA GEM objects backed by non-coherent memory. Calling this function
+ * in a plane's .atomic_update ensures that all the data in the backing
+ * memory have been written to RAM.
+ */
+void drm_gem_cma_sync_data(struct drm_device *drm,
+			   struct drm_plane_state *old_state,
+			   struct drm_plane_state *state)
+{
+	const struct drm_format_info *finfo = state->fb->format;
+	struct drm_atomic_helper_damage_iter iter;
+	const struct drm_gem_cma_object *cma_obj;
+	unsigned int offset, i;
+	struct drm_rect clip;
+	dma_addr_t daddr;
+
+	for (i = 0; i < finfo->num_planes; i++) {
+		cma_obj = drm_fb_cma_get_gem_obj(state->fb, i);
+
+		if (cma_obj->map_noncoherent)
+			break;
+	}
+
+	/* No non-coherent buffers - no need to sync anything. */
+	if (i == finfo->num_planes)
+		return;
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
+			dma_sync_single_for_device(drm->dev, daddr + offset,
+				       (clip.y2 - clip.y1) * state->fb->pitches[i],
+				       DMA_TO_DEVICE);
+		}
+	}
+}
+EXPORT_SYMBOL_GPL(drm_gem_cma_sync_data);
diff --git a/include/drm/drm_gem_cma_helper.h b/include/drm/drm_gem_cma_helper.h
index b597e00fd5f6..4ccc8c69e594 100644
--- a/include/drm/drm_gem_cma_helper.h
+++ b/include/drm/drm_gem_cma_helper.h
@@ -7,6 +7,7 @@
 #include <drm/drm_gem.h>
 
 struct drm_mode_create_dumb;
+struct drm_plane_state;
 
 /**
  * struct drm_gem_cma_object - GEM object backed by CMA memory allocations
@@ -187,4 +188,8 @@ drm_gem_cma_prime_import_sg_table_vmap(struct drm_device *drm,
 int drm_gem_cma_prime_mmap(struct drm_gem_object *obj,
 			   struct vm_area_struct *vma);
 
+void drm_gem_cma_sync_data(struct drm_device *drm,
+			   struct drm_plane_state *old_state,
+			   struct drm_plane_state *state);
+
 #endif /* __DRM_GEM_CMA_HELPER_H__ */
-- 
2.30.2

