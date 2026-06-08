Return-Path: <linux-mips+bounces-14976-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3jJVB2bbJmq0lwIAu9opvQ
	(envelope-from <linux-mips+bounces-14976-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 17:10:30 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9645657DC2
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 17:10:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14976-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-14976-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 41AC9303C38E
	for <lists+linux-mips@lfdr.de>; Mon,  8 Jun 2026 14:52:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 249163F928F;
	Mon,  8 Jun 2026 14:43:30 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B19633F39CE;
	Mon,  8 Jun 2026 14:43:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929809; cv=none; b=FardXPEMTsFUPDTFz1ZTWGwVcXAe8l33w4U86cynycpaKyDrMtnB5YsPAFNmR8cJ0zFddCjvMpRJfZH5CSnIWgodZ2QcUMy/gDagGljfePnYtIWSzdorrf56aQitQtwYu4gu6jOklfKGuHrTKtcbJv5tnuCM1sGqNkcex3iAQnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929809; c=relaxed/simple;
	bh=i6GRGokqT+XQqid4XC6TEQewbhawnRHGpzkX6QC38OY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wh9hRW1ZoQxYp8j6wmjbzzhg69S/3ToFW4lJwX91TEvVV6XKsnGBQ+jX4/dGcrrjBoMpRf9HK7MJeYKtm+31KKjpbLVBj9whQ3dclh++wPqPB9nzgkocRACoyd+4V2Q1G+p4WvDkw9nMOXnT9sIlv26hqNNouAN3ehD29d2WNX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id C4D122028C7;
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
Subject: [PATCH 36/60] kvm: Add plane_level to kvm_kernel_irq_routing_entry
Date: Mon,  8 Jun 2026 16:42:28 +0200
Message-ID: <20260608144252.351443-37-joro@8bytes.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[lists@lfdr.de];
	DMARC_NA(0.00)[8bytes.org: no valid DMARC record];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pbonzini@redhat.com,m:seanjc@google.com,m:thomas.lendacky@amd.com,m:ashish.kalra@amd.com,m:michael.roth@amd.com,m:nsaenz@amazon.com,m:anelkz@amazon.de,m:James.Bottomley@HansenPartnership.com,m:huibo.wang@amd.com,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kvmarm@lists.linux.dev,m:loongarch@lists.linux.dev,m:linux-mips@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm-riscv@lists.infradead.org,m:x86@kernel.org,m:coconut-svsm@lists.linux.dev,m:joerg.roedel@amd.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-14976-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[joro@8bytes.org,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: C9645657DC2

From: Joerg Roedel <joerg.roedel@amd.com>

Track the target plane-level of MSI irqs in struct
kvm_kernel_irq_routing_entry. This will be used to send MSI IRQs to
the right plane-level once planes are supported.

Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 arch/arm64/kvm/vgic/vgic-irqfd.c | 1 +
 arch/loongarch/kvm/irqfd.c       | 1 +
 arch/powerpc/kvm/mpic.c          | 1 +
 arch/riscv/kvm/vm.c              | 1 +
 arch/x86/kvm/irq.c               | 1 +
 include/linux/kvm_host.h         | 1 +
 virt/kvm/irqchip.c               | 1 +
 7 files changed, 7 insertions(+)

diff --git a/arch/arm64/kvm/vgic/vgic-irqfd.c b/arch/arm64/kvm/vgic/vgic-irqfd.c
index b9b86e3a6c86..479b896c8954 100644
--- a/arch/arm64/kvm/vgic/vgic-irqfd.c
+++ b/arch/arm64/kvm/vgic/vgic-irqfd.c
@@ -57,6 +57,7 @@ int kvm_set_routing_entry(struct kvm *kvm,
 		e->msi.data = ue->u.msi.data;
 		e->msi.flags = ue->flags;
 		e->msi.devid = ue->u.msi.devid;
+		e->msi.plane_level = 0;
 		break;
 	default:
 		goto out;
diff --git a/arch/loongarch/kvm/irqfd.c b/arch/loongarch/kvm/irqfd.c
index f4f953b22419..50f0c32df46c 100644
--- a/arch/loongarch/kvm/irqfd.c
+++ b/arch/loongarch/kvm/irqfd.c
@@ -60,6 +60,7 @@ int kvm_set_routing_entry(struct kvm *kvm,
 		e->msi.address_lo = ue->u.msi.address_lo;
 		e->msi.address_hi = ue->u.msi.address_hi;
 		e->msi.data = ue->u.msi.data;
+		e->msi.plane_level = 0;
 		return 0;
 	default:
 		return -EINVAL;
diff --git a/arch/powerpc/kvm/mpic.c b/arch/powerpc/kvm/mpic.c
index 3070f36d9fb8..0f568f5fff8b 100644
--- a/arch/powerpc/kvm/mpic.c
+++ b/arch/powerpc/kvm/mpic.c
@@ -1841,6 +1841,7 @@ int kvm_set_routing_entry(struct kvm *kvm,
 		e->msi.address_lo = ue->u.msi.address_lo;
 		e->msi.address_hi = ue->u.msi.address_hi;
 		e->msi.data = ue->u.msi.data;
+		e->msi.plane_level = 0;
 		break;
 	default:
 		goto out;
diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
index a9f083feeb76..f518247e699b 100644
--- a/arch/riscv/kvm/vm.c
+++ b/arch/riscv/kvm/vm.c
@@ -138,6 +138,7 @@ int kvm_set_routing_entry(struct kvm *kvm,
 		e->msi.data = ue->u.msi.data;
 		e->msi.flags = ue->flags;
 		e->msi.devid = ue->u.msi.devid;
+		e->msi.plane_level = 0;
 		break;
 	default:
 		goto out;
diff --git a/arch/x86/kvm/irq.c b/arch/x86/kvm/irq.c
index 9519fec09ee6..b7e08eddb765 100644
--- a/arch/x86/kvm/irq.c
+++ b/arch/x86/kvm/irq.c
@@ -332,6 +332,7 @@ int kvm_set_routing_entry(struct kvm *kvm,
 		e->msi.address_lo = ue->u.msi.address_lo;
 		e->msi.address_hi = ue->u.msi.address_hi;
 		e->msi.data = ue->u.msi.data;
+		e->msi.plane_level = 0;
 
 		if (kvm_msi_route_invalid(kvm, e))
 			return -EINVAL;
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index e3611e6cc3e4..16dcca3132d3 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -782,6 +782,7 @@ struct kvm_kernel_irq_routing_entry {
 			u32 data;
 			u32 flags;
 			u32 devid;
+			unsigned plane_level;
 		} msi;
 		struct kvm_s390_adapter_int adapter;
 		struct kvm_hv_sint hv_sint;
diff --git a/virt/kvm/irqchip.c b/virt/kvm/irqchip.c
index 462c70621247..ae47e56176f1 100644
--- a/virt/kvm/irqchip.c
+++ b/virt/kvm/irqchip.c
@@ -57,6 +57,7 @@ int kvm_send_userspace_msi(struct kvm *kvm, struct kvm_msi *msi)
 	route.msi.data = msi->data;
 	route.msi.flags = msi->flags;
 	route.msi.devid = msi->devid;
+	route.msi.plane_level = 0;
 
 	return kvm_set_msi(&route, kvm, KVM_USERSPACE_IRQ_SOURCE_ID, 1, false);
 }
-- 
2.53.0


