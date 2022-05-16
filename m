Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9738952952D
	for <lists+linux-mips@lfdr.de>; Tue, 17 May 2022 01:22:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350374AbiEPXWT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 May 2022 19:22:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350379AbiEPXWG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 16 May 2022 19:22:06 -0400
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9281147055
        for <linux-mips@vger.kernel.org>; Mon, 16 May 2022 16:22:01 -0700 (PDT)
Received: by mail-pf1-x44a.google.com with SMTP id 67-20020a621846000000b0050d22f49732so6787467pfy.14
        for <linux-mips@vger.kernel.org>; Mon, 16 May 2022 16:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=dyrDQxvVqzaLpg9HV2kE5H+kDGD5WxxQRBU/WmU1XFs=;
        b=pfaCP6OTiTGC2oxRUMayjrie7/VzJ81h6Qa532s0hTXsEqzDDAtC0sx9tNGds1lNjZ
         dhIc9/T4SoCbs4rUjBqpQ4UAEh6uiNIgDQIpA5rHLqYPu6wAuVLwnyTBT4G4RXNmE3Bf
         oCWLxfGYOUk2e09oIr4E39O/H2eh2Dbw722UKmd30heh9pc5vIASwDy8I5MxnorvgSBu
         L9UnjZdkM4iJWtIDwE1Lr0oAenLLoAMRrjkFO6CXcf1wQosiXiBTAnS38TLA2mqa2uaD
         Z+ioCsq6zAUOVwspZYKkGpZcEo9zSys3lHLxBn831QEh0nb6Tb1polTeo6sfl4pb4GmX
         nMVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=dyrDQxvVqzaLpg9HV2kE5H+kDGD5WxxQRBU/WmU1XFs=;
        b=M3SXTbc7Ps4DhMpjPfz+RWUGzDxQdPo4IcRWsRpmFfZfbQM4HBUeCV2kSOKURW1U89
         t4Ltrma+t7mJOOG1P2YA+LR1GYvSLd6xsZjaOu1RAk3MAFgKJgTjWQKVWU8Ao+mWU5kL
         Wxi9EhFG9ECuQCI/oqElhgJTpC360aRV0NK5f5Bso6xQ0MgA3JmNJDWaIeOkb+MmUHOi
         Uf2LaLQZOE0gNPLY0Rgd0BmJOeF0rdJkvv86A5KjHO4GafpFNOzkirc7cW2ed7pd3yoM
         oqVWx4eASRG+Bxsp4BjFzmpZ487l/qw49zQSxv/87ZtrCKfTkPBJea3XzCiOOOf9CC1l
         L3Sw==
X-Gm-Message-State: AOAM532p5UzFz7t2wFucSL5pFAwSyrZ55HQnB7wtPVZS0JMzijsmMZIB
        LrdLfVY8+IdBFm1fPPWJJUoNPOGTDKBc+g==
X-Google-Smtp-Source: ABdhPJxw6mYt6nq4QC9t7qIifO02uVE16TA2QqHMfCyjKbpL5wRzzpw8PMJss0mc7Sc1xGGhw+VIYG5wqYvbJg==
X-Received: from dmatlack-heavy.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:19cd])
 (user=dmatlack job=sendgmr) by 2002:a05:6a00:1348:b0:512:dba6:cf04 with SMTP
 id k8-20020a056a00134800b00512dba6cf04mr19624133pfu.45.1652743320724; Mon, 16
 May 2022 16:22:00 -0700 (PDT)
Date:   Mon, 16 May 2022 23:21:28 +0000
In-Reply-To: <20220516232138.1783324-1-dmatlack@google.com>
Message-Id: <20220516232138.1783324-13-dmatlack@google.com>
Mime-Version: 1.0
References: <20220516232138.1783324-1-dmatlack@google.com>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
Subject: [PATCH v6 12/22] KVM: x86/mmu: Pass kvm pointer separately from vcpu
 to kvm_mmu_find_shadow_page()
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
        Lai Jiangshan <jiangshanlai@gmail.com>,
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

Get the kvm pointer from the caller, rather than deriving it from
vcpu->kvm, and plumb the kvm pointer all the way from
kvm_mmu_get_shadow_page(). With this change in place, the vcpu pointer
is only needed to sync indirect shadow pages. In other words,
__kvm_mmu_get_shadow_page() can now be used to get *direct* shadow pages
without a vcpu pointer. This enables eager page splitting, which needs
to allocate direct shadow pages during VM ioctls.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 8031b799ca77..4fbc2da47428 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -2001,7 +2001,8 @@ static void clear_sp_write_flooding_count(u64 *spte)
 	__clear_sp_write_flooding_count(sptep_to_sp(spte));
 }
 
