Return-Path: <linux-mips+bounces-14978-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HupfO+LqJmpunAIAu9opvQ
	(envelope-from <linux-mips+bounces-14978-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 18:16:34 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2D5658966
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 18:16:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14978-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-14978-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4394C30548BB
	for <lists+linux-mips@lfdr.de>; Mon,  8 Jun 2026 14:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50D923F9F25;
	Mon,  8 Jun 2026 14:43:31 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E69193F4827;
	Mon,  8 Jun 2026 14:43:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929810; cv=none; b=EQ88+OFN8yhfC4Kl4FhBT9mDvff3xTDtVCstKL8p9K+/+OgGSEcvMmlxYMc6EynCGKvoHCkcDYlPgpyEvlzPMnBDhHW5HWTq//b80K/XljwugmvY8cSDXrPiYZ55Gjus713wU0b5yx4+DLG7PRzwzPsJdK69VyE9HLdIG0mk6H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929810; c=relaxed/simple;
	bh=rktM1kLgMfR1pAuVrq8Sp2Mu0If1kWT7IJIS4EULrY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M1aAggaSpx5K+V4HwP2wny3XXjOFiDgENNw9Fr9ziT5yRczy9wlC2H4o4LfWYsASkydeGi/AeHejdDlqn29lmmPT+ez2op4LXaN3cHm5aeeCPMbOm4YKThKOSk5WtwO8h4U5YvcLCyoxDJXSEH8aE5OFJIwf4q/sDKV4TT0Bbho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 7319F2028CA;
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
Subject: [PATCH 39/60] kvm: Make KVM_SET_GSI_ROUTING per plane
Date: Mon,  8 Jun 2026 16:42:31 +0200
Message-ID: <20260608144252.351443-40-joro@8bytes.org>
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
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:pbonzini@redhat.com,m:seanjc@google.com,m:thomas.lendacky@amd.com,m:ashish.kalra@amd.com,m:michael.roth@amd.com,m:nsaenz@amazon.com,m:anelkz@amazon.de,m:James.Bottomley@HansenPartnership.com,m:huibo.wang@amd.com,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kvmarm@lists.linux.dev,m:loongarch@lists.linux.dev,m:linux-mips@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm-riscv@lists.infradead.org,m:x86@kernel.org,m:coconut-svsm@lists.linux.dev,m:joerg.roedel@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14978-lists,linux-mips=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,8bytes.org:mid,8bytes.org:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,amd.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2E2D5658966

From: Joerg Roedel <joerg.roedel@amd.com>

Allow the KVM_SET_GSI_ROUTING on each plane. There is still only one
GSI routing table maintained per VM by the KVM module, the plane this
IOCTL was last issued at will get all GSI interrupts.

Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 arch/arm64/kvm/vgic/vgic-irqfd.c  |  2 +-
 arch/loongarch/kvm/intc/pch_pic.c |  2 +-
 arch/powerpc/kvm/mpic.c           |  2 +-
 arch/riscv/kvm/vm.c               |  2 +-
 arch/x86/kvm/irq.c                |  2 +-
 include/linux/kvm_host.h          |  3 +-
 virt/kvm/irqchip.c                | 10 +++--
 virt/kvm/kvm_main.c               | 62 +++++++++++++++----------------
 8 files changed, 44 insertions(+), 41 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-irqfd.c b/arch/arm64/kvm/vgic/vgic-irqfd.c
index 53e5fcc591d7..96981dd29a6e 100644
--- a/arch/arm64/kvm/vgic/vgic-irqfd.c
+++ b/arch/arm64/kvm/vgic/vgic-irqfd.c
@@ -153,7 +153,7 @@ int kvm_vgic_setup_default_irq_routing(struct kvm *kvm)
 		entries[i].u.irqchip.irqchip = 0;
 		entries[i].u.irqchip.pin = i;
 	}
-	ret = kvm_set_irq_routing(kvm, entries, nr, 0);
+	ret = kvm_set_irq_routing(kvm, entries, nr, 0, 0);
 	kfree(entries);
 	return ret;
 }
