Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EFFE33048F
	for <lists+linux-mips@lfdr.de>; Sun,  7 Mar 2021 21:30:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232891AbhCGU3f (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 7 Mar 2021 15:29:35 -0500
Received: from aposti.net ([89.234.176.197]:49646 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232876AbhCGU3U (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 7 Mar 2021 15:29:20 -0500
From:   Paul Cercueil <paul@crapouillou.net>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Sam Ravnborg <sam@ravnborg.org>, od@zcrc.me,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 3/5] drm: Add and export function drm_gem_cma_mmap_noncoherent
Date:   Sun,  7 Mar 2021 20:28:33 +0000
Message-Id: <20210307202835.253907-4-paul@crapouillou.net>
In-Reply-To: <20210307202835.253907-1-paul@crapouillou.net>
References: <20210307202835.253907-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This function can be used by drivers that need to mmap dumb buffers
created with non-coherent backing memory.

v2: Use dma_to_phys() since cma_obj->paddr isn't a phys_addr_t but a
dma_addr_t.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/drm_gem_cma_helper.c | 67 +++++++++++++++++++++++++---
 include/drm/drm_gem_cma_helper.h     |  1 +
 2 files changed, 63 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
index d100c5f9c140..e39b0464e19d 100644
--- a/drivers/gpu/drm/drm_gem_cma_helper.c
+++ b/drivers/gpu/drm/drm_gem_cma_helper.c
@@ -10,6 +10,7 @@
  */
 
 #include <linux/dma-buf.h>
+#include <linux/dma-direct.h>
 #include <linux/dma-mapping.h>
 #include <linux/export.h>
 #include <linux/mm.h>
@@ -42,10 +43,20 @@ static const struct drm_gem_object_funcs drm_gem_cma_default_funcs = {
 	.vm_ops = &drm_gem_cma_vm_ops,
 };
 
+static const struct drm_gem_object_funcs drm_gem_cma_noncoherent_funcs = {
+	.free = drm_gem_cma_free_object,
+	.print_info = drm_gem_cma_print_info,
+	.get_sg_table = drm_gem_cma_get_sg_table,
+	.vmap = drm_gem_cma_vmap,
+	.mmap = drm_gem_cma_mmap_noncoherent,
+	.vm_ops = &drm_gem_cma_vm_ops,
+};
+
 /**
  * __drm_gem_cma_create - Create a GEM CMA object without allocating memory
  * @drm: DRM device
  * @size: size of the object to allocate
+ * @noncoherent: if true, will use non-coherent backed memory
  *
  * This function creates and initializes a GEM CMA object of the given size,
  * but doesn't allocate any memory to back the object.
@@ -55,7 +66,7 @@ static const struct drm_gem_object_funcs drm_gem_cma_default_funcs = {
  * error code on failure.
  */
 static struct drm_gem_cma_object *
-__drm_gem_cma_create(struct drm_device *drm, size_t size)
+__drm_gem_cma_create(struct drm_device *drm, size_t size, bool noncoherent)
 {
 	struct drm_gem_cma_object *cma_obj;
 	struct drm_gem_object *gem_obj;
@@ -68,8 +79,12 @@ __drm_gem_cma_create(struct drm_device *drm, size_t size)
 	if (!gem_obj)
 		return ERR_PTR(-ENOMEM);
 
-	if (!gem_obj->funcs)
-		gem_obj->funcs = &drm_gem_cma_default_funcs;
+	if (!gem_obj->funcs) {
+		if (noncoherent)
+			gem_obj->funcs = &drm_gem_cma_noncoherent_funcs;
+		else
+			gem_obj->funcs = &drm_gem_cma_default_funcs;
+	}
 
 	cma_obj = container_of(gem_obj, struct drm_gem_cma_object, base);
 
@@ -100,7 +115,7 @@ drm_gem_cma_create_with_cache_param(struct drm_device *drm,
 
 	size = round_up(size, PAGE_SIZE);
 
-	cma_obj = __drm_gem_cma_create(drm, size);
+	cma_obj = __drm_gem_cma_create(drm, size, noncoherent);
 	if (IS_ERR(cma_obj))
 		return cma_obj;
 
@@ -503,7 +518,7 @@ drm_gem_cma_prime_import_sg_table(struct drm_device *dev,
 		return ERR_PTR(-EINVAL);
 
 	/* Create a CMA GEM buffer. */
-	cma_obj = __drm_gem_cma_create(dev, attach->dmabuf->size);
+	cma_obj = __drm_gem_cma_create(dev, attach->dmabuf->size, false);
 	if (IS_ERR(cma_obj))
 		return ERR_CAST(cma_obj);
 
@@ -579,6 +594,48 @@ int drm_gem_cma_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
 }
 EXPORT_SYMBOL_GPL(drm_gem_cma_mmap);
 
+/**
+ * drm_gem_cma_mmap_noncoherent - memory-map a CMA GEM object with
+ *     non-coherent cache attribute
+ * @filp: file object
+ * @vma: VMA for the area to be mapped
+ *
+ * Just like drm_gem_cma_mmap, but for a GEM object backed by non-coherent
+ * memory.
+ *
+ * Returns:
+ * 0 on success or a negative error code on failure.
+ */
+int drm_gem_cma_mmap_noncoherent(struct drm_gem_object *obj,
+				 struct vm_area_struct *vma)
+{
+	struct drm_gem_cma_object *cma_obj;
+	unsigned long pfn;
+	int ret;
+
+	/*
+	 * Clear the VM_PFNMAP flag that was set by drm_gem_mmap(), and set the
+	 * vm_pgoff (used as a fake buffer offset by DRM) to 0 as we want to map
+	 * the whole buffer.
+	 */
+	vma->vm_pgoff -= drm_vma_node_start(&obj->vma_node);
+	vma->vm_flags &= ~VM_PFNMAP;
+	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
+
+	cma_obj = to_drm_gem_cma_obj(obj);
+
+	pfn = PHYS_PFN(dma_to_phys(cma_obj->base.dev->dev, cma_obj->paddr));
+
+	ret = remap_pfn_range(vma, vma->vm_start, pfn,
+			      vma->vm_end - vma->vm_start,
+			      vma->vm_page_prot);
+	if (ret)
+		drm_gem_vm_close(vma);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(drm_gem_cma_mmap_noncoherent);
+
 /**
  * drm_gem_cma_prime_import_sg_table_vmap - PRIME import another driver's
  *	scatter/gather table and get the virtual address of the buffer
diff --git a/include/drm/drm_gem_cma_helper.h b/include/drm/drm_gem_cma_helper.h
index 6b44e7492a63..6a3f7e1312cc 100644
--- a/include/drm/drm_gem_cma_helper.h
+++ b/include/drm/drm_gem_cma_helper.h
@@ -107,6 +107,7 @@ drm_gem_cma_prime_import_sg_table(struct drm_device *dev,
 				  struct sg_table *sgt);
 int drm_gem_cma_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
 int drm_gem_cma_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
+int drm_gem_cma_mmap_noncoherent(struct drm_gem_object *obj, struct vm_area_struct *vma);
 
 /**
  * DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE - CMA GEM driver operations
-- 
2.30.1

