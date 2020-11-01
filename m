Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B97B2A1BC5
	for <lists+linux-mips@lfdr.de>; Sun,  1 Nov 2020 04:33:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726555AbgKADdI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 31 Oct 2020 23:33:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726513AbgKADdI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 31 Oct 2020 23:33:08 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 248B0C0617A6
        for <linux-mips@vger.kernel.org>; Sat, 31 Oct 2020 20:33:08 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id i7so6130932pgh.6
        for <linux-mips@vger.kernel.org>; Sat, 31 Oct 2020 20:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=qej/prGL2d6SmenkAk4t9qcI4pECamccg8Byt8wAasM=;
        b=TYb409xnEABCjPcINaQiCv28PO1YAzzUXHIYQ4JJOGh8ekdpifVe3aVqZWdFhMCAkQ
         ZPWBro4YnfSuD0cBJtNFb1aMfl8DfLzw8qVyUbmP1wks+PGBe2LqdF9QHCXP3L5CqgEj
         vS6N71ipfprsrk9Eyejy/LcuFejZeBcjEEP1Kz0/iSNodCnqLlLLu5lXxGqfyffl1Dby
         eDAXiy0YsSOjjYoy5Zqz9Sprb3Flqa+5YgwWSbAZQ4LRYI11dE/4jZqz907sMPMz1nC/
         tw6WKjQyIvsF7/NIw/Q+US2i4XTMV+EoonpTV82/Mx+UyYex2j7MeQ+gs+qeykXx9aow
         GS3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=qej/prGL2d6SmenkAk4t9qcI4pECamccg8Byt8wAasM=;
        b=aTa77XGBge7FMhOy480vx+DAdkxh98jwOfL4wZ+FvRM4nTa1rITWvvRtz5NNUB3+b3
         hTAFNq73TeVT6WPFHqUr65PELuHQZq4t2CmP58g5hq0cpJpB4u7cpff+3MZn/hUeNAdx
         olZhvNeqPSR2JDoB6ESM1+sDE2qRf3YM6ngEYGauVR4FP4r3gT/bcZ+WX78t22WxesY9
         ggqs8nFqxN73Zo4kniDB67msyU03P98tMiocG7KJQEmhjEv8GxOh6ICSAey+WoGGckJY
         WOW43H+fOd6bN4uDnyMQpwMz/sjXFaWEtKJtcC+BGs77/bxnpUSJnMEX1EtNk8psV66y
         JH5A==
X-Gm-Message-State: AOAM530uFr9PHyEC4R3mRsjApCpgVOTjPy6lr9v/c00m8XtW+ySYPWGR
        YfiXSisPApKx+XS8X/hCBSQ=
X-Google-Smtp-Source: ABdhPJynjINfXS1NmVC5iI46C3ObM1jjWEhgURcEe9PIQoHfsg7X4w9VzqTpyUg4G+H0O2+H3tDkhA==
X-Received: by 2002:a63:4c19:: with SMTP id z25mr8326900pga.58.1604201587535;
        Sat, 31 Oct 2020 20:33:07 -0700 (PDT)
Received: from software.domain.org ([45.77.13.216])
        by smtp.gmail.com with ESMTPSA id k8sm9038447pgi.39.2020.10.31.20.33.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 31 Oct 2020 20:33:06 -0700 (PDT)
Sender: Huacai Chen <chenhuacai@gmail.com>
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Mel Gorman <mgorman@suse.de>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-mips@vger.kernel.org, linux-mm@kvack.org,
        Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH Resend 1/3] mips/mm: Add NUMA balancing support
Date:   Sun,  1 Nov 2020 11:33:56 +0800
Message-Id: <1604201638-4001-1-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

