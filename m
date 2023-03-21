Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE2E06C302B
	for <lists+linux-mips@lfdr.de>; Tue, 21 Mar 2023 12:19:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230504AbjCULTY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Mar 2023 07:19:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230503AbjCULTV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 21 Mar 2023 07:19:21 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB38A6E8C;
        Tue, 21 Mar 2023 04:19:12 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id fb38so3818659pfb.7;
        Tue, 21 Mar 2023 04:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679397551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p5bbfoiR1yGSqQO9A9Z4O88pRydlb+bWF60VmVMMYwA=;
        b=nAatNCabRD0z6S+jok2B84xUD0lQkI2tJylg3EHQNGEqmPBSOsWwVT7s5tH0fz+6Gz
         UAIkpI/B7LQjZ5nBENZEapFvQatNvJU5Jn0WsQ1hRkAQn8kwNs6RLMjMcRfckTfivMKV
         bvMdhUoirTddzeB1H0Lt5S5fXUYbOG5XIdqkiMQm9wd0TPS3LceDDsmzqkMYz56pq8R9
         /ecmAUvdGoqmkeL399XW0c10Mxp2qTYpkizdnzI7E1KwiRFcF+sHBGwm0zn3DHBJCjCM
         AVAX3jdVQ8ilZl4QRJ+luXpXAxoyJXlVFlJA7Itj7l8ijjckL8FEp3ntPmrut4jlgHd2
         RJUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679397551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p5bbfoiR1yGSqQO9A9Z4O88pRydlb+bWF60VmVMMYwA=;
        b=aGKqBiFnHWp52In6ERzSH4P/4XVCtY6v8xsLE4DU4FL5T1Y8JYrpOn+OyMTSHZWlIR
         nln5xeV1bbv3FKmFib81tRvItMmROPl5OR4OhKhdeuuqccv3v87HAbzznbgWpOI44j1X
         mopcK13T47WXWf3RX7mXMv0MPx+03t7n4UnOe8gGTGnpsE9KL1xSoAf4nxXYfSa2NqlG
         IQOYDA8MvvQ725NsR4RyvepVvlz0k9zjjQd8+wEwb29ADcYLOiRf6kWS8aTkHiZgP+OZ
         GfVPa4hvsC4v05i/R4jX2GbOX1yO9SrcRpeg3Nu8Y1XmaBTS3VAEuK1QImSfRc+PM1lC
         aZBA==
X-Gm-Message-State: AO0yUKXHDV+rjZWFNrvrOxYIzC6Jwbqv+mBs1MvtpQiQpr2GGhURsq/V
        QMl6hqnZps5p+rdp3KS0apFP3hFQ0qs=
X-Google-Smtp-Source: AK7set9ESZA+mq+PAYz+UEuSXXKGdOS1Um7G2/umCFlxl/6R5GxoB5f0Pglr0UP4BcT/LBSdIUBB8A==
X-Received: by 2002:a62:1a17:0:b0:625:e77b:433e with SMTP id a23-20020a621a17000000b00625e77b433emr1877218pfa.24.1679397551050;
        Tue, 21 Mar 2023 04:19:11 -0700 (PDT)
Received: from kelvin-ThinkPad-L14-Gen-1.. (94.130.220.35.bc.googleusercontent.com. [35.220.130.94])
        by smtp.gmail.com with ESMTPSA id c4-20020aa78804000000b005dd65169628sm8238838pfo.144.2023.03.21.04.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 04:19:10 -0700 (PDT)
From:   Keguang Zhang <keguang.zhang@gmail.com>
To:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Keguang Zhang <keguang.zhang@gmail.com>
Subject: [PATCH v5 3/4] clk: loongson1: Re-implement the clock driver
Date:   Tue, 21 Mar 2023 19:18:16 +0800
Message-Id: <20230321111817.71756-4-keguang.zhang@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230321111817.71756-1-keguang.zhang@gmail.com>
References: <20230321111817.71756-1-keguang.zhang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Re-implement the clock driver for Loongson-1 to
add devicetree support and fit into the clock framework.

Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
---
V4 -> V5: Include the necessary header files
          Add error handling for ls1x_clk_init()
          Remove MODULE_AUTHOR and MODULE_DESCRIPTION
          Some fixes and cleanups
V3 -> V4: Fix the build error of missing linux/module.h
V2 -> V3: Add MODULE_AUTHOR and MODULE_DESCRIPTION info
V1 -> V2: Implement one clock controller instead of single clocks
          (suggested by Krzysztof Kozlowski)
