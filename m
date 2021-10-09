Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7ACF4275E4
	for <lists+linux-mips@lfdr.de>; Sat,  9 Oct 2021 04:13:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244375AbhJICP0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 Oct 2021 22:15:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244377AbhJICPM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 8 Oct 2021 22:15:12 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 512EAC061777
        for <linux-mips@vger.kernel.org>; Fri,  8 Oct 2021 19:13:12 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 81-20020a251254000000b005b6220d81efso14970688ybs.12
        for <linux-mips@vger.kernel.org>; Fri, 08 Oct 2021 19:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=mx/LClvEah9U/ujSRD+kU2QZC8VI4YcZ2y85zUuGTJg=;
        b=NMczBrFGG+ZqD7XEJJZ0zVbsooqsKx7UCDFGdMakqEpsjihKxjQp1x7rBosSZj6oy3
         ZJbqFgmvbwEN8b/asiLsOJ45um4feisiVzJqUdRa700dyb3I3gjiNRJYHmFXs8fELHpz
         KZaubfYaFQk/NJUpMGGU5LErf+qMcFSnPhlW+wd6SSzyqBJvHECi4FXpwxESoAqsPGvw
         wfWtQWmiPSvw7zrFTRzKuuITt8jRt1JtmEbQqNMhufsJW14OMSbwxnzqQ/pLUX5m6wke
         +DtTEbAYwmAztWnXM1bPsj7c9e5t3FnTb6fZ0MBiecuAVVKjMgiuobo4/lrvrTPsEZLf
         R+sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=mx/LClvEah9U/ujSRD+kU2QZC8VI4YcZ2y85zUuGTJg=;
        b=8Pso8pV8Q/HWR7cAEKq8jCQTimwncC07yYsks9B48FKeJF1WclOglh9b9NAD5KCKxn
         eaATcyTin319ityspjC0Pd9pmMFtl+8ntP2vrEA/IRzO/QwzPeCghOTnmvtKyDdUH/Vv
         +zSfGFqySW49Ptm/wDpKTn5HDYvgCbPYPFGA9jOGO1sLFQBkHBCUbbY/JmKqzCcoTVO0
         vb/0ymb/OKLyHJ1bt7HmoID89e/izmiV3He2YFF6f38J0Zzx0zwA0sg1JQIBV8Co/u4K
         /myx83WjL/23q3PGCbqG8ZcZ1tS6b9eRSCEGS5tJ5/vF956ggWW7R0Y9b7iu5xlLcocB
         gEqA==
X-Gm-Message-State: AOAM532RoMVompUs2p6CJ03JrDndPLLzT9DmjaLyIrKFWjZWUgNbq5A8
        +Vz0L0BXr+BSZIdPBytJI6HxM7MlBhA=
X-Google-Smtp-Source: ABdhPJxejCbihGBgy3LVPfOgjAc3dy8xh0iCSgNtnKJhEvr9JNPLSKIyX+Ts6QvnlifutcHJPzG1e+Du0lg=
X-Received: from seanjc798194.pdx.corp.google.com ([2620:15c:90:200:e39b:6333:b001:cb])
 (user=seanjc job=sendgmr) by 2002:a25:bb08:: with SMTP id z8mr7478243ybg.306.1633745591524;
 Fri, 08 Oct 2021 19:13:11 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date:   Fri,  8 Oct 2021 19:12:05 -0700
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
Message-Id: <20211009021236.4122790-13-seanjc@google.com>
Mime-Version: 1.0
References: <20211009021236.4122790-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 12/43] KVM: x86: Tweak halt emulation helper names to free
 up kvm_vcpu_halt()
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
        David Matlack <dmatlack@google.com>,
        Oliver Upton <oupton@google.com>,
        Jing Zhang <jingzhangos@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Rename a variety of HLT-related helpers to free up the function name
"kvm_vcpu_halt" for future use in generic KVM code, e.g. to differentiate
between "block" and "halt".

No functional change intended.

Reviewed-by: David Matlack <dmatlack@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h |  2 +-
 arch/x86/kvm/vmx/nested.c       |  2 +-
 arch/x86/kvm/vmx/vmx.c          |  4 ++--
 arch/x86/kvm/x86.c              | 13 +++++++------
 4 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 7aafc27ce7a9..328103a520d3 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1689,7 +1689,7 @@ int kvm_emulate_monitor(struct kvm_vcpu *vcpu);
 int kvm_fast_pio(struct kvm_vcpu *vcpu, int size, unsigned short port, int in);
 int kvm_emulate_cpuid(struct kvm_vcpu *vcpu);
 int kvm_emulate_halt(struct kvm_vcpu *vcpu);
