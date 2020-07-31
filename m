Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3CAE2343F1
	for <lists+linux-mips@lfdr.de>; Fri, 31 Jul 2020 12:10:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732326AbgGaKKV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 31 Jul 2020 06:10:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725903AbgGaKKU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 31 Jul 2020 06:10:20 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36BBCC061574
        for <linux-mips@vger.kernel.org>; Fri, 31 Jul 2020 03:10:20 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id f9so7377581pju.4
        for <linux-mips@vger.kernel.org>; Fri, 31 Jul 2020 03:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=qej/prGL2d6SmenkAk4t9qcI4pECamccg8Byt8wAasM=;
        b=QFNNh5ybYkp6m4oubtz+sd5sxXFRrxaYRz7ks/eEDGMSEAzpae42Sw5yKQ8KneGUsY
         ESFnk/1XQdkG3N/WPHSGuX1m4FchcPa9+MaeTdAkq5jBjVmFlEl7CxuIKEj6jKEtB5Tm
         rCf7tUd+NBw1jaq+26UZzys/ubsqJ48N/R+VMdp1ObCiJlD0E+C8g2Xo+wa+Li4am7fA
         1GfuvRVvl3qvG0mBmRD/9EDV2mkMNs2EZ1SC2SouaECRidLvf8YcU41cnuQyMvXVTpZt
         WXqpu9/2z94Um0/VmnZ+qUVPnFk1J4yNX5IJuYy4WqNAM+iFQbYH13D3MvsT18HxJeWn
         tqyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=qej/prGL2d6SmenkAk4t9qcI4pECamccg8Byt8wAasM=;
        b=hp5Keft97cdliE8t5sn5skQ4qItTPpT29A0A2kRUh7UHQZXgSmfj3uWWOrI0nWNvCo
         r0jMKaWIf2Yrjcw6o5s8JlH0IeELDNP4jgUC1fepae5XENxV/n5xgLjxpmMQIfkFU5u9
         jueyXmR0cnxvnvL0VVGn7E+adSYGbt4Co7DsVwkWZoTlkLRSFnzF/VGyKk/OFaxYly8b
         LfSGGPzwZckealFz7k8NtlEq3lgUKyB+dXZ6cZsc6Y8FNYkocCgqnPHElsh2MG3OrJe5
         +zNz4gX/nR5aVtlBBRxUEe6A2h0S3zVsOzts3ilVhpoh7RF4hqCxgn/1UuLajY2dkV19
         hPOg==
X-Gm-Message-State: AOAM5317WCUXJuyTfl+esQBUKv3VOIo0iPUcnOawGuuJs8XNoHiaeYjP
        nHi0/xNkvO0ZxwXaI5uhmwE=
X-Google-Smtp-Source: ABdhPJypMkJrwP3q9G7/NHFnaeI5oxkNlNnOj59RsBRML9zdlVh6QA1QvkatSueFdvs0prDZDSmpZw==
X-Received: by 2002:a17:90a:242:: with SMTP id t2mr3559458pje.138.1596190219709;
        Fri, 31 Jul 2020 03:10:19 -0700 (PDT)
Received: from software.domain.org ([45.77.13.216])
        by smtp.gmail.com with ESMTPSA id m19sm3313385pjv.34.2020.07.31.03.10.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 Jul 2020 03:10:19 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH 1/3] mips/mm: Add NUMA balancing support
Date:   Fri, 31 Jul 2020 18:12:49 +0800
Message-Id: <1596190371-17405-1-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
Sender: linux-mips-owner@vger.kernel.org
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

