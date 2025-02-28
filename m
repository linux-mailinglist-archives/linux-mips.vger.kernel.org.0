Return-Path: <linux-mips+bounces-8050-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5A9A4A174
	for <lists+linux-mips@lfdr.de>; Fri, 28 Feb 2025 19:27:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1A51175958
	for <lists+linux-mips@lfdr.de>; Fri, 28 Feb 2025 18:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEC4427426D;
	Fri, 28 Feb 2025 18:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="HIZLTQKa"
X-Original-To: linux-mips@vger.kernel.org
Received: from aposti.net (aposti.net [89.234.176.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14229274253;
	Fri, 28 Feb 2025 18:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.234.176.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740767244; cv=none; b=feaML1Fa6QouG9VLQpWmpumD/pmshwWY18JnSUk2/RrrvmL/RzDZFsryh2sWAUucmT6MC4TqSmlvJeiaY8EsJf2K1730B4c2Id1Me5EbqymQKaqiFFRz3c3TXSRzr06dp+88+LdQJQWU2Ny6nOjAgQakPBcAhvTRudj54jIry3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740767244; c=relaxed/simple;
	bh=67MIZhOGaz6uNuzThDvVgUejH2NJv/lVLfIlQwxWAaY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GgGQnvXLHbvlYj+m0GBYcX/g5u654XjSYRqpPj42IPTYiDvoRmGnjcSSxrpXpH1CBYv6DTsFeaWc291HKBa41w8sttOi8WJhnlZ9uM3w5LWYO8cMwcBJaIxKx7QQXHPeE5C6ZZSfxZoXeo8TolNsXGSgm+beDB8eabSlBjkm6X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net; spf=pass smtp.mailfrom=crapouillou.net; dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b=HIZLTQKa; arc=none smtp.client-ip=89.234.176.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1740767234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=hunC8aIjFL8iJizsnuivXHSj1ZxS4AePrCKLeqSA1Do=;
	b=HIZLTQKaoDNgNrovU4MAqTxJVO4u5918To8gUH3iKzSPqqpvSO5wNcaqMxUeUgYVDcROxV
	63pQc/UhJTi4wXY+QNXMuYup0rcA60Mm+b70j9yCpYYvdPjOKyPqcbGQxUXafevum9S24w
	j7XIXsGattyqB6INNm6tK348Xunxw5s=
Message-ID: <f1ffee11ef563d8c7486503eef3d21b8b7e2ccd9.camel@crapouillou.net>
Subject: Re: [PATCH v2 4/4] pinctrl: ingenic: jz4730: add pinmux for I2S
 interface
From: Paul Cercueil <paul@crapouillou.net>
To: "H. Nikolaus Schaller" <hns@goldelico.com>, Linus Walleij	
 <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Andreas Kemnade <andreas@kemnade.info>, Paul Boddie
 <paul@boddie.org.uk>,  Tim Bysun <tim.bysun@ingenic.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	letux-kernel@openphoenux.org, kernel@pyra-handheld.com
Date: Fri, 28 Feb 2025 19:26:11 +0100
In-Reply-To: <1d50f0c980155dd22ccd164a6d281e3ac68e7446.1740749637.git.hns@goldelico.com>
References: <cover.1740749637.git.hns@goldelico.com>
	 <1d50f0c980155dd22ccd164a6d281e3ac68e7446.1740749637.git.hns@goldelico.com>
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

Hi Nikolaus,

Le vendredi 28 f=C3=A9vrier 2025 =C3=A0 14:33 +0100, H. Nikolaus Schaller a
=C3=A9crit=C2=A0:
> I2S is used for the sound codec of the Alpha400.
>=20
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
> =C2=A0drivers/pinctrl/pinctrl-ingenic.c | 13 ++++++++++++-
> =C2=A01 file changed, 12 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-ingenic.c
> b/drivers/pinctrl/pinctrl-ingenic.c
> index 08e082e84f5c6..6d7dc077c373e 100644
> --- a/drivers/pinctrl/pinctrl-ingenic.c
> +++ b/drivers/pinctrl/pinctrl-ingenic.c
> @@ -209,10 +209,14 @@ static int jz4730_nand_cs4_pins[] =3D { 0x56, };
> =C2=A0static int jz4730_nand_cs5_pins[] =3D { 0x57, };
> =C2=A0static int jz4730_pwm_pwm0_pins[] =3D { 0x5e, };
> =C2=A0static int jz4730_pwm_pwm1_pins[] =3D { 0x5f, };
> -

Just a nit - but you remove a blank line in patch 4/4 that was added in
3/4, better not add it in the first place :)

That's the only comment I have on the whole patchset, so either fix it
in a v3 while adding my review tag, or maybe Linus can do it when
applying the patchset.

Cheers,
-Paul

> =C2=A0static int jz4730_mii_pins[] =3D { 0x70, 0x71, 0x72, 0x73, 0x74, 0x=
75,
> 0x76,
> =C2=A0				 0x77, 0x78, 0x19, 0x7a, 0x1b, 0x7c,
> };
> =C2=A0
> +static int jz4730_i2s_mclk_pins[] =3D { 0x44, };
> +static int jz4730_i2s_acreset_pins[] =3D { 0x45, };
> +static int jz4730_i2s_data_pins[] =3D { 0x46, 0x47, };
> +static int jz4730_i2s_clock_pins[] =3D { 0x4d, 0x4e, };
> +
> =C2=A0static u8 jz4730_lcd_8bit_funcs[] =3D { 1, 1, 1, 1, 1, 1, 1, 1, 2, =
2,
> 2, };
> =C2=A0
> =C2=A0static const struct group_desc jz4730_groups[] =3D {
> @@ -235,6 +239,11 @@ static const struct group_desc jz4730_groups[] =3D
> {
> =C2=A0	INGENIC_PIN_GROUP("pwm0", jz4730_pwm_pwm0, 1),
> =C2=A0	INGENIC_PIN_GROUP("pwm1", jz4730_pwm_pwm1, 1),
> =C2=A0	INGENIC_PIN_GROUP("mii", jz4730_mii, 1),
> +	INGENIC_PIN_GROUP("i2s-mclk-out", jz4730_i2s_mclk, 1),
> +	INGENIC_PIN_GROUP("i2s-acreset", jz4730_i2s_acreset, 1),
> +	INGENIC_PIN_GROUP("i2s-data", jz4730_i2s_data, 1),
> +	INGENIC_PIN_GROUP("i2s-master", jz4730_i2s_clock, 1),
> +	INGENIC_PIN_GROUP("i2s-slave", jz4730_i2s_clock, 2),
> =C2=A0};
> =C2=A0
> =C2=A0static const char *jz4730_mmc_groups[] =3D { "mmc-1bit", "mmc-4bit"=
,
> };
> @@ -251,6 +260,7 @@ static const char *jz4730_nand_groups[] =3D {
> =C2=A0static const char *jz4730_pwm0_groups[] =3D { "pwm0", };
> =C2=A0static const char *jz4730_pwm1_groups[] =3D { "pwm1", };
> =C2=A0static const char *jz4730_mii_groups[] =3D { "mii", };
> +static const char *jz4730_i2s_groups[] =3D { "i2s-data", "i2s-master",
> "i2s-slave", };
> =C2=A0
> =C2=A0static const struct function_desc jz4730_functions[] =3D {
> =C2=A0	INGENIC_PIN_FUNCTION("mmc", jz4730_mmc),
> @@ -263,6 +273,7 @@ static const struct function_desc
> jz4730_functions[] =3D {
> =C2=A0	INGENIC_PIN_FUNCTION("pwm0", jz4730_pwm0),
> =C2=A0	INGENIC_PIN_FUNCTION("pwm1", jz4730_pwm1),
> =C2=A0	INGENIC_PIN_FUNCTION("mii", jz4730_mii),
> +	INGENIC_PIN_FUNCTION("i2s", jz4730_i2s),
> =C2=A0};
> =C2=A0
> =C2=A0static const struct ingenic_chip_info jz4730_chip_info =3D {


