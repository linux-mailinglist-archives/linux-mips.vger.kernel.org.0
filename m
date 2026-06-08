Return-Path: <linux-mips+bounces-14996-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fbdjDFbaJmpzlwIAu9opvQ
	(envelope-from <linux-mips+bounces-14996-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 17:05:58 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BB739657CEB
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 17:05:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14996-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-14996-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B5ACD30EF19E
	for <lists+linux-mips@lfdr.de>; Mon,  8 Jun 2026 14:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42BA3402BAA;
	Mon,  8 Jun 2026 14:43:39 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ED2A3F0744;
	Mon,  8 Jun 2026 14:43:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929818; cv=none; b=OL1I58PW7mHe2mDl4CAx7mdqnPSe3vD0xKrSK27jQmmJZhvcfUrGgK5eIcbA7eoKprdAGC/ZdqVeQ7tFaK7modAbNA7/W1vXUe0T3gnJ2Z77SeYFRI4RuAIU3l0G8dgF7bc7cpYTmFH0cKH89wAQKIubybam4h8RN0RP4WPHE+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929818; c=relaxed/simple;
	bh=mbWm+HGdaEQiUN4G1XXeJLYotq+qlL1X3dQave7Qpdc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A5APXaHy7pK/IlzbCiGQiBhSAuhPFkWdAhMw+aw830Db5cp0dOL0YRQ0BSTHKZZSpgARzEa5txu+mHeFuIUS6gQ3z5CxQLCT3yDphK9rpC+0Fr93fypAP1niKHv3lAS4F9N5Hi9t5m9c12tNJbUjs6phrb0I1YVo+4ygxDeE3Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id A4CBA2028D9;
	Mon,  8 Jun 2026 16:43:16 +0200 (CEST)
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
Subject: [PATCH 54/60] kvm: x86: Restrict KVM planes support to KVM_IRQCHIP_SPLIT
Date: Mon,  8 Jun 2026 16:42:46 +0200
Message-ID: <20260608144252.351443-55-joro@8bytes.org>
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
	TAGGED_FROM(0.00)[bounces-14996-lists,linux-mips=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,8bytes.org:mid,8bytes.org:from_mime,amd.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BB739657CEB

From: Joerg Roedel <joerg.roedel@amd.com>

The code right now only supports plane-aware IOAPIC IRQ routing for
IRQ-chip in split mode. Enforce that restriction in the KVM x86 code.

Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 arch/x86/kvm/x86.c       | 8 ++++++--
 include/linux/kvm_host.h | 1 +
 virt/kvm/kvm_main.c      | 5 +++++
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index c6910356b061..0b9fa1059481 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -490,6 +490,10 @@ EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_x86_default_max_planes);
 
 unsigned kvm_arch_max_planes(struct kvm *kvm)
 {
+	/* For now, planes are only supported with irqchip=split */
+	if (!irqchip_split(kvm))
+		return 1;
+
 	return kvm_x86_call(max_planes)(kvm);
 }
 
@@ -6833,7 +6837,7 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
 		if (cap->args[0] > KVM_MAX_IRQ_ROUTES)
 			goto split_irqchip_unlock;
 		r = -EEXIST;
-		if (irqchip_in_kernel(kvm))
+		if (irqchip_in_kernel(kvm) || kvm->has_planes)
 			goto split_irqchip_unlock;
 		if (kvm->created_vcpus)
 			goto split_irqchip_unlock;
@@ -7398,7 +7402,7 @@ int kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
 			goto create_irqchip_unlock;
 
 		r = -EINVAL;
-		if (kvm->created_vcpus)
+		if (kvm->created_vcpus || kvm->has_planes)
 			goto create_irqchip_unlock;
 
 		r = kvm_pic_init(kvm);
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 3b62fb354267..dbf81e2520f2 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -918,6 +918,7 @@ struct kvm {
 	struct list_head gpc_list;
 
 	struct kvm_plane *planes[KVM_MAX_PLANES];
+	bool has_planes;
 
 	/*
 	 * created_vcpus is protected by kvm->lock, and is incremented
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 8f1a16af519a..ff27cdbe8d92 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5477,6 +5477,10 @@ static int kvm_vm_ioctl_create_plane(struct kvm *kvm, unsigned id)
 	    WARN_ON_ONCE(id >= KVM_MAX_PLANES))
 		return -EINVAL;
 
+	/* Planes are only supported with in-kernel IRQ-chip */
+	if (!kvm_arch_irqchip_in_kernel(kvm))
+		return -EINVAL;
+
 	guard(mutex)(&kvm->lock);
 	if (kvm->planes[id])
 		return -EEXIST;
@@ -5498,6 +5502,7 @@ static int kvm_vm_ioctl_create_plane(struct kvm *kvm, unsigned id)
 		goto put_kvm;
 	}
 
+	kvm->has_planes = true;
 	fd_install(fd, file);
 	return fd;
 
-- 
2.53.0


