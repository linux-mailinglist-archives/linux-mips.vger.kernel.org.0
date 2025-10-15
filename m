Return-Path: <linux-mips+bounces-11730-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 447C4BDDB02
	for <lists+linux-mips@lfdr.de>; Wed, 15 Oct 2025 11:15:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3BB04581155
	for <lists+linux-mips@lfdr.de>; Wed, 15 Oct 2025 09:14:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2AF831AF3B;
	Wed, 15 Oct 2025 09:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tw71SVUT"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFD431A068;
	Wed, 15 Oct 2025 09:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760519617; cv=none; b=IAnzna1gUx/elf+GVf7xMm3M4AO5b5GFjQYX+OMS4V057eMpe8LN0SCwGX9yhr4RewKygFv8jy0LR7PcjidHM8ANynyGl/sRcoCN0wm+FWpqTOw5cUolx0PwfQfyVoXMP86EeEZo04535b0CS9+PBpfwNBR17rk4HwQrjayPi6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760519617; c=relaxed/simple;
	bh=CDM9cRqlJbJhV+/XZfBHBL1U6v3SXFrUWdt80oFtUYw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sbfhA8+TTjyEDwiXKKZQ4p5AqmmkvHYN+75j540zX052XhW/30a1xRP6chhgrATZ4k1kr4bfEHuyWBd8N53EFErwytcpBPrTjAWpxTRPxJ4Sv4WAKos8UcgdqExFTObPdJ9KIJevFMQTUdau6oLQN4llY8Npjd3B/xW4e9vXqTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tw71SVUT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58D1EC4CEF9;
	Wed, 15 Oct 2025 09:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760519617;
	bh=CDM9cRqlJbJhV+/XZfBHBL1U6v3SXFrUWdt80oFtUYw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tw71SVUT8XfKMlm1/r+zP7oJkAnZln+/ND2VKAPg1Fib6wjOCgnhmfHEo36OrBu0d
	 b9dArUbq9Mu5UObgbXUJpRImY3vUlA3YHJV7XlCL1PrZuREFVRiKW/Lpk/ajHEklGO
	 e76Q4clZxNno+qokZDv/kuPlTY4ELLlc0hGecwwogWcgug2MpXiJhryH+DiYEES6z0
	 bs9hkk4oHRsSWVybZZmy68VpF9MBIMDvvR//BLFqrFcosfeyCdJyBfTfKMOXxsVqCp
	 vpbi+cET5ZU7rNLb5tudr+kd7UXcMUnSRUPxNKuCJxExRGqgI1DNsQsH6x5au+8Ihh
	 B6aSY9FCWKG7g==
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Geoff Levand <geoff@infradead.org>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Cc: iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org,
	linux-alpha@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v5 04/14] ARM: dma-mapping: Switch to physical address mapping callbacks
Date: Wed, 15 Oct 2025 12:12:50 +0300
Message-ID: <20251015-remove-map-page-v5-4-3bbfe3a25cdf@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
References: <20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev
Content-Transfer-Encoding: 8bit

From: Leon Romanovsky <leonro@nvidia.com>

Combine resource and page mappings routines to one function, which
handles both these flows at the same manner. This conversion allows
us to remove .map_resource/.unmap_resource callbacks completely.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 arch/arm/mm/dma-mapping.c | 100 +++++++++++-----------------------------------
 1 file changed, 23 insertions(+), 77 deletions(-)

diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index b0310d6762d5..a4c765d24692 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -732,6 +732,9 @@ static int __dma_info_to_prot(enum dma_data_direction dir, unsigned long attrs)
 	if (attrs & DMA_ATTR_PRIVILEGED)
 		prot |= IOMMU_PRIV;
 
