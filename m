Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47CA650C421
	for <lists+linux-mips@lfdr.de>; Sat, 23 Apr 2022 01:12:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232174AbiDVWPr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 Apr 2022 18:15:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232307AbiDVWPd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 22 Apr 2022 18:15:33 -0400
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 345242394B4
        for <linux-mips@vger.kernel.org>; Fri, 22 Apr 2022 14:05:57 -0700 (PDT)
Received: by mail-pl1-x649.google.com with SMTP id ij17-20020a170902ab5100b00158f6f83068so5391541plb.19
        for <linux-mips@vger.kernel.org>; Fri, 22 Apr 2022 14:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=MPuH2T1+M2X99iG7p5p1J0cr7ntr1hSsOktToBIL5i4=;
        b=e+um/exyz1alxtHobSjDiok/tPyP1F+rkAKw/qhjCBNagXesZCu+xjdjRFnaXtKDCa
         OP4lFNRGsmMtuMQh7xMmWEHFx9OLDFaIKWBMUWZxL5DUpmWtUm/59Ys9Ir/1zD4bed/J
         yvysneUan4CrZD3PS3XJr835ZqBkvrj+rZfTYy/32a70p/VciErcSXg9CJjBM1rvzPsM
         rxAwb0oRbCxQnmM4B3Pa0CkhwLq1fFJmvDC3RFHFsFbuG0XO/uEJ4a8/ZQkMuFUKuKLE
         mYnAuq78UAF99S7zcXt1Hab/KwiNWO1BWu3nRXN0qot8ySSlP0QkXskWLEGwdFSenq4/
         6M3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=MPuH2T1+M2X99iG7p5p1J0cr7ntr1hSsOktToBIL5i4=;
        b=YndzB28ZRbYw9qinHh4blVprhtRTjK6xeBW/m/SJy77m/riU2ai9YHCC49fiCjJaz5
         QRoEEATaeG1mTupyF7I0ex7DSgyzz5J7MeqypH6Wf4bA1m6guYeX3ARHh66I7c4WQPVC
         gJPR0eNbJvo2NiO5ME7WuWlOk+V3nyY9Efb6w3zc6Thr91z37GXDs2C3/YhMF7wzunD5
         9ftbesVjf0uGpj/vIAzS/QlyE5D1edz2JxGGJNs17oBg4x8Nw6fFRJBV6ll5vqBw4XI3
         ARUKRpI68J6DKuSj38qTgMzPGIeKkQeo+E3dVoetOwQ2Iof/Eqqo8CDEK4yDfzaMH3Hl
         tOVg==
X-Gm-Message-State: AOAM53313VaR7LHCnZcGj2Dy9tdcU+3838YDXiUGjK4XHuta816Y8CQW
        afz0BqWt0hL+oWHIhkgIUqn4qds5us9/mQ==
X-Google-Smtp-Source: ABdhPJwnb0JMVXsFVgrhea3ZMKEY/Ye9wa/Qe6D8hTI46c+8orJkM1yGqUf6zDi/0XCqycBHkKje/2eEEdn67Q==
X-Received: from dmatlack-heavy.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:19cd])
 (user=dmatlack job=sendgmr) by 2002:a17:90b:4c45:b0:1d2:acdc:71d4 with SMTP
 id np5-20020a17090b4c4500b001d2acdc71d4mr18351155pjb.39.1650661556671; Fri,
 22 Apr 2022 14:05:56 -0700 (PDT)
Date:   Fri, 22 Apr 2022 21:05:31 +0000
In-Reply-To: <20220422210546.458943-1-dmatlack@google.com>
Message-Id: <20220422210546.458943-6-dmatlack@google.com>
Mime-Version: 1.0
References: <20220422210546.458943-1-dmatlack@google.com>
X-Mailer: git-send-email 2.36.0.rc2.479.g8af0fa9b8e-goog
Subject: [PATCH v4 05/20] KVM: x86/mmu: Consolidate shadow page allocation and initialization
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
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Consolidate kvm_mmu_alloc_page() and kvm_mmu_alloc_shadow_page() under
the latter so that all shadow page allocation and initialization happens
in one place.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 39 +++++++++++++++++----------------------
 1 file changed, 17 insertions(+), 22 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 5582badf4947..7d03320f6e08 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -1703,27 +1703,6 @@ static void drop_parent_pte(struct kvm_mmu_page *sp,
 	mmu_spte_clear_no_track(parent_pte);
 }
 
-static struct kvm_mmu_page *kvm_mmu_alloc_page(struct kvm_vcpu *vcpu, bool direct)
-{
-	struct kvm_mmu_page *sp;
-
-	sp = kvm_mmu_memory_cache_alloc(&vcpu->arch.mmu_page_header_cache);
-	sp->spt = kvm_mmu_memory_cache_alloc(&vcpu->arch.mmu_shadow_page_cache);
-	if (!direct)
-		sp->gfns = kvm_mmu_memory_cache_alloc(&vcpu->arch.mmu_gfn_array_cache);
-	set_page_private(virt_to_page(sp->spt), (unsigned long)sp);
-
-	/*
-	 * active_mmu_pages must be a FIFO list, as kvm_zap_obsolete_pages()
-	 * depends on valid pages being added to the head of the list.  See
-	 * comments in kvm_zap_obsolete_pages().
-	 */
-	sp->mmu_valid_gen = vcpu->kvm->arch.mmu_valid_gen;
-	list_add(&sp->link, &vcpu->kvm->arch.active_mmu_pages);
-	kvm_mod_used_mmu_pages(vcpu->kvm, +1);
-	return sp;
-}
-
 static void mark_unsync(u64 *spte);
 static void kvm_mmu_mark_parents_unsync(struct kvm_mmu_page *sp)
 {
@@ -2100,7 +2079,23 @@ static struct kvm_mmu_page *kvm_mmu_alloc_shadow_page(struct kvm_vcpu *vcpu,
 						      struct hlist_head *sp_list,
 						      union kvm_mmu_page_role role)
 {
-	struct kvm_mmu_page *sp = kvm_mmu_alloc_page(vcpu, role.direct);
+	struct kvm_mmu_page *sp;
+
+	sp = kvm_mmu_memory_cache_alloc(&vcpu->arch.mmu_page_header_cache);
+	sp->spt = kvm_mmu_memory_cache_alloc(&vcpu->arch.mmu_shadow_page_cache);
+	if (!role.direct)
+		sp->gfns = kvm_mmu_memory_cache_alloc(&vcpu->arch.mmu_gfn_array_cache);
+
+	set_page_private(virt_to_page(sp->spt), (unsigned long)sp);
+
+	/*
+	 * active_mmu_pages must be a FIFO list, as kvm_zap_obsolete_pages()
+	 * depends on valid pages being added to the head of the list.  See
+	 * comments in kvm_zap_obsolete_pages().
+	 */
+	sp->mmu_valid_gen = vcpu->kvm->arch.mmu_valid_gen;
+	list_add(&sp->link, &vcpu->kvm->arch.active_mmu_pages);
+	kvm_mod_used_mmu_pages(vcpu->kvm, +1);
 
 	sp->gfn = gfn;
 	sp->role = role;
-- 
2.36.0.rc2.479.g8af0fa9b8e-goog

