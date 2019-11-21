Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A20F1056E5
	for <lists+linux-mips@lfdr.de>; Thu, 21 Nov 2019 17:21:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726939AbfKUQVu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 Nov 2019 11:21:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:35626 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726574AbfKUQVu (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 21 Nov 2019 11:21:50 -0500
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 58796206D7;
        Thu, 21 Nov 2019 16:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574353308;
        bh=UeXsvyhoe7zQzbY/U3+mvsOn/wzS9Z9CaXshYcTeu3w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uuqmbfiu9dO4JF8weSh043j2a53GuSi1w9or5lNY7qxpNEcQ/CAOrcFNzrNfcnf3l
         SElr4FQUGph+gU+Ku9u3/pyPdDKXCpYr4WkESCe4GFmUEef4Whnl9oqYWrWMTLO3RH
         Zz0Ibsv5pwhBnaJyKimRP9btn1WVZfBzjk5VbxTQ=
From:   Mike Rapoport <rppt@kernel.org>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, Mike Rapoport <rppt@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: [PATCH 3/3] mips: add support for folded p4d page tables
Date:   Thu, 21 Nov 2019 18:21:33 +0200
Message-Id: <20191121162133.15833-4-rppt@kernel.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191121162133.15833-1-rppt@kernel.org>
References: <20191121162133.15833-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Mike Rapoport <rppt@linux.ibm.com>

Implement primitives necessary for the 4th level folding, add walks of p4d
level where appropriate, replace 5leve-fixup.h with pgtable-nop4d.h and
drop usage of __ARCH_USE_5LEVEL_HACK.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/mips/include/asm/fixmap.h     |  2 +-
 arch/mips/include/asm/pgalloc.h    |  4 ++--
 arch/mips/include/asm/pgtable-32.h |  1 -
 arch/mips/include/asm/pgtable-64.h | 37 +++++++++++++++---------------
 arch/mips/kvm/mmu.c                | 16 +++++++++----
 arch/mips/kvm/trap_emul.c          |  4 +++-
 arch/mips/mm/c-r3k.c               |  4 +++-
 arch/mips/mm/c-r4k.c               |  4 +++-
 arch/mips/mm/c-tx39.c              |  4 +++-
 arch/mips/mm/fault.c               | 10 ++++++--
 arch/mips/mm/hugetlbpage.c         | 14 +++++++----
 arch/mips/mm/ioremap.c             |  6 ++++-
 arch/mips/mm/pgtable-32.c          |  4 +++-
 arch/mips/mm/tlb-r4k.c             |  4 +++-
 14 files changed, 75 insertions(+), 39 deletions(-)

diff --git a/arch/mips/include/asm/fixmap.h b/arch/mips/include/asm/fixmap.h
index 6842ffafd1e7..1784d4348c36 100644
--- a/arch/mips/include/asm/fixmap.h
+++ b/arch/mips/include/asm/fixmap.h
@@ -70,7 +70,7 @@ enum fixed_addresses {
 #include <asm-generic/fixmap.h>
 
 #define kmap_get_fixmap_pte(vaddr)					\
-	pte_offset_kernel(pmd_offset(pud_offset(pgd_offset_k(vaddr), (vaddr)), (vaddr)), (vaddr))
+	pte_offset_kernel(pmd_offset(pud_offset(p4d_offset(pgd_offset_k(vaddr), (vaddr)), (vaddr)), (vaddr)), (vaddr))
 
 /*
  * Called from pgtable_init()
diff --git a/arch/mips/include/asm/pgalloc.h b/arch/mips/include/asm/pgalloc.h
index 166842337eb2..fa77cb71f303 100644
--- a/arch/mips/include/asm/pgalloc.h
+++ b/arch/mips/include/asm/pgalloc.h
@@ -96,9 +96,9 @@ static inline void pud_free(struct mm_struct *mm, pud_t *pud)
 	free_pages((unsigned long)pud, PUD_ORDER);
 }
 
-static inline void pgd_populate(struct mm_struct *mm, pgd_t *pgd, pud_t *pud)
+static inline void p4d_populate(struct mm_struct *mm, p4d_t *p4d, pud_t *pud)
 {
-	set_pgd(pgd, __pgd((unsigned long)pud));
+	set_p4d(p4d, __p4d((unsigned long)pud));
 }
 
 #define __pud_free_tlb(tlb, x, addr)	pud_free((tlb)->mm, x)
diff --git a/arch/mips/include/asm/pgtable-32.h b/arch/mips/include/asm/pgtable-32.h
index 6089c5c4936c..1945c8970141 100644
--- a/arch/mips/include/asm/pgtable-32.h
+++ b/arch/mips/include/asm/pgtable-32.h
@@ -16,7 +16,6 @@
 #include <asm/cachectl.h>
 #include <asm/fixmap.h>
 
-#define __ARCH_USE_5LEVEL_HACK
 #include <asm-generic/pgtable-nopmd.h>
 
 #ifdef CONFIG_HIGHMEM
diff --git a/arch/mips/include/asm/pgtable-64.h b/arch/mips/include/asm/pgtable-64.h
index 62a9e2c31312..f92716cfa4f4 100644
--- a/arch/mips/include/asm/pgtable-64.h
+++ b/arch/mips/include/asm/pgtable-64.h
@@ -17,13 +17,12 @@
 #include <asm/cachectl.h>
 #include <asm/fixmap.h>
 
-#define __ARCH_USE_5LEVEL_HACK
 #if CONFIG_PGTABLE_LEVELS == 2
 #include <asm-generic/pgtable-nopmd.h>
 #elif CONFIG_PGTABLE_LEVELS == 3
 #include <asm-generic/pgtable-nopud.h>
 #else
-#include <asm-generic/5level-fixup.h>
+#include <asm-generic/pgtable-nop4d.h>
 #endif
 
 /*
@@ -188,47 +187,49 @@ extern pud_t invalid_pud_table[PTRS_PER_PUD];
 /*
  * Empty pgd entries point to the invalid_pud_table.
  */
-static inline int pgd_none(pgd_t pgd)
+static inline int p4d_none(p4d_t p4d)
 {
-	return pgd_val(pgd) == (unsigned long)invalid_pud_table;
+	return p4d_val(p4d) == (unsigned long)invalid_pud_table;
 }
 
-static inline int pgd_bad(pgd_t pgd)
+static inline int p4d_bad(p4d_t p4d)
 {
-	if (unlikely(pgd_val(pgd) & ~PAGE_MASK))
+	if (unlikely(p4d_val(p4d) & ~PAGE_MASK))
 		return 1;
 
 	return 0;
 }
 
-static inline int pgd_present(pgd_t pgd)
+static inline int p4d_present(p4d_t p4d)
 {
-	return pgd_val(pgd) != (unsigned long)invalid_pud_table;
+	return p4d_val(p4d) != (unsigned long)invalid_pud_table;
 }
 
-static inline void pgd_clear(pgd_t *pgdp)
+static inline void p4d_clear(p4d_t *p4dp)
 {
-	pgd_val(*pgdp) = (unsigned long)invalid_pud_table;
+	p4d_val(*p4dp) = (unsigned long)invalid_pud_table;
 }
 
 #define pud_index(address)	(((address) >> PUD_SHIFT) & (PTRS_PER_PUD - 1))
 
-static inline unsigned long pgd_page_vaddr(pgd_t pgd)
+static inline unsigned long p4d_page_vaddr(p4d_t p4d)
 {
-	return pgd_val(pgd);
+	return p4d_val(p4d);
 }
 
-#define pgd_phys(pgd)		virt_to_phys((void *)pgd_val(pgd))
-#define pgd_page(pgd)		(pfn_to_page(pgd_phys(pgd) >> PAGE_SHIFT))
+#define p4d_phys(p4d)		virt_to_phys((void *)p4d_val(p4d))
+#define p4d_page(p4d)		(pfn_to_page(p4d_phys(p4d) >> PAGE_SHIFT))
 
-static inline pud_t *pud_offset(pgd_t *pgd, unsigned long address)
+#define p4d_index(address)	(((address) >> P4D_SHIFT) & (PTRS_PER_P4D - 1))
+
+static inline pud_t *pud_offset(p4d_t *p4d, unsigned long address)
 {
-	return (pud_t *)pgd_page_vaddr(*pgd) + pud_index(address);
+	return (pud_t *)p4d_page_vaddr(*p4d) + pud_index(address);
 }
 
-static inline void set_pgd(pgd_t *pgd, pgd_t pgdval)
+static inline void set_p4d(p4d_t *p4d, p4d_t p4dval)
 {
-	*pgd = pgdval;
+	*p4d = p4dval;
 }
 
 #endif
diff --git a/arch/mips/kvm/mmu.c b/arch/mips/kvm/mmu.c
index a62a434b256e..7dad7a293eae 100644
--- a/arch/mips/kvm/mmu.c
+++ b/arch/mips/kvm/mmu.c
@@ -136,6 +136,7 @@ pgd_t *kvm_pgd_alloc(void)
 static pte_t *kvm_mips_walk_pgd(pgd_t *pgd, struct kvm_mmu_memory_cache *cache,
 				unsigned long addr)
 {
+	p4d_t *p4d;
 	pud_t *pud;
 	pmd_t *pmd;
 
@@ -145,7 +146,8 @@ static pte_t *kvm_mips_walk_pgd(pgd_t *pgd, struct kvm_mmu_memory_cache *cache,
 		BUG();
 		return NULL;
 	}
-	pud = pud_offset(pgd, addr);
+	p4d = p4d_offset(pgd, addr);
+	pud = pud_offset(p4d, addr);
 	if (pud_none(*pud)) {
 		pmd_t *new_pmd;
 
@@ -258,6 +260,7 @@ static bool kvm_mips_flush_gpa_pud(pud_t *pud, unsigned long start_gpa,
 static bool kvm_mips_flush_gpa_pgd(pgd_t *pgd, unsigned long start_gpa,
 				   unsigned long end_gpa)
 {
+	p4d_t *p4d;
 	pud_t *pud;
 	unsigned long end = ~0ul;
 	int i_min = pgd_index(start_gpa);
@@ -269,7 +272,8 @@ static bool kvm_mips_flush_gpa_pgd(pgd_t *pgd, unsigned long start_gpa,
 		if (!pgd_present(pgd[i]))
 			continue;
 
-		pud = pud_offset(pgd + i, 0);
+		p4d = p4d_offset(pgd, 0);
+		pud = pud_offset(p4d + i, 0);
 		if (i == i_max)
 			end = end_gpa;
 
@@ -378,6 +382,7 @@ static int kvm_mips_##name##_pgd(pgd_t *pgd, unsigned long start,	\
 				 unsigned long end)			\
 {									\
 	int ret = 0;							\
+	p4d_t *p4d;							\
 	pud_t *pud;							\
 	unsigned long cur_end = ~0ul;					\
 	int i_min = pgd_index(start);					\
@@ -388,7 +393,8 @@ static int kvm_mips_##name##_pgd(pgd_t *pgd, unsigned long start,	\
 		if (!pgd_present(pgd[i]))				\
 			continue;					\
 									\
-		pud = pud_offset(pgd + i, 0);				\
+		p4d = p4d_offset(pgd, 0);				\
+		pud = pud_offset(p4d + i, 0);				\
 		if (i == i_max)						\
 			cur_end = end;					\
 									\
@@ -916,6 +922,7 @@ static bool kvm_mips_flush_gva_pud(pud_t *pud, unsigned long start_gva,
 static bool kvm_mips_flush_gva_pgd(pgd_t *pgd, unsigned long start_gva,
 				   unsigned long end_gva)
 {
+	p4d_t *p4d;
 	pud_t *pud;
 	unsigned long end = ~0ul;
 	int i_min = pgd_index(start_gva);
@@ -927,7 +934,8 @@ static bool kvm_mips_flush_gva_pgd(pgd_t *pgd, unsigned long start_gva,
 		if (!pgd_present(pgd[i]))
 			continue;
 
-		pud = pud_offset(pgd + i, 0);
+		p4d = p4d_offset(pgd, 0);
+		pud = pud_offset(p4d + i, 0);
 		if (i == i_max)
 			end = end_gva;
 
diff --git a/arch/mips/kvm/trap_emul.c b/arch/mips/kvm/trap_emul.c
index 73daa6ad33af..5a11e83dffe6 100644
--- a/arch/mips/kvm/trap_emul.c
+++ b/arch/mips/kvm/trap_emul.c
@@ -564,6 +564,7 @@ static void kvm_mips_emul_free_gva_pt(pgd_t *pgd)
 	/* Don't free host kernel page tables copied from init_mm.pgd */
 	const unsigned long end = 0x80000000;
 	unsigned long pgd_va, pud_va, pmd_va;
+	p4d_t *p4d;
 	pud_t *pud;
 	pmd_t *pmd;
 	pte_t *pte;
@@ -576,7 +577,8 @@ static void kvm_mips_emul_free_gva_pt(pgd_t *pgd)
 		pgd_va = (unsigned long)i << PGDIR_SHIFT;
 		if (pgd_va >= end)
 			break;
-		pud = pud_offset(pgd + i, 0);
+		p4d = p4d_offset(pgd, 0);
+		pud = pud_offset(p4d + i, 0);
 		for (j = 0; j < PTRS_PER_PUD; j++) {
 			if (pud_none(pud[j]))
 				continue;
diff --git a/arch/mips/mm/c-r3k.c b/arch/mips/mm/c-r3k.c
index 0ca401ddf3b7..15bb8cf59828 100644
--- a/arch/mips/mm/c-r3k.c
+++ b/arch/mips/mm/c-r3k.c
@@ -241,6 +241,7 @@ static void r3k_flush_cache_page(struct vm_area_struct *vma,
 	int exec = vma->vm_flags & VM_EXEC;
 	struct mm_struct *mm = vma->vm_mm;
 	pgd_t *pgdp;
+	p4d_t *p4dp;
 	pud_t *pudp;
 	pmd_t *pmdp;
 	pte_t *ptep;
@@ -253,7 +254,8 @@ static void r3k_flush_cache_page(struct vm_area_struct *vma,
 		return;
 
 	pgdp = pgd_offset(mm, addr);
-	pudp = pud_offset(pgdp, addr);
+	p4dp = p4d_offset(pgdp, addr);
+	pudp = pud_offset(p4dp, addr);
 	pmdp = pmd_offset(pudp, addr);
 	ptep = pte_offset(pmdp, addr);
 
diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index 89b9c851d822..cc76ebad4482 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -650,6 +650,7 @@ static inline void local_r4k_flush_cache_page(void *args)
 	struct mm_struct *mm = vma->vm_mm;
 	int map_coherent = 0;
 	pgd_t *pgdp;
+	p4d_t *p4dp;
 	pud_t *pudp;
 	pmd_t *pmdp;
 	pte_t *ptep;
@@ -664,7 +665,8 @@ static inline void local_r4k_flush_cache_page(void *args)
 
 	addr &= PAGE_MASK;
 	pgdp = pgd_offset(mm, addr);
-	pudp = pud_offset(pgdp, addr);
+	p4dp = p4d_offset(pgdp, addr);
+	pudp = pud_offset(p4dp, addr);
 	pmdp = pmd_offset(pudp, addr);
 	ptep = pte_offset(pmdp, addr);
 
diff --git a/arch/mips/mm/c-tx39.c b/arch/mips/mm/c-tx39.c
index b7c8a9d79c35..686867270627 100644
--- a/arch/mips/mm/c-tx39.c
+++ b/arch/mips/mm/c-tx39.c
@@ -170,6 +170,7 @@ static void tx39_flush_cache_page(struct vm_area_struct *vma, unsigned long page
 	int exec = vma->vm_flags & VM_EXEC;
 	struct mm_struct *mm = vma->vm_mm;
 	pgd_t *pgdp;
+	p4d_t *p4dp;
 	pud_t *pudp;
 	pmd_t *pmdp;
 	pte_t *ptep;
@@ -183,7 +184,8 @@ static void tx39_flush_cache_page(struct vm_area_struct *vma, unsigned long page
 
 	page &= PAGE_MASK;
 	pgdp = pgd_offset(mm, page);
-	pudp = pud_offset(pgdp, page);
+	p4dp = p4d_offset(pgdp, page);
+	pudp = pud_offset(p4dp, page);
 	pmdp = pmd_offset(pudp, page);
 	ptep = pte_offset(pmdp, page);
 
diff --git a/arch/mips/mm/fault.c b/arch/mips/mm/fault.c
index 524af96c8131..1e8d00793784 100644
--- a/arch/mips/mm/fault.c
+++ b/arch/mips/mm/fault.c
@@ -294,6 +294,7 @@ static void __kprobes __do_page_fault(struct pt_regs *regs, unsigned long write,
 		 */
 		int offset = pgd_index(address);
 		pgd_t *pgd, *pgd_k;
+		p4d_t *p4d, *p4d_k;
 		pud_t *pud, *pud_k;
 		pmd_t *pmd, *pmd_k;
 		pte_t *pte_k;
@@ -305,8 +306,13 @@ static void __kprobes __do_page_fault(struct pt_regs *regs, unsigned long write,
 			goto no_context;
 		set_pgd(pgd, *pgd_k);
 
-		pud = pud_offset(pgd, address);
-		pud_k = pud_offset(pgd_k, address);
+		p4d = p4d_offset(pgd, address);
+		p4d_k = p4d_offset(pgd_k, address);
+		if (!p4d_present(*p4d_k))
+			goto no_context;
+
+		pud = pud_offset(p4d, address);
+		pud_k = pud_offset(p4d_k, address);
 		if (!pud_present(*pud_k))
 			goto no_context;
 
diff --git a/arch/mips/mm/hugetlbpage.c b/arch/mips/mm/hugetlbpage.c
index cef152234312..77ffece9c270 100644
--- a/arch/mips/mm/hugetlbpage.c
+++ b/arch/mips/mm/hugetlbpage.c
@@ -25,11 +25,13 @@ pte_t *huge_pte_alloc(struct mm_struct *mm, unsigned long addr,
 		      unsigned long sz)
 {
 	pgd_t *pgd;
+	p4d_t *p4d;
 	pud_t *pud;
 	pte_t *pte = NULL;
 
 	pgd = pgd_offset(mm, addr);
-	pud = pud_alloc(mm, pgd, addr);
+	p4d = p4d_alloc(mm, pgd, addr);
+	pud = pud_alloc(mm, p4d, addr);
 	if (pud)
 		pte = (pte_t *)pmd_alloc(mm, pud, addr);
 
@@ -40,14 +42,18 @@ pte_t *huge_pte_offset(struct mm_struct *mm, unsigned long addr,
 		       unsigned long sz)
 {
 	pgd_t *pgd;
+	p4d_t *p4d;
 	pud_t *pud;
 	pmd_t *pmd = NULL;
 
 	pgd = pgd_offset(mm, addr);
 	if (pgd_present(*pgd)) {
-		pud = pud_offset(pgd, addr);
-		if (pud_present(*pud))
-			pmd = pmd_offset(pud, addr);
+		p4d = p4d_offset(pgd, addr);
+		if (p4d_present(*p4d)) {
+			pud = pud_offset(p4d, addr);
+			if (pud_present(*pud))
+				pmd = pmd_offset(pud, addr);
+		}
 	}
 	return (pte_t *) pmd;
 }
diff --git a/arch/mips/mm/ioremap.c b/arch/mips/mm/ioremap.c
index 1601d90b087b..8317f337a86e 100644
--- a/arch/mips/mm/ioremap.c
+++ b/arch/mips/mm/ioremap.c
@@ -78,11 +78,15 @@ static int remap_area_pages(unsigned long address, phys_addr_t phys_addr,
 	flush_cache_all();
 	BUG_ON(address >= end);
 	do {
+		p4d_t *p4d;
 		pud_t *pud;
 		pmd_t *pmd;
 
 		error = -ENOMEM;
-		pud = pud_alloc(&init_mm, dir, address);
+		p4d = p4d_alloc(&init_mm, dir, address);
+		if (!p4d)
+			break;
+		pud = pud_alloc(&init_mm, p4d, address);
 		if (!pud)
 			break;
 		pmd = pmd_alloc(&init_mm, pud, address);
diff --git a/arch/mips/mm/pgtable-32.c b/arch/mips/mm/pgtable-32.c
index 621a01fbef64..37c7a01427d2 100644
--- a/arch/mips/mm/pgtable-32.c
+++ b/arch/mips/mm/pgtable-32.c
@@ -56,6 +56,7 @@ void __init pagetable_init(void)
 	pgd_t *pgd_base;
 #ifdef CONFIG_HIGHMEM
 	pgd_t *pgd;
+	p4d_t *p4d;
 	pud_t *pud;
 	pmd_t *pmd;
 	pte_t *pte;
@@ -82,7 +83,8 @@ void __init pagetable_init(void)
 	fixrange_init(vaddr & PMD_MASK, vaddr + PAGE_SIZE*LAST_PKMAP, pgd_base);
 
 	pgd = swapper_pg_dir + pgd_index(vaddr);
-	pud = pud_offset(pgd, vaddr);
+	p4d = p4d_offset(pgd, vaddr);
+	pud = pud_offset(p4d, vaddr);
 	pmd = pmd_offset(pud, vaddr);
 	pte = pte_offset_kernel(pmd, vaddr);
 	pkmap_page_table = pte;
diff --git a/arch/mips/mm/tlb-r4k.c b/arch/mips/mm/tlb-r4k.c
index c13e46ced425..c300fb4c152b 100644
--- a/arch/mips/mm/tlb-r4k.c
+++ b/arch/mips/mm/tlb-r4k.c
@@ -295,6 +295,7 @@ void __update_tlb(struct vm_area_struct * vma, unsigned long address, pte_t pte)
 {
 	unsigned long flags;
 	pgd_t *pgdp;
+	p4d_t *p4dp;
 	pud_t *pudp;
 	pmd_t *pmdp;
 	pte_t *ptep;
@@ -320,7 +321,8 @@ void __update_tlb(struct vm_area_struct * vma, unsigned long address, pte_t pte)
 	mtc0_tlbw_hazard();
 	tlb_probe();
 	tlb_probe_hazard();
-	pudp = pud_offset(pgdp, address);
+	p4dp = p4d_offset(pgdp, address);
+	pudp = pud_offset(p4dp, address);
 	pmdp = pmd_offset(pudp, address);
 	idx = read_c0_index();
 #ifdef CONFIG_MIPS_HUGE_TLB_SUPPORT
-- 
2.24.0

