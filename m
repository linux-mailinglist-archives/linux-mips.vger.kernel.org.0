Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E1144F2064
	for <lists+linux-mips@lfdr.de>; Tue,  5 Apr 2022 01:43:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231325AbiDDXoz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 4 Apr 2022 19:44:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231213AbiDDXoz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 4 Apr 2022 19:44:55 -0400
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC5EB6A027
        for <linux-mips@vger.kernel.org>; Mon,  4 Apr 2022 16:42:50 -0700 (PDT)
Received: by mail-pj1-x104a.google.com with SMTP id jz6-20020a17090b14c600b001ca9ea859afso445821pjb.5
        for <linux-mips@vger.kernel.org>; Mon, 04 Apr 2022 16:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=K/C6C11bbKyaV99qw+OE+b8BddCrOUCezOjrhVsGtWE=;
        b=SJM89U7DX9auP5Efty5wonK9wAYJnkGwZ+yCUpzXGngk3AdkiPP/FlEeacVDxTcHzy
         HsBIy2xxwycYfRyIDstlwTVfWpbRJYYCwpohusdMYR6XvAw6QGZ7vLmaKM17K0i2hSog
         eBvgtw8dbSKzt8aCE+rdgLw8bBikRyPjPsyk/ObkMrCuLv7sJe9h0edppM+6naMxpp2Y
         NMpQ7n+Hw52XoL7s5gqA3PVjP9/EfodgNtCX/RvYg4nAWYrw3gDyUyRNHsnnJt3XidSC
         FlkEpXeWnfMVWX3IPZai5/ju+N7azTeX28p0knQDKXyRx0s4srdab1zZOf6j+YU0KEqV
         THPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=K/C6C11bbKyaV99qw+OE+b8BddCrOUCezOjrhVsGtWE=;
        b=LrsIzyX3pyL6elqlRVZvzuws3V+OOcFCfejgcIuxBGI+4f3aUdmguKt0W4xGhSx0Pn
         eEnHgnQTQBwEkdik+ZmQkTtpHDxCOKel6qkD2Tck0+r7vllu+Dk8VRe2IwW78pbP+uYe
         SwXZ1fSV9DamUYJ+ifVGnvrBCmwas/zLAT8ESNh9pxxdtqPoxWyaLTHFDdDHynYBQI1N
         lJWcsJ10eSGx3c+DEltfs13OLB9FdG3gAyEqUOXXchDFgcu1hCcqUW2ALggnOEVzd1UE
         zRrWWrI4oM14UH0ogBcLksm0j48XghHqPwAUFh6Jfb022D6qLUmfkFVYUJD+ZaBAn9VG
         Ozew==
X-Gm-Message-State: AOAM531JkYKiNtSEmvB2c/TTe/Irc1xf+F6pf2SzFOPL5kq67QZ74h/I
        TyT9mTTC+g2HseXzc0faWcMTZ226lOBlxvON
X-Google-Smtp-Source: ABdhPJzORRgTHWZDqgAJmEQ9S4nEbpi3R6OCs7d6aUuWSbmaM3HnKYNNIS5dFfWTXWVVd/6JvKSw7F30c/15SR2s
X-Received: from yosry.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:2327])
 (user=yosryahmed job=sendgmr) by 2002:a17:90a:db48:b0:1ca:ab67:d75 with SMTP
 id u8-20020a17090adb4800b001caab670d75mr74003pjx.1.1649115732725; Mon, 04 Apr
 2022 16:42:12 -0700 (PDT)
Date:   Mon,  4 Apr 2022 23:41:54 +0000
In-Reply-To: <20220404234154.1251388-1-yosryahmed@google.com>
Message-Id: <20220404234154.1251388-6-yosryahmed@google.com>
Mime-Version: 1.0
References: <20220404234154.1251388-1-yosryahmed@google.com>
X-Mailer: git-send-email 2.35.1.1094.g7c7d902a7c-goog
Subject: [PATCH v2 5/5] KVM: mips: mm: count KVM page table pages in pagetable stats
From:   Yosry Ahmed <yosryahmed@google.com>
To:     Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Atish Patra <atishp@atishpatra.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>
Cc:     mizhang@google.com, David Matlack <dmatlack@google.com>,
        kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-mips@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Shakeel Butt <shakeelb@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Yosry Ahmed <yosryahmed@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Count the pages used by KVM in mips for page tables in pagetable stats.

