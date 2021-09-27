Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A53DA418DE7
	for <lists+linux-mips@lfdr.de>; Mon, 27 Sep 2021 05:21:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232466AbhI0DWh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 26 Sep 2021 23:22:37 -0400
Received: from foss.arm.com ([217.140.110.172]:41302 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230469AbhI0DWf (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 26 Sep 2021 23:22:35 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2779FD6E;
        Sun, 26 Sep 2021 20:20:58 -0700 (PDT)
Received: from p8cg001049571a15.arm.com (unknown [10.163.73.35])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0DB483F7B4;
        Sun, 26 Sep 2021 20:20:54 -0700 (PDT)
From:   Anshuman Khandual <anshuman.khandual@arm.com>
To:     linux-mm@kvack.org
Cc:     Anshuman Khandual <anshuman.khandual@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "David S. Miller" <davem@davemloft.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-mips@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] mm/mmap: Define index macros for protection_map[]
Date:   Mon, 27 Sep 2021 08:52:00 +0530
Message-Id: <1632712920-8171-1-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

protection_map[] maps the lower four bits from vm_flags into platform page
protection mask. Default initialization (and possible re-initialization in
the platform) does not make it clear that these indices are just derived
from various vm_flags protections (VM_SHARED, VM_READ, VM_WRITE, VM_EXEC).
This defines macros for protection_map[] indices which concatenate various
vm_flag attributes, making it clear and explicit.

Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mips@vger.kernel.org
Cc: sparclinux@vger.kernel.org
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
This applies on v5.15-rc3 after the following patch.

https://lore.kernel.org/all/20210924060821.1138281-1-guoren@kernel.org/

 arch/mips/mm/cache.c    | 34 +++++++++++++++++-----------------
 arch/sparc/mm/init_64.c | 32 ++++++++++++++++----------------
 include/linux/mm.h      | 31 +++++++++++++++++++++++++++++++
 mm/debug_vm_pgtable.c   |  8 ++++----
 mm/mmap.c               | 18 ++++++++++++++++--
 5 files changed, 84 insertions(+), 39 deletions(-)

diff --git a/arch/mips/mm/cache.c b/arch/mips/mm/cache.c
index 830ab91e574f..d0197cc1fb5a 100644
--- a/arch/mips/mm/cache.c
+++ b/arch/mips/mm/cache.c
@@ -161,24 +161,24 @@ EXPORT_SYMBOL(_page_cachable_default);
 
 static inline void setup_protection_map(void)
 {
-	protection_map[0]  = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_NO_READ);
-	protection_map[1]  = PM(_PAGE_PRESENT | _PAGE_NO_EXEC);
-	protection_map[2]  = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_NO_READ);
-	protection_map[3]  = PM(_PAGE_PRESENT | _PAGE_NO_EXEC);
-	protection_map[4]  = PM(_PAGE_PRESENT);
-	protection_map[5]  = PM(_PAGE_PRESENT);
-	protection_map[6]  = PM(_PAGE_PRESENT);
-	protection_map[7]  = PM(_PAGE_PRESENT);
-
-	protection_map[8]  = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_NO_READ);
-	protection_map[9]  = PM(_PAGE_PRESENT | _PAGE_NO_EXEC);
-	protection_map[10] = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_WRITE |
+	protection_map[PROTMAP_IDX_XXXX] = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_NO_READ);
+	protection_map[PROTMAP_IDX_XRXX] = PM(_PAGE_PRESENT | _PAGE_NO_EXEC);
+	protection_map[PROTMAP_IDX_XXWX] = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_NO_READ);
+	protection_map[PROTMAP_IDX_XRWX] = PM(_PAGE_PRESENT | _PAGE_NO_EXEC);
+	protection_map[PROTMAP_IDX_XXXE] = PM(_PAGE_PRESENT);
+	protection_map[PROTMAP_IDX_XRXE] = PM(_PAGE_PRESENT);
+	protection_map[PROTMAP_IDX_XXWE] = PM(_PAGE_PRESENT);
+	protection_map[PROTMAP_IDX_XRWE] = PM(_PAGE_PRESENT);
+
+	protection_map[PROTMAP_IDX_SXXX] = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_NO_READ);
+	protection_map[PROTMAP_IDX_SRXX] = PM(_PAGE_PRESENT | _PAGE_NO_EXEC);
+	protection_map[PROTMAP_IDX_SXWX] = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_WRITE |
 				_PAGE_NO_READ);
