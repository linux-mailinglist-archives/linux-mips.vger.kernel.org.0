Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52B41108EED
	for <lists+linux-mips@lfdr.de>; Mon, 25 Nov 2019 14:31:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727658AbfKYNbe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 25 Nov 2019 08:31:34 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:40084 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725862AbfKYNbd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 25 Nov 2019 08:31:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1574688688; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qcaXFLffBOLTSJv9KUasODuvkiJZEfZHl/rQ2rwN8N0=;
        b=r/UugWLybzvyG/cMVAabJNva1fqaLdFB0c2ZDoCz94NJaxk/sd3alHYK1H1+4VNtsk884t
        Zsxo8Jo9XhZepzJymS9j+mBZe5xt4KM/RJiWmN4DE3AmzAUqqTJBXbfSj0hVVelRLTEGSr
        IZx5HPIsYNxmY4/Bsj/NqUXhs/+fz9o=
Date:   Mon, 25 Nov 2019 14:31:21 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 2/4] pinctrl: Ingenic: Add missing parts for X1000 and
 X1500.
To:     Zhou Yanjie <zhouyanjie@zoho.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, paulburton@kernel.org,
        mark.rutland@arm.com, syq@debian.org
Message-Id: <1574688681.3.0@crapouillou.net>
In-Reply-To: <1574682283-87655-3-git-send-email-zhouyanjie@zoho.com>
References: <1574682283-87655-1-git-send-email-zhouyanjie@zoho.com>
        <1574682283-87655-3-git-send-email-zhouyanjie@zoho.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,


