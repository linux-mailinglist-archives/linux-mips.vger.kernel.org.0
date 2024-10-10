Return-Path: <linux-mips+bounces-5930-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 708A09990B4
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 20:37:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DBEE2814E6
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 18:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65F78200135;
	Thu, 10 Oct 2024 18:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="n3ZB9Hl9"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDEC2010E5
	for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 18:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584771; cv=none; b=ii9LbGdKPbfJ2uHAAJ22iccIXxp9G+VxFS/H9v8yRHX0uu5BM9kQoBaeJT0/z1rrwGLao9d6qmEiYDvLoyRb+fmeKko1c/Sx0tIwPqMHI1oiZMshBUO9w9TiZpuRnGTkjihaGfqdUjx+VUW3+P/Mpz8vIDVYgLYuJuzp/N37o7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584771; c=relaxed/simple;
	bh=FOrzmk+4dQuoAh6BJ51EHAqwvBR4fq2vz5+jTHFfYUI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WQhzcmCd0MH6CyXGKdAU//lNi0d9oXRmJfICnlS5fgoDcu4JxGeZupgfi7yf2V911Fg7/ZCKBifq915oROSbjDZKtBYI5U4RaP5mftz6O/CvHlG/BgdEyPh/NJXeIUWtf7/7UjGsDvqNscSczGoPncOOUWi8FVFvoz+WaSKV+kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=n3ZB9Hl9; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-20c8b0b0736so7708575ad.3
        for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 11:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584769; x=1729189569; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=551DSOChXG5A+yDanUyc1gC1jxg9ryEf27npUXDW1CE=;
        b=n3ZB9Hl9GSMKmEx/lUk3TOxxvmnE72q9Nb6QJN/j4oQK/ZZl7fEE+aU1iTmEyHusGF
         MvskZF7JItYNQUwaksK1w6E2W6vRxUpqG/GQskA591YhhwipexkEwz3mVDnMI35S5jsv
         Y4WSCAtt0cfpUgxFf5UIV/1sPoj+lv6W94JgPBO2jl9ksD7m1Suxh1wAL4H+VTW+S7Pw
         k0Dmcxek3i15MXvGlTyKrDmdYFW9aHLcUrFd1RXD7zqVAp9dLiiN4ZKuzQ+JtjjDKIk+
         B6ODMMAUkUqPGWTVvDQlBjpM7hat/NMris04mBqZ5fLmXqjpagd/DFoKuVvenG/nokos
         h98A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584769; x=1729189569;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=551DSOChXG5A+yDanUyc1gC1jxg9ryEf27npUXDW1CE=;
        b=Cegc58q8KJn+uDTXFISk8xGcZyiFJlUSz84getTLgbVOo0MhmyY2nr5+prno2zrPK4
         O4ep7dy6+Do11Ie3HnbHhvTt7hO1AVLC6wfmR8l+awKaGR/UMxC1nsqqfFrT7x6mdoxR
         QgLyZZiIv6FoxTDXCor5ZoVXPU+iZ3kagdVLymjLGJ133SPYJY5ChrHwowO3TynfSrVS
         srC3/9ewkJo7m2eACzBCfDmjLOIIYXOQPNfvx16xTGGEOsP9ZNlj02g5ae1QFPUQ21M/
         MXIAEperMCzgjjUP72d70LVzIQfZV1rVmkFGHPDAmxvusI2sL//9pbUThBxBRLlS/aKE
         fykA==
X-Forwarded-Encrypted: i=1; AJvYcCVfuDovehgmWUXv9zgocIloBJMTr7yDBHctAIbFmXHYTU/8fSxqT7QfYAfvYtBY4yUnntt3G5TV40BH@vger.kernel.org
X-Gm-Message-State: AOJu0YxY6XvI83qaWDSpAzIK7iOw0X0Xk+HFU8E3VHAhEAXO13dyS3EE
	K1DqUeGs1NfbScj5x5xIXNEgSxQHLiwTW878loXAaUm85/fe5sJcFcRHBTzep/dNkihQBXdhr1W
	XaA==
X-Google-Smtp-Source: AGHT+IGKm7yq47izgr1FmkV+xWCQVhrzT+Qt86SXT8qqzZ7digIfsw6vfVxyVo72E4861BiCHpsXRIV5BzI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:902:e80f:b0:1fa:2ae7:cc6a with SMTP id
 d9443c01a7336-20c63722d7fmr648865ad.4.1728584768900; Thu, 10 Oct 2024
 11:26:08 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:39 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-38-seanjc@google.com>
Subject: [PATCH v13 37/85] KVM: x86/mmu: Add "mmu" prefix fault-in helpers to
 free up generic names
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

Prefix x86's faultin_pfn helpers with "mmu" so that the mmu-less names can
be used by common KVM for similar APIs.

