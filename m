Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1A4B27640C
	for <lists+linux-mips@lfdr.de>; Thu, 24 Sep 2020 00:45:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726764AbgIWWpj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 23 Sep 2020 18:45:39 -0400
Received: from mga02.intel.com ([134.134.136.20]:41185 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726696AbgIWWpe (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 23 Sep 2020 18:45:34 -0400
IronPort-SDR: rd4dRM8i0Op1CTJECvVk73v+o5m1aHDNTpQl4LenNGJnEOREkknCzkHQ5bN/ptl1k8aq6wt2Qu
 Rrpv8fL5EbFg==
X-IronPort-AV: E=McAfee;i="6000,8403,9753"; a="148698570"
X-IronPort-AV: E=Sophos;i="5.77,295,1596524400"; 
   d="scan'208";a="148698570"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2020 15:45:33 -0700
IronPort-SDR: Fr2JxZMxsomuX02zVQNCadcnQn8OG4+lUnDKf9BKljc31q3oeEAJran7O1u3QsqFtB5ZxEhbOZ
 XohwXf3KsMRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,295,1596524400"; 
   d="scan'208";a="335660071"
Received: from sjchrist-coffee.jf.intel.com ([10.54.74.160])
  by fmsmga004.fm.intel.com with ESMTP; 23 Sep 2020 15:45:33 -0700
From:   Sean Christopherson <sean.j.christopherson@intel.com>
To:     Paolo Bonzini <pbonzini@redhat.com>
Cc:     Sean Christopherson <sean.j.christopherson@intel.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        Huacai Chen <chenhc@lemote.com>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        linux-mips@vger.kernel.org, Paul Mackerras <paulus@ozlabs.org>,
        kvm-ppc@vger.kernel.org,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>
Subject: [RFC PATCH 3/3] KVM: x86: Use KVM_BUG/KVM_BUG_ON to handle bugs that are fatal to the VM
Date:   Wed, 23 Sep 2020 15:45:30 -0700
Message-Id: <20200923224530.17735-4-sean.j.christopherson@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200923224530.17735-1-sean.j.christopherson@intel.com>
References: <20200923224530.17735-1-sean.j.christopherson@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add support for KVM_REQ_VM_BUGG in x86, and replace a variety of WARNs
with KVM_BUG() and KVM_BUG_ON().  Return -EIO if a KVM_BUG is hit to
align with the common KVM behavior of rejecting iocts() with -EIO if the
VM is bugged.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
---
 arch/x86/kvm/svm/svm.c |  2 +-
 arch/x86/kvm/vmx/vmx.c | 23 ++++++++++++++---------
 arch/x86/kvm/x86.c     |  4 ++++
 3 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 3da5b2f1b4a1..e684794c6249 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -1380,7 +1380,7 @@ static void svm_cache_reg(struct kvm_vcpu *vcpu, enum kvm_reg reg)
 		load_pdptrs(vcpu, vcpu->arch.walk_mmu, kvm_read_cr3(vcpu));
 		break;
 	default:
-		WARN_ON_ONCE(1);
+		KVM_BUG_ON(1, vcpu->kvm);
 	}
 }
 
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 6f9a0c6d5dc5..810d46ab0a47 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -2250,7 +2250,7 @@ static void vmx_cache_reg(struct kvm_vcpu *vcpu, enum kvm_reg reg)
 		vcpu->arch.cr4 |= vmcs_readl(GUEST_CR4) & guest_owned_bits;
 		break;
 	default:
-		WARN_ON_ONCE(1);
+		KVM_BUG_ON(1, vcpu->kvm);
 		break;
 	}
 }
@@ -4960,6 +4960,7 @@ static int handle_cr(struct kvm_vcpu *vcpu)
 			return kvm_complete_insn_gp(vcpu, err);
 		case 3:
 			WARN_ON_ONCE(enable_unrestricted_guest);
+
 			err = kvm_set_cr3(vcpu, val);
 			return kvm_complete_insn_gp(vcpu, err);
 		case 4:
@@ -4985,14 +4986,13 @@ static int handle_cr(struct kvm_vcpu *vcpu)
 		}
 		break;
 	case 2: /* clts */
-		WARN_ONCE(1, "Guest should always own CR0.TS");
-		vmx_set_cr0(vcpu, kvm_read_cr0_bits(vcpu, ~X86_CR0_TS));
-		trace_kvm_cr_write(0, kvm_read_cr0(vcpu));
-		return kvm_skip_emulated_instruction(vcpu);
+		KVM_BUG(1, vcpu->kvm, "Guest always owns CR0.TS");
+		return -EIO;
 	case 1: /*mov from cr*/
 		switch (cr) {
 		case 3:
 			WARN_ON_ONCE(enable_unrestricted_guest);
+
 			val = kvm_read_cr3(vcpu);
 			kvm_register_write(vcpu, reg, val);
 			trace_kvm_cr_read(cr, val);
@@ -5330,7 +5330,9 @@ static int handle_ept_misconfig(struct kvm_vcpu *vcpu)
 
 static int handle_nmi_window(struct kvm_vcpu *vcpu)
 {
-	WARN_ON_ONCE(!enable_vnmi);
+	if (KVM_BUG_ON(!enable_vnmi, vcpu->kvm))
+		return -EIO;
+
 	exec_controls_clearbit(to_vmx(vcpu), CPU_BASED_NMI_WINDOW_EXITING);
 	++vcpu->stat.nmi_window_exits;
 	kvm_make_request(KVM_REQ_EVENT, vcpu);
@@ -5908,7 +5910,8 @@ static int vmx_handle_exit(struct kvm_vcpu *vcpu, fastpath_t exit_fastpath)
 	 * below) should never happen as that means we incorrectly allowed a
 	 * nested VM-Enter with an invalid vmcs12.
 	 */
-	WARN_ON_ONCE(vmx->nested.nested_run_pending);
+	if (KVM_BUG_ON(vmx->nested.nested_run_pending, vcpu->kvm))
+		return -EIO;
 
 	/* If guest state is invalid, start emulating */
 	if (vmx->emulation_required)
@@ -6258,7 +6261,9 @@ static int vmx_sync_pir_to_irr(struct kvm_vcpu *vcpu)
 	int max_irr;
 	bool max_irr_updated;
 
-	WARN_ON(!vcpu->arch.apicv_active);
+	if (KVM_BUG_ON(!vcpu->arch.apicv_active, vcpu->kvm))
+		return -EIO;
+
 	if (pi_test_on(&vmx->pi_desc)) {
 		pi_clear_on(&vmx->pi_desc);
 		/*
@@ -6345,7 +6350,7 @@ static void handle_external_interrupt_irqoff(struct kvm_vcpu *vcpu)
 	gate_desc *desc;
 	u32 intr_info = vmx_get_intr_info(vcpu);
 
-	if (WARN_ONCE(!is_external_intr(intr_info),
+	if (KVM_BUG(!is_external_intr(intr_info), vcpu->kvm,
 	    "KVM: unexpected VM-Exit interrupt info: 0x%x", intr_info))
 		return;
 
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 17f4995e80a7..672eb5142b34 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -8363,6 +8363,10 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
 	bool req_immediate_exit = false;
 
 	if (kvm_request_pending(vcpu)) {
+		if (kvm_check_request(KVM_REQ_VM_BUGGED, vcpu)) {
+			r = -EIO;
+			goto out;
+		}
 		if (kvm_check_request(KVM_REQ_GET_VMCS12_PAGES, vcpu)) {
 			if (unlikely(!kvm_x86_ops.nested_ops->get_vmcs12_pages(vcpu))) {
 				r = 0;
-- 
2.28.0

