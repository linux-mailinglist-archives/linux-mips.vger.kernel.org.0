Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 422AC50C2A2
	for <lists+linux-mips@lfdr.de>; Sat, 23 Apr 2022 01:09:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232493AbiDVWP5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 Apr 2022 18:15:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232155AbiDVWPj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 22 Apr 2022 18:15:39 -0400
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF1F323E81B
        for <linux-mips@vger.kernel.org>; Fri, 22 Apr 2022 14:06:13 -0700 (PDT)
Received: by mail-pl1-x64a.google.com with SMTP id t12-20020a170902a5cc00b001590717a080so5386732plq.10
        for <linux-mips@vger.kernel.org>; Fri, 22 Apr 2022 14:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=KFu74/1LFhYChFVRV8yYV2rmiovnNzZUI5NGAy6n7ps=;
        b=RelD8PTSw3o9B+IoxLY+GZlM1L3aDBoAxfWyQxrK6eB/hGlLL6YDQP4zVqB3oR2jC3
         zYW3kf5P8SmI74uAlY4hIalp9MWjko5koBnoTHfbUvkXU8b1JSjqpp+Q7dsHnPf3cBJQ
         JiB8+wUE+3p41u3CenAbQmuoILBTCx/SNr0eR8LtQKjoLgJftlodn091mcWNYMDXj8bi
         R8/TEJ6lLShd6JnI/2q8AHVSARwJGFKFb6//E5iBlylUdX0vZ3m5n2JJcXf/fCM/ULFx
         PeRjRHxLjADVDw9ZwSEmyBsvOvGKz5FtMlA4MWqNxy5FhgiE2JiAWYaQlY3tr3hvGb1f
         e3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=KFu74/1LFhYChFVRV8yYV2rmiovnNzZUI5NGAy6n7ps=;
        b=IEG00TPKNeEyi9lRcPGsPj8pJAo7/xM2OHeW8Kp4v1WnnDSYHdIqvFl8vBWkJjWrKV
         bnxCQsQ/ltOqSDj68FUEP+Oc9cCVn6gH33kCCAOOvGL/nPUX96eUZrzB6Cq9T2RhF2aN
         tRSSrEJMKUNnCTNRhVFztNpxGp3XSIZMnxwIj51Bm7HMbFEQMXiGiWZNqgFQMzv0sHoQ
         6Li8GWfzde9CkD/TAIY5i+s1md9qFS8lKHBOTgkyawTyNPVpX5415dxUk3k8CxHFIf/6
         UeYxx/TeQ56o4UDIxm8S8+AQ0Vs4wJmaJoj6xMx2X6b4gIXnKyxdQ/MrhkHThxCvthTR
         Ibuw==
X-Gm-Message-State: AOAM532PPRvRcBKqU1cNX+yeyo0UdozwhtN893YZfbNGw1PyiMcYcpvk
        koVzEiTbbp2mth/yS+dpPamq09TGnSL9xA==
X-Google-Smtp-Source: ABdhPJxdUvTORycpTm6+ENI526zs84Kfta+yDMJOj54qZB8CfK2s6LN0IRAw4LqFKnALMmjXx9sPpUvh+Cx2DA==
X-Received: from dmatlack-heavy.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:19cd])
 (user=dmatlack job=sendgmr) by 2002:a63:591c:0:b0:3aa:506c:b50b with SMTP id
 n28-20020a63591c000000b003aa506cb50bmr5494405pgb.77.1650661573164; Fri, 22
 Apr 2022 14:06:13 -0700 (PDT)
Date:   Fri, 22 Apr 2022 21:05:41 +0000
In-Reply-To: <20220422210546.458943-1-dmatlack@google.com>
Message-Id: <20220422210546.458943-16-dmatlack@google.com>
Mime-Version: 1.0
References: <20220422210546.458943-1-dmatlack@google.com>
X-Mailer: git-send-email 2.36.0.rc2.479.g8af0fa9b8e-goog
Subject: [PATCH v4 15/20] KVM: x86/mmu: Cache the access bits of shadowed translations
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

Splitting huge pages requires allocating/finding shadow pages to replace
the huge page. Shadow pages are keyed, in part, off the guest access
permissions they are shadowing. For fully direct MMUs, there is no
shadowing so the access bits in the shadow page role are always ACC_ALL.
But during shadow paging, the guest can enforce whatever access
permissions it wants.

When KVM is resolving a fault, it walks the guest pages tables to
determine the guest access permissions. But that is difficult to plumb
when splitting huge pages outside of a fault context, e.g. for eager
page splitting.

