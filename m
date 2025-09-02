Return-Path: <linux-mips+bounces-10961-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADC2B403FA
	for <lists+linux-mips@lfdr.de>; Tue,  2 Sep 2025 15:38:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD25116E772
	for <lists+linux-mips@lfdr.de>; Tue,  2 Sep 2025 13:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52BBC30BF5D;
	Tue,  2 Sep 2025 13:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="eJsfRfy7"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CA830AADA
	for <linux-mips@vger.kernel.org>; Tue,  2 Sep 2025 13:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756819955; cv=none; b=OFhXQlneH5qiFex7Mz2mWhFfMMYB1IVn+iAyOibtsln/RQEMUcsJxTZT+5pfqoRud5lXoCrFAP+6ZE4XeNZDz01CeTAgj9FkNiezT9Dtwv+PAqlXetuXoTmb55O/SZB19wIJCKZRNuScR6iPVvG04ixVCLGuxDTo3b6MEp3r71I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756819955; c=relaxed/simple;
	bh=jQHix6PgeTZogNqwgwBs7BQIhf8j8t/QOXmjjj2gpJg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CJDd30y8cozbMUUWZIYauBArlkKjo8lH75tghzfD218nBUDnk7ASIcaCpj4D8yreh9j6IguddZnQWSWHp9hvIElz5XYTjbufd4XYgikAh8zLtTJwFo+LFP/ZoSaWl5aEx2L+rgicRHUk0eg4A62uUHXFZi7y2gNEfU+swE3XiIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=eJsfRfy7; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-55f6f7edf45so3016141e87.2
        for <linux-mips@vger.kernel.org>; Tue, 02 Sep 2025 06:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756819951; x=1757424751; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lnoH1+ZsxBYCzbeJtuEiwBsgC/lAs0DmEqE9uy46sWE=;
        b=eJsfRfy7h3BUAwuHZFdWnQ1XEmgUS4W4ioUSft3a0cM8k2qYL8mnw++Yr14fOcTq5Z
         gixFnvABxwl6FgdLjksEE4Kg0Gh92ca8rsuwMIUUVG7fzEblgv+WSbY0wstNwGC8Flof
         bssAp/xtUDvgSf3+Y9lXKsjqPFEg6ivWWkUauDEyuqkgZQLWaFiNwgXh3HGwmuhQQsoa
         FrnqK9Y0F8TH83mGYh2r4PtLPfX6vAzBD52TpDzQ1HVUpOPaT3k6FjNBobTNwKNE6Wbg
         NXDke4iEvQag+5cZTPSyuU7xk7pj21WsXgVlJd8QTmu6fVV/X1dAS0RMBMIEwNg8y3Sb
         sRLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756819951; x=1757424751;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lnoH1+ZsxBYCzbeJtuEiwBsgC/lAs0DmEqE9uy46sWE=;
        b=icq6adbDJGNdEoNnOQt99VbyC6hWOfgmlieNd/9ADgGHD7A4wnq0B4Xf+cX/TX3Hwu
         pn0P+PbQ9jdhqTtBKkqaB2cdrQ0P9Xt5sfbi/10F/tjxnhSFW5xW9kfuliMxmG9K24xC
         dYcyaLcyC62zILhoRNMZ8pL9D/pNaVMxU///Q7AymOI5vqrPhrB3FEJn1C+uDyn+4m3u
         bb7U0C8xF87zWKqacPhbsdMxqNvI+7A41Eh7QA0D5ih09LCaUO2GsOY/SAuPomlnPzUJ
         LW9oPwDRMMiBdnUHA9opQRy0Cs/PNljPGBaazi9ZlBHssAG665uNinWiPEFCCxhsvuhV
         Qiog==
X-Forwarded-Encrypted: i=1; AJvYcCVvx6yQ1XAIiikbQd8gOavnU/iJggGME14w7hV0yXzatim6BtxaazDmLshaP15KEklI+8LAinCYtPvC@vger.kernel.org
X-Gm-Message-State: AOJu0YyPkAvHrMyaGaRQEGjiEyX59BHKnbuLjujj7ptpoUB7GvKhTRt6
	xVv6biqOG1uj50G09aJpNPSW8UL6kUMObu9qIa/Nno/fNsqqVWTxilAEvIiJkZQfNfWPAH/Dsxj
	sMY21r9J4PqCioA0AMcu9d7B5j4oEmLYh5N+y/+Gbsg==
X-Gm-Gg: ASbGncsGs5MUNdUlNfPysd2mVhnqkj1ReGPzRC9y3D5w+k5BzBSEH2tl0biHZGkpbvI
	xc5nkuAB3uQkcKfm6KmcqaPD/eVZXvT800bS2iL2qBUCUlwYMqENT77ym6FeO/tpDSTIytj4tH8
	P+c/F97VOgUrVUmVNQTlkPKzWXOQtJN9oF63OOUCg0WDMelazbhbN2U+/cDgTYQ0AhFxh9L6Lgb
	rv18czd3E8vtzF/z6eDkaRS2I1R5vNZlNNiK7Y=
X-Google-Smtp-Source: AGHT+IHbC8qI4AC5+0YZNljCnPe19ZYxRaps+B2CcXld1o2mGtDbXzoveQoI0IeEbDNxVlYlEUG/+tn7nGWqsyLzmeE=
X-Received: by 2002:a05:6512:3ca9:b0:55f:55ad:2263 with SMTP id
 2adb3069b0e04-55f708b6c5bmr4286185e87.16.1756819949961; Tue, 02 Sep 2025
 06:32:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <20250902-pinctrl-gpio-pinfuncs-v7-12-bb091daedc52@linaro.org> <aLbt2euqYQM5xXuZ@smile.fi.intel.com>
In-Reply-To: <aLbt2euqYQM5xXuZ@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 2 Sep 2025 15:32:18 +0200
X-Gm-Features: Ac12FXySKFnql5rdsxfRBFF-2EejY2a696V_6zV_jaWq_9WtZl4uQNoHEj4w7YY
Message-ID: <CAMRc=Mdnp8T46Gi_xZintgc9AZGCGiRPYc9mR32Xwodxy7DLqw@mail.gmail.com>
Subject: Re: [PATCH v7 12/16] pinctrl: qcom: use generic pin function helpers
To: Andy Shevchenko <andriy.shevchenko@intel.com>
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
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-mm@kvack.org, imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 2, 2025 at 3:15=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Sep 02, 2025 at 01:59:21PM +0200, Bartosz Golaszewski wrote:
> >
> > With the pinmux core no longer duplicating memory used to store the
> > struct pinfunction objects in .rodata, we can now use the existing
> > infrastructure for storing and looking up pin functions in qualcomm
> > drivers. Remove hand-crafted callbacks.
>
> ...
>
> > +     for (i =3D 0; i < soc_data->nfunctions; i++) {
> > +             func =3D &soc_data->functions[i];
> > +
> > +             ret =3D pinmux_generic_add_pinfunction(pctrl->pctrl, func=
, NULL);
> > +             if (ret < 0)
>
> Why not simply
>
>                 if (ret)
>
> > +                     return ret;
> > +     }

Because it returns a possibly positive selector number.

Bart