-int kvm_vcpu_halt(struct kvm_vcpu *vcpu);
+int kvm_emulate_halt_noskip(struct kvm_vcpu *vcpu);
 int kvm_emulate_ap_reset_hold(struct kvm_vcpu *vcpu);
 int kvm_emulate_wbinvd(struct kvm_vcpu *vcpu);
 
diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index af1bbb73430a..d0237a441feb 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -3619,7 +3619,7 @@ static int nested_vmx_run(struct kvm_vcpu *vcpu, bool launch)
 		    !(nested_cpu_has(vmcs12, CPU_BASED_INTR_WINDOW_EXITING) &&
 		      (vmcs12->guest_rflags & X86_EFLAGS_IF))) {
 			vmx->nested.nested_run_pending = 0;
-			return kvm_vcpu_halt(vcpu);
+			return kvm_emulate_halt_noskip(vcpu);
 		}
 		break;
 	case GUEST_ACTIVITY_WAIT_SIPI:
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 1c8b2b6e7ed9..5517893f12fc 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -4741,7 +4741,7 @@ static int handle_rmode_exception(struct kvm_vcpu *vcpu,
 		if (kvm_emulate_instruction(vcpu, 0)) {
 			if (vcpu->arch.halt_request) {
 				vcpu->arch.halt_request = 0;
-				return kvm_vcpu_halt(vcpu);
+				return kvm_emulate_halt_noskip(vcpu);
 			}
 			return 1;
 		}
@@ -5415,7 +5415,7 @@ static int handle_invalid_guest_state(struct kvm_vcpu *vcpu)
 
 		if (vcpu->arch.halt_request) {
 			vcpu->arch.halt_request = 0;
-			return kvm_vcpu_halt(vcpu);
+			return kvm_emulate_halt_noskip(vcpu);
 		}
 
 		/*
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 4a52a08707de..9c23ae1d483d 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -8649,7 +8649,7 @@ void kvm_arch_exit(void)
 #endif
 }
 
-static int __kvm_vcpu_halt(struct kvm_vcpu *vcpu, int state, int reason)
+static int __kvm_emulate_halt(struct kvm_vcpu *vcpu, int state, int reason)
 {
 	++vcpu->stat.halt_exits;
 	if (lapic_in_kernel(vcpu)) {
@@ -8661,11 +8661,11 @@ static int __kvm_vcpu_halt(struct kvm_vcpu *vcpu, int state, int reason)
 	}
 }
 
-int kvm_vcpu_halt(struct kvm_vcpu *vcpu)
+int kvm_emulate_halt_noskip(struct kvm_vcpu *vcpu)
 {
-	return __kvm_vcpu_halt(vcpu, KVM_MP_STATE_HALTED, KVM_EXIT_HLT);
+	return __kvm_emulate_halt(vcpu, KVM_MP_STATE_HALTED, KVM_EXIT_HLT);
 }
-EXPORT_SYMBOL_GPL(kvm_vcpu_halt);
+EXPORT_SYMBOL_GPL(kvm_emulate_halt_noskip);
 
 int kvm_emulate_halt(struct kvm_vcpu *vcpu)
 {
@@ -8674,7 +8674,7 @@ int kvm_emulate_halt(struct kvm_vcpu *vcpu)
 	 * TODO: we might be squashing a GUESTDBG_SINGLESTEP-triggered
 	 * KVM_EXIT_DEBUG here.
 	 */
-	return kvm_vcpu_halt(vcpu) && ret;
+	return kvm_emulate_halt_noskip(vcpu) && ret;
 }
 EXPORT_SYMBOL_GPL(kvm_emulate_halt);
 
@@ -8682,7 +8682,8 @@ int kvm_emulate_ap_reset_hold(struct kvm_vcpu *vcpu)
 {
 	int ret = kvm_skip_emulated_instruction(vcpu);
 
-	return __kvm_vcpu_halt(vcpu, KVM_MP_STATE_AP_RESET_HOLD, KVM_EXIT_AP_RESET_HOLD) && ret;
+	return __kvm_emulate_halt(vcpu, KVM_MP_STATE_AP_RESET_HOLD,
+					KVM_EXIT_AP_RESET_HOLD) && ret;
 }
 EXPORT_SYMBOL_GPL(kvm_emulate_ap_reset_hold);
 
-- 
2.33.0.882.g93a45727a2-goog

