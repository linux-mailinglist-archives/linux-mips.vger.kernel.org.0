Return-Path: <linux-mips+bounces-4553-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A1F93DC61
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 02:20:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73DDC1C21AC0
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 00:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28159192B8A;
	Fri, 26 Jul 2024 23:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SwN8w6tv"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992C4192B60
	for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 23:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722038133; cv=none; b=qIK312ppqlhtq1APZ+RzA2woXJ1jIzBGFjXWBieaw1goWkLBijQh2A1KeRhx9v0eMxE4fiS2U13sGYyg8bw1oSNKqUYLn212Osmw5xvzTwGhicds0V3NMZtaoHHXthpLWoHQx5AbRuUHlCEZ76dLDPj7MQufCc6u0NTZf+6SDjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722038133; c=relaxed/simple;
	bh=HoquObhcjq49pZ1kYWlBVegT881fbNuh57UaVD2ZrGU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sui7nPHAraordjqtVlzGZtEEZLcqWMGV2PjyOGcEMA6Og91okDGahLwYFFHVa2zmU7/kig1iZln+paxHSogVJ3Uw8vGHjDHYOQxqmvZkhqSp6cDbKKcHogI7RR4oFlAkij6Z31VvXrOCfFVHnC/in3bsC7BxPhX7Hy9hIDnE23U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SwN8w6tv; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2cb6c5f9810so1642454a91.2
        for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 16:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038130; x=1722642930; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=jpI7lTRxFmJ8IejB0Qdg95emli3A+yh4X5lHdX1qdPI=;
        b=SwN8w6tvcVGrQ2IEG8LtZCOb8YKFhEjIVg48CofI/XUkxs17lq+3E3T6/B8mrIXQ9w
         oD6epinOKD2VNTjf0DTzme68lhammTb7I0TffNGzKPYJJ/PTj1v7mbCAIr7Bv5fRhU5H
         XJbwuwgOuXTGQttCFDns9lV9blvdeW/pcTaXzlfyFcm3E9ghX11zoqe0tYsYp6MYJytO
         PE8hD+Gty9R6KY7oXsQg8YOkQUjmqrEj9IFrt4uDLJo1ZemLiVA+G76ffwn92Ei643Za
         KJPs0ZlKy8h8vSX04w/RPhW/MAQ9q4PL1WocFxXlO5LgaZc3okPHTaDJlzE1zFupvVbo
         zeRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038130; x=1722642930;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jpI7lTRxFmJ8IejB0Qdg95emli3A+yh4X5lHdX1qdPI=;
        b=YPXF7Zg5v6H5wgWVI20cuaHjBkxGlepvK50CzEB0Jw9Cej5PodlniHdhknOxxmg/Cf
         LVmDQ0a0FGXH9bUvQD2nCDpy7HKiY+Cn0FvY4mQ8sF8NLJuZaZpDjookxeYw/ZmDTwjA
         oZgQzEYjJlZ/idAB8XFiREiOUFIOPNYlEAhu7aBT3NHoZzYansXHMijSymtlEbEp+F4z
         YAE1ijDoiRCxGSaeOvDcfKdrd0YFAUehc2kKfNrA/oZX0wfqtb7liq8Bm/ZG6YpefNz7
         jrGAegeGYTEasOr2cFIzYTitlvQb0bHJAYXAfifOKE8G9bc463S5hTkBD7LFXwk/7FoM
         UZig==
X-Forwarded-Encrypted: i=1; AJvYcCXZ8FALEr34sIpsIaxLjZWATztq4mmH9bDHM5p4ouUNXtu0IHuSIZ0wRvPtfBImbkDKGpMvKTTKg0S53/OHMJDdg8C+Pwxo/NedZQ==
X-Gm-Message-State: AOJu0YzVtpY/0Z+lknra3LdicCIJC2FFEOXmfrkufbiIb2JNQpvJkY7f
	uJ/p9quyb2m+TmG3RIJ0sbX0yKn2jOsUUktbu4br+kmPr8ee+S7wBGRL6ftFrliMhdD5a7aq5wz
	6KQ==
