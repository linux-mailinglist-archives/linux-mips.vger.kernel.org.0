Return-Path: <linux-mips+bounces-9954-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E48ECB163D4
	for <lists+linux-mips@lfdr.de>; Wed, 30 Jul 2025 17:42:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 019465672B5
	for <lists+linux-mips@lfdr.de>; Wed, 30 Jul 2025 15:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3163E2DC344;
	Wed, 30 Jul 2025 15:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="4Q2yQiV6"
X-Original-To: linux-mips@vger.kernel.org
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0823728003A;
	Wed, 30 Jul 2025 15:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.119.170.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753890158; cv=none; b=SSe0eEAsLjD0JOJiHwqPI/Y1y0kh3H+f83D13cjPOLvcj7UZC0Wy/zHjVfonudkl4Qh9Pxw59hx5ARDUnDZWl/uXvVW/ly497/xdcjmxPjryh2XZ3+t61C5p7+e8GhG+kaumBnyE+t4rGT+LhMa1gXGCGrasOu4GASZGs3JgFyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753890158; c=relaxed/simple;
	bh=S3voxAJZcAEBJCrnKudZL9UaueiwvjY42pAz32WNj/c=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=okiMW3JkYufqOpnmFGlhYcTqClulGUeR1fvwCNZSI8vs76XXCu9EKwya1OblKKcrJL8wZ09AfJYiK9iqoD3dxmGXA/D0ksGgkKPizivVaXaw6/s+QjKwtpwhsssULyPbhJ/boR7CBnDp9GfxJy1DLAXoGEOraiUA+0KpPBSY/gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net; spf=pass smtp.mailfrom=crapouillou.net; dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b=4Q2yQiV6; arc=none smtp.client-ip=185.119.170.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1753889703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+A2EYSYGXUTyecspfSq8haW0lJ3/BUIyY65G7kmYoMc=;
	b=4Q2yQiV6QHlq/IFSgYHLB3uaNuohZ1SaylFQ8oAG0sCUUlhcq5Kz8CnQPtqyzI2P3BVguF
	AwOc7GkRyD8NrDR1MH6ywUtipiaON+KQPQBzJEvFa+BEZbKqWOpQshOpdwIQiwhWXrEyUb
	J5YKvkmDnse9kc7aJ8EO1ZJq+1Y9bEc=
Message-ID: <b254e3868cfca4785d9dfbd13d3cc8ad1f33b6db.camel@crapouillou.net>
Subject: Re: [PATCH v3 02/15] pinctrl: ingenic: use struct pinfunction
 instead of struct function_desc
From: Paul Cercueil <paul@crapouillou.net>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij	
 <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, Konrad
 Dybcio <konradybcio@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>,
 Lorenzo Bianconi	 <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>,
 Matthias Brugger	 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Kees Cook <kees@kernel.org>,
 Andy Shevchenko <andy@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, David Hildenbrand	 <david@redhat.com>, Lorenzo
 Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport
 <rppt@kernel.org>,  Suren Baghdasaryan	 <surenb@google.com>, Michal Hocko
 <mhocko@suse.com>, Dong Aisheng	 <aisheng.dong@nxp.com>, Fabio Estevam
 <festevam@gmail.com>, Shawn Guo	 <shawnguo@kernel.org>, Jacky Bai
 <ping.bai@nxp.com>, Pengutronix Kernel Team	 <kernel@pengutronix.de>, NXP
 S32 Linux Team <s32@nxp.com>, Sascha Hauer	 <s.hauer@pengutronix.de>, Tony
 Lindgren <tony@atomide.com>, Haojian Zhuang	 <haojian.zhuang@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Bartosz
 Golaszewski <bartosz.golaszewski@linaro.org>
Date: Wed, 30 Jul 2025 17:35:00 +0200
In-Reply-To: <20250724-pinctrl-gpio-pinfuncs-v3-2-af4db9302de4@linaro.org>
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
	 <20250724-pinctrl-gpio-pinfuncs-v3-2-af4db9302de4@linaro.org>
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

