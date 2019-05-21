Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECEFD252ED
	for <lists+linux-mips@lfdr.de>; Tue, 21 May 2019 16:52:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728706AbfEUOwD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 May 2019 10:52:03 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:40886 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728397AbfEUOwD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 21 May 2019 10:52:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1558450320; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+0BypxL7vIjXG1FSleVkCp+CSyprSWjWctMfxDl2ijg=;
        b=AON5OBRVT6MlB7Y0FYjRxtXrEi19IclNgLlK+g4S4meOhEp3c1cOnyFwgj3QExpYm68bDM
        p7x1Mn74VWTDI1L7nrYrhAOjq38Q3ythM8W9WIYGOlwAPfq1akczIuPbhEleMmg1rLFSZd
        NaQl8m0TuyMB25XjhhX2PlskaH3QBlI=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Lee Jones <lee.jones@linaro.org>
Cc:     Mathieu Malaterre <malat@debian.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-clk@vger.kernel.org, od@zcrc.me,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v12 05/13] clk: ingenic: Add driver for the TCU clocks
Date:   Tue, 21 May 2019 16:51:33 +0200
Message-Id: <20190521145141.9813-6-paul@crapouillou.net>
In-Reply-To: <20190521145141.9813-1-paul@crapouillou.net>
References: <20190521145141.9813-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add driver to support the clocks provided by the Timer/Counter Unit
(TCU) of the JZ47xx SoCs from Ingenic.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v12: New patch

 drivers/clk/ingenic/Kconfig  |  11 +-
 drivers/clk/ingenic/Makefile |   1 +
 drivers/clk/ingenic/tcu.c    | 458 +++++++++++++++++++++++++++++++++++
 3 files changed, 469 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/ingenic/tcu.c

diff --git a/drivers/clk/ingenic/Kconfig b/drivers/clk/ingenic/Kconfig
index 34dc0da79c39..434893133eb4 100644
--- a/drivers/clk/ingenic/Kconfig
+++ b/drivers/clk/ingenic/Kconfig
@@ -1,4 +1,4 @@
-menu "Ingenic JZ47xx CGU drivers"
+menu "Ingenic JZ47xx drivers"
 	depends on MIPS
 
 config INGENIC_CGU_COMMON
@@ -44,4 +44,13 @@ config INGENIC_CGU_JZ4780
 
 	  If building for a JZ4780 SoC, you want to say Y here.
 
+config INGENIC_TCU_CLK
+	bool "Ingenic JZ47xx TCU clocks driver"
+	default MACH_INGENIC
+	depends on COMMON_CLK
+	select INGENIC_TCU
+	help
+	  Support the clocks of the Timer/Counter Unit (TCU) of the Ingenic
+	  JZ47xx SoCs.
+
 endmenu
diff --git a/drivers/clk/ingenic/Makefile b/drivers/clk/ingenic/Makefile
index 00a79b2fba10..9ef8551926b7 100644
--- a/drivers/clk/ingenic/Makefile
+++ b/drivers/clk/ingenic/Makefile
@@ -3,3 +3,4 @@ obj-$(CONFIG_INGENIC_CGU_JZ4740)	+= jz4740-cgu.o
 obj-$(CONFIG_INGENIC_CGU_JZ4725B)	+= jz4725b-cgu.o
 obj-$(CONFIG_INGENIC_CGU_JZ4770)	+= jz4770-cgu.o
 obj-$(CONFIG_INGENIC_CGU_JZ4780)	+= jz4780-cgu.o
