Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1535611F284
	for <lists+linux-mips@lfdr.de>; Sat, 14 Dec 2019 16:34:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726855AbfLNPeO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 14 Dec 2019 10:34:14 -0500
Received: from out28-217.mail.aliyun.com ([115.124.28.217]:43933 "EHLO
        out28-217.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726687AbfLNPeN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 14 Dec 2019 10:34:13 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436416|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.280575-0.0161179-0.703307;DS=CONTINUE|ham_regular_dialog|0.0529613-0.000554143-0.946485;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03309;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=13;RT=13;SR=0;TI=SMTPD_---.GH4QmPi_1576337632;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GH4QmPi_1576337632)
          by smtp.aliyun-inc.com(10.147.41.143);
          Sat, 14 Dec 2019 23:34:00 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        paul.burton@mips.com, paulburton@kernel.org, paul@crapouillou.net,
        mturquette@baylibre.com, sboyd@kernel.org, mark.rutland@arm.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Subject: [PATCH v3 2/5] clk: Ingenic: Adjust cgu code to make it compatible with X1830.
Date:   Sat, 14 Dec 2019 23:33:47 +0800
Message-Id: <1576337630-78576-4-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576337630-78576-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1576337630-78576-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The PLL of X1830 Soc from Ingenic has been greatly changed,
the bypass control is placed in another register, so now two
registers may needed to control the PLL. To this end, the
original "reg" was changed to "pll_reg", and a new "bypass_reg"
was introduced. In addition, when calculating rate, the PLL of
X1830 introduced an extra 2x multiplier, so a new "rate_multiplier"
was introduced.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---

Notes:
    v1->v2:
    1.Use two fields (pll_reg & bypass_reg) instead of the 2-values
      array (reg[2]).
    2.Remove the "pll_info->version" and add a "pll_info->rate_multiplier".
    3.Fix the coding style and add more detailed commit message.
    4.Change my Signed-off-by from "Zhou Yanjie <zhouyanjie@zoho.com>"
      to "周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>" because
      the old mailbox is in an unstable state.
    
    v2->v3:
    Adjust order from [1/5] in v2 to [2/5] in v3.

 drivers/clk/ingenic/cgu.c | 30 +++++++++++++++++++-----------
 drivers/clk/ingenic/cgu.h |  8 ++++++--
 2 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/ingenic/cgu.c b/drivers/clk/ingenic/cgu.c
index 8bd3998..3c95451 100644
--- a/drivers/clk/ingenic/cgu.c
+++ b/drivers/clk/ingenic/cgu.c
@@ -82,7 +82,7 @@ ingenic_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 	BUG_ON(clk_info->type != CGU_CLK_PLL);
 	pll_info = &clk_info->pll;
 
-	ctl = readl(cgu->base + pll_info->reg);
+	ctl = readl(cgu->base + pll_info->pll_reg);
 
 	m = (ctl >> pll_info->m_shift) & GENMASK(pll_info->m_bits - 1, 0);
 	m += pll_info->m_offset;
@@ -90,6 +90,9 @@ ingenic_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 	n += pll_info->n_offset;
 	od_enc = ctl >> pll_info->od_shift;
 	od_enc &= GENMASK(pll_info->od_bits - 1, 0);
+
+	ctl = readl(cgu->base + pll_info->bypass_reg);
+
 	bypass = !pll_info->no_bypass_bit &&
 		 !!(ctl & BIT(pll_info->bypass_bit));
 
@@ -103,7 +106,7 @@ ingenic_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 	BUG_ON(od == pll_info->od_max);
 	od++;
 
-	return div_u64((u64)parent_rate * m, n * od);
+	return div_u64((u64)parent_rate * m * pll_info->rate_multiplier, n * od);
 }
 
 static unsigned long
