Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53E072B17DF
	for <lists+linux-mips@lfdr.de>; Fri, 13 Nov 2020 10:11:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726325AbgKMJLE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 13 Nov 2020 04:11:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbgKMJKz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 13 Nov 2020 04:10:55 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7B40C0613D1;
        Fri, 13 Nov 2020 01:10:54 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id c17so8888166wrc.11;
        Fri, 13 Nov 2020 01:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V+IoNKPYGOASWB9WOsyfR6qJQOb4xRkLNGfRB8aAq2s=;
        b=FjCes+ETzejazJkLpu3TMEZBieagdiVCob83CQ/JkwSWxIQyQWnHesRZOtCPo2uFLu
         r6sOPpuG/I7WLFM/ZD4QbuKS+PAm+616jtgnRZV6OQWh9i4OaBRY4VIeMKocndlvguYM
         x5jcZP7ZoyAxcIQ/L09Biu0AJ16iYVn8ouj5maDPFZ4dZGRv7rFpTEIXGMHm3SnIP1Hm
         H9BBH0XCDYzBeDSCVqraf8iQgyDdbL38OuVj9DkeYVFcfMLtJ5lVFT2nWj/+zCGPyOhj
         W12ISptUk8R9Werc528PjUSb3HLXiLv9ryGZU1Zd672DJyU1potJ+rfMGlr9xkc112rX
         2I6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V+IoNKPYGOASWB9WOsyfR6qJQOb4xRkLNGfRB8aAq2s=;
        b=K7+zMystSvuNAzNvm7Vd0GLn9Ug6MkpwNBBmZNzXE9uOXs7+WH7fkMz1ggW2GSs+Ay
         9mxWDOCJCJNj6t3ghDoVb3WcIwX30KGeXqHXea+zeIkzaXxPNBCSmEI2gahTfoJ4qeh4
         Kz4ESuzdFTBK/0O5akeW+zgynptuCHXEvnAu43Egh2114i/WuoTVPC+F/tkalDDlmSbx
         aIw254jFqQG7XTTTPMQC2YE1Z4XBEUT+IpWfwzmgA5vJlyaSxG/NA6gQWNzMrq/Nz/7k
         2FCbEUTxUCpaYo8oj3vKdKw5/APm7NWJtB6RXcsV61qyERhtyveGnJ7LewMQhc6cP76k
         vx4w==
X-Gm-Message-State: AOAM533UXWlQ7ZQl6LbgzTxfKBdtE4e8fXmlhMUlDlxZUz9C/B0tt1CJ
        h4vCjVfJp2Sef1CNbK6TtyU=
X-Google-Smtp-Source: ABdhPJy1ttVtjIgmPfGTBHH8g685Sfv+X1rmBqJlredpz8awjyoVvUjaVeI5+A2PudLsEZ/PTIy98A==
X-Received: by 2002:a5d:5146:: with SMTP id u6mr2262993wrt.66.1605258653381;
        Fri, 13 Nov 2020 01:10:53 -0800 (PST)
Received: from localhost.localdomain (245.red-79-158-78.dynamicip.rima-tde.net. [79.158.78.245])
        by smtp.gmail.com with ESMTPSA id 15sm9266183wmg.1.2020.11.13.01.10.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2020 01:10:52 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     mturquette@baylibre.com
Cc:     sboyd@kernel.org, robh+dt@kernel.org, tsbogend@alpha.franken.de,
        john@phrozen.org, gregkh@linuxfoundation.org, gch981213@gmail.com,
        hackpascal@gmail.com, jiaxun.yang@flygoat.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org, neil@brown.name
