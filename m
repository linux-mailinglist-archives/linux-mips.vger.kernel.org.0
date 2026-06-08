Return-Path: <linux-mips+bounces-14966-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HFUdJunaJmqNlwIAu9opvQ
	(envelope-from <linux-mips+bounces-14966-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 17:08:25 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F9C657D3C
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 17:08:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14966-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-14966-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4E21C30A16D5
	for <lists+linux-mips@lfdr.de>; Mon,  8 Jun 2026 14:52:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A6633F6C42;
	Mon,  8 Jun 2026 14:43:26 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98FD03F1ADD;
	Mon,  8 Jun 2026 14:43:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929806; cv=none; b=NNdCm5jD+9ouwHUn/Vyl1fgNx71sUJj9yn/toXBo0oqokeM8FFZYsTRaNcFdvRun5NSMzqFLhrjVBuNo5omTI/E9ijw2yQnX+8Zc1vYKVnyTan52o8W4RDO63nI3Gcrd1B5zqCt4EjWTSilj/2CXNol81vjAEI/U2OHXKmZ3TPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929806; c=relaxed/simple;
	bh=Kx6usmQZyoTepTASnVWuTPJCepDAX1PROg4KuGNUQGs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tNKYvsRjkhBkEXX6xxFU3Ykna27FQb6M64ey7KeIRcZqM+r/h7F33i9f6hiJdfR+RaT61iftzzd5NSxV5SQU+k90UUWlGvVVYKLc43NJd6Qhxm9sJnLJRaiylmCErjTi1vO1Ef2s7JT0oEFop4z4lTLOTtb+Ai3tMKM/Emos94E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id B53292028C2;
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
Subject: [PATCH 31/60] kvm: Allocate struct kvm_plane in architecture code
Date: Mon,  8 Jun 2026 16:42:23 +0200
Message-ID: <20260608144252.351443-32-joro@8bytes.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
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
	TAGGED_FROM(0.00)[bounces-14966-lists,linux-mips=lfdr.de];
	FORGED_SENDER(0.00)[joro@8bytes.org,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[8bytes.org:mid,8bytes.org:from_mime,vger.kernel.org:from_smtp,amd.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 96F9C657D3C

From: Joerg Roedel <joerg.roedel@amd.com>

Move plane allocation to architecture code so that per-arch
implementations can embed the structure into another one for keeping
additional data.

Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 arch/arm64/kvm/arm.c       | 13 +++++++++++++
 arch/loongarch/kvm/vm.c    | 13 +++++++++++++
 arch/mips/kvm/mips.c       | 13 +++++++++++++
 arch/powerpc/kvm/powerpc.c | 13 +++++++++++++
 arch/riscv/kvm/main.c      | 13 +++++++++++++
 arch/s390/kvm/kvm-s390.c   | 13 +++++++++++++
 arch/x86/kvm/x86.c         | 13 +++++++++++++
 include/linux/kvm_host.h   |  2 ++
 virt/kvm/kvm_main.c        |  6 +++---
 9 files changed, 96 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 7e6d2773fd39..d7a4b9b239dc 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -205,6 +205,19 @@ unsigned kvm_arch_max_planes(struct kvm *kvm)
 	return 1;
 }
 
+struct kvm_plane *kvm_alloc_plane(void)
+{
+	/* For better type checking, do not return kzalloc() value directly */
+	struct kvm_plane *plane = kzalloc(sizeof(*plane), GFP_KERNEL_ACCOUNT);
+
+	return plane;
+}
+
+void kvm_free_plane(struct kvm_plane *plane)
+{
+	kfree(plane);
+}
+
 /**
  * kvm_arch_init_vm - initializes a VM data structure
  * @kvm:	pointer to the KVM struct
diff --git a/arch/loongarch/kvm/vm.c b/arch/loongarch/kvm/vm.c
index 14f1232c6e0c..e4d2814b717d 100644
--- a/arch/loongarch/kvm/vm.c
+++ b/arch/loongarch/kvm/vm.c
@@ -114,6 +114,19 @@ unsigned kvm_arch_max_planes(struct kvm *kvm)
 	return 1;
 }
 
+struct kvm_plane *kvm_alloc_plane(void)
+{
+	/* For better type checking, do not return kzalloc() value directly */
+	struct kvm_plane *plane = kzalloc(sizeof(*plane), GFP_KERNEL_ACCOUNT);
+
+	return plane;
+}
+
+void kvm_free_plane(struct kvm_plane *plane)
+{
+	kfree(plane);
+}
+
 int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 {
 	int r;
diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index 60870452119d..e22d2a267e03 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -120,6 +120,19 @@ unsigned kvm_arch_max_planes(struct kvm *kvm)
 	return 1;
 }
 
+struct kvm_plane *kvm_alloc_plane(void)
+{
+	/* For better type checking, do not return kzalloc() value directly */
+	struct kvm_plane *plane = kzalloc(sizeof(*plane), GFP_KERNEL_ACCOUNT);
+
+	return plane;
+}
+
+void kvm_free_plane(struct kvm_plane *plane)
+{
+	kfree(plane);
+}
+
 bool kvm_arch_vcpu_in_kernel(struct kvm_vcpu *vcpu)
 {
 	return false;
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index cfa40be20e00..35658cded0cb 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -504,6 +504,19 @@ unsigned kvm_arch_max_planes(struct kvm *kvm)
 	return 1;
 }
 
+struct kvm_plane *kvm_alloc_plane(void)
+{
+	/* For better type checking, do not return kzalloc() value directly */
+	struct kvm_plane *plane = kzalloc(sizeof(*plane), GFP_KERNEL_ACCOUNT);
+
+	return plane;
+}
+
+void kvm_free_plane(struct kvm_plane *plane)
+{
+	kfree(plane);
+}
+
 int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 {
 	int r;
diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index 5adba3a455a3..46834b2ddfae 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -22,6 +22,19 @@ unsigned kvm_arch_max_planes(struct kvm *kvm)
 	return 1;
 }
 
+struct kvm_plane *kvm_alloc_plane(void)
+{
+	/* For better type checking, do not return kzalloc() value directly */
+	struct kvm_plane *plane = kzalloc(sizeof(*plane), GFP_KERNEL_ACCOUNT);
+
+	return plane;
+}
+
+void kvm_free_plane(struct kvm_plane *plane)
+{
+	kfree(plane);
+}
+
 static void kvm_riscv_setup_vendor_features(void)
 {
 	/* Andes AX66: split two-stage TLBs */
diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index 24f24ea95f86..94c40b2aa759 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -3191,6 +3191,19 @@ unsigned kvm_arch_max_planes(struct kvm *kvm)
 	return 1;
 }
 
+struct kvm_plane *kvm_alloc_plane(void)
+{
+	/* For better type checking, do not return kzalloc() value directly */
+	struct kvm_plane *plane = kzalloc(sizeof(*plane), GFP_KERNEL_ACCOUNT);
+
+	return plane;
+}
+
+void kvm_free_plane(struct kvm_plane *plane)
+{
+	kfree(plane);
+}
+
 void kvm_arch_free_vm(struct kvm *kvm)
 {
 	if (IS_ENABLED(CONFIG_VFIO_PCI_ZDEV_KVM))
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 25299c8c28e3..d6bf0425525c 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -487,6 +487,19 @@ unsigned kvm_arch_max_planes(struct kvm *kvm)
 	return 1;
 }
 
+struct kvm_plane *kvm_alloc_plane(void)
+{
+	/* For better type checking, do not return kzalloc() value directly */
+	struct kvm_plane *plane = kzalloc(sizeof(*plane), GFP_KERNEL_ACCOUNT);
+
+	return plane;
+}
+
+void kvm_free_plane(struct kvm_plane *plane)
+{
+	kfree(plane);
+}
+
 /*
  * All feature MSRs except uCode revID, which tracks the currently loaded uCode
  * patch, are immutable once the vCPU model is defined.
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 90b97137840e..55e3e9046975 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1157,6 +1157,8 @@ void vcpu_load(struct kvm_vcpu *vcpu);
 void vcpu_put(struct kvm_vcpu *vcpu);
 
 unsigned kvm_arch_max_planes(struct kvm *kvm);
+struct kvm_plane *kvm_alloc_plane(void);
+void kvm_free_plane(struct kvm_plane *plane);
 
 #ifdef CONFIG_KVM_IOAPIC
 void kvm_arch_post_irq_ack_notifier_list_update(struct kvm *kvm);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index f0f78bb74e51..4f2c8f46a0d3 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1209,7 +1209,7 @@ static void kvm_disable_virtualization(void);
 
 static struct kvm_plane *kvm_create_plane(struct kvm *kvm, unsigned plane_level)
 {
-	struct kvm_plane *plane = kzalloc(sizeof(*plane), GFP_KERNEL_ACCOUNT);
+	struct kvm_plane *plane = kvm_alloc_plane();
 
 	if (!plane)
 		return NULL;
@@ -1227,7 +1227,7 @@ static struct kvm_plane *kvm_create_plane(struct kvm *kvm, unsigned plane_level)
 	return plane;
 
 out_free_plane:
-	kfree(plane);
+	kvm_free_plane(plane);
 
 	return NULL;
 }
@@ -1235,7 +1235,7 @@ static struct kvm_plane *kvm_create_plane(struct kvm *kvm, unsigned plane_level)
 static void kvm_destroy_one_plane(struct kvm_plane *plane)
 {
 	kvm_arch_plane_destroy(plane);
-	kfree(plane);
+	kvm_free_plane(plane);
 }
 
 static void kvm_destroy_planes(struct kvm *kvm)
-- 
2.53.0


