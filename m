Return-Path: <linux-mips+bounces-5976-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A18FB999184
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 21:01:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6A4E0B2A806
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 18:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85EC621C17E;
	Thu, 10 Oct 2024 18:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LR0bZlhg"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE05121BAF3
	for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 18:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584871; cv=none; b=L3Vq5ve3ryLr1zxsgLl2I6TFK/mXeNGjVdYS5y67zSg4UjwCxRmlJG5/3YJpOoVvOJ5QsXq5UjQ064upOAKC07lxp4bbozbNHbt2FgtNvp6ejBDCGkRBhsgnlKzwopBuiyRgbJ4wvXdnTKn1QNU6y+hmyo+O9MRqLCp+4YV3Va4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584871; c=relaxed/simple;
	bh=4ce0ST1uTErGaf3Fu8uQPVTe9dXk8k7UaRtdo8iN0BA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jhROojNrhnLcYadwO8CAdtDqJ+AvnNN8plH5amTn9qNzDdD2k1NiDJt9FCM5gW5Yp8EHVfgRfLRqqGB0cAzHLe6k6GcQ7RqQDGuQAnLBYrPr7kaFPGp1HY8oanWXRFI3zMBH5vo/NOkEnd/ri5GkEFM1fAsIHJDkzfFZ4PzSrN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LR0bZlhg; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-204e310e050so14844495ad.0
        for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 11:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584868; x=1729189668; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qYRk8t9w2U8aQ/ID4AWjouVrA1tdB4hWvcNmB/sB3HQ=;
        b=LR0bZlhgBqqlK/AxVHUnYDgdPVeVfg62ritjsHW4icLlp2VXJMdBEQpqQ2DjaOB4Vo
         BMk5u0CdNiJU47xxEKEBNDUg1VIzyKQFA0lEenO//nWQFutF6qqNsjqYWpd0KkluabCG
         scoWgGmVwMXCV2bJcO3DxVbQdljLpb0S7K+9zHipw5iopVLZ5O/Et9tquTm7UfUH/R3W
         Tzhi8J9rL8rJ6Zw+R2IdaOJPRXvC3k33WFcoS6zAsYYyRLTyXGYrquN21MhPyyOeIlNt
         k76iPpUznp7HqqlLd6wYwP+ZU1DkIHHgVTgrkh+gxlQpcl0jRX8rnB7ytNb8WRs+Wq5s
         9Kuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584868; x=1729189668;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qYRk8t9w2U8aQ/ID4AWjouVrA1tdB4hWvcNmB/sB3HQ=;
        b=MvHUOGaBFgAmhP86700VKYz/6Xzs2nn9pw4O0goOKqh+j3Sxzz2x+uivMiURtu7PwH
         RZGCPWBNdp0Qqtn59hMT0k8B5Bn/FT5yaEohcuP2hQ+F/4l7b40oT541Lnie+ztb27Bg
         J+4nQPPbCqGIWlH+Sg9zZOMcKSdPLTr/oYSqMr4usubnCXdAoteFs9K/yZLBpY02DvhE
         lYXmxYUNPNGkveNyE6brlsB/InDJ/nONkmCupC5nJ5UouAHb6Waaoq2VwLZAxl6rDH+i
         AsKg37XQIgWxMgLPchZPQihdplWUEZZTZUkrpkopiLkmBy6JI9E8TV7uzWqUfGuhWWth
         ctig==
X-Forwarded-Encrypted: i=1; AJvYcCU9OHmfbShHiayGekSxWyXHppJItV9ogJoB+1bEr28GiJKsvERAhvfaGEduibNP7wG/EP9dyJf/OWYw@vger.kernel.org
X-Gm-Message-State: AOJu0YySkQlftrc5zsTL5HmLiL8w2OQQHGrtosfw0Uh81U3AsC7EJH6m
	2vowKFj3e7a9YU7US5hFqq/KkTdt6gzG0HAqWRxCo0tqZjtyBRV0g4LZxE+k5GpyJxd1Me28kC6
	4vA==
