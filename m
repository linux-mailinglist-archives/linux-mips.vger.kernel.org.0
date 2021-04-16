Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0FF1361C52
	for <lists+linux-mips@lfdr.de>; Fri, 16 Apr 2021 11:01:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241433AbhDPIsy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 16 Apr 2021 04:48:54 -0400
Received: from mail.loongson.cn ([114.242.206.163]:42360 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S241188AbhDPIsY (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 16 Apr 2021 04:48:24 -0400
Received: from bogon.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxbcgiT3lg36UIAA--.12141S2;
        Fri, 16 Apr 2021 16:47:30 +0800 (CST)
From:   Youling Tang <tangyouling@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] MIPS: mm: Add ARCH_HAS_SET_MEMORY support
Date:   Fri, 16 Apr 2021 16:47:21 +0800
Message-Id: <1618562842-20915-1-git-send-email-tangyouling@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9AxbcgiT3lg36UIAA--.12141S2
X-Coremail-Antispam: 1UD129KBjvJXoW3GrWrKF1kKFWDAw4kKry7Awb_yoWxJFy7pa
        1kAa4kArW2g343GayxuryDur1fJwn5GFW8tFyay34j9asxXFyYvr93trW7tr1UGrWDWF47
        GayYga4UuF47X37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkSb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
        C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
        0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Cr0_Gr
        1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE14v_GFyl42xK
        82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGw
        C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48J
        MIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
        IF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
        6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU48sqDUUUU
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add set_memory_ro/rw/x/nx/rw_nx architecture hooks. These set_memory_*
and set_pages_* APIs can make it easier to change the attributes of
memory or pages. Similar to the implementation of riscv.

The declaration of set_memory_* functions uses the general set_memory.h
(i.e. include/asm-generic/set_memory.h).

Signed-off-by: Youling Tang <tangyouling@loongson.cn>
---
 arch/mips/Kconfig                  |   1 +
 arch/mips/include/asm/set_memory.h |  19 +++++
 arch/mips/mm/Makefile              |   1 +
 arch/mips/mm/pageattr.c            | 157 +++++++++++++++++++++++++++++++++++++
 4 files changed, 178 insertions(+)
 create mode 100644 arch/mips/include/asm/set_memory.h
 create mode 100644 arch/mips/mm/pageattr.c

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index e9893cd..ddeefd4 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -12,6 +12,7 @@ config MIPS
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
 	select ARCH_HAS_GCOV_PROFILE_ALL
+	select ARCH_HAS_SET_MEMORY
 	select ARCH_KEEP_MEMBLOCK if DEBUG_KERNEL
 	select ARCH_SUPPORTS_UPROBES
 	select ARCH_USE_BUILTIN_BSWAP
diff --git a/arch/mips/include/asm/set_memory.h b/arch/mips/include/asm/set_memory.h
new file mode 100644
index 0000000..42217eb
--- /dev/null
+++ b/arch/mips/include/asm/set_memory.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef _ASM_MIPS_SET_MEMORY_H
+#define _ASM_MIPS_SET_MEMORY_H
+
+#include <asm-generic/set_memory.h>
+
+struct pageattr_masks {
+	pgprot_t set_mask;
+	pgprot_t clear_mask;
+};
+
+/*
+ * Functions to change pages attributes.
+ */
+int set_pages_ro(struct page *page, int numpages);
+int set_pages_rw(struct page *page, int numpages);
+
+#endif /* _ASM_MIPS_SET_MEMORY_H */
diff --git a/arch/mips/mm/Makefile b/arch/mips/mm/Makefile
index 4acc4f3..2022940 100644
--- a/arch/mips/mm/Makefile
+++ b/arch/mips/mm/Makefile
@@ -12,6 +12,7 @@ obj-y				+= mmap.o
 obj-y				+= page.o
 obj-y				+= page-funcs.o
 obj-y				+= pgtable.o
+obj-y				+= pageattr.o
 obj-y				+= tlbex.o
 obj-y				+= tlbex-fault.o
 obj-y				+= tlb-funcs.o
diff --git a/arch/mips/mm/pageattr.c b/arch/mips/mm/pageattr.c
new file mode 100644
index 0000000..59db16e
--- /dev/null
+++ b/arch/mips/mm/pageattr.c
@@ -0,0 +1,157 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/pagewalk.h>
+#include <linux/pgtable.h>
+#include <asm/tlbflush.h>
+#include <asm/bitops.h>
+#include <asm/set_memory.h>
+
+static unsigned long set_pageattr_masks(unsigned long val, struct mm_walk *walk)
+{
+	struct pageattr_masks *masks = walk->private;
+	unsigned long new_val = val;
+
+	new_val &= ~(pgprot_val(masks->clear_mask));
+	new_val |= (pgprot_val(masks->set_mask));
+
+	return new_val;
+}
+
+static int pageattr_pgd_entry(pgd_t *pgd, unsigned long addr,
+			      unsigned long next, struct mm_walk *walk)
+{
+	pgd_t val = READ_ONCE(*pgd);
+
+	if (pgd_leaf(val)) {
+		val = __pgd(set_pageattr_masks(pgd_val(val), walk));
+		set_pgd(pgd, val);
+	}
+
+	return 0;
+}
+
+static int pageattr_p4d_entry(p4d_t *p4d, unsigned long addr,
+			      unsigned long next, struct mm_walk *walk)
+{
+	p4d_t val = READ_ONCE(*p4d);
+
+	if (p4d_leaf(val)) {
+		val = __p4d(set_pageattr_masks(p4d_val(val), walk));
+		set_p4d(p4d, val);
+	}
+
+	return 0;
+}
+
+static int pageattr_pud_entry(pud_t *pud, unsigned long addr,
+			      unsigned long next, struct mm_walk *walk)
+{
+	pud_t val = READ_ONCE(*pud);
+
+	if (pud_leaf(val)) {
+		val = __pud(set_pageattr_masks(pud_val(val), walk));
+		set_pud(pud, val);
+	}
+
+	return 0;
+}
+
+static int pageattr_pmd_entry(pmd_t *pmd, unsigned long addr,
+			      unsigned long next, struct mm_walk *walk)
+{
+	pmd_t val = READ_ONCE(*pmd);
+
+	if (pmd_leaf(val)) {
+		val = __pmd(set_pageattr_masks(pmd_val(val), walk));
+		set_pmd(pmd, val);
+	}
+
+	return 0;
+}
+
+static int pageattr_pte_entry(pte_t *pte, unsigned long addr,
+			      unsigned long next, struct mm_walk *walk)
+{
+	pte_t val = READ_ONCE(*pte);
+
+	val = __pte(set_pageattr_masks(pte_val(val), walk));
+	set_pte(pte, val);
+
+	return 0;
+}
+
+static int pageattr_pte_hole(unsigned long addr, unsigned long next,
+			     int depth, struct mm_walk *walk)
+{
+	/* Nothing to do here */
+	return 0;
+}
+
+static const struct mm_walk_ops pageattr_ops = {
+	.pgd_entry = pageattr_pgd_entry,
+	.p4d_entry = pageattr_p4d_entry,
+	.pud_entry = pageattr_pud_entry,
+	.pmd_entry = pageattr_pmd_entry,
+	.pte_entry = pageattr_pte_entry,
+	.pte_hole = pageattr_pte_hole,
+};
+
+static int __set_memory(unsigned long addr, int numpages, pgprot_t set_mask,
+			pgprot_t clear_mask)
+{
+	int ret;
+	unsigned long start = addr;
+	unsigned long end = start + PAGE_SIZE * numpages;
+	struct pageattr_masks masks = {
+		.set_mask = set_mask,
+		.clear_mask = clear_mask
+	};
+
+	if (!numpages)
+		return 0;
+
+	mmap_read_lock(&init_mm);
+	ret =  walk_page_range_novma(&init_mm, start, end, &pageattr_ops, NULL,
+				     &masks);
+	mmap_read_unlock(&init_mm);
+
+	flush_tlb_kernel_range(start, end);
+
+	return ret;
+}
+
+int set_memory_ro(unsigned long addr, int numpages)
+{
+	return __set_memory(addr, numpages, __pgprot(__READABLE),
+			    __pgprot(_PAGE_WRITE));
+}
+
+int set_memory_rw(unsigned long addr, int numpages)
+{
+	return __set_memory(addr, numpages, __pgprot(__WRITEABLE | __READABLE),
+			    __pgprot(0));
+}
+
+int set_memory_x(unsigned long addr, int numpages)
+{
+	return __set_memory(addr, numpages, __pgprot(0), __pgprot(_PAGE_NO_EXEC));
+}
+
+int set_memory_nx(unsigned long addr, int numpages)
+{
+	return __set_memory(addr, numpages, __pgprot(_PAGE_NO_EXEC), __pgprot(0));
+}
+
+int set_pages_ro(struct page *page, int numpages)
+{
+	unsigned long addr = (unsigned long)page_address(page);
+
+	return set_memory_ro(addr, numpages);
+}
+
+int set_pages_rw(struct page *page, int numpages)
+{
+	unsigned long addr = (unsigned long)page_address(page);
+
+	return set_memory_rw(addr, numpages);
+}
-- 
2.1.0

