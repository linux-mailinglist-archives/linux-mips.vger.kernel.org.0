Return-Path: <linux-mips+bounces-9295-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 74438AD92ED
	for <lists+linux-mips@lfdr.de>; Fri, 13 Jun 2025 18:36:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 673A13BA03C
	for <lists+linux-mips@lfdr.de>; Fri, 13 Jun 2025 16:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B56920F09B;
	Fri, 13 Jun 2025 16:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="PI5Rveho"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796551F5430
	for <linux-mips@vger.kernel.org>; Fri, 13 Jun 2025 16:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749832582; cv=none; b=LJQtEVxIhKqdMMe4xItsP5MggHVsKl1/CUeVsVj7HASsMUmK4U20W2kLF3fbyYAtUVHtezZyD82AYUivXsWdXz5/m44Li2iEuUS+STnXIxLjSeyXCuWpIJg0sLhKyhTaX/cbwcuqTBL+rb6ZqPRY3VTYdi7LGpNQ66JMt3Igv+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749832582; c=relaxed/simple;
	bh=6IDK3mFK3aUcD6DqmEoL/rBAW6jbXc5FxEXCTke0bD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XRJZN4PHpFciT2WagpjjJ/8hs9wRInXU/SWCaYvZWTS334uqny3pIR/Q0Bvh9NjWiDc3Rhldk/cT8iMnNa2ZS+EQp+98+iNQdY71gq1htN7QVn+f2XZvR1OuzT0IAMT4LQOQXou/1UfM0DjPiGbDvx3TrYnZDZ2Hu6T9WwuL3i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=PI5Rveho; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-60780d74bbaso3986624a12.0
        for <linux-mips@vger.kernel.org>; Fri, 13 Jun 2025 09:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1749832578; x=1750437378; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=76g08zX1QgiOXgDWQ+4Q63FmolLqjqLzmJdnqen2jZI=;
        b=PI5RvehogUMvTtnZ9NT+nSQkeUjvDQn3WINLD3naZhlnHdHoiwzfw4PB8oyeNV7oDE
         VrHfQJGMeqLG/pNd3WOoWMrlR6AladBALeW/89jAhhvNPpu5dfKbt2xlyQEemCm0h6s4
         FDkroMjWJCWEClLaDHi+R/BMqAC4Nlc/tEs3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749832578; x=1750437378;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=76g08zX1QgiOXgDWQ+4Q63FmolLqjqLzmJdnqen2jZI=;
        b=q1Y3qVGzn6+JQ8v67YvndeER9YWzl7VOXcGQmDjPIid2jPr2DYOIWh0b30/VJCUpSe
         2Wa1LYY5Ts73yqGqPKwmZW0YqWwJWod1nrF/cJba3mmR5y7PBPrxi+PIoSSXirE+6ESU
         gNtwp7YUca/rfKDTv3F7Ml+Q2P5XwyQl0i7N9BjYMePGboBE93IJuc3YBuZvn+H2s1nn
         iEafM94BWRY/2mN/EKVbL2CuII/fJtWdsdoUFovg2EeRxTYXl1Lm6Hs+G0bIUQbffN6L
         HUuYRlZVK2unHbHgPSHS2M5u3gF0ybikRETdw688WZTl+cbE5TbIlCNSvaX1DnOeqMVE
         ClWw==
X-Forwarded-Encrypted: i=1; AJvYcCXW4kgRd3vn8TS/kX00us4S7S45Us+nk2XiWYgy4sYFQhB7rD0eK+tJTcanTWj0RkjZipRrQsiEf71+@vger.kernel.org
X-Gm-Message-State: AOJu0YybiJkDhh+mh5/38AfAaP9hFbbB3NuS7V2zy9Zm7sYS7pDlCWk0
	s5hZzjID3e8pTiJ5o+Qv8QQpDyirLZVdCPs4BeR2SGGctFnBbVSj297AyAngdEbxMSRSCXhS8RM
	XwcYTczJFnQ==
