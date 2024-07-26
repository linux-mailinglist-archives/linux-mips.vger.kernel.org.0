Return-Path: <linux-mips+bounces-4537-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 762BB93DC25
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 02:15:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DD5928593E
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 00:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC6BA18D4DA;
	Fri, 26 Jul 2024 23:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mveVntbI"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE1518C356
	for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 23:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722038098; cv=none; b=OYJsuIM7HuBCQsTTL5dK45kKKMbJwnR2YRKWBgA3Ej6j3wfP2Rez1alWLHxVVixjNdPg1Gji57S7zVB5FOcgZrFTlWN15Jr6bgepFCbA/J5bzmDpFce6/fY/PE7bucs5G8iBwfiDOhj3MBGuoz33+l1ncx43EgS2Y8SSoDiSlao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722038098; c=relaxed/simple;
	bh=J5mfIOqDdF2lEfMBx8mMJA3dTUdwpj862NVDKPV0UK0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XPlYqJ6LtOC361fF0YrwjGkien4kgcA63ftrNDKC6QnegrvsMcXGVWytQ/vzPlRjmLymg+ZL5OC+ae0Cf9Meui+rhmboXkgqDgcxM7NCncwGVPqAxvKP/1gDppydC34+ishwOawsQUDkOIl5L88UN5ZmYxbIch27HLxxepbIGPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mveVntbI; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-70d24aead3eso1479620b3a.0
        for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 16:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038097; x=1722642897; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=T3Tq4gPotkzFIpSFFawcUtCGWBlTwHcibbE0IfTBXb4=;
        b=mveVntbItzS+s4MdWk3jQSH/2IuG/2/w74AeF9OmDy5GJJXCCZo+3hMjDkXx9zrvh7
         0GHpI1Y4DJTOQB4FIhi0QvSSjf2tvbFHNgSvlCUCf97KzxHaa+LQlWlk57bOTrJgynqm
         yN9EThDKrLnfN5Ni5OZKTw9hfn1ajaRvdpNZ3LeVjYhAYZPFhK70VDPLvlNlZuX3PTD1
         B4ZKu3x2+KD/0GobkikrMBAx/eSgRxAYIZ8UUZIrIfvdnNKwPs5CwJxNiuvc4u/l8Nm5
         u86NpPzjNbMA0LpOrJTykBlUC8WKh+5YNrBetlAimdLPvbVDArDH2j+0REx5bZhoApc8
         Fl0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038097; x=1722642897;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T3Tq4gPotkzFIpSFFawcUtCGWBlTwHcibbE0IfTBXb4=;
        b=gY5C4b6jbNXZnIbmE36bGxsil+1Fji6rZveOhcDXwrO1n3hKrDAmOcA+QOJglL3xi3
         KtzXqK7Ot+uhyGG+zOxY7A/HiQeH9alNkLsVUxyz0jjim50a0+SPVPyfZtMsX4D/EnyU
         KthB75SFAuUYDNtvJqLMNQV1q17n+5pJv58WPMzh5+apf2jpzd8OJixMzIO43Mzjxl74
         wSWp7kQX9x6fPzpuThn8gRlIygAHLLaaQdG0/rfzgXF1D9zDk7yG+ZQppKzwjTegu7HZ
         idfoukNl9koKQ/FzFOtYIguSpB9s4gKgM0LIDkJzfkwFZPHYanBUGYLs9K5Bnviq+f/n
         ayfg==
X-Forwarded-Encrypted: i=1; AJvYcCUIydyO7/9fRxMgK6qhF8I2GVUYrkMXD5tVhfYA62hQMQKWkwBpQvyXwXPo63H3gWYVIS64LnDJZoYARjzRRkFhEEZ947HUwUoVOw==
X-Gm-Message-State: AOJu0Yy8rZ+m1G1zO4/2mJoTqDwu5cUnayGiYj2LADpGHUKaLQX4/lRm
	Zc+1favRo3TMbNcq+qmeWPw+bUKzQp2t3PsNKNuQcHzONZoJdgZZb8KsnuGD5vQmvKUczpkZx6B
	a5g==
