Return-Path: <linux-mips+bounces-583-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E79A808D01
	for <lists+linux-mips@lfdr.de>; Thu,  7 Dec 2023 17:21:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB2D91F20F5F
	for <lists+linux-mips@lfdr.de>; Thu,  7 Dec 2023 16:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45B8C46B9E;
	Thu,  7 Dec 2023 16:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="24Qafe0j"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D047113D
	for <linux-mips@vger.kernel.org>; Thu,  7 Dec 2023 08:21:04 -0800 (PST)
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-5c5c8ef7d0dso729959a12.2
        for <linux-mips@vger.kernel.org>; Thu, 07 Dec 2023 08:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701966064; x=1702570864; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qu6FC32SBtAr1FBSSRnd4pDu4bqXXMJSa9WKDaWrJhM=;
        b=24Qafe0jBuJfND7+fl63At7I8QvGsQhvSX5Izk7ElZoBWB/H7T0E+ANENiwESV3mKl
         /pAOItZpqHPApDMyd3Vvj+ivKuCXlvXIhwTv9ABens0PLwwQRHnHtTmcMGGtHdAHOV/r
         uPiBRWNMT0gedKoNPvS8+nN2lwGvvPhywaO2wDj+6gCy4yPJxCHAkhIZZR1sM2cxAxvn
         fQRKL8ec3Um1uFJ1B5HSS7t3Jc//sdqv519+ka48JntEb5B6tkxAqVrV0lmTqsYgkml6
         F+aviiNYO9EaOqpMapr3hKaTAoy2ZZ99DA0DVM3rzc8OEMcmO86daKruIy8qIfu4dghE
         px4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701966064; x=1702570864;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qu6FC32SBtAr1FBSSRnd4pDu4bqXXMJSa9WKDaWrJhM=;
        b=Byd1Er4GKM2WvrUnhUihxFz1rz52561mca/SoK+C/CudoVgdA/gjPv03cVsVcjH9Fl
         ynroeYB8WWndbssGrlb4uvIDFUIBqgJQJkH5G3/z/PDixf0xWttt467WBb2mPrXr8HJP
         2g5YYDUtFzCN60mfV3QayC1Jc+Ee/PgG603WTVIwJJquf7VkroUWWvs5D+xMpOFEt2qd
         kCUI9SJgctiYEOqJQ5qZjs8UDBd5Ca+nG4zbdGktfEwmdrbCMQT91puNkF22TIUQVsfW
         +zmwb2OWugnc1Oe5cAvfutfLKak0N5/9B1z8OL25mpEj4SfFgVBRVYtcVu/D1xilVbwZ
         6Cog==
X-Gm-Message-State: AOJu0YxeTwLPBd3DPYqEMeROf+A2GbivN6kgSrcpeQqEahz77DVTCxbR
	7pznRIpgOWlSsbqejE5l6CXIF8PR1NY=
X-Google-Smtp-Source: AGHT+IEumjsGPB0Bwt/MbCXBoLpOMrGFmI1s+bm0EGTpUeKcWOUwZoTE5cn1fY0A411hu/l+2tMnJBrKbD0=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:e743:b0:1d0:737b:2850 with SMTP id
 p3-20020a170902e74300b001d0737b2850mr29887plf.11.1701966064312; Thu, 07 Dec
 2023 08:21:04 -0800 (PST)
Date: Thu, 7 Dec 2023 08:21:02 -0800
In-Reply-To: <20231207010302.2240506-1-jmattson@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20220921003201.1441511-11-seanjc@google.com> <20231207010302.2240506-1-jmattson@google.com>
Message-ID: <ZXHw7tykubfG04Um@google.com>
Subject: Re: [PATCH v4 10/12] KVM: x86: never write to memory from kvm_vcpu_check_block()
From: Sean Christopherson <seanjc@google.com>
To: Jim Mattson <jmattson@google.com>
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
Content-Type: text/plain; charset="us-ascii"

