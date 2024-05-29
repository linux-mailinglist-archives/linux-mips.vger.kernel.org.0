Return-Path: <linux-mips+bounces-3387-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C068D3DFD
	for <lists+linux-mips@lfdr.de>; Wed, 29 May 2024 20:07:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0BABEB22A56
	for <lists+linux-mips@lfdr.de>; Wed, 29 May 2024 18:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58DED1C8FDF;
	Wed, 29 May 2024 18:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fv1rpczK"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0B51C2335
	for <linux-mips@vger.kernel.org>; Wed, 29 May 2024 18:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717005928; cv=none; b=eY/GLJJSyaCeFEYHWQhmOEpN0mIcsgDeL74V7L5FPuYQFXYTGZrteKyfjwZ2v7gBvA/StxqqVTJjSwR4IR+Hk4wxAmjNtOnhttwDLGRRzBMVMdU4BtKrU+S2peaKDQUC0Cj00qdORmDW//gPkSA/HF1LgmxHsGKOQ+49PGyXLP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717005928; c=relaxed/simple;
	bh=LSBrwS6oby84HQacrqjfwftAjZHXaXKkGHYxsFQ9F2c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EgCmUJP86kDEcV9Sil7BuyQw+MeGz08fTw7cBZZfTAbDHNFDMZLnaH1CHikwPURcVaEcBmZUW9+IyPFn064EqYdD4i6uEiAHvh0slswGlA0SuhswjSQnMm7SpTiCRXMGi2Y5YiHoY+2O8kTjOx9c9RuYKQrwHkhpQtjCpeKYvQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fv1rpczK; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-627dd6a56caso35718077b3.3
        for <linux-mips@vger.kernel.org>; Wed, 29 May 2024 11:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717005923; x=1717610723; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=K/D/1FA4Uw1YrzG6+cN1+7larQcduYYAcSD+7tGLFpU=;
        b=fv1rpczKcA5ByZYD6R4NmNMHfp/hM+ObdEYFCkFS0SOaHquNKIIX/G/yJs938lKOrj
         2tJM/u2M4txUnAC/JoMCE/p0co7svHeBiCuFljJGmx+l6RCK0jIqSo3gsj6iystns/lj
         iEElzBm6r7KHFXZ8UYD6odjgI4WPgtp7NeoSUrZX0TBfMaRKo2zYHhkLGDYLTPm1Dvux
         Si5Ckc2bNemwbCLUI7YcK0q3rWsUN+tiOapE4czgQppgqeUI8D9ofEwCzaWliTFEd+Hb
         eyzKGTvP7Lzn4tIUkI39cIj+SFCZlC+EydZdr1IjcDBTlCpscCPF2r3oY/QSa6Th/k+c
         hUqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717005923; x=1717610723;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K/D/1FA4Uw1YrzG6+cN1+7larQcduYYAcSD+7tGLFpU=;
        b=O4JvMA7r93wzIObUp9kLCBGD0Atr9FFOjM6kXVDRSyWcmPREs+Rxi94MVQESSma0Cv
         y2FmKh6lS8otF811IRAjfSBmseycrV0nvCLHCUfWCojyoC3mnrGK3zVcO0KBudNOaZ/7
         9sj21PwwJIq4lgo3LGBegtRiLPqWNaG/dUCKpCTpabpZfIqR4aB6SPSvNDF49yjycQNp
         ZJMY24AUoXYFQ3uH2MUVxwYia/wB2dMihrcGBiGUBWEygEMKNqWGOY8xeEKV4L+ZAQPZ
         YCUTrqHteQKTTdex+s1GMkjElsPfmQOE9c87T9jhm1wv6M5rhDi/V0uwuwSCfFaAekmo
         UELQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFQIp3jUe5uYRaePPE50tssMAnI/lXewwHTsrsKsD+7REC5x7cu6KKvdbxOWL0fVvsPtkSRiSMY+TDwbHnlf5QrrnIFPKRYzBWCA==
X-Gm-Message-State: AOJu0YxAuSOo3ZwJCxTQXZSVH8Eqg8+9QEbf5fDjnFh+svKAb27gH2Z3
	voJBuR09QwdlBqpj9/D96pOOnvUfeCr0KRL1v9Zp6UIlnCwNXt1J8ujiS14hpUKUIq2934hjcHt
	PN52dnrJr3+cyuEGpJg==