NUMA balancing is available on nearly all architectures, but MIPS lacks
it for a long time. In theory, the current NUMA balancing framework only
need a "PROTNONE" page table bit and some APIs to manipulate it. So, it
is time for us to add MIPS's NUMA balancing support (Only for 64bit now
because NUMA balancing depends on huge page implicitly).

Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 arch/mips/Kconfig                    |  1 +
 arch/mips/include/asm/pgtable-64.h   |  2 +-
 arch/mips/include/asm/pgtable-bits.h | 17 +++++++++++++++++
 arch/mips/include/asm/pgtable.h      | 18 +++++++++++++++---
 4 files changed, 34 insertions(+), 4 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 499a20d..62d2b95 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -9,6 +9,7 @@ config MIPS
 	select ARCH_HAS_PTE_SPECIAL if !(32BIT && CPU_HAS_RIXI)
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
+	select ARCH_SUPPORTS_NUMA_BALANCING if 64BIT
 	select ARCH_SUPPORTS_UPROBES
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_CMPXCHG_LOCKREF if 64BIT
diff --git a/arch/mips/include/asm/pgtable-64.h b/arch/mips/include/asm/pgtable-64.h
index 1e7d6ce..2aef74b 100644
--- a/arch/mips/include/asm/pgtable-64.h
+++ b/arch/mips/include/asm/pgtable-64.h
@@ -266,7 +266,7 @@ static inline int pmd_present(pmd_t pmd)
 {
 #ifdef CONFIG_MIPS_HUGE_TLB_SUPPORT
 	if (unlikely(pmd_val(pmd) & _PAGE_HUGE))
-		return pmd_val(pmd) & _PAGE_PRESENT;
+		return pmd_val(pmd) & (_PAGE_PRESENT | _PAGE_PROTNONE);
 #endif
 
 	return pmd_val(pmd) != (unsigned long) invalid_pte_table;
diff --git a/arch/mips/include/asm/pgtable-bits.h b/arch/mips/include/asm/pgtable-bits.h
index e26dc41..f697c32 100644
--- a/arch/mips/include/asm/pgtable-bits.h
+++ b/arch/mips/include/asm/pgtable-bits.h
@@ -52,6 +52,9 @@ enum pgtable_bits {
 	_PAGE_WRITE_SHIFT,
 	_PAGE_ACCESSED_SHIFT,
 	_PAGE_MODIFIED_SHIFT,
+#if defined(CONFIG_ARCH_SUPPORTS_NUMA_BALANCING)
+	_PAGE_PROTNONE_SHIFT,
+#endif
 #if defined(CONFIG_ARCH_HAS_PTE_SPECIAL)
 	_PAGE_SPECIAL_SHIFT,
 #endif
@@ -84,6 +87,9 @@ enum pgtable_bits {
 	_PAGE_WRITE_SHIFT,
 	_PAGE_ACCESSED_SHIFT,
 	_PAGE_MODIFIED_SHIFT,
+#if defined(CONFIG_ARCH_SUPPORTS_NUMA_BALANCING)
+	_PAGE_PROTNONE_SHIFT,
+#endif
 #if defined(CONFIG_ARCH_HAS_PTE_SPECIAL)
 	_PAGE_SPECIAL_SHIFT,
 #endif
@@ -102,6 +108,9 @@ enum pgtable_bits {
 	_PAGE_WRITE_SHIFT,
 	_PAGE_ACCESSED_SHIFT,
 	_PAGE_MODIFIED_SHIFT,
+#if defined(CONFIG_ARCH_SUPPORTS_NUMA_BALANCING)
+	_PAGE_PROTNONE_SHIFT,
+#endif
 #if defined(CONFIG_ARCH_HAS_PTE_SPECIAL)
 	_PAGE_SPECIAL_SHIFT,
 #endif
@@ -131,6 +140,9 @@ enum pgtable_bits {
 #if defined(CONFIG_MIPS_HUGE_TLB_SUPPORT)
 	_PAGE_HUGE_SHIFT,
 #endif
+#if defined(CONFIG_ARCH_SUPPORTS_NUMA_BALANCING)
+	_PAGE_PROTNONE_SHIFT,
+#endif
 #if defined(CONFIG_ARCH_HAS_PTE_SPECIAL)
 	_PAGE_SPECIAL_SHIFT,
 #endif
@@ -158,6 +170,11 @@ enum pgtable_bits {
 #if defined(CONFIG_MIPS_HUGE_TLB_SUPPORT)
 # define _PAGE_HUGE		(1 << _PAGE_HUGE_SHIFT)
 #endif
+#if defined(CONFIG_ARCH_SUPPORTS_NUMA_BALANCING)
+# define _PAGE_PROTNONE		(1 <<_PAGE_PROTNONE_SHIFT)
+#else
+# define _PAGE_PROTNONE		0
+#endif
 #if defined(CONFIG_ARCH_HAS_PTE_SPECIAL)
 # define _PAGE_SPECIAL		(1 << _PAGE_SPECIAL_SHIFT)
 #else
diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
index dd7a0f5..3434073 100644
--- a/arch/mips/include/asm/pgtable.h
+++ b/arch/mips/include/asm/pgtable.h
@@ -25,7 +25,7 @@
 struct mm_struct;
 struct vm_area_struct;
 
-#define PAGE_NONE	__pgprot(_PAGE_PRESENT | _PAGE_NO_READ | \
+#define PAGE_NONE	__pgprot(_PAGE_PROTNONE | _PAGE_NO_READ | \
 				 _page_cachable_default)
 #define PAGE_SHARED	__pgprot(_PAGE_PRESENT | _PAGE_WRITE | \
 				 _page_cachable_default)
@@ -188,7 +188,7 @@ static inline void pte_clear(struct mm_struct *mm, unsigned long addr, pte_t *pt
 #else
 
 #define pte_none(pte)		(!(pte_val(pte) & ~_PAGE_GLOBAL))
-#define pte_present(pte)	(pte_val(pte) & _PAGE_PRESENT)
+#define pte_present(pte)	(pte_val(pte) & (_PAGE_PRESENT | _PAGE_PROTNONE))
 #define pte_no_exec(pte)	(pte_val(pte) & _PAGE_NO_EXEC)
 
 /*
@@ -707,7 +707,7 @@ static inline pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot)
 
 static inline pmd_t pmd_mkinvalid(pmd_t pmd)
 {
-	pmd_val(pmd) &= ~(_PAGE_PRESENT | _PAGE_VALID | _PAGE_DIRTY);
+	pmd_val(pmd) &= ~(_PAGE_PRESENT | _PAGE_VALID | _PAGE_PROTNONE | _PAGE_DIRTY);
 
 	return pmd;
 }
@@ -729,6 +729,18 @@ static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
 
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
+#ifdef CONFIG_NUMA_BALANCING
+static inline long pte_protnone(pte_t pte)
+{
+	return (pte_val(pte) & _PAGE_PROTNONE);
+}
+
+static inline long pmd_protnone(pmd_t pmd)
+{
+	return (pmd_val(pmd) & _PAGE_PROTNONE);
+}
+#endif /* CONFIG_NUMA_BALANCING */
+
 #ifdef _PAGE_HUGE
 #define pmd_leaf(pmd)	((pmd_val(pmd) & _PAGE_HUGE) != 0)
 #define pud_leaf(pud)	((pud_val(pud) & _PAGE_HUGE) != 0)
-- 
2.7.0

