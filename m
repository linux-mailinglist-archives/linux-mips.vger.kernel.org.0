Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD3A633048D
	for <lists+linux-mips@lfdr.de>; Sun,  7 Mar 2021 21:30:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232880AbhCGU3e (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 7 Mar 2021 15:29:34 -0500
Received: from aposti.net ([89.234.176.197]:49602 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232858AbhCGU3H (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 7 Mar 2021 15:29:07 -0500
From:   Paul Cercueil <paul@crapouillou.net>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Sam Ravnborg <sam@ravnborg.org>, od@zcrc.me,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 1/5] drm: Add and export function drm_gem_cma_create_noncoherent
Date:   Sun,  7 Mar 2021 20:28:31 +0000
Message-Id: <20210307202835.253907-2-paul@crapouillou.net>
In-Reply-To: <20210307202835.253907-1-paul@crapouillou.net>
References: <20210307202835.253907-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This function can be used by drivers that need to create a GEM object
with non-coherent backing memory.

Creating non-coherent CMA objects is useful on architectures where
writing to a buffer with the non-coherent cache attribute set then
invalidating the cache is faster than writing to the same buffer with
the write-combine cache attribute set. This is the case for instance on
some Ingenic SoCs.

v2: Add inline doc about why we need this, and improve commit message

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/drm_gem_cma_helper.c | 76 +++++++++++++++++++++-------
 include/drm/drm_gem_cma_helper.h     |  2 +
 2 files changed, 61 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
index 7942cf05cd93..917b092b23c2 100644
--- a/drivers/gpu/drm/drm_gem_cma_helper.c
+++ b/drivers/gpu/drm/drm_gem_cma_helper.c
@@ -90,21 +90,10 @@ __drm_gem_cma_create(struct drm_device *drm, size_t size)
 	return ERR_PTR(ret);
 }
 
-/**
- * drm_gem_cma_create - allocate an object with the given size
- * @drm: DRM device
- * @size: size of the object to allocate
- *
- * This function creates a CMA GEM object and allocates a contiguous chunk of
- * memory as backing store. The backing memory has the writecombine attribute
- * set.
- *
- * Returns:
- * A struct drm_gem_cma_object * on success or an ERR_PTR()-encoded negative
- * error code on failure.
- */
-struct drm_gem_cma_object *drm_gem_cma_create(struct drm_device *drm,
-					      size_t size)
+static struct drm_gem_cma_object *
+drm_gem_cma_create_with_cache_param(struct drm_device *drm,
+				    size_t size,
+				    bool noncoherent)
 {
 	struct drm_gem_cma_object *cma_obj;
 	int ret;
@@ -115,8 +104,16 @@ struct drm_gem_cma_object *drm_gem_cma_create(struct drm_device *drm,
 	if (IS_ERR(cma_obj))
 		return cma_obj;
 
-	cma_obj->vaddr = dma_alloc_wc(drm->dev, size, &cma_obj->paddr,
-				      GFP_KERNEL | __GFP_NOWARN);
+	if (noncoherent) {
+		cma_obj->vaddr = dma_alloc_noncoherent(drm->dev, size,
+						       &cma_obj->paddr,
+						       DMA_TO_DEVICE,
+						       GFP_KERNEL | __GFP_NOWARN);
+
+	} else {
+		cma_obj->vaddr = dma_alloc_wc(drm->dev, size, &cma_obj->paddr,
+					      GFP_KERNEL | __GFP_NOWARN);
+	}
 	if (!cma_obj->vaddr) {
 		drm_dbg(drm, "failed to allocate buffer with size %zu\n",
 			 size);
@@ -130,6 +127,51 @@ struct drm_gem_cma_object *drm_gem_cma_create(struct drm_device *drm,
 	drm_gem_object_put(&cma_obj->base);
 	return ERR_PTR(ret);
 }
+
+/**
+ * drm_gem_cma_create_noncoherent - allocate an object with the given size
+ *     and non-coherent cache attribute
+ * @drm: DRM device
+ * @size: size of the object to allocate
+ *
+ * This function creates a CMA GEM object and allocates a contiguous chunk of
+ * memory as backing store. The backing memory has the noncoherent attribute
+ * set.
+ *
+ * Creating non-coherent CMA objects is useful on architectures where writing
+ * to a buffer with the non-coherent cache attribute set then invalidating the
+ * cache is faster than writing to the same buffer with the write-combine cache
+ * attribute set. This is the case for instance on some Ingenic SoCs.
+ *
+ * Returns:
+ * A struct drm_gem_cma_object * on success or an ERR_PTR()-encoded negative
+ * error code on failure.
+ */
+struct drm_gem_cma_object *
+drm_gem_cma_create_noncoherent(struct drm_device *drm, size_t size)
+{
+	return drm_gem_cma_create_with_cache_param(drm, size, true);
+}
+EXPORT_SYMBOL_GPL(drm_gem_cma_create_noncoherent);
+
+/**
+ * drm_gem_cma_create - allocate an object with the given size
+ * @drm: DRM device
+ * @size: size of the object to allocate
+ *
+ * This function creates a CMA GEM object and allocates a contiguous chunk of
+ * memory as backing store. The backing memory has the writecombine attribute
+ * set.
+ *
+ * Returns:
+ * A struct drm_gem_cma_object * on success or an ERR_PTR()-encoded negative
+ * error code on failure.
+ */
+struct drm_gem_cma_object *drm_gem_cma_create(struct drm_device *drm,
+					      size_t size)
+{
+	return drm_gem_cma_create_with_cache_param(drm, size, false);
+}
 EXPORT_SYMBOL_GPL(drm_gem_cma_create);
 
 /**
diff --git a/include/drm/drm_gem_cma_helper.h b/include/drm/drm_gem_cma_helper.h
index 0a9711caa3e8..360771f5f485 100644
--- a/include/drm/drm_gem_cma_helper.h
+++ b/include/drm/drm_gem_cma_helper.h
@@ -79,6 +79,8 @@ int drm_gem_cma_dumb_create(struct drm_file *file_priv,
 /* allocate physical memory */
 struct drm_gem_cma_object *drm_gem_cma_create(struct drm_device *drm,
 					      size_t size);
+struct drm_gem_cma_object *
+drm_gem_cma_create_noncoherent(struct drm_device *drm, size_t size);
 
 extern const struct vm_operations_struct drm_gem_cma_vm_ops;
 
-- 
2.30.1

