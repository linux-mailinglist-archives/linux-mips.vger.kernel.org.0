Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 939A6328E3
	for <lists+linux-mips@lfdr.de>; Mon,  3 Jun 2019 08:53:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727328AbfFCGxd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 3 Jun 2019 02:53:33 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:51634 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726550AbfFCGxd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 3 Jun 2019 02:53:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
        :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=UGV5V9mab2J2kyV4g/HSefYdLaD7GjMaiN7BGb1uNJE=; b=gAa1IT8tANyABzyuT9+Df19DPl
        U6kx0rqep7AUj2HO8y2TSfK02Dk5cshCpVlwdrTtYi7JAZs7s5xM+Itiul3XT7JweZ9VWf3Vs93s1
        u4wZtYfTWstDM1rG95h6C/aS0gZN48/F9gOR5sYA/gUfIcAlJyY5LrG4nIjrx6t6I89Lf4mREbcjV
        FXkhpBKarApOqw57N7umDUaWNmwnXxfwAEL9Qbo05zSbKjEY/PWM3BWpjClR7HXa+f8ogF8W1HkP7
        +HIAw9xrrEhSgq5OqjDqJKKugiKof5AXz2ETXXypYHglquMYkFKjEnQMkMxrnvkbfRk2oZcIBDyOd
        td9vanvg==;
Received: from 089144193064.atnat0002.highway.a1.net ([89.144.193.64] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hXgqa-00064v-IJ; Mon, 03 Jun 2019 06:53:32 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Ley Foon Tan <lftan@altera.com>, Michal Simek <monstr@monstr.eu>
Cc:     linux-mips@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] microblaze: use the generic uncached segment support in dma-direct
Date:   Mon,  3 Jun 2019 08:53:24 +0200
Message-Id: <20190603065324.9724-3-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190603065324.9724-1-hch@lst.de>
References: <20190603065324.9724-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Stop providing our own arch alloc/free hooks for nommu platforms and
just expose the segment offset and use the generic dma-direct
allocator.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/microblaze/Kconfig         |  2 +
 arch/microblaze/mm/consistent.c | 97 +++++++++++++++------------------
 2 files changed, 47 insertions(+), 52 deletions(-)

diff --git a/arch/microblaze/Kconfig b/arch/microblaze/Kconfig
index f11433daab4a..7dc7f264ccfa 100644
--- a/arch/microblaze/Kconfig
+++ b/arch/microblaze/Kconfig
@@ -4,9 +4,11 @@ config MICROBLAZE
 	select ARCH_32BIT_OFF_T
 	select ARCH_NO_SWAP
 	select ARCH_HAS_DMA_COHERENT_TO_PFN if MMU
+	select ARCH_HAS_DMA_PREP_COHERENT
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_SYNC_DMA_FOR_CPU
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
+	select ARCH_HAS_UNCACHED_SEGMENT if !MMU
 	select ARCH_MIGHT_HAVE_PC_PARPORT
 	select ARCH_NO_COHERENT_DMA_MMAP if !MMU
 	select ARCH_WANT_IPC_PARSE_VERSION
diff --git a/arch/microblaze/mm/consistent.c b/arch/microblaze/mm/consistent.c
index 3002cbca3059..a525194a754e 100644
--- a/arch/microblaze/mm/consistent.c
+++ b/arch/microblaze/mm/consistent.c
@@ -45,21 +45,52 @@
 #include <asm/cpuinfo.h>
 #include <asm/tlbflush.h>
 
-#ifndef CONFIG_MMU
-/* I have to use dcache values because I can't relate on ram size */
-# define UNCACHED_SHADOW_MASK (cpuinfo.dcache_high - cpuinfo.dcache_base + 1)
-#endif
+void arch_dma_prep_coherent(struct page *page, size_t size)
+{
+	phys_addr_t paddr = page_to_phys(page);
+
+	flush_dcache_range(paddr, paddr + size);
+}
 
+#ifndef CONFIG_MMU
 /*
- * Consistent memory allocators. Used for DMA devices that want to
- * share uncached memory with the processor core.
- * My crufty no-MMU approach is simple. In the HW platform we can optionally
- * mirror the DDR up above the processor cacheable region.  So, memory accessed
- * in this mirror region will not be cached.  It's alloced from the same
- * pool as normal memory, but the handle we return is shifted up into the
- * uncached region.  This will no doubt cause big problems if memory allocated
- * here is not also freed properly. -- JW
+ * Consistent memory allocators. Used for DMA devices that want to share
+ * uncached memory with the processor core.  My crufty no-MMU approach is
+ * simple.  In the HW platform we can optionally mirror the DDR up above the
+ * processor cacheable region.  So, memory accessed in this mirror region will
+ * not be cached.  It's alloced from the same pool as normal memory, but the
+ * handle we return is shifted up into the uncached region.  This will no doubt
+ * cause big problems if memory allocated here is not also freed properly. -- JW
+ *
+ * I have to use dcache values because I can't relate on ram size:
  */
