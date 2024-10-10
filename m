Return-Path: <linux-mips+bounces-5955-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D59C99910D
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 20:45:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 62F5EB253AF
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 18:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 217F820ADC8;
	Thu, 10 Oct 2024 18:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bjTwwhuo"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D4B20A5DB
	for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 18:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584826; cv=none; b=bG/0jnoL83w5ZqCgFRXfUPCLG3MtcfHzvkvwV1PVqeUekLugPEzrvn519chLgXnY7oAacOtHgX8ZDBpEF2c5+Ep5oVYrgfaDxGKYdFBWnjpPwpVmjEDQ9GeAeJyfauIMjedEdr+Bnu54ztq7f6ATX0g1fuaH0rCCE6pBsCeDhEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584826; c=relaxed/simple;
	bh=lnamoAhiaB2k3D/cv0luJANVeCRwGvcQfaabdaB/y4g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=F78eOT8ujnaCgQzpftYkHkvWlBgzA0Wn3AbiM5C84oRiy5QcI1X8brapsvCavxMuUR4xYdxW/34mmk+CeIa6m3wrX8l0kVhDOUbjxNmdg8pj7zzt8/ueR0K/SEFDkl3naE5mm33zN1wN9Nar5uRwAnkeFDkuCHp6RrBr1Bhg5X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bjTwwhuo; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-71e1e989aa2so1656078b3a.3
        for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 11:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584824; x=1729189624; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=8JV5lSZeo1By1ou6uwDGqoH8kmaYenoeIxSHz9El/d0=;
        b=bjTwwhuoN0SpvNaeySCVuMnmyKMqY2y7VhEvpQdH8Tydsmp9oc3ImEzNIB7x2f58Vc
         LW75/zBKZ8Dtw2BE5RKmttfdjQIE7EcP0Et20wml0hzKLI3e8x/5FaIzoiMPPwoGie9t
         02kIjtfFUWb/70njpoTggzuy3qcK/ZCuTPOg9Uy3fR3Pn5LLKSSXdxVywqZg7ZuphLmL
         dJqWYhncEpAB9sXQgmaXSJ7FaOaCiNrjHLf7jQsWXNhvERuNF0jIbJ84cEpV6XNBHYNv
         Z4H1YTKXoiAb/B1jipjTL2HYW90e2uWFVEIFwneMeDCmQziwMbpeaLSFC2sEZceI1UsL
         NTaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584824; x=1729189624;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8JV5lSZeo1By1ou6uwDGqoH8kmaYenoeIxSHz9El/d0=;
        b=uC56ccow9WwFjIuc3TwyuCzGOC7PMLj5t7MhyMqY3eE3/CiyQqlJpiD0JWGUao1d79
         7KsX/E8dCo2Y5XiTbpycrAa5MB1xlvDngp5tPlWZOnkscCIfeBULTkBhOaFvehWFn83I
         AMjVrp1SWEpnn4W3hLoAM2iLiZ08VmDougnjw5VsahwWLpeGTNfOazQBAhf3EdA7TAI4
         Ect9gxPBh9VeDP+z6q7dKY2Hq52Qe3NIfpZT7g4LWJUYG4J/HP5zuyj+31tYPZF2guvb
         PwR06/26vcsXzva9BU2u+6K0P/o9YXzAPiDYx00PKIiBuWYHf+wECyOmxyWmfg6AM92I
         dJvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWW0WJS2rMeLFBnHnOhZAMCJwrJLGIgs3pt7Sgc3pudcbte/bk4MBnCjYWSumlijtJXSs4EB324X6dH@vger.kernel.org
X-Gm-Message-State: AOJu0YxKCfxpBWjWWc5M0lAiycXMK2yMFDNwR1QEeQfZKMf5irpHzTl7
	Rl6+bcxal02VawArLEf4+fptcIqfuJeznkfGYB2GPa3b3qXk2qq5kwzHyJNtn1zwTkZVp7Qu08O
	KmA==
X-Google-Smtp-Source: AGHT+IFev0i08WnhWXOHYVCiDa8hDSrBgilu3q+XI+BXP7ns5qqyHbYBrSKz+aJVjoCmfpAuiTEXvCWN4KQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:2daa:b0:71e:401:6580 with SMTP id
 d2e1a72fcca58-71e1dbf2587mr27202b3a.6.1728584823552; Thu, 10 Oct 2024
 11:27:03 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:24:04 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-63-seanjc@google.com>
