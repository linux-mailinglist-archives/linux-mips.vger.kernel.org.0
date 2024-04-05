Return-Path: <linux-mips+bounces-2590-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBE8899C31
	for <lists+linux-mips@lfdr.de>; Fri,  5 Apr 2024 13:58:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F16271C20FD7
	for <lists+linux-mips@lfdr.de>; Fri,  5 Apr 2024 11:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01AE716D30F;
	Fri,  5 Apr 2024 11:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AZZqYpGt"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C4E16C6BD
	for <linux-mips@vger.kernel.org>; Fri,  5 Apr 2024 11:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712318309; cv=none; b=dsYM4PFJqRuu0m/arb+mK15jt/QUkgvEOwZEDfJZGYy3DnPjnKg+//+5R70KxmPf0+liSBha3ejEFv8Sgwua6FdxPt/nlv7KiF/W1PF2yiW2XYRXjshTPDvTU66Gw+RJG6DlXbXlbVzsNblsImk4wGOUmLkOqeB0gTn3bU64Q+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712318309; c=relaxed/simple;
	bh=Qp0dmDa1jRvH5xbuAdztQUxb+P8roLnIe0/xOVBCeQo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aWlW8pmgvNj9HWaLmGRLpPOcLZbCHDNkfts6TlRhDt6rlEoav61Xf0ZTN8hi5AO/2zQopPXQcq8LamCKMBSozwLL3+ZEBwprw4UG0PaIQksQKuGOAcm4EG16YEMSVNYYPQfAGKPaXFeKpRSDUpS/U3UAlAJcV4CYcA0zGSxB8Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AZZqYpGt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712318305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wytamjt4i4/TmNza1qXkp+jO67L0V+arhl6Owo1MbtM=;
	b=AZZqYpGthcxYy6l3ZHT1CK1JRgjtsvcttJun+ke9uHyxwnvwRE8qp5z6MRjQqrJ7tYP0vE
	lPZWMuiMxZlSDi1BBNfk6H8Mg1Hk21iAB2szzGs/JRKzaXCt6rk8gCz/rzio2FzoleI/Qh
	2jSX2GpWsULyKztK1aghpu1h6IE9BFk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-177-BrVtY9xqPAqcqDQHveEs3w-1; Fri, 05 Apr 2024 07:58:20 -0400
X-MC-Unique: BrVtY9xqPAqcqDQHveEs3w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3BA2585A58B;
	Fri,  5 Apr 2024 11:58:19 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7696540C6CC1;
	Fri,  5 Apr 2024 11:58:18 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Nicholas Piggin <npiggin@gmail.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Sean Christopherson <seanjc@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org,
	linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH 1/4] KVM: delete .change_pte MMU notifier callback
Date: Fri,  5 Apr 2024 07:58:12 -0400
Message-ID: <20240405115815.3226315-2-pbonzini@redhat.com>
In-Reply-To: <20240405115815.3226315-1-pbonzini@redhat.com>
References: <20240405115815.3226315-1-pbonzini@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2

The .change_pte() MMU notifier callback was intended as an
optimization. The original point of it was that KSM could tell KVM to flip
its secondary PTE to a new location without having to first zap it. At
the time there was also an .invalidate_page() callback; both of them were
*not* bracketed by calls to mmu_notifier_invalidate_range_{start,end}(),
and .invalidate_page() also doubled as a fallback implementation of
.change_pte().

Later on, however, both callbacks were changed to occur within an
invalidate_range_start/end() block.

In the case of .change_pte(), commit 6bdb913f0a70 ("mm: wrap calls to
set_pte_at_notify with invalidate_range_start and invalidate_range_end",
2012-10-09) did so to remove the fallback from .invalidate_page() to
.change_pte() and allow sleepable .invalidate_page() hooks.

