Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62DD41B227A
	for <lists+linux-mips@lfdr.de>; Tue, 21 Apr 2020 11:16:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726120AbgDUJQI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Apr 2020 05:16:08 -0400
Received: from mail.loongson.cn ([114.242.206.163]:36824 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726018AbgDUJQI (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 21 Apr 2020 05:16:08 -0400
Received: from localhost.loongson.cn (unknown [10.40.23.12])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr2uvuZ5eTnwqAA--.4S2;
        Tue, 21 Apr 2020 17:15:27 +0800 (CST)
From:   Guoyun Sun <sunguoyun@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>
Cc:     Daniel Silsby <dansilsby@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Dmitry Korotin <dkorotin@wavecomp.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Steven Price <steven.price@arm.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Guoyun Sun <sunguoyun@loongson.cn>,
        TieZhu Yang <yangtiezhu@loongson.cn>,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH] mips/mm: Add page soft dirty tracking
Date:   Tue, 21 Apr 2020 17:15:27 +0800
Message-Id: <1587460527-13986-1-git-send-email-sunguoyun@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dxr2uvuZ5eTnwqAA--.4S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCw13ZrWktryDXr4rGw1kGrg_yoWrur1kpa
        n5AFsYvrWFgF4xKayftrs3KrW3urs7JFy5Wr9rKw4UGa45J3y8Xr4Sgr4YvrWrXFW8Aa4r
        WrZYqa15GrW2y3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
        Y2ka0xkIwI1lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
        4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
        67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
        x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAI
        cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kf
        nxnUUI43ZEXa7VUb0D73UUUUU==
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
 arch/mips/Kconfig                    |  1 +
 arch/mips/include/asm/pgtable-bits.h |  8 ++++--
 arch/mips/include/asm/pgtable.h      | 48 ++++++++++++++++++++++++++++++++++--
 3 files changed, 53 insertions(+), 4 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 690718b..642fb47 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -491,6 +491,7 @@ config MACH_LOONGSON64
 	select COMMON_CLK
 	select USE_OF
 	select BUILTIN_DTB
+	select HAVE_ARCH_SOFT_DIRTY
 	help
 	  This enables the support of Loongson-2/3 family of machines.
 
diff --git a/arch/mips/include/asm/pgtable-bits.h b/arch/mips/include/asm/pgtable-bits.h
index 4da79b8..d43fb6f 100644
--- a/arch/mips/include/asm/pgtable-bits.h
+++ b/arch/mips/include/asm/pgtable-bits.h
@@ -55,6 +55,7 @@ enum pgtable_bits {
 #if defined(CONFIG_ARCH_HAS_PTE_SPECIAL)
 	_PAGE_SPECIAL_SHIFT,
 #endif
+	_PAGE_SOFT_DIRTY_SHIFT,
 };
 
 /*
@@ -84,6 +85,7 @@ enum pgtable_bits {
 #if defined(CONFIG_ARCH_HAS_PTE_SPECIAL)
 	_PAGE_SPECIAL_SHIFT,
 #endif
+	_PAGE_SOFT_DIRTY_SHIFT,
 };
 
 #elif defined(CONFIG_CPU_R3K_TLB)
@@ -99,6 +101,7 @@ enum pgtable_bits {
 #if defined(CONFIG_ARCH_HAS_PTE_SPECIAL)
 	_PAGE_SPECIAL_SHIFT,
 #endif
+	_PAGE_SOFT_DIRTY_SHIFT,
 
 	/* Used by TLB hardware (placed in EntryLo) */
 	_PAGE_GLOBAL_SHIFT = 8,
@@ -125,7 +128,7 @@ enum pgtable_bits {
 #if defined(CONFIG_ARCH_HAS_PTE_SPECIAL)
 	_PAGE_SPECIAL_SHIFT,
 #endif
-
+	_PAGE_SOFT_DIRTY_SHIFT,
 	/* Used by TLB hardware (placed in EntryLo*) */
 #if defined(CONFIG_CPU_HAS_RIXI)
 	_PAGE_NO_EXEC_SHIFT,
@@ -152,6 +155,7 @@ enum pgtable_bits {
 #else
 # define _PAGE_SPECIAL		0
 #endif
+#define _PAGE_SOFT_DIRTY	(1 << _PAGE_SOFT_DIRTY_SHIFT)
 
 /* Used by TLB hardware (placed in EntryLo*) */
 #if defined(CONFIG_XPA)
@@ -269,6 +273,6 @@ static inline uint64_t pte_to_entrylo(unsigned long pte_val)
 #define __WRITEABLE	(_PAGE_SILENT_WRITE | _PAGE_WRITE | _PAGE_MODIFIED)
 
 #define _PAGE_CHG_MASK	(_PAGE_ACCESSED | _PAGE_MODIFIED |	\
-			 _PFN_MASK | _CACHE_MASK)
+			 _PAGE_SOFT_DIRTY | _PFN_MASK | _CACHE_MASK)
 
 #endif /* _ASM_PGTABLE_BITS_H */
diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
index f1801e7..64b07ff 100644
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
@@ -579,7 +603,7 @@ static inline pmd_t pmd_mkclean(pmd_t pmd)
 
 static inline pmd_t pmd_mkdirty(pmd_t pmd)
 {
-	pmd_val(pmd) |= _PAGE_MODIFIED;
+	pmd_val(pmd) |= _PAGE_MODIFIED | _PAGE_SOFT_DIRTY;
 	if (pmd_val(pmd) & _PAGE_WRITE)
 		pmd_val(pmd) |= _PAGE_SILENT_WRITE;
 
@@ -608,6 +632,26 @@ static inline pmd_t pmd_mkyoung(pmd_t pmd)
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

