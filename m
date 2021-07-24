Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 487DF3D46D5
	for <lists+linux-mips@lfdr.de>; Sat, 24 Jul 2021 11:36:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235328AbhGXIzC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 24 Jul 2021 04:55:02 -0400
Received: from out28-172.mail.aliyun.com ([115.124.28.172]:55682 "EHLO
        out28-172.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235250AbhGXIzA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 24 Jul 2021 04:55:00 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436282|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0312234-0.000388246-0.968388;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047208;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=14;RT=14;SR=0;TI=SMTPD_---.KprUvTZ_1627119307;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.KprUvTZ_1627119307)
          by smtp.aliyun-inc.com(10.147.40.233);
          Sat, 24 Jul 2021 17:35:30 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org,
        paul@crapouillou.net
Cc:     linux-clk@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sihui.liu@ingenic.com,
        jun.jiang@ingenic.com, sernia.zhou@foxmail.com
Subject: [PATCH v7 11/11] clk: Ingenic: Add CGU driver for X2000.
Date:   Sat, 24 Jul 2021 17:34:46 +0800
Message-Id: <1627119286-125821-12-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1627119286-125821-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1627119286-125821-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add support for the clocks provided by the CGU in the Ingenic X2000
SoC, making use of the cgu code to do the heavy lifting.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---

Notes:
    v5:
    New patch.
    
    v5->v6:
    No change.
    
    v6->v7:
    No change.

 drivers/clk/ingenic/Kconfig     |  10 +
 drivers/clk/ingenic/Makefile    |   1 +
 drivers/clk/ingenic/x2000-cgu.c | 790 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 801 insertions(+)
 create mode 100644 drivers/clk/ingenic/x2000-cgu.c

diff --git a/drivers/clk/ingenic/Kconfig b/drivers/clk/ingenic/Kconfig
index 7fda7bb..f5dd2f2 100644
--- a/drivers/clk/ingenic/Kconfig
+++ b/drivers/clk/ingenic/Kconfig
@@ -85,6 +85,16 @@ config INGENIC_CGU_X1830
 
 	  If building for a X1830 SoC, you want to say Y here.
 
+config INGENIC_CGU_X2000
+	bool "Ingenic X2000 CGU driver"
+	default MACH_X2000
+	select INGENIC_CGU_COMMON
+	help
+	  Support the clocks provided by the CGU hardware on Ingenic X2000
+	  and compatible SoCs.
+
+	  If building for a X2000 SoC, you want to say Y here.
+
 config INGENIC_TCU_CLK
 	bool "Ingenic JZ47xx TCU clocks driver"
 	default MACH_INGENIC
diff --git a/drivers/clk/ingenic/Makefile b/drivers/clk/ingenic/Makefile
index aed8da4..de265ae 100644
--- a/drivers/clk/ingenic/Makefile
+++ b/drivers/clk/ingenic/Makefile
@@ -8,4 +8,5 @@ obj-$(CONFIG_INGENIC_CGU_JZ4775)	+= jz4775-cgu.o
 obj-$(CONFIG_INGENIC_CGU_JZ4780)	+= jz4780-cgu.o
 obj-$(CONFIG_INGENIC_CGU_X1000)		+= x1000-cgu.o
 obj-$(CONFIG_INGENIC_CGU_X1830)		+= x1830-cgu.o
+obj-$(CONFIG_INGENIC_CGU_X2000)		+= x2000-cgu.o
 obj-$(CONFIG_INGENIC_TCU_CLK)		+= tcu.o
