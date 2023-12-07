Return-Path: <linux-mips+bounces-568-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B8F807D8D
	for <lists+linux-mips@lfdr.de>; Thu,  7 Dec 2023 02:03:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C457B1F20F0A
	for <lists+linux-mips@lfdr.de>; Thu,  7 Dec 2023 01:03:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E234F655;
	Thu,  7 Dec 2023 01:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VBXdf5Cn"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 704BCD72
	for <linux-mips@vger.kernel.org>; Wed,  6 Dec 2023 17:03:17 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-db53919e062so556794276.0
        for <linux-mips@vger.kernel.org>; Wed, 06 Dec 2023 17:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701910996; x=1702515796; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kNsTQFENpLV0yAX5x5gNndSdmWF67ocLDbukBVvw4Ho=;
        b=VBXdf5CnxCVBGP34y2jrZgUXAB3D+Etu2qzxQ7x4Iiqlzlrr3TrdiGUia7gbUt0OJz
         bxjsnsxC30jqgOBckgOzD4xi2ND/Qv/VAuSXcHUYPkB8Wru/eENwPE7DKRlWC6npfx9t
         46tkl86j8NKQSyJwMVC4wVWrE9qq07mPx3ObBigFWvSf1E/oUclgXmjFDOVcnGHyv7Hx
         gzIVTGRUh1IoH6iP40sTPPU3YlV0dQiBRTut12QJ9OqWU34MLj5t6gZ7HmWGjD475rKJ
         Q7HozIdE7JBNkkt35QLZVgn6s1NNUtCQRX0Y8iopRkepZNn4jslNci1YOgQ1pNV7ijE3
         Ms9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701910996; x=1702515796;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kNsTQFENpLV0yAX5x5gNndSdmWF67ocLDbukBVvw4Ho=;
        b=jFuevSj2WgN2b1U9clFWhuQ34S23R0OpMMJpp8rzTCHNjsSReU7BqwlELuK+nChSI8
         5TbmKc7YMLUr6yw3gHFhDxFGzIUukNRDcV8AA80H1nk2Q3P8gEoEIvgNSbSSI7z0kAPt
         HqnpJx6NxJ/DEkGfLe+wzhWA386zrKlJz3Gp/kWX6+xGZ5Rrd/q3I/D2I0XEdy7514JS
         advzXizcWjMnSdmimmM1vDAeJeWOYd5uAZCk6Wo9zAjl87/noj4sVSrdogQla24azsq1
         aheeB0vN4/IG++x5As6XXdKXPMT1esqHFe1vkNPQqru+zNnoOFXCtfeip/H8qQ6TBrH3
         xlig==
X-Gm-Message-State: AOJu0Yxlx/XcYE2CV4+htBr9rCbZqbcIabaOAIwjJ3LJ+C0yorsylbN3
	4H0myKLw858qvsA0jeygTGCO1BPpL1u7Bg==
X-Google-Smtp-Source: AGHT+IEeNrOu3itFc+M9ynsd08u9d5b33h7Ph3dWYLMht1q/VwgbdO1TO2ezXuPbPGpyVmgh4Cp2D8u2f11e3g==
X-Received: from loggerhead.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:29a])
 (user=jmattson job=sendgmr) by 2002:a25:2981:0:b0:dbc:3553:efe with SMTP id
 p123-20020a252981000000b00dbc35530efemr3380ybp.4.1701910996183; Wed, 06 Dec
 2023 17:03:16 -0800 (PST)
Date: Wed,  6 Dec 2023 17:03:02 -0800
In-Reply-To: <20220921003201.1441511-11-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20220921003201.1441511-11-seanjc@google.com>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
Message-ID: <20231207010302.2240506-1-jmattson@google.com>
Subject: [PATCH v4 10/12] KVM: x86: never write to memory from kvm_vcpu_check_block()
From: Jim Mattson <jmattson@google.com>
To: seanjc@google.com
Cc: aleksandar.qemu.devel@gmail.com, alexandru.elisei@arm.com, 
	anup@brainfault.org, aou@eecs.berkeley.edu, atishp@atishpatra.org, 
	borntraeger@linux.ibm.com, chenhuacai@kernel.org, david@redhat.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, james.morse@arm.com, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	maz@kernel.org, mlevitsk@redhat.com, oliver.upton@linux.dev, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, pbonzini@redhat.com, 
	suzuki.poulose@arm.com
Content-Type: text/plain; charset="UTF-8"

kvm_vcpu_check_block() is called while not in TASK_RUNNING, and therefore
it cannot sleep.  Writing to guest memory is therefore forbidden, but it
can happen on AMD processors if kvm_check_nested_events() causes a vmexit.

Fortunately, all events that are caught by kvm_check_nested_events() are
also recognized by kvm_vcpu_has_events() through vendor callbacks such as
kvm_x86_interrupt_allowed() or kvm_x86_ops.nested_ops->has_events(), so
remove the call and postpone the actual processing to vcpu_block().

Opportunistically honor the return of kvm_check_nested_events().  KVM
punted on the check in kvm_vcpu_running() because the only error path is
if vmx_complete_nested_posted_interrupt() fails, in which case KVM exits
to userspace with "internal error" i.e. the VM is likely dead anyways so
it wasn't worth overloading the return of kvm_vcpu_running().

Add the check mostly so that KVM is consistent with itself; the return of
the call via kvm_apic_accept_events()=>kvm_check_nested_events() that
immediately follows  _is_ checked.

Reported-by: Maxim Levitsky <mlevitsk@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
[sean: check and handle return of kvm_check_nested_events()]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index dcc675d4e44b..8aeacbc2bff9 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -10815,6 +10815,17 @@ static inline int vcpu_block(struct kvm_vcpu *vcpu)
 			return 1;
 	}
 
+	/*
+	 * Evaluate nested events before exiting the halted state.  This allows
+	 * the halt state to be recorded properly in the VMCS12's activity
+	 * state field (AMD does not have a similar field and a VM-Exit always
+	 * causes a spurious wakeup from HLT).
+	 */
+	if (is_guest_mode(vcpu)) {
+		if (kvm_check_nested_events(vcpu) < 0)
+			return 0;
+	}
+
 	if (kvm_apic_accept_events(vcpu) < 0)
 		return 0;
 	switch(vcpu->arch.mp_state) {
@@ -10837,9 +10848,6 @@ static inline int vcpu_block(struct kvm_vcpu *vcpu)
 
 static inline bool kvm_vcpu_running(struct kvm_vcpu *vcpu)
 {
-	if (is_guest_mode(vcpu))
-		kvm_check_nested_events(vcpu);
-
 	return (vcpu->arch.mp_state == KVM_MP_STATE_RUNNABLE &&
 		!vcpu->arch.apf.halted);
 }

This commit breaks delivery of a (virtualized) posted interrupt from
an L1 vCPU to a halted L2 vCPU.

Looking back at commit e6c67d8cf117 ("KVM: nVMX: Wake blocked vCPU in
guest-mode if pending interrupt in virtual APICv"), Liran wrote:

    Note that this also handles the case of nested posted-interrupt by the
    fact RVI is updated in vmx_complete_nested_posted_interrupt() which is
    called from kvm_vcpu_check_block() -> kvm_arch_vcpu_runnable() ->
    kvm_vcpu_running() -> vmx_check_nested_events() ->
    vmx_complete_nested_posted_interrupt().

Clearly, that is no longer the case.

