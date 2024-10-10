Return-Path: <linux-mips+bounces-5942-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1D09990E6
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 20:41:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22A3D1C2630C
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 18:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEBC1206962;
	Thu, 10 Oct 2024 18:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xxvwKwOg"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0CC206941
	for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 18:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584798; cv=none; b=dI6EY/OtsvPnfHxpn+mFeTC8tstIgUxlygj7/ajOy1j1u9yg0ru1VCMGdbW7X7MxMta9A71m8LNGB70HfgiNRfvzsVsrxbu7hBnvFckCpfIi5eoY3HGknBjGBYg79iO8Wj4aZGPn2yQr7HJ8mls27pR8hxFa55eP5eqJfcRrXuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584798; c=relaxed/simple;
	bh=7Japh8LNPjEnA4nandXvXnjfnzZjLu2hqYfo+wet/X8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GvHP/uRSbre5kyMZOu+0OE/9H3h35fms8iAxlzfujk41gcrkM4r/3cd3C2AIf2xYFbbTJ43Gh1ctH2IKNme9v3PTIJmTBQvfT0KI20cNDfSi78HziKYEsNxD2h2sTEOuL4By+dfGqnfyr1ZqxW2p6OrEU1V4/ss3J8ILRI/fQ1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xxvwKwOg; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-7c6a9c1a9b8so928315a12.0
        for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 11:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584796; x=1729189596; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ndpfmsd07O3XHkbROvy9SWySHpmtrF0LUOG5EHCQjAE=;
        b=xxvwKwOgsGq9OHAeEg7ulS5M+xc0H7aGJvU84LLWDRvOqgU3TkZZQEPsrvINQkKuQh
         a0kSZ2m3MyVoMs8rT3NEB6ipyNHqf7wvINEndO31pndYJIj4JwdiGbpEIOldXIyZ4JUH
         m2Xwt+waP1WmBQ71gKCZlGDkYqz50bxSUom0dv824jufQ4rZn5keWyyQCE4jabUEcNHX
         8IIDaN8klrGuagpek/bjhFComuRxJZEumPnJcNvLYqDKl0lJxlPsm74awlyYEz6E8Cx5
         VMALXIP+FsaprgSWZvSmcNFCJoD0wV5yGOvsPvB1jxazYhU9yqzSqRKG2eEf1zu2lj+c
         BfPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584796; x=1729189596;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ndpfmsd07O3XHkbROvy9SWySHpmtrF0LUOG5EHCQjAE=;
        b=fz4oA8I404f0whL+nXefhfJ/KZixO6+9no34P4ehebnfUBCgsI8gU56GoxwwojTq1R
         uhEqlZKE3lZDK+OnB7Y6AmRugzQrB/z8OBuA4H2aMgVr/staGr3TahAHclGuA6FO/32G
         4a9yvgUCHDEQOho/9PQeibPtPcjjEawRy7F4WbYb9upTI2dqJib1tIkudEjGjYUxJcWK
         EFO+WHT0pXjeHobVJB2zkdRChp6m866gsCcrSglZ5vmSXRSLk/weHLPBLrtPfu6tnRZR
         3LwDYHXCxIpd+aeCg1qqdaeSwz6risqLAMG+fFy6+VdI3qxGEKFxIpfrSZ1grNOa40Gg
         y60g==
X-Forwarded-Encrypted: i=1; AJvYcCUxemyr4BmU1FThYNW7JQrMrpgxei6WDd4lC3qRMf7ZWwQtC7KJt4iDExAFEb0KviOUsnGReWgD3QSr@vger.kernel.org
X-Gm-Message-State: AOJu0Yy31h3gReyvnk6It6jxJ1feUtdb6uCtacif0lQZCLNj8nnBBHe5
	1e7tRRHRqafjK1Ab3iB1GoxBhiZ4hnmYwFjUYJzTPWHrfQvFVOdIXFEuRXkz2QqT1+hX/cTNnSi
	Heg==
