Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A07E31E6D6
	for <lists+linux-mips@lfdr.de>; Thu, 18 Feb 2021 08:19:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231265AbhBRHSQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 18 Feb 2021 02:18:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230495AbhBRHKH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 18 Feb 2021 02:10:07 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 749A7C06178A;
        Wed, 17 Feb 2021 23:07:18 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id o10so2242995wmc.1;
        Wed, 17 Feb 2021 23:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dQtQURp4Ajy9YRhOuJUaqhgI1Wqe0QiNc6TUig+pRqI=;
        b=U+NRzqV4lk2g3w4ElEO8jg1MIcBkxymyRmsp0J4T+EVNsbJ9yHvHO8rvt9cIAxabsH
         ppMmUYiUoB3xyPb/wz7s9QhAxnDobpZMUrAZ+gR9IomiDa5pm1guVCOMFAxdVXNW4kNX
         mYU+/2hc7VVXJzZaMY+Iv/D3Vxr68Li6PBE9M5sAI/0HKkFGIFa4Byq1WxBecRS0Mxnk
         MXnNnlxWQb6Y8u00zqCtK6t0BOkZjxwxm7lOu3k4xtmv7IGCrFLtn7fuU19uBPAJLjNR
         qmKFo04wyQtyuPjmPfsIpckI9tI/t1STMl8AHw3dT/duXCWXLmvRmTiMTrGl9LpeQB3x
         6j7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dQtQURp4Ajy9YRhOuJUaqhgI1Wqe0QiNc6TUig+pRqI=;
        b=lcXNY9h7VPWpaTyCCZttoBtEH8iGq/RxcmINNIMCfklp84QQ+Gqb5gcf3tk3dsjdAC
         Hr7eKTmZ9Lmguh0PoypqbwvkXRWtUaEsodWrkhS95a6oVsV0bYq6H5OEFgqMFtFxlCm4
         wSNbKA9rx8H+xN89jUDfnQoie3G5lIgpfWQWcqaVzDH71dBwIeW2qxCJJ0FjfFrQ2bAl
         I8u4qaMSd+jzXf4E+jWyBwaGHZVxx03BnuPOO7UOjUMkaOdQ60HBdC3brM8uHRtuZ9R7
         1VLjqwhAJE+zqLAhowSg5jaTxABYy3zuUoFY4iV/ozUvlemavPzy2EmFHZxr8Jk//3db
         6ytg==
X-Gm-Message-State: AOAM532xSaV2tE/XkCSBgzmL6m9TqN0FdHC+wm8nsLPBoWq0U1iuPNtn
        98/g7gb5k4UQMay2dDmuN7k=
X-Google-Smtp-Source: ABdhPJxq1DrpDVSucQcdTk7ghX4mupxawv2kHiIg/20rGEvlyZVHvY6nrOiBzpOOtQsKs82QdDEolA==
X-Received: by 2002:a1c:31d5:: with SMTP id x204mr2224421wmx.175.1613632035727;
        Wed, 17 Feb 2021 23:07:15 -0800 (PST)
Received: from localhost.localdomain (67.red-83-54-30.dynamicip.rima-tde.net. [83.54.30.67])
        by smtp.gmail.com with ESMTPSA id 4sm6136555wma.0.2021.02.17.23.07.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Feb 2021 23:07:15 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     sboyd@kernel.org
Cc:     robh+dt@kernel.org, john@phrozen.org, tsbogend@alpha.franken.de,
        gregkh@linuxfoundation.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org, neil@brown.name,
        linux-kernel@vger.kernel.org
Subject: [PATCH v9 3/6] clk: ralink: add clock driver for mt7621 SoC
Date:   Thu, 18 Feb 2021 08:07:06 +0100
Message-Id: <20210218070709.11932-4-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210218070709.11932-1-sergio.paracuellos@gmail.com>
References: <20210218070709.11932-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The documentation for this SOC only talks about two
registers regarding to the clocks:
* SYSC_REG_CPLL_CLKCFG0 - provides some information about
boostrapped refclock. PLL and dividers used for CPU and some
sort of BUS.
* SYSC_REG_CPLL_CLKCFG1 - a banch of gates to enable/disable
clocks for all or some ip cores.

