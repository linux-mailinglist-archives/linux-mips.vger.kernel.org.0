Return-Path: <linux-mips+bounces-5968-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD6F999134
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 20:50:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19121287893
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 18:50:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D1AF216435;
	Thu, 10 Oct 2024 18:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kkhtwVA3"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF14217332
	for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 18:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584853; cv=none; b=b0pYlCmbiZ2j3poNVmc26cKgnaZX8l5PC0kdFy5esvMIU5ok2zvCRS/jwvp7HGvIBe3RK1oKuzjAfqFCe72qMl5lK30TyN1+jFOygdsTonnhucqrQnmnv0s9MpSOtF5w2pGx4xEkK/dElxF4Y+cEztzBUkMATYpaTDVofg7rhzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584853; c=relaxed/simple;
	bh=6VFC6ZQ3q9XjUbMWhh1JwxOVsy5FNZVXQFKK9OKSZCE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=raM/Wy5zWfZPTi/8+lTWw+kYLGtT+usVoxdh4KoRyaNvu+OUQgYdDi56rbYRiHQpTwhmka+mEqi7D8j7cKiXYqLT1oMmK8dyjOzUpIlLOPcRZNtuQX8rP5b5YJrjdGNNgFN28Dhrxi7lYPHyzYQarT0+XC5fRxto4sEh3lDsZdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kkhtwVA3; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-71e123d3d22so1429798b3a.3
        for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 11:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584852; x=1729189652; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fZpnWf51XalE5JTpUzeqj9xBy85lPuBTlHLH/3crpzM=;
        b=kkhtwVA371S5ZHAeHS4k3XRilYdB/vGzQgltlsRLi0pp7zBjZNHvtNTHMuvtzL7CAF
         6lNYOD3BDWvBSZ9L0rmgwIlueXDyhW/RA5LQ0k9HKGrI7aQrISXXF0UVGv1X7QGYXfmX
         nQAjpUZF9ow0QYSRFnzZERqDxBCGJILWB6bbaaxW+qU5NHSMCV90Jig9BhxHgjAoV1za
         TIvRad+uoWgS/qyZB0Ga3oI/+RuGbJNOcXT3YNU2DEx7phcpFbVb8mMgls/S1lDHVstd
         CsKALT5sXHk1JsYmc6mHfOyTLTtTo+ZkddLgoeZS9J57GTp1PUXVbgGiI+DyyF4UdFku
         wG3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584852; x=1729189652;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fZpnWf51XalE5JTpUzeqj9xBy85lPuBTlHLH/3crpzM=;
        b=ufyy4LJ+l8RY60ygY+UBMB1t7nnLPt/I+Zgst/w1o1yqPiFYzMbQlzZBmca8+Jo/X6
         8ym5aqtT2Vwzrj7JadZGN5/L1M3taNIPwERriC6Kdb7rQAgRJhOOAoZ/jPBrJWWzhGvv
         iQPc4AUR9bc4v756xStFQ3Z958ymVGauoaLWBRhJ7kOKo0vylin2V7r0umn2MaMR5/5o
         Lc0BH3nwlP9ss3MfCOjxVJFeGlDGA7jqKdGfAI8v+vlHFvm0gA04lNbmpFBdvsdRT16W
         iV8CAVNoPWN+2hcYct/DWcOZ/kU9EU7VxqICRAkvK4Q9fricZB8TFIN57RBANk7EIGCp
         Aacw==
X-Forwarded-Encrypted: i=1; AJvYcCXq+SLrvPjZgxvJZoJntNyUMk5kl3WnW6eYNx1SfIhODmXCSNNkxrF8WuiEhYN9FHz34BI8hDtL7vlf@vger.kernel.org
X-Gm-Message-State: AOJu0YylluD2j0vbqK1RrnG+2M3InrVFemJsYwS0Jszbg/14I45hsba2
	05ydqBHE0Grb62Tas7CeAnQTH3vyYONtHPYJJHWLlP+jGah34iywPM7U9g+nS+5EnBjYZYMJ0PX
	idw==
X-Google-Smtp-Source: AGHT+IHVUYgAS8Gi1OfHaumBjOVs/68U//Xc3NGlK2wEye9l2w1SuCdDQ/WQfsMbBzqgGqsCESzcy3AUxv4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:aa7:93b4:0:b0:71d:f64d:712c with SMTP id
 d2e1a72fcca58-71e1db65a16mr7365b3a.1.1728584851459; Thu, 10 Oct 2024 11:27:31
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:24:17 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-76-seanjc@google.com>
Subject: [PATCH v13 75/85] KVM: Convert gfn_to_page() to use kvm_follow_pfn()
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

Convert gfn_to_page() to the new kvm_follow_pfn() internal API, which will
eventually allow removing gfn_to_pfn() and kvm_pfn_to_refcounted_page().

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 696d5e429b3e..1782242a4800 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3145,14 +3145,16 @@ EXPORT_SYMBOL_GPL(kvm_prefetch_pages);
  */
 struct page *gfn_to_page(struct kvm *kvm, gfn_t gfn)
 {
-	kvm_pfn_t pfn;
+	struct page *refcounted_page =3D NULL;
+	struct kvm_follow_pfn kfp =3D {
+		.slot =3D gfn_to_memslot(kvm, gfn),
+		.gfn =3D gfn,
+		.flags =3D FOLL_WRITE,
+		.refcounted_page =3D &refcounted_page,
+	};
=20
-	pfn =3D gfn_to_pfn(kvm, gfn);
-
-	if (is_error_noslot_pfn(pfn))
-		return NULL;
-
-	return kvm_pfn_to_refcounted_page(pfn);
+	(void)kvm_follow_pfn(&kfp);
+	return refcounted_page;
 }
 EXPORT_SYMBOL_GPL(gfn_to_page);
=20
--=20
2.47.0.rc1.288.g06298d1525-goog


