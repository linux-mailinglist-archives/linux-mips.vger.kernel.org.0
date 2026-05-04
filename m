Return-Path: <linux-mips+bounces-14441-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mI5DMQMi+Wmz5wIAu9opvQ
	(envelope-from <linux-mips+bounces-14441-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 05 May 2026 00:47:31 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E924C48C8
	for <lists+linux-mips@lfdr.de>; Tue, 05 May 2026 00:47:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3EAF8308C29A
	for <lists+linux-mips@lfdr.de>; Mon,  4 May 2026 22:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3EFA3890E0;
	Mon,  4 May 2026 22:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vIb/YPc4"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0BF37FF6D
	for <linux-mips@vger.kernel.org>; Mon,  4 May 2026 22:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777934571; cv=none; b=W2nikjTfuDN/7wwnls4BzwaiLOJVm2tGjn6beuu7eyOPZmYxUtGozm100swDI5NuDWbMLyHIoTi77N2GD9DRW51z2okKaB7h+0zrOKh1OxAq9ltj/nMoS7NbYdEpaeoT6a+oUfKUxK42K1argJy87AsUrCk9ng7Fu5LVfA/W/YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777934571; c=relaxed/simple;
	bh=InGnsmMXyUKk5UR+us+b7DjwbtH0DDKd3A8oEQN+NKI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kWsueYXgWR5sQT1SNQTavIUvbUewRPaq6Y5lkxffRTvn+obCSd5ttFKeJQdIRoFZFuxDuZ+5e/882Gd0oCgJ8eZuaHS4VRFmb4/uLuqYdQFse+YcXg7Sf8IwYBNl0h2utMYG8dzGLIlQF3+RcRW7MQ522t6fpV5McfKEgXhF798=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vIb/YPc4; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2ba115ab6bbso15817095ad.3
        for <linux-mips@vger.kernel.org>; Mon, 04 May 2026 15:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777934569; x=1778539369; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vC+QCMBPXdQWF+dL8GXMYzl+k9Np64sK2GTCcOrjhPY=;
        b=vIb/YPc4eQY1R+pTc4p70eHlPon7UkycR+sBD/1Q2Ite094bGPk1I+2seC9L6++opt
         PZJO0MA916CAcPQ2PjbHgCz9VWeFAsHBw/itVy8JQkelSTcZBVg0W8j7q4JvVCVzCBQc
         IZ+nevL4B8wX/dGI3A4PdW+Sd/e5eZGzr+M/IgO0cYuj1GysDg8GIY6dQkvEVZyF34aI
         9XxIZ6D/oNRiX4zQ/LFUM8oGcRGdESwx7v8aSL2zoFNEsjPPtvfHUhnr543oFvT8nB5m
         R2se9oC+VoaRmckyk6M+86xtJXoLyKwp9Gfwz6HmWcWJI27Ri6NCGg3F9mM9lAXg8vyV
         m56A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777934569; x=1778539369;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vC+QCMBPXdQWF+dL8GXMYzl+k9Np64sK2GTCcOrjhPY=;
        b=Rqbs7zWZf8Zn4c1+FoBlGP9X6BgRQhRPMCGiKk19Wny3cazZ6IsV6I9wPIX0vrSL51
         Z1KEgWnlHZq9K8JRu9ePaeW1ElxrSq79eFfCUxlA4IzIzql3311xgKTn99MDG4hiWVrR
         VkrJs0qR3rRXMmT6WKAr3UV/IWGFZD1Uygrf6irEjPEU/Evo207eGmXlTzA5z7SCrWYT
         5x0Rq86b96H5wt52ISsWzt5XhSS4GGGBBJZ6BsDjwt8PMZ2zSEd3+4q9kpB+Js6wzNdV
         KTHu+A6LW2gAgxUO8Tct6M94dNrRyH4s0eofqOKiEby+9kjZDzzbnEkXvQhLCrC2AzYq
         gahA==
X-Forwarded-Encrypted: i=1; AFNElJ88fXfAxrU9BCIxRy0tWciZCl77RjU/tRbfR9UkPXUfdUylHR6gq8jmgsoju0/uZq74cx1/X3gXJbAE@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8dyGbMcaEb+H2YZ4jJXL1tqKKjIbKmBbKBIs8jcgdleQZZ6w+
	/dTtmCDLNjSKvruTEfgSSW3eu+uEtpyFqNLZel7efSaDRCOXtIhUaMcrR4GwGISZ9wmT3DgxFEk
	WchI0hYqqqK+NMmr2SeI22g==
X-Received: from plmx11.prod.google.com ([2002:a17:902:fe8b:b0:2ae:3bca:37a5])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:4b0d:b0:2b0:6d33:e7c0 with SMTP id d9443c01a7336-2ba535e2df5mr4309355ad.1.1777934568708;
 Mon, 04 May 2026 15:42:48 -0700 (PDT)
Date: Mon,  4 May 2026 22:42:11 +0000
In-Reply-To: <20260504224213.1049426-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260504224213.1049426-1-jthoughton@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260504224213.1049426-5-jthoughton@google.com>
Subject: [PATCH 4/5] KVM: Hold MMU lock exclusively when calling kvm_arch_flush_shadow_all()
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Sean Christopherson <seanjc@google.com>, Gavin Shan <gshan@redhat.com>, 
	Shaoqin Huang <shahuang@redhat.com>, Ricardo Koller <ricarkol@google.com>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, James Hogan <jhogan@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 26E924C48C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-14441-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jthoughton@google.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

All architectures that non-trivially implement this function grab the
KVM MMU lock exclusively to prevent things like double-freeing of page
table entries and caches. Do so generically to somewhat simplify the
architecture-specific logic.

Without this change, it is possible for kvm_arch_flush_shadow_all() to
be called on the same `kvm` at the same time: if the `kvm`'s mm is
destroyed (exit_mm()) at the same time to the final reference to the
`kvm` is dropped.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/arm64/kvm/nested.c  | 2 +-
 arch/loongarch/kvm/mmu.c | 4 +++-
 arch/mips/kvm/mips.c     | 2 +-
 arch/riscv/kvm/mmu.c     | 4 ++--
 arch/riscv/kvm/vm.c      | 2 ++
 arch/x86/kvm/mmu/mmu.c   | 4 +---
 virt/kvm/kvm_main.c      | 3 +++
 7 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 977598bff5e6..ba2e6c98bd45 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1190,7 +1190,7 @@ void kvm_arch_flush_shadow_all(struct kvm *kvm)
 {
 	int i;
 
-	guard(write_lock)(&kvm->mmu_lock);
+	lockdep_assert_held_write(&kvm->mmu_lock);
 
 	for (i = 0; i < kvm->arch.nested_mmus_size; i++) {
 		struct kvm_s2_mmu *mmu = &kvm->arch.nested_mmus[i];
diff --git a/arch/loongarch/kvm/mmu.c b/arch/loongarch/kvm/mmu.c
index 5dbce9b18e1c..120001da26e4 100644
--- a/arch/loongarch/kvm/mmu.c
+++ b/arch/loongarch/kvm/mmu.c
@@ -486,7 +486,9 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
 
 void kvm_arch_flush_shadow_all(struct kvm *kvm)
 {
-	kvm_flush_range(kvm, 0, kvm->arch.gpa_size >> PAGE_SHIFT, 1);
+	lockdep_assert_held(&kvm->mmu_lock);
+
+	kvm_flush_range(kvm, 0, kvm->arch.gpa_size >> PAGE_SHIFT, 0);
 }
 
 void kvm_arch_flush_shadow_memslot(struct kvm *kvm, struct kvm_memory_slot *slot)
diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index 463b6c4aa62c..4ad9e21a3321 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -180,7 +180,7 @@ long kvm_arch_dev_ioctl(struct file *filp, unsigned int ioctl,
 
 void kvm_arch_flush_shadow_all(struct kvm *kvm)
 {
-	guard(spinlock)(&kvm->mmu_lock);
+	lockdep_assert_held(&kvm->mmu_lock);
 
 	/* Flush whole GPA */
 	kvm_mips_flush_gpa_pt(kvm, 0, ~0);
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 2d3def024270..c1b9333f17eb 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -558,7 +558,8 @@ void kvm_riscv_mmu_free_pgd(struct kvm *kvm)
 	struct kvm_gstage gstage;
 	void *pgd = NULL;
 
-	spin_lock(&kvm->mmu_lock);
+	lockdep_assert_held(&kvm->mmu_lock);
+
 	if (kvm->arch.pgd) {
 		kvm_riscv_gstage_init(&gstage, kvm);
 		kvm_riscv_gstage_unmap_range(&gstage, 0UL,
@@ -568,7 +569,6 @@ void kvm_riscv_mmu_free_pgd(struct kvm *kvm)
 		kvm->arch.pgd_phys = 0;
 		kvm->arch.pgd_levels = 0;
 	}
-	spin_unlock(&kvm->mmu_lock);
 
 	if (pgd)
 		free_pages((unsigned long)pgd, get_order(kvm_riscv_gstage_pgd_size));
diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
index a9f083feeb76..f704a64bfc48 100644
--- a/arch/riscv/kvm/vm.c
+++ b/arch/riscv/kvm/vm.c
@@ -38,7 +38,9 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 
 	r = kvm_riscv_gstage_vmid_init(kvm);
 	if (r) {
+		spin_lock(&kvm->mmu_lock);
 		kvm_riscv_mmu_free_pgd(kvm);
+		spin_unlock(&kvm->mmu_lock);
 		return r;
 	}
 
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 892246204435..6e6f94046b3f 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -7352,7 +7352,7 @@ static void kvm_mmu_zap_all(struct kvm *kvm)
 	LIST_HEAD(invalid_list);
 	int ign;
 
-	write_lock(&kvm->mmu_lock);
+	lockdep_assert_held_write(&kvm->mmu_lock);
 restart:
 	list_for_each_entry_safe(sp, node, &kvm->arch.active_mmu_pages, link) {
 		if (WARN_ON_ONCE(sp->role.invalid))
@@ -7367,8 +7367,6 @@ static void kvm_mmu_zap_all(struct kvm *kvm)
 
 	if (tdp_mmu_enabled)
 		kvm_tdp_mmu_zap_all(kvm);
-
-	write_unlock(&kvm->mmu_lock);
 }
 
 void kvm_arch_flush_shadow_all(struct kvm *kvm)
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 89489996fbc1..f5affd3bfda8 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -340,7 +340,10 @@ void kvm_flush_remote_tlbs_memslot(struct kvm *kvm,
 
 static void kvm_flush_shadow_all(struct kvm *kvm)
 {
+	KVM_MMU_LOCK(kvm);
 	kvm_arch_flush_shadow_all(kvm);
+	KVM_MMU_UNLOCK(kvm);
+
 	kvm_arch_guest_memory_reclaimed(kvm);
 }
 
-- 
2.54.0.545.g6539524ca2-goog


