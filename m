Return-Path: <linux-mips+bounces-4542-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5506E93DC37
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 02:17:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F3BF2843C8
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 00:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A3CE18FC74;
	Fri, 26 Jul 2024 23:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="n1j+fR25"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC2818F2FC
	for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 23:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722038111; cv=none; b=PlI/69PKDOLPYJHPvGWf5ABrpqeza2aMbSVyo0+G8w9ryd8ZEgnZLRgz8/Fdze7FeOhJQiqW+edLbjfwAyh+nE6BK/2OTrHgZl7jm+tMoMlCWfXhdJYhdE9V0JMG1B+3IRqnl+JljBwmuIdnIm1vyuEnLwHgdim/wv37afsadek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722038111; c=relaxed/simple;
	bh=lhHYI4ZmXcFxea+okVo57sctSAMSkRMQQrnLBVGt6rM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QHuyRmPhwoh3EfiqkgHwFL+IG+sJdKCVvQg0lUFpggFRGlv7pWNndhIMMOQojP2Ao6NQBBZa3kNcvpnmvs4MNtLG/ifyFMvEBY2OjOo5ddv1tqIk9NKMxVMQd/9aYMM+xEuLjPLCfRt0wX/uHAeA+zM/CJP8dofI2stu1sCEYu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=n1j+fR25; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-721d20a0807so1376569a12.1
        for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 16:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038109; x=1722642909; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=M9eYn37tam32k4Zpbs9VqSvLY6wlhZ916YFlgyF6peA=;
        b=n1j+fR25oQMnIJsM0eQA2jzCkEw5NgzuEvaJ3oqoU1myvyusJyNmdEzvwT3Zlcd7in
         8IL7xvWIOWWOx63r/5mJ1xbfbH2SD+PK9ARnZoadwJGXJ30AnbNwdWJwbK7Ut8WpSFVi
         SnGGLPyjj+WXY7qrsjQoO+vrq7G3TQHoORsYu25VCAnOtOKPimkrPVUHQ3DoNcLmbwOq
         nP5Tv/cZOadGX1M3O8Z9gNQbGmi1kw/wzvbQ3qqY7AuyOrLBe9nbGRZXUM65RUmIy9aS
         Fz8hItR2GtaM4ggnPliwr7Z9P5ARjyXQNuj6mcD+hGlkDzoLNo+YDAcwDFZbpsUpFXtc
         X7+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038109; x=1722642909;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M9eYn37tam32k4Zpbs9VqSvLY6wlhZ916YFlgyF6peA=;
        b=oPgKFWgDkNsKTpqyq5ZbXITBNFy6Nn4OCSUSQTP5mQeWk0pz6LVdg4h4E3yX/ywziI
         Bop785vdQzXZRfxFC18KcQYWjP9fGwlHngIXQm2pM/cPljSAaUHvmHa0PLYNIEgcTAof
         3ddU3iL6Dj4OrSURS6MLF/uyvgbx7/q1BVTNesQkjo/FptnRQvhR0zPvxD4twWdUrCAI
         FIcBtCJ1qXiNQtPcgsPdDOnsQHbm7Rj/Opf+OWwIUX2y5Uj71aae5IzzoDvn+BF9JgWE
         LEjbpEKVWfyRHMexHwViDAGXcoVL2PB3GAd4Een9CT7oIBrD02mYKGgUVeE5aIlbeJrf
         WX3g==
X-Forwarded-Encrypted: i=1; AJvYcCWyuP/p4+t3bAbGLISsTkOOQjRYT+Ca6XvgtDVTrbN5zb49MimK6/sQswk1ZTuQxdRG9AjyQG93bsorEQw9QROrQnedzxPTSAvGuw==
X-Gm-Message-State: AOJu0Yx/eSWoRYtr8Z4CwGiPC8wzoMyG42wKEeM32LuWNda7pwNLQEs6
	1PDIB6Lu9GP2I1ikaooeB+4rUSxSB85uZfhzHyo+Ug29oXuHz6MmulrwcrGdvNnNMiFQ/fhzlrE
	BVg==
