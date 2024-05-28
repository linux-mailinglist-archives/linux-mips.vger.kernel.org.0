Return-Path: <linux-mips+bounces-3353-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 733088D1A83
	for <lists+linux-mips@lfdr.de>; Tue, 28 May 2024 14:01:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 966AA1C22C56
	for <lists+linux-mips@lfdr.de>; Tue, 28 May 2024 12:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBFE516ABC4;
	Tue, 28 May 2024 12:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kbKZgCgM"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4778E13A242;
	Tue, 28 May 2024 12:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716897679; cv=none; b=e0sUh2FGWOEFAFVkYq+caiumDOnoOWzWyRuR37e9296kHfQxz6+VCRHUTJ6BcFcMnD+VmO7Taw2beksLwgMShX1FIOWj2Rg98Y005rK7OALFgTvcvdlCq3Tz8d8tuFTofVp8qRPsli2DiCLhpf9J/jo0jIUDfXC7o+W6FTvUczc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716897679; c=relaxed/simple;
	bh=8WRHDTUZ0RTZvELeR+4+qbfh9ozH4kaFF8ljxt36pEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gku19gd/XCFfBfmV9UeKRPhyeZnpAMv3/zua1HcEC13+9aCWqNy2u8Okx02pmEeXdpD70vwctyFylLiI5j+2MhsOqGawfpzApQ/dXOYPBmvsw6MCuL8gtwWTYyaL/D8TcRpiEhTc/g2cR4yf9i2rMVSdKXv+vx8Dej6H14o4jHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kbKZgCgM; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5785d466c82so889381a12.3;
        Tue, 28 May 2024 05:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716897676; x=1717502476; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NAgN1LldmRrlrSvzizrGCKqLHlKjnztSUaZS5Nc7Gtg=;
        b=kbKZgCgMiVQU6z+wB7b/hCP1+KtZ/23hcZjyWvmXE8IPeQHgM7XVzwbrwxj5W9Liil
         ZG38VIa9LRpT2hoEKkVRz7gz/oMWh8tRkKeeUBNzIM468+XbCc1aB8KQNVolRQ7dh2yr
         dw3hZUIy3Pf8N/65q6MRdK6uPhpv1olPLHdHwr8Z5KnnwvVsIHjmhhYmmRWEEmW6OYHW
         VYanJNqOdJuMrNAuWb17q8vcShCNImy5+wpW9I1aIcGoyXP3vqfhOYeDrbZaLetG9wEc
         nNl2e6MZFYpvQfRoSXE0kB0OfN/wT9D4i1nwjW6+42uLqkvbLW9S/gttcSYCDGfjAH7n
         j8qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716897676; x=1717502476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NAgN1LldmRrlrSvzizrGCKqLHlKjnztSUaZS5Nc7Gtg=;
        b=F+0TrEmqexeeHiPEZO4iCgdkLkhZ9K7Omiy4u/cTBXnlU0OK4vlwyDSZEh09u8Mwa9
         TM+WOehEqqm74ILKyt+9wPziijx/8SLb9+p38iETvDgZcW6uuCalR0ZeV1ssOWbVI9xO
         55co0dmW7kOJvngoTNoUK+Rfo/9/RkF5qRSyNivao9nrtoG2aqtJwo5oSmBEjZ7ZUVjL
         yBArVtlXZ68543I7RL/K+ftk0udlTO1fprIfSijR47JkkHt60HzRk7JwznJseadEAMY9
         SQGJT0N+ZuAyIMeVHONaRSfPODIuYYwIm9bUIHEHKPmbSEKzmQgHRa/Nvyc7q5rIMSkx
         J+YA==
X-Forwarded-Encrypted: i=1; AJvYcCXhgCeoFdn8EcVEAkj65GiVbFmNvNaY+ykaBNq+LykukoaCHjnnTZcp6QV0HUBIyVdcsxln63Qc2OVvZR2xxjXm+u+EWBkBTDfxGcAr+9qcYtADBOUnHp1PiphQwjETponsDxnBf66dXg==
X-Gm-Message-State: AOJu0Yw1V29ouZIxLq0yeysI/4w5G4aOb14guGKZaubkyZ95E35SpxE0
	BT6JaVT6Y7EcEDt6j0xGnExq9kxfc/i34bpfwwmdvS6O7NLzoADniXJbVMhowam4nQihktD35m7
	6o157emKGs7JMZTnc65k1HGexACc=
X-Google-Smtp-Source: AGHT+IGWXAZnzJq/outpGdrrF+BzVco1qSOLCnXc5XWK+E8bGR9GWy0ZahU9VxoRM4PaeRGMN+5E3TDdnybOYtKZhcQ=
X-Received: by 2002:a17:906:cb8b:b0:a59:c3d0:550c with SMTP id
 a640c23a62f3a-a62643e4d86mr656965266b.43.1716897676330; Tue, 28 May 2024
 05:01:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240527022036.31985-1-user@blabla> <9abb1d5e-fdac-4500-9218-fb9f28ff2c05@web.de>
