Return-Path: <linux-mips+bounces-5954-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D2599910B
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 20:45:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D74C2812DD
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 18:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F7A920A5F1;
	Thu, 10 Oct 2024 18:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="STJqucsL"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DF2209F54
	for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 18:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584825; cv=none; b=hF7ynsEjS7gw7/AxRGvEbftbnYUltI8HEP8qCgK9QVMlJPdagPu+r16eAEcBrGedy2ilfgsbU12HTn4rwWgIDFTweVgCip1hUyFlCFvGFYSDup4V5BCWao2S4ENReidpdw3CXEb0jIcdAkfzmvGVmPJJS+C6yRo67UXkl71Nwnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584825; c=relaxed/simple;
	bh=fHLEjIjpsClQjytVJZuAJLLMS5Q01wz8isn/MOvrB+A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RmMdFNWpqgdngaa24JM32ns0TeK7qubmgj1Y3rGw31aq/8+yJh9GsH8jf0tKYEBfSWbDJ6WJm1v9xlTC5R8N00pJpMgsQ1h9aYI4WSwYch/4A4N9JwbeXbOt21Ugqoxltx37MqS8VAtu3RozfwgSjA6U/sKeUGlU3bybA3XteZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=STJqucsL; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e2605ce4276so2182319276.3
        for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 11:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584822; x=1729189622; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=YGpJ+GsXH4oG8p6vIrNjfshF8svSSAFECmaA34wp4no=;
        b=STJqucsL1kdpv+t2aaRSW8Dsd/k9W8Xwx0z/3KChOk2f7SqOVYc8Fpu9FgNXp5fiLv
         U2zVArrxm+zFzt6S1ZnESa2Fakw84zykbu9yrPyt4txY5HGwhVwXFA7Q0M1ej5kOsfTF
         cOdyNhQsGU94JfmwxOT9eZyARvp1cSidtXQIDBSmdrHrJCdXoEDgKL9knbEsHRoX8+Q7
         x+Vw3mSWTwWjREDYZH57XAFRL/3RValbk71y72Jep2YJ1nJzbIRF8212ST78cHKuXiCE
         RyAFsegZWGTdL8tf6s6VHlUs9C4I+kaJpsg8j16L/FE68+XPw0gkSDLsBwjx5xn1Kv6y
         vMIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584822; x=1729189622;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YGpJ+GsXH4oG8p6vIrNjfshF8svSSAFECmaA34wp4no=;
        b=CgXUbWWAYZM+6vfhDISgeaf3xNwYtqKI7ENlrLj2a8pg69EmSRpKPkHxRGyhctsFpy
         IomiS8oK2I9m43Ah887u9ot2ZR1tuhQ9L/sg2Fat5U/GcuY4FQt4/bTXLJlV2fmDiYPW
         YVVtsZUMRuZ6aIl2XJPW5F9RNQvj6eIkP963pAv4viI7Dcu7LRu25lpt/m0k7sl9+u9p
         GaUSkzIrcXGgrpV3kFIhntMJo8giB3JdmgmDn/kVfT1nja7Cf1NRdbuty2CLyaN8Jl5A
         FhFi2+Ztblh+EYFmAggCwuME1s1ab5A2SkBHr0t7FbM4vBo+/s1Bw15IdwWaDFDafFfG
         MJiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOGC3ertu9KevqHj1Sbp7Kkx1nPpeLvuqHfTkk0jf6W45HnWb1FlCjy+0HrMgMwWEs6caQmLIU40Wl@vger.kernel.org
X-Gm-Message-State: AOJu0Yzho1epU/4ziXmbpjlo+epIkdZCysHSVYmQiSq5CXVK/p5D3xUA
	t3z7jHuqGC0oCPE2R3rEjea2u6SjdVoPMUSVCx0EAHUzFNY4uzelZk9LP8UH0obNK1STgXmIzxV
	EFw==
X-Google-Smtp-Source: AGHT+IFyzgxXPfejJoY0SZCQ3T+Vo8hzb1HJlB5l94FFDfZID39IeT9MHN/ZgR4beqIvxQ/gO8qC3c4Qafk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:6902:4ac:b0:e28:fdfc:b788 with SMTP id
 3f1490d57ef6-e28fe4426b8mr4979276.9.1728584821558; Thu, 10 Oct 2024 11:27:01
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:24:03 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-62-seanjc@google.com>
Subject: [PATCH v13 61/85] KVM: PPC: Use __kvm_faultin_pfn() to handle page
 faults on Book3s Radix
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

Replace Book3s Radix's homebrewed (read: copy+pasted) fault-in logic with
__kvm_faultin_pfn(), which functionally does pretty much the exact same
thing.

Note, when the code was written, KVM indeed didn't do fast GUP without
"!atomic && !async", but that has long since changed (KVM tries fast GUP
for all writable mappings).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/kvm/book3s_64_mmu_radix.c | 29 +++++---------------------
 1 file changed, 5 insertions(+), 24 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index 8304b6f8fe45..14891d0a3b73 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -829,40 +829,21 @@ int kvmppc_book3s_instantiate_page(struct kvm_vcpu *vcpu,
 	unsigned long mmu_seq;
 	unsigned long hva, gfn = gpa >> PAGE_SHIFT;
 	bool upgrade_write = false;
-	bool *upgrade_p = &upgrade_write;
 	pte_t pte, *ptep;
 	unsigned int shift, level;
 	int ret;
 	bool large_enable;
+	kvm_pfn_t pfn;
 
 	/* used to check for invalidations in progress */
 	mmu_seq = kvm->mmu_invalidate_seq;
 	smp_rmb();
 
-	/*
-	 * Do a fast check first, since __gfn_to_pfn_memslot doesn't
-	 * do it with !atomic && !async, which is how we call it.
-	 * We always ask for write permission since the common case
-	 * is that the page is writable.
-	 */
 	hva = gfn_to_hva_memslot(memslot, gfn);
-	if (!kvm_ro && get_user_page_fast_only(hva, FOLL_WRITE, &page)) {
-		upgrade_write = true;
-	} else {
-		unsigned long pfn;
-
-		/* Call KVM generic code to do the slow-path check */
-		pfn = __gfn_to_pfn_memslot(memslot, gfn, false, NULL,
-					   writing, upgrade_p);
-		if (is_error_noslot_pfn(pfn))
-			return -EFAULT;
-		page = NULL;
-		if (pfn_valid(pfn)) {
-			page = pfn_to_page(pfn);
-			if (PageReserved(page))
-				page = NULL;
-		}
-	}
+	pfn = __kvm_faultin_pfn(memslot, gfn, writing ? FOLL_WRITE : 0,
+				&upgrade_write, &page);
+	if (is_error_noslot_pfn(pfn))
+		return -EFAULT;
 
 	/*
 	 * Read the PTE from the process' radix tree and use that
-- 
2.47.0.rc1.288.g06298d1525-goog


