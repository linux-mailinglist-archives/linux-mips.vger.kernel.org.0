Return-Path: <linux-mips+bounces-5970-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B38999137
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 20:50:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 695C22826A9
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 18:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5B78218D9E;
	Thu, 10 Oct 2024 18:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yE9BBZab"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53344218D8D
	for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 18:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584857; cv=none; b=qkiGD/+Slwp5INap0S7yA8Jb66f0n6TqcVyQaoAnwb5ZBxV+IwoSRIDJo19iD826N2Mibr7mKVTkOvOSAZo9yEnS1ztEqbvc+b2ItD2TLWPiRM7q7Rp9WKxWRYvbt+tjTUyG1JWS/JWot9LP6kluFyC1zER+5JenX3H3KnX5AKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584857; c=relaxed/simple;
	bh=FErwCaq8NdcoMJPhpWM/50ZCDjLg7qNPTjMbO8/YuvM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ml2CcDCsxePFOj40sLvTuJo/I+EMBo2oPqxAj3L90dOb2oUs0j5U2RsaL+necUUJaIDULrJdA1FJuUCdlvG8mIO5rnUOidpVfRpDhBULjH3haX7I+e0eevm/t3xawCM9b2g/6H4niV/dKhEG0cCwO4/Uuzsud4yZk9vaAuJ7mZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yE9BBZab; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-7e9fe0a21a7so1029416a12.3
        for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 11:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584856; x=1729189656; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=04eHUk6AClz9cRMQcjlWjE46ZR1uXceY2ogFB00LGDM=;
        b=yE9BBZabvoeIqzV8CVJHKuzxLfL2NYkYVtIdFaPw/BUSfPofvy1yEt9sV7egKYCr6h
         ECdzuEmt/3ij7vj98XqRqiNePbTZy3r1+KnoPq0Y9I3SWy9nfiSrfM3+HN5Tt1cuMsMe
         P5BqP8mEprGZtOyicY4QMcSjOoZuBJSucYO3xKIILjywU8h/g9JRWiGzdULPCY/h7RrW
         gs/lx0IgmUkEs0f46fCv0eA4nTg5+x1s07DF9AqCC/d91Tc45agqIYRUIW48yJgViOz+
         6RSp5Afamp+TyeZzsa3QwnWcskOkhHtKwtjtk2jBDyPhGpbSYoTMcCOFE9DIiSVIltMb
         h9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584856; x=1729189656;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=04eHUk6AClz9cRMQcjlWjE46ZR1uXceY2ogFB00LGDM=;
        b=WmwQPwKubqXXrASZKNCoQVnliM+FmTm0mJjfPbSYaxjkj+33lx4oKmCAokzlviqyoe
         X8eiTeM12RLFQ8XMKPCdAoFGrkJ3lXu3/qRTJ1oJ7hYLF8Z+UXHSaD0IrAXovNbEPCwm
         v99sdmWKvVV7SW33IxK8UC0Y6dW9QJiVEUG81Ws3QG6fCy7Z9FfLxbz04tYwRgQmt7vz
         iCusbIoj/1YUPUL2rJprWLdJQJu/VYVjrMrWQwF9+WKYooTT4nJB0JU5rvzgIDX/QCFv
         XF7H2Qz1mFcz9WPcvPVIwppNOEcEoAu/rIeO+DOT4+A3ouvlNTjCAcyKBoHWrCSrWeBp
         XnCg==
X-Forwarded-Encrypted: i=1; AJvYcCVajwC7yGehds9sGuIlG8B31ZLXTsiW1p0LEOeLyz1H8jkU7cvzt5X4ojvAgeK8LnDvkwcuIgdeI6tW@vger.kernel.org
X-Gm-Message-State: AOJu0Yz31AVB34KCToTDleCtGwNyn5zGkbsdSSauH1rszwCFHnwdrNLq
	WD20mZF2HFpgu5lAowEPrUytAk6RhnR+9LhxMQ43JjoStQEod/T7PjUzGXqYpl/c+DHJ4CInMAR
	0SA==
X-Google-Smtp-Source: AGHT+IHGiwNd3UbnZUzPre1tk98dNYoM10q7gFGG4lq0PldsJuDm1rxMHI+g8Yc3UsVnmkzWnOurUMFmqIQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:903:41c4:b0:20c:8f78:67c9 with SMTP id
 d9443c01a7336-20c8f786946mr26385ad.5.1728584855618; Thu, 10 Oct 2024 11:27:35
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:24:19 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-78-seanjc@google.com>
Subject: [PATCH v13 77/85] KVM: arm64: Use __gfn_to_page() when copying MTE
 tags to/from userspace
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

Use __gfn_to_page() instead when copying MTE tags between guest and
userspace.  This will eventually allow removing gfn_to_pfn_prot(),
gfn_to_pfn(), kvm_pfn_to_refcounted_page(), and related APIs.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/guest.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index 962f985977c2..4cd7ffa76794 100644
--- a/arch/arm64/kvm/guest.c
+++ b/arch/arm64/kvm/guest.c
@@ -1051,20 +1051,18 @@ int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
 	}
=20
 	while (length > 0) {
-		kvm_pfn_t pfn =3D gfn_to_pfn_prot(kvm, gfn, write, NULL);
+		struct page *page =3D __gfn_to_page(kvm, gfn, write);
 		void *maddr;
 		unsigned long num_tags;
-		struct page *page;
=20
-		if (is_error_noslot_pfn(pfn)) {
-			ret =3D -EFAULT;
-			goto out;
-		}
-
-		page =3D pfn_to_online_page(pfn);
 		if (!page) {
+			ret =3D -EFAULT;
+			goto out;
+		}
+
+		if (!pfn_to_online_page(page_to_pfn(page))) {
 			/* Reject ZONE_DEVICE memory */
-			kvm_release_pfn_clean(pfn);
+			kvm_release_page_unused(page);
 			ret =3D -EFAULT;
 			goto out;
 		}
@@ -1078,7 +1076,7 @@ int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
 				/* No tags in memory, so write zeros */
 				num_tags =3D MTE_GRANULES_PER_PAGE -
 					clear_user(tags, MTE_GRANULES_PER_PAGE);
-			kvm_release_pfn_clean(pfn);
+			kvm_release_page_clean(page);
 		} else {
 			/*
 			 * Only locking to serialise with a concurrent
@@ -1093,8 +1091,7 @@ int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
 			if (num_tags !=3D MTE_GRANULES_PER_PAGE)
 				mte_clear_page_tags(maddr);
 			set_page_mte_tagged(page);
-
-			kvm_release_pfn_dirty(pfn);
+			kvm_release_page_dirty(page);
 		}
=20
 		if (num_tags !=3D MTE_GRANULES_PER_PAGE) {
--=20
2.47.0.rc1.288.g06298d1525-goog


