Return-Path: <linux-mips+bounces-8735-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 935D6A9A9B7
	for <lists+linux-mips@lfdr.de>; Thu, 24 Apr 2025 12:14:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D1863B2010
	for <lists+linux-mips@lfdr.de>; Thu, 24 Apr 2025 10:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 666F7221296;
	Thu, 24 Apr 2025 10:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="k34iNYmO"
X-Original-To: linux-mips@vger.kernel.org
Received: from aposti.net (aposti.net [89.234.176.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0021220680;
	Thu, 24 Apr 2025 10:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.234.176.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745489648; cv=none; b=gWoOo+H+Nkv4ZAh+nZuXhJseLliwHUl4tVKRqc+a8MJxZ6U/lYiUbJudSiwYJvF3B6zimyRN3qRpELt+mm/4nnERAxDFryTVDEstuo7ikU19opPSp/KPa8htgcRrfiSCB4ouwplPqpVIJ9X9XkLoMJf6P6abPoda/JE5fTvcmEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745489648; c=relaxed/simple;
	bh=zSmUq1tHp63+RAhXj9njMfxddHaNlQhPuYccDV+gtfo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TXP9Me2G9/ex/suxKjYaubKM6984w4qMHZ/NxTktos8dK79A0xTy8PztJFPypZOBDG8mSNxK4PoThjEPfZ+JaCNJv8glAdX7k7C3cA6CPucnfxFRbdUX6J4A/0yvhAcFkRK22pSxl5oWV/D9UYHBAnq8q5zZxYl72+OH8xHoDAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net; spf=pass smtp.mailfrom=crapouillou.net; dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b=k34iNYmO; arc=none smtp.client-ip=89.234.176.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1745489643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fYgEY5bFxGonZp37xNaaHsfSCY/iBrfzUTg+ah8x0OU=;
	b=k34iNYmO2u/khsEJoWsLhO8cofWYl/u/QpqaDGdggEoJRr390q1f/uBot6xeqwcorlu9Rx
	a8EQn7P2a8Exp3LftKt5tslqFgRYc+b14E6XaYC6btSEViYF3OqbJEwDMnuWSMvjuIBlZJ
	G9UJn2cdbSDp7cHLYcYTJk/01lUCfOI=
Message-ID: <fff5e22cd0cc75f1007bbe43889f97554efa6316.camel@crapouillou.net>
Subject: Re: [PATCH 06/12] pinctrl: ingenic: use new GPIO line value setter
 callbacks
From: Paul Cercueil <paul@crapouillou.net>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Basavaraj Natikar	
 <Basavaraj.Natikar@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Coquelin	 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,  Andreas =?ISO-8859-1?Q?F=E4rber?=	
 <afaerber@suse.de>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>,  Steen Hegelund
 <Steen.Hegelund@microchip.com>, Daniel Machon
 <daniel.machon@microchip.com>, 	UNGLinuxDriver@microchip.com, Ludovic
 Desroches <ludovic.desroches@microchip.com>,  Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement	
 <gregory.clement@bootlin.com>, Sebastian Hesselbarth	
 <sebastian.hesselbarth@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar
 <alim.akhtar@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, 	linux-actions@lists.infradead.org,
 linux-mips@vger.kernel.org, 	linux-samsung-soc@vger.kernel.org, Bartosz
 Golaszewski	 <bartosz.golaszewski@linaro.org>
Date: Thu, 24 Apr 2025 12:13:59 +0200
In-Reply-To: <20250424-gpiochip-set-rv-pinctrl-part2-v1-6-504f91120b99@linaro.org>
References: 
	<20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
	 <20250424-gpiochip-set-rv-pinctrl-part2-v1-6-504f91120b99@linaro.org>
Autocrypt: addr=paul@crapouillou.net; prefer-encrypt=mutual;
 keydata=mQENBF0KhcEBCADkfmrzdTOp/gFOMQX0QwKE2WgeCJiHPWkpEuPH81/HB2dpjPZNW03ZM
 LQfECbbaEkdbN4YnPfXgcc1uBe5mwOAPV1MBlaZcEt4M67iYQwSNrP7maPS3IaQJ18ES8JJ5Uf5Uz
 FZaUawgH+oipYGW+v31cX6L3k+dGsPRM0Pyo0sQt52fsopNPZ9iag0iY7dGNuKenaEqkYNjwEgTtN
 z8dt6s3hMpHIKZFL3OhAGi88wF/21isv0zkF4J0wlf9gYUTEEY3Eulx80PTVqGIcHZzfavlWIdzhe
 +rxHTDGVwseR2Y1WjgFGQ2F+vXetAB8NEeygXee+i9nY5qt9c07m8mzjABEBAAG0JFBhdWwgQ2VyY
 3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PokBTgQTAQoAOBYhBNdHYd8OeCBwpMuVxnPua9InSr
 1BBQJdCoXBAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHPua9InSr1BgvIH/0kLyrI3V0f
 33a6D3BJwc1grbygPVYGuC5l5eMnAI+rDmLR19E2yvibRpgUc87NmPEQPpbbtAZt8On/2WZoE5OIP
 dlId/AHNpdgAtGXo0ZX4LGeVPjxjdkbrKVHxbcdcnY+zzaFglpbVSvp76pxqgVg8PgxkAAeeJV+ET
 4t0823Gz2HzCL/6JZhvKAEtHVulOWoBh368SYdolp1TSfORWmHzvQiCCCA+j0cMkYVGzIQzEQhX7U
 rf9N/nhU5/SGLFEi9DcBfXoGzhyQyLXflhJtKm3XGB1K/pPulbKaPcKAl6rIDWPuFpHkSbmZ9r4KF
 lBwgAhlGy6nqP7O3u7q23hRU=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Bartosz,

Le jeudi 24 avril 2025 =C3=A0 10:35 +0200, Bartosz Golaszewski a =C3=A9crit=
=C2=A0:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> struct gpio_chip now has callbacks for setting line values that
> return
> an integer, allowing to indicate failures. Convert the driver to
> using
> them.
>=20
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
> =C2=A0drivers/pinctrl/pinctrl-ingenic.c | 8 +++++---
> =C2=A01 file changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-ingenic.c
> b/drivers/pinctrl/pinctrl-ingenic.c
> index a9e48eac15f6..3c660471ec69 100644
> --- a/drivers/pinctrl/pinctrl-ingenic.c
> +++ b/drivers/pinctrl/pinctrl-ingenic.c
> @@ -3800,12 +3800,14 @@ static void ingenic_gpio_irq_handler(struct
> irq_desc *desc)
> =C2=A0	chained_irq_exit(irq_chip, desc);
> =C2=A0}
> =C2=A0
> -static void ingenic_gpio_set(struct gpio_chip *gc,
> -		unsigned int offset, int value)
> +static int ingenic_gpio_set(struct gpio_chip *gc, unsigned int
> offset,
> +			=C2=A0=C2=A0=C2=A0 int value)
> =C2=A0{
> =C2=A0	struct ingenic_gpio_chip *jzgc =3D gpiochip_get_data(gc);
> =C2=A0
> =C2=A0	ingenic_gpio_set_value(jzgc, offset, value);
> +
> +	return 0;
> =C2=A0}
> =C2=A0
> =C2=A0static int ingenic_gpio_get(struct gpio_chip *gc, unsigned int
> offset)
> @@ -4449,7 +4451,7 @@ static int __init ingenic_gpio_probe(struct
> ingenic_pinctrl *jzpc,
> =C2=A0	jzgc->gc.fwnode =3D fwnode;
> =C2=A0	jzgc->gc.owner =3D THIS_MODULE;
> =C2=A0
> -	jzgc->gc.set =3D ingenic_gpio_set;
> +	jzgc->gc.set_rv =3D ingenic_gpio_set;
> =C2=A0	jzgc->gc.get =3D ingenic_gpio_get;
> =C2=A0	jzgc->gc.direction_input =3D pinctrl_gpio_direction_input;
> =C2=A0	jzgc->gc.direction_output =3D ingenic_gpio_direction_output;

