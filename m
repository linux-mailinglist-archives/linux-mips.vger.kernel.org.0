Return-Path: <linux-mips+bounces-4495-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A81BF93DB92
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 02:01:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CAF071C20EAB
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 00:01:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D2F817D88C;
	Fri, 26 Jul 2024 23:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Xvw1Edn+"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE3E155386
	for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 23:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722038011; cv=none; b=gY4iVKFmECLiE7IlTsap3ERAB7FRpK6twSU61+hOpdSGE6/V1kjm+v2hg5p8MmymaWGQkQG65TJBAX2KwzVAxcL3RS0fmAiurrx8AuITFhqYnAxGXRQTxVPiEI6Hujg/PqEhsRDUqk8CvPOXM+SQYtKBz/RVgg+1AFcINL04ZUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722038011; c=relaxed/simple;
	bh=Y9QuoXap+Xm28J95f/mEAStkkiyjgU4taMMEcAGhDr4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Zsy+zSazQ7A1uoH69KESAVhjiuqkgISy0VL2YWUHzs9xPqg8oHlfXc4p40sa7z97S24iX6sXq8f5H+dFvW34H2wTNM/JP/fZfI3EjASvlSv4oBNwJz+OZNQ4jueuEU088EnOG2tOcoqvsfyGBbHMoVJ4LhW7GaGlZbKDVnSMhFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Xvw1Edn+; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-70d19a4137dso1422858b3a.1
        for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 16:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038010; x=1722642810; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=tUI1d5PvM6nQSFLRYt7w7bGZCStWjtac1YnX2jIYbCg=;
        b=Xvw1Edn+Ezhq1l++WA4rGKFKEcgE0YWJFJKjTQTMnNFypQpomjlKC7LykKDtLpPVmu
         d1lVA9VhJ2hXSaM2VSJL87pdynOrW6wccs6sjWswPGAsm7kI5geM6S7/ceOFwn4TrDQ6
         06ctltMqX6+Vvw637GP9vx0FNL60Cd/c2M64N6nke1WvH1g7I4prg12lonRqbmF/oXSl
         Qo3hGqGtB3X+f9r3z4yjX6JvCoL0h3OQ3TKRGS5I59u5yreJ06CXYBvvVyoEw2Z9gaMk
         dDrRaCrYHgX9lAMCyBF9ObQGM0RhaKvChHqzPi3ah4aOR9oUolnk4DX+cnlyqYsumy47
         1vWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038010; x=1722642810;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tUI1d5PvM6nQSFLRYt7w7bGZCStWjtac1YnX2jIYbCg=;
        b=WHOUfgxx0Qs8wbDWbux75Vwqg//XFe2USXDHF6jcnH0sH/E2DnDhpIPFvG3eJIxLuY
         fV+xyZCJnw2cI0Q+Bw6U3NFUwdjPoMDKro4YN6qq360/WuGrQ+ys1BIIrgXZb4HPUZqX
         8SV7I7Z7q4jJ+8FZv3NHpSGlhLdmRHX3nitO87GkRNKAfd3BYwzhA/xts+6wcLPpYs7D
         H4UI5chkSTzJcPl0LIK+hPqjBu2VWLTTKAi4qVVXx4s10ojMqlwDeXYx6mH4o9wBg8Hf
         9N0vxtd0VywW/BpIVdmQaPXlS9JmbjzRssQDAphqjhER5MImH8oKSCpAy6i5tMr9H7fO
         irFw==
X-Forwarded-Encrypted: i=1; AJvYcCUhMXh4Og+lPQaxKpPmAQl8Y0GbXQnB8lIisVyZzTBjqLzzErhpkpSU1qx0RFU/YSrHilPo4TjUWabRb7pX1rK70sdYq4c9itrOgQ==
X-Gm-Message-State: AOJu0YwVc6WPZFFR9ubeXBpjjIw/ZUrlys6oMQEMilaPY5OtKtRRBz2b
	6QE3Xz3ewScqU/vRbWsP5v6K6XFGBQqjI+Ia2REbYQNNU11vA/ACwaijM80zm4uvZ45ZqHBnq37
	jdg==
