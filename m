Return-Path: <linux-mips+bounces-11742-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B36ADBE5E94
	for <lists+linux-mips@lfdr.de>; Fri, 17 Oct 2025 02:33:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 56A124EE7A4
	for <lists+linux-mips@lfdr.de>; Fri, 17 Oct 2025 00:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59A7C246766;
	Fri, 17 Oct 2025 00:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ku59ti05"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D60023BD17
	for <linux-mips@vger.kernel.org>; Fri, 17 Oct 2025 00:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760661178; cv=none; b=bofWSiWA4bXsOOM8k/xAHELqzJ1oo0Uy+2oSENZQn4GTMurJfpIoyN4cDg81iuG5QsG2ZJPMIm7kabIv9V64wr9KpQh11QHE+Q68fSlDpWe1UUqHHJbQ2MdQ1FRiWu0iCbuAuYM3aL3YOv7PnJ2FquG3emmX3PV3/HNyuwYpDNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760661178; c=relaxed/simple;
	bh=s+5xqtORsbmLUfv3OZ/dLobWuRRdQhZOtDHAsyPrT00=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MHXns/d4URryyF3PiIjpnQcEpTPr/dlVJ0ebHj44qEpLZkmE6BqUd2dEtKH3ikKUqeumikrUqQWgVu27/q7n+iP53R2S7kmyXlZWbNIv9F1tSrWoUFe298uFNcW9Co0FtVy+W22U55lXgn7LOv1NCjyo/6onj+DTsjZ24jSR0Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ku59ti05; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-33428befc08so3128515a91.2
        for <linux-mips@vger.kernel.org>; Thu, 16 Oct 2025 17:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760661175; x=1761265975; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ko9UTh0kFN5WvzyFoNPT6gnIbmUfHZvedxM+uwzO14M=;
        b=Ku59ti05tSWpMW4sQoT4PS2PHyRF0IxwARVPyuhoQqqiGhf4v4VNUaUJYshPjoufjC
         KOmWTKgCT1BakXcGHjSGNawIewIucwVFGsNgGkwcrU5cZjscsttUHK9qPbwNrANcLEak
         +69UnC6zkOujk1Y8NReZRLRJaY0aI6Gi+MjhvIV7U80zq1ADCZ8GaR9fYs4Sc23miEcS
         87/nTEk9bQIn/OtEGrnN9Q5nq/tgeRPAsuBpSCSkqF7Rtx5OR2NvCsgUB/L2KSgvTn+I
         vqrwUIng1BKsmf60gSYCYFng3Qe9HrYfJgPDbDSzOfhtUlWRs1IHq4FZzKkrxJvJPjq3
         1R3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760661175; x=1761265975;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ko9UTh0kFN5WvzyFoNPT6gnIbmUfHZvedxM+uwzO14M=;
        b=r8h5pdAHmkVDLU979U8zEvYLEe0WcfRDESkJZOQO7yTzucrZzyNDU9KyzbMo1C95F3
         FAMUFPWvogNcaPHM2m1ceRCPgxlDtoUNu/Tt3O2SrD6Wyj29NXP/F2RnKsm/UxGXV+Ml
         3dTh0rMMvxiwmc4xYLLKjArOYo3PSEyqQ4sABX+ClXWsPt/PVbqpvMNTEExAWkxNxpP8
         1JzQl0pPB9MMh5QitNe2xnQYL5w+OftxQ9V+rBaEiu/QkR3d+RUvS5Kz2crDRg1lJ7HT
         Q5wSMFi0popuAMJ+fcxpsxlde2rdE5MN/G4HB5D3FEK+2EhGkRhRSUDtDzdsGrxU4YWM
         uc/w==
