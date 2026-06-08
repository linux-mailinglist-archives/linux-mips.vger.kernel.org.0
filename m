Return-Path: <linux-mips+bounces-14995-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CTWdBGHrJmqZnAIAu9opvQ
	(envelope-from <linux-mips+bounces-14995-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 18:18:41 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A43FE6589CB
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 18:18:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14995-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-14995-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 047273114BC4
	for <lists+linux-mips@lfdr.de>; Mon,  8 Jun 2026 14:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBDCB403EAD;
	Mon,  8 Jun 2026 14:43:38 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AF663F928B;
	Mon,  8 Jun 2026 14:43:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929818; cv=none; b=XwihYvvVmcRntuFF3cq0BX+OkNzTm6zBo2zSwBANohlk1CN2B4O6ELfLYKTSt4c+yi8fNUE6/zabKzg7YGhnvl67LNUPhTl21ARFofZmuME82EQT7sfSmvESaUt65THAzdT+sAdHT/f0fG77EhV0eqItqfGYjHoJmnw4bgqUSlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929818; c=relaxed/simple;
	bh=vdKUQSgIcij/8GeDfa49XGndE7o0eRdSkvdRKTXeBQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U59c7gULo0qMCE+5HQfzTZnA89E3Qhs/Vss4jQ3fnCx7DvLKU++Bq6wy1o9osFDgPalLrasXS86Ig/Y2Y7+wwB7OkkqG53Zh1qsBy5PUkhgIUU6TeDw/jpU6JBKaadYdiUf0gvKPz//ltznmoa+0tK7btfCLuGWwrLNAns2id/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 4DE0B2028DC;
	Mon,  8 Jun 2026 16:43:17 +0200 (CEST)
From: =?UTF-8?q?J=C3=B6rg=20R=C3=B6del?= <joro@8bytes.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
	ashish.kalra@amd.com,
	michael.roth@amd.com,
	nsaenz@amazon.com,
	anelkz@amazon.de,
	James.Bottomley@HansenPartnership.com,
	Melody Wang <huibo.wang@amd.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org,
	x86@kernel.org,
	coconut-svsm@lists.linux.dev,
	joerg.roedel@amd.com
Subject: [PATCH 57/60] kvm: sev: Allow for VMPL level specification in AP create
Date: Mon,  8 Jun 2026 16:42:49 +0200
Message-ID: <20260608144252.351443-58-joro@8bytes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260608144252.351443-1-joro@8bytes.org>
References: <20260608144252.351443-1-joro@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.62)[subject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[8bytes.org: no valid DMARC record];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:pbonzini@redhat.com,m:seanjc@google.com,m:thomas.lendacky@amd.com,m:ashish.kalra@amd.com,m:michael.roth@amd.com,m:nsaenz@amazon.com,m:anelkz@amazon.de,m:James.Bottomley@HansenPartnership.com,m:huibo.wang@amd.com,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kvmarm@lists.linux.dev,m:loongarch@lists.linux.dev,m:linux-mips@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm-riscv@lists.infradead.org,m:x86@kernel.org,m:coconut-svsm@lists.linux.dev,m:joerg.roedel@amd.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14995-lists,linux-mips=lfdr.de];
	FORGED_SENDER(0.00)[joro@8bytes.org,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joro@8bytes.org,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,8bytes.org:mid,8bytes.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A43FE6589CB

From: Tom Lendacky <thomas.lendacky@amd.com>

Update AP creation to support ADD/DESTROY of VMSAs at levels other than
VMPL0 in order to run under an SVSM at VMPL1 or lower. To maintain
backwards compatibility, the VMPL is specified in bits 16 to 19 of the
AP Creation request in SW_EXITINFO1 of the GHCB.

In order to track the VMSAs at different levels, create arrays for the
VMSAs, GHCBs, registered GHCBs and others. When switching VMPL levels,
these entries will be used to set the VMSA and GHCB physical addresses
in the VMCB for the VMPL level.

In order ensure that the proper responses are returned in the proper GHCB,
the GHCB must be unmapped at the current level and saved for restoration
later when switching back to that VMPL level.

Additional checks are applied to prevent a non-VMPL0 vCPU from being able
to perform an AP creation request at VMPL0. Additionally, a vCPU cannot
replace its own VMSA.

Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
Co-developed-by: Joerg Roedel <joerg.roedel@amd.com>
Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 arch/x86/include/asm/svm.h      |   9 +++
 arch/x86/include/uapi/asm/svm.h |   2 +
 arch/x86/kvm/svm/sev.c          | 134 +++++++++++++++++++++++++-------
 arch/x86/kvm/svm/svm.h          |   1 +
 arch/x86/kvm/x86.c              |   9 +++
 5 files changed, 126 insertions(+), 29 deletions(-)

diff --git a/arch/x86/include/asm/svm.h b/arch/x86/include/asm/svm.h
index 9822b0b346ae..32a35ee10bce 100644
--- a/arch/x86/include/asm/svm.h
+++ b/arch/x86/include/asm/svm.h
@@ -345,6 +345,15 @@ static_assert((X2AVIC_4K_MAX_PHYSICAL_ID & AVIC_PHYSICAL_MAX_INDEX_MASK) == X2AV
 
 #define VMCB_ALLOWED_SEV_FEATURES_VALID			BIT_ULL(63)
 
+enum {
+	SVM_SEV_VMPL0 = 0,
+	SVM_SEV_VMPL1,
+	SVM_SEV_VMPL2,
+	SVM_SEV_VMPL3,
+
+	SVM_SEV_VMPL_MAX
+};
+
 struct vmcb_seg {
 	u16 selector;
 	u16 attrib;
diff --git a/arch/x86/include/uapi/asm/svm.h b/arch/x86/include/uapi/asm/svm.h
index 91395b82eadd..60b7a52f6f7e 100644
--- a/arch/x86/include/uapi/asm/svm.h
+++ b/arch/x86/include/uapi/asm/svm.h
@@ -123,6 +123,8 @@
 #define SVM_VMGEXIT_HVDB_QUERY			2
 #define SVM_VMGEXIT_HVDB_CLEAR			3
 #define SVM_VMGEXIT_HV_IPI                      0x80000015ull
+#define SVM_VMGEXIT_AP_VMPL_MASK		GENMASK(19, 16)
+#define SVM_VMGEXIT_AP_VMPL_SHIFT		16
 #define SVM_VMGEXIT_GET_APIC_IDS		0x80000017ull
 #define SVM_VMGEXIT_SNP_RUN_VMPL		0x80000018ull
 #define SVM_VMGEXIT_SAVIC			0x8000001aull
diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index c0b2879f8e9f..53cd3aba7368 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -3512,13 +3512,19 @@ static int sev_es_validate_vmgexit(struct vcpu_svm *svm)
 		if (!kvm_ghcb_sw_scratch_is_valid(svm))
 			goto vmgexit_err;
 		break;
-	case SVM_VMGEXIT_AP_CREATION:
+	case SVM_VMGEXIT_AP_CREATION: {
+		unsigned int request;
+
 		if (!is_sev_snp_guest(vcpu))
 			goto vmgexit_err;
-		if (lower_32_bits(control->exit_info_1) != SVM_VMGEXIT_AP_DESTROY)
+
+		request = lower_32_bits(control->exit_info_1);
+		request &= ~SVM_VMGEXIT_AP_VMPL_MASK;
+		if (request != SVM_VMGEXIT_AP_DESTROY)
 			if (!kvm_ghcb_rax_is_valid(svm))
 				goto vmgexit_err;
 		break;
+	}
 	case SVM_VMGEXIT_GET_APIC_IDS:
 		if (!kvm_ghcb_rax_is_valid(svm))
 			goto vmgexit_err;
@@ -4151,8 +4157,26 @@ static void sev_snp_init_protected_guest_state(struct kvm_vcpu *vcpu)
 	/* Use the new VMSA */
 	svm->vmcb->control.vmsa_pa = pfn_to_hpa(pfn);
 
+	/*
+	 * The vCPU may not have gone through the LAUNCH_UPDATE process, so mark
+	 * the guest state as protected.
+	 */
+	vcpu->arch.guest_state_protected = true;
+
+	/*
+	 * SEV-ES guest mandates LBR Virtualization to be _always_ ON. Enable it
+	 * only after setting guest_state_protected because KVM_SET_MSRS allows
+	 * dynamic toggling of LBRV (for performance reason) on write access to
+	 * MSR_IA32_DEBUGCTLMSR when guest_state_protected is not set.
+	 */
+	svm_enable_lbrv(vcpu);
+
 	/* Mark the vCPU as runnable */
-	kvm_set_mp_state(vcpu, KVM_MP_STATE_RUNNABLE);
+	if (svm->sev_es.snp_ap_runnable) {
+		kvm_set_mp_state(vcpu, KVM_MP_STATE_RUNNABLE);
+	} else {
+		kvm_set_mp_state(vcpu, KVM_MP_STATE_UNINITIALIZED);
+	}
 
 	/*
 	 * gmem pages aren't currently migratable, but if this ever changes
@@ -4162,36 +4186,87 @@ static void sev_snp_init_protected_guest_state(struct kvm_vcpu *vcpu)
 	kvm_release_page_clean(page);
 }
 
-static int sev_snp_ap_creation(struct vcpu_svm *svm)
+static unsigned int get_ap_creation_request(struct vcpu_svm *svm)
 {
-	struct kvm_sev_info_plane *sev_plane = to_kvm_sev_info_plane(svm->vcpu.plane);
-	struct kvm_vcpu *vcpu = &svm->vcpu;
-	struct kvm_vcpu *target_vcpu;
-	struct vcpu_svm *target_svm;
-	unsigned int request;
+//	struct kvm_sev_info_plane *sev_plane = to_kvm_sev_info_plane(svm->vcpu.plane);
+//	struct kvm_vcpu *vcpu = &svm->vcpu;
+	unsigned int req = lower_32_bits(svm->vmcb->control.exit_info_1);
+
+	return req & ~SVM_VMGEXIT_AP_VMPL_MASK;
+}
+
+static unsigned int get_ap_creation_vmpl(struct vcpu_svm *svm)
+{
+	unsigned int req = lower_32_bits(svm->vmcb->control.exit_info_1);
+
+	return (req & SVM_VMGEXIT_AP_VMPL_MASK) >> SVM_VMGEXIT_AP_VMPL_SHIFT;
+}
+
+static unsigned int get_ap_creation_apic_id(struct vcpu_svm *svm)
+{
+	return upper_32_bits(svm->vmcb->control.exit_info_1);
+}
+
+#define SVM_SEV_VMPL_MAX	4
+
+static int sev_snp_ap_creation(struct kvm_vcpu *vcpu)
+{
+	struct vcpu_svm *target_svm = NULL, *svm = to_svm(vcpu);
+	struct kvm_sev_info_plane *target_sev_plane = NULL;
+	struct kvm_plane *target_plane = NULL;
+	struct kvm_vcpu *target_vcpu = NULL;
 	unsigned int apic_id;
+	unsigned int request;
+	unsigned int vmpl;
 
-	request = lower_32_bits(svm->vmcb->control.exit_info_1);
-	apic_id = upper_32_bits(svm->vmcb->control.exit_info_1);
+	request = get_ap_creation_request(svm);
+	apic_id = get_ap_creation_apic_id(svm);
+	vmpl = get_ap_creation_vmpl(svm);
 
-	/* Validate the APIC ID */
-	target_vcpu = kvm_get_vcpu_by_id(vcpu->kvm, apic_id);
-	if (!target_vcpu) {
-		vcpu_unimpl(vcpu, "vmgexit: invalid AP APIC ID [%#x] from guest\n",
-			    apic_id);
+	/* Validate the requested VMPL level */
+	if (vmpl >= SVM_SEV_VMPL_MAX) {
+		vcpu_unimpl(vcpu, "vmgexit: invalid VMPL level [%u] from guest\n",
+			    vmpl);
 		return -EINVAL;
 	}
+	vmpl = array_index_nospec(vmpl, SVM_SEV_VMPL_MAX);
+
+	/* Obtain the target plane and vCPU */
+	target_plane = vcpu->kvm->planes[vmpl];
+	if (target_plane) {
+		target_vcpu = plane_get_vcpu(target_plane, apic_id);
+	} else {
+		target_vcpu = NULL;
+	}
+
+	/* Request user-space to create target plane VCPU if it does not exist */
+	if (!target_plane || !target_vcpu) {
+		vcpu->arch.complete_userspace_io = sev_snp_ap_creation;
+		return kvm_request_create_plane(vcpu, vmpl, apic_id);
+	}
 
 	target_svm = to_svm(target_vcpu);
+	target_sev_plane = &to_kvm_svm_plane(target_svm->vcpu.plane)->sev_info_plane;
 
 	guard(mutex)(&target_svm->sev_es.snp_vmsa_mutex);
 
+	/* VMPL0 can only be replaced by another vCPU running VMPL0 */
+	if (vmpl == SVM_SEV_VMPL0 &&
+	    (vcpu == target_vcpu || vcpu->plane_level != SVM_SEV_VMPL0)) {
+		vcpu_unimpl(vcpu, "vmgexit: VMPL0 AP action not allowed\n");
+		return -EINVAL;
+	}
+
 	switch (request) {
 	case SVM_VMGEXIT_AP_CREATE_ON_INIT:
 	case SVM_VMGEXIT_AP_CREATE:
-		if (vcpu->arch.regs[VCPU_REGS_RAX] != sev_plane->vmsa_features) {
+		/* Initialize target planes SEV features if necessary */
+		if (target_sev_plane->vmsa_features == 0)
+			target_sev_plane->vmsa_features = vcpu->arch.regs[VCPU_REGS_RAX];
+
+		if (vcpu->arch.regs[VCPU_REGS_RAX] != target_sev_plane->vmsa_features) {
 			vcpu_unimpl(vcpu, "vmgexit: mismatched AP sev_features [%#lx] != [%#llx] from guest\n",
-				    vcpu->arch.regs[VCPU_REGS_RAX], sev_plane->vmsa_features);
+				    vcpu->arch.regs[VCPU_REGS_RAX], target_sev_plane->vmsa_features);
 			return -EINVAL;
 		}
 
@@ -4226,16 +4301,18 @@ static int sev_snp_ap_creation(struct vcpu_svm *svm)
 		return -EINVAL;
 	}
 
+	/* Signal the vCPU to update its state */
+	kvm_make_request(KVM_REQ_UPDATE_PROTECTED_GUEST_STATE, target_vcpu);
+
 	target_svm->sev_es.snp_ap_waiting_for_reset = true;
+	target_svm->sev_es.snp_ap_runnable = (request == SVM_VMGEXIT_AP_CREATE);
 
-	/*
-	 * Unless Creation is deferred until INIT, signal the vCPU to update
-	 * its state.
-	 */
-	if (request != SVM_VMGEXIT_AP_CREATE_ON_INIT)
-		kvm_make_request_and_kick(KVM_REQ_UPDATE_PROTECTED_GUEST_STATE, target_vcpu);
+	if (request == SVM_VMGEXIT_AP_CREATE)
+		kvm_make_request(KVM_REQ_PLANE_RESCHED, target_vcpu);
 
-	return 0;
+	kvm_vcpu_kick(target_vcpu);
+
+	return 1;
 }
 
 static int snp_handle_guest_req(struct vcpu_svm *svm, gpa_t req_gpa, gpa_t resp_gpa)
@@ -4779,12 +4856,11 @@ int sev_handle_vmgexit(struct kvm_vcpu *vcpu)
 		ret = snp_begin_psc(svm);
 		break;
 	case SVM_VMGEXIT_AP_CREATION:
-		ret = sev_snp_ap_creation(svm);
-		if (ret) {
+		ret = sev_snp_ap_creation(vcpu);
+		if (ret < 0) {
 			svm_vmgexit_bad_input(svm, GHCB_ERR_INVALID_INPUT);
+			ret = 1;
 		}
-
-		ret = 1;
 		break;
 	case SVM_VMGEXIT_GUEST_REQUEST:
 		ret = snp_handle_guest_req(svm, control->exit_info_1, control->exit_info_2);
diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index 57033922ddcf..7e860f2abafb 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -282,6 +282,7 @@ struct vcpu_sev_es_state {
 
 	struct mutex snp_vmsa_mutex; /* Used to handle concurrent updates of VMSA. */
 	gpa_t snp_vmsa_gpa;
+	bool snp_ap_runnable;
 	bool snp_ap_waiting_for_reset;
 	bool snp_has_guest_vmsa;
 
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 0b9fa1059481..ad05350bb393 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -12165,6 +12165,15 @@ static int __kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 		kvm_vcpu_block(vcpu);
 		kvm_vcpu_srcu_read_lock(vcpu);
 
+		/*
+		 * It is possible that the vCPU has never run before. If the
+		 * request is to update the protected guest state (AP Create),
+		 * then ensure that the vCPU can now run.
+		 */
+		if (kvm_test_request(KVM_REQ_UPDATE_PROTECTED_GUEST_STATE, vcpu) &&
+		    vcpu->arch.mp_state == KVM_MP_STATE_UNINITIALIZED)
+			vcpu->arch.mp_state = KVM_MP_STATE_RUNNABLE;
+
 		if (kvm_apic_accept_events(vcpu) < 0) {
 			r = 0;
 			goto out;
-- 
2.53.0


