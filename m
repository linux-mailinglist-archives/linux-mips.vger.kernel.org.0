Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80752395206
	for <lists+linux-mips@lfdr.de>; Sun, 30 May 2021 18:49:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229847AbhE3Qv3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 30 May 2021 12:51:29 -0400
Received: from aposti.net ([89.234.176.197]:33420 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229828AbhE3Qv3 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 30 May 2021 12:51:29 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        list@opendingux.net,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 2/6] clk: Support bypassing dividers
Date:   Sun, 30 May 2021 17:49:19 +0100
Message-Id: <20210530164923.18134-3-paul@crapouillou.net>
In-Reply-To: <20210530164923.18134-1-paul@crapouillou.net>
References: <20210530164923.18134-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When a clock is declared as both CGU_CLK_DIV and CGU_CLK_MUX, the CGU
code expects the mux to be applied first, the divider second.

On the JZ4760, and maybe on some other SoCs, some clocks also have a mux
setting and a divider, but the divider is not applied to all parents
selectable from the mux.

This could be solved by creating two clocks, one with CGU_CLK_DIV and
one with CGU_CLK_MUX, but that would increase the number of clocks.

Instead, add a 8-bit mask to CGU_CLK_DIV clocks. If the bit
corresponding to the parent clock's index is set, the divider is
bypassed.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/clk/ingenic/cgu.c         | 33 ++++++++++++++++++++-----------
 drivers/clk/ingenic/cgu.h         |  2 ++
 drivers/clk/ingenic/jz4725b-cgu.c | 12 +++++------
 drivers/clk/ingenic/jz4740-cgu.c  | 12 +++++------
 drivers/clk/ingenic/jz4770-cgu.c  | 12 +++++------
 5 files changed, 42 insertions(+), 29 deletions(-)

diff --git a/drivers/clk/ingenic/cgu.c b/drivers/clk/ingenic/cgu.c
index c8e9cb6c8e39..0619d45a950c 100644
--- a/drivers/clk/ingenic/cgu.c
+++ b/drivers/clk/ingenic/cgu.c
@@ -369,18 +369,23 @@ ingenic_clk_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 	struct ingenic_cgu *cgu = ingenic_clk->cgu;
 	unsigned long rate = parent_rate;
 	u32 div_reg, div;
+	u8 parent;
 
 	if (clk_info->type & CGU_CLK_DIV) {
-		div_reg = readl(cgu->base + clk_info->div.reg);
-		div = (div_reg >> clk_info->div.shift) &
-		      GENMASK(clk_info->div.bits - 1, 0);
+		parent = ingenic_clk_get_parent(hw);
 
-		if (clk_info->div.div_table)
-			div = clk_info->div.div_table[div];
-		else
-			div = (div + 1) * clk_info->div.div;
+		if (!(clk_info->div.bypass_mask & BIT(parent))) {
+			div_reg = readl(cgu->base + clk_info->div.reg);
+			div = (div_reg >> clk_info->div.shift) &
+			      GENMASK(clk_info->div.bits - 1, 0);
+
+			if (clk_info->div.div_table)
+				div = clk_info->div.div_table[div];
+			else
+				div = (div + 1) * clk_info->div.div;
 
-		rate /= div;
+			rate /= div;
+		}
 	} else if (clk_info->type & CGU_CLK_FIXDIV) {
 		rate /= clk_info->fixdiv.div;
 	}
@@ -410,10 +415,16 @@ ingenic_clk_calc_hw_div(const struct ingenic_cgu_clk_info *clk_info,
 }
 
 static unsigned
