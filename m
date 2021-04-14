Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63AD135ED37
	for <lists+linux-mips@lfdr.de>; Wed, 14 Apr 2021 08:26:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347817AbhDNGZ3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 14 Apr 2021 02:25:29 -0400
Received: from mail.loongson.cn ([114.242.206.163]:40146 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1347804AbhDNGZZ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 14 Apr 2021 02:25:25 -0400
Received: from bogon.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxT8u8inZg+9sHAA--.14819S2;
        Wed, 14 Apr 2021 14:25:01 +0800 (CST)
From:   Youling Tang <tangyouling@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: pgtable: Add swp pte related macros definition and check
Date:   Wed, 14 Apr 2021 14:25:00 +0800
Message-Id: <1618381500-31258-1-git-send-email-tangyouling@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9DxT8u8inZg+9sHAA--.14819S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJw4kAr1rXFWxAFW5AryfCrg_yoW7JF13pw
        nxCFZIqrWrAFWxKr4fJF1FqF1fZw4UGr17WFZI9w4DJa4jgas5JFW29r43JryvqFWvv343
        u3yDtrn8urW3AFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkab7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4
        vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
        F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F
        4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE14v_GF1l42xK
        82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGw
        C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48J
        MIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
        IF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
        6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07bz1v-UUUUU=
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add definitions for the bit masks/shifts/sizes, and implement
MAX_SWAPFILES_CHECK() such that we fail to build if we are
unable to properly encode the swp type field.

Signed-off-by: Youling Tang <tangyouling@loongson.cn>
---
 arch/mips/include/asm/pgtable-32.h | 32 ++++++++++++++++++++------------
 arch/mips/include/asm/pgtable-64.h | 18 +++++++++++++++---
 2 files changed, 35 insertions(+), 15 deletions(-)

diff --git a/arch/mips/include/asm/pgtable-32.h b/arch/mips/include/asm/pgtable-32.h
index 6c0532d..3ec12ce 100644
--- a/arch/mips/include/asm/pgtable-32.h
+++ b/arch/mips/include/asm/pgtable-32.h
@@ -201,9 +201,8 @@ static inline pte_t pfn_pte(unsigned long pfn, pgprot_t prot)
 #if defined(CONFIG_CPU_R3K_TLB)
 
 /* Swap entries must have VALID bit cleared. */
-#define __swp_type(x)			(((x).val >> 10) & 0x1f)
-#define __swp_offset(x)			((x).val >> 15)
-#define __swp_entry(type,offset)	((swp_entry_t) { ((type) << 10) | ((offset) << 15) })
+#define __SWP_TYPE_SHIFT	10
+
 #define __pte_to_swp_entry(pte)		((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)		((pte_t) { (x).val })
 
@@ -212,18 +211,16 @@ static inline pte_t pfn_pte(unsigned long pfn, pgprot_t prot)
 #if defined(CONFIG_XPA)
 
 /* Swap entries must have VALID and GLOBAL bits cleared. */
-#define __swp_type(x)			(((x).val >> 4) & 0x1f)
-#define __swp_offset(x)			 ((x).val >> 9)
-#define __swp_entry(type,offset)	((swp_entry_t)  { ((type) << 4) | ((offset) << 9) })
+#define __SWP_TYPE_SHIFT	4
+
 #define __pte_to_swp_entry(pte)		((swp_entry_t) { (pte).pte_high })
 #define __swp_entry_to_pte(x)		((pte_t) { 0, (x).val })
 
 #elif defined(CONFIG_PHYS_ADDR_T_64BIT) && defined(CONFIG_CPU_MIPS32)
 
 /* Swap entries must have VALID and GLOBAL bits cleared. */
-#define __swp_type(x)			(((x).val >> 2) & 0x1f)
-#define __swp_offset(x)			 ((x).val >> 7)
-#define __swp_entry(type, offset)	((swp_entry_t)  { ((type) << 2) | ((offset) << 7) })
+#define __SWP_TYPE_SHIFT	2
+
 #define __pte_to_swp_entry(pte)		((swp_entry_t) { (pte).pte_high })
 #define __swp_entry_to_pte(x)		((pte_t) { 0, (x).val })
 
@@ -235,9 +232,8 @@ static inline pte_t pfn_pte(unsigned long pfn, pgprot_t prot)
  *      _PAGE_GLOBAL at bit 6
  *      _PAGE_VALID at bit 7
  */
-#define __swp_type(x)			(((x).val >> 8) & 0x1f)
-#define __swp_offset(x)			 ((x).val >> 13)
-#define __swp_entry(type,offset)	((swp_entry_t)	{ ((type) << 8) | ((offset) << 13) })
+#define __SWP_TYPE_SHIFT	8
+
 #define __pte_to_swp_entry(pte)		((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)		((pte_t) { (x).val })
 
@@ -245,4 +241,16 @@ static inline pte_t pfn_pte(unsigned long pfn, pgprot_t prot)
 
 #endif /* defined(CONFIG_CPU_R3K_TLB) */
 
+#define __SWP_TYPE_BITS		5
+#define __SWP_TYPE_MASK		((1UL << __SWP_TYPE_BITS) - 1)
+#define __SWP_OFFSET_SHIFT	(__SWP_TYPE_BITS + __SWP_TYPE_SHIFT)
+
+#define MAX_SWAPFILES_CHECK()	\
+	BUILD_BUG_ON(MAX_SWAPFILES_SHIFT > __SWP_TYPE_BITS)
+
+#define __swp_type(x)			(((x).val >> __SWP_TYPE_SHIFT) & __SWP_TYPE_MASK)
+#define __swp_offset(x)			((x).val >> __SWP_OFFSET_SHIFT)
+#define __swp_entry(type,offset)	((swp_entry_t) { ((type) << __SWP_TYPE_SHIFT) | \
+						((offset) << __SWP_OFFSET_SHIFT) })
+
 #endif /* _ASM_PGTABLE_32_H */
