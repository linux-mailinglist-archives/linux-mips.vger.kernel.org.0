Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5000333F0A0
	for <lists+linux-mips@lfdr.de>; Wed, 17 Mar 2021 13:42:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229699AbhCQMmX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Mar 2021 08:42:23 -0400
Received: from out28-122.mail.aliyun.com ([115.124.28.122]:56827 "EHLO
        out28-122.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbhCQMl5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 17 Mar 2021 08:41:57 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436287|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.00896281-0.000255982-0.990781;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047203;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=9;RT=9;SR=0;TI=SMTPD_---.JmMgph4_1615984913;
Received: from 192.168.88.129(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.JmMgph4_1615984913)
          by smtp.aliyun-inc.com(10.147.40.7);
          Wed, 17 Mar 2021 20:41:53 +0800
Subject: Re: [PATCH 6/6] clk: ingenic: Add support for the JZ4760
To:     Paul Cercueil <paul@crapouillou.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     od@zcrc.me, linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
References: <20210307141759.30426-1-paul@crapouillou.net>
 <20210307141759.30426-7-paul@crapouillou.net>
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <dbd5bea3-a693-cbb6-c411-f164f8f0452f@wanyeetech.com>
Date:   Wed, 17 Mar 2021 20:41:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20210307141759.30426-7-paul@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

On 2021/3/7 下午10:17, Paul Cercueil wrote:
> Add the CGU code and the compatible string to the TCU driver to support
> the JZ4760 SoC.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>   drivers/clk/ingenic/Kconfig            |  10 +
>   drivers/clk/ingenic/Makefile           |   1 +
>   drivers/clk/ingenic/jz4760-cgu.c       | 433 +++++++++++++++++++++++++
>   drivers/clk/ingenic/tcu.c              |   2 +
>   include/dt-bindings/clock/jz4760-cgu.h |  54 +++
>   5 files changed, 500 insertions(+)
>   create mode 100644 drivers/clk/ingenic/jz4760-cgu.c
>   create mode 100644 include/dt-bindings/clock/jz4760-cgu.h
>
> diff --git a/drivers/clk/ingenic/Kconfig b/drivers/clk/ingenic/Kconfig
> index 580b0cf69ed5..898f1bc478c9 100644
> --- a/drivers/clk/ingenic/Kconfig
> +++ b/drivers/clk/ingenic/Kconfig
> @@ -25,6 +25,16 @@ config INGENIC_CGU_JZ4725B
>   
>   	  If building for a JZ4725B SoC, you want to say Y here.
>   
> +config INGENIC_CGU_JZ4760
> +	bool "Ingenic JZ4760 CGU driver"
> +	default MACH_JZ4760
> +	select INGENIC_CGU_COMMON
> +	help
> +	  Support the clocks provided by the CGU hardware on Ingenic JZ4760
> +	  and compatible SoCs.
> +
> +	  If building for a JZ4760 SoC, you want to say Y here.
> +
>   config INGENIC_CGU_JZ4770
>   	bool "Ingenic JZ4770 CGU driver"
>   	default MACH_JZ4770
> diff --git a/drivers/clk/ingenic/Makefile b/drivers/clk/ingenic/Makefile
> index aaa4bffe03c6..9edfaf4610b9 100644
> --- a/drivers/clk/ingenic/Makefile
> +++ b/drivers/clk/ingenic/Makefile
> @@ -2,6 +2,7 @@
>   obj-$(CONFIG_INGENIC_CGU_COMMON)	+= cgu.o pm.o
>   obj-$(CONFIG_INGENIC_CGU_JZ4740)	+= jz4740-cgu.o
>   obj-$(CONFIG_INGENIC_CGU_JZ4725B)	+= jz4725b-cgu.o
> +obj-$(CONFIG_INGENIC_CGU_JZ4760)	+= jz4760-cgu.o
>   obj-$(CONFIG_INGENIC_CGU_JZ4770)	+= jz4770-cgu.o
>   obj-$(CONFIG_INGENIC_CGU_JZ4780)	+= jz4780-cgu.o
>   obj-$(CONFIG_INGENIC_CGU_X1000)		+= x1000-cgu.o
> diff --git a/drivers/clk/ingenic/jz4760-cgu.c b/drivers/clk/ingenic/jz4760-cgu.c
> new file mode 100644
> index 000000000000..a45327cba7d1
> --- /dev/null
> +++ b/drivers/clk/ingenic/jz4760-cgu.c
> @@ -0,0 +1,433 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * JZ4760 SoC CGU driver
> + * Copyright 2018, Paul Cercueil <paul@crapouillou.net>
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/clk-provider.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/of.h>
> +
> +#include <linux/clk.h>
> +
> +#include <dt-bindings/clock/jz4760-cgu.h>
> +
> +#include "cgu.h"
> +#include "pm.h"
> +
> +#define MHZ (1000 * 1000)
> +
> +/*
> + * CPM registers offset address definition
> + */
> +#define CGU_REG_CPCCR		0x00
> +#define CGU_REG_LCR		0x04
> +#define CGU_REG_CPPCR0		0x10
> +#define CGU_REG_CLKGR0		0x20
> +#define CGU_REG_OPCR		0x24
> +#define CGU_REG_CLKGR1		0x28
> +#define CGU_REG_CPPCR1		0x30
> +#define CGU_REG_USBPCR		0x3c
> +#define CGU_REG_USBCDR		0x50
> +#define CGU_REG_I2SCDR		0x60
> +#define CGU_REG_LPCDR		0x64
> +#define CGU_REG_MSCCDR		0x68
> +#define CGU_REG_UHCCDR		0x6c
> +#define CGU_REG_SSICDR		0x74
> +#define CGU_REG_CIMCDR		0x7c
> +#define CGU_REG_GPSCDR		0x80
> +#define CGU_REG_PCMCDR		0x84
> +#define CGU_REG_GPUCDR		0x88
> +
> +static const s8 pll_od_encoding[8] = {
> +	0x0, 0x1, -1, 0x2, -1, -1, -1, 0x3,
> +};
> +
> +static const u8 jz4760_cgu_cpccr_div_table[] = {
> +	1, 2, 3, 4, 6, 8,
> +};
> +
> +static const u8 jz4760_cgu_pll_half_div_table[] = {
> +	2, 1,
> +};
> +
> +static void
> +jz4760_cgu_calc_m_n_od(const struct ingenic_cgu_pll_info *pll_info,
> +		       unsigned long rate, unsigned long parent_rate,
> +		       unsigned int *pm, unsigned int *pn, unsigned int *pod)
> +{
> +	unsigned int m, n, od;
> +
> +	/* The output of the PLL must be between 500 and 1500 MHz. */
> +	rate = clamp_val(rate, 500ul * MHZ, 1500ul * MHZ);
> +
> +	/* The frequency after the N divider must be between 1 and 50 MHz. */
> +	n = parent_rate / (1 * MHZ);
> +
> +	/* The N divider must be >= 2. */
> +	n = clamp_val(n, 2, 1 << pll_info->n_bits);
> +
> +	for (;;) {
> +		od = 0;
> +
> +		do {
> +			m = (rate / MHZ) * ++od * n / (parent_rate / MHZ);


Please correct me if I am wrong, according to the PM, when the register 
value of OD is 0, 1, 2, 3, the value corresponding participating PL 
frequency calculation is 1, 2, 4, 8. Therefore, change

m = (rate / MHZ) * ++od * n / (parent_rate / MHZ); to m = (rate / MHZ) * (2 ^ od++) * n / (parent_rate / MHZ); seems to be more appropriate, it can avoid 3, 5, 6, and 7 that should not exist.


> +		} while (m < pll_info->m_offset || m & 1);
> +
> +		if (m <= (1 << pll_info->m_bits) - 2)
> +			break;
> +
> +		n >>= 1;
> +	}
> +
> +	*pm = m;
> +	*pn = n;
> +	*pod = od;


If we change the above formula, we also need to change this to *pod = 2 
^ od;


Thanks and best regards!


> +}
> +
> +static const struct ingenic_cgu_clk_info jz4760_cgu_clocks[] = {
> +
> +	/* External clocks */
> +
> +	[JZ4760_CLK_EXT] = { "ext", CGU_CLK_EXT },
> +	[JZ4760_CLK_OSC32K] = { "osc32k", CGU_CLK_EXT },
> +
> +	/* PLLs */
> +
> +	[JZ4760_CLK_PLL0] = {
> +		"pll0", CGU_CLK_PLL,
> +		.parents = { JZ4760_CLK_EXT },
> +		.pll = {
> +			.reg = CGU_REG_CPPCR0,
> +			.rate_multiplier = 1,
> +			.m_shift = 23,
> +			.m_bits = 8,
> +			.m_offset = 0,
> +			.n_shift = 18,
> +			.n_bits = 4,
> +			.n_offset = 0,
> +			.od_shift = 16,
> +			.od_bits = 2,
> +			.od_max = 8,
> +			.od_encoding = pll_od_encoding,
> +			.bypass_reg = CGU_REG_CPPCR0,
> +			.bypass_bit = 9,
> +			.enable_bit = 8,
> +			.stable_bit = 10,
> +			.calc_m_n_od = jz4760_cgu_calc_m_n_od,
> +		},
> +	},
> +
> +	[JZ4760_CLK_PLL1] = {
> +		/* TODO: PLL1 can depend on PLL0 */
> +		"pll1", CGU_CLK_PLL,
> +		.parents = { JZ4760_CLK_EXT },
> +		.pll = {
> +			.reg = CGU_REG_CPPCR1,
> +			.rate_multiplier = 1,
> +			.m_shift = 23,
> +			.m_bits = 8,
> +			.m_offset = 0,
> +			.n_shift = 18,
> +			.n_bits = 4,
> +			.n_offset = 0,
> +			.od_shift = 16,
> +			.od_bits = 2,
> +			.od_max = 8,
> +			.od_encoding = pll_od_encoding,
> +			.bypass_bit = -1,
> +			.enable_bit = 7,
> +			.stable_bit = 6,
> +			.calc_m_n_od = jz4760_cgu_calc_m_n_od,
> +		},
> +	},
> +
> +	/* Main clocks */
> +
> +	[JZ4760_CLK_CCLK] = {
> +		"cclk", CGU_CLK_DIV,
> +		.parents = { JZ4760_CLK_PLL0, },
> +		.div = {
> +			CGU_REG_CPCCR, 0, 1, 4, 22, -1, -1, 0,
> +			jz4760_cgu_cpccr_div_table,
> +		},
> +	},
> +	[JZ4760_CLK_HCLK] = {
> +		"hclk", CGU_CLK_DIV,
> +		.parents = { JZ4760_CLK_PLL0, },
> +		.div = {
> +			CGU_REG_CPCCR, 4, 1, 4, 22, -1, -1, 0,
> +			jz4760_cgu_cpccr_div_table,
> +		},
> +	},
> +	[JZ4760_CLK_SCLK] = {
> +		"sclk", CGU_CLK_DIV,
> +		.parents = { JZ4760_CLK_PLL0, },
> +		.div = {
> +			CGU_REG_CPCCR, 24, 1, 4, 22, -1, -1, 0,
> +			jz4760_cgu_cpccr_div_table,
> +		},
> +	},
> +	[JZ4760_CLK_H2CLK] = {
> +		"h2clk", CGU_CLK_DIV,
> +		.parents = { JZ4760_CLK_PLL0, },
> +		.div = {
> +			CGU_REG_CPCCR, 16, 1, 4, 22, -1, -1, 0,
> +			jz4760_cgu_cpccr_div_table,
> +		},
> +	},
> +	[JZ4760_CLK_MCLK] = {
> +		"mclk", CGU_CLK_DIV,
> +		.parents = { JZ4760_CLK_PLL0, },
> +		.div = {
> +			CGU_REG_CPCCR, 12, 1, 4, 22, -1, -1, 0,
> +			jz4760_cgu_cpccr_div_table,
> +		},
> +	},
> +	[JZ4760_CLK_PCLK] = {
> +		"pclk", CGU_CLK_DIV,
> +		.parents = { JZ4760_CLK_PLL0, },
> +		.div = {
> +			CGU_REG_CPCCR, 8, 1, 4, 22, -1, -1, 0,
> +			jz4760_cgu_cpccr_div_table,
> +		},
> +	},
> +
> +	/* Divided clocks */
> +
> +	[JZ4760_CLK_PLL0_HALF] = {
> +		"pll0_half", CGU_CLK_DIV,
> +		.parents = { JZ4760_CLK_PLL0 },
> +		.div = {
> +			CGU_REG_CPCCR, 21, 1, 1, 22, -1, -1, 0,
> +			jz4760_cgu_pll_half_div_table,
> +		},
> +	},
> +
> +	/* Those divided clocks can connect to PLL0 or PLL1 */
> +
> +	[JZ4760_CLK_UHC] = {
> +		"uhc", CGU_CLK_DIV | CGU_CLK_GATE | CGU_CLK_MUX,
> +		.parents = { JZ4760_CLK_PLL0_HALF, JZ4760_CLK_PLL1, },
> +		.mux = { CGU_REG_UHCCDR, 31, 1 },
> +		.div = { CGU_REG_UHCCDR, 0, 1, 4, -1, -1, -1 },
> +		.gate = { CGU_REG_CLKGR0, 24 },
> +	},
> +	[JZ4760_CLK_GPU] = {
> +		"gpu", CGU_CLK_DIV | CGU_CLK_GATE | CGU_CLK_MUX,
> +		.parents = { JZ4760_CLK_PLL0_HALF, JZ4760_CLK_PLL1, },
> +		.mux = { CGU_REG_GPUCDR, 31, 1 },
> +		.div = { CGU_REG_GPUCDR, 0, 1, 3, -1, -1, -1 },
> +		.gate = { CGU_REG_CLKGR1, 9 },
> +	},
> +	[JZ4760_CLK_LPCLK_DIV] = {
> +		"lpclk_div", CGU_CLK_DIV | CGU_CLK_MUX,
> +		.parents = { JZ4760_CLK_PLL0_HALF, JZ4760_CLK_PLL1, },
> +		.mux = { CGU_REG_LPCDR, 29, 1 },
> +		.div = { CGU_REG_LPCDR, 0, 1, 11, -1, -1, -1 },
> +	},
> +	[JZ4760_CLK_TVE] = {
> +		"tve", CGU_CLK_GATE | CGU_CLK_MUX,
> +		.parents = { JZ4760_CLK_LPCLK_DIV, JZ4760_CLK_EXT, },
> +		.mux = { CGU_REG_LPCDR, 31, 1 },
> +		.gate = { CGU_REG_CLKGR0, 27 },
> +	},
> +	[JZ4760_CLK_LPCLK] = {
> +		"lpclk", CGU_CLK_GATE | CGU_CLK_MUX,
> +		.parents = { JZ4760_CLK_LPCLK_DIV, JZ4760_CLK_TVE, },
> +		.mux = { CGU_REG_LPCDR, 30, 1 },
> +		.gate = { CGU_REG_CLKGR0, 28 },
> +	},
> +	[JZ4760_CLK_GPS] = {
> +		"gps", CGU_CLK_DIV | CGU_CLK_GATE | CGU_CLK_MUX,
> +		.parents = { JZ4760_CLK_PLL0_HALF, JZ4760_CLK_PLL1, },
> +		.mux = { CGU_REG_GPSCDR, 31, 1 },
> +		.div = { CGU_REG_GPSCDR, 0, 1, 4, -1, -1, -1 },
> +		.gate = { CGU_REG_CLKGR0, 22 },
> +	},
> +
> +	/* Those divided clocks can connect to EXT, PLL0 or PLL1 */
> +
> +	[JZ4760_CLK_PCM] = {
> +		"pcm", CGU_CLK_DIV | CGU_CLK_GATE | CGU_CLK_MUX,
> +		.parents = { JZ4760_CLK_EXT, -1,
> +			JZ4760_CLK_PLL0_HALF, JZ4760_CLK_PLL1 },
> +		.mux = { CGU_REG_PCMCDR, 30, 2 },
> +		.div = { CGU_REG_PCMCDR, 0, 1, 9, -1, -1, -1, BIT(0) },
> +		.gate = { CGU_REG_CLKGR1, 8 },
> +	},
> +	[JZ4760_CLK_I2S] = {
> +		"i2s", CGU_CLK_DIV | CGU_CLK_MUX,
> +		.parents = { JZ4760_CLK_EXT, -1,
> +			JZ4760_CLK_PLL0_HALF, JZ4760_CLK_PLL1 },
> +		.mux = { CGU_REG_I2SCDR, 30, 2 },
> +		.div = { CGU_REG_I2SCDR, 0, 1, 9, -1, -1, -1, BIT(0) },
> +	},
> +	[JZ4760_CLK_OTG] = {
> +		"usb", CGU_CLK_DIV | CGU_CLK_GATE | CGU_CLK_MUX,
> +		.parents = { JZ4760_CLK_EXT, -1,
> +			JZ4760_CLK_PLL0_HALF, JZ4760_CLK_PLL1 },
> +		.mux = { CGU_REG_USBCDR, 30, 2 },
> +		.div = { CGU_REG_USBCDR, 0, 1, 8, -1, -1, -1 },
> +		.gate = { CGU_REG_CLKGR0, 2 },
> +	},
> +
> +	/* Those divided clocks can connect to EXT or PLL0 */
> +	[JZ4760_CLK_MMC_MUX] = {
> +		"mmc_mux", CGU_CLK_MUX | CGU_CLK_DIV,
> +		.parents = { JZ4760_CLK_EXT, JZ4760_CLK_PLL0_HALF, },
> +		.mux = { CGU_REG_MSCCDR, 31, 1 },
> +		.div = { CGU_REG_MSCCDR, 0, 1, 6, -1, -1, -1, BIT(0) },
> +	},
> +	[JZ4760_CLK_SSI_MUX] = {
> +		"ssi_mux", CGU_CLK_DIV | CGU_CLK_MUX,
> +		.parents = { JZ4760_CLK_EXT, JZ4760_CLK_PLL0_HALF, },
> +		.mux = { CGU_REG_SSICDR, 31, 1 },
> +		.div = { CGU_REG_SSICDR, 0, 1, 6, -1, -1, -1, BIT(0) },
> +	},
> +
> +	/* These divided clock can connect to PLL0 only */
> +	[JZ4760_CLK_CIM] = {
> +		"cim", CGU_CLK_DIV | CGU_CLK_GATE,
> +		.parents = { JZ4760_CLK_PLL0_HALF },
> +		.div = { CGU_REG_CIMCDR, 0, 1, 8, -1, -1, -1 },
> +		.gate = { CGU_REG_CLKGR0, 26 },
> +	},
> +
> +	/* Gate-only clocks */
> +
> +	[JZ4760_CLK_SSI0] = {
> +		"ssi0", CGU_CLK_GATE,
> +		.parents = { JZ4760_CLK_SSI_MUX, },
> +		.gate = { CGU_REG_CLKGR0, 4 },
> +	},
> +	[JZ4760_CLK_SSI1] = {
> +		"ssi1", CGU_CLK_GATE,
> +		.parents = { JZ4760_CLK_SSI_MUX, },
> +		.gate = { CGU_REG_CLKGR0, 19 },
> +	},
> +	[JZ4760_CLK_SSI2] = {
> +		"ssi2", CGU_CLK_GATE,
> +		.parents = { JZ4760_CLK_SSI_MUX, },
> +		.gate = { CGU_REG_CLKGR0, 20 },
> +	},
> +	[JZ4760_CLK_DMA] = {
> +		"dma", CGU_CLK_GATE,
> +		.parents = { JZ4760_CLK_H2CLK, },
> +		.gate = { CGU_REG_CLKGR0, 21 },
> +	},
> +	[JZ4760_CLK_I2C0] = {
> +		"i2c0", CGU_CLK_GATE,
> +		.parents = { JZ4760_CLK_EXT, },
> +		.gate = { CGU_REG_CLKGR0, 5 },
> +	},
> +	[JZ4760_CLK_I2C1] = {
> +		"i2c1", CGU_CLK_GATE,
> +		.parents = { JZ4760_CLK_EXT, },
> +		.gate = { CGU_REG_CLKGR0, 6 },
> +	},
> +	[JZ4760_CLK_UART0] = {
> +		"uart0", CGU_CLK_GATE,
> +		.parents = { JZ4760_CLK_EXT, },
> +		.gate = { CGU_REG_CLKGR0, 15 },
> +	},
> +	[JZ4760_CLK_UART1] = {
> +		"uart1", CGU_CLK_GATE,
> +		.parents = { JZ4760_CLK_EXT, },
> +		.gate = { CGU_REG_CLKGR0, 16 },
> +	},
> +	[JZ4760_CLK_UART2] = {
> +		"uart2", CGU_CLK_GATE,
> +		.parents = { JZ4760_CLK_EXT, },
> +		.gate = { CGU_REG_CLKGR0, 17 },
> +	},
> +	[JZ4760_CLK_UART3] = {
> +		"uart3", CGU_CLK_GATE,
> +		.parents = { JZ4760_CLK_EXT, },
> +		.gate = { CGU_REG_CLKGR0, 18 },
> +	},
> +	[JZ4760_CLK_IPU] = {
> +		"ipu", CGU_CLK_GATE,
> +		.parents = { JZ4760_CLK_HCLK, },
> +		.gate = { CGU_REG_CLKGR0, 29 },
> +	},
> +	[JZ4760_CLK_ADC] = {
> +		"adc", CGU_CLK_GATE,
> +		.parents = { JZ4760_CLK_EXT, },
> +		.gate = { CGU_REG_CLKGR0, 14 },
> +	},
> +	[JZ4760_CLK_AIC] = {
> +		"aic", CGU_CLK_GATE,
> +		.parents = { JZ4760_CLK_EXT, },
> +		.gate = { CGU_REG_CLKGR0, 8 },
> +	},
> +	[JZ4760_CLK_VPU] = {
> +		"vpu", CGU_CLK_GATE,
> +		.parents = { JZ4760_CLK_HCLK, },
> +		.gate = { CGU_REG_LCR, 30, false, 150 },
> +	},
> +	[JZ4760_CLK_MMC0] = {
> +		"mmc0", CGU_CLK_GATE,
> +		.parents = { JZ4760_CLK_MMC_MUX, },
> +		.gate = { CGU_REG_CLKGR0, 3 },
> +	},
> +	[JZ4760_CLK_MMC1] = {
> +		"mmc1", CGU_CLK_GATE,
> +		.parents = { JZ4760_CLK_MMC_MUX, },
> +		.gate = { CGU_REG_CLKGR0, 11 },
> +	},
> +	[JZ4760_CLK_MMC2] = {
> +		"mmc2", CGU_CLK_GATE,
> +		.parents = { JZ4760_CLK_MMC_MUX, },
> +		.gate = { CGU_REG_CLKGR0, 12 },
> +	},
> +	[JZ4760_CLK_UHC_PHY] = {
> +		"uhc_phy", CGU_CLK_GATE,
> +		.parents = { JZ4760_CLK_UHC, },
> +		.gate = { CGU_REG_OPCR, 5 },
> +	},
> +	[JZ4760_CLK_OTG_PHY] = {
> +		"usb_phy", CGU_CLK_GATE,
> +		.parents = { JZ4760_CLK_OTG },
> +		.gate = { CGU_REG_OPCR, 7, true, 50 },
> +	},
> +
> +	/* Custom clocks */
> +	[JZ4760_CLK_EXT512] = {
> +		"ext/512", CGU_CLK_FIXDIV,
> +		.parents = { JZ4760_CLK_EXT },
> +		.fixdiv = { 512 },
> +	},
> +	[JZ4760_CLK_RTC] = {
> +		"rtc", CGU_CLK_MUX,
> +		.parents = { JZ4760_CLK_EXT512, JZ4760_CLK_OSC32K, },
> +		.mux = { CGU_REG_OPCR, 2, 1},
> +	},
> +};
> +
> +static void __init jz4760_cgu_init(struct device_node *np)
> +{
> +	struct ingenic_cgu *cgu;
> +	int retval;
> +
> +	cgu = ingenic_cgu_new(jz4760_cgu_clocks,
> +			      ARRAY_SIZE(jz4760_cgu_clocks), np);
> +	if (!cgu) {
> +		pr_err("%s: failed to initialise CGU\n", __func__);
> +		return;
> +	}
> +
> +	retval = ingenic_cgu_register_clocks(cgu);
> +	if (retval)
> +		pr_err("%s: failed to register CGU Clocks\n", __func__);
> +
> +	ingenic_cgu_register_syscore_ops(cgu);
> +}
> +
> +/* We only probe via devicetree, no need for a platform driver */
> +CLK_OF_DECLARE_DRIVER(jz4760_cgu, "ingenic,jz4760-cgu", jz4760_cgu_init);
> +
> +/* JZ4760B has some small differences, but we don't implement them. */
> +CLK_OF_DECLARE_DRIVER(jz4760b_cgu, "ingenic,jz4760b-cgu", jz4760_cgu_init);
> diff --git a/drivers/clk/ingenic/tcu.c b/drivers/clk/ingenic/tcu.c
> index 9382dc3aa27e..77acfbeb4830 100644
> --- a/drivers/clk/ingenic/tcu.c
> +++ b/drivers/clk/ingenic/tcu.c
> @@ -326,6 +326,7 @@ static const struct ingenic_soc_info x1000_soc_info = {
>   static const struct of_device_id __maybe_unused ingenic_tcu_of_match[] __initconst = {
>   	{ .compatible = "ingenic,jz4740-tcu", .data = &jz4740_soc_info, },
>   	{ .compatible = "ingenic,jz4725b-tcu", .data = &jz4725b_soc_info, },
> +	{ .compatible = "ingenic,jz4760-tcu", .data = &jz4770_soc_info, },
>   	{ .compatible = "ingenic,jz4770-tcu", .data = &jz4770_soc_info, },
>   	{ .compatible = "ingenic,x1000-tcu", .data = &x1000_soc_info, },
>   	{ /* sentinel */ }
> @@ -477,5 +478,6 @@ static void __init ingenic_tcu_init(struct device_node *np)
>   
>   CLK_OF_DECLARE_DRIVER(jz4740_cgu, "ingenic,jz4740-tcu", ingenic_tcu_init);
>   CLK_OF_DECLARE_DRIVER(jz4725b_cgu, "ingenic,jz4725b-tcu", ingenic_tcu_init);
> +CLK_OF_DECLARE_DRIVER(jz4760_cgu, "ingenic,jz4760-tcu", ingenic_tcu_init);
>   CLK_OF_DECLARE_DRIVER(jz4770_cgu, "ingenic,jz4770-tcu", ingenic_tcu_init);
>   CLK_OF_DECLARE_DRIVER(x1000_cgu, "ingenic,x1000-tcu", ingenic_tcu_init);
> diff --git a/include/dt-bindings/clock/jz4760-cgu.h b/include/dt-bindings/clock/jz4760-cgu.h
> new file mode 100644
> index 000000000000..4bb2e19c4743
> --- /dev/null
> +++ b/include/dt-bindings/clock/jz4760-cgu.h
> @@ -0,0 +1,54 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * This header provides clock numbers for the ingenic,jz4760-cgu DT binding.
> + */
> +
> +#ifndef __DT_BINDINGS_CLOCK_JZ4760_CGU_H__
> +#define __DT_BINDINGS_CLOCK_JZ4760_CGU_H__
> +
> +#define JZ4760_CLK_EXT		0
> +#define JZ4760_CLK_OSC32K	1
> +#define JZ4760_CLK_PLL0		2
> +#define JZ4760_CLK_PLL0_HALF	3
> +#define JZ4760_CLK_PLL1		4
> +#define JZ4760_CLK_CCLK		5
> +#define JZ4760_CLK_HCLK		6
> +#define JZ4760_CLK_SCLK		7
> +#define JZ4760_CLK_H2CLK	8
> +#define JZ4760_CLK_MCLK		9
> +#define JZ4760_CLK_PCLK		10
> +#define JZ4760_CLK_MMC_MUX	11
> +#define JZ4760_CLK_MMC0		12
> +#define JZ4760_CLK_MMC1		13
> +#define JZ4760_CLK_MMC2		14
> +#define JZ4760_CLK_CIM		15
> +#define JZ4760_CLK_UHC		16
> +#define JZ4760_CLK_GPU		17
> +#define JZ4760_CLK_GPS		18
> +#define JZ4760_CLK_SSI_MUX	19
> +#define JZ4760_CLK_PCM		20
> +#define JZ4760_CLK_I2S		21
> +#define JZ4760_CLK_OTG		22
> +#define JZ4760_CLK_SSI0		23
> +#define JZ4760_CLK_SSI1		24
> +#define JZ4760_CLK_SSI2		25
> +#define JZ4760_CLK_DMA		26
> +#define JZ4760_CLK_I2C0		27
> +#define JZ4760_CLK_I2C1		28
> +#define JZ4760_CLK_UART0	29
> +#define JZ4760_CLK_UART1	30
> +#define JZ4760_CLK_UART2	31
> +#define JZ4760_CLK_UART3	32
> +#define JZ4760_CLK_IPU		33
> +#define JZ4760_CLK_ADC		34
> +#define JZ4760_CLK_AIC		35
> +#define JZ4760_CLK_VPU		36
> +#define JZ4760_CLK_UHC_PHY	37
> +#define JZ4760_CLK_OTG_PHY	38
> +#define JZ4760_CLK_EXT512	39
> +#define JZ4760_CLK_RTC		40
> +#define JZ4760_CLK_LPCLK_DIV	41
> +#define JZ4760_CLK_TVE		42
> +#define JZ4760_CLK_LPCLK	43
> +
> +#endif /* __DT_BINDINGS_CLOCK_JZ4760_CGU_H__ */
