Return-Path: <linux-mips+bounces-14987-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LFsnAubZJmpQlwIAu9opvQ
	(envelope-from <linux-mips+bounces-14987-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 17:04:06 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 889BF657C88
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 17:04:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14987-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-14987-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C82BB305EB9B
	for <lists+linux-mips@lfdr.de>; Mon,  8 Jun 2026 14:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E398D3FF1D9;
	Mon,  8 Jun 2026 14:43:35 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 019DE3F8893;
	Mon,  8 Jun 2026 14:43:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929814; cv=none; b=F8ZynQzDoiRoF91mTbYcCRmofnKRxFlEJsX7juMtSakmn8alGEEbt68aaI7Io7haCPAaJj42rq9T4fgRyKKu8H3j2hFHVft/eERlFZ1D8RRYPUSmV900MTRvt3KVPNj57qityDtR7e0mZDxIid1xseMk0/IEIQ/V/vANzkHnzWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929814; c=relaxed/simple;
	bh=eH3f+WuPMLAuoE2Ew5uwF/+/AYqpqginB/0ahvdEg0I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rQkJAtti1O6TUIQbZ9kEkRZa74uNIZWt8AkyZSYKnIyPX6sMT88sUHEjYdVFRmt9sxlsBGGDevhntz1FnkXLOn/FNfc4IR94eVFvJzoYyTiIQD7TPtQTXgdC/ybL4sFh/jLlTYwAzyJ69OgOqWBJU0elGK5JmK+vuKnIA7981DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 3B9172028D7;
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
Subject: [PATCH 52/60] kvm: x86: Switch to plane0 if it has events
Date: Mon,  8 Jun 2026 16:42:44 +0200
Message-ID: <20260608144252.351443-53-joro@8bytes.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
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
	TAGGED_FROM(0.00)[bounces-14987-lists,linux-mips=lfdr.de];
	FORGED_SENDER(0.00)[joro@8bytes.org,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,8bytes.org:mid,8bytes.org:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,amd.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 889BF657C88

From: Joerg Roedel <joerg.roedel@amd.com>

When there are IRQs or events pending for plane0, make sure it can
handle it.

Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 arch/x86/kvm/x86.c | 34 +++++++++++++++++++++++++++++-----
 1 file changed, 29 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 08fe65b8d57d..60b34bd4da9d 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -10962,6 +10962,20 @@ static int kvm_check_and_inject_events(struct kvm_vcpu *vcpu,
 	return r;
 }
 
+static inline bool kvm_check_plane0_events(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vcpu *vcpu_plane0;
+
+	if (vcpu->plane_level == 0)
+		return false;
+
+	vcpu_plane0 = vcpu->common->vcpus[0];
+
+	return kvm_cpu_has_injectable_intr(vcpu_plane0) ||
+		vcpu_plane0->arch.nmi_pending ||
+		vcpu_plane0->arch.smi_pending;
+}
+
 static void process_nmi(struct kvm_vcpu *vcpu)
 {
 	unsigned int limit;
@@ -11410,12 +11424,19 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
 				goto out;
 			}
 		}
+	}
 
-		if (kvm_check_request(KVM_REQ_PLANE_RESCHED, vcpu)) {
-			vcpu->common->plane_switch = true;
-			r = 0;
-			goto out;
-		}
+	if (kvm_check_plane0_events(vcpu)) {
+		kvm_vcpu_set_plane_runnable(vcpu->common->vcpus[0]);
+
+		kvm_make_request(KVM_REQ_EVENT, vcpu);
+		kvm_make_request(KVM_REQ_PLANE_RESCHED, vcpu);
+	}
+
+	if (kvm_check_request(KVM_REQ_PLANE_RESCHED, vcpu)) {
+		vcpu->common->plane_switch = true;
+		r = 0;
+		goto out;
 	}
 
 	if (kvm_check_request(KVM_REQ_EVENT, vcpu) || req_int_win ||
@@ -11737,6 +11758,9 @@ bool kvm_vcpu_has_events(struct kvm_vcpu *vcpu)
 	if (kvm_test_request(KVM_REQ_UPDATE_PROTECTED_GUEST_STATE, vcpu))
 		return true;
 
+	if (kvm_test_request(KVM_REQ_PLANE_RESCHED, vcpu))
+		return true;
+
 	if (kvm_arch_interrupt_allowed(vcpu) && kvm_cpu_has_interrupt(vcpu))
 		return true;
 
-- 
2.53.0


