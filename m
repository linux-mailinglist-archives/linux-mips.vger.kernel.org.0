Return-Path: <linux-mips+bounces-5949-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5769990FB
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 20:43:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C9C91F25129
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 18:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4B2020823E;
	Thu, 10 Oct 2024 18:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cMRKCJL2"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F29208228
	for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 18:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584814; cv=none; b=BYr/LDwoPOPtCVXTdCpudjXZAKBS8Pk13WKtkgZnLzXZIyYyg4QFAtQO2uyDIw+CJAsD4A2T/MXQxQPsb7qgxL63UCVwacQTT34W5IFdbKH/BVhpbVe3GxiW5lEKWl4Wop6BsObH8RHRdWmOCjGgKCWcTUzS0F11Q2RjdkxZ8+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584814; c=relaxed/simple;
	bh=XrFS4rtFa/FgrThsq3EMvRUnjE+/w+4Wbq1cV5vxoHg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pssAHLKH5Gvd/aex1xoaB9ao0Y4QTy3KX7Gzl+3Xi2QeH3lPuLzSSVa7wQF1HhD8l8wNq0oAHIhWo/wdpWPloJ9cgjx3XN85ZKe/Rour6g7wX9dQC5nseFJqKQOrsv8FkXuvJKhXe00cXkDCgD02w+BQpD1QecYz4bS60NLXdKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cMRKCJL2; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2e2c3338a9dso1524943a91.0
        for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 11:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584812; x=1729189612; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L6S7ecEpHeP2pNYK74CcyfNjVxKIOVPI1u0giMU3AdU=;
        b=cMRKCJL2KTT4vd8DOQ2od82kSNUiso8aIqKq07Yvp3S6byddo0DPcg2b8Jr9ogLGAo
         BNTKkHdxlFw0l/CcZ5axwvEmJkR/6UB71Pb7jQUOYe4rhWAIBZzwBX4HH87G3XGLEtqO
         sSChKOxVtrZ3EpUVsVzWJqNdqZbLXzbA7bJvOxpoDZx9KYx9Xz26RYucJeLlSpK0us3L
         e20ClV/b8sQtSPdFHLtStwrnxtJUeQ5hHPWY0AHVXja2oHzcD5JA+7iFwMVByjbOQ2jD
         oC5gACr1JoJhr0hdDFfDr1ptb4PWqWzd1vvHuvzjVquTsBV+1uKxCjicP33d2mq+QoPY
         sXfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584812; x=1729189612;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L6S7ecEpHeP2pNYK74CcyfNjVxKIOVPI1u0giMU3AdU=;
        b=vXKPRcbNYC8nrQKbEIjI+nK0Nv+DK082ycXirhuG7y6Fk/+lXvLM4OGJ6RW/ZI9udV
         URnow9Yx9SFmou1zENyIAbqSNxTSyhmPatviD1r4H+cDZvhSz3QjzQp2WlBJgQ/6P6XB
         +W/vXziXvAdgtXHQ4lbmmvpvLbM+vDyll7eXrvxFFxVYR04n2S7y7Ojvm/CfD0rYyrxl
         SUYWxpvHixlXI64HjJu9KdMxQOj1/g1KrKuikj73qn6k8nU1AduBUBKWgW/1QqwqFNmt
         dmbac/xlEEhhBbKdejgkprtIbOHNMPsJ3xrUFxGub86rQKQkjCw2arKLghCTyKNJ1RQm
         7r5w==
X-Forwarded-Encrypted: i=1; AJvYcCUAqky0UmuovZS7kXrNy7RJ8YLxT4oySfyUw5+3dCg8ARSQxhj/2J8X7oXd/mFXDjUCJQTDJaZrJHT1@vger.kernel.org
X-Gm-Message-State: AOJu0YyGYeN9+9fqAk5+vvi3sDIwoYZGcc0frN4X/WldNhaXMo+J9406
	s2DkfJIkD6zKn2H7CHWATFcxWE3EVFEp0plBN18/TRkCAPDFDgfAKU7R3ucjLeZSGyhQsrm7xYt
	w/Q==
X-Google-Smtp-Source: AGHT+IFNqFi+zU38KeaNCnXXdZA3xW66mqPsBP1LkkibZO//JxtU2HWKMaWXgt9tHH1pSDOFY+ZWY6Gk4GE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:90b:4f4b:b0:2d8:bf47:947c with SMTP id
 98e67ed59e1d1-2e2f0c456f8mr35a91.3.1728584812033; Thu, 10 Oct 2024 11:26:52
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:58 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-57-seanjc@google.com>
Subject: [PATCH v13 56/85] KVM: arm64: Use __kvm_faultin_pfn() to handle
 memory aborts
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?UTF-8?q?Alex=20Benn=C3=A9e?=" <alex.bennee@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, 
	Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Convert arm64 to use __kvm_faultin_pfn()+kvm_release_faultin_page().
Three down, six to go.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/mmu.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index ecc6c2b56c43..4054356c9712 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1439,6 +1439,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys=
_addr_t fault_ipa,
 	long vma_pagesize, fault_granule;
 	enum kvm_pgtable_prot prot =3D KVM_PGTABLE_PROT_R;
 	struct kvm_pgtable *pgt;
+	struct page *page;
=20
 	if (fault_is_perm)
 		fault_granule =3D kvm_vcpu_trap_get_perm_fault_granule(vcpu);
@@ -1560,7 +1561,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys=
_addr_t fault_ipa,
=20
 	/*
 	 * Read mmu_invalidate_seq so that KVM can detect if the results of
-	 * vma_lookup() or __gfn_to_pfn_memslot() become stale prior to
+	 * vma_lookup() or __kvm_faultin_pfn() become stale prior to
 	 * acquiring kvm->mmu_lock.
 	 *
 	 * Rely on mmap_read_unlock() for an implicit smp_rmb(), which pairs
@@ -1569,8 +1570,8 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys=
_addr_t fault_ipa,
 	mmu_seq =3D vcpu->kvm->mmu_invalidate_seq;
 	mmap_read_unlock(current->mm);
=20
-	pfn =3D __gfn_to_pfn_memslot(memslot, gfn, false, NULL,
-				   write_fault, &writable);
+	pfn =3D __kvm_faultin_pfn(memslot, gfn, write_fault ? FOLL_WRITE : 0,
+				&writable, &page);
 	if (pfn =3D=3D KVM_PFN_ERR_HWPOISON) {
 		kvm_send_hwpoison_signal(hva, vma_shift);
 		return 0;
@@ -1583,7 +1584,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys=
_addr_t fault_ipa,
 		 * If the page was identified as device early by looking at
 		 * the VMA flags, vma_pagesize is already representing the
 		 * largest quantity we can map.  If instead it was mapped
-		 * via gfn_to_pfn_prot(), vma_pagesize is set to PAGE_SIZE
+		 * via __kvm_faultin_pfn(), vma_pagesize is set to PAGE_SIZE
 		 * and must not be upgraded.
 		 *
 		 * In both cases, we don't let transparent_hugepage_adjust()
@@ -1692,11 +1693,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phy=
s_addr_t fault_ipa,
 	}
=20
 out_unlock:
-	if (writable && !ret)
-		kvm_release_pfn_dirty(pfn);
-	else
-		kvm_release_pfn_clean(pfn);
-
+	kvm_release_faultin_page(kvm, page, !!ret, writable);
 	read_unlock(&kvm->mmu_lock);
=20
 	/* Mark the page dirty only if the fault is handled successfully */
--=20
2.47.0.rc1.288.g06298d1525-goog


