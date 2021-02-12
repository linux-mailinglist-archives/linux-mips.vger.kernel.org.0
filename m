Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 534EF319AC8
	for <lists+linux-mips@lfdr.de>; Fri, 12 Feb 2021 08:47:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229959AbhBLHoe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 12 Feb 2021 02:44:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230013AbhBLHoQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 12 Feb 2021 02:44:16 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 518A9C061788;
        Thu, 11 Feb 2021 23:43:35 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id l17so8851wmq.2;
        Thu, 11 Feb 2021 23:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nn0dzcebQ2+UBipflA0D5J5pfAw7/j5245nM+TMJxTo=;
        b=VFD1/NzOZU6Ppl0yOds+vvVbDz5EASnTxSwLXki2xD2TTRs/8bHiVwtzKSORTp0gCg
         4f7O7GYWQUibY8sevMVmBIMs4NcPbO6mHljoOrI5/XID2q+dbS5K6dU68py3FxBReLgE
         JZVJg2jglSzE9DvpgcNv2N4qn1hXqAd6B6WJGcRGmW8Gt3eYH94CJNZ69oV4T06WJL3A
         x4GSay1adBGEuL0eXrSiiPaxbpaQyWpIloGOJECactpUWDN4tNKEHCgoo2ot3mp7qTXa
         JJd+doiy4Bfv9ANneutDggK3raWR1Z0637S0WrCPRr3wxaBYPr4h+S7XGKsA83kUmc6k
         0q2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nn0dzcebQ2+UBipflA0D5J5pfAw7/j5245nM+TMJxTo=;
        b=Mm7E/GMBLJsgm5N7aJ5nwdWNVW/HLa9AoiYGhO1VHyg/2v7/mRp6ahsr6IZdurBbps
         /bEKoU3Wztf3ljIhPu1tIeVFpKgjwDYyMIBU1UQ0E7IMdnhtPcROQuSk+8ZPYuVesBve
         oVmnlrq+s8LGctPHM3Yy2bmKo+ejsg6sm2tpzcLktAnXqjUFynhdHRMW3SowzqLaCBpS
         pD5vWlB6kcb1XE6EswQHKFn8CeNlmifxDGgy3S5IOLT2eXNzMSBSSudGcrpV14GoQkUD
         BTURdRK9Dau82ymzAdQ/7DO5KADfSgE2G/AnCtIV9qLTD9lY568yg+M300sJNHugkfaE
         55Yw==
X-Gm-Message-State: AOAM530YHnBComKySweTBPdC083yvbSX6J1K9Q5hix+1/zAue7WeDm4S
        BjLFPOQb3QXNhXnY5DkkcPI=
X-Google-Smtp-Source: ABdhPJyzBzCuuUD6dPAFLZjMfWCCpXMCchruoR75RFGQd9jHl8AKZqH6AuP3HmF0frQjqlj/fS0BBA==
X-Received: by 2002:a1c:28c1:: with SMTP id o184mr1396169wmo.183.1613115814019;
        Thu, 11 Feb 2021 23:43:34 -0800 (PST)
Received: from localhost.localdomain (67.red-83-54-30.dynamicip.rima-tde.net. [83.54.30.67])
        by smtp.gmail.com with ESMTPSA id a17sm9663858wrx.63.2021.02.11.23.43.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Feb 2021 23:43:33 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     sboyd@kernel.org
Cc:     robh+dt@kernel.org, john@phrozen.org, tsbogend@alpha.franken.de,
        gregkh@linuxfoundation.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org
Subject: [RESEND PATCH v5 3/6] clk: ralink: add clock driver for mt7621 SoC
Date:   Fri, 12 Feb 2021 08:43:27 +0100
Message-Id: <20210212074330.4650-4-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210212074330.4650-1-sergio.paracuellos@gmail.com>
References: <20210212074330.4650-1-sergio.paracuellos@gmail.com>
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
 drivers/clk/ralink/Kconfig      |  14 ++
 drivers/clk/ralink/Makefile     |   2 +
 drivers/clk/ralink/clk-mt7621.c | 411 ++++++++++++++++++++++++++++++++
 5 files changed, 429 insertions(+)
 create mode 100644 drivers/clk/ralink/Kconfig
 create mode 100644 drivers/clk/ralink/Makefile
 create mode 100644 drivers/clk/ralink/clk-mt7621.c

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 85856cff506c..7c6ad73c985c 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -381,6 +381,7 @@ source "drivers/clk/mediatek/Kconfig"
 source "drivers/clk/meson/Kconfig"
 source "drivers/clk/mvebu/Kconfig"
 source "drivers/clk/qcom/Kconfig"
