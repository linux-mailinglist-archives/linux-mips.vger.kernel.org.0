Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FA2A4D56A6
	for <lists+linux-mips@lfdr.de>; Fri, 11 Mar 2022 01:26:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345209AbiCKA1P (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 10 Mar 2022 19:27:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345215AbiCKA1M (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 10 Mar 2022 19:27:12 -0500
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F362C1A2720
        for <linux-mips@vger.kernel.org>; Thu, 10 Mar 2022 16:26:03 -0800 (PST)
Received: by mail-pj1-x104a.google.com with SMTP id lp2-20020a17090b4a8200b001bc449ecbceso6757878pjb.8
        for <linux-mips@vger.kernel.org>; Thu, 10 Mar 2022 16:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=25+KDsWb88cITvAkDtK/k2hukUBdQk6h1+nWravTP4A=;
        b=K0TPB3uKAzhv2V8uMMeBatFQY8hZWLm9Du6sCL0+SuvLt4cuZsnxgLsdX/S1nOvVtD
         fOJgb/6kxC900RYeJvh122bm8r8COP0dUdAfk7iS0A5hw7OsHXDqi9bwu6Fcka2oVXTA
         wP2mdyJD6Bh+sA7+tTKBHIc8ZtBem1Ya8VZxq5wGKapUL1k9nJoMFuAfBjE8WKCxiWN1
         OlgrdMpnZH9W0FOCWtVCHjw1n/zefXLlVMhEeaAI5THutPCrG55DAjR14Ub0YTKdRBav
         4LhtJZs/D/q8/J1cBMRrkXueu0GUwMdyz890TM3Fupl3hdRaVYavWFTBmZ/OW44pfIAC
         zJdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=25+KDsWb88cITvAkDtK/k2hukUBdQk6h1+nWravTP4A=;
        b=dJuyA1oP2hNLrcwd6NyLNO/Aa9HlkSD+FBdO6TiT3JPszEh3E+CnrNjwu4BF/5RSz3
         591qtNS1Og5DUO8z2uYbjWv2aY3rY1HWhue+OAfa64zY0oqZ4h39EHXfrUKLmzD0aVim
         vFrBQxOOhhbzFXc6G8jzgZTTL25JazpD5i66yKK7g9LTp4wYI6MHhm7SD7QsjAgNnOEq
         3FqrAnswfqNV27TbH5qyRsCse5qJNuKT3kADdPmG/gKkMEpe1jKVXMaZoyQlettLvjD2
         zVt02IeNzf8jIxobRTvzrV+c7PK/0t3K8QsjPwSZoozF2q/RwzNS0M6nneoI6IuUxeP2
         0ErA==
X-Gm-Message-State: AOAM533V4fx9kxc8gooOnJJ9KqV4JuA69XB322M9f6HSoz42BnSzYO7i
        O5V8P+Mxq0JDNADTlFuTsLQgCGbDM9TuMA==
X-Google-Smtp-Source: ABdhPJzQQNzCUZydl9KF0V/z0eslYsBHitU/RkIzZ5f2qOcoErUZJMAOQ9EJr1dof3fsKDR0fIjt+SaohHYUBw==
X-Received: from dmatlack-heavy.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:19cd])
 (user=dmatlack job=sendgmr) by 2002:a17:902:6a86:b0:151:f1c5:2fa3 with SMTP
 id n6-20020a1709026a8600b00151f1c52fa3mr7493244plk.77.1646958363421; Thu, 10
 Mar 2022 16:26:03 -0800 (PST)
Date:   Fri, 11 Mar 2022 00:25:21 +0000
In-Reply-To: <20220311002528.2230172-1-dmatlack@google.com>
Message-Id: <20220311002528.2230172-20-dmatlack@google.com>
Mime-Version: 1.0
References: <20220311002528.2230172-1-dmatlack@google.com>
X-Mailer: git-send-email 2.35.1.723.g4982287a31-goog
Subject: [PATCH v2 19/26] KVM: x86/mmu: Refactor drop_large_spte()
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

drop_large_spte() drops a large SPTE if it exists and then flushes TLBs.
Its helper function, __drop_large_spte(), does the drop without the
flush.

In preparation for eager page splitting, which will need to sometimes
flush when dropping large SPTEs (and sometimes not), push the flushing
logic down into __drop_large_spte() and add a bool parameter to control
it.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 2032be3edd71..926ddfaa9e1a 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -1150,28 +1150,29 @@ static void drop_spte(struct kvm *kvm, u64 *sptep)
 		rmap_remove(kvm, sptep);
 }
 
-
-static bool __drop_large_spte(struct kvm *kvm, u64 *sptep)
+static void __drop_large_spte(struct kvm *kvm, u64 *sptep, bool flush)
 {
-	if (is_large_pte(*sptep)) {
-		WARN_ON(sptep_to_sp(sptep)->role.level == PG_LEVEL_4K);
-		drop_spte(kvm, sptep);
-		return true;
-	}
+	struct kvm_mmu_page *sp;
 
-	return false;
-}
+	if (!is_large_pte(*sptep))
+		return;
 
-static void drop_large_spte(struct kvm_vcpu *vcpu, u64 *sptep)
-{
-	if (__drop_large_spte(vcpu->kvm, sptep)) {
-		struct kvm_mmu_page *sp = sptep_to_sp(sptep);
+	sp = sptep_to_sp(sptep);
+	WARN_ON(sp->role.level == PG_LEVEL_4K);
 
-		kvm_flush_remote_tlbs_with_address(vcpu->kvm, sp->gfn,
+	drop_spte(kvm, sptep);
+
+	if (flush) {
+		kvm_flush_remote_tlbs_with_address(kvm, sp->gfn,
 			KVM_PAGES_PER_HPAGE(sp->role.level));
 	}
 }
 
+static void drop_large_spte(struct kvm_vcpu *vcpu, u64 *sptep)
+{
+	return __drop_large_spte(vcpu->kvm, sptep, true);
+}
+
 /*
  * Write-protect on the specified @sptep, @pt_protect indicates whether
  * spte write-protection is caused by protecting shadow page table.
-- 
2.35.1.723.g4982287a31-goog