Subject: [PATCH v2 3/5] clk: ralink: add clock driver for mt7621 SoC
Date:   Fri, 13 Nov 2020 10:10:44 +0100
Message-Id: <20201113091046.30964-4-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113091046.30964-1-sergio.paracuellos@gmail.com>
References: <20201113091046.30964-1-sergio.paracuellos@gmail.com>
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
another frequences which are used in some drivers (uart, sd...).
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
 drivers/clk/ralink/Kconfig      |  14 ++
 drivers/clk/ralink/Makefile     |   2 +
 drivers/clk/ralink/clk-mt7621.c | 345 ++++++++++++++++++++++++++++++++
 5 files changed, 363 insertions(+)
 create mode 100644 drivers/clk/ralink/Kconfig
 create mode 100644 drivers/clk/ralink/Makefile
 create mode 100644 drivers/clk/ralink/clk-mt7621.c

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index c715d4681a0b..5f94c4329033 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -372,6 +372,7 @@ source "drivers/clk/mediatek/Kconfig"
 source "drivers/clk/meson/Kconfig"
 source "drivers/clk/mvebu/Kconfig"
 source "drivers/clk/qcom/Kconfig"
+source "drivers/clk/ralink/Kconfig"
 source "drivers/clk/renesas/Kconfig"
 source "drivers/clk/rockchip/Kconfig"
 source "drivers/clk/samsung/Kconfig"
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index da8fcf147eb1..6578e167b047 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -100,6 +100,7 @@ obj-$(CONFIG_COMMON_CLK_NXP)		+= nxp/
 obj-$(CONFIG_MACH_PISTACHIO)		+= pistachio/
 obj-$(CONFIG_COMMON_CLK_PXA)		+= pxa/
 obj-$(CONFIG_COMMON_CLK_QCOM)		+= qcom/
+obj-y					+= ralink/
 obj-y					+= renesas/
 obj-$(CONFIG_ARCH_ROCKCHIP)		+= rockchip/
 obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
