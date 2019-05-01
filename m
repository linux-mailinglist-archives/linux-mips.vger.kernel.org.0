Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B13310830
	for <lists+linux-mips@lfdr.de>; Wed,  1 May 2019 15:14:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726145AbfEANN6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 1 May 2019 09:13:58 -0400
Received: from verein.lst.de ([213.95.11.211]:52884 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725993AbfEANN6 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 1 May 2019 09:13:58 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id 6CF0168AFE; Wed,  1 May 2019 15:13:39 +0200 (CEST)
Date:   Wed, 1 May 2019 15:13:39 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Paul Burton <paul.burton@mips.com>
Cc:     Christoph Hellwig <hch@lst.de>, Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Ley Foon Tan <lftan@altera.com>,
        Michal Simek <monstr@monstr.eu>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>
Subject: [PATCH 5/7 v2] MIPS: use the generic uncached segment support in
 dma-direct
Message-ID: <20190501131339.GA890@lst.de>
References: <20190430110032.25301-1-hch@lst.de> <20190430110032.25301-6-hch@lst.de> <20190430201041.536amvinrcvd2wua@pburton-laptop> <20190430202947.GA30262@lst.de> <20190430211105.ielntedm46uqamca@pburton-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190430211105.ielntedm46uqamca@pburton-laptop>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Stop providing our arch alloc/free hooks and just expose the segment
offset instead.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/mips/Kconfig              |  1 +
 arch/mips/include/asm/page.h   |  3 ---
 arch/mips/jazz/jazzdma.c       |  6 ------
 arch/mips/mm/dma-noncoherent.c | 26 +++++++++-----------------
 4 files changed, 10 insertions(+), 26 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 4a5f5b0ee9a9..cde4b490f3c7 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -9,6 +9,7 @@ config MIPS
 	select ARCH_HAS_ELF_RANDOMIZE
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
+	select ARCH_HAS_UNCACHED_SEGMENT
 	select ARCH_SUPPORTS_UPROBES
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_CMPXCHG_LOCKREF if 64BIT
diff --git a/arch/mips/include/asm/page.h b/arch/mips/include/asm/page.h
index 6b31c93b5eaa..23e0f1386e04 100644
--- a/arch/mips/include/asm/page.h
+++ b/arch/mips/include/asm/page.h
@@ -258,9 +258,6 @@ extern int __virt_addr_valid(const volatile void *kaddr);
 	 ((current->personality & READ_IMPLIES_EXEC) ? VM_EXEC : 0) | \
 	 VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
 
-#define UNCAC_ADDR(addr)	(UNCAC_BASE + __pa(addr))
-#define CAC_ADDR(addr)		((unsigned long)__va((addr) - UNCAC_BASE))
-
 #include <asm-generic/memory_model.h>
 #include <asm-generic/getorder.h>
 
diff --git a/arch/mips/jazz/jazzdma.c b/arch/mips/jazz/jazzdma.c
index bedb5047aff3..1804dc9d8136 100644
--- a/arch/mips/jazz/jazzdma.c
+++ b/arch/mips/jazz/jazzdma.c
@@ -575,10 +575,6 @@ static void *jazz_dma_alloc(struct device *dev, size_t size,
 		return NULL;
 	}
 
-	if (!(attrs & DMA_ATTR_NON_CONSISTENT)) {
-		dma_cache_wback_inv((unsigned long)ret, size);
-		ret = (void *)UNCAC_ADDR(ret);
-	}
 	return ret;
 }
 
@@ -586,8 +582,6 @@ static void jazz_dma_free(struct device *dev, size_t size, void *vaddr,
 		dma_addr_t dma_handle, unsigned long attrs)
 {
 	vdma_free(dma_handle);
-	if (!(attrs & DMA_ATTR_NON_CONSISTENT))
-		vaddr = (void *)CAC_ADDR((unsigned long)vaddr);
 	dma_direct_free_pages(dev, size, vaddr, dma_handle, attrs);
 }
 
diff --git a/arch/mips/mm/dma-noncoherent.c b/arch/mips/mm/dma-noncoherent.c
index f9549d2fbea3..ed56c6fa7be2 100644
--- a/arch/mips/mm/dma-noncoherent.c
+++ b/arch/mips/mm/dma-noncoherent.c
@@ -44,33 +44,25 @@ static inline bool cpu_needs_post_dma_flush(struct device *dev)
 	}
 }
 
-void *arch_dma_alloc(struct device *dev, size_t size,
-		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
+void arch_dma_prep_coherent(struct page *page, size_t size)
 {
-	void *ret;
-
-	ret = dma_direct_alloc_pages(dev, size, dma_handle, gfp, attrs);
-	if (ret && !(attrs & DMA_ATTR_NON_CONSISTENT)) {
-		dma_cache_wback_inv((unsigned long) ret, size);
-		ret = (void *)UNCAC_ADDR(ret);
-	}
+	dma_cache_wback_inv((unsigned long)page_address(page), size);
+}
 
-	return ret;
+void *uncached_kernel_address(void *addr)
+{
+	return (void *)(__pa(addr) + UNCAC_BASE);
 }
 
-void arch_dma_free(struct device *dev, size_t size, void *cpu_addr,
-		dma_addr_t dma_addr, unsigned long attrs)
+void *cached_kernel_address(void *addr)
 {
-	if (!(attrs & DMA_ATTR_NON_CONSISTENT))
-		cpu_addr = (void *)CAC_ADDR((unsigned long)cpu_addr);
-	dma_direct_free_pages(dev, size, cpu_addr, dma_addr, attrs);
+	return __va(addr) - UNCAC_BASE;
 }
 
 long arch_dma_coherent_to_pfn(struct device *dev, void *cpu_addr,
 		dma_addr_t dma_addr)
 {
-	unsigned long addr = CAC_ADDR((unsigned long)cpu_addr);
-	return page_to_pfn(virt_to_page((void *)addr));
+	return page_to_pfn(virt_to_page(cached_kernel_address(cpu_addr)));
 }
 
 pgprot_t arch_dma_mmap_pgprot(struct device *dev, pgprot_t prot,
-- 
2.20.1

