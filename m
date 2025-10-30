Return-Path: <linux-mips+bounces-11957-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DA8C223B4
	for <lists+linux-mips@lfdr.de>; Thu, 30 Oct 2025 21:24:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0599E56053B
	for <lists+linux-mips@lfdr.de>; Thu, 30 Oct 2025 20:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB81F346FC3;
	Thu, 30 Oct 2025 20:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A0JJnbXO"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6A433BBDB
	for <linux-mips@vger.kernel.org>; Thu, 30 Oct 2025 20:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761855066; cv=none; b=McS20CVVDJ9IkujmeDLcYTAfzNqpSAW6u4g3ZcEtvtwtFEhBkQondMRsH74fO+4RjvJdytKri9CYprNvdjXg4p6sqETsPXmdQOR1iEB1TT2wk693kMgygsp+Q0Tk4fy0PLH+RAm0CF+XNw6KpYRE6YSNoRrnDGNdJz5aHzC7Svs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761855066; c=relaxed/simple;
	bh=3OodWTNKfo3eGtZ7Fc7X1fUwmvd4oILOljrjn90Df3M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GhLffiMi1Qwup6Tmfdm/4DDa/FR9ssvGcWRiVV5m90mHb4xxw3tFZH5M1vET9fSim9PsBrSEEpJ8UIIOKoVHRrcFhM59kUGVIEWq/Rr04Rl44C7Y7JBjMVwXAD5/HJaC0s+QmKG8f0sBFOHFaXYpNj2/eIlU9AwxL4LsCW3zUdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A0JJnbXO; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-32edda89a37so1493459a91.1
        for <linux-mips@vger.kernel.org>; Thu, 30 Oct 2025 13:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761855064; x=1762459864; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ixX9GQx535IvklNL5bVhTvm5cxC1bAxRsqCoHbh8pSg=;
        b=A0JJnbXODuaAU/SObnIaNr6/AheaUQVuUObJlIpNGGnWyaVQjn8CJW8qtkXp6ZCliz
         /oBsZT4tyrLN7p314vgo+znP9/gCwO/B+e1Q0e3ont+p9mZOhtEg4+3dbDKA1CdSLtHs
         /fmKD/BBBYKruu48sb84Ero8oRE9FMw7GmzcWqJTZycYc/rn1HUkiPDMYKHb/9PSAG9m
         pgPphpjOqTVU+J3Al2YA1SJzS/jdppp42eqrpJUR+K6InWM/0ankTUk4UZFftsPOBsuI
         yhUyvbxSFewjrm6HdvMlzHWOaPpG7Qv73/Lc+9IzbJLrgP+stzdG12oplyKgP1Mh/SbQ
         Q+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761855064; x=1762459864;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ixX9GQx535IvklNL5bVhTvm5cxC1bAxRsqCoHbh8pSg=;
        b=E8czGjSodoGcjYn3qPI0Ve0lUJy8PkmF0ZKKVMlWWzBnch2b+oeJGp1CFlm2VfSwJ5
         f3faVKsljk+l7oinW2pHEJdRB+JrykNk4p4VKbW4FLnSVmDY9oirQZsVN4llTH+/SPKp
         2+4XZWIGpWP/Fja6cEVE7lmNX4GUM/HF8bA9MJ9NG9GbKliQD/NJ1ThV6MlThU/gxTlG
         ifzj1XjqjYhE81I/iLSv5Q/GaMcZfP9Jk5mPKKotJzZIFnewNTl0p/hbD+/xeN2Uue8a
         dQJs1JLLZP7pT+6k9Jl7yt5cTu84/4QQYQKSZq5KzPXQOasp2yx5VFV1eB4IdSCPcMDr
         pAEg==
X-Forwarded-Encrypted: i=1; AJvYcCU0R+l/oMbNRvDv0SKQ3E0IwfHUgDcPlByL8+3bunvIRWtBN9edGguQLSeHt1F3DMfFpsSq5rAe2GgZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzhQgeWSO3odwEDGYLDEZ+Mkmfj6mAFY2ID1jdth4syuNIFenyX
	nBLiIPhSX6SESfeK4iMXx+jM2jBWrEHJ8NWByzMZNU1AE8YYhDa8WDj43HpboH39IJYmjxDfBEo
	O6HfWGQ==
