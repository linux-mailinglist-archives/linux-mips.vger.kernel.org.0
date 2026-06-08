Return-Path: <linux-mips+bounces-14983-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id puh9BRHrJmp/nAIAu9opvQ
	(envelope-from <linux-mips+bounces-14983-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 18:17:21 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFE2658991
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 18:17:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14983-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-14983-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 69FB43044B83
	for <lists+linux-mips@lfdr.de>; Mon,  8 Jun 2026 14:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6474B3FD147;
	Mon,  8 Jun 2026 14:43:34 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 866463F7AAD;
	Mon,  8 Jun 2026 14:43:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929813; cv=none; b=cL3+OQMf2qJ/4QdqKQKkAJPUhHdTCoS1YvzGFqIhzdG0y/BbYunp6CH/5pZ2gNAb4pBoPhal+n43xxZU9BBeWBJ14coeSC58nU7DPsWDGj2OmkQEh54GiT+ikMaFK9Ox6iCyMWQ5ufbVRl+P+WcQE20Z3IZ48cpsGzJNizjK3U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929813; c=relaxed/simple;
	bh=P9kibLlfEUjyZzPaotXP3JYgm+Axn66eD8m0X8kJH4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MeMF/tx+zna4ReGXdBoeA4Uhvuom16T8MIYx65T9NFzg1bLaO5IL8COuJKattfsPbuK6ex52Lrpa+02f4pQ6FYMBZo5JT+7qgXmSyovUYBaEu0WRgSz+za7gzA/xTh2A1LTDAbTT54iv+xxGlLvpawACrRUn+eBYSrPq4GtkRc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 611962028D3;
	Mon,  8 Jun 2026 16:43:15 +0200 (CEST)
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
Subject: [PATCH 48/60] kvm: x86: Make event injection VCPU requests per-plane
Date: Mon,  8 Jun 2026 16:42:40 +0200
Message-ID: <20260608144252.351443-49-joro@8bytes.org>
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
X-Spamd-Result: default: False [0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.67)[subject];
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
	TAGGED_FROM(0.00)[bounces-14983-lists,linux-mips=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,8bytes.org:mid,8bytes.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5CFE2658991

From: Joerg Roedel <joerg.roedel@amd.com>

These events must be handled on the plane-vcpu that they were raised
on.

Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 arch/x86/include/asm/kvm_host.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index f30173093c44..c2651774d785 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -85,20 +85,20 @@
 						 KVM_X86_NOTIFY_VMEXIT_USER)
 
 /* x86-specific vcpu->requests bit members */
-#define KVM_REQ_MIGRATE_TIMER		KVM_ARCH_REQ(0)
+#define KVM_REQ_MIGRATE_TIMER		KVM_ARCH_PLANE_REQ(0)
 #define KVM_REQ_REPORT_TPR_ACCESS	KVM_ARCH_REQ(1)
 #define KVM_REQ_TRIPLE_FAULT		KVM_ARCH_REQ(2)
 #define KVM_REQ_MMU_SYNC		KVM_ARCH_REQ(3)
 #define KVM_REQ_CLOCK_UPDATE		KVM_ARCH_REQ(4)
 #define KVM_REQ_LOAD_MMU_PGD		KVM_ARCH_REQ(5)
-#define KVM_REQ_EVENT			KVM_ARCH_REQ(6)
+#define KVM_REQ_EVENT			KVM_ARCH_PLANE_REQ(6)
 #define KVM_REQ_APF_HALT		KVM_ARCH_REQ(7)
 #define KVM_REQ_STEAL_UPDATE		KVM_ARCH_REQ(8)
-#define KVM_REQ_NMI			KVM_ARCH_REQ(9)
-#define KVM_REQ_PMU			KVM_ARCH_REQ(10)
-#define KVM_REQ_PMI			KVM_ARCH_REQ(11)
+#define KVM_REQ_NMI			KVM_ARCH_PLANE_REQ(9)
+#define KVM_REQ_PMU			KVM_ARCH_PLANE_REQ(10)
+#define KVM_REQ_PMI			KVM_ARCH_PLANE_REQ(11)
 #ifdef CONFIG_KVM_SMM
-#define KVM_REQ_SMI			KVM_ARCH_REQ(12)
+#define KVM_REQ_SMI			KVM_ARCH_PLANE_REQ(12)
 #endif
 #define KVM_REQ_MASTERCLOCK_UPDATE	KVM_ARCH_REQ(13)
 #define KVM_REQ_MCLOCK_INPROGRESS \
-- 
2.53.0


