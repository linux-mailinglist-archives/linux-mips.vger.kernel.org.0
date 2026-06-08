Return-Path: <linux-mips+bounces-14973-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sdnXOgvZJmoTlwIAu9opvQ
	(envelope-from <linux-mips+bounces-14973-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 17:00:27 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66622657C03
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 17:00:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14973-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-14973-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 410013078A02
	for <lists+linux-mips@lfdr.de>; Mon,  8 Jun 2026 14:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70DA13F8EAE;
	Mon,  8 Jun 2026 14:43:29 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B56863F20E9;
	Mon,  8 Jun 2026 14:43:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929808; cv=none; b=p5bQGurYgZGEyF28XqpkSWJRoHwK7LC9CwwvXIeGJohkh7pDNY6/A7zoCrZk9LheXQu9PqSkItKCB4sb21SiXnoeA0Vy+i8hUtSX+SZHJZOMhMLwuxqWSwIrzz9rHj5nyNcsr11sPLTWYto2LjPuxaZa7Nfo15h6slSYxEtLlXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929808; c=relaxed/simple;
	bh=wyg3CLEuRspMj18NL+RGWxAX5QENKg3H1zUIBYbL3U0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TEaIiEkFNzgcbrT8Y2ftWG+MsRvWs3F8SoK/b5ryMnG7f6v0B9pr1WxhrTIyQOoc2Bb+Ab8RdTCqjcqvTYN4FJ6OP8QVAwzB6kyml6vB2gN6n+17pQ2cMRALRn2hEE/zL+p0sCeL5gaBm1aUHBxtaUMOFL4G00cuGPjnr9T0Aak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 15AC22028BF;
	Mon,  8 Jun 2026 16:43:11 +0200 (CEST)
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
Subject: [PATCH 28/60] kvm: Implement KVM_CAP_PLANES
Date: Mon,  8 Jun 2026 16:42:20 +0200
Message-ID: <20260608144252.351443-29-joro@8bytes.org>
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
X-Spamd-Result: default: False [1.15 / 15.00];
	R_MIXED_CHARSET(1.11)[subject];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
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
	TAGGED_FROM(0.00)[bounces-14973-lists,linux-mips=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,amd.com:email,8bytes.org:mid,8bytes.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 66622657C03

From: Paolo Bonzini <pbonzini@redhat.com>

Introduce an architecture call-back to request the VM-specific maximum
number of supported planes. Use that to implement the KVM_CAP_PLANES
capability check.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Co-developed-by: Joerg Roedel <joerg.roedel@amd.com>
Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 arch/arm64/kvm/arm.c       | 5 +++++
 arch/loongarch/kvm/vm.c    | 5 +++++
 arch/mips/kvm/mips.c       | 5 +++++
 arch/powerpc/kvm/powerpc.c | 5 +++++
 arch/riscv/kvm/main.c      | 5 +++++
 arch/s390/kvm/kvm-s390.c   | 5 +++++
 arch/x86/kvm/x86.c         | 5 +++++
 include/linux/kvm_host.h   | 2 ++
 virt/kvm/kvm_main.c        | 4 ++++
 9 files changed, 41 insertions(+)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 1e2f42134b74..7e6d2773fd39 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -200,6 +200,11 @@ static int kvm_arm_default_max_vcpus(void)
 	return vgic_present ? kvm_vgic_get_max_vcpus() : KVM_MAX_VCPUS;
 }
 
+unsigned kvm_arch_max_planes(struct kvm *kvm)
+{
+	return 1;
+}
+
 /**
  * kvm_arch_init_vm - initializes a VM data structure
  * @kvm:	pointer to the KVM struct
diff --git a/arch/loongarch/kvm/vm.c b/arch/loongarch/kvm/vm.c
index 1317c718f896..14f1232c6e0c 100644
--- a/arch/loongarch/kvm/vm.c
+++ b/arch/loongarch/kvm/vm.c
@@ -109,6 +109,11 @@ void kvm_arch_destroy_vm(struct kvm *kvm)
 	kvm->arch.phyid_map = NULL;
 }
 
+unsigned kvm_arch_max_planes(struct kvm *kvm)
+{
+	return 1;
+}
+
 int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 {
 	int r;
diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index 776aba0af096..60870452119d 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -115,6 +115,11 @@ int kvm_arch_vcpu_runnable(struct kvm_vcpu *vcpu)
 	return !!(vcpu->arch.pending_exceptions);
 }
 
+unsigned kvm_arch_max_planes(struct kvm *kvm)
+{
+	return 1;
+}
+
 bool kvm_arch_vcpu_in_kernel(struct kvm_vcpu *vcpu)
 {
 	return false;
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 5d94e0f676ec..cfa40be20e00 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -499,6 +499,11 @@ void kvm_arch_destroy_vm(struct kvm *kvm)
 	module_put(kvm->arch.kvm_ops->owner);
 }
 
+unsigned kvm_arch_max_planes(struct kvm *kvm)
+{
+	return 1;
+}
+
 int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 {
 	int r;
diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index cb8a65273c1f..5adba3a455a3 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -17,6 +17,11 @@
 
 DEFINE_STATIC_KEY_FALSE(kvm_riscv_vsstage_tlb_no_gpa);
 
+unsigned kvm_arch_max_planes(struct kvm *kvm)
+{
+	return 1;
+}
+
 static void kvm_riscv_setup_vendor_features(void)
 {
 	/* Andes AX66: split two-stage TLBs */
diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index e6fe83da172f..24f24ea95f86 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -3186,6 +3186,11 @@ static void sca_dispose(struct kvm *kvm)
 	kvm->arch.sca = NULL;
 }
 
+unsigned kvm_arch_max_planes(struct kvm *kvm)
+{
+	return 1;
+}
+
 void kvm_arch_free_vm(struct kvm *kvm)
 {
 	if (IS_ENABLED(CONFIG_VFIO_PCI_ZDEV_KVM))
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 50601ac2828f..25299c8c28e3 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -482,6 +482,11 @@ static u32 msr_based_features[ARRAY_SIZE(msr_based_features_all_except_vmx) +
 			      (KVM_LAST_EMULATED_VMX_MSR - KVM_FIRST_EMULATED_VMX_MSR + 1)];
 static unsigned int num_msr_based_features;
 
+unsigned kvm_arch_max_planes(struct kvm *kvm)
+{
+	return 1;
+}
+
 /*
  * All feature MSRs except uCode revID, which tracks the currently loaded uCode
  * patch, are immutable once the vCPU model is defined.
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 291bccce9b74..3ecd472c7cfa 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1156,6 +1156,8 @@ void kvm_unlock_all_vcpus(struct kvm *kvm);
 void vcpu_load(struct kvm_vcpu *vcpu);
 void vcpu_put(struct kvm_vcpu *vcpu);
 
+unsigned kvm_arch_max_planes(struct kvm *kvm);
+
 #ifdef CONFIG_KVM_IOAPIC
 void kvm_arch_post_irq_ack_notifier_list_update(struct kvm *kvm);
 #else
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 7a0b632e3ac0..5a0277e2ac7c 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5079,6 +5079,10 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
 	case KVM_CAP_GUEST_MEMFD_FLAGS:
 		return kvm_gmem_get_supported_flags(kvm);
 #endif
+	case KVM_CAP_PLANES:
+		if (kvm)
+			return kvm_arch_max_planes(kvm);
+		return 1;
 	default:
 		break;
 	}
-- 
2.53.0


