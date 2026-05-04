Return-Path: <linux-mips+bounces-14437-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HYRNdog+Wmz5wIAu9opvQ
	(envelope-from <linux-mips+bounces-14437-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 05 May 2026 00:42:34 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 532F84C47E8
	for <lists+linux-mips@lfdr.de>; Tue, 05 May 2026 00:42:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CED90301C91E
	for <lists+linux-mips@lfdr.de>; Mon,  4 May 2026 22:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FA73387566;
	Mon,  4 May 2026 22:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nzQDStlP"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BA6386576
	for <linux-mips@vger.kernel.org>; Mon,  4 May 2026 22:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777934552; cv=none; b=EMEjpBc2e7jCOotHjxYmIcaJVDVvnusTG/21cLYhhHsK1vk19DQJIZOXfqlgtYsbW3oS7hV23oR0tLodtiIim4YugBuUnWe825w/vSagvCWwqaRpN3dA+UceQSKBBGS7oJIT3osj9DPB0usvORiFhuiM359PIwDwQY8d4OrjZF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777934552; c=relaxed/simple;
	bh=a6LAKe8ovUnasAZFDeUefPCWvqT60LXkBEdqdXAd5Mc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=cPbOGAemU2Ns/T37EGl33qH8JMo9tGZm6zahNEmIjdNI6pBDQXfU2tCf7cXHB6NZzByVIsIBvDidyYbEjze1MIH6G6LqeAJ/J8yUr7tZwpFbyeEayKnVduL+/vZeJ/ukjD7zspRRgX00no4rOWpKDaVnBTIkxv4YX6usVO+mLLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nzQDStlP; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-835417ba8c8so810590b3a.0
        for <linux-mips@vger.kernel.org>; Mon, 04 May 2026 15:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777934550; x=1778539350; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GreUyu/PwGDkwAAEFHxYx5rSO95cp1lrcmL4UWkbrcg=;
        b=nzQDStlP3s2YgPsAU0PwuOJHO3wIqYQEr9ywUwSHW7gRTePdn96VOCK1R3KR+g85cp
         atgWZFy1IMB03jB9l5rwQtzgXv2OTYhWVAyxyH7LCEGZkp0LUuMRsCgkC2e+wUXunYSO
         rI/LfbfJ28I3s1S6zHUfpvj0GdRpzNXSU2YARbp+qjIX2P15tJS6RINSxeVy6RRfWkI7
         1iLSEg6yBxOpVOtZv3Su/G1Ibx0LAvcydCnZpDut1C8QxzVplJPgFXTaJ0aQROIepx3/
         YOuOCRhKLNfZrculPzivHgHT2DQWV1vHp7zLcqlAaxOeMEx1Cxp8njWbZDN71gxWvf9o
         5bSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777934550; x=1778539350;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GreUyu/PwGDkwAAEFHxYx5rSO95cp1lrcmL4UWkbrcg=;
        b=ePNh0pg6effnuMU2PT1D02akV51wtDAhfyeVYWctd6ODTMc8SAtM/mKtTuBNDTg6Xn
         w3Nw9GH3Y5UsIOMuFdKEWEtVy2BwF743DRl498HBBD/TMsnKLYZEYv+j+2dSYz8vEgSO
         5YFCPzCV4AHB3VF3WgpKgfCAmFtOEgxD3pTeOBMbcZpCIb4kOq2zkShQhz5wGuZxqWhS
         ZJvfbkSFJSEOYWSOAlSr5p0jsN0D+qxuQw4itKyMBuQYArRhte2hYFF6tqXyC1SY6AAg
         k8oiSXrKu7dgbxdiusWWMMezLndT7gjK8YP4NB/F/7QGd7/ubRbgavtk3R8Jgka7Qg79
         T3/g==
X-Forwarded-Encrypted: i=1; AFNElJ9xVHaSBolptBV+cpn57Dc9yfHQGn2CpN+5wyAgq86MHbxPDPaxzRPujPG61XRGG30/unnfindtVovo@vger.kernel.org
X-Gm-Message-State: AOJu0YxhlI8W+PP2j1ZdgQ8gBtQ+SfAK+PPcRTwi5zLfKwBPr3W/ziiS
	hAGoKtx4GJEPCqSYuk3mKkCJJyfb2aZovHEuaOMHECdkNmeShAKX8TFMD9Kgrjk9I/x6g/JnWJ4
	lWyaK+wBZjmf2/RIAXXvv8A==
X-Received: from pfbhm13.prod.google.com ([2002:a05:6a00:670d:b0:82f:7bc:70a9])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:4c96:b0:82c:ded1:261f with SMTP id d2e1a72fcca58-8352d22c289mr10958941b3a.27.1777934549232;
 Mon, 04 May 2026 15:42:29 -0700 (PDT)
Date: Mon,  4 May 2026 22:42:07 +0000
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260504224213.1049426-1-jthoughton@google.com>
Subject: [PATCH 0/5] KVM: Fix race conditions in kvm_arch_flush_shadow_all()
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
X-Rspamd-Queue-Id: 532F84C47E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
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
	TAGGED_FROM(0.00)[bounces-14437-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jthoughton@google.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Hi Paolo,

syzbot running on Google production kernels ran into a double-free on
KVM/arm64 in kvm_mmu_free_memory_cache(). It turns out that loongarch
and mips also have a similar problem.

kvm_arch_flush_shadow_all() can be called on the same memslot
concurrently, leading to double-freeing in arm64 and mips. loongarch
is also affected: it can at least underflow some counters; I'm not sure
what else can break.

To get into this scenario, we need to have a process (P1) share an open
VM with another process (P2). If P1 closes its VM to leave P2 holding
the last reference, then there is a race between P1 exiting (exit_mm)
and P2 dropping its last reference to the VM.

exit_mm() and kvm_vm_release() both call kvm_mmu_notifier_release() on
the same KVM, and the only locks held are the KVM srcu lock and the MMU
notifier srcu lock.

Please see the arm64 patch for another description of the same race with
more context on the ensuing double-free in KVM/arm64.

The first three patches fix each broken architecture; each of those
patches have stable CCed with what I think are the appropriate Fixes.

After patching the locking for the broken architectures, it seems better
simply to have KVM take the MMU lock exclusively before calling
kvm_arch_flush_shadow_all() so that architectures don't need to worry
about it. Feel free to drop that patch, the fourth one, if you disagree
with it.

The fifth patch provides a repro (with a crude kernel patch to reliably
demonstrate the double-free). Please do not merge this.

The arm64 patch has been tested with the repro. The loongarch and mips
patches have been compile-tested only.

kvm_arch_guest_memory_reclaimed() is only implemented by one
architecture: x86. Its implementation does not need the KVM MMU lock to
be held.

This series is based on 7.1-rc2.

James Houghton (5):
  KVM: arm64: Grab KVM MMU write lock in kvm_arch_flush_shadow_all()
  KVM: loongarch: Grab MMU lock in kvm_arch_flush_shadow_all()
  KVM: mips: Grab MMU lock in kvm_arch_flush_shadow_all()
  KVM: Hold MMU lock exclusively when calling
    kvm_arch_flush_shadow_all()
  DO NOT MERGE: KVM: selftests: Reproducer for arm64 double-free

 arch/arm64/include/asm/kvm_host.h             |   1 +
 arch/arm64/include/asm/kvm_mmu.h              |   1 +
 arch/arm64/kvm/mmu.c                          |  39 +++++-
 arch/arm64/kvm/nested.c                       |   4 +-
 arch/loongarch/kvm/mmu.c                      |   2 +
 arch/mips/kvm/mips.c                          |   2 +
 arch/mips/kvm/mmu.c                           |   2 +
 arch/riscv/kvm/mmu.c                          |   4 +-
 arch/riscv/kvm/vm.c                           |   2 +
 arch/x86/kvm/mmu/mmu.c                        |   4 +-
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../testing/selftests/kvm/transfer_fd_test.c  | 129 ++++++++++++++++++
 virt/kvm/kvm_main.c                           |   3 +
 13 files changed, 184 insertions(+), 10 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/transfer_fd_test.c

base-commit: 6d35786de28116ecf78797a62b84e6bf3c45aa5a
-- 
2.54.0.545.g6539524ca2-goog


