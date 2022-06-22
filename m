Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBC045551C6
	for <lists+linux-mips@lfdr.de>; Wed, 22 Jun 2022 18:55:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376719AbiFVQxF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Jun 2022 12:53:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376832AbiFVQww (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 22 Jun 2022 12:52:52 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5F3E4434A9
        for <linux-mips@vger.kernel.org>; Wed, 22 Jun 2022 09:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655916617;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4XfwMH9ynk+SpvE37AyJRg8bmZJpm/5NDJ42rUcbiSk=;
        b=YRxYAXGa/tNyWH7P0ZJD8p8RK5aLH5r85oF10hYLqpSebsUP2+a3tlbdgxPhL/1QrIZIOB
        1UcVss8+7G1Wq7AWMeMV/BjxBkCv++33eBGRKgJ+UB30q/d10lxhRh7iQ3m/8kfoE52c0R
        JjnQieOAIHY2GHBB5xtxhXzHgLb6pkA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-jsbEmRWRPdGT4y2-LvFeyg-1; Wed, 22 Jun 2022 12:50:16 -0400
X-MC-Unique: jsbEmRWRPdGT4y2-LvFeyg-1
Received: by mail-ed1-f72.google.com with SMTP id y4-20020aa7ccc4000000b0042df06d83bcso13765364edt.22
        for <linux-mips@vger.kernel.org>; Wed, 22 Jun 2022 09:50:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=4XfwMH9ynk+SpvE37AyJRg8bmZJpm/5NDJ42rUcbiSk=;
        b=EvyG5IgXDyBiSM/Rglqt+yCTc5bxbQmHsHWMfhBAQs+i35xmmsAHGOdepbN/zCAiBL
         TI+qdGULjjmPS1wxzY/VmS+BXl3EMX9VAgBxBX0Q3/0cuHCAOd2Ckfb8xSMFf7zjACmF
         ujuQcyJmLzNHI0pwPtrtzDJvN07NuNelcUwFnI9R/iOE0j3Rv2Ve5K0rSnWeL+RhF6gO
         nSsyObIhpOCIUA+KgGgap1gy0+tlnFwM34b6/21rdpRcrsxD0EblfTxCtYXvjl4AUGy3
         utKhsn8ujkJtM/cclNTZS7wnKBNrORMnqxoXDMkG5kDgH3xDPZJlGRD/bNHHT09FsjNy
         H1xg==
X-Gm-Message-State: AJIora+EOlHIh7CM0tPo1YaXyKDD2yeRPNjo06IqMn9WTgBi3zxF67Wy
        N8X/ol/DzcAxy6Drj4xt7dnF2cvCWrq8l1Fwx9u77K0USN59Z6tjLonNjJVbvBRMy1+7/I4g+gM
        7W1vBhGNlSZJ0Y86ZNw8/xQ==
X-Received: by 2002:a17:907:6d83:b0:711:e44b:714 with SMTP id sb3-20020a1709076d8300b00711e44b0714mr4016414ejc.392.1655916614789;
        Wed, 22 Jun 2022 09:50:14 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sC/lvr0Tnu4XA3JL6D2PrVVpe51+uh98+vu8rkpMJw7FhS4BWe7E6W+fEXs8AE7M85oBzrWw==
X-Received: by 2002:a17:907:6d83:b0:711:e44b:714 with SMTP id sb3-20020a1709076d8300b00711e44b0714mr4016380ejc.392.1655916614537;
        Wed, 22 Jun 2022 09:50:14 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id g5-20020a50d5c5000000b004356c0d7436sm12212090edj.42.2022.06.22.09.50.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 09:50:12 -0700 (PDT)
Message-ID: <41f1f405-fa2b-0022-c4ba-58a8d0ff3bad@redhat.com>
Date:   Wed, 22 Jun 2022 18:50:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 20/22] KVM: x86/mmu: Refactor drop_large_spte()
Content-Language: en-US
From:   Paolo Bonzini <pbonzini@redhat.com>
To:     Sean Christopherson <seanjc@google.com>,
        David Matlack <dmatlack@google.com>
