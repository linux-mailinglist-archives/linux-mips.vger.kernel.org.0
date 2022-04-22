Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BF5650C2E9
	for <lists+linux-mips@lfdr.de>; Sat, 23 Apr 2022 01:09:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232571AbiDVWP5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 Apr 2022 18:15:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231987AbiDVWPi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 22 Apr 2022 18:15:38 -0400
Received: from mail-oi1-x249.google.com (mail-oi1-x249.google.com [IPv6:2607:f8b0:4864:20::249])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D6A223E813
        for <linux-mips@vger.kernel.org>; Fri, 22 Apr 2022 14:06:12 -0700 (PDT)
Received: by mail-oi1-x249.google.com with SMTP id j62-20020acaeb41000000b00322b431712cso4062552oih.3
        for <linux-mips@vger.kernel.org>; Fri, 22 Apr 2022 14:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=1Ma2mq2tqg3XF3cItnkEgAe0AbxTi5US5d6CkbxLyzY=;
        b=S9ojBi7tDpDCaCxycspq3eDg4sEc0jn081aq6nEMyQfLnL7gAjoNKktXvPrXiS+n/u
         CWyt8oiu1mTkCxx7K4/m1IB8VJich1zJPODqXFhJtBj0uOiamEJAvlSkX//xN3hF7JEq
         yQOYAB4Me8+Lyz9BWM86FfwQ0m8+ln7/I1xYK5r8GUiB04ZYrZXw4BvfshlpFRk9Pk+h
         0/Fu66hOYjoVMUBRCB3iQY0QnmRhvJSA1eKyu7nJ6kuHd5hHR6U7PAqOv9e1f4YylWzf
         aXTP4IdMiJa/WFK5npwCXMJw83etTBNT+q21glnPVqLQurDK4Rc2f5VtGRgEB1O0mszs
         i9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=1Ma2mq2tqg3XF3cItnkEgAe0AbxTi5US5d6CkbxLyzY=;
        b=As44khY/alpmO6s7wPLgeV6q34sP4cWVDO/SZH8eUR10hu0OzcNOSKxIxpNwfK8Rm4
         bYEijOaWkjFcaMBPWml+8MfuWV58zjd1O2lJoQtchPkN9u83hcVIz+UjoG+eqJ3meZoS
         duq2UDhd95BbkCgxA2fOKlJ9BOFT9gdiqQfER/5hhQV85sk0ngHImNKagZurnSg1iKE6
         nTVYMSrF7qJTJ2zMbvbz3sMvN54xJrp9g7srxWKIk1kTpjzF6cAB+Z5uJONfswRx95AK
         WT2LVoQsQpUvAP2Hq++4zaqMEFOXRUuixh2AdFagBvjEjlxsSbpsxaID2z1/H2ERpSav
         JyIw==
X-Gm-Message-State: AOAM531RXeO5p84dkQjckVxcwv3l8QRrr0+M5f0JX277MggxIct+MJX6
        N+AVAa5O18jCb3ZLkaofjQvBpGY5NaZwSA==
X-Google-Smtp-Source: ABdhPJwDDjoIaawjtg4ZDhMJO2ZlhsA18/U9VjgwlgPxS2OgCNgVlFFPSW6zH30w8J4mMULUnwBK45IzNNn2HQ==
X-Received: from dmatlack-heavy.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:19cd])
 (user=dmatlack job=sendgmr) by 2002:a05:6870:430a:b0:e2:776b:bf05 with SMTP
 id w10-20020a056870430a00b000e2776bbf05mr2836930oah.269.1650661571558; Fri,
 22 Apr 2022 14:06:11 -0700 (PDT)
Date:   Fri, 22 Apr 2022 21:05:40 +0000
In-Reply-To: <20220422210546.458943-1-dmatlack@google.com>
Message-Id: <20220422210546.458943-15-dmatlack@google.com>
Mime-Version: 1.0
References: <20220422210546.458943-1-dmatlack@google.com>
X-Mailer: git-send-email 2.36.0.rc2.479.g8af0fa9b8e-goog
Subject: [PATCH v4 14/20] KVM: x86/mmu: Update page stats in __rmap_add()
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
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
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
Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index ed23782eef8a..6a190fe6c9dc 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -1601,6 +1601,8 @@ static void __rmap_add(struct kvm *kvm,
 
 	sp = sptep_to_sp(spte);
 	kvm_mmu_page_set_gfn(sp, spte - sp->spt, gfn);
+	kvm_update_page_stats(kvm, sp->role.level, 1);
+
 	rmap_head = gfn_to_rmap(gfn, sp->role.level, slot);
 	rmap_count = pte_list_add(cache, spte, rmap_head);
 
@@ -2818,7 +2820,6 @@ static int mmu_set_spte(struct kvm_vcpu *vcpu, struct kvm_memory_slot *slot,
 
 	if (!was_rmapped) {
 		WARN_ON_ONCE(ret == RET_PF_SPURIOUS);
-		kvm_update_page_stats(vcpu->kvm, level, 1);
 		rmap_add(vcpu, slot, sptep, gfn);
 	}
 
-- 
2.36.0.rc2.479.g8af0fa9b8e-goog

