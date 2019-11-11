Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06FCBF6C25
	for <lists+linux-mips@lfdr.de>; Mon, 11 Nov 2019 02:16:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726733AbfKKBQd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 10 Nov 2019 20:16:33 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:53900 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726275AbfKKBQd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 10 Nov 2019 20:16:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1573434990; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UWU+5fTJTk/7+C5K9zyPet8lduz1ttBlAR7fHdRsMiE=;
        b=o+HAYIYpoyfQbPmhjZZaSPxyLZJNNqtdkzQuUWjrem9LTFyEssoy6Vi3ZiMJqfJdjSKsM5
        4+iiB5Lkm3SMwPgb1HGji0+Nda/9+Jq8yoT5bgg+zSaZOxy+ELL21NaTeJ9wyDTYpsJuYO
        o8ZS8MX2vMoynRiTmREJ38TfZ1j5hnc=
Date:   Mon, 11 Nov 2019 02:16:23 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 2/2 v3] clk: Ingenic: Add CGU driver for X1000.
To:     Zhou Yanjie <zhouyanjie@zoho.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        mturquette@baylibre.com, paul.burton@mips.com, sboyd@kernel.org,
        robh+dt@kernel.org, syq@debian.org, mark.rutland@arm.com
Message-Id: <1573434983.3.2@crapouillou.net>
In-Reply-To: <1573378102-72380-3-git-send-email-zhouyanjie@zoho.com>
References: <1571421006-12771-1-git-send-email-zhouyanjie@zoho.com>
        <1573378102-72380-1-git-send-email-zhouyanjie@zoho.com>
        <1573378102-72380-3-git-send-email-zhouyanjie@zoho.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,


Le dim., nov. 10, 2019 at 17:28, Zhou Yanjie <zhouyanjie@zoho.com> a=20
=E9crit :
> Add support for the clocks provided by the CGU in the Ingenic X1000
> SoC, making use of the cgu code to do the heavy lifting.
>=20
> Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

