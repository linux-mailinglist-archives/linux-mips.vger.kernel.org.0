Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F85F395226
	for <lists+linux-mips@lfdr.de>; Sun, 30 May 2021 18:50:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229683AbhE3QwQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 30 May 2021 12:52:16 -0400
Received: from aposti.net ([89.234.176.197]:33476 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230002AbhE3QwB (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 30 May 2021 12:52:01 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        list@opendingux.net,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 6/6] clk: ingenic: Add support for the JZ4760
Date:   Sun, 30 May 2021 17:49:23 +0100
Message-Id: <20210530164923.18134-7-paul@crapouillou.net>
In-Reply-To: <20210530164923.18134-1-paul@crapouillou.net>
References: <20210530164923.18134-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add the CGU code and the compatible string to the TCU driver to support
the JZ4760 SoC.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2: Fix algorithm

 drivers/clk/ingenic/Kconfig            |  10 +
 drivers/clk/ingenic/Makefile           |   1 +
 drivers/clk/ingenic/jz4760-cgu.c       | 428 +++++++++++++++++++++++++
 drivers/clk/ingenic/tcu.c              |   2 +
 include/dt-bindings/clock/jz4760-cgu.h |  54 ++++
 5 files changed, 495 insertions(+)
 create mode 100644 drivers/clk/ingenic/jz4760-cgu.c
 create mode 100644 include/dt-bindings/clock/jz4760-cgu.h

diff --git a/drivers/clk/ingenic/Kconfig b/drivers/clk/ingenic/Kconfig
index 580b0cf69ed5..898f1bc478c9 100644
--- a/drivers/clk/ingenic/Kconfig
+++ b/drivers/clk/ingenic/Kconfig
@@ -25,6 +25,16 @@ config INGENIC_CGU_JZ4725B
 
 	  If building for a JZ4725B SoC, you want to say Y here.
 
+config INGENIC_CGU_JZ4760
+	bool "Ingenic JZ4760 CGU driver"
+	default MACH_JZ4760
+	select INGENIC_CGU_COMMON
+	help
+	  Support the clocks provided by the CGU hardware on Ingenic JZ4760
+	  and compatible SoCs.
+
+	  If building for a JZ4760 SoC, you want to say Y here.
+
 config INGENIC_CGU_JZ4770
 	bool "Ingenic JZ4770 CGU driver"
 	default MACH_JZ4770
diff --git a/drivers/clk/ingenic/Makefile b/drivers/clk/ingenic/Makefile
index aaa4bffe03c6..9edfaf4610b9 100644
--- a/drivers/clk/ingenic/Makefile
+++ b/drivers/clk/ingenic/Makefile
@@ -2,6 +2,7 @@
 obj-$(CONFIG_INGENIC_CGU_COMMON)	+= cgu.o pm.o
 obj-$(CONFIG_INGENIC_CGU_JZ4740)	+= jz4740-cgu.o
 obj-$(CONFIG_INGENIC_CGU_JZ4725B)	+= jz4725b-cgu.o
+obj-$(CONFIG_INGENIC_CGU_JZ4760)	+= jz4760-cgu.o
 obj-$(CONFIG_INGENIC_CGU_JZ4770)	+= jz4770-cgu.o
 obj-$(CONFIG_INGENIC_CGU_JZ4780)	+= jz4780-cgu.o
 obj-$(CONFIG_INGENIC_CGU_X1000)		+= x1000-cgu.o
diff --git a/drivers/clk/ingenic/jz4760-cgu.c b/drivers/clk/ingenic/jz4760-cgu.c
new file mode 100644
index 000000000000..14483797a4db
--- /dev/null
+++ b/drivers/clk/ingenic/jz4760-cgu.c
@@ -0,0 +1,428 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * JZ4760 SoC CGU driver
+ * Copyright 2018, Paul Cercueil <paul@crapouillou.net>
+ */
+
+#include <linux/bitops.h>
+#include <linux/clk-provider.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/of.h>
+
+#include <linux/clk.h>
+
+#include <dt-bindings/clock/jz4760-cgu.h>
+
+#include "cgu.h"
+#include "pm.h"
+
+#define MHZ (1000 * 1000)
+
+/*
+ * CPM registers offset address definition
+ */
+#define CGU_REG_CPCCR		0x00
+#define CGU_REG_LCR		0x04
+#define CGU_REG_CPPCR0		0x10
+#define CGU_REG_CLKGR0		0x20
+#define CGU_REG_OPCR		0x24
+#define CGU_REG_CLKGR1		0x28
+#define CGU_REG_CPPCR1		0x30
+#define CGU_REG_USBPCR		0x3c
+#define CGU_REG_USBCDR		0x50
+#define CGU_REG_I2SCDR		0x60
+#define CGU_REG_LPCDR		0x64
+#define CGU_REG_MSCCDR		0x68
+#define CGU_REG_UHCCDR		0x6c
+#define CGU_REG_SSICDR		0x74
+#define CGU_REG_CIMCDR		0x7c
+#define CGU_REG_GPSCDR		0x80
+#define CGU_REG_PCMCDR		0x84
+#define CGU_REG_GPUCDR		0x88
+
+static const s8 pll_od_encoding[8] = {
+	0x0, 0x1, -1, 0x2, -1, -1, -1, 0x3,
+};
+
+static const u8 jz4760_cgu_cpccr_div_table[] = {
+	1, 2, 3, 4, 6, 8,
+};
+
+static const u8 jz4760_cgu_pll_half_div_table[] = {
+	2, 1,
+};
+
+static void
+jz4760_cgu_calc_m_n_od(const struct ingenic_cgu_pll_info *pll_info,
+		       unsigned long rate, unsigned long parent_rate,
+		       unsigned int *pm, unsigned int *pn, unsigned int *pod)
+{
+	unsigned int m, n, od, m_max = (1 << pll_info->m_bits) - 2;
+
+	/* The frequency after the N divider must be between 1 and 50 MHz. */
+	n = parent_rate / (1 * MHZ);
+
+	/* The N divider must be >= 2. */
+	n = clamp_val(n, 2, 1 << pll_info->n_bits);
+
+	for (;; n >>= 1) {
+		od = (unsigned int)-1;
+
+		do {
+			m = (rate / MHZ) * (1 << ++od) * n / (parent_rate / MHZ);
+		} while ((m > m_max || m & 1) && (od < 4));
+
+		if (od < 4 && m >= 4 && m <= m_max)
+			break;
+	}
+
+	*pm = m;
+	*pn = n;
+	*pod = 1 << od;
+}
+
+static const struct ingenic_cgu_clk_info jz4760_cgu_clocks[] = {
+
+	/* External clocks */
+
+	[JZ4760_CLK_EXT] = { "ext", CGU_CLK_EXT },
+	[JZ4760_CLK_OSC32K] = { "osc32k", CGU_CLK_EXT },
+
+	/* PLLs */
+
+	[JZ4760_CLK_PLL0] = {
+		"pll0", CGU_CLK_PLL,
+		.parents = { JZ4760_CLK_EXT },
+		.pll = {
+			.reg = CGU_REG_CPPCR0,
+			.rate_multiplier = 1,
+			.m_shift = 23,
+			.m_bits = 8,
+			.m_offset = 0,
+			.n_shift = 18,
+			.n_bits = 4,
+			.n_offset = 0,
+			.od_shift = 16,
+			.od_bits = 2,
+			.od_max = 8,
+			.od_encoding = pll_od_encoding,
+			.bypass_reg = CGU_REG_CPPCR0,
+			.bypass_bit = 9,
+			.enable_bit = 8,
+			.stable_bit = 10,
+			.calc_m_n_od = jz4760_cgu_calc_m_n_od,
+		},
+	},
+
+	[JZ4760_CLK_PLL1] = {
+		/* TODO: PLL1 can depend on PLL0 */
+		"pll1", CGU_CLK_PLL,
+		.parents = { JZ4760_CLK_EXT },
+		.pll = {
+			.reg = CGU_REG_CPPCR1,
+			.rate_multiplier = 1,
+			.m_shift = 23,
+			.m_bits = 8,
+			.m_offset = 0,
+			.n_shift = 18,
+			.n_bits = 4,
+			.n_offset = 0,
+			.od_shift = 16,
+			.od_bits = 2,
+			.od_max = 8,
+			.od_encoding = pll_od_encoding,
+			.bypass_bit = -1,
+			.enable_bit = 7,
+			.stable_bit = 6,
+			.calc_m_n_od = jz4760_cgu_calc_m_n_od,
+		},
+	},
+
+	/* Main clocks */
+
+	[JZ4760_CLK_CCLK] = {
+		"cclk", CGU_CLK_DIV,
+		.parents = { JZ4760_CLK_PLL0, },
+		.div = {
+			CGU_REG_CPCCR, 0, 1, 4, 22, -1, -1, 0,
+			jz4760_cgu_cpccr_div_table,
+		},
+	},
+	[JZ4760_CLK_HCLK] = {
+		"hclk", CGU_CLK_DIV,
+		.parents = { JZ4760_CLK_PLL0, },
+		.div = {
+			CGU_REG_CPCCR, 4, 1, 4, 22, -1, -1, 0,
+			jz4760_cgu_cpccr_div_table,
+		},
+	},
+	[JZ4760_CLK_SCLK] = {
+		"sclk", CGU_CLK_DIV,
+		.parents = { JZ4760_CLK_PLL0, },
+		.div = {
+			CGU_REG_CPCCR, 24, 1, 4, 22, -1, -1, 0,
+			jz4760_cgu_cpccr_div_table,
+		},
+	},
+	[JZ4760_CLK_H2CLK] = {
+		"h2clk", CGU_CLK_DIV,
+		.parents = { JZ4760_CLK_PLL0, },
+		.div = {
+			CGU_REG_CPCCR, 16, 1, 4, 22, -1, -1, 0,
+			jz4760_cgu_cpccr_div_table,
+		},
+	},
+	[JZ4760_CLK_MCLK] = {
+		"mclk", CGU_CLK_DIV,
+		.parents = { JZ4760_CLK_PLL0, },
+		.div = {
+			CGU_REG_CPCCR, 12, 1, 4, 22, -1, -1, 0,
+			jz4760_cgu_cpccr_div_table,
+		},
+	},
+	[JZ4760_CLK_PCLK] = {
+		"pclk", CGU_CLK_DIV,
+		.parents = { JZ4760_CLK_PLL0, },
+		.div = {
+			CGU_REG_CPCCR, 8, 1, 4, 22, -1, -1, 0,
+			jz4760_cgu_cpccr_div_table,
+		},
+	},
+
+	/* Divided clocks */
+
+	[JZ4760_CLK_PLL0_HALF] = {
+		"pll0_half", CGU_CLK_DIV,
+		.parents = { JZ4760_CLK_PLL0 },
+		.div = {
+			CGU_REG_CPCCR, 21, 1, 1, 22, -1, -1, 0,
+			jz4760_cgu_pll_half_div_table,
+		},
+	},
+
+	/* Those divided clocks can connect to PLL0 or PLL1 */
+
+	[JZ4760_CLK_UHC] = {
+		"uhc", CGU_CLK_DIV | CGU_CLK_GATE | CGU_CLK_MUX,
+		.parents = { JZ4760_CLK_PLL0_HALF, JZ4760_CLK_PLL1, },
+		.mux = { CGU_REG_UHCCDR, 31, 1 },
+		.div = { CGU_REG_UHCCDR, 0, 1, 4, -1, -1, -1 },
+		.gate = { CGU_REG_CLKGR0, 24 },
+	},
+	[JZ4760_CLK_GPU] = {
+		"gpu", CGU_CLK_DIV | CGU_CLK_GATE | CGU_CLK_MUX,
+		.parents = { JZ4760_CLK_PLL0_HALF, JZ4760_CLK_PLL1, },
+		.mux = { CGU_REG_GPUCDR, 31, 1 },
+		.div = { CGU_REG_GPUCDR, 0, 1, 3, -1, -1, -1 },
+		.gate = { CGU_REG_CLKGR1, 9 },
+	},
+	[JZ4760_CLK_LPCLK_DIV] = {
+		"lpclk_div", CGU_CLK_DIV | CGU_CLK_MUX,
+		.parents = { JZ4760_CLK_PLL0_HALF, JZ4760_CLK_PLL1, },
+		.mux = { CGU_REG_LPCDR, 29, 1 },
+		.div = { CGU_REG_LPCDR, 0, 1, 11, -1, -1, -1 },
+	},
+	[JZ4760_CLK_TVE] = {
+		"tve", CGU_CLK_GATE | CGU_CLK_MUX,
+		.parents = { JZ4760_CLK_LPCLK_DIV, JZ4760_CLK_EXT, },
+		.mux = { CGU_REG_LPCDR, 31, 1 },
+		.gate = { CGU_REG_CLKGR0, 27 },
+	},
+	[JZ4760_CLK_LPCLK] = {
+		"lpclk", CGU_CLK_GATE | CGU_CLK_MUX,
+		.parents = { JZ4760_CLK_LPCLK_DIV, JZ4760_CLK_TVE, },
+		.mux = { CGU_REG_LPCDR, 30, 1 },
+		.gate = { CGU_REG_CLKGR0, 28 },
+	},
+	[JZ4760_CLK_GPS] = {
+		"gps", CGU_CLK_DIV | CGU_CLK_GATE | CGU_CLK_MUX,
+		.parents = { JZ4760_CLK_PLL0_HALF, JZ4760_CLK_PLL1, },
+		.mux = { CGU_REG_GPSCDR, 31, 1 },
+		.div = { CGU_REG_GPSCDR, 0, 1, 4, -1, -1, -1 },
+		.gate = { CGU_REG_CLKGR0, 22 },
+	},
+
+	/* Those divided clocks can connect to EXT, PLL0 or PLL1 */
+
+	[JZ4760_CLK_PCM] = {
+		"pcm", CGU_CLK_DIV | CGU_CLK_GATE | CGU_CLK_MUX,
+		.parents = { JZ4760_CLK_EXT, -1,
+			JZ4760_CLK_PLL0_HALF, JZ4760_CLK_PLL1 },
+		.mux = { CGU_REG_PCMCDR, 30, 2 },
+		.div = { CGU_REG_PCMCDR, 0, 1, 9, -1, -1, -1, BIT(0) },
+		.gate = { CGU_REG_CLKGR1, 8 },
+	},
+	[JZ4760_CLK_I2S] = {
+		"i2s", CGU_CLK_DIV | CGU_CLK_MUX,
+		.parents = { JZ4760_CLK_EXT, -1,
+			JZ4760_CLK_PLL0_HALF, JZ4760_CLK_PLL1 },
+		.mux = { CGU_REG_I2SCDR, 30, 2 },
+		.div = { CGU_REG_I2SCDR, 0, 1, 9, -1, -1, -1, BIT(0) },
+	},
+	[JZ4760_CLK_OTG] = {
+		"usb", CGU_CLK_DIV | CGU_CLK_GATE | CGU_CLK_MUX,
+		.parents = { JZ4760_CLK_EXT, -1,
+			JZ4760_CLK_PLL0_HALF, JZ4760_CLK_PLL1 },
+		.mux = { CGU_REG_USBCDR, 30, 2 },
+		.div = { CGU_REG_USBCDR, 0, 1, 8, -1, -1, -1 },
+		.gate = { CGU_REG_CLKGR0, 2 },
+	},
+
+	/* Those divided clocks can connect to EXT or PLL0 */
+	[JZ4760_CLK_MMC_MUX] = {
+		"mmc_mux", CGU_CLK_MUX | CGU_CLK_DIV,
+		.parents = { JZ4760_CLK_EXT, JZ4760_CLK_PLL0_HALF, },
+		.mux = { CGU_REG_MSCCDR, 31, 1 },
+		.div = { CGU_REG_MSCCDR, 0, 1, 6, -1, -1, -1, BIT(0) },
+	},
+	[JZ4760_CLK_SSI_MUX] = {
+		"ssi_mux", CGU_CLK_DIV | CGU_CLK_MUX,
+		.parents = { JZ4760_CLK_EXT, JZ4760_CLK_PLL0_HALF, },
+		.mux = { CGU_REG_SSICDR, 31, 1 },
+		.div = { CGU_REG_SSICDR, 0, 1, 6, -1, -1, -1, BIT(0) },
+	},
+
+	/* These divided clock can connect to PLL0 only */
+	[JZ4760_CLK_CIM] = {
+		"cim", CGU_CLK_DIV | CGU_CLK_GATE,
+		.parents = { JZ4760_CLK_PLL0_HALF },
+		.div = { CGU_REG_CIMCDR, 0, 1, 8, -1, -1, -1 },
+		.gate = { CGU_REG_CLKGR0, 26 },
+	},
+
+	/* Gate-only clocks */
+
+	[JZ4760_CLK_SSI0] = {
+		"ssi0", CGU_CLK_GATE,
+		.parents = { JZ4760_CLK_SSI_MUX, },
+		.gate = { CGU_REG_CLKGR0, 4 },
+	},
+	[JZ4760_CLK_SSI1] = {
+		"ssi1", CGU_CLK_GATE,
+		.parents = { JZ4760_CLK_SSI_MUX, },
+		.gate = { CGU_REG_CLKGR0, 19 },
+	},
+	[JZ4760_CLK_SSI2] = {
+		"ssi2", CGU_CLK_GATE,
+		.parents = { JZ4760_CLK_SSI_MUX, },
+		.gate = { CGU_REG_CLKGR0, 20 },
+	},
+	[JZ4760_CLK_DMA] = {
+		"dma", CGU_CLK_GATE,
+		.parents = { JZ4760_CLK_H2CLK, },
+		.gate = { CGU_REG_CLKGR0, 21 },
+	},
+	[JZ4760_CLK_I2C0] = {
+		"i2c0", CGU_CLK_GATE,
+		.parents = { JZ4760_CLK_EXT, },
+		.gate = { CGU_REG_CLKGR0, 5 },
+	},
+	[JZ4760_CLK_I2C1] = {
+		"i2c1", CGU_CLK_GATE,
+		.parents = { JZ4760_CLK_EXT, },
+		.gate = { CGU_REG_CLKGR0, 6 },
+	},
+	[JZ4760_CLK_UART0] = {
+		"uart0", CGU_CLK_GATE,
+		.parents = { JZ4760_CLK_EXT, },
+		.gate = { CGU_REG_CLKGR0, 15 },
+	},
+	[JZ4760_CLK_UART1] = {
+		"uart1", CGU_CLK_GATE,
+		.parents = { JZ4760_CLK_EXT, },
+		.gate = { CGU_REG_CLKGR0, 16 },
+	},
+	[JZ4760_CLK_UART2] = {
+		"uart2", CGU_CLK_GATE,
+		.parents = { JZ4760_CLK_EXT, },
+		.gate = { CGU_REG_CLKGR0, 17 },
+	},
+	[JZ4760_CLK_UART3] = {
+		"uart3", CGU_CLK_GATE,
+		.parents = { JZ4760_CLK_EXT, },
+		.gate = { CGU_REG_CLKGR0, 18 },
+	},
+	[JZ4760_CLK_IPU] = {
+		"ipu", CGU_CLK_GATE,
+		.parents = { JZ4760_CLK_HCLK, },
+		.gate = { CGU_REG_CLKGR0, 29 },
+	},
+	[JZ4760_CLK_ADC] = {
+		"adc", CGU_CLK_GATE,
+		.parents = { JZ4760_CLK_EXT, },
+		.gate = { CGU_REG_CLKGR0, 14 },
+	},
+	[JZ4760_CLK_AIC] = {
+		"aic", CGU_CLK_GATE,
+		.parents = { JZ4760_CLK_EXT, },
+		.gate = { CGU_REG_CLKGR0, 8 },
+	},
+	[JZ4760_CLK_VPU] = {
+		"vpu", CGU_CLK_GATE,
+		.parents = { JZ4760_CLK_HCLK, },
+		.gate = { CGU_REG_LCR, 30, false, 150 },
+	},
+	[JZ4760_CLK_MMC0] = {
+		"mmc0", CGU_CLK_GATE,
+		.parents = { JZ4760_CLK_MMC_MUX, },
+		.gate = { CGU_REG_CLKGR0, 3 },
+	},
+	[JZ4760_CLK_MMC1] = {
+		"mmc1", CGU_CLK_GATE,
+		.parents = { JZ4760_CLK_MMC_MUX, },
+		.gate = { CGU_REG_CLKGR0, 11 },
+	},
+	[JZ4760_CLK_MMC2] = {
+		"mmc2", CGU_CLK_GATE,
+		.parents = { JZ4760_CLK_MMC_MUX, },
+		.gate = { CGU_REG_CLKGR0, 12 },
+	},
+	[JZ4760_CLK_UHC_PHY] = {
+		"uhc_phy", CGU_CLK_GATE,
+		.parents = { JZ4760_CLK_UHC, },
+		.gate = { CGU_REG_OPCR, 5 },
+	},
+	[JZ4760_CLK_OTG_PHY] = {
+		"usb_phy", CGU_CLK_GATE,
+		.parents = { JZ4760_CLK_OTG },
+		.gate = { CGU_REG_OPCR, 7, true, 50 },
+	},
+
+	/* Custom clocks */
+	[JZ4760_CLK_EXT512] = {
+		"ext/512", CGU_CLK_FIXDIV,
+		.parents = { JZ4760_CLK_EXT },
+		.fixdiv = { 512 },
+	},
+	[JZ4760_CLK_RTC] = {
+		"rtc", CGU_CLK_MUX,
+		.parents = { JZ4760_CLK_EXT512, JZ4760_CLK_OSC32K, },
+		.mux = { CGU_REG_OPCR, 2, 1},
+	},
+};
+
+static void __init jz4760_cgu_init(struct device_node *np)
+{
+	struct ingenic_cgu *cgu;
+	int retval;
+
+	cgu = ingenic_cgu_new(jz4760_cgu_clocks,
+			      ARRAY_SIZE(jz4760_cgu_clocks), np);
+	if (!cgu) {
+		pr_err("%s: failed to initialise CGU\n", __func__);
+		return;
+	}
+
+	retval = ingenic_cgu_register_clocks(cgu);
+	if (retval)
+		pr_err("%s: failed to register CGU Clocks\n", __func__);
+
+	ingenic_cgu_register_syscore_ops(cgu);
+}
+
+/* We only probe via devicetree, no need for a platform driver */
+CLK_OF_DECLARE_DRIVER(jz4760_cgu, "ingenic,jz4760-cgu", jz4760_cgu_init);
+
+/* JZ4760B has some small differences, but we don't implement them. */
+CLK_OF_DECLARE_DRIVER(jz4760b_cgu, "ingenic,jz4760b-cgu", jz4760_cgu_init);
diff --git a/drivers/clk/ingenic/tcu.c b/drivers/clk/ingenic/tcu.c
index 9382dc3aa27e..77acfbeb4830 100644
--- a/drivers/clk/ingenic/tcu.c
+++ b/drivers/clk/ingenic/tcu.c
@@ -326,6 +326,7 @@ static const struct ingenic_soc_info x1000_soc_info = {
 static const struct of_device_id __maybe_unused ingenic_tcu_of_match[] __initconst = {
 	{ .compatible = "ingenic,jz4740-tcu", .data = &jz4740_soc_info, },
 	{ .compatible = "ingenic,jz4725b-tcu", .data = &jz4725b_soc_info, },
+	{ .compatible = "ingenic,jz4760-tcu", .data = &jz4770_soc_info, },
 	{ .compatible = "ingenic,jz4770-tcu", .data = &jz4770_soc_info, },
 	{ .compatible = "ingenic,x1000-tcu", .data = &x1000_soc_info, },
 	{ /* sentinel */ }
@@ -477,5 +478,6 @@ static void __init ingenic_tcu_init(struct device_node *np)
 
 CLK_OF_DECLARE_DRIVER(jz4740_cgu, "ingenic,jz4740-tcu", ingenic_tcu_init);
 CLK_OF_DECLARE_DRIVER(jz4725b_cgu, "ingenic,jz4725b-tcu", ingenic_tcu_init);
+CLK_OF_DECLARE_DRIVER(jz4760_cgu, "ingenic,jz4760-tcu", ingenic_tcu_init);
 CLK_OF_DECLARE_DRIVER(jz4770_cgu, "ingenic,jz4770-tcu", ingenic_tcu_init);
 CLK_OF_DECLARE_DRIVER(x1000_cgu, "ingenic,x1000-tcu", ingenic_tcu_init);
diff --git a/include/dt-bindings/clock/jz4760-cgu.h b/include/dt-bindings/clock/jz4760-cgu.h
new file mode 100644
index 000000000000..4bb2e19c4743
--- /dev/null
+++ b/include/dt-bindings/clock/jz4760-cgu.h
@@ -0,0 +1,54 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * This header provides clock numbers for the ingenic,jz4760-cgu DT binding.
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_JZ4760_CGU_H__
+#define __DT_BINDINGS_CLOCK_JZ4760_CGU_H__
+
+#define JZ4760_CLK_EXT		0
+#define JZ4760_CLK_OSC32K	1
+#define JZ4760_CLK_PLL0		2
+#define JZ4760_CLK_PLL0_HALF	3
+#define JZ4760_CLK_PLL1		4
+#define JZ4760_CLK_CCLK		5
+#define JZ4760_CLK_HCLK		6
+#define JZ4760_CLK_SCLK		7
+#define JZ4760_CLK_H2CLK	8
+#define JZ4760_CLK_MCLK		9
+#define JZ4760_CLK_PCLK		10
+#define JZ4760_CLK_MMC_MUX	11
+#define JZ4760_CLK_MMC0		12
+#define JZ4760_CLK_MMC1		13
+#define JZ4760_CLK_MMC2		14
+#define JZ4760_CLK_CIM		15
+#define JZ4760_CLK_UHC		16
+#define JZ4760_CLK_GPU		17
+#define JZ4760_CLK_GPS		18
+#define JZ4760_CLK_SSI_MUX	19
+#define JZ4760_CLK_PCM		20
+#define JZ4760_CLK_I2S		21
+#define JZ4760_CLK_OTG		22
+#define JZ4760_CLK_SSI0		23
+#define JZ4760_CLK_SSI1		24
+#define JZ4760_CLK_SSI2		25
+#define JZ4760_CLK_DMA		26
+#define JZ4760_CLK_I2C0		27
+#define JZ4760_CLK_I2C1		28
+#define JZ4760_CLK_UART0	29
+#define JZ4760_CLK_UART1	30
+#define JZ4760_CLK_UART2	31
+#define JZ4760_CLK_UART3	32
+#define JZ4760_CLK_IPU		33
+#define JZ4760_CLK_ADC		34
+#define JZ4760_CLK_AIC		35
+#define JZ4760_CLK_VPU		36
+#define JZ4760_CLK_UHC_PHY	37
+#define JZ4760_CLK_OTG_PHY	38
+#define JZ4760_CLK_EXT512	39
+#define JZ4760_CLK_RTC		40
+#define JZ4760_CLK_LPCLK_DIV	41
+#define JZ4760_CLK_TVE		42
+#define JZ4760_CLK_LPCLK	43
+
+#endif /* __DT_BINDINGS_CLOCK_JZ4760_CGU_H__ */
-- 
2.30.2

