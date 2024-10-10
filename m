Return-Path: <linux-mips+bounces-5959-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17800999119
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 20:47:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47AC31C24F42
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 18:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17DBE20C467;
	Thu, 10 Oct 2024 18:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EfkfFSQF"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E1420C46A
	for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 18:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584834; cv=none; b=IXNs/FwjC5M0mcw2zPZOuYzAh+rSYFpibhYdyoS0zzi3sTkrifNN9NCBm1GXYDcm/IxyJzNOmhIEgqDMGZXLwVhMjHCxoiIwufy2f1nq5SddsDBBELLTz5R3HtkrZqHqoou/lzN9kcEHbvDvAZkzEXVWbJwKXYFfnbr/UlRF0c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584834; c=relaxed/simple;
	bh=Gq0ZEmsgjgD9l+p+SR2hvcEYSP8z96GfO+zPwvkDX5Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hWGaUeAcW4WqYi3A1QNYq8NOdLJohopRrX7qv29TwgbRq3oLVGmBYAicMgzi+BnnYuNxOlSK0vsaLYZElfwZHXMT2xow/Ed03laIq33MacTo+Gfdq6RyajL4EXl8NQsoxunhhs1JEaCx2JoJMG7BCvXyXLk1B3n6gl8JCWTpVEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EfkfFSQF; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e28eea1074dso1984586276.0
        for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 11:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584831; x=1729189631; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=2XctyNuj5rmp2glWM4MaDBrVp36o24kp0nhTjUz4HGM=;
        b=EfkfFSQF3X+VfzLOUd+NMMcl3GFvR0O6RLsG8kW9/3abGsJmogSRIrtQpV+OWWRYNJ
         GPPNPPUNAXbsIX23X5G7HUZQZMe1WBRNFQm0FfhGz6XCl6mJGiQ4ZSYhxhO7CPQx+8rt
         Vkr+5ZJ+ns3A7/GgnaSxX6V/Azj+OACWU++fMoUbLZtZNL2ustwBKTJDWDypFdll23fy
         MW3rG+4rwyG1DZ5JU3s8eppFPrGqE5zTUyzexpo9UP6Hmnrdezl7ABJ1sGb0IFTAI+zz
         SNg9Wa77JEnsbl4/wjMJHG/BXG4AFPmPEmio8T5u6AeNKeqBwqQn2ivs9Vc9+kwrlQHL
         nxTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584831; x=1729189631;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2XctyNuj5rmp2glWM4MaDBrVp36o24kp0nhTjUz4HGM=;
        b=FvoO6+GuZjxwO5TQUUqcry7I928FtxorWGSx+k0LiYNZTBspOE9qaks0xrKTvfdz4k
         RjYcXzUz7gNrfNegszww1tfwpTwpR0oU2lfZTSNMaDyR1uPZrRAbbRyuQI2dUDDWpZhn
         JaEKXCgdqBwfXFNQiWbwepCNHEYkix3exs6HI23aYUyLnmuGm9PVOpn9WgBDVaCpDRsz
         soPGNysK5hLOzizveJn4EDUo7TT8l0li7ylMYUnpV/LbRQbRBO+QWJGHlv2BY+HdyScA
         JeUJqHLuKqntp5OXl+0TiKoHdiz/JA+mDNoKpNqnkLhwxFkXpQSziF+grh5/zhG6S7zN
         MNmg==
X-Forwarded-Encrypted: i=1; AJvYcCWy7N8xeKVJyy3WKu3xyPzc1ZthrZORXSl27v4h+gsueDCu+GsYDVsaCZM5Lcvvq4bl5PO5Eeg9t9xr@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt6iQYwb+8R8/ynr+/kZK2soO66yTM0Je7jkMSLKqqXabyXQTE
	snsrp7cOZPc/mOs239h+IBLeg5nIgepHgpDAUeIQdzKidDjTa0HtXnwQ5WSUUTTurJ+LE+Jc/j1
	EQA==
X-Google-Smtp-Source: AGHT+IHdtHq1a5g5QmW1TlBMuTKUOZ7R4d6aOVSlzi7r2JK/pfzCqaKRixPsJw6iRhPElP6sWQ73LfqmPps=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:d353:0:b0:e28:e74f:4cb with SMTP id
 3f1490d57ef6-e28fe0df614mr96115276.0.1728584831124; Thu, 10 Oct 2024 11:27:11
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:24:08 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-67-seanjc@google.com>
Subject: [PATCH v13 66/85] KVM: LoongArch: Mark "struct page" pfns accessed
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
	"=?UTF-8?q?Alex=20Benn=C3=A9e?=" <alex.bennee@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, 
	Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"

Mark pages accessed only in the slow path, before dropping mmu_lock when
faulting in guest memory so that LoongArch can convert to
kvm_release_faultin_page() without tripping its lockdep assertion on
mmu_lock being held.

Reviewed-by: Bibo Mao <maobibo@loongson.cn>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/loongarch/kvm/mmu.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/arch/loongarch/kvm/mmu.c b/arch/loongarch/kvm/mmu.c
index cc2a5f289b14..ed43504c5c7e 100644
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
2.47.0.rc1.288.g06298d1525-goog


