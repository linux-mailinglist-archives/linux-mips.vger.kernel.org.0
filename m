Return-Path: <linux-mips+bounces-14974-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id u5YnIMnbJmrNlwIAu9opvQ
	(envelope-from <linux-mips+bounces-14974-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 17:12:09 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D2395657E0D
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 17:12:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14974-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-14974-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6A88335AF6D
	for <lists+linux-mips@lfdr.de>; Mon,  8 Jun 2026 14:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE0233F8ECC;
	Mon,  8 Jun 2026 14:43:29 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71AA53F4859;
	Mon,  8 Jun 2026 14:43:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929809; cv=none; b=i61w7Nd0zshFcSwHDJICmEmsb6jJLh8T/ibZ7EfeocB1YrEYNfJQD+N6t2Dr2g5YUmzuD8TVlLszCtW9std1VD1ddFzRT4RGmi+c8wzJSTxHFK41j4ptaGAvt8mcOIIBz6Cps0RLkzb6Tt7rU2Jgxls0k5SHgt75caWSOEnf9bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929809; c=relaxed/simple;
	bh=Le/G0vQ0/TnbqWe2dBxWLFgIozxJJ/jsvXKWfnBsbj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MO+NdmJcdrh1VeNWgRF8IpjCaV1b2Buz7rF8n/X2tuu7LgVk1nLAs+yygS+Q4msqD4MI5kskR8y9j2TiJzFzMSp/i7x1tlHU+Z3SyUcDSFkeG6R6pe8sJAAojlupyJrfN9V6gP+ugQj56ZjYH7atuD7+PH5u1eLqJGKzStKYhLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 3F1722028C9;
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
Subject: [PATCH 38/60] kvm: Make KVM_SIGNAL_MSI per plane
Date: Mon,  8 Jun 2026 16:42:30 +0200
Message-ID: <20260608144252.351443-39-joro@8bytes.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[lists@lfdr.de];
	DMARC_NA(0.00)[8bytes.org: no valid DMARC record];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pbonzini@redhat.com,m:seanjc@google.com,m:thomas.lendacky@amd.com,m:ashish.kalra@amd.com,m:michael.roth@amd.com,m:nsaenz@amazon.com,m:anelkz@amazon.de,m:James.Bottomley@HansenPartnership.com,m:huibo.wang@amd.com,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kvmarm@lists.linux.dev,m:loongarch@lists.linux.dev,m:linux-mips@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm-riscv@lists.infradead.org,m:x86@kernel.org,m:coconut-svsm@lists.linux.dev,m:joerg.roedel@amd.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-14974-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[joro@8bytes.org,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: D2395657E0D

From: Paolo Bonzini <pbonzini@redhat.com>

Allow the KVM_SIGNAL_MSI ioctl for every plane instead of per VM.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Co-developed-by: Joerg Roedel <joerg.roedel@amd.com>
Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 include/linux/kvm_host.h |  2 +-
 virt/kvm/irqchip.c       |  4 ++--
 virt/kvm/kvm_main.c      | 25 ++++++++++++++-----------
 3 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index cfb6911d6771..05a10836d92d 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2370,7 +2370,7 @@ static inline int kvm_init_irq_routing(struct kvm *kvm)
 
 #endif
 
-int kvm_send_userspace_msi(struct kvm *kvm, struct kvm_msi *msi);
+int kvm_send_userspace_msi(struct kvm *kvm, struct kvm_msi *msi, unsigned plane_level);
 
 void kvm_eventfd_init(struct kvm *kvm);
 int kvm_ioeventfd(struct kvm *kvm, struct kvm_ioeventfd *args);
diff --git a/virt/kvm/irqchip.c b/virt/kvm/irqchip.c
index 14480d1df4f9..a4fea7d8dde6 100644
--- a/virt/kvm/irqchip.c
+++ b/virt/kvm/irqchip.c
@@ -45,7 +45,7 @@ int kvm_irq_map_chip_pin(struct kvm *kvm, unsigned irqchip, unsigned pin)
 	return irq_rt->chip[irqchip][pin];
 }
 
-int kvm_send_userspace_msi(struct kvm *kvm, struct kvm_msi *msi)
+int kvm_send_userspace_msi(struct kvm *kvm, struct kvm_msi *msi, unsigned plane_level)
 {
 	struct kvm_kernel_irq_routing_entry route;
 
@@ -57,7 +57,7 @@ int kvm_send_userspace_msi(struct kvm *kvm, struct kvm_msi *msi)
 	route.msi.data = msi->data;
 	route.msi.flags = msi->flags;
 	route.msi.devid = msi->devid;
-	route.msi.plane_level = 0;
+	route.msi.plane_level = plane_level;
 
 	return kvm_set_msi(&route, kvm, KVM_USERSPACE_IRQ_SOURCE_ID, 1, false);
 }
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index a30123b77112..dc59f2f9d405 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4907,6 +4907,17 @@ static long __kvm_plane_ioctl(struct kvm_plane *plane, unsigned int ioctl, unsig
 	case KVM_CREATE_VCPU:
 		r = kvm_plane_ioctl_create_vcpu(plane, arg);
 		break;
+#ifdef CONFIG_HAVE_KVM_MSI
+	case KVM_SIGNAL_MSI: {
+		void __user *argp = (void __user *)arg;
+		struct kvm_msi msi;
+
+		if (copy_from_user(&msi, argp, sizeof(msi)))
+			return -EFAULT;
+		r = kvm_send_userspace_msi(plane->kvm, &msi, plane->level);
+		break;
+	}
+#endif
 	default:
 		r = -ENOTTY;
 	}
@@ -5493,6 +5504,9 @@ static long kvm_vm_ioctl(struct file *filp,
 		r = kvm_vm_ioctl_create_plane(kvm, arg);
 		break;
 	case KVM_CREATE_VCPU:
+#ifdef CONFIG_HAVE_KVM_MSI
+	case KVM_SIGNAL_MSI:
+#endif
 		r = __kvm_plane_ioctl(kvm->planes[0], ioctl, arg);
 		break;
 	case KVM_ENABLE_CAP: {
@@ -5597,17 +5611,6 @@ static long kvm_vm_ioctl(struct file *filp,
 		r = kvm_ioeventfd(kvm, &data);
 		break;
 	}
-#ifdef CONFIG_HAVE_KVM_MSI
-	case KVM_SIGNAL_MSI: {
-		struct kvm_msi msi;
-
-		r = -EFAULT;
-		if (copy_from_user(&msi, argp, sizeof(msi)))
-			goto out;
-		r = kvm_send_userspace_msi(kvm, &msi);
-		break;
-	}
-#endif
 #ifdef __KVM_HAVE_IRQ_LINE
 	case KVM_IRQ_LINE_STATUS:
 	case KVM_IRQ_LINE: {
-- 
2.53.0


