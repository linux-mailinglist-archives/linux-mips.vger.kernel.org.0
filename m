Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C07A114D473
	for <lists+linux-mips@lfdr.de>; Thu, 30 Jan 2020 01:10:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727328AbgA3AKq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Jan 2020 19:10:46 -0500
Received: from mga06.intel.com ([134.134.136.31]:48394 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727167AbgA3AK3 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 29 Jan 2020 19:10:29 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Jan 2020 16:10:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,379,1574150400"; 
   d="scan'208";a="261990357"
Received: from sjchrist-coffee.jf.intel.com ([10.54.74.202])
  by fmsmga002.fm.intel.com with ESMTP; 29 Jan 2020 16:10:26 -0800
From:   Sean Christopherson <sean.j.christopherson@intel.com>
To:     Paolo Bonzini <pbonzini@redhat.com>
Cc:     Paul Mackerras <paulus@ozlabs.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>, Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-mips@vger.kernel.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kvmarm@lists.cs.columbia.edu, linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] KVM: VMX: Move hardware_setup() definition below vmx_x86_ops
Date:   Wed, 29 Jan 2020 16:10:21 -0800
Message-Id: <20200130001023.24339-4-sean.j.christopherson@intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200130001023.24339-1-sean.j.christopherson@intel.com>
References: <20200130001023.24339-1-sean.j.christopherson@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Move VMX's hardware_setup() below its vmx_x86_ops definition so that a
future patch can refactor hardware_setup() to modify vmx_x86_ops
directly instead of indirectly modifying the ops via the global
kvm_x86_ops.

No functional change intended.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
---
 arch/x86/kvm/vmx/vmx.c | 328 ++++++++++++++++++++---------------------
 1 file changed, 164 insertions(+), 164 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index b7ffff90c2d7..e32d3b85ddcb 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -7565,170 +7565,6 @@ static bool vmx_apic_init_signal_blocked(struct kvm_vcpu *vcpu)
 	return to_vmx(vcpu)->nested.vmxon;
 }
 