diff --git a/drivers/clk/ingenic/x2000-cgu.c b/drivers/clk/ingenic/x2000-cgu.c
new file mode 100644
index 00000000..1e79af1
--- /dev/null
+++ b/drivers/clk/ingenic/x2000-cgu.c
@@ -0,0 +1,790 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * X2000 SoC CGU driver
+ * Copyright (C) 2020 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/of.h>
+
+#include <dt-bindings/clock/x2000-cgu.h>
+
+#include "cgu.h"
+#include "pm.h"
+
+/* CGU register offsets */
+#define CGU_REG_CPCCR			0x00
+#define CGU_REG_LCR				0x04
+#define CGU_REG_CPPCR			0x0c
+#define CGU_REG_CPAPCR			0x10
+#define CGU_REG_CPMPCR			0x14
+#define CGU_REG_CPEPCR			0x18
+#define CGU_REG_CLKGR0			0x20
+#define CGU_REG_OPCR			0x24
+#define CGU_REG_CLKGR1			0x28
+#define CGU_REG_DDRCDR			0x2c
+#define CGU_REG_ISPCDR			0x30
+#define CGU_REG_CPSPR			0x34
+#define CGU_REG_CPSPPR			0x38
+#define CGU_REG_USBPCR			0x3c
+#define CGU_REG_USBRDT			0x40
+#define CGU_REG_USBVBFIL		0x44
+#define CGU_REG_USBPCR1			0x48
+#define CGU_REG_MACPTPCDR		0x4c
+#define CGU_REG_RSACDR			0x50
+#define CGU_REG_MACCDR			0x54
+#define CGU_REG_MAC0TXCDR		0x58
+#define CGU_REG_SSICDR			0x5c
+#define CGU_REG_I2S0CDR			0x60
+#define CGU_REG_LPCDR			0x64
+#define CGU_REG_MSC0CDR			0x68
+#define CGU_REG_PWMCDR			0x6c
+#define CGU_REG_I2S0CDR1		0x70
+#define CGU_REG_SFCCDR			0x74
+#define CGU_REG_CIMCDR			0x78
+#define CGU_REG_I2S1CDR			0x7c
+#define CGU_REG_I2S1CDR1		0x80
+#define CGU_REG_I2S2CDR			0x84
+#define CGU_REG_I2S2CDR1		0x88
+#define CGU_REG_I2S3CDR			0x8c
+#define CGU_REG_PSWC0ST			0x90
+#define CGU_REG_PSWC1ST			0x94
+#define CGU_REG_PSWC2ST			0x98
+#define CGU_REG_PSWC3ST			0x9c
+#define CGU_REG_I2S3CDR1		0xa0
+#define CGU_REG_MSC1CDR			0xa4
+#define CGU_REG_MSC2CDR			0xa8
+#define CGU_REG_AUDIOCR			0xac
+#define CGU_REG_CMP_INTR		0xb0
+#define CGU_REG_CMP_INTRE		0xb4
+#define CGU_REG_CMP_SFTINT		0xbc
+#define CGU_REG_SRBC			0xc4
+#define CGU_REG_SLBC			0xc8
+#define CGU_REG_SLPC			0xcc
+#define CGU_REG_DRCG			0xd0
+#define CGU_REG_CPCSR			0xd4
+#define CGU_REG_MAC1TXCDR		0xdc
+#define CGU_REG_MAC0PHYC		0xe4
+#define CGU_REG_MAC1PHYC		0xe8
+#define CGU_REG_MESTSEL			0xec
+#define CGU_REG_MEMPD0			0xf8
+#define CGU_REG_MEMPD1			0xfc
+
+/* bits within the OPCR register */
+#define OPCR_GATE_USBPHYCLK		BIT(23)
+#define OPCR_SPENDN				BIT(7)
+
+/* bits within the I2SCDR register */
+#define I2SCDR_I2PCS_SHIFT		30
+#define I2SCDR_I2PCS_MASK		(0x1 << I2SCDR_I2PCS_SHIFT)
+#define I2SCDR_I2SDIV_M_SHIFT	20
+#define I2SCDR_I2SDIV_M_MASK	(0x1ff << I2SCDR_I2SDIV_M_SHIFT)
+#define I2SCDR_I2SDIV_N_SHIFT	0
+#define I2SCDR_I2SDIV_N_MASK	(0xfffff << I2SCDR_I2SDIV_N_SHIFT)
+#define I2SCDR_CE_I2S			BIT(29)
+
+/* bits within the CLKGR1 register */
+#define CLKGR1_I2S0				BIT(8)
+#define CLKGR1_I2S1				BIT(9)
+#define CLKGR1_I2S2				BIT(10)
+#define CLKGR1_I2S3				BIT(11)
+
+static struct ingenic_cgu *cgu;
+
+static void x2000_i2s_calc_m_n(const struct ingenic_cgu_pll_info *pll_info,
+		       unsigned long rate, unsigned long parent_rate,
+		       unsigned int *pm, unsigned int *pn, unsigned int *pod)
+{
+	unsigned int delta, m, n;
+	u64 curr_delta, curr_m, curr_n;
+
+	if ((parent_rate % rate == 0) && ((parent_rate / rate) > 1)) {
+		m = 1;
+		n = parent_rate / rate;
+		goto out;
+	}
+
+	delta = rate;
+
+	/*
+	 * The length of M is 9 bits, its value must be between 1 and 511.
+	 * The length of N is 20 bits, its value must be between 2 and 1048575,
+	 * and must not be less than 2 times of the value of M.
+	 */
+	for (curr_m = 511; curr_m >= 1; curr_m--) {
+		curr_n = parent_rate * curr_m;
+		curr_delta = do_div(curr_n, rate);
+
+		if (curr_n < 2 * curr_m || curr_n > 1048575)
+			continue;
+
+		if (curr_delta == 0)
+			break;
+
+		if (curr_delta < delta) {
+			m = curr_m;
+			n = curr_n;
+			delta = curr_delta;
+		}
+	}
+
+out:
+	*pm = m;
+	*pn = n;
+
+	/*
+	 * The I2S PLL does not have OD bits, so set the *pod to 1 to ensure
+	 * that the ingenic_pll_calc() in cgu.c can run properly.
+	 */
+	*pod = 1;
+}
+
+static int x2000_usb_phy_enable(struct clk_hw *hw)
+{
+	void __iomem *reg_opcr	= cgu->base + CGU_REG_OPCR;
+
+	writel((readl(reg_opcr) | OPCR_SPENDN) & ~OPCR_GATE_USBPHYCLK, reg_opcr);
+
+	return 0;
+}
+
+static void x2000_usb_phy_disable(struct clk_hw *hw)
+{
+	void __iomem *reg_opcr	= cgu->base + CGU_REG_OPCR;
+
+	writel((readl(reg_opcr) & ~OPCR_SPENDN) | OPCR_GATE_USBPHYCLK, reg_opcr);
+}
+
+static int x2000_usb_phy_is_enabled(struct clk_hw *hw)
+{
+	void __iomem *reg_opcr	= cgu->base + CGU_REG_OPCR;
+
+	return !!(readl(reg_opcr) & OPCR_SPENDN);
+}
+
+static const struct clk_ops x2000_otg_phy_ops = {
+	.enable		= x2000_usb_phy_enable,
+	.disable	= x2000_usb_phy_disable,
+	.is_enabled	= x2000_usb_phy_is_enabled,
+};
+
+static const s8 pll_od_encoding[64] = {
+	 -1, 0x1,  -1, 0x2,  -1,  -1,  -1, 0x3,
+	 -1,  -1,  -1,  -1,  -1,  -1,  -1, 0x4,
+	 -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
+	 -1,  -1,  -1,  -1,  -1,  -1,  -1, 0x5,
+	 -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
+	 -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
+	 -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
+	 -1,  -1,  -1,  -1,  -1,  -1,  -1, 0x6,
+};
+
+static const struct ingenic_cgu_clk_info x2000_cgu_clocks[] = {
+
+	/* External clocks */
+
+	[X2000_CLK_EXCLK] = { "ext", CGU_CLK_EXT },
+	[X2000_CLK_RTCLK] = { "rtc", CGU_CLK_EXT },
+
+	/* PLLs */
+
+	[X2000_CLK_APLL] = {
+		"apll", CGU_CLK_PLL,
+		.parents = { X2000_CLK_EXCLK, -1, -1, -1 },
+		.pll = {
+			.reg = CGU_REG_CPAPCR,
+			.rate_multiplier = 2,
+			.m_shift = 20,
+			.m_bits = 9,
+			.m_offset = 1,
+			.n_shift = 14,
+			.n_bits = 6,
+			.n_offset = 1,
+			.od_shift = 11,
+			.od_bits = 3,
+			.od_max = 64,
+			.od_encoding = pll_od_encoding,
+			.bypass_reg = CGU_REG_CPPCR,
+			.bypass_bit = 30,
+			.enable_bit = 0,
+			.stable_bit = 3,
+		},
+	},
+
+	[X2000_CLK_MPLL] = {
+		"mpll", CGU_CLK_PLL,
+		.parents = { X2000_CLK_EXCLK, -1, -1, -1 },
+		.pll = {
+			.reg = CGU_REG_CPMPCR,
+			.rate_multiplier = 2,
+			.m_shift = 20,
+			.m_bits = 10,
+			.m_offset = 1,
+			.n_shift = 14,
+			.n_bits = 6,
+			.n_offset = 1,
+			.od_shift = 11,
+			.od_bits = 3,
+			.od_max = 64,
+			.od_encoding = pll_od_encoding,
+			.bypass_reg = CGU_REG_CPPCR,
+			.bypass_bit = 28,
+			.enable_bit = 0,
+			.stable_bit = 3,
+		},
+	},
+
+	[X2000_CLK_EPLL] = {
+		"epll", CGU_CLK_PLL,
+		.parents = { X2000_CLK_EXCLK, -1, -1, -1 },
+		.pll = {
+			.reg = CGU_REG_CPEPCR,
+			.rate_multiplier = 2,
+			.m_shift = 20,
+			.m_bits = 10,
+			.m_offset = 1,
+			.n_shift = 14,
+			.n_bits = 6,
+			.n_offset = 1,
+			.od_shift = 11,
+			.od_bits = 3,
+			.od_max = 64,
+			.od_encoding = pll_od_encoding,
+			.bypass_reg = CGU_REG_CPPCR,
+			.bypass_bit = 26,
+			.enable_bit = 0,
+			.stable_bit = 3,
+		},
+	},
+
+	[X2000_CLK_I2S0] = {
+		"i2s0", CGU_CLK_PLL,
+		.parents = { X2000_CLK_SCLKA, X2000_CLK_EPLL, -1, -1 },
+		.pll = {
+			.reg = CGU_REG_I2S0CDR,
+			.rate_multiplier = 1,
+			.mux_shift = 30,
+			.mux_bits = 1,
+			.m_shift = 20,
+			.m_bits = 9,
+			.m_offset = 0,
+			.n_shift = 0,
+			.n_bits = 20,
+			.n_offset = 0,
+			.bypass_bit = -1,
+			.enable_bit = 29,
+			.stable_bit = -1,
+			.calc_m_n_od = x2000_i2s_calc_m_n,
+		},
+	},
+
+	[X2000_CLK_I2S1] = {
+		"i2s1", CGU_CLK_PLL,
+		.parents = { X2000_CLK_SCLKA, X2000_CLK_EPLL, -1, -1 },
+		.pll = {
+			.reg = CGU_REG_I2S1CDR,
+			.rate_multiplier = 1,
+			.mux_shift = 30,
+			.mux_bits = 1,
+			.m_shift = 20,
+			.m_bits = 9,
+			.m_offset = 0,
+			.n_shift = 0,
+			.n_bits = 20,
+			.n_offset = 0,
+			.bypass_bit = -1,
+			.enable_bit = 29,
+			.stable_bit = -1,
+			.calc_m_n_od = x2000_i2s_calc_m_n,
+		},
+	},
+
+	[X2000_CLK_I2S2] = {
+		"i2s2", CGU_CLK_PLL,
+		.parents = { X2000_CLK_SCLKA, X2000_CLK_EPLL, -1, -1 },
+		.pll = {
+			.reg = CGU_REG_I2S2CDR,
+			.rate_multiplier = 1,
+			.mux_shift = 30,
+			.mux_bits = 1,
+			.m_shift = 20,
+			.m_bits = 9,
+			.m_offset = 0,
+			.n_shift = 0,
+			.n_bits = 20,
+			.n_offset = 0,
+			.bypass_bit = -1,
+			.enable_bit = 29,
+			.stable_bit = -1,
+			.calc_m_n_od = x2000_i2s_calc_m_n,
+		},
+	},
+
+	[X2000_CLK_I2S3] = {
+		"i2s3", CGU_CLK_PLL,
+		.parents = { X2000_CLK_SCLKA, X2000_CLK_EPLL, -1, -1 },
+		.pll = {
+			.reg = CGU_REG_I2S3CDR,
+			.rate_multiplier = 1,
+			.mux_shift = 30,
+			.mux_bits = 1,
+			.m_shift = 20,
+			.m_bits = 9,
+			.m_offset = 0,
+			.n_shift = 0,
+			.n_bits = 20,
+			.n_offset = 0,
+			.bypass_bit = -1,
+			.enable_bit = 29,
+			.stable_bit = -1,
+			.calc_m_n_od = x2000_i2s_calc_m_n,
+		},
+	},
+
+	/* Custom (SoC-specific) OTG PHY */
+
+	[X2000_CLK_OTGPHY] = {
+		"otg_phy", CGU_CLK_CUSTOM,
+		.parents = { X2000_CLK_EXCLK, -1, -1, -1 },
+		.custom = { &x2000_otg_phy_ops },
+	},
+
+	/* Muxes & dividers */
+
+	[X2000_CLK_SCLKA] = {
+		"sclk_a", CGU_CLK_MUX,
+		.parents = { -1, X2000_CLK_EXCLK, X2000_CLK_APLL, -1 },
+		.mux = { CGU_REG_CPCCR, 30, 2 },
+	},
+
+	[X2000_CLK_CPUMUX] = {
+		"cpu_mux", CGU_CLK_MUX,
+		.parents = { -1, X2000_CLK_SCLKA, X2000_CLK_MPLL, -1 },
+		.mux = { CGU_REG_CPCCR, 28, 2 },
+	},
+
+	[X2000_CLK_CPU] = {
+		"cpu", CGU_CLK_DIV,
+		.parents = { X2000_CLK_CPUMUX },
+		.div = { CGU_REG_CPCCR, 0, 1, 4, 22, -1, -1 },
+	},
+
+	[X2000_CLK_L2CACHE] = {
+		"l2cache", CGU_CLK_DIV,
+		.parents = { X2000_CLK_CPUMUX },
+		.div = { CGU_REG_CPCCR, 4, 1, 4, 22, -1, -1 },
+	},
+
+	[X2000_CLK_AHB0] = {
+		"ahb0", CGU_CLK_MUX | CGU_CLK_DIV | CGU_CLK_GATE,
+		.parents = { -1, X2000_CLK_SCLKA, X2000_CLK_MPLL, -1 },
+		.mux = { CGU_REG_CPCCR, 26, 2 },
+		.div = { CGU_REG_CPCCR, 8, 1, 4, 21, -1, -1 },
+		.gate = { CGU_REG_CLKGR0, 29 },
+	},
+
+	[X2000_CLK_AHB2PMUX] = {
+		"ahb2_apb_mux", CGU_CLK_MUX,
+		.parents = { -1, X2000_CLK_SCLKA, X2000_CLK_MPLL, -1 },
+		.mux = { CGU_REG_CPCCR, 24, 2 },
+	},
+
+	[X2000_CLK_AHB2] = {
+		"ahb2", CGU_CLK_DIV,
+		.parents = { X2000_CLK_AHB2PMUX },
+		.div = { CGU_REG_CPCCR, 12, 1, 4, 20, -1, -1 },
+	},
+
+	[X2000_CLK_PCLK] = {
+		"pclk", CGU_CLK_DIV | CGU_CLK_GATE,
+		.parents = { X2000_CLK_AHB2PMUX },
+		.div = { CGU_REG_CPCCR, 16, 1, 4, 20, -1, -1 },
+		.gate = { CGU_REG_CLKGR0, 28 },
+	},
+
+	[X2000_CLK_DDR] = {
+		"ddr", CGU_CLK_MUX | CGU_CLK_DIV | CGU_CLK_GATE,
+		.parents = { -1, X2000_CLK_SCLKA, X2000_CLK_MPLL, -1 },
+		.mux = { CGU_REG_DDRCDR, 30, 2 },
+		.div = { CGU_REG_DDRCDR, 0, 1, 4, 29, 28, 27 },
+		.gate = { CGU_REG_CLKGR0, 31 },
+	},
+
+	[X2000_CLK_ISP] = {
+		"isp", CGU_CLK_MUX | CGU_CLK_DIV,
+		.parents = { X2000_CLK_SCLKA, X2000_CLK_MPLL, X2000_CLK_EPLL, -1 },
+		.mux = { CGU_REG_ISPCDR, 30, 2 },
+		.div = { CGU_REG_ISPCDR, 0, 1, 4, 29, 28, 27 },
+	},
+
+	[X2000_CLK_MACPTP] = {
+		"mac_ptp", CGU_CLK_MUX | CGU_CLK_DIV,
+		.parents = { X2000_CLK_SCLKA, X2000_CLK_MPLL, X2000_CLK_EPLL, -1 },
+		.mux = { CGU_REG_MACPTPCDR, 30, 2 },
+		.div = { CGU_REG_MACPTPCDR, 0, 1, 8, 29, 28, 27 },
+	},
+
+	[X2000_CLK_MACPHY] = {
+		"mac_phy", CGU_CLK_MUX | CGU_CLK_DIV,
+		.parents = { X2000_CLK_SCLKA, X2000_CLK_MPLL, X2000_CLK_EPLL, -1 },
+		.mux = { CGU_REG_MACCDR, 30, 2 },
+		.div = { CGU_REG_MACCDR, 0, 1, 8, 29, 28, 27 },
+	},
+
+	[X2000_CLK_MAC0TX] = {
+		"mac0_tx", CGU_CLK_MUX | CGU_CLK_DIV,
+		.parents = { X2000_CLK_SCLKA, X2000_CLK_MPLL, X2000_CLK_EPLL, -1 },
+		.mux = { CGU_REG_MAC0TXCDR, 30, 2 },
+		.div = { CGU_REG_MAC0TXCDR, 0, 1, 8, 29, 28, 27 },
+	},
+
+	[X2000_CLK_MAC1TX] = {
+		"mac1_tx", CGU_CLK_MUX | CGU_CLK_DIV,
+		.parents = { X2000_CLK_SCLKA, X2000_CLK_MPLL, X2000_CLK_EPLL, -1 },
+		.mux = { CGU_REG_MAC1TXCDR, 30, 2 },
+		.div = { CGU_REG_MAC1TXCDR, 0, 1, 8, 29, 28, 27 },
+	},
+
+	[X2000_CLK_RSA] = {
+		"rsa", CGU_CLK_MUX | CGU_CLK_DIV | CGU_CLK_GATE,
+		.parents = { X2000_CLK_SCLKA, X2000_CLK_MPLL, X2000_CLK_EXCLK, -1 },
+		.mux = { CGU_REG_LPCDR, 30, 2 },
+		.div = { CGU_REG_LPCDR, 0, 1, 4, 29, 28, 27 },
+		.gate = { CGU_REG_CLKGR0, 25 },
+	},
+
+	[X2000_CLK_SSIPLL] = {
+		"ssi_pll", CGU_CLK_MUX | CGU_CLK_DIV,
+		.parents = { X2000_CLK_SCLKA, X2000_CLK_MPLL, X2000_CLK_EPLL, -1 },
+		.mux = { CGU_REG_SSICDR, 30, 2 },
+		.div = { CGU_REG_SSICDR, 0, 1, 8, 29, 28, 27 },
+	},
+
+	[X2000_CLK_LCD] = {
+		"lcd", CGU_CLK_MUX | CGU_CLK_DIV | CGU_CLK_GATE,
+		.parents = { X2000_CLK_SCLKA, X2000_CLK_MPLL, X2000_CLK_EXCLK, -1 },
+		.mux = { CGU_REG_LPCDR, 30, 2 },
+		.div = { CGU_REG_LPCDR, 0, 1, 8, 29, 28, 27 },
+		.gate = { CGU_REG_CLKGR0, 23 },
+	},
+
+	[X2000_CLK_MSC_EXCLK] = {
+		"msc_exclk", CGU_CLK_GATE,
+		.parents = { X2000_CLK_EXCLK },
+		.gate = { CGU_REG_MSC0CDR, 21, true },
+	},
+
+	[X2000_CLK_MSC0] = {
+		"msc0", CGU_CLK_MUX | CGU_CLK_DIV | CGU_CLK_GATE,
+		.parents = { X2000_CLK_SCLKA, X2000_CLK_MPLL, X2000_CLK_MSC_EXCLK, -1 },
+		.mux = { CGU_REG_MSC0CDR, 30, 2 },
+		.div = { CGU_REG_MSC0CDR, 0, 2, 8, 29, 28, 27 },
+		.gate = { CGU_REG_CLKGR0, 4 },
+	},
+
+	[X2000_CLK_MSC1] = {
+		"msc1", CGU_CLK_MUX | CGU_CLK_DIV | CGU_CLK_GATE,
+		.parents = { X2000_CLK_SCLKA, X2000_CLK_MPLL, X2000_CLK_MSC_EXCLK, -1 },
+		.mux = { CGU_REG_MSC1CDR, 30, 2 },
+		.div = { CGU_REG_MSC1CDR, 0, 2, 8, 29, 28, 27 },
+		.gate = { CGU_REG_CLKGR0, 5 },
+	},
+
+	[X2000_CLK_MSC2] = {
+		"msc2", CGU_CLK_MUX | CGU_CLK_DIV | CGU_CLK_GATE,
+		.parents = { X2000_CLK_SCLKA, X2000_CLK_MPLL, X2000_CLK_MSC_EXCLK, -1 },
+		.mux = { CGU_REG_MSC2CDR, 30, 2 },
+		.div = { CGU_REG_MSC2CDR, 0, 2, 8, 29, 28, 27 },
+		.gate = { CGU_REG_CLKGR1, 25 },
+	},
+
+	[X2000_CLK_PWM] = {
+		"pwm", CGU_CLK_MUX | CGU_CLK_DIV | CGU_CLK_GATE,
+		.parents = { X2000_CLK_SCLKA, X2000_CLK_MPLL, X2000_CLK_EPLL, -1 },
+		.mux = { CGU_REG_PWMCDR, 30, 2 },
+		.div = { CGU_REG_PWMCDR, 0, 1, 4, 29, 28, 27 },
+		.gate = { CGU_REG_CLKGR1, 5 },
+	},
+
+	[X2000_CLK_SFC] = {
+		"sfc", CGU_CLK_MUX | CGU_CLK_DIV | CGU_CLK_GATE,
+		.parents = { X2000_CLK_SCLKA, X2000_CLK_MPLL, X2000_CLK_EPLL, -1 },
+		.mux = { CGU_REG_SFCCDR, 30, 2 },
+		.div = { CGU_REG_SFCCDR, 0, 1, 8, 29, 28, 27 },
+		.gate = { CGU_REG_CLKGR0, 2 },
+	},
+
+	[X2000_CLK_CIM] = {
+		"cim", CGU_CLK_MUX | CGU_CLK_DIV | CGU_CLK_GATE,
+		.parents = { X2000_CLK_SCLKA, X2000_CLK_MPLL, X2000_CLK_EPLL, -1 },
+		.mux = { CGU_REG_CIMCDR, 30, 2 },
+		.div = { CGU_REG_CIMCDR, 0, 1, 8, 29, 28, 27 },
+		.gate = { CGU_REG_CLKGR0, 22 },
+	},
+
+	[X2000_CLK_DMIC_EXCLK] = {
+		"dmic_exclk", CGU_CLK_GATE,
+		.parents = { X2000_CLK_EXCLK },
+		.gate = { CGU_REG_AUDIOCR, 31 },
+	},
+
+	[X2000_CLK_DMIC] = {
+		"dmic", CGU_CLK_MUX | CGU_CLK_GATE,
+		.parents = { X2000_CLK_DMIC_EXCLK, X2000_CLK_I2S3 },
+		.mux = { CGU_REG_AUDIOCR, 0, 1},
+		.gate = { CGU_REG_CLKGR1, 13 },
+	},
+
+	[X2000_CLK_EXCLK_DIV512] = {
+		"exclk_div512", CGU_CLK_FIXDIV,
+		.parents = { X2000_CLK_EXCLK },
+		.fixdiv = { 512 },
+	},
+
+	[X2000_CLK_RTC] = {
+		"rtc_ercs", CGU_CLK_MUX | CGU_CLK_GATE,
+		.parents = { X2000_CLK_EXCLK_DIV512, X2000_CLK_RTCLK },
+		.mux = { CGU_REG_OPCR, 2, 1},
+		.gate = { CGU_REG_CLKGR0, 27 },
+	},
+
+	/* Gate-only clocks */
+
+	[X2000_CLK_EMC] = {
+		"emc", CGU_CLK_GATE,
+		.parents = { X2000_CLK_AHB2 },
+		.gate = { CGU_REG_CLKGR0, 0 },
+	},
+
+	[X2000_CLK_EFUSE] = {
+		"efuse", CGU_CLK_GATE,
+		.parents = { X2000_CLK_AHB2 },
+		.gate = { CGU_REG_CLKGR0, 1 },
+	},
+
+	[X2000_CLK_OTG] = {
+		"otg", CGU_CLK_GATE,
+		.parents = { X2000_CLK_EXCLK },
+		.gate = { CGU_REG_CLKGR0, 3 },
+	},
+
+	[X2000_CLK_SCC] = {
+		"scc", CGU_CLK_GATE,
+		.parents = { X2000_CLK_EXCLK },
+		.gate = { CGU_REG_CLKGR0, 6 },
+	},
+
+	[X2000_CLK_I2C0] = {
+		"i2c0", CGU_CLK_GATE,
+		.parents = { X2000_CLK_PCLK },
+		.gate = { CGU_REG_CLKGR0, 7 },
+	},
+
+	[X2000_CLK_I2C1] = {
+		"i2c1", CGU_CLK_GATE,
+		.parents = { X2000_CLK_PCLK },
+		.gate = { CGU_REG_CLKGR0, 8 },
+	},
+
+	[X2000_CLK_I2C2] = {
+		"i2c2", CGU_CLK_GATE,
+		.parents = { X2000_CLK_PCLK },
+		.gate = { CGU_REG_CLKGR0, 9 },
+	},
+
+	[X2000_CLK_I2C3] = {
+		"i2c3", CGU_CLK_GATE,
+		.parents = { X2000_CLK_PCLK },
+		.gate = { CGU_REG_CLKGR0, 10 },
+	},
+
+	[X2000_CLK_SADC] = {
+		"sadc", CGU_CLK_GATE,
+		.parents = { X2000_CLK_EXCLK },
+		.gate = { CGU_REG_CLKGR0, 13 },
+	},
+
+	[X2000_CLK_UART0] = {
+		"uart0", CGU_CLK_GATE,
+		.parents = { X2000_CLK_EXCLK },
+		.gate = { CGU_REG_CLKGR0, 14 },
+	},
+
+	[X2000_CLK_UART1] = {
+		"uart1", CGU_CLK_GATE,
+		.parents = { X2000_CLK_EXCLK },
+		.gate = { CGU_REG_CLKGR0, 15 },
+	},
+
+	[X2000_CLK_UART2] = {
+		"uart2", CGU_CLK_GATE,
+		.parents = { X2000_CLK_EXCLK },
+		.gate = { CGU_REG_CLKGR0, 16 },
+	},
+
+	[X2000_CLK_DTRNG] = {
+		"dtrng", CGU_CLK_GATE,
+		.parents = { X2000_CLK_PCLK },
+		.gate = { CGU_REG_CLKGR0, 17 },
+	},
+
+	[X2000_CLK_TCU] = {
+		"tcu", CGU_CLK_GATE,
+		.parents = { X2000_CLK_EXCLK },
+		.gate = { CGU_REG_CLKGR0, 18 },
+	},
+
+	[X2000_CLK_SSI0] = {
+		"ssi0", CGU_CLK_GATE,
+		.parents = { X2000_CLK_SSIPLL },
+		.gate = { CGU_REG_CLKGR0, 19 },
+	},
+
+	[X2000_CLK_OST] = {
+		"ost", CGU_CLK_GATE,
+		.parents = { X2000_CLK_EXCLK },
+		.gate = { CGU_REG_CLKGR0, 20 },
+	},
+
+	[X2000_CLK_PDMA] = {
+		"pdma", CGU_CLK_GATE,
+		.parents = { X2000_CLK_EXCLK },
+		.gate = { CGU_REG_CLKGR0, 21 },
+	},
+
+	[X2000_CLK_SSI1] = {
+		"ssi1", CGU_CLK_GATE,
+		.parents = { X2000_CLK_SSIPLL },
+		.gate = { CGU_REG_CLKGR0, 26 },
+	},
+
+	[X2000_CLK_I2C4] = {
+		"i2c4", CGU_CLK_GATE,
+		.parents = { X2000_CLK_PCLK },
+		.gate = { CGU_REG_CLKGR1, 0 },
+	},
+
+	[X2000_CLK_I2C5] = {
+		"i2c5", CGU_CLK_GATE,
+		.parents = { X2000_CLK_PCLK },
+		.gate = { CGU_REG_CLKGR1, 1 },
+	},
+
+	[X2000_CLK_ISP0] = {
+		"isp0", CGU_CLK_GATE,
+		.parents = { X2000_CLK_ISP },
+		.gate = { CGU_REG_CLKGR1, 2 },
+	},
+
+	[X2000_CLK_ISP1] = {
+		"isp1", CGU_CLK_GATE,
+		.parents = { X2000_CLK_ISP },
+		.gate = { CGU_REG_CLKGR1, 3 },
+	},
+
+	[X2000_CLK_HASH] = {
+		"hash", CGU_CLK_GATE,
+		.parents = { X2000_CLK_AHB2 },
+		.gate = { CGU_REG_CLKGR1, 6 },
+	},
+
+	[X2000_CLK_UART3] = {
+		"uart3", CGU_CLK_GATE,
+		.parents = { X2000_CLK_EXCLK },
+		.gate = { CGU_REG_CLKGR1, 16 },
+	},
+
+	[X2000_CLK_UART4] = {
+		"uart4", CGU_CLK_GATE,
+		.parents = { X2000_CLK_EXCLK },
+		.gate = { CGU_REG_CLKGR1, 17 },
+	},
+
+	[X2000_CLK_UART5] = {
+		"uart5", CGU_CLK_GATE,
+		.parents = { X2000_CLK_EXCLK },
+		.gate = { CGU_REG_CLKGR1, 18 },
+	},
+
+	[X2000_CLK_UART6] = {
+		"uart6", CGU_CLK_GATE,
+		.parents = { X2000_CLK_EXCLK },
+		.gate = { CGU_REG_CLKGR1, 19 },
+	},
+
+	[X2000_CLK_UART7] = {
+		"uart7", CGU_CLK_GATE,
+		.parents = { X2000_CLK_EXCLK },
+		.gate = { CGU_REG_CLKGR1, 20 },
+	},
+
+	[X2000_CLK_UART8] = {
+		"uart8", CGU_CLK_GATE,
+		.parents = { X2000_CLK_EXCLK },
+		.gate = { CGU_REG_CLKGR1, 21 },
+	},
+
+	[X2000_CLK_UART9] = {
+		"uart9", CGU_CLK_GATE,
+		.parents = { X2000_CLK_EXCLK },
+		.gate = { CGU_REG_CLKGR1, 22 },
+	},
+
+	[X2000_CLK_MAC0] = {
+		"mac0", CGU_CLK_GATE,
+		.parents = { X2000_CLK_AHB2 },
+		.gate = { CGU_REG_CLKGR1, 23 },
+	},
+
+	[X2000_CLK_MAC1] = {
+		"mac1", CGU_CLK_GATE,
+		.parents = { X2000_CLK_AHB2 },
+		.gate = { CGU_REG_CLKGR1, 24 },
+	},
+
+	[X2000_CLK_INTC] = {
+		"intc", CGU_CLK_GATE,
+		.parents = { X2000_CLK_AHB2 },
+		.gate = { CGU_REG_CLKGR1, 26 },
+	},
+
+	[X2000_CLK_CSI] = {
+		"csi", CGU_CLK_GATE,
+		.parents = { X2000_CLK_AHB0 },
+		.gate = { CGU_REG_CLKGR1, 28 },
+	},
+
+	[X2000_CLK_DSI] = {
+		"dsi", CGU_CLK_GATE,
+		.parents = { X2000_CLK_AHB0 },
+		.gate = { CGU_REG_CLKGR1, 29 },
+	},
+};
+
+static void __init x2000_cgu_init(struct device_node *np)
+{
+	int retval;
+
+	cgu = ingenic_cgu_new(x2000_cgu_clocks,
+			      ARRAY_SIZE(x2000_cgu_clocks), np);
+	if (!cgu) {
+		pr_err("%s: failed to initialise CGU\n", __func__);
+		return;
+	}
+
+	retval = ingenic_cgu_register_clocks(cgu);
+	if (retval) {
+		pr_err("%s: failed to register CGU Clocks\n", __func__);
+		return;
+	}
+
+	ingenic_cgu_register_syscore_ops(cgu);
+}
+
+/*
+ * CGU has some children devices, this is useful for probing children devices
+ * in the case where the device node is compatible with "simple-mfd".
+ */
+CLK_OF_DECLARE_DRIVER(x2000_cgu, "ingenic,x2000-cgu", x2000_cgu_init);
-- 
2.7.4

