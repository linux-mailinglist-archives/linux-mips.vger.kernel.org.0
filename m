Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F22FE444C54
	for <lists+linux-mips@lfdr.de>; Thu,  4 Nov 2021 01:27:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232993AbhKDAaS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Nov 2021 20:30:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233470AbhKDA3V (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 3 Nov 2021 20:29:21 -0400
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C688C061714
        for <linux-mips@vger.kernel.org>; Wed,  3 Nov 2021 17:26:44 -0700 (PDT)
Received: by mail-pf1-x44a.google.com with SMTP id s4-20020a627704000000b00481101730b1so2339758pfc.11
        for <linux-mips@vger.kernel.org>; Wed, 03 Nov 2021 17:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=10Pf0PbobwONbtcQvL3ozkQdooLcZ25+8uhX4og5XZs=;
        b=nIE9zwGQlDNmQLPFY2/IIyWpp69SWo8IBfZAf5ZLRyVYgd0eRPspMC8mEFAuWxBcP/
         ww25lbFnhVyo2NV3dknKW+4BUspKpmTbPdPbX+X5ryRy6Fwn+TIkewCw0iG9imI0nqhX
         YoKOGQySXPDRWm4AR9iRGkvjomXFFlVsosiw5NoPPNo8fdfVmIeRPeMEqQRGR2n8OXNE
         ZjhxoxAjOMNp593MarEd4TMxUBC/ddL5hG/H7s25pmXTeyld2vCqxKzEy1+gyvvPB3rl
         lnB3LNdf+gyK9VZNlsaYvzTG+s15R4sn26secuyaWrxR8XpIwOLJ5bKhaBazXFF4U6uw
         u02w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=10Pf0PbobwONbtcQvL3ozkQdooLcZ25+8uhX4og5XZs=;
        b=rm7+RUATk2PL2vs/xjadGhKbiyLvwKKf9FMQFRWCRAztxITRDs0mCZECKfW+aT67xj
         /zRdf5EiMnYcGRFP1Sk1UvDiWQUUbmmMX9Zix3zDNQeQDSUQrFlnqXQFuN+fYG8gsUw/
         qL4kx0LnjoHgeegsg+IvjTfsjOF8Q7sIdEHktId2vfVdeLdPm8dS0cmgmU9ek9MaJ5qT
         iEfJ0SKiginQdpASUtU4jKwK+tiOd4k2Z4HM8syPxdan9sUS6uNewYFg6l4W6WZViNW1
         WyGsHj5fagxf8U9wUMhJBhbaltAsiVKRWPdz0vQ4Bkx6CEMutCkkCxlzbuMarj8qDZKx
         EZJQ==
X-Gm-Message-State: AOAM532AHFDPJqCaCTW4lTyCQDCCv7iKtcb+LNRgHSC9a21M+JFVirkc
        k4547u2hRdTOtCdf3+3kIXExSJWIbUk=
X-Google-Smtp-Source: ABdhPJwaaTASDdWDih033Wq9u1s1/TONGBy7iVSj07hV4xh3eVD2ob2PadhjKf7zJC81629udQnVD1mB2jQ=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a17:90a:c3:: with SMTP id
 v3mr252486pjd.0.1635985603238; Wed, 03 Nov 2021 17:26:43 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date:   Thu,  4 Nov 2021 00:25:27 +0000
In-Reply-To: <20211104002531.1176691-1-seanjc@google.com>
Message-Id: <20211104002531.1176691-27-seanjc@google.com>
Mime-Version: 1.0
References: <20211104002531.1176691-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v5.5 26/30] KVM: Keep memslots in tree-based structures
 instead of array-based ones
From:   Sean Christopherson <seanjc@google.com>
To:     Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Paul Mackerras <paulus@ozlabs.org>,
        Anup Patel <anup.patel@wdc.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Cc:     James Morse <james.morse@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Atish Patra <atish.patra@wdc.com>,
        David Hildenbrand <david@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Sean Christopherson <seanjc@google.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        linux-mips@vger.kernel.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        Ben Gardon <bgardon@google.com>,
        "Maciej S . Szmigiero" <maciej.szmigiero@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>

The current memslot code uses a (reverse gfn-ordered) memslot array for
keeping track of them.

Because the memslot array that is currently in use cannot be modified
every memslot management operation (create, delete, move, change flags)
has to make a copy of the whole array so it has a scratch copy to work on.

Strictly speaking, however, it is only necessary to make copy of the
memslot that is being modified, copying all the memslots currently present
is just a limitation of the array-based memslot implementation.

Two memslot sets, however, are still needed so the VM continues to run
on the currently active set while the requested operation is being
performed on the second, currently inactive one.

In order to have two memslot sets, but only one copy of actual memslots
it is necessary to split out the memslot data from the memslot sets.

The memslots themselves should be also kept independent of each other
so they can be individually added or deleted.

These two memslot sets should normally point to the same set of
memslots. They can, however, be desynchronized when performing a
memslot management operation by replacing the memslot to be modified
by its copy.  After the operation is complete, both memslot sets once
again point to the same, common set of memslot data.

This commit implements the aforementioned idea.

For tracking of gfns an ordinary rbtree is used since memslots cannot
overlap in the guest address space and so this data structure is
sufficient for ensuring that lookups are done quickly.

The "last used slot" mini-caches (both per-slot set one and per-vCPU one),
that keep track of the last found-by-gfn memslot, are still present in the
new code.

