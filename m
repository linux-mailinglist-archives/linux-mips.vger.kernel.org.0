Return-Path: <linux-mips+bounces-4814-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 351AD94C0D2
	for <lists+linux-mips@lfdr.de>; Thu,  8 Aug 2024 17:18:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D23CA1F2295F
	for <lists+linux-mips@lfdr.de>; Thu,  8 Aug 2024 15:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B50D18EFD3;
	Thu,  8 Aug 2024 15:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DdhUPkOm"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960AE18C906
	for <linux-mips@vger.kernel.org>; Thu,  8 Aug 2024 15:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723130303; cv=none; b=nUPOLlyA32cGa8U/E6uPRFT+EcsDDP4RhGkpSwnWQT+WM4JWLVoo1ec2k3PnQ6Q/fWcRVLiC54t/doV7Z3t3ttEWFp2diK+dQMslncg1jg3W4Rv7IRRe6GTbP1PeozjnXGT/G0pPK7YwFUY40uLtgjAbZHfnxUbgU0tb3pRkB8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723130303; c=relaxed/simple;
	bh=JIv1oe8oudJUiS44KwPc6LaXFpIpf2hHYtHrt3Gk7Fs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=anx+7ihgU4dlJBnS3GKKQUiH/keCmCS2LAImU7MfWqVfbbL10DFyN8kQ60qXxD+AENezXTjswmHmGWUpqMT6KZduB6IkhHXXNU7f7ytg59M+zlade4uK8JDZK2x2oTX/7rnENDGVWsJu/vlglA3b9wAf6ySLxW3lsXYwi5J3960=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DdhUPkOm; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-428163f7635so8168835e9.2
        for <linux-mips@vger.kernel.org>; Thu, 08 Aug 2024 08:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723130300; x=1723735100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tobJ9z30Evl1jF8OZuU4Lc5uAJoWjkGhLZnI88VCnqo=;
        b=DdhUPkOmkByu9yeo2BSw40l9N9KpPDr6y5izBZHUwxptTz9EjAXwD4Bp6BDPdvC/9e
         cO8djDvPt4pXupq/6BeNY463tZSbruEc7OPNCAvW3iTFB1rGFbxNOM9yf9JpdG1MALXA
         +HhZu5oSIUb7JcikQYeGZk7TDbqo+ELAUBT1F76A3yxY0HdonN3v8Fis9vos6t+oHbJa
         FpBPim/s+hLuyoCfzBs7HTkucsr1enQ/+E3jbL7BxI1Mr04UFJSvh3T6sNQtemkTiPO3
         VPl0JgIJMPEUCmskYb8Azc+F/XclrNvRsSfN4cPj72EjGFQIl4wUQFowbRtmlRFiFCBm
         +UAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723130300; x=1723735100;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tobJ9z30Evl1jF8OZuU4Lc5uAJoWjkGhLZnI88VCnqo=;
        b=i/SVUNNY3noNOaDBLYne8DNDKaCenGj7vjAr0Q+E8Q7XdOM+ZvEflSJkaf5eknGHDv
         K8hiDrio1mjQ8Z0gQM0ysM4UzfF22kKAWWbT5A8FsloWcm0fGXM46azElhqNS6nY//Pq
         DNsUW9h9JhlRghTnKJsPZbQGPUOq0oCnL+yuBJ9sWjg4XBliW/wFtFBkOY4nDKKIHwad
         vJPh6kjjZcAb5qDc0G9eq9mhnGPVczsoJEIiJLAiCigq/OmKBSpATw5Ys9Uj1V3RrK0p
         fd2mZv3YVfDZ/2CmX2hKumMSr3QTBaH/F4i1z/2i5uRcBaAoudson7xVWm9R59VS/3Zp
         dtwg==
X-Forwarded-Encrypted: i=1; AJvYcCVCxrBOEDZA73yqS8RVlo/JjbTaYKDfm5mNcVChE4Ptk7y5H2uSxJkxfv7dlDsnmDOdB9aI1MAjpCOo@vger.kernel.org
X-Gm-Message-State: AOJu0YzxHMa23es+9ghwO02LyvmEg9JZUYqpLtEMio4BhAbZRt67PTEl
	eEBIrCpKcBSYdM9zXJE2ptFT61NsR3+sGDiLPRPwf9kWsSDA2jIgSzzpMcTZoFo=
X-Google-Smtp-Source: AGHT+IGvryFhFZyruwyY4esgEivQLYITNxgcfgoPAmbjFk+Vzw8kMU8OO4VMz6KIvqZ2Rys90VZ6yQ==
X-Received: by 2002:a05:600c:1914:b0:426:4f47:6037 with SMTP id 5b1f17b1804b1-4290af13367mr16171145e9.19.1723130299428;
        Thu, 08 Aug 2024 08:18:19 -0700 (PDT)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429059a5dbbsm78703665e9.36.2024.08.08.08.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 08:18:18 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id BF0C45F769;
	Thu,  8 Aug 2024 16:18:17 +0100 (BST)
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
Subject: Re: [PATCH v12 13/84] KVM: Annotate that all paths in hva_to_pfn()
 might sleep
In-Reply-To: <ZrTFPhy0e1fFb9vA@google.com> (Sean Christopherson's message of
	"Thu, 8 Aug 2024 06:16:46 -0700")
References: <20240726235234.228822-1-seanjc@google.com>
	<20240726235234.228822-14-seanjc@google.com>
	<87bk23ql6n.fsf@draig.linaro.org> <ZrTFPhy0e1fFb9vA@google.com>
Date: Thu, 08 Aug 2024 16:18:17 +0100
Message-ID: <877ccrqc06.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Sean Christopherson <seanjc@google.com> writes:

> On Thu, Aug 08, 2024, Alex Benn=C3=A9e wrote:
>> Sean Christopherson <seanjc@google.com> writes:
>>=20
>> > Now that hva_to_pfn() no longer supports being called in atomic contex=
t,
>> > move the might_sleep() annotation from hva_to_pfn_slow() to
>> > hva_to_pfn().
>>=20
>> The commentary for hva_to_pfn_fast disagrees.
>>=20
>>   /*
>>    * The fast path to get the writable pfn which will be stored in @pfn,
>>    * true indicates success, otherwise false is returned.  It's also the
>>    * only part that runs if we can in atomic context.
>>    */
>>   static bool hva_to_pfn_fast(struct kvm_follow_pfn *kfp, kvm_pfn_t *pfn)
>>=20
>> At which point did it loose the ability to run in the atomic context? I
>> couldn't work it out from the commits.
>
> It didn't lose the ability per se (calling hva_to_pfn_fast() in atomic co=
ntext
> would still be functionally ok), rather the previous patch
>
>   KVM: Drop @atomic param from gfn=3D>pfn and hva=3D>pfn APIs
>
> removed support for doing so in order to simplify hva_to_pfn() as a whole.

It still sticks out given the only caller no longer enforces this.=20

How about:

    * true indicates success, otherwise false is returned.  It's also the
    * only part that could run in an atomic context if we wanted to
    * (although no callers expect it to).

?

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