X-Google-Smtp-Source: AGHT+IGJc8hgBZq6lOovV4Dgly5ctIXEs7jDnJfEupYxVqninaLorgqTg5WNW0BPJZYnJnHdEtp0yWaf7UM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a65:450a:0:b0:717:a912:c302 with SMTP id
 41be03b00d2f7-7ea53525e73mr49a12.1.1728584796119; Thu, 10 Oct 2024 11:26:36
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:51 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-50-seanjc@google.com>
Subject: [PATCH v13 49/85] KVM: Move x86's API to release a faultin page to
 common KVM
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

Move KVM x86's helper that "finishes" the faultin process to common KVM
so that the logic can be shared across all architectures.  Note, not all
architectures implement a fast page fault path, but the gist of the
comment applies to all architectures.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c   | 24 ++----------------------
 include/linux/kvm_host.h | 26 ++++++++++++++++++++++++++
 2 files changed, 28 insertions(+), 22 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index e14b84d2f55b..5acdaf3b1007 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4370,28 +4370,8 @@ static u8 kvm_max_private_mapping_level(struct kvm *=
kvm, kvm_pfn_t pfn,
 static void kvm_mmu_finish_page_fault(struct kvm_vcpu *vcpu,
 				      struct kvm_page_fault *fault, int r)
 {
-	lockdep_assert_once(lockdep_is_held(&vcpu->kvm->mmu_lock) ||
-			    r =3D=3D RET_PF_RETRY);
-
-	if (!fault->refcounted_page)
-		return;
-
-	/*
-	 * If the page that KVM got from the *primary MMU* is writable, and KVM
-	 * installed or reused a SPTE, mark the page/folio dirty.  Note, this
-	 * may mark a folio dirty even if KVM created a read-only SPTE, e.g. if
-	 * the GFN is write-protected.  Folios can't be safely marked dirty
-	 * outside of mmu_lock as doing so could race with writeback on the
-	 * folio.  As a result, KVM can't mark folios dirty in the fast page
-	 * fault handler, and so KVM must (somewhat) speculatively mark the
-	 * folio dirty if KVM could locklessly make the SPTE writable.
-	 */
-	if (r =3D=3D RET_PF_RETRY)
-		kvm_release_page_unused(fault->refcounted_page);
-	else if (!fault->map_writable)
-		kvm_release_page_clean(fault->refcounted_page);
-	else
-		kvm_release_page_dirty(fault->refcounted_page);
+	kvm_release_faultin_page(vcpu->kvm, fault->refcounted_page,
+				 r =3D=3D RET_PF_RETRY, fault->map_writable);
 }
=20
 static int kvm_mmu_faultin_pfn_private(struct kvm_vcpu *vcpu,
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 504483d35197..9f7682ece4a1 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1231,6 +1231,32 @@ static inline void kvm_release_page_unused(struct pa=
ge *page)
 void kvm_release_page_clean(struct page *page);
 void kvm_release_page_dirty(struct page *page);
=20
+static inline void kvm_release_faultin_page(struct kvm *kvm, struct page *=
page,
+					    bool unused, bool dirty)
+{
+	lockdep_assert_once(lockdep_is_held(&kvm->mmu_lock) || unused);
+
+	if (!page)
+		return;
+
+	/*
+	 * If the page that KVM got from the *primary MMU* is writable, and KVM
+	 * installed or reused a SPTE, mark the page/folio dirty.  Note, this
+	 * may mark a folio dirty even if KVM created a read-only SPTE, e.g. if
+	 * the GFN is write-protected.  Folios can't be safely marked dirty
+	 * outside of mmu_lock as doing so could race with writeback on the
+	 * folio.  As a result, KVM can't mark folios dirty in the fast page
+	 * fault handler, and so KVM must (somewhat) speculatively mark the
+	 * folio dirty if KVM could locklessly make the SPTE writable.
+	 */
+	if (unused)
+		kvm_release_page_unused(page);
+	else if (dirty)
+		kvm_release_page_dirty(page);
+	else
+		kvm_release_page_clean(page);
+}
+
 kvm_pfn_t __kvm_faultin_pfn(const struct kvm_memory_slot *slot, gfn_t gfn,
 			    unsigned int foll, bool *writable,
 			    struct page **refcounted_page);
--=20
2.47.0.rc1.288.g06298d1525-goog


