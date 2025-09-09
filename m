Return-Path: <linux-mips+bounces-11164-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B3EB5025E
	for <lists+linux-mips@lfdr.de>; Tue,  9 Sep 2025 18:20:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C455D16563C
	for <lists+linux-mips@lfdr.de>; Tue,  9 Sep 2025 16:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91B1E35208B;
	Tue,  9 Sep 2025 16:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="oHzO5MRy"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26EA34321F
	for <linux-mips@vger.kernel.org>; Tue,  9 Sep 2025 16:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757434823; cv=none; b=IaXFYYqygZ+dUQBr1k99SnMesm7kGX0sHVvsyGOiIDv0/BRACpR+iR4CMtetOD/LK5jXqANZtPjt//g5mnBHhbq1ccLvFG/QzbkVrFzrmfc+I8d0QAgyU0Kr0xKZBc9CnwKXn8QCvMwSXgwPQv6eEOUWYw4JVlrYqcsI+m5U6k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757434823; c=relaxed/simple;
	bh=/97m0jy8CzoHwIZcKBQ1zrt0w1+wQwdE+fGFa7+7SJw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pn04Xqld/Eogy6kDdH1HfPVic4jJauJND0W84JVsn0nvdNUp1yibJ5omlVFBGvxnKqaj0hXPWIrJOWEHt3MIEdNweRyUILLYMe/QND+BZu4C87yZD3/4FtIUHirB9Tz85PYx3ukXUeFf/kUd8zKc406bdzDd7tU3h60WOET8Qsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=oHzO5MRy; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-336a85b8fc5so43358621fa.3
        for <linux-mips@vger.kernel.org>; Tue, 09 Sep 2025 09:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757434820; x=1758039620; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/97m0jy8CzoHwIZcKBQ1zrt0w1+wQwdE+fGFa7+7SJw=;
        b=oHzO5MRypNPGSYT+cS1qjpCPBkDDZVEF6v8ZkWs4ra6N6tKJrEm0p5JnR7OJS18gM2
         OGpaCu+QivbfwzwdAVvMn9aFnFN85bTszabjPr/2YgG2kmprx9uWYcwY0sST6+mBXBVI
         baf3USlelGNrvqF9mHK1D4M5spGZCewl+g45SDMk/RMMLwIi/ld0atRpB7p7zNTrxHwb
         4q8J/Joljnpd/TjjBGPIa9D6OBe0vn+nOlXFSKrCIHhkRlX6pR/4Q79iMGArNxgBVUoJ
         4AP/w8TOLDhheN0swWem4Gu6nNRaWcLjyCXXptqhtGU4wQQjHyZYkhRLbHeXTCbezxYb
         /MXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757434820; x=1758039620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/97m0jy8CzoHwIZcKBQ1zrt0w1+wQwdE+fGFa7+7SJw=;
        b=aqlbp6e9tkdZ7vjOpr3bY3+PQi0E2TLE9U+fV7Y8dbwRGASk2c20SLM0ObDiP6GtX4
         MUI3XA8i5smWlFVBrVrx8eOUjfNRiRtbwgWsUu81pTBwoNwt6NS+fjHbcmSQodGiiSPU
         VXFcVxMmLjKky2aGEgJ+f7ujR1s8to6aAZDylxjAk80DsbdnYuwFZirxx0CB76Dw10bO
         yDzSJVVfqZi9bGteO6gu0weDKpYKPcaPHt4/kGRcBFXte86kBux6RqddMWK6Tsd8FAMc
         SRC1UzmTJezjvisqumntDiMAfqrBfnx+3VtgSGX8H/62s9FEU0mMX8selbSThBZplgQg
         Qx6g==
X-Forwarded-Encrypted: i=1; AJvYcCXKw46jqlHgsMjMPvO2nyNpGXaisk2QCSaQQY5pydlV8BfuP4wn4RmUT64ewUiY/ZS2DGdbKolhCXyQ@vger.kernel.org
X-Gm-Message-State: AOJu0YynOiLidFz4TDd9SInQNyfytxE7AyieLZYdvQqXAJf7rt61yScu
	n9SjbWdcbEXlCAdBzYQ2y+oDYXJC2fgzaogdRBJ3Lm89DGs9T0Dy7fOJUKi625w+hfngujJooKl
	mdc105LhQaEESZJxe5aeF2XGTBvJPt9MwKUj1UCTheg==
