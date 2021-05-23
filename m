Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2425B38DC0A
	for <lists+linux-mips@lfdr.de>; Sun, 23 May 2021 19:04:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231904AbhEWRGN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 23 May 2021 13:06:13 -0400
Received: from aposti.net ([89.234.176.197]:50404 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231829AbhEWRGN (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 23 May 2021 13:06:13 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Christoph Hellwig <hch@infradead.org>, list@opendingux.net,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v5 2/3] drm: Add and export function drm_fb_cma_sync_non_coherent
Date:   Sun, 23 May 2021 18:04:14 +0100
Message-Id: <20210523170415.90410-3-paul@crapouillou.net>
In-Reply-To: <20210523170415.90410-1-paul@crapouillou.net>
References: <20210523170415.90410-1-paul@crapouillou.net>
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

v5: - Rename to drm_fb_cma_sync_non_coherent
    - Invert loops for better cache locality
    - Only sync BOs that have the non-coherent flag
    - Move to drm_fb_cma_helper.c to avoid circular dependency

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/drm_fb_cma_helper.c | 46 +++++++++++++++++++++++++++++
 include/drm/drm_fb_cma_helper.h     |  4 +++
 2 files changed, 50 insertions(+)

diff --git a/drivers/gpu/drm/drm_fb_cma_helper.c b/drivers/gpu/drm/drm_fb_cma_helper.c
index cb2349ad338d..69c57273b184 100644
--- a/drivers/gpu/drm/drm_fb_cma_helper.c
+++ b/drivers/gpu/drm/drm_fb_cma_helper.c
@@ -9,12 +9,14 @@
  *  Copyright (C) 2012 Red Hat
  */
 
+#include <drm/drm_damage_helper.h>
 #include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_plane.h>
+#include <linux/dma-mapping.h>
 #include <linux/module.h>
 
 /**
@@ -97,3 +99,47 @@ dma_addr_t drm_fb_cma_get_gem_addr(struct drm_framebuffer *fb,
 	return paddr;
 }
 EXPORT_SYMBOL_GPL(drm_fb_cma_get_gem_addr);
+
+/**
+ * drm_fb_cma_sync_non_coherent - Sync GEM object to non-coherent backing
+ *	memory
+ * @drm: DRM device
+ * @old_state: Old plane state
+ * @state: New plane state
+ *
+ * This function can be used by drivers that use damage clips and have
+ * CMA GEM objects backed by non-coherent memory. Calling this function
+ * in a plane's .atomic_update ensures that all the data in the backing
+ * memory have been written to RAM.
+ */
+void drm_fb_cma_sync_non_coherent(struct drm_device *drm,
+				  struct drm_plane_state *old_state,
+				  struct drm_plane_state *state)
+{
+	const struct drm_format_info *finfo = state->fb->format;
+	struct drm_atomic_helper_damage_iter iter;
+	const struct drm_gem_cma_object *cma_obj;
+	unsigned int offset, i;
+	struct drm_rect clip;
+	dma_addr_t daddr;
+	size_t nb_bytes;
+
+	for (i = 0; i < finfo->num_planes; i++) {
+		cma_obj = drm_fb_cma_get_gem_obj(state->fb, i);
+		if (!cma_obj->map_noncoherent)
+			continue;
+
+		daddr = drm_fb_cma_get_gem_addr(state->fb, state, i);
+		drm_atomic_helper_damage_iter_init(&iter, old_state, state);
+
+		drm_atomic_for_each_plane_damage(&iter, &clip) {
+			/* Ignore x1/x2 values, invalidate complete lines */
+			offset = clip.y1 * state->fb->pitches[i];
+
+			nb_bytes = (clip.y2 - clip.y1) * state->fb->pitches[i];
+			dma_sync_single_for_device(drm->dev, daddr + offset,
+						   nb_bytes, DMA_TO_DEVICE);
+		}
+	}
+}
+EXPORT_SYMBOL_GPL(drm_fb_cma_sync_non_coherent);
diff --git a/include/drm/drm_fb_cma_helper.h b/include/drm/drm_fb_cma_helper.h
index 795aea1d0a25..3a177632b17e 100644
--- a/include/drm/drm_fb_cma_helper.h
+++ b/include/drm/drm_fb_cma_helper.h
@@ -14,5 +14,9 @@ dma_addr_t drm_fb_cma_get_gem_addr(struct drm_framebuffer *fb,
 				   struct drm_plane_state *state,
 				   unsigned int plane);
 
+void drm_fb_cma_sync_non_coherent(struct drm_device *drm,
+				  struct drm_plane_state *old_state,
+				  struct drm_plane_state *state);
+
 #endif
 
-- 
2.30.2

