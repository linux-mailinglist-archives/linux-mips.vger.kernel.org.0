Return-Path: <linux-mips+bounces-3350-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF218D14F9
	for <lists+linux-mips@lfdr.de>; Tue, 28 May 2024 09:10:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 90FECB21CB5
	for <lists+linux-mips@lfdr.de>; Tue, 28 May 2024 07:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C91A86F066;
	Tue, 28 May 2024 07:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fSWF6FnM"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0F11DFEF;
	Tue, 28 May 2024 07:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716880234; cv=none; b=QY7Xcp2GimLRyg6X6Z7UEYxOYkfn+b2eK5pS4rTq3sd5ziDlq9a52Ai1S7s2Hw/yGRaNx2yTf2z/PA18TPMwjjM1hLdhTVWVdOrc2cgjRp27m0OMmSmBEt2u+2nvKdChYLIfCViVKQhGNayzaNzsoXRJeAmaZ3LVfnthP67s/rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716880234; c=relaxed/simple;
	bh=u1KdQGbuF/ITXcz/RuVt+SXFHLsAqvm7w1Mpj1vuha8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rJ/H1iAzImW8bWvCNY7zSOo4qT+YdSW7n4v7itxpCK03mEW8SJrZYWTL9WoqKjtWdC4CREwc8H62fiAr2KWUYCySD7NM3751YdGV1IDXcVee8eI1IiPVSlCnOn+gyJIj4+Owg57E3Q0kfWl6B0s2/5sYWg7H0b2DzQb9YDiK+DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fSWF6FnM; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3d1b88ce99cso349027b6e.1;
        Tue, 28 May 2024 00:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716880232; x=1717485032; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SXVLAY2x3v6SruhAQks8WRKld2PmcTHYFpAvp6RqutY=;
        b=fSWF6FnMHSXHiJsjmQCzjtRcnbDumkW++eJj02mIMJBYh3kVGT0xT8hmviStscRJ07
         EFEXw+03SV/9IP0mZ13kEYAjXmTUA2CmWQVJm6n71Dvk2NbCatUK67yv41hcBDpUc2nS
         gn0g/TOn7fv4uKN4T/Uhk6BsDyPhX/pe74fg11UgskeTdH/qyVf0qPm9xvesrXUwBDNk
         EJF543YnMrhHwzkezV/NO9Jb03Cw198W+4mRqot7Fg8kSR10wr7ubVWHRJQVNBqG8+7s
         oXzT2FSU2TlVpAzAylj/az716yPsy7aj0QM6l9Gk0sA7Vm0T4kX1JdVL8pf5Zo/m/k2P
         xV+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716880232; x=1717485032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SXVLAY2x3v6SruhAQks8WRKld2PmcTHYFpAvp6RqutY=;
        b=xEPhCXII5jOexh3dk/LXRGzcjdfPnfNPZ6vUk7xHWS7bZhqd55EwJRdKCOGbEQa0aU
         CyJ6UZy/F2d+Ei4zdFz3ikWrgDZITijPSl0dg8ULTg5gsm5w/BOmNcdylR0X8heEaluB
         KGzim0TSe3EwJXzprb5Z60Nu4fK9NcZSfOoxpIQfIWOXs/MzVdVfdC57qhmJeZq0wLpu
         2WZd4LmQ4LKDDhZx7mTWgpIwMEUK7Fd73JRRILtlRhvIb5JSWnCUHK3c/gkRIZZtR6dl
         Y8WCg/5ghGABeP5k2yTg9D6LUiRTMLa5PxwpZx6d9TdSHFLuvgveg98hNeY0c8E0BLvf
         u/Jw==
X-Forwarded-Encrypted: i=1; AJvYcCUhdQ1dTkHMyIy1s+5VQ5m23dOG6hHFkf9UpH/PKxZMtiOeUwk7ofqkkXEIzGj9L1B40MuaZwGF/uPDbRiWd/eobiEE9GyPTQBH8XIK2PBtsFNEtKZf2g5GydJL/DKd8zjWjuR0EaDcNIDv/PcPj4LddeX86KijV9TzbB+qyDGzUIqbfDM=
X-Gm-Message-State: AOJu0YzQxuN0j/SucvzBaMbX6uyui75j6u69W653+Wsq/oUsX0eLLQPx
	Ao4e/Lm8Nop6dkw6GcBzOBQw0tSHe8d4CVHLzKP+ZSUqQ5q904Kw4GwfK2gjqwuDfRtz6Ep7ZW9
	gGPsCctrZTLE6aPlaLkSW1OmhvaA=
