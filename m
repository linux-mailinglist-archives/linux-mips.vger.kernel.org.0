Return-Path: <linux-mips+bounces-14980-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6ymcMmXZJmorlwIAu9opvQ
	(envelope-from <linux-mips+bounces-14980-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 17:01:57 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DF6657C3D
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 17:01:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14980-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-14980-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DCB9F308F2BF
	for <lists+linux-mips@lfdr.de>; Mon,  8 Jun 2026 14:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1401B3FBEC3;
	Mon,  8 Jun 2026 14:43:33 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B4D03F482F;
	Mon,  8 Jun 2026 14:43:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929812; cv=none; b=gc1EEJ/EihDJYAWwPe6BvPxkK/Y5FRihh8MIiAD0wSn6GQ3T7ZBGGJtZrQMDW99IZlmX5KjmVfXxwwCTJdAhRSNOigaQ4zOSqQroHYKVsuRbwSpWH/y9HzIqfHSR/mq4gIJLejsPpLTRTQP3LU67hlKAyb42tALi7QsqPXrTjP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929812; c=relaxed/simple;
	bh=ndcuyAPx2C4MKTidMkaU1qTNUAY37NxMM2+ire8vk/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=stmitiBS/Umiht9i1qw2V1mr9h1QnAMioqp06Lav2kHB4s2ts+Mkzk3O7vWMr1wEV6rzrRurYgBAr9VvKxl4TNK1Ml8x8zKUUoe5Zhhi6ZgfdnGDSWS+PibddJRlN3C2Bk6AHGnJzJV9IYytfGyn6IC3BP6AeFuZ+p4djirmUlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 84F122028CF;
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
Subject: [PATCH 44/60] kvm: x86: Move cpu_caps to struct kvm_vcpu_arch_common
Date: Mon,  8 Jun 2026 16:42:36 +0200
Message-ID: <20260608144252.351443-45-joro@8bytes.org>
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
X-Spamd-Result: default: False [0.81 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.77)[subject];
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
	TAGGED_FROM(0.00)[bounces-14980-lists,linux-mips=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,8bytes.org:mid,8bytes.org:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,amd.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 48DF6657C3D

From: Joerg Roedel <joerg.roedel@amd.com>

Now that CPUID state is shared across all planes, cpu_caps can be
shared as well.

Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 arch/x86/include/asm/kvm_host.h | 33 +++++++++++++++++----------------
 arch/x86/kvm/cpuid.c            | 18 +++++++++---------
 arch/x86/kvm/cpuid.h            | 17 +++++++++--------
 arch/x86/kvm/svm/svm.c          |  4 ++--
 arch/x86/kvm/vmx/vmx.c          |  2 +-
 5 files changed, 38 insertions(+), 36 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 3a64bdae6e23..b0d040528f9d 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -800,6 +800,23 @@ struct kvm_vcpu_arch_common {
 	struct kvm_cpuid_entry2 *cpuid_entries;
 	bool cpuid_dynamic_bits_dirty;
 	bool is_amd_compatible;
+
+	/*
+	 * cpu_caps holds the effective guest capabilities, i.e. the features
+	 * the vCPU is allowed to use.  Typically, but not always, features can
+	 * be used by the guest if and only if both KVM and userspace want to
+	 * expose the feature to the guest.
+	 *
+	 * A common exception is for virtualization holes, i.e. when KVM can't
+	 * prevent the guest from using a feature, in which case the vCPU "has"
+	 * the feature regardless of what KVM or userspace desires.
+	 *
+	 * Note, features that don't require KVM involvement in any way are
+	 * NOT enforced/sanitized by KVM, i.e. are taken verbatim from the
+	 * guest CPUID provided by userspace.
+	 */
+	u32 cpu_caps[NR_KVM_CPU_CAPS];
+
 };
 
 int kvm_arch_vcpu_common_init(struct kvm_vcpu_common *common);
@@ -925,22 +942,6 @@ struct kvm_vcpu_arch {
 
 	int halt_request; /* real mode on Intel only */
 
-	/*
-	 * cpu_caps holds the effective guest capabilities, i.e. the features
-	 * the vCPU is allowed to use.  Typically, but not always, features can
-	 * be used by the guest if and only if both KVM and userspace want to
-	 * expose the feature to the guest.
-	 *
-	 * A common exception is for virtualization holes, i.e. when KVM can't
-	 * prevent the guest from using a feature, in which case the vCPU "has"
-	 * the feature regardless of what KVM or userspace desires.
-	 *
-	 * Note, features that don't require KVM involvement in any way are
-	 * NOT enforced/sanitized by KVM, i.e. are taken verbatim from the
-	 * guest CPUID provided by userspace.
-	 */
-	u32 cpu_caps[NR_KVM_CPU_CAPS];
-
 	u64 reserved_gpa_bits;
 	int maxphyaddr;
 
diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
index 6d948d63306c..27e2f7e25038 100644
--- a/arch/x86/kvm/cpuid.c
+++ b/arch/x86/kvm/cpuid.c
@@ -284,7 +284,7 @@ static __always_inline void kvm_update_feature_runtime(struct kvm_vcpu *vcpu,
 						       bool has_feature)
 {
 	cpuid_entry_change(entry, x86_feature, has_feature);
-	guest_cpu_cap_change(vcpu, x86_feature, has_feature);
+	guest_cpu_cap_change(vcpu->common, x86_feature, has_feature);
 }
 
 static void kvm_update_cpuid_runtime(struct kvm_vcpu *vcpu)
@@ -382,7 +382,7 @@ void kvm_vcpu_after_set_cpuid(struct kvm_vcpu *vcpu)
 	bool allow_gbpages;
 	int i;
 
-	memset(vcpu->arch.cpu_caps, 0, sizeof(vcpu->arch.cpu_caps));
+	memset(common->arch.cpu_caps, 0, sizeof(common->arch.cpu_caps));
 	BUILD_BUG_ON(ARRAY_SIZE(reverse_cpuid) != NR_KVM_CPU_CAPS);
 
 	/*
@@ -408,9 +408,9 @@ void kvm_vcpu_after_set_cpuid(struct kvm_vcpu *vcpu)
 		 * in guest CPUID.  Note, this includes features that are
 		 * supported by KVM but aren't advertised to userspace!
 		 */
-		vcpu->arch.cpu_caps[i] = kvm_cpu_caps[i] |
-					 cpuid_get_reg_unsafe(&emulated, cpuid.reg);
-		vcpu->arch.cpu_caps[i] &= cpuid_get_reg_unsafe(entry, cpuid.reg);
+		common->arch.cpu_caps[i] = kvm_cpu_caps[i] |
+					   cpuid_get_reg_unsafe(&emulated, cpuid.reg);
+		common->arch.cpu_caps[i] &= cpuid_get_reg_unsafe(entry, cpuid.reg);
 	}
 
 	kvm_update_cpuid_runtime(vcpu);
@@ -428,7 +428,7 @@ void kvm_vcpu_after_set_cpuid(struct kvm_vcpu *vcpu)
 	 */
 	allow_gbpages = tdp_enabled ? boot_cpu_has(X86_FEATURE_GBPAGES) :
 				      guest_cpu_cap_has(vcpu, X86_FEATURE_GBPAGES);
-	guest_cpu_cap_change(vcpu, X86_FEATURE_GBPAGES, allow_gbpages);
+	guest_cpu_cap_change(common, X86_FEATURE_GBPAGES, allow_gbpages);
 
 	best = kvm_find_cpuid_entry(vcpu, 1);
 	if (best && apic) {
@@ -536,8 +536,8 @@ static int kvm_set_cpuid(struct kvm_vcpu *vcpu, struct kvm_cpuid_entry2 *e2,
 	swap(common->arch.cpuid_entries, e2);
 	swap(common->arch.cpuid_nent, nent);
 
-	memcpy(vcpu_caps, vcpu->arch.cpu_caps, sizeof(vcpu_caps));
-	BUILD_BUG_ON(sizeof(vcpu_caps) != sizeof(vcpu->arch.cpu_caps));
+	memcpy(vcpu_caps, common->arch.cpu_caps, sizeof(vcpu_caps));
+	BUILD_BUG_ON(sizeof(vcpu_caps) != sizeof(common->arch.cpu_caps));
 
 	/*
 	 * KVM does not correctly handle changing guest CPUID after KVM_RUN or
@@ -582,7 +582,7 @@ static int kvm_set_cpuid(struct kvm_vcpu *vcpu, struct kvm_cpuid_entry2 *e2,
 	return 0;
 
 err:
-	memcpy(vcpu->arch.cpu_caps, vcpu_caps, sizeof(vcpu_caps));
+	memcpy(common->arch.cpu_caps, vcpu_caps, sizeof(vcpu_caps));
 	swap(common->arch.cpuid_entries, e2);
 	swap(common->arch.cpuid_nent, nent);
 	return r;
diff --git a/arch/x86/kvm/cpuid.h b/arch/x86/kvm/cpuid.h
index 143ea8531611..75abf447eabf 100644
--- a/arch/x86/kvm/cpuid.h
+++ b/arch/x86/kvm/cpuid.h
@@ -239,36 +239,37 @@ static __always_inline bool guest_pv_has(struct kvm_vcpu *vcpu,
 	return vcpu->arch.pv_cpuid.features & (1u << kvm_feature);
 }
 
-static __always_inline void guest_cpu_cap_set(struct kvm_vcpu *vcpu,
+static __always_inline void guest_cpu_cap_set(struct kvm_vcpu_common *common,
 					      unsigned int x86_feature)
 {
 	unsigned int x86_leaf = __feature_leaf(x86_feature);
 
-	vcpu->arch.cpu_caps[x86_leaf] |= __feature_bit(x86_feature);
+	common->arch.cpu_caps[x86_leaf] |= __feature_bit(x86_feature);
 }
 
-static __always_inline void guest_cpu_cap_clear(struct kvm_vcpu *vcpu,
+static __always_inline void guest_cpu_cap_clear(struct kvm_vcpu_common *common,
 						unsigned int x86_feature)
 {
 	unsigned int x86_leaf = __feature_leaf(x86_feature);
 
-	vcpu->arch.cpu_caps[x86_leaf] &= ~__feature_bit(x86_feature);
+	common->arch.cpu_caps[x86_leaf] &= ~__feature_bit(x86_feature);
 }
 
-static __always_inline void guest_cpu_cap_change(struct kvm_vcpu *vcpu,
+static __always_inline void guest_cpu_cap_change(struct kvm_vcpu_common *common,
 						 unsigned int x86_feature,
 						 bool guest_has_cap)
 {
 	if (guest_has_cap)
-		guest_cpu_cap_set(vcpu, x86_feature);
+		guest_cpu_cap_set(common, x86_feature);
 	else
-		guest_cpu_cap_clear(vcpu, x86_feature);
+		guest_cpu_cap_clear(common, x86_feature);
 }
 
 static __always_inline bool guest_cpu_cap_has(struct kvm_vcpu *vcpu,
 					      unsigned int x86_feature)
 {
 	unsigned int x86_leaf = __feature_leaf(x86_feature);
+	struct kvm_vcpu_common *common = vcpu->common;
 
 	/*
 	 * Except for MWAIT, querying dynamic feature bits is disallowed, so
@@ -278,7 +279,7 @@ static __always_inline bool guest_cpu_cap_has(struct kvm_vcpu *vcpu,
 		     x86_feature == X86_FEATURE_OSXSAVE ||
 		     x86_feature == X86_FEATURE_OSPKE);
 
-	return vcpu->arch.cpu_caps[x86_leaf] & __feature_bit(x86_feature);
+	return common->arch.cpu_caps[x86_leaf] & __feature_bit(x86_feature);
 }
 
 static inline bool kvm_vcpu_is_legal_cr3(struct kvm_vcpu *vcpu, unsigned long cr3)
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 612db7ad8b2a..0b57dde29e40 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -4706,7 +4706,7 @@ static void svm_vcpu_after_set_cpuid(struct kvm_vcpu *vcpu)
 	 * XSS on VM-Enter/VM-Exit.  Failure to do so would effectively give
 	 * the guest read/write access to the host's XSS.
 	 */
-	guest_cpu_cap_change(vcpu, X86_FEATURE_XSAVES,
+	guest_cpu_cap_change(vcpu->common, X86_FEATURE_XSAVES,
 			     boot_cpu_has(X86_FEATURE_XSAVES) &&
 			     guest_cpu_cap_has(vcpu, X86_FEATURE_XSAVE));
 
@@ -4716,7 +4716,7 @@ static void svm_vcpu_after_set_cpuid(struct kvm_vcpu *vcpu)
 	 * SVM on Intel is bonkers and extremely unlikely to work).
 	 */
 	if (guest_cpuid_is_intel_compatible(vcpu))
-		guest_cpu_cap_clear(vcpu, X86_FEATURE_V_VMSAVE_VMLOAD);
+		guest_cpu_cap_clear(vcpu->common, X86_FEATURE_V_VMSAVE_VMLOAD);
 
 	if (is_sev_guest(vcpu))
 		sev_vcpu_after_set_cpuid(svm);
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 62e180651143..d10aa5f60cad 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -7994,7 +7994,7 @@ void vmx_vcpu_after_set_cpuid(struct kvm_vcpu *vcpu)
 	 * set if and only if XSAVE is supported.
 	 */
 	if (!guest_cpu_cap_has(vcpu, X86_FEATURE_XSAVE))
-		guest_cpu_cap_clear(vcpu, X86_FEATURE_XSAVES);
+		guest_cpu_cap_clear(vcpu->common, X86_FEATURE_XSAVES);
 
 	vmx_setup_uret_msrs(vmx);
 
-- 
2.53.0