-	protection_map[11] = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_WRITE);
-	protection_map[12] = PM(_PAGE_PRESENT);
-	protection_map[13] = PM(_PAGE_PRESENT);
-	protection_map[14] = PM(_PAGE_PRESENT | _PAGE_WRITE);
-	protection_map[15] = PM(_PAGE_PRESENT | _PAGE_WRITE);
+	protection_map[PROTMAP_IDX_SRWX] = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_WRITE);
+	protection_map[PROTMAP_IDX_SXXE] = PM(_PAGE_PRESENT);
+	protection_map[PROTMAP_IDX_SRXE] = PM(_PAGE_PRESENT);
+	protection_map[PROTMAP_IDX_SXWE] = PM(_PAGE_PRESENT | _PAGE_WRITE);
+	protection_map[PROTMAP_IDX_SRWE] = PM(_PAGE_PRESENT | _PAGE_WRITE);
 }
 
 #undef PM
diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
index 1b23639e2fcd..1a7fe97c8167 100644
--- a/arch/sparc/mm/init_64.c
+++ b/arch/sparc/mm/init_64.c
@@ -2642,22 +2642,22 @@ static void prot_init_common(unsigned long page_none,
 	PAGE_COPY = __pgprot(page_copy);
 	PAGE_SHARED = __pgprot(page_shared);
 
-	protection_map[0x0] = __pgprot(page_none);
-	protection_map[0x1] = __pgprot(page_readonly & ~page_exec_bit);
-	protection_map[0x2] = __pgprot(page_copy & ~page_exec_bit);
-	protection_map[0x3] = __pgprot(page_copy & ~page_exec_bit);
-	protection_map[0x4] = __pgprot(page_readonly);
-	protection_map[0x5] = __pgprot(page_readonly);
-	protection_map[0x6] = __pgprot(page_copy);
-	protection_map[0x7] = __pgprot(page_copy);
-	protection_map[0x8] = __pgprot(page_none);
-	protection_map[0x9] = __pgprot(page_readonly & ~page_exec_bit);
-	protection_map[0xa] = __pgprot(page_shared & ~page_exec_bit);
-	protection_map[0xb] = __pgprot(page_shared & ~page_exec_bit);
-	protection_map[0xc] = __pgprot(page_readonly);
-	protection_map[0xd] = __pgprot(page_readonly);
-	protection_map[0xe] = __pgprot(page_shared);
-	protection_map[0xf] = __pgprot(page_shared);
+	protection_map[PROTMAP_IDX_XXXX] = __pgprot(page_none);
+	protection_map[PROTMAP_IDX_XRXX] = __pgprot(page_readonly & ~page_exec_bit);
+	protection_map[PROTMAP_IDX_XXWX] = __pgprot(page_copy & ~page_exec_bit);
+	protection_map[PROTMAP_IDX_XRWX] = __pgprot(page_copy & ~page_exec_bit);
+	protection_map[PROTMAP_IDX_XXXE] = __pgprot(page_readonly);
+	protection_map[PROTMAP_IDX_XRXE] = __pgprot(page_readonly);
+	protection_map[PROTMAP_IDX_XXWE] = __pgprot(page_copy);
+	protection_map[PROTMAP_IDX_XRWE] = __pgprot(page_copy);
+	protection_map[PROTMAP_IDX_SXXX] = __pgprot(page_none);
+	protection_map[PROTMAP_IDX_SRXX] = __pgprot(page_readonly & ~page_exec_bit);
+	protection_map[PROTMAP_IDX_SXWX] = __pgprot(page_shared & ~page_exec_bit);
+	protection_map[PROTMAP_IDX_SRWX] = __pgprot(page_shared & ~page_exec_bit);
+	protection_map[PROTMAP_IDX_SXXE] = __pgprot(page_readonly);
+	protection_map[PROTMAP_IDX_SRXE] = __pgprot(page_readonly);
+	protection_map[PROTMAP_IDX_SXWE] = __pgprot(page_shared);
+	protection_map[PROTMAP_IDX_SRWE] = __pgprot(page_shared);
 }
 
 static void __init sun4u_pgprot_init(void)
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 73a52aba448f..4f99a49749a5 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -431,9 +431,40 @@ extern unsigned int kobjsize(const void *objp);
 /*
  * mapping from the currently active vm_flags protection bits (the
  * low four bits) to a page protection mask..
+ *
+ * VM_EXEC ---------------------|
+ *                              |
+ * VM_WRITE ---------------|    |
+ *                         |    |
+ * VM_READ -----------|    |    |
+ *                    |    |    |
+ * VM_SHARED ----|    |    |    |
+ *               |    |    |    |
+ *               v    v    v    v
+ * PROTMAP_IDX_(S|X)(R|X)(W|X)(E|X)
+ *
+ * X - The protection flag is absent
+ *
  */
 extern pgprot_t protection_map[16];
 
