Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 342E23B3DA0
	for <lists+linux-mips@lfdr.de>; Fri, 25 Jun 2021 09:38:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230205AbhFYHkL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 25 Jun 2021 03:40:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230173AbhFYHkF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 25 Jun 2021 03:40:05 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55789C061756
        for <linux-mips@vger.kernel.org>; Fri, 25 Jun 2021 00:37:44 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id m2so6881727pgk.7
        for <linux-mips@vger.kernel.org>; Fri, 25 Jun 2021 00:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Fqk0DelF/G3CbqfbPGVAAboO/i2+VKjmNvuYbOFS18c=;
        b=MfQ9c0IIzkrFE+VtmmcjNlao2nJ8ViQGBtFp/x/59KONu6gOH3Mwk5XrtXTblsxFVA
         1mu4wyW2+1q33Y0q8K+qQlRULEPaJz0VOOS5NpFzA6uNw4HgpMvZ2kLnINHDWsIJVxVX
         MBdifgomPj+X+YQSA40dAjd9J57SbwAtlWJBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Fqk0DelF/G3CbqfbPGVAAboO/i2+VKjmNvuYbOFS18c=;
        b=DUTTPjPCMA+JMFc+FLzfdwMFHerSXkBs4DwqZp2sf1y0GBMaaJYHkqadzOhYPrZXij
         X0sC7VzogElajjxYLP0o9T4HKV5H42Vp6KMCEAzCjhkB65cQnTLgEui1NTfYyuOt40Bo
         yxL2UATCxFWvXnLOMWLD/OEng3I5bbBzhJel4UzHngiAg8pJ1rmxmmFM2jI9Yr5lgHjO
         CL44QPq5p9CAyruVT+/NNXieNuiuZ7/CBd3vaD0uqa/aIOgH8b4o2/wQlusOOhIZiG9P
         mV8XnRNjyXVJZVSP0OOdMaIlMmpIIMHRZp/cDilO4YkC9lp1H4x1PJY58i5NinrDabME
         WK6g==
X-Gm-Message-State: AOAM530kbYU9wqwVzfz2ulQC3S/UIIZftZaUkthIhpy89OLSuVbiYR2B
        ES1xCra+TrM0quZEcNB4DMF4Yw==
X-Google-Smtp-Source: ABdhPJyDQjJ8DoenzHqpaTZP97J/xwMvdaj5O2QENtyBCuGOv08FPB9cPN0MgLOILspvakBGi9fTdQ==
X-Received: by 2002:a63:b54:: with SMTP id a20mr8444200pgl.407.1624606663879;
        Fri, 25 Jun 2021 00:37:43 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:1492:9d4f:19fa:df61])
        by smtp.gmail.com with UTF8SMTPSA id m18sm5284072pff.88.2021.06.25.00.37.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jun 2021 00:37:43 -0700 (PDT)
From:   David Stevens <stevensd@chromium.org>
X-Google-Original-From: David Stevens <stevensd@google.com>
To:     Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Paul Mackerras <paulus@ozlabs.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Nick Piggin <npiggin@gmail.com>
Cc:     James Morse <james.morse@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Will Deacon <will@kernel.org>,
        Sean Christopherson <seanjc@google.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Zhenyu Wang <zhenyuw@linux.intel.com>,
        Zhi Wang <zhi.a.wang@intel.com>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        kvm@vger.kernel.org, kvm-ppc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, intel-gvt-dev@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        David Stevens <stevensd@chromium.org>
Subject: [PATCH v2 4/5] KVM: arm64/mmu: use gfn_to_pfn_page
Date:   Fri, 25 Jun 2021 16:36:15 +0900
Message-Id: <20210625073616.2184426-5-stevensd@google.com>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
In-Reply-To: <20210625073616.2184426-1-stevensd@google.com>
References: <20210625073616.2184426-1-stevensd@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: David Stevens <stevensd@chromium.org>

Covert usages of the deprecated gfn_to_pfn functions to the new
gfn_to_pfn_page functions.

Signed-off-by: David Stevens <stevensd@chromium.org>
---
 arch/arm64/kvm/mmu.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index c10207fed2f3..c29da690ed74 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -780,7 +780,7 @@ static bool fault_supports_stage2_huge_mapping(struct kvm_memory_slot *memslot,
 static unsigned long
 transparent_hugepage_adjust(struct kvm_memory_slot *memslot,
 			    unsigned long hva, kvm_pfn_t *pfnp,
-			    phys_addr_t *ipap)
+			    struct page **page, phys_addr_t *ipap)
 {
 	kvm_pfn_t pfn = *pfnp;
 
@@ -789,7 +789,7 @@ transparent_hugepage_adjust(struct kvm_memory_slot *memslot,
 	 * sure that the HVA and IPA are sufficiently aligned and that the
 	 * block map is contained within the memslot.
 	 */
-	if (kvm_is_transparent_hugepage(pfn) &&
+	if (*page && kvm_is_transparent_hugepage(pfn) &&
 	    fault_supports_stage2_huge_mapping(memslot, hva, PMD_SIZE)) {
 		/*
 		 * The address we faulted on is backed by a transparent huge
@@ -810,10 +810,11 @@ transparent_hugepage_adjust(struct kvm_memory_slot *memslot,
 		 * page accordingly.
 		 */
 		*ipap &= PMD_MASK;
-		kvm_release_pfn_clean(pfn);
+		put_page(*page);
 		pfn &= ~(PTRS_PER_PMD - 1);
-		kvm_get_pfn(pfn);
 		*pfnp = pfn;
+		*page = pfn_to_page(pfn);
+		get_page(*page);
 
 		return PMD_SIZE;
 	}
@@ -837,6 +838,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	short vma_shift;
 	gfn_t gfn;
 	kvm_pfn_t pfn;
+	struct page *page;
 	bool logging_active = memslot_is_logging(memslot);
 	unsigned long fault_level = kvm_vcpu_trap_get_fault_level(vcpu);
 	unsigned long vma_pagesize, fault_granule;
@@ -933,8 +935,8 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	 */
 	smp_rmb();
 
-	pfn = __gfn_to_pfn_memslot(memslot, gfn, false, NULL,
-				   write_fault, &writable, NULL);
+	pfn = __gfn_to_pfn_page_memslot(memslot, gfn, false, NULL,
+					write_fault, &writable, NULL, &page);
 	if (pfn == KVM_PFN_ERR_HWPOISON) {
 		kvm_send_hwpoison_signal(hva, vma_shift);
 		return 0;
@@ -967,7 +969,8 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	 */
 	if (vma_pagesize == PAGE_SIZE && !force_pte)
 		vma_pagesize = transparent_hugepage_adjust(memslot, hva,
-							   &pfn, &fault_ipa);
+							   &pfn, &page,
+							   &fault_ipa);
 	if (writable)
 		prot |= KVM_PGTABLE_PROT_W;
 
@@ -999,14 +1002,17 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 
 	/* Mark the page dirty only if the fault is handled successfully */
 	if (writable && !ret) {
-		kvm_set_pfn_dirty(pfn);
+		if (page)
+			kvm_set_pfn_dirty(pfn);
 		mark_page_dirty_in_slot(kvm, memslot, gfn);
 	}
 
 out_unlock:
 	spin_unlock(&kvm->mmu_lock);
-	kvm_set_pfn_accessed(pfn);
-	kvm_release_pfn_clean(pfn);
+	if (page) {
+		kvm_set_pfn_accessed(pfn);
+		put_page(page);
+	}
 	return ret != -EAGAIN ? ret : 0;
 }
 
-- 
2.32.0.93.g670b81a890-goog

