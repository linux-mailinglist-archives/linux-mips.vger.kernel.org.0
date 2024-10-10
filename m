Return-Path: <linux-mips+bounces-5939-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABFB9990D2
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 20:40:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A14D2886F3
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 18:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C471204F90;
	Thu, 10 Oct 2024 18:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fpNaofRE"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9755E204953
	for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 18:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584791; cv=none; b=L2HCiD4YXwShvvdSCyS6B/ryGdGgV1ojyMnVCeEfYWEW51EfSfnHA1SCa6OechmP4CQo0/me8+u6BIozJu+oD010fVVWPZ7JQaComWXVkcse5Wr7mE0xv2ViyKlTWj8RWBlUlEZwgCarkj1bsI3EPSUFnMy7CwpG/RQh5jPBtfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584791; c=relaxed/simple;
	bh=bZ2ermi+i+GlJV3rIdZ7irm2X1sw1usJ5ghB+vq7WnM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Jes9LIG15mftsdbWr/cNFjQCMZH1whZYhaX9AIePXzXPdSjmqILSmge5/dj0hqF+xG4BC4gwEja7H/FqMSQgUL2y4FUEqYQ1VbyOlkijBgHAue/javK96Ngf0VW8EI+Aw5GwcvPNEcaJD0yzXBGl71VXd2jNnb9kI7mcxUDciWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fpNaofRE; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6e28d223794so23890077b3.0
        for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 11:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584789; x=1729189589; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/DfuS3cqNKQbdjipc1jp6gNPynmr8H/oDbYVrbrij3Q=;
        b=fpNaofRERnQsVJWoNEKh/7Nowa8mnaYcBTqm4xvL96gZzqD0HTZnR8uv/7QUn44Mug
         vEiJev1UgG+mhZqqAgsDxOJvxhY9x3JDP2NQGvFiuEvxX24RgTLILDckgh/2qq6X3KtK
         6Dc37IioCu1GchTrprfk2zvXU/JJTKtdXYop7F8ngmHmgB8Ds7A6py1mzGRTvBuh1e5v
         +tZ5qSEUmDv46Q7aijpywSEqaqKx6/E4e0UoBTUqX5sTdpf4Hd3zgayPbargNUbcalP/
         ZD1NEvP7da5EwZ7MewAiUiFrQgpkfzQgUoU9SYS7aXy/Ax2P3Iv3RNqnAhJDoCKcHA5A
         WlSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584789; x=1729189589;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/DfuS3cqNKQbdjipc1jp6gNPynmr8H/oDbYVrbrij3Q=;
        b=aWoKjiJsVlG1JU23EQRnNwSItbXWbWZXgt+XCQfaP1gEUbwkfIbgtl8zHSIchcuMu6
         qCyKi+eIpY+6Me/ofrmkgFCtNVgMXcZrxIC2umh4KYwrB6NRaCCzgD7EYFouhSN6ryzS
         te15KxcSnF1ymo79fNviNWByika5gATSsYJx5dwIZRLZppGBcjmeBNVnlDWK9ajAY3r5
         Oxoxf9Yn0NB9xDZXOPO1ogxfxnwwrzATZZoKBjoES8EjxjTfvsT7L3ZMFpwVNk2YVeqR
         fOvC4zip/gm1bpyo1lnf+IxdhflNwZ/duktrYjkej+53Fiy4ldVioklBm/9PFCGzRYvl
         rVLw==
X-Forwarded-Encrypted: i=1; AJvYcCUfcWaDZ7xooopiv3Euh3D8yIAP3I17tzN62d4pzNkxCvsTRkqwuSe3VMZzW6TYROEIQATNKUvbZZIN@vger.kernel.org
X-Gm-Message-State: AOJu0YytuTQyWAz6rBIeLXpSdfuvtMxR/710QzQtz/pHFc5szAUKLIZ7
	pDS7GUhfjRj5jC2lUafwYyCDceyvA2QL+Lg5MEOMsoKB8U548U6H9paE1udNl+n9dqWgisU1eRH
	+ig==
X-Google-Smtp-Source: AGHT+IHLQFn8WLOIHu4PHZ3K+TrLKBMF9JlmWl30kTXK43TD90b+TNbg3ZepRFQQdmJeel5bU/EhDzobpdQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:b191:0:b0:e1f:eaf1:2254 with SMTP id
 3f1490d57ef6-e28fe41acaamr82536276.8.1728584788687; Thu, 10 Oct 2024 11:26:28
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:48 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-47-seanjc@google.com>
Subject: [PATCH v13 46/85] KVM: guest_memfd: Provide "struct page" as output
 from kvm_gmem_get_pfn()
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

Provide the "struct page" associated with a guest_memfd pfn as an output
from __kvm_gmem_get_pfn() so that KVM guest page fault handlers can
directly put the page instead of having to rely on
kvm_pfn_to_refcounted_page().

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c   |  2 +-
 arch/x86/kvm/svm/sev.c   | 10 ++++++----
 include/linux/kvm_host.h |  6 ++++--
 virt/kvm/guest_memfd.c   |  8 ++++++--
 4 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 2e2076287aaf..a038cde74f0d 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4400,7 +4400,7 @@ static int kvm_mmu_faultin_pfn_private(struct kvm_vcp=
u *vcpu,
 	}