-static __init int hardware_setup(void)
-{
-	unsigned long host_bndcfgs;
-	struct desc_ptr dt;
-	int r, i;
-
-	rdmsrl_safe(MSR_EFER, &host_efer);
-
-	store_idt(&dt);
-	host_idt_base = dt.address;
-
-	for (i = 0; i < ARRAY_SIZE(vmx_msr_index); ++i)
-		kvm_define_shared_msr(i, vmx_msr_index[i]);
-
-	if (setup_vmcs_config(&vmcs_config, &vmx_capability) < 0)
-		return -EIO;
-
-	if (boot_cpu_has(X86_FEATURE_NX))
-		kvm_enable_efer_bits(EFER_NX);
-
-	if (boot_cpu_has(X86_FEATURE_MPX)) {
-		rdmsrl(MSR_IA32_BNDCFGS, host_bndcfgs);
-		WARN_ONCE(host_bndcfgs, "KVM: BNDCFGS in host will be lost");
-	}
-
-	if (!cpu_has_vmx_vpid() || !cpu_has_vmx_invvpid() ||
-	    !(cpu_has_vmx_invvpid_single() || cpu_has_vmx_invvpid_global()))
-		enable_vpid = 0;
-
-	if (!cpu_has_vmx_ept() ||
-	    !cpu_has_vmx_ept_4levels() ||
-	    !cpu_has_vmx_ept_mt_wb() ||
-	    !cpu_has_vmx_invept_global())
-		enable_ept = 0;
-
-	if (!cpu_has_vmx_ept_ad_bits() || !enable_ept)
-		enable_ept_ad_bits = 0;
-
-	if (!cpu_has_vmx_unrestricted_guest() || !enable_ept)
-		enable_unrestricted_guest = 0;
-
-	if (!cpu_has_vmx_flexpriority())
-		flexpriority_enabled = 0;
-
-	if (!cpu_has_virtual_nmis())
-		enable_vnmi = 0;
-
-	/*
-	 * set_apic_access_page_addr() is used to reload apic access
-	 * page upon invalidation.  No need to do anything if not
-	 * using the APIC_ACCESS_ADDR VMCS field.
-	 */
-	if (!flexpriority_enabled)
-		kvm_x86_ops->set_apic_access_page_addr = NULL;
-
-	if (!cpu_has_vmx_tpr_shadow())
-		kvm_x86_ops->update_cr8_intercept = NULL;
-
-	if (enable_ept && !cpu_has_vmx_ept_2m_page())
-		kvm_disable_largepages();
-
-#if IS_ENABLED(CONFIG_HYPERV)
-	if (ms_hyperv.nested_features & HV_X64_NESTED_GUEST_MAPPING_FLUSH
-	    && enable_ept) {
-		kvm_x86_ops->tlb_remote_flush = hv_remote_flush_tlb;
-		kvm_x86_ops->tlb_remote_flush_with_range =
-				hv_remote_flush_tlb_with_range;
-	}
-#endif
-
-	if (!cpu_has_vmx_ple()) {
-		ple_gap = 0;
-		ple_window = 0;
-		ple_window_grow = 0;
-		ple_window_max = 0;
-		ple_window_shrink = 0;
-	}
-
-	if (!cpu_has_vmx_apicv()) {
-		enable_apicv = 0;
-		kvm_x86_ops->sync_pir_to_irr = NULL;
-	}
-
-	if (cpu_has_vmx_tsc_scaling()) {
-		kvm_has_tsc_control = true;
-		kvm_max_tsc_scaling_ratio = KVM_VMX_TSC_MULTIPLIER_MAX;
-		kvm_tsc_scaling_ratio_frac_bits = 48;
-	}
-
-	set_bit(0, vmx_vpid_bitmap); /* 0 is reserved for host */
-
-	if (enable_ept)
-		vmx_enable_tdp();
-	else
-		kvm_disable_tdp();
-
-	/*
-	 * Only enable PML when hardware supports PML feature, and both EPT
-	 * and EPT A/D bit features are enabled -- PML depends on them to work.
-	 */
-	if (!enable_ept || !enable_ept_ad_bits || !cpu_has_vmx_pml())
-		enable_pml = 0;
-
-	if (!enable_pml) {
-		kvm_x86_ops->slot_enable_log_dirty = NULL;
-		kvm_x86_ops->slot_disable_log_dirty = NULL;
-		kvm_x86_ops->flush_log_dirty = NULL;
-		kvm_x86_ops->enable_log_dirty_pt_masked = NULL;
-	}
-
-	if (!cpu_has_vmx_preemption_timer())
-		enable_preemption_timer = false;
-
-	if (enable_preemption_timer) {
-		u64 use_timer_freq = 5000ULL * 1000 * 1000;
-		u64 vmx_msr;
-
-		rdmsrl(MSR_IA32_VMX_MISC, vmx_msr);
-		cpu_preemption_timer_multi =
-			vmx_msr & VMX_MISC_PREEMPTION_TIMER_RATE_MASK;
-
-		if (tsc_khz)
-			use_timer_freq = (u64)tsc_khz * 1000;
-		use_timer_freq >>= cpu_preemption_timer_multi;
-
-		/*
-		 * KVM "disables" the preemption timer by setting it to its max
-		 * value.  Don't use the timer if it might cause spurious exits
-		 * at a rate faster than 0.1 Hz (of uninterrupted guest time).
-		 */
-		if (use_timer_freq > 0xffffffffu / 10)
-			enable_preemption_timer = false;
-	}
-
-	if (!enable_preemption_timer) {
-		kvm_x86_ops->set_hv_timer = NULL;
-		kvm_x86_ops->cancel_hv_timer = NULL;
-		kvm_x86_ops->request_immediate_exit = __kvm_request_immediate_exit;
-	}
-
-	kvm_set_posted_intr_wakeup_handler(wakeup_handler);
-
-	kvm_mce_cap_supported |= MCG_LMCE_P;
-
-	if (pt_mode != PT_MODE_SYSTEM && pt_mode != PT_MODE_HOST_GUEST)
-		return -EINVAL;
-	if (!enable_ept || !cpu_has_vmx_intel_pt())
-		pt_mode = PT_MODE_SYSTEM;
-
-	if (nested) {
-		nested_vmx_setup_ctls_msrs(&vmcs_config.nested,
-					   vmx_capability.ept, enable_apicv);
-
-		r = nested_vmx_hardware_setup(kvm_vmx_exit_handlers);
-		if (r)
-			return r;
-	}
-
-	r = alloc_kvm_area();
-	if (r)
-		nested_vmx_hardware_unsetup();
-	return r;
-}
-
 static __exit void hardware_unsetup(void)
 {
 	if (nested)
@@ -7895,6 +7731,170 @@ static struct kvm_x86_ops vmx_x86_ops __ro_after_init = {
 	.apic_init_signal_blocked = vmx_apic_init_signal_blocked,
 };
 
+static __init int hardware_setup(void)
+{
+	unsigned long host_bndcfgs;
+	struct desc_ptr dt;
+	int r, i;
+
+	rdmsrl_safe(MSR_EFER, &host_efer);
+
+	store_idt(&dt);
+	host_idt_base = dt.address;
+
+	for (i = 0; i < ARRAY_SIZE(vmx_msr_index); ++i)
+		kvm_define_shared_msr(i, vmx_msr_index[i]);
+
+	if (setup_vmcs_config(&vmcs_config, &vmx_capability) < 0)
+		return -EIO;
+
+	if (boot_cpu_has(X86_FEATURE_NX))
+		kvm_enable_efer_bits(EFER_NX);
+
+	if (boot_cpu_has(X86_FEATURE_MPX)) {
+		rdmsrl(MSR_IA32_BNDCFGS, host_bndcfgs);
+		WARN_ONCE(host_bndcfgs, "KVM: BNDCFGS in host will be lost");
+	}
+
+	if (!cpu_has_vmx_vpid() || !cpu_has_vmx_invvpid() ||
+	    !(cpu_has_vmx_invvpid_single() || cpu_has_vmx_invvpid_global()))
+		enable_vpid = 0;
+
+	if (!cpu_has_vmx_ept() ||
+	    !cpu_has_vmx_ept_4levels() ||
+	    !cpu_has_vmx_ept_mt_wb() ||
+	    !cpu_has_vmx_invept_global())
+		enable_ept = 0;
+
+	if (!cpu_has_vmx_ept_ad_bits() || !enable_ept)
+		enable_ept_ad_bits = 0;
+
+	if (!cpu_has_vmx_unrestricted_guest() || !enable_ept)
+		enable_unrestricted_guest = 0;
+
+	if (!cpu_has_vmx_flexpriority())
+		flexpriority_enabled = 0;
+
+	if (!cpu_has_virtual_nmis())
+		enable_vnmi = 0;
+
+	/*
+	 * set_apic_access_page_addr() is used to reload apic access
+	 * page upon invalidation.  No need to do anything if not
+	 * using the APIC_ACCESS_ADDR VMCS field.
+	 */
+	if (!flexpriority_enabled)
+		kvm_x86_ops->set_apic_access_page_addr = NULL;
+
+	if (!cpu_has_vmx_tpr_shadow())
+		kvm_x86_ops->update_cr8_intercept = NULL;
+
+	if (enable_ept && !cpu_has_vmx_ept_2m_page())
+		kvm_disable_largepages();
+
+#if IS_ENABLED(CONFIG_HYPERV)
+	if (ms_hyperv.nested_features & HV_X64_NESTED_GUEST_MAPPING_FLUSH
+	    && enable_ept) {
+		kvm_x86_ops->tlb_remote_flush = hv_remote_flush_tlb;
+		kvm_x86_ops->tlb_remote_flush_with_range =
+				hv_remote_flush_tlb_with_range;
+	}
+#endif
+
+	if (!cpu_has_vmx_ple()) {
+		ple_gap = 0;
+		ple_window = 0;
+		ple_window_grow = 0;
+		ple_window_max = 0;
+		ple_window_shrink = 0;
+	}
+
+	if (!cpu_has_vmx_apicv()) {
+		enable_apicv = 0;
+		kvm_x86_ops->sync_pir_to_irr = NULL;
+	}
+
+	if (cpu_has_vmx_tsc_scaling()) {
+		kvm_has_tsc_control = true;
+		kvm_max_tsc_scaling_ratio = KVM_VMX_TSC_MULTIPLIER_MAX;
+		kvm_tsc_scaling_ratio_frac_bits = 48;
+	}
+
+	set_bit(0, vmx_vpid_bitmap); /* 0 is reserved for host */
+
+	if (enable_ept)
+		vmx_enable_tdp();
+	else
+		kvm_disable_tdp();
+
+	/*
+	 * Only enable PML when hardware supports PML feature, and both EPT
+	 * and EPT A/D bit features are enabled -- PML depends on them to work.
+	 */
+	if (!enable_ept || !enable_ept_ad_bits || !cpu_has_vmx_pml())
+		enable_pml = 0;
+
+	if (!enable_pml) {
+		kvm_x86_ops->slot_enable_log_dirty = NULL;
+		kvm_x86_ops->slot_disable_log_dirty = NULL;
+		kvm_x86_ops->flush_log_dirty = NULL;
+		kvm_x86_ops->enable_log_dirty_pt_masked = NULL;
+	}
+
+	if (!cpu_has_vmx_preemption_timer())
+		enable_preemption_timer = false;
+
+	if (enable_preemption_timer) {
+		u64 use_timer_freq = 5000ULL * 1000 * 1000;
+		u64 vmx_msr;
+
+		rdmsrl(MSR_IA32_VMX_MISC, vmx_msr);
+		cpu_preemption_timer_multi =
+			vmx_msr & VMX_MISC_PREEMPTION_TIMER_RATE_MASK;
+
+		if (tsc_khz)
+			use_timer_freq = (u64)tsc_khz * 1000;
+		use_timer_freq >>= cpu_preemption_timer_multi;
+
+		/*
+		 * KVM "disables" the preemption timer by setting it to its max
+		 * value.  Don't use the timer if it might cause spurious exits
+		 * at a rate faster than 0.1 Hz (of uninterrupted guest time).
+		 */
+		if (use_timer_freq > 0xffffffffu / 10)
+			enable_preemption_timer = false;
+	}
+
+	if (!enable_preemption_timer) {
+		kvm_x86_ops->set_hv_timer = NULL;
+		kvm_x86_ops->cancel_hv_timer = NULL;
+		kvm_x86_ops->request_immediate_exit = __kvm_request_immediate_exit;
+	}
+
+	kvm_set_posted_intr_wakeup_handler(wakeup_handler);
+
+	kvm_mce_cap_supported |= MCG_LMCE_P;
+
+	if (pt_mode != PT_MODE_SYSTEM && pt_mode != PT_MODE_HOST_GUEST)
+		return -EINVAL;
+	if (!enable_ept || !cpu_has_vmx_intel_pt())
+		pt_mode = PT_MODE_SYSTEM;
+
+	if (nested) {
+		nested_vmx_setup_ctls_msrs(&vmcs_config.nested,
+					   vmx_capability.ept, enable_apicv);
+
+		r = nested_vmx_hardware_setup(kvm_vmx_exit_handlers);
+		if (r)
+			return r;
+	}
+
+	r = alloc_kvm_area();
+	if (r)
+		nested_vmx_hardware_unsetup();
+	return r;
+}
+
 static struct kvm_x86_init_ops vmx_init_ops __initdata = {
 	.cpu_has_kvm_support = cpu_has_kvm_support,
 	.disabled_by_bios = vmx_disabled_by_bios,
-- 
2.24.1

