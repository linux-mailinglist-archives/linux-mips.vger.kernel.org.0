Return-Path: <linux-mips+bounces-11724-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC24BDDA43
	for <lists+linux-mips@lfdr.de>; Wed, 15 Oct 2025 11:13:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1F93547923
	for <lists+linux-mips@lfdr.de>; Wed, 15 Oct 2025 09:13:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57A4F319870;
	Wed, 15 Oct 2025 09:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GfGSWwPL"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23243319858;
	Wed, 15 Oct 2025 09:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760519596; cv=none; b=SIJ/ZrkiB/vZ1j3iqicZjau3+94gc3RcRqfDrSKPPD3AV7Bx16dOlz7sC0uQ3PTOpwRkXIvj0XaqtgeW4Iapg4y9JZR2bGhMftzwXTp0G6nuYoLg05Slo5dVR5hOh8SF5o2cCMmfvAJjoep49cKZ2naagp4RS28pyw1Myf/bjdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760519596; c=relaxed/simple;
	bh=5CRzqWoVfMbqVNKIxqeoLG2c9tvgUeIFTheShsK3Bpg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bklyzlOOj/cUPoWu4EQJtJ5tCdSjezFGFk2Juyj5zHad4IHeQbKrnDCEc0teiPfhsjSxK6pLCe1lRW+URVuM2UBHkq2LPSgM9jkssMPAQIpZIMGiVZIafm9AUC3ckFc7W2glZuKW+ZU10M091JVk90qzvm4+wYKIW+oN0/MHsJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GfGSWwPL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A1D2C116B1;
	Wed, 15 Oct 2025 09:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760519595;
	bh=5CRzqWoVfMbqVNKIxqeoLG2c9tvgUeIFTheShsK3Bpg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GfGSWwPLGtufj1swQ+n7QEGSAHQU77k7sZmwzSh3gwKsGKxwUSyhBd87hWhNEvtrl
	 buUMXV+6O8Xu+JxlDnDhIv9r0IAD1Z0RfPmMTvm1RhyHnAh54jr/kk/B9gEmZKEBfq
	 dyxPWuZk9aaW/5ysGOs3Lh2Xkuvkf8W36g0+yC8l1lZWgZR6XZvww3OdFVbQSeWbZ3
	 DBSlpFZzMALBmjKmlRreacKzyXlQmKcW4asQus02qvoKR7vSSnohS8I3XGMqS/YvX5
	 rvbOkMGDjGPOblMmmEof5eGSRnxj8+iqK6wr/OfWoF9xmDM6qaQh/HQoZtd5IhimPH
	 5sCcW9rpImS9g==
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
Subject: [PATCH v5 03/14] ARM: dma-mapping: Reduce struct page exposure in arch_sync_dma*()
Date: Wed, 15 Oct 2025 12:12:49 +0300
Message-ID: <20251015-remove-map-page-v5-3-3bbfe3a25cdf@kernel.org>
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

As a preparation to changing from .map_page to use .map_phys DMA
callbacks, convert arch_sync_dma*() functions to use physical addresses
instead of struct page.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 arch/arm/mm/dma-mapping.c | 82 ++++++++++++++++++-----------------------------
 1 file changed, 31 insertions(+), 51 deletions(-)

diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index 08641a936394..b0310d6762d5 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -624,16 +624,14 @@ static void __arm_dma_free(struct device *dev, size_t size, void *cpu_addr,
 	kfree(buf);
 }
 
