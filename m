Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8209E3913EA
	for <lists+linux-mips@lfdr.de>; Wed, 26 May 2021 11:43:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233212AbhEZJpN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 26 May 2021 05:45:13 -0400
Received: from mx2.suse.de ([195.135.220.15]:32774 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233117AbhEZJpM (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 26 May 2021 05:45:12 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 83E15B20F;
        Wed, 26 May 2021 09:43:40 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Andrew Morton <akpm@linux-foundation.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Cc:     =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>
Subject: [PATCH] Revert "MIPS: make userspace mapping young by default"
Date:   Wed, 26 May 2021 11:43:35 +0200
Message-Id: <20210526094335.92948-1-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This reverts commit f685a533a7fab35c5d069dcd663f59c8e4171a75.

MIPS cache flush logic needs to know whether the mapping was already
established to decide how to flush caches. This is done by checking the
valid bit in the PTE. The commit above breaks this logic by setting
the valid in the PTE in new mappings, which causes kernel crashes.

Reported-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/mm/cache.c    | 30 ++++++++++++++----------------
 include/linux/pgtable.h |  8 ++++++++
 mm/memory.c             |  4 ++++
 3 files changed, 26 insertions(+), 16 deletions(-)

diff --git a/arch/mips/mm/cache.c b/arch/mips/mm/cache.c
index a7bf0c80371c..830ab91e574f 100644
--- a/arch/mips/mm/cache.c
+++ b/arch/mips/mm/cache.c
@@ -158,31 +158,29 @@ unsigned long _page_cachable_default;
 EXPORT_SYMBOL(_page_cachable_default);
 
 #define PM(p)	__pgprot(_page_cachable_default | (p))
-#define PVA(p)	PM(_PAGE_VALID | _PAGE_ACCESSED | (p))
 
 static inline void setup_protection_map(void)
 {
 	protection_map[0]  = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_NO_READ);
-	protection_map[1]  = PVA(_PAGE_PRESENT | _PAGE_NO_EXEC);
-	protection_map[2]  = PVA(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_NO_READ);
-	protection_map[3]  = PVA(_PAGE_PRESENT | _PAGE_NO_EXEC);
-	protection_map[4]  = PVA(_PAGE_PRESENT);
-	protection_map[5]  = PVA(_PAGE_PRESENT);
-	protection_map[6]  = PVA(_PAGE_PRESENT);
-	protection_map[7]  = PVA(_PAGE_PRESENT);
+	protection_map[1]  = PM(_PAGE_PRESENT | _PAGE_NO_EXEC);
+	protection_map[2]  = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_NO_READ);
+	protection_map[3]  = PM(_PAGE_PRESENT | _PAGE_NO_EXEC);
+	protection_map[4]  = PM(_PAGE_PRESENT);
+	protection_map[5]  = PM(_PAGE_PRESENT);
+	protection_map[6]  = PM(_PAGE_PRESENT);
+	protection_map[7]  = PM(_PAGE_PRESENT);
 
 	protection_map[8]  = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_NO_READ);
-	protection_map[9]  = PVA(_PAGE_PRESENT | _PAGE_NO_EXEC);
-	protection_map[10] = PVA(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_WRITE |
+	protection_map[9]  = PM(_PAGE_PRESENT | _PAGE_NO_EXEC);
+	protection_map[10] = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_WRITE |
 				_PAGE_NO_READ);
-	protection_map[11] = PVA(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_WRITE);
-	protection_map[12] = PVA(_PAGE_PRESENT);
-	protection_map[13] = PVA(_PAGE_PRESENT);
-	protection_map[14] = PVA(_PAGE_PRESENT);
-	protection_map[15] = PVA(_PAGE_PRESENT);
+	protection_map[11] = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_WRITE);
+	protection_map[12] = PM(_PAGE_PRESENT);
+	protection_map[13] = PM(_PAGE_PRESENT);
+	protection_map[14] = PM(_PAGE_PRESENT | _PAGE_WRITE);
+	protection_map[15] = PM(_PAGE_PRESENT | _PAGE_WRITE);
 }
 
-#undef _PVA
 #undef PM
 
 void cpu_cache_init(void)
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 46b13780c2c8..a43047b1030d 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -432,6 +432,14 @@ static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addres
  * To be differentiate with macro pte_mkyoung, this macro is used on platforms
  * where software maintains page access bit.
  */
+#ifndef pte_sw_mkyoung
+static inline pte_t pte_sw_mkyoung(pte_t pte)
+{
+	return pte;
+}
+#define pte_sw_mkyoung	pte_sw_mkyoung
+#endif
+
 #ifndef pte_savedwrite
 #define pte_savedwrite pte_write
 #endif
diff --git a/mm/memory.c b/mm/memory.c
index 730daa00952b..f3ffab9b9e39 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2939,6 +2939,7 @@ static vm_fault_t wp_page_copy(struct vm_fault *vmf)
 		}
 		flush_cache_page(vma, vmf->address, pte_pfn(vmf->orig_pte));
 		entry = mk_pte(new_page, vma->vm_page_prot);
+		entry = pte_sw_mkyoung(entry);
 		entry = maybe_mkwrite(pte_mkdirty(entry), vma);
 
 		/*
@@ -3602,6 +3603,7 @@ static vm_fault_t do_anonymous_page(struct vm_fault *vmf)
 	__SetPageUptodate(page);
 
 	entry = mk_pte(page, vma->vm_page_prot);
+	entry = pte_sw_mkyoung(entry);
 	if (vma->vm_flags & VM_WRITE)
 		entry = pte_mkwrite(pte_mkdirty(entry));
 
@@ -3786,6 +3788,8 @@ void do_set_pte(struct vm_fault *vmf, struct page *page, unsigned long addr)
 
 	if (prefault && arch_wants_old_prefaulted_pte())
 		entry = pte_mkold(entry);
+	else
+		entry = pte_sw_mkyoung(entry);
 
 	if (write)
 		entry = maybe_mkwrite(pte_mkdirty(entry), vma);
-- 
2.29.2

