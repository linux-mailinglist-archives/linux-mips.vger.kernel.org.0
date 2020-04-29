Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E00491BD777
	for <lists+linux-mips@lfdr.de>; Wed, 29 Apr 2020 10:44:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726423AbgD2Ioz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Apr 2020 04:44:55 -0400
Received: from mail.loongson.cn ([114.242.206.163]:60904 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726345AbgD2Ioy (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 29 Apr 2020 04:44:54 -0400
Received: from localhost.cn (unknown [10.40.23.12])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL2twPqleuLMtAA--.20S2;
        Wed, 29 Apr 2020 16:44:33 +0800 (CST)
From:   Guoyun Sun <sunguoyun@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Paul Burton <paulburton@kernel.org>,
        Daniel Silsby <dansilsby@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Guoyun Sun <sunguoyun@loongson.cn>
Subject: [PATCH v2] mips/mm: Add page soft dirty tracking
Date:   Wed, 29 Apr 2020 16:44:32 +0800
Message-Id: <1588149872-9780-1-git-send-email-sunguoyun@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9DxL2twPqleuLMtAA--.20S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCw1xuw4rXr17Gr47Ary3twb_yoWrZw1rpF
        s5JF4FvFWFqFWxKayftrs3Krya9rs7XFy5Xr9rGF4UKa45J3y8XFWagr4YvrZ5XFW8Aayr
        XrWvqw45GrW2y3DanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvI14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
        xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        64x0Y40En7xvr7AKxVWUJVW8JwAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI
        0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CE
        Vc8vx2IErcIFxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c
        02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_
        GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
        CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE
        14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf
        9x0JUDrcfUUUUU=
X-CM-SenderInfo: 5vxqw3hr1x0qxorr0wxvrqhubq/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

User space checkpoint and restart tool (CRIU) needs the page's change
to be soft tracked. This allows to do a pre checkpoint and then dump
only touched pages.

Signed-off-by: Guoyun Sun <sunguoyun@loongson.cn>
---
 arch/mips/include/asm/pgtable-bits.h | 20 +++++++++++++--
 arch/mips/include/asm/pgtable.h      | 48 ++++++++++++++++++++++++++++++++++--
 2 files changed, 64 insertions(+), 4 deletions(-)

diff --git a/arch/mips/include/asm/pgtable-bits.h b/arch/mips/include/asm/pgtable-bits.h
index 4da79b8..e26dc41 100644
--- a/arch/mips/include/asm/pgtable-bits.h
+++ b/arch/mips/include/asm/pgtable-bits.h
@@ -55,6 +55,9 @@ enum pgtable_bits {
 #if defined(CONFIG_ARCH_HAS_PTE_SPECIAL)
 	_PAGE_SPECIAL_SHIFT,
 #endif
+#if defined(CONFIG_HAVE_ARCH_SOFT_DIRTY)
+	_PAGE_SOFT_DIRTY_SHIFT,
+#endif
 };
 
 /*
@@ -84,6 +87,9 @@ enum pgtable_bits {
 #if defined(CONFIG_ARCH_HAS_PTE_SPECIAL)
 	_PAGE_SPECIAL_SHIFT,
 #endif
+#if defined(CONFIG_HAVE_ARCH_SOFT_DIRTY)
+	_PAGE_SOFT_DIRTY_SHIFT,
+#endif
 };
 
 #elif defined(CONFIG_CPU_R3K_TLB)
@@ -99,6 +105,9 @@ enum pgtable_bits {
 #if defined(CONFIG_ARCH_HAS_PTE_SPECIAL)
 	_PAGE_SPECIAL_SHIFT,
 #endif
+#if defined(CONFIG_HAVE_ARCH_SOFT_DIRTY)
+	_PAGE_SOFT_DIRTY_SHIFT,
+#endif
 
 	/* Used by TLB hardware (placed in EntryLo) */
 	_PAGE_GLOBAL_SHIFT = 8,
@@ -125,7 +134,9 @@ enum pgtable_bits {
 #if defined(CONFIG_ARCH_HAS_PTE_SPECIAL)
 	_PAGE_SPECIAL_SHIFT,
 #endif
-
+#if defined(CONFIG_HAVE_ARCH_SOFT_DIRTY)
+	_PAGE_SOFT_DIRTY_SHIFT,
+#endif
 	/* Used by TLB hardware (placed in EntryLo*) */
 #if defined(CONFIG_CPU_HAS_RIXI)
 	_PAGE_NO_EXEC_SHIFT,
@@ -152,6 +163,11 @@ enum pgtable_bits {
 #else
 # define _PAGE_SPECIAL		0
 #endif
+#if defined(CONFIG_HAVE_ARCH_SOFT_DIRTY)
+# define _PAGE_SOFT_DIRTY	(1 << _PAGE_SOFT_DIRTY_SHIFT)
+#else
+# define _PAGE_SOFT_DIRTY	0
+#endif
 
 /* Used by TLB hardware (placed in EntryLo*) */
 #if defined(CONFIG_XPA)
@@ -269,6 +285,6 @@ static inline uint64_t pte_to_entrylo(unsigned long pte_val)
 #define __WRITEABLE	(_PAGE_SILENT_WRITE | _PAGE_WRITE | _PAGE_MODIFIED)
 
 #define _PAGE_CHG_MASK	(_PAGE_ACCESSED | _PAGE_MODIFIED |	\
-			 _PFN_MASK | _CACHE_MASK)
+			 _PAGE_SOFT_DIRTY | _PFN_MASK | _CACHE_MASK)
 
 #endif /* _ASM_PGTABLE_BITS_H */
diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
index aab0ec1..9b01d2d 100644
--- a/arch/mips/include/asm/pgtable.h
+++ b/arch/mips/include/asm/pgtable.h
@@ -400,7 +400,7 @@ static inline pte_t pte_mkwrite(pte_t pte)
 
 static inline pte_t pte_mkdirty(pte_t pte)
 {
-	pte_val(pte) |= _PAGE_MODIFIED;
+	pte_val(pte) |= _PAGE_MODIFIED | _PAGE_SOFT_DIRTY;
 	if (pte_val(pte) & _PAGE_WRITE)
 		pte_val(pte) |= _PAGE_SILENT_WRITE;
 	return pte;
@@ -423,6 +423,30 @@ static inline pte_t pte_mkhuge(pte_t pte)
 	return pte;
 }
 #endif /* CONFIG_MIPS_HUGE_TLB_SUPPORT */
+
+#ifdef CONFIG_HAVE_ARCH_SOFT_DIRTY
+static inline bool pte_soft_dirty(pte_t pte)
+{
+	return pte_val(pte) & _PAGE_SOFT_DIRTY;
+}
+#define pte_swp_soft_dirty pte_soft_dirty
+
+static inline pte_t pte_mksoft_dirty(pte_t pte)
+{
+	pte_val(pte) |= _PAGE_SOFT_DIRTY;
+	return pte;
+}
+#define pte_swp_mksoft_dirty pte_mksoft_dirty
+
+static inline pte_t pte_clear_soft_dirty(pte_t pte)
+{
+	pte_val(pte) &= ~(_PAGE_SOFT_DIRTY);
+	return pte;
+}
+#define pte_swp_clear_soft_dirty pte_clear_soft_dirty
+
+#endif /* CONFIG_HAVE_ARCH_SOFT_DIRTY */
+
 #endif
 
 /*
@@ -576,7 +600,7 @@ static inline pmd_t pmd_mkclean(pmd_t pmd)
 
 static inline pmd_t pmd_mkdirty(pmd_t pmd)
 {
-	pmd_val(pmd) |= _PAGE_MODIFIED;
+	pmd_val(pmd) |= _PAGE_MODIFIED | _PAGE_SOFT_DIRTY;
 	if (pmd_val(pmd) & _PAGE_WRITE)
 		pmd_val(pmd) |= _PAGE_SILENT_WRITE;
 
@@ -605,6 +629,26 @@ static inline pmd_t pmd_mkyoung(pmd_t pmd)
 	return pmd;
 }
 
+#ifdef CONFIG_HAVE_ARCH_SOFT_DIRTY
+static inline int pmd_soft_dirty(pmd_t pmd)
+{
+	return !!(pmd_val(pmd) & _PAGE_SOFT_DIRTY);
+}
+
+static inline pmd_t pmd_mksoft_dirty(pmd_t pmd)
+{
+	pmd_val(pmd) |= _PAGE_SOFT_DIRTY;
+	return pmd;
+}
+
+static inline pmd_t pmd_clear_soft_dirty(pmd_t pmd)
+{
+	pmd_val(pmd) &= ~(_PAGE_SOFT_DIRTY);
+	return pmd;
+}
+
+#endif /* CONFIG_HAVE_ARCH_SOFT_DIRTY */
+
 /* Extern to avoid header file madness */
 extern pmd_t mk_pmd(struct page *page, pgprot_t prot);
 
-- 
2.1.0

