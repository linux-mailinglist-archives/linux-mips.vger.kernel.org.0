Return-Path: <linux-mips+bounces-4608-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D95943414
	for <lists+linux-mips@lfdr.de>; Wed, 31 Jul 2024 18:23:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9463D1F21EFE
	for <lists+linux-mips@lfdr.de>; Wed, 31 Jul 2024 16:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C97D41BBBE2;
	Wed, 31 Jul 2024 16:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="biJfHcwA"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090541B581B
	for <linux-mips@vger.kernel.org>; Wed, 31 Jul 2024 16:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722443019; cv=none; b=Z5gXm9zbkSiksXhry5NUGsMh1DlB2JF/rIx/wz2fXLNs6eMW9xYIZ+a9ybj++RaD1TvgRBgeW0P6rCbOtYPzjC1GHAH5MSLXa4rxcGSGPydRgtCimaBmsQyZMWkn4bJgmGNrk4fqW/asCnBM+7QPc4cPeajVqtbhJY46knGGTp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722443019; c=relaxed/simple;
	bh=2HhUeVKAqujM6tGjz7xY7eoGDJF2k6V8JCfwVRNXp0M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IW1Kms2oZ05VV8tnBExSJibeoO183gzhbOxz0qaxmu9kl4dsy8ab9SQFb+bJW6Zgi/GdfKaXBdldI+QE5POYndM8Q2u881Q8I/SdMBMwlAYpjT1vcLWZ2V3gLNoLPZH7IW9Sj5ifN3Iwgo8rq1+WTCTO7seMiWgZO3zwtDXploM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=biJfHcwA; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a7a8553db90so813460566b.2
        for <linux-mips@vger.kernel.org>; Wed, 31 Jul 2024 09:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722443016; x=1723047816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Jy3Eo6Gu+vhJFsd2nEOfkihTm91GOS2uDXcn/bR1Cs=;
        b=biJfHcwAcXl5q7WHRKuHuTlJpEVNHd/ETzyt8bdMQqx09kSVQdUbzlc84RSDJs1FGO
         fJ7i/T87Q6CA7d7D5Y22ilGEhOMdOd9CpUn3uYrwX52tZX1fEuvndacJiVMJEpnOhF8h
         JseXeFiC4wl6gSoHQBOwzW4q6AKC3NoZfZYzKx7zGNJdUTt84uKxeTxSBSEefzAr2ECB
         /hCxo75bYp+vx7zEWp2qyBMA9yU0ewUx8QuQiQUSJ6qR1NhQUjjtL8Ac/ajeVk1fMWtF
         +bhPybB6eQCsjIk2Yq33QlZSICOC40hdNK1Sj4hXSv8ySBLljNr6crzZpXZhY2/vK4nl
         nrDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722443016; x=1723047816;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Jy3Eo6Gu+vhJFsd2nEOfkihTm91GOS2uDXcn/bR1Cs=;
        b=QK/X6ThxBQkwAb25pYht6Gm9SA9B8LzwWZfUtWPHnOJAO7BswhgvaTB2wMcfaZo+GE
         v756LjUlx5dmdh1Q6v0Ls5AcZNtEpeOIMyRAFsCpE386O2tuuwVcljYOCdddcXG9i2kz
         SkAqQd5ryL9D1kEX4GSZYedrLKHBQrTbm31wY0GhULd3F+8e4R5JLrIXXdSxvqUOXwRx
         BhuUehrihMvmX11NsoCP2sF+rQUQRYhS7vznniyh53NTohtUb96rOEZdYP7Wh5HPBKmk
         x2+HyX3QmdQODtRNacP7XfthC7uS7n69/CxByZQcWMFpKDDXfV5BHFCiGiowlOqfKzPF
         EQtA==