X-Google-Smtp-Source: AGHT+IFv8CQNcqhsspCtIqnm+Y+lStR0ot3kSIK9X3XaAk7UtrG+09935pql8gySUvK94zWnbXq5q/tu644=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:fb47:b0:2c9:61f9:9aea with SMTP id
 98e67ed59e1d1-2cf7e618b7dmr21168a91.5.1722038129745; Fri, 26 Jul 2024
 16:55:29 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:52:32 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-84-seanjc@google.com>
Subject: [PATCH v12 83/84] KVM: Drop APIs that manipulate "struct page" via pfns
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

Remove all kvm_{release,set}_pfn_*() APIs not that all users are gone.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h |  5 ----
 virt/kvm/kvm_main.c      | 55 ----------------------------------------
 2 files changed, 60 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 34a1cadb1b80..87d61f16a449 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1260,11 +1260,6 @@ static inline kvm_pfn_t kvm_faultin_pfn(struct kvm_vcpu *vcpu, gfn_t gfn,
 				 write ? FOLL_WRITE : 0, writable, refcounted_page);
 }
 
-void kvm_release_pfn_clean(kvm_pfn_t pfn);
-void kvm_release_pfn_dirty(kvm_pfn_t pfn);
-void kvm_set_pfn_dirty(kvm_pfn_t pfn);
-void kvm_set_pfn_accessed(kvm_pfn_t pfn);
-
 int kvm_read_guest_page(struct kvm *kvm, gfn_t gfn, void *data, int offset,
 			int len);
 int kvm_read_guest(struct kvm *kvm, gpa_t gpa, void *data, unsigned long len);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 030a08d4b21d..8b85e1130a63 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3200,61 +3200,6 @@ void kvm_vcpu_unmap(struct kvm_vcpu *vcpu, struct kvm_host_map *map)
 }
 EXPORT_SYMBOL_GPL(kvm_vcpu_unmap);
 
-void kvm_release_pfn_clean(kvm_pfn_t pfn)
-{
-	struct page *page;
-
-	if (is_error_noslot_pfn(pfn))
-		return;
-
-	page = kvm_pfn_to_refcounted_page(pfn);
-	if (!page)
-		return;
-
-	kvm_release_page_clean(page);
-}
-EXPORT_SYMBOL_GPL(kvm_release_pfn_clean);
-
-void kvm_release_pfn_dirty(kvm_pfn_t pfn)
-{
-	struct page *page;
-
-	if (is_error_noslot_pfn(pfn))
-		return;
-
-	page = kvm_pfn_to_refcounted_page(pfn);
-	if (!page)
-		return;
-
-	kvm_release_page_dirty(page);
-}
-EXPORT_SYMBOL_GPL(kvm_release_pfn_dirty);
-
-/*
- * Note, checking for an error/noslot pfn is the caller's responsibility when
- * directly marking a page dirty/accessed.  Unlike the "release" helpers, the
- * "set" helpers are not to be used when the pfn might point at garbage.
- */
-void kvm_set_pfn_dirty(kvm_pfn_t pfn)
-{
-	if (WARN_ON(is_error_noslot_pfn(pfn)))
-		return;
-
-	if (pfn_valid(pfn))
-		kvm_set_page_dirty(pfn_to_page(pfn));
-}
-EXPORT_SYMBOL_GPL(kvm_set_pfn_dirty);
-
-void kvm_set_pfn_accessed(kvm_pfn_t pfn)
-{
-	if (WARN_ON(is_error_noslot_pfn(pfn)))
-		return;
-
-	if (pfn_valid(pfn))
-		kvm_set_page_accessed(pfn_to_page(pfn));
-}
-EXPORT_SYMBOL_GPL(kvm_set_pfn_accessed);
-
 static int next_segment(unsigned long len, int offset)
 {
 	if (len > PAGE_SIZE - offset)
-- 
2.46.0.rc1.232.g9752f9e123-goog