=20
 	r =3D kvm_gmem_get_pfn(vcpu->kvm, fault->slot, fault->gfn, &fault->pfn,
-			     &max_order);
+			     &fault->refcounted_page, &max_order);
 	if (r) {
 		kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
 		return r;
diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index 4557ff3804ae..c6c852485900 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -3849,6 +3849,7 @@ static int __sev_snp_update_protected_guest_state(str=
uct kvm_vcpu *vcpu)
 	if (VALID_PAGE(svm->sev_es.snp_vmsa_gpa)) {
 		gfn_t gfn =3D gpa_to_gfn(svm->sev_es.snp_vmsa_gpa);
 		struct kvm_memory_slot *slot;
+		struct page *page;
 		kvm_pfn_t pfn;
=20
 		slot =3D gfn_to_memslot(vcpu->kvm, gfn);
@@ -3859,7 +3860,7 @@ static int __sev_snp_update_protected_guest_state(str=
uct kvm_vcpu *vcpu)
 		 * The new VMSA will be private memory guest memory, so
 		 * retrieve the PFN from the gmem backend.
 		 */
-		if (kvm_gmem_get_pfn(vcpu->kvm, slot, gfn, &pfn, NULL))
+		if (kvm_gmem_get_pfn(vcpu->kvm, slot, gfn, &pfn, &page, NULL))
 			return -EINVAL;
=20
 		/*
@@ -3888,7 +3889,7 @@ static int __sev_snp_update_protected_guest_state(str=
uct kvm_vcpu *vcpu)
 		 * changes then care should be taken to ensure
 		 * svm->sev_es.vmsa is pinned through some other means.
 		 */
-		kvm_release_pfn_clean(pfn);
+		kvm_release_page_clean(page);
 	}
=20
 	/*
@@ -4688,6 +4689,7 @@ void sev_handle_rmp_fault(struct kvm_vcpu *vcpu, gpa_=
t gpa, u64 error_code)
 	struct kvm_memory_slot *slot;
 	struct kvm *kvm =3D vcpu->kvm;
 	int order, rmp_level, ret;
+	struct page *page;
 	bool assigned;
 	kvm_pfn_t pfn;
 	gfn_t gfn;
@@ -4714,7 +4716,7 @@ void sev_handle_rmp_fault(struct kvm_vcpu *vcpu, gpa_=
t gpa, u64 error_code)
 		return;
 	}
=20
-	ret =3D kvm_gmem_get_pfn(kvm, slot, gfn, &pfn, &order);
+	ret =3D kvm_gmem_get_pfn(kvm, slot, gfn, &pfn, &page, &order);
 	if (ret) {
 		pr_warn_ratelimited("SEV: Unexpected RMP fault, no backing page for priv=
ate GPA 0x%llx\n",
 				    gpa);
@@ -4772,7 +4774,7 @@ void sev_handle_rmp_fault(struct kvm_vcpu *vcpu, gpa_=
t gpa, u64 error_code)
 out:
 	trace_kvm_rmp_fault(vcpu, gpa, pfn, error_code, rmp_level, ret);
 out_no_trace:
-	put_page(pfn_to_page(pfn));
+	kvm_release_page_unused(page);
 }
=20
 static bool is_pfn_range_shared(kvm_pfn_t start, kvm_pfn_t end)
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 3b9afb40e935..504483d35197 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2490,11 +2490,13 @@ static inline bool kvm_mem_is_private(struct kvm *k=
vm, gfn_t gfn)
=20
 #ifdef CONFIG_KVM_PRIVATE_MEM
 int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
-		     gfn_t gfn, kvm_pfn_t *pfn, int *max_order);
+		     gfn_t gfn, kvm_pfn_t *pfn, struct page **page,
+		     int *max_order);
 #else
 static inline int kvm_gmem_get_pfn(struct kvm *kvm,
 				   struct kvm_memory_slot *slot, gfn_t gfn,
-				   kvm_pfn_t *pfn, int *max_order)
+				   kvm_pfn_t *pfn, struct page **page,
+				   int *max_order)
 {
 	KVM_BUG_ON(1, kvm);
 	return -EIO;
diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 8a878e57c5d4..47a9f68f7b24 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -594,7 +594,8 @@ static struct folio *__kvm_gmem_get_pfn(struct file *fi=
le,
 }
=20
 int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
-		     gfn_t gfn, kvm_pfn_t *pfn, int *max_order)
+		     gfn_t gfn, kvm_pfn_t *pfn, struct page **page,
+		     int *max_order)
 {
 	pgoff_t index =3D kvm_gmem_get_index(slot, gfn);
 	struct file *file =3D kvm_gmem_get_file(slot);
@@ -615,7 +616,10 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memor=
y_slot *slot,
 		r =3D kvm_gmem_prepare_folio(kvm, slot, gfn, folio);
=20
 	folio_unlock(folio);
-	if (r < 0)
+
+	if (!r)
+		*page =3D folio_file_page(folio, index);
+	else
 		folio_put(folio);
=20
 out:
--=20
2.47.0.rc1.288.g06298d1525-goog


