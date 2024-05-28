Return-Path: <linux-mips+bounces-3351-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDD78D158F
	for <lists+linux-mips@lfdr.de>; Tue, 28 May 2024 09:55:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B881C281007
	for <lists+linux-mips@lfdr.de>; Tue, 28 May 2024 07:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF96E7347C;
	Tue, 28 May 2024 07:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hKsBoMMr"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0784973455;
	Tue, 28 May 2024 07:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716882928; cv=none; b=F3UXTaS7OgGB1LLS2jkduqOL6K8yqgClzRkFQO87zDqhBb/Yp17kfY6Gq4PZuntmJShqfP2UQHxSbucf8887NAVmqyPvhSDQcNQ8Mrgp1/47QftUs3ZUoCVuXZidye+pk+FuAlmuJ+UEGwsNufhdwR4d9JACLujei8vaKo0aAfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716882928; c=relaxed/simple;
	bh=R6li2qSJHY4Zry3GH36YCgY3UyjauxKz8BXw6VvAfrM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YalvWQqRUbUy0Enu1Vj3bdvcM4CvMKixnAVI638V2x4rqHoLV84WSNA4RxERR68ppvv3TT+mPlZ2ER+olZ1ECYZwTofSW5iQ7GbMnuRSPFfF37qb3DVxiKnF/Mf2w4hQLJgtithG/7ozOSYVraVHAK9nFvYjQsXN7EiNraPDrao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hKsBoMMr; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-57857e0f45dso556701a12.1;
        Tue, 28 May 2024 00:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716882925; x=1717487725; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pMiT8LTcs4yKjVj1sKcIhHVWOfjL9qElOZ3CbrzBJBc=;
        b=hKsBoMMrOWzY2zfcNMXjpIZdogDIV7DGdBNMgM+P3Z/QeC6oyJWjNavPorfFIjMrQd
         w5xegwpfi2UP8HnpIDZouECAoMUN55oumb0/5922ag8yZunfKFmi5yfZ/6B3T+LDzaoW
         O+dTsJ+dwWhKppJlMwR0nCDP+EeaJYalMyiMr7lpgLG4G3DXaYSBaj4D3diHmyiQXPKw
         o8h1MM22a97TzbpPwcX06f2QAga4x8dpD6w8tdeRchq8Sf/e3q5J4ozEbBC6Fs+Llvd9
         LVU/kZ6x2NKkRNgZOXamtAsH+LOyVEBI4p7zYw7ZGUmjfkeZDO1wzBSPgXFUP2U6Tt8r
         gaNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716882925; x=1717487725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pMiT8LTcs4yKjVj1sKcIhHVWOfjL9qElOZ3CbrzBJBc=;
        b=SnrEAmgvuwU1RDoBwA6fYcpnZPaVLEwlHIz8d8GulqAkTAf0hy5yWEpbQKvgVboatr
         YkHGgcjrv/U4LaMsqWO9CLDKiP/4eyEKJMu5A80pQsjnF1d/0JPgYyKHk9VgwooLCdoo
         9xKXxtrMVv9ljossCEEZl0zn/7HELHDO3hMBI6pKvRhRslFytBFlu9Gp4cD1qMaxY1LH
         wzsyAVkErXsldmdjjuuf+sDHVeslY9iLY7VzfYkNbZzEx3kCKhBZE8vl866I+zd911lY
         1irLFR3EgwoDO0D0vQz+qewqxO5m81sEygRgWMK+jz5PslkgRxQFqTFRYIj59+treysD
         H93w==
X-Forwarded-Encrypted: i=1; AJvYcCVntHlbXVZ2PP8p21WE5ADkLmjS4h1k9KSw1/6is1Ezp5xUxPdJd8Hg4vvy3+O7RoMzmecGKAOcsccTfASZ5/FTAzT7XoRUsmXxJOrzZPRBTbiifl8BXX+CwEBfUky6caqMRj8vU8SRHEjZPXeOmh2Ub81+zeuHiCYV3MMya23IR3g/mzM=
X-Gm-Message-State: AOJu0Yz5+0+RuCOqiKdo8+WwwJZLmyis/ul6jYlDmmlpTUT59nI34xgw
	o+gx1e5PpVXMxEWQPgWN3aUlpWiiW+ppMr7aanAWzJGrtsQpDLclkjb9/X63cuUHSzDAKY73IYS
	8AVNBeje+f0yJvMQETUaddURxuPU=
X-Google-Smtp-Source: AGHT+IHr6+atjIS3eVhctcvMSXAyxcT5ObA7f35cxqOpVcGAqzzxm3OLIs5Ui2KSAmrMvmCsZFtZwEOWPU2rkL4bMl4=
X-Received: by 2002:a17:906:2ecd:b0:a61:e825:8a75 with SMTP id
 a640c23a62f3a-a62641d9a10mr677433866b.18.1716882925022; Tue, 28 May 2024
 00:55:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240527022036.31985-1-user@blabla> <CAMhs-H9CEvN8QXcQgin6NRZYzYFn5T82tLsu4rBbSMMBy=Xoiw@mail.gmail.com>
