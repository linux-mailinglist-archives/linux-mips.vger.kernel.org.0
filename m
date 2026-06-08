Return-Path: <linux-mips+bounces-14961-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D0+aGaXbJmrDlwIAu9opvQ
	(envelope-from <linux-mips+bounces-14961-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 17:11:33 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A8F657DED
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 17:11:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14961-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-14961-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D4F1326D4E2
	for <lists+linux-mips@lfdr.de>; Mon,  8 Jun 2026 14:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B4913F5BD4;
	Mon,  8 Jun 2026 14:43:25 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C27D3F165C;
	Mon,  8 Jun 2026 14:43:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929804; cv=none; b=ntkudaeLZ7oQp7Cvqqo+CWe8tVSVdCJl7rlR0fIAcNv+qIOXFl0CdABdxJ3uE69WDQxnl4zzu48TkFEVY2XjOuyIuARBF+Cigho+zxNp4tSIC4Jogq8gt4xaqlyDHhZ80MokRTs+vkaer5oNS/NSbE6DO6xWJ1eK/piCMsuwNf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929804; c=relaxed/simple;
	bh=PjYlTb8535WHEQCogDEat0FpfhhlZazoOBVSUD5mpK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kS8iu3d0ysAWPNee10VK1RNhd/LzoTH+wpdECX5fOvvNR66GXikXc6POLewLNil+pqllWUZR8rG1k4SBrF3GYhFvj1zR1BIMQ94nlR+CUJxQCrBdr4kcm63ARkUMj3lbQAf03e4MNb9T+JyE3DtFF+IZaN8vIp+oPnlJWL2Z4kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 9C7712028BD;
	Mon,  8 Jun 2026 16:43:10 +0200 (CEST)
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
Subject: [PATCH 26/60] kvm: Introduce arch-specific plane state
Date: Mon,  8 Jun 2026 16:42:18 +0200
Message-ID: <20260608144252.351443-27-joro@8bytes.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[lists@lfdr.de];
	DMARC_NA(0.00)[8bytes.org: no valid DMARC record];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pbonzini@redhat.com,m:seanjc@google.com,m:thomas.lendacky@amd.com,m:ashish.kalra@amd.com,m:michael.roth@amd.com,m:nsaenz@amazon.com,m:anelkz@amazon.de,m:James.Bottomley@HansenPartnership.com,m:huibo.wang@amd.com,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kvmarm@lists.linux.dev,m:loongarch@lists.linux.dev,m:linux-mips@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm-riscv@lists.infradead.org,m:x86@kernel.org,m:coconut-svsm@lists.linux.dev,m:joerg.roedel@amd.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-14961-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[joro@8bytes.org,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: C1A8F657DED

From: Joerg Roedel <joerg.roedel@amd.com>

Introduce struct kvm_arch_plane which is per architecture and will be
used to store architecture-specific per-plane state.

Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 arch/arm64/include/asm/kvm_host.h     | 12 ++++++++++++
 arch/loongarch/include/asm/kvm_host.h | 12 ++++++++++++
 arch/mips/include/asm/kvm_host.h      | 12 ++++++++++++
 arch/powerpc/include/asm/kvm_host.h   | 12 ++++++++++++
 arch/riscv/include/asm/kvm_host.h     | 12 ++++++++++++
 arch/s390/include/asm/kvm_host.h      | 12 ++++++++++++
 arch/x86/include/asm/kvm_host.h       | 12 ++++++++++++
 include/linux/kvm_host.h              |  2 ++
 include/linux/kvm_types.h             |  1 +
 virt/kvm/kvm_main.c                   |  9 +++++++++
 10 files changed, 96 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 32dc484781f0..e9cca2adb371 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -306,6 +306,18 @@ enum fgt_group_id {
 	__NR_FGT_GROUP_IDS__
 };
 
+/* Per-plane state of VM */
+struct kvm_arch_plane {};
+
+static inline int kvm_arch_plane_init(struct kvm *kvm,
+				      struct kvm_plane *plane,
+				      unsigned plane_level)
+{
+	return 0;
+}
+
+static inline void kvm_arch_plane_destroy(struct kvm_plane *plane) {}
+
 struct kvm_arch {
 	struct kvm_s2_mmu mmu;
 
diff --git a/arch/loongarch/include/asm/kvm_host.h b/arch/loongarch/include/asm/kvm_host.h
index 776bc487a705..225aa87ebbdd 100644
--- a/arch/loongarch/include/asm/kvm_host.h
+++ b/arch/loongarch/include/asm/kvm_host.h
@@ -116,6 +116,18 @@ struct kvm_phyid_map {
 	struct kvm_phyid_info phys_map[KVM_MAX_PHYID];
 };
 
+/* Per-plane state of VM */
+struct kvm_arch_plane {};
+
+static inline int kvm_arch_plane_init(struct kvm *kvm,
+				      struct kvm_plane *plane,
+				      unsigned plane_level)
+{
+	return 0;
+}
+
+static inline void kvm_arch_plane_destroy(struct kvm_plane *plane) {}
+
 struct kvm_arch {
 	/* Guest physical mm */
 	kvm_pte_t *pgd;
diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
index c14b10821817..b01911eb9064 100644
--- a/arch/mips/include/asm/kvm_host.h
+++ b/arch/mips/include/asm/kvm_host.h
@@ -172,6 +172,18 @@ struct loongson_kvm_ipi {
 };
 #endif
 
+/* Per-plane state of VM */
+struct kvm_arch_plane {};
+
+static inline int kvm_arch_plane_init(struct kvm *kvm,
+				      struct kvm_plane *plane,
+				      unsigned plane_level)
+{
+	return 0;
+}
+
+static inline void kvm_arch_plane_destroy(struct kvm_plane *plane) {}
+
 struct kvm_arch {
 	/* Guest physical mm */
 	struct mm_struct gpa_mm;
diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index 2d139c807577..c5b9fbaf34f3 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -269,6 +269,18 @@ struct kvm_hpt_info {
 
 struct kvm_resize_hpt;
 
+/* Per-plane state of VM */
+struct kvm_arch_plane {};
+
+static inline int kvm_arch_plane_init(struct kvm *kvm,
+				      struct kvm_plane *plane,
+				      unsigned plane_level)
+{
+	return 0;
+}
+
+static inline void kvm_arch_plane_destroy(struct kvm_plane *plane) {}
+
 /* Flag values for kvm_arch.secure_guest */
 #define KVMPPC_SECURE_INIT_START 0x1 /* H_SVM_INIT_START has been called */
 #define KVMPPC_SECURE_INIT_DONE  0x2 /* H_SVM_INIT_DONE completed */
diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 75b0a951c1bc..bcbf487d4cb7 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -76,6 +76,18 @@ struct kvm_vcpu_stat {
 struct kvm_arch_memory_slot {
 };
 
+/* Per-plane state of VM */
+struct kvm_arch_plane {};
+
+static inline int kvm_arch_plane_init(struct kvm *kvm,
+				      struct kvm_plane *plane,
+				      unsigned plane_level)
+{
+	return 0;
+}
+
+static inline void kvm_arch_plane_destroy(struct kvm_plane *plane) {}
+
 struct kvm_arch {
 	/* G-stage vmid */
 	struct kvm_vmid vmid;
diff --git a/arch/s390/include/asm/kvm_host.h b/arch/s390/include/asm/kvm_host.h
index 8a4f4a39f7a2..bb3bfbfd35d8 100644
--- a/arch/s390/include/asm/kvm_host.h
+++ b/arch/s390/include/asm/kvm_host.h
@@ -638,6 +638,18 @@ struct kvm_s390_pv {
 
 struct kvm_s390_mmu_cache;
 
+/* Per-plane state of VM */
+struct kvm_arch_plane {};
+
+static inline int kvm_arch_plane_init(struct kvm *kvm,
+				      struct kvm_plane *plane,
+				      unsigned plane_level)
+{
+	return 0;
+}
+
+static inline void kvm_arch_plane_destroy(struct kvm_plane *plane) {}
+
 struct kvm_arch {
 	struct esca_block *sca;
 	debug_info_t *dbf;
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 43c92f0ada1e..dd95c70bfdba 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1412,6 +1412,18 @@ enum kvm_mmu_type {
 	KVM_NR_MMU_TYPES,
 };
 
+/* Per-plane state of VM */
+struct kvm_arch_plane {};
+
+static inline int kvm_arch_plane_init(struct kvm *kvm,
+				      struct kvm_plane *plane,
+				      unsigned plane_level)
+{
+	return 0;
+}
+
+static inline void kvm_arch_plane_destroy(struct kvm_plane *plane) {}
+
 struct kvm_arch {
 	unsigned long n_used_mmu_pages;
 	unsigned long n_requested_mmu_pages;
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 7d06459a06f3..4a0eaa1de479 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -847,6 +847,8 @@ struct kvm_plane {
 
 	/* Per-Plane VCPU array */
 	struct xarray vcpu_array;
+
+	struct kvm_arch_plane arch;
 };
 
 struct kvm {
diff --git a/include/linux/kvm_types.h b/include/linux/kvm_types.h
index a568d8e6f4e8..07e82928c948 100644
--- a/include/linux/kvm_types.h
+++ b/include/linux/kvm_types.h
@@ -42,6 +42,7 @@ struct kvm_interrupt;
 struct kvm_irq_routing_table;
 struct kvm_memory_slot;
 struct kvm_one_reg;
+struct kvm_plane;
 struct kvm_run;
 struct kvm_userspace_memory_region;
 struct kvm_vcpu;
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index f85ddb0fc781..91fb9abf9b31 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1211,13 +1211,22 @@ static struct kvm_plane *kvm_create_plane(struct kvm *kvm, unsigned plane_level)
 
 	xa_init(&plane->vcpu_array);
 
+	if (kvm_arch_plane_init(kvm, plane, plane_level))
+		goto out_free_plane;
+
 	kvm->planes[plane_level] = plane;
 
 	return plane;
+
+out_free_plane:
+	kfree(plane);
+
+	return NULL;
 }
 
 static void kvm_destroy_one_plane(struct kvm_plane *plane)
 {
+	kvm_arch_plane_destroy(plane);
 	kfree(plane);
 }
 
-- 
2.53.0


