Return-Path: <linux-mips+bounces-14984-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KsLTKIHZJmoylwIAu9opvQ
	(envelope-from <linux-mips+bounces-14984-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 17:02:25 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E5B657C4A
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 17:02:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14984-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-14984-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 31413309E1D8
	for <lists+linux-mips@lfdr.de>; Mon,  8 Jun 2026 14:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A7323FD15F;
	Mon,  8 Jun 2026 14:43:34 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB29A3F86F3;
	Mon,  8 Jun 2026 14:43:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929814; cv=none; b=u+fTmyWeKO8PZyuub8beHmbOZhF+ZwvsQ2TRSmTmRk8xzQsaIP/a8jy2cF7qnxFD3X4DK6EVKNgVgzoYtmfH9lKDopKPmDE8JiDyeFUpzFOxxfktCtdDPwWC6BCRSGBoVYSA12WxtETeCY2aylrVxWvx/p3O9nAKgNPTzqJHvmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929814; c=relaxed/simple;
	bh=bkCtnmZAYihruXOpiTpeQAG5QGXLjIFwnVzXc3ACW6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rKkIoXxSoKqO/SBJSkx39YIq80rxKwuXwrIVPbZRH5G1xZJk6CC/9CgSw+jtKyIxVtx2fCzhI1uVjEV24DQTav09HvBSwPx6sp4P9FjXnJEJzBTWb3V8pNbCIdRCKouQXh+WXcZvcDCP02ASMpr5+MKnsMUZ1H1ThjymJamnIaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 072512028D6;
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
Subject: [PATCH 51/60] kvm: x86: Share pio_data across planes
Date: Mon,  8 Jun 2026 16:42:43 +0200
Message-ID: <20260608144252.351443-52-joro@8bytes.org>
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
X-Spamd-Result: default: False [0.87 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.83)[subject];
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
	TAGGED_FROM(0.00)[bounces-14984-lists,linux-mips=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,8bytes.org:mid,8bytes.org:from_mime,vger.kernel.org:from_smtp,amd.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 35E5B657C4A

From: Joerg Roedel <joerg.roedel@amd.com>

The vcpu->arch.pio_data pointer is memory mapped to user-space
alongside the kvm_run page. So it also needs to be common across all
planes for a given VCPU index.

Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 arch/x86/include/asm/kvm_host.h |  2 ++
 arch/x86/kvm/x86.c              | 20 +++++++++++---------
 virt/kvm/kvm_main.c             |  2 +-
 3 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 0327b77e56b7..1b7aa48c961e 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -801,6 +801,8 @@ struct kvm_vcpu_arch_common {
 	bool cpuid_dynamic_bits_dirty;
 	bool is_amd_compatible;
 
+	void *pio_data;
+
 	/*
 	 * cpu_caps holds the effective guest capabilities, i.e. the features
 	 * the vCPU is allowed to use.  Typically, but not always, features can
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 5f48392d4738..08fe65b8d57d 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -8532,7 +8532,7 @@ static int emulator_pio_in_out(struct kvm_vcpu *vcpu, int size,
 }
 
 static int emulator_pio_in(struct kvm_vcpu *vcpu, int size,
-      			   unsigned short port, void *val, unsigned int count)
+			   unsigned short port, void *val, unsigned int count)
 {
 	int r = emulator_pio_in_out(vcpu, size, port, val, count, true);
 	if (r)
@@ -12936,7 +12936,6 @@ int kvm_arch_vcpu_precreate(struct kvm *kvm, unsigned int id)
 
 int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 {
-	struct page *page;
 	int r;
 
 	vcpu->arch.last_vmentry_cpu = -1;
@@ -12960,10 +12959,7 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 
 	r = -ENOMEM;
 
-	page = alloc_page(GFP_KERNEL_ACCOUNT | __GFP_ZERO);
-	if (!page)
-		goto fail_free_lapic;
-	vcpu->arch.pio_data = page_address(page);
+	vcpu->arch.pio_data = vcpu->common->arch.pio_data;
 
 	vcpu->arch.mce_banks = kcalloc(KVM_MAX_MCE_BANKS * 4, sizeof(u64),
 				       GFP_KERNEL_ACCOUNT);
@@ -13023,8 +13019,6 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 fail_free_mce_banks:
 	kfree(vcpu->arch.mce_banks);
 	kfree(vcpu->arch.mci_ctl2_banks);
-	free_page((unsigned long)vcpu->arch.pio_data);
-fail_free_lapic:
 	kvm_free_lapic(vcpu);
 fail_mmu_destroy:
 	kvm_mmu_destroy(vcpu);
@@ -13072,16 +13066,24 @@ void kvm_arch_vcpu_destroy(struct kvm_vcpu *vcpu)
 	idx = srcu_read_lock(&vcpu->kvm->srcu);
 	kvm_mmu_destroy(vcpu);
 	srcu_read_unlock(&vcpu->kvm->srcu, idx);
-	free_page((unsigned long)vcpu->arch.pio_data);
 }
 
 int kvm_arch_vcpu_common_init(struct kvm_vcpu_common *common)
 {
+	struct page *page;
+
+	page = alloc_page(GFP_KERNEL_ACCOUNT | __GFP_ZERO);
+	if (!page)
+		return -ENOMEM;
+
+	common->arch.pio_data = page_address(page);
+
 	return 0;
 }
 
 void kvm_arch_vcpu_common_destroy(struct kvm_vcpu_common *common)
 {
+	free_page((unsigned long)common->arch.pio_data);
 	kvfree(common->arch.cpuid_entries);
 }
 
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index a6d7601c3412..8f1a16af519a 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4250,7 +4250,7 @@ static vm_fault_t kvm_vcpu_fault(struct vm_fault *vmf)
 		page = virt_to_page(vcpu->run);
 #ifdef CONFIG_X86
 	else if (vmf->pgoff == KVM_PIO_PAGE_OFFSET)
-		page = virt_to_page(vcpu->arch.pio_data);
+		page = virt_to_page(vcpu->common->arch.pio_data);
 #endif
 #ifdef CONFIG_KVM_MMIO
 	else if (vmf->pgoff == KVM_COALESCED_MMIO_PAGE_OFFSET)
-- 
2.53.0