+#ifdef CONFIG_XILINX_UNCACHED_SHADOW
+#define UNCACHED_SHADOW_MASK (cpuinfo.dcache_high - cpuinfo.dcache_base + 1)
+#else
+#define UNCACHED_SHADOW_MASK 0
+#endif /* CONFIG_XILINX_UNCACHED_SHADOW */
+
+void *uncached_kernel_address(void *ptr)
+{
+	unsigned long addr = (unsigned long)ptr;
+	
+	addr |= UNCACHED_SHADOW_MASK;
+	if (addr > cpuinfo.dcache_base && addr < cpuinfo.dcache_high)
+		pr_warn("ERROR: Your cache coherent area is CACHED!!!\n");
+	return (void *)addr;
+}
+
+void *cached_kernel_address(void *ptr)
+{
+	unsigned long addr = (unsigned long)ptr;
+
+	addr &= ~UNCACHED_SHADOW_MASK;
+
+	return (void *)addr;
+}
+
+#else /* CONFIG_MMU */
+
 void *arch_dma_alloc(struct device *dev, size_t size, dma_addr_t *dma_handle,
 		gfp_t gfp, unsigned long attrs)
 {
@@ -67,12 +98,9 @@ void *arch_dma_alloc(struct device *dev, size_t size, dma_addr_t *dma_handle,
 	void *ret;
 	unsigned int i, err = 0;
 	struct page *page, *end;
-
-#ifdef CONFIG_MMU
 	phys_addr_t pa;
 	struct vm_struct *area;
 	unsigned long va;
-#endif
 
 	if (in_interrupt())
 		BUG();
@@ -89,26 +117,8 @@ void *arch_dma_alloc(struct device *dev, size_t size, dma_addr_t *dma_handle,
 	 * we need to ensure that there are no cachelines in use,
 	 * or worse dirty in this area.
 	 */
-	flush_dcache_range(virt_to_phys((void *)vaddr),
-					virt_to_phys((void *)vaddr) + size);
-
-#ifndef CONFIG_MMU
-	ret = (void *)vaddr;
-	/*
-	 * Here's the magic!  Note if the uncached shadow is not implemented,
-	 * it's up to the calling code to also test that condition and make
-	 * other arranegments, such as manually flushing the cache and so on.
-	 */
-# ifdef CONFIG_XILINX_UNCACHED_SHADOW
-	ret = (void *)((unsigned) ret | UNCACHED_SHADOW_MASK);
-# endif
-	if ((unsigned int)ret > cpuinfo.dcache_base &&
-				(unsigned int)ret < cpuinfo.dcache_high)
-		pr_warn("ERROR: Your cache coherent area is CACHED!!!\n");
+	arch_dma_prep_coherent(virt_to_page((unsigned long)vaddr), size);
 
-	/* dma_handle is same as physical (shadowed) address */
-	*dma_handle = (dma_addr_t)ret;
-#else
 	/* Allocate some common virtual space to map the new pages. */
 	area = get_vm_area(size, VM_ALLOC);
 	if (!area) {
@@ -120,7 +130,6 @@ void *arch_dma_alloc(struct device *dev, size_t size, dma_addr_t *dma_handle,
 
 	/* This gives us the real physical address of the first page. */
 	*dma_handle = pa = __virt_to_phys(vaddr);
-#endif
 
 	/*
 	 * free wasted pages.  We skip the first page since we know
@@ -134,10 +143,8 @@ void *arch_dma_alloc(struct device *dev, size_t size, dma_addr_t *dma_handle,
 	split_page(page, order);
 
 	for (i = 0; i < size && err == 0; i += PAGE_SIZE) {
-#ifdef CONFIG_MMU
 		/* MS: This is the whole magic - use cache inhibit pages */
 		err = map_page(va + i, pa + i, _PAGE_KERNEL | _PAGE_NO_CACHE);
-#endif
 
 		SetPageReserved(page);
 		page++;
@@ -157,7 +164,6 @@ void *arch_dma_alloc(struct device *dev, size_t size, dma_addr_t *dma_handle,
 	return ret;
 }
 
-#ifdef CONFIG_MMU
 static pte_t *consistent_virt_to_pte(void *vaddr)
 {
 	unsigned long addr = (unsigned long)vaddr;
@@ -175,7 +181,6 @@ long arch_dma_coherent_to_pfn(struct device *dev, void *vaddr,
 
 	return pte_pfn(*ptep);
 }
-#endif
 
 /*
  * free page(s) as defined by the above mapping.
@@ -190,18 +195,6 @@ void arch_dma_free(struct device *dev, size_t size, void *vaddr,
 
 	size = PAGE_ALIGN(size);
 
-#ifndef CONFIG_MMU
-	/* Clear SHADOW_MASK bit in address, and free as per usual */
-# ifdef CONFIG_XILINX_UNCACHED_SHADOW
-	vaddr = (void *)((unsigned)vaddr & ~UNCACHED_SHADOW_MASK);
-# endif
-	page = virt_to_page(vaddr);
-
-	do {
-		__free_reserved_page(page);
-		page++;
-	} while (size -= PAGE_SIZE);
-#else
 	do {
 		pte_t *ptep = consistent_virt_to_pte(vaddr);
 		unsigned long pfn;
@@ -219,5 +212,5 @@ void arch_dma_free(struct device *dev, size_t size, void *vaddr,
 
 	/* flush tlb */
 	flush_tlb_all();
-#endif
 }
+#endif /* CONFIG_MMU */
-- 
2.20.1