X-Gm-Gg: ASbGncsSEmYG4/p36utI8behlN7aQI4CNzoICT7pUaUXOWUFcOATZ7wCw7lZLS4Yge6
	3N6AcmMsh0WQshSbPPYPcOwiHWsEaw6jMBkrYWcK5WClriZbdbAe/1Pdbm+LUXqkvVWB0F5s83Q
	t+svwMiz2NSQj44HXUE9PAPM8fIZhsaEv+uE7546VOOD0jFHKxRZGKOCvIvRaxa75wa8FiaoHp8
	lGDNl37mRTmWnOtiHQPcnqKtbW/6XoRuTJQ4sekC+vSvxYwWLzeWW38EgOD3xKAHdgl7a6U85Xj
	FaNnveM+A1AwmrRA5eB7TwFQmRiqhtJYPEWs8IRp4zqVGzdcPXWF83KseqQHmk2iVobrBtGZCdH
	YEY3LCZhFCPcL1afLgpoW5WpAgMF6rmZnwcOM
X-Google-Smtp-Source: AGHT+IHCmvaj+u6c9Ju99NI3mBAu+XySVu8vu3bbAUi10A0fsgT2jILb8OUHCAz/t+n8TCxU3FdXPg==
X-Received: by 2002:a05:6402:2753:b0:608:35ae:d856 with SMTP id 4fb4d7f45d1cf-608ce59a8a2mr357635a12.10.1749832578553;
        Fri, 13 Jun 2025 09:36:18 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608cfade4desm11391a12.9.2025.06.13.09.36.16
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 09:36:16 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-607873cc6c4so4726787a12.1
        for <linux-mips@vger.kernel.org>; Fri, 13 Jun 2025 09:36:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV+agAUWuxlh4aQ/iDZFYeC5B9p6xK5Na+M8aYVrhzFl3ECONcOQq6DfrIV6E6AY91oDIdeU5Ghg/Tl@vger.kernel.org
X-Received: by 2002:a05:6402:35cd:b0:602:427c:452b with SMTP id
 4fb4d7f45d1cf-608ce49d897mr365341a12.3.1749832576184; Fri, 13 Jun 2025
 09:36:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611020923.1482701-8-ebiggers@kernel.org> <aEjo6YZn59m5FnZ_@gondor.apana.org.au>
 <20250611033957.GA1484147@sol> <aEj8J3ZIYEFp_XT4@gondor.apana.org.au>
 <20250611035842.GB1484147@sol> <20250613053624.GA163131@sol>
 <aEu5cyDOMcKteW_b@gondor.apana.org.au> <20250613055439.GB163131@sol>
 <CAMj1kXEDCRfCgvtuhRc+a=m1kVt-zkcCqi_=_WOFTmt4Hz2gGg@mail.gmail.com> <aEvjrhkLnB_GEKnV@gondor.apana.org.au>
In-Reply-To: <aEvjrhkLnB_GEKnV@gondor.apana.org.au>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 13 Jun 2025 09:35:59 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiewoOfhK=NVQT2uf+29Kngv9F9J6ObJRFUKi6n-=B06g@mail.gmail.com>
X-Gm-Features: AX0GCFu7lGsyyFJqLRh6z7a562txhJJOyTpVqIIzlie72BRGPF0wH2A3ccvLGV0
Message-ID: <CAHk-=wiewoOfhK=NVQT2uf+29Kngv9F9J6ObJRFUKi6n-=B06g@mail.gmail.com>
Subject: Re: [PATCH 07/16] crypto: sha512 - replace sha512_generic with
 wrapper around SHA-512 library
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Ard Biesheuvel <ardb@kernel.org>, Eric Biggers <ebiggers@kernel.org>, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org, 
	Jason@zx2c4.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Jun 2025 at 01:39, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> First of all the export format is being made consistent so that
> any hardware hash can switch over to a software fallback after
> it has started, e.g., in the event of a memory allocation failure.

Can we please instead aim to *simplify* the crypto thing?

Just say that hw accelerators that have this kind of issue shouldn't
be used. At all. And certainly not be catered to by generic code.

The whole hw acceleration is very dubious to begin with unless it's
directly tied to the source (or destination) of the data in the first
place, so that there isn't extra data movement.

And if there are any software fallbacks, that "dubious to begin with"
pretty much becomes "entirely pointless".

If the point is that there are existing stupid hw drivers that already
do that fallback internally, then please just *keep* that kind of
idiocy and workarounds in the drivers.

It's actually *better* to have a broken garbage hardware driver - that
you can easily just disable on its own - than having a broken garbage
generic crypto layer that people just don't want to use at all because
it's such a ess.

This whole "make the mess that is the crypto layer EVEN MORE OF A
MESS" model of development is completely broken in my opinion.

There's a reason people prefer to have just the sw library without any
of the indirection or complexity of the crypto layer.

           Linus

