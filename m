Return-Path: <linux-mips+bounces-14998-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Xa25IYbaJmqAlwIAu9opvQ
	(envelope-from <linux-mips+bounces-14998-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 17:06:46 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F282E657D0E
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 17:06:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14998-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-14998-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E622F30A7FDD
	for <lists+linux-mips@lfdr.de>; Mon,  8 Jun 2026 14:56:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CB7F406278;
	Mon,  8 Jun 2026 14:43:40 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E6BC3FA5C4;
	Mon,  8 Jun 2026 14:43:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929820; cv=none; b=SyKMZtWuHBHGvt1a65KxO84k3ah1ckk1z/ANx2m7LCQXI9RP1TnxMRcjia5/fQhD0A9KFnd0M5FpWhzHXICv4JmFqWKT3Pw/n43d6RtQ2abc306hdgkJjlTW1NfjA0/papdJw/XkhhF2YpqR5R9zVDvZqkOebMe1cWOKAX0NbrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929820; c=relaxed/simple;
	bh=mGPqXu5ibNRW2W8aJyMmZMYXzQxkrfLOxtR6Q/NJNzg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=clhYlrdQaqHrr0yzavQfruTQR7qYilS5A9+d1RJ6cS/XEu+SRhCzQQ2MErtnNm2C6RdZ+OmZaSG9l8c0bde2/zEL0ArI0B3QYu5ixmJRTG5eZDsgMKJYJ183i/wm1eCaDkVTREEMuUeVpnTN+7NGxA1y2nRyhNjg6SAV7eQLwo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id BB2242028DE;
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
Subject: [PATCH 59/60] kvm: svm: Implement max_planes x86 operation
Date: Mon,  8 Jun 2026 16:42:51 +0200
Message-ID: <20260608144252.351443-60-joro@8bytes.org>
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
	TAGGED_FROM(0.00)[bounces-14998-lists,linux-mips=lfdr.de];
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
X-Rspamd-Queue-Id: F282E657D0E

From: Tom Lendacky <thomas.lendacky@amd.com>

Report the number of VMPL levels supported by SEV-SNP guests.

Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
Co-developed-by: Joerg Roedel <joerg.roedel@amd.com>
Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 arch/x86/kvm/svm/sev.c | 14 ++++++++++++--
 arch/x86/kvm/svm/svm.c | 12 +++++++++++-
 arch/x86/kvm/svm/svm.h |  3 +++
 3 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index b67566fcb69e..528c8bd3e8fc 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -114,6 +114,7 @@ static unsigned long sev_me_mask;
 static unsigned int nr_asids;
 static unsigned long *sev_asid_bitmap;
 static unsigned long *sev_reclaim_asid_bitmap;
+static unsigned int vmpl_levels;
 
 static __always_inline void kvm_lockdep_assert_sev_lock_held(struct kvm *kvm)
 {
@@ -3103,6 +3104,9 @@ void __init sev_hardware_setup(void)
 	/* Set encryption bit location for SEV-ES guests */
 	sev_enc_bit = ebx & 0x3f;
 
+	/* Get the number of supported VMPL levels */
+	vmpl_levels = (ebx >> 12) & 0xf;
+
 	/* Maximum number of encrypted guests supported simultaneously */
 	max_sev_asid = ecx;
 	if (!max_sev_asid)
@@ -3217,9 +3221,10 @@ void __init sev_hardware_setup(void)
 										"disabled",
 			min_sev_es_asid, max_sev_es_asid);
 	if (boot_cpu_has(X86_FEATURE_SEV_SNP))
-		pr_info("SEV-SNP %s (ASIDs %u - %u)\n",
+		pr_info("SEV-SNP %s (ASIDs %u - %u), VMPL Levels %u\n",
 			str_enabled_disabled(sev_snp_supported),
-			min_snp_asid, max_snp_asid);
+			min_snp_asid, max_snp_asid,
+			vmpl_levels);
 
 	sev_enabled = sev_supported;
 	sev_es_enabled = sev_es_supported;
@@ -5852,3 +5857,8 @@ bool sev_snp_blocked(enum inject_type type, struct kvm_vcpu *vcpu)
 
 	return blocked;
 }
+
+int sev_snp_max_planes(struct kvm *kvm)
+{
+	return vmpl_levels;
+}
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 2ae82dc058c9..705063c7f0f0 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -5321,6 +5321,16 @@ static void svm_free_plane(struct kvm_plane *plane)
 	kfree(svm_plane);
 }
 
+static unsigned svm_max_planes(struct kvm *kvm)
+{
+#ifdef CONFIG_KVM_AMD_SEV
+	if (____sev_snp_guest(kvm))
+		return sev_snp_max_planes(kvm);
+#endif
+
+	return kvm_x86_default_max_planes(kvm);
+}
+
 struct kvm_x86_ops svm_x86_ops __initdata = {
 	.name = KBUILD_MODNAME,
 
@@ -5465,7 +5475,7 @@ struct kvm_x86_ops svm_x86_ops __initdata = {
 
 	.alloc_plane = svm_alloc_plane,
 	.free_plane = svm_free_plane,
-	.max_planes = kvm_x86_default_max_planes,
+	.max_planes = svm_max_planes,
 };
 
 /*
diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index 7e860f2abafb..7aba2cceb44d 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -1008,6 +1008,8 @@ static inline bool sev_snp_is_rinj_active(struct kvm_vcpu *vcpu)
 	return is_sev_snp_guest(vcpu) &&
 		(sev->vmsa_features & SVM_SEV_FEAT_RESTRICTED_INJECTION);
 };
+int sev_nr_vcpu_planes(struct kvm *kvm);
+int sev_snp_max_planes(struct kvm *kvm);
 #else
 static inline struct page *snp_safe_alloc_page_node(int node, gfp_t gfp)
 {
@@ -1051,6 +1053,7 @@ static inline bool sev_snp_inject(enum inject_type type, struct kvm_vcpu *vcpu)
 static inline void sev_snp_cancel_injection(struct kvm_vcpu *vcpu) {}
 static inline bool sev_snp_blocked(enum inject_type type, struct kvm_vcpu *vcpu) { return false; }
 static inline bool sev_snp_is_rinj_active(struct kvm_vcpu *vcpu) { return false; }
+static inline unsigned sev_snp_max_planes(struct kvm *kvm) { return 1; }
 #endif
 
 /* vmenter.S */
-- 
2.53.0