No functional change intended.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c          | 19 ++++++++++---------
 arch/x86/kvm/mmu/mmu_internal.h |  2 +-
 arch/x86/kvm/mmu/paging_tmpl.h  |  2 +-
 3 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 28f2b842d6ca..e451e1b9a55a 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4347,8 +4347,8 @@ static u8 kvm_max_private_mapping_level(struct kvm *k=
vm, kvm_pfn_t pfn,
 	return max_level;
 }
=20
-static int kvm_faultin_pfn_private(struct kvm_vcpu *vcpu,
-				   struct kvm_page_fault *fault)
+static int kvm_mmu_faultin_pfn_private(struct kvm_vcpu *vcpu,
+				       struct kvm_page_fault *fault)
 {
 	int max_order, r;
=20
@@ -4371,10 +4371,11 @@ static int kvm_faultin_pfn_private(struct kvm_vcpu =
*vcpu,
 	return RET_PF_CONTINUE;
 }
=20
-static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault =
*fault)
+static int __kvm_mmu_faultin_pfn(struct kvm_vcpu *vcpu,
+				 struct kvm_page_fault *fault)
 {
 	if (fault->is_private)
-		return kvm_faultin_pfn_private(vcpu, fault);
+		return kvm_mmu_faultin_pfn_private(vcpu, fault);
=20
 	fault->pfn =3D __gfn_to_pfn_memslot(fault->slot, fault->gfn, false, true,
 					  fault->write, &fault->map_writable);
@@ -4409,8 +4410,8 @@ static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, s=
truct kvm_page_fault *fault
 	return RET_PF_CONTINUE;
 }
=20
-static int kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *f=
ault,
-			   unsigned int access)
+static int kvm_mmu_faultin_pfn(struct kvm_vcpu *vcpu,
+			       struct kvm_page_fault *fault, unsigned int access)
 {
 	struct kvm_memory_slot *slot =3D fault->slot;
 	int ret;
@@ -4493,7 +4494,7 @@ static int kvm_faultin_pfn(struct kvm_vcpu *vcpu, str=
uct kvm_page_fault *fault,
 	if (mmu_invalidate_retry_gfn_unsafe(vcpu->kvm, fault->mmu_seq, fault->gfn=
))
 		return RET_PF_RETRY;
=20
-	ret =3D __kvm_faultin_pfn(vcpu, fault);
+	ret =3D __kvm_mmu_faultin_pfn(vcpu, fault);
 	if (ret !=3D RET_PF_CONTINUE)
 		return ret;
=20
@@ -4570,7 +4571,7 @@ static int direct_page_fault(struct kvm_vcpu *vcpu, s=
truct kvm_page_fault *fault
 	if (r)
 		return r;
=20
-	r =3D kvm_faultin_pfn(vcpu, fault, ACC_ALL);
+	r =3D kvm_mmu_faultin_pfn(vcpu, fault, ACC_ALL);
 	if (r !=3D RET_PF_CONTINUE)
 		return r;
=20
@@ -4661,7 +4662,7 @@ static int kvm_tdp_mmu_page_fault(struct kvm_vcpu *vc=
pu,
 	if (r)
 		return r;
=20
-	r =3D kvm_faultin_pfn(vcpu, fault, ACC_ALL);
+	r =3D kvm_mmu_faultin_pfn(vcpu, fault, ACC_ALL);
 	if (r !=3D RET_PF_CONTINUE)
 		return r;
=20
diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_interna=
l.h
index 633aedec3c2e..59e600f6ff9d 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -235,7 +235,7 @@ struct kvm_page_fault {
 	/* The memslot containing gfn. May be NULL. */
 	struct kvm_memory_slot *slot;
=20
-	/* Outputs of kvm_faultin_pfn.  */
+	/* Outputs of kvm_mmu_faultin_pfn().  */
 	unsigned long mmu_seq;
 	kvm_pfn_t pfn;
 	bool map_writable;
diff --git a/arch/x86/kvm/mmu/paging_tmpl.h b/arch/x86/kvm/mmu/paging_tmpl.=
h
index 143b7e9f26dc..9bd3d6f5db91 100644
--- a/arch/x86/kvm/mmu/paging_tmpl.h
+++ b/arch/x86/kvm/mmu/paging_tmpl.h
@@ -812,7 +812,7 @@ static int FNAME(page_fault)(struct kvm_vcpu *vcpu, str=
uct kvm_page_fault *fault
 	if (r)
 		return r;
=20
-	r =3D kvm_faultin_pfn(vcpu, fault, walker.pte_access);
+	r =3D kvm_mmu_faultin_pfn(vcpu, fault, walker.pte_access);
 	if (r !=3D RET_PF_CONTINUE)
 		return r;
=20
--=20
2.47.0.rc1.288.g06298d1525-goog


