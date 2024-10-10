Return-Path: <linux-mips+bounces-5965-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CF799912C
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 20:49:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C2627B26530
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 18:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BB132139A8;
	Thu, 10 Oct 2024 18:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k5VHsBRz"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92B021263B
	for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 18:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584847; cv=none; b=bxavMg6BIphw8ao/xaDI4u5ztUyAQYrxaHYmrnrEWwY7ex0oKbYH3FZL6nlN8Yd0okr9Kq5mvDlMrYmcB7i59YvwsPVd7TJhk1wVAgF8XPv3dKRWg72+jZEx4QW4wNtxXsfoBmCsdfYsFJ0P/VH5O+WhmC+qKHmQeFwc/tt/DsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584847; c=relaxed/simple;
	bh=8dGNSdkZyds89DzrI//tIWXaU4bIHqe2OXPOvN+ci/o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tZrzNKZmQbfgO+/8Zh6f3DZ6PmqsttLWw6tGTmtfKJB9My7iPkSAD5JHWiU8Q8xOGF3wlabNy1E1csZPzWhI5dlps2HjEOAzZvYCpJ6Pkij9h9ablrUYkeHVhII4sHikY+6LZ6GDB9DlGu7S7nyu+v/M+jbnc+M0ghXo9Aa4Nlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k5VHsBRz; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e2913beeddaso635567276.0
        for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 11:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584845; x=1729189645; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ojyPU0tzKIRRbswoqL6JjpEgqRgu1FFXpokE5rqa8U0=;
        b=k5VHsBRzBklUEEZpaBfm9HsLPu/fl+ZxEGgLgBVvUfF80DcEJzwU1QWieKAICkx++X
         HnbGTPjBrkvT9xzCQ3B93xKLHWRVdhB75JAuDs6CC9Pe6xaL4vhhFHEWoHH5yTLt0a1d
         oBf0+iPRkwknLrLLzAaQ5NCExSiQNmy4LG3tm9rA8tacQQKxVc665PiVzy5RmN+d1Yh/
         UCLExXAcmMKNP3X6wfDNdtvlkBgntQ/wDrzkDIX5K72p0SkBLJWwlADKlJHdd65U++xh
         VGedCEpb09JKxtyzpX1AqdY2/ITlx8JQ9SeHr2ntFfUShozrMHutwXpY86gBXneT5nyL
         oVgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584845; x=1729189645;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ojyPU0tzKIRRbswoqL6JjpEgqRgu1FFXpokE5rqa8U0=;
        b=VSoj4mf4yPXcLzdAkICMnqCwxTFVqRVFj2YDICUcfYZLNEi8BiK6KQB4XbE3IoqsdA
         FeWteKo6E2uoTRo4el4yllzbTO+dPYZXqeFQAnnCl2V8cazE6L1skMXkJR7ArgrpnkUC
         3iZAY5IJiZ8HTS0lpex+tdC+fqonIDfOKuMVnwVZfPEq32cfRPRSnoB5vXPm4KGPIf6e
         ezAxDNIwmC22ku4IGxFcPZONX4rjXh6SFpme4uScPNaI5rJY9VS5TOx6DQLB+KhxZrqQ
         NOaS7AAsVKIMR9VHSKCoQCSiKAUotiIuuul+691Fp1pItE5qtmfXHctol+f7F/H7vwgL
         ltSw==
X-Forwarded-Encrypted: i=1; AJvYcCWn6lg/imuh5LP+o3FKV3zIywK3a96cGvL4tDPp6SYsnXhjx9jDCMwMata3i9wh4Zf5oqqqG3cbQvDA@vger.kernel.org
X-Gm-Message-State: AOJu0YyarBY+w61PiEvwPESWU8r2zNyPYNLmV3uSNX+gHJVXDX9sWrHU
	mFsOvKZBFZw1PpZ0SUQKwnlD2KtA4q8sOh6LPcspBFtuUqJdeiBUhByXc9vRy4S9gJ51yzyexsB
	4iA==
X-Google-Smtp-Source: AGHT+IHEyKrdGSoNbMWcRNiKhgC/jPgVf/TjauaPCrq7yqhpXyuJQagleroMC0w40O7lZsOojHLr7EwrZqI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:6805:0:b0:e20:cfc2:a326 with SMTP id
 3f1490d57ef6-e29184333b9mr26276.6.1728584844184; Thu, 10 Oct 2024 11:27:24
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:24:14 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-73-seanjc@google.com>
Subject: [PATCH v13 72/85] KVM: MIPS: Use kvm_faultin_pfn() to map pfns into
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
	"=?UTF-8?q?Alex=20Benn=C3=A9e?=" <alex.bennee@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, 
	Andrew Jones <ajones@ventanamicro.com>
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
2.47.0.rc1.288.g06298d1525-goog