On Wed, Dec 06, 2023, Jim Mattson wrote:
> kvm_vcpu_check_block() is called while not in TASK_RUNNING, and therefore
> it cannot sleep.  Writing to guest memory is therefore forbidden, but it
> can happen on AMD processors if kvm_check_nested_events() causes a vmexit.
> 
> Fortunately, all events that are caught by kvm_check_nested_events() are
> also recognized by kvm_vcpu_has_events() through vendor callbacks such as
> kvm_x86_interrupt_allowed() or kvm_x86_ops.nested_ops->has_events(), so
> remove the call and postpone the actual processing to vcpu_block().
> 
> Opportunistically honor the return of kvm_check_nested_events().  KVM
> punted on the check in kvm_vcpu_running() because the only error path is
> if vmx_complete_nested_posted_interrupt() fails, in which case KVM exits
> to userspace with "internal error" i.e. the VM is likely dead anyways so
> it wasn't worth overloading the return of kvm_vcpu_running().
> 
> Add the check mostly so that KVM is consistent with itself; the return of
> the call via kvm_apic_accept_events()=>kvm_check_nested_events() that
> immediately follows  _is_ checked.
> 
> Reported-by: Maxim Levitsky <mlevitsk@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> [sean: check and handle return of kvm_check_nested_events()]
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/x86.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index dcc675d4e44b..8aeacbc2bff9 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -10815,6 +10815,17 @@ static inline int vcpu_block(struct kvm_vcpu *vcpu)
>  			return 1;
>  	}
>  
> +	/*
> +	 * Evaluate nested events before exiting the halted state.  This allows
> +	 * the halt state to be recorded properly in the VMCS12's activity
> +	 * state field (AMD does not have a similar field and a VM-Exit always
> +	 * causes a spurious wakeup from HLT).
> +	 */
> +	if (is_guest_mode(vcpu)) {
> +		if (kvm_check_nested_events(vcpu) < 0)
> +			return 0;
> +	}
> +
>  	if (kvm_apic_accept_events(vcpu) < 0)
>  		return 0;
>  	switch(vcpu->arch.mp_state) {
> @@ -10837,9 +10848,6 @@ static inline int vcpu_block(struct kvm_vcpu *vcpu)
>  
>  static inline bool kvm_vcpu_running(struct kvm_vcpu *vcpu)
>  {
> -	if (is_guest_mode(vcpu))
> -		kvm_check_nested_events(vcpu);
> -
>  	return (vcpu->arch.mp_state == KVM_MP_STATE_RUNNABLE &&
>  		!vcpu->arch.apf.halted);
>  }
> 
> This commit breaks delivery of a (virtualized) posted interrupt from
> an L1 vCPU to a halted L2 vCPU.
> 
> Looking back at commit e6c67d8cf117 ("KVM: nVMX: Wake blocked vCPU in
> guest-mode if pending interrupt in virtual APICv"), Liran wrote:
> 
>     Note that this also handles the case of nested posted-interrupt by the
>     fact RVI is updated in vmx_complete_nested_posted_interrupt() which is
>     called from kvm_vcpu_check_block() -> kvm_arch_vcpu_runnable() ->
>     kvm_vcpu_running() -> vmx_check_nested_events() ->
>     vmx_complete_nested_posted_interrupt().
> 
> Clearly, that is no longer the case.

Doh.  We got the less obvious cases and missed the obvious one.

Ugh, and we also missed a related mess in kvm_guest_apic_has_interrupt().  That
thing should really be folded into vmx_has_nested_events().

Good gravy.  And vmx_interrupt_blocked() does the wrong thing because that
specifically checks if L1 interrupts are blocked.

Compile tested only, and definitely needs to be chunked into multiple patches,
but I think something like this mess?

---
 arch/x86/include/asm/kvm-x86-ops.h |  1 -
 arch/x86/include/asm/kvm_host.h    |  1 -
 arch/x86/kvm/lapic.c               | 20 ++---------------
 arch/x86/kvm/lapic.h               | 12 ++++++++++
 arch/x86/kvm/vmx/nested.c          | 36 ++++++++++++++++++++++++++++--
 arch/x86/kvm/vmx/vmx.c             | 34 ++++++++--------------------
 arch/x86/kvm/vmx/vmx.h             |  1 +
 arch/x86/kvm/x86.c                 | 10 +--------
 8 files changed, 59 insertions(+), 56 deletions(-)

diff --git a/arch/x86/include/asm/kvm-x86-ops.h b/arch/x86/include/asm/kvm-x86-ops.h
index 378ed944b849..6f81774c1dd0 100644
--- a/arch/x86/include/asm/kvm-x86-ops.h
+++ b/arch/x86/include/asm/kvm-x86-ops.h
@@ -85,7 +85,6 @@ KVM_X86_OP_OPTIONAL(update_cr8_intercept)
 KVM_X86_OP(refresh_apicv_exec_ctrl)
 KVM_X86_OP_OPTIONAL(hwapic_irr_update)
 KVM_X86_OP_OPTIONAL(hwapic_isr_update)
-KVM_X86_OP_OPTIONAL_RET0(guest_apic_has_interrupt)
 KVM_X86_OP_OPTIONAL(load_eoi_exitmap)
 KVM_X86_OP_OPTIONAL(set_virtual_apic_mode)
 KVM_X86_OP_OPTIONAL(set_apic_access_page_addr)
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index c8c7e2475a18..fc1466035a8c 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1685,7 +1685,6 @@ struct kvm_x86_ops {
 	void (*refresh_apicv_exec_ctrl)(struct kvm_vcpu *vcpu);
 	void (*hwapic_irr_update)(struct kvm_vcpu *vcpu, int max_irr);
 	void (*hwapic_isr_update)(int isr);
-	bool (*guest_apic_has_interrupt)(struct kvm_vcpu *vcpu);
 	void (*load_eoi_exitmap)(struct kvm_vcpu *vcpu, u64 *eoi_exit_bitmap);
 	void (*set_virtual_apic_mode)(struct kvm_vcpu *vcpu);
 	void (*set_apic_access_page_addr)(struct kvm_vcpu *vcpu);
diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
index 245b20973cae..6d74c42accdf 100644
--- a/arch/x86/kvm/lapic.c
+++ b/arch/x86/kvm/lapic.c
@@ -55,7 +55,6 @@
 #define APIC_VERSION			0x14UL
 #define LAPIC_MMIO_LENGTH		(1 << 12)
 /* followed define is not in apicdef.h */
-#define MAX_APIC_VECTOR			256
 #define APIC_VECTORS_PER_REG		32
 
 static bool lapic_timer_advance_dynamic __read_mostly;
@@ -619,21 +618,6 @@ static const unsigned int apic_lvt_mask[KVM_APIC_MAX_NR_LVT_ENTRIES] = {
 	[LVT_CMCI] = LVT_MASK | APIC_MODE_MASK
 };
 
-static int find_highest_vector(void *bitmap)
-{
-	int vec;
-	u32 *reg;
-
-	for (vec = MAX_APIC_VECTOR - APIC_VECTORS_PER_REG;
-	     vec >= 0; vec -= APIC_VECTORS_PER_REG) {
-		reg = bitmap + REG_POS(vec);
-		if (*reg)
-			return __fls(*reg) + vec;
-	}
-
-	return -1;
-}
-
 static u8 count_vectors(void *bitmap)
 {
 	int vec;
@@ -697,7 +681,7 @@ EXPORT_SYMBOL_GPL(kvm_apic_update_irr);
 
 static inline int apic_search_irr(struct kvm_lapic *apic)
 {
-	return find_highest_vector(apic->regs + APIC_IRR);
+	return kvm_apic_find_highest_vector(apic->regs + APIC_IRR);
 }
 
 static inline int apic_find_highest_irr(struct kvm_lapic *apic)
@@ -775,7 +759,7 @@ static inline int apic_find_highest_isr(struct kvm_lapic *apic)
 	if (likely(apic->highest_isr_cache != -1))
 		return apic->highest_isr_cache;
 
-	result = find_highest_vector(apic->regs + APIC_ISR);
+	result = kvm_apic_find_highest_vector(apic->regs + APIC_ISR);
 	ASSERT(result == -1 || result >= 16);
 
 	return result;
diff --git a/arch/x86/kvm/lapic.h b/arch/x86/kvm/lapic.h
index 0a0ea4b5dd8c..4239bf329748 100644
--- a/arch/x86/kvm/lapic.h
+++ b/arch/x86/kvm/lapic.h
@@ -12,6 +12,8 @@
 #define KVM_APIC_INIT		0
 #define KVM_APIC_SIPI		1
 
+#define MAX_APIC_VECTOR			256
+
 #define APIC_SHORT_MASK			0xc0000
 #define APIC_DEST_NOSHORT		0x0
 #define APIC_DEST_MASK			0x800
@@ -151,6 +153,16 @@ u64 kvm_lapic_readable_reg_mask(struct kvm_lapic *apic);
 #define VEC_POS(v) ((v) & (32 - 1))
 #define REG_POS(v) (((v) >> 5) << 4)
 
+static inline int kvm_apic_find_highest_vector(unsigned long *bitmap)
+{
+	unsigned long bit = find_last_bit(bitmap, MAX_APIC_VECTOR);
+
+	if (bit == MAX_APIC_VECTOR)
+		return -1;
+
+	return bit;
+}
+
 static inline void kvm_lapic_clear_vector(int vec, void *bitmap)
 {
 	clear_bit(VEC_POS(vec), (bitmap) + REG_POS(vec));
diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 4ba46e1b29d2..28b3c1c0830f 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -3964,8 +3964,40 @@ static bool nested_vmx_preemption_timer_pending(struct kvm_vcpu *vcpu)
 
 static bool vmx_has_nested_events(struct kvm_vcpu *vcpu)
 {
-	return nested_vmx_preemption_timer_pending(vcpu) ||
-	       to_vmx(vcpu)->nested.mtf_pending;
+	struct vcpu_vmx *vmx = to_vmx(vcpu);
+	void *vapic = vmx->nested.virtual_apic_map.hva;
+	int max_irr, vppr;
+
+	if (nested_vmx_preemption_timer_pending(vcpu) ||
+	    vmx->nested.mtf_pending)
+		return true;
+
+	if (!nested_cpu_has_vid(get_vmcs12(vcpu)) ||
+	    __vmx_interrupt_blocked(vcpu))
+		return false;
+
+	if (!vapic)
+		return false;
+
+	vppr = *((u32 *)(vapic + APIC_PROCPRI));
+
+	max_irr = vmx_get_rvi();
+	if ((max_irr & 0xf0) > (vppr & 0xf0))
+		return true;
+
+	max_irr = kvm_apic_find_highest_vector(vapic + APIC_IRR);
+	if (max_irr > 0 && (max_irr & 0xf0) > (vppr & 0xf0))
+		return true;
+
+	if (vmx->nested.pi_desc && pi_test_on(vmx->nested.pi_desc)) {
+		void *pir = vmx->nested.pi_desc->pir;
+
+		max_irr = kvm_apic_find_highest_vector(pir);
+		if (max_irr > 0 && (max_irr & 0xf0) > (vppr & 0xf0))
+			return true;
+	}
+
+	return false;
 }
 
 /*
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index d30df9b3fe3e..be8ab49e9965 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -4107,26 +4107,6 @@ void pt_update_intercept_for_msr(struct kvm_vcpu *vcpu)
 	}
 }
 
-static bool vmx_guest_apic_has_interrupt(struct kvm_vcpu *vcpu)
-{
-	struct vcpu_vmx *vmx = to_vmx(vcpu);
-	void *vapic_page;
-	u32 vppr;
-	int rvi;
-
-	if (WARN_ON_ONCE(!is_guest_mode(vcpu)) ||
-		!nested_cpu_has_vid(get_vmcs12(vcpu)) ||
-		WARN_ON_ONCE(!vmx->nested.virtual_apic_map.gfn))
-		return false;
-
-	rvi = vmx_get_rvi();
-
-	vapic_page = vmx->nested.virtual_apic_map.hva;
-	vppr = *((u32 *)(vapic_page + APIC_PROCPRI));
-
-	return ((rvi & 0xf0) > (vppr & 0xf0));
-}
-
 static void vmx_msr_filter_changed(struct kvm_vcpu *vcpu)
 {
 	struct vcpu_vmx *vmx = to_vmx(vcpu);
@@ -5040,16 +5020,21 @@ static int vmx_nmi_allowed(struct kvm_vcpu *vcpu, bool for_injection)
 	return !vmx_nmi_blocked(vcpu);
 }
 
-bool vmx_interrupt_blocked(struct kvm_vcpu *vcpu)
+bool __vmx_interrupt_blocked(struct kvm_vcpu *vcpu)
 {
-	if (is_guest_mode(vcpu) && nested_exit_on_intr(vcpu))
-		return false;
-
 	return !(vmx_get_rflags(vcpu) & X86_EFLAGS_IF) ||
 	       (vmcs_read32(GUEST_INTERRUPTIBILITY_INFO) &
 		(GUEST_INTR_STATE_STI | GUEST_INTR_STATE_MOV_SS));
 }
 
+bool vmx_interrupt_blocked(struct kvm_vcpu *vcpu)
+{
+	if (is_guest_mode(vcpu) && nested_exit_on_intr(vcpu))
+		return false;
+
+	return __vmx_interrupt_blocked(vcpu);
+}
+
 static int vmx_interrupt_allowed(struct kvm_vcpu *vcpu, bool for_injection)
 {
 	if (to_vmx(vcpu)->nested.nested_run_pending)
@@ -8335,7 +8320,6 @@ static struct kvm_x86_ops vmx_x86_ops __initdata = {
 	.required_apicv_inhibits = VMX_REQUIRED_APICV_INHIBITS,
 	.hwapic_irr_update = vmx_hwapic_irr_update,
 	.hwapic_isr_update = vmx_hwapic_isr_update,
-	.guest_apic_has_interrupt = vmx_guest_apic_has_interrupt,
 	.sync_pir_to_irr = vmx_sync_pir_to_irr,
 	.deliver_interrupt = vmx_deliver_interrupt,
 	.dy_apicv_has_pending_interrupt = pi_has_pending_interrupt,
diff --git a/arch/x86/kvm/vmx/vmx.h b/arch/x86/kvm/vmx/vmx.h
index 45cee1a8bc0a..4097afed4425 100644
--- a/arch/x86/kvm/vmx/vmx.h
+++ b/arch/x86/kvm/vmx/vmx.h
@@ -400,6 +400,7 @@ u64 construct_eptp(struct kvm_vcpu *vcpu, hpa_t root_hpa, int root_level);
 bool vmx_guest_inject_ac(struct kvm_vcpu *vcpu);
 void vmx_update_exception_bitmap(struct kvm_vcpu *vcpu);
 bool vmx_nmi_blocked(struct kvm_vcpu *vcpu);
+bool __vmx_interrupt_blocked(struct kvm_vcpu *vcpu);
 bool vmx_interrupt_blocked(struct kvm_vcpu *vcpu);
 bool vmx_get_nmi_mask(struct kvm_vcpu *vcpu);
 void vmx_set_nmi_mask(struct kvm_vcpu *vcpu, bool masked);
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 1983947b8965..b9e599a4b487 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -12974,12 +12974,6 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
 		kvm_arch_free_memslot(kvm, old);
 }
 
-static inline bool kvm_guest_apic_has_interrupt(struct kvm_vcpu *vcpu)
-{
-	return (is_guest_mode(vcpu) &&
-		static_call(kvm_x86_guest_apic_has_interrupt)(vcpu));
-}
-
 static inline bool kvm_vcpu_has_events(struct kvm_vcpu *vcpu)
 {
 	if (!list_empty_careful(&vcpu->async_pf.done))
@@ -13010,9 +13004,7 @@ static inline bool kvm_vcpu_has_events(struct kvm_vcpu *vcpu)
 	if (kvm_test_request(KVM_REQ_PMI, vcpu))
 		return true;
 
-	if (kvm_arch_interrupt_allowed(vcpu) &&
-	    (kvm_cpu_has_interrupt(vcpu) ||
-	    kvm_guest_apic_has_interrupt(vcpu)))
+	if (kvm_arch_interrupt_allowed(vcpu) && kvm_cpu_has_interrupt(vcpu))
 		return true;
 
 	if (kvm_hv_has_stimer_pending(vcpu))

base-commit: 1ab097653e4dd8d23272d028a61352c23486fd4a
-- 


