Return-Path: <linux-mips+bounces-9913-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBEFB10890
	for <lists+linux-mips@lfdr.de>; Thu, 24 Jul 2025 13:07:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1186A189F8F2
	for <lists+linux-mips@lfdr.de>; Thu, 24 Jul 2025 11:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74B5826B77B;
	Thu, 24 Jul 2025 11:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l/IOc/rj"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CFF26B762;
	Thu, 24 Jul 2025 11:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753355229; cv=none; b=KxrQ25lHNA9tTpHn4VHmLqa1o7KGquOEcIPn8Xf2ZDCkOTvQWF/QM3ZdBTP3ajWX5AwdSR6Ht9g/y5NdOcR1NoIbl6lzhbXxCNrLtPJ2uP6sq9ShNueb0v/XWbtNRKVt09fEK467JjY1W+7M8CFlbVWNy456kYS8FN6QyDAzkjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753355229; c=relaxed/simple;
	bh=DXwtrodih9JXts+Xu3a7jWDDhz6m3rxPn9mOHcSx1D8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f1eod4q9Xy7qxNQaOVP0lANw2CKv3/iITC1jx7Tp42Q++V1bFv1mQtlQJAIxceMF1PQpDTmhrYy9E1gAYSzME8bY/M/EA4ec6UWIWLQudXCCnoSDvsuOYXQlRdWYFFEPCdj6nH+z69s+ST8qnR/09Coxzg0CMzblGjIq6uk3kCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l/IOc/rj; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ae3be3eabd8so200896666b.1;
        Thu, 24 Jul 2025 04:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753355226; x=1753960026; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=43dwDfmrGoNVQcXDC2wAL8Jp+SeF4PP+nL7X5CzoIgA=;
        b=l/IOc/rjY5/3FVXsUIIdoQD9wBg1aJOuMrrzs6f6OkK821MBEgTvt5la5WMIuOYWfQ
         2si4dVVgJT0yQ+H8AdE9Yp4xdanzIYi62EaSJkJdD4aKQCis1z8qYAng2hVB1pUDGxmR
         eQy4Cn5tFUfVOEyHer7XDU1K38vP0a+8VLK/ZGmjmXE6/f5Bqr2VKL38CD/pCJ+l9SHX
         oL0MkF/Gbr7JdIDvMMx6l5Tu8HLrG4Q7eHBk3FYy9l37wlb11EFpl2X7sq4zn6il13jV
         2vHvIv9Vb2ix11v5FIkuFuw1pmO90SGYfLPQyV2J9gQAVa3KM6goEFiZfW7GzSNvbGMB
         cFKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753355226; x=1753960026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=43dwDfmrGoNVQcXDC2wAL8Jp+SeF4PP+nL7X5CzoIgA=;
        b=vo7E2uTM4six/+hhguH/iRQzQO/UO+mURxJ3wJp41N+xrnfK1pfJBhta1FtrFmbys8
         sX8YPzNyANth/E38rkUvCo3qHeWz1UZvXjxByt+gMpqxBimmwz/SuXvXpFY7bK+BopZb
         0ZEyw3WG6nV8qHrCIWOJzwaupHqagFY9lovnfM9+ejbSq5mDqLp78CAeRJJ7d4igbX0g
         bx8HUA/++M1UdlyKh+XBu5Je+2vzNn8Frj72cn8P1Z8+ag7q6ssuOrvMiXXcHPVlc8zB
         5oVdHf3STqPimwTp3uWlSGDNNNFFhpwhjMpqIRQzUZdNs1X6rhpR4sJy4Oe/S2Oc/ni7
         YXCw==