X-Google-Smtp-Source: AGHT+IG7/4IGI6+FU57FIPweI541/H6tVsdVG55Of6kcOatVKCdmr/2wrFN29fLomtzAblGnLVtjLzKIeq+lRQve53c=
X-Received: by 2002:a05:6808:6284:b0:3d1:b4d5:88fe with SMTP id
 5614622812f47-3d1b4d593d2mr11295324b6e.54.1716880230778; Tue, 28 May 2024
 00:10:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240527022036.31985-1-user@blabla>
In-Reply-To: <20240527022036.31985-1-user@blabla>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Tue, 28 May 2024 09:10:18 +0200
Message-ID: <CAMhs-H9CEvN8QXcQgin6NRZYzYFn5T82tLsu4rBbSMMBy=Xoiw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: ralink: mt76x8: fix pinmux function
To: liweihao <cn.liweihao@gmail.com>
Cc: arinc.unal@arinc9.com, sean.wang@kernel.org, linus.walleij@linaro.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Shiji Yang <yangshiji66@outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, May 27, 2024 at 4:21=E2=80=AFAM liweihao <cn.liweihao@gmail.com> wr=
ote:
>
> From: Weihao Li <cn.liweihao@gmail.com>
>
> The current version of the pinctrl driver has some issues:

Regarding the dtsi file which is in the kernel tree mt76x8 is using
'pinctrl-single' for pin muxing [0].

>
> 1. Duplicated "gpio" pmx function
>
> The common code will add a "gpio" pmx functon to every pin group, so
> it's not necessary to define a separate "gpio" pmx function in pin
> groups.

Do you mean that pin 0 always has a GPIO function? [1]

