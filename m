Return-Path: <linux-mips+bounces-11959-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BB6C2232C
	for <lists+linux-mips@lfdr.de>; Thu, 30 Oct 2025 21:19:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8463A1A27F3D
	for <lists+linux-mips@lfdr.de>; Thu, 30 Oct 2025 20:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1B1334D3A3;
	Thu, 30 Oct 2025 20:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zdKbOyxC"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF2C374AC8
	for <linux-mips@vger.kernel.org>; Thu, 30 Oct 2025 20:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761855070; cv=none; b=qJaPb+2UTgH/K1ZpC2pwWY3fj9NfFk/xdcfgT/IqJLoMwTiHf5r313v12ex8N+9UBM+3i9D0JyGaXbKjVwUpCOB7S7Lo3KIxaMGEN2mGBJnjc2eEaXiSIGMz5D3CHqo8/6+15vJGEiEMTyFOjMJu3zSKa5nP9Dbe3qn0hKz520A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761855070; c=relaxed/simple;
	bh=+qLC3Iee5+EjjvPxLbec42/6nK7vtOEI69ofQbkEfuY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gJmihN1xcU9QlZDItqt1S34wuDAtyaECfHXx+mwn+I9rQ+dTvj1GdkjAW75r/hA5UljLe+1zme93kdCiH9kCgzX2scal/N5i3B9UUR0Qh2XxvZ2TZCKdZUTJu05yWvTU2ULHyU8VsC9ANgYnL3Ym8hsw9Fo97mymziH8poAIFuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zdKbOyxC; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-33da21394adso1583378a91.1
        for <linux-mips@vger.kernel.org>; Thu, 30 Oct 2025 13:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761855068; x=1762459868; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=g0DZj43Z67Ng4V8dccak1Ym5loj+qmLakJ+LCALP9kg=;
        b=zdKbOyxCPxnbqzFm+845zbU+aWPDJZEuP8PA7LjPrzoMfw2GDcy8ytSyiBMV1WcFTp
         Uzmb/b/ftTflEgVbH/80n4hByIx+2eAsnItF9Bc26lDyqhVySSIdS+LaUle7+tJyugcd
         P98UsGZyl2XMwDnbnh3e7a8iI8jbgp8pGfcqR4xnIwojJhwrNV6l+Bg0OYVHIhm02Lh4
         Gy/fmwE5T4WuHhjg1vFtnfulQWVk0BBX24ThxFsBJhgy8xhBCysO2Ps3lLBpBvLZjX+e
         cSgIa/R1aYcT8IDCiErLnd9Sqe0JziGB2FSudAP3YuXjfqoZsonj2oLYd+6NpMet2xuu
         U5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761855068; x=1762459868;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g0DZj43Z67Ng4V8dccak1Ym5loj+qmLakJ+LCALP9kg=;
        b=ARzFWYYKoApsZWLkybsB64X0roFtlvuhWpINjd/B6/aYT3RIvhxCVW9ISOX7nin057
         PtGWRgWOvuUD2yBgCZX5rLW6muohxeuwGJUa8EzJNDW1CzvX+GZ+ZhAMD8t+0X7bv+01
         6IhIKt3rX58mJl4ZJ7b4utbXAcg91rjKOLCHuypIvWx1K4OIyztL64zVrZZQwmnVPeJY
         fHCeScknwrHDzbfpT5wVuDUicrUfNp7JvR6rD0G/HFvljbJWvzQidiTQiFv9VRBDi8Bo
         lptTCEYse7Kn8326C7b7GTXL6UW614Si/2uwCMmKXHPuMdYo4Q65gGveqWu3xxjDuj9q
         xpWw==
X-Forwarded-Encrypted: i=1; AJvYcCU9rkJoC0DTvaoTcb3Apel9Y1WwHmebfVfMGGr3m5+jFNw1wwaG/VE6EPa54vmYz2Y2Ng58gcbQxH9W@vger.kernel.org
X-Gm-Message-State: AOJu0YzkQXjo3bl2jGMY7V4Qfvf+N2tyaEWNfFkkJBf3VjcOOUir+gWw
	TK7CcCk32L9bIEEeJNi4YOBcJmyw1KSk78G4G/9EIl/xWgbua0DysYxmjJRz4356UnMz6unhBty
	s4t10Uw==
