Return-Path: <linux-mips+bounces-5972-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 090F199913B
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 20:52:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 857B41F25850
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 18:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 033CE219CA4;
	Thu, 10 Oct 2024 18:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N38MzbV0"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A37219CAC
	for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 18:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584862; cv=none; b=cyeuYxzynZF8Wr2KlZYHL07MGESfmUq3qHWdOHiKrywFBnzqn0Yjnpuy3Bl74VwDMN2YjAmkXdB+WyrU07gHTY3++fGDzSbJyiJTZY8BW74Sfcx8yC76yT0iyRxf+f+UTw3hodeAKgFF8Wf0gc0VO9kXmv36SqM76AhbepBbT7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584862; c=relaxed/simple;
	bh=5AMkvnsvbpt8lQB2/GwTipD8a+sP1HpfiWdIDM6I+Qg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=k0+uSYkcjIWBXBN9SBuQjErd8riRu8NAz4wwUuIM633rGPFLuT8VkSrSMvdlXAiH+le3u5wwtH1FcqBRK1sdoCbuSpjizws/XksJ30e4AtuaixOdjRhRnmO1EhlYYrJTZsc1C+9P2kH7RxLwiR3Qlcv3f76WJylKei7fVMB54OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N38MzbV0; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6e28d223794so23918177b3.0
        for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 11:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584860; x=1729189660; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q1MnEbvSXNK1DBYHKiiPeGTlNBdM3PqCgrnaMRmX38Y=;
        b=N38MzbV0Opg6YS04YGXSDcFzpDbMb+69BxLeF5I/m5HWLMmyQi0t6ZpoTakUKsxG+Y
         x+62Qe6FkM5MXIYUqzR7ZuT5vHKJWIzNuNGguoPNHzQzRheqSS6wmdrvwE+E+IZ22h0E
         s9iPV/7n2nG5SP0RkA+0+K0w1YN5FwNO8br3GqOTRvzCCC4t0JdSc920HAAUmDRsQA+Y
         PwuIw/p9M4ndYcmO76PWt2AyRJmaA5G/ms6keQLf2kLMT2JU3Pns4jgtRATr7ImtkXkA
         jP4B02S0wLHqIbb3wVDpdw/3eyHLn7HPlSOgctNgsdNUTRNyJWcnfufIx/x/sAAhixZ3
         RTkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584860; x=1729189660;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q1MnEbvSXNK1DBYHKiiPeGTlNBdM3PqCgrnaMRmX38Y=;
        b=N1sOeqIKGIyKPAlGrK/O5atUCjYvSQXKlEH5DjDLbmpYinaagee6yKhRuE6IIYEhLQ
         aKAyNcwp7+Zi3ZuEXspLmuBvTLPrpDvZkHupa+Xr1l34vo1Tccb4AxjMlFPvS/5OxEB/
         6DCZ42kG1VQckcW1LgpY6kQtuW5QXhkxUxkNGEwubaBPOFdtijKjCjpXKFrhmk4TtSa1
         RnfaZWAOjmvqf+N4QdoUz4Z79sr6aXk1lAPT4EnQKk0xhj3T9rNUzzgAeKxtdKfPGWKJ
         AXTZ3OPbdGP0Kh4ntby72Tr0lzqFSq5mtJTEhvIAz+58zN2DSvN0NGtikgd21cL7YkY1
         sXRA==
X-Forwarded-Encrypted: i=1; AJvYcCVVb6sxDKH5Vajt6ErO+8NBg4x3r7bpWS5jNSGW9nP3lyhSzT3wtq7NHkYHjQsmZpbkNaCC9j/9C71H@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+1LAZ4eUf68ZU/k7VD3XT7/JboWN7tBBu4RKGD5oNDDg8W2oN
	bK5+wGKZGUM3Cto0mhXMV05XPUNA1JUzeToFk/gGKIeotPxrtsFQ5lNr2HSz1Oi8w3R4exheicE
	2Ow==
X-Google-Smtp-Source: AGHT+IGvHgo281GUU728l2kpqfRNdoQ8M4AtWxtMdwK+Sbd/Nmo7aGxeBXrCmxWS+HWzNnhFIgaVqhxkocM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:f20e:0:b0:e11:5da7:337 with SMTP id
 3f1490d57ef6-e28fe3505c2mr129032276.3.1728584859805; Thu, 10 Oct 2024
 11:27:39 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:24:21 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-80-seanjc@google.com>
Subject: [PATCH v13 79/85] KVM: Drop gfn_to_pfn() APIs now that all users are gone
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

Drop gfn_to_pfn() and all its variants now that all users are gone.

