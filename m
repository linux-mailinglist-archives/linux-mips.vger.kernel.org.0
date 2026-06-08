Return-Path: <linux-mips+bounces-14990-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oVSXNMjdJmoomAIAu9opvQ
	(envelope-from <linux-mips+bounces-14990-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 17:20:40 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6AA657F28
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 17:20:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14990-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-14990-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EF000304167E
	for <lists+linux-mips@lfdr.de>; Mon,  8 Jun 2026 14:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F10C93FFFAB;
	Mon,  8 Jun 2026 14:43:36 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EE543F58CD;
	Mon,  8 Jun 2026 14:43:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929816; cv=none; b=eSyVZD/5r3yDC2k4us8GJkV5+nR1oLQ4LlN3/ASDfeOEWN+wogE2PBn8QbpBp6stpbWdxwZDcAu8SHKDkFWqDEZlX3z7i4MSXU24virdfBQDPXX2X1psqOy4sM/ON1Uj9DOkR44GJsE8bAjz9HWrm2rKPlQgzioedQ+iHdQpkdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929816; c=relaxed/simple;
	bh=db/Q7SVfsAoxR5f7Ac6G5I8uePQOMBXsCr5MOziknUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vkk4W6PNufRQl+yV6b6kB9ueG8qt2+8Jo8VQ6qa3oN4F+uwQUXaU6zowUn+d98/ygFcyoxEFv99bxUpicJUQafPbuLKreS1Wd6MeD7hVb6hNl3mXnRW70RkzVG5T4m/kIEn4QCz7rKbLylLsL/oos4yBugB1mL8vLKxncYKtEpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id DAF792028CC;
	Mon,  8 Jun 2026 16:43:13 +0200 (CEST)
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
Subject: [PATCH 41/60] kvm: x86: Make apic_map per plane
Date: Mon,  8 Jun 2026 16:42:33 +0200
Message-ID: <20260608144252.351443-42-joro@8bytes.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
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
	TAGGED_FROM(0.00)[bounces-14990-lists,linux-mips=lfdr.de];
	FORGED_SENDER(0.00)[joro@8bytes.org,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,vger.kernel.org:from_smtp,8bytes.org:mid,8bytes.org:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CB6AA657F28

From: Paolo Bonzini <pbonzini@redhat.com>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Co-developed-by: Joerg Roedel <joerg.roedel@amd.com>
Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 arch/x86/include/asm/kvm_host.h | 24 +++++------
 arch/x86/kvm/i8254.c            |  2 +-
 arch/x86/kvm/lapic.c            | 71 +++++++++++++++++----------------
 arch/x86/kvm/x86.c              | 18 +++++++--
 4 files changed, 61 insertions(+), 54 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 134bc02962fd..11e52f8bb2c2 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1418,16 +1418,17 @@ enum kvm_mmu_type {
 };
 
 /* Per-plane state of VM */
-struct kvm_arch_plane {};
+struct kvm_arch_plane {
+	atomic_t vapics_in_nmi_mode;
 
-static inline int kvm_arch_plane_init(struct kvm *kvm,
-				      struct kvm_plane *plane,
-				      unsigned plane_level)
-{
-	return 0;
-}
+	struct mutex apic_map_lock;
+	struct kvm_apic_map __rcu *apic_map;
+	atomic_t apic_map_dirty;
+};
 
-static inline void kvm_arch_plane_destroy(struct kvm_plane *plane) {}
+int kvm_arch_plane_init(struct kvm *kvm, struct kvm_plane *plane,
+			unsigned plane_level);
+void kvm_arch_plane_destroy(struct kvm_plane *plane);
 
 struct kvm_arch {
 	unsigned long n_used_mmu_pages;
@@ -1465,11 +1466,6 @@ struct kvm_arch {
 	struct kvm_ioapic *vioapic;
 	struct kvm_pit *vpit;
 #endif
-	atomic_t vapics_in_nmi_mode;
-
-	struct mutex apic_map_lock;
-	struct kvm_apic_map __rcu *apic_map;
-	atomic_t apic_map_dirty;
 
 	bool apic_access_memslot_enabled;
 	bool apic_access_memslot_inhibited;
@@ -2458,7 +2454,7 @@ int kvm_cpu_get_extint(struct kvm_vcpu *v);
 int kvm_cpu_get_interrupt(struct kvm_vcpu *v);
 void kvm_vcpu_reset(struct kvm_vcpu *vcpu, bool init_event);
 
-int kvm_pv_send_ipi(struct kvm *kvm, unsigned long ipi_bitmap_low,
+int kvm_pv_send_ipi(struct kvm_vcpu *kvm_vcpu, unsigned long ipi_bitmap_low,
 		    unsigned long ipi_bitmap_high, u32 min,
 		    unsigned long icr, int op_64_bit);
 
diff --git a/arch/x86/kvm/i8254.c b/arch/x86/kvm/i8254.c
index 1982b0077ddd..bfe590378bd2 100644
--- a/arch/x86/kvm/i8254.c
+++ b/arch/x86/kvm/i8254.c
@@ -260,7 +260,7 @@ static void pit_do_work(struct kthread_work *work)
 	 * VCPUs and only when LVT0 is in NMI mode.  The interrupt can
 	 * also be simultaneously delivered through PIC and IOAPIC.
 	 */
-	if (atomic_read(&kvm->arch.vapics_in_nmi_mode) > 0)
+	if (atomic_read(&kvm->planes[0]->arch.vapics_in_nmi_mode) > 0)
 		kvm_for_each_vcpu(i, vcpu, kvm)
 			kvm_apic_nmi_wd_deliver(vcpu);
 }
diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
index 1b763f164951..06a12b49fafa 100644
--- a/arch/x86/kvm/lapic.c
+++ b/arch/x86/kvm/lapic.c
@@ -403,36 +403,37 @@ enum {
 	DIRTY
 };
 
-static void kvm_recalculate_apic_map(struct kvm *kvm)
+static void kvm_recalculate_apic_map(struct kvm_plane *plane)
 {
 	struct kvm_apic_map *new, *old = NULL;
+	struct kvm *kvm = plane->kvm;
 	struct kvm_vcpu *vcpu;
 	unsigned long i;
 	u32 max_id = 255; /* enough space for any xAPIC ID */
 	bool xapic_id_mismatch;
 	int r;
 
-	/* Read kvm->arch.apic_map_dirty before kvm->arch.apic_map.  */
-	if (atomic_read_acquire(&kvm->arch.apic_map_dirty) == CLEAN)
+	/* Read plane->arch.apic_map_dirty before plane->arch.apic_map.  */
+	if (atomic_read_acquire(&plane->arch.apic_map_dirty) == CLEAN)
 		return;
 
-	WARN_ONCE(!irqchip_in_kernel(kvm),
+	WARN_ONCE(!irqchip_in_kernel(plane->kvm),
 		  "Dirty APIC map without an in-kernel local APIC");
 
-	mutex_lock(&kvm->arch.apic_map_lock);
+	mutex_lock(&plane->arch.apic_map_lock);
 
 retry:
 	/*
-	 * Read kvm->arch.apic_map_dirty before kvm->arch.apic_map (if clean)
+	 * Read plane->arch.apic_map_dirty before plane->arch.apic_map (if clean)
 	 * or the APIC registers (if dirty).  Note, on retry the map may have
 	 * not yet been marked dirty by whatever task changed a vCPU's x2APIC
 	 * ID, i.e. the map may still show up as in-progress.  In that case
 	 * this task still needs to retry and complete its calculation.
 	 */
-	if (atomic_cmpxchg_acquire(&kvm->arch.apic_map_dirty,
+	if (atomic_cmpxchg_acquire(&plane->arch.apic_map_dirty,
 				   DIRTY, UPDATE_IN_PROGRESS) == CLEAN) {
 		/* Someone else has updated the map. */
-		mutex_unlock(&kvm->arch.apic_map_lock);
+		mutex_unlock(&plane->arch.apic_map_lock);
 		return;
 	}
 
@@ -445,7 +446,7 @@ static void kvm_recalculate_apic_map(struct kvm *kvm)
 	 */
 	xapic_id_mismatch = false;
 
-	kvm_for_each_vcpu(i, vcpu, kvm)
+	plane_for_each_vcpu(i, vcpu, plane)
 		if (kvm_apic_present(vcpu))
 			max_id = max(max_id, kvm_x2apic_id(vcpu->arch.apic));
 
@@ -459,7 +460,7 @@ static void kvm_recalculate_apic_map(struct kvm *kvm)
 	new->max_apic_id = max_id;
 	new->logical_mode = KVM_APIC_MODE_SW_DISABLED;
 
-	kvm_for_each_vcpu(i, vcpu, kvm) {
+	plane_for_each_vcpu(i, vcpu, plane) {
 		if (!kvm_apic_present(vcpu))
 			continue;
 
@@ -498,16 +499,16 @@ static void kvm_recalculate_apic_map(struct kvm *kvm)
 	else
 		kvm_clear_apicv_inhibit(kvm, APICV_INHIBIT_REASON_APIC_ID_MODIFIED);
 
-	old = rcu_dereference_protected(kvm->arch.apic_map,
-			lockdep_is_held(&kvm->arch.apic_map_lock));
-	rcu_assign_pointer(kvm->arch.apic_map, new);
+	old = rcu_dereference_protected(plane->arch.apic_map,
+			lockdep_is_held(&plane->arch.apic_map_lock));
+	rcu_assign_pointer(plane->arch.apic_map, new);
 	/*
-	 * Write kvm->arch.apic_map before clearing apic->apic_map_dirty.
+	 * Write kvm->arch.apic_map before clearing plane->apic_map_dirty.
 	 * If another update has come in, leave it DIRTY.
 	 */
-	atomic_cmpxchg_release(&kvm->arch.apic_map_dirty,
+	atomic_cmpxchg_release(&plane->arch.apic_map_dirty,
 			       UPDATE_IN_PROGRESS, CLEAN);
-	mutex_unlock(&kvm->arch.apic_map_lock);
+	mutex_unlock(&plane->arch.apic_map_lock);
 
 	if (old)
 		kvfree_rcu(old, rcu);
@@ -528,7 +529,7 @@ static inline void apic_set_spiv(struct kvm_lapic *apic, u32 val)
 		else
 			static_branch_inc(&apic_sw_disabled.key);
 
-		atomic_set_release(&apic->vcpu->kvm->arch.apic_map_dirty, DIRTY);
+		atomic_set_release(&apic->vcpu->plane->arch.apic_map_dirty, DIRTY);
 	}
 
 	/* Check if there are APF page ready requests pending */
@@ -541,19 +542,19 @@ static inline void apic_set_spiv(struct kvm_lapic *apic, u32 val)
 static inline void kvm_apic_set_xapic_id(struct kvm_lapic *apic, u8 id)
 {
 	kvm_lapic_set_reg(apic, APIC_ID, id << 24);
-	atomic_set_release(&apic->vcpu->kvm->arch.apic_map_dirty, DIRTY);
+	atomic_set_release(&apic->vcpu->plane->arch.apic_map_dirty, DIRTY);
 }
 
 static inline void kvm_apic_set_ldr(struct kvm_lapic *apic, u32 id)
 {
 	kvm_lapic_set_reg(apic, APIC_LDR, id);
-	atomic_set_release(&apic->vcpu->kvm->arch.apic_map_dirty, DIRTY);
+	atomic_set_release(&apic->vcpu->plane->arch.apic_map_dirty, DIRTY);
 }
 
 static inline void kvm_apic_set_dfr(struct kvm_lapic *apic, u32 val)
 {
 	kvm_lapic_set_reg(apic, APIC_DFR, val);
-	atomic_set_release(&apic->vcpu->kvm->arch.apic_map_dirty, DIRTY);
+	atomic_set_release(&apic->vcpu->plane->arch.apic_map_dirty, DIRTY);
 }
 
 static inline void kvm_apic_set_x2apic_id(struct kvm_lapic *apic, u32 id)
@@ -564,7 +565,7 @@ static inline void kvm_apic_set_x2apic_id(struct kvm_lapic *apic, u32 id)
 
 	kvm_lapic_set_reg(apic, APIC_ID, id);
 	kvm_lapic_set_reg(apic, APIC_LDR, ldr);
-	atomic_set_release(&apic->vcpu->kvm->arch.apic_map_dirty, DIRTY);
+	atomic_set_release(&apic->vcpu->plane->arch.apic_map_dirty, DIRTY);
 }
 
 static inline int apic_lvt_enabled(struct kvm_lapic *apic, int lvt_type)
@@ -860,7 +861,7 @@ static int __pv_send_ipi(unsigned long *ipi_bitmap, struct kvm_apic_map *map,
 	return count;
 }
 
-int kvm_pv_send_ipi(struct kvm *kvm, unsigned long ipi_bitmap_low,
+int kvm_pv_send_ipi(struct kvm_vcpu *vcpu, unsigned long ipi_bitmap_low,
 		    unsigned long ipi_bitmap_high, u32 min,
 		    unsigned long icr, int op_64_bit)
 {
@@ -878,7 +879,7 @@ int kvm_pv_send_ipi(struct kvm *kvm, unsigned long ipi_bitmap_low,
 	irq.trig_mode = icr & APIC_INT_LEVELTRIG;
 
 	rcu_read_lock();
-	map = rcu_dereference(kvm->arch.apic_map);
+	map = rcu_dereference(vcpu->plane->arch.apic_map);
 
 	count = -EOPNOTSUPP;
 	if (likely(map)) {
@@ -1240,7 +1241,7 @@ static bool __kvm_irq_delivery_to_apic_fast(struct kvm *kvm, struct kvm_lapic *s
 	}
 
 	rcu_read_lock();
-	map = rcu_dereference(kvm->arch.apic_map);
+	map = rcu_dereference(kvm->planes[0]->arch.apic_map);
 
 	ret = kvm_apic_map_get_dest_lapic(kvm, &src, irq, map, &dst, &bitmap);
 	if (ret) {
@@ -1290,7 +1291,7 @@ static bool kvm_intr_is_single_vcpu_fast(struct kvm *kvm,
 		return false;
 
 	rcu_read_lock();
-	map = rcu_dereference(kvm->arch.apic_map);
+	map = rcu_dereference(kvm->planes[0]->arch.apic_map);
 
 	if (kvm_apic_map_get_dest_lapic(kvm, NULL, irq, map, &dst, &bitmap) &&
 			hweight16(bitmap) == 1) {
@@ -1511,7 +1512,7 @@ void kvm_bitmap_or_dest_vcpus(struct kvm *kvm, struct kvm_lapic_irq *irq,
 	bool ret;
 
 	rcu_read_lock();
-	map = rcu_dereference(kvm->arch.apic_map);
+	map = rcu_dereference(kvm->planes[0]->arch.apic_map);
 
 	ret = kvm_apic_map_get_dest_lapic(kvm, &src, irq, map, &dest_vcpu,
 					  &bitmap);
@@ -2389,9 +2390,9 @@ static void apic_manage_nmi_watchdog(struct kvm_lapic *apic, u32 lvt0_val)
 	if (apic->lvt0_in_nmi_mode != lvt0_in_nmi_mode) {
 		apic->lvt0_in_nmi_mode = lvt0_in_nmi_mode;
 		if (lvt0_in_nmi_mode) {
-			atomic_inc(&apic->vcpu->kvm->arch.vapics_in_nmi_mode);
+			atomic_inc(&apic->vcpu->plane->arch.vapics_in_nmi_mode);
 		} else
-			atomic_dec(&apic->vcpu->kvm->arch.vapics_in_nmi_mode);
+			atomic_dec(&apic->vcpu->plane->arch.vapics_in_nmi_mode);
 	}
 }
 
@@ -2551,7 +2552,7 @@ static int kvm_lapic_reg_write(struct kvm_lapic *apic, u32 reg, u32 val)
 	 * was toggled, the APIC ID changed, etc...   The maps are marked dirty
 	 * on relevant changes, i.e. this is a nop for most writes.
 	 */
-	kvm_recalculate_apic_map(apic->vcpu->kvm);
+	kvm_recalculate_apic_map(apic->vcpu->plane);
 
 	return ret;
 }
@@ -2767,7 +2768,7 @@ static void __kvm_apic_set_base(struct kvm_vcpu *vcpu, u64 value)
 			kvm_make_request(KVM_REQ_APF_READY, vcpu);
 		} else {
 			static_branch_inc(&apic_hw_disabled.key);
-			atomic_set_release(&apic->vcpu->kvm->arch.apic_map_dirty, DIRTY);
+			atomic_set_release(&apic->vcpu->plane->arch.apic_map_dirty, DIRTY);
 		}
 	}
 
@@ -2814,7 +2815,7 @@ int kvm_apic_set_base(struct kvm_vcpu *vcpu, u64 value, bool host_initiated)
 	}
 
 	__kvm_apic_set_base(vcpu, value);
-	kvm_recalculate_apic_map(vcpu->kvm);
+	kvm_recalculate_apic_map(vcpu->plane);
 	return 0;
 }
 EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_apic_set_base);
@@ -2983,7 +2984,7 @@ void kvm_lapic_reset(struct kvm_vcpu *vcpu, bool init_event)
 	vcpu->arch.apic_arb_prio = 0;
 	vcpu->arch.apic_attention = 0;
 
-	kvm_recalculate_apic_map(vcpu->kvm);
+	kvm_recalculate_apic_map(vcpu->plane);
 }
 
 /*
@@ -3271,13 +3272,13 @@ int kvm_apic_set_state(struct kvm_vcpu *vcpu, struct kvm_lapic_state *s)
 
 	r = kvm_apic_state_fixup(vcpu, s, true);
 	if (r) {
-		kvm_recalculate_apic_map(vcpu->kvm);
+		kvm_recalculate_apic_map(vcpu->plane);
 		return r;
 	}
 	memcpy(vcpu->arch.apic->regs, s->regs, sizeof(*s));
 
-	atomic_set_release(&apic->vcpu->kvm->arch.apic_map_dirty, DIRTY);
-	kvm_recalculate_apic_map(vcpu->kvm);
+	atomic_set_release(&apic->vcpu->plane->arch.apic_map_dirty, DIRTY);
+	kvm_recalculate_apic_map(vcpu->plane);
 	kvm_apic_set_version(vcpu);
 
 	apic_update_ppr(apic);
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index a158740a6fc1..070f87ae23eb 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -10441,7 +10441,7 @@ static void kvm_sched_yield(struct kvm_vcpu *vcpu, unsigned long dest_id)
 		goto no_yield;
 
 	rcu_read_lock();
-	map = rcu_dereference(vcpu->kvm->arch.apic_map);
+	map = rcu_dereference(vcpu->plane->arch.apic_map);
 
 	if (likely(map) && dest_id <= map->max_apic_id) {
 		dest_id = array_index_nospec(dest_id, map->max_apic_id + 1);
@@ -10528,7 +10528,7 @@ int ____kvm_emulate_hypercall(struct kvm_vcpu *vcpu, int cpl,
 		if (!guest_pv_has(vcpu, KVM_FEATURE_PV_SEND_IPI))
 			break;
 
-		ret = kvm_pv_send_ipi(vcpu->kvm, a0, a1, a2, a3, op_64_bit);
+		ret = kvm_pv_send_ipi(vcpu, a0, a1, a2, a3, op_64_bit);
 		break;
 	case KVM_HC_SCHED_YIELD:
 		if (!guest_pv_has(vcpu, KVM_FEATURE_PV_SCHED_YIELD))
@@ -13397,6 +13397,18 @@ void kvm_arch_free_vm(struct kvm *kvm)
 	__kvm_arch_free_vm(kvm);
 }
 
+int kvm_arch_plane_init(struct kvm *kvm, struct kvm_plane *plane,
+			unsigned plane_level)
+{
+	mutex_init(&plane->arch.apic_map_lock);
+
+	return 0;
+}
+
+void kvm_arch_plane_destroy(struct kvm_plane *plane)
+{
+	kvfree(rcu_dereference_check(plane->arch.apic_map, 1));
+}
 
 int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 {
@@ -13429,7 +13441,6 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 	atomic_set(&kvm->arch.noncoherent_dma_count, 0);
 
 	raw_spin_lock_init(&kvm->arch.tsc_write_lock);
-	mutex_init(&kvm->arch.apic_map_lock);
 	seqcount_raw_spinlock_init(&kvm->arch.pvclock_sc, &kvm->arch.tsc_write_lock);
 	ratelimit_state_init(&kvm->arch.kvmclock_update_rs, HZ, 10);
 	ratelimit_set_flags(&kvm->arch.kvmclock_update_rs, RATELIMIT_MSG_ON_RELEASE);
@@ -13587,7 +13598,6 @@ void kvm_arch_destroy_vm(struct kvm *kvm)
 	kvm_pic_destroy(kvm);
 	kvm_ioapic_destroy(kvm);
 #endif
-	kvfree(rcu_dereference_check(kvm->arch.apic_map, 1));
 	kfree(srcu_dereference_check(kvm->arch.pmu_event_filter, &kvm->srcu, 1));
 	kvm_mmu_uninit_vm(kvm);
 	kvm_page_track_cleanup(kvm);
-- 
2.53.0