X-Google-Smtp-Source: AGHT+IHFPEZaejYJvfIle9tc1ZXyDJfCQsJh2BXbTmXv+Mn/KvdDlX4yHPVD4nKwk0+goI6XnN1tnx5wN9U=
X-Received: from pjbgp21.prod.google.com ([2002:a17:90a:df15:b0:33b:51fe:1a7b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4c12:b0:32e:7340:a7f7
 with SMTP id 98e67ed59e1d1-34082fc8525mr1267842a91.2.1761855067459; Thu, 30
 Oct 2025 13:11:07 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 30 Oct 2025 13:09:51 -0700
In-Reply-To: <20251030200951.3402865-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251030200951.3402865-29-seanjc@google.com>
Subject: [PATCH v4 28/28] KVM: TDX: Fix list_add corruption during vcpu_load()
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

From: Yan Zhao <yan.y.zhao@intel.com>

During vCPU creation, a vCPU may be destroyed immediately after
kvm_arch_vcpu_create() (e.g., due to vCPU id confiliction). However, the
vcpu_load() inside kvm_arch_vcpu_create() may have associate the vCPU to
pCPU via "list_add(&tdx->cpu_list, &per_cpu(associated_tdvcpus, cpu))"
before invoking tdx_vcpu_free().

Though there's no need to invoke tdh_vp_flush() on the vCPU, failing to
dissociate the vCPU from pCPU (i.e., "list_del(&to_tdx(vcpu)->cpu_list)")
will cause list corruption of the per-pCPU list associated_tdvcpus.

Then, a later list_add() during vcpu_load() would detect list corruption
and print calltrace as shown below.

Dissociate a vCPU from its associated pCPU in tdx_vcpu_free() for the vCPUs
destroyed immediately after creation which must be in
VCPU_TD_STATE_UNINITIALIZED state.

kernel BUG at lib/list_debug.c:29!
Oops: invalid opcode: 0000 [#2] SMP NOPTI
RIP: 0010:__list_add_valid_or_report+0x82/0xd0

Call Trace:
 <TASK>
 tdx_vcpu_load+0xa8/0x120
 vt_vcpu_load+0x25/0x30
 kvm_arch_vcpu_load+0x81/0x300
 vcpu_load+0x55/0x90
 kvm_arch_vcpu_create+0x24f/0x330
 kvm_vm_ioctl_create_vcpu+0x1b1/0x53
 kvm_vm_ioctl+0xc2/0xa60
  __x64_sys_ioctl+0x9a/0xf0
 x64_sys_call+0x10ee/0x20d0
 do_syscall_64+0xc3/0x470
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Fixes: d789fa6efac9 ("KVM: TDX: Handle vCPU dissociation")
Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 43 +++++++++++++++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 762f2896547f..db7ac7955ca1 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -843,19 +843,52 @@ void tdx_vcpu_put(struct kvm_vcpu *vcpu)
 	tdx_prepare_switch_to_host(vcpu);
 }
 
+/*
+ * Life cycles for a TD and a vCPU:
+ * 1. KVM_CREATE_VM ioctl.
+ *    TD state is TD_STATE_UNINITIALIZED.
+ *    hkid is not assigned at this stage.
+ * 2. KVM_TDX_INIT_VM ioctl.
+ *    TD transitions to TD_STATE_INITIALIZED.
+ *    hkid is assigned after this stage.
+ * 3. KVM_CREATE_VCPU ioctl. (only when TD is TD_STATE_INITIALIZED).
+ *    3.1 tdx_vcpu_create() transitions vCPU state to VCPU_TD_STATE_UNINITIALIZED.
+ *    3.2 vcpu_load() and vcpu_put() in kvm_arch_vcpu_create().
+ *    3.3 (conditional) if any error encountered after kvm_arch_vcpu_create()
+ *        kvm_arch_vcpu_destroy() --> tdx_vcpu_free().
+ * 4. KVM_TDX_INIT_VCPU ioctl.
+ *    tdx_vcpu_init() transitions vCPU state to VCPU_TD_STATE_INITIALIZED.
+ *    vCPU control structures are allocated at this stage.
+ * 5. kvm_destroy_vm().
+ *    5.1 tdx_mmu_release_hkid(): (1) tdh_vp_flush(), disassociates all vCPUs.
+ *                                (2) puts hkid to !assigned state.
+ *    5.2 kvm_destroy_vcpus() --> tdx_vcpu_free():
+ *        transitions vCPU to VCPU_TD_STATE_UNINITIALIZED state.
+ *    5.3 tdx_vm_destroy()
+ *        transitions TD to TD_STATE_UNINITIALIZED state.
+ *
+ * tdx_vcpu_free() can be invoked only at 3.3 or 5.2.
+ * - If at 3.3, hkid is still assigned, but the vCPU must be in
+ *   VCPU_TD_STATE_UNINITIALIZED state.
+ * - if at 5.2, hkid must be !assigned and all vCPUs must be in
+ *   VCPU_TD_STATE_INITIALIZED state and have been dissociated.
+ */
 void tdx_vcpu_free(struct kvm_vcpu *vcpu)
 {
 	struct kvm_tdx *kvm_tdx = to_kvm_tdx(vcpu->kvm);
 	struct vcpu_tdx *tdx = to_tdx(vcpu);
 	int i;
 
+	if (vcpu->cpu != -1) {
+		KVM_BUG_ON(tdx->state == VCPU_TD_STATE_INITIALIZED, vcpu->kvm);
+		tdx_flush_vp_on_cpu(vcpu);
+		return;
+	}
+
 	/*
 	 * It is not possible to reclaim pages while hkid is assigned. It might
-	 * be assigned if:
-	 * 1. the TD VM is being destroyed but freeing hkid failed, in which
-	 * case the pages are leaked
-	 * 2. TD VCPU creation failed and this on the error path, in which case
-	 * there is nothing to do anyway
+	 * be assigned if the TD VM is being destroyed but freeing hkid failed,
+	 * in which case the pages are leaked.
 	 */
 	if (is_hkid_assigned(kvm_tdx))
 		return;
-- 
2.51.1.930.gacf6e81ea2-goog


