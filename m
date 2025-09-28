Return-Path: <linux-mips+bounces-11572-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 842E7BA7346
	for <lists+linux-mips@lfdr.de>; Sun, 28 Sep 2025 17:03:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A31987AA002
	for <lists+linux-mips@lfdr.de>; Sun, 28 Sep 2025 15:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73FAF23958C;
	Sun, 28 Sep 2025 15:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q5iYL8J4"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357B522A4F1;
	Sun, 28 Sep 2025 15:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759071776; cv=none; b=PmT7x7iVH3Lxzig26HdB+QlCth1NW+u0KXE9KIy5t28anN3hNdTrIPqK9GJe9ZKwUSzWvvOnfDBBi2M1fU4Y9Y9qrXuNHPD7RJTuLSVRIkkYe9IeqPoLfDcckLn+eikYBvuNIkwF6X2qJzPzBANwcmcuIMTtkYUCjGuK3h07RnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759071776; c=relaxed/simple;
	bh=jNtnwWwMV3plKAecUNIdrhRBaM4ED7uOfKosdK+4834=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TVbs5MMzbsNVaFPs3tVVSVw83IWK9khMC3LXPd6kI67XST2byb85JQ/nhhStrZQGUAYcq5MveBcLQ/mY6Ahb33MJXAiLfvefBenn9pZgmDPj2ThfnAc+hlktQXKyG6TQBOVDFXl0HF2Dj1T6aZsKcySjVdE98AuKML6yda7M8IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q5iYL8J4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2C49C4CEF5;
	Sun, 28 Sep 2025 15:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759071775;
	bh=jNtnwWwMV3plKAecUNIdrhRBaM4ED7uOfKosdK+4834=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q5iYL8J4WbMGQv508j0QZDEfRJ0+7iu0lvJK3NuWtN1V3QOH6cmyo6Kk/sloMCjGJ
	 3opzab96iV6QBOWtv3sEcwe3ixvE9omNE1shesZU9PSudr5AtxFOSo+XfXeHrS3kRm
	 N4PgnJV5qrM/PtIMgPQ1CS8vRmu6FNYaMEtf1Uln3Tgfwxf4/ZiydAtEBi+XdEIyaT
	 tFEnF9SvQ2T9pHurTpXc/xL+PlNqDJ6+SkERg2O08QiR0KVTHkZeHs+oryBHUZdFXG
	 lNYCWoQiMxLiaXDpAfuLbBo4vqWn76vCduW5o0tt6jpMIf/+MzpS5eMBgsF2hYeqvS
	 WZi3vUeeyRjAw==
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
Subject: [PATCH v1 1/9] alpha: Convert mapping routine to rely on physical address
Date: Sun, 28 Sep 2025 18:02:21 +0300
Message-ID: <512d4c498103fcfccd8c60ce1982cd961434d30b.1759071169.git.leon@kernel.org>
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

Alpha doesn't need struct *page and can perform mapping based on
physical addresses. So convert it to implement new .map_phys callback.

As part of this change, remove useless BUG_ON() as DMA mapping layer
ensures that right direction is provided.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 arch/alpha/kernel/pci_iommu.c | 48 +++++++++++++++--------------------
 1 file changed, 21 insertions(+), 27 deletions(-)

diff --git a/arch/alpha/kernel/pci_iommu.c b/arch/alpha/kernel/pci_iommu.c
index dc91de50f906..3e4f631a1f27 100644
--- a/arch/alpha/kernel/pci_iommu.c
+++ b/arch/alpha/kernel/pci_iommu.c
@@ -224,28 +224,26 @@ static int pci_dac_dma_supported(struct pci_dev *dev, u64 mask)
    until either pci_unmap_single or pci_dma_sync_single is performed.  */
 
 static dma_addr_t