> 2. Duplicated pmx function name
>
> There are some same function name in different pin groups, which will
> cause some problems. For example, when we want to use PAD_GPIO0 as
> refclk output function, the common clk framework code will search the
> entire pin function lists, then return the first one matched, in this
> case the matched function list only include the PAD_CO_CLKO pin group
> because there are three "refclk" pin function, which is added by
> refclk_grp, spi_cs1_grp and gpio_grp.
>
> To solve this problem, a simple way is just add a pingrp refix to
> function name like mt7620 pinctrl driver does.
>
> 3. Useless "-" or "rsvd" functon
>
> It's really unnecessary to add a reserved pin mux function to the
> function lists, because we never use it.
>
> Signed-off-by: Weihao Li <cn.liweihao@gmail.com>
> ---
>  drivers/pinctrl/mediatek/pinctrl-mt76x8.c | 88 +++++++----------------
>  1 file changed, 27 insertions(+), 61 deletions(-)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt76x8.c b/drivers/pinctrl/=
mediatek/pinctrl-mt76x8.c
> index e7d6ad2f62e4e..2bc8d4409ca27 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mt76x8.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt76x8.c
> @@ -37,36 +37,30 @@
>
>  static struct mtmips_pmx_func pwm1_grp[] =3D {
>         FUNC("sdxc d6", 3, 19, 1),
> -       FUNC("utif", 2, 19, 1),
> -       FUNC("gpio", 1, 19, 1),
> +       FUNC("pwm1 utif", 2, 19, 1),
>         FUNC("pwm1", 0, 19, 1),
>  };
>
>  static struct mtmips_pmx_func pwm0_grp[] =3D {
>         FUNC("sdxc d7", 3, 18, 1),
> -       FUNC("utif", 2, 18, 1),
> -       FUNC("gpio", 1, 18, 1),
> +       FUNC("pwm0 utif", 2, 18, 1),
>         FUNC("pwm0", 0, 18, 1),
>  };
>
>  static struct mtmips_pmx_func uart2_grp[] =3D {
>         FUNC("sdxc d5 d4", 3, 20, 2),
> -       FUNC("pwm", 2, 20, 2),
> -       FUNC("gpio", 1, 20, 2),
> +       FUNC("uart2 pwm", 2, 20, 2),
>         FUNC("uart2", 0, 20, 2),
>  };
>
>  static struct mtmips_pmx_func uart1_grp[] =3D {
>         FUNC("sw_r", 3, 45, 2),
> -       FUNC("pwm", 2, 45, 2),
> -       FUNC("gpio", 1, 45, 2),
> +       FUNC("uart1 pwm", 2, 45, 2),
>         FUNC("uart1", 0, 45, 2),
>  };
>
>  static struct mtmips_pmx_func i2c_grp[] =3D {
> -       FUNC("-", 3, 4, 2),
>         FUNC("debug", 2, 4, 2),
> -       FUNC("gpio", 1, 4, 2),
>         FUNC("i2c", 0, 4, 2),
>  };
>
> @@ -76,128 +70,100 @@ static struct mtmips_pmx_func wdt_grp[] =3D { FUNC(=
"wdt", 0, 38, 1) };
>  static struct mtmips_pmx_func spi_grp[] =3D { FUNC("spi", 0, 7, 4) };
>
>  static struct mtmips_pmx_func sd_mode_grp[] =3D {
> -       FUNC("jtag", 3, 22, 8),
> -       FUNC("utif", 2, 22, 8),
> -       FUNC("gpio", 1, 22, 8),
> +       FUNC("sdxc jtag", 3, 22, 8),
> +       FUNC("sdxc utif", 2, 22, 8),
>         FUNC("sdxc", 0, 22, 8),
>  };
>
>  static struct mtmips_pmx_func uart0_grp[] =3D {
> -       FUNC("-", 3, 12, 2),
> -       FUNC("-", 2, 12, 2),
> -       FUNC("gpio", 1, 12, 2),
>         FUNC("uart0", 0, 12, 2),
>  };
>
>  static struct mtmips_pmx_func i2s_grp[] =3D {
>         FUNC("antenna", 3, 0, 4),
>         FUNC("pcm", 2, 0, 4),
> -       FUNC("gpio", 1, 0, 4),
>         FUNC("i2s", 0, 0, 4),
>  };
>
>  static struct mtmips_pmx_func spi_cs1_grp[] =3D {
> -       FUNC("-", 3, 6, 1),
> -       FUNC("refclk", 2, 6, 1),
> -       FUNC("gpio", 1, 6, 1),
> +       FUNC("spi refclk", 2, 6, 1),
>         FUNC("spi cs1", 0, 6, 1),
>  };
>
>  static struct mtmips_pmx_func spis_grp[] =3D {
>         FUNC("pwm_uart2", 3, 14, 4),
> -       FUNC("utif", 2, 14, 4),
> -       FUNC("gpio", 1, 14, 4),
> +       FUNC("spis utif", 2, 14, 4),
>         FUNC("spis", 0, 14, 4),
>  };
>
>  static struct mtmips_pmx_func gpio_grp[] =3D {
>         FUNC("pcie", 3, 11, 1),
> -       FUNC("refclk", 2, 11, 1),
> -       FUNC("gpio", 1, 11, 1),
> -       FUNC("gpio", 0, 11, 1),
> +       FUNC("gpio refclk", 2, 11, 1),
>  };
>
>  static struct mtmips_pmx_func p4led_kn_grp[] =3D {
> -       FUNC("jtag", 3, 30, 1),
> -       FUNC("utif", 2, 30, 1),
> -       FUNC("gpio", 1, 30, 1),
> +       FUNC("p4led_kn jtag", 3, 30, 1),
> +       FUNC("p4led_kn utif", 2, 30, 1),
>         FUNC("p4led_kn", 0, 30, 1),
>  };
>
>  static struct mtmips_pmx_func p3led_kn_grp[] =3D {
> -       FUNC("jtag", 3, 31, 1),
> -       FUNC("utif", 2, 31, 1),
> -       FUNC("gpio", 1, 31, 1),
> +       FUNC("p3led_kn jtag", 3, 31, 1),
> +       FUNC("p3led_kn utif", 2, 31, 1),
>         FUNC("p3led_kn", 0, 31, 1),
>  };
>
>  static struct mtmips_pmx_func p2led_kn_grp[] =3D {
> -       FUNC("jtag", 3, 32, 1),
> -       FUNC("utif", 2, 32, 1),
> -       FUNC("gpio", 1, 32, 1),
> +       FUNC("p2led_kn jtag", 3, 32, 1),
> +       FUNC("p2led_kn utif", 2, 32, 1),
>         FUNC("p2led_kn", 0, 32, 1),
>  };
>
>  static struct mtmips_pmx_func p1led_kn_grp[] =3D {
> -       FUNC("jtag", 3, 33, 1),
> -       FUNC("utif", 2, 33, 1),
> -       FUNC("gpio", 1, 33, 1),
> +       FUNC("p1led_kn jtag", 3, 33, 1),
> +       FUNC("p1led_kn utif", 2, 33, 1),
>         FUNC("p1led_kn", 0, 33, 1),
>  };
>
>  static struct mtmips_pmx_func p0led_kn_grp[] =3D {
> -       FUNC("jtag", 3, 34, 1),
> -       FUNC("rsvd", 2, 34, 1),
> -       FUNC("gpio", 1, 34, 1),
> +       FUNC("p0led_kn jtag", 3, 34, 1),
>         FUNC("p0led_kn", 0, 34, 1),
>  };
>
>  static struct mtmips_pmx_func wled_kn_grp[] =3D {
> -       FUNC("rsvd", 3, 35, 1),
> -       FUNC("rsvd", 2, 35, 1),
> -       FUNC("gpio", 1, 35, 1),
>         FUNC("wled_kn", 0, 35, 1),
>  };
>
>  static struct mtmips_pmx_func p4led_an_grp[] =3D {
> -       FUNC("jtag", 3, 39, 1),
> -       FUNC("utif", 2, 39, 1),
> -       FUNC("gpio", 1, 39, 1),
> +       FUNC("p4led_an jtag", 3, 39, 1),
> +       FUNC("p4led_an utif", 2, 39, 1),
>         FUNC("p4led_an", 0, 39, 1),
>  };
>
>  static struct mtmips_pmx_func p3led_an_grp[] =3D {
> -       FUNC("jtag", 3, 40, 1),
> -       FUNC("utif", 2, 40, 1),
> -       FUNC("gpio", 1, 40, 1),
> +       FUNC("p3led_an jtag", 3, 40, 1),
> +       FUNC("p3led_an utif", 2, 40, 1),
>         FUNC("p3led_an", 0, 40, 1),
>  };
>
>  static struct mtmips_pmx_func p2led_an_grp[] =3D {
> -       FUNC("jtag", 3, 41, 1),
> -       FUNC("utif", 2, 41, 1),
> -       FUNC("gpio", 1, 41, 1),
> +       FUNC("p2led_an jtag", 3, 41, 1),
> +       FUNC("p2led_an utif", 2, 41, 1),
>         FUNC("p2led_an", 0, 41, 1),
>  };
>
>  static struct mtmips_pmx_func p1led_an_grp[] =3D {
> -       FUNC("jtag", 3, 42, 1),
> -       FUNC("utif", 2, 42, 1),
> -       FUNC("gpio", 1, 42, 1),
> +       FUNC("p1led_an jtag", 3, 42, 1),
> +       FUNC("p1led_an utif", 2, 42, 1),
>         FUNC("p1led_an", 0, 42, 1),
>  };
>
>  static struct mtmips_pmx_func p0led_an_grp[] =3D {
> -       FUNC("jtag", 3, 43, 1),
> -       FUNC("rsvd", 2, 43, 1),
> -       FUNC("gpio", 1, 43, 1),
> +       FUNC("p0led_an jtag", 3, 43, 1),
>         FUNC("p0led_an", 0, 43, 1),
>  };
>
>  static struct mtmips_pmx_func wled_an_grp[] =3D {
> -       FUNC("rsvd", 3, 44, 1),
> -       FUNC("rsvd", 2, 44, 1),
> -       FUNC("gpio", 1, 44, 1),
>         FUNC("wled_an", 0, 44, 1),
>  };
>
> --
> 2.39.2
>

Changes look good to me. However I cannot test them.

[+cc Shiji Yang] who probably has a related board to test.

Thanks,
    Sergio Paracuellos

[0]: https://elixir.bootlin.com/linux/latest/source/arch/mips/boot/dts/rali=
nk/mt7628a.dtsi#L45
[1]: https://elixir.bootlin.com/linux/latest/source/drivers/pinctrl/mediate=
k/pinctrl-mtmips.c#L297

