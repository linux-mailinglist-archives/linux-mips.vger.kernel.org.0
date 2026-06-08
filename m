Return-Path: <linux-mips+bounces-14949-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8doQKmTbJmqzlwIAu9opvQ
	(envelope-from <linux-mips+bounces-14949-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 17:10:28 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 08057657DBD
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 17:10:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14949-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-14949-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B6CFE3461511
	for <lists+linux-mips@lfdr.de>; Mon,  8 Jun 2026 14:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E789D3D9DA5;
	Mon,  8 Jun 2026 14:43:19 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 990FA3D5676;
	Mon,  8 Jun 2026 14:43:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929799; cv=none; b=ORZFUWuN76ufPEq7whMBXiWvvFQrreS5LkpVb7j6l9XWXKVEpXdB7l+UVkSNFhFF7AuP3r3Hbw2pBWFCYIQpRz9y/HRqz0aRdlZ4PCnmZOPK18s9XMF8yQAmG4+gaNGxIuabIlJV6URBCZ60pUIp4AgGF0YS7mm+qZROl5mG9FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929799; c=relaxed/simple;
	bh=hIJot40vOqp2I86HNZX2yK27+S1gZmwy5Um7uPgT008=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gbhLALGMK38AKlyPRM/7+OPdbOMygwxf5q7VIYxUc4KArNHLo+qijl4oR4ZPxABzzaqkpL/msME/En7wy7fieQm1zeG14ehEerhpizKt+/Ytp+J6Wrf1toLsXrWyHaLxpM141L7qFo6spCxSeQm/dpRnhT7+aNGwZSYYfWbD7FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 8D3EE2028AF;
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
Subject: [PATCH 12/60] kvm: Move vcpu accounting to struct kvm_vcpu_common
Date: Mon,  8 Jun 2026 16:42:04 +0200
Message-ID: <20260608144252.351443-13-joro@8bytes.org>
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
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.77)[subject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:pbonzini@redhat.com,m:seanjc@google.com,m:thomas.lendacky@amd.com,m:ashish.kalra@amd.com,m:michael.roth@amd.com,m:nsaenz@amazon.com,m:anelkz@amazon.de,m:James.Bottomley@HansenPartnership.com,m:huibo.wang@amd.com,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kvmarm@lists.linux.dev,m:loongarch@lists.linux.dev,m:linux-mips@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm-riscv@lists.infradead.org,m:x86@kernel.org,m:coconut-svsm@lists.linux.dev,m:joerg.roedel@amd.com,m:clopez@suse.de,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[8bytes.org: no valid DMARC record];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[joro@8bytes.org,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-14949-lists,linux-mips=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 08057657DBD

From: Joerg Roedel <joerg.roedel@amd.com>

Do the accounting of created vcpus and the sanity checks only once per
plane.

Co-developed-by: Carlos López <clopez@suse.de>
Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 include/linux/kvm_host.h |   2 +
 virt/kvm/kvm_main.c      | 108 ++++++++++++++++++++++++---------------
 2 files changed, 68 insertions(+), 42 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index c4c4922df965..47144a83f9c5 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -325,6 +325,8 @@ struct kvm_mmio_fragment {
 struct kvm_vcpu_common {
 	struct kvm *kvm;
 
+	int vcpu_idx; /* index into kvm->planes[]->vcpu_array */
+
 	/* Currently active VCPU */
 	struct kvm_vcpu *current_vcpu;
 };
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index fb840d029c56..14e74cdc4709 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -438,18 +438,58 @@ void *kvm_mmu_memory_cache_alloc(struct kvm_mmu_memory_cache *mc)
 }
 #endif
 
-static int kvm_vcpu_init_common(struct kvm_vcpu *vcpu, struct kvm *kvm)
+static int kvm_vcpu_init_common(struct kvm_vcpu *vcpu, struct kvm *kvm, unsigned long id)
 {
-	struct kvm_vcpu_common *common = kzalloc(sizeof(*common), GFP_KERNEL_ACCOUNT);
+	struct kvm_vcpu_common *common __free(kfree) = kzalloc(sizeof(*common), GFP_KERNEL_ACCOUNT);
+	int r;
 
-	if (common == NULL)
-		return -ENOMEM;
+	/*
+	 * KVM tracks vCPU IDs as 'int', be kind to userspace and reject
+	 * too-large values instead of silently truncating.
+	 *
+	 * Ensure KVM_MAX_VCPU_IDS isn't pushed above INT_MAX without first
+	 * changing the storage type (at the very least, IDs should be tracked
+	 * as unsigned ints).
+	 */
+	BUILD_BUG_ON(KVM_MAX_VCPU_IDS > INT_MAX);
+	if (id >= KVM_MAX_VCPU_IDS)
+		return -EINVAL;
+
+	mutex_lock(&kvm->lock);
+	kvm->created_vcpus++;
+	mutex_unlock(&kvm->lock);
+
+	if (common == NULL) {
+		r = -ENOMEM;
+		goto out_drop_counter;
+	}
+
+	common->vcpu_idx = atomic_read(&kvm->online_vcpus);
 
 	common->kvm = kvm;
 	common->current_vcpu = vcpu;
-	vcpu->common = common;
+	vcpu->common = no_free_ptr(common);
 
 	return 0;
+
+out_drop_counter:
+	mutex_lock(&kvm->lock);
+	kvm->created_vcpus--;
+	mutex_unlock(&kvm->lock);
+
+	return r;
+}
+
+static void kvm_vcpu_finish_common(struct kvm_vcpu *vcpu)
+{
+	smp_wmb();
+	if (vcpu->plane_level == 0) {
+		/*
+		 * Pairs with smp_rmb() in kvm_get_vcpu.  Store the vcpu
+		 * pointer before kvm->online_vcpu's incremented value.
+		 */
+		atomic_inc(&vcpu->kvm->online_vcpus);
+	}
 }
 
 static void kvm_vcpu_init(struct kvm_vcpu *vcpu, struct kvm *kvm, unsigned id)
@@ -482,10 +522,19 @@ static void kvm_vcpu_init(struct kvm_vcpu *vcpu, struct kvm *kvm, unsigned id)
 
 static void kvm_vcpu_common_destroy(struct kvm_vcpu *vcpu)
 {
-	if (vcpu->plane_level == 0)
-		kfree(vcpu->common);
+	struct kvm_vcpu_common *common = vcpu->common;
+	struct kvm *kvm = common->kvm;
 
 	vcpu->common = NULL;
+
+	if (vcpu->plane_level != 0)
+	       return;
+
+	mutex_lock(&common->kvm->lock);
+	kvm->created_vcpus--;
+	mutex_unlock(&common->kvm->lock);
+
+	kfree(common);
 }
 
 static void kvm_vcpu_destroy(struct kvm_vcpu *vcpu)
@@ -4235,22 +4284,10 @@ static void kvm_create_vcpu_debugfs(struct kvm_vcpu *vcpu)
  */
 static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, unsigned long id)
 {
-	int r;
+	int r = -EINVAL;
 	struct kvm_vcpu *vcpu;
 	struct page *page;
 
-	/*
-	 * KVM tracks vCPU IDs as 'int', be kind to userspace and reject
-	 * too-large values instead of silently truncating.
-	 *
-	 * Ensure KVM_MAX_VCPU_IDS isn't pushed above INT_MAX without first
-	 * changing the storage type (at the very least, IDs should be tracked
-	 * as unsigned ints).
-	 */
-	BUILD_BUG_ON(KVM_MAX_VCPU_IDS > INT_MAX);
-	if (id >= KVM_MAX_VCPU_IDS)
-		return -EINVAL;
-
 	mutex_lock(&kvm->lock);
 	if (kvm->created_vcpus >= kvm->max_vcpus) {
 		mutex_unlock(&kvm->lock);
@@ -4258,24 +4295,20 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, unsigned long id)
 	}
 
 	r = kvm_arch_vcpu_precreate(kvm, id);
-	if (r) {
-		mutex_unlock(&kvm->lock);
-		return r;
-	}
-
-	kvm->created_vcpus++;
 	mutex_unlock(&kvm->lock);
+	if (r)
+		return r;
 
 	vcpu = kmem_cache_zalloc(kvm_vcpu_cache, GFP_KERNEL_ACCOUNT);
-	if (!vcpu) {
-		r = -ENOMEM;
-		goto vcpu_decrement;
-	}
+	if (!vcpu)
+		return -ENOMEM;
 
-	r = kvm_vcpu_init_common(vcpu, kvm);
+	r = kvm_vcpu_init_common(vcpu, kvm, id);
 	if (r)
 		goto vcpu_free;
 
+	vcpu->vcpu_idx = vcpu->common->vcpu_idx;
+
 	BUILD_BUG_ON(sizeof(struct kvm_run) > PAGE_SIZE);
 	page = alloc_page(GFP_KERNEL_ACCOUNT | __GFP_ZERO);
 	if (!page) {
@@ -4304,7 +4337,6 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, unsigned long id)
 		goto unlock_vcpu_destroy;
 	}
 