X-Google-Smtp-Source: AGHT+IG8TH3qPrjAadwsmfbGVL51l5vDfwJrWL4CCM6knLIepOGyFeiwzAiBROJulbOiIHONd5UuXBO9hTI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a02:526:b0:6e3:e0bc:a332 with SMTP id
 41be03b00d2f7-7ac8dbc497emr2439a12.2.1722038105187; Fri, 26 Jul 2024 16:55:05
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:52:20 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-72-seanjc@google.com>
Subject: [PATCH v12 71/84] KVM: MIPS: Use kvm_faultin_pfn() to map pfns into
 the guest
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
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Convert MIPS to kvm_faultin_pfn()+kvm_release_faultin_page(), which
are new APIs to consolidate arch code and provide consistent behavior
across all KVM architectures.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/mips/kvm/mmu.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/mips/kvm/mmu.c b/arch/mips/kvm/mmu.c
index 69463ab24d97..d2c3b6b41f18 100644
--- a/arch/mips/kvm/mmu.c
+++ b/arch/mips/kvm/mmu.c
@@ -557,6 +557,7 @@ static int kvm_mips_map_page(struct kvm_vcpu *vcpu, unsigned long gpa,
 	bool writeable;
 	unsigned long prot_bits;
 	unsigned long mmu_seq;
+	struct page *page;
 
 	/* Try the fast path to handle old / clean pages */
 	srcu_idx = srcu_read_lock(&kvm->srcu);
@@ -578,7 +579,7 @@ static int kvm_mips_map_page(struct kvm_vcpu *vcpu, unsigned long gpa,
 	mmu_seq = kvm->mmu_invalidate_seq;
 	/*
 	 * Ensure the read of mmu_invalidate_seq isn't reordered with PTE reads
-	 * in gfn_to_pfn_prot() (which calls get_user_pages()), so that we don't
+	 * in kvm_faultin_pfn() (which calls get_user_pages()), so that we don't
 	 * risk the page we get a reference to getting unmapped before we have a
 	 * chance to grab the mmu_lock without mmu_invalidate_retry() noticing.
 	 *
@@ -590,7 +591,7 @@ static int kvm_mips_map_page(struct kvm_vcpu *vcpu, unsigned long gpa,
 	smp_rmb();
 
 	/* Slow path - ask KVM core whether we can access this GPA */
-	pfn = gfn_to_pfn_prot(kvm, gfn, write_fault, &writeable);
+	pfn = kvm_faultin_pfn(vcpu, gfn, write_fault, &writeable, &page);
 	if (is_error_noslot_pfn(pfn)) {
 		err = -EFAULT;
 		goto out;
@@ -602,10 +603,10 @@ static int kvm_mips_map_page(struct kvm_vcpu *vcpu, unsigned long gpa,
 		/*
 		 * This can happen when mappings are changed asynchronously, but
 		 * also synchronously if a COW is triggered by
-		 * gfn_to_pfn_prot().
+		 * kvm_faultin_pfn().
 		 */
 		spin_unlock(&kvm->mmu_lock);
-		kvm_release_pfn_clean(pfn);
+		kvm_release_page_unused(page);
 		goto retry;
 	}
 
@@ -632,10 +633,7 @@ static int kvm_mips_map_page(struct kvm_vcpu *vcpu, unsigned long gpa,
 	if (out_buddy)
 		*out_buddy = *ptep_buddy(ptep);
 
-	if (writeable)
-		kvm_set_pfn_dirty(pfn);
-	kvm_release_pfn_clean(pfn);
-
+	kvm_release_faultin_page(kvm, page, false, writeable);
 	spin_unlock(&kvm->mmu_lock);
 out:
 	srcu_read_unlock(&kvm->srcu, srcu_idx);
-- 
2.46.0.rc1.232.g9752f9e123-goog


