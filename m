Return-Path: <linux-mips+bounces-4489-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B86CF93DB7B
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 01:59:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 53C3BB2418C
	for <lists+linux-mips@lfdr.de>; Fri, 26 Jul 2024 23:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56A74173351;
	Fri, 26 Jul 2024 23:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kCTSWtId"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5982172BAC
	for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 23:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722037998; cv=none; b=LtMNxI3VOvl54nwnU9uk0HDaQBez3xUkcsSxjiw8SCteo4BQt5sjNDB3d6z+YmU16NNuIozfZ30+ot36khqN8E7Z5DxdMidVRHMrt4T4GnfidSIRYx1tcNJZX2nhiZnuQgA+S7+1JUdc+jnDe9VwqeTcSzTCOWhCJSq0O8VgH+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722037998; c=relaxed/simple;
	bh=RHZeaSr31fCCvyOcLLpe++oP0vx96AuhdExL9Q1bNo4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GkgME6qFaHoaNz7W4O2TpWb5/K6AWrtBHtJp1jjg1i1HLZ9DdTDKgy4qGfPseHx4NxrGPcsXThOWaORLbNqmimDnRm2hEjL7Lh+BL84/OF9jeCphrIOsYviSUwIaK7hpIMqQDNDbveuptg1NIrBO0SUdl+qC2F0rRpuod/z55Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kCTSWtId; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-78e323b3752so1105775a12.0
        for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 16:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722037996; x=1722642796; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=oqsp5dWmLf1ceGtEyEpwn2+TSiYr9kgkgYyCIEXijOU=;
        b=kCTSWtId1rHIZgmfsdqgQ5rr5qjwVYRpqhiAjlZgNwGPzSbamMwXx10J6U5t/+/VC6
         xZEuKeLSfx+5+fDzVhBtur6rMPAm4ZwpHOZIhaUJcS3yH42v8xWgXTFEtnX0ILpJQT0P
         WRz66MsDqfL5hxrAtaonU7xHvW/hOCj0GjaW/6i1CkVHtJGjNL7XX7frQerDXCuYGJFO
         ZXtZki55GpST/Q18pCz5z99EfGuaDiHvhR5GQvSC61w/SOmuk5tDNZiOinVaMdReWyuN
         nbqRwh9Z51ENrs1IC2+T9cC5dMduSkF0IN+G8xuXI/Sf/FcvoPH5ARg06pQMuzp9itM+
         bLHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722037996; x=1722642796;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oqsp5dWmLf1ceGtEyEpwn2+TSiYr9kgkgYyCIEXijOU=;
        b=rRNwV3nqsqS7kcWe7kjSJE0pOp5fLV9eRYg8wBgREPsCydXF8f7GNe+tsFDtwBiF1e
         kgbkcDfj7OYvLGCijrpQbf3I/P17ZsfMgJK/75u5HVW5KeQhAdwpTBh4cKv5MHGGV8j7
         YXa9DaUI2/fQJ4h2tgBVArvRCz9FWdDsqX84ms9z5qu5jiPx007+FXqBBEMuIFK2hBhH
         LdmKkUVL1o24BECDLiqvH528aAcut3/foEa8qVFkbUdYKcS7fmPK+xZHPsGznuurVsTw
         zGMD9cwrGVdMZ4al3DJ1p0Bywnem+6ImQxcin43NW8UkuZDPwHZiD7hhI3SFotIg7pGg
         msPg==
X-Forwarded-Encrypted: i=1; AJvYcCXE16mJvcMAjOu69kfssghz50Gy3WqP6jAKJf3XPI+ZBFyRUjGcCdcwCUzC+or0/5G7yw4AlZpgJZXxnOwqFo+utLMukE7W1ckxYQ==
X-Gm-Message-State: AOJu0YwbJkw5bYAitSOmB3aKLf5akJn8MPsru7csFQy1bKABRyc+J9Ax
	UJ3ShuSLdmKHHoOSGoKmerL5YiFGzi6Ap+WproashJw/c4Q1JNHBvbnqQSWK0CQutVVIvnGgvqw
	/XA==
X-Google-Smtp-Source: AGHT+IGPnVvSSR8GC4je1DUQj4K0eIO0wDIdrfABFjI4ae5Nt/lU6oCOfX0avnzwArksU/NKeR8FWd7ZKxM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a02:5a9:b0:6be:8aa5:bffb with SMTP id
 41be03b00d2f7-7ac8e0bb8cdmr3560a12.4.1722037995764; Fri, 26 Jul 2024 16:53:15
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:51:28 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-20-seanjc@google.com>
Subject: [PATCH v12 19/84] KVM: Explicitly initialize all fields at the start
 of kvm_vcpu_map()
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

Explicitly initialize the entire kvm_host_map structure when mapping a
pfn, as some callers declare their struct on the stack, i.e. don't
zero-initialize the struct, which makes the map->hva in kvm_vcpu_unmap()
*very* suspect.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 40 ++++++++++++++++------------------------
 1 file changed, 16 insertions(+), 24 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 21ff0f4fa02c..67a50b87bb87 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3088,32 +3088,24 @@ void kvm_release_pfn(kvm_pfn_t pfn, bool dirty)
 
 int kvm_vcpu_map(struct kvm_vcpu *vcpu, gfn_t gfn, struct kvm_host_map *map)
 {
-	kvm_pfn_t pfn;
-	void *hva = NULL;
-	struct page *page = KVM_UNMAPPED_PAGE;
-
-	pfn = gfn_to_pfn(vcpu->kvm, gfn);
-	if (is_error_noslot_pfn(pfn))
-		return -EINVAL;
-
-	if (pfn_valid(pfn)) {
-		page = pfn_to_page(pfn);
-		hva = kmap(page);
-#ifdef CONFIG_HAS_IOMEM
-	} else {
-		hva = memremap(pfn_to_hpa(pfn), PAGE_SIZE, MEMREMAP_WB);
-#endif
-	}
-
-	if (!hva)
-		return -EFAULT;
-
-	map->page = page;
-	map->hva = hva;
-	map->pfn = pfn;
+	map->page = KVM_UNMAPPED_PAGE;
+	map->hva = NULL;
 	map->gfn = gfn;
 
-	return 0;
+	map->pfn = gfn_to_pfn(vcpu->kvm, gfn);
+	if (is_error_noslot_pfn(map->pfn))
+		return -EINVAL;
+
+	if (pfn_valid(map->pfn)) {
+		map->page = pfn_to_page(map->pfn);
+		map->hva = kmap(map->page);
+#ifdef CONFIG_HAS_IOMEM
+	} else {
+		map->hva = memremap(pfn_to_hpa(map->pfn), PAGE_SIZE, MEMREMAP_WB);
+#endif
+	}
+
+	return map->hva ? 0 : -EFAULT;
 }
 EXPORT_SYMBOL_GPL(kvm_vcpu_map);
 
-- 
2.46.0.rc1.232.g9752f9e123-goog


