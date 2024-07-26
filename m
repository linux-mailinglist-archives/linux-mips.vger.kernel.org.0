Return-Path: <linux-mips+bounces-4546-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3309993DC47
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 02:18:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC7921F22F00
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 00:18:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 240DA19047B;
	Fri, 26 Jul 2024 23:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GLtaDUrv"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44331190052
	for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 23:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722038119; cv=none; b=o++/eUyaN3cREnUPeuKJXynEp8aG48YLfUhnhs1pOgpT1OeKkxl91Djr+nIcroISuzUTpw6n7mZaN1CS24wrHJ7j+diyGFxeTKavXpULTmuZViz0kUNZSNMIyDvKwLN+hO8GY8L4QSIbvbz7fxcwwBmL87eJ063zMjIkV6sg8m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722038119; c=relaxed/simple;
	bh=SUUzhrURtkDY8ACwtRZFtnUrMpf+i7jwgURG3Mw5oko=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=b8Itoitr7ZDaYdOCr5k2UBwKXAK0X1xMk9Tl9LrqG+IhbCQi06s6EUeQCESURwelw4sGeMq2aBTR+PAEJhYKN3nTrPNFBHdJaL2MvRSmAuDeuwUmA/AfO09QRAroSZlpKDXMk05m76WHLkcFbJi+KfW3DD5Ro1Eiz+q2mK1wHs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GLtaDUrv; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-1fc5e61f0bbso13367825ad.1
        for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 16:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038116; x=1722642916; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=gSJgbeqW0EjFVjI/rvx0LQaQxVZn1dW4kzDKJHwZpGY=;
        b=GLtaDUrveUqDcyxp5RkAvPoK0LtbkQw20aUgB3YddyaMWtw5CRqTBTDQbzB+Hgd0qd
         9wCtJF9OJqoVJeDtBeKP9q/bGjA46yy2rrnG6FJTtAqAtoqtJK3RGlM7dwUF6FBE5nAt
         mNnBOsY/ostoBhYnsM1dr/Xbst5EV5Hhp6VQhuj6iFHtKQ98k1QJGAn2b9gW4SutYrln
         WXS9dyjlgwC56rEpQnLAMb+RDLUYbCGyoDvdxZ0DKRfvV5/YR92FzIDbzDqkrOy9QU1Z
         rE/B942bUAwWakpd7ehQ33JecYeJmGXz2qhglZR0Jfd3Z4tvAVHQYSmRm5FJ/RpyItSt
         ty/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038116; x=1722642916;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gSJgbeqW0EjFVjI/rvx0LQaQxVZn1dW4kzDKJHwZpGY=;
        b=ddAJcogvvqH0HwWPZTVjaZezbPjYzrbxRNxEReJOOF8lVKSMizWoWJmM/2mB/2PXTu
         zizGJnsZ8OipAqtoFthI+EhgWPPzaj7P4/0QqsU9skY1DnZC/0u01QCX1OTUp0EiIKlW
         mjGnTy3vdm7W3OqT9OJ+KItRUWroPkb7UjXhnFS5Zho8ihDuyw/sM7VPIjF7q4YKrGqf
         UXx1RkilXyvqrjSDhRe02OYy2gM/om3BIQ96dD7deDhpzAE6ZViaExI+GDjUDY5bX5Mf
         +A2EfgvZ8LRa0eM0yIKR1v5SqUtcyu9FdDNOfTD3wBttQxbsEJLIlS8ZbPo/HSaeNRQ2
         xoYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIeV27sAutN7vWc8Yp69RzbmZKJ4+jp7mNY0R0/dm3u7Lk+Gd4eAL88xlIriuYyChOSv7yf7dyQEWjLdly4dTCb90DUHkMtQF4/w==
X-Gm-Message-State: AOJu0Yzo/4PBrVVQ4OApXIfNNXFAi/D9hcLcOkq7BMbQSzr+7UggWe9I
	ECJiPnOdkQh23LHTZZxeaEGr6TW5vELsfZF/4xc91JkHiW0wZ/umeFbxHe2+RbZMelcwBbWREKV
	wrg==
X-Google-Smtp-Source: AGHT+IHxrkKUWCeUEpiaW8aWqxkJkE+eVd4nhH8cGKa9NS3y3LrlRDBQyz/B78NptpquvhhjWf0asoH4ivY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:c945:b0:1fc:733d:8465 with SMTP id
 d9443c01a7336-1ff0488cadamr599925ad.8.1722038115596; Fri, 26 Jul 2024
 16:55:15 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:52:25 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-77-seanjc@google.com>
Subject: [PATCH v12 76/84] KVM: arm64: Use __gfn_to_page() when copying MTE
 tags to/from userspace
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

Use __gfn_to_page() instead when copying MTE tags between guest and
userspace.  This will eventually allow removing gfn_to_pfn_prot(),
gfn_to_pfn(), kvm_pfn_to_refcounted_page(), and related APIs.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/guest.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index 962f985977c2..4cd7ffa76794 100644
--- a/arch/arm64/kvm/guest.c
+++ b/arch/arm64/kvm/guest.c
@@ -1051,20 +1051,18 @@ int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
 	}
 
 	while (length > 0) {
-		kvm_pfn_t pfn = gfn_to_pfn_prot(kvm, gfn, write, NULL);
+		struct page *page = __gfn_to_page(kvm, gfn, write);
 		void *maddr;
 		unsigned long num_tags;
-		struct page *page;
 
-		if (is_error_noslot_pfn(pfn)) {
-			ret = -EFAULT;
-			goto out;
-		}
-
-		page = pfn_to_online_page(pfn);
 		if (!page) {
+			ret = -EFAULT;
+			goto out;
+		}
+
+		if (!pfn_to_online_page(page_to_pfn(page))) {
 			/* Reject ZONE_DEVICE memory */
-			kvm_release_pfn_clean(pfn);
+			kvm_release_page_unused(page);
 			ret = -EFAULT;
 			goto out;
 		}
@@ -1078,7 +1076,7 @@ int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
 				/* No tags in memory, so write zeros */
 				num_tags = MTE_GRANULES_PER_PAGE -
 					clear_user(tags, MTE_GRANULES_PER_PAGE);
-			kvm_release_pfn_clean(pfn);
+			kvm_release_page_clean(page);
 		} else {
 			/*
 			 * Only locking to serialise with a concurrent
@@ -1093,8 +1091,7 @@ int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
 			if (num_tags != MTE_GRANULES_PER_PAGE)
 				mte_clear_page_tags(maddr);
 			set_page_mte_tagged(page);
-
-			kvm_release_pfn_dirty(pfn);
+			kvm_release_page_dirty(page);
 		}
 
 		if (num_tags != MTE_GRANULES_PER_PAGE) {
-- 
2.46.0.rc1.232.g9752f9e123-goog


