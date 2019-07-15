Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2ED9D69E66
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jul 2019 23:40:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732166AbfGOVkW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 15 Jul 2019 17:40:22 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:34440 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730156AbfGOVkW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 15 Jul 2019 17:40:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1563226816; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=83UUyY3nqB5GEHoj6uddzuQXEXVwQHKMsV0TEqEzuE0=;
        b=CARzTCAL1r/TNLqqupFA0+vg0DHAG/ze2awrYvqFjHoLhyVbviCZHS/mzjrevH9iHBOnwI
        HaU8M2Q+PwnFrjZOzwn2U4kOs9KCGk1r+1S5hnia1EneyAbQ0krPm0ADZbbULFTNhUo0RW
        R5qE10amU1mt4wH7vntVjZQ3+70sE00=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>
Cc:     od@zcrc.me, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Daniel Silsby <dansilsby@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 2/5] MIPS: Add partial 32-bit huge page support
Date:   Mon, 15 Jul 2019 17:40:00 -0400
Message-Id: <20190715214003.9714-2-paul@crapouillou.net>
In-Reply-To: <20190715214003.9714-1-paul@crapouillou.net>
References: <20190715214003.9714-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Daniel Silsby <dansilsby@gmail.com>

 This adds initial support for huge pages to 32-bit MIPS systems.
Systems with extended addressing enabled (EVA,XPA,Alchemy/Netlogic)
are not yet supported.
 With huge pages enabled, this implementation will increase page table
memory overhead to match that of a 64-bit MIPS system. However, the
cache-friendliness of page table walks is not affected significantly.

Signed-off-by: Daniel Silsby <dansilsby@gmail.com>
Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/include/asm/pgtable-32.h   | 56 +++++++++++++++++++++++++---
 arch/mips/include/asm/pgtable-bits.h |  4 +-
 arch/mips/mm/pgtable-32.c            | 20 ++++++++++
 3 files changed, 73 insertions(+), 7 deletions(-)

diff --git a/arch/mips/include/asm/pgtable-32.h b/arch/mips/include/asm/pgtable-32.h
index 74afe8c76bdd..b0a78c9b6434 100644
--- a/arch/mips/include/asm/pgtable-32.h
+++ b/arch/mips/include/asm/pgtable-32.h
@@ -23,6 +23,24 @@
 #include <asm/highmem.h>
 #endif
 
+/*
+ * Regarding 32-bit MIPS huge page support (and the tradeoff it entails):
+ *
+ *  We use the same huge page sizes as 64-bit MIPS. Assuming a 4KB page size,
+ * our 2-level table layout would normally have a PGD entry cover a contiguous
+ * 4MB virtual address region (pointing to a 4KB PTE page of 1,024 32-bit pte_t
+ * pointers, each pointing to a 4KB physical page). The problem is that 4MB,
+ * spanning both halves of a TLB EntryLo0,1 pair, requires 2MB hardware page
+ * support, not one of the standard supported sizes (1MB,4MB,16MB,...).
+ *  To correct for this, when huge pages are enabled, we halve the number of
+ * pointers a PTE page holds, making its last half go to waste. Correspondingly,
+ * we double the number of PGD pages. Overall, page table memory overhead
+ * increases to match 64-bit MIPS, but PTE lookups remain CPU cache-friendly.
+ *
+ * NOTE: We don't yet support huge pages if extended-addressing is enabled
+ *       (i.e. EVA, XPA, 36-bit Alchemy/Netlogic).
+ */
+
 extern int temp_tlb_entry;
 
 /*
@@ -44,7 +62,12 @@ extern int add_temporary_entry(unsigned long entrylo0, unsigned long entrylo1,
  */
 
 /* PGDIR_SHIFT determines what a third-level page table entry can map */
