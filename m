Return-Path: <linux-mips+bounces-14951-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TyXMIHvbJmq4lwIAu9opvQ
	(envelope-from <linux-mips+bounces-14951-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 17:10:51 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D35C9657DCE
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 17:10:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14951-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-14951-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E4A7C349CC3C
	for <lists+linux-mips@lfdr.de>; Mon,  8 Jun 2026 14:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C568A3F20F9;
	Mon,  8 Jun 2026 14:43:20 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2A603CDBB7;
	Mon,  8 Jun 2026 14:43:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929799; cv=none; b=ZT6KAoQb7emTYtjU6RJweW6QNoH0Hd7hqnHD0chnjL2yC4RACn+4TKe+8v+QRu2gmh32bxZOK8R0Av70REmlWILTrnDFnzqf0y6KArcr1KYKUW8fe9I6bR1lCCC5MrFfujO1ulHu8Blp0SgpApGrw/D9dsiJZL7u1fO5WeeFCR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929799; c=relaxed/simple;
	bh=aQewu4BqiQ8P+vxLX+MOB9QTMpiBysR6fU3BJFYfyXY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uz1zePLgZTw/0iv8vgKjDTvst+nBqeQYrmsCnsQ5rFjm0yds2z4smBuWyvLqU1OXhh3F/I8gfalNl8+N6O4ED/Ag/ILrbyGqN1dzv+gC7jqqGOFbgPnftNsTkEN8ES2z9dTMCQruKGvgxxM/8hcTUOV1VD9O2CAqOeSO7GykKHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 16F122028B1;
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
Subject: [PATCH 14/60] kvm: Make kvm_running_vcpus point to struct kvm_vcpu_common
Date: Mon,  8 Jun 2026 16:42:06 +0200
Message-ID: <20260608144252.351443-15-joro@8bytes.org>
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
	TAGGED_FROM(0.00)[bounces-14951-lists,linux-mips=lfdr.de];
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
X-Rspamd-Queue-Id: D35C9657DCE

From: Joerg Roedel <joerg.roedel@amd.com>

This will remove the need to update kvm_running_vcpu on plane
switches.

Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 arch/arm64/kvm/arch_timer.c     |  3 ++-
 arch/arm64/kvm/vgic/vgic-init.c |  3 ++-
 include/linux/kvm_host.h        |  2 +-
 virt/kvm/kvm_main.c             | 18 +++++++++++-------
 4 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
index cbea4d9ee955..b2c4f422414e 100644
--- a/arch/arm64/kvm/arch_timer.c
+++ b/arch/arm64/kvm/arch_timer.c
@@ -204,7 +204,8 @@ static void soft_timer_cancel(struct hrtimer *hrt)
 
 static irqreturn_t kvm_arch_timer_handler(int irq, void *dev_id)
 {
-	struct kvm_vcpu *vcpu = *(struct kvm_vcpu **)dev_id;
+	struct kvm_vcpu_common *common = *(struct kvm_vcpu_common **)dev_id;
+	struct kvm_vcpu *vcpu = common->current_vcpu;
 	struct arch_timer_context *ctx;
 	struct timer_map map;
 
diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
index 933983bb2005..a12b89b423d5 100644
--- a/arch/arm64/kvm/vgic/vgic-init.c
+++ b/arch/arm64/kvm/vgic/vgic-init.c
@@ -730,7 +730,8 @@ void kvm_vgic_cpu_down(void)
 
 static irqreturn_t vgic_maintenance_handler(int irq, void *data)
 {
-	struct kvm_vcpu *vcpu = *(struct kvm_vcpu **)data;
+	struct kvm_vcpu_common *common = *(struct kvm_vcpu_common **)data;
+	struct kvm_vcpu *vcpu = common->current_vcpu;
 
 	/*
 	 * We cannot rely on the vgic maintenance interrupt to be
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index b334c15d834e..d54f299218a4 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2462,7 +2462,7 @@ static inline bool kvm_is_visible_memslot(struct kvm_memory_slot *memslot)
 }
 
 struct kvm_vcpu *kvm_get_running_vcpu(void);
-struct kvm_vcpu * __percpu *kvm_get_running_vcpus(void);
+struct kvm_vcpu_common * __percpu *kvm_get_running_vcpus(void);
 
 #if IS_ENABLED(CONFIG_HAVE_KVM_IRQ_BYPASS)
 struct kvm_kernel_irqfd;
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 2c16e124a507..9c07321e30f4 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -113,7 +113,7 @@ LIST_HEAD(vm_list);
 static struct kmem_cache *kvm_vcpu_cache;
 
 static __read_mostly struct preempt_ops kvm_preempt_ops;
-static DEFINE_PER_CPU(struct kvm_vcpu *, kvm_running_vcpu);
+static DEFINE_PER_CPU(struct kvm_vcpu_common *, kvm_running_vcpu);
 
 static struct dentry *kvm_debugfs_dir;
 
@@ -165,7 +165,7 @@ void vcpu_load(struct kvm_vcpu *vcpu)
 {
 	int cpu = get_cpu();
 
-	__this_cpu_write(kvm_running_vcpu, vcpu);
+	__this_cpu_write(kvm_running_vcpu, vcpu->common);
 	preempt_notifier_register(&vcpu->preempt_notifier);
 	kvm_arch_vcpu_load(vcpu, cpu);
 	put_cpu();
@@ -3954,7 +3954,7 @@ void __kvm_vcpu_kick(struct kvm_vcpu *vcpu, bool wait)
 	 * kick" check does not need atomic operations if kvm_vcpu_kick is used
 	 * within the vCPU thread itself.
 	 */
-	if (vcpu == __this_cpu_read(kvm_running_vcpu)) {
+	if (vcpu == kvm_get_running_vcpu()) {
 		if (vcpu->mode == IN_GUEST_MODE)
 			WRITE_ONCE(vcpu->mode, EXITING_GUEST_MODE);
 		goto out;
@@ -6500,7 +6500,7 @@ static void kvm_sched_in(struct preempt_notifier *pn, int cpu)
 	WRITE_ONCE(vcpu->preempted, false);
 	WRITE_ONCE(vcpu->ready, false);
 
-	__this_cpu_write(kvm_running_vcpu, vcpu);
+	__this_cpu_write(kvm_running_vcpu, vcpu->common);
 	kvm_arch_vcpu_load(vcpu, cpu);
 
 	WRITE_ONCE(vcpu->scheduled_out, false);
@@ -6532,12 +6532,16 @@ static void kvm_sched_out(struct preempt_notifier *pn,
  */
 struct kvm_vcpu *kvm_get_running_vcpu(void)
 {
-	struct kvm_vcpu *vcpu;
+	struct kvm_vcpu_common *common;
+	struct kvm_vcpu *vcpu = NULL;
 
 	preempt_disable();
-	vcpu = __this_cpu_read(kvm_running_vcpu);
+	common = __this_cpu_read(kvm_running_vcpu);
 	preempt_enable();
 
+	if (common)
+		vcpu = common->current_vcpu;
+
 	return vcpu;
 }
 EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_get_running_vcpu);
@@ -6545,7 +6549,7 @@ EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_get_running_vcpu);
 /**
  * kvm_get_running_vcpus - get the per-CPU array of currently running vcpus.
  */
-struct kvm_vcpu * __percpu *kvm_get_running_vcpus(void)
+struct kvm_vcpu_common * __percpu *kvm_get_running_vcpus(void)
 {
         return &kvm_running_vcpu;
 }
-- 
2.53.0


