Return-Path: <linux-mips+bounces-14970-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mrdqB1PbJmqvlwIAu9opvQ
	(envelope-from <linux-mips+bounces-14970-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 17:10:11 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DAB657DAD
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 17:10:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14970-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-14970-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DD65730330CA
	for <lists+linux-mips@lfdr.de>; Mon,  8 Jun 2026 14:52:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA7BB3F870C;
	Mon,  8 Jun 2026 14:43:28 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 684973D9DD9;
	Mon,  8 Jun 2026 14:43:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929808; cv=none; b=KtTN/dWxfo1E28kdxORyEG8qsnryklwMnWsynuf7RhEIKoK8ErH+iL/fWJVOBKZ+E5AR2zkwTPkmBf1OrKMfvGLLw5IpMa9ZzAAAfHENt1gXn5nHswGu8SNP5b8oO6slax2aC4+jY+Gzr1NObPBhYEOoGJVCn7Y2lGmWHb6OdQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929808; c=relaxed/simple;
	bh=eWpTCoZzUyM8LplF8Me7jkuNhwXVhyNCQZN7fpSl38I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rDkqGJ26ELUq6Uy7kWtfYm5bz0sOwWl0s2JLUrXIBwL5cjwXStrIRnyhDl7kGgh/VsL97Ns1+8XxVFe03K0VWnJTsLWNvHfB/YDEtB2bXXfA7uAj/x3wYKB/F/5/+9zL1iK3bzFmlA9lyfnpBviS/wr/lHOZekujqnk5YrOcA9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 9229F2028C6;
	Mon,  8 Jun 2026 16:43:12 +0200 (CEST)
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
Subject: [PATCH 35/60] kvm: Add VCPU plane-scheduling state and helpers
Date: Mon,  8 Jun 2026 16:42:27 +0200
Message-ID: <20260608144252.351443-36-joro@8bytes.org>
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
	TAGGED_FROM(0.00)[bounces-14970-lists,linux-mips=lfdr.de];
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
X-Rspamd-Queue-Id: B4DAB657DAD

From: Joerg Roedel <joerg.roedel@amd.com>

The algorithm is to always run the lowest runnable plane. Plane
switches are done by stopping the current plane and setting another
runnable.

Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 include/linux/kvm_host.h | 16 ++++++++++++++
 virt/kvm/kvm_main.c      | 45 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 5c3f9dfa15ea..e3611e6cc3e4 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -168,6 +168,7 @@ static inline bool kvm_is_error_gpa(gpa_t gpa)
 #define KVM_REQ_VM_DEAD			(1 | KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
 #define KVM_REQ_UNBLOCK			2
 #define KVM_REQ_DIRTY_RING_SOFT_FULL	3
+#define KVM_REQ_PLANE_RESCHED		4
 #define KVM_REQUEST_ARCH_BASE		8
 
 /*
@@ -324,6 +325,8 @@ struct kvm_mmio_fragment {
 	unsigned int len;
 };
 
+
+
 struct kvm_vcpu_common {
 	struct kvm *kvm;
 
@@ -381,6 +384,8 @@ struct kvm_vcpu_common {
 
 	struct kvm_dirty_ring dirty_ring;
 
+	bool plane_switch;
+
 	struct kvm_vcpu_arch_common arch;
 };
 
@@ -388,6 +393,12 @@ struct kvm_vcpu_common {
 	for ((i) = 0; (i) < KVM_MAX_PLANES; ++(i))		\
 		if (((v) = common->vcpus[(i)]) != NULL)
 
+/* Tracked per plane-VCPU - used for deciding which plane-vcpu to run */
+enum kvm_vcpu_state {
+	STOPPED,
+	RUNNABLE,
+};
+
 struct kvm_vcpu {
 	struct kvm *kvm;
 	struct kvm_plane *plane;
@@ -401,6 +412,7 @@ struct kvm_vcpu {
 	struct kvm_run *run;
 
 	u64 plane_requests;
+	enum kvm_vcpu_state plane_state;
 
 	/* S390 only */
 	bool valid_wakeup;
@@ -440,6 +452,10 @@ struct kvm_vcpu {
 	unsigned plane_level;
 };
 
+void kvm_vcpu_set_plane_runnable(struct kvm_vcpu *vcpu);
+void kvm_vcpu_set_plane_stopped(struct kvm_vcpu *vcpu);
+struct kvm_vcpu *kvm_vcpu_select_plane(struct kvm_vcpu *vcpu);
+
 static inline bool kvm_vcpu_wants_to_run(struct kvm_vcpu *vcpu)
 {
 	return vcpu->common->wants_to_run;
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 9d30fd85ce5f..a30123b77112 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4397,6 +4397,7 @@ static int kvm_plane_ioctl_create_vcpu(struct kvm_plane *plane, unsigned long id
 	vcpu->vcpu_idx = vcpu->common->vcpu_idx;
 	vcpu->plane = plane;
 	vcpu->plane_level = plane->level;
+	vcpu->plane_state = STOPPED;
 	vcpu->run = vcpu->common->run;
 
 	kvm_vcpu_init(vcpu, kvm, id);
@@ -4938,6 +4939,50 @@ static struct file_operations kvm_plane_fops = {
 	KVM_COMPAT(kvm_plane_ioctl),
 };
 
+void kvm_vcpu_set_plane_runnable(struct kvm_vcpu *vcpu)
+{
+	vcpu->plane_state = RUNNABLE;
+	vcpu->common->plane_switch = true;
+	kvm_make_request(KVM_REQ_PLANE_RESCHED, vcpu);
+}
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_vcpu_set_plane_runnable);
+
+void kvm_vcpu_set_plane_stopped(struct kvm_vcpu *vcpu)
+{
+	vcpu->plane_state = STOPPED;
+	kvm_make_request(KVM_REQ_PLANE_RESCHED, vcpu);
+}
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_vcpu_set_plane_stopped);
+
+struct kvm_vcpu *kvm_vcpu_select_plane(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vcpu_common *common = vcpu->common;
+	struct kvm_vcpu *ret = NULL;
+	unsigned i;
+
+	for (i = 0; i < KVM_MAX_PLANES; i++) {
+		if (common->vcpus[i] == NULL)
+			continue;
+
+		if (common->vcpus[i]->plane_state == RUNNABLE) {
+			ret = common->vcpus[i];
+			break;
+		}
+	}
+
+	if (ret == NULL) {
+		ret = common->vcpus[0];
+		ret->plane_state = RUNNABLE;
+	}
+
+	common->current_vcpu = ret;
+
+	common->plane_switch = false;
+
+	return ret;
+}
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_vcpu_select_plane);
+
 static int kvm_device_mmap(struct file *filp, struct vm_area_struct *vma)
 {
 	struct kvm_device *dev = filp->private_data;
-- 
2.53.0