X-Google-Smtp-Source: AGHT+IHfwq/leOSDpGNmElHsEevN2NLhktzxL5WWYsNV7s51yqV4fIBatX1NQsHzbv29AfLNcoyCuLVeClM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:902:e745:b0:20c:857b:5dcb with SMTP id
 d9443c01a7336-20c857b62ffmr639275ad.4.1728584868183; Thu, 10 Oct 2024
 11:27:48 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:24:25 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-84-seanjc@google.com>
Subject: [PATCH v13 83/85] KVM: arm64: Don't mark "struct page" accessed when
 making SPTE young
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

Don't mark pages/folios as accessed in the primary MMU when making a SPTE
young in KVM's secondary MMU, as doing so relies on
kvm_pfn_to_refcounted_page(), and generally speaking is unnecessary and
wasteful.  KVM participates in page aging via mmu_notifiers, so there's no
need to push "accessed" updates to the primary MMU.

Dropping use of kvm_set_pfn_accessed() also paves the way for removing
kvm_pfn_to_refcounted_page() and all its users.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/include/asm/kvm_pgtable.h | 4 +---
 arch/arm64/kvm/hyp/pgtable.c         | 7 ++-----
 arch/arm64/kvm/mmu.c                 | 6 +-----
 3 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/=
kvm_pgtable.h
index 03f4c3d7839c..aab04097b505 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -674,10 +674,8 @@ int kvm_pgtable_stage2_wrprotect(struct kvm_pgtable *p=
gt, u64 addr, u64 size);
  *
  * If there is a valid, leaf page-table entry used to translate @addr, the=
n
  * set the access flag in that entry.
- *
- * Return: The old page-table entry prior to setting the flag, 0 on failur=
e.
  */
-kvm_pte_t kvm_pgtable_stage2_mkyoung(struct kvm_pgtable *pgt, u64 addr);
+void kvm_pgtable_stage2_mkyoung(struct kvm_pgtable *pgt, u64 addr);
=20
 /**
  * kvm_pgtable_stage2_test_clear_young() - Test and optionally clear the a=
ccess
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index b11bcebac908..40bd55966540 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -1245,19 +1245,16 @@ int kvm_pgtable_stage2_wrprotect(struct kvm_pgtable=
 *pgt, u64 addr, u64 size)
 					NULL, NULL, 0);
 }
=20
-kvm_pte_t kvm_pgtable_stage2_mkyoung(struct kvm_pgtable *pgt, u64 addr)
+void kvm_pgtable_stage2_mkyoung(struct kvm_pgtable *pgt, u64 addr)
 {
-	kvm_pte_t pte =3D 0;
 	int ret;
=20
 	ret =3D stage2_update_leaf_attrs(pgt, addr, 1, KVM_PTE_LEAF_ATTR_LO_S2_AF=
, 0,
-				       &pte, NULL,
+				       NULL, NULL,
 				       KVM_PGTABLE_WALK_HANDLE_FAULT |
 				       KVM_PGTABLE_WALK_SHARED);
 	if (!ret)
 		dsb(ishst);
-
-	return pte;
 }
=20
 struct stage2_age_data {
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 4054356c9712..e2ae9005e333 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1706,18 +1706,14 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, ph=
ys_addr_t fault_ipa,
 /* Resolve the access fault by making the page young again. */
 static void handle_access_fault(struct kvm_vcpu *vcpu, phys_addr_t fault_i=
pa)
 {
-	kvm_pte_t pte;
 	struct kvm_s2_mmu *mmu;
=20
 	trace_kvm_access_fault(fault_ipa);
=20
 	read_lock(&vcpu->kvm->mmu_lock);
 	mmu =3D vcpu->arch.hw_mmu;
-	pte =3D kvm_pgtable_stage2_mkyoung(mmu->pgt, fault_ipa);
+	kvm_pgtable_stage2_mkyoung(mmu->pgt, fault_ipa);
 	read_unlock(&vcpu->kvm->mmu_lock);
-
-	if (kvm_pte_valid(pte))
-		kvm_set_pfn_accessed(kvm_pte_to_pfn(pte));
 }
=20
 /**
--=20
2.47.0.rc1.288.g06298d1525-goog