Le lun., nov. 25, 2019 at 19:44, Zhou Yanjie <zhouyanjie@zoho.com> a=20
=E9crit :
> 1.Add pinctrl drivers for the SPI flash controller (SFC) of
>   X1000 and X1500.
> 2.Add pinctrl driver for the synchronous serial interface (SSI)
>   of X1000.
>=20
> Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
> ---
>=20
> Notes:
>     v2:
>     New patch.
>=20
>     v2->v3:
>     Fix typo.
>=20
>     v3->v4:
>     No change.
>=20
>     v4->v5:
>     No change.
>=20
>  drivers/pinctrl/pinctrl-ingenic.c | 64=20
> +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
>=20
> diff --git a/drivers/pinctrl/pinctrl-ingenic.c=20
> b/drivers/pinctrl/pinctrl-ingenic.c
> index 059e39a..1a99715 100644
> --- a/drivers/pinctrl/pinctrl-ingenic.c
> +++ b/drivers/pinctrl/pinctrl-ingenic.c
> @@ -1031,6 +1031,23 @@ static int x1000_uart1_data_d_pins[] =3D { 0x62,=20
> 0x63, };
>  static int x1000_uart1_hwflow_pins[] =3D { 0x64, 0x65, };
>  static int x1000_uart2_data_a_pins[] =3D { 0x02, 0x03, };
>  static int x1000_uart2_data_d_pins[] =3D { 0x65, 0x64, };
> +static int x1000_sfc_pins[] =3D { 0x1d, 0x1c, 0x1e, 0x1f, 0x1a, 0x1b,=20
> };
> +static int x1000_ssi_dt_a_22_pins[] =3D { 0x16, };
> +static int x1000_ssi_dt_a_29_pins[] =3D { 0x1d, };
> +static int x1000_ssi_dt_d_pins[] =3D { 0x62, };
> +static int x1000_ssi_dr_a_23_pins[] =3D { 0x17, };
> +static int x1000_ssi_dr_a_28_pins[] =3D { 0x1c, };
> +static int x1000_ssi_dr_d_pins[] =3D { 0x63, };
> +static int x1000_ssi_clk_a_24_pins[] =3D { 0x18, };
> +static int x1000_ssi_clk_a_26_pins[] =3D { 0x1a, };
> +static int x1000_ssi_clk_d_pins[] =3D { 0x60, };
> +static int x1000_ssi_gpc_a_20_pins[] =3D { 0x14, };
> +static int x1000_ssi_gpc_a_31_pins[] =3D { 0x1f, };
> +static int x1000_ssi_ce0_a_25_pins[] =3D { 0x19, };
> +static int x1000_ssi_ce0_a_27_pins[] =3D { 0x1b, };
> +static int x1000_ssi_ce0_d_pins[] =3D { 0x61, };
> +static int x1000_ssi_ce1_a_21_pins[] =3D { 0x15, };
> +static int x1000_ssi_ce1_a_30_pins[] =3D { 0x1e, };
>  static int x1000_mmc0_1bit_pins[] =3D { 0x18, 0x19, 0x17, };
>  static int x1000_mmc0_4bit_pins[] =3D { 0x16, 0x15, 0x14, };
>  static int x1000_mmc0_8bit_pins[] =3D { 0x13, 0x12, 0x11, 0x10, };
> @@ -1081,6 +1098,23 @@ static int x1000_uart1_data_d_funcs[] =3D { 1,=20
> 1, };
>  static int x1000_uart1_hwflow_funcs[] =3D { 1, 1, };
>  static int x1000_uart2_data_a_funcs[] =3D { 2, 2, };
>  static int x1000_uart2_data_d_funcs[] =3D { 0, 0, };
> +static int x1000_sfc_funcs[] =3D { 1, 1, 1, 1, 1, 1, };
> +static int x1000_ssi_dt_a_22_funcs[] =3D { 2, };
> +static int x1000_ssi_dt_a_29_funcs[] =3D { 2, };
> +static int x1000_ssi_dt_d_funcs[] =3D { 0, };
> +static int x1000_ssi_dr_a_23_funcs[] =3D { 2, };
> +static int x1000_ssi_dr_a_28_funcs[] =3D { 2, };
> +static int x1000_ssi_dr_d_funcs[] =3D { 0, };
> +static int x1000_ssi_clk_a_24_funcs[] =3D { 2, };
> +static int x1000_ssi_clk_a_26_funcs[] =3D { 2, };
> +static int x1000_ssi_clk_d_funcs[] =3D { 0, };
> +static int x1000_ssi_gpc_a_20_funcs[] =3D { 2, };
> +static int x1000_ssi_gpc_a_31_funcs[] =3D { 2, };
> +static int x1000_ssi_ce0_a_25_funcs[] =3D { 2, };
> +static int x1000_ssi_ce0_a_27_funcs[] =3D { 2, };
> +static int x1000_ssi_ce0_d_funcs[] =3D { 0, };
> +static int x1000_ssi_ce1_a_21_funcs[] =3D { 2, };
> +static int x1000_ssi_ce1_a_30_funcs[] =3D { 2, };
>  static int x1000_mmc0_1bit_funcs[] =3D { 1, 1, 1, };
>  static int x1000_mmc0_4bit_funcs[] =3D { 1, 1, 1, };
>  static int x1000_mmc0_8bit_funcs[] =3D { 1, 1, 1, 1, 1, };
> @@ -1119,6 +1153,23 @@ static const struct group_desc x1000_groups[]=20
> =3D {
>  	INGENIC_PIN_GROUP("uart1-hwflow", x1000_uart1_hwflow),
>  	INGENIC_PIN_GROUP("uart2-data-a", x1000_uart2_data_a),
>  	INGENIC_PIN_GROUP("uart2-data-d", x1000_uart2_data_d),
> +	INGENIC_PIN_GROUP("sfc", x1000_sfc),
> +	INGENIC_PIN_GROUP("ssi-dt-a-22", x1000_ssi_dt_a_22),
> +	INGENIC_PIN_GROUP("ssi-dt-a-29", x1000_ssi_dt_a_29),
> +	INGENIC_PIN_GROUP("ssi-dt-d", x1000_ssi_dt_d),
> +	INGENIC_PIN_GROUP("ssi-dr-a-23", x1000_ssi_dr_a_23),
> +	INGENIC_PIN_GROUP("ssi-dr-a-28", x1000_ssi_dr_a_28),
> +	INGENIC_PIN_GROUP("ssi-dr-d", x1000_ssi_dr_d),
> +	INGENIC_PIN_GROUP("ssi-clk-a-24", x1000_ssi_clk_a_24),
> +	INGENIC_PIN_GROUP("ssi-clk-a-26", x1000_ssi_clk_a_26),
> +	INGENIC_PIN_GROUP("ssi-clk-d", x1000_ssi_clk_d),
> +	INGENIC_PIN_GROUP("ssi-gpc-a-20", x1000_ssi_gpc_a_20),
> +	INGENIC_PIN_GROUP("ssi-gpc-a-31", x1000_ssi_gpc_a_31),
> +	INGENIC_PIN_GROUP("ssi-ce0-a-25", x1000_ssi_ce0_a_25),
> +	INGENIC_PIN_GROUP("ssi-ce0-a-27", x1000_ssi_ce0_a_27),
> +	INGENIC_PIN_GROUP("ssi-ce0-d", x1000_ssi_ce0_d),
> +	INGENIC_PIN_GROUP("ssi-ce1-a-21", x1000_ssi_ce1_a_21),
> +	INGENIC_PIN_GROUP("ssi-ce1-a-30", x1000_ssi_ce1_a_30),
>  	INGENIC_PIN_GROUP("mmc0-1bit", x1000_mmc0_1bit),
>  	INGENIC_PIN_GROUP("mmc0-4bit", x1000_mmc0_4bit),
>  	INGENIC_PIN_GROUP("mmc0-8bit", x1000_mmc0_8bit),
> @@ -1152,6 +1203,15 @@ static const char *x1000_uart1_groups[] =3D {
>  	"uart1-data-a", "uart1-data-d", "uart1-hwflow",
>  };
>  static const char *x1000_uart2_groups[] =3D { "uart2-data-a",=20
> "uart2-data-d", };
> +static const char *x1000_sfc_groups[] =3D { "sfc", };
> +static const char *x1000_ssi_groups[] =3D {
> +	"ssi-dt-a-22", "ssi-dt-a-29", "ssi-dt-d",
> +	"ssi-dr-a-23", "ssi-dr-a-28", "ssi-dr-d",
> +	"ssi-clk-a-24", "ssi-clk-a-26", "ssi-clk-d",
> +	"ssi-gpc-a-20", "ssi-gpc-a-31",
> +	"ssi-ce0-a-25", "ssi-ce0-a-27", "ssi-ce0-d",
> +	"ssi-ce1-a-21", "ssi-ce1-a-30", "ssi-ce0-d",

"ssi-ce0-d" is set twice.


> +};
>  static const char *x1000_mmc0_groups[] =3D {
>  	"mmc0-1bit", "mmc0-4bit", "mmc0-8bit",
>  };
> @@ -1182,6 +1242,8 @@ static const struct function_desc=20
> x1000_functions[] =3D {
>  	{ "uart0", x1000_uart0_groups, ARRAY_SIZE(x1000_uart0_groups), },
>  	{ "uart1", x1000_uart1_groups, ARRAY_SIZE(x1000_uart1_groups), },
>  	{ "uart2", x1000_uart2_groups, ARRAY_SIZE(x1000_uart2_groups), },
> +	{ "sfc", x1000_sfc_groups, ARRAY_SIZE(x1000_sfc_groups), },
> +	{ "ssi", x1000_ssi_groups, ARRAY_SIZE(x1000_ssi_groups), },
>  	{ "mmc0", x1000_mmc0_groups, ARRAY_SIZE(x1000_mmc0_groups), },
>  	{ "mmc1", x1000_mmc1_groups, ARRAY_SIZE(x1000_mmc1_groups), },
>  	{ "emc", x1000_emc_groups, ARRAY_SIZE(x1000_emc_groups), },
> @@ -1271,6 +1333,7 @@ static const struct group_desc x1500_groups[] =3D=20
> {
>  	INGENIC_PIN_GROUP("uart1-hwflow", x1500_uart1_hwflow),
>  	INGENIC_PIN_GROUP("uart2-data-a", x1500_uart2_data_a),
>  	INGENIC_PIN_GROUP("uart2-data-d", x1500_uart2_data_d),
> +	INGENIC_PIN_GROUP("sfc", x1000_sfc),
>  	INGENIC_PIN_GROUP("mmc-1bit", x1500_mmc_1bit),
>  	INGENIC_PIN_GROUP("mmc-4bit", x1500_mmc_4bit),
>  	INGENIC_PIN_GROUP("i2c0-data", x1500_i2c0),
> @@ -1307,6 +1370,7 @@ static const struct function_desc=20
> x1500_functions[] =3D {
>  	{ "uart0", x1500_uart0_groups, ARRAY_SIZE(x1500_uart0_groups), },
>  	{ "uart1", x1500_uart1_groups, ARRAY_SIZE(x1500_uart1_groups), },
>  	{ "uart2", x1500_uart2_groups, ARRAY_SIZE(x1500_uart2_groups), },
> +	{ "sfc", x1000_sfc_groups, ARRAY_SIZE(x1000_sfc_groups), },
>  	{ "mmc", x1500_mmc_groups, ARRAY_SIZE(x1500_mmc_groups), },
>  	{ "i2c0", x1500_i2c0_groups, ARRAY_SIZE(x1500_i2c0_groups), },
>  	{ "i2c1", x1500_i2c1_groups, ARRAY_SIZE(x1500_i2c1_groups), },
> --
> 2.7.4
>=20
>=20

=