Signed-off-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/mmu.c                |   8 +-
 arch/powerpc/kvm/book3s_64_mmu_hv.c |   4 +-
 arch/powerpc/kvm/book3s_hv.c        |   3 +-
 arch/powerpc/kvm/book3s_hv_nested.c |   4 +-
 arch/powerpc/kvm/book3s_hv_uvmem.c  |  14 +-
 arch/s390/kvm/kvm-s390.c            |  24 +-
 arch/s390/kvm/kvm-s390.h            |   6 +-
 arch/x86/kvm/debugfs.c              |   6 +-
 arch/x86/kvm/mmu/mmu.c              |   8 +-
 include/linux/kvm_host.h            | 141 +++--
 virt/kvm/kvm_main.c                 | 809 ++++++++++++++--------------
 11 files changed, 524 insertions(+), 503 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index a76718388cbd..c27f472b4d24 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -210,13 +210,13 @@ static void stage2_flush_vm(struct kvm *kvm)
 {
 	struct kvm_memslots *slots;
 	struct kvm_memory_slot *memslot;
-	int idx;
+	int idx, bkt;
 
 	idx = srcu_read_lock(&kvm->srcu);
 	spin_lock(&kvm->mmu_lock);
 
 	slots = kvm_memslots(kvm);
-	kvm_for_each_memslot(memslot, slots)
+	kvm_for_each_memslot(memslot, bkt, slots)
 		stage2_flush_memslot(kvm, memslot);
 
 	spin_unlock(&kvm->mmu_lock);
@@ -595,14 +595,14 @@ void stage2_unmap_vm(struct kvm *kvm)
 {
 	struct kvm_memslots *slots;
 	struct kvm_memory_slot *memslot;
-	int idx;
+	int idx, bkt;
 
 	idx = srcu_read_lock(&kvm->srcu);
 	mmap_read_lock(current->mm);
 	spin_lock(&kvm->mmu_lock);
 
 	slots = kvm_memslots(kvm);
-	kvm_for_each_memslot(memslot, slots)
+	kvm_for_each_memslot(memslot, bkt, slots)
 		stage2_unmap_memslot(kvm, memslot);
 
 	spin_unlock(&kvm->mmu_lock);
diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
index c63e263312a4..213232914367 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
@@ -734,11 +734,11 @@ void kvmppc_rmap_reset(struct kvm *kvm)
 {
 	struct kvm_memslots *slots;
 	struct kvm_memory_slot *memslot;
-	int srcu_idx;
+	int srcu_idx, bkt;
 
 	srcu_idx = srcu_read_lock(&kvm->srcu);
 	slots = kvm_memslots(kvm);
-	kvm_for_each_memslot(memslot, slots) {
+	kvm_for_each_memslot(memslot, bkt, slots) {
 		/* Mutual exclusion with kvm_unmap_hva_range etc. */
 		spin_lock(&kvm->mmu_lock);
 		/*
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 4d40c1867be5..2a97363c9a31 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -5854,11 +5854,12 @@ static int kvmhv_svm_off(struct kvm *kvm)
 	for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
 		struct kvm_memory_slot *memslot;
 		struct kvm_memslots *slots = __kvm_memslots(kvm, i);
+		int bkt;
 
 		if (!slots)
 			continue;
 
-		kvm_for_each_memslot(memslot, slots) {
+		kvm_for_each_memslot(memslot, bkt, slots) {
 			kvmppc_uvmem_drop_pages(memslot, kvm, true);
 			uv_unregister_mem_slot(kvm->arch.lpid, memslot->id);
 		}
diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index ed8a2c9f5629..9435e482d514 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -749,7 +749,7 @@ void kvmhv_release_all_nested(struct kvm *kvm)
 	struct kvm_nested_guest *gp;
 	struct kvm_nested_guest *freelist = NULL;
 	struct kvm_memory_slot *memslot;
-	int srcu_idx;
+	int srcu_idx, bkt;
 
 	spin_lock(&kvm->mmu_lock);
 	for (i = 0; i <= kvm->arch.max_nested_lpid; i++) {
@@ -770,7 +770,7 @@ void kvmhv_release_all_nested(struct kvm *kvm)
 	}
 
 	srcu_idx = srcu_read_lock(&kvm->srcu);
-	kvm_for_each_memslot(memslot, kvm_memslots(kvm))
+	kvm_for_each_memslot(memslot, bkt, kvm_memslots(kvm))
 		kvmhv_free_memslot_nest_rmap(memslot);
 	srcu_read_unlock(&kvm->srcu, srcu_idx);
 }
diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index a7061ee3b157..adc1c495d47c 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -459,7 +459,7 @@ unsigned long kvmppc_h_svm_init_start(struct kvm *kvm)
 	struct kvm_memslots *slots;
 	struct kvm_memory_slot *memslot, *m;
 	int ret = H_SUCCESS;
-	int srcu_idx;
+	int srcu_idx, bkt;
 
 	kvm->arch.secure_guest = KVMPPC_SECURE_INIT_START;
 
@@ -478,7 +478,7 @@ unsigned long kvmppc_h_svm_init_start(struct kvm *kvm)
 
 	/* register the memslot */
 	slots = kvm_memslots(kvm);
-	kvm_for_each_memslot(memslot, slots) {
+	kvm_for_each_memslot(memslot, bkt, slots) {
 		ret = __kvmppc_uvmem_memslot_create(kvm, memslot);
 		if (ret)
 			break;
@@ -486,7 +486,7 @@ unsigned long kvmppc_h_svm_init_start(struct kvm *kvm)
 
 	if (ret) {
 		slots = kvm_memslots(kvm);
-		kvm_for_each_memslot(m, slots) {
+		kvm_for_each_memslot(m, bkt, slots) {
 			if (m == memslot)
 				break;
 			__kvmppc_uvmem_memslot_delete(kvm, memslot);
@@ -647,7 +647,7 @@ void kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *slot,
 
 unsigned long kvmppc_h_svm_init_abort(struct kvm *kvm)
 {
-	int srcu_idx;
+	int srcu_idx, bkt;
 	struct kvm_memory_slot *memslot;
 
 	/*
@@ -662,7 +662,7 @@ unsigned long kvmppc_h_svm_init_abort(struct kvm *kvm)
 
 	srcu_idx = srcu_read_lock(&kvm->srcu);
 
-	kvm_for_each_memslot(memslot, kvm_memslots(kvm))
+	kvm_for_each_memslot(memslot, bkt, kvm_memslots(kvm))
 		kvmppc_uvmem_drop_pages(memslot, kvm, false);
 
 	srcu_read_unlock(&kvm->srcu, srcu_idx);
@@ -821,7 +821,7 @@ unsigned long kvmppc_h_svm_init_done(struct kvm *kvm)
 {
 	struct kvm_memslots *slots;
 	struct kvm_memory_slot *memslot;
-	int srcu_idx;
+	int srcu_idx, bkt;
 	long ret = H_SUCCESS;
 
 	if (!(kvm->arch.secure_guest & KVMPPC_SECURE_INIT_START))
@@ -830,7 +830,7 @@ unsigned long kvmppc_h_svm_init_done(struct kvm *kvm)
 	/* migrate any unmoved normal pfn to device pfns*/
 	srcu_idx = srcu_read_lock(&kvm->srcu);
 	slots = kvm_memslots(kvm);
-	kvm_for_each_memslot(memslot, slots) {
+	kvm_for_each_memslot(memslot, bkt, slots) {
 		ret = kvmppc_uv_migrate_mem_slot(kvm, memslot);
 		if (ret) {
 			/*
diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index f7cc0853866b..f2c12456a047 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -1035,13 +1035,13 @@ static int kvm_s390_vm_start_migration(struct kvm *kvm)
 	struct kvm_memory_slot *ms;
 	struct kvm_memslots *slots;
 	unsigned long ram_pages = 0;
-	int slotnr;
+	int bkt;
 
 	/* migration mode already enabled */
 	if (kvm->arch.migration_mode)
 		return 0;
 	slots = kvm_memslots(kvm);
-	if (!slots || !slots->used_slots)
+	if (!slots || kvm_memslots_empty(slots))
 		return -EINVAL;
 
 	if (!kvm->arch.use_cmma) {
@@ -1049,8 +1049,7 @@ static int kvm_s390_vm_start_migration(struct kvm *kvm)
 		return 0;
 	}
 	/* mark all the pages in active slots as dirty */
-	for (slotnr = 0; slotnr < slots->used_slots; slotnr++) {
-		ms = slots->memslots + slotnr;
+	kvm_for_each_memslot(ms, bkt, slots) {
 		if (!ms->dirty_bitmap)
 			return -EINVAL;
 		/*
@@ -1974,22 +1973,21 @@ static unsigned long kvm_s390_next_dirty_cmma(struct kvm_memslots *slots,
 					      unsigned long cur_gfn)
 {
 	struct kvm_memory_slot *ms = gfn_to_memslot_approx(slots, cur_gfn);
-	int slotidx = ms - slots->memslots;
 	unsigned long ofs = cur_gfn - ms->base_gfn;
+	struct rb_node *mnode = &ms->gfn_node[slots->node_idx];
 
 	if (ms->base_gfn + ms->npages <= cur_gfn) {
-		slotidx--;
+		mnode = rb_next(mnode);
 		/* If we are above the highest slot, wrap around */
-		if (slotidx < 0)
-			slotidx = slots->used_slots - 1;
+		if (!mnode)
+			mnode = rb_first(&slots->gfn_tree);
 
-		ms = slots->memslots + slotidx;
+		ms = container_of(mnode, struct kvm_memory_slot, gfn_node[slots->node_idx]);
 		ofs = 0;
 	}
 	ofs = find_next_bit(kvm_second_dirty_bitmap(ms), ms->npages, ofs);
-	while ((slotidx > 0) && (ofs >= ms->npages)) {
-		slotidx--;
-		ms = slots->memslots + slotidx;
+	while (ofs >= ms->npages && (mnode = rb_next(mnode))) {
+		ms = container_of(mnode, struct kvm_memory_slot, gfn_node[slots->node_idx]);
 		ofs = find_next_bit(kvm_second_dirty_bitmap(ms), ms->npages, 0);
 	}
 	return ms->base_gfn + ofs;
@@ -2002,7 +2000,7 @@ static int kvm_s390_get_cmma(struct kvm *kvm, struct kvm_s390_cmma_log *args,
 	struct kvm_memslots *slots = kvm_memslots(kvm);
 	struct kvm_memory_slot *ms;
 
-	if (unlikely(!slots->used_slots))
+	if (unlikely(kvm_memslots_empty(slots)))
 		return 0;
 
 	cur_gfn = kvm_s390_next_dirty_cmma(slots, args->start_gfn);
diff --git a/arch/s390/kvm/kvm-s390.h b/arch/s390/kvm/kvm-s390.h
index 207d299d7fea..a8769c1b5cec 100644
--- a/arch/s390/kvm/kvm-s390.h
+++ b/arch/s390/kvm/kvm-s390.h
@@ -211,12 +211,14 @@ static inline int kvm_s390_user_cpu_state_ctrl(struct kvm *kvm)
 /* get the end gfn of the last (highest gfn) memslot */
 static inline unsigned long kvm_s390_get_gfn_end(struct kvm_memslots *slots)
 {
+	struct rb_node *node;
 	struct kvm_memory_slot *ms;
 
-	if (WARN_ON(!slots->used_slots))
+	if (WARN_ON(kvm_memslots_empty(slots)))
 		return 0;
 
-	ms = slots->memslots;
+	node = rb_last(&slots->gfn_tree);
+	ms = container_of(node, struct kvm_memory_slot, gfn_node[slots->node_idx]);
 	return ms->base_gfn + ms->npages;
 }
 
diff --git a/arch/x86/kvm/debugfs.c b/arch/x86/kvm/debugfs.c
index 54a83a744538..543a8c04025c 100644
--- a/arch/x86/kvm/debugfs.c
+++ b/arch/x86/kvm/debugfs.c
@@ -107,9 +107,10 @@ static int kvm_mmu_rmaps_stat_show(struct seq_file *m, void *v)
 	write_lock(&kvm->mmu_lock);
 
 	for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
+		int bkt;
+
 		slots = __kvm_memslots(kvm, i);
-		for (j = 0; j < slots->used_slots; j++) {
-			slot = &slots->memslots[j];
+		kvm_for_each_memslot(slot, bkt, slots)
 			for (k = 0; k < KVM_NR_PAGE_SIZES; k++) {
 				rmap = slot->arch.rmap[k];
 				lpage_size = kvm_mmu_slot_lpages(slot, k + 1);
@@ -121,7 +122,6 @@ static int kvm_mmu_rmaps_stat_show(struct seq_file *m, void *v)
 					cur[index]++;
 				}
 			}
-		}
 	}
 
 	write_unlock(&kvm->mmu_lock);
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 564781585fd2..09ff0ccaa203 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -3405,7 +3405,7 @@ static int mmu_first_shadow_root_alloc(struct kvm *kvm)
 {
 	struct kvm_memslots *slots;
 	struct kvm_memory_slot *slot;
-	int r = 0, i;
+	int r = 0, i, bkt;
 
 	/*
 	 * Check if this is the first shadow root being allocated before
@@ -3430,7 +3430,7 @@ static int mmu_first_shadow_root_alloc(struct kvm *kvm)
 
 	for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
 		slots = __kvm_memslots(kvm, i);
-		kvm_for_each_memslot(slot, slots) {
+		kvm_for_each_memslot(slot, bkt, slots) {
 			/*
 			 * Both of these functions are no-ops if the target is
 			 * already allocated, so unconditionally calling both
@@ -5716,14 +5716,14 @@ static bool __kvm_zap_rmaps(struct kvm *kvm, gfn_t gfn_start, gfn_t gfn_end)
 	struct kvm_memslots *slots;
 	bool flush = false;
 	gfn_t start, end;
-	int i;
+	int i, bkt;
 
 	if (!kvm_memslots_have_rmaps(kvm))
 		return flush;
 
 	for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
 		slots = __kvm_memslots(kvm, i);
-		kvm_for_each_memslot(memslot, slots) {
+		kvm_for_each_memslot(memslot, bkt, slots) {
 			start = max(gfn_start, memslot->base_gfn);
 			end = min(gfn_end, memslot->base_gfn + memslot->npages);
 			if (start >= end)
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index d0363e2ba098..6888f3c2e04b 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -31,6 +31,7 @@
 #include <linux/notifier.h>
 #include <linux/hashtable.h>
 #include <linux/interval_tree.h>
+#include <linux/rbtree.h>
 #include <asm/signal.h>
 
 #include <linux/kvm.h>
@@ -357,11 +358,13 @@ struct kvm_vcpu {
 	struct kvm_dirty_ring dirty_ring;
 
 	/*
-	 * The index of the most recently used memslot by this vCPU. It's ok
-	 * if this becomes stale due to memslot changes since we always check
-	 * it is a valid slot.
+	 * The most recently used memslot by this vCPU and the slots generation
+	 * for which it is valid.
+	 * No wraparound protection is needed since generations won't overflow in
+	 * thousands of years, even assuming 1M memslot operations per second.
 	 */
-	int last_used_slot;
+	struct kvm_memory_slot *last_used_slot;
+	u64 last_used_slot_gen;
 };
 
 /* must be called with irqs disabled */
@@ -426,9 +429,26 @@ static inline int kvm_vcpu_exiting_guest_mode(struct kvm_vcpu *vcpu)
  */
 #define KVM_MEM_MAX_NR_PAGES ((1UL << 31) - 1)
 
+/*
+ * Since at idle each memslot belongs to two memslot sets it has to contain
+ * two embedded nodes for each data structure that it forms a part of.
+ *
+ * Two memslot sets (one active and one inactive) are necessary so the VM
+ * continues to run on one memslot set while the other is being modified.
+ *
+ * These two memslot sets normally point to the same set of memslots.
+ * They can, however, be desynchronized when performing a memslot management
+ * operation by replacing the memslot to be modified by its copy.
+ * After the operation is complete, both memslot sets once again point to
+ * the same, common set of memslot data.
+ *
+ * The memslots themselves are independent of each other so they can be
+ * individually added or deleted.
+ */
 struct kvm_memory_slot {
-	struct hlist_node id_node;
-	struct interval_tree_node hva_node;
+	struct hlist_node id_node[2];
+	struct interval_tree_node hva_node[2];
+	struct rb_node gfn_node[2];
 	gfn_t base_gfn;
 	unsigned long npages;
 	unsigned long *dirty_bitmap;
@@ -523,19 +543,14 @@ static inline int kvm_arch_vcpu_memslots_id(struct kvm_vcpu *vcpu)
 }
 #endif
 
-/*
- * Note:
- * memslots are not sorted by id anymore, please use id_to_memslot()
- * to get the memslot by its id.
- */
 struct kvm_memslots {
 	u64 generation;
+	atomic_long_t last_used_slot;
 	struct rb_root_cached hva_tree;
-	/* The mapping table from slot id to the index in memslots[]. */
+	struct rb_root gfn_tree;
+	/* The mapping table from slot id to memslot. */
 	DECLARE_HASHTABLE(id_hash, 7);
-	atomic_t last_used_slot;
-	int used_slots;
-	struct kvm_memory_slot memslots[];
+	int node_idx;
 };
 
 struct kvm {
@@ -557,6 +572,9 @@ struct kvm {
 	struct mutex slots_arch_lock;
 	struct mm_struct *mm; /* userspace tied to this vm */
 	unsigned long nr_memslot_pages;
+	/* The two memslot sets - active and inactive (per address space) */
+	struct kvm_memslots __memslots[KVM_ADDRESS_SPACE_NUM][2];
+	/* The current active memslot set for each address space */
 	struct kvm_memslots __rcu *memslots[KVM_ADDRESS_SPACE_NUM];
 	struct kvm_vcpu *vcpus[KVM_MAX_VCPUS];
 
@@ -725,11 +743,10 @@ static inline struct kvm_vcpu *kvm_get_vcpu_by_id(struct kvm *kvm, int id)
 	return NULL;
 }
 
-#define kvm_for_each_memslot(memslot, slots)				\
-	for (memslot = &slots->memslots[0];				\
-	     memslot < slots->memslots + slots->used_slots; memslot++)	\
-		if (WARN_ON_ONCE(!memslot->npages)) {			\
-		} else
+static inline int kvm_vcpu_get_idx(struct kvm_vcpu *vcpu)
+{
+	return vcpu->vcpu_idx;
+}
 
 void kvm_vcpu_destroy(struct kvm_vcpu *vcpu);
 
@@ -791,12 +808,23 @@ static inline struct kvm_memslots *kvm_vcpu_memslots(struct kvm_vcpu *vcpu)
 	return __kvm_memslots(vcpu->kvm, as_id);
 }
 
+static inline bool kvm_memslots_empty(struct kvm_memslots *slots)
+{
+	return RB_EMPTY_ROOT(&slots->gfn_tree);
+}
+
+#define kvm_for_each_memslot(memslot, bkt, slots)			      \
+	hash_for_each(slots->id_hash, bkt, memslot, id_node[slots->node_idx]) \
+		if (WARN_ON_ONCE(!memslot->npages)) {			      \
+		} else
+
 static inline
 struct kvm_memory_slot *id_to_memslot(struct kvm_memslots *slots, int id)
 {
 	struct kvm_memory_slot *slot;
+	int idx = slots->node_idx;
 
-	hash_for_each_possible(slots->id_hash, slot, id_node, id) {
+	hash_for_each_possible(slots->id_hash, slot, id_node[idx], id) {
 		if (slot->id == id)
 			return slot;
 	}
@@ -1204,25 +1232,15 @@ void kvm_free_irq_source_id(struct kvm *kvm, int irq_source_id);
 bool kvm_arch_irqfd_allowed(struct kvm *kvm, struct kvm_irqfd *args);
 
 /*
- * Returns a pointer to the memslot at slot_index if it contains gfn.
+ * Returns a pointer to the memslot if it contains gfn.
  * Otherwise returns NULL.
  */
 static inline struct kvm_memory_slot *
-try_get_memslot(struct kvm_memslots *slots, int slot_index, gfn_t gfn)
+try_get_memslot(struct kvm_memory_slot *slot, gfn_t gfn)
 {
-	struct kvm_memory_slot *slot;
-
-	if (slot_index < 0 || slot_index >= slots->used_slots)
+	if (!slot)
 		return NULL;
 
-	/*
-	 * slot_index can come from vcpu->last_used_slot which is not kept
-	 * in sync with userspace-controllable memslot deletion. So use nospec
-	 * to prevent the CPU from speculating past the end of memslots[].
-	 */
-	slot_index = array_index_nospec(slot_index, slots->used_slots);
-	slot = &slots->memslots[slot_index];
-
 	if (gfn >= slot->base_gfn && gfn < slot->base_gfn + slot->npages)
 		return slot;
 	else
@@ -1230,65 +1248,46 @@ try_get_memslot(struct kvm_memslots *slots, int slot_index, gfn_t gfn)
 }
 
 /*
- * Returns a pointer to the memslot that contains gfn and records the index of
- * the slot in index. Otherwise returns NULL.
+ * Returns a pointer to the memslot that contains gfn. Otherwise returns NULL.
  *
  * With "approx" set returns the memslot also when the address falls
  * in a hole. In that case one of the memslots bordering the hole is
  * returned.
- *
- * IMPORTANT: Slots are sorted from highest GFN to lowest GFN!
  */
 static inline struct kvm_memory_slot *
-search_memslots(struct kvm_memslots *slots, gfn_t gfn, int *index, bool approx)
+search_memslots(struct kvm_memslots *slots, gfn_t gfn, bool approx)
 {
-	int start = 0, end = slots->used_slots;
-	struct kvm_memory_slot *memslots = slots->memslots;
 	struct kvm_memory_slot *slot;
+	struct rb_node *node;
+	int idx = slots->node_idx;
 
-	if (unlikely(!slots->used_slots))
-		return NULL;
-
-	while (start < end) {
-		int slot = start + (end - start) / 2;
-
-		if (gfn >= memslots[slot].base_gfn)
-			end = slot;
-		else
-			start = slot + 1;
-	}
-
-	if (approx && start >= slots->used_slots) {
-		*index = slots->used_slots - 1;
-		return &memslots[slots->used_slots - 1];
-	}
-
-	slot = try_get_memslot(slots, start, gfn);
-	if (slot) {
-		*index = start;
-		return slot;
-	}
-	if (approx) {
-		*index = start;
-		return &memslots[start];
+	slot = NULL;
+	for (node = slots->gfn_tree.rb_node; node; ) {
+		slot = container_of(node, struct kvm_memory_slot, gfn_node[idx]);
+		if (gfn >= slot->base_gfn) {
+			if (gfn < slot->base_gfn + slot->npages)
+				return slot;
+			node = node->rb_right;
+		} else
+			node = node->rb_left;
 	}
 
-	return NULL;
+	return approx ? slot : NULL;
 }
 
 static inline struct kvm_memory_slot *
 ____gfn_to_memslot(struct kvm_memslots *slots, gfn_t gfn, bool approx)
 {
 	struct kvm_memory_slot *slot;
-	int slot_index = atomic_read(&slots->last_used_slot);
 
-	slot = try_get_memslot(slots, slot_index, gfn);
+	slot = (struct kvm_memory_slot *)atomic_long_read(&slots->last_used_slot);
+	slot = try_get_memslot(slot, gfn);
 	if (slot)
 		return slot;
 
-	slot = search_memslots(slots, gfn, &slot_index, approx);
+	slot = search_memslots(slots, gfn, approx);
 	if (slot) {
-		atomic_set(&slots->last_used_slot, slot_index);
+		atomic_long_set(&slots->last_used_slot, (unsigned long)slot);
 		return slot;
 	}
 
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index f2235c430e64..d095e01838bf 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -432,7 +432,7 @@ static void kvm_vcpu_init(struct kvm_vcpu *vcpu, struct kvm *kvm, unsigned id)
 	vcpu->preempted = false;
 	vcpu->ready = false;
 	preempt_notifier_init(&vcpu->preempt_notifier, &kvm_preempt_ops);
-	vcpu->last_used_slot = 0;
+	vcpu->last_used_slot = NULL;
 }
 
 void kvm_vcpu_destroy(struct kvm_vcpu *vcpu)
@@ -531,7 +531,7 @@ static __always_inline int __kvm_handle_hva_range(struct kvm *kvm,
 						  range->start, range->end - 1) {
 			unsigned long hva_start, hva_end;
 
-			slot = container_of(node, struct kvm_memory_slot, hva_node);
+			slot = container_of(node, struct kvm_memory_slot, hva_node[slots->node_idx]);
 			hva_start = max(range->start, slot->userspace_addr);
 			hva_end = min(range->end, slot->userspace_addr +
 						  (slot->npages << PAGE_SHIFT));
@@ -862,20 +862,6 @@ static void kvm_destroy_pm_notifier(struct kvm *kvm)
 }
 #endif /* CONFIG_HAVE_KVM_PM_NOTIFIER */
 
-static struct kvm_memslots *kvm_alloc_memslots(void)
-{
-	struct kvm_memslots *slots;
-
-	slots = kvzalloc(sizeof(struct kvm_memslots), GFP_KERNEL_ACCOUNT);
-	if (!slots)
-		return NULL;
-
-	slots->hva_tree = RB_ROOT_CACHED;
-	hash_init(slots->id_hash);
-
-	return slots;
-}
-
 static void kvm_destroy_dirty_bitmap(struct kvm_memory_slot *memslot)
 {
 	if (!memslot->dirty_bitmap)
@@ -885,27 +871,33 @@ static void kvm_destroy_dirty_bitmap(struct kvm_memory_slot *memslot)
 	memslot->dirty_bitmap = NULL;
 }
 
+/* This does not remove the slot from struct kvm_memslots data structures */
 static void kvm_free_memslot(struct kvm *kvm, struct kvm_memory_slot *slot)
 {
 	kvm_destroy_dirty_bitmap(slot);
 
 	kvm_arch_free_memslot(kvm, slot);
 
-	slot->flags = 0;
-	slot->npages = 0;
+	kfree(slot);
 }
 
 static void kvm_free_memslots(struct kvm *kvm, struct kvm_memslots *slots)
 {
+	struct hlist_node *idnode;
 	struct kvm_memory_slot *memslot;
+	int bkt;
 
-	if (!slots)
+	/*
+	 * The same memslot objects live in both active and inactive sets,
+	 * arbitrarily free using index '1' so the second invocation of this
+	 * function isn't operating over a structure with dangling pointers
+	 * (even though this function isn't actually touching them).
+	 */
+	if (!slots->node_idx)
 		return;
 
-	kvm_for_each_memslot(memslot, slots)
+	hash_for_each_safe(slots->id_hash, bkt, idnode, memslot, id_node[1])
 		kvm_free_memslot(kvm, memslot);
-
-	kvfree(slots);
 }
 
 static umode_t kvm_stats_debugfs_mode(const struct _kvm_stats_desc *pdesc)
@@ -1044,8 +1036,9 @@ int __weak kvm_arch_create_vm_debugfs(struct kvm *kvm)
 static struct kvm *kvm_create_vm(unsigned long type)
 {
 	struct kvm *kvm = kvm_arch_alloc_vm();
+	struct kvm_memslots *slots;
 	int r = -ENOMEM;
-	int i;
+	int i, j;
 
 	if (!kvm)
 		return ERR_PTR(-ENOMEM);
@@ -1072,13 +1065,20 @@ static struct kvm *kvm_create_vm(unsigned long type)
 
 	refcount_set(&kvm->users_count, 1);
 	for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
-		struct kvm_memslots *slots = kvm_alloc_memslots();
+		for (j = 0; j < 2; j++) {
+			slots = &kvm->__memslots[i][j];
 
-		if (!slots)
-			goto out_err_no_arch_destroy_vm;
-		/* Generations must be different for each address space. */
-		slots->generation = i;
-		rcu_assign_pointer(kvm->memslots[i], slots);
+			atomic_long_set(&slots->last_used_slot, (unsigned long)NULL);
+			slots->hva_tree = RB_ROOT_CACHED;
+			slots->gfn_tree = RB_ROOT;
+			hash_init(slots->id_hash);
+			slots->node_idx = j;
+
+			/* Generations must be different for each address space. */
+			slots->generation = i;
+		}
+
+		rcu_assign_pointer(kvm->memslots[i], &kvm->__memslots[i][0]);
 	}
 
 	for (i = 0; i < KVM_NR_BUSES; i++) {
@@ -1132,8 +1132,6 @@ static struct kvm *kvm_create_vm(unsigned long type)
 	WARN_ON_ONCE(!refcount_dec_and_test(&kvm->users_count));
 	for (i = 0; i < KVM_NR_BUSES; i++)
 		kfree(kvm_get_bus(kvm, i));
-	for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++)
-		kvm_free_memslots(kvm, __kvm_memslots(kvm, i));
 	cleanup_srcu_struct(&kvm->irq_srcu);
 out_err_no_irq_srcu:
 	cleanup_srcu_struct(&kvm->srcu);
@@ -1198,8 +1196,10 @@ static void kvm_destroy_vm(struct kvm *kvm)
 #endif
 	kvm_arch_destroy_vm(kvm);
 	kvm_destroy_devices(kvm);
-	for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++)
-		kvm_free_memslots(kvm, __kvm_memslots(kvm, i));
+	for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
+		kvm_free_memslots(kvm, &kvm->__memslots[i][0]);
+		kvm_free_memslots(kvm, &kvm->__memslots[i][1]);
+	}
 	cleanup_srcu_struct(&kvm->irq_srcu);
 	cleanup_srcu_struct(&kvm->srcu);
 	kvm_arch_free_vm(kvm);
@@ -1269,231 +1269,136 @@ static int kvm_alloc_dirty_bitmap(struct kvm_memory_slot *memslot)
 	return 0;
 }
 
-static void kvm_replace_memslot(struct kvm_memslots *slots,
+static struct kvm_memslots *kvm_get_inactive_memslots(struct kvm *kvm, int as_id)
+{
+	struct kvm_memslots *active = __kvm_memslots(kvm, as_id);
+	int node_idx_inactive = active->node_idx ^ 1;
+
+	return &kvm->__memslots[as_id][node_idx_inactive];
+}
+
+/*
+ * Helper to get the address space ID when one of memslot pointers may be NULL.
+ * This also serves as a sanity that at least one of the pointers is non-NULL,
+ * and that their address space IDs don't diverge.
+ */
+static int kvm_memslots_get_as_id(struct kvm_memory_slot *a,
+				  struct kvm_memory_slot *b)
+{
+	if (WARN_ON_ONCE(!a && !b))
+		return 0;
+
+	if (!a)
+		return b->as_id;
+	if (!b)
+		return a->as_id;
+
+	WARN_ON_ONCE(a->as_id != b->as_id);
+	return a->as_id;
+}
+
+static void kvm_insert_gfn_node(struct kvm_memslots *slots,
+				struct kvm_memory_slot *slot)
+{
+	struct rb_root *gfn_tree = &slots->gfn_tree;
+	struct rb_node **node, *parent;
+	int idx = slots->node_idx;
+
+	parent = NULL;
+	for (node = &gfn_tree->rb_node; *node; ) {
+		struct kvm_memory_slot *tmp;
+
+		tmp = container_of(*node, struct kvm_memory_slot, gfn_node[idx]);
+		parent = *node;
+		if (slot->base_gfn < tmp->base_gfn)
+			node = &(*node)->rb_left;
+		else if (slot->base_gfn > tmp->base_gfn)
+			node = &(*node)->rb_right;
+		else
+			BUG();
+	}
+
+	rb_link_node(&slot->gfn_node[idx], parent, node);
+	rb_insert_color(&slot->gfn_node[idx], gfn_tree);
+}
+
+static void kvm_erase_gfn_node(struct kvm_memslots *slots,
+			       struct kvm_memory_slot *slot)
+{
+	rb_erase(&slot->gfn_node[slots->node_idx], &slots->gfn_tree);
+}
+
+static void kvm_replace_gfn_node(struct kvm_memslots *slots,
+				 struct kvm_memory_slot *old,
+				 struct kvm_memory_slot *new)
+{
+	int idx = slots->node_idx;
+
+	WARN_ON_ONCE(old->base_gfn != new->base_gfn);
+
+	rb_replace_node(&old->gfn_node[idx], &new->gfn_node[idx],
+			&slots->gfn_tree);
+}
+
+/*
+ * Replace @old with @new in the inactive memslots.
+ *
+ * With NULL @old this simply adds @new.
+ * With NULL @new this simply removes @old.
+ *
+ * If @new is non-NULL its hva_node[slots_idx] range has to be set
+ * appropriately.
+ */
+static void kvm_replace_memslot(struct kvm *kvm,
 				struct kvm_memory_slot *old,
 				struct kvm_memory_slot *new)
 {
-	/*
-	 * Remove the old memslot from the hash list and interval tree, copying
-	 * the node data would corrupt the structures.
-	 */
+	int as_id = kvm_memslots_get_as_id(old, new);
+	struct kvm_memslots *slots = kvm_get_inactive_memslots(kvm, as_id);
+	int idx = slots->node_idx;
+
 	if (old) {
-		hash_del(&old->id_node);
-		interval_tree_remove(&old->hva_node, &slots->hva_tree);
+		hash_del(&old->id_node[idx]);
+		interval_tree_remove(&old->hva_node[idx], &slots->hva_tree);
 
-		if (!new)
+		if ((long)old == atomic_long_read(&slots->last_used_slot))
+			atomic_long_set(&slots->last_used_slot, (long)new);
+
+		if (!new) {
+			kvm_erase_gfn_node(slots, old);
 			return;
+		}
 	}
 
 	/*
-	 * Copy the source *data*, not the pointer, to the destination.  If
-	 * @old is NULL, initialize @new's hva range.
+	 * Initialize @new's hva range.  Do this even when replacing an @old
+	 * slot, kvm_copy_memslot() deliberately does not touch node data.
 	 */
-	if (old) {
-		*new = *old;
-	} else if (new) {
-		new->hva_node.start = new->userspace_addr;
-		new->hva_node.last = new->userspace_addr +
-				     (new->npages << PAGE_SHIFT) - 1;
-	}
-
-	/* (Re)Add the new memslot. */
-	hash_add(slots->id_hash, &new->id_node, new->id);
-	interval_tree_insert(&new->hva_node, &slots->hva_tree);
-}
-
-static void kvm_shift_memslot(struct kvm_memslots *slots, int dst, int src)
-{
-	struct kvm_memory_slot *mslots = slots->memslots;
-
-	kvm_replace_memslot(slots, &mslots[src], &mslots[dst]);
-}
-
-/*
- * Delete a memslot by decrementing the number of used slots and shifting all
- * other entries in the array forward one spot.
- * @memslot is a detached dummy struct with just .id and .as_id filled.
- */
-static inline void kvm_memslot_delete(struct kvm_memslots *slots,
-				      struct kvm_memory_slot *memslot)
-{
-	struct kvm_memory_slot *mslots = slots->memslots;
-	struct kvm_memory_slot *oldslot = id_to_memslot(slots, memslot->id);
-	int i;
-
-	if (WARN_ON(!oldslot))
-		return;
-
-	slots->used_slots--;
-
-	if (atomic_read(&slots->last_used_slot) >= slots->used_slots)
-		atomic_set(&slots->last_used_slot, 0);
+	new->hva_node[idx].start = new->userspace_addr;
+	new->hva_node[idx].last = new->userspace_addr +
+				  (new->npages << PAGE_SHIFT) - 1;
 
 	/*
-	 * Remove the to-be-deleted memslot from the list/tree _before_ shifting
-	 * the trailing memslots forward, its data will be overwritten.
-	 * Defer the (somewhat pointless) copying of the memslot until after
-	 * the last slot has been shifted to avoid overwriting said last slot.
+	 * (Re)Add the new memslot.  There is no O(1) interval_tree_replace(),
+	 * hva_node needs to be swapped with remove+insert even though hva can't
+	 * change when replacing an existing slot.
 	 */
-	kvm_replace_memslot(slots, oldslot, NULL);
-
-	for (i = oldslot - mslots; i < slots->used_slots; i++)
-		kvm_shift_memslot(slots, i, i + 1);
-	mslots[i] = *memslot;
-}
-
-/*
- * "Insert" a new memslot by incrementing the number of used slots.  Returns
- * the new slot's initial index into the memslots array.
- */
-static inline int kvm_memslot_insert_back(struct kvm_memslots *slots)
-{
-	return slots->used_slots++;
-}
-
-/*
- * Move a changed memslot backwards in the array by shifting existing slots
- * with a higher GFN toward the front of the array.  Note, the changed memslot
- * itself is not preserved in the array, i.e. not swapped at this time, only
- * its new index into the array is tracked.  Returns the changed memslot's
- * current index into the memslots array.
- * The memslot at the returned index will not be in @slots->hva_tree or
- * @slots->id_hash by then.
- * @memslot is a detached struct with desired final data of the changed slot.
- */
-static inline int kvm_memslot_move_backward(struct kvm_memslots *slots,
-					    struct kvm_memory_slot *memslot)
-{
-	struct kvm_memory_slot *mslots = slots->memslots;
-	struct kvm_memory_slot *oldslot = id_to_memslot(slots, memslot->id);
-	int i;
-
-	if (!oldslot || !slots->used_slots)
-		return -1;
+	hash_add(slots->id_hash, &new->id_node[idx], new->id);
+	interval_tree_insert(&new->hva_node[idx], &slots->hva_tree);
 
 	/*
-	 * Delete the slot from the hash table and interval tree before sorting
-	 * the remaining slots, the slot's data may be overwritten when copying
-	 * slots as part of the sorting proccess.  update_memslots() will
-	 * unconditionally rewrite and re-add the entire slot.
+	 * If the memslot gfn is unchanged, rb_replace_node() can be used to
+	 * switch the node in the gfn tree instead of removing the old and
+	 * inserting the new as two separate operations. Replacement is a
+	 * single O(1) operation versus two O(log(n)) operations for
+	 * remove+insert.
 	 */
-	kvm_replace_memslot(slots, oldslot, NULL);
-
-	/*
-	 * Move the target memslot backward in the array by shifting existing
-	 * memslots with a higher GFN (than the target memslot) towards the
-	 * front of the array.
-	 */
-	for (i = oldslot - mslots; i < slots->used_slots - 1; i++) {
-		if (memslot->base_gfn > mslots[i + 1].base_gfn)
-			break;
-
-		WARN_ON_ONCE(memslot->base_gfn == mslots[i + 1].base_gfn);
-
-		kvm_shift_memslot(slots, i, i + 1);
-	}
-	return i;
-}
-
-/*
- * Move a changed memslot forwards in the array by shifting existing slots with
- * a lower GFN toward the back of the array.  Note, the changed memslot itself
- * is not preserved in the array, i.e. not swapped at this time, only its new
- * index into the array is tracked.  Returns the changed memslot's final index
- * into the memslots array.
- * The memslot at the returned index will not be in @slots->hva_tree or
- * @slots->id_hash by then.
- * @memslot is a detached struct with desired final data of the new or
- * changed slot.
- * Assumes that the memslot at @start index is not in @slots->hva_tree or
- * @slots->id_hash.
- */
-static inline int kvm_memslot_move_forward(struct kvm_memslots *slots,
-					   struct kvm_memory_slot *memslot,
-					   int start)
-{
-	struct kvm_memory_slot *mslots = slots->memslots;
-	int i;
-
-	for (i = start; i > 0; i--) {
-		if (memslot->base_gfn < mslots[i - 1].base_gfn)
-			break;
-
-		WARN_ON_ONCE(memslot->base_gfn == mslots[i - 1].base_gfn);
-
-		kvm_shift_memslot(slots, i, i - 1);
-	}
-	return i;
-}
-
-/*
- * Re-sort memslots based on their GFN to account for an added, deleted, or
- * moved memslot.  Sorting memslots by GFN allows using a binary search during
- * memslot lookup.
- *
- * IMPORTANT: Slots are sorted from highest GFN to lowest GFN!  I.e. the entry
- * at memslots[0] has the highest GFN.
- *
- * The sorting algorithm takes advantage of having initially sorted memslots
- * and knowing the position of the changed memslot.  Sorting is also optimized
- * by not swapping the updated memslot and instead only shifting other memslots
- * and tracking the new index for the update memslot.  Only once its final
- * index is known is the updated memslot copied into its position in the array.
- *
- *  - When deleting a memslot, the deleted memslot simply needs to be moved to
- *    the end of the array.
- *
- *  - When creating a memslot, the algorithm "inserts" the new memslot at the
- *    end of the array and then it forward to its correct location.
- *
- *  - When moving a memslot, the algorithm first moves the updated memslot
- *    backward to handle the scenario where the memslot's GFN was changed to a
- *    lower value.  update_memslots() then falls through and runs the same flow
- *    as creating a memslot to move the memslot forward to handle the scenario
- *    where its GFN was changed to a higher value.
- *
- * Note, slots are sorted from highest->lowest instead of lowest->highest for
- * historical reasons.  Originally, invalid memslots where denoted by having
- * GFN=0, thus sorting from highest->lowest naturally sorted invalid memslots
- * to the end of the array.  The current algorithm uses dedicated logic to
- * delete a memslot and thus does not rely on invalid memslots having GFN=0.
- *
- * The other historical motiviation for highest->lowest was to improve the
- * performance of memslot lookup.  KVM originally used a linear search starting
- * at memslots[0].  On x86, the largest memslot usually has one of the highest,
- * if not *the* highest, GFN, as the bulk of the guest's RAM is located in a
- * single memslot above the 4gb boundary.  As the largest memslot is also the
- * most likely to be referenced, sorting it to the front of the array was
- * advantageous.  The current binary search starts from the middle of the array
- * and uses an LRU pointer to improve performance for all memslots and GFNs.
- *
- * @memslot is a detached struct, not a part of the current or new memslot
- * array.
- */
-static void update_memslots(struct kvm_memslots *slots,
-			    struct kvm_memory_slot *memslot,
-			    enum kvm_mr_change change)
-{
-	int i;
-
-	if (change == KVM_MR_DELETE) {
-		kvm_memslot_delete(slots, memslot);
+	if (old && old->base_gfn == new->base_gfn) {
+		kvm_replace_gfn_node(slots, old, new);
 	} else {
-		if (change == KVM_MR_CREATE)
-			i = kvm_memslot_insert_back(slots);
-		else
-			i = kvm_memslot_move_backward(slots, memslot);
-		i = kvm_memslot_move_forward(slots, memslot, i);
-
-		if (WARN_ON_ONCE(i < 0))
-			return;
-
-		/*
-		 * Copy the memslot to its new position in memslots and update
-		 * its index accordingly.
-		 */
-		slots->memslots[i] = *memslot;
-		kvm_replace_memslot(slots, NULL, &slots->memslots[i]);
+		if (old)
+			kvm_erase_gfn_node(slots, old);
+		kvm_insert_gfn_node(slots, new);
 	}
 }
 
@@ -1511,11 +1416,12 @@ static int check_memory_region_flags(const struct kvm_userspace_memory_region *m
 	return 0;
 }
 
-static struct kvm_memslots *install_new_memslots(struct kvm *kvm,
-		int as_id, struct kvm_memslots *slots)
+static void kvm_swap_active_memslots(struct kvm *kvm, int as_id)
 {
-	struct kvm_memslots *old_memslots = __kvm_memslots(kvm, as_id);
-	u64 gen = old_memslots->generation;
+	struct kvm_memslots *slots = kvm_get_inactive_memslots(kvm, as_id);
+
+	/* Grab the generation from the activate memslots. */
+	u64 gen = __kvm_memslots(kvm, as_id)->generation;
 
 	WARN_ON(gen & KVM_MEMSLOT_GEN_UPDATE_IN_PROGRESS);
 	slots->generation = gen | KVM_MEMSLOT_GEN_UPDATE_IN_PROGRESS;
@@ -1566,58 +1472,6 @@ static struct kvm_memslots *install_new_memslots(struct kvm *kvm,
 	kvm_arch_memslots_updated(kvm, gen);
 
 	slots->generation = gen;
-
-	return old_memslots;
-}
-
-static size_t kvm_memslots_size(int slots)
-{
-	return sizeof(struct kvm_memslots) +
-	       (sizeof(struct kvm_memory_slot) * slots);
-}
-
-/*
- * Note, at a minimum, the current number of used slots must be allocated, even
- * when deleting a memslot, as we need a complete duplicate of the memslots for
- * use when invalidating a memslot prior to deleting/moving the memslot.
- */
-static struct kvm_memslots *kvm_dup_memslots(struct kvm_memslots *old,
-					     enum kvm_mr_change change)
-{
-	struct kvm_memslots *slots;
-	size_t new_size;
-	struct kvm_memory_slot *memslot;
-
-	if (change == KVM_MR_CREATE)
-		new_size = kvm_memslots_size(old->used_slots + 1);
-	else
-		new_size = kvm_memslots_size(old->used_slots);
-
-	slots = kvzalloc(new_size, GFP_KERNEL_ACCOUNT);
-	if (unlikely(!slots))
-		return NULL;
-
-	memcpy(slots, old, kvm_memslots_size(old->used_slots));
-
-	slots->hva_tree = RB_ROOT_CACHED;
-	hash_init(slots->id_hash);
-	kvm_for_each_memslot(memslot, slots) {
-		interval_tree_insert(&memslot->hva_node, &slots->hva_tree);
-		hash_add(slots->id_hash, &memslot->id_node, memslot->id);
-	}
-
-	return slots;
-}
-
-static void kvm_copy_memslots_arch(struct kvm_memslots *to,
-				   struct kvm_memslots *from)
-{
-	int i;
-
-	WARN_ON_ONCE(to->used_slots != from->used_slots);
-
-	for (i = 0; i < from->used_slots; i++)
-		to->memslots[i].arch = from->memslots[i].arch;
 }
 
 static int kvm_prepare_memory_region(struct kvm *kvm,
@@ -1672,31 +1526,214 @@ static void kvm_commit_memory_region(struct kvm *kvm,
 
 	kvm_arch_commit_memory_region(kvm, old, new, change);
 
-	/*
-	 * Free the old memslot's metadata.  On DELETE, free the whole thing,
-	 * otherwise free the dirty bitmap as needed (the below effectively
-	 * checks both the flags and whether a ring buffer is being used).
-	 */
-	if (change == KVM_MR_DELETE)
+	switch (change) {
+	case KVM_MR_CREATE:
+		/* Nothing more to do. */
+		break;
+	case KVM_MR_DELETE:
+		/* Free the old memslot and all its metadata. */
 		kvm_free_memslot(kvm, old);
-	else if (old->dirty_bitmap && !new->dirty_bitmap)
-		kvm_destroy_dirty_bitmap(old);
+		break;
+	case KVM_MR_MOVE:
+	case KVM_MR_FLAGS_ONLY:
+		/*
+		 * Free the dirty bitmap as needed; the below check encompasses
+		 * both the flags and whether a ring buffer is being used)
+		 */
+		if (old->dirty_bitmap && !new->dirty_bitmap)
+			kvm_destroy_dirty_bitmap(old);
+
+		/*
+		 * The final quirk.  Free the detached, old slot, but only its
+		 * memory, not any metadata.  Metadata, including arch specific
+		 * data, may be reused by @new.
+		 */
+		kfree(old);
+		break;
+	default:
+		BUG();
+	}
+}
+
+/*
+ * Activate @new, which must be installed in the inactive slots by the caller,
+ * by swapping the active slots and then propagating @new to @old once @old is
+ * unreachable and can be safely modified.
+ *
+ * With NULL @old this simply adds @new to @active (while swapping the sets).
+ * With NULL @new this simply removes @old from @active and frees it
+ * (while also swapping the sets).
+ */
+static void kvm_activate_memslot(struct kvm *kvm,
+				 struct kvm_memory_slot *old,
+				 struct kvm_memory_slot *new)
+{
+	int as_id = kvm_memslots_get_as_id(old, new);
+
+	kvm_swap_active_memslots(kvm, as_id);
+
+	/* Propagate the new memslot to the now inactive memslots. */
+	kvm_replace_memslot(kvm, old, new);
+}
+
+static void kvm_copy_memslot(struct kvm_memory_slot *dest,
+			     const struct kvm_memory_slot *src)
+{
+	dest->base_gfn = src->base_gfn;
+	dest->npages = src->npages;
+	dest->dirty_bitmap = src->dirty_bitmap;
+	dest->arch = src->arch;
+	dest->userspace_addr = src->userspace_addr;
+	dest->flags = src->flags;
+	dest->id = src->id;
+	dest->as_id = src->as_id;
+}
+
+static void kvm_invalidate_memslot(struct kvm *kvm,
+				   struct kvm_memory_slot *old,
+				   struct kvm_memory_slot *working_slot)
+{
+	/*
+	 * Mark the current slot INVALID.  As with all memslot modifications,
+	 * this must be done on an unreachable slot to avoid modifying the
+	 * current slot in the active tree.
+	 */
+	kvm_copy_memslot(working_slot, old);
+	working_slot->flags |= KVM_MEMSLOT_INVALID;
+	kvm_replace_memslot(kvm, old, working_slot);
+
+	/*
+	 * Activate the slot that is now marked INVALID, but don't propagate
+	 * the slot to the now inactive slots. The slot is either going to be
+	 * deleted or recreated as a new slot.
+	 */
+	kvm_swap_active_memslots(kvm, old->as_id);
+
+	/*
+	 * From this point no new shadow pages pointing to a deleted, or moved,
+	 * memslot will be created.  Validation of sp->gfn happens in:
+	 *	- gfn_to_hva (kvm_read_guest, gfn_to_pfn)
+	 *	- kvm_is_visible_gfn (mmu_check_root)
+	 */
+	kvm_arch_flush_shadow_memslot(kvm, old);
+
+	/* Was released by kvm_swap_active_memslots, reacquire. */
+	mutex_lock(&kvm->slots_arch_lock);
+
+	/*
+	 * Copy the arch-specific field of the newly-installed slot back to the
+	 * old slot as the arch data could have changed between releasing
+	 * slots_arch_lock in install_new_memslots() and re-acquiring the lock
+	 * above.  Writers are required to retrieve memslots *after* acquiring
+	 * slots_arch_lock, thus the active slot's data is guaranteed to be fresh.
+	 */
+	old->arch = working_slot->arch;
+}
+
+static void kvm_create_memslot(struct kvm *kvm,
+			       const struct kvm_memory_slot *new,
+			       struct kvm_memory_slot *working)
+{
+	/*
+	 * Add the new memslot to the inactive set as a copy of the
+	 * new memslot data provided by userspace.
+	 */
+	kvm_copy_memslot(working, new);
+	kvm_replace_memslot(kvm, NULL, working);
+	kvm_activate_memslot(kvm, NULL, working);
+}
+
+static void kvm_delete_memslot(struct kvm *kvm,
+			       struct kvm_memory_slot *old,
+			       struct kvm_memory_slot *invalid_slot)
+{
+	/*
+	 * Remove the old memslot (in the inactive memslots) by passing NULL as
+	 * the "new" slot.
+	 */
+	kvm_replace_memslot(kvm, old, NULL);
+
+	/* And do the same for the invalid version in the active slot. */
+	kvm_activate_memslot(kvm, invalid_slot, NULL);
+
+	/* Free the invalid slot, the caller will clean up the old slot. */
+	kfree(invalid_slot);
+}
+
+static struct kvm_memory_slot *kvm_move_memslot(struct kvm *kvm,
+						struct kvm_memory_slot *old,
+						const struct kvm_memory_slot *new,
+						struct kvm_memory_slot *invalid_slot)
+{
+	struct kvm_memslots *slots = kvm_get_inactive_memslots(kvm, old->as_id);
+
+	/*
+	 * The memslot's gfn is changing, remove it from the inactive tree, it
+	 * will be re-added with its updated gfn. Because its range is
+	 * changing, an in-place replace is not possible.
+	 */
+	kvm_erase_gfn_node(slots, old);
+
+	/*
+	 * The old slot is now fully disconnected, reuse its memory for the
+	 * persistent copy of "new".
+	 */
+	kvm_copy_memslot(old, new);
+
+	/* Re-add to the gfn tree with the updated gfn */
+	kvm_insert_gfn_node(slots, old);
+
+	/* Replace the current INVALID slot with the updated memslot. */
+	kvm_activate_memslot(kvm, invalid_slot, old);
+
+	/*
+	 * Clear the INVALID flag so that the invalid_slot is now a perfect
+	 * copy of the old slot.  Return it for cleanup in the caller.
+	 */
+	WARN_ON_ONCE(!(invalid_slot->flags & KVM_MEMSLOT_INVALID));
+	invalid_slot->flags &= ~KVM_MEMSLOT_INVALID;
+	return invalid_slot;
+}
+
+static void kvm_update_flags_memslot(struct kvm *kvm,
+				     struct kvm_memory_slot *old,
+				     const struct kvm_memory_slot *new,
+				     struct kvm_memory_slot *working_slot)
+{
+	/*
+	 * Similar to the MOVE case, but the slot doesn't need to be zapped as
+	 * an intermediate step. Instead, the old memslot is simply replaced
+	 * with a new, updated copy in both memslot sets.
+	 */
+	kvm_copy_memslot(working_slot, new);
+	kvm_replace_memslot(kvm, old, working_slot);
+	kvm_activate_memslot(kvm, old, working_slot);
 }
 
 static int kvm_set_memslot(struct kvm *kvm,
+			   struct kvm_memory_slot *old,
 			   struct kvm_memory_slot *new,
 			   enum kvm_mr_change change)
 {
-	struct kvm_memory_slot *slot, old;
-	struct kvm_memslots *slots;
+	struct kvm_memory_slot *working;
 	int r;
 
 	/*
-	 * Released in install_new_memslots.
+	 * Modifications are done on an unreachable slot.  Any changes are then
+	 * (eventually) propagated to both the active and inactive slots.  This
+	 * allocation would ideally be on-demand (in helpers), but is done here
+	 * to avoid having to handle failure after kvm_prepare_memory_region().
+	 */
+	working = kzalloc(sizeof(*working), GFP_KERNEL_ACCOUNT);
+	if (!working)
+		return -ENOMEM;
+
+	/*
+	 * Released in kvm_swap_active_memslots.
 	 *
 	 * Must be held from before the current memslots are copied until
 	 * after the new memslots are installed with rcu_assign_pointer,
-	 * then released before the synchronize srcu in install_new_memslots.
+	 * then released before the synchronize srcu in kvm_swap_active_memslots.
 	 *
 	 * When modifying memslots outside of the slots_lock, must be held
 	 * before reading the pointer to the current memslots until after all
@@ -1707,87 +1744,60 @@ static int kvm_set_memslot(struct kvm *kvm,
 	 */
 	mutex_lock(&kvm->slots_arch_lock);
 
-	slots = kvm_dup_memslots(__kvm_memslots(kvm, new->as_id), change);
-	if (!slots) {
-		mutex_unlock(&kvm->slots_arch_lock);
-		return -ENOMEM;
-	}
-
-	if (change == KVM_MR_DELETE || change == KVM_MR_MOVE) {
-		/*
-		 * Note, the INVALID flag needs to be in the appropriate entry
-		 * in the freshly allocated memslots, not in @old or @new.
-		 */
-		slot = id_to_memslot(slots, new->id);
-		slot->flags |= KVM_MEMSLOT_INVALID;
-
-		/*
-		 * We can re-use the old memslots, the only difference from the
-		 * newly installed memslots is the invalid flag, which will get
-		 * dropped by update_memslots anyway.  We'll also revert to the
-		 * old memslots if preparing the new memory region fails.
-		 */
-		slots = install_new_memslots(kvm, new->as_id, slots);
-
-		/* From this point no new shadow pages pointing to a deleted,
-		 * or moved, memslot will be created.
-		 *
-		 * validation of sp->gfn happens in:
-		 *	- gfn_to_hva (kvm_read_guest, gfn_to_pfn)
-		 *	- kvm_is_visible_gfn (mmu_check_root)
-		 */
-		kvm_arch_flush_shadow_memslot(kvm, slot);
-
-		/* Released in install_new_memslots. */
-		mutex_lock(&kvm->slots_arch_lock);
-
-		/*
-		 * The arch-specific fields of the now-active memslots could
-		 * have been modified between releasing slots_arch_lock in
-		 * install_new_memslots and re-acquiring slots_arch_lock above.
-		 * Copy them to the inactive memslots.  Arch code is required
-		 * to retrieve memslots *after* acquiring slots_arch_lock, thus
-		 * the active memslots are guaranteed to be fresh.
-		 */
-		kvm_copy_memslots_arch(slots, __kvm_memslots(kvm, new->as_id));
-	}
-
 	/*
-	 * Make a full copy of the old memslot, the pointer will become stale
-	 * when the memslots are re-sorted by update_memslots(), and the old
-	 * memslot needs to be referenced after calling update_memslots(), e.g.
-	 * to free its resources and for arch specific behavior.  This needs to
-	 * happen *after* (re)acquiring slots_arch_lock.
+	 * Invalidate the old slot if it's being deleted or moved.  This is
+	 * done prior to actually deleting/moving the memslot to allow vCPUs to
+	 * continue running by ensuring there are no mappings or shadow pages
+	 * for the memslot when it is deleted/moved.  Without pre-invalidation
+	 * (and without a lock), a window would exist between effecting the
+	 * delete/move and committing the changes in arch code where KVM or a
+	 * guest could access a non-existent memslot.
 	 */
-	slot = id_to_memslot(slots, new->id);
-	if (slot) {
-		old = *slot;
-	} else {
-		WARN_ON_ONCE(change != KVM_MR_CREATE);
-		memset(&old, 0, sizeof(old));
-		old.id = new->id;
-		old.as_id = new->as_id;
-	}
-
-	r = kvm_prepare_memory_region(kvm, &old, new, change);
-	if (r)
-		goto out_slots;
-
-	update_memslots(slots, new, change);
-	slots = install_new_memslots(kvm, new->as_id, slots);
-
-	kvm_commit_memory_region(kvm, &old, new, change);
-
-	kvfree(slots);
-	return 0;
-
-out_slots:
 	if (change == KVM_MR_DELETE || change == KVM_MR_MOVE)
-		slots = install_new_memslots(kvm, new->as_id, slots);
+		kvm_invalidate_memslot(kvm, old, working);
+
+	r = kvm_prepare_memory_region(kvm, old, new, change);
+	if (r) {
+		/*
+		 * For DELETE/MOVE, revert the above INVALID change.  No
+		 * modifications required since the original slot was preserved
+		 * in the inactive slots.  Changing the active memslots also
+		 * release slots_arch_lock.
+		 */
+		if (change == KVM_MR_DELETE || change == KVM_MR_MOVE)
+			kvm_activate_memslot(kvm, working, old);
+		else
+			mutex_unlock(&kvm->slots_arch_lock);
+		kfree(working);
+		return r;
+	}
+
+	/*
+	 * For DELETE and MOVE, the working slot is now active as the INVALID
+	 * version of the old slot.  MOVE is particularly special as it reuses
+	 * the old slot and returns a copy of the old slot (in working_slot).
+	 * For CREATE, there is no old slot.  For DELETE and FLAGS_ONLY, the
+	 * old slot is detached but otherwise preserved.
+	 */
+	if (change == KVM_MR_CREATE)
+		kvm_create_memslot(kvm, new, working);
+	else if (change == KVM_MR_DELETE)
+		kvm_delete_memslot(kvm, old, working);
+	else if (change == KVM_MR_MOVE)
+		old = kvm_move_memslot(kvm, old, new, working);
+	else if (change == KVM_MR_FLAGS_ONLY)
+		kvm_update_flags_memslot(kvm, old, new, working);
 	else
-		mutex_unlock(&kvm->slots_arch_lock);
-	kvfree(slots);
-	return r;
+		BUG();
+
+	/*
+	 * No need to refresh new->arch, changes after dropping slots_arch_lock
+	 * will directly hit the final, active memsot.  Architectures are
+	 * responsible for knowing that new->arch may be stale.
+	 */
+	kvm_commit_memory_region(kvm, old, new, change);
+
+	return 0;
 }
 
 /*
@@ -1848,7 +1858,7 @@ int __kvm_set_memory_region(struct kvm *kvm,
 		new.id = id;
 		new.as_id = as_id;
 
-		return kvm_set_memslot(kvm, &new, KVM_MR_DELETE);
+		return kvm_set_memslot(kvm, old, &new, KVM_MR_DELETE);
 	}
 
 	new.as_id = as_id;
@@ -1885,8 +1895,10 @@ int __kvm_set_memory_region(struct kvm *kvm,
 	}
 
 	if ((change == KVM_MR_CREATE) || (change == KVM_MR_MOVE)) {
+		int bkt;
+
 		/* Check for overlaps */
-		kvm_for_each_memslot(tmp, __kvm_memslots(kvm, as_id)) {
+		kvm_for_each_memslot(tmp, bkt, __kvm_memslots(kvm, as_id)) {
 			if (tmp->id == id)
 				continue;
 			if (!((new.base_gfn + new.npages <= tmp->base_gfn) ||
@@ -1895,7 +1907,7 @@ int __kvm_set_memory_region(struct kvm *kvm,
 		}
 	}
 
-	return kvm_set_memslot(kvm, &new, change);
+	return kvm_set_memslot(kvm, old, &new, change);
 }
 EXPORT_SYMBOL_GPL(__kvm_set_memory_region);
 
@@ -2200,21 +2212,30 @@ EXPORT_SYMBOL_GPL(gfn_to_memslot);
 struct kvm_memory_slot *kvm_vcpu_gfn_to_memslot(struct kvm_vcpu *vcpu, gfn_t gfn)
 {
 	struct kvm_memslots *slots = kvm_vcpu_memslots(vcpu);
+	u64 gen = slots->generation;
 	struct kvm_memory_slot *slot;
-	int slot_index;
 
-	slot = try_get_memslot(slots, vcpu->last_used_slot, gfn);
+	/*
+	 * This also protects against using a memslot from a different address space,
+	 * since different address spaces have different generation numbers.
+	 */
+	if (unlikely(gen != vcpu->last_used_slot_gen)) {
+		vcpu->last_used_slot = NULL;
+		vcpu->last_used_slot_gen = gen;
+	}
+
+	slot = try_get_memslot(vcpu->last_used_slot, gfn);
 	if (slot)
 		return slot;
 
 	/*
 	 * Fall back to searching all memslots. We purposely use
 	 * search_memslots() instead of __gfn_to_memslot() to avoid
-	 * thrashing the VM-wide last_used_index in kvm_memslots.
+	 * thrashing the VM-wide last_used_slot in kvm_memslots.
 	 */
-	slot = search_memslots(slots, gfn, &slot_index, false);
+	slot = search_memslots(slots, gfn, false);
 	if (slot) {
-		vcpu->last_used_slot = slot_index;
+		vcpu->last_used_slot = slot;
 		return slot;
 	}
 
-- 
2.33.1.1089.g2158813163f-goog

