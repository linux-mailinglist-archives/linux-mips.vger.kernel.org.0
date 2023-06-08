Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81646728855
	for <lists+linux-mips@lfdr.de>; Thu,  8 Jun 2023 21:25:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234871AbjFHTZe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 8 Jun 2023 15:25:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236946AbjFHTZZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 8 Jun 2023 15:25:25 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F11C130ED
        for <linux-mips@vger.kernel.org>; Thu,  8 Jun 2023 12:24:58 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-39c7f78c237so36347b6e.3
        for <linux-mips@vger.kernel.org>; Thu, 08 Jun 2023 12:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686252296; x=1688844296;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WK0F+BrKreVsJ5WKZMSSwYtM+YC+fc99jiRjqR8qAzI=;
        b=ZGXMZfnAeiq+puzn8KaFlsrDohi6oNFrLG2bUfaVBtLCoJzU8g3rJgNwh1p51JyGuP
         PzIvbIlmrxNzJRPB2UmhCQacZwnVsD6jfFT2wth5iZnf+M5090WEAmLlo9QwGOg2ltru
         HBfCnU9gvgSoiwEMxRTrLgEn2TR+g+2nXJ/9DrKccbDvJa303atalUeLuTMiXE5CfR74
         ObqXYOOYhl7hB5zaTqcdu6QaTGUbORb6mHoAxslwR9S+Ept9ufmT0oRxzJ7NNeN2B+6r
         Hks3EA+xbNSbn4J3dguMfV6IvC21yLTrISAtTdulb+NGN3TNiPsgILIU/ZJo1rxlLxSO
         7yew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686252296; x=1688844296;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WK0F+BrKreVsJ5WKZMSSwYtM+YC+fc99jiRjqR8qAzI=;
        b=LDFauMkxGXHn0fW6Wp6Tzc44YvkNLuY8pkZeCEkRZTsSI+0gN3mOdlXYE70xcw+Zek
         SnzZiCrykcRL1jvmQxLmf2ai9jlQkglTJuzqXLc3uY1jl/UPLSJgRAkdq8MyrwyHV4UU
         JPHsbVTwE1KKtT31vWN018NgWUgYRaWiN5P6/2sFeEJhZsk7l6VlfYCjJAQAR1t+GaU1
         k1aammAjgi2ZwRFceDFWjb9B9WG+Ymo53zzcvk9yHzKM6gI6/DU7JATCI2AW7ikTn2kE
         rRqfsw9e+Ed5otFch6/ybPExt34QSYJTffZeYFrzi7/LHGA9gAhBYA5HYMeLENaFAWt8
         M34A==
X-Gm-Message-State: AC+VfDzhfvJ2dEvXvkFgqRxzWW7HmwvgYUTcr3hYgG4tB/JA55OZgVg4
        WfAkc+NPntZb0L/H/IdgJAFNKWnMgY5IS4OgLNjmCURw
X-Google-Smtp-Source: ACHHUZ4GiCiA0/Y6MKCFg7CaDp1TXejdH2N2rUDPBFAR/nPzuleTjqZzDRxE6rsfXkK23/Kmg+ycrg==
X-Received: by 2002:a54:4893:0:b0:39a:b35b:a06c with SMTP id r19-20020a544893000000b0039ab35ba06cmr9888918oic.30.1686251720727;
        Thu, 08 Jun 2023 12:15:20 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id a17-20020a81bb51000000b00545a08184fdsm89974ywl.141.2023.06.08.12.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 12:15:20 -0700 (PDT)
Date:   Thu, 8 Jun 2023 12:15:16 -0700 (PDT)
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
Subject: [PATCH v2 05/23] m68k: allow pte_offset_map[_lock]() to fail
In-Reply-To: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
Message-ID: <795f6a7-bcca-cdf-ad2a-fbdaa232998c@google.com>
References: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In rare transient cases, not yet made possible, pte_offset_map() and
pte_offset_map_lock() may not find a page table: handle appropriately.

Restructure cf_tlb_miss() with a pte_unmap() (previously omitted)
at label out, followed by one local_irq_restore() for all.

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 arch/m68k/include/asm/mmu_context.h |  6 ++--
 arch/m68k/kernel/sys_m68k.c         |  2 ++
 arch/m68k/mm/mcfmmu.c               | 52 ++++++++++++-----------------
 3 files changed, 27 insertions(+), 33 deletions(-)

diff --git a/arch/m68k/include/asm/mmu_context.h b/arch/m68k/include/asm/mmu_context.h
index 8ed6ac14d99f..141bbdfad960 100644
--- a/arch/m68k/include/asm/mmu_context.h
+++ b/arch/m68k/include/asm/mmu_context.h
@@ -99,7 +99,7 @@ static inline void load_ksp_mmu(struct task_struct *task)
 	p4d_t *p4d;
 	pud_t *pud;
 	pmd_t *pmd;
-	pte_t *pte;
+	pte_t *pte = NULL;
 	unsigned long mmuar;
 
 	local_irq_save(flags);
