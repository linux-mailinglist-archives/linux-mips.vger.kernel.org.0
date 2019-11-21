Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 019AB1056E2
	for <lists+linux-mips@lfdr.de>; Thu, 21 Nov 2019 17:21:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbfKUQVr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 Nov 2019 11:21:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:35544 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726574AbfKUQVq (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 21 Nov 2019 11:21:46 -0500
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 46743206B6;
        Thu, 21 Nov 2019 16:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574353305;
        bh=JukwCNOkYP5D8+BZCp+xHuhbwZfR84EcvIO//Fu8A3Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Wf7AOW7HPM4KQXSxx45JSkwFCalRhovwcHYS8ee2Sf5bGQKursRvsImFVfKDcGjLt
         yoP+nkLzHRz55O2ZaJpsmgTqFtgJOOlHbJqZ1sXjZWbvxBw2sbX0Mi4GEdVEYebp3u
         m3AtG5nvNw41PLWtM90fba9mO/NE0Wcy1tT3c2hQ=
From:   Mike Rapoport <rppt@kernel.org>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, Mike Rapoport <rppt@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: [PATCH 2/3] mips: drop __pXd_offset() macros that duplicate pXd_index() ones
Date:   Thu, 21 Nov 2019 18:21:32 +0200
Message-Id: <20191121162133.15833-3-rppt@kernel.org>
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

The __pXd_offset() macros are identical to the pXd_index() macros and there
is no point to keep both of them. All architectures define and use
pXd_index() so let's keep only those to make mips consistent with the rest
of the kernel.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/mips/include/asm/pgtable-32.h |  5 +----
 arch/mips/include/asm/pgtable-64.h |  4 ----
 arch/mips/kvm/mmu.c                | 24 ++++++++++++------------
 arch/mips/mm/fault.c               |  2 +-
 arch/mips/mm/init.c                |  6 +++---
 arch/mips/mm/pgtable-32.c          |  2 +-
 6 files changed, 18 insertions(+), 25 deletions(-)

diff --git a/arch/mips/include/asm/pgtable-32.h b/arch/mips/include/asm/pgtable-32.h
index ba967148b016..6089c5c4936c 100644
--- a/arch/mips/include/asm/pgtable-32.h
+++ b/arch/mips/include/asm/pgtable-32.h
@@ -196,14 +196,11 @@ static inline pte_t pfn_pte(unsigned long pfn, pgprot_t prot)
 
 #define pte_page(x)		pfn_to_page(pte_pfn(x))
 
-#define __pgd_offset(address)	pgd_index(address)
-#define __pud_offset(address)	(((address) >> PUD_SHIFT) & (PTRS_PER_PUD-1))
-#define __pmd_offset(address)	(((address) >> PMD_SHIFT) & (PTRS_PER_PMD-1))
-
 /* to find an entry in a kernel page-table-directory */
 #define pgd_offset_k(address) pgd_offset(&init_mm, address)
 
 #define pgd_index(address)	(((address) >> PGDIR_SHIFT) & (PTRS_PER_PGD-1))
+#define pud_index(address)	(((address) >> PUD_SHIFT) & (PTRS_PER_PUD-1))
 #define pmd_index(address)	(((address) >> PMD_SHIFT) & (PTRS_PER_PMD-1))
 
 /* to find an entry in a page-table-directory */
diff --git a/arch/mips/include/asm/pgtable-64.h b/arch/mips/include/asm/pgtable-64.h
index 813dfe5f45a5..62a9e2c31312 100644
--- a/arch/mips/include/asm/pgtable-64.h
+++ b/arch/mips/include/asm/pgtable-64.h
@@ -319,10 +319,6 @@ static inline void pud_clear(pud_t *pudp)
 #define pfn_pmd(pfn, prot)	__pmd(((pfn) << _PFN_SHIFT) | pgprot_val(prot))
 #endif
 
-#define __pgd_offset(address)	pgd_index(address)
-#define __pud_offset(address)	(((address) >> PUD_SHIFT) & (PTRS_PER_PUD-1))
-#define __pmd_offset(address)	pmd_index(address)
-
 /* to find an entry in a kernel page-table-directory */
 #define pgd_offset_k(address) pgd_offset(&init_mm, address)
 
diff --git a/arch/mips/kvm/mmu.c b/arch/mips/kvm/mmu.c
index 97e538a8c1be..a62a434b256e 100644
--- a/arch/mips/kvm/mmu.c
+++ b/arch/mips/kvm/mmu.c
@@ -204,8 +204,8 @@ static bool kvm_mips_flush_gpa_pmd(pmd_t *pmd, unsigned long start_gpa,
 {
 	pte_t *pte;
 	unsigned long end = ~0ul;
-	int i_min = __pmd_offset(start_gpa);
-	int i_max = __pmd_offset(end_gpa);
+	int i_min = pmd_index(start_gpa);
+	int i_max = pmd_index(end_gpa);
 	bool safe_to_remove = (i_min == 0 && i_max == PTRS_PER_PMD - 1);
 	int i;
 
@@ -232,8 +232,8 @@ static bool kvm_mips_flush_gpa_pud(pud_t *pud, unsigned long start_gpa,
 {
 	pmd_t *pmd;
 	unsigned long end = ~0ul;
-	int i_min = __pud_offset(start_gpa);
-	int i_max = __pud_offset(end_gpa);
+	int i_min = pud_index(start_gpa);
+	int i_max = pud_index(end_gpa);
 	bool safe_to_remove = (i_min == 0 && i_max == PTRS_PER_PUD - 1);
 	int i;
 
@@ -334,8 +334,8 @@ static int kvm_mips_##name##_pmd(pmd_t *pmd, unsigned long start,	\
 	int ret = 0;							\
 	pte_t *pte;							\
 	unsigned long cur_end = ~0ul;					\
-	int i_min = __pmd_offset(start);				\
-	int i_max = __pmd_offset(end);					\
+	int i_min = pmd_index(start);				\
+	int i_max = pmd_index(end);					\
 	int i;								\
 									\
 	for (i = i_min; i <= i_max; ++i, start = 0) {			\
@@ -357,8 +357,8 @@ static int kvm_mips_##name##_pud(pud_t *pud, unsigned long start,	\
 	int ret = 0;							\
 	pmd_t *pmd;							\
 	unsigned long cur_end = ~0ul;					\
-	int i_min = __pud_offset(start);				\
-	int i_max = __pud_offset(end);					\
+	int i_min = pud_index(start);				\
+	int i_max = pud_index(end);					\
 	int i;								\
 									\
 	for (i = i_min; i <= i_max; ++i, start = 0) {			\
@@ -862,8 +862,8 @@ static bool kvm_mips_flush_gva_pmd(pmd_t *pmd, unsigned long start_gva,
 {
 	pte_t *pte;
 	unsigned long end = ~0ul;
-	int i_min = __pmd_offset(start_gva);
-	int i_max = __pmd_offset(end_gva);
+	int i_min = pmd_index(start_gva);
+	int i_max = pmd_index(end_gva);
 	bool safe_to_remove = (i_min == 0 && i_max == PTRS_PER_PMD - 1);
 	int i;
 
@@ -890,8 +890,8 @@ static bool kvm_mips_flush_gva_pud(pud_t *pud, unsigned long start_gva,
 {
 	pmd_t *pmd;
 	unsigned long end = ~0ul;
-	int i_min = __pud_offset(start_gva);
-	int i_max = __pud_offset(end_gva);
+	int i_min = pud_index(start_gva);
+	int i_max = pud_index(end_gva);
 	bool safe_to_remove = (i_min == 0 && i_max == PTRS_PER_PUD - 1);
 	int i;
 
diff --git a/arch/mips/mm/fault.c b/arch/mips/mm/fault.c
index f589aa8f47d9..524af96c8131 100644
--- a/arch/mips/mm/fault.c
+++ b/arch/mips/mm/fault.c
@@ -292,7 +292,7 @@ static void __kprobes __do_page_fault(struct pt_regs *regs, unsigned long write,
 		 * Do _not_ use "tsk" here. We might be inside
 		 * an interrupt in the middle of a task switch..
 		 */
-		int offset = __pgd_offset(address);
+		int offset = pgd_index(address);
 		pgd_t *pgd, *pgd_k;
 		pud_t *pud, *pud_k;
 		pmd_t *pmd, *pmd_k;
diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
index 090fa653dfa9..50f9ed8c6c1b 100644
--- a/arch/mips/mm/init.c
+++ b/arch/mips/mm/init.c
@@ -239,9 +239,9 @@ void __init fixrange_init(unsigned long start, unsigned long end,
 	unsigned long vaddr;
 
 	vaddr = start;
-	i = __pgd_offset(vaddr);
-	j = __pud_offset(vaddr);
-	k = __pmd_offset(vaddr);
+	i = pgd_index(vaddr);
+	j = pud_index(vaddr);
+	k = pmd_index(vaddr);
 	pgd = pgd_base + i;
 
 	for ( ; (i < PTRS_PER_PGD) && (vaddr < end); pgd++, i++) {
diff --git a/arch/mips/mm/pgtable-32.c b/arch/mips/mm/pgtable-32.c
index 6416a531a4c3..621a01fbef64 100644
--- a/arch/mips/mm/pgtable-32.c
+++ b/arch/mips/mm/pgtable-32.c
@@ -81,7 +81,7 @@ void __init pagetable_init(void)
 	vaddr = PKMAP_BASE;
 	fixrange_init(vaddr & PMD_MASK, vaddr + PAGE_SIZE*LAST_PKMAP, pgd_base);
 
-	pgd = swapper_pg_dir + __pgd_offset(vaddr);
+	pgd = swapper_pg_dir + pgd_index(vaddr);
 	pud = pud_offset(pgd, vaddr);
 	pmd = pmd_offset(pud, vaddr);
 	pte = pte_offset_kernel(pmd, vaddr);
-- 
2.24.0

