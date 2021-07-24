Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C12253D46DA
	for <lists+linux-mips@lfdr.de>; Sat, 24 Jul 2021 11:36:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235431AbhGXIzG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 24 Jul 2021 04:55:06 -0400
Received: from out28-196.mail.aliyun.com ([115.124.28.196]:51098 "EHLO
        out28-196.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234991AbhGXIy7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 24 Jul 2021 04:54:59 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436282|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0271756-0.000267751-0.972557;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047193;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=14;RT=14;SR=0;TI=SMTPD_---.KprUvTZ_1627119307;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.KprUvTZ_1627119307)
          by smtp.aliyun-inc.com(10.147.40.233);
          Sat, 24 Jul 2021 17:35:28 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org,
        paul@crapouillou.net
Cc:     linux-clk@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sihui.liu@ingenic.com,
        jun.jiang@ingenic.com, sernia.zhou@foxmail.com
Subject: [PATCH v7 10/11] clk: Ingenic: Add CGU driver for JZ4775.
Date:   Sat, 24 Jul 2021 17:34:45 +0800
Message-Id: <1627119286-125821-11-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1627119286-125821-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1627119286-125821-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add support for the clocks provided by the CGU in the Ingenic JZ4775
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

 drivers/clk/ingenic/Kconfig      |  10 +
 drivers/clk/ingenic/Makefile     |   1 +
 drivers/clk/ingenic/jz4775-cgu.c | 572 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 583 insertions(+)
 create mode 100644 drivers/clk/ingenic/jz4775-cgu.c

diff --git a/drivers/clk/ingenic/Kconfig b/drivers/clk/ingenic/Kconfig
index 898f1bc..7fda7bb 100644
--- a/drivers/clk/ingenic/Kconfig
+++ b/drivers/clk/ingenic/Kconfig
@@ -45,6 +45,16 @@ config INGENIC_CGU_JZ4770
 
 	  If building for a JZ4770 SoC, you want to say Y here.
 
+config INGENIC_CGU_JZ4775
+	bool "Ingenic JZ4775 CGU driver"
+	default MACH_JZ4775
+	select INGENIC_CGU_COMMON
+	help
+	  Support the clocks provided by the CGU hardware on Ingenic JZ4775
+	  and compatible SoCs.
+
+	  If building for a JZ4775 SoC, you want to say Y here.
+
 config INGENIC_CGU_JZ4780
 	bool "Ingenic JZ4780 CGU driver"
 	default MACH_JZ4780
diff --git a/drivers/clk/ingenic/Makefile b/drivers/clk/ingenic/Makefile
index 9edfaf4..aed8da4 100644
--- a/drivers/clk/ingenic/Makefile
+++ b/drivers/clk/ingenic/Makefile
@@ -4,6 +4,7 @@ obj-$(CONFIG_INGENIC_CGU_JZ4740)	+= jz4740-cgu.o
 obj-$(CONFIG_INGENIC_CGU_JZ4725B)	+= jz4725b-cgu.o
 obj-$(CONFIG_INGENIC_CGU_JZ4760)	+= jz4760-cgu.o
 obj-$(CONFIG_INGENIC_CGU_JZ4770)	+= jz4770-cgu.o
+obj-$(CONFIG_INGENIC_CGU_JZ4775)	+= jz4775-cgu.o
 obj-$(CONFIG_INGENIC_CGU_JZ4780)	+= jz4780-cgu.o
 obj-$(CONFIG_INGENIC_CGU_X1000)		+= x1000-cgu.o
 obj-$(CONFIG_INGENIC_CGU_X1830)		+= x1830-cgu.o