@@ -136,7 +139,7 @@ ingenic_pll_calc(const struct ingenic_cgu_clk_info *clk_info,
 	if (pod)
 		*pod = od;
 
-	return div_u64((u64)parent_rate * m, n * od);
+	return div_u64((u64)parent_rate * m * pll_info->rate_multiplier, n * od);
 }
 
 static inline const struct ingenic_cgu_clk_info *to_clk_info(
@@ -180,7 +183,7 @@ ingenic_pll_set_rate(struct clk_hw *hw, unsigned long req_rate,
 			clk_info->name, req_rate, rate);
 
 	spin_lock_irqsave(&cgu->lock, flags);
-	ctl = readl(cgu->base + pll_info->reg);
+	ctl = readl(cgu->base + pll_info->pll_reg);
 
 	ctl &= ~(GENMASK(pll_info->m_bits - 1, 0) << pll_info->m_shift);
 	ctl |= (m - pll_info->m_offset) << pll_info->m_shift;
@@ -191,7 +194,7 @@ ingenic_pll_set_rate(struct clk_hw *hw, unsigned long req_rate,
 	ctl &= ~(GENMASK(pll_info->od_bits - 1, 0) << pll_info->od_shift);
 	ctl |= pll_info->od_encoding[od - 1] << pll_info->od_shift;
 
-	writel(ctl, cgu->base + pll_info->reg);
+	writel(ctl, cgu->base + pll_info->pll_reg);
 	spin_unlock_irqrestore(&cgu->lock, flags);
 
 	return 0;
@@ -209,16 +212,21 @@ static int ingenic_pll_enable(struct clk_hw *hw)
 	u32 ctl;
 
 	spin_lock_irqsave(&cgu->lock, flags);
-	ctl = readl(cgu->base + pll_info->reg);
+	ctl = readl(cgu->base + pll_info->bypass_reg);
 
 	ctl &= ~BIT(pll_info->bypass_bit);
+
+	writel(ctl, cgu->base + pll_info->bypass_reg);
+
+	ctl = readl(cgu->base + pll_info->pll_reg);
+
 	ctl |= BIT(pll_info->enable_bit);
 
-	writel(ctl, cgu->base + pll_info->reg);
+	writel(ctl, cgu->base + pll_info->pll_reg);
 
 	/* wait for the PLL to stabilise */
 	for (i = 0; i < timeout; i++) {
-		ctl = readl(cgu->base + pll_info->reg);
+		ctl = readl(cgu->base + pll_info->pll_reg);
 		if (ctl & BIT(pll_info->stable_bit))
 			break;
 		mdelay(1);
@@ -242,11 +250,11 @@ static void ingenic_pll_disable(struct clk_hw *hw)
 	u32 ctl;
 
 	spin_lock_irqsave(&cgu->lock, flags);
-	ctl = readl(cgu->base + pll_info->reg);
+	ctl = readl(cgu->base + pll_info->pll_reg);
 
 	ctl &= ~BIT(pll_info->enable_bit);
 
-	writel(ctl, cgu->base + pll_info->reg);
+	writel(ctl, cgu->base + pll_info->pll_reg);
 	spin_unlock_irqrestore(&cgu->lock, flags);
 }
 
@@ -258,7 +266,7 @@ static int ingenic_pll_is_enabled(struct clk_hw *hw)
 	const struct ingenic_cgu_pll_info *pll_info = &clk_info->pll;
 	u32 ctl;
 
-	ctl = readl(cgu->base + pll_info->reg);
+	ctl = readl(cgu->base + pll_info->pll_reg);
 
 	return !!(ctl & BIT(pll_info->enable_bit));
 }
diff --git a/drivers/clk/ingenic/cgu.h b/drivers/clk/ingenic/cgu.h
index 0dc8004..f7b6908 100644
--- a/drivers/clk/ingenic/cgu.h
+++ b/drivers/clk/ingenic/cgu.h
@@ -16,7 +16,9 @@
 
 /**
  * struct ingenic_cgu_pll_info - information about a PLL
- * @reg: the offset of the PLL's control register within the CGU
+ * @pll_reg: the offset of the PLL's control register within the CGU
+ * @bypass_reg: the offset of the bypass control register within the CGU
+ * @rate_multiplier: the multiplier needed by pll rate calculation
  * @m_shift: the number of bits to shift the multiplier value by (ie. the
  *           index of the lowest bit of the multiplier value in the PLL's
  *           control register)
@@ -43,7 +45,9 @@
  * @no_bypass_bit: if set, the PLL has no bypass functionality
  */
 struct ingenic_cgu_pll_info {
-	unsigned reg;
+	unsigned pll_reg;
+	unsigned bypass_reg;
+	unsigned rate_multiplier;
 	const s8 *od_encoding;
 	u8 m_shift, m_bits, m_offset;
 	u8 n_shift, n_bits, n_offset;
-- 
2.7.4

