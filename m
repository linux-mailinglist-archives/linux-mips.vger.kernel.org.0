Return-Path: <linux-mips+bounces-14965-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ffTdNu7cJmr9lwIAu9opvQ
	(envelope-from <linux-mips+bounces-14965-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 17:17:02 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2922657E93
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 17:17:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14965-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-14965-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1735B3152CAF
	for <lists+linux-mips@lfdr.de>; Mon,  8 Jun 2026 14:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 351833F6C2F;
	Mon,  8 Jun 2026 14:43:26 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18F723CFF58;
	Mon,  8 Jun 2026 14:43:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929805; cv=none; b=aIEUetD56wc/sQcTeqQ7qGYFx9Y4M+B8UBD4peHvTjYuMIBUw37FBFbdcoE4t069Nn/AkylEzLOGrFZ+YSWqEg5z9beZRoL9WKJby6hF+89K6G+vPfjdtdzBjSH5xXdZMMNJPjpl1Af8P73i+aLEW5Rbeunm0XM3ray1wJzXAJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929805; c=relaxed/simple;
	bh=UFfN9Rlc8pess40XihNIu2bNFlMZs8f881Y1fO4tAwA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uu6t8A7RTJv8cxvbDm0A2wxql0WCkIdXECgVjGhSGKuYL0Fa2E9wQ8f0OrJ0fqUaA8ksi+KisNU3Lx214ucpybks4eWBNxkJtc3yQp6Lf1bj/C7g5nmoFw47MO258md2kxDXGu0l2tEx8IQz/9fFgGZApWKzaaptQ15UCDKBDnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 5A8A72028B6;
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
Subject: [PATCH 20/60] kvm: Move kvm_vcpu mode and requests field to struct kvm_vcpu_common
Date: Mon,  8 Jun 2026 16:42:12 +0200
Message-ID: <20260608144252.351443-21-joro@8bytes.org>
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
X-Spamd-Result: default: False [0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.62)[subject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[lists@lfdr.de];
	DMARC_NA(0.00)[8bytes.org: no valid DMARC record];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pbonzini@redhat.com,m:seanjc@google.com,m:thomas.lendacky@amd.com,m:ashish.kalra@amd.com,m:michael.roth@amd.com,m:nsaenz@amazon.com,m:anelkz@amazon.de,m:James.Bottomley@HansenPartnership.com,m:huibo.wang@amd.com,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kvmarm@lists.linux.dev,m:loongarch@lists.linux.dev,m:linux-mips@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm-riscv@lists.infradead.org,m:x86@kernel.org,m:coconut-svsm@lists.linux.dev,m:joerg.roedel@amd.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-14965-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[joro@8bytes.org,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Queue-Id: D2922657E93

From: Joerg Roedel <joerg.roedel@amd.com>

These fields must be shared across all planes of a given VCPU.

Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 arch/powerpc/kvm/trace.h |  2 +-
 arch/x86/kvm/trace.h     |  2 +-
 include/linux/kvm_host.h | 27 ++++++++++++++-------------
 3 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/kvm/trace.h b/arch/powerpc/kvm/trace.h
index ea1d7c808319..35c000d918bb 100644
--- a/arch/powerpc/kvm/trace.h
+++ b/arch/powerpc/kvm/trace.h
@@ -108,7 +108,7 @@ TRACE_EVENT(kvm_check_requests,
 
 	TP_fast_assign(
 		__entry->cpu_nr		= vcpu->vcpu_id;
-		__entry->requests	= vcpu->requests;
+		__entry->requests	= vcpu->common->requests;
 	),
 
 	TP_printk("vcpu=%x requests=%x",
diff --git a/arch/x86/kvm/trace.h b/arch/x86/kvm/trace.h
index 0db25bba17f6..0d2dd25bed12 100644
--- a/arch/x86/kvm/trace.h
+++ b/arch/x86/kvm/trace.h
@@ -409,7 +409,7 @@ TRACE_EVENT(name,							     \
 		__entry->guest_rip	= tracing_kvm_rip_read(vcpu);		     \
 		__entry->isa            = isa;				     \
 		__entry->vcpu_id        = vcpu->vcpu_id;		     \
-		__entry->requests       = READ_ONCE(vcpu->requests);	     \
+		__entry->requests       = READ_ONCE(vcpu->common->requests); \
 		kvm_x86_call(get_exit_info)(vcpu,			     \
 					    &__entry->exit_reason,	     \
 					    &__entry->info1,		     \
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 45286b3b35c9..7704820986da 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -180,7 +180,7 @@ static inline bool kvm_is_error_gpa(gpa_t gpa)
 #define KVM_REQ_OUTSIDE_GUEST_MODE	(KVM_REQUEST_NO_ACTION | KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
 
 #define KVM_ARCH_REQ_FLAGS(nr, flags) ({ \
-	BUILD_BUG_ON((unsigned)(nr) >= (sizeof_field(struct kvm_vcpu, requests) * 8) - KVM_REQUEST_ARCH_BASE); \
+	BUILD_BUG_ON((unsigned)(nr) >= (sizeof_field(struct kvm_vcpu_common, requests) * 8) - KVM_REQUEST_ARCH_BASE); \
 	(unsigned)(((nr) + KVM_REQUEST_ARCH_BASE) | (flags)); \
 })
 #define KVM_ARCH_REQ(nr)           KVM_ARCH_REQ_FLAGS(nr, 0)
@@ -341,6 +341,9 @@ struct kvm_vcpu_common {
 	struct rcuwait wait;
 #endif
 
+	int mode;
+	u64 requests;
+
 	/* Scheduling state */
 #ifdef CONFIG_PREEMPT_NOTIFIERS
 	struct preempt_notifier preempt_notifier;
@@ -359,8 +362,6 @@ struct kvm_vcpu {
 	int vcpu_id; /* id given by userspace at creation */
 	int vcpu_idx; /* index into kvm->planes[]->vcpu_array */
 
-	int mode;
-	u64 requests;
 	unsigned long guest_debug;
 
 	struct kvm_run *run;
@@ -442,27 +443,27 @@ static inline bool kvm_vcpu_scheduled_out(struct kvm_vcpu *vcpu)
 
 static inline int kvm_vcpu_mode(struct kvm_vcpu *vcpu)
 {
-	return vcpu->mode;
+	return vcpu->common->mode;
 }
 
 static inline int kvm_vcpu_mode_acquire(struct kvm_vcpu *vcpu)
 {
-	return smp_load_acquire(&vcpu->mode);
+	return smp_load_acquire(&vcpu->common->mode);
 }
 
 static inline void kvm_vcpu_set_mode(struct kvm_vcpu *vcpu, int mode)
 {
-	vcpu->mode = mode;
+	vcpu->common->mode = mode;
 }
 
 static inline void kvm_vcpu_set_mode_mb(struct kvm_vcpu *vcpu, int mode)
 {
-	smp_store_mb(vcpu->mode, mode);
+	smp_store_mb(vcpu->common->mode, mode);
 }
 
 static inline void kvm_vcpu_set_mode_release(struct kvm_vcpu *vcpu, int mode)
 {
-	smp_store_release(&vcpu->mode, mode);
+	smp_store_release(&vcpu->common->mode, mode);
 }
 
 /*
@@ -630,7 +631,7 @@ static inline int kvm_vcpu_exiting_guest_mode(struct kvm_vcpu *vcpu)
 	 * memory barrier following the write of vcpu->mode in VCPU RUN.
 	 */
 	smp_mb__before_atomic();
-	return cmpxchg(&vcpu->mode, IN_GUEST_MODE, EXITING_GUEST_MODE);
+	return cmpxchg(&vcpu->common->mode, IN_GUEST_MODE, EXITING_GUEST_MODE);
 }
 
 /*
@@ -2355,7 +2356,7 @@ static inline void __kvm_make_request(int req, struct kvm_vcpu *vcpu)
 	 * caller.  Paired with the smp_mb__after_atomic in kvm_check_request.
 	 */
 	smp_wmb();
-	set_bit(req & KVM_REQUEST_MASK, (void *)&vcpu->requests);
+	set_bit(req & KVM_REQUEST_MASK, (void *)&vcpu->common->requests);
 }
 
 static __always_inline void kvm_make_request(int req, struct kvm_vcpu *vcpu)
@@ -2381,17 +2382,17 @@ static inline void kvm_make_request_and_kick(int req, struct kvm_vcpu *vcpu)
 
 static inline bool kvm_request_pending(struct kvm_vcpu *vcpu)
 {
-	return READ_ONCE(vcpu->requests);
+	return READ_ONCE(vcpu->common->requests);
 }
 
 static inline bool kvm_test_request(int req, struct kvm_vcpu *vcpu)
 {
-	return test_bit(req & KVM_REQUEST_MASK, (void *)&vcpu->requests);
+	return test_bit(req & KVM_REQUEST_MASK, (void *)&vcpu->common->requests);
 }
 
 static inline void kvm_clear_request(int req, struct kvm_vcpu *vcpu)
 {
-	clear_bit(req & KVM_REQUEST_MASK, (void *)&vcpu->requests);
+	clear_bit(req & KVM_REQUEST_MASK, (void *)&vcpu->common->requests);
 }
 
 static inline bool kvm_check_request(int req, struct kvm_vcpu *vcpu)
-- 
2.53.0


