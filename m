Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F075E728809
	for <lists+linux-mips@lfdr.de>; Thu,  8 Jun 2023 21:18:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236837AbjFHTSK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 8 Jun 2023 15:18:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236883AbjFHTSC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 8 Jun 2023 15:18:02 -0400
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 717D3358E
        for <linux-mips@vger.kernel.org>; Thu,  8 Jun 2023 12:17:30 -0700 (PDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-569fc874498so9294117b3.1
        for <linux-mips@vger.kernel.org>; Thu, 08 Jun 2023 12:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686251849; x=1688843849;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=b7UlqbgxG6/xaVRAtCCqUssmJjUq670TXTguXR1OYLA=;
        b=OjxQxSGdY41m5JGioPLRRMHlbu1bKK9U/XvtQSsWn2huryMGbscAYfOgTPbtYvU/cY
         9huVOVy1gs221HXHTdTxeIS9YVBJM8bmeWwNXcHAGGu+nicpq5iZ05fikYyLmvX7+Ico
         B0dGfyyHLd/L99UUQOPdqJWluT143yDr4HPWe/IeSwrOdmo8Ey9hr6IWcFOUOcdRjD89
         uj2YuuaPnH3mhSN3ywyQu3CK8kSeEgGczYiudwTD8Jm0Ztvk+Qzx/bR/vvgb6aHZfoxB
         UdhBn1Xz2Oa9JpVFDtQjB5jQNwvMAbW3dNrfQzUbl4VOBwdYKLYYm2tmZUitVw+SniVU
         1QQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686251849; x=1688843849;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b7UlqbgxG6/xaVRAtCCqUssmJjUq670TXTguXR1OYLA=;
        b=KNbIJT0hoegEw33KwXqyDH/If6EgCpUIrxcfV678oq4pJAFAKf9TEaR5g+6KLz7Yu0
         7IHd3lMuh88MYdf7kx2AHhnPKV2Ma0rSp91q8310p42JnkmCP9yhHoJcadh7iSI8cA9F
         iGco9fJdiBTdBfqTESW4uwwUhE3JA5WALpz5h6oKoijeP6cQ53lzNp+c27jl0G/glgZf
         KXZOArruMl1+KL+YutSoSvVNfTzG5OmqovPUnhu5+IBz6qFrbIxWjbwU1bRfC/LcfQdQ
         5wOrtFksQmmXybx6yLvVe5DI4b2yW4cMO6D8zgG6PyxrjwQH46FGYOjsMYBlBECYV0fV
         lqIw==
X-Gm-Message-State: AC+VfDzNpF7euDLcXHBMDR+T0lyWOCGl6od/hfw2UI4k/umnvRdS3owF
        GTrwWflHmy/yzMnqRlcvCiu4tA==
X-Google-Smtp-Source: ACHHUZ4FKrGElLGHi5/eSiT2fDophUzi3i/RSv3jkZHU9DU5gGJq5nlHfaRL95gf++/3qBOcCkTajg==
X-Received: by 2002:a81:8403:0:b0:565:eae8:793b with SMTP id u3-20020a818403000000b00565eae8793bmr567910ywf.25.1686251849019;
        Thu, 08 Jun 2023 12:17:29 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id d190-20020a814fc7000000b00568b941e5e3sm109329ywb.72.2023.06.08.12.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 12:17:28 -0700 (PDT)
Date:   Thu, 8 Jun 2023 12:17:24 -0700 (PDT)
From:   Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To:     Andrew Morton <akpm@linux-foundation.org>
cc:     Mike Kravetz <mike.kravetz@oracle.com>,
        Mike Rapoport <rppt@kernel.org>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        Matthew Wilcox <willy@infradead.org>,
        David Hildenbrand <david@redhat.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Qi Zheng <zhengqi.arch@bytedance.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Helge Deller <deller@gmx.de>,
        John David Anglin <dave.anglin@bell.net>,
        "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Alexandre Ghiti <alexghiti@rivosinc.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        "David S. Miller" <davem@davemloft.net>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>, x86@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH v2 07/23] mips: update_mmu_cache() can replace
 __update_tlb()
In-Reply-To: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
Message-ID: <178970b0-1539-8aac-76fd-972c6c46ec17@google.com>
References: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Don't make update_mmu_cache() a wrapper around __update_tlb(): call it
directly, and use the ptep (or pmdp) provided by the caller, instead of
re-calling pte_offset_map() - which would raise a question of whether a
pte_unmap() is needed to balance it.

Check whether the "ptep" provided by the caller is actually the pmdp,
instead of testing pmd_huge(): or test pmd_huge() too and warn if it
disagrees?  This is "hazardous" territory: needs review and testing.

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 arch/mips/include/asm/pgtable.h | 15 +++------------
 arch/mips/mm/tlb-r3k.c          |  5 +++--
 arch/mips/mm/tlb-r4k.c          |  9 +++------
 3 files changed, 9 insertions(+), 20 deletions(-)

diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
index 574fa14ac8b2..9175dfab08d5 100644
--- a/arch/mips/include/asm/pgtable.h
+++ b/arch/mips/include/asm/pgtable.h
@@ -565,15 +565,8 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
 }
 #endif
 