Subject: [PATCH v13 62/85] KVM: PPC: Drop unused @kvm_ro param from kvmppc_book3s_instantiate_page()
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

Drop @kvm_ro from kvmppc_book3s_instantiate_page() as it is now only
written, and never read.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/include/asm/kvm_book3s.h  | 2 +-
 arch/powerpc/kvm/book3s_64_mmu_radix.c | 6 ++----
 arch/powerpc/kvm/book3s_hv_nested.c    | 4 +---
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_book3s.h b/arch/powerpc/include/asm/kvm_book3s.h
index 10618622d7ef..3d289dbe3982 100644
--- a/arch/powerpc/include/asm/kvm_book3s.h
+++ b/arch/powerpc/include/asm/kvm_book3s.h
@@ -203,7 +203,7 @@ extern bool kvmppc_hv_handle_set_rc(struct kvm *kvm, bool nested,
 extern int kvmppc_book3s_instantiate_page(struct kvm_vcpu *vcpu,
 				unsigned long gpa,
 				struct kvm_memory_slot *memslot,
-				bool writing, bool kvm_ro,
+				bool writing,
 				pte_t *inserted_pte, unsigned int *levelp);
 extern int kvmppc_init_vm_radix(struct kvm *kvm);
 extern void kvmppc_free_radix(struct kvm *kvm);
diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index 14891d0a3b73..b3e6e73d6a08 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -821,7 +821,7 @@ bool kvmppc_hv_handle_set_rc(struct kvm *kvm, bool nested, bool writing,
 int kvmppc_book3s_instantiate_page(struct kvm_vcpu *vcpu,
 				   unsigned long gpa,
 				   struct kvm_memory_slot *memslot,
-				   bool writing, bool kvm_ro,
+				   bool writing,
 				   pte_t *inserted_pte, unsigned int *levelp)
 {
 	struct kvm *kvm = vcpu->kvm;
@@ -931,7 +931,6 @@ int kvmppc_book3s_radix_page_fault(struct kvm_vcpu *vcpu,
 	struct kvm_memory_slot *memslot;
 	long ret;
 	bool writing = !!(dsisr & DSISR_ISSTORE);
-	bool kvm_ro = false;
 
 	/* Check for unusual errors */
 	if (dsisr & DSISR_UNSUPP_MMU) {
@@ -984,7 +983,6 @@ int kvmppc_book3s_radix_page_fault(struct kvm_vcpu *vcpu,
 					ea, DSISR_ISSTORE | DSISR_PROTFAULT);
 			return RESUME_GUEST;
 		}
-		kvm_ro = true;
 	}
 
 	/* Failed to set the reference/change bits */
@@ -1002,7 +1000,7 @@ int kvmppc_book3s_radix_page_fault(struct kvm_vcpu *vcpu,
 
 	/* Try to insert a pte */
 	ret = kvmppc_book3s_instantiate_page(vcpu, gpa, memslot, writing,
-					     kvm_ro, NULL, NULL);
+					     NULL, NULL);
 
 	if (ret == 0 || ret == -EAGAIN)
 		ret = RESUME_GUEST;
diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index 05f5220960c6..771173509617 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -1527,7 +1527,6 @@ static long int __kvmhv_nested_page_fault(struct kvm_vcpu *vcpu,
 	unsigned long n_gpa, gpa, gfn, perm = 0UL;
 	unsigned int shift, l1_shift, level;
 	bool writing = !!(dsisr & DSISR_ISSTORE);
-	bool kvm_ro = false;
 	long int ret;
 
 	if (!gp->l1_gr_to_hr) {
@@ -1607,7 +1606,6 @@ static long int __kvmhv_nested_page_fault(struct kvm_vcpu *vcpu,
 					ea, DSISR_ISSTORE | DSISR_PROTFAULT);
 			return RESUME_GUEST;
 		}
-		kvm_ro = true;
 	}
 
 	/* 2. Find the host pte for this L1 guest real address */
@@ -1629,7 +1627,7 @@ static long int __kvmhv_nested_page_fault(struct kvm_vcpu *vcpu,
 	if (!pte_present(pte) || (writing && !(pte_val(pte) & _PAGE_WRITE))) {
 		/* No suitable pte found -> try to insert a mapping */
 		ret = kvmppc_book3s_instantiate_page(vcpu, gpa, memslot,
-					writing, kvm_ro, &pte, &level);
+					writing, &pte, &level);
 		if (ret == -EAGAIN)
 			return RESUME_GUEST;
 		else if (ret)
-- 
2.47.0.rc1.288.g06298d1525-goog