X-Google-Smtp-Source: AGHT+IFyAaLKG8h2LJ84hJgHQ75wx3G0tk8Vj+W9kFkkyUvmGPkijC+6POH5qOYkAqbj7Ex/aKtYOd6js0k=
X-Received: from pjbcq19.prod.google.com ([2002:a17:90a:f993:b0:339:ee5f:ec32])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4b10:b0:340:2a16:94be
 with SMTP id 98e67ed59e1d1-34082fab1e6mr1328002a91.4.1761855063621; Thu, 30
 Oct 2025 13:11:03 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 30 Oct 2025 13:09:49 -0700
In-Reply-To: <20251030200951.3402865-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251030200951.3402865-27-seanjc@google.com>
Subject: [PATCH v4 26/28] KVM: TDX: Guard VM state transitions with "all" the locks
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
	Kai Huang <kai.huang@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Michael Roth <michael.roth@amd.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="UTF-8"

Acquire kvm->lock, kvm->slots_lock, and all vcpu->mutex locks when
servicing ioctls that (a) transition the TD to a new state, i.e. when
doing INIT or FINALIZE or (b) are only valid if the TD is in a specific
state, i.e. when initializing a vCPU or memory region.  Acquiring "all"
the locks fixes several KVM_BUG_ON() situations where a SEAMCALL can fail
due to racing actions, e.g. if tdh_vp_create() contends with either
tdh_mr_extend() or tdh_mr_finalize().

For all intents and purposes, the paths in question are fully serialized,
i.e. there's no reason to try and allow anything remotely interesting to
happen.  Smack 'em with a big hammer instead of trying to be "nice".

Acquire kvm->lock to prevent VM-wide things from happening, slots_lock to
prevent kvm_mmu_zap_all_fast(), and _all_ vCPU mutexes to prevent vCPUs
from interefering.  Use the recently-renamed kvm_arch_vcpu_unlocked_ioctl()
to service the vCPU-scoped ioctls to avoid a lock inversion problem, e.g.
due to taking vcpu->mutex outside kvm->lock.