+	if (attrs & DMA_ATTR_MMIO)
+		prot |= IOMMU_MMIO;
+
 	switch (dir) {
 	case DMA_BIDIRECTIONAL:
 		return prot | IOMMU_READ | IOMMU_WRITE;
@@ -1350,25 +1353,27 @@ static void arm_iommu_sync_sg_for_device(struct device *dev,
 }
 
 /**
- * arm_iommu_map_page
+ * arm_iommu_map_phys
  * @dev: valid struct device pointer
- * @page: page that buffer resides in
- * @offset: offset into page for start of buffer
+ * @phys: physical address that buffer resides in
  * @size: size of buffer to map
  * @dir: DMA transfer direction
+ * @attrs: DMA mapping attributes
  *
  * IOMMU aware version of arm_dma_map_page()
  */
-static dma_addr_t arm_iommu_map_page(struct device *dev, struct page *page,
-	     unsigned long offset, size_t size, enum dma_data_direction dir,
-	     unsigned long attrs)
+static dma_addr_t arm_iommu_map_phys(struct device *dev, phys_addr_t phys,
+	     size_t size, enum dma_data_direction dir, unsigned long attrs)
 {
 	struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(dev);
+	int len = PAGE_ALIGN(size + offset_in_page(phys));
+	phys_addr_t addr = phys & PAGE_MASK;
 	dma_addr_t dma_addr;
-	int ret, prot, len = PAGE_ALIGN(size + offset);
+	int ret, prot;
 
-	if (!dev->dma_coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
-		arch_sync_dma_for_device(page_to_phys(page), offset, size, dir);
+	if (!dev->dma_coherent &&
+	    !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO)))
+		arch_sync_dma_for_device(phys, size, dir);
 
 	dma_addr = __alloc_iova(mapping, len);
 	if (dma_addr == DMA_MAPPING_ERROR)
@@ -1376,12 +1381,11 @@ static dma_addr_t arm_iommu_map_page(struct device *dev, struct page *page,
 
 	prot = __dma_info_to_prot(dir, attrs);
 
-	ret = iommu_map(mapping->domain, dma_addr, page_to_phys(page), len,
-			prot, GFP_KERNEL);
+	ret = iommu_map(mapping->domain, dma_addr, addr, len, prot, GFP_KERNEL);
 	if (ret < 0)
 		goto fail;
 
-	return dma_addr + offset;
+	return dma_addr + offset_in_page(phys);
 fail:
 	__free_iova(mapping, dma_addr, len);
 	return DMA_MAPPING_ERROR;
@@ -1393,10 +1397,11 @@ static dma_addr_t arm_iommu_map_page(struct device *dev, struct page *page,
  * @handle: DMA address of buffer
  * @size: size of buffer (same as passed to dma_map_page)
  * @dir: DMA transfer direction (same as passed to dma_map_page)
+ * @attrs: DMA mapping attributes
  *
- * IOMMU aware version of arm_dma_unmap_page()
+ * IOMMU aware version of arm_dma_unmap_phys()
  */
-static void arm_iommu_unmap_page(struct device *dev, dma_addr_t handle,
+static void arm_iommu_unmap_phys(struct device *dev, dma_addr_t handle,
 		size_t size, enum dma_data_direction dir, unsigned long attrs)
 {
 	struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(dev);
@@ -1407,7 +1412,8 @@ static void arm_iommu_unmap_page(struct device *dev, dma_addr_t handle,
 	if (!iova)
 		return;
 
-	if (!dev->dma_coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC)) {
+	if (!dev->dma_coherent &&
+	    !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO))) {
 		phys_addr_t phys = iommu_iova_to_phys(mapping->domain, iova);
 
 		arch_sync_dma_for_cpu(phys + offset, size, dir);
@@ -1417,63 +1423,6 @@ static void arm_iommu_unmap_page(struct device *dev, dma_addr_t handle,
 	__free_iova(mapping, iova, len);
 }
 
-/**
- * arm_iommu_map_resource - map a device resource for DMA
- * @dev: valid struct device pointer
- * @phys_addr: physical address of resource
- * @size: size of resource to map
- * @dir: DMA transfer direction
- */
-static dma_addr_t arm_iommu_map_resource(struct device *dev,
-		phys_addr_t phys_addr, size_t size,
-		enum dma_data_direction dir, unsigned long attrs)
-{
-	struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(dev);
-	dma_addr_t dma_addr;
-	int ret, prot;
-	phys_addr_t addr = phys_addr & PAGE_MASK;
-	unsigned int offset = phys_addr & ~PAGE_MASK;
-	size_t len = PAGE_ALIGN(size + offset);
-
-	dma_addr = __alloc_iova(mapping, len);
-	if (dma_addr == DMA_MAPPING_ERROR)
-		return dma_addr;
-
-	prot = __dma_info_to_prot(dir, attrs) | IOMMU_MMIO;
-
-	ret = iommu_map(mapping->domain, dma_addr, addr, len, prot, GFP_KERNEL);
-	if (ret < 0)
-		goto fail;
-
-	return dma_addr + offset;
-fail:
-	__free_iova(mapping, dma_addr, len);
-	return DMA_MAPPING_ERROR;
-}
-
-/**
- * arm_iommu_unmap_resource - unmap a device DMA resource
- * @dev: valid struct device pointer
- * @dma_handle: DMA address to resource
- * @size: size of resource to map
- * @dir: DMA transfer direction
- */
-static void arm_iommu_unmap_resource(struct device *dev, dma_addr_t dma_handle,
-		size_t size, enum dma_data_direction dir,
-		unsigned long attrs)
-{
-	struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(dev);
-	dma_addr_t iova = dma_handle & PAGE_MASK;
-	unsigned int offset = dma_handle & ~PAGE_MASK;
-	size_t len = PAGE_ALIGN(size + offset);
-
-	if (!iova)
-		return;
-
-	iommu_unmap(mapping->domain, iova, len);
-	__free_iova(mapping, iova, len);
-}
-
 static void arm_iommu_sync_single_for_cpu(struct device *dev,
 		dma_addr_t handle, size_t size, enum dma_data_direction dir)
 {
@@ -1510,8 +1459,8 @@ static const struct dma_map_ops iommu_ops = {
 	.mmap		= arm_iommu_mmap_attrs,
 	.get_sgtable	= arm_iommu_get_sgtable,
 
-	.map_page		= arm_iommu_map_page,
-	.unmap_page		= arm_iommu_unmap_page,
+	.map_phys		= arm_iommu_map_phys,
+	.unmap_phys		= arm_iommu_unmap_phys,
 	.sync_single_for_cpu	= arm_iommu_sync_single_for_cpu,
 	.sync_single_for_device	= arm_iommu_sync_single_for_device,
 
@@ -1519,9 +1468,6 @@ static const struct dma_map_ops iommu_ops = {
 	.unmap_sg		= arm_iommu_unmap_sg,
 	.sync_sg_for_cpu	= arm_iommu_sync_sg_for_cpu,
 	.sync_sg_for_device	= arm_iommu_sync_sg_for_device,
-
-	.map_resource		= arm_iommu_map_resource,
-	.unmap_resource		= arm_iommu_unmap_resource,
 };
 
 /**

-- 
2.51.0