-static void dma_cache_maint_page(struct page *page, unsigned long offset,
-	size_t size, enum dma_data_direction dir,
+static void dma_cache_maint_page(phys_addr_t phys, size_t size,
+	enum dma_data_direction dir,
 	void (*op)(const void *, size_t, int))
 {
-	unsigned long pfn;
+	unsigned long offset = offset_in_page(phys);
+	unsigned long pfn = __phys_to_pfn(phys);
 	size_t left = size;
 
-	pfn = page_to_pfn(page) + offset / PAGE_SIZE;
-	offset %= PAGE_SIZE;
-
 	/*
 	 * A single sg entry may refer to multiple physically contiguous
 	 * pages.  But we still need to process highmem pages individually.
@@ -644,17 +642,18 @@ static void dma_cache_maint_page(struct page *page, unsigned long offset,
 		size_t len = left;
 		void *vaddr;
 
-		page = pfn_to_page(pfn);
-
-		if (PageHighMem(page)) {
+		phys = __pfn_to_phys(pfn);
+		if (PhysHighMem(phys)) {
 			if (len + offset > PAGE_SIZE)
 				len = PAGE_SIZE - offset;
 
 			if (cache_is_vipt_nonaliasing()) {
-				vaddr = kmap_atomic(page);
+				vaddr = kmap_atomic_pfn(pfn);
 				op(vaddr + offset, len, dir);
 				kunmap_atomic(vaddr);
 			} else {
+				struct page *page = phys_to_page(phys);
+
 				vaddr = kmap_high_get(page);
 				if (vaddr) {
 					op(vaddr + offset, len, dir);
@@ -662,7 +661,8 @@ static void dma_cache_maint_page(struct page *page, unsigned long offset,
 				}
 			}
 		} else {
-			vaddr = page_address(page) + offset;
+			phys += offset;
+			vaddr = phys_to_virt(phys);
 			op(vaddr, len, dir);
 		}
 		offset = 0;
@@ -676,14 +676,11 @@ static void dma_cache_maint_page(struct page *page, unsigned long offset,
  * Note: Drivers should NOT use this function directly.
  * Use the driver DMA support - see dma-mapping.h (dma_sync_*)
  */
-static void __dma_page_cpu_to_dev(struct page *page, unsigned long off,
-	size_t size, enum dma_data_direction dir)
+void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
+			      enum dma_data_direction dir)
 {
-	phys_addr_t paddr;
-
-	dma_cache_maint_page(page, off, size, dir, dmac_map_area);
+	dma_cache_maint_page(paddr, size, dir, dmac_map_area);
 
-	paddr = page_to_phys(page) + off;
 	if (dir == DMA_FROM_DEVICE) {
 		outer_inv_range(paddr, paddr + size);
 	} else {
@@ -692,17 +689,15 @@ static void __dma_page_cpu_to_dev(struct page *page, unsigned long off,
 	/* FIXME: non-speculating: flush on bidirectional mappings? */
 }
 
-static void __dma_page_dev_to_cpu(struct page *page, unsigned long off,
-	size_t size, enum dma_data_direction dir)
+void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
+			   enum dma_data_direction dir)
 {
-	phys_addr_t paddr = page_to_phys(page) + off;
-
 	/* FIXME: non-speculating: not required */
 	/* in any case, don't bother invalidating if DMA to device */
 	if (dir != DMA_TO_DEVICE) {
 		outer_inv_range(paddr, paddr + size);
 
-		dma_cache_maint_page(page, off, size, dir, dmac_unmap_area);
+		dma_cache_maint_page(paddr, size, dir, dmac_unmap_area);
 	}
 
 	/*
@@ -1205,7 +1200,7 @@ static int __map_sg_chunk(struct device *dev, struct scatterlist *sg,
 		unsigned int len = PAGE_ALIGN(s->offset + s->length);
 
 		if (!dev->dma_coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
-			__dma_page_cpu_to_dev(sg_page(s), s->offset, s->length, dir);
+			arch_sync_dma_for_device(sg_phys(s), s->length, dir);
 
 		prot = __dma_info_to_prot(dir, attrs);
 
@@ -1307,8 +1302,7 @@ static void arm_iommu_unmap_sg(struct device *dev,
 			__iommu_remove_mapping(dev, sg_dma_address(s),
 					       sg_dma_len(s));
 		if (!dev->dma_coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
-			__dma_page_dev_to_cpu(sg_page(s), s->offset,
-					      s->length, dir);
+			arch_sync_dma_for_cpu(sg_phys(s), s->length, dir);
 	}
 }
 
@@ -1330,7 +1324,7 @@ static void arm_iommu_sync_sg_for_cpu(struct device *dev,
 		return;
 
 	for_each_sg(sg, s, nents, i)
-		__dma_page_dev_to_cpu(sg_page(s), s->offset, s->length, dir);
+		arch_sync_dma_for_cpu(sg_phys(s), s->length, dir);
 
 }
 
@@ -1352,7 +1346,7 @@ static void arm_iommu_sync_sg_for_device(struct device *dev,
 		return;
 
 	for_each_sg(sg, s, nents, i)
-		__dma_page_cpu_to_dev(sg_page(s), s->offset, s->length, dir);
+		arch_sync_dma_for_device(sg_phys(s), s->length, dir);
 }
 
 /**
@@ -1374,7 +1368,7 @@ static dma_addr_t arm_iommu_map_page(struct device *dev, struct page *page,
 	int ret, prot, len = PAGE_ALIGN(size + offset);
 
 	if (!dev->dma_coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
-		__dma_page_cpu_to_dev(page, offset, size, dir);
+		arch_sync_dma_for_device(page_to_phys(page), offset, size, dir);
 
 	dma_addr = __alloc_iova(mapping, len);
 	if (dma_addr == DMA_MAPPING_ERROR)
@@ -1407,7 +1401,6 @@ static void arm_iommu_unmap_page(struct device *dev, dma_addr_t handle,
 {
 	struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(dev);
 	dma_addr_t iova = handle & PAGE_MASK;
-	struct page *page;
 	int offset = handle & ~PAGE_MASK;
 	int len = PAGE_ALIGN(size + offset);
 
@@ -1415,8 +1408,9 @@ static void arm_iommu_unmap_page(struct device *dev, dma_addr_t handle,
 		return;
 
 	if (!dev->dma_coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC)) {
-		page = phys_to_page(iommu_iova_to_phys(mapping->domain, iova));
-		__dma_page_dev_to_cpu(page, offset, size, dir);
+		phys_addr_t phys = iommu_iova_to_phys(mapping->domain, iova);
+
+		arch_sync_dma_for_cpu(phys + offset, size, dir);
 	}
 
 	iommu_unmap(mapping->domain, iova, len);
@@ -1485,14 +1479,14 @@ static void arm_iommu_sync_single_for_cpu(struct device *dev,
 {
 	struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(dev);
 	dma_addr_t iova = handle & PAGE_MASK;
-	struct page *page;
 	unsigned int offset = handle & ~PAGE_MASK;
+	phys_addr_t phys;
 
 	if (dev->dma_coherent || !iova)
 		return;
 
-	page = phys_to_page(iommu_iova_to_phys(mapping->domain, iova));
-	__dma_page_dev_to_cpu(page, offset, size, dir);
+	phys = iommu_iova_to_phys(mapping->domain, iova);
+	arch_sync_dma_for_cpu(phys + offset, size, dir);
 }
 
 static void arm_iommu_sync_single_for_device(struct device *dev,
@@ -1500,14 +1494,14 @@ static void arm_iommu_sync_single_for_device(struct device *dev,
 {
 	struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(dev);
 	dma_addr_t iova = handle & PAGE_MASK;
-	struct page *page;
 	unsigned int offset = handle & ~PAGE_MASK;
+	phys_addr_t phys;
 
 	if (dev->dma_coherent || !iova)
 		return;
 
-	page = phys_to_page(iommu_iova_to_phys(mapping->domain, iova));
-	__dma_page_cpu_to_dev(page, offset, size, dir);
+	phys = iommu_iova_to_phys(mapping->domain, iova);
+	arch_sync_dma_for_device(phys + offset, size, dir);
 }
 
 static const struct dma_map_ops iommu_ops = {
@@ -1794,20 +1788,6 @@ void arch_teardown_dma_ops(struct device *dev)
 	set_dma_ops(dev, NULL);
 }
 
-void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
-		enum dma_data_direction dir)
-{
-	__dma_page_cpu_to_dev(phys_to_page(paddr), paddr & (PAGE_SIZE - 1),
-			      size, dir);
-}
-
-void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
-		enum dma_data_direction dir)
-{
-	__dma_page_dev_to_cpu(phys_to_page(paddr), paddr & (PAGE_SIZE - 1),
-			      size, dir);
-}
-
 void *arch_dma_alloc(struct device *dev, size_t size, dma_addr_t *dma_handle,
 		gfp_t gfp, unsigned long attrs)
 {

-- 
2.51.0


