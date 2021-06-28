Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72F613B6846
	for <lists+linux-mips@lfdr.de>; Mon, 28 Jun 2021 20:21:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233716AbhF1SX1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 28 Jun 2021 14:23:27 -0400
Received: from out28-125.mail.aliyun.com ([115.124.28.125]:60040 "EHLO
        out28-125.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233478AbhF1SXU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 28 Jun 2021 14:23:20 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436541|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0195473-0.00039859-0.980054;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047203;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=14;RT=14;SR=0;TI=SMTPD_---.KZOO9TY_1624904444;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.KZOO9TY_1624904444)
          by smtp.aliyun-inc.com(10.147.42.253);
          Tue, 29 Jun 2021 02:20:51 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org
Cc:     linux-mips@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        paul@crapouillou.net, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        sihui.liu@ingenic.com, jun.jiang@ingenic.com,
        sernia.zhou@foxmail.com
Subject: [PATCH v5 02/11] clk: Ingenic: Adjust cgu code to make it compatible with I2S PLL.
Date:   Tue, 29 Jun 2021 02:20:35 +0800
Message-Id: <1624904444-2618-3-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1624904444-2618-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1624904444-2618-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

I2S PLL is different from the APLL/MPLL, which have no OD bits,
no stable bit, but have parent clock selection bits, therefore,
it is necessary to modify the CGU PLL correlation code to make
it compatible with I2S PLL.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---

Notes:
    v5:
    New patch.

 drivers/clk/ingenic/cgu.c | 118 ++++++++++++++++++++++++++++++++++++++++------
 drivers/clk/ingenic/cgu.h |   1 +
 2 files changed, 104 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/ingenic/cgu.c b/drivers/clk/ingenic/cgu.c