---
 drivers/clk/Makefile        |   1 +
 drivers/clk/clk-loongson1.c | 303 ++++++++++++++++++++++++++++++++++++
 2 files changed, 304 insertions(+)
 create mode 100644 drivers/clk/clk-loongson1.c

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index b7b2c6d64636..417bc27ab6e8 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -43,6 +43,7 @@ obj-$(CONFIG_COMMON_CLK_K210)		+= clk-k210.o
 obj-$(CONFIG_LMK04832)			+= clk-lmk04832.o
 obj-$(CONFIG_COMMON_CLK_LAN966X)	+= clk-lan966x.o
 obj-$(CONFIG_COMMON_CLK_LOCHNAGAR)	+= clk-lochnagar.o
+obj-$(CONFIG_MACH_LOONGSON32)		+= clk-loongson1.o
 obj-$(CONFIG_COMMON_CLK_MAX77686)	+= clk-max77686.o
 obj-$(CONFIG_COMMON_CLK_MAX9485)	+= clk-max9485.o
 obj-$(CONFIG_ARCH_MILBEAUT_M10V)	+= clk-milbeaut.o
diff --git a/drivers/clk/clk-loongson1.c b/drivers/clk/clk-loongson1.c
new file mode 100644
index 000000000000..c93aa25c8d3a
--- /dev/null
+++ b/drivers/clk/clk-loongson1.c
@@ -0,0 +1,303 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Clock driver for Loongson-1 SoC
+ *
+ * Copyright (C) 2012-2023 Keguang Zhang <keguang.zhang@gmail.com>
+ */
+
+#include <asm/io.h>
+#include <linux/bits.h>
+#include <linux/clk-provider.h>
+#include <linux/container_of.h>
+#include <linux/of_address.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/printk.h>
+
+#include <dt-bindings/clock/loongson,ls1x-clk.h>
+
+/* Loongson 1 Clock Register Definitions */
+#define CLK_PLL_FREQ		0x0
+#define CLK_PLL_DIV		0x4
+
+static DEFINE_SPINLOCK(ls1x_clk_div_lock);
+
+struct ls1x_clk_pll_data {
+	u32 fixed;
+	u8 shift;
+	u8 int_shift;
+	u8 int_width;
+	u8 frac_shift;
+	u8 frac_width;
+};
+
+struct ls1x_clk_div_data {
+	u8 shift;
+	u8 width;
+	unsigned long flags;
+	const struct clk_div_table *table;
+	u8 bypass_shift;
+	u8 bypass_inv;
+	spinlock_t *lock;	/* protect access to DIV registers */
+};
+
+struct ls1x_clk {
+	void __iomem *reg;
+	unsigned int offset;
+	struct clk_hw hw;
+	void *data;
+};
+
+#define to_ls1x_clk(_hw) container_of(_hw, struct ls1x_clk, hw)
+
+static inline unsigned long ls1x_pll_rate_part(unsigned int val,
+					       unsigned int shift,
+					       unsigned int width)
+{
+	return (val & GENMASK(shift + width, shift)) >> shift;
+}
+
+static unsigned long ls1x_pll_recalc_rate(struct clk_hw *hw,
+					  unsigned long parent_rate)
+{
+	struct ls1x_clk *ls1x_clk = to_ls1x_clk(hw);
+	const struct ls1x_clk_pll_data *d = ls1x_clk->data;
+	u32 val, rate;
+
+	val = readl(ls1x_clk->reg);
+	rate = d->fixed;
+	rate += ls1x_pll_rate_part(val, d->int_shift, d->int_width);
+	if (d->frac_width)
+		rate += ls1x_pll_rate_part(val, d->frac_shift, d->frac_width);
+	rate *= parent_rate;
+	rate >>= d->shift;
+
+	return rate;
+}
+
+static const struct clk_ops ls1x_pll_clk_ops = {
+	.recalc_rate = ls1x_pll_recalc_rate,
+};
+
+static unsigned long ls1x_divider_recalc_rate(struct clk_hw *hw,
+					      unsigned long parent_rate)
+{
+	struct ls1x_clk *ls1x_clk = to_ls1x_clk(hw);
+	const struct ls1x_clk_div_data *d = ls1x_clk->data;
+	unsigned int val;
+
+	val = readl(ls1x_clk->reg) >> d->shift;
+	val &= clk_div_mask(d->width);
+
+	return divider_recalc_rate(hw, parent_rate, val, d->table,
+				   d->flags, d->width);
+}
+
+static long ls1x_divider_round_rate(struct clk_hw *hw, unsigned long rate,
+				    unsigned long *prate)
+{
+	struct ls1x_clk *ls1x_clk = to_ls1x_clk(hw);
+	const struct ls1x_clk_div_data *d = ls1x_clk->data;
+
+	return divider_round_rate(hw, rate, prate, d->table,
+				  d->width, d->flags);
+}
+
+static int ls1x_divider_set_rate(struct clk_hw *hw, unsigned long rate,
+				 unsigned long parent_rate)
+{
+	struct ls1x_clk *ls1x_clk = to_ls1x_clk(hw);
+	const struct ls1x_clk_div_data *d = ls1x_clk->data;
+	int val, div_val;
+	unsigned long flags = 0;
+
+	div_val = divider_get_val(rate, parent_rate, d->table,
+				  d->width, d->flags);
+	if (div_val < 0)
+		return div_val;
+
+	spin_lock_irqsave(d->lock, flags);
+
+	/* Bypass the clock */
+	val = readl(ls1x_clk->reg);
+	if (d->bypass_inv)
+		val &= ~BIT(d->bypass_shift);
+	else
+		val |= BIT(d->bypass_shift);
+	writel(val, ls1x_clk->reg);
+
+	val = readl(ls1x_clk->reg);
+	val &= ~(clk_div_mask(d->width) << d->shift);
+	val |= (u32)div_val << d->shift;
+	writel(val, ls1x_clk->reg);
+
+	/* Restore the clock */
+	val = readl(ls1x_clk->reg);
+	if (d->bypass_inv)
+		val |= BIT(d->bypass_shift);
+	else
+		val &= ~BIT(d->bypass_shift);
+	writel(val, ls1x_clk->reg);
+
+	spin_unlock_irqrestore(d->lock, flags);
+
+	return 0;
+}
+
+static const struct clk_ops ls1x_clk_divider_ops = {
+	.recalc_rate = ls1x_divider_recalc_rate,
+	.round_rate = ls1x_divider_round_rate,
+	.set_rate = ls1x_divider_set_rate,
+};
+
+#define LS1X_CLK_PLL(_name, _offset, _fixed, _shift,			\
+		     f_shift, f_width, i_shift, i_width)		\
+struct ls1x_clk _name = {						\
+	.offset = (_offset),						\
+	.data = &(struct ls1x_clk_pll_data) {				\
+		.fixed = (_fixed),					\
+		.shift = (_shift),					\
+		.int_shift = (i_shift),					\
+		.int_width = (i_width),					\
+		.frac_shift = (f_shift),				\
+		.frac_width = (f_width),				\
+	},								\
+	.hw.init = &(struct clk_init_data) {				\
+		.name = #_name,						\
+		.ops = &ls1x_pll_clk_ops,				\
+		.parent_data = &(const struct clk_parent_data) {	\
+			.fw_name = "xtal",				\
+			.name = "xtal",					\
+			.index = -1,					\
+		},							\
+		.num_parents = 1,					\
+	},								\
+}
+
+#define LS1X_CLK_DIV(_name, _pname, _offset, _shift, _width,		\
+		     _table, _bypass_shift, _bypass_inv, _flags)	\
+struct ls1x_clk _name = {						\
+	.offset = (_offset),						\
+	.data = &(struct ls1x_clk_div_data){				\
+		.shift = (_shift),					\
+		.width = (_width),					\
+		.table = (_table),					\
+		.flags = (_flags),					\
+		.bypass_shift = (_bypass_shift),			\
+		.bypass_inv = (_bypass_inv),				\
+		.lock = &ls1x_clk_div_lock,				\
+	},								\
+	.hw.init = &(const struct clk_init_data) {				\
+		.name = #_name,						\
+		.ops = &ls1x_clk_divider_ops,				\
+		.parent_hws = (const struct clk_hw *[]) { _pname },	\
+		.num_parents = 1,					\
+		.flags = CLK_GET_RATE_NOCACHE,				\
+	},								\
+}
+
+static LS1X_CLK_PLL(ls1b_clk_pll, CLK_PLL_FREQ, 12, 1, 0, 5, 0, 0);
+static LS1X_CLK_DIV(ls1b_clk_cpu, &ls1b_clk_pll.hw, CLK_PLL_DIV,
+		    20, 4, NULL, 8, 0,
+		    CLK_DIVIDER_ONE_BASED | CLK_DIVIDER_ROUND_CLOSEST);
+static LS1X_CLK_DIV(ls1b_clk_dc, &ls1b_clk_pll.hw, CLK_PLL_DIV,
+		    26, 4, NULL, 12, 0, CLK_DIVIDER_ONE_BASED);
+static LS1X_CLK_DIV(ls1b_clk_ahb, &ls1b_clk_pll.hw, CLK_PLL_DIV,
+		    14, 4, NULL, 10, 0, CLK_DIVIDER_ONE_BASED);
+static CLK_FIXED_FACTOR(ls1b_clk_apb, "ls1b_clk_apb", "ls1b_clk_ahb", 2, 1,
+			CLK_SET_RATE_PARENT);
+
+static struct clk_hw_onecell_data ls1b_clk_hw_data = {
+	.hws = {
+		[LS1X_CLKID_PLL] = &ls1b_clk_pll.hw,
+		[LS1X_CLKID_CPU] = &ls1b_clk_cpu.hw,
+		[LS1X_CLKID_DC] = &ls1b_clk_dc.hw,
+		[LS1X_CLKID_AHB] = &ls1b_clk_ahb.hw,
+		[LS1X_CLKID_APB] = &ls1b_clk_apb.hw,
+	},
+	.num = CLK_NR_CLKS,
+};
+
+static const struct clk_div_table ls1c_ahb_div_table[] = {
+	[0] = { .val = 0, .div = 2 },
+	[1] = { .val = 1, .div = 4 },
+	[2] = { .val = 2, .div = 3 },
+	[3] = { .val = 3, .div = 3 },
+	[4] = { /* sentinel */ }
+};
+
+static LS1X_CLK_PLL(ls1c_clk_pll, CLK_PLL_FREQ, 0, 2, 8, 8, 16, 8);
+static LS1X_CLK_DIV(ls1c_clk_cpu, &ls1c_clk_pll.hw, CLK_PLL_DIV,
+		    8, 7, NULL, 0, 1,
+		    CLK_DIVIDER_ONE_BASED | CLK_DIVIDER_ROUND_CLOSEST);
+static LS1X_CLK_DIV(ls1c_clk_dc, &ls1c_clk_pll.hw, CLK_PLL_DIV,
+		    24, 7, NULL, 4, 1, CLK_DIVIDER_ONE_BASED);
+static LS1X_CLK_DIV(ls1c_clk_ahb, &ls1c_clk_cpu.hw, CLK_PLL_FREQ,
+		    0, 2, ls1c_ahb_div_table, 0, 0, CLK_DIVIDER_ALLOW_ZERO);
+static CLK_FIXED_FACTOR(ls1c_clk_apb, "ls1c_clk_apb", "ls1c_clk_ahb", 1, 1,
+			CLK_SET_RATE_PARENT);
+
+static struct clk_hw_onecell_data ls1c_clk_hw_data = {
+	.hws = {
+		[LS1X_CLKID_PLL] = &ls1c_clk_pll.hw,
+		[LS1X_CLKID_CPU] = &ls1c_clk_cpu.hw,
+		[LS1X_CLKID_DC] = &ls1c_clk_dc.hw,
+		[LS1X_CLKID_AHB] = &ls1c_clk_ahb.hw,
+		[LS1X_CLKID_APB] = &ls1c_clk_apb.hw,
+	},
+	.num = CLK_NR_CLKS,
+};
+
+static void __init ls1x_clk_init(struct device_node *np,
+				 struct clk_hw_onecell_data *hw_data)
+{
+	struct ls1x_clk *ls1x_clk;
+	void __iomem *reg;
+	int i, ret;
+
+	reg = of_iomap(np, 0);
+	if (!reg) {
+		pr_err("Unable to map base for %pOF\n", np);
+		return;
+	}
+
+	for (i = 0; i < hw_data->num; i++) {
+		/* array might be sparse */
+		if (!hw_data->hws[i])
+			continue;
+
+		if (i != LS1X_CLKID_APB) {
+			ls1x_clk = to_ls1x_clk(hw_data->hws[i]);
+			ls1x_clk->reg = reg + ls1x_clk->offset;
+		}
+
+		ret = of_clk_hw_register(np, hw_data->hws[i]);
+		if (ret)
+			goto err;
+	}
+
+	ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, hw_data);
+	if (!ret)
+		return;
+
+err:
+	pr_err("Failed to register %pOF\n", np);
+
+	while (--i >= 0)
+		clk_hw_unregister(hw_data->hws[i]);
+
+	iounmap(reg);
+}
+
+static void __init ls1b_clk_init(struct device_node *np)
+{
+	return ls1x_clk_init(np, &ls1b_clk_hw_data);
+}
+
+static void __init ls1c_clk_init(struct device_node *np)
+{
+	return ls1x_clk_init(np, &ls1c_clk_hw_data);
+}
+
+CLK_OF_DECLARE(ls1b_clk, "loongson,ls1b-clk", ls1b_clk_init);
+CLK_OF_DECLARE(ls1c_clk, "loongson,ls1c-clk", ls1c_clk_init);
-- 
2.34.1