diff --git a/arch/loongarch/kvm/intc/pch_pic.c b/arch/loongarch/kvm/intc/pch_pic.c
index aa0ed59ae8cf..a0d04ffa8a71 100644
--- a/arch/loongarch/kvm/intc/pch_pic.c
+++ b/arch/loongarch/kvm/intc/pch_pic.c
@@ -423,7 +423,7 @@ static int kvm_setup_default_irq_routing(struct kvm *kvm)
 		entries[i].u.irqchip.irqchip = 0;
 		entries[i].u.irqchip.pin = i;
 	}
-	ret = kvm_set_irq_routing(kvm, entries, nr, 0);
+	ret = kvm_set_irq_routing(kvm, entries, nr, 0, 0);
 	kfree(entries);
 
 	return ret;
diff --git a/arch/powerpc/kvm/mpic.c b/arch/powerpc/kvm/mpic.c
index 6b6eba7fbf75..1e493179ee4f 100644
--- a/arch/powerpc/kvm/mpic.c
+++ b/arch/powerpc/kvm/mpic.c
@@ -1646,7 +1646,7 @@ static int mpic_set_default_irq_routing(struct openpic *opp)
 	if (!routing)
 		return -ENOMEM;
 
-	kvm_set_irq_routing(opp->kvm, routing, 0, 0);
+	kvm_set_irq_routing(opp->kvm, routing, 0, 0, 0);
 
 	kfree(routing);
 	return 0;
diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
index 6b3c8a0e74e2..bd9ab3240e4f 100644
--- a/arch/riscv/kvm/vm.c
+++ b/arch/riscv/kvm/vm.c
@@ -105,7 +105,7 @@ int kvm_riscv_setup_default_irq_routing(struct kvm *kvm, u32 lines)
 		ents[i].u.irqchip.irqchip = 0;
 		ents[i].u.irqchip.pin = i;
 	}
-	rc = kvm_set_irq_routing(kvm, ents, lines, 0);
+	rc = kvm_set_irq_routing(kvm, ents, lines, 0, 0);
 	kfree(ents);
 
 	return rc;