In-Reply-To: <9abb1d5e-fdac-4500-9218-fb9f28ff2c05@web.de>
From: =?UTF-8?B?5p2O57u06LGq?= <cn.liweihao@gmail.com>
Date: Tue, 28 May 2024 20:01:04 +0800
Message-ID: <CAPEOAkRjKm_bcfX4CJe3HON=6abcfzBGjXo6VpcnhR-u9OCHzg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: ralink: mt76x8: fix pinmux function
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-gpio@vger.kernel.org, linux-mips@vger.kernel.org, 
	Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	=?UTF-8?B?QXLEsW7DpyDDnG5hbA==?= <arinc.unal@arinc9.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Sean Wang <sean.wang@kernel.org>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Markus Elfring <Markus.Elfring@web.de> =E4=BA=8E2024=E5=B9=B45=E6=9C=8828=
=E6=97=A5=E5=91=A8=E4=BA=8C 19:37=E5=86=99=E9=81=93=EF=BC=9A
>
> =E2=80=A6
> > There are some same function name in different pin groups, =E2=80=A6
>
>                                names?
>

refclk [0][1], pwm [2][3] and some others. For example, without this
patch, part of the pinmux-functions in the kernel debug fs looks like
this

root@mt7628:/sys/kernel/debug/pinctrl/pinctrl-ralink-pinmux# cat
pinmux-functions
function 0: gpio, groups =3D [ pwm1 pwm0 uart2 uart1 i2c refclk perst
wdt spi sdmode uart0 i2s spi cs1 spis gpio0 wled_an p0led_an p1led_an
p2led_an p3led_an p4led_an wled_kn p0led_kn p1led_kn p2led_kn p3led_kn
p4led_kn ]
function 1: sdxc d6, groups =3D [ pwm1 ]
function 2: utif, groups =3D [ pwm1 ]
function 3: gpio, groups =3D [ pwm1 ]
function 4: pwm1, groups =3D [ pwm1 ]
function 5: sdxc d7, groups =3D [ pwm0 ]
function 6: utif, groups =3D [ pwm0 ]
function 7: gpio, groups =3D [ pwm0 ]
function 8: pwm0, groups =3D [ pwm0 ]
function 9: sdxc d5 d4, groups =3D [ uart2 ]
function 10: pwm, groups =3D [ uart2 ]
function 11: gpio, groups =3D [ uart2 ]
function 12: uart2, groups =3D [ uart2 ]
function 13: sw_r, groups =3D [ uart1 ]
function 14: pwm, groups =3D [ uart1 ]
function 15: gpio, groups =3D [ uart1 ]
function 16: uart1, groups =3D [ uart1 ]
function 17: -, groups =3D [ i2c ]
function 18: debug, groups =3D [ i2c ]
function 19: gpio, groups =3D [ i2c ]
function 20: i2c, groups =3D [ i2c ]
function 21: refclk, groups =3D [ refclk ]
function 22: perst, groups =3D [ perst ]
function 23: wdt, groups =3D [ wdt ]
function 24: spi, groups =3D [ spi ]
function 25: jtag, groups =3D [ sdmode ]
function 26: utif, groups =3D [ sdmode ]
function 27: gpio, groups =3D [ sdmode ]
function 28: sdxc, groups =3D [ sdmode ]
function 29: -, groups =3D [ uart0 ]
function 30: -, groups =3D [ uart0 ]
function 31: gpio, groups =3D [ uart0 ]
function 32: uart0, groups =3D [ uart0 ]
function 33: antenna, groups =3D [ i2s ]
function 34: pcm, groups =3D [ i2s ]
function 35: gpio, groups =3D [ i2s ]
function 36: i2s, groups =3D [ i2s ]
function 37: -, groups =3D [ spi cs1 ]
function 38: refclk, groups =3D [ spi cs1 ]


>
> =E2=80=A6
> > To solve this problem, a simple way is just add a pingrp refix to
>
>                                                     pin group prefix?
>

Yes. Just add a pin group prefix like pinctrl-mt7620.c does.

> Regards,
> Markus

[0] https://elixir.bootlin.com/linux/latest/source/drivers/pinctrl/mediatek=
/pinctrl-mt76x8.c#L73
[1] https://elixir.bootlin.com/linux/latest/source/drivers/pinctrl/mediatek=
/pinctrl-mt76x8.c#L101
[2] https://elixir.bootlin.com/linux/latest/source/drivers/pinctrl/mediatek=
/pinctrl-mt76x8.c#L54
[3] https://elixir.bootlin.com/linux/latest/source/drivers/pinctrl/mediatek=
/pinctrl-mt76x8.c#L61

