Return-Path: <linux-mips+bounces-5005-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C5B95B20D
	for <lists+linux-mips@lfdr.de>; Thu, 22 Aug 2024 11:46:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D39D1F25099
	for <lists+linux-mips@lfdr.de>; Thu, 22 Aug 2024 09:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6A161885BB;
	Thu, 22 Aug 2024 09:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="xeXdzUWY"
X-Original-To: linux-mips@vger.kernel.org
Received: from aposti.net (aposti.net [89.234.176.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE871885AC;
	Thu, 22 Aug 2024 09:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.234.176.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724319653; cv=none; b=P6Z3uKq/Ckr9c7oEQMJGSVKpo5gm7LXTisQsNwY4g1J2yepxWB4j8EUWlpYTHV3KjG820tQwX+4tjsGWKyMsWSbOqwhWHwVIIapZnSM8elSF+3BrH16qDb745+SHUFe1rp2enRLGhREDrXjD3t4zd88eLjbpOT9euL8I1KQDBK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724319653; c=relaxed/simple;
	bh=+YzybvjmeCjQmLsAQdmlwRS1Wt1RU9R7fRWOBStbjs0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S59lPXAVULot2jyetiXE8pENlzltt0tpY96ay1izCRXFowrp0DhsA94gc3JqD/w7ldxXWhyN4eHHfEM1wIXIJUu3aW9WLKstS8DyiT3X0Oq3uvrng/jbi1Vnkb5uYHimUcH89Dhryi1FJKaRUwhTuDiOCc6T7xunZYoxtA4sW4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net; spf=pass smtp.mailfrom=crapouillou.net; dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b=xeXdzUWY; arc=none smtp.client-ip=89.234.176.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1724319649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ZY5dFiAJk7yETMHVXjLcWFFsbtAbQnRW4YnkZswVf5s=;
	b=xeXdzUWYQCtBoEhvS7PBJPR2NvZrR4Ei8sdKFoTX+dZcbnAJnHN/CzxLTBYCDT49IGuXWs
	aQhsLgy+3PoefZiOk4X4lRCFp0yRLO3rrEu6pGTAIbYmXbV3qEVbnHYOd6qlXXEyZabuEY
	YxGAOzVrjLMBQUL9HZ9cy7v0yGB4y7Q=
Message-ID: <09d6a69610ccec161ad8e0f2df64d8264c0a64fe.camel@crapouillou.net>
Subject: Re: [PATCH 1/8] tty: 8250_ingenic: Use devm_clk_get_enabled()
 helpers
From: Paul Cercueil <paul@crapouillou.net>
To: Lei Liu <liulei.rjpt@vivo.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Thierry
 Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu
 <mhiramat@kernel.org>, Richard Genoud <richard.genoud@bootlin.com>, Nicolas
 Ferre <nicolas.ferre@microchip.com>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Andreas
 =?ISO-8859-1?Q?F=E4rber?= <afaerber@suse.de>,  Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,  Geert Uytterhoeven
 <geert+renesas@glider.be>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=
 <u.kleine-koenig@pengutronix.de>, Thomas Gleixner <tglx@linutronix.de>,
 John Ogness <john.ogness@linutronix.de>, Jeff Johnson
 <quic_jjohnson@quicinc.com>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Valentin Caron <valentin.caron@foss.st.com>, Lino
 Sanfilippo <l.sanfilippo@kunbus.com>, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-actions@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Cc: opensource.kernel@vivo.com
Date: Thu, 22 Aug 2024 11:40:46 +0200
In-Reply-To: <20240822033924.32397-2-liulei.rjpt@vivo.com>
References: <20240822033924.32397-1-liulei.rjpt@vivo.com>
	 <20240822033924.32397-2-liulei.rjpt@vivo.com>
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
 lBwgAhlGy6nqP7O3u7q23hRW5AQ0EXQqFwQEIAMo+MgvYHsyjX3Ja4Oolg1Txzm8woj30ch2nACFC
 qaO0R/1kLj2VVeLrDyQUOlXx9PD6IQI4M8wy8m0sR4wV2p/g/paw7k65cjzYYLh+FdLNyO7IWYXnd
 JO+wDPi3aK/YKUYepqlP+QsmaHNYNdXEQDRKqNfJg8t0f5rfzp9ryxd1tCnbV+tG8VHQWiZXNqN70
 62DygSNXFUfQ0vZ3J2D4oAcIAEXTymRQ2+hr3Hf7I61KMHWeSkCvCG2decTYsHlw5Erix/jYWqVOt
 X0roOOLqWkqpQQJWtU+biWrAksmFmCp5fXIg1Nlg39v21xCXBGxJkxyTYuhdWyu1yDQ+LSIUAEQEA
 AYkBNgQYAQoAIBYhBNdHYd8OeCBwpMuVxnPua9InSr1BBQJdCoXBAhsMAAoJEHPua9InSr1B4wsH/
 Az767YCT0FSsMNt1jkkdLCBi7nY0GTW+PLP1a4zvVqFMo/vD6uz1ZflVTUAEvcTi3VHYZrlgjcxmc
 Gu239oruqUS8Qy/xgZBp9KF0NTWQSl1iBfVbIU5VV1vHS6r77W5x0qXgfvAUWOH4gmN3MnF01SH2z
 McLiaUGF+mcwl15rHbjnT3Nu2399aSE6cep86igfCAyFUOXjYEGlJy+c6UyT+DUylpjQg0nl8MlZ/
 7Whg2fAU9+FALIbQYQzGlT4c71SibR9T741jnegHhlmV4WXXUD6roFt54t0MSAFSVxzG8mLcSjR2c
 LUJ3NIPXixYUSEn3tQhfZj07xIIjWxAYZo=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Lei Liu,

Le jeudi 22 ao=C3=BBt 2024 =C3=A0 11:39 +0800, Lei Liu a =C3=A9crit=C2=A0:
> The devm_clk_get_enabled() helpers:
> =C2=A0=C2=A0=C2=A0 - call devm_clk_get()
> =C2=A0=C2=A0=C2=A0 - call clk_prepare_enable() and register what is neede=
d in order
> to
> =C2=A0=C2=A0=C2=A0=C2=A0 call clk_disable_unprepare() when needed, as a m=
anaged resource.
>=20
> This simplifies the code and avoids calls to clk_disable_unprepare().
>=20
> Signed-off-by: Lei Liu <liulei.rjpt@vivo.com>
> ---
> =C2=A0drivers/tty/serial/8250/8250_ingenic.c | 26 +++--------------------=
-
> --
> =C2=A01 file changed, 3 insertions(+), 23 deletions(-)
>=20
> diff --git a/drivers/tty/serial/8250/8250_ingenic.c
> b/drivers/tty/serial/8250/8250_ingenic.c
> index a2783e38a2e3..5f8787309064 100644
> --- a/drivers/tty/serial/8250/8250_ingenic.c
> +++ b/drivers/tty/serial/8250/8250_ingenic.c
> @@ -274,44 +274,26 @@ static int ingenic_uart_probe(struct
> platform_device *pdev)
> =C2=A0	if (!uart.port.membase)
> =C2=A0		return -ENOMEM;
> =C2=A0
> -	data->clk_module =3D devm_clk_get(&pdev->dev, "module");
> +	data->clk_module =3D devm_clk_get_enabled(&pdev->dev,
> "module");
> =C2=A0	if (IS_ERR(data->clk_module))
> =C2=A0		return dev_err_probe(&pdev->dev, PTR_ERR(data-
> >clk_module),
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 "unable to get module
> clock\n");
> =C2=A0
> -	data->clk_baud =3D devm_clk_get(&pdev->dev, "baud");
> +	data->clk_baud =3D devm_clk_get_enabled(&pdev->dev, "baud");
> =C2=A0	if (IS_ERR(data->clk_baud))
> =C2=A0		return dev_err_probe(&pdev->dev, PTR_ERR(data-
> >clk_baud),
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 "unable to get baud clock\n");
> =C2=A0
> -	err =3D clk_prepare_enable(data->clk_module);
> -	if (err) {
> -		dev_err(&pdev->dev, "could not enable module clock:
> %d\n", err);
> -		goto out;
> -	}
> -
> -	err =3D clk_prepare_enable(data->clk_baud);
> -	if (err) {
> -		dev_err(&pdev->dev, "could not enable baud clock:
> %d\n", err);
> -		goto out_disable_moduleclk;
> -	}
> =C2=A0	uart.port.uartclk =3D clk_get_rate(data->clk_baud);
> =C2=A0
> =C2=A0	data->line =3D serial8250_register_8250_port(&uart);
> =C2=A0	if (data->line < 0) {
> =C2=A0		err =3D data->line;
> -		goto out_disable_baudclk;
> +		return err;

Not really worth a V2, but if you make a V2, please "return data-
>line;" directly.

Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> =C2=A0	}
> =C2=A0
> =C2=A0	platform_set_drvdata(pdev, data);
> =C2=A0	return 0;
> -
> -out_disable_baudclk:
> -	clk_disable_unprepare(data->clk_baud);
> -out_disable_moduleclk:
> -	clk_disable_unprepare(data->clk_module);
> -out:
> -	return err;
> =C2=A0}
> =C2=A0
> =C2=A0static void ingenic_uart_remove(struct platform_device *pdev)
> @@ -319,8 +301,6 @@ static void ingenic_uart_remove(struct
> platform_device *pdev)
> =C2=A0	struct ingenic_uart_data *data =3D platform_get_drvdata(pdev);
> =C2=A0
> =C2=A0	serial8250_unregister_port(data->line);
> -	clk_disable_unprepare(data->clk_module);
> -	clk_disable_unprepare(data->clk_baud);
> =C2=A0}
> =C2=A0
> =C2=A0static const struct ingenic_uart_config jz4740_uart_config =3D {