Looking into driver code, and some openWRT patched there are
another frequencies which are used in some drivers (uart, sd...).
According to all of this information the clock plan for this
SoC is set as follows:
- Main top clock "xtal" from where all the rest of the world is
derived.
- CPU clock "cpu" derived from "xtal" frequencies and a bunch of
register reads and predividers.
- BUS clock "bus" derived from "cpu" and with (cpu / 4) MHz.
- Fixed clocks from "xtal":
    * "50m": 50 MHz.
    * "125m": 125 MHz.
    * "150m": 150 MHz.
    * "250m": 250 MHz.
    * "270m": 270 MHz.

We also have a buch of gate clocks with their parents:
  * "hsdma": "150m"
  * "fe": "250m"
  * "sp_divtx": "270m"
  * "timer": "50m"
  * "pcm": "270m"
  * "pio": "50m"
  * "gdma": "bus"
  * "nand": "125m"
  * "i2c": "50m"
  * "i2s": "270m"
  * "spi": "bus"
  * "uart1": "50m"
  * "uart2": "50m"
  * "uart3": "50m"
  * "eth": "50m"
  * "pcie0": "125m"
  * "pcie1": "125m"
  * "pcie2": "125m"
  * "crypto": "250m"
  * "shxc": "50m"

With this information the clk driver will provide clock and gates
functionality from a a set of hardcoded clocks allowing to define
a nice device tree without fixed clocks.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/clk/Kconfig             |   1 +
 drivers/clk/Makefile            |   1 +
 drivers/clk/ralink/Kconfig      |  15 +
 drivers/clk/ralink/Makefile     |   2 +
 drivers/clk/ralink/clk-mt7621.c | 536 ++++++++++++++++++++++++++++++++
 5 files changed, 555 insertions(+)
 create mode 100644 drivers/clk/ralink/Kconfig
 create mode 100644 drivers/clk/ralink/Makefile
 create mode 100644 drivers/clk/ralink/clk-mt7621.c

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 7c5dc348c16f..70b23da997bf 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -382,6 +382,7 @@ source "drivers/clk/mediatek/Kconfig"
 source "drivers/clk/meson/Kconfig"
 source "drivers/clk/mvebu/Kconfig"
 source "drivers/clk/qcom/Kconfig"
+source "drivers/clk/ralink/Kconfig"
 source "drivers/clk/renesas/Kconfig"
 source "drivers/clk/rockchip/Kconfig"
 source "drivers/clk/samsung/Kconfig"
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 5325847469e9..1b35ad852721 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -98,6 +98,7 @@ obj-$(CONFIG_COMMON_CLK_NXP)		+= nxp/
 obj-$(CONFIG_MACH_PISTACHIO)		+= pistachio/
 obj-$(CONFIG_COMMON_CLK_PXA)		+= pxa/
 obj-$(CONFIG_COMMON_CLK_QCOM)		+= qcom/
+obj-y					+= ralink/
 obj-y					+= renesas/
 obj-$(CONFIG_ARCH_ROCKCHIP)		+= rockchip/
 obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