-extern void __update_tlb(struct vm_area_struct *vma, unsigned long address,
-	pte_t pte);
-
-static inline void update_mmu_cache(struct vm_area_struct *vma,
-	unsigned long address, pte_t *ptep)
-{
-	pte_t pte = *ptep;
-	__update_tlb(vma, address, pte);
-}
+extern void update_mmu_cache(struct vm_area_struct *vma,
+	unsigned long address, pte_t *ptep);
 
 #define	__HAVE_ARCH_UPDATE_MMU_TLB
 #define update_mmu_tlb	update_mmu_cache
@@ -581,9 +574,7 @@ static inline void update_mmu_cache(struct vm_area_struct *vma,
 static inline void update_mmu_cache_pmd(struct vm_area_struct *vma,
 	unsigned long address, pmd_t *pmdp)
 {
-	pte_t pte = *(pte_t *)pmdp;
-
-	__update_tlb(vma, address, pte);
+	update_mmu_cache(vma, address, (pte_t *)pmdp);
 }
 
 /*
diff --git a/arch/mips/mm/tlb-r3k.c b/arch/mips/mm/tlb-r3k.c
index 53dfa2b9316b..e5722cd8dd6d 100644
--- a/arch/mips/mm/tlb-r3k.c
+++ b/arch/mips/mm/tlb-r3k.c
@@ -176,7 +176,8 @@ void local_flush_tlb_page(struct vm_area_struct *vma, unsigned long page)
 	}
 }
 
-void __update_tlb(struct vm_area_struct *vma, unsigned long address, pte_t pte)
+void update_mmu_cache(struct vm_area_struct *vma,
+		      unsigned long address, pte_t *ptep)
 {
 	unsigned long asid_mask = cpu_asid_mask(&current_cpu_data);
 	unsigned long flags;
@@ -203,7 +204,7 @@ void __update_tlb(struct vm_area_struct *vma, unsigned long address, pte_t pte)
 	BARRIER;
 	tlb_probe();
 	idx = read_c0_index();
-	write_c0_entrylo0(pte_val(pte));
+	write_c0_entrylo0(pte_val(*ptep));
 	write_c0_entryhi(address | pid);
 	if (idx < 0) {					/* BARRIER */
 		tlb_write_random();
diff --git a/arch/mips/mm/tlb-r4k.c b/arch/mips/mm/tlb-r4k.c
index 1b939abbe4ca..c96725d17cab 100644
--- a/arch/mips/mm/tlb-r4k.c
+++ b/arch/mips/mm/tlb-r4k.c
@@ -290,14 +290,14 @@ void local_flush_tlb_one(unsigned long page)
  * updates the TLB with the new pte(s), and another which also checks
  * for the R4k "end of page" hardware bug and does the needy.
  */
-void __update_tlb(struct vm_area_struct * vma, unsigned long address, pte_t pte)
+void update_mmu_cache(struct vm_area_struct *vma,
+		      unsigned long address, pte_t *ptep)
 {
 	unsigned long flags;
 	pgd_t *pgdp;
 	p4d_t *p4dp;
 	pud_t *pudp;
 	pmd_t *pmdp;
-	pte_t *ptep;
 	int idx, pid;
 
 	/*
@@ -326,10 +326,9 @@ void __update_tlb(struct vm_area_struct * vma, unsigned long address, pte_t pte)
 	idx = read_c0_index();
 #ifdef CONFIG_MIPS_HUGE_TLB_SUPPORT
 	/* this could be a huge page  */
-	if (pmd_huge(*pmdp)) {
+	if (ptep == (pte_t *)pmdp) {
 		unsigned long lo;
 		write_c0_pagemask(PM_HUGE_MASK);
-		ptep = (pte_t *)pmdp;
 		lo = pte_to_entrylo(pte_val(*ptep));
 		write_c0_entrylo0(lo);
 		write_c0_entrylo1(lo + (HPAGE_SIZE >> 7));
@@ -344,8 +343,6 @@ void __update_tlb(struct vm_area_struct * vma, unsigned long address, pte_t pte)
 	} else
 #endif
 	{
-		ptep = pte_offset_map(pmdp, address);
-
 #if defined(CONFIG_PHYS_ADDR_T_64BIT) && defined(CONFIG_CPU_MIPS32)
 #ifdef CONFIG_XPA
 		write_c0_entrylo0(pte_to_entrylo(ptep->pte_high));
-- 
2.35.3

