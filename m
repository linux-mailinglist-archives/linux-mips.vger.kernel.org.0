Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 538D74D569E
	for <lists+linux-mips@lfdr.de>; Fri, 11 Mar 2022 01:26:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345185AbiCKA1B (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 10 Mar 2022 19:27:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241101AbiCKA1A (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 10 Mar 2022 19:27:00 -0500
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0308E1A2716
        for <linux-mips@vger.kernel.org>; Thu, 10 Mar 2022 16:25:57 -0800 (PST)
Received: by mail-pj1-x104a.google.com with SMTP id mm2-20020a17090b358200b001bf529127dfso4160751pjb.6
        for <linux-mips@vger.kernel.org>; Thu, 10 Mar 2022 16:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=O7PTjGgVVBCrsjwnVURq9XzsqcZsMncDOf7hGGBSbd0=;
        b=kmeAXlYSaDpRLGcUmN4Sv/xTcYDW6jclnp1q1rJJ4dL2RoKdVl5SeZYJBr8GYWH5m+
         DKD4iQBnIfLFGWX9cwaqDbad8l6EyX7jK4BZPjX14nJp+Wg87hDMUKTEmjaE3Zz6UHm0
         NFQQxbrHmJK9MHiqOLJ7843mXQn7NgLsSzLX/7CnhTcMy0PzlTku645wfWBqEuMBl3yU
         EwRBFkfr3fYm5vTZkWqKJ8rysORKE9UEYN6dw6cLPFscwbhIaxSWiLkf9LiPAIIADKaf
         vypriHQ917TpN7rZX2KwCHN3Tpuv7SMZQiwX93ecC+tARg/gwyRbtujWRsbhB0yYIilw
         sbQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=O7PTjGgVVBCrsjwnVURq9XzsqcZsMncDOf7hGGBSbd0=;
        b=M1RJnjbGiC5iJDHHB9rVbEdn9GwHyvW87p9i8/fNQ/vYrlty0UeY4KbAy6UDWO8ybD
         hoDIPYR+UsZoCJdMKxDSFsljv+OI9z/3VWEyz5VjjZkNTDhZX4iFfsorUoMX1uPhSYJC
         PfdD7q34360H29IZ7ieCsvAKlTRtMq9akWF8AiMZ2dm0KUlpkyG+MrrdHIzpW2UdBgQD
         XnBY3SG4ozIL6MWsRmmaCmt9nFLD9WkE/wOcFC7dJ++CRLL2kVWG9xgteitpYhondKWN
         pYKuOdI2SplDBEs+6EeHGKSh5zIY16hRmHoXc1Th7CwYkF2I+V5fvYv44/mTIKxblJ5X
         b2Eg==
X-Gm-Message-State: AOAM531JODYK/hqrmCIxKzysR0ZzAzzDeaWRnTOX45RHiO4IkCLUouRz
        0uXDurtNxW0wTaTZvHYSMx1QgHKaQIQW/g==
X-Google-Smtp-Source: ABdhPJyfGZbmtHRGGR2TxbnIQFRzmM6E4in1hGACCBqL+EJ7gFLqMSHgs8hy0AVD/5cl522W64O1wnhoHBbOLQ==
X-Received: from dmatlack-heavy.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:19cd])
 (user=dmatlack job=sendgmr) by 2002:a05:6a00:b92:b0:4f6:dfe0:9abb with SMTP
 id g18-20020a056a000b9200b004f6dfe09abbmr7383915pfj.68.1646958356428; Thu, 10
 Mar 2022 16:25:56 -0800 (PST)
Date:   Fri, 11 Mar 2022 00:25:17 +0000
In-Reply-To: <20220311002528.2230172-1-dmatlack@google.com>
Message-Id: <20220311002528.2230172-16-dmatlack@google.com>
Mime-Version: 1.0
References: <20220311002528.2230172-1-dmatlack@google.com>
X-Mailer: git-send-email 2.35.1.723.g4982287a31-goog
Subject: [PATCH v2 15/26] KVM: x86/mmu: Update page stats in __rmap_add()
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
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Update the page stats in __rmap_add() rather than at the call site. This
will avoid having to manually update page stats when splitting huge
pages in a subsequent commit.

No functional change intended.

Reviewed-by: Ben Gardon <bgardon@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index c57070ed157d..73a7077f9991 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -1607,6 +1607,8 @@ static void __rmap_add(struct kvm *kvm,
 
 	sp = sptep_to_sp(spte);
 	kvm_mmu_page_set_gfn(sp, spte - sp->spt, gfn);
+	kvm_update_page_stats(kvm, sp->role.level, 1);
+
 	rmap_head = gfn_to_rmap(gfn, sp->role.level, slot);
 	rmap_count = pte_list_add(cache, spte, rmap_head);
 
@@ -2847,7 +2849,6 @@ static int mmu_set_spte(struct kvm_vcpu *vcpu, struct kvm_memory_slot *slot,
 
 	if (!was_rmapped) {
 		WARN_ON_ONCE(ret == RET_PF_SPURIOUS);
-		kvm_update_page_stats(vcpu->kvm, level, 1);
 		rmap_add(vcpu, slot, sptep, gfn);
 	}
 
-- 
2.35.1.723.g4982287a31-goog