This however made KVM's usage of the .change_pte() callback completely
moot, because KVM unmaps the sPTEs during .invalidate_range_start()
and therefore .change_pte() has no hope of finding a sPTE to change.
Drop the generic KVM code that dispatches to kvm_set_spte_gfn(), as
well as all the architecture specific implementations.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/arm64/kvm/mmu.c                  | 34 -----------------
 arch/loongarch/include/asm/kvm_host.h |  1 -
 arch/loongarch/kvm/mmu.c              | 32 ----------------
 arch/mips/kvm/mmu.c                   | 30 ---------------
 arch/powerpc/include/asm/kvm_ppc.h    |  1 -
 arch/powerpc/kvm/book3s.c             |  5 ---
 arch/powerpc/kvm/book3s.h             |  1 -
 arch/powerpc/kvm/book3s_64_mmu_hv.c   | 12 ------
 arch/powerpc/kvm/book3s_hv.c          |  1 -
 arch/powerpc/kvm/book3s_pr.c          |  7 ----
 arch/powerpc/kvm/e500_mmu_host.c      |  6 ---
 arch/riscv/kvm/mmu.c                  | 20 ----------
 arch/x86/kvm/mmu/mmu.c                | 54 +--------------------------
 arch/x86/kvm/mmu/spte.c               | 16 --------
 arch/x86/kvm/mmu/spte.h               |  2 -
 arch/x86/kvm/mmu/tdp_mmu.c            | 46 -----------------------
 arch/x86/kvm/mmu/tdp_mmu.h            |  1 -
 include/linux/kvm_host.h              |  2 -
 include/trace/events/kvm.h            | 15 --------
 virt/kvm/kvm_main.c                   | 43 ---------------------
 20 files changed, 2 insertions(+), 327 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index dc04bc767865..ff17849be9f4 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1768,40 +1768,6 @@ bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
 	return false;
 }
 
-bool kvm_set_spte_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
-{
-	kvm_pfn_t pfn = pte_pfn(range->arg.pte);
-
-	if (!kvm->arch.mmu.pgt)
-		return false;
-
-	WARN_ON(range->end - range->start != 1);
-
-	/*
-	 * If the page isn't tagged, defer to user_mem_abort() for sanitising
-	 * the MTE tags. The S2 pte should have been unmapped by
-	 * mmu_notifier_invalidate_range_end().
-	 */
-	if (kvm_has_mte(kvm) && !page_mte_tagged(pfn_to_page(pfn)))
-		return false;
-
-	/*
-	 * We've moved a page around, probably through CoW, so let's treat
-	 * it just like a translation fault and the map handler will clean
-	 * the cache to the PoC.
-	 *
-	 * The MMU notifiers will have unmapped a huge PMD before calling
-	 * ->change_pte() (which in turn calls kvm_set_spte_gfn()) and
-	 * therefore we never need to clear out a huge PMD through this
-	 * calling path and a memcache is not required.
-	 */
-	kvm_pgtable_stage2_map(kvm->arch.mmu.pgt, range->start << PAGE_SHIFT,
-			       PAGE_SIZE, __pfn_to_phys(pfn),
-			       KVM_PGTABLE_PROT_R, NULL, 0);
-
-	return false;
-}
-
 bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 {
 	u64 size = (range->end - range->start) << PAGE_SHIFT;
diff --git a/arch/loongarch/include/asm/kvm_host.h b/arch/loongarch/include/asm/kvm_host.h
index 2d62f7b0d377..69305441f40d 100644
--- a/arch/loongarch/include/asm/kvm_host.h
+++ b/arch/loongarch/include/asm/kvm_host.h
@@ -203,7 +203,6 @@ void kvm_flush_tlb_all(void);
 void kvm_flush_tlb_gpa(struct kvm_vcpu *vcpu, unsigned long gpa);
 int kvm_handle_mm_fault(struct kvm_vcpu *vcpu, unsigned long badv, bool write);
 
-void kvm_set_spte_hva(struct kvm *kvm, unsigned long hva, pte_t pte);
 int kvm_unmap_hva_range(struct kvm *kvm, unsigned long start, unsigned long end, bool blockable);
 int kvm_age_hva(struct kvm *kvm, unsigned long start, unsigned long end);
 int kvm_test_age_hva(struct kvm *kvm, unsigned long hva);
diff --git a/arch/loongarch/kvm/mmu.c b/arch/loongarch/kvm/mmu.c
index a556cff35740..98883aa23ab8 100644
--- a/arch/loongarch/kvm/mmu.c
+++ b/arch/loongarch/kvm/mmu.c
@@ -494,38 +494,6 @@ bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
 			range->end << PAGE_SHIFT, &ctx);
 }
 