Cc:     Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
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
        Lai Jiangshan <jiangshanlai@gmail.com>
References: <20220516232138.1783324-1-dmatlack@google.com>
 <20220516232138.1783324-21-dmatlack@google.com> <Yqy1v59ZDJ7EkCix@google.com>
 <4665c87b-4983-7e15-9262-290d2969b10f@redhat.com>
In-Reply-To: <4665c87b-4983-7e15-9262-290d2969b10f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 6/22/22 18:13, Paolo Bonzini wrote:
> Even better, drop_large_spte() is always called right before 
> kvm_mmu_get_child_sp(), so:

Actually, we can even include the call from eager page splitting if
__link_shadow_page() is the one that takes care of dropping the large
SPTE:

 From bea344e409bb8329ca69aca0a63f97537a7ec798 Mon Sep 17 00:00:00 2001
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 22 Jun 2022 12:11:44 -0400
Subject: [PATCH] KVM: MMU: pull call to drop_large_spte() into
  __link_shadow_page()

Before allocating a child shadow page table, all callers check
whether the parent already points to a huge page and, if so, they
drop that SPTE.  This is done by drop_large_spte().

However, the act that requires dropping the large SPTE is the
installation of the sp that is returned by kvm_mmu_get_child_sp(),
which happens in __link_shadow_page().  Move the call there
instead of having it in each and every caller.

To ensure that the shadow page is not linked twice if it was
present, do _not_ opportunistically make kvm_mmu_get_child_sp()
idempotent: instead, return an error value if the shadow page
already existed.  This is a bit more verbose, but clearer than
NULL.

Now that the drop_large_spte() name is not taken anymore,
remove the two underscores in front of __drop_large_spte().

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 36bc49f08d60..64c1191be4ae 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -1135,26 +1135,16 @@ static void drop_spte(struct kvm *kvm, u64 *sptep)
  		rmap_remove(kvm, sptep);
  }
  
-
-static bool __drop_large_spte(struct kvm *kvm, u64 *sptep)
+static void drop_large_spte(struct kvm *kvm, u64 *sptep)
  {
-	if (is_large_pte(*sptep)) {
-		WARN_ON(sptep_to_sp(sptep)->role.level == PG_LEVEL_4K);
-		drop_spte(kvm, sptep);
-		return true;
-	}
-
-	return false;
-}
+	struct kvm_mmu_page *sp;
  
