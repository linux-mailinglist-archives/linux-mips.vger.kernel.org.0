Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 880CF2A4A3
	for <lists+linux-mips@lfdr.de>; Sat, 25 May 2019 15:32:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727070AbfEYNc0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 25 May 2019 09:32:26 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:50442 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727059AbfEYNc0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 25 May 2019 09:32:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
        :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=QKVBbQ5hgk52CNIynfl61ZRTkUz1QI9cVbx1xyoJ60A=; b=ltH4iEbSKpJdZfFd6LbQAuw6B0
        b/pwHOJxuhDeV9bkdFtAEvO59vKKPkYYrt9EDb+OotWfL15l1nxUrPqLLBcS76WzTp2cXzgxK2kzw
        KtAsLaEb3vgUMbY6HGh4+G1AeAEsH/ydiTc+5vcc9rDRbisuSW4e9olcUDfwDs12kVvLSbC79uLkh
        tSgLvX8yy2vu4lafGhkLbINVowbf1IpJWfd51KMPTbK0XYuY9RNIzTYKL52ahb9tVQKdmiUfUpaAz
        ODxmIj9NypE1PBVE8q3rMMse1g4gvRqrvTUHymXkIAOp5/t/jtsWq+kJzxcoXyiGaBe7ACnK9bVcf
        mDhKAUSw==;
Received: from 213-225-10-46.nat.highway.a1.net ([213.225.10.46] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hUWmc-0006ZE-56; Sat, 25 May 2019 13:32:22 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>
Cc:     Nicholas Piggin <npiggin@gmail.com>, linux-mips@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] sparc64: use the generic get_user_pages_fast code
Date:   Sat, 25 May 2019 15:32:02 +0200
Message-Id: <20190525133203.25853-6-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190525133203.25853-1-hch@lst.de>
References: <20190525133203.25853-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The sparc64 code is mostly equivalent to the generic one, minus various
bugfixes and two arch overrides that this patch adds to pgtable.h.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/sparc/Kconfig                  |   1 +
 arch/sparc/include/asm/pgtable_64.h |  40 ++++
 arch/sparc/mm/Makefile              |   2 +-
 arch/sparc/mm/gup.c                 | 340 ----------------------------
 4 files changed, 42 insertions(+), 341 deletions(-)
 delete mode 100644 arch/sparc/mm/gup.c

diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index 26ab6f5bbaaf..22435471f942 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -28,6 +28,7 @@ config SPARC
 	select RTC_DRV_M48T59
 	select RTC_SYSTOHC
 	select HAVE_ARCH_JUMP_LABEL if SPARC64
+	select HAVE_GENERIC_GUP if SPARC64
 	select GENERIC_IRQ_SHOW
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select GENERIC_PCI_IOMAP
diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/asm/pgtable_64.h
index 22500c3be7a9..753d1417bae1 100644
--- a/arch/sparc/include/asm/pgtable_64.h
+++ b/arch/sparc/include/asm/pgtable_64.h
@@ -1075,6 +1075,46 @@ static inline int io_remap_pfn_range(struct vm_area_struct *vma,
 }
 #define io_remap_pfn_range io_remap_pfn_range 
 
+static inline unsigned long gup_fixup_start_addr(unsigned long start)
+{
+	if (adi_capable()) {
+		long addr = start;
+
+		/* If userspace has passed a versioned address, kernel
+		 * will not find it in the VMAs since it does not store
+		 * the version tags in the list of VMAs. Storing version
+		 * tags in list of VMAs is impractical since they can be
+		 * changed any time from userspace without dropping into
+		 * kernel. Any address search in VMAs will be done with
+		 * non-versioned addresses. Ensure the ADI version bits
+		 * are dropped here by sign extending the last bit before
+		 * ADI bits. IOMMU does not implement version tags.
+		 */
+		return (addr << (long)adi_nbits()) >> (long)adi_nbits();
+	}
+
+	return start;
+}
+#define gup_fixup_start_addr gup_fixup_start_addr
+
+static inline bool pte_access_permitted(pte_t pte, bool write)
+{
+	u64 prot;
+
+	if (tlb_type == hypervisor) {
+		prot = _PAGE_PRESENT_4V | _PAGE_P_4V;
+		if (prot)
+			prot |= _PAGE_WRITE_4V;
+	} else {
+		prot = _PAGE_PRESENT_4U | _PAGE_P_4U;
+		if (write)
+			prot |= _PAGE_WRITE_4U;
+	}
+
+	return (pte_val(pte) & (prot | _PAGE_SPECIAL)) == prot;
+}
+#define pte_access_permitted pte_access_permitted
+
 #include <asm/tlbflush.h>
 #include <asm-generic/pgtable.h>
 
