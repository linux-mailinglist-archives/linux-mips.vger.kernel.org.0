Return-Path: <linux-mips+bounces-4535-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF43193DC1E
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 02:15:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E10CC1C2339B
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 00:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0D0418C347;
	Fri, 26 Jul 2024 23:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PwfC3Syd"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A38618C32A
	for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 23:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722038094; cv=none; b=aL08VFi4gt3w5fvHyQZ5CeXPPZuPYRKOGIDlYzZE8DU+tad0/dBAEkevdTmi1QDd1e6HblwevAdRTSobtKYG+2a6uVadxcRISHMwUR6pCt2bvowc6ajm5GeLNwo81KMwOFvQa3z3j3fC/OUwkJeMVJf9XLT2Uw8eFKTavU4b1ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722038094; c=relaxed/simple;
	bh=Z7iItHoG1Un0PHfLJEkTiTxR+0KDEJBb6FOtFGyXsoU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RjyhjzgddojLWETebr+khlqAn6lbzHFgfF1HJbzfpUumYW/8SLsST+3ecvq0p9hXowef4VYOZflo7BiIehWuClWDlWhQ53fd+RyZAAw+7neMdq4FpTxjGPo0mA9IodsH87cnPT5201GiGJDcf5+dAMphAfWtiKx35462vUs0QVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PwfC3Syd; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-1fed6fe8002so10219995ad.2
        for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 16:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038093; x=1722642893; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=rpwXsNxFJqP0CEr/yEQ2h0r+lN6KBTuvETCSKMoe8FQ=;
        b=PwfC3SydHXcotWsLNhxGsq19l+/jleIfZ2WVEAKW81LAZf7qh9C7moVxdjUBkDZy5y
         5UI41ubit0OIVCLIcehBe01+lr1qpgPWltuclSpvXd8Ud11XK36DI/0bnxwwB7Apl0uZ
         SC7qh65/lS5Sd1plD239HFDuGcyxkgH6b8KhbjSE2gyKFZXoV0DGe/OqE2ei77l5BF/k
         UldDmW78Ut2208tCKxHPycrY4f/O4axRhq/eBD7EQafvYrOd5KLUM5dfDOau6hJi+A5F
         2dk2AriUhjK438cpn99mIX1GZky7m+sEM+ca/53yZgudi0q35pgP3ThGqjcxP/l3NP2O
         jmdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038093; x=1722642893;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rpwXsNxFJqP0CEr/yEQ2h0r+lN6KBTuvETCSKMoe8FQ=;
        b=mz8CAe4AKprSnCGQYzMC7KDm4XAyuJggL8YChuDcfgQhuzhqqt7mP9uOD4VeGqdYim
         2HyUtO2FjDfIH522pggWVi4GPLh29e50PKl3pm2zBYmrWGNIFwz+tkAMHPTQfox8kPs/
         C4Ozi/aM06lJNJkodI4UCVrvmOplYUefZAqtAO3ugJ6DAu6gtfDtDo1NfDa0ZPCw1UJD
         0WnpUIGjxIf/qt+d2kR27ILCSawmawZv8Hn4OhRosreF7F7fDdSfc26TowPZ6yk9OZFB
         3fYd/8gaH99v2zAey38/cV6QHm+B1FpjZvwQfAwcSeo0mG+nrLlzt+sT6Hvkzq8cc2lm
         Nrjw==
X-Forwarded-Encrypted: i=1; AJvYcCWkB4VL7/wrPtaUngRyqrIMM4XdVQkuyjMXQidvRpAFDsITk8CN3Cj6WEIKGHBTah6fpqhVZv38l99KqOplJNzvhWoiLBoH/fjDhg==
X-Gm-Message-State: AOJu0YyQ1xmxuJjlt9K8Hh7w27ZVm1SG069rXvZvSbgxi0c3L5lZCYzj
	0u86ckmd/sHpD1UbI3Npc2ZORUDHq72zwS58Ujm+XvaTZCLHbsZEittbNaU0ZHlyYrx5ooQjlOC
	LeQ==
X-Google-Smtp-Source: AGHT+IEz1qMb/9xSOR6pziERGmR6RlcO2d1FpOxR3ZCse98fOqCGJ5ia3ZBUMMNkI3e0ioyh2oD8FsbOxx8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:2341:b0:1fd:63d7:5d34 with SMTP id
 d9443c01a7336-1ff04803eeamr27405ad.5.1722038092373; Fri, 26 Jul 2024 16:54:52
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:52:14 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-66-seanjc@google.com>
Subject: [PATCH v12 65/84] KVM: LoongArch: Mark "struct page" pfns accessed
 only in "slow" page fault path
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

Mark pages accessed only in the slow path, before dropping mmu_lock when
faulting in guest memory so that LoongArch can convert to
kvm_release_faultin_page() without tripping its lockdep assertion on
mmu_lock being held.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/loongarch/kvm/mmu.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/arch/loongarch/kvm/mmu.c b/arch/loongarch/kvm/mmu.c
index 364dd35e0557..52b5c16cf250 100644
--- a/arch/loongarch/kvm/mmu.c
+++ b/arch/loongarch/kvm/mmu.c
@@ -552,12 +552,10 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 static int kvm_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa, bool write)
 {
 	int ret = 0;
-	kvm_pfn_t pfn = 0;
 	kvm_pte_t *ptep, changed, new;
 	gfn_t gfn = gpa >> PAGE_SHIFT;
 	struct kvm *kvm = vcpu->kvm;
 	struct kvm_memory_slot *slot;
-	struct page *page;
 
 	spin_lock(&kvm->mmu_lock);
 
@@ -570,8 +568,6 @@ static int kvm_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa, bool writ
 
 	/* Track access to pages marked old */
 	new = kvm_pte_mkyoung(*ptep);
-	/* call kvm_set_pfn_accessed() after unlock */
-
 	if (write && !kvm_pte_dirty(new)) {
 		if (!kvm_pte_write(new)) {
 			ret = -EFAULT;
@@ -595,23 +591,11 @@ static int kvm_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa, bool writ
 	}
 
 	changed = new ^ (*ptep);
-	if (changed) {
+	if (changed)
 		kvm_set_pte(ptep, new);
-		pfn = kvm_pte_pfn(new);
-		page = kvm_pfn_to_refcounted_page(pfn);
-		if (page)
-			get_page(page);
-	}
+
 	spin_unlock(&kvm->mmu_lock);
 
-	if (changed) {
-		if (kvm_pte_young(changed))
-			kvm_set_pfn_accessed(pfn);
-
-		if (page)
-			put_page(page);
-	}
-
 	if (kvm_pte_dirty(changed))
 		mark_page_dirty(kvm, gfn);
 
-- 
2.46.0.rc1.232.g9752f9e123-goog