-pci_map_single_1(struct pci_dev *pdev, void *cpu_addr, size_t size,
+pci_map_single_1(struct pci_dev *pdev, phys_addr_t paddr, size_t size,
 		 int dac_allowed)
 {
 	struct pci_controller *hose = pdev ? pdev->sysdata : pci_isa_hose;
 	dma_addr_t max_dma = pdev ? pdev->dma_mask : ISA_DMA_MASK;
+	unsigned long offset = offset_in_page(paddr);
 	struct pci_iommu_arena *arena;
 	long npages, dma_ofs, i;
-	unsigned long paddr;
 	dma_addr_t ret;
 	unsigned int align = 0;
 	struct device *dev = pdev ? &pdev->dev : NULL;
 
-	paddr = __pa(cpu_addr);
-
 #if !DEBUG_NODIRECT
 	/* First check to see if we can use the direct map window.  */
 	if (paddr + size + __direct_map_base - 1 <= max_dma
 	    && paddr + size <= __direct_map_size) {
 		ret = paddr + __direct_map_base;
 
-		DBGA2("pci_map_single: [%p,%zx] -> direct %llx from %ps\n",
-		      cpu_addr, size, ret, __builtin_return_address(0));
+		DBGA2("pci_map_single: [%pa,%zx] -> direct %llx from %ps\n",
+		      &paddr, size, ret, __builtin_return_address(0));
 
 		return ret;
 	}
@@ -255,8 +253,8 @@ pci_map_single_1(struct pci_dev *pdev, void *cpu_addr, size_t size,
 	if (dac_allowed) {
 		ret = paddr + alpha_mv.pci_dac_offset;
 
-		DBGA2("pci_map_single: [%p,%zx] -> DAC %llx from %ps\n",
-		      cpu_addr, size, ret, __builtin_return_address(0));
+		DBGA2("pci_map_single: [%pa,%zx] -> DAC %llx from %ps\n",
+		      &paddr, size, ret, __builtin_return_address(0));
 
 		return ret;
 	}
@@ -290,10 +288,10 @@ pci_map_single_1(struct pci_dev *pdev, void *cpu_addr, size_t size,
 		arena->ptes[i + dma_ofs] = mk_iommu_pte(paddr);
 
 	ret = arena->dma_base + dma_ofs * PAGE_SIZE;
-	ret += (unsigned long)cpu_addr & ~PAGE_MASK;
+	ret += offset;
 
-	DBGA2("pci_map_single: [%p,%zx] np %ld -> sg %llx from %ps\n",
-	      cpu_addr, size, npages, ret, __builtin_return_address(0));
+	DBGA2("pci_map_single: [%pa,%zx] np %ld -> sg %llx from %ps\n",
+	      &paddr, size, npages, ret, __builtin_return_address(0));
 
 	return ret;
 }
@@ -322,19 +320,18 @@ static struct pci_dev *alpha_gendev_to_pci(struct device *dev)
 	return NULL;
 }
 
-static dma_addr_t alpha_pci_map_page(struct device *dev, struct page *page,
-				     unsigned long offset, size_t size,
-				     enum dma_data_direction dir,
+static dma_addr_t alpha_pci_map_phys(struct device *dev, phys_addr_t phys,
+				     size_t size, enum dma_data_direction dir,
 				     unsigned long attrs)
 {
 	struct pci_dev *pdev = alpha_gendev_to_pci(dev);
 	int dac_allowed;
 
-	BUG_ON(dir == DMA_NONE);
+	if (attrs & DMA_ATTR_MMIO)
+		return DMA_MAPPING_ERROR;
 
-	dac_allowed = pdev ? pci_dac_dma_supported(pdev, pdev->dma_mask) : 0; 
-	return pci_map_single_1(pdev, (char *)page_address(page) + offset, 
-				size, dac_allowed);
+	dac_allowed = pdev ? pci_dac_dma_supported(pdev, pdev->dma_mask) : 0;
+	return pci_map_single_1(pdev, phys, size, dac_allowed);
 }
 
 /* Unmap a single streaming mode DMA translation.  The DMA_ADDR and
@@ -343,7 +340,7 @@ static dma_addr_t alpha_pci_map_page(struct device *dev, struct page *page,
    the cpu to the buffer are guaranteed to see whatever the device
    wrote there.  */
 
-static void alpha_pci_unmap_page(struct device *dev, dma_addr_t dma_addr,
+static void alpha_pci_unmap_phys(struct device *dev, dma_addr_t dma_addr,
 				 size_t size, enum dma_data_direction dir,
 				 unsigned long attrs)
 {
@@ -353,8 +350,6 @@ static void alpha_pci_unmap_page(struct device *dev, dma_addr_t dma_addr,
 	struct pci_iommu_arena *arena;
 	long dma_ofs, npages;
 
-	BUG_ON(dir == DMA_NONE);
-
 	if (dma_addr >= __direct_map_base
 	    && dma_addr < __direct_map_base + __direct_map_size) {
 		/* Nothing to do.  */
@@ -429,7 +424,7 @@ static void *alpha_pci_alloc_coherent(struct device *dev, size_t size,
 	}
 	memset(cpu_addr, 0, size);
 
-	*dma_addrp = pci_map_single_1(pdev, cpu_addr, size, 0);
+	*dma_addrp = pci_map_single_1(pdev, virt_to_phys(cpu_addr), size, 0);
 	if (*dma_addrp == DMA_MAPPING_ERROR) {
 		free_pages((unsigned long)cpu_addr, order);
 		if (alpha_mv.mv_pci_tbi || (gfp & GFP_DMA))
@@ -643,9 +638,8 @@ static int alpha_pci_map_sg(struct device *dev, struct scatterlist *sg,
 	/* Fast path single entry scatterlists.  */
 	if (nents == 1) {
 		sg->dma_length = sg->length;
-		sg->dma_address
-		  = pci_map_single_1(pdev, SG_ENT_VIRT_ADDRESS(sg),
-				     sg->length, dac_allowed);
+		sg->dma_address = pci_map_single_1(pdev, sg_phys(sg),
+						   sg->length, dac_allowed);
 		if (sg->dma_address == DMA_MAPPING_ERROR)
 			return -EIO;
 		return 1;
@@ -917,8 +911,8 @@ iommu_unbind(struct pci_iommu_arena *arena, long pg_start, long pg_count)
 const struct dma_map_ops alpha_pci_ops = {
 	.alloc			= alpha_pci_alloc_coherent,
 	.free			= alpha_pci_free_coherent,
-	.map_page		= alpha_pci_map_page,
-	.unmap_page		= alpha_pci_unmap_page,
+	.map_phys		= alpha_pci_map_phys,
+	.unmap_phys		= alpha_pci_unmap_phys,
 	.map_sg			= alpha_pci_map_sg,
 	.unmap_sg		= alpha_pci_unmap_sg,
 	.dma_supported		= alpha_pci_supported,
-- 
2.51.0


