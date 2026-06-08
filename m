Return-Path: <linux-mips+bounces-14953-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MSpqOO/aJmqQlwIAu9opvQ
	(envelope-from <linux-mips+bounces-14953-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 17:08:31 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8B5657D47
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 17:08:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14953-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-mips+bounces-14953-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B9C583024FB6
	for <lists+linux-mips@lfdr.de>; Mon,  8 Jun 2026 14:51:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22ED83F23A3;
	Mon,  8 Jun 2026 14:43:21 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A7063EF67E;
	Mon,  8 Jun 2026 14:43:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929800; cv=none; b=UEON7/B5uh5Tv8IGjkmMQB6iAcOHi9dNz9NBHbGFOe+kKzlprF/DawMDFXYUbQPIWYgqYa0uvjPoNEtgaK5THIP9kec2RpQOviSu6K+IwYg8NtHd/pBhkjkQODVf34Bx5qolsCXSV7hWH6CeUjSuqk0VxcI4dZhbeqaacV/LOlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929800; c=relaxed/simple;
	bh=5lZgKKZU06HyUoBgmxgC+k6xsrw8n7Uakjte5BD8eLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nNcxoHpa+Ty9puCh0+E8Qk1olvqLkCMR2Gqs590YFpAI9Zv7qpksXFeU72KtRix3yWVYb5cGIAYl7y2n+fZW5e27AU3NVqbIBiBgyqQQjvgtj7g8eZlVLTJ1/wH1ag3mBD/3sIxgfWuE1IIJpunW6qNNCMGbSByzGPP1bLIDefg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 4B2B22028B2;
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
Subject: [PATCH 15/60] kvm: Move VCPU scheduling state to struct kvm_vcpu_common
Date: Mon,  8 Jun 2026 16:42:07 +0200
Message-ID: <20260608144252.351443-16-joro@8bytes.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
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
	TAGGED_FROM(0.00)[bounces-14953-lists,linux-mips=lfdr.de];
	FORGED_SENDER(0.00)[joro@8bytes.org,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[8bytes.org:mid,8bytes.org:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,amd.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BD8B5657D47

From: Joerg Roedel <joerg.roedel@amd.com>

The scheduling state of the KVM VCPU is shared between all per-plane
VCPU objects. Move it to struct kvm_vcpu_common.

Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 arch/x86/kvm/svm/svm.c   |  2 +-
 include/linux/kvm_host.h | 24 ++++++++++----------
 virt/kvm/kvm_main.c      | 47 +++++++++++++++++++++-------------------
 3 files changed, 39 insertions(+), 34 deletions(-)

diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 1524c1bb4f37..f5cc30a6732f 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -229,7 +229,7 @@ int svm_set_efer(struct kvm_vcpu *vcpu, u64 efer)
 			 * and only if the vCPU is actively running, e.g. to
 			 * avoid positives if userspace is stuffing state.
 			 */
-			if (is_guest_mode(vcpu) && vcpu->wants_to_run)
+			if (is_guest_mode(vcpu) && vcpu->common->wants_to_run)
 				kvm_make_request(KVM_REQ_TRIPLE_FAULT, vcpu);
 
 			svm_leave_nested(vcpu);
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index d54f299218a4..a6aacd507c02 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -329,15 +329,21 @@ struct kvm_vcpu_common {
 
 	/* Currently active VCPU */
 	struct kvm_vcpu *current_vcpu;
+
+	/* Scheduling state */
+#ifdef CONFIG_PREEMPT_NOTIFIERS
+	struct preempt_notifier preempt_notifier;
+#endif
+	bool wants_to_run;
+	bool preempted;
+	bool ready;
+	bool scheduled_out;
 };
 
 struct kvm_vcpu {
 	struct kvm *kvm;
 	struct kvm_plane *plane;
 
-#ifdef CONFIG_PREEMPT_NOTIFIERS
-	struct preempt_notifier preempt_notifier;
-#endif
 	int cpu;
 	int vcpu_id; /* id given by userspace at creation */
 	int vcpu_idx; /* index into kvm->planes[]->vcpu_array */
@@ -392,10 +398,6 @@ struct kvm_vcpu {
 		bool dy_eligible;
 	} spin_loop;
 #endif
-	bool wants_to_run;
-	bool preempted;
-	bool ready;
-	bool scheduled_out;
 	struct kvm_vcpu_arch arch;
 	struct kvm_vcpu_stat stat;
 	char stats_id[KVM_STATS_NAME_SIZE];
@@ -416,22 +418,22 @@ struct kvm_vcpu {
 
 static inline bool kvm_vcpu_wants_to_run(struct kvm_vcpu *vcpu)
 {
-	return vcpu->wants_to_run;
+	return vcpu->common->wants_to_run;
 }
 
 static inline bool kvm_vcpu_preempted(struct kvm_vcpu *vcpu)
 {
-	return READ_ONCE(vcpu->preempted);
+	return READ_ONCE(vcpu->common->preempted);
 }
 
 static inline bool kvm_vcpu_ready(struct kvm_vcpu *vcpu)
 {
-	return READ_ONCE(vcpu->ready);
+	return READ_ONCE(vcpu->common->ready);
 }
 
 static inline bool kvm_vcpu_scheduled_out(struct kvm_vcpu *vcpu)
 {
-	return vcpu->scheduled_out;
+	return vcpu->common->scheduled_out;
 }
 
 /*
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 9c07321e30f4..a44f8dc8418a 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -166,7 +166,7 @@ void vcpu_load(struct kvm_vcpu *vcpu)
 	int cpu = get_cpu();
 
 	__this_cpu_write(kvm_running_vcpu, vcpu->common);
-	preempt_notifier_register(&vcpu->preempt_notifier);
+	preempt_notifier_register(&vcpu->common->preempt_notifier);
 	kvm_arch_vcpu_load(vcpu, cpu);
 	put_cpu();
 }
@@ -176,7 +176,7 @@ void vcpu_put(struct kvm_vcpu *vcpu)
 {
 	preempt_disable();
 	kvm_arch_vcpu_put(vcpu);
-	preempt_notifier_unregister(&vcpu->preempt_notifier);
+	preempt_notifier_unregister(&vcpu->common->preempt_notifier);
 	__this_cpu_write(kvm_running_vcpu, NULL);
 	preempt_enable();
 }
@@ -468,6 +468,12 @@ static int kvm_vcpu_init_common(struct kvm_vcpu *vcpu, struct kvm *kvm, unsigned
 
 	common->kvm = kvm;
 	common->current_vcpu = vcpu;
+
+	common->wants_to_run = false;
+	common->preempted = false;
+	common->ready = false;
+	preempt_notifier_init(&common->preempt_notifier, &kvm_preempt_ops);
+
 	vcpu->common = no_free_ptr(common);
 
 	return 0;
@@ -508,9 +514,6 @@ static void kvm_vcpu_init(struct kvm_vcpu *vcpu, struct kvm *kvm, unsigned id)
 
 	kvm_vcpu_set_in_spin_loop(vcpu, false);
 	kvm_vcpu_set_dy_eligible(vcpu, false);
-	vcpu->preempted = false;
-	vcpu->ready = false;
-	preempt_notifier_init(&vcpu->preempt_notifier, &kvm_preempt_ops);
 	vcpu->last_used_slot = NULL;
 
 	vcpu->plane_level = 0;
@@ -3927,7 +3930,7 @@ EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_vcpu_halt);
 bool kvm_vcpu_wake_up(struct kvm_vcpu *vcpu)
 {
 	if (__kvm_vcpu_wake_up(vcpu)) {
-		WRITE_ONCE(vcpu->ready, true);
+		WRITE_ONCE(vcpu->common->ready, true);
 		++vcpu->stat.generic.halt_wakeup;
 		return true;
 	}
@@ -4580,9 +4583,9 @@ static long kvm_vcpu_ioctl(struct file *filp,
 
 			put_pid(oldpid);
 		}
-		vcpu->wants_to_run = !READ_ONCE(vcpu->run->immediate_exit__unsafe);
+		vcpu->common->wants_to_run = !READ_ONCE(vcpu->run->immediate_exit__unsafe);
 		r = kvm_arch_vcpu_ioctl_run(vcpu);
-		vcpu->wants_to_run = false;
+		vcpu->common->wants_to_run = false;
 
 		/*
 		 * FIXME: Remove this hack once all KVM architectures
@@ -6488,36 +6491,36 @@ static void kvm_init_debug(void)
 }
 
 static inline
-struct kvm_vcpu *preempt_notifier_to_vcpu(struct preempt_notifier *pn)
+struct kvm_vcpu_common *preempt_notifier_to_vcpu_common(struct preempt_notifier *pn)
 {
-	return container_of(pn, struct kvm_vcpu, preempt_notifier);
+	return container_of(pn, struct kvm_vcpu_common, preempt_notifier);
 }
 
 static void kvm_sched_in(struct preempt_notifier *pn, int cpu)
 {
-	struct kvm_vcpu *vcpu = preempt_notifier_to_vcpu(pn);
+	struct kvm_vcpu_common *common = preempt_notifier_to_vcpu_common(pn);
 
-	WRITE_ONCE(vcpu->preempted, false);
-	WRITE_ONCE(vcpu->ready, false);
+	WRITE_ONCE(common->preempted, false);
+	WRITE_ONCE(common->ready, false);
 
-	__this_cpu_write(kvm_running_vcpu, vcpu->common);
-	kvm_arch_vcpu_load(vcpu, cpu);
+	__this_cpu_write(kvm_running_vcpu, common);
+	kvm_arch_vcpu_load(common->current_vcpu, cpu);
 
-	WRITE_ONCE(vcpu->scheduled_out, false);
+	WRITE_ONCE(common->scheduled_out, false);
 }
 
 static void kvm_sched_out(struct preempt_notifier *pn,
 			  struct task_struct *next)
 {
-	struct kvm_vcpu *vcpu = preempt_notifier_to_vcpu(pn);
+	struct kvm_vcpu_common *common = preempt_notifier_to_vcpu_common(pn);
 
-	WRITE_ONCE(vcpu->scheduled_out, true);
+	WRITE_ONCE(common->scheduled_out, true);
 
-	if (task_is_runnable(current) && kvm_vcpu_wants_to_run(vcpu)) {
-		WRITE_ONCE(vcpu->preempted, true);
-		WRITE_ONCE(vcpu->ready, true);
+	if (task_is_runnable(current) && common->wants_to_run) {
+		WRITE_ONCE(common->preempted, true);
+		WRITE_ONCE(common->ready, true);
 	}
-	kvm_arch_vcpu_put(vcpu);
+	kvm_arch_vcpu_put(common->current_vcpu);
 	__this_cpu_write(kvm_running_vcpu, NULL);
 }
 
-- 
2.53.0