diff --git a/drivers/clk/ingenic/jz4775-cgu.c b/drivers/clk/ingenic/jz4775-cgu.c
new file mode 100644
index 00000000..5c8a227
--- /dev/null
+++ b/drivers/clk/ingenic/jz4775-cgu.c
@@ -0,0 +1,572 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * JZ4775 SoC CGU driver
+ * Copyright (c) 2020 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/of.h>
+
+#include <dt-bindings/clock/jz4775-cgu.h>
+
+#include "cgu.h"
+#include "pm.h"
+
+/* CGU register offsets */
+#define CGU_REG_CPCCR			0x00
+#define CGU_REG_APLL			0x10
+#define CGU_REG_MPLL			0x14
+#define CGU_REG_CLKGR			0x20
+#define CGU_REG_OPCR			0x24
+#define CGU_REG_DDRCDR			0x2c
+#define CGU_REG_VPUCDR			0x30
+#define CGU_REG_USBPCR			0x3c
+#define CGU_REG_USBPCR1			0x48
+#define CGU_REG_USBCDR			0x50
+#define CGU_REG_I2SCDR			0x60
+#define CGU_REG_LPCDR			0x64
+#define CGU_REG_MSC0CDR			0x68
+#define CGU_REG_UHCCDR			0x6c
+#define CGU_REG_SSICDR			0x74
+#define CGU_REG_CIM0CDR			0x7c
+#define CGU_REG_CIM1CDR			0x80
+#define CGU_REG_PCMCDR			0x84
+#define CGU_REG_MSC1CDR			0xa4
+#define CGU_REG_MSC2CDR			0xa8
+#define CGU_REG_BCHCDR			0xac
+#define CGU_REG_CMP_INTR		0xb0
+#define CGU_REG_CMP_INTRE		0xb4
+#define CGU_REG_SRBC			0xc4
+#define CGU_REG_DRCG			0xd0
+#define CGU_REG_CPCSR			0xd4
+#define CGU_REG_MACPHYC			0xe0
+
+/* bits within the OPCR register */
+#define OPCR_SPENDN0			BIT(7)
+
+/* bits within the USBPCR register */
+#define USBPCR_SIDDQ			BIT(21)
+#define USBPCR_OTG_DISABLE		BIT(20)
+
+/* bits within the USBPCR1 register */
+#define USBPCR1_REFCLKDIV_SHIFT	24
+#define USBPCR1_REFCLKDIV_MASK	(0x3 << USBPCR1_REFCLKDIV_SHIFT)
+#define USBPCR1_REFCLKDIV_19_2	(0x3 << USBPCR1_REFCLKDIV_SHIFT)
+#define USBPCR1_REFCLKDIV_48	(0x2 << USBPCR1_REFCLKDIV_SHIFT)
+#define USBPCR1_REFCLKDIV_24	(0x1 << USBPCR1_REFCLKDIV_SHIFT)
+#define USBPCR1_REFCLKDIV_12	(0x0 << USBPCR1_REFCLKDIV_SHIFT)
+#define USBPCR1_PDBAR			BIT(17)
+#define USBPCR1_XP_SHIFT		12
+#define USBPCR1_XP_MASK			(0x3 << USBPCR1_XP_SHIFT)
+#define USBPCR1_XP_DFT			(0x1 << USBPCR1_XP_SHIFT)
+#define USBPCR1_SM_SHIFT		6
+#define USBPCR1_SM_MASK			(0x7 << USBPCR1_XP_SHIFT)
+#define USBPCR1_SM_RPD			(0x1 << USBPCR1_XP_SHIFT)
+
+static struct ingenic_cgu *cgu;
+
+static int jz4775_uhc_phy_enable(struct clk_hw *hw)
+{
+	void __iomem *reg_usbpcr1	= cgu->base + CGU_REG_USBPCR1;
+	u32	usbpcr1;
+
+	usbpcr1 = readl(reg_usbpcr1);
+	usbpcr1 &= ~(USBPCR1_XP_MASK | USBPCR1_SM_MASK);
+	usbpcr1 |= USBPCR1_XP_DFT | USBPCR1_SM_RPD;
+	writel(usbpcr1, reg_usbpcr1);
+
+	return 0;
+}
+
+static void jz4775_uhc_phy_disable(struct clk_hw *hw)
+{
+	void __iomem *reg_usbpcr1	= cgu->base + CGU_REG_USBPCR1;
+
+	writel(readl(reg_usbpcr1) & ~USBPCR1_PDBAR, reg_usbpcr1);
+}
+
+static int jz4775_uhc_phy_is_enabled(struct clk_hw *hw)
+{
+	void __iomem *reg_usbpcr1	= cgu->base + CGU_REG_USBPCR1;
+
+	return !!(readl(reg_usbpcr1) & USBPCR1_PDBAR);
+}
+
+static const struct clk_ops jz4775_uhc_phy_ops = {
+	.enable = jz4775_uhc_phy_enable,
+	.disable = jz4775_uhc_phy_disable,
+	.is_enabled = jz4775_uhc_phy_is_enabled,
+};
+
+static unsigned long jz4775_otg_phy_recalc_rate(struct clk_hw *hw,
+						unsigned long parent_rate)
+{
+	u32 usbpcr1;
+	unsigned refclk_div;
+
+	usbpcr1 = readl(cgu->base + CGU_REG_USBPCR1);
+	refclk_div = usbpcr1 & USBPCR1_REFCLKDIV_MASK;
+
+	switch (refclk_div) {
+	case USBPCR1_REFCLKDIV_12:
+		return 12000000;
+
+	case USBPCR1_REFCLKDIV_24:
+		return 24000000;
+
+	case USBPCR1_REFCLKDIV_48:
+		return 48000000;
+
+	case USBPCR1_REFCLKDIV_19_2:
+		return 19200000;
+	}
+
+	return parent_rate;
+}
+
+static long jz4775_otg_phy_round_rate(struct clk_hw *hw, unsigned long req_rate,
+				      unsigned long *parent_rate)
+{
+	if (req_rate < 15600000)
+		return 12000000;
+
+	if (req_rate < 21600000)
+		return 19200000;
+
+	if (req_rate < 36000000)
+		return 24000000;
+
+	return 48000000;
+}
+
+static int jz4775_otg_phy_set_rate(struct clk_hw *hw, unsigned long req_rate,
+				   unsigned long parent_rate)
+{
+	unsigned long flags;
+	u32 usbpcr1, div_bits;
+
+	switch (req_rate) {
+	case 12000000:
+		div_bits = USBPCR1_REFCLKDIV_12;
+		break;
+
+	case 19200000:
+		div_bits = USBPCR1_REFCLKDIV_19_2;
+		break;
+
+	case 24000000:
+		div_bits = USBPCR1_REFCLKDIV_24;
+		break;
+
+	case 48000000:
+		div_bits = USBPCR1_REFCLKDIV_48;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	spin_lock_irqsave(&cgu->lock, flags);
+
+	usbpcr1 = readl(cgu->base + CGU_REG_USBPCR1);
+	usbpcr1 &= ~USBPCR1_REFCLKDIV_MASK;
+	usbpcr1 |= div_bits;
+	writel(usbpcr1, cgu->base + CGU_REG_USBPCR1);
+
+	spin_unlock_irqrestore(&cgu->lock, flags);
+
+	return 0;
+}
+
+static int jz4775_otg_phy_enable(struct clk_hw *hw)
+{
+	void __iomem *reg_opcr		= cgu->base + CGU_REG_OPCR;
+	void __iomem *reg_usbpcr	= cgu->base + CGU_REG_USBPCR;
+
+	writel(readl(reg_opcr) | OPCR_SPENDN0, reg_opcr);
+	writel(readl(reg_usbpcr) & ~USBPCR_OTG_DISABLE & ~USBPCR_SIDDQ, reg_usbpcr);
+
+	return 0;
+}
+
+static void jz4775_otg_phy_disable(struct clk_hw *hw)
+{
+	void __iomem *reg_opcr		= cgu->base + CGU_REG_OPCR;
+	void __iomem *reg_usbpcr	= cgu->base + CGU_REG_USBPCR;
+
+	writel(readl(reg_opcr) & ~OPCR_SPENDN0, reg_opcr);
+	writel(readl(reg_usbpcr) | USBPCR_OTG_DISABLE | USBPCR_SIDDQ, reg_usbpcr);
+}
+
+static int jz4775_otg_phy_is_enabled(struct clk_hw *hw)
+{
+	void __iomem *reg_opcr		= cgu->base + CGU_REG_OPCR;
+	void __iomem *reg_usbpcr	= cgu->base + CGU_REG_USBPCR;
+
+	return (readl(reg_opcr) & OPCR_SPENDN0) &&
+		!(readl(reg_usbpcr) & USBPCR_SIDDQ) &&
+		!(readl(reg_usbpcr) & USBPCR_OTG_DISABLE);
+}
+
+static const struct clk_ops jz4775_otg_phy_ops = {
+	.recalc_rate = jz4775_otg_phy_recalc_rate,
+	.round_rate = jz4775_otg_phy_round_rate,
+	.set_rate = jz4775_otg_phy_set_rate,
+
+	.enable = jz4775_otg_phy_enable,
+	.disable = jz4775_otg_phy_disable,
+	.is_enabled = jz4775_otg_phy_is_enabled,
+};
+
+static const s8 pll_od_encoding[8] = {
+	0x0, 0x1, -1, 0x2, -1, -1, -1, 0x3,
+};
+
+static const struct ingenic_cgu_clk_info jz4775_cgu_clocks[] = {
+
+	/* External clocks */
+
+	[JZ4775_CLK_EXCLK] = { "ext", CGU_CLK_EXT },
+	[JZ4775_CLK_RTCLK] = { "rtc", CGU_CLK_EXT },
+
+	/* PLLs */
+
+	[JZ4775_CLK_APLL] = {
+		"apll", CGU_CLK_PLL,
+		.parents = { JZ4775_CLK_EXCLK, -1, -1, -1 },
+		.pll = {
+			.reg = CGU_REG_APLL,
+			.rate_multiplier = 1,
+			.m_shift = 24,
+			.m_bits = 7,
+			.m_offset = 1,
+			.n_shift = 18,
+			.n_bits = 5,
+			.n_offset = 1,
+			.od_shift = 16,
+			.od_bits = 2,
+			.od_max = 8,
+			.od_encoding = pll_od_encoding,
+			.bypass_reg = CGU_REG_APLL,
+			.bypass_bit = 9,
+			.enable_bit = 8,
+			.stable_bit = 10,
+		},
+	},
+
+	[JZ4775_CLK_MPLL] = {
+		"mpll", CGU_CLK_PLL,
+		.parents = { JZ4775_CLK_EXCLK, -1, -1, -1 },
+		.pll = {
+			.reg = CGU_REG_MPLL,
+			.rate_multiplier = 1,
+			.m_shift = 24,
+			.m_bits = 7,
+			.m_offset = 1,
+			.n_shift = 18,
+			.n_bits = 5,
+			.n_offset = 1,
+			.od_shift = 16,
+			.od_bits = 2,
+			.od_max = 8,
+			.od_encoding = pll_od_encoding,
+			.bypass_reg = CGU_REG_MPLL,
+			.bypass_bit = 6,
+			.enable_bit = 7,
+			.stable_bit = 0,
+		},
+	},
+
+	/* Custom (SoC-specific) */
+
+	[JZ4775_CLK_UHCPHY] = {
+		"uhc_phy", CGU_CLK_CUSTOM,
+		.parents = { JZ4775_CLK_UHC, -1, -1, -1 },
+		.custom = { &jz4775_uhc_phy_ops },
+	},
+
+	[JZ4775_CLK_OTGPHY] = {
+		"otg_phy", CGU_CLK_CUSTOM,
+		.parents = { JZ4775_CLK_EXCLK, -1, -1, -1 },
+		.custom = { &jz4775_otg_phy_ops },
+	},
+
+	/* Muxes & dividers */
+
+	[JZ4775_CLK_SCLKA] = {
+		"sclk_a", CGU_CLK_MUX,
+		.parents = { -1, JZ4775_CLK_APLL, JZ4775_CLK_EXCLK, JZ4775_CLK_RTCLK },
+		.mux = { CGU_REG_CPCCR, 30, 2 },
+	},
+
+	[JZ4775_CLK_CPUMUX] = {
+		"cpu_mux", CGU_CLK_MUX,
+		.parents = { -1, JZ4775_CLK_SCLKA, JZ4775_CLK_MPLL, -1 },
+		.mux = { CGU_REG_CPCCR, 28, 2 },
+	},
+
+	[JZ4775_CLK_CPU] = {
+		"cpu", CGU_CLK_DIV,
+		.parents = { JZ4775_CLK_CPUMUX },
+		.div = { CGU_REG_CPCCR, 0, 1, 4, 22, -1, -1 },
+	},
+
+	[JZ4775_CLK_L2CACHE] = {
+		"l2cache", CGU_CLK_DIV,
+		.parents = { JZ4775_CLK_CPUMUX },
+		.div = { CGU_REG_CPCCR, 4, 1, 4, 22, -1, -1 },
+	},
+
+	[JZ4775_CLK_AHB0] = {
+		"ahb0", CGU_CLK_MUX | CGU_CLK_DIV,
+		.parents = { -1, JZ4775_CLK_SCLKA, JZ4775_CLK_MPLL, -1 },
+		.mux = { CGU_REG_CPCCR, 26, 2 },
+		.div = { CGU_REG_CPCCR, 8, 1, 4, 21, -1, -1 },
+	},
+
+	[JZ4775_CLK_AHB2PMUX] = {
+		"ahb2_apb_mux", CGU_CLK_MUX,
+		.parents = { -1, JZ4775_CLK_SCLKA, JZ4775_CLK_MPLL, JZ4775_CLK_RTCLK },
+		.mux = { CGU_REG_CPCCR, 24, 2 },
+	},
+
+	[JZ4775_CLK_AHB2] = {
+		"ahb2", CGU_CLK_DIV,
+		.parents = { JZ4775_CLK_AHB2PMUX },
+		.div = { CGU_REG_CPCCR, 12, 1, 4, 20, -1, -1 },
+	},
+
+	[JZ4775_CLK_PCLK] = {
+		"pclk", CGU_CLK_DIV,
+		.parents = { JZ4775_CLK_AHB2PMUX },
+		.div = { CGU_REG_CPCCR, 16, 1, 4, 20, -1, -1 },
+	},
+
+	[JZ4775_CLK_DDR] = {
+		"ddr", CGU_CLK_MUX | CGU_CLK_DIV | CGU_CLK_GATE,
+		.parents = { -1, JZ4775_CLK_SCLKA, JZ4775_CLK_MPLL, -1 },
+		.mux = { CGU_REG_DDRCDR, 30, 2 },
+		.div = { CGU_REG_DDRCDR, 0, 1, 4, 29, 28, 27 },
+		.gate = { CGU_REG_CLKGR, 31 },
+	},
+
+	[JZ4775_CLK_VPU] = {
+		"vpu", CGU_CLK_MUX | CGU_CLK_DIV | CGU_CLK_GATE,
+		.parents = { JZ4775_CLK_SCLKA, JZ4775_CLK_MPLL },
+		.mux = { CGU_REG_VPUCDR, 31, 1 },
+		.div = { CGU_REG_VPUCDR, 0, 1, 4, 29, 28, 27 },
+		.gate = { CGU_REG_CLKGR, 19 },
+	},
+
+	[JZ4775_CLK_OTG] = {
+		"otg", CGU_CLK_DIV | CGU_CLK_GATE | CGU_CLK_MUX,
+		.parents = { JZ4775_CLK_EXCLK, -1, JZ4775_CLK_SCLKA, JZ4775_CLK_MPLL },
+		.mux = { CGU_REG_USBCDR, 30, 2 },
+		.div = { CGU_REG_USBCDR, 0, 1, 8, 29, 28, 27 },
+		.gate = { CGU_REG_CLKGR, 2 },
+	},
+
+	[JZ4775_CLK_EXCLK_DIV2] = {
+		"exclk_div2", CGU_CLK_FIXDIV,
+		.parents = { JZ4775_CLK_EXCLK },
+		.fixdiv = { 2 },
+	},
+
+	[JZ4775_CLK_I2S] = {
+		"i2s", CGU_CLK_MUX | CGU_CLK_DIV,
+		.parents = { JZ4775_CLK_EXCLK_DIV2, -1, JZ4775_CLK_SCLKA, JZ4775_CLK_MPLL },
+		.mux = { CGU_REG_I2SCDR, 30, 2 },
+		.div = { CGU_REG_I2SCDR, 0, 1, 8, 29, 28, 27 },
+	},
+
+	[JZ4775_CLK_LCD] = {
+		"lcd", CGU_CLK_MUX | CGU_CLK_DIV | CGU_CLK_GATE,
+		.parents = { JZ4775_CLK_SCLKA, JZ4775_CLK_MPLL },
+		.mux = { CGU_REG_LPCDR, 31, 1 },
+		.div = { CGU_REG_LPCDR, 0, 1, 8, 28, 27, 26 },
+		.gate = { CGU_REG_CLKGR, 25 },
+	},
+
+	[JZ4775_CLK_MSCMUX] = {
+		"msc_mux", CGU_CLK_MUX,
+		.parents = { -1, JZ4775_CLK_SCLKA, JZ4775_CLK_MPLL, -1 },
+		.mux = { CGU_REG_MSC0CDR, 30, 2 },
+	},
+
+	[JZ4775_CLK_MSC0] = {
+		"msc0", CGU_CLK_DIV | CGU_CLK_GATE,
+		.parents = { JZ4775_CLK_MSCMUX },
+		.div = { CGU_REG_MSC0CDR, 0, 2, 8, 29, 28, 27 },
+		.gate = { CGU_REG_CLKGR, 3 },
+	},
+
+	[JZ4775_CLK_MSC1] = {
+		"msc1", CGU_CLK_DIV | CGU_CLK_GATE,
+		.parents = { JZ4775_CLK_MSCMUX },
+		.div = { CGU_REG_MSC1CDR, 0, 2, 8, 29, 28, 27 },
+		.gate = { CGU_REG_CLKGR, 11 },
+	},
+
+	[JZ4775_CLK_MSC2] = {
+		"msc2", CGU_CLK_DIV | CGU_CLK_GATE,
+		.parents = { JZ4775_CLK_MSCMUX },
+		.div = { CGU_REG_MSC2CDR, 0, 2, 8, 29, 28, 27 },
+		.gate = { CGU_REG_CLKGR, 12 },
+	},
+
+	[JZ4775_CLK_UHC] = {
+		"uhc", CGU_CLK_MUX | CGU_CLK_DIV | CGU_CLK_GATE,
+		.parents = { JZ4775_CLK_SCLKA, JZ4775_CLK_MPLL, JZ4775_CLK_OTGPHY, -1 },
+		.mux = { CGU_REG_UHCCDR, 30, 2 },
+		.div = { CGU_REG_UHCCDR, 0, 1, 8, 29, 28, 27 },
+		.gate = { CGU_REG_CLKGR, 22 },
+	},
+
+	[JZ4775_CLK_SSI] = {
+		"ssi", CGU_CLK_MUX | CGU_CLK_DIV | CGU_CLK_GATE,
+		.parents = { JZ4775_CLK_EXCLK, -1, JZ4775_CLK_SCLKA, JZ4775_CLK_MPLL },
+		.mux = { CGU_REG_SSICDR, 30, 2 },
+		.div = { CGU_REG_SSICDR, 0, 1, 8, 29, 28, 27 },
+		.gate = { CGU_REG_CLKGR, 4 },
+	},
+
+	[JZ4775_CLK_CIM0] = {
+		"cim0", CGU_CLK_MUX | CGU_CLK_DIV | CGU_CLK_GATE,
+		.parents = { JZ4775_CLK_SCLKA, JZ4775_CLK_MPLL },
+		.mux = { CGU_REG_CIM0CDR, 31, 1 },
+		.div = { CGU_REG_CIM0CDR, 0, 1, 8, 30, 29, 28 },
+		.gate = { CGU_REG_CLKGR, 23 },
+	},
+
+	[JZ4775_CLK_CIM1] = {
+		"cim1", CGU_CLK_MUX | CGU_CLK_DIV | CGU_CLK_GATE,
+		.parents = { JZ4775_CLK_SCLKA, JZ4775_CLK_MPLL },
+		.mux = { CGU_REG_CIM1CDR, 31, 1 },
+		.div = { CGU_REG_CIM1CDR, 0, 1, 8, 30, 29, 28 },
+		.gate = { CGU_REG_CLKGR, 24 },
+	},
+
+	[JZ4775_CLK_PCM] = {
+		"pcm", CGU_CLK_MUX | CGU_CLK_DIV | CGU_CLK_GATE,
+		.parents = { JZ4775_CLK_EXCLK_DIV2, -1, JZ4775_CLK_SCLKA, JZ4775_CLK_MPLL },
+		.mux = { CGU_REG_PCMCDR, 30, 2 },
+		.div = { CGU_REG_PCMCDR, 0, 1, 8, 28, 27, 26 },
+		.gate = { CGU_REG_CLKGR, 13 },
+	},
+
+	[JZ4775_CLK_BCH] = {
+		"bch", CGU_CLK_MUX | CGU_CLK_DIV | CGU_CLK_GATE,
+		.parents = { -1, JZ4775_CLK_SCLKA, JZ4775_CLK_MPLL, -1 },
+		.mux = { CGU_REG_BCHCDR, 30, 2 },
+		.div = { CGU_REG_BCHCDR, 0, 1, 4, 29, 28, 27 },
+		.gate = { CGU_REG_CLKGR, 1 },
+	},
+
+	[JZ4775_CLK_EXCLK_DIV512] = {
+		"exclk_div512", CGU_CLK_FIXDIV,
+		.parents = { JZ4775_CLK_EXCLK },
+		.fixdiv = { 512 },
+	},
+
+	[JZ4775_CLK_RTC] = {
+		"rtc_ercs", CGU_CLK_MUX | CGU_CLK_GATE,
+		.parents = { JZ4775_CLK_EXCLK_DIV512, JZ4775_CLK_RTCLK },
+		.mux = { CGU_REG_OPCR, 2, 1},
+	},
+
+	/* Gate-only clocks */
+
+	[JZ4775_CLK_NEMC] = {
+		"nemc", CGU_CLK_GATE,
+		.parents = { JZ4775_CLK_AHB2 },
+		.gate = { CGU_REG_CLKGR, 0 },
+	},
+
+	[JZ4775_CLK_I2C0] = {
+		"i2c0", CGU_CLK_GATE,
+		.parents = { JZ4775_CLK_PCLK },
+		.gate = { CGU_REG_CLKGR, 5 },
+	},
+
+	[JZ4775_CLK_I2C1] = {
+		"i2c1", CGU_CLK_GATE,
+		.parents = { JZ4775_CLK_PCLK },
+		.gate = { CGU_REG_CLKGR, 6 },
+	},
+
+	[JZ4775_CLK_I2C2] = {
+		"i2c2", CGU_CLK_GATE,
+		.parents = { JZ4775_CLK_PCLK },
+		.gate = { CGU_REG_CLKGR, 7 },
+	},
+
+	[JZ4775_CLK_SADC] = {
+		"sadc", CGU_CLK_GATE,
+		.parents = { JZ4775_CLK_EXCLK },
+		.gate = { CGU_REG_CLKGR, 14 },
+	},
+
+	[JZ4775_CLK_UART0] = {
+		"uart0", CGU_CLK_GATE,
+		.parents = { JZ4775_CLK_EXCLK },
+		.gate = { CGU_REG_CLKGR, 15 },
+	},
+
+	[JZ4775_CLK_UART1] = {
+		"uart1", CGU_CLK_GATE,
+		.parents = { JZ4775_CLK_EXCLK },
+		.gate = { CGU_REG_CLKGR, 16 },
+	},
+
+	[JZ4775_CLK_UART2] = {
+		"uart2", CGU_CLK_GATE,
+		.parents = { JZ4775_CLK_EXCLK },
+		.gate = { CGU_REG_CLKGR, 17 },
+	},
+
+	[JZ4775_CLK_UART3] = {
+		"uart3", CGU_CLK_GATE,
+		.parents = { JZ4775_CLK_EXCLK },
+		.gate = { CGU_REG_CLKGR, 18 },
+	},
+
+	[JZ4775_CLK_PDMA] = {
+		"pdma", CGU_CLK_GATE,
+		.parents = { JZ4775_CLK_EXCLK },
+		.gate = { CGU_REG_CLKGR, 20 },
+	},
+
+	[JZ4775_CLK_MAC] = {
+		"mac", CGU_CLK_GATE,
+		.parents = { JZ4775_CLK_AHB2 },
+		.gate = { CGU_REG_CLKGR, 21 },
+	},
+};
+
+static void __init jz4775_cgu_init(struct device_node *np)
+{
+	int retval;
+
+	cgu = ingenic_cgu_new(jz4775_cgu_clocks,
+			      ARRAY_SIZE(jz4775_cgu_clocks), np);
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
+CLK_OF_DECLARE_DRIVER(jz4775_cgu, "ingenic,jz4775-cgu", jz4775_cgu_init);
-- 
2.7.4