-bool kvm_set_spte_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
-{
-	unsigned long prot_bits;
-	kvm_pte_t *ptep;
-	kvm_pfn_t pfn = pte_pfn(range->arg.pte);
-	gpa_t gpa = range->start << PAGE_SHIFT;
-
-	ptep = kvm_populate_gpa(kvm, NULL, gpa, 0);
-	if (!ptep)
-		return false;
-
-	/* Replacing an absent or old page doesn't need flushes */
-	if (!kvm_pte_present(NULL, ptep) || !kvm_pte_young(*ptep)) {
-		kvm_set_pte(ptep, 0);
-		return false;
-	}
-
-	/* Fill new pte if write protected or page migrated */
-	prot_bits = _PAGE_PRESENT | __READABLE;
-	prot_bits |= _CACHE_MASK & pte_val(range->arg.pte);
-
-	/*
-	 * Set _PAGE_WRITE or _PAGE_DIRTY iff old and new pte both support
-	 * _PAGE_WRITE for map_page_fast if next page write fault
-	 * _PAGE_DIRTY since gpa has already recorded as dirty page
-	 */
-	prot_bits |= __WRITEABLE & *ptep & pte_val(range->arg.pte);
-	kvm_set_pte(ptep, kvm_pfn_pte(pfn, __pgprot(prot_bits)));
-
-	return true;
-}
-
 bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 {
 	kvm_ptw_ctx ctx;
diff --git a/arch/mips/kvm/mmu.c b/arch/mips/kvm/mmu.c
index 467ee6b95ae1..c17157e700c0 100644
--- a/arch/mips/kvm/mmu.c
+++ b/arch/mips/kvm/mmu.c
@@ -444,36 +444,6 @@ bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
 	return true;
 }
 
