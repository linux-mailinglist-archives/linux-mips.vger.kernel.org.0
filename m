Return-Path: <linux-mips+bounces-11163-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C66B50113
	for <lists+linux-mips@lfdr.de>; Tue,  9 Sep 2025 17:26:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A36581B24D08
	for <lists+linux-mips@lfdr.de>; Tue,  9 Sep 2025 15:27:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F5B0352FC3;
	Tue,  9 Sep 2025 15:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gbm4IJy3"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA09352FDE;
	Tue,  9 Sep 2025 15:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757431586; cv=none; b=s+H3YWDBOEEDQlMsYSDFHdP62OggHj2yse8hbj7mqtgWiRttLLfOEBKZN6+t4gNpAsu7tVGDtvlX3dSEEXig1rftkt1Eh4yyJ9jfP+2MBaLVV7rx+lerN94F6hmjnQYlqpPHk3AfduMahuVeqvRT3BF92yjqqU4vVNKTdTQQidc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757431586; c=relaxed/simple;
	bh=ACvYPivQ1a8I17yD0UYeNvhtUQ6DCC5FT/ARS5wLzjU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZHaz+ZUz3xyMCBpJHzNyGdUwtviJIN3y0XNBpGkTJEZSc5RPfUF2+xX7m0PLndzUBw0Smnkz1KKuTMEw9uvnIqjGmDlFlbAF32HXfnNtDUm4oDR1MgjjoB7mqpdZ94ecYNShw8X/Adc+WNtTwblO3lenUYyvpqYEoF9N7jhW/7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gbm4IJy3; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b04ba58a84fso468911266b.2;
        Tue, 09 Sep 2025 08:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757431583; x=1758036383; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ACvYPivQ1a8I17yD0UYeNvhtUQ6DCC5FT/ARS5wLzjU=;
        b=gbm4IJy3e6UL0LePmt9IYTk6xg7Web5uUChIe2d0VFFTocIbyESexp4E3qo0a5E/2r
         LYCSsGiYIQS7A62g96pNHMCvKytJ7PVmCJqPbkRUimKHz4IgLBiMoTHEARQz6qJQZqu+
         8pVAU1C1alnAV5+6Jj7WfW+S/xJDIz2UfojQASTLC9HEubjhS3+dc5ub8n1LIgXLnp4u
         OFabA9hczR37by4FdGrVjMewGsiUR8SdJEKEJo+EO82vqUp8MR0KjmJLMq6pUYMv4EiE
         6sOYZ5GMRgMXWaVXVcWj+kXUVozhMqh+77RwUC3dFzud5ce4pgUoufZotUrIHdNtHqXz
         v75A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757431583; x=1758036383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ACvYPivQ1a8I17yD0UYeNvhtUQ6DCC5FT/ARS5wLzjU=;
        b=YJE0IbLiKR+0lQmElVJOuzvJj4IJatTbD3VYBdSLOcg1QVjK9+kDBf/RsiF82OMRPy
         HK6wrg9BTG1zPtShQjE24LzhS7MkFlsjQSs8AbXXl3VvAF37J50q/H3LL5we/4KOD6ts
         LbPGzE1tg6GUUu5LaHqF4C/zdVcYxCdaY1xV9yraN6DyOPwuvosLB66bjMDWIwrKcP/R
         rV//a/kJJdLjltDrFcJ3P6IoCeRkQ1ZnrtU5moFbCQkRsLaFZNZSKSIEGEydzy3o+Bdq
         41+hCkke4sxywse0agItExB6IWfiTPx/hKQqdTy83nv/5wekLyc1M/A7gTkuXUBvaS64
         OpZA==
X-Forwarded-Encrypted: i=1; AJvYcCUCS06AqZq/XRc6x5DhiFkgNeZeSLjHUSshB7Nue4mnNcK8rF/oc6jph8OCc9ol9QBMRhE9/BQI5aSm@vger.kernel.org, AJvYcCXUwpadPkSSA5xwMp5wFHP1+a+GyONbeii9L2VjpTYM59SS0D/P+dfadK6aYqm41SbzZdLdgaGYoggnpg==@vger.kernel.org, AJvYcCXrgZ6GZmup4qhv/ZkVZkbkQbPegLnTSK8bjHrHFOJSjR8hYsbfLYik4NsvMqlcaCYkGQGShKdMMwGmZzeg@vger.kernel.org
X-Gm-Message-State: AOJu0YxX9azzr8OHxlJfIOIAzEDzKOwRHPgwTZVD8m5llj1V4sK357Rf
	y3gROWs/qCe/qxsThOHxBaBOlB/4F6NoDF4PtMCu1Z1qhp3nbG+yg0lgoIa7TCqtsVZiFgJAioO
	wev9K5QZ7eNWS1yrVaRgZUCKbet+qW3A=