+obj-$(CONFIG_INGENIC_TCU_CLK)		+= tcu.o
diff --git a/drivers/clk/ingenic/tcu.c b/drivers/clk/ingenic/tcu.c
new file mode 100644
index 000000000000..7249225a6994
--- /dev/null
+++ b/drivers/clk/ingenic/tcu.c
@@ -0,0 +1,458 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * JZ47xx SoCs TCU clocks driver
+ * Copyright (C) 2019 Paul Cercueil <paul@crapouillou.net>
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/clkdev.h>
+#include <linux/clockchips.h>
+#include <linux/mfd/ingenic-tcu.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/ingenic,tcu.h>
+
+/* 8 channels max + watchdog + OST */
+#define TCU_CLK_COUNT	10
+
+#define TCU_ERR(...) pr_crit("ingenic-tcu-clk: " __VA_ARGS__)
+
+enum tcu_clk_parent {
+	TCU_PARENT_PCLK,
+	TCU_PARENT_RTC,
+	TCU_PARENT_EXT,
+};
+
+struct ingenic_soc_info {
+	unsigned int num_channels;
+	bool has_ost;
+	bool has_tcu_clk;
+};
+
+struct ingenic_tcu_clk_info {
+	struct clk_init_data init_data;
+	u8 gate_bit;
+	u8 tcsr_reg;
+};
+
+struct ingenic_tcu_clk {
+	struct clk_hw hw;
+	unsigned int idx;
+	struct ingenic_tcu *tcu;
+	const struct ingenic_tcu_clk_info *info;
+};
+
+struct ingenic_tcu {
+	const struct ingenic_soc_info *soc_info;
+	struct regmap *map;
+	struct clk *clk;
+
+	struct clk_hw_onecell_data *clocks;
+};
+
+static inline struct ingenic_tcu_clk *to_tcu_clk(struct clk_hw *hw)
+{
+	return container_of(hw, struct ingenic_tcu_clk, hw);
+}
+
+static int ingenic_tcu_enable(struct clk_hw *hw)
+{
+	struct ingenic_tcu_clk *tcu_clk = to_tcu_clk(hw);
+	const struct ingenic_tcu_clk_info *info = tcu_clk->info;
+	struct ingenic_tcu *tcu = tcu_clk->tcu;
+	int ret;
+
+	if (tcu->clk) {
+		ret = clk_prepare_enable(tcu->clk);
+		if (ret)
+			return ret;
+	}
+
+	regmap_write(tcu->map, TCU_REG_TSCR, BIT(info->gate_bit));
+
+	return 0;
+}
+
+static void ingenic_tcu_disable(struct clk_hw *hw)
+{
+	struct ingenic_tcu_clk *tcu_clk = to_tcu_clk(hw);
+	const struct ingenic_tcu_clk_info *info = tcu_clk->info;
+	struct ingenic_tcu *tcu = tcu_clk->tcu;
+
+	regmap_write(tcu->map, TCU_REG_TSSR, BIT(info->gate_bit));
+
+	if (tcu->clk)
+		clk_disable_unprepare(tcu->clk);
+}
+
+static int ingenic_tcu_is_enabled(struct clk_hw *hw)
+{
+	struct ingenic_tcu_clk *tcu_clk = to_tcu_clk(hw);
+	const struct ingenic_tcu_clk_info *info = tcu_clk->info;
+	unsigned int value;
+
+	regmap_read(tcu_clk->tcu->map, TCU_REG_TSR, &value);
+
+	return !(value & BIT(info->gate_bit));
+}
+
+static bool ingenic_tcu_enable_regs(struct clk_hw *hw)
+{
+	struct ingenic_tcu_clk *tcu_clk = to_tcu_clk(hw);
+	const struct ingenic_tcu_clk_info *info = tcu_clk->info;
+	struct ingenic_tcu *tcu = tcu_clk->tcu;
+	bool enabled = false;
+
+	/*
+	 * If the SoC has no global TCU clock, we must ungate the channel's
+	 * clock to be able to access its registers.
+	 * If we have a TCU clock, it will be enabled automatically as it has
+	 * been attached to the regmap.
+	 */
+	if (!tcu->clk) {
+		enabled = !!ingenic_tcu_is_enabled(hw);
+		regmap_write(tcu->map, TCU_REG_TSCR, BIT(info->gate_bit));
+	}
+
+	return enabled;
+}
+
+static void ingenic_tcu_disable_regs(struct clk_hw *hw)
+{
+	struct ingenic_tcu_clk *tcu_clk = to_tcu_clk(hw);
+	const struct ingenic_tcu_clk_info *info = tcu_clk->info;
+	struct ingenic_tcu *tcu = tcu_clk->tcu;
+
+	if (!tcu->clk)
+		regmap_write(tcu->map, TCU_REG_TSSR, BIT(info->gate_bit));
+}
+
+static u8 ingenic_tcu_get_parent(struct clk_hw *hw)
+{
+	struct ingenic_tcu_clk *tcu_clk = to_tcu_clk(hw);
+	const struct ingenic_tcu_clk_info *info = tcu_clk->info;
+	unsigned int val = 0;
+	int ret;
+
+	ret = regmap_read(tcu_clk->tcu->map, info->tcsr_reg, &val);
+	WARN_ONCE(ret < 0, "Unable to read TCSR %i", tcu_clk->idx);
+
+	return ffs(val & TCU_TCSR_PARENT_CLOCK_MASK) - 1;
+}
+
+static int ingenic_tcu_set_parent(struct clk_hw *hw, u8 idx)
+{
+	struct ingenic_tcu_clk *tcu_clk = to_tcu_clk(hw);
+	const struct ingenic_tcu_clk_info *info = tcu_clk->info;
+	bool was_enabled;
+	int ret;
+
+	was_enabled = ingenic_tcu_enable_regs(hw);
+
+	ret = regmap_update_bits(tcu_clk->tcu->map, info->tcsr_reg,
+				 TCU_TCSR_PARENT_CLOCK_MASK, BIT(idx));
+	WARN_ONCE(ret < 0, "Unable to update TCSR %i", tcu_clk->idx);
+
+	if (!was_enabled)
+		ingenic_tcu_disable_regs(hw);
+
+	return 0;
+}
+
+static unsigned long ingenic_tcu_recalc_rate(struct clk_hw *hw,
+		unsigned long parent_rate)
+{
+	struct ingenic_tcu_clk *tcu_clk = to_tcu_clk(hw);
+	const struct ingenic_tcu_clk_info *info = tcu_clk->info;
+	unsigned int prescale;
+	int ret;
+
+	ret = regmap_read(tcu_clk->tcu->map, info->tcsr_reg, &prescale);
+	WARN_ONCE(ret < 0, "Unable to read TCSR %i", tcu_clk->idx);
+
+	prescale = (prescale & TCU_TCSR_PRESCALE_MASK) >> TCU_TCSR_PRESCALE_LSB;
+
+	return parent_rate >> (prescale * 2);
+}
+
+static u8 ingenic_tcu_get_prescale(unsigned long rate, unsigned long req_rate)
+{
+	u8 prescale;
+
+	for (prescale = 0; prescale < 5; prescale++)
+		if ((rate >> (prescale * 2)) <= req_rate)
+			return prescale;
+
+	return 5; /* /1024 divider */
+}
+
+static long ingenic_tcu_round_rate(struct clk_hw *hw, unsigned long req_rate,
+		unsigned long *parent_rate)
+{
+	unsigned long rate = *parent_rate;
+	u8 prescale;
+
+	if (req_rate > rate)
+		return -EINVAL;
+
+	prescale = ingenic_tcu_get_prescale(rate, req_rate);
+
+	return rate >> (prescale * 2);
+}
+
+static int ingenic_tcu_set_rate(struct clk_hw *hw, unsigned long req_rate,
+		unsigned long parent_rate)
+{
+	struct ingenic_tcu_clk *tcu_clk = to_tcu_clk(hw);
+	const struct ingenic_tcu_clk_info *info = tcu_clk->info;
+	u8 prescale = ingenic_tcu_get_prescale(parent_rate, req_rate);
+	bool was_enabled;
+	int ret;
+
+	was_enabled = ingenic_tcu_enable_regs(hw);
+
+	ret = regmap_update_bits(tcu_clk->tcu->map, info->tcsr_reg,
+				 TCU_TCSR_PRESCALE_MASK,
+				 prescale << TCU_TCSR_PRESCALE_LSB);
+	WARN_ONCE(ret < 0, "Unable to update TCSR %i", tcu_clk->idx);
+
+	if (!was_enabled)
+		ingenic_tcu_disable_regs(hw);
+
+	return 0;
+}
+
+static const struct clk_ops ingenic_tcu_clk_ops = {
+	.get_parent	= ingenic_tcu_get_parent,
+	.set_parent	= ingenic_tcu_set_parent,
+
+	.recalc_rate	= ingenic_tcu_recalc_rate,
+	.round_rate	= ingenic_tcu_round_rate,
+	.set_rate	= ingenic_tcu_set_rate,
+
+	.enable		= ingenic_tcu_enable,
+	.disable	= ingenic_tcu_disable,
+	.is_enabled	= ingenic_tcu_is_enabled,
+};
+
+static const char * const ingenic_tcu_timer_parents[] = {
+	[TCU_PARENT_PCLK] = "pclk",
+	[TCU_PARENT_RTC]  = "rtc",
+	[TCU_PARENT_EXT]  = "ext",
+};
+
+#define DEF_TIMER(_name, _gate_bit, _tcsr)				\
+	{								\
+		.init_data = {						\
+			.name = _name,					\
+			.parent_names = ingenic_tcu_timer_parents,	\
+			.num_parents = ARRAY_SIZE(ingenic_tcu_timer_parents),\
+			.ops = &ingenic_tcu_clk_ops,			\
+			.flags = CLK_SET_RATE_UNGATE,			\
+		},							\
+		.gate_bit = _gate_bit,					\
+		.tcsr_reg = _tcsr,					\
+	}
+static const struct ingenic_tcu_clk_info ingenic_tcu_clk_info[] = {
+	[TCU_CLK_TIMER0] = DEF_TIMER("timer0", 0, TCU_REG_TCSRc(0)),
+	[TCU_CLK_TIMER1] = DEF_TIMER("timer1", 1, TCU_REG_TCSRc(1)),
+	[TCU_CLK_TIMER2] = DEF_TIMER("timer2", 2, TCU_REG_TCSRc(2)),
+	[TCU_CLK_TIMER3] = DEF_TIMER("timer3", 3, TCU_REG_TCSRc(3)),
+	[TCU_CLK_TIMER4] = DEF_TIMER("timer4", 4, TCU_REG_TCSRc(4)),
+	[TCU_CLK_TIMER5] = DEF_TIMER("timer5", 5, TCU_REG_TCSRc(5)),
+	[TCU_CLK_TIMER6] = DEF_TIMER("timer6", 6, TCU_REG_TCSRc(6)),
+	[TCU_CLK_TIMER7] = DEF_TIMER("timer7", 7, TCU_REG_TCSRc(7)),
+};
+
+static const struct ingenic_tcu_clk_info ingenic_tcu_watchdog_clk_info =
+					 DEF_TIMER("wdt", 16, TCU_REG_WDT_TCSR);
+static const struct ingenic_tcu_clk_info ingenic_tcu_ost_clk_info =
+					 DEF_TIMER("ost", 15, TCU_REG_OST_TCSR);
+#undef DEF_TIMER
+
+static int __init ingenic_tcu_register_clock(struct ingenic_tcu *tcu,
+			unsigned int idx, enum tcu_clk_parent parent,
+			const struct ingenic_tcu_clk_info *info,
+			struct clk_hw_onecell_data *clocks)
+{
+	struct ingenic_tcu_clk *tcu_clk;
+	int err;
+
+	tcu_clk = kzalloc(sizeof(*tcu_clk), GFP_KERNEL);
+	if (!tcu_clk)
+		return -ENOMEM;
+
+	tcu_clk->hw.init = &info->init_data;
+	tcu_clk->idx = idx;
+	tcu_clk->info = info;
+	tcu_clk->tcu = tcu;
+
+	/* Reset channel and clock divider, set default parent */
+	ingenic_tcu_enable_regs(&tcu_clk->hw);
+	regmap_update_bits(tcu->map, info->tcsr_reg, 0xffff, BIT(parent));
+	ingenic_tcu_disable_regs(&tcu_clk->hw);
+
+	err = clk_hw_register(NULL, &tcu_clk->hw);
+	if (err)
+		goto err_free_tcu_clk;
+
+	err = clk_hw_register_clkdev(&tcu_clk->hw, info->init_data.name, NULL);
+	if (err)
+		goto err_clk_unregister;
+
+	clocks->hws[idx] = &tcu_clk->hw;
+
+	return 0;
+
+err_clk_unregister:
+	clk_hw_unregister(&tcu_clk->hw);
+err_free_tcu_clk:
+	kfree(tcu_clk);
+	return err;
+}
+
+static const struct ingenic_soc_info jz4740_soc_info = {
+	.num_channels = 8,
+	.has_ost = false,
+	.has_tcu_clk = true,
+};
+
+static const struct ingenic_soc_info jz4725b_soc_info = {
+	.num_channels = 6,
+	.has_ost = true,
+	.has_tcu_clk = true,
+};
+
+static const struct ingenic_soc_info jz4770_soc_info = {
+	.num_channels = 8,
+	.has_ost = true,
+	.has_tcu_clk = false,
+};
+
+static const struct of_device_id ingenic_tcu_of_match[] __initconst = {
+	{ .compatible = "ingenic,jz4740-tcu", .data = &jz4740_soc_info, },
+	{ .compatible = "ingenic,jz4725b-tcu", .data = &jz4725b_soc_info, },
+	{ .compatible = "ingenic,jz4770-tcu", .data = &jz4770_soc_info, },
+	{ }
+};
+
+static int __init ingenic_tcu_probe(struct device_node *np)
+{
+	const struct of_device_id *id = of_match_node(ingenic_tcu_of_match, np);
+	struct ingenic_tcu *tcu;
+	struct regmap *map;
+	unsigned int i;
+	int ret;
+
+	map = ingenic_tcu_get_regmap(np);
+	if (IS_ERR(map))
+		return PTR_ERR(map);
+
+	tcu = kzalloc(sizeof(*tcu), GFP_KERNEL);
+	if (!tcu)
+		return -ENOMEM;
+
+	tcu->map = map;
+	tcu->soc_info = id->data;
+
+	if (tcu->soc_info->has_tcu_clk) {
+		tcu->clk = of_clk_get_by_name(np, "tcu");
+		if (IS_ERR(tcu->clk)) {
+			ret = PTR_ERR(tcu->clk);
+			TCU_ERR("Cannot get TCU clock\n");
+			goto err_free_tcu;
+		}
+
+		ret = regmap_mmio_attach_clk(map, tcu->clk);
+		if (ret) {
+			TCU_ERR("Unable to attach TCU clock\n");
+			goto err_put_clk;
+		}
+	}
+
+	tcu->clocks = kzalloc(sizeof(*tcu->clocks) +
+			      sizeof(*tcu->clocks->hws) * TCU_CLK_COUNT,
+			      GFP_KERNEL);
+	if (!tcu->clocks) {
+		ret = -ENOMEM;
+		goto err_clk_detach;
+	}
+
+	tcu->clocks->num = TCU_CLK_COUNT;
+
+	for (i = 0; i < tcu->soc_info->num_channels; i++) {
+		ret = ingenic_tcu_register_clock(tcu, i, TCU_PARENT_EXT,
+						 &ingenic_tcu_clk_info[i],
+						 tcu->clocks);
+		if (ret) {
+			TCU_ERR("cannot register clock %i\n", i);
+			goto err_unregister_timer_clocks;
+		}
+	}
+
+	/* We set EXT as the default parent clock for all the TCU clocks
+	 * except for the watchdog one, where we set the RTC clock as the
+	 * parent. Since the EXT and PCLK are much faster than the RTC clock,
+	 * the watchdog would kick after a maximum time of 5s, and we might
+	 * want a slower kicking time.
+	 */
+	ret = ingenic_tcu_register_clock(tcu, TCU_CLK_WDT, TCU_PARENT_RTC,
+					 &ingenic_tcu_watchdog_clk_info,
+					 tcu->clocks);
+	if (ret) {
+		TCU_ERR("cannot register watchdog clock\n");
+		goto err_unregister_timer_clocks;
+	}
+
+	if (tcu->soc_info->has_ost) {
+		ret = ingenic_tcu_register_clock(tcu, TCU_CLK_OST,
+						 TCU_PARENT_EXT,
+						 &ingenic_tcu_ost_clk_info,
+						 tcu->clocks);
+		if (ret) {
+			TCU_ERR("cannot register ost clock\n");
+			goto err_unregister_watchdog_clock;
+		}
+	}
+
+	ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, tcu->clocks);
+	if (ret) {
+		TCU_ERR("cannot add OF clock provider\n");
+		goto err_unregister_ost_clock;
+	}
+
+	return 0;
+
+err_unregister_ost_clock:
+	if (tcu->soc_info->has_ost)
+		clk_hw_unregister(tcu->clocks->hws[i + 1]);
+err_unregister_watchdog_clock:
+	clk_hw_unregister(tcu->clocks->hws[i]);
+err_unregister_timer_clocks:
+	for (i = 0; i < tcu->clocks->num; i++)
+		if (tcu->clocks->hws[i])
+			clk_hw_unregister(tcu->clocks->hws[i]);
+	kfree(tcu->clocks);
+err_clk_detach:
+	if (tcu->soc_info->has_tcu_clk)
+		regmap_mmio_detach_clk(map);
+err_put_clk:
+	if (tcu->soc_info->has_tcu_clk)
+		clk_put(tcu->clk);
+err_free_tcu:
+	kfree(tcu);
+	return ret;
+}
+
+static void __init ingenic_tcu_init(struct device_node *np)
+{
+	int ret = ingenic_tcu_probe(np);
+
+	if (ret)
+		TCU_ERR("Failed to initialize TCU clocks: %i\n", ret);
+}
+
+CLK_OF_DECLARE(jz4740_cgu, "ingenic,jz4740-tcu", ingenic_tcu_init);
+CLK_OF_DECLARE(jz4725b_cgu, "ingenic,jz4725b-tcu", ingenic_tcu_init);
+CLK_OF_DECLARE(jz4770_cgu, "ingenic,jz4770-tcu", ingenic_tcu_init);
-- 
2.21.0.593.g511ec345e18