X-Forwarded-Encrypted: i=1; AJvYcCVwpNVVbCOzZdNqRVDYCxGk94pv8RrKzZ9QadBW++bBKzG8vc7lAoK2VyAx4z6f7o/ADEjnph10QOWWsyzPVj5WbWTjlJb1Z4Jicg==
X-Gm-Message-State: AOJu0Yz1o2Wi5vbDBZdnihiveRcdx7/O5ycBtjABosbTeYxwOGQiGRQd
	VC4vgSfn4wqJ8rnjfLPyXygzK0hk7JRsmg3lzBSLA1ibidm7DjIHCWAFns0QCc4=
X-Google-Smtp-Source: AGHT+IFaeuLsqXvHIvwNkMOmXQ/kk95KnaHAVzfZZFY2rJSwrdZANzuSfUeE19U50MBeGB1J/TbUHg==
X-Received: by 2002:a17:907:a0d5:b0:a7a:b070:92c6 with SMTP id a640c23a62f3a-a7d40116a4bmr801926666b.50.1722443015967;
        Wed, 31 Jul 2024 09:23:35 -0700 (PDT)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acad416basm784769266b.104.2024.07.31.09.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 09:23:35 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 614DC5F8CB;
	Wed, 31 Jul 2024 17:23:34 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,  Marc Zyngier <maz@kernel.org>,
  Oliver Upton <oliver.upton@linux.dev>,  Tianrui Zhao
 <zhaotianrui@loongson.cn>,  Bibo Mao <maobibo@loongson.cn>,  Huacai Chen
 <chenhuacai@kernel.org>,  Michael Ellerman <mpe@ellerman.id.au>,  Anup
 Patel <anup@brainfault.org>,  Paul Walmsley <paul.walmsley@sifive.com>,
  Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou <aou@eecs.berkeley.edu>,
  Christian Borntraeger <borntraeger@linux.ibm.com>,  Janosch Frank
 <frankja@linux.ibm.com>,  Claudio Imbrenda <imbrenda@linux.ibm.com>,
  kvm@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  kvmarm@lists.linux.dev,  loongarch@lists.linux.dev,
  linux-mips@vger.kernel.org,  linuxppc-dev@lists.ozlabs.org,
  kvm-riscv@lists.infradead.org,  linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org,  David Matlack <dmatlack@google.com>,
  David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v12 01/84] KVM: arm64: Release pfn, i.e. put page, if
 copying MTE tags hits ZONE_DEVICE
In-Reply-To: <20240726235234.228822-2-seanjc@google.com> (Sean
	Christopherson's message of "Fri, 26 Jul 2024 16:51:10 -0700")
References: <20240726235234.228822-1-seanjc@google.com>
	<20240726235234.228822-2-seanjc@google.com>
Date: Wed, 31 Jul 2024 17:23:34 +0100
Message-ID: <87a5hxfs3d.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Sean Christopherson <seanjc@google.com> writes:

> Put the page reference acquired by gfn_to_pfn_prot() if
> kvm_vm_ioctl_mte_copy_tags() runs into ZONE_DEVICE memory.  KVM's less-
> than-stellar heuristics for dealing with pfn-mapped memory means that KVM
> can get a page reference to ZONE_DEVICE memory.
>
> Fixes: f0376edb1ddc ("KVM: arm64: Add ioctl to fetch/store tags in a gues=
t")
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/arm64/kvm/guest.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> index 11098eb7eb44..e1f0ff08836a 100644
> --- a/arch/arm64/kvm/guest.c
> +++ b/arch/arm64/kvm/guest.c
> @@ -1059,6 +1059,7 @@ int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
>  		page =3D pfn_to_online_page(pfn);
>  		if (!page) {
>  			/* Reject ZONE_DEVICE memory */
> +			kvm_release_pfn_clean(pfn);

I guess this gets renamed later in the series.

However my main comment is does lack of page always mean a ZONE_DEVICE?
Looking at pfn_to_online_page() I see a bunch of other checks first. Why
isn't it that functions responsibility to clean up after itself if its
returning NULLs?

>  			ret =3D -EFAULT;
>  			goto out;
>  		}

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