-#define PGDIR_SHIFT	(2 * PAGE_SHIFT + PTE_ORDER - PTE_T_LOG2)
+#if defined(CONFIG_MIPS_HUGE_TLB_SUPPORT) && !defined(CONFIG_PHYS_ADDR_T_64BIT)
+# define PGDIR_SHIFT	(2 * PAGE_SHIFT + PTE_ORDER - PTE_T_LOG2 - 1)
+#else
+# define PGDIR_SHIFT	(2 * PAGE_SHIFT + PTE_ORDER - PTE_T_LOG2)
+#endif
+
 #define PGDIR_SIZE	(1UL << PGDIR_SHIFT)
 #define PGDIR_MASK	(~(PGDIR_SIZE-1))
 
@@ -52,14 +75,23 @@ extern int add_temporary_entry(unsigned long entrylo0, unsigned long entrylo1,
  * Entries per page directory level: we use two-level, so
  * we don't really have any PUD/PMD directory physically.
  */
-#define __PGD_ORDER	(32 - 3 * PAGE_SHIFT + PGD_T_LOG2 + PTE_T_LOG2)
+#if defined(CONFIG_MIPS_HUGE_TLB_SUPPORT) && !defined(CONFIG_PHYS_ADDR_T_64BIT)
+# define __PGD_ORDER	(32 - 3 * PAGE_SHIFT + PGD_T_LOG2 + PTE_T_LOG2 + 1)
+#else
+# define __PGD_ORDER	(32 - 3 * PAGE_SHIFT + PGD_T_LOG2 + PTE_T_LOG2)
+#endif
+
 #define PGD_ORDER	(__PGD_ORDER >= 0 ? __PGD_ORDER : 0)
 #define PUD_ORDER	aieeee_attempt_to_allocate_pud
 #define PMD_ORDER	1
 #define PTE_ORDER	0
 
 #define PTRS_PER_PGD	(USER_PTRS_PER_PGD * 2)
-#define PTRS_PER_PTE	((PAGE_SIZE << PTE_ORDER) / sizeof(pte_t))
+#if defined(CONFIG_MIPS_HUGE_TLB_SUPPORT) && !defined(CONFIG_PHYS_ADDR_T_64BIT)
+# define PTRS_PER_PTE	((PAGE_SIZE << PTE_ORDER) / sizeof(pte_t) / 2)
+#else
+# define PTRS_PER_PTE	((PAGE_SIZE << PTE_ORDER) / sizeof(pte_t))
+#endif
 
 #define USER_PTRS_PER_PGD	(0x80000000UL/PGDIR_SIZE)
 #define FIRST_USER_ADDRESS	0UL
@@ -87,7 +119,7 @@ extern int add_temporary_entry(unsigned long entrylo0, unsigned long entrylo1,
 
 extern void load_pgd(unsigned long pg_dir);
 
-extern pte_t invalid_pte_table[PAGE_SIZE/sizeof(pte_t)];
+extern pte_t invalid_pte_table[PTRS_PER_PTE];
 
 /*
  * Empty pgd/pmd entries point to the invalid_pte_table.
@@ -97,7 +129,19 @@ static inline int pmd_none(pmd_t pmd)
 	return pmd_val(pmd) == (unsigned long) invalid_pte_table;
 }
 
-#define pmd_bad(pmd)		(pmd_val(pmd) & ~PAGE_MASK)
+static inline int pmd_bad(pmd_t pmd)
+{
+#ifdef CONFIG_MIPS_HUGE_TLB_SUPPORT
+	/* pmd_huge(pmd) but inline */
+	if (unlikely(pmd_val(pmd) & _PAGE_HUGE))
+		return 0;
+#endif
+
+	if (unlikely(pmd_val(pmd) & ~PAGE_MASK))
+		return 1;
+
+	return 0;
+}
 
 static inline int pmd_present(pmd_t pmd)
 {
@@ -146,6 +190,7 @@ static inline pte_t pfn_pte(unsigned long pfn, pgprot_t prot)
 #else
 #define pte_pfn(x)		((unsigned long)((x).pte >> _PFN_SHIFT))
 #define pfn_pte(pfn, prot)	__pte(((unsigned long long)(pfn) << _PFN_SHIFT) | pgprot_val(prot))
+#define pfn_pmd(pfn, prot)	__pmd(((unsigned long long)(pfn) << _PFN_SHIFT) | pgprot_val(prot))
 #endif
 #endif /* defined(CONFIG_PHYS_ADDR_T_64BIT) && defined(CONFIG_CPU_MIPS32) */
 
@@ -159,6 +204,7 @@ static inline pte_t pfn_pte(unsigned long pfn, pgprot_t prot)
 #define pgd_offset_k(address) pgd_offset(&init_mm, address)
 
 #define pgd_index(address)	(((address) >> PGDIR_SHIFT) & (PTRS_PER_PGD-1))
+#define pmd_index(address)	(((address) >> PMD_SHIFT) & (PTRS_PER_PMD-1))
 
 /* to find an entry in a page-table-directory */
 #define pgd_offset(mm, addr)	((mm)->pgd + pgd_index(addr))
diff --git a/arch/mips/include/asm/pgtable-bits.h b/arch/mips/include/asm/pgtable-bits.h
index f88a48cd68b2..f3b1efd23f21 100644
--- a/arch/mips/include/asm/pgtable-bits.h
+++ b/arch/mips/include/asm/pgtable-bits.h
@@ -110,7 +110,7 @@ enum pgtable_bits {
 	_PAGE_WRITE_SHIFT,
 	_PAGE_ACCESSED_SHIFT,
 	_PAGE_MODIFIED_SHIFT,
-#if defined(CONFIG_64BIT) && defined(CONFIG_MIPS_HUGE_TLB_SUPPORT)
+#if defined(CONFIG_MIPS_HUGE_TLB_SUPPORT)
 	_PAGE_HUGE_SHIFT,
 #endif
 
@@ -132,7 +132,7 @@ enum pgtable_bits {
 #define _PAGE_WRITE		(1 << _PAGE_WRITE_SHIFT)
 #define _PAGE_ACCESSED		(1 << _PAGE_ACCESSED_SHIFT)
 #define _PAGE_MODIFIED		(1 << _PAGE_MODIFIED_SHIFT)
-#if defined(CONFIG_64BIT) && defined(CONFIG_MIPS_HUGE_TLB_SUPPORT)
+#if defined(CONFIG_MIPS_HUGE_TLB_SUPPORT)
 # define _PAGE_HUGE		(1 << _PAGE_HUGE_SHIFT)
 #endif
 
diff --git a/arch/mips/mm/pgtable-32.c b/arch/mips/mm/pgtable-32.c
index e2a33adc0f29..6416a531a4c3 100644
--- a/arch/mips/mm/pgtable-32.c
+++ b/arch/mips/mm/pgtable-32.c
@@ -12,6 +12,7 @@
 #include <asm/fixmap.h>
 #include <asm/pgtable.h>
 #include <asm/pgalloc.h>
+#include <asm/tlbflush.h>
 
 void pgd_init(unsigned long page)
 {
@@ -30,6 +31,25 @@ void pgd_init(unsigned long page)
 	}
 }
 
+#if defined(CONFIG_TRANSPARENT_HUGEPAGE)
+pmd_t mk_pmd(struct page *page, pgprot_t prot)
+{
+	pmd_t pmd;
+
+	pmd_val(pmd) = (page_to_pfn(page) << _PFN_SHIFT) | pgprot_val(prot);
+
+	return pmd;
+}
+
+
+void set_pmd_at(struct mm_struct *mm, unsigned long addr,
+		pmd_t *pmdp, pmd_t pmd)
+{
+	*pmdp = pmd;
+	flush_tlb_all();
+}
+#endif /* defined(CONFIG_TRANSPARENT_HUGEPAGE) */
+
 void __init pagetable_init(void)
 {
 	unsigned long vaddr;
-- 
2.21.0.593.g511ec345e18