-static struct kvm_mmu_page *kvm_mmu_find_shadow_page(struct kvm_vcpu *vcpu,
+static struct kvm_mmu_page *kvm_mmu_find_shadow_page(struct kvm *kvm,
+						     struct kvm_vcpu *vcpu,
 						     gfn_t gfn,
 						     struct hlist_head *sp_list,
 						     union kvm_mmu_page_role role)
@@ -2011,7 +2012,7 @@ static struct kvm_mmu_page *kvm_mmu_find_shadow_page(struct kvm_vcpu *vcpu,
 	int collisions = 0;
 	LIST_HEAD(invalid_list);
 
-	for_each_valid_sp(vcpu->kvm, sp, sp_list) {
+	for_each_valid_sp(kvm, sp, sp_list) {
 		if (sp->gfn != gfn) {
 			collisions++;
 			continue;
@@ -2028,7 +2029,7 @@ static struct kvm_mmu_page *kvm_mmu_find_shadow_page(struct kvm_vcpu *vcpu,
 			 * upper-level page will be write-protected.
 			 */
 			if (role.level > PG_LEVEL_4K && sp->unsync)
-				kvm_mmu_prepare_zap_page(vcpu->kvm, sp,
+				kvm_mmu_prepare_zap_page(kvm, sp,
 							 &invalid_list);
 			continue;
 		}
@@ -2056,7 +2057,7 @@ static struct kvm_mmu_page *kvm_mmu_find_shadow_page(struct kvm_vcpu *vcpu,
 
 			WARN_ON(!list_empty(&invalid_list));
 			if (ret > 0)
-				kvm_flush_remote_tlbs(vcpu->kvm);
+				kvm_flush_remote_tlbs(kvm);
 		}
 
 		__clear_sp_write_flooding_count(sp);
@@ -2065,13 +2066,13 @@ static struct kvm_mmu_page *kvm_mmu_find_shadow_page(struct kvm_vcpu *vcpu,
 	}
 
 	sp = NULL;
-	++vcpu->kvm->stat.mmu_cache_miss;
+	++kvm->stat.mmu_cache_miss;
 
 out:
-	kvm_mmu_commit_zap_page(vcpu->kvm, &invalid_list);
+	kvm_mmu_commit_zap_page(kvm, &invalid_list);
 
-	if (collisions > vcpu->kvm->stat.max_mmu_page_hash_collisions)
-		vcpu->kvm->stat.max_mmu_page_hash_collisions = collisions;
+	if (collisions > kvm->stat.max_mmu_page_hash_collisions)
+		kvm->stat.max_mmu_page_hash_collisions = collisions;
 	return sp;
 }
 
@@ -2115,7 +2116,8 @@ static struct kvm_mmu_page *kvm_mmu_alloc_shadow_page(struct kvm *kvm,
 	return sp;
 }
 
-static struct kvm_mmu_page *__kvm_mmu_get_shadow_page(struct kvm_vcpu *vcpu,
+static struct kvm_mmu_page *__kvm_mmu_get_shadow_page(struct kvm *kvm,
+						      struct kvm_vcpu *vcpu,
 						      struct shadow_page_caches *caches,
 						      gfn_t gfn,
 						      union kvm_mmu_page_role role)
@@ -2124,12 +2126,12 @@ static struct kvm_mmu_page *__kvm_mmu_get_shadow_page(struct kvm_vcpu *vcpu,
 	struct kvm_mmu_page *sp;
 	bool created = false;
 
-	sp_list = &vcpu->kvm->arch.mmu_page_hash[kvm_page_table_hashfn(gfn)];
+	sp_list = &kvm->arch.mmu_page_hash[kvm_page_table_hashfn(gfn)];
 
-	sp = kvm_mmu_find_shadow_page(vcpu, gfn, sp_list, role);
+	sp = kvm_mmu_find_shadow_page(kvm, vcpu, gfn, sp_list, role);
 	if (!sp) {
 		created = true;
-		sp = kvm_mmu_alloc_shadow_page(vcpu->kvm, caches, gfn, sp_list, role);
+		sp = kvm_mmu_alloc_shadow_page(kvm, caches, gfn, sp_list, role);
 	}
 
 	trace_kvm_mmu_get_page(sp, created);
@@ -2146,7 +2148,7 @@ static struct kvm_mmu_page *kvm_mmu_get_shadow_page(struct kvm_vcpu *vcpu,
 		.gfn_array_cache = &vcpu->arch.mmu_gfn_array_cache,
 	};
 
-	return __kvm_mmu_get_shadow_page(vcpu, &caches, gfn, role);
+	return __kvm_mmu_get_shadow_page(vcpu->kvm, vcpu, &caches, gfn, role);
 }
 
 static union kvm_mmu_page_role kvm_mmu_child_role(u64 *sptep, bool direct, u32 access)
-- 
2.36.0.550.gb090851708-goog

