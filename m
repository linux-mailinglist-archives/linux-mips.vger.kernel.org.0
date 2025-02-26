Return-Path: <linux-mips+bounces-7992-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC32A469F7
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2025 19:45:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18B503A3E27
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2025 18:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2928C235341;
	Wed, 26 Feb 2025 18:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="Ae4kPHkZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from aposti.net (aposti.net [89.234.176.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80A823371B;
	Wed, 26 Feb 2025 18:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.234.176.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740595506; cv=none; b=aCWGtTsRo3atRhCHkiZ1rUlGZlcy+KJzpBMC3yAe+b6BWi2Y6l4BScSh4NwD/jd1IJfQ60iwhHtH9VWDUolX14CqYPzVaHvsjWQM3Wg5QWYnhPCnYQkBXkwwhzUyXFlAx1N/+8pAPWf8/hfbko/G7wNN6l8FxOK9KDcEzt6NBYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740595506; c=relaxed/simple;
	bh=Ez0pRVxb4rvsDz/sDWthsPnz3AEUnBdg3NowQnOJ9wM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QHgt6CF/AVHw+vXdIbYJTAdOh9Fr6WV3q1StX4oXKpiq8Vzzs9HQbafGDaqzFBYxpVoo27TAGHu1p8uZqrvdWnm9OA1qCicQJMAe63awZ/cL/Ak0kTTRXaPxkABdhmLPoCQUr2VWzvyAFOY+d/40JdGIQ/fjxCJvm2Y+GZBWjyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net; spf=pass smtp.mailfrom=crapouillou.net; dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b=Ae4kPHkZ; arc=none smtp.client-ip=89.234.176.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1740595496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=LTdC+wV4Km4cP9PQt8a7JBY9RVaiQFSEGFjaUALtVlg=;
	b=Ae4kPHkZKSJ/7bzI+dYP8KyIdaG6uuJ9og8WwW9SEadSOXXUiB26dtJOSA2ySniIb1ECXq
	J2m8VBVJeYB0RZWexBQvxE4tW4/si9v/4rL9ybrJndERUD7gQN4lbCY3Z3gwUH0nyC/HCS
	si2mYdTt47KSvgqjQSsin8JPVgSh9jM=
Message-ID: <627ed9f29819e42e8efa449d87eb2ddbc6acb8a1.camel@crapouillou.net>
Subject: Re: [PATCH 2/4] pinctrl: ingenic: add x1600 support
From: Paul Cercueil <paul@crapouillou.net>
To: "H. Nikolaus Schaller" <hns@goldelico.com>, Linus Walleij	
 <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Andreas Kemnade <andreas@kemnade.info>, Paul Boddie
 <paul@boddie.org.uk>,  Tim Bysun <tim.bysun@ingenic.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	letux-kernel@openphoenux.org
Date: Wed, 26 Feb 2025 19:43:52 +0100
In-Reply-To: <f633a14ccafc596e4611a1fae3e1c958ddfac2dc.1740590093.git.hns@goldelico.com>
References: <cover.1740590093.git.hns@goldelico.com>
	 <f633a14ccafc596e4611a1fae3e1c958ddfac2dc.1740590093.git.hns@goldelico.com>
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

Hi Nikolaus, and everyone involved,