-ingenic_clk_calc_div(const struct ingenic_cgu_clk_info *clk_info,
+ingenic_clk_calc_div(struct clk_hw *hw,
+		     const struct ingenic_cgu_clk_info *clk_info,
 		     unsigned long parent_rate, unsigned long req_rate)
 {
 	unsigned int div, hw_div;
+	u8 parent;
+
+	parent = ingenic_clk_get_parent(hw);
+	if (clk_info->div.bypass_mask & BIT(parent))
+		return 1;
 
 	/* calculate the divide */
 	div = DIV_ROUND_UP(parent_rate, req_rate);
@@ -448,7 +459,7 @@ ingenic_clk_round_rate(struct clk_hw *hw, unsigned long req_rate,
 	unsigned int div = 1;
 
 	if (clk_info->type & CGU_CLK_DIV)
-		div = ingenic_clk_calc_div(clk_info, *parent_rate, req_rate);
+		div = ingenic_clk_calc_div(hw, clk_info, *parent_rate, req_rate);
 	else if (clk_info->type & CGU_CLK_FIXDIV)
 		div = clk_info->fixdiv.div;
 	else if (clk_hw_can_set_rate_parent(hw))
@@ -480,7 +491,7 @@ ingenic_clk_set_rate(struct clk_hw *hw, unsigned long req_rate,
 	int ret = 0;
 
 	if (clk_info->type & CGU_CLK_DIV) {
-		div = ingenic_clk_calc_div(clk_info, parent_rate, req_rate);
+		div = ingenic_clk_calc_div(hw, clk_info, parent_rate, req_rate);
 		rate = DIV_ROUND_UP(parent_rate, div);
 
 		if (rate != req_rate)
diff --git a/drivers/clk/ingenic/cgu.h b/drivers/clk/ingenic/cgu.h
index 2c75ef4a36f5..44d97a259692 100644
--- a/drivers/clk/ingenic/cgu.h
+++ b/drivers/clk/ingenic/cgu.h
@@ -84,6 +84,7 @@ struct ingenic_cgu_mux_info {
  *          isn't one
  * @busy_bit: the index of the busy bit within reg, or -1 if there isn't one
  * @stop_bit: the index of the stop bit within reg, or -1 if there isn't one
+ * @bypass_mask: mask of parent clocks for which the divider does not apply
  * @div_table: optional table to map the value read from the register to the
  *             actual divider value
  */
@@ -95,6 +96,7 @@ struct ingenic_cgu_div_info {
 	s8 ce_bit;
 	s8 busy_bit;
 	s8 stop_bit;
+	u8 bypass_mask;
 	const u8 *div_table;
 };
 
diff --git a/drivers/clk/ingenic/jz4725b-cgu.c b/drivers/clk/ingenic/jz4725b-cgu.c
index 8c38e72d14a7..5154b0cf8ad6 100644
--- a/drivers/clk/ingenic/jz4725b-cgu.c
+++ b/drivers/clk/ingenic/jz4725b-cgu.c
@@ -80,7 +80,7 @@ static const struct ingenic_cgu_clk_info jz4725b_cgu_clocks[] = {
 		"pll half", CGU_CLK_DIV,
 		.parents = { JZ4725B_CLK_PLL, -1, -1, -1 },
 		.div = {
-			CGU_REG_CPCCR, 21, 1, 1, -1, -1, -1,
+			CGU_REG_CPCCR, 21, 1, 1, -1, -1, -1, 0,
 			jz4725b_cgu_pll_half_div_table,
 		},
 	},
@@ -89,7 +89,7 @@ static const struct ingenic_cgu_clk_info jz4725b_cgu_clocks[] = {
 		"cclk", CGU_CLK_DIV,
 		.parents = { JZ4725B_CLK_PLL, -1, -1, -1 },
 		.div = {
-			CGU_REG_CPCCR, 0, 1, 4, 22, -1, -1,
+			CGU_REG_CPCCR, 0, 1, 4, 22, -1, -1, 0,
 			jz4725b_cgu_cpccr_div_table,
 		},
 	},
@@ -98,7 +98,7 @@ static const struct ingenic_cgu_clk_info jz4725b_cgu_clocks[] = {
 		"hclk", CGU_CLK_DIV,
 		.parents = { JZ4725B_CLK_PLL, -1, -1, -1 },
 		.div = {
-			CGU_REG_CPCCR, 4, 1, 4, 22, -1, -1,
+			CGU_REG_CPCCR, 4, 1, 4, 22, -1, -1, 0,
 			jz4725b_cgu_cpccr_div_table,
 		},
 	},
@@ -107,7 +107,7 @@ static const struct ingenic_cgu_clk_info jz4725b_cgu_clocks[] = {
 		"pclk", CGU_CLK_DIV,
 		.parents = { JZ4725B_CLK_PLL, -1, -1, -1 },
 		.div = {
-			CGU_REG_CPCCR, 8, 1, 4, 22, -1, -1,
+			CGU_REG_CPCCR, 8, 1, 4, 22, -1, -1, 0,
 			jz4725b_cgu_cpccr_div_table,
 		},
 	},
@@ -116,7 +116,7 @@ static const struct ingenic_cgu_clk_info jz4725b_cgu_clocks[] = {
 		"mclk", CGU_CLK_DIV,
 		.parents = { JZ4725B_CLK_PLL, -1, -1, -1 },
 		.div = {
-			CGU_REG_CPCCR, 12, 1, 4, 22, -1, -1,
+			CGU_REG_CPCCR, 12, 1, 4, 22, -1, -1, 0,
 			jz4725b_cgu_cpccr_div_table,
 		},
 	},
@@ -125,7 +125,7 @@ static const struct ingenic_cgu_clk_info jz4725b_cgu_clocks[] = {
 		"ipu", CGU_CLK_DIV | CGU_CLK_GATE,
 		.parents = { JZ4725B_CLK_PLL, -1, -1, -1 },
 		.div = {
-			CGU_REG_CPCCR, 16, 1, 4, 22, -1, -1,
+			CGU_REG_CPCCR, 16, 1, 4, 22, -1, -1, 0,
 			jz4725b_cgu_cpccr_div_table,
 		},
 		.gate = { CGU_REG_CLKGR, 13 },
diff --git a/drivers/clk/ingenic/jz4740-cgu.c b/drivers/clk/ingenic/jz4740-cgu.c
index c0ac9196a581..cd878f08aca3 100644
--- a/drivers/clk/ingenic/jz4740-cgu.c
+++ b/drivers/clk/ingenic/jz4740-cgu.c
@@ -95,7 +95,7 @@ static const struct ingenic_cgu_clk_info jz4740_cgu_clocks[] = {
 		"pll half", CGU_CLK_DIV,
 		.parents = { JZ4740_CLK_PLL, -1, -1, -1 },
 		.div = {
-			CGU_REG_CPCCR, 21, 1, 1, -1, -1, -1,
+			CGU_REG_CPCCR, 21, 1, 1, -1, -1, -1, 0,
 			jz4740_cgu_pll_half_div_table,
 		},
 	},
@@ -104,7 +104,7 @@ static const struct ingenic_cgu_clk_info jz4740_cgu_clocks[] = {
 		"cclk", CGU_CLK_DIV,
 		.parents = { JZ4740_CLK_PLL, -1, -1, -1 },
 		.div = {
-			CGU_REG_CPCCR, 0, 1, 4, 22, -1, -1,
+			CGU_REG_CPCCR, 0, 1, 4, 22, -1, -1, 0,
 			jz4740_cgu_cpccr_div_table,
 		},
 	},
@@ -113,7 +113,7 @@ static const struct ingenic_cgu_clk_info jz4740_cgu_clocks[] = {
 		"hclk", CGU_CLK_DIV,
 		.parents = { JZ4740_CLK_PLL, -1, -1, -1 },
 		.div = {
-			CGU_REG_CPCCR, 4, 1, 4, 22, -1, -1,
+			CGU_REG_CPCCR, 4, 1, 4, 22, -1, -1, 0,
 			jz4740_cgu_cpccr_div_table,
 		},
 	},
@@ -122,7 +122,7 @@ static const struct ingenic_cgu_clk_info jz4740_cgu_clocks[] = {
 		"pclk", CGU_CLK_DIV,
 		.parents = { JZ4740_CLK_PLL, -1, -1, -1 },
 		.div = {
-			CGU_REG_CPCCR, 8, 1, 4, 22, -1, -1,
+			CGU_REG_CPCCR, 8, 1, 4, 22, -1, -1, 0,
 			jz4740_cgu_cpccr_div_table,
 		},
 	},
@@ -131,7 +131,7 @@ static const struct ingenic_cgu_clk_info jz4740_cgu_clocks[] = {
 		"mclk", CGU_CLK_DIV,
 		.parents = { JZ4740_CLK_PLL, -1, -1, -1 },
 		.div = {
-			CGU_REG_CPCCR, 12, 1, 4, 22, -1, -1,
+			CGU_REG_CPCCR, 12, 1, 4, 22, -1, -1, 0,
 			jz4740_cgu_cpccr_div_table,
 		},
 	},
@@ -140,7 +140,7 @@ static const struct ingenic_cgu_clk_info jz4740_cgu_clocks[] = {
 		"lcd", CGU_CLK_DIV | CGU_CLK_GATE,
 		.parents = { JZ4740_CLK_PLL_HALF, -1, -1, -1 },
 		.div = {
-			CGU_REG_CPCCR, 16, 1, 5, 22, -1, -1,
+			CGU_REG_CPCCR, 16, 1, 5, 22, -1, -1, 0,
 			jz4740_cgu_cpccr_div_table,
 		},
 		.gate = { CGU_REG_CLKGR, 10 },
diff --git a/drivers/clk/ingenic/jz4770-cgu.c b/drivers/clk/ingenic/jz4770-cgu.c
index 9ea4490ecb7f..381a27f20b51 100644
--- a/drivers/clk/ingenic/jz4770-cgu.c
+++ b/drivers/clk/ingenic/jz4770-cgu.c
@@ -152,7 +152,7 @@ static const struct ingenic_cgu_clk_info jz4770_cgu_clocks[] = {
 		"cclk", CGU_CLK_DIV,
 		.parents = { JZ4770_CLK_PLL0, },
 		.div = {
-			CGU_REG_CPCCR, 0, 1, 4, 22, -1, -1,
+			CGU_REG_CPCCR, 0, 1, 4, 22, -1, -1, 0,
 			jz4770_cgu_cpccr_div_table,
 		},
 	},
@@ -160,7 +160,7 @@ static const struct ingenic_cgu_clk_info jz4770_cgu_clocks[] = {
 		"h0clk", CGU_CLK_DIV,
 		.parents = { JZ4770_CLK_PLL0, },
 		.div = {
-			CGU_REG_CPCCR, 4, 1, 4, 22, -1, -1,
+			CGU_REG_CPCCR, 4, 1, 4, 22, -1, -1, 0,
 			jz4770_cgu_cpccr_div_table,
 		},
 	},
@@ -168,7 +168,7 @@ static const struct ingenic_cgu_clk_info jz4770_cgu_clocks[] = {
 		"h1clk", CGU_CLK_DIV | CGU_CLK_GATE,
 		.parents = { JZ4770_CLK_PLL0, },
 		.div = {
-			CGU_REG_CPCCR, 24, 1, 4, 22, -1, -1,
+			CGU_REG_CPCCR, 24, 1, 4, 22, -1, -1, 0,
 			jz4770_cgu_cpccr_div_table,
 		},
 		.gate = { CGU_REG_CLKGR1, 7 },
@@ -177,7 +177,7 @@ static const struct ingenic_cgu_clk_info jz4770_cgu_clocks[] = {
 		"h2clk", CGU_CLK_DIV,
 		.parents = { JZ4770_CLK_PLL0, },
 		.div = {
-			CGU_REG_CPCCR, 16, 1, 4, 22, -1, -1,
+			CGU_REG_CPCCR, 16, 1, 4, 22, -1, -1, 0,
 			jz4770_cgu_cpccr_div_table,
 		},
 	},
@@ -185,7 +185,7 @@ static const struct ingenic_cgu_clk_info jz4770_cgu_clocks[] = {
 		"c1clk", CGU_CLK_DIV | CGU_CLK_GATE,
 		.parents = { JZ4770_CLK_PLL0, },
 		.div = {
-			CGU_REG_CPCCR, 12, 1, 4, 22, -1, -1,
+			CGU_REG_CPCCR, 12, 1, 4, 22, -1, -1, 0,
 			jz4770_cgu_cpccr_div_table,
 		},
 		.gate = { CGU_REG_OPCR, 31, true }, // disable CCLK stop on idle
@@ -194,7 +194,7 @@ static const struct ingenic_cgu_clk_info jz4770_cgu_clocks[] = {
 		"pclk", CGU_CLK_DIV,
 		.parents = { JZ4770_CLK_PLL0, },
 		.div = {
-			CGU_REG_CPCCR, 8, 1, 4, 22, -1, -1,
+			CGU_REG_CPCCR, 8, 1, 4, 22, -1, -1, 0,
 			jz4770_cgu_cpccr_div_table,
 		},
 	},
-- 
2.30.2