See also commit ecf371f8b02d ("KVM: SVM: Reject SEV{-ES} intra host
migration if vCPU creation is in-flight"), which fixed a similar bug with
SEV intra-host migration where an in-flight vCPU creation could race with
a VM-wide state transition.

Define a fancy new CLASS to handle the lock+check => unlock logic with
guard()-like syntax:

        CLASS(tdx_vm_state_guard, guard)(kvm);
        if (IS_ERR(guard))
                return PTR_ERR(guard);

to simplify juggling the many locks.

Note!  Take kvm->slots_lock *after* all vcpu->mutex locks, as per KVM's
soon-to-be-documented lock ordering rules[1].

Link: https://lore.kernel.org/all/20251016235538.171962-1-seanjc@google.com [1]
Reported-by: Yan Zhao <yan.y.zhao@intel.com>
Closes: https://lore.kernel.org/all/aLFiPq1smdzN3Ary@yzhao56-desk.sh.intel.com
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 59 +++++++++++++++++++++++++++++++++++-------
 1 file changed, 49 insertions(+), 10 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 57dfddd2a6cf..8bcdec049ac6 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -2653,6 +2653,46 @@ static int tdx_read_cpuid(struct kvm_vcpu *vcpu, u32 leaf, u32 sub_leaf,
 	return -EIO;
 }
 
+typedef void *tdx_vm_state_guard_t;
+
+static tdx_vm_state_guard_t tdx_acquire_vm_state_locks(struct kvm *kvm)
+{
+	int r;
+
+	mutex_lock(&kvm->lock);
+
+	if (kvm->created_vcpus != atomic_read(&kvm->online_vcpus)) {
+		r = -EBUSY;
+		goto out_err;
+	}
+
+	r = kvm_lock_all_vcpus(kvm);
+	if (r)
+		goto out_err;
+
+	/*
+	 * Note the unintuitive ordering!  vcpu->mutex must be taken outside
+	 * kvm->slots_lock!
+	 */
+	mutex_lock(&kvm->slots_lock);
+	return kvm;
+
+out_err:
+	mutex_unlock(&kvm->lock);
+	return ERR_PTR(r);
+}
+
+static void tdx_release_vm_state_locks(struct kvm *kvm)
+{
+	mutex_unlock(&kvm->slots_lock);
+	kvm_unlock_all_vcpus(kvm);
+	mutex_unlock(&kvm->lock);
+}
+
+DEFINE_CLASS(tdx_vm_state_guard, tdx_vm_state_guard_t,
+	     if (!IS_ERR(_T)) tdx_release_vm_state_locks(_T),
+	     tdx_acquire_vm_state_locks(kvm), struct kvm *kvm);
+
 static int tdx_td_init(struct kvm *kvm, struct kvm_tdx_cmd *cmd)
 {
 	struct kvm_tdx_init_vm __user *user_data = u64_to_user_ptr(cmd->data);
@@ -2764,8 +2804,6 @@ static int tdx_td_finalize(struct kvm *kvm, struct kvm_tdx_cmd *cmd)
 {
 	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
 
-	guard(mutex)(&kvm->slots_lock);
-
 	if (!is_hkid_assigned(kvm_tdx) || kvm_tdx->state == TD_STATE_RUNNABLE)
 		return -EINVAL;
 
@@ -2809,7 +2847,9 @@ int tdx_vm_ioctl(struct kvm *kvm, void __user *argp)
 	if (tdx_cmd.id == KVM_TDX_CAPABILITIES)
 		return tdx_get_capabilities(&tdx_cmd);
 
-	guard(mutex)(&kvm->lock);
+	CLASS(tdx_vm_state_guard, guard)(kvm);
+	if (IS_ERR(guard))
+		return PTR_ERR(guard);
 
 	switch (tdx_cmd.id) {
 	case KVM_TDX_INIT_VM:
@@ -3113,8 +3153,6 @@ static int tdx_vcpu_init_mem_region(struct kvm_vcpu *vcpu, struct kvm_tdx_cmd *c
 	if (tdx->state != VCPU_TD_STATE_INITIALIZED)
 		return -EINVAL;
 
-	guard(mutex)(&kvm->slots_lock);
-
 	/* Once TD is finalized, the initial guest memory is fixed. */
 	if (kvm_tdx->state == TD_STATE_RUNNABLE)
 		return -EINVAL;
@@ -3170,7 +3208,8 @@ static int tdx_vcpu_init_mem_region(struct kvm_vcpu *vcpu, struct kvm_tdx_cmd *c
 
 int tdx_vcpu_unlocked_ioctl(struct kvm_vcpu *vcpu, void __user *argp)
 {
-	struct kvm_tdx *kvm_tdx = to_kvm_tdx(vcpu->kvm);
+	struct kvm *kvm = vcpu->kvm;
+	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
 	struct kvm_tdx_cmd cmd;
 	int r;
 
@@ -3178,12 +3217,13 @@ int tdx_vcpu_unlocked_ioctl(struct kvm_vcpu *vcpu, void __user *argp)
 	if (r)
 		return r;
 
+	CLASS(tdx_vm_state_guard, guard)(kvm);
+	if (IS_ERR(guard))
+		return PTR_ERR(guard);
+
 	if (!is_hkid_assigned(kvm_tdx) || kvm_tdx->state == TD_STATE_RUNNABLE)
 		return -EINVAL;
 
-	if (mutex_lock_killable(&vcpu->mutex))
-		return -EINTR;
-
 	vcpu_load(vcpu);
 
 	switch (cmd.id) {
@@ -3200,7 +3240,6 @@ int tdx_vcpu_unlocked_ioctl(struct kvm_vcpu *vcpu, void __user *argp)
 
 	vcpu_put(vcpu);
 
-	mutex_unlock(&vcpu->mutex);
 	return r;
 }
 
-- 
2.51.1.930.gacf6e81ea2-goog


