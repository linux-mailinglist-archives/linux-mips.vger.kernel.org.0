Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8399D10B5AE
	for <lists+linux-mips@lfdr.de>; Wed, 27 Nov 2019 19:26:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727007AbfK0S0G (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 Nov 2019 13:26:06 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:60670 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727126AbfK0S0G (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 27 Nov 2019 13:26:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1574879162; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=e+cY1eiW6o/RNw86QDUfMd6j8tHBQo1szHle3P+Y/Yg=;
        b=C1Yjz7JFWQrs28W7I3z6gRpDO5gkkSkP8HlBTSlLmDFpA0Sh41gYcttK4lWilw+Cc8TpRm
        qX7mnojUYMA6gNEhLxyOcVDimMvUzuF4a1s4ftM7mQrwuazRqesIdaFpasYWs8Erriyyh5
        1UCd0iWFRF2pYUM6O5iWbsTcncAnBis=
Date:   Wed, 27 Nov 2019 19:25:53 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v6 4/4] pinctrl: Ingenic: Add pinctrl driver for X1830.
To:     Zhou Yanjie <zhouyanjie@zoho.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, paulburton@kernel.org,
        mark.rutland@arm.com, syq@debian.org
Message-Id: <1574879153.3.5@crapouillou.net>
In-Reply-To: <1574746436-80066-5-git-send-email-zhouyanjie@zoho.com>
References: <1574746436-80066-1-git-send-email-zhouyanjie@zoho.com>
        <1574746436-80066-5-git-send-email-zhouyanjie@zoho.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,


Le mar., nov. 26, 2019 at 13:33, Zhou Yanjie <zhouyanjie@zoho.com> a=20
=E9crit :
> Add support for probing the pinctrl-ingenic driver on the
> X1830 Soc from Ingenic.
>=20
> Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
> ---
>=20
> Notes:
>     v2:
>     New patch.
>=20
>     v2->v3:
>     Add pinctrl drivers for the PWM of X1830.
>=20
>     v3->v4:
>     1.Use local variables to streamline code.
>     2.Prevents processors older than X1830 from being
>       configured in HiZ mode.
>=20
>     v4->v5:
>     Fix compile-time warnings.
>     Reported-by: kbuild test robot <lkp@intel.com>
>=20
>     v5->v6:
>     1.Use local variables to streamline code.
>     2.Rename "GPIO_HIZ" to "GPIO_PULL_DIS", and adjust
>       related code.
>=20
>  drivers/pinctrl/pinctrl-ingenic.c | 341=20
> +++++++++++++++++++++++++++++++++++---
>  1 file changed, 321 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-ingenic.c=20
> b/drivers/pinctrl/pinctrl-ingenic.c
> index 38f7f147..7b1b7ee 100644
> --- a/drivers/pinctrl/pinctrl-ingenic.c
> +++ b/drivers/pinctrl/pinctrl-ingenic.c
> @@ -28,6 +28,10 @@
>  #define GPIO_PIN	0x00
>  #define GPIO_MSK	0x20
>=20
> +#define GPIO_PULL_DIS	0x00
> +#define GPIO_PULL_UP	0x01
> +#define GPIO_PULL_DOWN	0x10
> +
>  #define JZ4740_GPIO_DATA	0x10
>  #define JZ4740_GPIO_PULL_DIS	0x30
>  #define JZ4740_GPIO_FUNC	0x40
> @@ -45,6 +49,11 @@
>  #define X1000_GPIO_PZ_BASE		0x700
>  #define X1000_GPIO_PZ_GID2LD	0x7f0
>=20
> +#define X1830_GPIO_PEL			0x110
> +#define X1830_GPIO_PEH			0x120
> +#define X1830_GPIO_PZ_BASE		0x7000
> +#define X1830_GPIO_PZ_GID2LD	0x70f0
> +
>  #define REG_SET(x) ((x) + 0x4)
>  #define REG_CLEAR(x) ((x) + 0x8)
>=20
> @@ -60,6 +69,7 @@ enum jz_version {
>  	ID_X1000,
>  	ID_X1000E,
>  	ID_X1500,
> +	ID_X1830,
>  };
>=20
>  struct ingenic_chip_info {
> @@ -1394,6 +1404,220 @@ static const struct ingenic_chip_info=20
> x1500_chip_info =3D {
>  	.pull_downs =3D x1000_pull_downs,
>  };
>=20
> +static const u32 x1830_pull_ups[4] =3D {
> +	0x5fdfffc0, 0xffffefff, 0x1ffffbff, 0x0fcff3fc,
> +};
> +
> +static const u32 x1830_pull_downs[4] =3D {
> +	0x5fdfffc0, 0xffffefff, 0x1ffffbff, 0x0fcff3fc,
> +};
> +
> +static int x1830_uart0_data_pins[] =3D { 0x33, 0x36, };
> +static int x1830_uart0_hwflow_pins[] =3D { 0x34, 0x35, };
> +static int x1830_uart1_data_pins[] =3D { 0x38, 0x37, };
> +static int x1830_sfc_pins[] =3D { 0x17, 0x18, 0x1a, 0x19, 0x1b, 0x1c,=20
> };
> +static int x1830_ssi0_dt_pins[] =3D { 0x4c, };
> +static int x1830_ssi0_dr_pins[] =3D { 0x4b, };
> +static int x1830_ssi0_clk_pins[] =3D { 0x4f, };
> +static int x1830_ssi0_gpc_pins[] =3D { 0x4d, };
> +static int x1830_ssi0_ce0_pins[] =3D { 0x50, };
> +static int x1830_ssi0_ce1_pins[] =3D { 0x4e, };
> +static int x1830_ssi1_dt_c_pins[] =3D { 0x53, };
> +static int x1830_ssi1_dr_c_pins[] =3D { 0x54, };
> +static int x1830_ssi1_clk_c_pins[] =3D { 0x57, };
> +static int x1830_ssi1_gpc_c_pins[] =3D { 0x55, };
> +static int x1830_ssi1_ce0_c_pins[] =3D { 0x58, };
> +static int x1830_ssi1_ce1_c_pins[] =3D { 0x56, };
> +static int x1830_ssi1_dt_d_pins[] =3D { 0x62, };
> +static int x1830_ssi1_dr_d_pins[] =3D { 0x63, };
> +static int x1830_ssi1_clk_d_pins[] =3D { 0x66, };
> +static int x1830_ssi1_gpc_d_pins[] =3D { 0x64, };
> +static int x1830_ssi1_ce0_d_pins[] =3D { 0x67, };
> +static int x1830_ssi1_ce1_d_pins[] =3D { 0x65, };
> +static int x1830_mmc0_1bit_pins[] =3D { 0x24, 0x25, 0x20, };
> +static int x1830_mmc0_4bit_pins[] =3D { 0x21, 0x22, 0x23, };
> +static int x1830_mmc1_1bit_pins[] =3D { 0x42, 0x43, 0x44, };
> +static int x1830_mmc1_4bit_pins[] =3D { 0x45, 0x46, 0x47, };
> +static int x1830_i2c0_pins[] =3D { 0x0c, 0x0d, };
> +static int x1830_i2c1_pins[] =3D { 0x39, 0x3a, };
> +static int x1830_i2c2_pins[] =3D { 0x5b, 0x5c, };
> +static int x1830_pwm_pwm0_b_pins[] =3D { 0x31, };
> +static int x1830_pwm_pwm0_c_pins[] =3D { 0x4b, };
> +static int x1830_pwm_pwm1_b_pins[] =3D { 0x32, };
> +static int x1830_pwm_pwm1_c_pins[] =3D { 0x4c, };
> +static int x1830_pwm_pwm2_c_8_pins[] =3D { 0x48, };
> +static int x1830_pwm_pwm2_c_13_pins[] =3D { 0x4d, };
> +static int x1830_pwm_pwm3_c_9_pins[] =3D { 0x49, };
> +static int x1830_pwm_pwm3_c_14_pins[] =3D { 0x4e, };
> +static int x1830_pwm_pwm4_c_15_pins[] =3D { 0x4f, };
> +static int x1830_pwm_pwm4_c_25_pins[] =3D { 0x59, };
> +static int x1830_pwm_pwm5_c_16_pins[] =3D { 0x50, };
> +static int x1830_pwm_pwm5_c_26_pins[] =3D { 0x5a, };
> +static int x1830_pwm_pwm6_c_17_pins[] =3D { 0x51, };
> +static int x1830_pwm_pwm6_c_27_pins[] =3D { 0x5b, };
> +static int x1830_pwm_pwm7_c_18_pins[] =3D { 0x52, };
> +static int x1830_pwm_pwm7_c_28_pins[] =3D { 0x5c, };
> +static int x1830_mac_pins[] =3D {
> +	0x29, 0x30, 0x2f, 0x28, 0x2e, 0x2d, 0x2a, 0x2b, 0x26, 0x27,
> +};
> +
> +static int x1830_uart0_data_funcs[] =3D { 0, 0, };
> +static int x1830_uart0_hwflow_funcs[] =3D { 0, 0, };
> +static int x1830_uart1_data_funcs[] =3D { 0, 0, };
> +static int x1830_sfc_funcs[] =3D { 1, 1, 1, 1, 1, 1, };
> +static int x1830_ssi0_dt_funcs[] =3D { 0, };
> +static int x1830_ssi0_dr_funcs[] =3D { 0, };
> +static int x1830_ssi0_clk_funcs[] =3D { 0, };
> +static int x1830_ssi0_gpc_funcs[] =3D { 0, };
> +static int x1830_ssi0_ce0_funcs[] =3D { 0, };
> +static int x1830_ssi0_ce1_funcs[] =3D { 0, };
> +static int x1830_ssi1_dt_c_funcs[] =3D { 1, };
> +static int x1830_ssi1_dr_c_funcs[] =3D { 1, };
> +static int x1830_ssi1_clk_c_funcs[] =3D { 1, };
> +static int x1830_ssi1_gpc_c_funcs[] =3D { 1, };
> +static int x1830_ssi1_ce0_c_funcs[] =3D { 1, };
> +static int x1830_ssi1_ce1_c_funcs[] =3D { 1, };
> +static int x1830_ssi1_dt_d_funcs[] =3D { 2, };
> +static int x1830_ssi1_dr_d_funcs[] =3D { 2, };
> +static int x1830_ssi1_clk_d_funcs[] =3D { 2, };
> +static int x1830_ssi1_gpc_d_funcs[] =3D { 2, };
> +static int x1830_ssi1_ce0_d_funcs[] =3D { 2, };
> +static int x1830_ssi1_ce1_d_funcs[] =3D { 2, };
> +static int x1830_mmc0_1bit_funcs[] =3D { 0, 0, 0, };
> +static int x1830_mmc0_4bit_funcs[] =3D { 0, 0, 0, };
> +static int x1830_mmc1_1bit_funcs[] =3D { 0, 0, 0, };
> +static int x1830_mmc1_4bit_funcs[] =3D { 0, 0, 0, };
> +static int x1830_i2c0_funcs[] =3D { 1, 1, };
> +static int x1830_i2c1_funcs[] =3D { 0, 0, };
> +static int x1830_i2c2_funcs[] =3D { 1, 1, };
> +static int x1830_pwm_pwm0_b_funcs[] =3D { 0, };
> +static int x1830_pwm_pwm0_c_funcs[] =3D { 1, };
> +static int x1830_pwm_pwm1_b_funcs[] =3D { 0, };
> +static int x1830_pwm_pwm1_c_funcs[] =3D { 1, };
> +static int x1830_pwm_pwm2_c_8_funcs[] =3D { 0, };
> +static int x1830_pwm_pwm2_c_13_funcs[] =3D { 1, };
> +static int x1830_pwm_pwm3_c_9_funcs[] =3D { 0, };
> +static int x1830_pwm_pwm3_c_14_funcs[] =3D { 1, };
> +static int x1830_pwm_pwm4_c_15_funcs[] =3D { 1, };
> +static int x1830_pwm_pwm4_c_25_funcs[] =3D { 0, };
> +static int x1830_pwm_pwm5_c_16_funcs[] =3D { 1, };
> +static int x1830_pwm_pwm5_c_26_funcs[] =3D { 0, };
> +static int x1830_pwm_pwm6_c_17_funcs[] =3D { 1, };
> +static int x1830_pwm_pwm6_c_27_funcs[] =3D { 0, };
> +static int x1830_pwm_pwm7_c_18_funcs[] =3D { 1, };
> +static int x1830_pwm_pwm7_c_28_funcs[] =3D { 0, };
> +static int x1830_mac_funcs[] =3D { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, };
> +
> +static const struct group_desc x1830_groups[] =3D {
> +	INGENIC_PIN_GROUP("uart0-data", x1830_uart0_data),
> +	INGENIC_PIN_GROUP("uart0-hwflow", x1830_uart0_hwflow),
> +	INGENIC_PIN_GROUP("uart1-data", x1830_uart1_data),
> +	INGENIC_PIN_GROUP("sfc", x1830_sfc),
> +	INGENIC_PIN_GROUP("ssi0-dt", x1830_ssi0_dt),
> +	INGENIC_PIN_GROUP("ssi0-dr", x1830_ssi0_dr),
> +	INGENIC_PIN_GROUP("ssi0-clk", x1830_ssi0_clk),
> +	INGENIC_PIN_GROUP("ssi0-gpc", x1830_ssi0_gpc),
> +	INGENIC_PIN_GROUP("ssi0-ce0", x1830_ssi0_ce0),
> +	INGENIC_PIN_GROUP("ssi0-ce1", x1830_ssi0_ce1),
> +	INGENIC_PIN_GROUP("ssi1-dt-c", x1830_ssi1_dt_c),
> +	INGENIC_PIN_GROUP("ssi1-dr-c", x1830_ssi1_dr_c),
> +	INGENIC_PIN_GROUP("ssi1-clk-c", x1830_ssi1_clk_c),
> +	INGENIC_PIN_GROUP("ssi1-gpc-c", x1830_ssi1_gpc_c),
> +	INGENIC_PIN_GROUP("ssi1-ce0-c", x1830_ssi1_ce0_c),
> +	INGENIC_PIN_GROUP("ssi1-ce1-c", x1830_ssi1_ce1_c),
> +	INGENIC_PIN_GROUP("ssi1-dt-d", x1830_ssi1_dt_d),
> +	INGENIC_PIN_GROUP("ssi1-dr-d", x1830_ssi1_dr_d),
> +	INGENIC_PIN_GROUP("ssi1-clk-d", x1830_ssi1_clk_d),
> +	INGENIC_PIN_GROUP("ssi1-gpc-d", x1830_ssi1_gpc_d),
> +	INGENIC_PIN_GROUP("ssi1-ce0-d", x1830_ssi1_ce0_d),
> +	INGENIC_PIN_GROUP("ssi1-ce1-d", x1830_ssi1_ce1_d),
> +	INGENIC_PIN_GROUP("mmc0-1bit", x1830_mmc0_1bit),
> +	INGENIC_PIN_GROUP("mmc0-4bit", x1830_mmc0_4bit),
> +	INGENIC_PIN_GROUP("mmc1-1bit", x1830_mmc1_1bit),
> +	INGENIC_PIN_GROUP("mmc1-4bit", x1830_mmc1_4bit),
> +	INGENIC_PIN_GROUP("i2c0-data", x1830_i2c0),
> +	INGENIC_PIN_GROUP("i2c1-data", x1830_i2c1),
> +	INGENIC_PIN_GROUP("i2c2-data", x1830_i2c2),
> +	INGENIC_PIN_GROUP("pwm0-b", x1830_pwm_pwm0_b),
> +	INGENIC_PIN_GROUP("pwm0-c", x1830_pwm_pwm0_c),
> +	INGENIC_PIN_GROUP("pwm1-b", x1830_pwm_pwm1_b),
> +	INGENIC_PIN_GROUP("pwm1-c", x1830_pwm_pwm1_c),
> +	INGENIC_PIN_GROUP("pwm2-c-8", x1830_pwm_pwm2_c_8),
> +	INGENIC_PIN_GROUP("pwm2-c-13", x1830_pwm_pwm2_c_13),
> +	INGENIC_PIN_GROUP("pwm3-c-9", x1830_pwm_pwm3_c_9),
> +	INGENIC_PIN_GROUP("pwm3-c-14", x1830_pwm_pwm3_c_14),
> +	INGENIC_PIN_GROUP("pwm4-c-15", x1830_pwm_pwm4_c_15),
> +	INGENIC_PIN_GROUP("pwm4-c-25", x1830_pwm_pwm4_c_25),
> +	INGENIC_PIN_GROUP("pwm5-c-16", x1830_pwm_pwm5_c_16),
> +	INGENIC_PIN_GROUP("pwm5-c-26", x1830_pwm_pwm5_c_26),
> +	INGENIC_PIN_GROUP("pwm6-c-17", x1830_pwm_pwm6_c_17),
> +	INGENIC_PIN_GROUP("pwm6-c-27", x1830_pwm_pwm6_c_27),
> +	INGENIC_PIN_GROUP("pwm7-c-18", x1830_pwm_pwm7_c_18),
> +	INGENIC_PIN_GROUP("pwm7-c-28", x1830_pwm_pwm7_c_28),
> +	INGENIC_PIN_GROUP("mac", x1830_mac),
> +};
> +
> +static const char *x1830_uart0_groups[] =3D { "uart0-data",=20
> "uart0-hwflow", };
> +static const char *x1830_uart1_groups[] =3D { "uart1-data", };
> +static const char *x1830_sfc_groups[] =3D { "sfc", };
> +static const char *x1830_ssi0_groups[] =3D {
> +	"ssi0-dt", "ssi0-dr", "ssi0-clk", "ssi0-gpc", "ssi0-ce0",=20
> "ssi0-ce1",
> +};
> +static const char *x1830_ssi1_groups[] =3D {
> +	"ssi1-dt-c", "ssi1-dt-d",
> +	"ssi1-dr-c", "ssi1-dr-d",
> +	"ssi1-clk-c", "ssi1-clk-d",
> +	"ssi1-gpc-c", "ssi1-gpc-d",
> +	"ssi1-ce0-c", "ssi1-ce0-d",
> +	"ssi1-ce1-c", "ssi1-ce1-d",
> +};
> +static const char *x1830_mmc0_groups[] =3D { "mmc0-1bit", "mmc0-4bit",=20
> };
> +static const char *x1830_mmc1_groups[] =3D { "mmc1-1bit", "mmc1-4bit",=20
> };
> +static const char *x1830_i2c0_groups[] =3D { "i2c0-data", };
> +static const char *x1830_i2c1_groups[] =3D { "i2c1-data", };
> +static const char *x1830_i2c2_groups[] =3D { "i2c2-data", };
> +static const char *x1830_pwm0_groups[] =3D { "pwm0-b", "pwm0-c", };
> +static const char *x1830_pwm1_groups[] =3D { "pwm1-b", "pwm1-c", };
> +static const char *x1830_pwm2_groups[] =3D { "pwm2-c-8", "pwm2-c-13",=20
> };
> +static const char *x1830_pwm3_groups[] =3D { "pwm3-c-9", "pwm3-c-14",=20
> };
> +static const char *x1830_pwm4_groups[] =3D { "pwm4-c-15", "pwm4-c-25",=20
> };
> +static const char *x1830_pwm5_groups[] =3D { "pwm5-c-16", "pwm5-c-26",=20
> };
> +static const char *x1830_pwm6_groups[] =3D { "pwm6-c-17", "pwm6-c-27",=20
> };
> +static const char *x1830_pwm7_groups[] =3D { "pwm7-c-18", "pwm7-c-28",=20
> };
> +static const char *x1830_mac_groups[] =3D { "mac", };
> +
> +static const struct function_desc x1830_functions[] =3D {
> +	{ "uart0", x1830_uart0_groups, ARRAY_SIZE(x1830_uart0_groups), },
> +	{ "uart1", x1830_uart1_groups, ARRAY_SIZE(x1830_uart1_groups), },
> +	{ "sfc", x1830_sfc_groups, ARRAY_SIZE(x1830_sfc_groups), },
> +	{ "ssi0", x1830_ssi0_groups, ARRAY_SIZE(x1830_ssi0_groups), },
> +	{ "ssi1", x1830_ssi1_groups, ARRAY_SIZE(x1830_ssi1_groups), },
> +	{ "mmc0", x1830_mmc0_groups, ARRAY_SIZE(x1830_mmc0_groups), },
> +	{ "mmc1", x1830_mmc1_groups, ARRAY_SIZE(x1830_mmc1_groups), },
> +	{ "i2c0", x1830_i2c0_groups, ARRAY_SIZE(x1830_i2c0_groups), },
> +	{ "i2c1", x1830_i2c1_groups, ARRAY_SIZE(x1830_i2c1_groups), },
> +	{ "i2c2", x1830_i2c2_groups, ARRAY_SIZE(x1830_i2c2_groups), },
> +	{ "pwm0", x1830_pwm0_groups, ARRAY_SIZE(x1830_pwm0_groups), },
> +	{ "pwm1", x1830_pwm1_groups, ARRAY_SIZE(x1830_pwm1_groups), },
> +	{ "pwm2", x1830_pwm2_groups, ARRAY_SIZE(x1830_pwm2_groups), },
> +	{ "pwm3", x1830_pwm3_groups, ARRAY_SIZE(x1830_pwm3_groups), },
> +	{ "pwm4", x1830_pwm4_groups, ARRAY_SIZE(x1830_pwm4_groups), },
> +	{ "pwm5", x1830_pwm5_groups, ARRAY_SIZE(x1830_pwm4_groups), },
> +	{ "pwm6", x1830_pwm6_groups, ARRAY_SIZE(x1830_pwm4_groups), },
> +	{ "pwm7", x1830_pwm7_groups, ARRAY_SIZE(x1830_pwm4_groups), },
> +	{ "mac", x1830_mac_groups, ARRAY_SIZE(x1830_mac_groups), },
> +};
> +
> +static const struct ingenic_chip_info x1830_chip_info =3D {
> +	.num_chips =3D 4,
> +	.groups =3D x1830_groups,
> +	.num_groups =3D ARRAY_SIZE(x1830_groups),
> +	.functions =3D x1830_functions,
> +	.num_functions =3D ARRAY_SIZE(x1830_functions),
> +	.pull_ups =3D x1830_pull_ups,
> +	.pull_downs =3D x1830_pull_downs,
> +};
> +
>  static u32 ingenic_gpio_read_reg(struct ingenic_gpio_chip *jzgc, u8=20
> reg)
>  {
>  	unsigned int val;
> @@ -1422,13 +1646,20 @@ static void=20
> ingenic_gpio_shadow_set_bit(struct ingenic_gpio_chip *jzgc,
>  	else
>  		reg =3D REG_CLEAR(reg);
>=20
> -	regmap_write(jzgc->jzpc->map, X1000_GPIO_PZ_BASE + reg,=20
> BIT(offset));
> +	if (jzgc->jzpc->version >=3D ID_X1830)
> +		regmap_write(jzgc->jzpc->map, X1830_GPIO_PZ_BASE + reg,=20
> BIT(offset));
> +	else
> +		regmap_write(jzgc->jzpc->map, X1000_GPIO_PZ_BASE + reg,=20
> BIT(offset));
>  }
>=20
>  static void ingenic_gpio_shadow_set_bit_load(struct=20
> ingenic_gpio_chip *jzgc)
>  {
> -	regmap_write(jzgc->jzpc->map, X1000_GPIO_PZ_GID2LD,
> -			jzgc->gc.base / PINS_PER_GPIO_CHIP);
> +	unsigned int offt =3D jzgc->gc.base / PINS_PER_GPIO_CHIP;
> +
> +	if (jzgc->jzpc->version >=3D ID_X1830)
> +		regmap_write(jzgc->jzpc->map, X1830_GPIO_PZ_GID2LD, offt);
> +	else
> +		regmap_write(jzgc->jzpc->map, X1000_GPIO_PZ_GID2LD, offt);
>  }
>=20
>  static inline bool ingenic_gpio_get_value(struct ingenic_gpio_chip=20
> *jzgc,
> @@ -1668,25 +1899,36 @@ static inline void ingenic_config_pin(struct=20
> ingenic_pinctrl *jzpc,
>  		unsigned int pin, u8 reg, bool set)
>  {
>  	unsigned int idx =3D pin % PINS_PER_GPIO_CHIP;
> -	unsigned int offt =3D pin / PINS_PER_GPIO_CHIP;
> +	unsigned int offt1 =3D pin / PINS_PER_GPIO_CHIP;
> +	unsigned int offt2 =3D set ? REG_SET(reg) : REG_CLEAR(reg);
>=20
> -	regmap_write(jzpc->map, offt * 0x100 +
> -			(set ? REG_SET(reg) : REG_CLEAR(reg)), BIT(idx));
> +	if (jzpc->version >=3D ID_X1830)
> +		regmap_write(jzpc->map, offt1 * 0x1000 + offt2, BIT(idx));
> +	else
> +		regmap_write(jzpc->map, offt1 * 0x100 + offt2, BIT(idx));

I'd prefer that you add a ingenic_chip_info.reg_offset and use that=20
here, instead of having 0x100 / 0x1000 hardcoded all over the place.=20
This should be a separate commit too.

>  }
>=20
>  static inline void ingenic_shadow_config_pin(struct ingenic_pinctrl=20
> *jzpc,
>  		unsigned int pin, u8 reg, bool set)
>  {
>  	unsigned int idx =3D pin % PINS_PER_GPIO_CHIP;
> +	unsigned int offt =3D set ? REG_SET(reg) : REG_CLEAR(reg);
>=20
> -	regmap_write(jzpc->map, X1000_GPIO_PZ_BASE +
> -			(set ? REG_SET(reg) : REG_CLEAR(reg)), BIT(idx));
> +	if (jzpc->version >=3D ID_X1830)
> +		regmap_write(jzpc->map, X1830_GPIO_PZ_BASE + offt, BIT(idx));
> +	else
> +		regmap_write(jzpc->map, X1000_GPIO_PZ_BASE + offt, BIT(idx));

If you have a ingenic_chip_info.reg_offset, then you can add PZ_BASE()=20
/ PZ_GID2LD() macros that return the right registers, since they are at=20
(nb_chips * reg_offset).

>  }
>=20
>  static inline void ingenic_shadow_config_pin_load(struct=20
> ingenic_pinctrl *jzpc,
>  		unsigned int pin)
>  {
> -	regmap_write(jzpc->map, X1000_GPIO_PZ_GID2LD, pin /=20
> PINS_PER_GPIO_CHIP);
> +	unsigned int offt =3D pin / PINS_PER_GPIO_CHIP;
> +
> +	if (jzpc->version >=3D ID_X1830)
> +		regmap_write(jzpc->map, X1830_GPIO_PZ_GID2LD, offt);
> +	else
> +		regmap_write(jzpc->map, X1000_GPIO_PZ_GID2LD, offt);
>  }
>=20
>  static inline bool ingenic_get_pin_config(struct ingenic_pinctrl=20
> *jzpc,
> @@ -1696,7 +1938,10 @@ static inline bool=20
> ingenic_get_pin_config(struct ingenic_pinctrl *jzpc,
>  	unsigned int offt =3D pin / PINS_PER_GPIO_CHIP;
>  	unsigned int val;
>=20
> -	regmap_read(jzpc->map, offt * 0x100 + reg, &val);
> +	if (jzpc->version >=3D ID_X1830)
> +		regmap_read(jzpc->map, offt * 0x1000 + reg, &val);
> +	else
> +		regmap_read(jzpc->map, offt * 0x100 + reg, &val);
>=20
>  	return val & BIT(idx);
>  }
> @@ -1857,12 +2102,60 @@ static int ingenic_pinconf_get(struct=20
> pinctrl_dev *pctldev,
>  }
>=20
>  static void ingenic_set_bias(struct ingenic_pinctrl *jzpc,
> -		unsigned int pin, bool enabled)
> +		unsigned int pin, unsigned int bias)
>  {
> -	if (jzpc->version >=3D ID_JZ4760)
> -		ingenic_config_pin(jzpc, pin, JZ4760_GPIO_PEN, !enabled);
> -	else
> -		ingenic_config_pin(jzpc, pin, JZ4740_GPIO_PULL_DIS, !enabled);
> +	if (jzpc->version >=3D ID_X1830) {
> +		unsigned int idx =3D pin % PINS_PER_GPIO_CHIP;
> +		unsigned int idxl =3D pin % PINS_PER_GPIO_CHIP * 2;
> +		unsigned int idxh =3D pin % PINS_PER_GPIO_CHIP % 16 * 2;

You only access idxl when (idx < 16), so you could very well use idxh=20
everywhere then.

And no need to % PINS_PER_GPIO_CHIP if you're going to apply a % 16=20
afterwards.

> +		unsigned int offt =3D pin / PINS_PER_GPIO_CHIP;
> +		unsigned int half =3D PINS_PER_GPIO_CHIP / 2;

You already hardcoded a %16 above, you could have done %half instead.

> +
> +		switch (bias) {
> +		case GPIO_PULL_UP:
> +			if (idx < half) {
> +				regmap_write(jzpc->map, offt * 0x1000 +
> +						REG_CLEAR(X1830_GPIO_PEL), BIT(idxl) * 2);
> +				regmap_write(jzpc->map, offt * 0x1000 +
> +						REG_SET(X1830_GPIO_PEL), BIT(idxl));
> +			} else {
> +				regmap_write(jzpc->map, offt * 0x1000 +
> +						REG_CLEAR(X1830_GPIO_PEH), BIT(idxh) * 2);
> +				regmap_write(jzpc->map, offt * 0x1000 +
> +						REG_SET(X1830_GPIO_PEH), BIT(idxh));
> +			}
> +			break;
> +
> +		case GPIO_PULL_DOWN:
> +			if (idx < half) {
> +				regmap_write(jzpc->map, offt * 0x1000 +
> +						REG_CLEAR(X1830_GPIO_PEL), BIT(idxl));
> +				regmap_write(jzpc->map, offt * 0x1000 +
> +						REG_SET(X1830_GPIO_PEL), BIT(idxl) * 2);
> +			} else {
> +				regmap_write(jzpc->map, offt * 0x1000 +
> +						REG_CLEAR(X1830_GPIO_PEH), BIT(idxh));
> +				regmap_write(jzpc->map, offt * 0x1000 +
> +						REG_SET(X1830_GPIO_PEH), BIT(idxh) * 2);
> +			}
> +			break;
> +
> +		case GPIO_PULL_DIS:
> +		default:
> +			if (idx < half)
> +				regmap_write(jzpc->map, offt * 0x1000 +
> +						REG_CLEAR(X1830_GPIO_PEL), BIT(idxl) * 3);
> +			else
> +				regmap_write(jzpc->map, offt * 0x1000 +
> +						REG_CLEAR(X1830_GPIO_PEH), BIT(idxh) * 3);

Please write it as: 3 << idxh. Same for the other ones above. BIT()=20
should be used only when manipulating a 1-bit field.

Also, you repeat three times the same code, while the only difference I=20
see, is the value written in the field. Drop the big switch,=20
unconditionally clear the field's two bits, then write either (1 <<=20
idx) or (2 << idx) if the bias is up/down. That should make the code=20
much cleaner.

Cheers,
-Paul

> +			break;
> +		}
> +
> +	} else if (jzpc->version >=3D ID_JZ4760) {
> +		ingenic_config_pin(jzpc, pin, JZ4760_GPIO_PEN, !bias);
> +	} else {
> +		ingenic_config_pin(jzpc, pin, JZ4740_GPIO_PULL_DIS, !bias);
> +	}
>  }
>=20
>  static int ingenic_pinconf_set(struct pinctrl_dev *pctldev, unsigned=20
> int pin,
> @@ -1889,7 +2182,7 @@ static int ingenic_pinconf_set(struct=20
> pinctrl_dev *pctldev, unsigned int pin,
>  		case PIN_CONFIG_BIAS_DISABLE:
>  			dev_dbg(jzpc->dev, "disable pull-over for pin P%c%u\n",
>  					'A' + offt, idx);
> -			ingenic_set_bias(jzpc, pin, false);
> +			ingenic_set_bias(jzpc, pin, GPIO_PULL_DIS);
>  			break;
>=20
>  		case PIN_CONFIG_BIAS_PULL_UP:
> @@ -1897,7 +2190,7 @@ static int ingenic_pinconf_set(struct=20
> pinctrl_dev *pctldev, unsigned int pin,
>  				return -EINVAL;
>  			dev_dbg(jzpc->dev, "set pull-up for pin P%c%u\n",
>  					'A' + offt, idx);
> -			ingenic_set_bias(jzpc, pin, true);
> +			ingenic_set_bias(jzpc, pin, GPIO_PULL_UP);
>  			break;
>=20
>  		case PIN_CONFIG_BIAS_PULL_DOWN:
> @@ -1905,7 +2198,7 @@ static int ingenic_pinconf_set(struct=20
> pinctrl_dev *pctldev, unsigned int pin,
>  				return -EINVAL;
>  			dev_dbg(jzpc->dev, "set pull-down for pin P%c%u\n",
>  					'A' + offt, idx);
> -			ingenic_set_bias(jzpc, pin, true);
> +			ingenic_set_bias(jzpc, pin, GPIO_PULL_DOWN);
>  			break;
>=20
>  		default:
> @@ -1987,6 +2280,7 @@ static const struct of_device_id=20
> ingenic_pinctrl_of_match[] =3D {
>  	{ .compatible =3D "ingenic,x1000-pinctrl", .data =3D (void *) ID_X1000=20
> },
>  	{ .compatible =3D "ingenic,x1000e-pinctrl", .data =3D (void *)=20
> ID_X1000E },
>  	{ .compatible =3D "ingenic,x1500-pinctrl", .data =3D (void *) ID_X1500=20
> },
> +	{ .compatible =3D "ingenic,x1830-pinctrl", .data =3D (void *) ID_X1830=20
> },
>  	{},
>  };
>=20
> @@ -1996,6 +2290,7 @@ static const struct of_device_id=20
> ingenic_gpio_of_match[] __initconst =3D {
>  	{ .compatible =3D "ingenic,jz4770-gpio", },
>  	{ .compatible =3D "ingenic,jz4780-gpio", },
>  	{ .compatible =3D "ingenic,x1000-gpio", },
> +	{ .compatible =3D "ingenic,x1830-gpio", },
>  	{},
>  };
>=20
> @@ -2018,7 +2313,10 @@ static int __init ingenic_gpio_probe(struct=20
> ingenic_pinctrl *jzpc,
>  		return -ENOMEM;
>=20
>  	jzgc->jzpc =3D jzpc;
> -	jzgc->reg_base =3D bank * 0x100;
> +	if (jzpc->version >=3D ID_X1830)
> +		jzgc->reg_base =3D bank * 0x1000;
> +	else
> +		jzgc->reg_base =3D bank * 0x100;
>=20
>  	jzgc->gc.label =3D devm_kasprintf(dev, GFP_KERNEL, "GPIO%c", 'A' +=20
> bank);
>  	if (!jzgc->gc.label)
> @@ -2111,7 +2409,9 @@ static int __init ingenic_pinctrl_probe(struct=20
> platform_device *pdev)
>  	else
>  		jzpc->version =3D (enum jz_version)id->driver_data;
>=20
> -	if (jzpc->version >=3D ID_X1500)
> +	if (jzpc->version >=3D ID_X1830)
> +		chip_info =3D &x1830_chip_info;
> +	else if (jzpc->version >=3D ID_X1500)
>  		chip_info =3D &x1500_chip_info;
>  	else if (jzpc->version >=3D ID_X1000E)
>  		chip_info =3D &x1000e_chip_info;
> @@ -2208,6 +2508,7 @@ static const struct platform_device_id=20
> ingenic_pinctrl_ids[] =3D {
>  	{ "x1000-pinctrl", ID_X1000 },
>  	{ "x1000e-pinctrl", ID_X1000E },
>  	{ "x1500-pinctrl", ID_X1500 },
> +	{ "x1830-pinctrl", ID_X1830 },
>  	{},
>  };
>=20
> --
> 2.7.4
>=20
>=20

=