Le mercredi 26 f=C3=A9vrier 2025 =C3=A0 18:16 +0100, H. Nikolaus Schaller a
=C3=A9crit=C2=A0:
> From: Paul Boddie <paul@boddie.org.uk>
>=20
> Add support for the Lumissil/Ingenic X1600 SoC.
>=20
> It uses shadow registers to commit changes to multiple pinctrl
> registers in parallel.
>=20
> Define specific Chip ID, register offsets, pin tables etc.
>=20
> Handling the unique X1600_GPIO_PU only for the x1600 but
> not for x1830 and above must be carefully taken into account.
>=20
> Co-authored-by: Andreas Kemnade <andreas@kemnade.info>
> Co-authored-by: H. Nikolaus Schaller <hns@goldelico.com>
> Signed-off-by: Paul Boddie <paul@boddie.org.uk>
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
> =C2=A0drivers/pinctrl/pinctrl-ingenic.c | 242
> +++++++++++++++++++++++++++++-
> =C2=A01 file changed, 240 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-ingenic.c
> b/drivers/pinctrl/pinctrl-ingenic.c
> index bc7ee54e062b5..dfdc89ece9b8a 100644
> --- a/drivers/pinctrl/pinctrl-ingenic.c
> +++ b/drivers/pinctrl/pinctrl-ingenic.c
> @@ -3,7 +3,7 @@
> =C2=A0 * Ingenic SoCs pinctrl driver
> =C2=A0 *
> =C2=A0 * Copyright (c) 2017 Paul Cercueil <paul@crapouillou.net>
> - * Copyright (c) 2017, 2019 Paul Boddie <paul@boddie.org.uk>
> + * Copyright (c) 2017, 2019, 2020, 2023 Paul Boddie
> <paul@boddie.org.uk>
> =C2=A0 * Copyright (c) 2019, 2020 =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanji=
e)
> <zhouyanjie@wanyeetech.com>
> =C2=A0 */
> =C2=A0
> @@ -58,6 +58,8 @@
> =C2=A0#define JZ4770_GPIO_FLAG			0x50
> =C2=A0#define JZ4770_GPIO_PEN				0x70
> =C2=A0
> +#define X1600_GPIO_PU				 0x80
> +
> =C2=A0#define X1830_GPIO_PEL				0x110
> =C2=A0#define X1830_GPIO_PEH				0x120
> =C2=A0#define X1830_GPIO_SR				0x150
> @@ -112,6 +114,7 @@ enum jz_version {
> =C2=A0	ID_JZ4780,
> =C2=A0	ID_X1000,
> =C2=A0	ID_X1500,
> +	ID_X1600,
> =C2=A0	ID_X1830,
> =C2=A0	ID_X2000,
> =C2=A0	ID_X2100,
> @@ -162,6 +165,7 @@ static const unsigned long enabled_socs =3D
> =C2=A0	IS_ENABLED(CONFIG_MACH_JZ4780) << ID_JZ4780 |
> =C2=A0	IS_ENABLED(CONFIG_MACH_X1000) << ID_X1000 |
> =C2=A0	IS_ENABLED(CONFIG_MACH_X1500) << ID_X1500 |
> +	IS_ENABLED(CONFIG_MACH_X1600) << ID_X1600 |
> =C2=A0	IS_ENABLED(CONFIG_MACH_X1830) << ID_X1830 |
> =C2=A0	IS_ENABLED(CONFIG_MACH_X2000) << ID_X2000 |
> =C2=A0	IS_ENABLED(CONFIG_MACH_X2100) << ID_X2100;
> @@ -2351,6 +2355,231 @@ static const struct ingenic_chip_info
> x1500_chip_info =3D {
> =C2=A0	.access_table =3D &x1000_access_table,
> =C2=A0};
> =C2=A0
> +static const u32 x1600_pull_ups[4] =3D {
> +	0xffffffff, 0xdffbf7bf, 0x987e0000, 0x0000003f,
> +};
> +
> +static const u32 x1600_pull_downs[4] =3D {
> +	0x00000000, 0x00000000, 0x07000007, 0x00000000,
> +};
> +
> +static int x1600_uart0_data_pins[] =3D { 0x27, 0x28, };
> +static int x1600_uart0_hwflow_pins[] =3D { 0x29, 0x2a, };
> +static int x1600_uart1_data_pins[] =3D { 0x23, 0x22, };
> +static int x1600_uart1_hwflow_pins[] =3D { 0x25, 0x24, };
> +static int x1600_uart2_data_a_pins[] =3D { 0x1f, 0x1e, };
> +static int x1600_uart2_data_b_pins[] =3D { 0x21, 0x20, };
> +static int x1600_uart3_data_b_pins[] =3D { 0x25, 0x24, };
> +static int x1600_uart3_data_d_pins[] =3D { 0x65, 0x64, };
> +static int x1600_sfc_pins[] =3D { 0x53, 0x54, 0x55, 0x56, 0x51, 0x52,
> 0x24, };
> +static int x1600_ssi_dt_a_pins[] =3D { 0x1e, };
> +static int x1600_ssi_dt_b_pins[] =3D { 0x2d, };
> +static int x1600_ssi_dr_a_pins[] =3D { 0x1d, };
> +static int x1600_ssi_dr_b_pins[] =3D { 0x2e, };
> +static int x1600_ssi_clk_a_pins[] =3D { 0x1f, };
> +static int x1600_ssi_clk_b_pins[] =3D { 0x2c, };
> +static int x1600_ssi_ce0_a_pins[] =3D { 0x1c, };
> +static int x1600_ssi_ce0_b_pins[] =3D { 0x31, };
> +static int x1600_ssi_ce1_a_pins[] =3D { 0x22, };
> +static int x1600_ssi_ce1_b_pins[] =3D { 0x30, };
> +static int x1600_mmc0_1bit_b_pins[] =3D { 0x2c, 0x2d, 0x2e, };
> +static int x1600_mmc0_4bit_b_pins[] =3D { 0x2f, 0x30, 0x31, };
> +static int x1600_mmc0_1bit_c_pins[] =3D { 0x51, 0x53, 0x54, };
> +static int x1600_mmc0_4bit_c_pins[] =3D { 0x56, 0x55, 0x52, };
> +static int x1600_mmc1_1bit_pins[] =3D { 0x60, 0x61, 0x62, };
> +static int x1600_mmc1_4bit_pins[] =3D { 0x63, 0x64, 0x65, };
> +static int x1600_i2c0_a_pins[] =3D { 0x1d, 0x1c, };
> +static int x1600_i2c0_b_pins[] =3D { 0x3f, 0x3e, };
> +static int x1600_i2c1_b_15_pins[] =3D { 0x30, 0x2f, };
> +static int x1600_i2c1_b_19_pins[] =3D { 0x34, 0x33, };
> +static int x1600_i2s_data_tx_pins[] =3D { 0x39, };
> +static int x1600_i2s_data_rx_pins[] =3D { 0x35, };
> +static int x1600_i2s_clk_rx_pins[] =3D { 0x37, 0x38, };
> +static int x1600_i2s_clk_tx_pins[] =3D { 0x3b, 0x3c, };
> +static int x1600_i2s_sysclk_pins[] =3D { 0x36, 0x3a, };
> +
> +static int x1600_cim_pins[] =3D {
> +	0x14, 0x16, 0x15, 0x18, 0x13,
> +	0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f,
> +};
> +
> +static int x1600_slcd_8bit_pins[] =3D {
> +	0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
> +	0x17, 0x19, 0x1a, 0x1b,
> +};
> +
> +static int x1600_slcd_16bit_pins[] =3D {
> +	0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f,
> +};
> +
> +static int x1600_lcd_16bit_pins[] =3D {
> +	0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
> +	0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f,
> +	0x18, 0x19, 0x1a, 0x1b,
> +};
> +
> +static int x1600_lcd_18bit_pins[] =3D {
> +	0x10, 0x11,
> +};
> +
> +static int x1600_lcd_24bit_pins[] =3D {
> +	0x12, 0x13, 0x14, 0x15, 0x16, 0x17,
> +};
> +
> +static int x1600_pwm_pwm0_pins[] =3D { 0x40, };
> +static int x1600_pwm_pwm1_pins[] =3D { 0x41, };
> +static int x1600_pwm_pwm2_pins[] =3D { 0x42, };
> +static int x1600_pwm_pwm3_pins[] =3D { 0x58, };
> +static int x1600_pwm_pwm4_pins[] =3D { 0x59, };
> +static int x1600_pwm_pwm5_pins[] =3D { 0x33, 0x5a, };
> +static int x1600_pwm_pwm6_pins[] =3D { 0x29, 0x34, };
> +static int x1600_pwm_pwm7_pins[] =3D { 0x2a, 0x35, };

Just a quick question about these ones: why are there 2 pins here? If
you have the PWM5/6/7 function on two different pins then you should
probably have two groups.

The rest looks OK.

Cheers,
-Paul

> +
> +static int x1600_mac_pins[] =3D {
> +	0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39, 0x3a, 0x3b, 0x3c,
> +};
> +
> +static int x1600_sfc_funcs[] =3D { 0, 0, 0, 0, 0, 0, 2, };
> +
> +static int x1600_pwm_pwm5_funcs[] =3D { 2, 1, };
> +static int x1600_pwm_pwm6_funcs[] =3D { 1, 2, };
> +static int x1600_pwm_pwm7_funcs[] =3D { 1, 2, };
> +
> +static const struct group_desc x1600_groups[] =3D {
> +	INGENIC_PIN_GROUP("uart0-data", x1600_uart0_data, 0),
> +	INGENIC_PIN_GROUP("uart0-hwflow", x1600_uart0_hwflow, 0),
> +	INGENIC_PIN_GROUP("uart1-data", x1600_uart1_data, 1),
> +	INGENIC_PIN_GROUP("uart1-hwflow", x1600_uart1_hwflow, 1),
> +	INGENIC_PIN_GROUP("uart2-data-a", x1600_uart2_data_a, 2),
> +	INGENIC_PIN_GROUP("uart2-data-b", x1600_uart2_data_b, 1),
> +	INGENIC_PIN_GROUP("uart3-data-b", x1600_uart3_data_b, 0),
> +	INGENIC_PIN_GROUP("uart3-data-d", x1600_uart3_data_d, 2),
> +	INGENIC_PIN_GROUP_FUNCS("sfc", x1600_sfc, x1600_sfc_funcs),
> +	INGENIC_PIN_GROUP("ssi-dt-a", x1600_ssi_dt_a, 0),
> +	INGENIC_PIN_GROUP("ssi-dt-b", x1600_ssi_dt_b, 1),
> +	INGENIC_PIN_GROUP("ssi-dr-a", x1600_ssi_dr_a, 0),
> +	INGENIC_PIN_GROUP("ssi-dr-b", x1600_ssi_dr_b, 1),
> +	INGENIC_PIN_GROUP("ssi-clk-a", x1600_ssi_clk_a, 0),
> +	INGENIC_PIN_GROUP("ssi-clk-b", x1600_ssi_clk_b, 1),
> +	INGENIC_PIN_GROUP("ssi-ce0-a", x1600_ssi_ce0_a, 0),
> +	INGENIC_PIN_GROUP("ssi-ce0-b", x1600_ssi_ce0_b, 1),
> +	INGENIC_PIN_GROUP("ssi-ce1-a", x1600_ssi_ce1_a, 2),
> +	INGENIC_PIN_GROUP("ssi-ce1-b", x1600_ssi_ce1_b, 1),
> +	INGENIC_PIN_GROUP("mmc0-1bit-b", x1600_mmc0_1bit_b, 0),
> +	INGENIC_PIN_GROUP("mmc0-4bit-b", x1600_mmc0_4bit_b, 0),
> +	INGENIC_PIN_GROUP("mmc0-1bit-c", x1600_mmc0_1bit_c, 1),
> +	INGENIC_PIN_GROUP("mmc0-4bit-c", x1600_mmc0_4bit_c, 1),
> +	INGENIC_PIN_GROUP("mmc1-1bit", x1600_mmc1_1bit, 0),
> +	INGENIC_PIN_GROUP("mmc1-4bit", x1600_mmc1_4bit, 0),
> +	INGENIC_PIN_GROUP("i2c0-data-a", x1600_i2c0_a, 2),
> +	INGENIC_PIN_GROUP("i2c0-data-b", x1600_i2c0_b, 0),
> +	INGENIC_PIN_GROUP("i2c1-data-b-15", x1600_i2c1_b_15, 2),
> +	INGENIC_PIN_GROUP("i2c1-data-b-19", x1600_i2c1_b_19, 0),
> +	INGENIC_PIN_GROUP("i2s-data-tx", x1600_i2s_data_tx, 0),
> +	INGENIC_PIN_GROUP("i2s-data-rx", x1600_i2s_data_rx, 0),
> +	INGENIC_PIN_GROUP("i2s-clk-rx", x1600_i2s_clk_rx, 0),
> +	INGENIC_PIN_GROUP("i2s-clk-tx", x1600_i2s_clk_tx, 0),
> +	INGENIC_PIN_GROUP("i2s-sysclk", x1600_i2s_sysclk, 0),
> +	INGENIC_PIN_GROUP("cim-data", x1600_cim, 2),
> +	INGENIC_PIN_GROUP("slcd-8bit", x1600_slcd_8bit, 1),
> +	INGENIC_PIN_GROUP("slcd-16bit", x1600_slcd_16bit, 1),
> +	INGENIC_PIN_GROUP("lcd-16bit", x1600_lcd_16bit, 0),
> +	INGENIC_PIN_GROUP("lcd-18bit", x1600_lcd_18bit, 0),
> +	INGENIC_PIN_GROUP("lcd-24bit", x1600_lcd_24bit, 0),
> +	INGENIC_PIN_GROUP("pwm0", x1600_pwm_pwm0, 0),
> +	INGENIC_PIN_GROUP("pwm1", x1600_pwm_pwm1, 0),
> +	INGENIC_PIN_GROUP("pwm2", x1600_pwm_pwm2, 0),
> +	INGENIC_PIN_GROUP("pwm3", x1600_pwm_pwm3, 1),
> +	INGENIC_PIN_GROUP("pwm4", x1600_pwm_pwm4, 1),
> +	INGENIC_PIN_GROUP_FUNCS("pwm5", x1600_pwm_pwm5,
> x1600_pwm_pwm5_funcs),
> +	INGENIC_PIN_GROUP_FUNCS("pwm6", x1600_pwm_pwm6,
> x1600_pwm_pwm6_funcs),
> +	INGENIC_PIN_GROUP_FUNCS("pwm7", x1600_pwm_pwm7,
> x1600_pwm_pwm7_funcs),
> +	INGENIC_PIN_GROUP("mac", x1600_mac, 1),
> +};
> +
> +static const char * const x1600_uart0_groups[] =3D { "uart0-data",
> "uart0-hwflow", };
> +static const char * const x1600_uart1_groups[] =3D { "uart1-data",
> "uart1-hwflow", };
> +static const char * const x1600_uart2_groups[] =3D { "uart2-data-a",
> "uart2-data-b", };
> +static const char * const x1600_uart3_groups[] =3D { "uart3-data-b",
> "uart3-data-d", };
> +
> +static const char * const x1600_sfc_groups[] =3D { "sfc", };
> +
> +static const char * const x1600_ssi_groups[] =3D {
> +	"ssi-dt-a", "ssi-dt-b",
> +	"ssi-dr-a", "ssi-dr-b",
> +	"ssi-clk-a", "ssi-clk-b",
> +	"ssi-ce0-a", "ssi-ce0-b",
> +	"ssi-ce1-a", "ssi-ce1-b",
> +};
> +
> +static const char * const x1600_mmc0_groups[] =3D { "mmc0-1bit-b",
> "mmc0-4bit-b",
> +	"mmc0-1bit-c", "mmc0-4bit-c",
> +};
> +
> +static const char * const x1600_mmc1_groups[] =3D { "mmc1-1bit",
> "mmc1-4bit", };
> +
> +static const char * const x1600_i2c0_groups[] =3D { "i2c0-data-a",
> "i2c0-data-b", };
> +static const char * const x1600_i2c1_groups[] =3D { "i2c1-data-b-15",
> "i2c1-data-b-19", };
> +
> +static const char * const x1600_i2s_groups[] =3D {
> +	"i2s-data-tx", "i2s-data-rx", "i2s-clk-rx", "i2s-clk-tx",
> "i2s-sysclk",
> +};
> +
> +static const char * const x1600_cim_groups[] =3D { "cim-data", };
> +
> +static const char * const x1600_lcd_groups[] =3D { "slcd-8bit", "slcd-
> 16bit",
> +	"lcd-16bit", "lcd-18bit", "lcd-24bit", "lcd-no-pins",
> +};
> +
> +static const char * const x1600_pwm0_groups[] =3D { "pwm0", };
> +static const char * const x1600_pwm1_groups[] =3D { "pwm1", };
> +static const char * const x1600_pwm2_groups[] =3D { "pwm2", };
> +static const char * const x1600_pwm3_groups[] =3D { "pwm3", };
> +static const char * const x1600_pwm4_groups[] =3D { "pwm4", };
> +static const char * const x1600_pwm5_groups[] =3D { "pwm5", };
> +static const char * const x1600_pwm6_groups[] =3D { "pwm6", };
> +static const char * const x1600_pwm7_groups[] =3D { "pwm7", };
> +
> +static const char * const x1600_mac_groups[] =3D { "mac", };
> +
> +static const struct function_desc x1600_functions[] =3D {
> +	INGENIC_PIN_FUNCTION("uart0", x1600_uart0),
> +	INGENIC_PIN_FUNCTION("uart1", x1600_uart1),
> +	INGENIC_PIN_FUNCTION("uart2", x1600_uart2),
> +	INGENIC_PIN_FUNCTION("uart3", x1600_uart3),
> +	INGENIC_PIN_FUNCTION("sfc", x1600_sfc),
> +	INGENIC_PIN_FUNCTION("ssi", x1600_ssi),
> +	INGENIC_PIN_FUNCTION("mmc0", x1600_mmc0),
> +	INGENIC_PIN_FUNCTION("mmc1", x1600_mmc1),
> +	INGENIC_PIN_FUNCTION("i2c0", x1600_i2c0),
> +	INGENIC_PIN_FUNCTION("i2c1", x1600_i2c1),
> +	INGENIC_PIN_FUNCTION("i2s", x1600_i2s),
> +	INGENIC_PIN_FUNCTION("cim", x1600_cim),
> +	INGENIC_PIN_FUNCTION("lcd", x1600_lcd),
> +	INGENIC_PIN_FUNCTION("pwm0", x1600_pwm0),
> +	INGENIC_PIN_FUNCTION("pwm1", x1600_pwm1),
> +	INGENIC_PIN_FUNCTION("pwm2", x1600_pwm2),
> +	INGENIC_PIN_FUNCTION("pwm3", x1600_pwm3),
> +	INGENIC_PIN_FUNCTION("pwm4", x1600_pwm4),
> +	INGENIC_PIN_FUNCTION("pwm5", x1600_pwm5),
> +	INGENIC_PIN_FUNCTION("pwm6", x1600_pwm6),
> +	INGENIC_PIN_FUNCTION("pwm7", x1600_pwm7),
> +	INGENIC_PIN_FUNCTION("mac", x1600_mac),
> +};
> +
> +static const struct ingenic_chip_info x1600_chip_info =3D {
> +	.num_chips =3D 4,
> +	.reg_offset =3D 0x100,
> +	.version =3D ID_X1600,
> +	.groups =3D x1600_groups,
> +	.num_groups =3D ARRAY_SIZE(x1600_groups),
> +	.functions =3D x1600_functions,
> +	.num_functions =3D ARRAY_SIZE(x1600_functions),
> +	.pull_ups =3D x1600_pull_ups,
> +	.pull_downs =3D x1600_pull_downs,
> +	.access_table =3D &x1000_access_table,
> +};
> +
> =C2=A0static const u32 x1830_pull_ups[4] =3D {
> =C2=A0	0x5fdfffc0, 0xffffefff, 0x1ffffbff, 0x0fcff3fc,
> =C2=A0};
> @@ -3860,7 +4089,9 @@ static int ingenic_pinconf_get(struct
> pinctrl_dev *pctldev,
> =C2=A0		pulldown =3D (bias =3D=3D GPIO_PULL_DOWN) && (jzpc->info-
> >pull_downs[offt] & BIT(idx));
> =C2=A0
> =C2=A0	} else {
> -		if (is_soc_or_above(jzpc, ID_JZ4770))
> +		if (is_soc_or_above(jzpc, ID_X1600))
> +			pull =3D ingenic_get_pin_config(jzpc, pin,
> X1600_GPIO_PU);
> +		else if (is_soc_or_above(jzpc, ID_JZ4770))
> =C2=A0			pull =3D !ingenic_get_pin_config(jzpc, pin,
> JZ4770_GPIO_PEN);
> =C2=A0		else if (is_soc_or_above(jzpc, ID_JZ4740))
> =C2=A0			pull =3D !ingenic_get_pin_config(jzpc, pin,
> JZ4740_GPIO_PULL_DIS);
> @@ -3959,6 +4190,8 @@ static void ingenic_set_bias(struct
> ingenic_pinctrl *jzpc,
> =C2=A0					REG_SET(X1830_GPIO_PEH),
> bias << idxh);
> =C2=A0		}
> =C2=A0
> +	} else if (is_soc_or_above(jzpc, ID_X1600)) {
> +		ingenic_config_pin(jzpc, pin, X1600_GPIO_PU, bias);
> =C2=A0	} else if (is_soc_or_above(jzpc, ID_JZ4770)) {
> =C2=A0		ingenic_config_pin(jzpc, pin, JZ4770_GPIO_PEN,
> !bias);
> =C2=A0	} else if (is_soc_or_above(jzpc, ID_JZ4740)) {
> @@ -4150,6 +4383,7 @@ static const struct of_device_id
> ingenic_gpio_of_matches[] __initconst =3D {
> =C2=A0	{ .compatible =3D "ingenic,jz4775-gpio" },
> =C2=A0	{ .compatible =3D "ingenic,jz4780-gpio" },
> =C2=A0	{ .compatible =3D "ingenic,x1000-gpio" },
> +	{ .compatible =3D "ingenic,x1600-gpio" },
> =C2=A0	{ .compatible =3D "ingenic,x1830-gpio" },
> =C2=A0	{ .compatible =3D "ingenic,x2000-gpio" },
> =C2=A0	{ .compatible =3D "ingenic,x2100-gpio" },
> @@ -4397,6 +4631,10 @@ static const struct of_device_id
> ingenic_pinctrl_of_matches[] =3D {
> =C2=A0		.compatible =3D "ingenic,x1500-pinctrl",
> =C2=A0		.data =3D IF_ENABLED(CONFIG_MACH_X1500,
> &x1500_chip_info)
> =C2=A0	},
> +	{
> +		.compatible =3D "ingenic,x1600-pinctrl",
> +		.data =3D IF_ENABLED(CONFIG_MACH_X1600,
> &x1600_chip_info)
> +	},
> =C2=A0	{
> =C2=A0		.compatible =3D "ingenic,x1830-pinctrl",
> =C2=A0		.data =3D IF_ENABLED(CONFIG_MACH_X1830,
> &x1830_chip_info)