+#define PROTMAP_IDX_XXXX (VM_NONE)
+#define PROTMAP_IDX_XRXX (VM_READ)
+#define PROTMAP_IDX_XXWX (VM_WRITE)
+#define PROTMAP_IDX_XRWX (VM_READ | VM_WRITE)
+#define PROTMAP_IDX_XXXE (VM_EXEC)
+#define PROTMAP_IDX_XRXE (VM_READ | VM_EXEC)
+#define PROTMAP_IDX_XXWE (VM_WRITE | VM_EXEC)
+#define PROTMAP_IDX_XRWE (VM_READ | VM_WRITE | VM_EXEC)
+#define PROTMAP_IDX_SXXX (VM_SHARED | VM_NONE)
+#define PROTMAP_IDX_SRXX (VM_SHARED | VM_READ)
+#define PROTMAP_IDX_SXWX (VM_SHARED | VM_WRITE)
+#define PROTMAP_IDX_SRWX (VM_SHARED | VM_READ | VM_WRITE)
+#define PROTMAP_IDX_SXXE (VM_SHARED | VM_EXEC)
+#define PROTMAP_IDX_SRXE (VM_SHARED | VM_READ | VM_EXEC)
+#define PROTMAP_IDX_SXWE (VM_SHARED | VM_WRITE | VM_EXEC)
+#define PROTMAP_IDX_SRWE (VM_SHARED | VM_READ | VM_WRITE | VM_EXEC)
+
 /**
  * enum fault_flag - Fault flag definitions.
  * @FAULT_FLAG_WRITE: Fault was a write fault.
diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
index 228e3954b90c..2e01d0d395bb 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -1104,14 +1104,14 @@ static int __init init_args(struct pgtable_debug_args *args)
 	/*
 	 * Initialize the debugging data.
 	 *
-	 * protection_map[0] (or even protection_map[8]) will help create
-	 * page table entries with PROT_NONE permission as required for
-	 * pxx_protnone_tests().
+	 * protection_map[PROTMAP_IDX_XXXX] (or even protection_map[PROTMAP_IDX_SXXX])
+	 * will help create page table entries with PROT_NONE permission as required
+	 * for pxx_protnone_tests().
 	 */
 	memset(args, 0, sizeof(*args));
 	args->vaddr              = get_random_vaddr();
 	args->page_prot          = vm_get_page_prot(VMFLAGS);
-	args->page_prot_none     = protection_map[0];
+	args->page_prot_none     = protection_map[PROTMAP_IDX_XXXX];
 	args->is_contiguous_page = false;
 	args->pud_pfn            = ULONG_MAX;
 	args->pmd_pfn            = ULONG_MAX;
diff --git a/mm/mmap.c b/mm/mmap.c
index 88dcc5c25225..d38bd4e305f9 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -101,8 +101,22 @@ static void unmap_region(struct mm_struct *mm,
  *								x: (yes) yes
  */
 pgprot_t protection_map[16] __ro_after_init = {
-	__P000, __P001, __P010, __P011, __P100, __P101, __P110, __P111,
-	__S000, __S001, __S010, __S011, __S100, __S101, __S110, __S111
+	[PROTMAP_IDX_XXXX] = __P000,
+	[PROTMAP_IDX_XRXX] = __P001,
+	[PROTMAP_IDX_XXWX] = __P010,
+	[PROTMAP_IDX_XRWX] = __P011,
+	[PROTMAP_IDX_XXXE] = __P100,
+	[PROTMAP_IDX_XRXE] = __P101,
+	[PROTMAP_IDX_XXWE] = __P110,
+	[PROTMAP_IDX_XRWE] = __P111,
+	[PROTMAP_IDX_SXXX] = __S000,
+	[PROTMAP_IDX_SRXX] = __S001,
+	[PROTMAP_IDX_SXWX] = __S010,
+	[PROTMAP_IDX_SRWX] = __S011,
+	[PROTMAP_IDX_SXXE] = __S100,
+	[PROTMAP_IDX_SRXE] = __S101,
+	[PROTMAP_IDX_SXWE] = __S110,
+	[PROTMAP_IDX_SRWE] = __S111
 };
 
 #ifndef CONFIG_ARCH_HAS_FILTER_PGPROT
-- 
2.20.1

