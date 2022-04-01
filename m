Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A5B74EF958
	for <lists+linux-mips@lfdr.de>; Fri,  1 Apr 2022 19:56:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350719AbiDAR6W (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 1 Apr 2022 13:58:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350750AbiDAR6V (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 1 Apr 2022 13:58:21 -0400
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BE661AF501
        for <linux-mips@vger.kernel.org>; Fri,  1 Apr 2022 10:56:30 -0700 (PDT)
Received: by mail-pj1-x104a.google.com with SMTP id o15-20020a17090aac0f00b001c6595a43dbso1932025pjq.4
        for <linux-mips@vger.kernel.org>; Fri, 01 Apr 2022 10:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=bPjRdwbrgeaGoRO6D9pIVUv9XL1QVrE/jZ7frr9Y9sk=;
        b=HKXVYj5bLgLQDNl0Yp3f3Cxk0xEfw/WwCidCusFgYIXZPgwnivI6+Ih1CXvlNY8wv+
         0SB7IO2lfWqyxHZXsqnHLnT0QBt4/Kn5lk5EW8K9iW1NthwnnpRVMkumhd4k1OQE77wT
         S2O1Z7AitpIGEox5Qh5FKe0zYHXrRWVT9NJBODMGEgo+t6A06dO9q/xdIDofE1nFLYnl
         tWGum6qGeGVSd65XaJizCavBESlaKNmwmbP75qcI6R+2txzDbk0mbonxSd1y21Sie2vy
         W5UgLGjdxmVDqUWGtPF5QIJMbd5Gcb1De7NMCzJgjAuAzu6A7T0xAsFyXc5SNRC5Sf5R
         j+lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=bPjRdwbrgeaGoRO6D9pIVUv9XL1QVrE/jZ7frr9Y9sk=;
        b=x5YCHIHEDPFNFcRm6zBvbI2tm1A0ELrFxXLrzVKfVJG6o/aYZw+5hOyTiCtdq1w65h
         HvuPtL2PhS7y2GeXbNkWhbeBZSp4xLgMf4LS94vJM+g/n8IiiH6eNzo+dzxVEzMYY3St
         ebzLgxoDDs7tR1yZ3AcfbmQI4OOetBbVGeq7c9RZBHWYXuy3BMZ2xfE8kl+mYVwFGS/i
         da/kaZPH1MG4Y11YohLeKtLEKo4Dr64JTO7R52l/OQ8ulKV9RNEHKnGx4HRnfHeY0lTt
         qQ48rm8tNHENs+YteZ9Op5n88kiXjGYsZeb2v8OFgOUX9UPhdhUk30syhq+NOPF20H5d
         Ly0A==
X-Gm-Message-State: AOAM530yO5/bW88NNutfByOSE+6pFJed5WIAGpeb42uRIMQPyOGAv0VH
        0YiJKiKFXLpSQQ/3c5M/f6anWtoAghYyzg==
X-Google-Smtp-Source: ABdhPJwAwneAua3CK3hqlxT6AVdmOtu9SNJP0PRrgeiWzgw657lKsS+2gpSEl29HSjZknUEHAGP38CQTV81Y8Q==
X-Received: from dmatlack-heavy.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:19cd])
 (user=dmatlack job=sendgmr) by 2002:a17:902:d888:b0:151:6fe8:6e68 with SMTP
 id b8-20020a170902d88800b001516fe86e68mr11236930plz.158.1648835789747; Fri,
 01 Apr 2022 10:56:29 -0700 (PDT)
Date:   Fri,  1 Apr 2022 17:55:49 +0000
In-Reply-To: <20220401175554.1931568-1-dmatlack@google.com>
Message-Id: <20220401175554.1931568-19-dmatlack@google.com>
Mime-Version: 1.0
References: <20220401175554.1931568-1-dmatlack@google.com>
X-Mailer: git-send-email 2.35.1.1094.g7c7d902a7c-goog
Subject: [PATCH v3 18/23] KVM: x86/mmu: Zap collapsible SPTEs at all levels in
 the shadow MMU
From:   David Matlack <dmatlack@google.com>
To:     Paolo Bonzini <pbonzini@redhat.com>
Cc:     Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Sean Christopherson <seanjc@google.com>,
        Andrew Jones <drjones@redhat.com>,
        Ben Gardon <bgardon@google.com>, Peter Xu <peterx@redhat.com>,
        maciej.szmigiero@oracle.com,
        "moderated list:KERNEL VIRTUAL MACHINE FOR ARM64 (KVM/arm64)" 
        <kvmarm@lists.cs.columbia.edu>,
        "open list:KERNEL VIRTUAL MACHINE FOR MIPS (KVM/mips)" 
        <linux-mips@vger.kernel.org>,
        "open list:KERNEL VIRTUAL MACHINE FOR MIPS (KVM/mips)" 
        <kvm@vger.kernel.org>,
        "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" 
        <kvm-riscv@lists.infradead.org>, Peter Feiner <pfeiner@google.com>,
        David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Currently KVM only zaps collapsible 4KiB SPTEs in the shadow MMU (i.e.
in the rmap). This is fine for now KVM never creates intermediate huge
pages during dirty logging, i.e. a 1GiB page is never partially split to
a 2MiB page.

However, this will stop being true once the shadow MMU participates in
eager page splitting, which can in fact leave behind partially split
huge pages. In preparation for that change, change the shadow MMU to
iterate over all necessary levels when zapping collapsible SPTEs.

No functional change intended.

Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 3a425ed80e23..6390b23d286a 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -6172,18 +6172,25 @@ static bool kvm_mmu_zap_collapsible_spte(struct kvm *kvm,
 	return need_tlb_flush;
 }
 
+static void kvm_rmap_zap_collapsible_sptes(struct kvm *kvm,
+					   const struct kvm_memory_slot *slot)
+{
+	/*
+	 * Note, use KVM_MAX_HUGEPAGE_LEVEL - 1 since there's no need to zap
+	 * pages that are already mapped at the maximum possible level.
+	 */
+	if (slot_handle_level(kvm, slot, kvm_mmu_zap_collapsible_spte,
+			      PG_LEVEL_4K, KVM_MAX_HUGEPAGE_LEVEL - 1,
+			      true))
+		kvm_arch_flush_remote_tlbs_memslot(kvm, slot);
+}
+
 void kvm_mmu_zap_collapsible_sptes(struct kvm *kvm,
 				   const struct kvm_memory_slot *slot)
 {
 	if (kvm_memslots_have_rmaps(kvm)) {
 		write_lock(&kvm->mmu_lock);
-		/*
-		 * Zap only 4k SPTEs since the legacy MMU only supports dirty
-		 * logging at a 4k granularity and never creates collapsible
-		 * 2m SPTEs during dirty logging.
-		 */
-		if (slot_handle_level_4k(kvm, slot, kvm_mmu_zap_collapsible_spte, true))
-			kvm_arch_flush_remote_tlbs_memslot(kvm, slot);
+		kvm_rmap_zap_collapsible_sptes(kvm, slot);
 		write_unlock(&kvm->mmu_lock);
 	}
 
-- 
2.35.1.1094.g7c7d902a7c-goog

