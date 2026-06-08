Return-Path: <linux-mips+bounces-14945-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BhNRKzfbJmqrlwIAu9opvQ
	(envelope-from <linux-mips+bounces-14945-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 17:09:43 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A8D657D9B
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 17:09:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14945-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-14945-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D3663080E64
	for <lists+linux-mips@lfdr.de>; Mon,  8 Jun 2026 14:50:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 553FA3EFD21;
	Mon,  8 Jun 2026 14:43:17 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80BB93D647C;
	Mon,  8 Jun 2026 14:43:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929797; cv=none; b=uLeUdEpL+AOkhmzpqQBpKA6K91tbCo+pkCOE/TR6ssLBciER1wvn2ZAYOvaur+FP4eYKVpIb8WGBAGi6pG3MWJnSf1d3J5WjS6ctN0XNP+SJXi0zx6CmbgOg6AcJNv08lcB3WX4qKiG4mGcV4Xffjz5ZNGE0AN7oHd7YsNVtWBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929797; c=relaxed/simple;
	bh=viYUtAShow9Jk8zzogf+RRRGxMBC4a8XlwTwU6BirRM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aB7E9QHEbLLYLDdV287TaPyXorPeiZ/EIGJUvKYc0c9oAQC9MPlAq3DfDlxlmwV6AKHNSnCeX+qblLltV8J9q50fNsfF+qTrUyvM8yOEdz5U2aE2cEGlAwVuSaaxgxMQHYaKCTRdduF0M2whi/VzS/lWgFh6uXX1mJUEMWd7CVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 7F2382028AA;
	Mon,  8 Jun 2026 16:43:06 +0200 (CEST)
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
Subject: [PATCH 07/60] KVM: SVM: Add support for the SEV-SNP #HV IPI NAE event
Date: Mon,  8 Jun 2026 16:41:59 +0200
Message-ID: <20260608144252.351443-8-joro@8bytes.org>
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
X-Spamd-Result: default: False [0.60 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.56)[subject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
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
	TAGGED_FROM(0.00)[bounces-14945-lists,linux-mips=lfdr.de];
	FORGED_SENDER(0.00)[joro@8bytes.org,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,8bytes.org:mid,8bytes.org:from_mime,amd.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 22A8D657D9B

From: Melody Wang <huibo.wang@amd.com>

The #HV IPI NAE event allows the guest to send an IPI to other vCPUs in the
guest when the Restricted Injection feature is enabled. Implement the NAE
event as per GHCB specification.

Co-developed-by: Thomas Lendacky <thomas.lendacky@amd.com>
Signed-off-by: Thomas Lendacky <thomas.lendacky@amd.com>
Signed-off-by: Melody Wang <huibo.wang@amd.com>
Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 arch/x86/include/uapi/asm/svm.h |  1 +
 arch/x86/kvm/lapic.c            | 24 +++++++++++++++++++++++-
 arch/x86/kvm/lapic.h            |  2 ++
 arch/x86/kvm/svm/sev.c          | 28 ++++++++++++++++++++++++++++
 4 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/uapi/asm/svm.h b/arch/x86/include/uapi/asm/svm.h
index d84a13ac4627..d281dd21c540 100644
--- a/arch/x86/include/uapi/asm/svm.h
+++ b/arch/x86/include/uapi/asm/svm.h
@@ -122,6 +122,7 @@
 #define SVM_VMGEXIT_HVDB_SET			1
 #define SVM_VMGEXIT_HVDB_QUERY			2
 #define SVM_VMGEXIT_HVDB_CLEAR			3
+#define SVM_VMGEXIT_HV_IPI                      0x80000015ull
 #define SVM_VMGEXIT_SNP_RUN_VMPL		0x80000018ull
 #define SVM_VMGEXIT_SAVIC			0x8000001aull
 #define SVM_VMGEXIT_SAVIC_REGISTER_GPA		0
diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
index 4078e624ca66..ab40a2e4ab9d 100644
--- a/arch/x86/kvm/lapic.c
+++ b/arch/x86/kvm/lapic.c
@@ -2558,7 +2558,7 @@ static int kvm_lapic_reg_write(struct kvm_lapic *apic, u32 reg, u32 val)
 static int apic_mmio_write(struct kvm_vcpu *vcpu, struct kvm_io_device *this,
 			    gpa_t address, int len, const void *data)
 {
-	struct kvm_lapic *apic = to_lapic(this);
+	struct kvm_lapic *apic = this ? to_lapic(this) : vcpu->arch.apic;
 	unsigned int offset = address - apic->base_address;
 	u32 val;
 
@@ -3583,3 +3583,25 @@ void kvm_lapic_exit(void)
 	static_key_deferred_flush(&apic_sw_disabled);
 	WARN_ON(static_branch_unlikely(&apic_sw_disabled.key));
 }
+
+/* Send IPI by writing ICR with MSR write when X2APIC enabled, with mmio write when XAPIC enabled */
+int kvm_xapic_x2apic_send_ipi(struct kvm_vcpu *vcpu, u64 data)
+{
+	u32 icr_msr_addr = APIC_BASE_MSR + (APIC_ICR >> 4);
+	struct kvm_lapic *apic = vcpu->arch.apic;
+	gpa_t gpa = apic->base_address + APIC_ICR;
+
+	if (!kvm_lapic_enabled(vcpu))
+		return 1;
+
+	if (vcpu->arch.apic_base & X2APIC_ENABLE) {
+		if (!kvm_x2apic_msr_write(vcpu, icr_msr_addr, data))
+			return 0;
+	} else {
+		if (!apic_mmio_write(vcpu, NULL, gpa, 4, &data))
+			return 0;
+	}
+
+	return 1;
+}
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_xapic_x2apic_send_ipi);
diff --git a/arch/x86/kvm/lapic.h b/arch/x86/kvm/lapic.h
index 274885af4ebc..afd440c88981 100644
--- a/arch/x86/kvm/lapic.h
+++ b/arch/x86/kvm/lapic.h
@@ -156,6 +156,8 @@ int kvm_hv_vapic_msr_read(struct kvm_vcpu *vcpu, u32 msr, u64 *data);
 int kvm_lapic_set_pv_eoi(struct kvm_vcpu *vcpu, u64 data, unsigned long len);
 void kvm_lapic_exit(void);
 
+int kvm_xapic_x2apic_send_ipi(struct kvm_vcpu *vcpu, u64 data);
+
 u64 kvm_lapic_readable_reg_mask(struct kvm_lapic *apic);
 
 static inline void kvm_lapic_set_irr(int vec, struct kvm_lapic *apic)
diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index 369fb1e36f58..d04f71836ef7 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -35,6 +35,7 @@
 #include "svm_ops.h"
 #include "cpuid.h"
 #include "trace.h"
+#include "lapic.h"
 
 #define GHCB_VERSION_MAX	2ULL
 #define GHCB_VERSION_MIN	1ULL
@@ -3538,6 +3539,10 @@ static int sev_es_validate_vmgexit(struct vcpu_svm *svm)
 		if (!is_sev_snp_guest(vcpu))
 			goto vmgexit_err;
 		break;
+	case SVM_VMGEXIT_HV_IPI:
+		if (!sev_snp_guest(vcpu->kvm))
+			goto vmgexit_err;
+		break;
 	default:
 		reason = GHCB_ERR_INVALID_EVENT;
 		goto vmgexit_err;
@@ -4416,6 +4421,22 @@ static int sev_snp_hv_doorbell_page(struct vcpu_svm *svm)
 	return 0;
 }
 
+static int sev_snp_hv_ipi(struct vcpu_svm *svm)
+{
+	struct kvm_vcpu *vcpu = &svm->vcpu;
+	u64 icr_info;
+
+	if (!sev_snp_guest(vcpu->kvm))
+		return -EINVAL;
+
+	icr_info = svm->vmcb->control.exit_info_1;
+
+	if (kvm_xapic_x2apic_send_ipi(vcpu, icr_info))
+		return -EINVAL;
+
+	return 0;
+}
+
 static int sev_handle_vmgexit_msr_protocol(struct vcpu_svm *svm)
 {
 	struct vmcb_control_area *control = &svm->vmcb->control;
@@ -4698,6 +4719,13 @@ int sev_handle_vmgexit(struct kvm_vcpu *vcpu)
 			ghcb_set_sw_exit_info_2(svm->sev_es.ghcb, GHCB_ERR_INVALID_INPUT);
 		}
 
+		ret = 1;
+		break;
+	case SVM_VMGEXIT_HV_IPI:
+		if (sev_snp_hv_ipi(svm)) {
+			ghcb_set_sw_exit_info_1(svm->sev_es.ghcb, 2);
+			ghcb_set_sw_exit_info_2(svm->sev_es.ghcb, GHCB_ERR_INVALID_INPUT);
+		}
 		ret = 1;
 		break;
 	case SVM_VMGEXIT_UNSUPPORTED_EVENT:
-- 
2.53.0