To enable eager page splitting, KVM can cache the shadowed (guest)
access permissions whenever it updates the shadow page tables (e.g.
during fault, or FNAME(sync_page)). In fact KVM already does this to
cache the shadowed GFN using the gfns array in the shadow page.
The access bits only take up 3 bits, which leaves 61 bits left over for
gfns, which is more than enough. So this change does not require any
additional memory.

Now that the gfns array caches more information than just GFNs, rename
it to shadowed_translation.

While here, preemptively fix up the WARN_ON() that detects gfn
mismatches in direct SPs. The WARN_ON() was paired with a
pr_err_ratelimited(), which means that users could sometimes see the
WARN without the accompanying error message. Fix this by outputting the
error message as part of the WARN splat.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/include/asm/kvm_host.h |  2 +-
 arch/x86/kvm/mmu/mmu.c          | 82 +++++++++++++++++++++++++--------
 arch/x86/kvm/mmu/mmu_internal.h | 17 ++++++-
 arch/x86/kvm/mmu/paging_tmpl.h  |  8 +++-
 4 files changed, 85 insertions(+), 24 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 2c20f715f009..15131aa05701 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -691,7 +691,7 @@ struct kvm_vcpu_arch {
 
 	struct kvm_mmu_memory_cache mmu_pte_list_desc_cache;
 	struct kvm_mmu_memory_cache mmu_shadow_page_cache;
-	struct kvm_mmu_memory_cache mmu_gfn_array_cache;
+	struct kvm_mmu_memory_cache mmu_shadowed_info_cache;
 	struct kvm_mmu_memory_cache mmu_page_header_cache;
 
 	/*
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 6a190fe6c9dc..ed65899d15a2 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -705,7 +705,7 @@ static int mmu_topup_memory_caches(struct kvm_vcpu *vcpu, bool maybe_indirect)
 	if (r)
 		return r;
 	if (maybe_indirect) {
-		r = kvm_mmu_topup_memory_cache(&vcpu->arch.mmu_gfn_array_cache,
+		r = kvm_mmu_topup_memory_cache(&vcpu->arch.mmu_shadowed_info_cache,
 					       PT64_ROOT_MAX_LEVEL);
 		if (r)
 			return r;
@@ -718,7 +718,7 @@ static void mmu_free_memory_caches(struct kvm_vcpu *vcpu)
 {
 	kvm_mmu_free_memory_cache(&vcpu->arch.mmu_pte_list_desc_cache);
 	kvm_mmu_free_memory_cache(&vcpu->arch.mmu_shadow_page_cache);
-	kvm_mmu_free_memory_cache(&vcpu->arch.mmu_gfn_array_cache);
+	kvm_mmu_free_memory_cache(&vcpu->arch.mmu_shadowed_info_cache);
 	kvm_mmu_free_memory_cache(&vcpu->arch.mmu_page_header_cache);
 }
 
@@ -730,23 +730,64 @@ static void mmu_free_pte_list_desc(struct pte_list_desc *pte_list_desc)
 static gfn_t kvm_mmu_page_get_gfn(struct kvm_mmu_page *sp, int index)
 {
 	if (!sp->role.direct)
-		return sp->gfns[index];
+		return sp->shadowed_translation[index] >> PAGE_SHIFT;
 
 	return sp->gfn + (index << ((sp->role.level - 1) * PT64_LEVEL_BITS));
 }
 
-static void kvm_mmu_page_set_gfn(struct kvm_mmu_page *sp, int index, gfn_t gfn)
+static void kvm_mmu_page_set_access(struct kvm_mmu_page *sp, int index, u32 access)
 {
 	if (!sp->role.direct) {
-		sp->gfns[index] = gfn;
+		sp->shadowed_translation[index] &= PAGE_MASK;
+		sp->shadowed_translation[index] |= access;
 		return;
 	}
 
-	if (WARN_ON(gfn != kvm_mmu_page_get_gfn(sp, index)))
-		pr_err_ratelimited("gfn mismatch under direct page %llx "
-				   "(expected %llx, got %llx)\n",
-				   sp->gfn,
-				   kvm_mmu_page_get_gfn(sp, index), gfn);
+	WARN(access != sp->role.access,
+	     "access mismatch under direct page %llx (expected %u, got %u)\n",
+	     sp->gfn, sp->role.access, access);
+}
+
+static void kvm_mmu_page_set_translation(struct kvm_mmu_page *sp, int index, gfn_t gfn, u32 access)
+{
+	if (!sp->role.direct) {
+		sp->shadowed_translation[index] = (gfn << PAGE_SHIFT) | access;
+		return;
+	}
+
+	WARN(access != sp->role.access,
+	     "access mismatch under direct page %llx (expected %u, got %u)\n",
+	     sp->gfn, sp->role.access, access);
+
+	WARN(gfn != kvm_mmu_page_get_gfn(sp, index),
+	     "gfn mismatch under direct page %llx (expected %llx, got %llx)\n",
+	     sp->gfn, kvm_mmu_page_get_gfn(sp, index), gfn);
+}
+
+/*
+ * For leaf SPTEs, fetch the *guest* access permissions being shadowed. Note
+ * that the SPTE itself may have a more constrained access permissions that
+ * what the guest enforces. For example, a guest may create an executable
+ * huge PTE but KVM may disallow execution to mitigate iTLB multihit.
+ */
+static u32 kvm_mmu_page_get_access(struct kvm_mmu_page *sp, int index)
+{
+	if (!sp->role.direct)
+		return sp->shadowed_translation[index] & ACC_ALL;
+
+	/*
+	 * For direct MMUs (e.g. TDP or non-paging guests) there are no *guest*
+	 * access permissions being shadowed, which is equivalent to ACC_ALL.
+	 *
+	 * For indirect MMUs (shadow paging), direct shadow pages exist when KVM
+	 * is shadowing a guest huge page with smaller pages, since the guest
+	 * huge page is being directly mapped. In this case the guest access
+	 * permissions being shadowed are the access permissions of the huge
+	 * page.
+	 *
+	 * In both cases, sp->role.access contains the correct access bits.
+	 */
+	return sp->role.access;
 }
 
 /*
@@ -1593,14 +1634,14 @@ static bool kvm_test_age_rmapp(struct kvm *kvm, struct kvm_rmap_head *rmap_head,
 static void __rmap_add(struct kvm *kvm,
 		       struct kvm_mmu_memory_cache *cache,
 		       const struct kvm_memory_slot *slot,
-		       u64 *spte, gfn_t gfn)
+		       u64 *spte, gfn_t gfn, u32 access)
 {
 	struct kvm_mmu_page *sp;
 	struct kvm_rmap_head *rmap_head;
 	int rmap_count;
 
 	sp = sptep_to_sp(spte);
-	kvm_mmu_page_set_gfn(sp, spte - sp->spt, gfn);
+	kvm_mmu_page_set_translation(sp, spte - sp->spt, gfn, access);
 	kvm_update_page_stats(kvm, sp->role.level, 1);
 
 	rmap_head = gfn_to_rmap(gfn, sp->role.level, slot);
@@ -1614,9 +1655,9 @@ static void __rmap_add(struct kvm *kvm,
 }
 
 static void rmap_add(struct kvm_vcpu *vcpu, const struct kvm_memory_slot *slot,
-		     u64 *spte, gfn_t gfn)
+		     u64 *spte, gfn_t gfn, u32 access)
 {
-	__rmap_add(vcpu->kvm, &vcpu->arch.mmu_pte_list_desc_cache, slot, spte, gfn);
+	__rmap_add(vcpu->kvm, &vcpu->arch.mmu_pte_list_desc_cache, slot, spte, gfn, access);
 }
 
 bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
@@ -1680,7 +1721,7 @@ static void kvm_mmu_free_shadow_page(struct kvm_mmu_page *sp)
 	list_del(&sp->link);
 	free_page((unsigned long)sp->spt);
 	if (!sp->role.direct)
-		free_page((unsigned long)sp->gfns);
+		free_page((unsigned long)sp->shadowed_translation);
 	kmem_cache_free(mmu_page_header_cache, sp);
 }
 
@@ -2098,7 +2139,7 @@ static struct kvm_mmu_page *kvm_mmu_find_shadow_page(struct kvm *kvm,
 struct shadow_page_caches {
 	struct kvm_mmu_memory_cache *page_header_cache;
 	struct kvm_mmu_memory_cache *shadow_page_cache;
-	struct kvm_mmu_memory_cache *gfn_array_cache;
+	struct kvm_mmu_memory_cache *shadowed_info_cache;
 };
 
 static struct kvm_mmu_page *kvm_mmu_alloc_shadow_page(struct kvm *kvm,
@@ -2112,7 +2153,7 @@ static struct kvm_mmu_page *kvm_mmu_alloc_shadow_page(struct kvm *kvm,
 	sp = kvm_mmu_memory_cache_alloc(caches->page_header_cache);
 	sp->spt = kvm_mmu_memory_cache_alloc(caches->shadow_page_cache);
 	if (!role.direct)
-		sp->gfns = kvm_mmu_memory_cache_alloc(caches->gfn_array_cache);
+		sp->shadowed_translation = kvm_mmu_memory_cache_alloc(caches->shadowed_info_cache);
 
 	set_page_private(virt_to_page(sp->spt), (unsigned long)sp);
 
@@ -2177,7 +2218,7 @@ static struct kvm_mmu_page *kvm_mmu_get_shadow_page(struct kvm_vcpu *vcpu,
 	struct shadow_page_caches caches = {
 		.page_header_cache = &vcpu->arch.mmu_page_header_cache,
 		.shadow_page_cache = &vcpu->arch.mmu_shadow_page_cache,
-		.gfn_array_cache = &vcpu->arch.mmu_gfn_array_cache,
+		.shadowed_info_cache = &vcpu->arch.mmu_shadowed_info_cache,
 	};
 
 	return __kvm_mmu_get_shadow_page(vcpu->kvm, vcpu, &caches, gfn, role);
@@ -2820,7 +2861,10 @@ static int mmu_set_spte(struct kvm_vcpu *vcpu, struct kvm_memory_slot *slot,
 
 	if (!was_rmapped) {
 		WARN_ON_ONCE(ret == RET_PF_SPURIOUS);
-		rmap_add(vcpu, slot, sptep, gfn);
+		rmap_add(vcpu, slot, sptep, gfn, pte_access);
+	} else {
+		/* Already rmapped but the pte_access bits may have changed. */
+		kvm_mmu_page_set_access(sp, sptep - sp->spt, pte_access);
 	}
 
 	return ret;
diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
index 1bff453f7cbe..1614a577a1cb 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -53,8 +53,21 @@ struct kvm_mmu_page {
 	gfn_t gfn;
 
 	u64 *spt;
-	/* hold the gfn of each spte inside spt */
-	gfn_t *gfns;
+
+	/*
+	 * Stores the result of the guest translation being shadowed by each
+	 * SPTE.  KVM shadows two types of guest translations: nGPA -> GPA
+	 * (shadow EPT/NPT) and GVA -> GPA (traditional shadow paging). In both
+	 * cases the result of the translation is a GPA and a set of access
+	 * constraints.
+	 *
+	 * The GFN is stored in the upper bits (PAGE_SHIFT) and the shadowed
+	 * access permissions are stored in the lower bits. Note, for
+	 * convenience and uniformity across guests, the access permissions are
+	 * stored in KVM format (e.g.  ACC_EXEC_MASK) not the raw guest format.
+	 */
+	u64 *shadowed_translation;
+
 	/* Currently serving as active root */
 	union {
 		int root_count;
diff --git a/arch/x86/kvm/mmu/paging_tmpl.h b/arch/x86/kvm/mmu/paging_tmpl.h
index a8a755e1561d..97bf53b29b88 100644
--- a/arch/x86/kvm/mmu/paging_tmpl.h
+++ b/arch/x86/kvm/mmu/paging_tmpl.h
@@ -978,7 +978,8 @@ static gpa_t FNAME(gva_to_gpa)(struct kvm_vcpu *vcpu, struct kvm_mmu *mmu,
 }
 
 /*
- * Using the cached information from sp->gfns is safe because:
+ * Using the information in sp->shadowed_translation (kvm_mmu_page_get_gfn()
+ * and kvm_mmu_page_get_access()) is safe because:
  * - The spte has a reference to the struct page, so the pfn for a given gfn
  *   can't change unless all sptes pointing to it are nuked first.
  *
@@ -1052,12 +1053,15 @@ static int FNAME(sync_page)(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp)
 		if (sync_mmio_spte(vcpu, &sp->spt[i], gfn, pte_access))
 			continue;
 
-		if (gfn != sp->gfns[i]) {
+		if (gfn != kvm_mmu_page_get_gfn(sp, i)) {
 			drop_spte(vcpu->kvm, &sp->spt[i]);
 			flush = true;
 			continue;
 		}
 
+		if (pte_access != kvm_mmu_page_get_access(sp, i))
+			kvm_mmu_page_set_access(sp, i, pte_access);
+
 		sptep = &sp->spt[i];
 		spte = *sptep;
 		host_writable = spte & shadow_host_writable_mask;
-- 
2.36.0.rc2.479.g8af0fa9b8e-goog