In-Reply-To: <CAMhs-H9CEvN8QXcQgin6NRZYzYFn5T82tLsu4rBbSMMBy=Xoiw@mail.gmail.com>
From: =?UTF-8?B?5p2O57u06LGq?= <cn.liweihao@gmail.com>
Date: Tue, 28 May 2024 15:55:13 +0800
Message-ID: <CAPEOAkRXM7yJnAFCcDyrCzRvCOYrD7_zcH3nai0wja9EyHM5bQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: ralink: mt76x8: fix pinmux function
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: arinc.unal@arinc9.com, sean.wang@kernel.org, linus.walleij@linaro.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Shiji Yang <yangshiji66@outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi. Thanks for your reply!

I forgot to reply all, so I resend this mail. Sorry about that orz.

Sergio Paracuellos <sergio.paracuellos@gmail.com> =E4=BA=8E2024=E5=B9=B45=
=E6=9C=8828=E6=97=A5=E5=91=A8=E4=BA=8C 15:10=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
> On Mon, May 27, 2024 at 4:21=E2=80=AFAM liweihao <cn.liweihao@gmail.com> =
wrote:
> >
> > From: Weihao Li <cn.liweihao@gmail.com>
> >
> > The current version of the pinctrl driver has some issues:
>
> Regarding the dtsi file which is in the kernel tree mt76x8 is using
> 'pinctrl-single' for pin muxing [0].
>

You're right. But in my application, I need to set the PAD_GPIO0 as
refclk function, and the 'pinctrl-single' driver did not implement
this function, so I have to use 'ralink,mt76x8-pinctrl' instead of
'pinctrl-single'. And for some compatibility reasons, i prefer to use
the dedicated driver instead of 'pinctrl-single' driver. That's why I
just committed a single driver patch. the previous text 'current
version of the pinctrl driver' just means
drivers/pinctrl/mediatek/pinctrl-mt76x8.c.

> >
> > 1. Duplicated "gpio" pmx function
> >
> > The common code will add a "gpio" pmx functon to every pin group, so
> > it's not necessary to define a separate "gpio" pmx function in pin
> > groups.
>
> Do you mean that pin 0 always has a GPIO function? [1]
>

No. The mediatek pinctrl common code will add a 'gpio' function to
every pingrp [0].