diff --git a/arch/mips/include/asm/pgtable-64.h b/arch/mips/include/asm/pgtable-64.h
index 1e7d6ce..d064444 100644
--- a/arch/mips/include/asm/pgtable-64.h
+++ b/arch/mips/include/asm/pgtable-64.h
@@ -330,15 +330,27 @@ extern void pgd_init(unsigned long page);
 extern void pud_init(unsigned long page, unsigned long pagetable);
 extern void pmd_init(unsigned long page, unsigned long pagetable);
 
+#define __SWP_TYPE_SHIFT	16
+#define __SWP_TYPE_BITS		8
+#define __SWP_TYPE_MASK		((1UL << __SWP_TYPE_BITS) - 1)
+#define __SWP_OFFSET_SHIFT	(__SWP_TYPE_BITS + __SWP_TYPE_SHIFT)
+
+#define MAX_SWAPFILES_CHECK()	\
+	BUILD_BUG_ON(MAX_SWAPFILES_SHIFT > __SWP_TYPE_BITS)
+
 /*
  * Non-present pages:  high 40 bits are offset, next 8 bits type,
  * low 16 bits zero.
  */
 static inline pte_t mk_swap_pte(unsigned long type, unsigned long offset)
-{ pte_t pte; pte_val(pte) = (type << 16) | (offset << 24); return pte; }
+{
+	pte_t pte;
+	pte_val(pte) = (type << __SWP_TYPE_SHIFT) | (offset << __SWP_OFFSET_SHIFT);
+	return pte;
+}
 
-#define __swp_type(x)		(((x).val >> 16) & 0xff)
-#define __swp_offset(x)		((x).val >> 24)
+#define __swp_type(x)		(((x).val >> __SWP_TYPE_SHIFT) & __SWP_TYPE_MASK)
+#define __swp_offset(x)		((x).val >> __SWP_OFFSET_SHIFT)
 #define __swp_entry(type, offset) ((swp_entry_t) { pte_val(mk_swap_pte((type), (offset))) })
 #define __pte_to_swp_entry(pte) ((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)	((pte_t) { (x).val })
-- 
2.1.0

