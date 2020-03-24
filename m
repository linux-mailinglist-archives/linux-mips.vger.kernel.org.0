Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18C7019161A
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2020 17:20:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728817AbgCXQUD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 24 Mar 2020 12:20:03 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:55790 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727444AbgCXQUC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 24 Mar 2020 12:20:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=ra8fh5EfKLWroTBF+kGRKZFmzx8N1zRxk5+K8iQb9NE=; b=NWzQQaZOguX+S5an6JDzbnjMxy
        miZnzmvWv8YWPrZKrb6fglGzx6gk+tSVSSy7TLy53iAYfH6LL2TCnGKVdnri4UB6ViJg2kvC81/Qg
        9hDGqRUrn0pwlwTnCpjVyDCaUn3vfluAI/wpBuKk5h4Wk7GL7yzEwnRjLWN0K36Mi8tI2mJSlffLJ
        C+E2Sfvxi34bLvKXY3b0dQheKIOOVGZG3zXbeWu9bg/oFf+vBpgYMRnmDqSoe4UZwEKzdkKmQK+yJ
        fMw6DnKFBWcbj3iW7Zk1RcjXV2A3qkGPBuZWx4sBBqOcWJSoBzn4Y9pCfXcHjk3SFlPrNu2XIc4l0
        tKO3Gdxw==;
Received: from [2001:4bb8:18c:2a9e:999c:283e:b14a:9189] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jGmHZ-0003Ih-BP; Tue, 24 Mar 2020 16:20:01 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] MIPS: move ioremap_prot und iounmap out of line
Date:   Tue, 24 Mar 2020 17:15:24 +0100
Message-Id: <20200324161525.754181-6-hch@lst.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200324161525.754181-1-hch@lst.de>
References: <20200324161525.754181-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Neither of these interfaces is anywhere near the fast path.  Move them
out of line and avoid exposing implementation details to the drivers.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/mips/include/asm/io.h | 86 ++------------------------------------
 arch/mips/mm/Makefile      |  2 +-
 arch/mips/mm/ioremap.c     | 45 ++++++++++----------
 arch/mips/mm/ioremap64.c   | 23 ++++++++++
 4 files changed, 49 insertions(+), 107 deletions(-)
 create mode 100644 arch/mips/mm/ioremap64.c

diff --git a/arch/mips/include/asm/io.h b/arch/mips/include/asm/io.h
index f007571e036d..346fffd9e972 100644
--- a/arch/mips/include/asm/io.h
+++ b/arch/mips/include/asm/io.h
@@ -30,8 +30,6 @@
 #include <asm/pgtable-bits.h>
 #include <asm/processor.h>
 #include <asm/string.h>
-
-#include <ioremap.h>
 #include <mangle-port.h>
 
 /*
@@ -153,87 +151,9 @@ static inline void *isa_bus_to_virt(unsigned long address)
  */
 #define page_to_phys(page)	((dma_addr_t)page_to_pfn(page) << PAGE_SHIFT)
 