index 266c759..391bf50 100644
--- a/drivers/clk/ingenic/cgu.c
+++ b/drivers/clk/ingenic/cgu.c
@@ -76,6 +76,85 @@ ingenic_cgu_gate_set(struct ingenic_cgu *cgu,
  * PLL operations
  */
 
+static u8 ingenic_pll_get_parent(struct clk_hw *hw)
+{
+	struct ingenic_clk *ingenic_clk = to_ingenic_clk(hw);
+	const struct ingenic_cgu_clk_info *clk_info = to_clk_info(ingenic_clk);
+	struct ingenic_cgu *cgu = ingenic_clk->cgu;
+	const struct ingenic_cgu_pll_info *pll_info;
+	u32 reg;
+	u8 i, hw_idx, idx = 0;
+
+	BUG_ON(clk_info->type != CGU_CLK_PLL);
+	pll_info = &clk_info->pll;
+
+	if (pll_info->mux_bits <= 0)
+		return 1;
+
+	reg = readl(cgu->base + pll_info->reg);
+	hw_idx = (reg >> pll_info->mux_shift) &
+		 GENMASK(pll_info->mux_bits - 1, 0);
+
+	/*
+	 * Convert the hardware index to the parent index by skipping
+	 * over any -1's in the parents array.
+	 */
+	for (i = 0; i < hw_idx; i++) {
+		if (clk_info->parents[i] != -1)
+			idx++;
+	}
+
+	return idx;
+}
+
+static int ingenic_pll_set_parent(struct clk_hw *hw, u8 idx)
+{
+	struct ingenic_clk *ingenic_clk = to_ingenic_clk(hw);
+	const struct ingenic_cgu_clk_info *clk_info = to_clk_info(ingenic_clk);
+	struct ingenic_cgu *cgu = ingenic_clk->cgu;
+	const struct ingenic_cgu_pll_info *pll_info;
+	unsigned long flags;
+	u32 reg;
+	u8 curr_idx, hw_idx, num_poss;
+
+	BUG_ON(clk_info->type != CGU_CLK_PLL);
+	pll_info = &clk_info->pll;
+
+	if (pll_info->mux_bits <= 0)
+		return 0;
+
+	/*
+	 * Convert the parent index to the hardware index by adding
+	 * 1 for any -1 in the parents array preceding the given
+	 * index. That is, we want the index of idx'th entry in
+	 * clk_info->parents which does not equal -1.
+	 */
+	hw_idx = curr_idx = 0;
+	num_poss = 1 << pll_info->mux_bits;
+	for (; hw_idx < num_poss; hw_idx++) {
+		if (clk_info->parents[hw_idx] == -1)
+			continue;
+		if (curr_idx == idx)
+			break;
+		curr_idx++;
+	}
+
+	/* idx should always be a valid parent */
+	BUG_ON(curr_idx != idx);
+
+	spin_lock_irqsave(&cgu->lock, flags);
+
+	/* write the register */
+	reg = readl(cgu->base + pll_info->reg);
+	reg &= ~(GENMASK(pll_info->mux_bits - 1, 0) << pll_info->mux_shift);
+	reg |= hw_idx << pll_info->mux_shift;
+	writel(reg, cgu->base + pll_info->reg);
+
+	spin_unlock_irqrestore(&cgu->lock, flags);
+
+	return 0;
+}
+
 static unsigned long
 ingenic_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 {
@@ -96,8 +175,20 @@ ingenic_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 	m += pll_info->m_offset;
 	n = (ctl >> pll_info->n_shift) & GENMASK(pll_info->n_bits - 1, 0);
 	n += pll_info->n_offset;
-	od_enc = ctl >> pll_info->od_shift;
-	od_enc &= GENMASK(pll_info->od_bits - 1, 0);
+
+	if (pll_info->od_encoding) {
+		od_enc = ctl >> pll_info->od_shift;
+		od_enc &= GENMASK(pll_info->od_bits - 1, 0);
+
+		for (od = 0; od < pll_info->od_max; od++) {
+			if (pll_info->od_encoding[od] == od_enc)
+				break;
+		}
+		BUG_ON(od == pll_info->od_max);
+		od++;
+	} else {
+		od = 1;
+	}
 
 	if (pll_info->bypass_bit >= 0) {
 		ctl = readl(cgu->base + pll_info->bypass_reg);
@@ -108,15 +199,7 @@ ingenic_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 			return parent_rate;
 	}
 
-	for (od = 0; od < pll_info->od_max; od++) {
-		if (pll_info->od_encoding[od] == od_enc)
-			break;
-	}
-	BUG_ON(od == pll_info->od_max);
-	od++;
-
-	return div_u64((u64)parent_rate * m * pll_info->rate_multiplier,
-		n * od);
+	return div_u64((u64)parent_rate * m * pll_info->rate_multiplier, n * od);
 }
 
 static void
@@ -215,13 +298,15 @@ ingenic_pll_set_rate(struct clk_hw *hw, unsigned long req_rate,
 	ctl &= ~(GENMASK(pll_info->n_bits - 1, 0) << pll_info->n_shift);
 	ctl |= (n - pll_info->n_offset) << pll_info->n_shift;
 
-	ctl &= ~(GENMASK(pll_info->od_bits - 1, 0) << pll_info->od_shift);
-	ctl |= pll_info->od_encoding[od - 1] << pll_info->od_shift;
+	if (pll_info->od_encoding) {
+		ctl &= ~(GENMASK(pll_info->od_bits - 1, 0) << pll_info->od_shift);
+		ctl |= pll_info->od_encoding[od - 1] << pll_info->od_shift;
+	}
 
 	writel(ctl, cgu->base + pll_info->reg);
 
 	/* If the PLL is enabled, verify that it's stable */
-	if (ctl & BIT(pll_info->enable_bit))
+	if ((pll_info->stable_bit >= 0) && (ctl & BIT(pll_info->enable_bit)))
 		ret = ingenic_pll_check_stable(cgu, pll_info);
 
 	spin_unlock_irqrestore(&cgu->lock, flags);
@@ -292,6 +377,9 @@ static int ingenic_pll_is_enabled(struct clk_hw *hw)
 }
 
 static const struct clk_ops ingenic_pll_ops = {
+	.get_parent = ingenic_pll_get_parent,
+	.set_parent = ingenic_pll_set_parent,
+
 	.recalc_rate = ingenic_pll_recalc_rate,
 	.round_rate = ingenic_pll_round_rate,
 	.set_rate = ingenic_pll_set_rate,
@@ -672,7 +760,7 @@ static int ingenic_register_clock(struct ingenic_cgu *cgu, unsigned idx)
 		clk_init.flags |= CLK_SET_RATE_PARENT;
 	}
 
-	if (caps & (CGU_CLK_MUX | CGU_CLK_CUSTOM)) {
+	if (caps & (CGU_CLK_PLL | CGU_CLK_MUX | CGU_CLK_CUSTOM)) {
 		clk_init.num_parents = 0;
 
 		if (caps & CGU_CLK_MUX)
diff --git a/drivers/clk/ingenic/cgu.h b/drivers/clk/ingenic/cgu.h
index bfc2b9c..87d716e 100644
--- a/drivers/clk/ingenic/cgu.h
+++ b/drivers/clk/ingenic/cgu.h
@@ -48,6 +48,7 @@ struct ingenic_cgu_pll_info {
 	unsigned reg;
 	unsigned rate_multiplier;
 	const s8 *od_encoding;
+	u8 mux_shift, mux_bits;
 	u8 m_shift, m_bits, m_offset;
 	u8 n_shift, n_bits, n_offset;
 	u8 od_shift, od_bits, od_max;
-- 
2.7.4