X-Google-Smtp-Source: AGHT+IFSnjz7OFMOWeVI0MI1apHPovJ16H+bOSMdUdDO7KbUX1eLZ6QqkPj6sVplMDT0O6FTB3I8hMUTstLZ6+/c
X-Received: from jthoughton.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:2a4f])
 (user=jthoughton job=sendgmr) by 2002:a05:690c:6010:b0:61a:e7f7:a4cc with
 SMTP id 00721157ae682-62a08dd7631mr39296497b3.4.1717005922981; Wed, 29 May
 2024 11:05:22 -0700 (PDT)
Date: Wed, 29 May 2024 18:05:09 +0000
In-Reply-To: <20240529180510.2295118-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240529180510.2295118-1-jthoughton@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240529180510.2295118-7-jthoughton@google.com>
Subject: [PATCH v4 6/7] KVM: arm64: Relax locking for kvm_test_age_gfn and kvm_age_gfn
From: James Houghton <jthoughton@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Ankit Agrawal <ankita@nvidia.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Bibo Mao <maobibo@loongson.cn>, 
	Catalin Marinas <catalin.marinas@arm.com>, David Matlack <dmatlack@google.com>, 
	David Rientjes <rientjes@google.com>, Huacai Chen <chenhuacai@kernel.org>, 
	James Houghton <jthoughton@google.com>, James Morse <james.morse@arm.com>, 
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Raghavendra Rao Ananta <rananta@google.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Sean Christopherson <seanjc@google.com>, Shaoqin Huang <shahuang@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Will Deacon <will@kernel.org>, Yu Zhao <yuzhao@google.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Replace the MMU write locks for read locks.

Grabbing the read lock instead of the write lock is safe because the
only requirement we have is that the stage-2 page tables do not get
deallocated while we are walking them. The stage2_age_walker() callback
is safe to race with itself; update the comment to reflect the
synchronization change.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/arm64/kvm/hyp/pgtable.c | 9 ++++-----
 arch/arm64/kvm/mmu.c         | 8 ++++----
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 9e2bbee77491..eabb07c66a07 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -1319,10 +1319,8 @@ static int stage2_age_walker(const struct kvm_pgtable_visit_ctx *ctx,
 	data->young = true;
 
 	/*
-	 * stage2_age_walker() is always called while holding the MMU lock for
-	 * write, so this will always succeed. Nonetheless, this deliberately
-	 * follows the race detection pattern of the other stage-2 walkers in
-	 * case the locking mechanics of the MMU notifiers is ever changed.
+	 * This walk may not be exclusive; the PTE is permitted to change
+	 * from under us.
 	 */
 	if (data->mkold && !stage2_try_set_pte(ctx, new))
 		return -EAGAIN;
@@ -1345,7 +1343,8 @@ bool kvm_pgtable_stage2_test_clear_young(struct kvm_pgtable *pgt, u64 addr,
 	struct kvm_pgtable_walker walker = {
 		.cb		= stage2_age_walker,
 		.arg		= &data,
-		.flags		= KVM_PGTABLE_WALK_LEAF,
+		.flags		= KVM_PGTABLE_WALK_LEAF |
+				  KVM_PGTABLE_WALK_SHARED,
 	};
 
 	WARN_ON(kvm_pgtable_walk(pgt, addr, size, &walker));
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 8337009dde77..40e7427462a7 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1775,7 +1775,7 @@ bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 	u64 size = (range->end - range->start) << PAGE_SHIFT;
 	bool young = false;
 
-	write_lock(&kvm->mmu_lock);
+	read_lock(&kvm->mmu_lock);
 
 	if (!kvm->arch.mmu.pgt)
 		goto out;
@@ -1785,7 +1785,7 @@ bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 						    size, true);
 
 out:
-	write_unlock(&kvm->mmu_lock);
+	read_unlock(&kvm->mmu_lock);
 	return young;
 }
 
@@ -1794,7 +1794,7 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 	u64 size = (range->end - range->start) << PAGE_SHIFT;
 	bool young = false;
 
-	write_lock(&kvm->mmu_lock);
+	read_lock(&kvm->mmu_lock);
 
 	if (!kvm->arch.mmu.pgt)
 		goto out;
@@ -1804,7 +1804,7 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 						    size, false);
 
 out:
-	write_unlock(&kvm->mmu_lock);
+	read_unlock(&kvm->mmu_lock);
 	return young;
 }
 
-- 
2.45.1.288.g0e0cd299f1-goog