X-Google-Smtp-Source: AGHT+IGIDN5ccGIB3cs8xyjoNBA33aBwY8OuaAQU+QnM7LAxDHF+KLZuhqGJARF7orYR9wXwPpBL0fgCScs=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:8593:b0:70d:3466:2f1a with SMTP id
 d2e1a72fcca58-70ece63fd2emr7784b3a.1.1722038009466; Fri, 26 Jul 2024 16:53:29
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:51:34 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-26-seanjc@google.com>
Subject: [PATCH v12 25/84] KVM: Provide refcounted page as output field in
 struct kvm_follow_pfn
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

Add kvm_follow_pfn.refcounted_page as an output for the "to pfn" APIs to
"return" the struct page that is associated with the returned pfn (if KVM
acquired a reference to the page).  This will eventually allow removing
KVM's hacky kvm_pfn_to_refcounted_page() code, which is error prone and
can't detect pfns that are valid, but aren't (currently) refcounted.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 100 +++++++++++++++++++++-----------------------
 virt/kvm/kvm_mm.h   |   9 ++++
 2 files changed, 56 insertions(+), 53 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 8e83d3f043f1..31570c5627e3 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2756,6 +2756,46 @@ static inline int check_user_page_hwpoison(unsigned long addr)
 	return rc == -EHWPOISON;
 }
 
+static kvm_pfn_t kvm_resolve_pfn(struct kvm_follow_pfn *kfp, struct page *page,
+				 pte_t *pte, bool writable)
+{
+	kvm_pfn_t pfn;
+
+	WARN_ON_ONCE(!!page == !!pte);
+
+	if (kfp->map_writable)
+		*kfp->map_writable = writable;
+
+	/*
+	 * FIXME: Remove this once KVM no longer blindly calls put_page() on
+	 *	  every pfn that points at a struct page.
+	 *
+	 * Get a reference for follow_pte() pfns if they happen to point at a
+	 * struct page, as KVM will ultimately call kvm_release_pfn_clean() on
+	 * the returned pfn, i.e. KVM expects to have a reference.
+	 *
+	 * Certain IO or PFNMAP mappings can be backed with valid struct pages,
+	 * but be allocated without refcounting, e.g. tail pages of
+	 * non-compound higher order allocations.  Grabbing and putting a
+	 * reference to such pages would cause KVM to prematurely free a page
+	 * it doesn't own (KVM gets and puts the one and only reference).
+	 * Don't allow those pages until the FIXME is resolved.
+	 */
+	if (pte) {
+		pfn = pte_pfn(*pte);
+		page = kvm_pfn_to_refcounted_page(pfn);
+		if (page && !get_page_unless_zero(page))
+			return KVM_PFN_ERR_FAULT;
+	} else {
+		pfn = page_to_pfn(page);
+	}
+
+	if (kfp->refcounted_page)
+		*kfp->refcounted_page = page;
+
+	return pfn;
+}
+
 /*
  * The fast path to get the writable pfn which will be stored in @pfn,
  * true indicates success, otherwise false is returned.  It's also the
@@ -2774,9 +2814,7 @@ static bool hva_to_pfn_fast(struct kvm_follow_pfn *kfp, kvm_pfn_t *pfn)
 		return false;
 
 	if (get_user_page_fast_only(kfp->hva, FOLL_WRITE, &page)) {
-		*pfn = page_to_pfn(page);
-		if (kfp->map_writable)
-			*kfp->map_writable = true;
+		*pfn = kvm_resolve_pfn(kfp, page, NULL, true);
 		return true;
 	}
 
@@ -2808,23 +2846,15 @@ static int hva_to_pfn_slow(struct kvm_follow_pfn *kfp, kvm_pfn_t *pfn)
 	if (npages != 1)
 		return npages;
 
-	if (!kfp->map_writable)
-		goto out;
-
-	if (kfp->flags & FOLL_WRITE) {
-		*kfp->map_writable = true;
-		goto out;
-	}
-
 	/* map read fault as writable if possible */
