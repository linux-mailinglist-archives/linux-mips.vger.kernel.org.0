Return-Path: <linux-mips+bounces-14939-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LOcYK+vaJmqOlwIAu9opvQ
	(envelope-from <linux-mips+bounces-14939-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 17:08:27 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0BE657D3F
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 17:08:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14939-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-14939-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 15DD53037473
	for <lists+linux-mips@lfdr.de>; Mon,  8 Jun 2026 14:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A384B3D4135;
	Mon,  8 Jun 2026 14:43:13 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1B6D3CFF4C;
	Mon,  8 Jun 2026 14:43:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929793; cv=none; b=HZnIKklH4OVx5o6TcXbRJtkqVQg6ybxWGHrM+b2PiuAz9M0OaquB8Dkzx2PTZtiCJzR6TJJKrtDXNtlQoL2I5h5s3nFFyZ2OQlxOICGcvBDilfSIcV8bV2djSIUJQL4wc0ogXoLtdS5+re2vq7mzcJUlRgtmqFZAvSZ/sHH5+zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929793; c=relaxed/simple;
	bh=PD1QSHnexM19DYdYfEtEZMOHnc8LRZ/uBD0hQqHD0PE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ORycbK4GmxqRRww6b8tlguyocsakxPi6xEPSmksCReQX9B4s0UlUkGicQNAiO6OhjCd+z+fzWdbKZiOM33IXXeKvxOQcI+drSwp0xKZ3Yzb029tcKC3H2uTvyO9qwWVx5g34pr264orgH9yu8FIjcsUg/8pcJGv6jrdAUGKorAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 41D042028A4;
	Mon,  8 Jun 2026 16:43:05 +0200 (CEST)
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
Subject: [PATCH 01/60] x86/sev: Define the #HV doorbell page structure
Date: Mon,  8 Jun 2026 16:41:53 +0200
Message-ID: <20260608144252.351443-2-joro@8bytes.org>
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
	TAGGED_FROM(0.00)[bounces-14939-lists,linux-mips=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[8bytes.org:mid,8bytes.org:from_mime,amd.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0D0BE657D3F

From: Melody Wang <huibo.wang@amd.com>

Restricted injection is a feature which enforces additional interrupt and
event injection security protections for a SEV-SNP guest. It disables all
hypervisor-based interrupt queuing and event injection of all vectors except
a new exception vector, #HV (28), which is reserved for SNP guest use, but
never generated by hardware. #HV is only allowed to be injected into VMSAs
that execute with Restricted Injection.

The guests running with the SNP restricted injection feature active limit the
host to ringing a doorbell with a #HV exception.

Define two fields in the #HV doorbell page: a pending event field, and an EOI
assist.

Create the structure definition for the #HV doorbell page as per GHCB
specification.

Co-developed-by: Thomas Lendacky <thomas.lendacky@amd.com>
Signed-off-by: Thomas Lendacky <thomas.lendacky@amd.com>
Signed-off-by: Melody Wang <huibo.wang@amd.com>
Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 arch/x86/include/asm/svm.h | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/x86/include/asm/svm.h b/arch/x86/include/asm/svm.h
index bcfeb5e7c0ed..9822b0b346ae 100644
--- a/arch/x86/include/asm/svm.h
+++ b/arch/x86/include/asm/svm.h
@@ -252,6 +252,39 @@ struct __attribute__ ((__packed__)) vmcb_control_area {
 #define SVM_TSC_RATIO_MAX	0x000000ffffffffffULL
 #define SVM_TSC_RATIO_DEFAULT	0x0100000000ULL
 
+/*
+ * Hypervisor doorbell page:
+ *
+ * Used when Restricted Injection is enabled for a VM. One page in size that
+ * is shared between the guest and hypervisor to communicate exception and
+ * interrupt events.
+ */
+struct hvdb_events {
+	/* First 64 bytes of HV doorbell page defined in GHCB specification */
+	union {
+		struct {
+			/* Non-maskable event indicators */
+			u16 vector:		8,
+			    nmi:		1,
+			    mce:		1,
+			    reserved2:		5,
+			    no_further_signal:	1;
+		};
+
+		u16 pending_events;
+	};
+
+	u8 no_eoi_required;
+
+	u8 reserved3[61];
+};
+
+struct hvdb {
+	struct hvdb_events events;
+
+	/* Remainder of the page is for software use */
+	u8 reserved[PAGE_SIZE - sizeof(struct hvdb_events)];
+};
 
 /* AVIC */
 #define AVIC_LOGICAL_ID_ENTRY_GUEST_PHYSICAL_ID_MASK	(0xFFULL)
-- 
2.53.0