Le jeudi 24 juillet 2025 =C3=A0 11:24 +0200, Bartosz Golaszewski a =C3=A9cr=
it=C2=A0:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> struct function_desc is a wrapper around struct pinfunction with an
> additional void *data pointer. This driver doesn't use the data
> pointer.
> We're also working towards reducing the usage of struct function_desc
> in
> pinctrl drivers - they should only be created by pinmux core and
> accessed by drivers using pinmux_generic_get_function(). Replace the
> struct function_desc objects in this driver with smaller struct
> pinfunction instances.
>=20
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
> =C2=A0drivers/pinctrl/pinctrl-ingenic.c | 45 +++++++++++++++++-----------=
-
> ----------
> =C2=A01 file changed, 20 insertions(+), 25 deletions(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-ingenic.c
> b/drivers/pinctrl/pinctrl-ingenic.c
> index
> 79119cf20efcf8cc701647d9ff979c2b71bf7589..0ee8554c5446c4167c9b0e6b939
> 7a2507ca57419 100644
> --- a/drivers/pinctrl/pinctrl-ingenic.c
> +++ b/drivers/pinctrl/pinctrl-ingenic.c
> @@ -96,11 +96,8 @@
> =C2=A0		.data =3D (void
> *)func,							\
> =C2=A0	}
> =C2=A0
> -#define INGENIC_PIN_FUNCTION(_name_,
> id)							\
> -
> 	{											\
> -		.func =3D PINCTRL_PINFUNCTION(_name_, id##_groups,
> ARRAY_SIZE(id##_groups)),	\
> -		.data =3D
> NULL,									\
> -	}
> +#define INGENIC_PIN_FUNCTION(_name_,
> id)						\
> +	PINCTRL_PINFUNCTION(_name_, id##_groups,
> ARRAY_SIZE(id##_groups))
> =C2=A0
> =C2=A0enum jz_version {
> =C2=A0	ID_JZ4730,
> @@ -128,7 +125,7 @@ struct ingenic_chip_info {
> =C2=A0	const struct group_desc *groups;
> =C2=A0	unsigned int num_groups;
> =C2=A0
> -	const struct function_desc *functions;
> +	const struct pinfunction *functions;
> =C2=A0	unsigned int num_functions;
> =C2=A0
> =C2=A0	const u32 *pull_ups, *pull_downs;
> @@ -263,7 +260,7 @@ static const char *jz4730_pwm1_groups[] =3D {
> "pwm1", };
> =C2=A0static const char *jz4730_mii_groups[] =3D { "mii", };
> =C2=A0static const char *jz4730_i2s_groups[] =3D { "i2s-data", "i2s-maste=
r",
> "i2s-slave", };
> =C2=A0
> -static const struct function_desc jz4730_functions[] =3D {
> +static const struct pinfunction jz4730_functions[] =3D {
> =C2=A0	INGENIC_PIN_FUNCTION("mmc", jz4730_mmc),
> =C2=A0	INGENIC_PIN_FUNCTION("uart0", jz4730_uart0),
> =C2=A0	INGENIC_PIN_FUNCTION("uart1", jz4730_uart1),
> @@ -370,7 +367,7 @@ static const char *jz4740_pwm5_groups[] =3D {
> "pwm5", };
> =C2=A0static const char *jz4740_pwm6_groups[] =3D { "pwm6", };
> =C2=A0static const char *jz4740_pwm7_groups[] =3D { "pwm7", };
> =C2=A0
> -static const struct function_desc jz4740_functions[] =3D {
> +static const struct pinfunction jz4740_functions[] =3D {
> =C2=A0	INGENIC_PIN_FUNCTION("mmc", jz4740_mmc),
> =C2=A0	INGENIC_PIN_FUNCTION("uart0", jz4740_uart0),
> =C2=A0	INGENIC_PIN_FUNCTION("uart1", jz4740_uart1),
> @@ -474,7 +471,7 @@ static const char *jz4725b_pwm3_groups[] =3D {
> "pwm3", };
> =C2=A0static const char *jz4725b_pwm4_groups[] =3D { "pwm4", };
> =C2=A0static const char *jz4725b_pwm5_groups[] =3D { "pwm5", };
> =C2=A0
> -static const struct function_desc jz4725b_functions[] =3D {
> +static const struct pinfunction jz4725b_functions[] =3D {
> =C2=A0	INGENIC_PIN_FUNCTION("mmc0", jz4725b_mmc0),
> =C2=A0	INGENIC_PIN_FUNCTION("mmc1", jz4725b_mmc1),
> =C2=A0	INGENIC_PIN_FUNCTION("uart", jz4725b_uart),
> @@ -606,7 +603,7 @@ static const char *jz4750_pwm3_groups[] =3D {
> "pwm3", };
> =C2=A0static const char *jz4750_pwm4_groups[] =3D { "pwm4", };
> =C2=A0static const char *jz4750_pwm5_groups[] =3D { "pwm5", };
> =C2=A0
> -static const struct function_desc jz4750_functions[] =3D {
> +static const struct pinfunction jz4750_functions[] =3D {
> =C2=A0	INGENIC_PIN_FUNCTION("uart0", jz4750_uart0),
> =C2=A0	INGENIC_PIN_FUNCTION("uart1", jz4750_uart1),
> =C2=A0	INGENIC_PIN_FUNCTION("uart2", jz4750_uart2),
> @@ -771,7 +768,7 @@ static const char *jz4755_pwm3_groups[] =3D {
> "pwm3", };
> =C2=A0static const char *jz4755_pwm4_groups[] =3D { "pwm4", };
> =C2=A0static const char *jz4755_pwm5_groups[] =3D { "pwm5", };
> =C2=A0
> -static const struct function_desc jz4755_functions[] =3D {
> +static const struct pinfunction jz4755_functions[] =3D {
> =C2=A0	INGENIC_PIN_FUNCTION("uart0", jz4755_uart0),
> =C2=A0	INGENIC_PIN_FUNCTION("uart1", jz4755_uart1),
> =C2=A0	INGENIC_PIN_FUNCTION("uart2", jz4755_uart2),
> @@ -1106,7 +1103,7 @@ static const char *jz4760_pwm6_groups[] =3D {
> "pwm6", };
> =C2=A0static const char *jz4760_pwm7_groups[] =3D { "pwm7", };
> =C2=A0static const char *jz4760_otg_groups[] =3D { "otg-vbus", };
> =C2=A0
> -static const struct function_desc jz4760_functions[] =3D {
> +static const struct pinfunction jz4760_functions[] =3D {
> =C2=A0	INGENIC_PIN_FUNCTION("uart0", jz4760_uart0),
> =C2=A0	INGENIC_PIN_FUNCTION("uart1", jz4760_uart1),
> =C2=A0	INGENIC_PIN_FUNCTION("uart2", jz4760_uart2),
> @@ -1444,7 +1441,7 @@ static const char *jz4770_pwm6_groups[] =3D {
> "pwm6", };
> =C2=A0static const char *jz4770_pwm7_groups[] =3D { "pwm7", };
> =C2=A0static const char *jz4770_mac_groups[] =3D { "mac-rmii", "mac-mii",=
 };
> =C2=A0
> -static const struct function_desc jz4770_functions[] =3D {
> +static const struct pinfunction jz4770_functions[] =3D {
> =C2=A0	INGENIC_PIN_FUNCTION("uart0", jz4770_uart0),
> =C2=A0	INGENIC_PIN_FUNCTION("uart1", jz4770_uart1),
> =C2=A0	INGENIC_PIN_FUNCTION("uart2", jz4770_uart2),
> @@ -1723,7 +1720,7 @@ static const char *jz4775_mac_groups[] =3D {
> =C2=A0};
> =C2=A0static const char *jz4775_otg_groups[] =3D { "otg-vbus", };
> =C2=A0
> -static const struct function_desc jz4775_functions[] =3D {
> +static const struct pinfunction jz4775_functions[] =3D {
> =C2=A0	INGENIC_PIN_FUNCTION("uart0", jz4775_uart0),
> =C2=A0	INGENIC_PIN_FUNCTION("uart1", jz4775_uart1),
> =C2=A0	INGENIC_PIN_FUNCTION("uart2", jz4775_uart2),
> @@ -1976,7 +1973,7 @@ static const char *jz4780_dmic_groups[] =3D {
> "dmic", };
> =C2=A0static const char *jz4780_cim_groups[] =3D { "cim-data", };
> =C2=A0static const char *jz4780_hdmi_ddc_groups[] =3D { "hdmi-ddc", };
> =C2=A0
> -static const struct function_desc jz4780_functions[] =3D {
> +static const struct pinfunction jz4780_functions[] =3D {
> =C2=A0	INGENIC_PIN_FUNCTION("uart0", jz4770_uart0),
> =C2=A0	INGENIC_PIN_FUNCTION("uart1", jz4770_uart1),
> =C2=A0	INGENIC_PIN_FUNCTION("uart2", jz4780_uart2),
> @@ -2211,7 +2208,7 @@ static const char *x1000_pwm3_groups[] =3D {
> "pwm3", };
> =C2=A0static const char *x1000_pwm4_groups[] =3D { "pwm4", };
> =C2=A0static const char *x1000_mac_groups[] =3D { "mac", };
> =C2=A0
> -static const struct function_desc x1000_functions[] =3D {
> +static const struct pinfunction x1000_functions[] =3D {
> =C2=A0	INGENIC_PIN_FUNCTION("uart0", x1000_uart0),
> =C2=A0	INGENIC_PIN_FUNCTION("uart1", x1000_uart1),
> =C2=A0	INGENIC_PIN_FUNCTION("uart2", x1000_uart2),
> @@ -2341,7 +2338,7 @@ static const char *x1500_pwm2_groups[] =3D {
> "pwm2", };
> =C2=A0static const char *x1500_pwm3_groups[] =3D { "pwm3", };
> =C2=A0static const char *x1500_pwm4_groups[] =3D { "pwm4", };
> =C2=A0
> -static const struct function_desc x1500_functions[] =3D {
> +static const struct pinfunction x1500_functions[] =3D {
> =C2=A0	INGENIC_PIN_FUNCTION("uart0", x1500_uart0),
> =C2=A0	INGENIC_PIN_FUNCTION("uart1", x1500_uart1),
> =C2=A0	INGENIC_PIN_FUNCTION("uart2", x1500_uart2),
> @@ -2562,7 +2559,7 @@ static const char * const x1600_pwm7_groups[] =3D
> { "pwm7-b10", "pwm7-b21", };
> =C2=A0
> =C2=A0static const char * const x1600_mac_groups[] =3D { "mac", };
> =C2=A0
> -static const struct function_desc x1600_functions[] =3D {
> +static const struct pinfunction x1600_functions[] =3D {
> =C2=A0	INGENIC_PIN_FUNCTION("uart0", x1600_uart0),
> =C2=A0	INGENIC_PIN_FUNCTION("uart1", x1600_uart1),
> =C2=A0	INGENIC_PIN_FUNCTION("uart2", x1600_uart2),
> @@ -2779,7 +2776,7 @@ static const char *x1830_pwm6_groups[] =3D {
> "pwm6-c-17", "pwm6-c-27", };
> =C2=A0static const char *x1830_pwm7_groups[] =3D { "pwm7-c-18", "pwm7-c-2=
8",
> };
> =C2=A0static const char *x1830_mac_groups[] =3D { "mac", };
> =C2=A0
> -static const struct function_desc x1830_functions[] =3D {
> +static const struct pinfunction x1830_functions[] =3D {
> =C2=A0	INGENIC_PIN_FUNCTION("uart0", x1830_uart0),
> =C2=A0	INGENIC_PIN_FUNCTION("uart1", x1830_uart1),
> =C2=A0	INGENIC_PIN_FUNCTION("sfc", x1830_sfc),
> @@ -3225,7 +3222,7 @@ static const char *x2000_mac0_groups[] =3D {
> "mac0-rmii", "mac0-rgmii", };
> =C2=A0static const char *x2000_mac1_groups[] =3D { "mac1-rmii", "mac1-
> rgmii", };
> =C2=A0static const char *x2000_otg_groups[] =3D { "otg-vbus", };
> =C2=A0
> -static const struct function_desc x2000_functions[] =3D {
> +static const struct pinfunction x2000_functions[] =3D {
> =C2=A0	INGENIC_PIN_FUNCTION("uart0", x2000_uart0),
> =C2=A0	INGENIC_PIN_FUNCTION("uart1", x2000_uart1),
> =C2=A0	INGENIC_PIN_FUNCTION("uart2", x2000_uart2),
> @@ -3449,7 +3446,7 @@ static const struct group_desc x2100_groups[] =3D
> {
> =C2=A0
> =C2=A0static const char *x2100_mac_groups[] =3D { "mac", };
> =C2=A0
> -static const struct function_desc x2100_functions[] =3D {
> +static const struct pinfunction x2100_functions[] =3D {
> =C2=A0	INGENIC_PIN_FUNCTION("uart0", x2000_uart0),
> =C2=A0	INGENIC_PIN_FUNCTION("uart1", x2000_uart1),
> =C2=A0	INGENIC_PIN_FUNCTION("uart2", x2000_uart2),
> @@ -4571,11 +4568,9 @@ static int __init ingenic_pinctrl_probe(struct
> platform_device *pdev)
> =C2=A0	}
> =C2=A0
> =C2=A0	for (i =3D 0; i < chip_info->num_functions; i++) {
> -		const struct function_desc *function =3D &chip_info-
> >functions[i];
> -		const struct pinfunction *func =3D &function->func;
> +		const struct pinfunction *func =3D &chip_info-
> >functions[i];
> =C2=A0
> -		err =3D pinmux_generic_add_pinfunction(jzpc->pctl,
> func,
> -						=C2=A0=C2=A0=C2=A0=C2=A0 function-
> >data);
> +		err =3D pinmux_generic_add_pinfunction(jzpc->pctl,
> func, NULL);
> =C2=A0		if (err < 0) {
> =C2=A0			dev_err(dev, "Failed to register function
> %s\n", func->name);
> =C2=A0			return err;