-	if (get_user_page_fast_only(kfp->hva, FOLL_WRITE, &wpage)) {
-		*kfp->map_writable = true;
+	if (!(flags & FOLL_WRITE) && kfp->map_writable &&
+	    get_user_page_fast_only(kfp->hva, FOLL_WRITE, &wpage)) {
 		put_page(page);
 		page = wpage;
+		flags |= FOLL_WRITE;
 	}
 
-out:
-	*pfn = page_to_pfn(page);
+	*pfn = kvm_resolve_pfn(kfp, page, NULL, flags & FOLL_WRITE);
 	return npages;
 }
 
@@ -2839,20 +2869,9 @@ static bool vma_is_valid(struct vm_area_struct *vma, bool write_fault)
 	return true;
 }
 
-static int kvm_try_get_pfn(kvm_pfn_t pfn)
-{
-	struct page *page = kvm_pfn_to_refcounted_page(pfn);
-
-	if (!page)
-		return 1;
-
-	return get_page_unless_zero(page);
-}
-
 static int hva_to_pfn_remapped(struct vm_area_struct *vma,
 			       struct kvm_follow_pfn *kfp, kvm_pfn_t *p_pfn)
 {
-	kvm_pfn_t pfn;
 	pte_t *ptep;
 	pte_t pte;
 	spinlock_t *ptl;
@@ -2882,38 +2901,13 @@ static int hva_to_pfn_remapped(struct vm_area_struct *vma,
 	pte = ptep_get(ptep);
 
 	if (write_fault && !pte_write(pte)) {
-		pfn = KVM_PFN_ERR_RO_FAULT;
+		*p_pfn = KVM_PFN_ERR_RO_FAULT;
 		goto out;
 	}
 
-	if (kfp->map_writable)
-		*kfp->map_writable = pte_write(pte);
-	pfn = pte_pfn(pte);
-
-	/*
-	 * Get a reference here because callers of *hva_to_pfn* and
-	 * *gfn_to_pfn* ultimately call kvm_release_pfn_clean on the
-	 * returned pfn.  This is only needed if the VMA has VM_MIXEDMAP
-	 * set, but the kvm_try_get_pfn/kvm_release_pfn_clean pair will
-	 * simply do nothing for reserved pfns.
-	 *
-	 * Whoever called remap_pfn_range is also going to call e.g.
-	 * unmap_mapping_range before the underlying pages are freed,
-	 * causing a call to our MMU notifier.
-	 *
-	 * Certain IO or PFNMAP mappings can be backed with valid
-	 * struct pages, but be allocated without refcounting e.g.,
-	 * tail pages of non-compound higher order allocations, which
-	 * would then underflow the refcount when the caller does the
-	 * required put_page. Don't allow those pages here.
-	 */
-	if (!kvm_try_get_pfn(pfn))
-		r = -EFAULT;
-
+	*p_pfn = kvm_resolve_pfn(kfp, NULL, &pte, pte_write(pte));
 out:
 	pte_unmap_unlock(ptep, ptl);
-	*p_pfn = pfn;
-
 	return r;
 }
 
diff --git a/virt/kvm/kvm_mm.h b/virt/kvm/kvm_mm.h
index d5a215958f06..d3ac1ba8ba66 100644
--- a/virt/kvm/kvm_mm.h
+++ b/virt/kvm/kvm_mm.h
@@ -35,6 +35,15 @@ struct kvm_follow_pfn {
 	 * Set to true if a writable mapping was obtained.
 	 */
 	bool *map_writable;
+
+	/*
+	 * Optional output.  Set to a valid "struct page" if the returned pfn
+	 * is for a refcounted or pinned struct page, NULL if the returned pfn
+	 * has no struct page or if the struct page is not being refcounted
+	 * (e.g. tail pages of non-compound higher order allocations from
+	 * IO/PFNMAP mappings).
+	 */
+	struct page **refcounted_page;
 };
 
 kvm_pfn_t hva_to_pfn(struct kvm_follow_pfn *kfp);
-- 
2.46.0.rc1.232.g9752f9e123-goog