-bool kvm_set_spte_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
-{
-	gpa_t gpa = range->start << PAGE_SHIFT;
-	pte_t hva_pte = range->arg.pte;
-	pte_t *gpa_pte = kvm_mips_pte_for_gpa(kvm, NULL, gpa);
-	pte_t old_pte;
-
-	if (!gpa_pte)
-		return false;
-
-	/* Mapping may need adjusting depending on memslot flags */
-	old_pte = *gpa_pte;
-	if (range->slot->flags & KVM_MEM_LOG_DIRTY_PAGES && !pte_dirty(old_pte))
-		hva_pte = pte_mkclean(hva_pte);
-	else if (range->slot->flags & KVM_MEM_READONLY)
-		hva_pte = pte_wrprotect(hva_pte);
-
-	set_pte(gpa_pte, hva_pte);
-
-	/* Replacing an absent or old page doesn't need flushes */
-	if (!pte_present(old_pte) || !pte_young(old_pte))
-		return false;
-
-	/* Pages swapped, aged, moved, or cleaned require flushes */
-	return !pte_present(hva_pte) ||
-	       !pte_young(hva_pte) ||
-	       pte_pfn(old_pte) != pte_pfn(hva_pte) ||
-	       (pte_dirty(old_pte) && !pte_dirty(hva_pte));
-}
-
 bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 {
 	return kvm_mips_mkold_gpa_pt(kvm, range->start, range->end);
diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index 3281215097cc..ca3829d47ab7 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -287,7 +287,6 @@ struct kvmppc_ops {
 	bool (*unmap_gfn_range)(struct kvm *kvm, struct kvm_gfn_range *range);
 	bool (*age_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
 	bool (*test_age_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
-	bool (*set_spte_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
 	void (*free_memslot)(struct kvm_memory_slot *slot);
 	int (*init_vm)(struct kvm *kvm);
 	void (*destroy_vm)(struct kvm *kvm);
diff --git a/arch/powerpc/kvm/book3s.c b/arch/powerpc/kvm/book3s.c
index 8acec144120e..0d0624088e6b 100644
--- a/arch/powerpc/kvm/book3s.c
+++ b/arch/powerpc/kvm/book3s.c
@@ -899,11 +899,6 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 	return kvm->arch.kvm_ops->test_age_gfn(kvm, range);
 }
 
-bool kvm_set_spte_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
-{
-	return kvm->arch.kvm_ops->set_spte_gfn(kvm, range);
-}
-
 int kvmppc_core_init_vm(struct kvm *kvm)
 {
 
diff --git a/arch/powerpc/kvm/book3s.h b/arch/powerpc/kvm/book3s.h
index 58391b4b32ed..4aa2ab89afbc 100644
--- a/arch/powerpc/kvm/book3s.h
+++ b/arch/powerpc/kvm/book3s.h
@@ -12,7 +12,6 @@ extern void kvmppc_core_flush_memslot_hv(struct kvm *kvm,
 extern bool kvm_unmap_gfn_range_hv(struct kvm *kvm, struct kvm_gfn_range *range);
 extern bool kvm_age_gfn_hv(struct kvm *kvm, struct kvm_gfn_range *range);
 extern bool kvm_test_age_gfn_hv(struct kvm *kvm, struct kvm_gfn_range *range);
-extern bool kvm_set_spte_gfn_hv(struct kvm *kvm, struct kvm_gfn_range *range);
 
 extern int kvmppc_mmu_init_pr(struct kvm_vcpu *vcpu);
 extern void kvmppc_mmu_destroy_pr(struct kvm_vcpu *vcpu);
diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
index 2b1f0cdd8c18..1b51b1c4713b 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
@@ -1010,18 +1010,6 @@ bool kvm_test_age_gfn_hv(struct kvm *kvm, struct kvm_gfn_range *range)
 		return kvm_test_age_rmapp(kvm, range->slot, range->start);
 }
 
-bool kvm_set_spte_gfn_hv(struct kvm *kvm, struct kvm_gfn_range *range)
-{
-	WARN_ON(range->start + 1 != range->end);
-
-	if (kvm_is_radix(kvm))
-		kvm_unmap_radix(kvm, range->slot, range->start);
-	else
-		kvm_unmap_rmapp(kvm, range->slot, range->start);
-
-	return false;
-}
-
 static int vcpus_running(struct kvm *kvm)
 {
 	return atomic_read(&kvm->arch.vcpus_running) != 0;
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 8e86eb577eb8..35cb014a0c51 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -6364,7 +6364,6 @@ static struct kvmppc_ops kvm_ops_hv = {
 	.unmap_gfn_range = kvm_unmap_gfn_range_hv,
 	.age_gfn = kvm_age_gfn_hv,
 	.test_age_gfn = kvm_test_age_gfn_hv,
-	.set_spte_gfn = kvm_set_spte_gfn_hv,
 	.free_memslot = kvmppc_core_free_memslot_hv,
 	.init_vm =  kvmppc_core_init_vm_hv,
 	.destroy_vm = kvmppc_core_destroy_vm_hv,
diff --git a/arch/powerpc/kvm/book3s_pr.c b/arch/powerpc/kvm/book3s_pr.c
index 5b92619a05fd..a7d7137ea0c8 100644
--- a/arch/powerpc/kvm/book3s_pr.c
+++ b/arch/powerpc/kvm/book3s_pr.c
@@ -461,12 +461,6 @@ static bool kvm_test_age_gfn_pr(struct kvm *kvm, struct kvm_gfn_range *range)
 	return false;
 }
 
-static bool kvm_set_spte_gfn_pr(struct kvm *kvm, struct kvm_gfn_range *range)
-{
-	/* The page will get remapped properly on its next fault */
-	return do_kvm_unmap_gfn(kvm, range);
-}
-
 /*****************************************/
 
 static void kvmppc_set_msr_pr(struct kvm_vcpu *vcpu, u64 msr)
@@ -2071,7 +2065,6 @@ static struct kvmppc_ops kvm_ops_pr = {
 	.unmap_gfn_range = kvm_unmap_gfn_range_pr,
 	.age_gfn  = kvm_age_gfn_pr,
 	.test_age_gfn = kvm_test_age_gfn_pr,
-	.set_spte_gfn = kvm_set_spte_gfn_pr,
 	.free_memslot = kvmppc_core_free_memslot_pr,
 	.init_vm = kvmppc_core_init_vm_pr,
 	.destroy_vm = kvmppc_core_destroy_vm_pr,
diff --git a/arch/powerpc/kvm/e500_mmu_host.c b/arch/powerpc/kvm/e500_mmu_host.c
index ccb8f16ffe41..c664fdec75b1 100644
--- a/arch/powerpc/kvm/e500_mmu_host.c
+++ b/arch/powerpc/kvm/e500_mmu_host.c
@@ -747,12 +747,6 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 	return false;
 }
 
-bool kvm_set_spte_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
-{
-	/* The page will get remapped properly on its next fault */
-	return kvm_e500_mmu_unmap_gfn(kvm, range);
-}
-
 /*****************************************/
 
 int e500_mmu_host_init(struct kvmppc_vcpu_e500 *vcpu_e500)
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index a9e2fd7245e1..b63650f9b966 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -550,26 +550,6 @@ bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
 	return false;
 }
 
-bool kvm_set_spte_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
-{
-	int ret;
-	kvm_pfn_t pfn = pte_pfn(range->arg.pte);
-
-	if (!kvm->arch.pgd)
-		return false;
-
-	WARN_ON(range->end - range->start != 1);
-
-	ret = gstage_map_page(kvm, NULL, range->start << PAGE_SHIFT,
-			      __pfn_to_phys(pfn), PAGE_SIZE, true, true);
-	if (ret) {
-		kvm_debug("Failed to map G-stage page (error %d)\n", ret);
-		return true;
-	}
-
-	return false;
-}
-
 bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 {
 	pte_t *ptep;
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 0049d49aa913..87ba2a9da196 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -432,8 +432,8 @@ static u64 __update_clear_spte_slow(u64 *sptep, u64 spte)
  * The idea using the light way get the spte on x86_32 guest is from
  * gup_get_pte (mm/gup.c).
  *
- * An spte tlb flush may be pending, because kvm_set_pte_rmap
- * coalesces them and we are running out of the MMU lock.  Therefore
+ * An spte tlb flush may be pending, because they are coalesced and
+ * we are running out of the MMU lock.  Therefore
  * we need to protect against in-progress updates of the spte.
  *
  * Reading the spte while an update is in progress may get the old value
@@ -1454,43 +1454,6 @@ static bool kvm_zap_rmap(struct kvm *kvm, struct kvm_rmap_head *rmap_head,
 	return __kvm_zap_rmap(kvm, rmap_head, slot);
 }
 
-static bool kvm_set_pte_rmap(struct kvm *kvm, struct kvm_rmap_head *rmap_head,
-			     struct kvm_memory_slot *slot, gfn_t gfn, int level,
-			     pte_t pte)
-{
-	u64 *sptep;
-	struct rmap_iterator iter;
-	bool need_flush = false;
-	u64 new_spte;
-	kvm_pfn_t new_pfn;
-
-	WARN_ON_ONCE(pte_huge(pte));
-	new_pfn = pte_pfn(pte);
-
-restart:
-	for_each_rmap_spte(rmap_head, &iter, sptep) {
-		need_flush = true;
-
-		if (pte_write(pte)) {
-			kvm_zap_one_rmap_spte(kvm, rmap_head, sptep);
-			goto restart;
-		} else {
-			new_spte = kvm_mmu_changed_pte_notifier_make_spte(
-					*sptep, new_pfn);
-
-			mmu_spte_clear_track_bits(kvm, sptep);
-			mmu_spte_set(sptep, new_spte);
-		}
-	}
-
-	if (need_flush && kvm_available_flush_remote_tlbs_range()) {
-		kvm_flush_remote_tlbs_gfn(kvm, gfn, level);
-		return false;
-	}
-
-	return need_flush;
-}
-
 struct slot_rmap_walk_iterator {
 	/* input fields. */
 	const struct kvm_memory_slot *slot;
@@ -1596,19 +1559,6 @@ bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
 	return flush;
 }
 
-bool kvm_set_spte_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
-{
-	bool flush = false;
-
-	if (kvm_memslots_have_rmaps(kvm))
-		flush = kvm_handle_gfn_range(kvm, range, kvm_set_pte_rmap);
-
-	if (tdp_mmu_enabled)
-		flush |= kvm_tdp_mmu_set_spte_gfn(kvm, range);
-
-	return flush;
-}
-
 static bool kvm_age_rmap(struct kvm *kvm, struct kvm_rmap_head *rmap_head,
 			 struct kvm_memory_slot *slot, gfn_t gfn, int level,
 			 pte_t unused)
diff --git a/arch/x86/kvm/mmu/spte.c b/arch/x86/kvm/mmu/spte.c
index 318135daf685..283af5b90016 100644
--- a/arch/x86/kvm/mmu/spte.c
+++ b/arch/x86/kvm/mmu/spte.c
@@ -322,22 +322,6 @@ u64 make_nonleaf_spte(u64 *child_pt, bool ad_disabled)
 	return spte;
 }
 
-u64 kvm_mmu_changed_pte_notifier_make_spte(u64 old_spte, kvm_pfn_t new_pfn)
-{
-	u64 new_spte;
-
-	new_spte = old_spte & ~SPTE_BASE_ADDR_MASK;
-	new_spte |= (u64)new_pfn << PAGE_SHIFT;
-
-	new_spte &= ~PT_WRITABLE_MASK;
-	new_spte &= ~shadow_host_writable_mask;
-	new_spte &= ~shadow_mmu_writable_mask;
-
-	new_spte = mark_spte_for_access_track(new_spte);
-
-	return new_spte;
-}
-
 u64 mark_spte_for_access_track(u64 spte)
 {
 	if (spte_ad_enabled(spte))
diff --git a/arch/x86/kvm/mmu/spte.h b/arch/x86/kvm/mmu/spte.h
index 1a163aee9ec6..92da4c419171 100644
--- a/arch/x86/kvm/mmu/spte.h
+++ b/arch/x86/kvm/mmu/spte.h
@@ -511,8 +511,6 @@ static inline u64 restore_acc_track_spte(u64 spte)
 	return spte;
 }
 
-u64 kvm_mmu_changed_pte_notifier_make_spte(u64 old_spte, kvm_pfn_t new_pfn);
-
 void __init kvm_mmu_spte_module_init(void);
 void kvm_mmu_reset_all_pte_masks(void);
 
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 3627744fcab6..fbb86932b766 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -1250,52 +1250,6 @@ bool kvm_tdp_mmu_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 	return kvm_tdp_mmu_handle_gfn(kvm, range, test_age_gfn);
 }
 
-static bool set_spte_gfn(struct kvm *kvm, struct tdp_iter *iter,
-			 struct kvm_gfn_range *range)
-{
-	u64 new_spte;
-
-	/* Huge pages aren't expected to be modified without first being zapped. */
-	WARN_ON_ONCE(pte_huge(range->arg.pte) || range->start + 1 != range->end);
-
-	if (iter->level != PG_LEVEL_4K ||
-	    !is_shadow_present_pte(iter->old_spte))
-		return false;
-
-	/*
-	 * Note, when changing a read-only SPTE, it's not strictly necessary to
-	 * zero the SPTE before setting the new PFN, but doing so preserves the
-	 * invariant that the PFN of a present * leaf SPTE can never change.
-	 * See handle_changed_spte().
-	 */
-	tdp_mmu_iter_set_spte(kvm, iter, SHADOW_NONPRESENT_VALUE);
-
-	if (!pte_write(range->arg.pte)) {
-		new_spte = kvm_mmu_changed_pte_notifier_make_spte(iter->old_spte,
-								  pte_pfn(range->arg.pte));
-
-		tdp_mmu_iter_set_spte(kvm, iter, new_spte);
-	}
-
-	return true;
-}
-
-/*
- * Handle the changed_pte MMU notifier for the TDP MMU.
- * data is a pointer to the new pte_t mapping the HVA specified by the MMU
- * notifier.
- * Returns non-zero if a flush is needed before releasing the MMU lock.
- */
-bool kvm_tdp_mmu_set_spte_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
-{
-	/*
-	 * No need to handle the remote TLB flush under RCU protection, the
-	 * target SPTE _must_ be a leaf SPTE, i.e. cannot result in freeing a
-	 * shadow page. See the WARN on pfn_changed in handle_changed_spte().
-	 */
-	return kvm_tdp_mmu_handle_gfn(kvm, range, set_spte_gfn);
-}
-
 /*
  * Remove write access from all SPTEs at or above min_level that map GFNs
  * [start, end). Returns true if an SPTE has been changed and the TLBs need to
diff --git a/arch/x86/kvm/mmu/tdp_mmu.h b/arch/x86/kvm/mmu/tdp_mmu.h
index 6e1ea04ca885..58b55e61bd33 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.h
+++ b/arch/x86/kvm/mmu/tdp_mmu.h
@@ -31,7 +31,6 @@ bool kvm_tdp_mmu_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range,
 				 bool flush);
 bool kvm_tdp_mmu_age_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range);
 bool kvm_tdp_mmu_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range);
-bool kvm_tdp_mmu_set_spte_gfn(struct kvm *kvm, struct kvm_gfn_range *range);
 
 bool kvm_tdp_mmu_wrprot_slot(struct kvm *kvm,
 			     const struct kvm_memory_slot *slot, int min_level);
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index ab439706ea2f..8dea11701ab2 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -259,7 +259,6 @@ int kvm_async_pf_wakeup_all(struct kvm_vcpu *vcpu);
 
 #ifdef CONFIG_KVM_GENERIC_MMU_NOTIFIER
 union kvm_mmu_notifier_arg {
-	pte_t pte;
 	unsigned long attributes;
 };
 
@@ -273,7 +272,6 @@ struct kvm_gfn_range {
 bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range);
 bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range);
 bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range);
-bool kvm_set_spte_gfn(struct kvm *kvm, struct kvm_gfn_range *range);
 #endif
 
 enum {
diff --git a/include/trace/events/kvm.h b/include/trace/events/kvm.h
index 011fba6b5552..74e40d5d4af4 100644
--- a/include/trace/events/kvm.h
+++ b/include/trace/events/kvm.h
@@ -456,21 +456,6 @@ TRACE_EVENT(kvm_unmap_hva_range,
 		  __entry->start, __entry->end)
 );
 
-TRACE_EVENT(kvm_set_spte_hva,
-	TP_PROTO(unsigned long hva),
-	TP_ARGS(hva),
-
-	TP_STRUCT__entry(
-		__field(	unsigned long,	hva		)
-	),
-
-	TP_fast_assign(
-		__entry->hva		= hva;
-	),
-
-	TP_printk("mmu notifier set pte hva: %#016lx", __entry->hva)
-);
-
 TRACE_EVENT(kvm_age_hva,
 	TP_PROTO(unsigned long start, unsigned long end),
 	TP_ARGS(start, end),
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 4eb8afd0b961..2fcd9979752a 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -717,48 +717,6 @@ static __always_inline int kvm_handle_hva_range_no_flush(struct mmu_notifier *mn
 	return __kvm_handle_hva_range(kvm, &range).ret;
 }
 
-static bool kvm_change_spte_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
-{
-	/*
-	 * Skipping invalid memslots is correct if and only change_pte() is
-	 * surrounded by invalidate_range_{start,end}(), which is currently
-	 * guaranteed by the primary MMU.  If that ever changes, KVM needs to
-	 * unmap the memslot instead of skipping the memslot to ensure that KVM
-	 * doesn't hold references to the old PFN.
-	 */
-	WARN_ON_ONCE(!READ_ONCE(kvm->mn_active_invalidate_count));
-
-	if (range->slot->flags & KVM_MEMSLOT_INVALID)
-		return false;
-
-	return kvm_set_spte_gfn(kvm, range);
-}
-
-static void kvm_mmu_notifier_change_pte(struct mmu_notifier *mn,
-					struct mm_struct *mm,
-					unsigned long address,
-					pte_t pte)
-{
-	struct kvm *kvm = mmu_notifier_to_kvm(mn);
-	const union kvm_mmu_notifier_arg arg = { .pte = pte };
-
-	trace_kvm_set_spte_hva(address);
-
-	/*
-	 * .change_pte() must be surrounded by .invalidate_range_{start,end}().
-	 * If mmu_invalidate_in_progress is zero, then no in-progress
-	 * invalidations, including this one, found a relevant memslot at
-	 * start(); rechecking memslots here is unnecessary.  Note, a false
-	 * positive (count elevated by a different invalidation) is sub-optimal
-	 * but functionally ok.
-	 */
-	WARN_ON_ONCE(!READ_ONCE(kvm->mn_active_invalidate_count));
-	if (!READ_ONCE(kvm->mmu_invalidate_in_progress))
-		return;
-
-	kvm_handle_hva_range(mn, address, address + 1, arg, kvm_change_spte_gfn);
-}
-
 void kvm_mmu_invalidate_begin(struct kvm *kvm)
 {
 	lockdep_assert_held_write(&kvm->mmu_lock);
@@ -976,7 +934,6 @@ static const struct mmu_notifier_ops kvm_mmu_notifier_ops = {
 	.clear_flush_young	= kvm_mmu_notifier_clear_flush_young,
 	.clear_young		= kvm_mmu_notifier_clear_young,
 	.test_young		= kvm_mmu_notifier_test_young,
-	.change_pte		= kvm_mmu_notifier_change_pte,
 	.release		= kvm_mmu_notifier_release,
 };
 
-- 
2.43.0