diff --git a/drivers/clk/ralink/Kconfig b/drivers/clk/ralink/Kconfig
new file mode 100644
index 000000000000..7e8697327e0c
--- /dev/null
+++ b/drivers/clk/ralink/Kconfig
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# MediaTek Mt7621 Clock Driver
+#
+menu "Clock driver for mediatek mt7621 SoC"
+	depends on SOC_MT7621 || COMPILE_TEST
+
+config CLK_MT7621
+	bool "Clock driver for MediaTek MT7621"
+	depends on SOC_MT7621 || COMPILE_TEST
+	default SOC_MT7621
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
index 000000000000..03ad27048053
--- /dev/null
+++ b/drivers/clk/ralink/clk-mt7621.c
@@ -0,0 +1,345 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Mediatek MT7621 Clock Driver
+ * Author: Sergio Paracuellos <sergio.paracuellos@gmail.com>
+ */
+
+#include <linux/bitops.h>
+#include <linux/clk-provider.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/regmap.h>
+#include <asm/mach-ralink/ralink_regs.h>
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
+#define MHZ(x) ((x) * 1000 * 1000)
+
+struct mt7621_clk_provider {
+	struct device_node *node;
+	struct regmap *syscon_regmap;
+	struct clk_hw_onecell_data *clk_data;
+};
+
+struct mt7621_clk {
+	struct mt7621_clk_provider *clk_prov;
+	struct clk_hw hw;
+};
+
+struct mt7621_fixed_clk {
+	u8 idx;
+	const char *name;
+	const char *parent_name;
+	struct mt7621_clk_provider *clk_prov;
+	unsigned long rate;
+	struct clk_hw *hw;
+};
+
+struct mt7621_gate {
+	u8 idx;
+	const char *name;
+	const char *parent_name;
+	struct mt7621_clk_provider *clk_prov;
+	u32 bit_idx;
+	struct clk_hw hw;
+};
+
+#define GATE(_id, _name, _pname, _shift)	\
+	{					\
+		.idx		= _id,		\
+		.name		= _name,	\
+		.parent_name	= _pname,	\
+		.clk_prov	= NULL,		\
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
+	struct regmap *scon = clk_gate->clk_prov->syscon_regmap;
+
+	return regmap_update_bits(scon, SYSC_REG_CLKCFG1,
+				  clk_gate->bit_idx, clk_gate->bit_idx);
+}
+
+static void mt7621_gate_disable(struct clk_hw *hw)
+{
+	struct mt7621_gate *clk_gate = to_mt7621_gate(hw);
+	struct regmap *scon = clk_gate->clk_prov->syscon_regmap;
+
+	regmap_update_bits(scon, SYSC_REG_CLKCFG1, clk_gate->bit_idx, 0);
+}
+
+static int mt7621_gate_is_enabled(struct clk_hw *hw)
+{
+	struct mt7621_gate *clk_gate = to_mt7621_gate(hw);
+	struct regmap *scon = clk_gate->clk_prov->syscon_regmap;
+	unsigned int val;
+
+	if (regmap_read(scon, SYSC_REG_CLKCFG1, &val))
+		return 0;
+
+	return val & clk_gate->bit_idx;
+}
+
+static const struct clk_ops mt7621_gate_ops = {
+	.enable = mt7621_gate_enable,
+	.disable = mt7621_gate_disable,
+	.is_enabled = mt7621_gate_is_enabled,
+};
+
+static void mt7621_gate_ops_init(struct device_node *np,
+				 struct mt7621_gate *sclk)
+{
+	struct clk_init_data init = {
+		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+		.num_parents = 1,
+		.parent_names = &sclk->parent_name,
+		.ops = &mt7621_gate_ops,
+		.name = sclk->name,
+	};
+
+	sclk->hw.init = &init;
+	of_clk_hw_register(np, &sclk->hw);
+}
+
+static void mt7621_register_gates(struct mt7621_clk_provider *clk_prov)
+{
+	struct clk_hw_onecell_data **clk_data = &clk_prov->clk_data;
+	struct clk_hw **hws = (*clk_data)->hws;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(mt7621_gates); i++) {
+		struct mt7621_gate *sclk = &mt7621_gates[i];
+
+		sclk->clk_prov = clk_prov;
+		mt7621_gate_ops_init(clk_prov->node, sclk);
+		hws[sclk->idx] = &sclk->hw;
+		(*clk_data)->num++;
+	}
+}
+
+#define FIXED(_id, _name, _pname, _rate)        \
+	{					\
+		.idx		= _id,		\
+		.name		= _name,	\
+		.parent_name	= _pname,	\
+		.clk_prov	= NULL,		\
+		.rate		= _rate		\
+	}
+
+static struct mt7621_fixed_clk mt7621_fixed_clks[] = {
+	FIXED(MT7621_CLK_50M, "50m", "xtal", MHZ(50)),
+	FIXED(MT7621_CLK_125M, "125m", "xtal", MHZ(125)),
+	FIXED(MT7621_CLK_150M, "150m", "xtal", MHZ(150)),
+	FIXED(MT7621_CLK_250M, "250m", "xtal", MHZ(250)),
+	FIXED(MT7621_CLK_270M, "270m", "xtal", MHZ(270)),
+};
+
+static void mt7621_register_fixed_clocks(struct mt7621_clk_provider *clk_prov)
+{
+	struct clk_hw_onecell_data **clk_data = &clk_prov->clk_data;
+	struct clk_hw **hws = (*clk_data)->hws;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(mt7621_fixed_clks); i++) {
+		struct mt7621_fixed_clk *sclk = &mt7621_fixed_clks[i];
+
+		sclk->clk_prov = clk_prov;
+		sclk->hw = clk_hw_register_fixed_rate(NULL, sclk->name,
+						      sclk->parent_name, 0,
+						      sclk->rate);
+		hws[sclk->idx] = sclk->hw;
+		(*clk_data)->num++;
+	}
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
+	struct regmap *scon = clk->clk_prov->syscon_regmap;
+	u32 val;
+
+	regmap_read(scon, SYSC_REG_SYSTEM_CONFIG0, &val);
+	val = (val >> XTAL_MODE_SEL_SHIFT) & XTAL_MODE_SEL_MASK;
+
+	if (val <= 2)
+		return MHZ(20);
+	else if (val <= 5)
+		return MHZ(40);
+
+	return MHZ(25);
+}
+
+static unsigned long mt7621_cpu_recalc_rate(struct clk_hw *hw,
+					    unsigned long xtal_clk)
+{
+	static const u32 prediv_tbl[] = { 0, 1, 2, 2 };
+	struct mt7621_clk *clk = to_mt7621_clk(hw);
+	struct regmap *scon = clk->clk_prov->syscon_regmap;
+	u32 clkcfg, clk_sel, curclk, ffiv, ffrac;
+	u32 pll, prediv, fbdiv;
+	unsigned long cpu_clk;
+
+	regmap_read(scon, SYSC_REG_CLKCFG0, &clkcfg);
+	clk_sel = (clkcfg >> CPU_CLK_SEL_SHIFT) & CPU_CLK_SEL_MASK;
+
+	regmap_read(scon, SYSC_REG_CUR_CLK_STS, &curclk);
+	ffiv = (curclk >> CUR_CPU_FDIV_SHIFT) & CUR_CPU_FDIV_MASK;
+	ffrac = (curclk >> CUR_CPU_FFRAC_SHIFT) & CUR_CPU_FFRAC_MASK;
+
+	switch (clk_sel) {
+	case 0:
+		cpu_clk = MHZ(500);
+		break;
+	case 1:
+		pll = rt_memc_r32(MEMC_REG_CPU_PLL);
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
+		.parent_names = (const char *const[]) { _parent },	\
+		.num_parents = _parent ? 1 : 0				\
+	},								\
+}
+
+static struct mt7621_clk mt7621_clks_base[] = {
+	{ NULL, CLK_BASE("xtal", NULL, mt7621_xtal_recalc_rate) },
+	{ NULL, CLK_BASE("cpu", "xtal", mt7621_cpu_recalc_rate) },
+	{ NULL, CLK_BASE("bus", "cpu", mt7621_bus_recalc_rate) },
+};
+
+static void mt7621_register_top_clocks(struct mt7621_clk_provider *clk_prov)
+{
+	struct clk_hw_onecell_data **clk_data = &clk_prov->clk_data;
+	struct clk_hw **hws = (*clk_data)->hws;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(mt7621_clks_base); i++) {
+		struct mt7621_clk *sclk = &mt7621_clks_base[i];
+
+		sclk->clk_prov = clk_prov;
+		of_clk_hw_register(clk_prov->node, &sclk->hw);
+		hws[i] = &sclk->hw;
+		(*clk_data)->num++;
+	}
+}
+
+static void __init mt7621_clk_init(struct device_node *node)
+{
+	struct mt7621_clk_provider *clk_prov;
+	struct clk_hw_onecell_data **clk_data;
+	int count;
+
+	clk_prov = kzalloc(sizeof(*clk_prov), GFP_KERNEL);
+	if (!clk_prov)
+		return;
+
+	clk_prov->syscon_regmap = syscon_regmap_lookup_by_phandle(node, "ralink,sysctl");
+	if (IS_ERR(clk_prov->syscon_regmap)) {
+		pr_err("Could not get syscon regmap\n");
+		goto free_clk_prov;
+	}
+
+	clk_prov->node = node;
+
+	clk_data = &clk_prov->clk_data;
+	count = ARRAY_SIZE(mt7621_clks_base) + ARRAY_SIZE(mt7621_gates);
+	*clk_data = kzalloc(struct_size(*clk_data, hws, count), GFP_KERNEL);
+	if (!*clk_data)
+		goto free_clk_prov;
+
+	mt7621_register_top_clocks(clk_prov);
+	mt7621_register_fixed_clocks(clk_prov);
+	mt7621_register_gates(clk_prov);
+
+	of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_prov->clk_data);
+
+	return;
+
+free_clk_prov:
+	kfree(clk_prov);
+}
+
+CLK_OF_DECLARE(mt7621_clk, "mediatek,mt7621-clk", mt7621_clk_init);
+
+MODULE_AUTHOR("Sergio Paracuellos <sergio.paracuellos@gmail.com>");
+MODULE_DESCRIPTION("Mediatek Mt7621 clock driver");
+MODULE_LICENSE("GPL v2");
-- 
2.25.1

