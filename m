Return-Path: <linux-mips+bounces-4646-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A787944820
	for <lists+linux-mips@lfdr.de>; Thu,  1 Aug 2024 11:25:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8662B28754
	for <lists+linux-mips@lfdr.de>; Thu,  1 Aug 2024 09:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2475F1A00DA;
	Thu,  1 Aug 2024 09:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DGajlqK0"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379EC189B87
	for <linux-mips@vger.kernel.org>; Thu,  1 Aug 2024 09:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722504068; cv=none; b=qDThVwU0dEne6Z/MR2kk0fv5ZpXYflawdoCfxbsrG/TWkLrnCryZJ0dnM1KhTG3eRGJCOGMdgJdeNFvLmSIncWXEo5V3MEkjE89VKUyiG+GqUOdm6wc+O/dDbH8FaClk2SxZBpE9RW3LPDW92AieF1KxIDQOYUuCoNlLnwMZeZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722504068; c=relaxed/simple;
	bh=3Io79nUQn8ypd8PwwL4q+T1yD0diA5Tfaz6TUlMiA8c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XPBjASbtxPRvwDc/CIsilxBCCvdfbDhFE2iE0vsksYIArB8RS2wRuRx/mwBANYSJiGxIDzBewdb8H+NWR03X0b3yS09d6cRBeWwcT774rOl7baW+a17pBbesdcYSyQZPQtj7f0YGNk0WlZLOdLnGaxKPhvhXFrFBcz5huPma9+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DGajlqK0; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5a15692b6f6so10312751a12.0
        for <linux-mips@vger.kernel.org>; Thu, 01 Aug 2024 02:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722504063; x=1723108863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GQVA9z2jkUPxM3dqZI0KDPVXgKoffaizeXmufcNkJbk=;
        b=DGajlqK0Gyyn+hPULgUkUgLzFdFHcVAbeY+X9Ca3AuD4/ymatLH6HcO3HTy9H5NHME
         zOx0sjQGqO01y3smYzWX3bGI2hB8ey4cdvJmQ4czCcKGgs18/hV1O+BExa0tqFSBsZxc
         IcaGGusT/x4c4DC0Jv++B5VV1Ri1m+kaFDOh7Gi1kolcCKrMdqUWlzK9ex5x1sNLqgji
         4r7ACboz+24dUCqbYkIUSPJthaQpS0kd6oneYvNmoGmKGXwEIhqiez5/pVgIJm5bVZ7E
         GfLlo6UUnXNhDRNR7aSIoq9kSLs8qJhVwUt410Fw9s6uzhE5i5iPIHTy49w4GD/a5oFI
         yORQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722504063; x=1723108863;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GQVA9z2jkUPxM3dqZI0KDPVXgKoffaizeXmufcNkJbk=;
        b=syj6qDi29zF4YH8Es2LFgy8wGkyXOG+vz18lIQ8rUyr508kKK5u2S3tEIp/p+SCj6J
         lcb+RMTinDi23fYvoqZfVB1S4i1kVld6SXOQPaqtmGm8hPv/lDhHkelDI0iFeYWT+bG9
         IdK97zh/ppq3w29Td0IeGa1aNNXXqDInpRPWRGgOEjqpYtkyH1RANmHJCYvLwoiaGC1u
         GbOml4qHO45Dpgrm8hGjp+ecKjPEhPXdT1Wgy5L44jGEAi/+NRnWh46uStVdSpcWU6Ha
         pvH5zYL10e5cIOLOgIawLbIylm2m4PGxPIapWWW9DlxRWVDP61NRzq6YlxgDKGo3+Ofj
         ZuAA==
X-Forwarded-Encrypted: i=1; AJvYcCXZrDBI4QOH2hzEVXozORg2CgoGAvFOMMsla1LoyovhM53PpbygY5msCPk/gYGHhmK76FerxUhquExNwwdro+M3z1awJBr6imsY5Q==
X-Gm-Message-State: AOJu0YwGRleJdvBADEuUdvfpd3lQZbZQiuq6rieB1jkcHerspZb5WTnC
	GM72/XzfSrbLrSm3Y8/2hf8wO3vM+23NPIboKURUx/jqhurR+zW60imOJBdUmNU=
X-Google-Smtp-Source: AGHT+IG4an2mFFKr4wz3Z9DFgeOmmND21A8Rbh3YvwoLKrs/2dCx443xl5h3j8lRXM2FS1yhxPSg2w==
X-Received: by 2002:a50:ee82:0:b0:5a3:3062:36d6 with SMTP id 4fb4d7f45d1cf-5b6fe72ddc6mr1090738a12.1.1722504062925;
        Thu, 01 Aug 2024 02:21:02 -0700 (PDT)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5b017787967sm7857844a12.9.2024.08.01.02.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 02:21:01 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 51C785F80C;
	Thu,  1 Aug 2024 10:20:59 +0100 (BST)
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
Subject: Re: [PATCH v12 05/84] KVM: Add kvm_release_page_unused() API to put
 pages that KVM never consumes
In-Reply-To: <20240726235234.228822-6-seanjc@google.com> (Sean
	Christopherson's message of "Fri, 26 Jul 2024 16:51:14 -0700")
References: <20240726235234.228822-1-seanjc@google.com>
	<20240726235234.228822-6-seanjc@google.com>
Date: Thu, 01 Aug 2024 10:20:59 +0100
Message-ID: <87wml0egzo.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Sean Christopherson <seanjc@google.com> writes:

> Add an API to release an unused page, i.e. to put a page without marking
> it accessed or dirty.  The API will be used when KVM faults-in a page but
> bails before installing the guest mapping (and other similar flows).
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  include/linux/kvm_host.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 3d9617d1de41..c5d39a337aa3 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1201,6 +1201,15 @@ unsigned long gfn_to_hva_prot(struct kvm *kvm, gfn=
_t gfn, bool *writable);
>  unsigned long gfn_to_hva_memslot(struct kvm_memory_slot *slot, gfn_t gfn=
);
>  unsigned long gfn_to_hva_memslot_prot(struct kvm_memory_slot *slot, gfn_=
t gfn,
>  				      bool *writable);
> +
> +static inline void kvm_release_page_unused(struct page *page)
> +{
> +	if (!page)
> +		return;
> +
> +	put_page(page);
> +}

I guess it's unfamiliarity with the mm layout but I was trying to find
where the get_pages come from to see the full pattern of allocate and
return. I guess somewhere in the depths of hva_to_pfn() from
hva_to_pfn_retry()? I think the indirection of the page walking confuses
me ;-)

Anyway the API seems reasonable enough given the other kvm_release_
functions.

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