+source "drivers/clk/ralink/Kconfig"
 source "drivers/clk/renesas/Kconfig"
 source "drivers/clk/rockchip/Kconfig"
 source "drivers/clk/samsung/Kconfig"
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index dbdc590e7de3..29b957d83c4e 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -101,6 +101,7 @@ obj-$(CONFIG_COMMON_CLK_NXP)		+= nxp/
 obj-$(CONFIG_MACH_PISTACHIO)		+= pistachio/
 obj-$(CONFIG_COMMON_CLK_PXA)		+= pxa/
 obj-$(CONFIG_COMMON_CLK_QCOM)		+= qcom/
+obj-y					+= ralink/
 obj-y					+= renesas/
 obj-$(CONFIG_ARCH_ROCKCHIP)		+= rockchip/
 obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
diff --git a/drivers/clk/ralink/Kconfig b/drivers/clk/ralink/Kconfig
new file mode 100644
index 000000000000..f1de548ed781
--- /dev/null
+++ b/drivers/clk/ralink/Kconfig
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# MediaTek Mt7621 Clock Driver
+#
+menu "Clock driver for Mediatek mt7621 SoC"
+	depends on SOC_MT7621
+
+config CLK_MT7621
+	bool "Clock driver for MediaTek MT7621"
+	depends on SOC_MT7621
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
index 000000000000..52aa98318abf
--- /dev/null
+++ b/drivers/clk/ralink/clk-mt7621.c
@@ -0,0 +1,411 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Mediatek MT7621 Clock Driver
+ * Author: Sergio Paracuellos <sergio.paracuellos@gmail.com>
+ */
+
+#include <linux/bitops.h>
+#include <linux/clk-provider.h>
+#include <linux/clk.h>
+#include <linux/slab.h>
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
+struct mt7621_clk {
+	struct clk_hw hw;
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
+
+	rt_sysc_m32(0, BIT(clk_gate->bit_idx), SYSC_REG_CLKCFG1);
+	return 0;
+}
+
+static void mt7621_gate_disable(struct clk_hw *hw)
+{
+	struct mt7621_gate *clk_gate = to_mt7621_gate(hw);
+
+	rt_sysc_m32(BIT(clk_gate->bit_idx), 0, SYSC_REG_CLKCFG1);
+}
+
+static int mt7621_gate_is_enabled(struct clk_hw *hw)
+{
+	struct mt7621_gate *clk_gate = to_mt7621_gate(hw);
+	u32 val = rt_sysc_r32(SYSC_REG_CLKCFG1);
+
+	return !!(val & BIT(clk_gate->bit_idx));
+}
+
+static const struct clk_ops mt7621_gate_ops = {
+	.enable = mt7621_gate_enable,
+	.disable = mt7621_gate_disable,
+	.is_enabled = mt7621_gate_is_enabled,
+};
+
+static int mt7621_gate_ops_init(struct device_node *np,
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
+	return of_clk_hw_register(np, &sclk->hw);
+}
+
+static int mt7621_register_gates(struct device_node *np,
+				 struct clk_hw_onecell_data *clk_data)
+{
+	struct clk_hw **hws = clk_data->hws;
+	int ret, i;
+
+	for (i = 0; i < ARRAY_SIZE(mt7621_gates); i++) {
+		struct mt7621_gate *sclk = &mt7621_gates[i];
+
+		ret = mt7621_gate_ops_init(np, sclk);
+		if (ret) {
+			pr_err("Couldn't register clock %s\n", sclk->name);
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
+static int mt7621_register_fixed_clocks(struct clk_hw_onecell_data *clk_data)
+{
+	struct clk_hw **hws = clk_data->hws;
+	int ret, i;
+
+	for (i = 0; i < ARRAY_SIZE(mt7621_fixed_clks); i++) {
+		struct mt7621_fixed_clk *sclk = &mt7621_fixed_clks[i];
+
+		sclk->hw = clk_hw_register_fixed_rate(NULL, sclk->name,
+						      sclk->parent_name, 0,
+						      sclk->rate);
+		if (IS_ERR(sclk->hw)) {
+			pr_err("Couldn't register clock %s\n", sclk->name);
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
+static unsigned long mt7621_xtal_recalc_rate(struct clk_hw *hw,
+					     unsigned long parent_rate)
+{
+	u32 val;
+
+	val = rt_sysc_r32(SYSC_REG_SYSTEM_CONFIG0);
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
+	u32 clkcfg, clk_sel, curclk, ffiv, ffrac;
+	u32 pll, prediv, fbdiv;
+	unsigned long cpu_clk;
+
+	clkcfg = rt_sysc_r32(SYSC_REG_CLKCFG0);
+	clk_sel = (clkcfg >> CPU_CLK_SEL_SHIFT) & CPU_CLK_SEL_MASK;
+
+	curclk = rt_sysc_r32(SYSC_REG_CUR_CLK_STS);
+	ffiv = (curclk >> CUR_CPU_FDIV_SHIFT) & CUR_CPU_FDIV_MASK;
+	ffrac = (curclk >> CUR_CPU_FFRAC_SHIFT) & CUR_CPU_FFRAC_MASK;
+
+	switch (clk_sel) {
+	case 0:
+		cpu_clk = 500000000;
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
+static int mt7621_register_top_clocks(struct device_node *np,
+				      struct clk_hw_onecell_data *clk_data)
+{
+	struct clk_hw **hws = clk_data->hws;
+	int ret, i;
+
+	for (i = 0; i < ARRAY_SIZE(mt7621_clks_base); i++) {
+		struct mt7621_clk *sclk = &mt7621_clks_base[i];
+
+		ret = of_clk_hw_register(np, &sclk->hw);
+		if (ret) {
+			pr_err("Couldn't register top clock %i\n", i);
+			goto err_clk_unreg;
+		}
+
+		hws[i] = &sclk->hw;
+	}
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
+	struct clk_hw_onecell_data *clk_data;
+	int ret, i, count;
+
+	count = ARRAY_SIZE(mt7621_clks_base) +
+		ARRAY_SIZE(mt7621_fixed_clks) + ARRAY_SIZE(mt7621_gates);
+	clk_data = kzalloc(struct_size(clk_data, hws, count), GFP_KERNEL);
+	if (!clk_data)
+		return;
+
+	ret = mt7621_register_top_clocks(node, clk_data);
+	if (ret) {
+		pr_err("Couldn't register top clocks\n");
+		goto free_clk_data;
+	}
+
+	ret = mt7621_register_fixed_clocks(clk_data);
+	if (ret) {
+		pr_err("Couldn't register fixed clocks\n");
+		goto unreg_clk_top;
+	}
+
+	ret = mt7621_register_gates(node, clk_data);
+	if (ret) {
+		pr_err("Couldn't register fixed clock gates\n");
+		goto unreg_clk_fixed;
+	}
+
+	clk_data->num = count;
+
+	ret = mt7621_prepare_enable_clocks(clk_data);
+	if (ret) {
+		pr_err("Couldn't register fixed clock gates\n");
+		goto unreg_clk_gates;
+	}
+
+	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
+	if (ret) {
+		pr_err("Couldn't add clk hw provider\n");
+		goto disable_clks;
+	}
+
+	return;
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
+unreg_clk_top:
+	for (i = 0; i < ARRAY_SIZE(mt7621_clks_base); i++) {
+		struct mt7621_clk *sclk = &mt7621_clks_base[i];
+
+		clk_hw_unregister(&sclk->hw);
+	}
+
+free_clk_data:
+	kfree(clk_data);
+}
+
+CLK_OF_DECLARE(mt7621_clk, "mediatek,mt7621-clk", mt7621_clk_init);
-- 
2.25.1

