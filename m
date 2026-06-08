Return-Path: <linux-mips+bounces-14993-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jG+sNOLbJmrQlwIAu9opvQ
	(envelope-from <linux-mips+bounces-14993-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 17:12:34 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD69657E1C
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 17:12:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14993-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-mips+bounces-14993-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4AC83308058E
	for <lists+linux-mips@lfdr.de>; Mon,  8 Jun 2026 14:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E5604028D0;
	Mon,  8 Jun 2026 14:43:38 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CFEF3F8EC6;
	Mon,  8 Jun 2026 14:43:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929817; cv=none; b=AkhwrqNTqXk5Qo9AgbmLObcuplePkeiYb0ypxHjOhISMQQ5rapZwFulKDFmLPrhd5T2Tft48y2KBgxPBTnnwBT9wLo1tSWqJ+yIMpXONjkZbQ0yAhuhtouyjETgLoggTOcLzAsnwO1VmTfdi/vSdDqo6hnhDzxKnRSmy6P1u92g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929817; c=relaxed/simple;
	bh=GBx/OmMVk+k2F/nFdgcILi6GEL5fCzCIBxKISaYFHGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FC2PhU7NiM7+cAcbOd82sKzyvUsU/hDVwdzOAK1PFeR9BpEShActD4S8o8syG69ZKyBf+qbQR5frfQtpYemSpJ8Lzs/czWtuydUoKqL9N8VlzGcZbIW/In9Hbqyf0mo5sFnWnJPMIExh9HdmE5XJoT/oHUWmMO08+jJ7bmqO19k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id D88B92028DA;
	Mon,  8 Jun 2026 16:43:16 +0200 (CEST)
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
Subject: [PATCH 55/60] kvm: svm: Track vmsa_features per plane
Date: Mon,  8 Jun 2026 16:42:47 +0200
Message-ID: <20260608144252.351443-56-joro@8bytes.org>
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
X-Spamd-Result: default: False [0.87 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.83)[subject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[lists@lfdr.de];
	DMARC_NA(0.00)[8bytes.org: no valid DMARC record];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pbonzini@redhat.com,m:seanjc@google.com,m:thomas.lendacky@amd.com,m:ashish.kalra@amd.com,m:michael.roth@amd.com,m:nsaenz@amazon.com,m:anelkz@amazon.de,m:James.Bottomley@HansenPartnership.com,m:huibo.wang@amd.com,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kvmarm@lists.linux.dev,m:loongarch@lists.linux.dev,m:linux-mips@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm-riscv@lists.infradead.org,m:x86@kernel.org,m:coconut-svsm@lists.linux.dev,m:joerg.roedel@amd.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-14993-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[joro@8bytes.org,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joro@8bytes.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6AD69657E1C

From: Joerg Roedel <joerg.roedel@amd.com>

Planes can have different set of SEV features enabled. Track the
enabled features per plane instead of per VM.

Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 arch/x86/kvm/svm/sev.c | 37 ++++++++++++++++++++-----------------
 arch/x86/kvm/svm/svm.c | 21 +++++++++++++++++++--
 arch/x86/kvm/svm/svm.h | 24 +++++++++++++++++++++---
 3 files changed, 60 insertions(+), 22 deletions(-)

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index a23dcb081751..12b039823c1c 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -204,17 +204,16 @@ static inline bool is_mirroring_enc_context(struct kvm *kvm)
 
 static bool sev_vcpu_has_debug_swap(struct vcpu_svm *svm)
 {
-	struct kvm_vcpu *vcpu = &svm->vcpu;
-	struct kvm_sev_info *sev = to_kvm_sev_info(vcpu->kvm);
+	struct kvm_sev_info_plane *sev_plane = to_kvm_sev_info_plane(svm->vcpu.plane);
 
-	return sev->vmsa_features & SVM_SEV_FEAT_DEBUG_SWAP;
+	return sev_plane->vmsa_features & SVM_SEV_FEAT_DEBUG_SWAP;
 }
 
 static bool snp_is_secure_tsc_enabled(struct kvm *kvm)
 {
-	struct kvm_sev_info *sev = to_kvm_sev_info(kvm);
+	struct kvm_sev_info_plane *sev_plane = to_kvm_sev_info_plane(kvm->planes[0]);
 
-	return (sev->vmsa_features & SVM_SEV_FEAT_SECURE_TSC) &&
+	return (sev_plane->vmsa_features & SVM_SEV_FEAT_SECURE_TSC) &&
 	       !WARN_ON_ONCE(!sev_snp_guest(kvm));
 }
 
@@ -496,6 +495,7 @@ static int __sev_guest_init(struct kvm *kvm, struct kvm_sev_cmd *argp,
 			    struct kvm_sev_init *data,
 			    unsigned long vm_type)
 {
+	struct kvm_sev_info_plane *sev_plane = to_kvm_sev_info_plane(kvm->planes[0]);
 	struct kvm_sev_info *sev = to_kvm_sev_info(kvm);
 	struct sev_platform_init_args init_args = {0};
 	bool es_active = vm_type != KVM_X86_SEV_VM;
@@ -534,11 +534,11 @@ static int __sev_guest_init(struct kvm *kvm, struct kvm_sev_cmd *argp,
 
 	sev->active = true;
 	sev->es_active = es_active;
-	sev->vmsa_features = data->vmsa_features;
+	sev_plane->vmsa_features = data->vmsa_features;
 	sev->ghcb_version = data->ghcb_version;
 
 	if (snp_active)
-		sev->vmsa_features |= SVM_SEV_FEAT_SNP_ACTIVE;
+		sev_plane->vmsa_features |= SVM_SEV_FEAT_SNP_ACTIVE;
 
 	ret = sev_asid_new(sev, vm_type);
 	if (ret)
@@ -576,7 +576,7 @@ static int __sev_guest_init(struct kvm *kvm, struct kvm_sev_cmd *argp,
 	sev_asid_free(sev);
 	sev->asid = 0;
 e_no_asid:
-	sev->vmsa_features = 0;
+	sev_plane->vmsa_features = 0;
 	sev->es_active = false;
 	sev->active = false;
 	return ret;
@@ -931,7 +931,7 @@ static int sev_launch_update_data(struct kvm *kvm, struct kvm_sev_cmd *argp)
 static int sev_es_sync_vmsa(struct vcpu_svm *svm)
 {
 	struct kvm_vcpu *vcpu = &svm->vcpu;
-	struct kvm_sev_info *sev = to_kvm_sev_info(vcpu->kvm);
+	struct kvm_sev_info_plane *sev_plane = to_kvm_sev_info_plane(vcpu->plane);
 	struct sev_es_save_area *save = svm->sev_es.vmsa;
 	struct xregs_state *xsave;
 	const u8 *s;
@@ -982,7 +982,7 @@ static int sev_es_sync_vmsa(struct vcpu_svm *svm)
 	save->xss  = svm->vcpu.arch.ia32_xss;
 	save->dr6  = svm->vcpu.arch.dr6;
 
-	save->sev_features = sev->vmsa_features;
+	save->sev_features = sev_plane->vmsa_features;
 
 	/*
 	 * Skip FPU and AVX setup with KVM_SEV_ES_INIT to avoid
@@ -2026,6 +2026,8 @@ static void sev_unlock_two_vms(struct kvm *dst_kvm, struct kvm *src_kvm)
 
 static void sev_migrate_from(struct kvm *dst_kvm, struct kvm *src_kvm)
 {
+	struct kvm_sev_info_plane *dst_plane = to_kvm_sev_info_plane(dst_kvm->planes[0]);
+	struct kvm_sev_info_plane *src_plane = to_kvm_sev_info_plane(src_kvm->planes[0]);
 	struct kvm_sev_info *dst = to_kvm_sev_info(dst_kvm);
 	struct kvm_sev_info *src = to_kvm_sev_info(src_kvm);
 	struct kvm_vcpu *dst_vcpu, *src_vcpu;
@@ -2039,7 +2041,7 @@ static void sev_migrate_from(struct kvm *dst_kvm, struct kvm *src_kvm)
 	dst->pages_locked = src->pages_locked;
 	dst->enc_context_owner = src->enc_context_owner;
 	dst->es_active = src->es_active;
-	dst->vmsa_features = src->vmsa_features;
+	dst_plane->vmsa_features = src_plane->vmsa_features;
 
 	src->asid = 0;
 	src->active = false;
@@ -4157,7 +4159,7 @@ static void sev_snp_init_protected_guest_state(struct kvm_vcpu *vcpu)
 
 static int sev_snp_ap_creation(struct vcpu_svm *svm)
 {
-	struct kvm_sev_info *sev = to_kvm_sev_info(svm->vcpu.kvm);
+	struct kvm_sev_info_plane *sev_plane = to_kvm_sev_info_plane(svm->vcpu.plane);
 	struct kvm_vcpu *vcpu = &svm->vcpu;
 	struct kvm_vcpu *target_vcpu;
 	struct vcpu_svm *target_svm;
@@ -4182,9 +4184,9 @@ static int sev_snp_ap_creation(struct vcpu_svm *svm)
 	switch (request) {
 	case SVM_VMGEXIT_AP_CREATE_ON_INIT:
 	case SVM_VMGEXIT_AP_CREATE:
-		if (vcpu->arch.regs[VCPU_REGS_RAX] != sev->vmsa_features) {
+		if (vcpu->arch.regs[VCPU_REGS_RAX] != sev_plane->vmsa_features) {
 			vcpu_unimpl(vcpu, "vmgexit: mismatched AP sev_features [%#lx] != [%#llx] from guest\n",
-				    vcpu->arch.regs[VCPU_REGS_RAX], sev->vmsa_features);
+				    vcpu->arch.regs[VCPU_REGS_RAX], sev_plane->vmsa_features);
 			return -EINVAL;
 		}
 
@@ -4815,15 +4817,16 @@ void sev_vcpu_after_set_cpuid(struct vcpu_svm *svm)
 
 static void sev_snp_init_vmcb(struct vcpu_svm *svm)
 {
-	struct kvm_sev_info *sev = &to_kvm_svm(svm->vcpu.kvm)->sev_info;
+	struct kvm_sev_info_plane *sev_plane = &to_kvm_svm_plane(svm->vcpu.plane)->sev_info_plane;
 
 	/* V_NMI is not supported when Restricted Injection is enabled */
-	if (sev->vmsa_features & SVM_SEV_FEAT_RESTRICTED_INJECTION)
+	if (sev_plane->vmsa_features & SVM_SEV_FEAT_RESTRICTED_INJECTION)
 		svm->vmcb->control.int_ctl &= ~V_NMI_ENABLE_MASK;
 }
 
 static void sev_es_init_vmcb(struct vcpu_svm *svm, bool init_event)
 {
+	struct kvm_sev_info_plane *sev_plane = to_kvm_sev_info_plane(svm->vcpu.plane);
 	struct kvm_sev_info *sev = to_kvm_sev_info(svm->vcpu.kvm);
 	struct vmcb *vmcb = svm->vmcb01.ptr;
 	struct kvm_vcpu *vcpu = &svm->vcpu;
@@ -4845,7 +4848,7 @@ static void sev_es_init_vmcb(struct vcpu_svm *svm, bool init_event)
 	}
 
 	if (cpu_feature_enabled(X86_FEATURE_ALLOWED_SEV_FEATURES))
-		svm->vmcb->control.allowed_sev_features = sev->vmsa_features |
+		svm->vmcb->control.allowed_sev_features = sev_plane->vmsa_features |
 							  VMCB_ALLOWED_SEV_FEATURES_VALID;
 
 	/* Can't intercept CR register access, HV can't modify CR registers */
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 99357de14034..2ae82dc058c9 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -5304,6 +5304,23 @@ static void *svm_alloc_apic_backing_page(struct kvm_vcpu *vcpu)
 	return page_address(page);
 }
 
+static struct kvm_plane *svm_alloc_plane(void)
+{
+	struct kvm_svm_plane *svm_plane = kzalloc(sizeof(*svm_plane), GFP_KERNEL_ACCOUNT);
+
+	if (svm_plane)
+		return &svm_plane->plane;
+
+	return NULL;
+}
+
+static void svm_free_plane(struct kvm_plane *plane)
+{
+	struct kvm_svm_plane *svm_plane = to_kvm_svm_plane(plane);
+
+	kfree(svm_plane);
+}
+
 struct kvm_x86_ops svm_x86_ops __initdata = {
 	.name = KBUILD_MODNAME,
 
@@ -5446,8 +5463,8 @@ struct kvm_x86_ops svm_x86_ops __initdata = {
 	.gmem_invalidate = sev_gmem_invalidate,
 	.gmem_max_mapping_level = sev_gmem_max_mapping_level,
 
-	.alloc_plane = x86_alloc_plane,
-	.free_plane = x86_free_plane,
+	.alloc_plane = svm_alloc_plane,
+	.free_plane = svm_free_plane,
 	.max_planes = kvm_x86_default_max_planes,
 };
 
diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index 7d27ed7099a8..57033922ddcf 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -110,7 +110,6 @@ struct kvm_sev_info {
 	unsigned long pages_locked; /* Number of pages locked */
 	struct list_head regions_list;  /* List of registered regions */
 	u64 ap_jump_table;	/* SEV-ES AP Jump Table address */
-	u64 vmsa_features;
 	u16 ghcb_version;	/* Highest guest GHCB protocol version allowed */
 	struct kvm *enc_context_owner; /* Owner of copied encryption context */
 	struct list_head mirror_vms; /* List of VMs mirroring */
@@ -140,6 +139,15 @@ struct kvm_svm {
 #endif
 };
 
+struct kvm_sev_info_plane {
+	u64 vmsa_features;
+};
+
+struct kvm_svm_plane {
+	struct kvm_plane plane;
+	struct kvm_sev_info_plane sev_info_plane;
+};
+
 struct kvm_vcpu;
 
 struct kvm_vmcb_info {
@@ -394,6 +402,16 @@ static __always_inline struct kvm_svm *to_kvm_svm(struct kvm *kvm)
 	return container_of(kvm, struct kvm_svm, kvm);
 }
 
+static __always_inline struct kvm_svm_plane *to_kvm_svm_plane(struct kvm_plane *plane)
+{
+	return container_of(plane, struct kvm_svm_plane, plane);
+}
+
+static __always_inline struct kvm_sev_info_plane *to_kvm_sev_info_plane(struct kvm_plane *plane)
+{
+	return &to_kvm_svm_plane(plane)->sev_info_plane;
+}
+
 #ifdef CONFIG_KVM_AMD_SEV
 static __always_inline struct kvm_sev_info *to_kvm_sev_info(struct kvm *kvm)
 {
@@ -413,7 +431,7 @@ static __always_inline bool ____sev_es_guest(struct kvm *kvm)
 
 static __always_inline bool ____sev_snp_guest(struct kvm *kvm)
 {
-	struct kvm_sev_info *sev = to_kvm_sev_info(kvm);
+	struct kvm_sev_info_plane *sev = to_kvm_sev_info_plane(kvm->planes[0]);
 
 	return (sev->vmsa_features & SVM_SEV_FEAT_SNP_ACTIVE) &&
 	       !WARN_ON_ONCE(!____sev_es_guest(kvm));
@@ -984,7 +1002,7 @@ void sev_snp_cancel_injection(struct kvm_vcpu *vcpu);
 bool sev_snp_blocked(enum inject_type type, struct kvm_vcpu *vcpu);
 static inline bool sev_snp_is_rinj_active(struct kvm_vcpu *vcpu)
 {
-	struct kvm_sev_info *sev = &to_kvm_svm(vcpu->kvm)->sev_info;
+	struct kvm_sev_info_plane *sev = &to_kvm_svm_plane(vcpu->plane)->sev_info_plane;
 
 	return is_sev_snp_guest(vcpu) &&
 		(sev->vmsa_features & SVM_SEV_FEAT_RESTRICTED_INJECTION);
-- 
2.53.0