diff --git a/arch/sparc/mm/Makefile b/arch/sparc/mm/Makefile
index d39075b1e3b7..b078205b70e0 100644
--- a/arch/sparc/mm/Makefile
+++ b/arch/sparc/mm/Makefile
@@ -5,7 +5,7 @@
 asflags-y := -ansi
 ccflags-y := -Werror
 
-obj-$(CONFIG_SPARC64)   += ultra.o tlb.o tsb.o gup.o
+obj-$(CONFIG_SPARC64)   += ultra.o tlb.o tsb.o
 obj-y                   += fault_$(BITS).o
 obj-y                   += init_$(BITS).o
 obj-$(CONFIG_SPARC32)   += extable.o srmmu.o iommu.o io-unit.o
diff --git a/arch/sparc/mm/gup.c b/arch/sparc/mm/gup.c
deleted file mode 100644
index 1e770a517d4a..000000000000
--- a/arch/sparc/mm/gup.c
+++ /dev/null
@@ -1,340 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Lockless get_user_pages_fast for sparc, cribbed from powerpc
- *
- * Copyright (C) 2008 Nick Piggin
- * Copyright (C) 2008 Novell Inc.
- */
-
-#include <linux/sched.h>
-#include <linux/mm.h>
-#include <linux/vmstat.h>
-#include <linux/pagemap.h>
-#include <linux/rwsem.h>
-#include <asm/pgtable.h>
-#include <asm/adi.h>
-
-/*
- * The performance critical leaf functions are made noinline otherwise gcc
- * inlines everything into a single function which results in too much
- * register pressure.
- */
-static noinline int gup_pte_range(pmd_t pmd, unsigned long addr,
-		unsigned long end, int write, struct page **pages, int *nr)
-{
-	unsigned long mask, result;
-	pte_t *ptep;
-
-	if (tlb_type == hypervisor) {
-		result = _PAGE_PRESENT_4V|_PAGE_P_4V;
-		if (write)
-			result |= _PAGE_WRITE_4V;
-	} else {
-		result = _PAGE_PRESENT_4U|_PAGE_P_4U;
-		if (write)
-			result |= _PAGE_WRITE_4U;
-	}
-	mask = result | _PAGE_SPECIAL;
-
-	ptep = pte_offset_kernel(&pmd, addr);
-	do {
-		struct page *page, *head;
-		pte_t pte = *ptep;
-
-		if ((pte_val(pte) & mask) != result)
-			return 0;
-		VM_BUG_ON(!pfn_valid(pte_pfn(pte)));
-
-		/* The hugepage case is simplified on sparc64 because
-		 * we encode the sub-page pfn offsets into the
-		 * hugepage PTEs.  We could optimize this in the future
-		 * use page_cache_add_speculative() for the hugepage case.
-		 */
-		page = pte_page(pte);
-		head = compound_head(page);
-		if (!page_cache_get_speculative(head))
-			return 0;
-		if (unlikely(pte_val(pte) != pte_val(*ptep))) {
-			put_page(head);
-			return 0;
-		}
-
-		pages[*nr] = page;
-		(*nr)++;
-	} while (ptep++, addr += PAGE_SIZE, addr != end);
-
-	return 1;
-}
-
-static int gup_huge_pmd(pmd_t *pmdp, pmd_t pmd, unsigned long addr,
-			unsigned long end, int write, struct page **pages,
-			int *nr)
-{
-	struct page *head, *page;
-	int refs;
-
-	if (!(pmd_val(pmd) & _PAGE_VALID))
-		return 0;
-
-	if (write && !pmd_write(pmd))
-		return 0;
-
-	refs = 0;
-	page = pmd_page(pmd) + ((addr & ~PMD_MASK) >> PAGE_SHIFT);
-	head = compound_head(page);
-	do {
-		VM_BUG_ON(compound_head(page) != head);
-		pages[*nr] = page;
-		(*nr)++;
-		page++;
-		refs++;
-	} while (addr += PAGE_SIZE, addr != end);
-
-	if (!page_cache_add_speculative(head, refs)) {
-		*nr -= refs;
-		return 0;
-	}
-
-	if (unlikely(pmd_val(pmd) != pmd_val(*pmdp))) {
-		*nr -= refs;
-		while (refs--)
-			put_page(head);
-		return 0;
-	}
-
-	return 1;
-}
-
-static int gup_huge_pud(pud_t *pudp, pud_t pud, unsigned long addr,
-			unsigned long end, int write, struct page **pages,
-			int *nr)
-{
-	struct page *head, *page;
-	int refs;
-
-	if (!(pud_val(pud) & _PAGE_VALID))
-		return 0;
-
-	if (write && !pud_write(pud))
-		return 0;
-
-	refs = 0;
-	page = pud_page(pud) + ((addr & ~PUD_MASK) >> PAGE_SHIFT);
-	head = compound_head(page);
-	do {
-		VM_BUG_ON(compound_head(page) != head);
-		pages[*nr] = page;
-		(*nr)++;
-		page++;
-		refs++;
-	} while (addr += PAGE_SIZE, addr != end);
-
-	if (!page_cache_add_speculative(head, refs)) {
-		*nr -= refs;
-		return 0;
-	}
-
-	if (unlikely(pud_val(pud) != pud_val(*pudp))) {
-		*nr -= refs;
-		while (refs--)
-			put_page(head);
-		return 0;
-	}
-
-	return 1;
-}
-
-static int gup_pmd_range(pud_t pud, unsigned long addr, unsigned long end,
-		int write, struct page **pages, int *nr)
-{
-	unsigned long next;
-	pmd_t *pmdp;
-
-	pmdp = pmd_offset(&pud, addr);
-	do {
-		pmd_t pmd = *pmdp;
-
-		next = pmd_addr_end(addr, end);
-		if (pmd_none(pmd))
-			return 0;
-		if (unlikely(pmd_large(pmd))) {
-			if (!gup_huge_pmd(pmdp, pmd, addr, next,
-					  write, pages, nr))
-				return 0;
-		} else if (!gup_pte_range(pmd, addr, next, write,
-					  pages, nr))
-			return 0;
-	} while (pmdp++, addr = next, addr != end);
-
-	return 1;
-}
-
-static int gup_pud_range(pgd_t pgd, unsigned long addr, unsigned long end,
-		int write, struct page **pages, int *nr)
-{
-	unsigned long next;
-	pud_t *pudp;
-
-	pudp = pud_offset(&pgd, addr);
-	do {
-		pud_t pud = *pudp;
-
-		next = pud_addr_end(addr, end);
-		if (pud_none(pud))
-			return 0;
-		if (unlikely(pud_large(pud))) {
-			if (!gup_huge_pud(pudp, pud, addr, next,
-					  write, pages, nr))
-				return 0;
-		} else if (!gup_pmd_range(pud, addr, next, write, pages, nr))
-			return 0;
-	} while (pudp++, addr = next, addr != end);
-
-	return 1;
-}
-
-/*
- * Note a difference with get_user_pages_fast: this always returns the
- * number of pages pinned, 0 if no pages were pinned.
- */
-int __get_user_pages_fast(unsigned long start, int nr_pages, int write,
-			  struct page **pages)
-{
-	struct mm_struct *mm = current->mm;
-	unsigned long addr, len, end;
-	unsigned long next, flags;
-	pgd_t *pgdp;
-	int nr = 0;
-
-#ifdef CONFIG_SPARC64
-	if (adi_capable()) {
-		long addr = start;
-
-		/* If userspace has passed a versioned address, kernel
-		 * will not find it in the VMAs since it does not store
-		 * the version tags in the list of VMAs. Storing version
-		 * tags in list of VMAs is impractical since they can be
-		 * changed any time from userspace without dropping into
-		 * kernel. Any address search in VMAs will be done with
-		 * non-versioned addresses. Ensure the ADI version bits
-		 * are dropped here by sign extending the last bit before
-		 * ADI bits. IOMMU does not implement version tags.
-		 */
-		addr = (addr << (long)adi_nbits()) >> (long)adi_nbits();
-		start = addr;
-	}
-#endif
-	start &= PAGE_MASK;
-	addr = start;
-	len = (unsigned long) nr_pages << PAGE_SHIFT;
-	end = start + len;
-
-	local_irq_save(flags);
-	pgdp = pgd_offset(mm, addr);
-	do {
-		pgd_t pgd = *pgdp;
-
-		next = pgd_addr_end(addr, end);
-		if (pgd_none(pgd))
-			break;
-		if (!gup_pud_range(pgd, addr, next, write, pages, &nr))
-			break;
-	} while (pgdp++, addr = next, addr != end);
-	local_irq_restore(flags);
-
-	return nr;
-}
-
-int get_user_pages_fast(unsigned long start, int nr_pages,
-			unsigned int gup_flags, struct page **pages)
-{
-	struct mm_struct *mm = current->mm;
-	unsigned long addr, len, end;
-	unsigned long next;
-	pgd_t *pgdp;
-	int nr = 0;
-
-#ifdef CONFIG_SPARC64
-	if (adi_capable()) {
-		long addr = start;
-
-		/* If userspace has passed a versioned address, kernel
-		 * will not find it in the VMAs since it does not store
-		 * the version tags in the list of VMAs. Storing version
-		 * tags in list of VMAs is impractical since they can be
-		 * changed any time from userspace without dropping into
-		 * kernel. Any address search in VMAs will be done with
-		 * non-versioned addresses. Ensure the ADI version bits
-		 * are dropped here by sign extending the last bit before
-		 * ADI bits. IOMMU does not implements version tags,
-		 */
-		addr = (addr << (long)adi_nbits()) >> (long)adi_nbits();
-		start = addr;
-	}
-#endif
-	start &= PAGE_MASK;
-	addr = start;
-	len = (unsigned long) nr_pages << PAGE_SHIFT;
-	end = start + len;
-
-	/*
-	 * XXX: batch / limit 'nr', to avoid large irq off latency
-	 * needs some instrumenting to determine the common sizes used by
-	 * important workloads (eg. DB2), and whether limiting the batch size
-	 * will decrease performance.
-	 *
-	 * It seems like we're in the clear for the moment. Direct-IO is
-	 * the main guy that batches up lots of get_user_pages, and even
-	 * they are limited to 64-at-a-time which is not so many.
-	 */
-	/*
-	 * This doesn't prevent pagetable teardown, but does prevent
-	 * the pagetables from being freed on sparc.
-	 *
-	 * So long as we atomically load page table pointers versus teardown,
-	 * we can follow the address down to the the page and take a ref on it.
-	 */
-	local_irq_disable();
-
-	pgdp = pgd_offset(mm, addr);
-	do {
-		pgd_t pgd = *pgdp;
-
-		next = pgd_addr_end(addr, end);
-		if (pgd_none(pgd))
-			goto slow;
-		if (!gup_pud_range(pgd, addr, next, gup_flags & FOLL_WRITE,
-				   pages, &nr))
-			goto slow;
-	} while (pgdp++, addr = next, addr != end);
-
-	local_irq_enable();
-
-	VM_BUG_ON(nr != (end - start) >> PAGE_SHIFT);
-	return nr;
-
-	{
-		int ret;
-
-slow:
-		local_irq_enable();
-
-		/* Try to get the remaining pages with get_user_pages */
-		start += nr << PAGE_SHIFT;
-		pages += nr;
-
-		ret = get_user_pages_unlocked(start,
-			(end - start) >> PAGE_SHIFT, pages,
-			gup_flags);
-
-		/* Have to be a bit careful with return values */
-		if (nr > 0) {
-			if (ret < 0)
-				ret = nr;
-			else
-				ret += nr;
-		}
-
-		return ret;
-	}
-}
-- 
2.20.1

