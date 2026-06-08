Return-Path: <linux-mips+bounces-14988-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ewsPKgXaJmpYlwIAu9opvQ
	(envelope-from <linux-mips+bounces-14988-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 17:04:37 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3925A657CA5
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 17:04:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14988-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-14988-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 33F1B30C25FA
	for <lists+linux-mips@lfdr.de>; Mon,  8 Jun 2026 14:54:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F0FC3FF89F;
	Mon,  8 Jun 2026 14:43:36 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 675AB3F5BEF;
	Mon,  8 Jun 2026 14:43:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929815; cv=none; b=CLheGBJoDcdfHa5S4qgfusdZy8TiYumJ1ucpHpGeSsC3zmwbvTMlxWKF0aj3s0P63RyEnTPfPzz2xPcm1BAJQQ6zgfyF2x/tRLY5/CchBbK665TGh4MOaWLCIkIq+G19odUvbYDHFUeVVMHGGcU6xXJBUZFFpNczpgQYfFV/fT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929815; c=relaxed/simple;
	bh=QCFeoZd5NYF+cl012pK51iVSnEkExT5Dkr2peOuQ8ZY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nTcfk/oPlNitlDE2DewhuGB/qf7ARziYdoKq/AZqT0npVUILI1EI5Ra9ociGWcFpdVyOwWpTxQaUzBO+h/8jpwq8IRaWrmkHgbOSkifCzNDMJyjXYMpGRFBPfom4naAU+efsxsUcqtoBPE8fxmP3OQm0rhhKl9jscXGJg/g0uEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 50CD62028CE;
	Mon,  8 Jun 2026 16:43:14 +0200 (CEST)
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
Subject: [PATCH 43/60] kvm: x86: Move CPUID state to struct kvm_vcpu_arch_common
Date: Mon,  8 Jun 2026 16:42:35 +0200
Message-ID: <20260608144252.351443-44-joro@8bytes.org>
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
X-Spamd-Result: default: False [0.75 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.71)[subject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
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
	TAGGED_FROM(0.00)[bounces-14988-lists,linux-mips=lfdr.de];
	FORGED_SENDER(0.00)[joro@8bytes.org,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,8bytes.org:mid,8bytes.org:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3925A657CA5

From: Joerg Roedel <joerg.roedel@amd.com>

The CPUID state is shared across all planes, so move it to struct
kvm_vcpu_arch_common.

Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 arch/x86/include/asm/kvm_host.h | 17 ++++++++--------
 arch/x86/kvm/cpuid.c            | 36 +++++++++++++++++++--------------
 arch/x86/kvm/cpuid.h            | 14 ++++++++++---
 arch/x86/kvm/lapic.c            |  2 +-
 arch/x86/kvm/smm.c              |  2 +-
 arch/x86/kvm/svm/svm.c          |  2 +-
 arch/x86/kvm/vmx/vmx.c          |  2 +-
 arch/x86/kvm/x86.c              | 17 ++++++++++++----
 8 files changed, 58 insertions(+), 34 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 11e52f8bb2c2..3a64bdae6e23 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -794,10 +794,16 @@ enum kvm_only_cpuid_leafs {
 	NKVMCAPINTS = NR_KVM_CPU_CAPS - NCAPINTS,
 };
 
-struct kvm_vcpu_arch_common {};
+struct kvm_vcpu_arch_common {
+	/* CPUID related state */
+	int cpuid_nent;
+	struct kvm_cpuid_entry2 *cpuid_entries;
+	bool cpuid_dynamic_bits_dirty;
+	bool is_amd_compatible;
+};
 
-static inline int kvm_arch_vcpu_common_init(struct kvm_vcpu_common *common) { return 0; }
-static inline void kvm_arch_vcpu_common_destroy(struct kvm_vcpu_common *common) {}
+int kvm_arch_vcpu_common_init(struct kvm_vcpu_common *common);
+void kvm_arch_vcpu_common_destroy(struct kvm_vcpu_common *common);
 
 struct kvm_vcpu_arch {
 	/*
@@ -919,11 +925,6 @@ struct kvm_vcpu_arch {
 
 	int halt_request; /* real mode on Intel only */
 
-	int cpuid_nent;
-	struct kvm_cpuid_entry2 *cpuid_entries;
-	bool cpuid_dynamic_bits_dirty;
-	bool is_amd_compatible;
-
 	/*
 	 * cpu_caps holds the effective guest capabilities, i.e. the features
 	 * the vCPU is allowed to use.  Typically, but not always, features can
diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
index e69156b54cff..6d948d63306c 100644
--- a/arch/x86/kvm/cpuid.c
+++ b/arch/x86/kvm/cpuid.c
@@ -176,6 +176,7 @@ static void kvm_update_cpuid_runtime(struct kvm_vcpu *vcpu);
 static int kvm_cpuid_check_equal(struct kvm_vcpu *vcpu, struct kvm_cpuid_entry2 *e2,
 				 int nent)
 {
+	struct kvm_vcpu_common *common = vcpu->common;
 	struct kvm_cpuid_entry2 *orig;
 	int i;
 
@@ -188,11 +189,11 @@ static int kvm_cpuid_check_equal(struct kvm_vcpu *vcpu, struct kvm_cpuid_entry2
 	kvm_update_cpuid_runtime(vcpu);
 	kvm_apply_cpuid_pv_features_quirk(vcpu);
 
-	if (nent != vcpu->arch.cpuid_nent)
+	if (nent != common->arch.cpuid_nent)
 		return -EINVAL;
 
 	for (i = 0; i < nent; i++) {
-		orig = &vcpu->arch.cpuid_entries[i];
+		orig = &common->arch.cpuid_entries[i];
 		if (e2[i].function != orig->function ||
 		    e2[i].index != orig->index ||
 		    e2[i].flags != orig->flags ||
@@ -290,7 +291,7 @@ static void kvm_update_cpuid_runtime(struct kvm_vcpu *vcpu)
 {
 	struct kvm_cpuid_entry2 *best;
 
-	vcpu->arch.cpuid_dynamic_bits_dirty = false;
+	vcpu->common->arch.cpuid_dynamic_bits_dirty = false;
 
 	best = kvm_find_cpuid_entry(vcpu, 1);
 	if (best) {
@@ -374,6 +375,7 @@ static int cpuid_func_emulated(struct kvm_cpuid_entry2 *entry, u32 func,
 
 void kvm_vcpu_after_set_cpuid(struct kvm_vcpu *vcpu)
 {
+	struct kvm_vcpu_common *common = vcpu->common;
 	struct kvm_lapic *apic = vcpu->arch.apic;
 	struct kvm_cpuid_entry2 *best;
 	struct kvm_cpuid_entry2 *entry;
@@ -443,7 +445,7 @@ void kvm_vcpu_after_set_cpuid(struct kvm_vcpu *vcpu)
 
 	vcpu->arch.pv_cpuid.features = kvm_apply_cpuid_pv_features_quirk(vcpu);
 
-	vcpu->arch.is_amd_compatible = guest_cpuid_is_amd_or_hygon(vcpu);
+	common->arch.is_amd_compatible = guest_cpuid_is_amd_or_hygon(vcpu);
 	vcpu->arch.maxphyaddr = cpuid_query_maxphyaddr(vcpu);
 	vcpu->arch.reserved_gpa_bits = kvm_vcpu_reserved_gpa_bits_raw(vcpu);
 
@@ -509,6 +511,7 @@ u64 kvm_vcpu_reserved_gpa_bits_raw(struct kvm_vcpu *vcpu)
 static int kvm_set_cpuid(struct kvm_vcpu *vcpu, struct kvm_cpuid_entry2 *e2,
                         int nent)
 {
+	struct kvm_vcpu_common *common = vcpu->common;
 	u32 vcpu_caps[NR_KVM_CPU_CAPS];
 	int r;
 
@@ -516,7 +519,7 @@ static int kvm_set_cpuid(struct kvm_vcpu *vcpu, struct kvm_cpuid_entry2 *e2,
 	 * Apply pending runtime CPUID updates to the current CPUID entries to
 	 * avoid false positives due to mismatches on KVM-owned feature flags.
 	 */
-	if (vcpu->arch.cpuid_dynamic_bits_dirty)
+	if (common->arch.cpuid_dynamic_bits_dirty)
 		kvm_update_cpuid_runtime(vcpu);
 
 	/*
@@ -530,8 +533,8 @@ static int kvm_set_cpuid(struct kvm_vcpu *vcpu, struct kvm_cpuid_entry2 *e2,
 	 * updates.  Full initialization is done if and only if the vCPU hasn't
 	 * run, i.e. only if userspace is potentially changing CPUID features.
 	 */
-	swap(vcpu->arch.cpuid_entries, e2);
-	swap(vcpu->arch.cpuid_nent, nent);
+	swap(common->arch.cpuid_entries, e2);
+	swap(common->arch.cpuid_nent, nent);
 
 	memcpy(vcpu_caps, vcpu->arch.cpu_caps, sizeof(vcpu_caps));
 	BUILD_BUG_ON(sizeof(vcpu_caps) != sizeof(vcpu->arch.cpu_caps));
@@ -580,8 +583,8 @@ static int kvm_set_cpuid(struct kvm_vcpu *vcpu, struct kvm_cpuid_entry2 *e2,
 
 err:
 	memcpy(vcpu->arch.cpu_caps, vcpu_caps, sizeof(vcpu_caps));
-	swap(vcpu->arch.cpuid_entries, e2);
-	swap(vcpu->arch.cpuid_nent, nent);
+	swap(common->arch.cpuid_entries, e2);
+	swap(common->arch.cpuid_nent, nent);
 	return r;
 }
 
@@ -658,17 +661,19 @@ int kvm_vcpu_ioctl_get_cpuid2(struct kvm_vcpu *vcpu,
 			      struct kvm_cpuid2 *cpuid,
 			      struct kvm_cpuid_entry2 __user *entries)
 {
-	if (cpuid->nent < vcpu->arch.cpuid_nent)
+	struct kvm_vcpu_common *common = vcpu->common;
+
+	if (cpuid->nent < common->arch.cpuid_nent)
 		return -E2BIG;
 
-	if (vcpu->arch.cpuid_dynamic_bits_dirty)
+	if (common->arch.cpuid_dynamic_bits_dirty)
 		kvm_update_cpuid_runtime(vcpu);
 
-	if (copy_to_user(entries, vcpu->arch.cpuid_entries,
-			 vcpu->arch.cpuid_nent * sizeof(struct kvm_cpuid_entry2)))
+	if (copy_to_user(entries, common->arch.cpuid_entries,
+			 common->arch.cpuid_nent * sizeof(struct kvm_cpuid_entry2)))
 		return -EFAULT;
 
-	cpuid->nent = vcpu->arch.cpuid_nent;
+	cpuid->nent = common->arch.cpuid_nent;
 	return 0;
 }
 
@@ -2089,10 +2094,11 @@ bool kvm_cpuid(struct kvm_vcpu *vcpu, u32 *eax, u32 *ebx,
 	       u32 *ecx, u32 *edx, bool exact_only)
 {
 	u32 orig_function = *eax, function = *eax, index = *ecx;
+	struct kvm_vcpu_common *common = vcpu->common;
 	struct kvm_cpuid_entry2 *entry;
 	bool exact, used_max_basic = false;
 
-	if (vcpu->arch.cpuid_dynamic_bits_dirty)
+	if (common->arch.cpuid_dynamic_bits_dirty)
 		kvm_update_cpuid_runtime(vcpu);
 
 	entry = kvm_find_cpuid_entry_index(vcpu, function, index);
diff --git a/arch/x86/kvm/cpuid.h b/arch/x86/kvm/cpuid.h
index 039b8e6f40ba..143ea8531611 100644
--- a/arch/x86/kvm/cpuid.h
+++ b/arch/x86/kvm/cpuid.h
@@ -36,14 +36,18 @@ struct kvm_cpuid_entry2 *kvm_find_cpuid_entry2(struct kvm_cpuid_entry2 *entries,
 static inline struct kvm_cpuid_entry2 *kvm_find_cpuid_entry_index(struct kvm_vcpu *vcpu,
 								  u32 function, u32 index)
 {
-	return kvm_find_cpuid_entry2(vcpu->arch.cpuid_entries, vcpu->arch.cpuid_nent,
+	struct kvm_vcpu_common *common = vcpu->common;
+
+	return kvm_find_cpuid_entry2(common->arch.cpuid_entries, common->arch.cpuid_nent,
 				     function, index);
 }
 
 static inline struct kvm_cpuid_entry2 *kvm_find_cpuid_entry(struct kvm_vcpu *vcpu,
 							    u32 function)
 {
-	return kvm_find_cpuid_entry2(vcpu->arch.cpuid_entries, vcpu->arch.cpuid_nent,
+	struct kvm_vcpu_common *common = vcpu->common;
+
+	return kvm_find_cpuid_entry2(common->arch.cpuid_entries, common->arch.cpuid_nent,
 				     function, KVM_CPUID_INDEX_NOT_SIGNIFICANT);
 }
 
@@ -135,7 +139,7 @@ static __always_inline bool guest_cpuid_has(struct kvm_vcpu *vcpu,
 
 static inline bool guest_cpuid_is_amd_compatible(struct kvm_vcpu *vcpu)
 {
-	return vcpu->arch.is_amd_compatible;
+	return vcpu->common->arch.is_amd_compatible;
 }
 
 static inline bool guest_cpuid_is_intel_compatible(struct kvm_vcpu *vcpu)
@@ -300,4 +304,8 @@ static inline bool guest_has_pred_cmd_msr(struct kvm_vcpu *vcpu)
 		guest_cpu_cap_has(vcpu, X86_FEATURE_SBPB));
 }
 
+static inline void cpuid_set_dirty(struct kvm_vcpu *vcpu)
+{
+	vcpu->common->arch.cpuid_dynamic_bits_dirty = true;
+}
 #endif
diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
index cac076445472..dc7a08831a54 100644
--- a/arch/x86/kvm/lapic.c
+++ b/arch/x86/kvm/lapic.c
@@ -2754,7 +2754,7 @@ static void __kvm_apic_set_base(struct kvm_vcpu *vcpu, u64 value)
 	vcpu->arch.apic_base = value;
 
 	if ((old_value ^ value) & MSR_IA32_APICBASE_ENABLE)
-		vcpu->arch.cpuid_dynamic_bits_dirty = true;
+		cpuid_set_dirty(vcpu);
 
 	if (!apic)
 		return;
diff --git a/arch/x86/kvm/smm.c b/arch/x86/kvm/smm.c
index f623c5986119..736ab345b9fd 100644
--- a/arch/x86/kvm/smm.c
+++ b/arch/x86/kvm/smm.c
@@ -363,7 +363,7 @@ void enter_smm(struct kvm_vcpu *vcpu)
 			goto error;
 #endif
 
-	vcpu->arch.cpuid_dynamic_bits_dirty = true;
+	cpuid_set_dirty(vcpu);
 	kvm_mmu_reset_context(vcpu);
 	return;
 error:
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index e8ad880a4266..612db7ad8b2a 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -1848,7 +1848,7 @@ void svm_set_cr4(struct kvm_vcpu *vcpu, unsigned long cr4)
 	vmcb_mark_dirty(to_svm(vcpu)->vmcb, VMCB_CR);
 
 	if ((cr4 ^ old_cr4) & (X86_CR4_OSXSAVE | X86_CR4_PKE))
-		vcpu->arch.cpuid_dynamic_bits_dirty = true;
+		cpuid_set_dirty(vcpu);
 }
 
 static void svm_set_segment(struct kvm_vcpu *vcpu,
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 20262855bfe8..62e180651143 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -3595,7 +3595,7 @@ void vmx_set_cr4(struct kvm_vcpu *vcpu, unsigned long cr4)
 	vmcs_writel(GUEST_CR4, hw_cr4);
 
 	if ((cr4 ^ old_cr4) & (X86_CR4_OSXSAVE | X86_CR4_PKE))
-		vcpu->arch.cpuid_dynamic_bits_dirty = true;
+		cpuid_set_dirty(vcpu);
 }
 
 void vmx_get_segment(struct kvm_vcpu *vcpu, struct kvm_segment *var, int seg)
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 7fc08df245bd..7e94a378b3d2 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -1322,7 +1322,7 @@ int __kvm_set_xcr(struct kvm_vcpu *vcpu, u32 index, u64 xcr)
 	vcpu->arch.xcr0 = xcr0;
 
 	if ((xcr0 ^ old_xcr0) & XFEATURE_MASK_EXTEND)
-		vcpu->arch.cpuid_dynamic_bits_dirty = true;
+		cpuid_set_dirty(vcpu);
 	return 0;
 }
 EXPORT_SYMBOL_FOR_KVM_INTERNAL(__kvm_set_xcr);
@@ -4089,7 +4089,7 @@ int kvm_set_msr_common(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 			if (!guest_cpu_cap_has(vcpu, X86_FEATURE_XMM3))
 				return 1;
 			vcpu->arch.ia32_misc_enable_msr = data;
-			vcpu->arch.cpuid_dynamic_bits_dirty = true;
+			cpuid_set_dirty(vcpu);
 		} else {
 			vcpu->arch.ia32_misc_enable_msr = data;
 		}
@@ -4121,7 +4121,7 @@ int kvm_set_msr_common(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 		if (vcpu->arch.ia32_xss == data)
 			break;
 		vcpu->arch.ia32_xss = data;
-		vcpu->arch.cpuid_dynamic_bits_dirty = true;
+		cpuid_set_dirty(vcpu);
 		break;
 	case MSR_SMI_COUNT:
 		if (!msr_info->host_initiated)
@@ -13034,7 +13034,16 @@ void kvm_arch_vcpu_destroy(struct kvm_vcpu *vcpu)
 	kvm_mmu_destroy(vcpu);
 	srcu_read_unlock(&vcpu->kvm->srcu, idx);
 	free_page((unsigned long)vcpu->arch.pio_data);
-	kvfree(vcpu->arch.cpuid_entries);
+}
+
+int kvm_arch_vcpu_common_init(struct kvm_vcpu_common *common)
+{
+	return 0;
+}
+
+void kvm_arch_vcpu_common_destroy(struct kvm_vcpu_common *common)
+{
+	kvfree(common->arch.cpuid_entries);
 }
 
 static void kvm_xstate_reset(struct kvm_vcpu *vcpu, bool init_event)
-- 
2.53.0