X-Forwarded-Encrypted: i=1; AJvYcCU0ydln8J+3BT/etmmZzgXy3WNu794K8kJKZ87D8EKfb34y1TLP5aYfSsHWROddjwPgx5AodkCZf0Mjpw==@vger.kernel.org, AJvYcCUfAixA7aV49Ap30KZCAVHUvrzNnPtQBB2hpBv9qyHIzh12gVz5RV2aehLO2SDk27GdmlkIDxTHAuVZNg==@vger.kernel.org, AJvYcCWJzDkfubWJtjPYvEkI6Pr/wL7pcGUBmeHXPSm7WiXjBORcLVW81Cu/Z9GQvFutfdSnNIJRn13fMpID6g==@vger.kernel.org, AJvYcCWNpFU0ahGBOU8WifvV9+HOchxpyompZILVYo6MhEbrScF3fJcWX5YJInNzCX7CKoBEUyjW3MbcfywVjf+q@vger.kernel.org, AJvYcCWXYQt+/cToNXnd0tmMwONosOiA018i/MfmIWR8mGQYzPiszYCbGm0ws9IUQXl9JRRVYVvArEUoPDIyq8Ni@vger.kernel.org, AJvYcCX6HGlmZ6d8aDDVQeLnnF2GESkztp52ue8Trtw46kVf0ecNh5WsQTmJGGwHaHHygddAqJ4nkE/oXmeZCKIAXzY8@vger.kernel.org, AJvYcCXu+uupEkbkcTj92MLodRFa93/L4cjvz16cQH8DnOZ2NE56y8S7tuC3keLYH99Imlyy03jMmu3wL7D4EZIBU+wgrMk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQgZq21dszgV7hcTRQl2lYQVDBKnfrUK7HmdJNQ2rbnTTtOJf3
	+x5eAbIM6LhjgAtyzxr+Lx9nI6ilKUaPTgwIHjp1Ie8goTgQPv3/1nIvLZGktzssTSs5TUk7tFj
	wsBkSAIpr0ohjGEo+e1Zn10VbdLHGrDE=
X-Gm-Gg: ASbGncsxPg56qdzfN3S5cyROb7r89482iDsZZEuxiTAXlG2Rp1iJR5ThivzqyYnDFhl
	2d9WLU2ogldplCDXpXmHUqCAMhfYJ8TFvexxqpkM0aRDa7cotabKWLl5kUuVl1Y1ZJ+on2qrBAF
	/eL/+GFVzc6Bj4N9waFo2NNaezahFpBToVSHu6cHiYvllTxGU0o7bafoDkunR5r217Xx2N7sGl+
	bIcpFHiuw==
X-Google-Smtp-Source: AGHT+IEQNn6mc1SbQNgvNLpYIewbgmuOfADdxy4q8WVZzoOl9KNmTiYVcFlWZZpZmc6xxLaaxaSRyyOaGbD95ShsFlU=
X-Received: by 2002:a17:906:4785:b0:ae6:c334:af3a with SMTP id
 a640c23a62f3a-af4c1e266admr182496066b.6.1753355225671; Thu, 24 Jul 2025
 04:07:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org> <20250724-pinctrl-gpio-pinfuncs-v3-7-af4db9302de4@linaro.org>
In-Reply-To: <20250724-pinctrl-gpio-pinfuncs-v3-7-af4db9302de4@linaro.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 24 Jul 2025 13:06:29 +0200
X-Gm-Features: Ac12FXwnivN4zoY_g5_4Ly7908cvVHMEFQ3vZsc8P3-b_-oZW11Scn4jIzuxtTQ
Message-ID: <CAHp75VcLaVsztRtiwUkNZJRGwd5+T-x3t2VGog=0E82D3U-qLw@mail.gmail.com>
Subject: Re: [PATCH v3 07/15] pinctrl: keembay: release allocated memory in
 detach path
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 11:25=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Unlike all the other allocations in this driver, the memory for storing
> the pin function descriptions allocated with kcalloc() and later resized
> with krealloc() is never freed. Use devres like elsewhere to handle
> that.
>
> Note: the logic in this module is pretty convoluted and could probably
> use some revisiting, we should probably be able to calculate the exact
> amount of memory needed in advance or even skip the allocation
> alltogether and just add each function to the radix tree separately.

altogether

...

>         /* Reallocate memory based on actual number of functions */
> -       new_funcs =3D krealloc(keembay_funcs, kpc->nfuncs * sizeof(*new_f=
uncs), GFP_KERNEL);
> +       new_funcs =3D devm_krealloc(kpc->dev, keembay_funcs,
> +                                 kpc->nfuncs * sizeof(*new_funcs), GFP_K=
ERNEL);
>         if (!new_funcs) {

krealloc_array() ?

--=20
With Best Regards,
Andy Shevchenko

