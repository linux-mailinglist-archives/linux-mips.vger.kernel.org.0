Return-Path: <linux-mips+bounces-14950-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aVwXCG7bJmq2lwIAu9opvQ
	(envelope-from <linux-mips+bounces-14950-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 17:10:38 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9A3657DC9
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 17:10:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14950-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-14950-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E19530C2ACD
	for <lists+linux-mips@lfdr.de>; Mon,  8 Jun 2026 14:50:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C74C3F1ACC;
	Mon,  8 Jun 2026 14:43:20 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 702533D8133;
	Mon,  8 Jun 2026 14:43:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929799; cv=none; b=nJuErF6XhnilJZ1eaTp0YqDX85MaBY328beCgVSj+DYQuCrSLYmFdDxvcoGXIbheenEMH+Ojjk/qMkqxLNJpllGXmb96yGw+GELQYGIkCo3P+9q22Ijus99tqF8kd6H6XlkUT7lGn2qoO3KLoxrsDg0GqoNcbMZoPz8HgaXDjjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929799; c=relaxed/simple;
	bh=B8owqNt41sNkaAjE2zg/9bm9OW2tnDyZAeoTDaGU7ao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=opqnJEe/L8CMya4yEP1fyJk5HbDmQATjfeF79/SIgNzvlLcighJbMI5vhHl8K2bz8U3l/xh3/jPgGC0tIxAGwGQbSR0lTr88c663BpxdKRhHmI1U/EXvND6fwQXUvDKnovS6bSv7+u1zDTlaeafhwIwvNcWpz5UFVZGPRgSPZ2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 255222028AD;
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
	joerg.roedel@amd.com
Subject: [PATCH 10/60] kvm: Move vcpu_array to struct kvm_plane
Date: Mon,  8 Jun 2026 16:42:02 +0200
Message-ID: <20260608144252.351443-11-joro@8bytes.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[lists@lfdr.de];
	DMARC_NA(0.00)[8bytes.org: no valid DMARC record];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pbonzini@redhat.com,m:seanjc@google.com,m:thomas.lendacky@amd.com,m:ashish.kalra@amd.com,m:michael.roth@amd.com,m:nsaenz@amazon.com,m:anelkz@amazon.de,m:James.Bottomley@HansenPartnership.com,m:huibo.wang@amd.com,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kvmarm@lists.linux.dev,m:loongarch@lists.linux.dev,m:linux-mips@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm-riscv@lists.infradead.org,m:x86@kernel.org,m:coconut-svsm@lists.linux.dev,m:joerg.roedel@amd.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-14950-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[joro@8bytes.org,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: AB9A3657DC9

From: Paolo Bonzini <pbonzini@redhat.com>

Each plane will have its own set of VCPUs, so move the vcpu_array to
the plane structure.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Co-developed-by: Joerg Roedel <joerg.roedel@amd.com>
Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 include/linux/kvm_host.h | 30 +++++++++++++++++++++---------
 virt/kvm/kvm_main.c      | 33 +++++++++++++++++++++++++--------
 2 files changed, 46 insertions(+), 17 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 5be4c9f118b4..5a72f73a2f31 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -324,12 +324,14 @@ struct kvm_mmio_fragment {
 
 struct kvm_vcpu {
 	struct kvm *kvm;
+	struct kvm_plane *plane;
+
 #ifdef CONFIG_PREEMPT_NOTIFIERS
 	struct preempt_notifier preempt_notifier;
 #endif
 	int cpu;
 	int vcpu_id; /* id given by userspace at creation */
-	int vcpu_idx; /* index into kvm->vcpu_array */
+	int vcpu_idx; /* index into kvm->planes[]->vcpu_array */
 	int ____srcu_idx; /* Don't use this directly.  You've been warned. */
 #ifdef CONFIG_PROVE_RCU
 	int srcu_depth;
@@ -770,6 +772,9 @@ struct kvm_memslots {
 struct kvm_plane {
 	struct kvm *kvm;
 	unsigned level;
+
+	/* Per-Plane VCPU array */
+	struct xarray vcpu_array;
 };
 
 struct kvm {
@@ -795,7 +800,6 @@ struct kvm {
 	struct kvm_memslots __memslots[KVM_MAX_NR_ADDRESS_SPACES][2];
 	/* The current active memslot set for each address space */
 	struct kvm_memslots __rcu *memslots[KVM_MAX_NR_ADDRESS_SPACES];
-	struct xarray vcpu_array;
 	/*
 	 * Protected by slots_lock, but can be read outside if an
 	 * incorrect answer is acceptable.
@@ -996,9 +1000,9 @@ static inline struct kvm_io_bus *kvm_get_bus(struct kvm *kvm, enum kvm_bus idx)
 					 lockdep_is_held(&kvm->slots_lock));
 }
 
-static inline struct kvm_vcpu *kvm_get_vcpu(struct kvm *kvm, int i)
+static inline struct kvm_vcpu *plane_get_vcpu(struct kvm_plane *plane, int i)
 {
-	int num_vcpus = atomic_read(&kvm->online_vcpus);
+	int num_vcpus = atomic_read(&plane->kvm->online_vcpus);
 
 	/*
 	 * Explicitly verify the target vCPU is online, as the anti-speculation
@@ -1012,13 +1016,21 @@ static inline struct kvm_vcpu *kvm_get_vcpu(struct kvm *kvm, int i)
 
 	/* Pairs with smp_wmb() in kvm_vm_ioctl_create_vcpu.  */
 	smp_rmb();
-	return xa_load(&kvm->vcpu_array, i);
+	return xa_load(&plane->vcpu_array, i);
 }
 
-#define kvm_for_each_vcpu(idx, vcpup, kvm)				\
-	if (atomic_read(&kvm->online_vcpus))				\
-		xa_for_each_range(&kvm->vcpu_array, idx, vcpup, 0,	\
-				  (atomic_read(&kvm->online_vcpus) - 1))
+static inline struct kvm_vcpu *kvm_get_vcpu(struct kvm *kvm, int i)
+{
+	return plane_get_vcpu(kvm->planes[0], i);
+}
+
+#define plane_for_each_vcpu(idx, vcpup, plane)					\
+	if (atomic_read(&plane->kvm->online_vcpus))				\
+		xa_for_each_range(&plane->vcpu_array, idx, vcpup, 0,		\
+				  (atomic_read(&plane->kvm->online_vcpus) - 1))
+
+#define kvm_for_each_vcpu(idx, vcpup, kvm)					\
+	plane_for_each_vcpu(idx, vcpup, kvm->planes[0])
 
 static inline struct kvm_vcpu *kvm_get_vcpu_by_id(struct kvm *kvm, int id)
 {
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index a68469c6d12e..668645dd3945 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -443,6 +443,7 @@ static void kvm_vcpu_init(struct kvm_vcpu *vcpu, struct kvm *kvm, unsigned id)
 	mutex_init(&vcpu->mutex);
 	vcpu->cpu = -1;
 	vcpu->kvm = kvm;
+	vcpu->plane = kvm->planes[0];
 	vcpu->vcpu_id = id;
 	vcpu->pid = NULL;
 	rwlock_init(&vcpu->pid_lock);
@@ -479,14 +480,14 @@ static void kvm_vcpu_destroy(struct kvm_vcpu *vcpu)
 	kmem_cache_free(kvm_vcpu_cache, vcpu);
 }
 
-void kvm_destroy_vcpus(struct kvm *kvm)
+static void plane_destroy_vcpus(struct kvm_plane *plane)
 {
 	unsigned long i;
 	struct kvm_vcpu *vcpu;
 
-	kvm_for_each_vcpu(i, vcpu, kvm) {
+	plane_for_each_vcpu(i, vcpu, plane) {
 		kvm_vcpu_destroy(vcpu);
-		xa_erase(&kvm->vcpu_array, i);
+		xa_erase(&plane->vcpu_array, i);
 
 		/*
 		 * Assert that the vCPU isn't visible in any way, to ensure KVM
@@ -494,7 +495,22 @@ void kvm_destroy_vcpus(struct kvm *kvm)
 		 * in VM-wide request, e.g. to flush remote TLBs when tearing
 		 * down MMUs, or to mark the VM dead if a KVM_BUG_ON() fires.
 		 */
-		WARN_ON_ONCE(xa_load(&kvm->vcpu_array, i) || kvm_get_vcpu(kvm, i));
+		WARN_ON_ONCE(xa_load(&plane->vcpu_array, i) || plane_get_vcpu(plane, i));
+	}
+
+}
+
+void kvm_destroy_vcpus(struct kvm *kvm)
+{
+	unsigned lvl;
+
+	for (lvl = KVM_MAX_PLANES; lvl > 0; lvl--) {
+		struct kvm_plane *plane = kvm->planes[lvl - 1];
+
+		if (plane == NULL)
+			continue;
+
+		plane_destroy_vcpus(plane);
 	}
 
 	atomic_set(&kvm->online_vcpus, 0);
@@ -1105,6 +1121,8 @@ static struct kvm_plane *kvm_create_plane(struct kvm *kvm, unsigned plane_level)
 	plane->kvm = kvm;
 	plane->level = plane_level;
 
+	xa_init(&plane->vcpu_array);
+
 	kvm->planes[plane_level] = plane;
 
 	return plane;
@@ -1146,7 +1164,6 @@ static struct kvm *kvm_create_vm(unsigned long type, const char *fdname)
 	mutex_init(&kvm->slots_arch_lock);
 	spin_lock_init(&kvm->mn_invalidate_lock);
 	rcuwait_init(&kvm->mn_memslots_update_rcuwait);
-	xa_init(&kvm->vcpu_array);
 #ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
 	xa_init(&kvm->mem_attr_array);
 #endif
@@ -4039,7 +4056,7 @@ void kvm_vcpu_on_spin(struct kvm_vcpu *me, bool yield_to_kernel_mode)
 		if (idx == me->vcpu_idx)
 			continue;
 
-		vcpu = xa_load(&kvm->vcpu_array, idx);
+		vcpu = xa_load(&kvm->planes[0]->vcpu_array, idx);
 		if (!READ_ONCE(vcpu->ready))
 			continue;
 		if (kvm_vcpu_is_blocking(vcpu) && !vcpu_dy_runnable(vcpu))
@@ -4258,7 +4275,7 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, unsigned long id)
 	}
 
 	vcpu->vcpu_idx = atomic_read(&kvm->online_vcpus);
-	r = xa_insert(&kvm->vcpu_array, vcpu->vcpu_idx, vcpu, GFP_KERNEL_ACCOUNT);
+	r = xa_insert(&kvm->planes[0]->vcpu_array, vcpu->vcpu_idx, vcpu, GFP_KERNEL_ACCOUNT);
 	WARN_ON_ONCE(r == -EBUSY);
 	if (r)
 		goto unlock_vcpu_destroy;
@@ -4293,7 +4310,7 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, unsigned long id)
 kvm_put_xa_erase:
 	mutex_unlock(&vcpu->mutex);
 	kvm_put_kvm_no_destroy(kvm);
-	xa_erase(&kvm->vcpu_array, vcpu->vcpu_idx);
+	xa_erase(&kvm->planes[0]->vcpu_array, vcpu->vcpu_idx);
 unlock_vcpu_destroy:
 	mutex_unlock(&kvm->lock);
 	kvm_dirty_ring_free(&vcpu->dirty_ring);
-- 
2.53.0


