Return-Path: <linux-mips+bounces-1570-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A59B885A7E5
	for <lists+linux-mips@lfdr.de>; Mon, 19 Feb 2024 16:55:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B1482826C4
	for <lists+linux-mips@lfdr.de>; Mon, 19 Feb 2024 15:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19F283B190;
	Mon, 19 Feb 2024 15:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="sCL4nwJt"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E40E38DEA
	for <linux-mips@vger.kernel.org>; Mon, 19 Feb 2024 15:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708358099; cv=none; b=IYHDlGQXB00mnCDEGX64FE2eRsN1v7PqyFCVejNDA4NIMbddydwwCxRzZHHRh+L3bNJCMKLYfm20ByazIIOlXsUOhDe8KtcNdYl+ma7Nh2SmPl+B5vkuLcEjb+oWQ9tMP+I3tb/9feER4azqXGflRtSlEBfuWNK4zn/ANgBtskQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708358099; c=relaxed/simple;
	bh=RiKNqdAWkc15btUAvtH8gwvQqvzLDrXQfP0TuTCrgc0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M2qk4aieOAzBChqdtRN3cKgKufz/obWGpa72G/KxnZ2I/t4F0ojW7K6VWstJpCVJTHDYIJxcLbCZ2DA1KAuILnerUfIxu7GsvcMLBVKDmnODz3YwUuNA/hRxlvAd52ZFexPQ7SIFpYw7g7oAyyAU3Kta2uhqp9+XCEcZU6foqSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=sCL4nwJt; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-7d5a6b1dd60so1854134241.3
        for <linux-mips@vger.kernel.org>; Mon, 19 Feb 2024 07:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708358095; x=1708962895; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/EZ3A2c0ZKjpnKWkkWce/b5c+QP/TKCtzjAs9idwae4=;
        b=sCL4nwJtwYy1tFrxvYCa8cHAMsh/+xgQUl6HYgA5pVOBnbCzL1hcGwr1TBH8hAUKfM
         tZr2JhYGy6VbGYA7uIUtbiu98UIoTEMniehEV3W1IvQSmFYwiSJInS6hQ3HYwwut+jzH
         yjfJ1DI9bYVZX/KyK6Mx/cnqzyTqNyq9YfEypBCUuwAndlsREeeoKB480tMoNMRJea3H
         Vmzx2a1e4UwriJQiMsTiJSMf/7hpwd9fjkfARuwHffh2GYwE+RWeATx3AqbUn33uS2ZZ
         bSaQIKfBPoTLlCtZ0OrH2vBm4KmFdhd9GMzWCCrwQuItJC4ObKykKSOol7JiSrWWLr0Q
         GrQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708358095; x=1708962895;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/EZ3A2c0ZKjpnKWkkWce/b5c+QP/TKCtzjAs9idwae4=;
        b=L+prTFycVHAbd1SVCVdLlDonRtyHZi/bldLxHG/TawfN0LaIXJOwELF9VscWUyojbR
         DtRM4YUTW5BCdtEQPIZrkNNXpUV+nIaZgGdOMSPmqOGE8L4gX2OQVox7AmQSzDuvI/4y
         SMiwX6zEDOgjen/lhZbC7KRe9YlKlqbGgAq2/6k2sMzYFXY7pZLL81vLBUL/vRsOzC/r
         e2n/dV9D16EU7SX1y5sjr9mbVBltkWadu8fvdnv2SkXO1+NhPyxie7ftyGB6cqCX0Bn+
         Ha+N9KvmjY1/9Dc6eqLolel81BodBvztAtO53Xx6Jr+0egG/6mtoKejKrlyBxcqzbpq6
         P5mQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPO7nBaTOZoLAFbbcwQhWj9MFhG322EPAt6VM07Uph/tjdY0DA18X76PWACRFY6y15SQgP+WkLQ+/+208T4xCT6Q6ySV0ZOMfZCw==
X-Gm-Message-State: AOJu0YxjCDE2st7MvCWJaDlG0+Ou2qt6+IHof1lwNzu6tvYtBiKeFTsQ
	+aAkIpzw2acLdQf2lM86/5uNeeE8y53a+cADj0625PxImjjaUrNYIR3dYFlTazb0sZtQzVdWzbE
	vAcy6UN/BKpzdkp6l6Qh5ZCNdzwQvyThqU8CFJA==
X-Google-Smtp-Source: AGHT+IFVBEUOIdiIo9CXYAQsKMkED1i4PMCL4v5mm6zw8jSR88hZQ+SvhJJ9wdEoocImvLl4O0SeMqWkEwZE8ZJciIE=
X-Received: by 2002:a05:6102:3710:b0:470:43f2:d10a with SMTP id
 s16-20020a056102371000b0047043f2d10amr5296383vst.33.1708358093997; Mon, 19
 Feb 2024 07:54:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240214-mbly-gpio-v1-0-f88c0ccf372b@bootlin.com> <20240214-mbly-gpio-v1-13-f88c0ccf372b@bootlin.com>
In-Reply-To: <20240214-mbly-gpio-v1-13-f88c0ccf372b@bootlin.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 19 Feb 2024 16:54:43 +0100
Message-ID: <CAMRc=MdwAQUgc=LP45r-j0UCtN1gzPg9_y3hrbQhCyH91D=W-g@mail.gmail.com>
Subject: Re: [PATCH 13/23] gpio: nomadik: fix offset bug in nmk_pmx_set()
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 14, 2024 at 5:24=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootl=
in.com> wrote:
>
> Previously, the statement looked like:
>
>     slpm[x] &=3D ~BIT(g->pins[i]);
>
> Where:
>  - slpm is a unsigned int pointer;
>  - g->pins[i] is a pin number which can grow to more than 32.
>
> The expected shift amount is a pin bank offset.
>
> This bug does not occur on every group or pin: the altsetting must be
> NMK_GPIO_ALT_C and the pin must be 32 or above. It is possible that it
> occurred. For example, in pinctrl-nomadik-db8500.c, pin group i2c3_c_2
> has the right altsetting and has pins 229 and 230.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Maybe add a Fixes: tag and put it at the beginning of the series so
that it can go upstream earlier as a fix?

Bart

> ---
>  drivers/pinctrl/nomadik/pinctrl-nomadik.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/=
nomadik/pinctrl-nomadik.c
> index c7693fbc0484..99bdb25f358d 100644
> --- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
> +++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
> @@ -913,8 +913,9 @@ static int nmk_pmx_set(struct pinctrl_dev *pctldev, u=
nsigned int function,
>                  */
>                 for (i =3D 0; i < g->grp.npins; i++) {
>                         struct nmk_gpio_chip *nmk_chip;
> +                       unsigned int bit;
>
> -                       nmk_chip =3D find_nmk_gpio_from_pin(g->grp.pins[i=
], NULL);
> +                       nmk_chip =3D find_nmk_gpio_from_pin(g->grp.pins[i=
], &bit);
>                         if (!nmk_chip) {
>                                 dev_err(npct->dev,
>                                         "invalid pin offset %d in group %=
s at index %d\n",
> @@ -922,7 +923,7 @@ static int nmk_pmx_set(struct pinctrl_dev *pctldev, u=
nsigned int function,
>                                 goto out_pre_slpm_init;
>                         }
>
> -                       slpm[nmk_chip->bank] &=3D ~BIT(g->grp.pins[i]);
> +                       slpm[nmk_chip->bank] &=3D ~BIT(bit);
>                 }
>                 nmk_gpio_glitch_slpm_init(slpm);
>         }
>
> --
> 2.43.1
>

