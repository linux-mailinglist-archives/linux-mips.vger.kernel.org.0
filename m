Return-Path: <linux-mips+bounces-14972-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ic42O9LqJmprnAIAu9opvQ
	(envelope-from <linux-mips+bounces-14972-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 18:16:18 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AEC658959
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 18:16:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14972-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-14972-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4713B30FB676
	for <lists+linux-mips@lfdr.de>; Mon,  8 Jun 2026 14:52:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 611E43F8EAB;
	Mon,  8 Jun 2026 14:43:29 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F04D3F4110;
	Mon,  8 Jun 2026 14:43:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929808; cv=none; b=M7+sOMlNRu3j8vTx+sdjuvShQ+1+9lx5+uWrYT3Lv4+H/Rw+1BFZuAJLYam/ovUvhkiWV1O/CNopRZnrc12CbO8yNMc7DaqFB8IAKbkNIqsI5z7qPlDoyYeuGibXT5j9H+mkKp1569s8Hb8EFYou8Owxj8mXLJdqIY9/eq84N3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929808; c=relaxed/simple;
	bh=F02lYJzbyOlPLmx72TZVwtvZBBZwfMakGfpwggkLVQE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ro+W5nHPu3/eSZHhl1QxdQLqYG87LjtuEQZ0YVuWZSnoHE8bnYrqVbk/4R7r/00EbvlV4YyWIJpVLc3F6EOYIUarA2DnyWJ0/53zu16oFXBCG3f8GjhLPvpgTpPfeQEvPUo394W7R08Ssrv7JlUi7KCQyR5rAygnv41ut4gas0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 0BE7C2028C8;
	Mon,  8 Jun 2026 16:43:13 +0200 (CEST)
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
Subject: [PATCH 37/60] kvm: Pass plane_level to kvm_set_routing_entry()
Date: Mon,  8 Jun 2026 16:42:29 +0200
Message-ID: <20260608144252.351443-38-joro@8bytes.org>
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
X-Spamd-Result: default: False [0.95 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.91)[subject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
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
	TAGGED_FROM(0.00)[bounces-14972-lists,linux-mips=lfdr.de];
	FORGED_SENDER(0.00)[joro@8bytes.org,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,8bytes.org:mid,8bytes.org:from_mime,vger.kernel.org:from_smtp,amd.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 95AEC658959

From: Joerg Roedel <joerg.roedel@amd.com>

The plane_level is used to route MSI IRQs to the correct plane.

Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 arch/arm64/kvm/vgic/vgic-irqfd.c | 6 ++++--
 arch/loongarch/kvm/irqfd.c       | 6 ++++--
 arch/powerpc/kvm/mpic.c          | 5 +++--
 arch/riscv/kvm/vm.c              | 5 +++--
 arch/s390/kvm/interrupt.c        | 3 ++-
 arch/x86/kvm/irq.c               | 7 ++++---
 include/linux/kvm_host.h         | 3 ++-
 virt/kvm/irqchip.c               | 2 +-
 8 files changed, 23 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-irqfd.c b/arch/arm64/kvm/vgic/vgic-irqfd.c
index 479b896c8954..53e5fcc591d7 100644
--- a/arch/arm64/kvm/vgic/vgic-irqfd.c
+++ b/arch/arm64/kvm/vgic/vgic-irqfd.c
@@ -33,11 +33,13 @@ static int vgic_irqfd_set_irq(struct kvm_kernel_irq_routing_entry *e,
  * @kvm: the VM this entry is applied to
  * @e: kvm kernel routing entry handle
  * @ue: user api routing entry handle
+ * @plane_level: target plane level
  * return 0 on success, -EINVAL on errors.
  */
 int kvm_set_routing_entry(struct kvm *kvm,
 			  struct kvm_kernel_irq_routing_entry *e,
-			  const struct kvm_irq_routing_entry *ue)
+			  const struct kvm_irq_routing_entry *ue,
+			  unsigned plane_level)
 {
 	int r = -EINVAL;
 
@@ -57,7 +59,7 @@ int kvm_set_routing_entry(struct kvm *kvm,
 		e->msi.data = ue->u.msi.data;
 		e->msi.flags = ue->flags;
 		e->msi.devid = ue->u.msi.devid;
-		e->msi.plane_level = 0;
+		e->msi.plane_level = plane_level;
 		break;
 	default:
 		goto out;
diff --git a/arch/loongarch/kvm/irqfd.c b/arch/loongarch/kvm/irqfd.c
index 50f0c32df46c..a36a8a9d8a66 100644
--- a/arch/loongarch/kvm/irqfd.c
+++ b/arch/loongarch/kvm/irqfd.c
@@ -39,11 +39,13 @@ int kvm_set_msi(struct kvm_kernel_irq_routing_entry *e,
  * @kvm: the VM this entry is applied to
  * @e: kvm kernel routing entry handle
  * @ue: user api routing entry handle
+ * @plane_level: target plane level
  * return 0 on success, -EINVAL on errors.
  */
 int kvm_set_routing_entry(struct kvm *kvm,
 			struct kvm_kernel_irq_routing_entry *e,
-			const struct kvm_irq_routing_entry *ue)
+			const struct kvm_irq_routing_entry *ue,
+			unsigned plane_level)
 {
 	switch (ue->type) {
 	case KVM_IRQ_ROUTING_IRQCHIP:
@@ -60,7 +62,7 @@ int kvm_set_routing_entry(struct kvm *kvm,
 		e->msi.address_lo = ue->u.msi.address_lo;
 		e->msi.address_hi = ue->u.msi.address_hi;
 		e->msi.data = ue->u.msi.data;
-		e->msi.plane_level = 0;
+		e->msi.plane_level = plane_level;
 		return 0;
 	default:
 		return -EINVAL;
diff --git a/arch/powerpc/kvm/mpic.c b/arch/powerpc/kvm/mpic.c
index 0f568f5fff8b..6b6eba7fbf75 100644
--- a/arch/powerpc/kvm/mpic.c
+++ b/arch/powerpc/kvm/mpic.c
@@ -1824,7 +1824,8 @@ int kvm_set_msi(struct kvm_kernel_irq_routing_entry *e,
 
 int kvm_set_routing_entry(struct kvm *kvm,
 			  struct kvm_kernel_irq_routing_entry *e,
-			  const struct kvm_irq_routing_entry *ue)
+			  const struct kvm_irq_routing_entry *ue,
+			  unsigned plane_level)
 {
 	int r = -EINVAL;
 
@@ -1841,7 +1842,7 @@ int kvm_set_routing_entry(struct kvm *kvm,
 		e->msi.address_lo = ue->u.msi.address_lo;
 		e->msi.address_hi = ue->u.msi.address_hi;
 		e->msi.data = ue->u.msi.data;
-		e->msi.plane_level = 0;
+		e->msi.plane_level = plane_level;
 		break;
 	default:
 		goto out;
diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
index f518247e699b..6b3c8a0e74e2 100644
--- a/arch/riscv/kvm/vm.c
+++ b/arch/riscv/kvm/vm.c
@@ -118,7 +118,8 @@ bool kvm_arch_can_set_irq_routing(struct kvm *kvm)
 
 int kvm_set_routing_entry(struct kvm *kvm,
 			  struct kvm_kernel_irq_routing_entry *e,
-			  const struct kvm_irq_routing_entry *ue)
+			  const struct kvm_irq_routing_entry *ue,
+			  unsigned plane_level)
 {
 	int r = -EINVAL;
 
@@ -138,7 +139,7 @@ int kvm_set_routing_entry(struct kvm *kvm,
 		e->msi.data = ue->u.msi.data;
 		e->msi.flags = ue->flags;
 		e->msi.devid = ue->u.msi.devid;
-		e->msi.plane_level = 0;
+		e->msi.plane_level = plane_level;
 		break;
 	default:
 		goto out;
diff --git a/arch/s390/kvm/interrupt.c b/arch/s390/kvm/interrupt.c
index 1d66ef9f7527..dbd6029773aa 100644
--- a/arch/s390/kvm/interrupt.c
+++ b/arch/s390/kvm/interrupt.c
@@ -2862,7 +2862,8 @@ void kvm_s390_reinject_machine_check(struct kvm_vcpu *vcpu,
 
 int kvm_set_routing_entry(struct kvm *kvm,
 			  struct kvm_kernel_irq_routing_entry *e,
-			  const struct kvm_irq_routing_entry *ue)
+			  const struct kvm_irq_routing_entry *ue,
+			  unsigned plane_level)
 {
 	const struct kvm_irq_routing_s390_adapter *adapter;
 	u64 uaddr_s, uaddr_i;
diff --git a/arch/x86/kvm/irq.c b/arch/x86/kvm/irq.c
index b7e08eddb765..d2ecfd54d57a 100644
--- a/arch/x86/kvm/irq.c
+++ b/arch/x86/kvm/irq.c
@@ -295,7 +295,8 @@ bool kvm_arch_can_set_irq_routing(struct kvm *kvm)
 
 int kvm_set_routing_entry(struct kvm *kvm,
 			  struct kvm_kernel_irq_routing_entry *e,
-			  const struct kvm_irq_routing_entry *ue)
+			  const struct kvm_irq_routing_entry *ue,
+			  unsigned plane_level)
 {
 	/* We can't check irqchip_in_kernel() here as some callers are
 	 * currently initializing the irqchip. Other callers should therefore
@@ -304,7 +305,7 @@ int kvm_set_routing_entry(struct kvm *kvm,
 	switch (ue->type) {
 #ifdef CONFIG_KVM_IOAPIC
 	case KVM_IRQ_ROUTING_IRQCHIP:
-		if (irqchip_split(kvm))
+		if (irqchip_split(kvm) || plane_level != 0)
 			return -EINVAL;
 		e->irqchip.pin = ue->u.irqchip.pin;
 		switch (ue->u.irqchip.irqchip) {
@@ -332,7 +333,7 @@ int kvm_set_routing_entry(struct kvm *kvm,
 		e->msi.address_lo = ue->u.msi.address_lo;
 		e->msi.address_hi = ue->u.msi.address_hi;
 		e->msi.data = ue->u.msi.data;
-		e->msi.plane_level = 0;
+		e->msi.plane_level = plane_level;
 
 		if (kvm_msi_route_invalid(kvm, e))
 			return -EINVAL;
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 16dcca3132d3..cfb6911d6771 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2355,7 +2355,8 @@ int kvm_set_irq_routing(struct kvm *kvm,
 int kvm_init_irq_routing(struct kvm *kvm);
 int kvm_set_routing_entry(struct kvm *kvm,
 			  struct kvm_kernel_irq_routing_entry *e,
-			  const struct kvm_irq_routing_entry *ue);
+			  const struct kvm_irq_routing_entry *ue,
+			  unsigned plane_level);
 void kvm_free_irq_routing(struct kvm *kvm);
 
 #else
diff --git a/virt/kvm/irqchip.c b/virt/kvm/irqchip.c
index ae47e56176f1..14480d1df4f9 100644
--- a/virt/kvm/irqchip.c
+++ b/virt/kvm/irqchip.c
@@ -146,7 +146,7 @@ static int setup_routing_entry(struct kvm *kvm,
 
 	e->gsi = gsi;
 	e->type = ue->type;
-	r = kvm_set_routing_entry(kvm, e, ue);
+	r = kvm_set_routing_entry(kvm, e, ue, 0);
 	if (r)
 		return r;
 	if (e->type == KVM_IRQ_ROUTING_IRQCHIP)
-- 
2.53.0


