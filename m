Return-Path: <linux-mips+bounces-5919-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E5E99908E
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 20:34:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A59628735E
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 18:34:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F62B1FA266;
	Thu, 10 Oct 2024 18:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="be7NmGNy"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AF21F9A8D
	for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 18:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584750; cv=none; b=L6XbSNki73oCTxhBghPwjB5E0UK39pbY+arRaBnzGGXaeoMztBTmZyuzG8RgygcvqQrsdS/bQsG4FFJH3cQFysidKjxnpVaQt+SeqvA3k2jpaPjMH/wXqhs2Vl4WWLwecoRpZdbG5DxyD3rlfisyDHM2Mazaf8D/tbz5nxh9pCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584750; c=relaxed/simple;
	bh=wQkcrwrrK4R8UDZylZK1jjbxKHOYfzFAR77NBuuXUsk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=m/cs1cyEZlZ0qBRu0ZTl8aUq7515eTnNPdcEOesdqYZoeiczasnsMGJ2ZLdONoyucFF6Yz2JK8HOvDctanyTEO2YFSE8kXjnYQ5eAC0/v/ktgsFqZ6ZxCs1r3kVc6R+wmBIjxj2cVVYrxaq7iFrrd8voIlLxSGx9B5d84taXEBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=be7NmGNy; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2e2ca4fb175so1247940a91.3
        for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 11:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584747; x=1729189547; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/W6JK9yAcorM7mqEFQq2hRBqvFCoz2C4pz3yOEmiGek=;
        b=be7NmGNypoYKlIQHzeI5qmlCcUnBhnj66Rq1h3NtOxbOPwC+w2QWEewadPkTALHHw3
         xPJKAp195KEPkglLi++7I4Q8+YOmOUjNKY8vER3KsZeeMIagBJvsGt5Pobsm74JYsbU6
         LTrXc4Yk9chzFDVCyczjOYxiAQl3ChwlolnTSQxMAaBK84r8sAvRfe70ej1wxuwkkAso
         K642YYl0QtppHrwBVSCdBwaujah/UYJ3uFn3uGnTv6BDtvRNYAJCNnt+vptRV4XD1YyB
         zB9Nu1ry3UFXALvaKzFf8mG173wYfV1cR9LVTLoNYadPVMufgcCdJQL3tQsG1XncstE1
         EjmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584747; x=1729189547;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/W6JK9yAcorM7mqEFQq2hRBqvFCoz2C4pz3yOEmiGek=;
        b=KzKAdiUmlPVxK2rh1kMYw+ZTfr4lf/hGb4u9zn+iir89AgVX0lK2IK3AEXImFKSSSD
         eRtjHjHNO2BRHW+bW9j2g6uexO2T4VquNGksGGBrPxbp75FcSifPrhOkRgo7ArArr9yV
         WUBMuSB5QC28wGo2X7g5Lp/e9iLYp+frIPlIeITOuvcOj+m9ELifl0A/r15/H8rROlOh
         DD3p26vuph+gN9jUVxubvedv+b7BmZExgoZI2pCF1oShQnZuCRBhnG15oteUFyay9fhX
         k+pWNGCuN3hUuk46Gjxo5V8WdVay23uXPzZ8QiHDr8AxQI+Ihmi0e5NgLWn319WJL1Pv
         U97A==
X-Forwarded-Encrypted: i=1; AJvYcCWTLMo60nLEni7tcZmMS2stVvU2GYK71O55ovR9vpUb/JSyxZLyX99qk5E4VmyXMZgoZAwiZclx02FR@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz2Vi4/gl4PmPrHGIhuF/N22o/lwaKFCV53puLm1vbSiX9GkUy
	xEHS2LGYTEBUnO0G4xXSQcw1tWadtNXPnW5SS682WOcA1wOiFUk8MbnHUdysZnwMDSAiIuvucDr
	ZCg==
X-Google-Smtp-Source: AGHT+IFGWHaFUEsQRxn4rcRWabj8vzxqpLHdNOXqOmiiQlX4dD6MZqF5BpShV2hVfQIOX/PTyNMVtEMSya8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:90a:9a94:b0:2e2:da81:40c1 with SMTP id
 98e67ed59e1d1-2e2f09f2280mr109a91.1.1728584746508; Thu, 10 Oct 2024 11:25:46
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:28 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-27-seanjc@google.com>
Subject: [PATCH v13 26/85] KVM: Use plain "struct page" pointer instead of
 single-entry array
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

Use a single pointer instead of a single-entry array for the struct page
pointer in hva_to_pfn_fast().  Using an array makes the code unnecessarily
annoying to read and update.

No functional change intended.

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 7acb1a8af2e4..d3e48fcc4fb0 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2752,7 +2752,7 @@ unsigned long kvm_vcpu_gfn_to_hva_prot(struct kvm_vcp=
u *vcpu, gfn_t gfn, bool *w
  */
 static bool hva_to_pfn_fast(struct kvm_follow_pfn *kfp, kvm_pfn_t *pfn)
 {
-	struct page *page[1];
+	struct page *page;
=20
 	/*
 	 * Fast pin a writable pfn only if it is a write fault request
@@ -2762,8 +2762,8 @@ static bool hva_to_pfn_fast(struct kvm_follow_pfn *kf=
p, kvm_pfn_t *pfn)
 	if (!((kfp->flags & FOLL_WRITE) || kfp->map_writable))
 		return false;
=20
-	if (get_user_page_fast_only(kfp->hva, FOLL_WRITE, page)) {
-		*pfn =3D page_to_pfn(page[0]);
+	if (get_user_page_fast_only(kfp->hva, FOLL_WRITE, &page)) {
+		*pfn =3D page_to_pfn(page);
 		if (kfp->map_writable)
 			*kfp->map_writable =3D true;
 		return true;
--=20
2.47.0.rc1.288.g06298d1525-goog


