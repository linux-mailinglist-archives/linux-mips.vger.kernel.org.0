Return-Path: <linux-mips+bounces-14952-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JL1VGJDcJmrwlwIAu9opvQ
	(envelope-from <linux-mips+bounces-14952-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 17:15:28 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FF6657E70
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 17:15:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14952-lists+linux-mips=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-mips+bounces-14952-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 937F3300D790
	for <lists+linux-mips@lfdr.de>; Mon,  8 Jun 2026 14:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1C133EFFC1;
	Mon,  8 Jun 2026 14:43:20 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 821083D88FA;
	Mon,  8 Jun 2026 14:43:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929800; cv=none; b=NZe3NwC861DSeoYKXGWLMpO21YOh0JZ0IXzFoGiMkZwAGSEEqYZS6outlCKgtOza2z5uiARnNPE/elp/jNrZEXGrgfeGRI9rYQarPrD1Ik/sxhUJcRW62TG/vyOewsExw47qsoDt+0lwjlMLH1mhVMRH4MOKJuQrGD8tDKpxGf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929800; c=relaxed/simple;
	bh=4ORi4B4afWlRXij5S4yTmEvVrbaYG/uVZorjzk7jihg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hw5A0U7Mkqb4JVCoBYzoTzmNDp729wYsDGIX27xTYG/TwzDRuNz7jNwWHNuezuPi9zeDgIrD7esHkE7f48OB4O5eGhoiKoH8B9HrSy2+vQMeVlqIXVWueL5bDcvgSq3PRwkGdtwIergXm0ke0pzlD6DdXPBNKGOVKZmvcC9G9XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 579A02028AE;
	Mon,  8 Jun 2026 16:43:07 +0200 (CEST)
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
	joerg.roedel@amd.com,
	=?UTF-8?q?Carlos=20L=C3=B3pez?= <clopez@suse.de>
Subject: [PATCH 11/60] kvm: Introduce struct kvm_vcpu_common
Date: Mon,  8 Jun 2026 16:42:03 +0200
Message-ID: <20260608144252.351443-12-joro@8bytes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260608144252.351443-1-joro@8bytes.org>
References: <20260608144252.351443-1-joro@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.54 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MIXED_CHARSET(1.00)[subject];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:pbonzini@redhat.com,m:seanjc@google.com,m:thomas.lendacky@amd.com,m:ashish.kalra@amd.com,m:michael.roth@amd.com,m:nsaenz@amazon.com,m:anelkz@amazon.de,m:James.Bottomley@HansenPartnership.com,m:huibo.wang@amd.com,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kvmarm@lists.linux.dev,m:loongarch@lists.linux.dev,m:linux-mips@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm-riscv@lists.infradead.org,m:x86@kernel.org,m:coconut-svsm@lists.linux.dev,m:joerg.roedel@amd.com,m:clopez@suse.de,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[8bytes.org: no valid DMARC record];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[joro@8bytes.org,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-14952-lists,linux-mips=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joro@8bytes.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	R_DKIM_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 53FF6657E70

From: Joerg Roedel <joerg.roedel@amd.com>

When creating one VCPU object per plane there is still a lot of VCPU
state which needes to be shared across all planes. Create struct
kvm_vcpu_common as a container for this shared state.

Co-developed-by: Carlos López <clopez@suse.de>
Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 include/linux/kvm_host.h | 10 ++++++++++
 virt/kvm/kvm_main.c      | 36 ++++++++++++++++++++++++++++++++++--
 2 files changed, 44 insertions(+), 2 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 5a72f73a2f31..c4c4922df965 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -322,6 +322,13 @@ struct kvm_mmio_fragment {
 	unsigned int len;
 };
 
+struct kvm_vcpu_common {
+	struct kvm *kvm;
+
+	/* Currently active VCPU */
+	struct kvm_vcpu *current_vcpu;
+};
+
 struct kvm_vcpu {
 	struct kvm *kvm;
 	struct kvm_plane *plane;
@@ -400,6 +407,9 @@ struct kvm_vcpu {
 	 */
 	struct kvm_memory_slot *last_used_slot;
 	u64 last_used_slot_gen;
+
+	struct kvm_vcpu_common *common;
+	unsigned plane_level;
 };
 
 /*
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 668645dd3945..fb840d029c56 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -438,6 +438,20 @@ void *kvm_mmu_memory_cache_alloc(struct kvm_mmu_memory_cache *mc)
 }
 #endif
 
+static int kvm_vcpu_init_common(struct kvm_vcpu *vcpu, struct kvm *kvm)
+{
+	struct kvm_vcpu_common *common = kzalloc(sizeof(*common), GFP_KERNEL_ACCOUNT);
+
+	if (common == NULL)
+		return -ENOMEM;
+
+	common->kvm = kvm;
+	common->current_vcpu = vcpu;
+	vcpu->common = common;
+
+	return 0;
+}
+
 static void kvm_vcpu_init(struct kvm_vcpu *vcpu, struct kvm *kvm, unsigned id)
 {
 	mutex_init(&vcpu->mutex);
@@ -459,14 +473,26 @@ static void kvm_vcpu_init(struct kvm_vcpu *vcpu, struct kvm *kvm, unsigned id)
 	preempt_notifier_init(&vcpu->preempt_notifier, &kvm_preempt_ops);
 	vcpu->last_used_slot = NULL;
 
+	vcpu->plane_level = 0;
+
 	/* Fill the stats id string for the vcpu */
 	snprintf(vcpu->stats_id, sizeof(vcpu->stats_id), "kvm-%d/vcpu-%d",
 		 task_pid_nr(current), id);
 }
 
+static void kvm_vcpu_common_destroy(struct kvm_vcpu *vcpu)
+{
+	if (vcpu->plane_level == 0)
+		kfree(vcpu->common);
+
+	vcpu->common = NULL;
+}
+
 static void kvm_vcpu_destroy(struct kvm_vcpu *vcpu)
 {
 	kvm_arch_vcpu_destroy(vcpu);
+
+	kvm_vcpu_common_destroy(vcpu);
 	kvm_dirty_ring_free(&vcpu->dirty_ring);
 
 	/*
@@ -1360,8 +1386,8 @@ static void kvm_destroy_vm(struct kvm *kvm)
 #ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
 	xa_destroy(&kvm->mem_attr_array);
 #endif
-	kvm_arch_free_vm(kvm);
 	kvm_destroy_planes(kvm);
+	kvm_arch_free_vm(kvm);
 	preempt_notifier_dec();
 	kvm_disable_virtualization();
 	mmdrop(mm);
@@ -4246,11 +4272,15 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, unsigned long id)
 		goto vcpu_decrement;
 	}
 
+	r = kvm_vcpu_init_common(vcpu, kvm);
+	if (r)
+		goto vcpu_free;
+
 	BUILD_BUG_ON(sizeof(struct kvm_run) > PAGE_SIZE);
 	page = alloc_page(GFP_KERNEL_ACCOUNT | __GFP_ZERO);
 	if (!page) {
 		r = -ENOMEM;
-		goto vcpu_free;
+		goto vcpu_free_common;
 	}
 	vcpu->run = page_address(page);
 
@@ -4318,6 +4348,8 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, unsigned long id)
 	kvm_arch_vcpu_destroy(vcpu);
 vcpu_free_run_page:
 	free_page((unsigned long)vcpu->run);
+vcpu_free_common:
+	kvm_vcpu_common_destroy(vcpu);
 vcpu_free:
 	kmem_cache_free(kvm_vcpu_cache, vcpu);
 vcpu_decrement:
-- 
2.53.0


