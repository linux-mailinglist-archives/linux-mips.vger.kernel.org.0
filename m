Return-Path: <linux-mips+bounces-1574-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DFD85A891
	for <lists+linux-mips@lfdr.de>; Mon, 19 Feb 2024 17:18:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 267BD1F24E86
	for <lists+linux-mips@lfdr.de>; Mon, 19 Feb 2024 16:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA4173B786;
	Mon, 19 Feb 2024 16:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="dcpdvjf1"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F1F3B79D
	for <linux-mips@vger.kernel.org>; Mon, 19 Feb 2024 16:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708359485; cv=none; b=j5aOWQzzPkOmVUa+KhzdnQF4m45IJuLhNygJMxGU7mDn9LUjsJanq/B57+dj8/bhdyS+0ceSflZtUUaXV9DiKliSp4nvmbKUo6H7v0xiMOfoPBRmgfdimwktjSZlY/6/rtDadbm/hDevGIf8enlHVSQjrtwPLkXIef0mSkPJpVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708359485; c=relaxed/simple;
	bh=qjzcx+ky+m9LqUCnQsunFaXlJI8F3Ray2e8gmZDQnsY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tuCWaHSmFVxPKZhJhI1Ii+m4h5wuCHgtW84jOux4MTDgKtqzjosNuNghXiXT1dFnuT9X6bg/T9BRbYGaISYJSWeAXR4JNxcoNRKWYvelJdJJK+bVuneSIn9AnOxUvjM9i+MNHmKSJsbAC181KmFtQ6yCTzEl9Eax8q8xPccbYSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=dcpdvjf1; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-21e7c3e3cf3so2416029fac.0
        for <linux-mips@vger.kernel.org>; Mon, 19 Feb 2024 08:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708359483; x=1708964283; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dkkKZJCCytTGAljspGkyIipfcm+Bvc2X5TtIBHDj2O0=;
        b=dcpdvjf1TK+Ev/Mj+ftRw+S4+JCtcDmwlMU8lw+zETf52zeuO0VJI6AVprwjcLhY9Y
         TvobkL7WVjHzERUl91TIu/CS5I2BpQ9XuCvDdquE+G5UrNj+EaISCqJJ7dynzXL3lSRn
         zpPaoOFzaSl76JhxqP5eCpQViiWYAaV3hkWD+tCrploWTbzkgPsx9IKEsILoJhkuQKLf
         aJThTzdVr6cPs+Yl1IGLn/1lzbUBb9HY9UEMMi/5+mvKnWnUmpYVFMC8ccRWNDrlofm5
         Roe+VhvVlpBva0iokGAhkiMUlPAv2xl5r+RBWIa7xzeNg1AaFVz9Yufnfs/X1kBKwWrw
         eZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708359483; x=1708964283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dkkKZJCCytTGAljspGkyIipfcm+Bvc2X5TtIBHDj2O0=;
        b=pDD6CdLHK+SITCenCcoxydfW44GMTrNlnhMFy1fseCgZkRPw8YF6+VSxJTx5pvr/iO
         b/2v57WIli5dRkEkdqRP5mf7KhjEL6yw74LMt4l3AghYhz76YnIYg3duGP4BL8Y/OP60
         Ki2jl/NcSil2YS08qSU8ZmibtTj+0kOooMJOvKGm431gfOzTfPFN/r1lZGd1s6ego1ZG
         a2VD1mImh+jso8NJes6W7TdN6C8D6UchotSf17D4lyrBLZKHxsNxLaafx7C0HFXap+6i
         jBzHw9DpXakmKJn47hrYeXvkv6iLWdcGFvudMkp3JHETtBXQeyZWNtAfstnJJ4ncelFC
         71Vg==
X-Forwarded-Encrypted: i=1; AJvYcCWhyTGaYuRVuC8qQTEqklyNXA0rKGZ1GNj1ofHxHuUp7rGzGWAB/gh+YpVAJv/Wl4Ttr4tpUrjiPqNflzxarBMngoLcf/lDywOm1Q==
X-Gm-Message-State: AOJu0Yxp6HX/z/X+ujV0Y2nOFT9lEJaqG11RgHMsQwZJo1DR3znRxyFF
	BzlhCIDIXcNZeF2AG0LtKKqiIz/L6kX5OnGHhQB8QMCQYFQBzxPuGGp6T1XvMUJKiO3+igIFiwd
	FW6eWBOT1IWJylADppIcO/uldEDt5Oz5As2SPdw==
X-Google-Smtp-Source: AGHT+IG5pyvJ8VZ6IeRCjDQVoO+8UramCL2g0nrYiEFGzvjye6ON6eV4Qtkb+srU6g6Hef9hGKjITtSXzU2gX9D/suw=
X-Received: by 2002:a05:6871:79a:b0:219:3054:3ea5 with SMTP id
 o26-20020a056871079a00b0021930543ea5mr12969383oap.45.1708359483560; Mon, 19
 Feb 2024 08:18:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240214-mbly-gpio-v1-0-f88c0ccf372b@bootlin.com> <20240214-mbly-gpio-v1-17-f88c0ccf372b@bootlin.com>
In-Reply-To: <20240214-mbly-gpio-v1-17-f88c0ccf372b@bootlin.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 19 Feb 2024 17:17:52 +0100
Message-ID: <CAMRc=Me=SiS5oScmm8jMNsed_2smN4p6s+xPnkTzjHM_hPPULQ@mail.gmail.com>
Subject: Re: [PATCH 17/23] gpio: nomadik: handle variadic GPIO count
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
> Read the "ngpios" device-tree property to determine the number of GPIOs
> for a bank. If not available, fallback to NMK_GPIO_PER_CHIP ie 32 ie
> the current behavior.
>
> The IP block always supports 32 GPIOs, but platforms can expose a lesser
> amount. The Mobileye EyeQ5 is in this case; one bank is 29 GPIOs and
> the other is 23.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> ---
>  drivers/gpio/gpio-nomadik.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-nomadik.c b/drivers/gpio/gpio-nomadik.c
> index 5b1e3b3efcff..02b53c58adf7 100644
> --- a/drivers/gpio/gpio-nomadik.c
> +++ b/drivers/gpio/gpio-nomadik.c
> @@ -490,7 +490,7 @@ struct nmk_gpio_chip *nmk_gpio_populate_chip(struct d=
evice_node *np,
>         struct resource *res;
>         struct clk *clk;
>         void __iomem *base;
> -       u32 id;
> +       u32 id, ngpio;
>
>         gpio_pdev =3D of_find_device_by_node(np);
>         if (!gpio_pdev) {
> @@ -518,10 +518,15 @@ struct nmk_gpio_chip *nmk_gpio_populate_chip(struct=
 device_node *np,
>                 return ERR_PTR(-ENOMEM);
>         }
>
> +       if (of_property_read_u32(np, "ngpios", &ngpio)) {

As commented elsewhere - please try to use device_property_read_u32().

Bart

> +               ngpio =3D NMK_GPIO_PER_CHIP;
> +               dev_dbg(&pdev->dev, "populate: using default ngpio (%d)\n=
", ngpio);
> +       }
> +
>         nmk_chip->bank =3D id;
>         chip =3D &nmk_chip->chip;
>         chip->base =3D -1;
> -       chip->ngpio =3D NMK_GPIO_PER_CHIP;
> +       chip->ngpio =3D ngpio;
>         chip->label =3D dev_name(&gpio_pdev->dev);
>         chip->parent =3D &gpio_pdev->dev;
>
>
> --
> 2.43.1
>

