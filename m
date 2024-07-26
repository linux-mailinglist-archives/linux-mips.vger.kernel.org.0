Return-Path: <linux-mips+bounces-4539-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D6593DC2C
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 02:16:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C90031C217D8
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 00:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7459B18EFD7;
	Fri, 26 Jul 2024 23:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FJdtrm+x"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57E01591E0
	for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 23:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722038104; cv=none; b=bHFcQO1jnyhyQJXLnsSdYDDJqmxZpJxbKnvW5PQ6lxcfmMLQCLVymkXZ6K6yrWjQfLQdMBmhYMt5zE1bVxFTqLWKhDnbAPChm0/SoAUZ/ofHDMd+kUMivxFIizz4FE1UnINs6tZftp8czdtLrAKXfqA2AWHJLEVuwZlWs103A5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722038104; c=relaxed/simple;
	bh=GCYK8yipXNmlvS7D1ztDicsVoHNyQK/UowKPkS/Qbso=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=n8aynBFm3v6PU75HHbeWhAf+gXU/aPwgcVpG0JnYUOTe/czlc5u9TFqEYgrk5TTtptb7dpvu45OowWVlge1RsZV33qWQbuTKSTE9c/l1fT2b+S2sz+NyetaU/jL3igLpqt4GN4shrQcITwBLE9Lm/CRH3wIk0WB2Yuie2AZNAsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FJdtrm+x; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e035f7b5976so760595276.0
        for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 16:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038102; x=1722642902; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=xPTfQtMbnGzpFXQRYDpT9MKKQAxP5DVy80mpAp/3DnI=;
        b=FJdtrm+xguXOVMb30K12HpUc2L8nRUx3ZVNDU1t5rAmioJaZHrLrwjwXOvV7xliTIa
         uOBCYjXHz6cuSlhiaeSi4YjX/7tPdhanCgACmbxghKcaGwREj8BsDY6T5VR9WoBE2lpI
         0zqdTBK2SBq466v44OgnSMRKPezDOkxD9OTuY3Bafmgf8nWRVqB/XTSAyAYEzum8mQsg
         0J6ZUZkRlXKMkQjZhYv4W0Hfu93JksYcNkVQ/PHE17NzYljug5ft9vjE3gXwDcZhbDZo
         ydHqChIlHdY5eFqfPovWCtxPLrwpdgo6FUGCm4Y0LBZcpx/K4XqLqBV5sMl1g1UAmrKJ
         W/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038102; x=1722642902;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xPTfQtMbnGzpFXQRYDpT9MKKQAxP5DVy80mpAp/3DnI=;
        b=PSl0XY2L77snKgQ8H2VwtRoqhihZIMUEyqbaRUdYo8K22Ybx7hLgQreVTen+0nWiWD
         q0PzN9pwHwsNhLNEtqrYiIr2NKUtnBjWEADnRFDZhflsfP7HUUunykIl3wHsua6vWJzl
         Ykh91MklfCnvesuGf0pITLlwFjxmJNoUaq7rZAibxjBFn6hhcKu6KMTOYvQZbx9B01HZ
         uMMtzRqqMEJ2MZu8v41ccLMLgvRAw3zma2ibzh95aDmXi795c2z6FpIxasEM4gerQH4U
         oDrb2WzDDxiCkyCVrluxvKHIuA6/RD9ORSIxZEqorVTemd4qW9lSXIk6vR0nsZxWcZ4R
         8c8A==
X-Forwarded-Encrypted: i=1; AJvYcCWpE1x2lcBAVBIBaNFNjxaxsP6RSS+0px76jI6aBGypqt4u4TbvM84FnjHe7SZRP++U+50I5gKbkoZDp78E5njs/4hoiNGuvyaWNw==
X-Gm-Message-State: AOJu0YxzmQijLiKdpggSQ+0Gay6HDOpSzdmOMv8wmIIjkuthHsRmAPog
	HXwrmmyp9DasA5tVfQI2qfOWP/WSCp9ZlIDF3EU8rK4S1OfsdccbqFGOFRc4H+NSsebpXiV7Sdx
	moA==
X-Google-Smtp-Source: AGHT+IEEWasWSJ9byHCocPT0rn5wdP9A8yl8cF0t65kc5fqEIfuaFnuVC5T09t/hlGHF+EVf0JUp5RZPIP4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:c0a:b0:e05:a890:5aaa with SMTP id
 3f1490d57ef6-e0b555474d7mr20378276.1.1722038101719; Fri, 26 Jul 2024 16:55:01
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:52:18 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-70-seanjc@google.com>
Subject: [PATCH v12 69/84] KVM: MIPS: Mark "struct page" pfns accessed only in
 "slow" page fault path
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

Mark pages accessed only in the slow page fault path in order to remove
an unnecessary user of kvm_pfn_to_refcounted_page().  Marking pages
accessed in the primary MMU during KVM page fault handling isn't harmful,
but it's largely pointless and likely a waste of a cycles since the
primary MMU will call into KVM via mmu_notifiers when aging pages.  I.e.
KVM participates in a "pull" model, so there's no need to also "push"
updates.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/mips/kvm/mmu.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/mips/kvm/mmu.c b/arch/mips/kvm/mmu.c
index 4da9ce4eb54d..f1e4b618ec6d 100644
--- a/arch/mips/kvm/mmu.c
+++ b/arch/mips/kvm/mmu.c
@@ -484,8 +484,6 @@ static int _kvm_mips_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa,
 	struct kvm *kvm = vcpu->kvm;
 	gfn_t gfn = gpa >> PAGE_SHIFT;
 	pte_t *ptep;
-	kvm_pfn_t pfn = 0;	/* silence bogus GCC warning */
-	bool pfn_valid = false;
 	int ret = 0;
 
 	spin_lock(&kvm->mmu_lock);
@@ -498,12 +496,9 @@ static int _kvm_mips_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa,
 	}
 
 	/* Track access to pages marked old */
-	if (!pte_young(*ptep)) {
+	if (!pte_young(*ptep))
 		set_pte(ptep, pte_mkyoung(*ptep));
-		pfn = pte_pfn(*ptep);
-		pfn_valid = true;
-		/* call kvm_set_pfn_accessed() after unlock */
-	}
+
 	if (write_fault && !pte_dirty(*ptep)) {
 		if (!pte_write(*ptep)) {
 			ret = -EFAULT;
@@ -512,7 +507,6 @@ static int _kvm_mips_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa,
 
 		/* Track dirtying of writeable pages */
 		set_pte(ptep, pte_mkdirty(*ptep));
-		pfn = pte_pfn(*ptep);
 		mark_page_dirty(kvm, gfn);
 	}
 
@@ -523,8 +517,6 @@ static int _kvm_mips_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa,
 
 out:
 	spin_unlock(&kvm->mmu_lock);
-	if (pfn_valid)
-		kvm_set_pfn_accessed(pfn);
 	return ret;
 }
 
-- 
2.46.0.rc1.232.g9752f9e123-goog