-	vcpu->vcpu_idx = atomic_read(&kvm->online_vcpus);
 	r = xa_insert(&kvm->planes[0]->vcpu_array, vcpu->vcpu_idx, vcpu, GFP_KERNEL_ACCOUNT);
 	WARN_ON_ONCE(r == -EBUSY);
 	if (r)
@@ -4324,12 +4356,7 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, unsigned long id)
 	if (r < 0)
 		goto kvm_put_xa_erase;
 
-	/*
-	 * Pairs with smp_rmb() in kvm_get_vcpu.  Store the vcpu
-	 * pointer before kvm->online_vcpu's incremented value.
-	 */
-	smp_wmb();
-	atomic_inc(&kvm->online_vcpus);
+	kvm_vcpu_finish_common(vcpu);
 	mutex_unlock(&vcpu->mutex);
 
 	mutex_unlock(&kvm->lock);
@@ -4352,10 +4379,7 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, unsigned long id)
 	kvm_vcpu_common_destroy(vcpu);
 vcpu_free:
 	kmem_cache_free(kvm_vcpu_cache, vcpu);
-vcpu_decrement:
-	mutex_lock(&kvm->lock);
-	kvm->created_vcpus--;
-	mutex_unlock(&kvm->lock);
+
 	return r;
 }
 
-- 
2.53.0


