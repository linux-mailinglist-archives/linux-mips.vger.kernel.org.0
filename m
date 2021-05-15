Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B4CC381975
	for <lists+linux-mips@lfdr.de>; Sat, 15 May 2021 16:54:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232195AbhEOOzh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 15 May 2021 10:55:37 -0400
Received: from aposti.net ([89.234.176.197]:58372 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232158AbhEOOza (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 15 May 2021 10:55:30 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Christoph Hellwig <hch@infradead.org>, list@opendingux.net,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v4 1/3] drm: Add support for GEM buffers backed by non-coherent memory
Date:   Sat, 15 May 2021 15:53:57 +0100
Message-Id: <20210515145359.64802-2-paul@crapouillou.net>
In-Reply-To: <20210515145359.64802-1-paul@crapouillou.net>
References: <20210515145359.64802-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Having GEM buffers backed by non-coherent memory is interesting in the
particular case where it is faster to render to a non-coherent buffer
then sync the data cache, than to render to a write-combine buffer, and
(by extension) much faster than using a shadow buffer. This is true for
instance on some Ingenic SoCs, where even simple blits (e.g. memcpy)
are about three times faster using this method.

Add a 'map_noncoherent' flag to the drm_gem_cma_object structure, which
can be set by the drivers when they create the dumb buffer.

Since this really only applies to software rendering, disable this flag
as soon as the CMA objects are exported via PRIME.

v3: New patch. Now uses a simple 'map_noncoherent' flag to control how
    the objects are mapped, and use the new dma_mmap_pages function.

v4: Make sure map_noncoherent is always disabled when creating GEM
    objects meant to be used with dma-buf.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/drm_gem_cma_helper.c | 38 +++++++++++++++++++++-------
 include/drm/drm_gem_cma_helper.h     |  3 +++
 2 files changed, 32 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
index 7942cf05cd93..235c7a63da2b 100644
--- a/drivers/gpu/drm/drm_gem_cma_helper.c
+++ b/drivers/gpu/drm/drm_gem_cma_helper.c
@@ -46,6 +46,7 @@ static const struct drm_gem_object_funcs drm_gem_cma_default_funcs = {
  * __drm_gem_cma_create - Create a GEM CMA object without allocating memory
  * @drm: DRM device
  * @size: size of the object to allocate
+ * @private: true if used for internal purposes
  *
  * This function creates and initializes a GEM CMA object of the given size,
  * but doesn't allocate any memory to back the object.
@@ -55,11 +56,11 @@ static const struct drm_gem_object_funcs drm_gem_cma_default_funcs = {
  * error code on failure.
  */
 static struct drm_gem_cma_object *
-__drm_gem_cma_create(struct drm_device *drm, size_t size)
+__drm_gem_cma_create(struct drm_device *drm, size_t size, bool private)
 {
 	struct drm_gem_cma_object *cma_obj;
 	struct drm_gem_object *gem_obj;
-	int ret;
+	int ret = 0;
 
 	if (drm->driver->gem_create_object)
 		gem_obj = drm->driver->gem_create_object(drm, size);
@@ -73,7 +74,14 @@ __drm_gem_cma_create(struct drm_device *drm, size_t size)
 
 	cma_obj = container_of(gem_obj, struct drm_gem_cma_object, base);
 
-	ret = drm_gem_object_init(drm, gem_obj, size);
+	if (private) {
+		drm_gem_private_object_init(drm, gem_obj, size);
+
+		/* Always use writecombine for dma-buf mappings */
+		cma_obj->map_noncoherent = false;
+	} else {
+		ret = drm_gem_object_init(drm, gem_obj, size);
+	}
 	if (ret)
 		goto error;
 
@@ -111,12 +119,19 @@ struct drm_gem_cma_object *drm_gem_cma_create(struct drm_device *drm,
 
 	size = round_up(size, PAGE_SIZE);
 
-	cma_obj = __drm_gem_cma_create(drm, size);
+	cma_obj = __drm_gem_cma_create(drm, size, false);
 	if (IS_ERR(cma_obj))
 		return cma_obj;
 
-	cma_obj->vaddr = dma_alloc_wc(drm->dev, size, &cma_obj->paddr,
-				      GFP_KERNEL | __GFP_NOWARN);
+	if (cma_obj->map_noncoherent) {
+		cma_obj->vaddr = dma_alloc_noncoherent(drm->dev, size,
+						       &cma_obj->paddr,
+						       DMA_TO_DEVICE,
+						       GFP_KERNEL | __GFP_NOWARN);
+	} else {
+		cma_obj->vaddr = dma_alloc_wc(drm->dev, size, &cma_obj->paddr,
+					      GFP_KERNEL | __GFP_NOWARN);
+	}
 	if (!cma_obj->vaddr) {
 		drm_dbg(drm, "failed to allocate buffer with size %zu\n",
 			 size);
@@ -432,7 +447,7 @@ drm_gem_cma_prime_import_sg_table(struct drm_device *dev,
 		return ERR_PTR(-EINVAL);
 
 	/* Create a CMA GEM buffer. */
-	cma_obj = __drm_gem_cma_create(dev, attach->dmabuf->size);
+	cma_obj = __drm_gem_cma_create(dev, attach->dmabuf->size, true);
 	if (IS_ERR(cma_obj))
 		return ERR_CAST(cma_obj);
 
@@ -499,8 +514,13 @@ int drm_gem_cma_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
 
 	cma_obj = to_drm_gem_cma_obj(obj);
 
-	ret = dma_mmap_wc(cma_obj->base.dev->dev, vma, cma_obj->vaddr,
-			  cma_obj->paddr, vma->vm_end - vma->vm_start);
+	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
+	if (!cma_obj->map_noncoherent)
+		vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
+
+	ret = dma_mmap_pages(cma_obj->base.dev->dev,
+			     vma, vma->vm_end - vma->vm_start,
+			     virt_to_page(cma_obj->vaddr));
 	if (ret)
 		drm_gem_vm_close(vma);
 
diff --git a/include/drm/drm_gem_cma_helper.h b/include/drm/drm_gem_cma_helper.h
index 0a9711caa3e8..cd13508acbc1 100644
--- a/include/drm/drm_gem_cma_helper.h
+++ b/include/drm/drm_gem_cma_helper.h
@@ -16,6 +16,7 @@ struct drm_mode_create_dumb;
  *       more than one entry but they are guaranteed to have contiguous
  *       DMA addresses.
  * @vaddr: kernel virtual address of the backing memory
+ * @map_noncoherent: if true, the GEM object is backed by non-coherent memory
  */
 struct drm_gem_cma_object {
 	struct drm_gem_object base;
@@ -24,6 +25,8 @@ struct drm_gem_cma_object {
 
 	/* For objects with DMA memory allocated by GEM CMA */
 	void *vaddr;
+
+	bool map_noncoherent;
 };
 
 #define to_drm_gem_cma_obj(gem_obj) \
-- 
2.30.2