-static void drop_large_spte(struct kvm_vcpu *vcpu, u64 *sptep)
-{
-	if (__drop_large_spte(vcpu->kvm, sptep)) {
-		struct kvm_mmu_page *sp = sptep_to_sp(sptep);
+	sp = sptep_to_sp(sptep);
+	WARN_ON(sp->role.level == PG_LEVEL_4K);
  
-		kvm_flush_remote_tlbs_with_address(vcpu->kvm, sp->gfn,
+	drop_spte(kvm, sptep);
+	kvm_flush_remote_tlbs_with_address(kvm, sp->gfn,
  			KVM_PAGES_PER_HPAGE(sp->role.level));
-	}
  }
  
  /*
@@ -2221,6 +2211,9 @@ static struct kvm_mmu_page *kvm_mmu_get_child_sp(struct kvm_vcpu *vcpu,
  {
  	union kvm_mmu_page_role role;
  
+	if (is_shadow_present_pte(*sptep) && !is_large_pte(*sptep))
+		return ERR_PTR(-EEXIST);
+
  	role = kvm_mmu_child_role(sptep, direct, access);
  	return kvm_mmu_get_shadow_page(vcpu, gfn, role);
  }
@@ -2295,6 +2288,13 @@ static void __link_shadow_page(struct kvm_mmu_memory_cache *cache, u64 *sptep,
  
  	BUILD_BUG_ON(VMX_EPT_WRITABLE_MASK != PT_WRITABLE_MASK);
  
+	/*
+	 * If an SPTE is present already, it must be a leaf and therefore
+	 * a large one.  Drop it and flush the TLB before installing sp.
+	 */
+	if (is_shadow_present_pte(*sptep)
+		drop_large_spte(vcpu->kvm, sptep);
+
  	spte = make_nonleaf_spte(sp->spt, sp_ad_disabled(sp));
  
  	mmu_spte_set(sptep, spte);
@@ -3080,11 +3080,9 @@ static int __direct_map(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
  		if (it.level == fault->goal_level)
  			break;
  
-		drop_large_spte(vcpu, it.sptep);
-		if (is_shadow_present_pte(*it.sptep))
-			continue;
-
  		sp = kvm_mmu_get_child_sp(vcpu, it.sptep, base_gfn, true, ACC_ALL);
+		if (sp == ERR_PTR(-EEXIST))
+			continue;
  
  		link_shadow_page(vcpu, it.sptep, sp);
  		if (fault->is_tdp && fault->huge_page_disallowed &&
diff --git a/arch/x86/kvm/mmu/paging_tmpl.h b/arch/x86/kvm/mmu/paging_tmpl.h
index 24f292f3f93f..2448fa8d8438 100644
--- a/arch/x86/kvm/mmu/paging_tmpl.h
+++ b/arch/x86/kvm/mmu/paging_tmpl.h
@@ -648,15 +648,13 @@ static int FNAME(fetch)(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault,
  		gfn_t table_gfn;
  
  		clear_sp_write_flooding_count(it.sptep);
-		drop_large_spte(vcpu, it.sptep);
  
-		sp = NULL;
-		if (!is_shadow_present_pte(*it.sptep)) {
-			table_gfn = gw->table_gfn[it.level - 2];
-			access = gw->pt_access[it.level - 2];
-			sp = kvm_mmu_get_child_sp(vcpu, it.sptep, table_gfn,
-						  false, access);
+		table_gfn = gw->table_gfn[it.level - 2];
+		access = gw->pt_access[it.level - 2];
+		sp = kvm_mmu_get_child_sp(vcpu, it.sptep, table_gfn,
+					  false, access);
  
+		if (sp != ERR_PTR(-EEXIST)) {
  			/*
  			 * We must synchronize the pagetable before linking it
  			 * because the guest doesn't need to flush tlb when
@@ -685,7 +683,7 @@ static int FNAME(fetch)(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault,
  		if (FNAME(gpte_changed)(vcpu, gw, it.level - 1))
  			goto out_gpte_changed;
  
-		if (sp)
+		if (sp != ERR_PTR(-EEXIST))
  			link_shadow_page(vcpu, it.sptep, sp);
  	}
  
@@ -709,16 +707,15 @@ static int FNAME(fetch)(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault,
  
  		validate_direct_spte(vcpu, it.sptep, direct_access);
  
-		drop_large_spte(vcpu, it.sptep);
+		sp = kvm_mmu_get_child_sp(vcpu, it.sptep, base_gfn,
+					  true, direct_access);
+		if (sp == ERR_PTR(-EEXIST))
+			continue;
  
-		if (!is_shadow_present_pte(*it.sptep)) {
-			sp = kvm_mmu_get_child_sp(vcpu, it.sptep, base_gfn,
-						  true, direct_access);
-			link_shadow_page(vcpu, it.sptep, sp);
-			if (fault->huge_page_disallowed &&
-			    fault->req_level >= it.level)
-				account_huge_nx_page(vcpu->kvm, sp);
-		}
+		link_shadow_page(vcpu, it.sptep, sp);
+		if (fault->huge_page_disallowed &&
+		    fault->req_level >= it.level)
+			account_huge_nx_page(vcpu->kvm, sp);
  	}
  
  	if (WARN_ON_ONCE(it.level != fault->goal_level))


I'll test the resulting series and then send a v7.

Paolo