X-Google-Smtp-Source: AGHT+IExCpdv69na3gU93uhAEfGJO0DgmCPrxQU8TmhxNm9ObFOOTchJQQycuTaWmcpCMOvBszJjylffDDY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:2d99:b0:70d:2b2a:60f7 with SMTP id
 d2e1a72fcca58-70ece928763mr9066b3a.0.1722038096309; Fri, 26 Jul 2024 16:54:56
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:52:16 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-68-seanjc@google.com>
Subject: [PATCH v12 67/84] KVM: LoongArch: Use kvm_faultin_pfn() to map pfns
 into the guest
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

Convert LoongArch to kvm_faultin_pfn()+kvm_release_faultin_page(), which
are new APIs to consolidate arch code and provide consistent behavior
across all KVM architectures.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/loongarch/kvm/mmu.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/loongarch/kvm/mmu.c b/arch/loongarch/kvm/mmu.c
index 230cafa178d7..83e4376deabb 100644
--- a/arch/loongarch/kvm/mmu.c
+++ b/arch/loongarch/kvm/mmu.c
@@ -780,6 +780,7 @@ static int kvm_map_page(struct kvm_vcpu *vcpu, unsigned long gpa, bool write)
 	struct kvm *kvm = vcpu->kvm;
 	struct kvm_memory_slot *memslot;
 	struct kvm_mmu_memory_cache *memcache = &vcpu->arch.mmu_page_cache;
+	struct page *page;
 
 	/* Try the fast path to handle old / clean pages */
 	srcu_idx = srcu_read_lock(&kvm->srcu);
@@ -807,7 +808,7 @@ static int kvm_map_page(struct kvm_vcpu *vcpu, unsigned long gpa, bool write)
 	mmu_seq = kvm->mmu_invalidate_seq;
 	/*
 	 * Ensure the read of mmu_invalidate_seq isn't reordered with PTE reads in
-	 * gfn_to_pfn_prot() (which calls get_user_pages()), so that we don't
+	 * kvm_faultin_pfn() (which calls get_user_pages()), so that we don't
 	 * risk the page we get a reference to getting unmapped before we have a
 	 * chance to grab the mmu_lock without mmu_invalidate_retry() noticing.
 	 *
@@ -819,7 +820,7 @@ static int kvm_map_page(struct kvm_vcpu *vcpu, unsigned long gpa, bool write)
 	smp_rmb();
 
 	/* Slow path - ask KVM core whether we can access this GPA */
-	pfn = gfn_to_pfn_prot(kvm, gfn, write, &writeable);
+	pfn = kvm_faultin_pfn(vcpu, gfn, write, &writeable, &page);
 	if (is_error_noslot_pfn(pfn)) {
 		err = -EFAULT;
 		goto out;
@@ -831,10 +832,10 @@ static int kvm_map_page(struct kvm_vcpu *vcpu, unsigned long gpa, bool write)
 		/*
 		 * This can happen when mappings are changed asynchronously, but
 		 * also synchronously if a COW is triggered by
-		 * gfn_to_pfn_prot().
+		 * kvm_faultin_pfn().
 		 */
 		spin_unlock(&kvm->mmu_lock);
-		kvm_release_pfn_clean(pfn);
+		kvm_release_page_unused(page);
 		if (retry_no > 100) {
 			retry_no = 0;
 			schedule();
@@ -900,10 +901,7 @@ static int kvm_map_page(struct kvm_vcpu *vcpu, unsigned long gpa, bool write)
 		++kvm->stat.pages;
 	kvm_set_pte(ptep, new_pte);
 
-	if (writeable)
-		kvm_set_pfn_dirty(pfn);
-	kvm_release_pfn_clean(pfn);
-
+	kvm_release_faultin_page(kvm, page, false, writeable);
 	spin_unlock(&kvm->mmu_lock);
 
 	if (prot_bits & _PAGE_DIRTY)
-- 
2.46.0.rc1.232.g9752f9e123-goog


