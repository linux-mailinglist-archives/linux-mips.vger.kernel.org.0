Return-Path: <linux-mips+bounces-11571-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BAEBA7323
	for <lists+linux-mips@lfdr.de>; Sun, 28 Sep 2025 17:03:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57E8A175CF3
	for <lists+linux-mips@lfdr.de>; Sun, 28 Sep 2025 15:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE23023770D;
	Sun, 28 Sep 2025 15:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LAocKRbJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D72023643E;
	Sun, 28 Sep 2025 15:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759071770; cv=none; b=JPd7GEgEGcThHnuOCqcqMG8hn1tdDOWAbdQIZ2EnpWsu8e0Pdi9d9wPXX36Xo9719kR8ysOl5r2etTRqKX/NzWmq9YgtedXu//pkEWwltOXism/PnwF2wIJKEzffTKEPsJonsYqiFInth8ddGUG6CI7Gcit23UwnLiZ23B1TfBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759071770; c=relaxed/simple;
	bh=If22SjLGOh/is+v52/ZDiDRnMnCqTEHc+dpMRM0pA2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XQklvkuumj1gpq4H7xjIgyJZrjWeRRm5TMdlKWgBHO0t7IdjTPWTSOwFjtQky0y4advvlVs8IJIpEOhgWShdz3whQO7MSIIiVdyW8xLpR9iDVYrKQ89i0dTiyZJaEwgs2JygIFCo5iwYSLNt1N9BeiayTTjZSgzTM2JL8ydyf8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LAocKRbJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9EB9C4CEF0;
	Sun, 28 Sep 2025 15:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759071770;
	bh=If22SjLGOh/is+v52/ZDiDRnMnCqTEHc+dpMRM0pA2s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LAocKRbJbaa97FIPPcaZ9C2Al8lU+DHQdZiPjJKGYtG5Bpk11+lwm3Tqi7A4+qTaw
	 iQ70Bpw0TW3NRd41XhsfDsE99PRxJaEzj9U3/HQLJVS+/xQcYXRfViOEcnd+g8Lr8g
	 xOXUh40eUvXDb1DNt5t6GB30z/eXqiin6CTW6vSxQDDhRFw9GYswOSz6RGlwZRIAQC
	 2ctL1b0csjMfGi3YVKGtGCAn4+8dWOC/oik0SDvI7Gz9EvUZrIGJFbqcfsbEV7ZjeK
	 UKzgbUcboFDm5Iu7CjnXI7xmOHIS+z+B5/YSjpEbRi93B78wqFfgKWaSblWkn37+ti
	 lU2bP2uCwCkzw==
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Leon Romanovsky <leonro@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Geoff Levand <geoff@infradead.org>,
	Helge Deller <deller@gmx.de>,
	Ingo Molnar <mingo@redhat.com>,
	iommu@lists.linux.dev,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Jason Wang <jasowang@redhat.com>,
	Juergen Gross <jgross@suse.com>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Matt Turner <mattst88@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	sparclinux@vger.kernel.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	virtualization@lists.linux.dev,
	x86@kernel.org,
	xen-devel@lists.xenproject.org,
	Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH v1 4/9] powerpc: Convert to physical address DMA mapping
Date: Sun, 28 Sep 2025 18:02:24 +0300
Message-ID: <f2b69a0ac2308cc8fd8635dceac951670d41cea2.1759071169.git.leon@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1759071169.git.leon@kernel.org>
References: <cover.1759071169.git.leon@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leon Romanovsky <leonro@nvidia.com>

Adapt PowerPC DMA to use physical addresses in order to prepare code
to removal .map_page and .unmap_page.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 arch/powerpc/include/asm/iommu.h         |  8 +++---
 arch/powerpc/kernel/dma-iommu.c          | 22 +++++++---------
 arch/powerpc/kernel/iommu.c              | 14 +++++-----
 arch/powerpc/platforms/ps3/system-bus.c  | 33 ++++++++++++++----------
 arch/powerpc/platforms/pseries/ibmebus.c | 15 ++++++-----
 arch/powerpc/platforms/pseries/vio.c     | 21 ++++++++-------
 6 files changed, 60 insertions(+), 53 deletions(-)