Signed-off-by: Yosry Ahmed <yosryahmed@google.com>
---
 arch/mips/kvm/mips.c | 1 +
 arch/mips/kvm/mmu.c  | 9 ++++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index a25e0b73ee70..e60c1920a408 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -175,6 +175,7 @@ static void kvm_mips_free_gpa_pt(struct kvm *kvm)
 {
 	/* It should always be safe to remove after flushing the whole range */
 	WARN_ON(!kvm_mips_flush_gpa_pt(kvm, 0, ~0));
+	kvm_account_pgtable_pages((void *)kvm->arch.gpa_mm.pgd, -1);
 	pgd_free(NULL, kvm->arch.gpa_mm.pgd);
 }
 
diff --git a/arch/mips/kvm/mmu.c b/arch/mips/kvm/mmu.c
index 1bfd1b501d82..18da2ac2ded7 100644
--- a/arch/mips/kvm/mmu.c
+++ b/arch/mips/kvm/mmu.c
@@ -81,8 +81,10 @@ pgd_t *kvm_pgd_alloc(void)
 	pgd_t *ret;
 
 	ret = (pgd_t *)__get_free_pages(GFP_KERNEL, PGD_ORDER);
-	if (ret)
+	if (ret) {
 		kvm_pgd_init(ret);
+		kvm_account_pgtable_pages((void *)ret, +1);
+	}
 
 	return ret;
 }
@@ -125,6 +127,7 @@ static pte_t *kvm_mips_walk_pgd(pgd_t *pgd, struct kvm_mmu_memory_cache *cache,
 		pmd_init((unsigned long)new_pmd,
 			 (unsigned long)invalid_pte_table);
 		pud_populate(NULL, pud, new_pmd);
+		kvm_account_pgtable_pages((void *)new_pmd, +1);
 	}
 	pmd = pmd_offset(pud, addr);
 	if (pmd_none(*pmd)) {
@@ -135,6 +138,7 @@ static pte_t *kvm_mips_walk_pgd(pgd_t *pgd, struct kvm_mmu_memory_cache *cache,
 		new_pte = kvm_mmu_memory_cache_alloc(cache);
 		clear_page(new_pte);
 		pmd_populate_kernel(NULL, pmd, new_pte);
+		kvm_account_pgtable_pages((void *)new_pte, +1);
 	}
 	return pte_offset_kernel(pmd, addr);
 }
@@ -189,6 +193,7 @@ static bool kvm_mips_flush_gpa_pmd(pmd_t *pmd, unsigned long start_gpa,
 
 		if (kvm_mips_flush_gpa_pte(pte, start_gpa, end)) {
 			pmd_clear(pmd + i);
+			kvm_account_pgtable_pages((void *)pte, -1);
 			pte_free_kernel(NULL, pte);
 		} else {
 			safe_to_remove = false;
@@ -217,6 +222,7 @@ static bool kvm_mips_flush_gpa_pud(pud_t *pud, unsigned long start_gpa,
 
 		if (kvm_mips_flush_gpa_pmd(pmd, start_gpa, end)) {
 			pud_clear(pud + i);
+			kvm_account_pgtable_pages((void *)pmd, -1);
 			pmd_free(NULL, pmd);
 		} else {
 			safe_to_remove = false;
@@ -247,6 +253,7 @@ static bool kvm_mips_flush_gpa_pgd(pgd_t *pgd, unsigned long start_gpa,
 
 		if (kvm_mips_flush_gpa_pud(pud, start_gpa, end)) {
 			pgd_clear(pgd + i);
+			kvm_account_pgtable_pages((void *)pud, -1);
 			pud_free(NULL, pud);
 		} else {
 			safe_to_remove = false;
-- 
2.35.1.1094.g7c7d902a7c-goog