-#ifdef CONFIG_64BIT
-static inline void __iomem *ioremap_prot(phys_addr_t offset,
-		unsigned long size, unsigned long prot_val)
-{
-	unsigned long flags = prot_val & _CACHE_MASK;
-	u64 base = (flags == _CACHE_UNCACHED ? IO_BASE : UNCAC_BASE);
-	void __iomem *addr;
-
-	addr = plat_ioremap(offset, size, flags);
-	if (!addr)
-		addr = (void __iomem *)(unsigned long)(base + offset);
-	return addr;
-}
-
-static inline void iounmap(const volatile void __iomem *addr)
-{
-	plat_iounmap(addr);
-}
-#else /* CONFIG_64BIT */
-extern void __iomem * __ioremap(phys_addr_t offset, phys_addr_t size, unsigned long flags);
-extern void __iounmap(const volatile void __iomem *addr);
-
-/*
- * ioremap_prot     -   map bus memory into CPU space
- * @offset:    bus address of the memory
- * @size:      size of the resource to map
-
- * ioremap_prot gives the caller control over cache coherency attributes (CCA)
- */
-static inline void __iomem *ioremap_prot(phys_addr_t offset,
-		unsigned long size, unsigned long prot_val)
-{
-	unsigned long flags = prot_val & _CACHE_MASK;
-	void __iomem *addr = plat_ioremap(offset, size, flags);
-
-	if (addr)
-		return addr;
-
-#define __IS_LOW512(addr) (!((phys_addr_t)(addr) & (phys_addr_t) ~0x1fffffffULL))
-
-	if (__builtin_constant_p(offset) &&
-	    __builtin_constant_p(size) && __builtin_constant_p(flags)) {
-		phys_addr_t phys_addr, last_addr;
-
-		phys_addr = fixup_bigphys_addr(offset, size);
-
-		/* Don't allow wraparound or zero size. */
-		last_addr = phys_addr + size - 1;
-		if (!size || last_addr < phys_addr)
-			return NULL;
-
-		/*
-		 * Map uncached objects in the low 512MB of address
-		 * space using KSEG1.
-		 */
-		if (__IS_LOW512(phys_addr) && __IS_LOW512(last_addr) &&
-		    flags == _CACHE_UNCACHED)
-			return (void __iomem *)
-				(unsigned long)CKSEG1ADDR(phys_addr);
-	}
-
-	return __ioremap(offset, size, flags);
-
-#undef __IS_LOW512
-}
-
-static inline void iounmap(const volatile void __iomem *addr)
-{
-	if (plat_iounmap(addr))
-		return;
-
-#define __IS_KSEG1(addr) (((unsigned long)(addr) & ~0x1fffffffUL) == CKSEG1)
-
-	if (__builtin_constant_p(addr) && __IS_KSEG1(addr))
-		return;
-
-	__iounmap(addr);
-
-#undef __IS_KSEG1
-}
-#endif /* !CONFIG_64BIT */
+void __iomem *ioremap_prot(phys_addr_t offset, unsigned long size,
+		unsigned long prot_val);
+void iounmap(const volatile void __iomem *addr);
 
 /*
  * ioremap     -   map bus memory into CPU space
diff --git a/arch/mips/mm/Makefile b/arch/mips/mm/Makefile
index 46f483e952c8..865926a37775 100644
--- a/arch/mips/mm/Makefile
+++ b/arch/mips/mm/Makefile
@@ -23,7 +23,7 @@ obj-y				+= uasm-mips.o
 endif
 
 obj-$(CONFIG_32BIT)		+= ioremap.o pgtable-32.o
-obj-$(CONFIG_64BIT)		+= pgtable-64.o
+obj-$(CONFIG_64BIT)		+= ioremap64.o pgtable-64.o
 obj-$(CONFIG_HIGHMEM)		+= highmem.o
 obj-$(CONFIG_HUGETLB_PAGE)	+= hugetlbpage.o
 obj-$(CONFIG_DMA_NONCOHERENT)	+= dma-noncoherent.o
diff --git a/arch/mips/mm/ioremap.c b/arch/mips/mm/ioremap.c
index 8317f337a86e..c5b5181c7cd0 100644
--- a/arch/mips/mm/ioremap.c
+++ b/arch/mips/mm/ioremap.c
@@ -17,6 +17,10 @@
 #include <asm/cacheflush.h>
 #include <asm/io.h>
 #include <asm/tlbflush.h>
+#include <ioremap.h>
+
+#define IS_LOW512(addr) (!((phys_addr_t)(addr) & (phys_addr_t) ~0x1fffffffULL))
+#define IS_KSEG1(addr) (((unsigned long)(addr) & ~0x1fffffffUL) == CKSEG1)
 
 static inline void remap_area_pte(pte_t * pte, unsigned long address,
 	phys_addr_t size, phys_addr_t phys_addr, unsigned long flags)
@@ -118,27 +122,25 @@ static int __ioremap_check_ram(unsigned long start_pfn, unsigned long nr_pages,
 }
 
 /*
- * Generic mapping function (not visible outside):
- */
-
-/*
- * Remap an arbitrary physical address space into the kernel virtual
- * address space. Needed when the kernel wants to access high addresses
- * directly.
+ * ioremap_prot     -   map bus memory into CPU space
+ * @phys_addr:    bus address of the memory
+ * @size:      size of the resource to map
  *
- * NOTE! We need to allow non-page-aligned mappings too: we will obviously
- * have to convert them into an offset in a page-aligned mapping, but the
- * caller shouldn't need to know that small detail.
+ * ioremap_prot gives the caller control over cache coherency attributes (CCA)
  */