No functional change intended.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h | 11 --------
 virt/kvm/kvm_main.c      | 59 ----------------------------------------
 2 files changed, 70 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index af928b59b2ab..4a1eaa40a215 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1274,14 +1274,6 @@ static inline kvm_pfn_t kvm_faultin_pfn(struct kvm_v=
cpu *vcpu, gfn_t gfn,
 				 write ? FOLL_WRITE : 0, writable, refcounted_page);
 }
=20
-kvm_pfn_t gfn_to_pfn(struct kvm *kvm, gfn_t gfn);
-kvm_pfn_t gfn_to_pfn_prot(struct kvm *kvm, gfn_t gfn, bool write_fault,
-		      bool *writable);
-kvm_pfn_t gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t gfn=
);
-kvm_pfn_t __gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t g=
fn,
-			       bool interruptible, bool no_wait,
-			       bool write_fault, bool *writable);
-
 void kvm_release_pfn_clean(kvm_pfn_t pfn);
 void kvm_release_pfn_dirty(kvm_pfn_t pfn);
 void kvm_set_pfn_dirty(kvm_pfn_t pfn);
@@ -1356,9 +1348,6 @@ unsigned long kvm_host_page_size(struct kvm_vcpu *vcp=
u, gfn_t gfn);
 void mark_page_dirty_in_slot(struct kvm *kvm, const struct kvm_memory_slot=
 *memslot, gfn_t gfn);
 void mark_page_dirty(struct kvm *kvm, gfn_t gfn);
=20
-
-kvm_pfn_t kvm_vcpu_gfn_to_pfn(struct kvm_vcpu *vcpu, gfn_t gfn);
-
 int __kvm_vcpu_map(struct kvm_vcpu *vcpu, gpa_t gpa, struct kvm_host_map *=
map,
 		   bool writable);
 void kvm_vcpu_unmap(struct kvm_vcpu *vcpu, struct kvm_host_map *map);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 8f8b2cd01189..b2c8d429442d 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3039,65 +3039,6 @@ static kvm_pfn_t kvm_follow_pfn(struct kvm_follow_pf=
n *kfp)
 	return hva_to_pfn(kfp);
 }
=20
-kvm_pfn_t __gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t g=
fn,
-			       bool interruptible, bool no_wait,
-			       bool write_fault, bool *writable)
-{
-	struct kvm_follow_pfn kfp =3D {
-		.slot =3D slot,
-		.gfn =3D gfn,
-		.map_writable =3D writable,
-	};
-
-	if (write_fault)
-		kfp.flags |=3D FOLL_WRITE;
-	if (no_wait)
-		kfp.flags |=3D FOLL_NOWAIT;
-	if (interruptible)
-		kfp.flags |=3D FOLL_INTERRUPTIBLE;
-
-	return kvm_follow_pfn(&kfp);
-}
-EXPORT_SYMBOL_GPL(__gfn_to_pfn_memslot);
-
-kvm_pfn_t gfn_to_pfn_prot(struct kvm *kvm, gfn_t gfn, bool write_fault,
-		      bool *writable)
-{
-	struct kvm_follow_pfn kfp =3D {
-		.slot =3D gfn_to_memslot(kvm, gfn),
-		.gfn =3D gfn,
-		.flags =3D write_fault ? FOLL_WRITE : 0,
-		.map_writable =3D writable,
-	};
-
-	return kvm_follow_pfn(&kfp);
-}
-EXPORT_SYMBOL_GPL(gfn_to_pfn_prot);
-
-kvm_pfn_t gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t gfn=
)
-{
-	struct kvm_follow_pfn kfp =3D {
-		.slot =3D slot,
-		.gfn =3D gfn,
-		.flags =3D FOLL_WRITE,
-	};
-
-	return kvm_follow_pfn(&kfp);
-}
-EXPORT_SYMBOL_GPL(gfn_to_pfn_memslot);
-
-kvm_pfn_t gfn_to_pfn(struct kvm *kvm, gfn_t gfn)
-{
-	return gfn_to_pfn_memslot(gfn_to_memslot(kvm, gfn), gfn);
-}
-EXPORT_SYMBOL_GPL(gfn_to_pfn);
-
-kvm_pfn_t kvm_vcpu_gfn_to_pfn(struct kvm_vcpu *vcpu, gfn_t gfn)
-{
-	return gfn_to_pfn_memslot(kvm_vcpu_gfn_to_memslot(vcpu, gfn), gfn);
-}
-EXPORT_SYMBOL_GPL(kvm_vcpu_gfn_to_pfn);
-
 kvm_pfn_t __kvm_faultin_pfn(const struct kvm_memory_slot *slot, gfn_t gfn,
 			    unsigned int foll, bool *writable,
 			    struct page **refcounted_page)
--=20
2.47.0.rc1.288.g06298d1525-goog