diff --git a/arch/powerpc/include/asm/iommu.h b/arch/powerpc/include/asm/iommu.h
index b410021ad4c6..eafdd63cd6c4 100644
--- a/arch/powerpc/include/asm/iommu.h
+++ b/arch/powerpc/include/asm/iommu.h
@@ -274,12 +274,12 @@ extern void *iommu_alloc_coherent(struct device *dev, struct iommu_table *tbl,
 				  unsigned long mask, gfp_t flag, int node);
 extern void iommu_free_coherent(struct iommu_table *tbl, size_t size,
 				void *vaddr, dma_addr_t dma_handle);
-extern dma_addr_t iommu_map_page(struct device *dev, struct iommu_table *tbl,
-				 struct page *page, unsigned long offset,
-				 size_t size, unsigned long mask,
+extern dma_addr_t iommu_map_phys(struct device *dev, struct iommu_table *tbl,
+				 phys_addr_t phys, size_t size,
+				 unsigned long mask,
 				 enum dma_data_direction direction,
 				 unsigned long attrs);
-extern void iommu_unmap_page(struct iommu_table *tbl, dma_addr_t dma_handle,
+extern void iommu_unmap_phys(struct iommu_table *tbl, dma_addr_t dma_handle,
 			     size_t size, enum dma_data_direction direction,
 			     unsigned long attrs);
 
diff --git a/arch/powerpc/kernel/dma-iommu.c b/arch/powerpc/kernel/dma-iommu.c
index 0359ab72cd3b..aa3689d61917 100644
--- a/arch/powerpc/kernel/dma-iommu.c
+++ b/arch/powerpc/kernel/dma-iommu.c
@@ -93,28 +93,26 @@ static void dma_iommu_free_coherent(struct device *dev, size_t size,
 
 /* Creates TCEs for a user provided buffer.  The user buffer must be
  * contiguous real kernel storage (not vmalloc).  The address passed here
- * comprises a page address and offset into that page. The dma_addr_t
- * returned will point to the same byte within the page as was passed in.
+ * is a physical address to that page. The dma_addr_t returned will point
+ * to the same byte within the page as was passed in.
  */
-static dma_addr_t dma_iommu_map_page(struct device *dev, struct page *page,
-				     unsigned long offset, size_t size,
+static dma_addr_t dma_iommu_map_phys(struct device *dev, phys_addr_t phys,
+				     size_t size,
 				     enum dma_data_direction direction,
 				     unsigned long attrs)
 {
-	return iommu_map_page(dev, get_iommu_table_base(dev), page, offset,
-			      size, dma_get_mask(dev), direction, attrs);
+	return iommu_map_phys(dev, get_iommu_table_base(dev), phys, size,
+			      dma_get_mask(dev), direction, attrs);
 }
 
-
-static void dma_iommu_unmap_page(struct device *dev, dma_addr_t dma_handle,
+static void dma_iommu_unmap_phys(struct device *dev, dma_addr_t dma_handle,
 				 size_t size, enum dma_data_direction direction,
 				 unsigned long attrs)
 {
-	iommu_unmap_page(get_iommu_table_base(dev), dma_handle, size, direction,
+	iommu_unmap_phys(get_iommu_table_base(dev), dma_handle, size, direction,
 			 attrs);
 }
 
-
 static int dma_iommu_map_sg(struct device *dev, struct scatterlist *sglist,
 			    int nelems, enum dma_data_direction direction,
 			    unsigned long attrs)
@@ -211,8 +209,8 @@ const struct dma_map_ops dma_iommu_ops = {
 	.map_sg			= dma_iommu_map_sg,
 	.unmap_sg		= dma_iommu_unmap_sg,
 	.dma_supported		= dma_iommu_dma_supported,
-	.map_page		= dma_iommu_map_page,
-	.unmap_page		= dma_iommu_unmap_page,
+	.map_phys		= dma_iommu_map_phys,
+	.unmap_phys		= dma_iommu_unmap_phys,
 	.get_required_mask	= dma_iommu_get_required_mask,
 	.mmap			= dma_common_mmap,
 	.get_sgtable		= dma_common_get_sgtable,
diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index 244eb4857e7f..6b5f4b72ce97 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -848,12 +848,12 @@ EXPORT_SYMBOL_GPL(iommu_tce_table_put);
 
 /* Creates TCEs for a user provided buffer.  The user buffer must be
  * contiguous real kernel storage (not vmalloc).  The address passed here
- * comprises a page address and offset into that page. The dma_addr_t
- * returned will point to the same byte within the page as was passed in.
+ * is physical address into that page. The dma_addr_t returned will point
+ * to the same byte within the page as was passed in.
  */
-dma_addr_t iommu_map_page(struct device *dev, struct iommu_table *tbl,
-			  struct page *page, unsigned long offset, size_t size,
-			  unsigned long mask, enum dma_data_direction direction,
+dma_addr_t iommu_map_phys(struct device *dev, struct iommu_table *tbl,
+			  phys_addr_t phys, size_t size, unsigned long mask,
+			  enum dma_data_direction direction,
 			  unsigned long attrs)
 {
 	dma_addr_t dma_handle = DMA_MAPPING_ERROR;
@@ -863,7 +863,7 @@ dma_addr_t iommu_map_page(struct device *dev, struct iommu_table *tbl,
 
 	BUG_ON(direction == DMA_NONE);
 
-	vaddr = page_address(page) + offset;
+	vaddr = phys_to_virt(phys);
 	uaddr = (unsigned long)vaddr;
 
 	if (tbl) {
@@ -890,7 +890,7 @@ dma_addr_t iommu_map_page(struct device *dev, struct iommu_table *tbl,
 	return dma_handle;
 }
 
-void iommu_unmap_page(struct iommu_table *tbl, dma_addr_t dma_handle,
+void iommu_unmap_phys(struct iommu_table *tbl, dma_addr_t dma_handle,
 		      size_t size, enum dma_data_direction direction,
 		      unsigned long attrs)
 {
diff --git a/arch/powerpc/platforms/ps3/system-bus.c b/arch/powerpc/platforms/ps3/system-bus.c
index afbaabf182d0..a223ba777148 100644
--- a/arch/powerpc/platforms/ps3/system-bus.c
+++ b/arch/powerpc/platforms/ps3/system-bus.c
@@ -551,18 +551,20 @@ static void ps3_free_coherent(struct device *_dev, size_t size, void *vaddr,
 
 /* Creates TCEs for a user provided buffer.  The user buffer must be
  * contiguous real kernel storage (not vmalloc).  The address passed here
- * comprises a page address and offset into that page. The dma_addr_t
- * returned will point to the same byte within the page as was passed in.
+ * is physical address to that hat page. The dma_addr_t returned will point
+ * to the same byte within the page as was passed in.
  */
 
-static dma_addr_t ps3_sb_map_page(struct device *_dev, struct page *page,
-	unsigned long offset, size_t size, enum dma_data_direction direction,
-	unsigned long attrs)
+static dma_addr_t ps3_sb_map_phys(struct device *_dev, phys_addr_t phys,
+	size_t size, enum dma_data_direction direction, unsigned long attrs)
 {
 	struct ps3_system_bus_device *dev = ps3_dev_to_system_bus_dev(_dev);
 	int result;
 	dma_addr_t bus_addr;
-	void *ptr = page_address(page) + offset;
+	void *ptr = phys_to_virt(phys);
+
+	if (attrs & DMA_ATTR_MMIO)
+		return DMA_MAPPING_ERROR;
 
 	result = ps3_dma_map(dev->d_region, (unsigned long)ptr, size,
 			     &bus_addr,
@@ -577,8 +579,8 @@ static dma_addr_t ps3_sb_map_page(struct device *_dev, struct page *page,
 	return bus_addr;
 }
 
-static dma_addr_t ps3_ioc0_map_page(struct device *_dev, struct page *page,
-				    unsigned long offset, size_t size,
+static dma_addr_t ps3_ioc0_map_phys(struct device *_dev, phys_addr_t phys,
+				    size_t size,
 				    enum dma_data_direction direction,
 				    unsigned long attrs)
 {
@@ -586,7 +588,10 @@ static dma_addr_t ps3_ioc0_map_page(struct device *_dev, struct page *page,
 	int result;
 	dma_addr_t bus_addr;
 	u64 iopte_flag;
-	void *ptr = page_address(page) + offset;
+	void *ptr = phys_to_virt(phys);
+
+	if (attrs & DMA_ATTR_MMIO)
+		return DMA_MAPPING_ERROR;
 
 	iopte_flag = CBE_IOPTE_M;
 	switch (direction) {
@@ -613,7 +618,7 @@ static dma_addr_t ps3_ioc0_map_page(struct device *_dev, struct page *page,
 	return bus_addr;
 }
 
-static void ps3_unmap_page(struct device *_dev, dma_addr_t dma_addr,
+static void ps3_unmap_phys(struct device *_dev, dma_addr_t dma_addr,
 	size_t size, enum dma_data_direction direction, unsigned long attrs)
 {
 	struct ps3_system_bus_device *dev = ps3_dev_to_system_bus_dev(_dev);
@@ -690,8 +695,8 @@ static const struct dma_map_ops ps3_sb_dma_ops = {
 	.map_sg = ps3_sb_map_sg,
 	.unmap_sg = ps3_sb_unmap_sg,
 	.dma_supported = ps3_dma_supported,
-	.map_page = ps3_sb_map_page,
-	.unmap_page = ps3_unmap_page,
+	.map_phys = ps3_sb_map_phys,
+	.unmap_phys = ps3_unmap_phys,
 	.mmap = dma_common_mmap,
 	.get_sgtable = dma_common_get_sgtable,
 	.alloc_pages_op = dma_common_alloc_pages,
@@ -704,8 +709,8 @@ static const struct dma_map_ops ps3_ioc0_dma_ops = {
 	.map_sg = ps3_ioc0_map_sg,
 	.unmap_sg = ps3_ioc0_unmap_sg,
 	.dma_supported = ps3_dma_supported,
-	.map_page = ps3_ioc0_map_page,
-	.unmap_page = ps3_unmap_page,
+	.map_phys = ps3_ioc0_map_phys,
+	.unmap_phys = ps3_unmap_phys,
 	.mmap = dma_common_mmap,
 	.get_sgtable = dma_common_get_sgtable,
 	.alloc_pages_op = dma_common_alloc_pages,
diff --git a/arch/powerpc/platforms/pseries/ibmebus.c b/arch/powerpc/platforms/pseries/ibmebus.c
index 3436b0af795e..cad2deb7e70d 100644
--- a/arch/powerpc/platforms/pseries/ibmebus.c
+++ b/arch/powerpc/platforms/pseries/ibmebus.c
@@ -86,17 +86,18 @@ static void ibmebus_free_coherent(struct device *dev,
 	kfree(vaddr);
 }
 
-static dma_addr_t ibmebus_map_page(struct device *dev,
-				   struct page *page,
-				   unsigned long offset,
+static dma_addr_t ibmebus_map_phys(struct device *dev, phys_addr_t phys,
 				   size_t size,
 				   enum dma_data_direction direction,
 				   unsigned long attrs)
 {
-	return (dma_addr_t)(page_address(page) + offset);
+	if (attrs & DMA_ATTR_MMIO)
+		return DMA_MAPPING_ERROR;
+
+	return (dma_addr_t)(phys_to_virt(phys));
 }
 
-static void ibmebus_unmap_page(struct device *dev,
+static void ibmebus_unmap_phys(struct device *dev,
 			       dma_addr_t dma_addr,
 			       size_t size,
 			       enum dma_data_direction direction,
@@ -146,8 +147,8 @@ static const struct dma_map_ops ibmebus_dma_ops = {
 	.unmap_sg           = ibmebus_unmap_sg,
 	.dma_supported      = ibmebus_dma_supported,
 	.get_required_mask  = ibmebus_dma_get_required_mask,
-	.map_page           = ibmebus_map_page,
-	.unmap_page         = ibmebus_unmap_page,
+	.map_phys           = ibmebus_map_phys,
+	.unmap_phys         = ibmebus_unmap_phys,
 };
 
 static int ibmebus_match_path(struct device *dev, const void *data)
diff --git a/arch/powerpc/platforms/pseries/vio.c b/arch/powerpc/platforms/pseries/vio.c
index ac1d2d2c9a88..838e29d47378 100644
--- a/arch/powerpc/platforms/pseries/vio.c
+++ b/arch/powerpc/platforms/pseries/vio.c
@@ -512,18 +512,21 @@ static void vio_dma_iommu_free_coherent(struct device *dev, size_t size,
 	vio_cmo_dealloc(viodev, roundup(size, PAGE_SIZE));
 }
 
-static dma_addr_t vio_dma_iommu_map_page(struct device *dev, struct page *page,
-                                         unsigned long offset, size_t size,
-                                         enum dma_data_direction direction,
-                                         unsigned long attrs)
+static dma_addr_t vio_dma_iommu_map_phys(struct device *dev, phys_addr_t phys,
+					 size_t size,
+					 enum dma_data_direction direction,
+					 unsigned long attrs)
 {
 	struct vio_dev *viodev = to_vio_dev(dev);
 	struct iommu_table *tbl = get_iommu_table_base(dev);
 	dma_addr_t ret = DMA_MAPPING_ERROR;
 
+	if (attrs & DMA_ATTR_MMIO)
+		return ret;
+
 	if (vio_cmo_alloc(viodev, roundup(size, IOMMU_PAGE_SIZE(tbl))))
 		goto out_fail;
-	ret = iommu_map_page(dev, tbl, page, offset, size, dma_get_mask(dev),
+	ret = iommu_map_phys(dev, tbl, phys, size, dma_get_mask(dev),
 			direction, attrs);
 	if (unlikely(ret == DMA_MAPPING_ERROR))
 		goto out_deallocate;
@@ -536,7 +539,7 @@ static dma_addr_t vio_dma_iommu_map_page(struct device *dev, struct page *page,
 	return DMA_MAPPING_ERROR;
 }
 
-static void vio_dma_iommu_unmap_page(struct device *dev, dma_addr_t dma_handle,
+static void vio_dma_iommu_unmap_phys(struct device *dev, dma_addr_t dma_handle,
 				     size_t size,
 				     enum dma_data_direction direction,
 				     unsigned long attrs)
@@ -544,7 +547,7 @@ static void vio_dma_iommu_unmap_page(struct device *dev, dma_addr_t dma_handle,
 	struct vio_dev *viodev = to_vio_dev(dev);
 	struct iommu_table *tbl = get_iommu_table_base(dev);
 
-	iommu_unmap_page(tbl, dma_handle, size, direction, attrs);
+	iommu_unmap_phys(tbl, dma_handle, size, direction, attrs);
 	vio_cmo_dealloc(viodev, roundup(size, IOMMU_PAGE_SIZE(tbl)));
 }
 
@@ -605,8 +608,8 @@ static const struct dma_map_ops vio_dma_mapping_ops = {
 	.free              = vio_dma_iommu_free_coherent,
 	.map_sg            = vio_dma_iommu_map_sg,
 	.unmap_sg          = vio_dma_iommu_unmap_sg,
-	.map_page          = vio_dma_iommu_map_page,
-	.unmap_page        = vio_dma_iommu_unmap_page,
+	.map_phys          = vio_dma_iommu_map_phys,
+	.unmap_phys        = vio_dma_iommu_unmap_phys,
 	.dma_supported     = dma_iommu_dma_supported,
 	.get_required_mask = dma_iommu_get_required_mask,
 	.mmap		   = dma_common_mmap,
-- 
2.51.0


