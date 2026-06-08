Return-Path: <linux-mips+bounces-14956-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qn7PNL/aJmqJlwIAu9opvQ
	(envelope-from <linux-mips+bounces-14956-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 17:07:43 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D9373657D28
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 17:07:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14956-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-14956-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2E361314A009
	for <lists+linux-mips@lfdr.de>; Mon,  8 Jun 2026 14:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 232723F4117;
	Mon,  8 Jun 2026 14:43:22 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86E923EFD2C;
	Mon,  8 Jun 2026 14:43:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929801; cv=none; b=cCKewU+v9phWjMEjEz9liK1GQwPKfMdf9c4r2LEumrD+H7po1aezrG+dI93XpNAzPAp08kFVY77oH+b8A7eFyqf/p2/ylcPKhb+MaisONJgtwOzsamrBl3d4GJGh/b1RAcim2XLPHMwA7kkJhYwOwzDFwCt7M3i1grzI5YdNYnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929801; c=relaxed/simple;
	bh=sj5qOHLYW02zuH39dxwjZL1FmODVc+KM6dPGRJ9mA4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EV8E1B4VyMbnTl3jrwvky2gDsuZevDDywd4IM7t2MS2zYrK+CxcrtueUZ/J4ADo4yUD0QLRv2HH1YjxGML/WlwtsMn7stNp+R38B7pgz1ppSTFPG/OfOG0JVKX9bj8drhgBNdQJzGy8LSombASOBoJQ6e4ujR2kJM+hC3KieFgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id B17262028B4;
	Mon,  8 Jun 2026 16:43:08 +0200 (CEST)
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
Subject: [PATCH 17/60] kvm: Move VCPU locking to struct kvm_vcpu_common
Date: Mon,  8 Jun 2026 16:42:09 +0200
Message-ID: <20260608144252.351443-18-joro@8bytes.org>
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
	TAGGED_FROM(0.00)[bounces-14956-lists,linux-mips=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[8bytes.org:mid,8bytes.org:from_mime,amd.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D9373657D28

From: Joerg Roedel <joerg.roedel@amd.com>

Fields in struct kvm_vcpu which are protected by these locks is going
to move to struct kvm_vcpu_common. So move the locks as well.

Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 include/linux/kvm_host.h | 31 +++++++++++++++++--------------
 virt/kvm/kvm_main.c      |  3 ++-
 2 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 611bba515ac0..c8085c23e18e 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -330,6 +330,13 @@ struct kvm_vcpu_common {
 	/* Currently active VCPU */
 	struct kvm_vcpu *current_vcpu;
 
+	/* Locks */
+	int ____srcu_idx; /* Don't use this directly.  You've been warned. */
+#ifdef CONFIG_PROVE_RCU
+	int srcu_depth;
+#endif
+	struct mutex mutex;
+
 	/* Scheduling state */
 #ifdef CONFIG_PREEMPT_NOTIFIERS
 	struct preempt_notifier preempt_notifier;
@@ -347,15 +354,11 @@ struct kvm_vcpu {
 	int cpu;
 	int vcpu_id; /* id given by userspace at creation */
 	int vcpu_idx; /* index into kvm->planes[]->vcpu_array */
-	int ____srcu_idx; /* Don't use this directly.  You've been warned. */
-#ifdef CONFIG_PROVE_RCU
-	int srcu_depth;
-#endif
+
 	int mode;
 	u64 requests;
 	unsigned long guest_debug;
 
-	struct mutex mutex;
 	struct kvm_run *run;
 
 #ifndef __KVM_HAVE_ARCH_WQP
@@ -1001,35 +1004,35 @@ static inline void kvm_vm_bugged(struct kvm *kvm)
 
 static inline void kvm_vcpu_lock(struct kvm_vcpu *vcpu)
 {
-	mutex_lock(&vcpu->mutex);
+	mutex_lock(&vcpu->common->mutex);
 }
 
 static inline void kvm_vcpu_unlock(struct kvm_vcpu *vcpu)
 {
-	mutex_unlock(&vcpu->mutex);
+	mutex_unlock(&vcpu->common->mutex);
 }
 
 static inline struct mutex *kvm_vcpu_mutex(struct kvm_vcpu *vcpu)
 {
-	return &vcpu->mutex;
+	return &vcpu->common->mutex;
 }
 
 static inline void kvm_vcpu_srcu_read_lock(struct kvm_vcpu *vcpu)
 {
 #ifdef CONFIG_PROVE_RCU
-	WARN_ONCE(vcpu->srcu_depth++,
-		  "KVM: Illegal vCPU srcu_idx LOCK, depth=%d", vcpu->srcu_depth - 1);
+	WARN_ONCE(vcpu->common->srcu_depth++,
+		  "KVM: Illegal vCPU srcu_idx LOCK, depth=%d", vcpu->common->srcu_depth - 1);
 #endif
-	vcpu->____srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
+	vcpu->common->____srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
 }
 
 static inline void kvm_vcpu_srcu_read_unlock(struct kvm_vcpu *vcpu)
 {
-	srcu_read_unlock(&vcpu->kvm->srcu, vcpu->____srcu_idx);
+	srcu_read_unlock(&vcpu->kvm->srcu, vcpu->common->____srcu_idx);
 
 #ifdef CONFIG_PROVE_RCU
-	WARN_ONCE(--vcpu->srcu_depth,
-		  "KVM: Illegal vCPU srcu_idx UNLOCK, depth=%d", vcpu->srcu_depth);
+	WARN_ONCE(--vcpu->common->srcu_depth,
+		  "KVM: Illegal vCPU srcu_idx UNLOCK, depth=%d", vcpu->common->srcu_depth);
 #endif
 }
 
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index d6975a5c60b4..9accca10c249 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -466,6 +466,8 @@ static int kvm_vcpu_init_common(struct kvm_vcpu *vcpu, struct kvm *kvm, unsigned
 
 	common->vcpu_idx = atomic_read(&kvm->online_vcpus);
 
+	mutex_init(&common->mutex);
+
 	common->kvm = kvm;
 	common->current_vcpu = vcpu;
 
@@ -500,7 +502,6 @@ static void kvm_vcpu_finish_common(struct kvm_vcpu *vcpu)
 
 static void kvm_vcpu_init(struct kvm_vcpu *vcpu, struct kvm *kvm, unsigned id)
 {
-	mutex_init(&vcpu->mutex);
 	vcpu->cpu = -1;
 	vcpu->kvm = kvm;
 	vcpu->plane = kvm->planes[0];
-- 
2.53.0