diff --git a/arch/x86/kvm/irq.c b/arch/x86/kvm/irq.c
index d2ecfd54d57a..90e2d2db2123 100644
--- a/arch/x86/kvm/irq.c
+++ b/arch/x86/kvm/irq.c
@@ -576,7 +576,7 @@ static const struct kvm_irq_routing_entry default_routing[] = {
 int kvm_setup_default_ioapic_and_pic_routing(struct kvm *kvm)
 {
 	return kvm_set_irq_routing(kvm, default_routing,
-				   ARRAY_SIZE(default_routing), 0);
+				   ARRAY_SIZE(default_routing), 0, 0);
 }
 
 int kvm_vm_ioctl_get_irqchip(struct kvm *kvm, struct kvm_irqchip *chip)
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 05a10836d92d..3b62fb354267 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2351,7 +2351,8 @@ bool kvm_arch_can_set_irq_routing(struct kvm *kvm);
 int kvm_set_irq_routing(struct kvm *kvm,
 			const struct kvm_irq_routing_entry *entries,
 			unsigned nr,
-			unsigned flags);
+			unsigned flags,
+			unsigned plane_level);
 int kvm_init_irq_routing(struct kvm *kvm);
 int kvm_set_routing_entry(struct kvm *kvm,
 			  struct kvm_kernel_irq_routing_entry *e,
diff --git a/virt/kvm/irqchip.c b/virt/kvm/irqchip.c
index a4fea7d8dde6..e0793ae0c719 100644
--- a/virt/kvm/irqchip.c
+++ b/virt/kvm/irqchip.c
@@ -128,7 +128,8 @@ void kvm_free_irq_routing(struct kvm *kvm)
 static int setup_routing_entry(struct kvm *kvm,
 			       struct kvm_irq_routing_table *rt,
 			       struct kvm_kernel_irq_routing_entry *e,
-			       const struct kvm_irq_routing_entry *ue)
+			       const struct kvm_irq_routing_entry *ue,
+			       unsigned plane_level)
 {
 	struct kvm_kernel_irq_routing_entry *ei;
 	int r;
@@ -146,7 +147,7 @@ static int setup_routing_entry(struct kvm *kvm,
 
 	e->gsi = gsi;
 	e->type = ue->type;
-	r = kvm_set_routing_entry(kvm, e, ue, 0);
+	r = kvm_set_routing_entry(kvm, e, ue, plane_level);
 	if (r)
 		return r;
 	if (e->type == KVM_IRQ_ROUTING_IRQCHIP)
@@ -169,7 +170,8 @@ bool __weak kvm_arch_can_set_irq_routing(struct kvm *kvm)
 int kvm_set_irq_routing(struct kvm *kvm,
 			const struct kvm_irq_routing_entry *ue,
 			unsigned nr,
-			unsigned flags)
+			unsigned flags,
+			unsigned plane_level)
 {
 	struct kvm_irq_routing_table *new, *old;
 	struct kvm_kernel_irq_routing_entry *e;
@@ -210,7 +212,7 @@ int kvm_set_irq_routing(struct kvm *kvm,
 				goto free_entry;
 			break;
 		}
-		r = setup_routing_entry(kvm, new, e, ue);
+		r = setup_routing_entry(kvm, new, e, ue, plane_level);
 		if (r)
 			goto free_entry;
 		++ue;
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index dc59f2f9d405..a6d7601c3412 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4918,6 +4918,34 @@ static long __kvm_plane_ioctl(struct kvm_plane *plane, unsigned int ioctl, unsig
 		break;
 	}
 #endif
+#ifdef CONFIG_HAVE_KVM_IRQ_ROUTING
+	case KVM_SET_GSI_ROUTING: {
+		void __user *argp = (void __user *)arg;
+		struct kvm_irq_routing routing;
+		struct kvm_irq_routing __user *urouting;
+		struct kvm_irq_routing_entry *entries = NULL;
+
+		if (copy_from_user(&routing, argp, sizeof(routing)))
+			return -EFAULT;
+		if (!kvm_arch_can_set_irq_routing(plane->kvm) ||
+		    routing.nr > KVM_MAX_IRQ_ROUTES ||
+		    routing.flags)
+			return -EINVAL;
+		if (routing.nr) {
+			urouting = argp;
+			entries = vmemdup_array_user(urouting->entries,
+						     routing.nr, sizeof(*entries));
+			if (IS_ERR(entries)) {
+				r = PTR_ERR(entries);
+				return r;
+			}
+		}
+		r = kvm_set_irq_routing(plane->kvm, entries, routing.nr,
+					routing.flags, plane->level);
+		kvfree(entries);
+		break;
+	}
+#endif /* CONFIG_HAVE_KVM_IRQ_ROUTING */
 	default:
 		r = -ENOTTY;
 	}
@@ -5506,6 +5534,9 @@ static long kvm_vm_ioctl(struct file *filp,
 	case KVM_CREATE_VCPU:
 #ifdef CONFIG_HAVE_KVM_MSI
 	case KVM_SIGNAL_MSI:
+#endif
+#ifdef CONFIG_HAVE_KVM_IRQ_ROUTING
+	case KVM_SET_GSI_ROUTING:
 #endif
 		r = __kvm_plane_ioctl(kvm->planes[0], ioctl, arg);
 		break;
@@ -5635,37 +5666,6 @@ static long kvm_vm_ioctl(struct file *filp,
 		break;
 	}
 #endif
-#ifdef CONFIG_HAVE_KVM_IRQ_ROUTING
-	case KVM_SET_GSI_ROUTING: {
-		struct kvm_irq_routing routing;
-		struct kvm_irq_routing __user *urouting;
-		struct kvm_irq_routing_entry *entries = NULL;
-
-		r = -EFAULT;
-		if (copy_from_user(&routing, argp, sizeof(routing)))
-			goto out;
-		r = -EINVAL;
-		if (!kvm_arch_can_set_irq_routing(kvm))
-			goto out;
-		if (routing.nr > KVM_MAX_IRQ_ROUTES)
-			goto out;
-		if (routing.flags)
-			goto out;
-		if (routing.nr) {
-			urouting = argp;
-			entries = vmemdup_array_user(urouting->entries,
-						     routing.nr, sizeof(*entries));
-			if (IS_ERR(entries)) {
-				r = PTR_ERR(entries);
-				goto out;
-			}
-		}
-		r = kvm_set_irq_routing(kvm, entries, routing.nr,
-					routing.flags);
-		kvfree(entries);
-		break;
-	}
-#endif /* CONFIG_HAVE_KVM_IRQ_ROUTING */
 #ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
 	case KVM_SET_MEMORY_ATTRIBUTES: {
 		struct kvm_memory_attributes attrs;
-- 
2.53.0