X-Gm-Gg: ASbGnctscXLS/xb2KGROcgmEjsScwIrioazqvp28MhzGD4amNn4vGpUf3/1Lkzr9+nz
	VTN4ddOPMvo01xPDFruRHDiz8eRc4l13j/kjQRclilp6DWnZeJZ4GpoZpbcoaWEytWM37+oL0Vp
	c0BfMtExbX9r3Vq3HeQ3alIj8LZI6wKx7GisJqplBVuhRwN5jxhif2ZyTQ93ShUUc2lkIby/0bc
	SoPhuswti9WZ9L12XsJB1pDobQW1zWUxblokHVJNE4QneSH3Q==
X-Google-Smtp-Source: AGHT+IEztBpigh5RxbO1CBt/5KgEHGRrHXuTWtPssLeYdALPuaphhHGsx19aeCNSyhIa3AeA3fW9VXpZoFoDSTU49vc=
X-Received: by 2002:a2e:be08:0:b0:337:e3e0:39fc with SMTP id
 38308e7fff4ca-33b51b18984mr33377121fa.21.1757434819790; Tue, 09 Sep 2025
 09:20:19 -0700 (PDT)
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
 <CAHp75VdDAJO3+NPp29GnqL=C5m7tdWbyYvNFax=Dh+dG49YAnA@mail.gmail.com> <CAHp75VffDLfvdVhnzZk6V6a9eXq4R0ZBYLUw3S=g0ABqozhWFQ@mail.gmail.com>
In-Reply-To: <CAHp75VffDLfvdVhnzZk6V6a9eXq4R0ZBYLUw3S=g0ABqozhWFQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 9 Sep 2025 18:20:07 +0200
X-Gm-Features: Ac12FXz3JLlhRsOgq8cOPinTet2g1mbuWxd9zMtxwsTKBrX27rDe6FL8vxMW4vc
Message-ID: <CAMRc=Mf0sXnak0Ov3bwgv_xVVvw+CxA1iAcvDv+B4a155HZq2w@mail.gmail.com>
Subject: Re: [PATCH 13/15] gpio: sodaville: use new generic GPIO chip API
To: Andy Shevchenko <andy.shevchenko@gmail.com>
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

On Tue, Sep 9, 2025 at 5:26=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Sep 9, 2025 at 6:15=E2=80=AFPM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Tue, Sep 9, 2025 at 5:05=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.=
pl> wrote:
> > > On Tue, Sep 9, 2025 at 4:02=E2=80=AFPM Andy Shevchenko
> > > <andriy.shevchenko@intel.com> wrote:
> > > > On Tue, Sep 09, 2025 at 03:56:41PM +0200, Bartosz Golaszewski wrote=
:
> > > > > On Tue, Sep 9, 2025 at 3:47=E2=80=AFPM Andy Shevchenko
> > > > > <andriy.shevchenko@intel.com> wrote:
>
> ...
>
> > > > > > TBH, I think those 6 all made the same mistake, i.e. thinking o=
f the compound
> > > > > > literal as a cast. Which is not!
> > > > >
> > > > > What do you suggest?
> > > >
> > > > Write it in less odd way :-)
> > > >
> > > > foo =3D (struct bar) { ... };
> > >
> > > I don't get your reasoning. typeof() itself is well established in th=
e
> > > kernel and doesn't
> > >
> > > foo =3D (struct bar){ ... };
> > >
> > > evaluate to the same thing as
> > >
> > > foo =3D (typeof(foo)){ ... };
> > >
> > > ? Isn't it still the same compound literal?
> >
> > It makes it so, but typeof() usually is used for casts and not for
> > compound literals. That's (usage typeof() for compound literals) what
> > I am against in this case.
>
> FWIW, brief googling showed that nobody (okay, I haven't found yet
> reddit/SO/GCC or LLVM documentation) uses typeof() for compound
> literals. So, this makes me feel right, that the form of typeof() is
> weird and works due to unknown reasons. Any pointers to the
> documentation you read about it?
>

Ok I'll change it. I also need to change it in existing patches that
already landed in next then.

> > > > > And are we not allowed to use C99 features now anyway?
> > > >
> > > > It's fine, it's not about the C standard number.
>
> E.g., https://gcc.gnu.org/onlinedocs/gcc-15.1.0/gcc/Compound-Literals.htm=
l
> (8.1.0 is the same).
>

I get it, I understood incorrectly how they work, no need to rub it in. :)

Bart

