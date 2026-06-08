Return-Path: <linux-mips+bounces-14962-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pa6GOyXbJmqklwIAu9opvQ
	(envelope-from <linux-mips+bounces-14962-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 17:09:26 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A73E657D80
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 17:09:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14962-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-14962-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 79BD5303B534
	for <lists+linux-mips@lfdr.de>; Mon,  8 Jun 2026 14:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 634F53F5BEE;
	Mon,  8 Jun 2026 14:43:25 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 181E13F1664;
	Mon,  8 Jun 2026 14:43:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929805; cv=none; b=HwYyu5dDASANW/pRpynvjHUr3npM2ApTPxwqq86MIm2zUYTDr+hWLAgyVD1Ul7u8Bymgf7hpy7hV7scjzTtxEvw5WfNPdj7xM6tkjA1uiv4lk7iSZaYj5zdykGPFAtu56p2awIO//Wu0gdr3ualjRf5rdjaF4l8EiErGwcQsNNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929805; c=relaxed/simple;
	bh=jpCqzdG+lgeMr8yoYpjHsS4+Gb9ANYixh1FwoG5am6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tw+2bBbVieRYUKD1nLoBJYntDkWeGCt0D66LbWFba3GmHdtpLbD1IdlpxHsnRIEZfvu9WjoKpw8MeA/CvarOBfSlgWNhl4PB/1IgnD5d/xV3Q/XGyipXLPdjyEF0hbl3cVQQKyLgmmSf/vXBPcppVW2iyJ0qavj6CC4EY6Z13Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id D09802028BE;
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
Subject: [PATCH 27/60] kvm: Introduce arch-specific part of struct kvm_vcpu_common
Date: Mon,  8 Jun 2026 16:42:19 +0200
Message-ID: <20260608144252.351443-28-joro@8bytes.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
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
	TAGGED_FROM(0.00)[bounces-14962-lists,linux-mips=lfdr.de];
	FORGED_SENDER(0.00)[joro@8bytes.org,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,8bytes.org:mid,8bytes.org:from_mime,amd.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8A73E657D80

From: Joerg Roedel <joerg.roedel@amd.com>

Give architectures a place to store their VCPU state which is shared
across all planes.

Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 arch/arm64/include/asm/kvm_host.h     | 5 +++++
 arch/loongarch/include/asm/kvm_host.h | 5 +++++
 arch/mips/include/asm/kvm_host.h      | 5 +++++
 arch/powerpc/include/asm/kvm_host.h   | 5 +++++
 arch/riscv/include/asm/kvm_host.h     | 5 +++++
 arch/s390/include/asm/kvm_host.h      | 5 +++++
 arch/x86/include/asm/kvm_host.h       | 5 +++++
 include/linux/kvm_host.h              | 2 ++
 include/linux/kvm_types.h             | 1 +
 virt/kvm/kvm_main.c                   | 8 ++++++++
 10 files changed, 46 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index e9cca2adb371..de9ca00ce4f4 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -869,6 +869,11 @@ struct vcpu_reset_state {
 
 struct vncr_tlb;
 
+struct kvm_vcpu_arch_common {};
+
+static inline int kvm_arch_vcpu_common_init(struct kvm_vcpu_common *common) { return 0; }
+static inline void kvm_arch_vcpu_common_destroy(struct kvm_vcpu_common *common) {}
+
 struct kvm_vcpu_arch {
 	struct kvm_cpu_context ctxt;
 
diff --git a/arch/loongarch/include/asm/kvm_host.h b/arch/loongarch/include/asm/kvm_host.h
index 225aa87ebbdd..7317dceda6b4 100644
--- a/arch/loongarch/include/asm/kvm_host.h
+++ b/arch/loongarch/include/asm/kvm_host.h
@@ -150,6 +150,11 @@ struct kvm_arch {
 	struct loongarch_pch_pic *pch_pic;
 };
 
+struct kvm_vcpu_arch_common {};
+
+static inline int kvm_arch_vcpu_common_init(struct kvm_vcpu_common *common) { return 0; }
+static inline void kvm_arch_vcpu_common_destroy(struct kvm_vcpu_common *common) {}
+
 #define CSR_MAX_NUMS		0x800
 
 struct loongarch_csrs {
diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
index b01911eb9064..c48bca79207b 100644
--- a/arch/mips/include/asm/kvm_host.h
+++ b/arch/mips/include/asm/kvm_host.h
@@ -194,6 +194,11 @@ struct kvm_arch {
 #endif
 };
 
+struct kvm_vcpu_arch_common {};
+
+static inline int kvm_arch_vcpu_common_init(struct kvm_vcpu_common *common) { return 0; }
+static inline void kvm_arch_vcpu_common_destroy(struct kvm_vcpu_common *common) {}
+
 #define N_MIPS_COPROC_REGS	32
 #define N_MIPS_COPROC_SEL	8
 
diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index c5b9fbaf34f3..47d9900c4f85 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -349,6 +349,11 @@ struct kvm_arch {
 #endif
 };
 
+struct kvm_vcpu_arch_common {};
+
+static inline int kvm_arch_vcpu_common_init(struct kvm_vcpu_common *common) { return 0; }
+static inline void kvm_arch_vcpu_common_destroy(struct kvm_vcpu_common *common) {}
+
 #define VCORE_ENTRY_MAP(vc)	((vc)->entry_exit_map & 0xff)
 #define VCORE_EXIT_MAP(vc)	((vc)->entry_exit_map >> 8)
 #define VCORE_IS_EXITING(vc)	(VCORE_EXIT_MAP(vc) != 0)
diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index bcbf487d4cb7..397491587f5b 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -107,6 +107,11 @@ struct kvm_arch {
 	bool mp_state_reset;
 };
 
+struct kvm_vcpu_arch_common {};
+
+static inline int kvm_arch_vcpu_common_init(struct kvm_vcpu_common *common) { return 0; }
+static inline void kvm_arch_vcpu_common_destroy(struct kvm_vcpu_common *common) {}
+
 struct kvm_cpu_trap {
 	unsigned long sepc;
 	unsigned long scause;
diff --git a/arch/s390/include/asm/kvm_host.h b/arch/s390/include/asm/kvm_host.h
index bb3bfbfd35d8..90fd8c0f1a2b 100644
--- a/arch/s390/include/asm/kvm_host.h
+++ b/arch/s390/include/asm/kvm_host.h
@@ -413,6 +413,11 @@ struct kvm_s390_pv_vcpu {
 	unsigned long stor_base;
 };
 
+struct kvm_vcpu_arch_common {};
+
+static inline int kvm_arch_vcpu_common_init(struct kvm_vcpu_common *common) { return 0; }
+static inline void kvm_arch_vcpu_common_destroy(struct kvm_vcpu_common *common) {}
+
 struct kvm_vcpu_arch {
 	struct kvm_s390_sie_block *sie_block;
 	/* if vsie is active, currently executed shadow sie control block */
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index dd95c70bfdba..1393566741a0 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -794,6 +794,11 @@ enum kvm_only_cpuid_leafs {
 	NKVMCAPINTS = NR_KVM_CPU_CAPS - NCAPINTS,
 };
 
+struct kvm_vcpu_arch_common {};
+
+static inline int kvm_arch_vcpu_common_init(struct kvm_vcpu_common *common) { return 0; }
+static inline void kvm_arch_vcpu_common_destroy(struct kvm_vcpu_common *common) {}
+
 struct kvm_vcpu_arch {
 	/*
 	 * rip and regs accesses must go through
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 4a0eaa1de479..291bccce9b74 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -375,6 +375,8 @@ struct kvm_vcpu_common {
 	bool scheduled_out;
 
 	struct kvm_dirty_ring dirty_ring;
+
+	struct kvm_vcpu_arch_common arch;
 };
 
 struct kvm_vcpu {
diff --git a/include/linux/kvm_types.h b/include/linux/kvm_types.h
index 07e82928c948..06799efe6a12 100644
--- a/include/linux/kvm_types.h
+++ b/include/linux/kvm_types.h
@@ -46,6 +46,7 @@ struct kvm_plane;
 struct kvm_run;
 struct kvm_userspace_memory_region;
 struct kvm_vcpu;
+struct kvm_vcpu_common;
 struct kvm_vcpu_init;
 struct kvm_memslots;
 
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 91fb9abf9b31..7a0b632e3ac0 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -490,6 +490,10 @@ static int kvm_vcpu_init_common(struct kvm_vcpu *vcpu, struct kvm *kvm, unsigned
 			goto out_drop_counter;
 	}
 
+	r = kvm_arch_vcpu_common_init(common);
+	if (r)
+		goto out_free_dirty_ring;
+
 	vcpu->common = no_free_ptr(common);
 
 	kvm_vcpu_set_in_spin_loop(vcpu, false);
@@ -497,6 +501,8 @@ static int kvm_vcpu_init_common(struct kvm_vcpu *vcpu, struct kvm *kvm, unsigned
 
 	return 0;
 
+out_free_dirty_ring:
+	kvm_dirty_ring_free(&common->dirty_ring);
 out_drop_counter:
 	mutex_lock(&kvm->lock);
 	kvm->created_vcpus--;
@@ -548,6 +554,8 @@ static void kvm_vcpu_common_destroy(struct kvm_vcpu *vcpu)
 	kvm->created_vcpus--;
 	mutex_unlock(&common->kvm->lock);
 
+	kvm_arch_vcpu_common_destroy(common);
+
 	/*
 	 * No need for rcu_read_lock as VCPU_RUN is the only place that changes
 	 * the common->pid pointer, and at destruction time all file descriptors
-- 
2.53.0


