Return-Path: <linux-mips+bounces-14957-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id S7TSBZnYJmrYlgIAu9opvQ
	(envelope-from <linux-mips+bounces-14957-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 16:58:33 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBEB657B50
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 16:58:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14957-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-14957-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 55BA3305918A
	for <lists+linux-mips@lfdr.de>; Mon,  8 Jun 2026 14:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E11C3F4DDC;
	Mon,  8 Jun 2026 14:43:23 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FD153F0AB9;
	Mon,  8 Jun 2026 14:43:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929803; cv=none; b=Yo8pdPO8IOEVxt3D5LrZqGKiKeQvzYwwnHIBUeSVn9yWcRP3yUAGarzmCQUHO++FiXQNbMfu8croiCoa06OuLRQYbflewkVOs8VNMUrminv68KJTaS43lq9Wq64PNR55lwGqrE+W4iLGsnQx+6r9th3BmF/xeI4WCw1H/CashII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929803; c=relaxed/simple;
	bh=ecIswUIlz2dZEZyPp1fDGDg0/BzqfWneAm2qf4rsnKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WwfZvL71fJfixUYWTN1MsixE9NLstTihTyCMSVBEvLS+gH9XJlvUgT8Iv2FFaGLnhXcxbwkyAxRT24szBP+PGYjP83edji8+566V6xiNLE2pqSJnogfTRJSw5prYKYcolOhHaDrZLrN1q0b2mxkB4oSskD4jsvdpswpUJsskN7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id BF5B22028B8;
	Mon,  8 Jun 2026 16:43:09 +0200 (CEST)
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
Subject: [PATCH 22/60] kvm: Move kvm_vcpu pid members to struct kvm_vcpu_common
Date: Mon,  8 Jun 2026 16:42:14 +0200
Message-ID: <20260608144252.351443-23-joro@8bytes.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
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
	TAGGED_FROM(0.00)[bounces-14957-lists,linux-mips=lfdr.de];
	FORGED_SENDER(0.00)[joro@8bytes.org,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,8bytes.org:mid,8bytes.org:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7CBEB657B50

From: Joerg Roedel <joerg.roedel@amd.com>

These are the same across all planes for one VCPU, so make then
shared.

Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 arch/arm64/include/asm/kvm_host.h |  2 +-
 arch/arm64/kvm/arm.c              |  2 +-
 include/linux/kvm_host.h          |  5 ++--
 virt/kvm/kvm_main.c               | 44 ++++++++++++++++---------------
 4 files changed, 28 insertions(+), 25 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index a49042bfa801..32dc484781f0 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1270,7 +1270,7 @@ int __kvm_arm_vcpu_set_events(struct kvm_vcpu *vcpu,
 void kvm_arm_halt_guest(struct kvm *kvm);
 void kvm_arm_resume_guest(struct kvm *kvm);
 
-#define vcpu_has_run_once(vcpu)	(!!READ_ONCE((vcpu)->pid))
+#define vcpu_has_run_once(vcpu)	(!!READ_ONCE((vcpu)->common->pid))
 
 #ifndef __KVM_NVHE_HYPERVISOR__
 #define kvm_call_hyp_nvhe(f, ...)						\
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 001f83f737ea..1e2f42134b74 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -726,7 +726,7 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	if (!cpumask_test_cpu(cpu, vcpu->kvm->arch.supported_cpus))
 		vcpu_set_on_unsupported_cpu(vcpu);
 
-	vcpu->arch.pid = pid_nr(vcpu->pid);
+	vcpu->arch.pid = pid_nr(vcpu->common->pid);
 }
 
 void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 3c72a462ccfa..73786712495d 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -346,6 +346,9 @@ struct kvm_vcpu_common {
 	int mode;
 	u64 requests;
 
+	struct pid *pid;
+	rwlock_t pid_lock;
+
 	/* Scheduling state */
 #ifdef CONFIG_PREEMPT_NOTIFIERS
 	struct preempt_notifier preempt_notifier;
@@ -368,8 +371,6 @@ struct kvm_vcpu {
 
 	struct kvm_run *run;
 
-	struct pid *pid;
-	rwlock_t pid_lock;
 	int sigset_active;
 	sigset_t sigset;
 	unsigned int halt_poll_ns;
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 7ea20d96bc89..af3c4e0081b8 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -475,6 +475,9 @@ static int kvm_vcpu_init_common(struct kvm_vcpu *vcpu, struct kvm *kvm, unsigned
 	common->kvm = kvm;
 	common->current_vcpu = vcpu;
 
+	common->pid = NULL;
+	rwlock_init(&common->pid_lock);
+
 	common->wants_to_run = false;
 	common->preempted = false;
 	common->ready = false;
@@ -510,8 +513,6 @@ static void kvm_vcpu_init(struct kvm_vcpu *vcpu, struct kvm *kvm, unsigned id)
 	vcpu->kvm = kvm;
 	vcpu->plane = kvm->planes[0];
 	vcpu->vcpu_id = id;
-	vcpu->pid = NULL;
-	rwlock_init(&vcpu->pid_lock);
 	kvm_async_pf_vcpu_init(vcpu);
 
 	kvm_vcpu_set_in_spin_loop(vcpu, false);
@@ -539,6 +540,12 @@ static void kvm_vcpu_common_destroy(struct kvm_vcpu *vcpu)
 	kvm->created_vcpus--;
 	mutex_unlock(&common->kvm->lock);
 
+	/*
+	 * No need for rcu_read_lock as VCPU_RUN is the only place that changes
+	 * the common->pid pointer, and at destruction time all file descriptors
+	 * are already gone.
+	 */
+	put_pid(common->pid);
 	kfree(common);
 }
 
@@ -549,13 +556,6 @@ static void kvm_vcpu_destroy(struct kvm_vcpu *vcpu)
 	kvm_vcpu_common_destroy(vcpu);
 	kvm_dirty_ring_free(&vcpu->dirty_ring);
 
-	/*
-	 * No need for rcu_read_lock as VCPU_RUN is the only place that changes
-	 * the vcpu->pid pointer, and at destruction time all file descriptors
-	 * are already gone.
-	 */
-	put_pid(vcpu->pid);
-
 	free_page((unsigned long)vcpu->run);
 	kmem_cache_free(kvm_vcpu_cache, vcpu);
 }
@@ -3996,16 +3996,17 @@ EXPORT_SYMBOL_FOR_KVM_INTERNAL(__kvm_vcpu_kick);
 
 int kvm_vcpu_yield_to(struct kvm_vcpu *target)
 {
+	struct kvm_vcpu_common *common = target->common;
 	struct task_struct *task = NULL;
 	int ret;
 
-	if (!read_trylock(&target->pid_lock))
+	if (!read_trylock(&common->pid_lock))
 		return 0;
 
-	if (target->pid)
-		task = get_pid_task(target->pid, PIDTYPE_PID);
+	if (common->pid)
+		task = get_pid_task(common->pid, PIDTYPE_PID);
 
-	read_unlock(&target->pid_lock);
+	read_unlock(&common->pid_lock);
 
 	if (!task)
 		return 0;
@@ -4258,9 +4259,9 @@ static int vcpu_get_pid(void *data, u64 *val)
 {
 	struct kvm_vcpu *vcpu = data;
 
-	read_lock(&vcpu->pid_lock);
-	*val = pid_nr(vcpu->pid);
-	read_unlock(&vcpu->pid_lock);
+	read_lock(&vcpu->common->pid_lock);
+	*val = pid_nr(vcpu->common->pid);
+	read_unlock(&vcpu->common->pid_lock);
 	return 0;
 }
 
@@ -4558,6 +4559,7 @@ static long kvm_vcpu_ioctl(struct file *filp,
 		return -EINTR;
 	switch (ioctl) {
 	case KVM_RUN: {
+		struct kvm_vcpu_common *common = vcpu->common;
 		struct pid *oldpid;
 		r = -EINVAL;
 		if (arg)
@@ -4569,7 +4571,7 @@ static long kvm_vcpu_ioctl(struct file *filp,
 		 * read vcpu->pid while this vCPU is in KVM_RUN, e.g. to yield
 		 * directly to this vCPU
 		 */
-		oldpid = vcpu->pid;
+		oldpid = common->pid;
 		if (unlikely(oldpid != task_pid(current))) {
 			/* The thread running this VCPU changed. */
 			struct pid *newpid;
@@ -4579,15 +4581,15 @@ static long kvm_vcpu_ioctl(struct file *filp,
 				break;
 
 			newpid = get_task_pid(current, PIDTYPE_PID);
-			write_lock(&vcpu->pid_lock);
-			vcpu->pid = newpid;
-			write_unlock(&vcpu->pid_lock);
+			write_lock(&common->pid_lock);
+			common->pid = newpid;
+			write_unlock(&common->pid_lock);
 
 			put_pid(oldpid);
 		}
 		vcpu->common->wants_to_run = !READ_ONCE(vcpu->run->immediate_exit__unsafe);
 		r = kvm_arch_vcpu_ioctl_run(vcpu);
-		vcpu->common->wants_to_run = false;
+		common->wants_to_run = false;
 
 		/*
 		 * FIXME: Remove this hack once all KVM architectures
-- 
2.53.0