> ---
>  drivers/clk/ingenic/Kconfig     |  10 ++
>  drivers/clk/ingenic/Makefile    |   1 +
>  drivers/clk/ingenic/x1000-cgu.c | 274=20
> ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 285 insertions(+)
>  create mode 100644 drivers/clk/ingenic/x1000-cgu.c
>=20
> diff --git a/drivers/clk/ingenic/Kconfig b/drivers/clk/ingenic/Kconfig
> index 1cb4899..fb7b399 100644
> --- a/drivers/clk/ingenic/Kconfig
> +++ b/drivers/clk/ingenic/Kconfig
> @@ -45,6 +45,16 @@ config INGENIC_CGU_JZ4780
>=20
>  	  If building for a JZ4780 SoC, you want to say Y here.
>=20
> +config INGENIC_CGU_X1000
> +	bool "Ingenic X1000 CGU driver"
> +	default MACH_X1000
> +	select INGENIC_CGU_COMMON
> +	help
> +	  Support the clocks provided by the CGU hardware on Ingenic X1000
> +	  and compatible SoCs.
> +
> +	  If building for a X1000 SoC, you want to say Y here.
> +
>  config INGENIC_TCU_CLK
>  	bool "Ingenic JZ47xx TCU clocks driver"
>  	default MACH_INGENIC
> diff --git a/drivers/clk/ingenic/Makefile=20
> b/drivers/clk/ingenic/Makefile
> index 097220b..8b1dad9 100644
> --- a/drivers/clk/ingenic/Makefile
> +++ b/drivers/clk/ingenic/Makefile
> @@ -4,4 +4,5 @@ obj-$(CONFIG_INGENIC_CGU_JZ4740)	+=3D jz4740-cgu.o
>  obj-$(CONFIG_INGENIC_CGU_JZ4725B)	+=3D jz4725b-cgu.o
>  obj-$(CONFIG_INGENIC_CGU_JZ4770)	+=3D jz4770-cgu.o
>  obj-$(CONFIG_INGENIC_CGU_JZ4780)	+=3D jz4780-cgu.o
> +obj-$(CONFIG_INGENIC_CGU_X1000)		+=3D x1000-cgu.o
>  obj-$(CONFIG_INGENIC_TCU_CLK)		+=3D tcu.o
> diff --git a/drivers/clk/ingenic/x1000-cgu.c=20
> b/drivers/clk/ingenic/x1000-cgu.c
> new file mode 100644
> index 00000000..b22d87b
> --- /dev/null
> +++ b/drivers/clk/ingenic/x1000-cgu.c
> @@ -0,0 +1,274 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * X1000 SoC CGU driver
> + * Copyright (c) 2019 Zhou Yanjie <zhouyanjie@zoho.com>
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/delay.h>
> +#include <linux/of.h>
> +#include <dt-bindings/clock/x1000-cgu.h>
> +#include "cgu.h"
> +#include "pm.h"
> +
> +/* CGU register offsets */
> +#define CGU_REG_CPCCR		0x00
> +#define CGU_REG_APLL		0x10
> +#define CGU_REG_MPLL		0x14
> +#define CGU_REG_CLKGR		0x20
> +#define CGU_REG_OPCR		0x24
> +#define CGU_REG_DDRCDR		0x2c
> +#define CGU_REG_MACCDR		0x54
> +#define CGU_REG_I2SCDR		0x60
> +#define CGU_REG_LPCDR		0x64
> +#define CGU_REG_MSC0CDR		0x68
> +#define CGU_REG_I2SCDR1		0x70
> +#define CGU_REG_SSICDR		0x74
> +#define CGU_REG_CIMCDR		0x7c
> +#define CGU_REG_PCMCDR		0x84
> +#define CGU_REG_MSC1CDR		0xa4
> +#define CGU_REG_CMP_INTR	0xb0
> +#define CGU_REG_CMP_INTRE	0xb4
> +#define CGU_REG_DRCG		0xd0
> +#define CGU_REG_CPCSR		0xd4
> +#define CGU_REG_PCMCDR1		0xe0
> +#define CGU_REG_MACPHYC		0xe8
> +
> +/* bits within the OPCR register */
> +#define OPCR_SPENDN0		BIT(7)
> +#define OPCR_SPENDN1		BIT(6)
> +
> +static struct ingenic_cgu *cgu;
> +
> +static const s8 pll_od_encoding[8] =3D {
> +	0x0, 0x1, -1, 0x2, -1, -1, -1, 0x3,
> +};
> +
> +static const struct ingenic_cgu_clk_info x1000_cgu_clocks[] =3D {
> +
> +	/* External clocks */
> +
> +	[X1000_CLK_EXCLK] =3D { "ext", CGU_CLK_EXT },
> +	[X1000_CLK_RTCLK] =3D { "rtc", CGU_CLK_EXT },
> +
> +	/* PLLs */
> +
> +	[X1000_CLK_APLL] =3D {
> +		"apll", CGU_CLK_PLL,
> +		.parents =3D { X1000_CLK_EXCLK, -1, -1, -1 },
> +		.pll =3D {
> +			.reg =3D CGU_REG_APLL,
> +			.m_shift =3D 24,
> +			.m_bits =3D 7,
> +			.m_offset =3D 1,
> +			.n_shift =3D 18,
> +			.n_bits =3D 5,
> +			.n_offset =3D 1,
> +			.od_shift =3D 16,
> +			.od_bits =3D 2,
> +			.od_max =3D 8,
> +			.od_encoding =3D pll_od_encoding,
> +			.bypass_bit =3D 9,
> +			.enable_bit =3D 8,
> +			.stable_bit =3D 10,
> +		},
> +	},
> +
> +	[X1000_CLK_MPLL] =3D {
> +		"mpll", CGU_CLK_PLL,
> +		.parents =3D { X1000_CLK_EXCLK, -1, -1, -1 },
> +		.pll =3D {
> +			.reg =3D CGU_REG_MPLL,
> +			.m_shift =3D 24,
> +			.m_bits =3D 7,
> +			.m_offset =3D 1,
> +			.n_shift =3D 18,
> +			.n_bits =3D 5,
> +			.n_offset =3D 1,
> +			.od_shift =3D 16,
> +			.od_bits =3D 2,
> +			.od_max =3D 8,
> +			.od_encoding =3D pll_od_encoding,
> +			.bypass_bit =3D 6,
> +			.enable_bit =3D 7,
> +			.stable_bit =3D 0,
> +		},
> +	},
> +
> +	/* Muxes & dividers */
> +
> +	[X1000_CLK_SCLKA] =3D {
> +		"sclk_a", CGU_CLK_MUX,
> +		.parents =3D { -1, X1000_CLK_EXCLK, X1000_CLK_APLL, -1 },
> +		.mux =3D { CGU_REG_CPCCR, 30, 2 },
> +	},
> +
> +	[X1000_CLK_CPUMUX] =3D {
> +		"cpu_mux", CGU_CLK_MUX,
> +		.parents =3D { -1, X1000_CLK_SCLKA, X1000_CLK_MPLL, -1 },
> +		.mux =3D { CGU_REG_CPCCR, 28, 2 },
> +	},
> +
> +	[X1000_CLK_CPU] =3D {
> +		"cpu", CGU_CLK_DIV,
> +		.parents =3D { X1000_CLK_CPUMUX, -1, -1, -1 },
> +		.div =3D { CGU_REG_CPCCR, 0, 1, 4, 22, -1, -1 },
> +	},
> +
> +	[X1000_CLK_L2CACHE] =3D {
> +		"l2cache", CGU_CLK_DIV,
> +		.parents =3D { X1000_CLK_CPUMUX, -1, -1, -1 },
> +		.div =3D { CGU_REG_CPCCR, 4, 1, 4, 22, -1, -1 },
> +	},
> +
> +	[X1000_CLK_AHB0] =3D {
> +		"ahb0", CGU_CLK_MUX | CGU_CLK_DIV,
> +		.parents =3D { -1, X1000_CLK_SCLKA, X1000_CLK_MPLL, -1 },
> +		.mux =3D { CGU_REG_CPCCR, 26, 2 },
> +		.div =3D { CGU_REG_CPCCR, 8, 1, 4, 21, -1, -1 },
> +	},
> +
> +	[X1000_CLK_AHB2PMUX] =3D {
> +		"ahb2_apb_mux", CGU_CLK_MUX,
> +		.parents =3D { -1, X1000_CLK_SCLKA, X1000_CLK_MPLL, -1 },
> +		.mux =3D { CGU_REG_CPCCR, 24, 2 },
> +	},
> +
> +	[X1000_CLK_AHB2] =3D {
> +		"ahb2", CGU_CLK_DIV,
> +		.parents =3D { X1000_CLK_AHB2PMUX, -1, -1, -1 },
> +		.div =3D { CGU_REG_CPCCR, 12, 1, 4, 20, -1, -1 },
> +	},
> +
> +	[X1000_CLK_PCLK] =3D {
> +		"pclk", CGU_CLK_DIV,
> +		.parents =3D { X1000_CLK_AHB2PMUX, -1, -1, -1 },
> +		.div =3D { CGU_REG_CPCCR, 16, 1, 4, 20, -1, -1 },
> +	},
> +
> +	[X1000_CLK_DDR] =3D {
> +		"ddr", CGU_CLK_MUX | CGU_CLK_DIV | CGU_CLK_GATE,
> +		.parents =3D { -1, X1000_CLK_SCLKA, X1000_CLK_MPLL, -1 },
> +		.mux =3D { CGU_REG_DDRCDR, 30, 2 },
> +		.div =3D { CGU_REG_DDRCDR, 0, 1, 4, 29, 28, 27 },
> +		.gate =3D { CGU_REG_CLKGR, 31 },
> +	},
> +
> +	[X1000_CLK_MAC] =3D {
> +		"mac", CGU_CLK_MUX | CGU_CLK_DIV | CGU_CLK_GATE,
> +		.parents =3D { X1000_CLK_SCLKA, X1000_CLK_MPLL},
> +		.mux =3D { CGU_REG_MACCDR, 31, 1 },
> +		.div =3D { CGU_REG_MACCDR, 0, 1, 8, 29, 28, 27 },
> +		.gate =3D { CGU_REG_CLKGR, 25 },
> +	},
> +
> +	[X1000_CLK_MSCMUX] =3D {
> +		"msc_mux", CGU_CLK_MUX,
> +		.parents =3D { X1000_CLK_SCLKA, X1000_CLK_MPLL},
> +		.mux =3D { CGU_REG_MSC0CDR, 31, 1 },
> +	},
> +
> +	[X1000_CLK_MSC0] =3D {
> +		"msc0", CGU_CLK_DIV | CGU_CLK_GATE,
> +		.parents =3D { X1000_CLK_MSCMUX, -1, -1, -1 },
> +		.div =3D { CGU_REG_MSC0CDR, 0, 2, 8, 29, 28, 27 },
> +		.gate =3D { CGU_REG_CLKGR, 4 },
> +	},
> +
> +	[X1000_CLK_MSC1] =3D {
> +		"msc1", CGU_CLK_DIV | CGU_CLK_GATE,
> +		.parents =3D { X1000_CLK_MSCMUX, -1, -1, -1 },
> +		.div =3D { CGU_REG_MSC1CDR, 0, 2, 8, 29, 28, 27 },
> +		.gate =3D { CGU_REG_CLKGR, 5 },
> +	},
> +
> +	[X1000_CLK_SSIPLL] =3D {
> +		"ssi_pll", CGU_CLK_MUX | CGU_CLK_DIV,
> +		.parents =3D { X1000_CLK_SCLKA, X1000_CLK_MPLL, -1, -1 },
> +		.mux =3D { CGU_REG_SSICDR, 31, 1 },
> +		.div =3D { CGU_REG_SSICDR, 0, 1, 8, 29, 28, 27 },
> +	},
> +
> +	[X1000_CLK_SSIMUX] =3D {
> +		"ssi_mux", CGU_CLK_MUX,
> +		.parents =3D { X1000_CLK_EXCLK, X1000_CLK_SSIPLL, -1, -1 },
> +		.mux =3D { CGU_REG_SSICDR, 30, 1 },
> +	},
> +
> +	/* Gate-only clocks */
> +
> +	[X1000_CLK_SFC] =3D {
> +		"sfc", CGU_CLK_GATE,
> +		.parents =3D { X1000_CLK_SSIPLL, -1, -1, -1 },
> +		.gate =3D { CGU_REG_CLKGR, 2 },
> +	},
> +
> +	[X1000_CLK_I2C0] =3D {
> +		"i2c0", CGU_CLK_GATE,
> +		.parents =3D { X1000_CLK_PCLK, -1, -1, -1 },
> +		.gate =3D { CGU_REG_CLKGR, 7 },
> +	},
> +
> +	[X1000_CLK_I2C1] =3D {
> +		"i2c1", CGU_CLK_GATE,
> +		.parents =3D { X1000_CLK_PCLK, -1, -1, -1 },
> +		.gate =3D { CGU_REG_CLKGR, 8 },
> +	},
> +
> +	[X1000_CLK_I2C2] =3D {
> +		"i2c2", CGU_CLK_GATE,
> +		.parents =3D { X1000_CLK_PCLK, -1, -1, -1 },
> +		.gate =3D { CGU_REG_CLKGR, 9 },
> +	},
> +
> +	[X1000_CLK_UART0] =3D {
> +		"uart0", CGU_CLK_GATE,
> +		.parents =3D { X1000_CLK_EXCLK, -1, -1, -1 },
> +		.gate =3D { CGU_REG_CLKGR, 14 },
> +	},
> +
> +	[X1000_CLK_UART1] =3D {
> +		"uart1", CGU_CLK_GATE,
> +		.parents =3D { X1000_CLK_EXCLK, -1, -1, -1 },
> +		.gate =3D { CGU_REG_CLKGR, 15 },
> +	},
> +
> +	[X1000_CLK_UART2] =3D {
> +		"uart2", CGU_CLK_GATE,
> +		.parents =3D { X1000_CLK_EXCLK, -1, -1, -1 },
> +		.gate =3D { CGU_REG_CLKGR, 16 },
> +	},
> +
> +	[X1000_CLK_SSI] =3D {
> +		"ssi", CGU_CLK_GATE,
> +		.parents =3D { X1000_CLK_SSIMUX, -1, -1, -1 },
> +		.gate =3D { CGU_REG_CLKGR, 19 },
> +	},
> +
> +	[X1000_CLK_PDMA] =3D {
> +		"pdma", CGU_CLK_GATE,
> +		.parents =3D { X1000_CLK_EXCLK, -1, -1, -1 },
> +		.gate =3D { CGU_REG_CLKGR, 21 },
> +	},
> +};
> +
> +static void __init x1000_cgu_init(struct device_node *np)
> +{
> +	int retval;
> +
> +	cgu =3D ingenic_cgu_new(x1000_cgu_clocks,
> +			      ARRAY_SIZE(x1000_cgu_clocks), np);
> +	if (!cgu) {
> +		pr_err("%s: failed to initialise CGU\n", __func__);
> +		return;
> +	}
> +
> +	retval =3D ingenic_cgu_register_clocks(cgu);
> +	if (retval) {
> +		pr_err("%s: failed to register CGU Clocks\n", __func__);
> +		return;
> +	}
> +
> +	ingenic_cgu_register_syscore_ops(cgu);
> +}
> +CLK_OF_DECLARE(x1000_cgu, "ingenic,x1000-cgu", x1000_cgu_init);
> --
> 2.7.4
>=20
>=20

=