X-Forwarded-Encrypted: i=1; AJvYcCWyvLoo1C1w7wQmS3w2V34IZWaZdOX4H5bL/K/5XmZLt3gnVMjFRLFzw7LA3meh5h06K2ngFsW1iXZA@vger.kernel.org
X-Gm-Message-State: AOJu0YxW2YCKOQPf0pn+8i3usf0VgsFrWNhVUIbVs/Z72a+dB6jVsxyQ
	kAOZ2qxYYlVqcnj9VzkYkne6a70/flcrmyWR1t3GhOMqOVYpeC0XUFjZ4o63GNlA07tLkyOY1Jt
	gUidxVA==
X-Google-Smtp-Source: AGHT+IE6CYPgkt1lc/boR85TJpRZ+SOX8flYF3i2xBYbojnuL2N+y/yOiWuvwhvUCsHzA0ZslE057qBeNRU=
X-Received: from pjbmr8.prod.google.com ([2002:a17:90b:2388:b0:330:49f5:c0a7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3c0c:b0:33b:c5f6:40f1
 with SMTP id 98e67ed59e1d1-33bcf85d123mr2212838a91.7.1760661175511; Thu, 16
 Oct 2025 17:32:55 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 16 Oct 2025 17:32:22 -0700
In-Reply-To: <20251017003244.186495-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251017003244.186495-5-seanjc@google.com>
Subject: [PATCH v3 04/25] KVM: x86/mmu: Add dedicated API to map guest_memfd
 pfn into TDP MMU
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Michael Roth <michael.roth@amd.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Add and use a new API for mapping a private pfn from guest_memfd into the
TDP MMU from TDX's post-populate hook instead of partially open-coding the
functionality into the TDX code.  Sharing code with the pre-fault path
sounded good on paper, but it's fatally flawed as simulating a fault loses
the pfn, and calling back into gmem to re-retrieve the pfn creates locking
problems, e.g. kvm_gmem_populate() already holds the gmem invalidation
lock.

Providing a dedicated API will also removing several MMU exports that
ideally would not be exposed outside of the MMU, let alone to vendor code.
On that topic, opportunistically drop the kvm_mmu_load() export.  Leave
kvm_tdp_mmu_gpa_is_mapped() alone for now; the entire commit that added
kvm_tdp_mmu_gpa_is_mapped() will be removed in the near future.

Cc: Michael Roth <michael.roth@amd.com>
Cc: Yan Zhao <yan.y.zhao@intel.com>
Cc: Ira Weiny <ira.weiny@intel.com>
Cc: Vishal Annapurve <vannapurve@google.com>
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>
Link: https://lore.kernel.org/all/20250709232103.zwmufocd3l7sqk7y@amd.com
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu.h     |  1 +
 arch/x86/kvm/mmu/mmu.c | 60 +++++++++++++++++++++++++++++++++++++++++-
 arch/x86/kvm/vmx/tdx.c | 10 +++----
 3 files changed, 63 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kvm/mmu.h b/arch/x86/kvm/mmu.h
index f63074048ec6..2f108e381959 100644
--- a/arch/x86/kvm/mmu.h
+++ b/arch/x86/kvm/mmu.h
@@ -259,6 +259,7 @@ extern bool tdp_mmu_enabled;
 
 bool kvm_tdp_mmu_gpa_is_mapped(struct kvm_vcpu *vcpu, u64 gpa);
 int kvm_tdp_map_page(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code, u8 *level);
+int kvm_tdp_mmu_map_private_pfn(struct kvm_vcpu *vcpu, gfn_t gfn, kvm_pfn_t pfn);
 
 static inline bool kvm_memslots_have_rmaps(struct kvm *kvm)
 {
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 18d69d48bc55..ba5cca825a7f 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -5014,6 +5014,65 @@ long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
 	return min(range->size, end - range->gpa);
 }
 
+int kvm_tdp_mmu_map_private_pfn(struct kvm_vcpu *vcpu, gfn_t gfn, kvm_pfn_t pfn)
+{
+	struct kvm_page_fault fault = {
+		.addr = gfn_to_gpa(gfn),
+		.error_code = PFERR_GUEST_FINAL_MASK | PFERR_PRIVATE_ACCESS,
+		.prefetch = true,
+		.is_tdp = true,
+		.nx_huge_page_workaround_enabled = is_nx_huge_page_enabled(vcpu->kvm),
+
+		.max_level = PG_LEVEL_4K,
+		.req_level = PG_LEVEL_4K,
+		.goal_level = PG_LEVEL_4K,
+		.is_private = true,
+
+		.gfn = gfn,
+		.slot = kvm_vcpu_gfn_to_memslot(vcpu, gfn),
+		.pfn = pfn,
+		.map_writable = true,
+	};
+	struct kvm *kvm = vcpu->kvm;
+	int r;
+
+	lockdep_assert_held(&kvm->slots_lock);
+
+	if (KVM_BUG_ON(!tdp_mmu_enabled, kvm))
+		return -EIO;
+
+	if (kvm_gfn_is_write_tracked(kvm, fault.slot, fault.gfn))
+		return -EPERM;
+
+	r = kvm_mmu_reload(vcpu);
+	if (r)
+		return r;
+
+	r = mmu_topup_memory_caches(vcpu, false);
+	if (r)
+		return r;
+
+	do {
+		if (signal_pending(current))
+			return -EINTR;
+
+		if (kvm_test_request(KVM_REQ_VM_DEAD, vcpu))
+			return -EIO;
+
+		cond_resched();
+
+		guard(read_lock)(&kvm->mmu_lock);
+
+		r = kvm_tdp_mmu_map(vcpu, &fault);
+	} while (r == RET_PF_RETRY);
+
+	if (r != RET_PF_FIXED)
+		return -EIO;
+
+	return 0;
+}
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_tdp_mmu_map_private_pfn);
+
 static void nonpaging_init_context(struct kvm_mmu *context)
 {
 	context->page_fault = nonpaging_page_fault;
@@ -5997,7 +6056,6 @@ int kvm_mmu_load(struct kvm_vcpu *vcpu)
 out:
 	return r;
 }
-EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_mmu_load);
 
 void kvm_mmu_unload(struct kvm_vcpu *vcpu)
 {
diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 4c3014befe9f..29f344af4cc2 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -3157,15 +3157,12 @@ struct tdx_gmem_post_populate_arg {
 static int tdx_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
 				  void __user *src, int order, void *_arg)
 {
-	u64 error_code = PFERR_GUEST_FINAL_MASK | PFERR_PRIVATE_ACCESS;
-	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
 	struct tdx_gmem_post_populate_arg *arg = _arg;
-	struct kvm_vcpu *vcpu = arg->vcpu;
+	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
+	u64 err, entry, level_state;
 	gpa_t gpa = gfn_to_gpa(gfn);
-	u8 level = PG_LEVEL_4K;
 	struct page *src_page;
 	int ret, i;
-	u64 err, entry, level_state;
 
 	/*
 	 * Get the source page if it has been faulted in. Return failure if the
@@ -3177,7 +3174,7 @@ static int tdx_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
 	if (ret != 1)
 		return -ENOMEM;
 
-	ret = kvm_tdp_map_page(vcpu, gpa, error_code, &level);
+	ret = kvm_tdp_mmu_map_private_pfn(arg->vcpu, gfn, pfn);
 	if (ret < 0)
 		goto out;
 
@@ -3240,7 +3237,6 @@ static int tdx_vcpu_init_mem_region(struct kvm_vcpu *vcpu, struct kvm_tdx_cmd *c
 	    !vt_is_tdx_private_gpa(kvm, region.gpa + (region.nr_pages << PAGE_SHIFT) - 1))
 		return -EINVAL;
 
-	kvm_mmu_reload(vcpu);
 	ret = 0;
 	while (region.nr_pages) {
 		if (signal_pending(current)) {
-- 
2.51.0.858.gf9c4a03a3a-goog