diff --git a/drivers/clk/ralink/Kconfig b/drivers/clk/ralink/Kconfig
new file mode 100644
index 000000000000..3e3f5cb9ad88
--- /dev/null
+++ b/drivers/clk/ralink/Kconfig
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# MediaTek Mt7621 Clock Driver
+#
+menu "Clock driver for Mediatek mt7621 SoC"
+	depends on SOC_MT7621 || COMPILE_TEST
+
+config CLK_MT7621
+	bool "Clock driver for MediaTek MT7621"
+	depends on SOC_MT7621 || COMPILE_TEST
+	default SOC_MT7621
+	select MFD_SYSCON
+	help
+	  This driver supports MediaTek MT7621 basic clocks.
+endmenu
diff --git a/drivers/clk/ralink/Makefile b/drivers/clk/ralink/Makefile
new file mode 100644
index 000000000000..cf6f9216379d
--- /dev/null
+++ b/drivers/clk/ralink/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_CLK_MT7621) += clk-mt7621.o
diff --git a/drivers/clk/ralink/clk-mt7621.c b/drivers/clk/ralink/clk-mt7621.c
new file mode 100644
index 000000000000..b32b19fd093e
--- /dev/null
+++ b/drivers/clk/ralink/clk-mt7621.c
@@ -0,0 +1,536 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Mediatek MT7621 Clock Driver
+ * Author: Sergio Paracuellos <sergio.paracuellos@gmail.com>
+ */
+
+#include <linux/bitops.h>
+#include <linux/clk-provider.h>
+#include <linux/clk.h>
+#include <linux/mfd/syscon.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <dt-bindings/clock/mt7621-clk.h>
+
+/* Configuration registers */
+#define SYSC_REG_SYSTEM_CONFIG0         0x10
+#define SYSC_REG_SYSTEM_CONFIG1         0x14
+#define SYSC_REG_CLKCFG0		0x2c
+#define SYSC_REG_CLKCFG1		0x30
+#define SYSC_REG_CUR_CLK_STS		0x44
+
+#define MEMC_REG_CPU_PLL		0x648
+#define XTAL_MODE_SEL_MASK		0x7
+#define XTAL_MODE_SEL_SHIFT		6
+
+#define CPU_CLK_SEL_MASK		0x3
+#define CPU_CLK_SEL_SHIFT		30
+
+#define CUR_CPU_FDIV_MASK		0x1f
+#define CUR_CPU_FDIV_SHIFT		8
+#define CUR_CPU_FFRAC_MASK		0x1f
+#define CUR_CPU_FFRAC_SHIFT		0
+
+#define CPU_PLL_PREDIV_MASK		0x3
+#define CPU_PLL_PREDIV_SHIFT		12
+#define CPU_PLL_FBDIV_MASK		0x7f
+#define CPU_PLL_FBDIV_SHIFT		4
+
+struct mt7621_clk_priv {
+	struct regmap *sysc;
+	struct regmap *memc;
+};
+
+struct mt7621_clk {
+	struct clk_hw hw;
+	struct mt7621_clk_priv *priv;
+};
+
+struct mt7621_fixed_clk {
+	u8 idx;
+	const char *name;
+	const char *parent_name;
+	unsigned long rate;
+	struct clk_hw *hw;
+};
+
+struct mt7621_gate {
+	u8 idx;
+	const char *name;
+	const char *parent_name;
+	struct mt7621_clk_priv *priv;
+	u32 bit_idx;
+	struct clk_hw hw;
+};
+
+#define GATE(_id, _name, _pname, _shift)	\
+	{					\
+		.idx		= _id,		\
+		.name		= _name,	\
+		.parent_name	= _pname,	\
+		.bit_idx	= _shift	\
+	}
+
+static struct mt7621_gate mt7621_gates[] = {
+	GATE(MT7621_CLK_HSDMA, "hsdma", "150m", BIT(5)),
+	GATE(MT7621_CLK_FE, "fe", "250m", BIT(6)),
+	GATE(MT7621_CLK_SP_DIVTX, "sp_divtx", "270m", BIT(7)),
+	GATE(MT7621_CLK_TIMER, "timer", "50m", BIT(8)),
+	GATE(MT7621_CLK_PCM, "pcm", "270m", BIT(11)),
+	GATE(MT7621_CLK_PIO, "pio", "50m", BIT(13)),
+	GATE(MT7621_CLK_GDMA, "gdma", "bus", BIT(14)),
+	GATE(MT7621_CLK_NAND, "nand", "125m", BIT(15)),
+	GATE(MT7621_CLK_I2C, "i2c", "50m", BIT(16)),
+	GATE(MT7621_CLK_I2S, "i2s", "270m", BIT(17)),
+	GATE(MT7621_CLK_SPI, "spi", "bus", BIT(18)),
+	GATE(MT7621_CLK_UART1, "uart1", "50m", BIT(19)),
+	GATE(MT7621_CLK_UART2, "uart2", "50m", BIT(20)),
+	GATE(MT7621_CLK_UART3, "uart3", "50m", BIT(21)),
+	GATE(MT7621_CLK_ETH, "eth", "50m", BIT(23)),
+	GATE(MT7621_CLK_PCIE0, "pcie0", "125m", BIT(24)),
+	GATE(MT7621_CLK_PCIE1, "pcie1", "125m", BIT(25)),
+	GATE(MT7621_CLK_PCIE2, "pcie2", "125m", BIT(26)),
+	GATE(MT7621_CLK_CRYPTO, "crypto", "250m", BIT(29)),
+	GATE(MT7621_CLK_SHXC, "shxc", "50m", BIT(30))
+};
+
+static inline struct mt7621_gate *to_mt7621_gate(struct clk_hw *hw)
+{
+	return container_of(hw, struct mt7621_gate, hw);
+}
+
+static int mt7621_gate_enable(struct clk_hw *hw)
+{
+	struct mt7621_gate *clk_gate = to_mt7621_gate(hw);
+	struct regmap *sysc = clk_gate->priv->sysc;
+
+	return regmap_update_bits(sysc, SYSC_REG_CLKCFG1,
+				  clk_gate->bit_idx, clk_gate->bit_idx);
+}
+
+static void mt7621_gate_disable(struct clk_hw *hw)
+{
+	struct mt7621_gate *clk_gate = to_mt7621_gate(hw);
+	struct regmap *sysc = clk_gate->priv->sysc;
+
+	regmap_update_bits(sysc, SYSC_REG_CLKCFG1, clk_gate->bit_idx, 0);
+}
+
+static int mt7621_gate_is_enabled(struct clk_hw *hw)
+{
+	struct mt7621_gate *clk_gate = to_mt7621_gate(hw);
+	struct regmap *sysc = clk_gate->priv->sysc;
+	u32 val;
+
+	if (regmap_read(sysc, SYSC_REG_CLKCFG1, &val))
+		return 0;
+
+	return val & BIT(clk_gate->bit_idx);
+}
+
+static const struct clk_ops mt7621_gate_ops = {
+	.enable = mt7621_gate_enable,
+	.disable = mt7621_gate_disable,
+	.is_enabled = mt7621_gate_is_enabled,
+};
+
+static int mt7621_gate_ops_init(struct device *dev,
+				struct mt7621_gate *sclk)
+{
+	struct clk_init_data init = {
+		.flags = CLK_SET_RATE_PARENT,
+		.num_parents = 1,
+		.parent_names = &sclk->parent_name,
+		.ops = &mt7621_gate_ops,
+		.name = sclk->name,
+	};
+
+	sclk->hw.init = &init;
+	return devm_clk_hw_register(dev, &sclk->hw);
+}
+
+static int mt7621_register_gates(struct device *dev,
+				 struct clk_hw_onecell_data *clk_data,
+				 struct mt7621_clk_priv *priv)
+{
+	struct clk_hw **hws = clk_data->hws;
+	int ret, i;
+
+	for (i = 0; i < ARRAY_SIZE(mt7621_gates); i++) {
+		struct mt7621_gate *sclk = &mt7621_gates[i];
+
+		sclk->priv = priv;
+		ret = mt7621_gate_ops_init(dev, sclk);
+		if (ret) {
+			dev_err(dev, "Couldn't register clock %s\n", sclk->name);
+			goto err_clk_unreg;
+		}
+
+		hws[sclk->idx] = &sclk->hw;
+	}
+
+	return 0;
+
+err_clk_unreg:
+	while (--i >= 0) {
+		struct mt7621_gate *sclk = &mt7621_gates[i];
+
+		clk_hw_unregister(&sclk->hw);
+	}
+	return ret;
+}
+
+#define FIXED(_id, _name, _rate)		\
+	{					\
+		.idx		= _id,		\
+		.name		= _name,	\
+		.parent_name	= "xtal",	\
+		.rate		= _rate		\
+	}
+
+static struct mt7621_fixed_clk mt7621_fixed_clks[] = {
+	FIXED(MT7621_CLK_50M, "50m", 50000000),
+	FIXED(MT7621_CLK_125M, "125m", 125000000),
+	FIXED(MT7621_CLK_150M, "150m", 150000000),
+	FIXED(MT7621_CLK_250M, "250m", 250000000),
+	FIXED(MT7621_CLK_270M, "270m", 270000000),
+};
+
+static int mt7621_register_fixed_clocks(struct device *dev,
+					struct clk_hw_onecell_data *clk_data)
+{
+	struct clk_hw **hws = clk_data->hws;
+	int ret, i;
+
+	for (i = 0; i < ARRAY_SIZE(mt7621_fixed_clks); i++) {
+		struct mt7621_fixed_clk *sclk = &mt7621_fixed_clks[i];
+
+		sclk->hw = clk_hw_register_fixed_rate(dev, sclk->name,
+						      sclk->parent_name, 0,
+						      sclk->rate);
+		if (IS_ERR(sclk->hw)) {
+			dev_err(dev, "Couldn't register clock %s\n", sclk->name);
+			ret = PTR_ERR(sclk->hw);
+			goto err_clk_unreg;
+		}
+
+		hws[sclk->idx] = sclk->hw;
+	}
+
+	return 0;
+
+err_clk_unreg:
+	while (--i >= 0) {
+		struct mt7621_fixed_clk *sclk = &mt7621_fixed_clks[i];
+
+		clk_hw_unregister_fixed_rate(sclk->hw);
+	}
+	return ret;
+}
+
+static inline struct mt7621_clk *to_mt7621_clk(struct clk_hw *hw)
+{
+	return container_of(hw, struct mt7621_clk, hw);
+}
+
+static unsigned long mt7621_xtal_recalc_rate(struct clk_hw *hw,
+					     unsigned long parent_rate)
+{
+	struct mt7621_clk *clk = to_mt7621_clk(hw);
+	struct regmap *sysc = clk->priv->sysc;
+	u32 val;
+
+	regmap_read(sysc, SYSC_REG_SYSTEM_CONFIG0, &val);
+	val = (val >> XTAL_MODE_SEL_SHIFT) & XTAL_MODE_SEL_MASK;
+
+	if (val <= 2)
+		return 20000000;
+	if (val <= 5)
+		return 40000000;
+
+	return 25000000;
+}
+
+static unsigned long mt7621_cpu_recalc_rate(struct clk_hw *hw,
+					    unsigned long xtal_clk)
+{
+	static const u32 prediv_tbl[] = { 0, 1, 2, 2 };
+	struct mt7621_clk *clk = to_mt7621_clk(hw);
+	struct regmap *sysc = clk->priv->sysc;
+	struct regmap *memc = clk->priv->memc;
+	u32 clkcfg, clk_sel, curclk, ffiv, ffrac;
+	u32 pll, prediv, fbdiv;
+	unsigned long cpu_clk;
+
+	regmap_read(sysc, SYSC_REG_CLKCFG0, &clkcfg);
+	clk_sel = (clkcfg >> CPU_CLK_SEL_SHIFT) & CPU_CLK_SEL_MASK;
+
+	regmap_read(sysc, SYSC_REG_CUR_CLK_STS, &curclk);
+	ffiv = (curclk >> CUR_CPU_FDIV_SHIFT) & CUR_CPU_FDIV_MASK;
+	ffrac = (curclk >> CUR_CPU_FFRAC_SHIFT) & CUR_CPU_FFRAC_MASK;
+
+	switch (clk_sel) {
+	case 0:
+		cpu_clk = 500000000;
+		break;
+	case 1:
+		regmap_read(memc, MEMC_REG_CPU_PLL, &pll);
+		fbdiv = (pll >> CPU_PLL_FBDIV_SHIFT) & CPU_PLL_FBDIV_MASK;
+		prediv = (pll >> CPU_PLL_PREDIV_SHIFT) & CPU_PLL_PREDIV_MASK;
+		cpu_clk = ((fbdiv + 1) * xtal_clk) >> prediv_tbl[prediv];
+		break;
+	default:
+		cpu_clk = xtal_clk;
+	}
+
+	return cpu_clk / ffiv * ffrac;
+}
+
+static unsigned long mt7621_bus_recalc_rate(struct clk_hw *hw,
+					    unsigned long parent_rate)
+{
+	return parent_rate / 4;
+}
+
+#define CLK_BASE(_name, _parent, _recalc) {				\
+	.init = &(struct clk_init_data) {				\
+		.name = _name,						\
+		.ops = &(const struct clk_ops) {			\
+			.recalc_rate = _recalc,				\
+		},							\
+		.parent_data = &(const struct clk_parent_data) {	\
+			.name = _parent,				\
+			.fw_name = _parent				\
+		},							\
+		.num_parents = _parent ? 1 : 0				\
+	},								\
+}
+
+static struct mt7621_clk mt7621_clks_base[] = {
+	{ CLK_BASE("xtal", NULL, mt7621_xtal_recalc_rate) },
+	{ CLK_BASE("cpu", "xtal", mt7621_cpu_recalc_rate) },
+	{ CLK_BASE("bus", "cpu", mt7621_bus_recalc_rate) },
+};
+
+static struct clk_hw *mt7621_clk_early[MT7621_CLK_MAX];
+
+static int mt7621_register_early_clocks(struct device_node *np,
+					struct clk_hw_onecell_data *clk_data,
+					struct mt7621_clk_priv *priv)
+{
+	struct clk_hw **hws = clk_data->hws;
+	int ret, i, j;
+
+	for (i = 0; i < ARRAY_SIZE(mt7621_clks_base); i++) {
+		struct mt7621_clk *sclk = &mt7621_clks_base[i];
+
+		sclk->priv = priv;
+		ret = of_clk_hw_register(np, &sclk->hw);
+		if (ret) {
+			pr_err("Couldn't register top clock %i\n", i);
+			goto err_clk_unreg;
+		}
+
+		hws[i] = &sclk->hw;
+		mt7621_clk_early[i] = &sclk->hw;
+	}
+
+	for (j = i; j < MT7621_CLK_MAX; j++)
+		mt7621_clk_early[j] = ERR_PTR(-EPROBE_DEFER);
+
+	return 0;
+
+err_clk_unreg:
+	while (--i >= 0) {
+		struct mt7621_clk *sclk = &mt7621_clks_base[i];
+
+		clk_hw_unregister(&sclk->hw);
+	}
+	return ret;
+}
+
+static int mt7621_prepare_enable_clocks(struct clk_hw_onecell_data *clk_data)
+{
+	int ret, i;
+
+	for (i = 0; i < MT7621_CLK_MAX; i++) {
+		ret = clk_prepare_enable(clk_data->hws[i]->clk);
+		if (ret) {
+			pr_err("failed to enable clk: %d\n", ret);
+			goto err_clk_disable;
+		}
+	}
+
+	return 0;
+
+err_clk_disable:
+	while (--i >= 0)
+		clk_disable_unprepare(clk_data->hws[i]->clk);
+	return ret;
+}
+
+static void __init mt7621_clk_init(struct device_node *node)
+{
+	struct mt7621_clk_priv *priv;
+	struct clk_hw_onecell_data *clk_data;
+	int ret, i, count;
+
+	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return;
+
+	priv->sysc = syscon_regmap_lookup_by_phandle(node, "ralink,sysctl");
+	if (IS_ERR(priv->sysc)) {
+		pr_err("Could not get sysc syscon regmap\n");
+		goto free_clk_priv;
+	}
+
+	priv->memc = syscon_regmap_lookup_by_phandle(node, "ralink,memctl");
+	if (IS_ERR(priv->memc)) {
+		pr_err("Could not get memc syscon regmap\n");
+		goto free_clk_priv;
+	}
+
+	count = ARRAY_SIZE(mt7621_clks_base) +
+		ARRAY_SIZE(mt7621_fixed_clks) + ARRAY_SIZE(mt7621_gates);
+	clk_data = kzalloc(struct_size(clk_data, hws, count), GFP_KERNEL);
+	if (!clk_data)
+		goto free_clk_priv;
+
+	ret = mt7621_register_early_clocks(node, clk_data, priv);
+	if (ret) {
+		pr_err("Couldn't register top clocks\n");
+		goto free_clk_data;
+	}
+
+	clk_data->num = count;
+
+	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
+	if (ret) {
+		pr_err("Couldn't add clk hw provider\n");
+		goto unreg_clk_top;
+	}
+
+	return;
+
+unreg_clk_top:
+	for (i = 0; i < ARRAY_SIZE(mt7621_clks_base); i++) {
+		struct mt7621_clk *sclk = &mt7621_clks_base[i];
+
+		clk_hw_unregister(&sclk->hw);
+	}
+
+free_clk_data:
+	kfree(clk_data);
+
+free_clk_priv:
+	kfree(priv);
+}
+CLK_OF_DECLARE_DRIVER(mt7621_clk, "mediatek,mt7621-clk", mt7621_clk_init);
+
+static int mt7621_clk_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct clk_hw_onecell_data *clk_data;
+	struct device *dev = &pdev->dev;
+	struct mt7621_clk_priv *priv;
+	int ret, i, count;
+
+	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->sysc = syscon_regmap_lookup_by_phandle(np, "ralink,sysctl");
+	if (IS_ERR(priv->sysc)) {
+		ret = PTR_ERR(priv->sysc);
+		dev_err(dev, "Could not get sysc syscon regmap\n");
+		goto free_clk_priv;
+	}
+
+	priv->memc = syscon_regmap_lookup_by_phandle(np, "ralink,memctl");
+	if (IS_ERR(priv->memc)) {
+		ret = PTR_ERR(priv->memc);
+		dev_err(dev, "Could not get memc syscon regmap\n");
+		goto free_clk_priv;
+	}
+
+	count = ARRAY_SIZE(mt7621_clks_base) +
+		ARRAY_SIZE(mt7621_fixed_clks) + ARRAY_SIZE(mt7621_gates);
+	clk_data = kzalloc(struct_size(clk_data, hws, count), GFP_KERNEL);
+	if (!clk_data) {
+		ret = -ENOMEM;
+		goto free_clk_priv;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(mt7621_clks_base); i++)
+		clk_data->hws[i] = mt7621_clk_early[i];
+
+	ret = mt7621_register_fixed_clocks(dev, clk_data);
+	if (ret) {
+		dev_err(dev, "Couldn't register fixed clocks\n");
+		goto free_clk_data;
+	}
+
+	ret = mt7621_register_gates(dev, clk_data, priv);
+	if (ret) {
+		dev_err(dev, "Couldn't register fixed clock gates\n");
+		goto unreg_clk_fixed;
+	}
+
+	clk_data->num = count;
+
+	ret = mt7621_prepare_enable_clocks(clk_data);
+	if (ret) {
+		dev_err(dev, "Couldn't register fixed clock gates\n");
+		goto unreg_clk_gates;
+	}
+
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
+	if (ret) {
+		dev_err(dev, "Couldn't add clk hw provider\n");
+		goto disable_clks;
+	}
+
+	return 0;
+
+disable_clks:
+	for (i = 0; i < MT7621_CLK_MAX; i++)
+		clk_disable_unprepare(clk_data->hws[i]->clk);
+
+unreg_clk_gates:
+	for (i = 0; i < ARRAY_SIZE(mt7621_gates); i++) {
+		struct mt7621_gate *sclk = &mt7621_gates[i];
+
+		clk_hw_unregister(&sclk->hw);
+	}
+
+unreg_clk_fixed:
+	for (i = 0; i < ARRAY_SIZE(mt7621_fixed_clks); i++) {
+		struct mt7621_fixed_clk *sclk = &mt7621_fixed_clks[i];
+
+		clk_hw_unregister_fixed_rate(sclk->hw);
+	}
+
+free_clk_data:
+	kfree(clk_data);
+
+free_clk_priv:
+	kfree(priv);
+
+	return ret;
+}
+
+static const struct of_device_id mt7621_clk_of_match[] = {
+	{ .compatible = "mediatek,mt7621-clk" },
+	{},
+};
+
+static struct platform_driver mt7621_clk_driver = {
+	.probe = mt7621_clk_probe,
+	.driver = {
+		.name = "mt7621-clk",
+		.of_match_table = mt7621_clk_of_match,
+	},
+};
+builtin_platform_driver(mt7621_clk_driver);
-- 
2.25.1