-
-#define IS_LOW512(addr) (!((phys_addr_t)(addr) & (phys_addr_t) ~0x1fffffffULL))
-
-void __iomem * __ioremap(phys_addr_t phys_addr, phys_addr_t size, unsigned long flags)
+void __iomem *ioremap_prot(phys_addr_t phys_addr, unsigned long size,
+		unsigned long prot_val)
 {
+	unsigned long flags = prot_val & _CACHE_MASK;
 	unsigned long offset, pfn, last_pfn;
-	struct vm_struct * area;
+	struct vm_struct *area;
 	phys_addr_t last_addr;
-	void * addr;
+	void *addr;
+	void __iomem *cpu_addr;
+
+	cpu_addr = plat_ioremap(phys_addr, size, flags);
+	if (cpu_addr)
+		return cpu_addr;
 
 	phys_addr = fixup_bigphys_addr(phys_addr, size);
 
@@ -189,14 +191,13 @@ void __iomem * __ioremap(phys_addr_t phys_addr, phys_addr_t size, unsigned long
 
 	return (void __iomem *) (offset + (char *)addr);
 }
+EXPORT_SYMBOL(ioremap_prot);
 
-#define IS_KSEG1(addr) (((unsigned long)(addr) & ~0x1fffffffUL) == CKSEG1)
-
-void __iounmap(const volatile void __iomem *addr)
+void iounmap(const volatile void __iomem *addr)
 {
 	struct vm_struct *p;
 
-	if (IS_KSEG1(addr))
+	if (plat_iounmap(addr) || IS_KSEG1(addr))
 		return;
 
 	p = remove_vm_area((void *) (PAGE_MASK & (unsigned long __force) addr));
@@ -205,6 +206,4 @@ void __iounmap(const volatile void __iomem *addr)
 
 	kfree(p);
 }
-
-EXPORT_SYMBOL(__ioremap);
-EXPORT_SYMBOL(__iounmap);
+EXPORT_SYMBOL(iounmap);
diff --git a/arch/mips/mm/ioremap64.c b/arch/mips/mm/ioremap64.c
new file mode 100644
index 000000000000..15e7820d6a5f
--- /dev/null
+++ b/arch/mips/mm/ioremap64.c
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <linux/io.h>
+#include <ioremap.h>
+
+void __iomem *ioremap_prot(phys_addr_t offset, unsigned long size,
+		unsigned long prot_val)
+{
+	unsigned long flags = prot_val & _CACHE_MASK;
+	u64 base = (flags == _CACHE_UNCACHED ? IO_BASE : UNCAC_BASE);
+	void __iomem *addr;
+
+	addr = plat_ioremap(offset, size, flags);
+	if (!addr)
+		addr = (void __iomem *)(unsigned long)(base + offset);
+	return addr;
+}
+EXPORT_SYMBOL(ioremap_prot);
+
+void iounmap(const volatile void __iomem *addr)
+{
+	plat_iounmap(addr);
+}
+EXPORT_SYMBOL(iounmap);
-- 
2.25.1