> > 2. Duplicated pmx function name
> >
> > There are some same function name in different pin groups, which will
> > cause some problems. For example, when we want to use PAD_GPIO0 as
> > refclk output function, the common clk framework code will search the
> > entire pin function lists, then return the first one matched, in this
> > case the matched function list only include the PAD_CO_CLKO pin group
> > because there are three "refclk" pin function, which is added by
> > refclk_grp, spi_cs1_grp and gpio_grp.
> >
> > To solve this problem, a simple way is just add a pingrp refix to
> > function name like mt7620 pinctrl driver does.
> >
> > 3. Useless "-" or "rsvd" functon
> >
> > It's really unnecessary to add a reserved pin mux function to the
> > function lists, because we never use it.
> >
> > Signed-off-by: Weihao Li <cn.liweihao@gmail.com>
> > ---
> >  drivers/pinctrl/mediatek/pinctrl-mt76x8.c | 88 +++++++----------------
> >  1 file changed, 27 insertions(+), 61 deletions(-)
> >
> > diff --git a/drivers/pinctrl/mediatek/pinctrl-mt76x8.c b/drivers/pinctr=
l/mediatek/pinctrl-mt76x8.c
> > index e7d6ad2f62e4e..2bc8d4409ca27 100644
> > --- a/drivers/pinctrl/mediatek/pinctrl-mt76x8.c
> > +++ b/drivers/pinctrl/mediatek/pinctrl-mt76x8.c
> > @@ -37,36 +37,30 @@
> >
> >  static struct mtmips_pmx_func pwm1_grp[] =3D {
> >         FUNC("sdxc d6", 3, 19, 1),
> > -       FUNC("utif", 2, 19, 1),
> > -       FUNC("gpio", 1, 19, 1),
> > +       FUNC("pwm1 utif", 2, 19, 1),
> >         FUNC("pwm1", 0, 19, 1),
> >  };
> >
> >  static struct mtmips_pmx_func pwm0_grp[] =3D {
> >         FUNC("sdxc d7", 3, 18, 1),
> > -       FUNC("utif", 2, 18, 1),
> > -       FUNC("gpio", 1, 18, 1),
> > +       FUNC("pwm0 utif", 2, 18, 1),
> >         FUNC("pwm0", 0, 18, 1),
> >  };
> >
> >  static struct mtmips_pmx_func uart2_grp[] =3D {
> >         FUNC("sdxc d5 d4", 3, 20, 2),
> > -       FUNC("pwm", 2, 20, 2),
> > -       FUNC("gpio", 1, 20, 2),
> > +       FUNC("uart2 pwm", 2, 20, 2),
> >         FUNC("uart2", 0, 20, 2),
> >  };
> >
> >  static struct mtmips_pmx_func uart1_grp[] =3D {
> >         FUNC("sw_r", 3, 45, 2),
> > -       FUNC("pwm", 2, 45, 2),
> > -       FUNC("gpio", 1, 45, 2),
> > +       FUNC("uart1 pwm", 2, 45, 2),
> >         FUNC("uart1", 0, 45, 2),
> >  };
> >
> >  static struct mtmips_pmx_func i2c_grp[] =3D {
> > -       FUNC("-", 3, 4, 2),
> >         FUNC("debug", 2, 4, 2),
> > -       FUNC("gpio", 1, 4, 2),
> >         FUNC("i2c", 0, 4, 2),
> >  };
> >
> > @@ -76,128 +70,100 @@ static struct mtmips_pmx_func wdt_grp[] =3D { FUN=
C("wdt", 0, 38, 1) };
> >  static struct mtmips_pmx_func spi_grp[] =3D { FUNC("spi", 0, 7, 4) };
> >
> >  static struct mtmips_pmx_func sd_mode_grp[] =3D {
> > -       FUNC("jtag", 3, 22, 8),
> > -       FUNC("utif", 2, 22, 8),
> > -       FUNC("gpio", 1, 22, 8),
> > +       FUNC("sdxc jtag", 3, 22, 8),
> > +       FUNC("sdxc utif", 2, 22, 8),
> >         FUNC("sdxc", 0, 22, 8),
> >  };
> >
> >  static struct mtmips_pmx_func uart0_grp[] =3D {
> > -       FUNC("-", 3, 12, 2),
> > -       FUNC("-", 2, 12, 2),
> > -       FUNC("gpio", 1, 12, 2),
> >         FUNC("uart0", 0, 12, 2),
> >  };
> >
> >  static struct mtmips_pmx_func i2s_grp[] =3D {
> >         FUNC("antenna", 3, 0, 4),
> >         FUNC("pcm", 2, 0, 4),
> > -       FUNC("gpio", 1, 0, 4),
> >         FUNC("i2s", 0, 0, 4),
> >  };
> >
> >  static struct mtmips_pmx_func spi_cs1_grp[] =3D {
> > -       FUNC("-", 3, 6, 1),
> > -       FUNC("refclk", 2, 6, 1),
> > -       FUNC("gpio", 1, 6, 1),
> > +       FUNC("spi refclk", 2, 6, 1),
> >         FUNC("spi cs1", 0, 6, 1),
> >  };
> >
> >  static struct mtmips_pmx_func spis_grp[] =3D {
> >         FUNC("pwm_uart2", 3, 14, 4),
> > -       FUNC("utif", 2, 14, 4),
> > -       FUNC("gpio", 1, 14, 4),
> > +       FUNC("spis utif", 2, 14, 4),
> >         FUNC("spis", 0, 14, 4),
> >  };
> >
> >  static struct mtmips_pmx_func gpio_grp[] =3D {
> >         FUNC("pcie", 3, 11, 1),
> > -       FUNC("refclk", 2, 11, 1),
> > -       FUNC("gpio", 1, 11, 1),
> > -       FUNC("gpio", 0, 11, 1),
> > +       FUNC("gpio refclk", 2, 11, 1),
> >  };
> >
> >  static struct mtmips_pmx_func p4led_kn_grp[] =3D {
> > -       FUNC("jtag", 3, 30, 1),
> > -       FUNC("utif", 2, 30, 1),
> > -       FUNC("gpio", 1, 30, 1),
> > +       FUNC("p4led_kn jtag", 3, 30, 1),
> > +       FUNC("p4led_kn utif", 2, 30, 1),
> >         FUNC("p4led_kn", 0, 30, 1),
> >  };
> >
> >  static struct mtmips_pmx_func p3led_kn_grp[] =3D {
> > -       FUNC("jtag", 3, 31, 1),
> > -       FUNC("utif", 2, 31, 1),
> > -       FUNC("gpio", 1, 31, 1),
> > +       FUNC("p3led_kn jtag", 3, 31, 1),
> > +       FUNC("p3led_kn utif", 2, 31, 1),
> >         FUNC("p3led_kn", 0, 31, 1),
> >  };
> >
> >  static struct mtmips_pmx_func p2led_kn_grp[] =3D {
> > -       FUNC("jtag", 3, 32, 1),
> > -       FUNC("utif", 2, 32, 1),
> > -       FUNC("gpio", 1, 32, 1),
> > +       FUNC("p2led_kn jtag", 3, 32, 1),
> > +       FUNC("p2led_kn utif", 2, 32, 1),
> >         FUNC("p2led_kn", 0, 32, 1),
> >  };
> >
> >  static struct mtmips_pmx_func p1led_kn_grp[] =3D {
> > -       FUNC("jtag", 3, 33, 1),
> > -       FUNC("utif", 2, 33, 1),
> > -       FUNC("gpio", 1, 33, 1),
> > +       FUNC("p1led_kn jtag", 3, 33, 1),
> > +       FUNC("p1led_kn utif", 2, 33, 1),
> >         FUNC("p1led_kn", 0, 33, 1),
> >  };
> >
> >  static struct mtmips_pmx_func p0led_kn_grp[] =3D {
> > -       FUNC("jtag", 3, 34, 1),
> > -       FUNC("rsvd", 2, 34, 1),
> > -       FUNC("gpio", 1, 34, 1),
> > +       FUNC("p0led_kn jtag", 3, 34, 1),
> >         FUNC("p0led_kn", 0, 34, 1),
> >  };
> >
> >  static struct mtmips_pmx_func wled_kn_grp[] =3D {
> > -       FUNC("rsvd", 3, 35, 1),
> > -       FUNC("rsvd", 2, 35, 1),
> > -       FUNC("gpio", 1, 35, 1),
> >         FUNC("wled_kn", 0, 35, 1),
> >  };
> >
> >  static struct mtmips_pmx_func p4led_an_grp[] =3D {
> > -       FUNC("jtag", 3, 39, 1),
> > -       FUNC("utif", 2, 39, 1),
> > -       FUNC("gpio", 1, 39, 1),
> > +       FUNC("p4led_an jtag", 3, 39, 1),
> > +       FUNC("p4led_an utif", 2, 39, 1),
> >         FUNC("p4led_an", 0, 39, 1),
> >  };
> >
> >  static struct mtmips_pmx_func p3led_an_grp[] =3D {
> > -       FUNC("jtag", 3, 40, 1),
> > -       FUNC("utif", 2, 40, 1),
> > -       FUNC("gpio", 1, 40, 1),
> > +       FUNC("p3led_an jtag", 3, 40, 1),
> > +       FUNC("p3led_an utif", 2, 40, 1),
> >         FUNC("p3led_an", 0, 40, 1),
> >  };
> >
> >  static struct mtmips_pmx_func p2led_an_grp[] =3D {
> > -       FUNC("jtag", 3, 41, 1),
> > -       FUNC("utif", 2, 41, 1),
> > -       FUNC("gpio", 1, 41, 1),
> > +       FUNC("p2led_an jtag", 3, 41, 1),
> > +       FUNC("p2led_an utif", 2, 41, 1),
> >         FUNC("p2led_an", 0, 41, 1),
> >  };
> >
> >  static struct mtmips_pmx_func p1led_an_grp[] =3D {
> > -       FUNC("jtag", 3, 42, 1),
> > -       FUNC("utif", 2, 42, 1),
> > -       FUNC("gpio", 1, 42, 1),
> > +       FUNC("p1led_an jtag", 3, 42, 1),
> > +       FUNC("p1led_an utif", 2, 42, 1),
> >         FUNC("p1led_an", 0, 42, 1),
> >  };
> >
> >  static struct mtmips_pmx_func p0led_an_grp[] =3D {
> > -       FUNC("jtag", 3, 43, 1),
> > -       FUNC("rsvd", 2, 43, 1),
> > -       FUNC("gpio", 1, 43, 1),
> > +       FUNC("p0led_an jtag", 3, 43, 1),
> >         FUNC("p0led_an", 0, 43, 1),
> >  };
> >
> >  static struct mtmips_pmx_func wled_an_grp[] =3D {
> > -       FUNC("rsvd", 3, 44, 1),
> > -       FUNC("rsvd", 2, 44, 1),
> > -       FUNC("gpio", 1, 44, 1),
> >         FUNC("wled_an", 0, 44, 1),
> >  };
> >
> > --
> > 2.39.2
> >
>
> Changes look good to me. However I cannot test them.
>
> [+cc Shiji Yang] who probably has a related board to test.
>
> Thanks,
>     Sergio Paracuellos
>
> [0]: https://elixir.bootlin.com/linux/latest/source/arch/mips/boot/dts/ra=
link/mt7628a.dtsi#L45
> [1]: https://elixir.bootlin.com/linux/latest/source/drivers/pinctrl/media=
tek/pinctrl-mtmips.c#L297

[0]: https://elixir.bootlin.com/linux/latest/source/drivers/pinctrl/mediate=
k/pinctrl-mtmips.c#L217