X-Gm-Gg: ASbGncurmSBkYa4cTMu/e9vJ9vJqWSeXWBqZOGhSI8mQPJ0LCVTozS/XJxjE0Gnrvdl
	0ELEyhoBNcQoAIlkY5RKLU4Bz26b37BNxDTwHW27TUpVU/2fe+Fkw/JbZT5Lc6A8CcCAFuPWmBe
	T6ddgBO/5A0HuX+NEszzbpj32dTrqBbuU95lxHmlLfvYCf8L2jEIxHUwHfOCv2bCgQ6p+J5Ky37
	2RGKy8i6Q==
X-Google-Smtp-Source: AGHT+IGZg15DrtF72G9h9dyt21xSsowFAKz71cJqtEpccOZC9aRv/EPnYIUJriaKNXq/eDdw8hEDX9pZ4E1DPi0ePuo=
X-Received: by 2002:a17:907:8687:b0:b04:5200:5ebe with SMTP id
 a640c23a62f3a-b04b173704cmr1239828766b.54.1757431582431; Tue, 09 Sep 2025
 08:26:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
 <20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org>
 <aMAP9hAWars0T83r@smile.fi.intel.com> <CAMRc=MeLTGq8Qu2aT43tkt3vaYCSaJPJPLmaUQ1SAyD_OgVr_g@mail.gmail.com>
 <aMAn4MM_Fs8q8qwj@smile.fi.intel.com> <CAMRc=Mdr4oW2d7XZ90rRr_fKC7WToz72v=_kW-s8=Urd0g8k3g@mail.gmail.com>
 <aMAve1MbONmKVjjg@smile.fi.intel.com> <aMAv3STeZUdSQ14p@smile.fi.intel.com>
 <CAMRc=MeA87p0QAzq_3MACQM90MhN0eRccr7u-VzcfyP8b90AaQ@mail.gmail.com>
 <aMAzZAbNwrRTgFi-@smile.fi.intel.com> <CAMRc=Mfn7atHTqKc9nMTQ19ZserqeNi3skb-QhG3CVdEhmr0gg@mail.gmail.com>
 <CAHp75VdDAJO3+NPp29GnqL=C5m7tdWbyYvNFax=Dh+dG49YAnA@mail.gmail.com>
In-Reply-To: <CAHp75VdDAJO3+NPp29GnqL=C5m7tdWbyYvNFax=Dh+dG49YAnA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 9 Sep 2025 18:25:45 +0300
X-Gm-Features: Ac12FXzLAWj8jy-m4m9ZPXb_pPgfqX2JAuL57q-duTifXdjD_POsau2MIQgkxqI
Message-ID: <CAHp75VffDLfvdVhnzZk6V6a9eXq4R0ZBYLUw3S=g0ABqozhWFQ@mail.gmail.com>
Subject: Re: [PATCH 13/15] gpio: sodaville: use new generic GPIO chip API
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 9, 2025 at 6:15=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Tue, Sep 9, 2025 at 5:05=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
> > On Tue, Sep 9, 2025 at 4:02=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@intel.com> wrote:
> > > On Tue, Sep 09, 2025 at 03:56:41PM +0200, Bartosz Golaszewski wrote:
> > > > On Tue, Sep 9, 2025 at 3:47=E2=80=AFPM Andy Shevchenko
> > > > <andriy.shevchenko@intel.com> wrote:

...

> > > > > TBH, I think those 6 all made the same mistake, i.e. thinking of =
the compound
> > > > > literal as a cast. Which is not!
> > > >
> > > > What do you suggest?
> > >
> > > Write it in less odd way :-)
> > >
> > > foo =3D (struct bar) { ... };
> >
> > I don't get your reasoning. typeof() itself is well established in the
> > kernel and doesn't
> >
> > foo =3D (struct bar){ ... };
> >
> > evaluate to the same thing as
> >
> > foo =3D (typeof(foo)){ ... };
> >
> > ? Isn't it still the same compound literal?
>
> It makes it so, but typeof() usually is used for casts and not for
> compound literals. That's (usage typeof() for compound literals) what
> I am against in this case.

FWIW, brief googling showed that nobody (okay, I haven't found yet
reddit/SO/GCC or LLVM documentation) uses typeof() for compound
literals. So, this makes me feel right, that the form of typeof() is
weird and works due to unknown reasons. Any pointers to the
documentation you read about it?

> > > > And are we not allowed to use C99 features now anyway?
> > >
> > > It's fine, it's not about the C standard number.

E.g., https://gcc.gnu.org/onlinedocs/gcc-15.1.0/gcc/Compound-Literals.html
(8.1.0 is the same).


--=20
With Best Regards,
Andy Shevchenko