@@ -139,7 +139,7 @@ static inline void load_ksp_mmu(struct task_struct *task)
 
 	pte = (mmuar >= PAGE_OFFSET) ? pte_offset_kernel(pmd, mmuar)
 				     : pte_offset_map(pmd, mmuar);
-	if (pte_none(*pte) || !pte_present(*pte))
+	if (!pte || pte_none(*pte) || !pte_present(*pte))
 		goto bug;
 
 	set_pte(pte, pte_mkyoung(*pte));
@@ -161,6 +161,8 @@ static inline void load_ksp_mmu(struct task_struct *task)
 bug:
 	pr_info("ksp load failed: mm=0x%p ksp=0x08%lx\n", mm, mmuar);
 end:
+	if (pte && mmuar < PAGE_OFFSET)
+		pte_unmap(pte);
 	local_irq_restore(flags);
 }
 
diff --git a/arch/m68k/kernel/sys_m68k.c b/arch/m68k/kernel/sys_m68k.c
index bd0274c7592e..c586034d2a7a 100644
--- a/arch/m68k/kernel/sys_m68k.c
+++ b/arch/m68k/kernel/sys_m68k.c
@@ -488,6 +488,8 @@ sys_atomic_cmpxchg_32(unsigned long newval, int oldval, int d3, int d4, int d5,
 		if (!pmd_present(*pmd))
 			goto bad_access;
 		pte = pte_offset_map_lock(mm, pmd, (unsigned long)mem, &ptl);
+		if (!pte)
+			goto bad_access;
 		if (!pte_present(*pte) || !pte_dirty(*pte)
 		    || !pte_write(*pte)) {
 			pte_unmap_unlock(pte, ptl);
diff --git a/arch/m68k/mm/mcfmmu.c b/arch/m68k/mm/mcfmmu.c
index 70aa0979e027..42f45abea37a 100644
--- a/arch/m68k/mm/mcfmmu.c
+++ b/arch/m68k/mm/mcfmmu.c
@@ -91,7 +91,8 @@ int cf_tlb_miss(struct pt_regs *regs, int write, int dtlb, int extension_word)
 	p4d_t *p4d;
 	pud_t *pud;
 	pmd_t *pmd;
-	pte_t *pte;
+	pte_t *pte = NULL;
+	int ret = -1;
 	int asid;
 
 	local_irq_save(flags);
@@ -100,47 +101,33 @@ int cf_tlb_miss(struct pt_regs *regs, int write, int dtlb, int extension_word)
 		regs->pc + (extension_word * sizeof(long));
 
 	mm = (!user_mode(regs) && KMAPAREA(mmuar)) ? &init_mm : current->mm;
-	if (!mm) {
-		local_irq_restore(flags);
-		return -1;
-	}
+	if (!mm)
+		goto out;
 
 	pgd = pgd_offset(mm, mmuar);
-	if (pgd_none(*pgd))  {
-		local_irq_restore(flags);
-		return -1;
-	}
+	if (pgd_none(*pgd))
+		goto out;
 
 	p4d = p4d_offset(pgd, mmuar);
-	if (p4d_none(*p4d)) {
-		local_irq_restore(flags);
-		return -1;
-	}
+	if (p4d_none(*p4d))
+		goto out;
 
 	pud = pud_offset(p4d, mmuar);
-	if (pud_none(*pud)) {
-		local_irq_restore(flags);
-		return -1;
-	}
+	if (pud_none(*pud))
+		goto out;
 
 	pmd = pmd_offset(pud, mmuar);
-	if (pmd_none(*pmd)) {
-		local_irq_restore(flags);
-		return -1;
-	}
+	if (pmd_none(*pmd))
+		goto out;
 
 	pte = (KMAPAREA(mmuar)) ? pte_offset_kernel(pmd, mmuar)
 				: pte_offset_map(pmd, mmuar);
-	if (pte_none(*pte) || !pte_present(*pte)) {
-		local_irq_restore(flags);
-		return -1;
-	}
+	if (!pte || pte_none(*pte) || !pte_present(*pte))
+		goto out;
 
 	if (write) {
-		if (!pte_write(*pte)) {
-			local_irq_restore(flags);
-			return -1;
-		}
+		if (!pte_write(*pte))
+			goto out;
 		set_pte(pte, pte_mkdirty(*pte));
 	}
 
@@ -161,9 +148,12 @@ int cf_tlb_miss(struct pt_regs *regs, int write, int dtlb, int extension_word)
 		mmu_write(MMUOR, MMUOR_ACC | MMUOR_UAA);
 	else
 		mmu_write(MMUOR, MMUOR_ITLB | MMUOR_ACC | MMUOR_UAA);
-
+	ret = 0;
+out:
+	if (pte && !KMAPAREA(mmuar))
+		pte_unmap(pte);
 	local_irq_restore(flags);
-	return 0;
+	return ret;
 }
 
 void __init cf_bootmem_alloc(void)
-- 
2.35.3

