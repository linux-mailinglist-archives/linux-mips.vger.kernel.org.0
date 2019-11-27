Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7574610A91A
	for <lists+linux-mips@lfdr.de>; Wed, 27 Nov 2019 04:34:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726729AbfK0DeH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 Nov 2019 22:34:07 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25895 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726664AbfK0DeH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 Nov 2019 22:34:07 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1574825622; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=d2pQ32r98WmvTqMxDs76cFGwuQX161v8Wy8ijW75aT5Lyz2QgRxvpwSq25r5/Su7U+OWQEwEeCVmA4WVpESAKuVGjxHorPS+y2v389OXXPU0k8BTgl+wnJ3XYaRKyIw+rdrQ5aPnA2Eu0SMuQHnXyQNNxjr7zoPdXPAR3ZEqy1k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1574825622; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=+doOzuXa3LtRkn7hXvpxk2eD3ZYd0To77WwPb86Dr24=; 
        b=Qmk19PtbC+eeUv2jdMgF9vGr9PR1l/FGS+Ay6egYMYH6cvEGDMJYOu+La1/nXNKbaFVHRBRC7BZSzSp7rEXv1CLz6DyFkqiYcMEqhvgtYQwl/FnVr4UjCDGP2EYi7XQx/+4avIkyb4b72OcLnUbM0qjSjxohsJCJ2oetIw9u63o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=A+ntKLG11CvDl51ARsyy40bQeZSS4daaEtsxvo5RO3JwcTFslhb9gbNWGTXFsaX+kfQNRPFqneeZ
    mfyPbUlPQ+jNcJQIlxhcaZaCcNctxX4yKH8G5B8fxGigDHF4oz8Z  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574825622;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=+doOzuXa3LtRkn7hXvpxk2eD3ZYd0To77WwPb86Dr24=;
        b=R9/w4klAMDlSOKSdjGzzxoeGT77UosloGP7PT7VVLUxppG4v/BMrJoFoYa43Hclz
        Vm3guXP6Y08a4Qh0X6Bh47OEwAAF/FOR1RBBja0QT598KMveZDykOcvS3/PcuSvGUxM
        FrPBOJHLOGeAUpbJPq4NNpmjF2QAfnrhpJx0PLQA=
Received: from zhouyanjie-virtual-machine.localdomain (139.207.174.158 [139.207.174.158]) by mx.zohomail.com
        with SMTPS id 1574825620350562.281348884933; Tue, 26 Nov 2019 19:33:40 -0800 (PST)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        paul.burton@mips.com, paulburton@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, mark.rutland@arm.com,
        syq@debian.org, paul@crapouillou.net, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com
Subject: [PATCH 1/5] clk: Ingenic: Adjust code to make it compatible with X1830.
Date:   Wed, 27 Nov 2019 11:32:52 +0800
Message-Id: <1574825576-91028-2-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574825576-91028-1-git-send-email-zhouyanjie@zoho.com>
References: <1574825576-91028-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

1.Adjust the PLL related code in "cgu.c" and "cgu.h" to make it
  compatible with the X1830 Soc from Ingenic.
2.Adjust the code in "jz4740-cgu.c" to be compatible with the
  new cgu code.
3.Adjust the code in "jz4725b-cgu.c" to be compatible with the
  new cgu code.
4.Adjust the code in "jz4770-cgu.c" to be compatible with the
  new cgu code.
5.Adjust the code in "jz4780-cgu.c" to be compatible with the
  new cgu code.
6.Adjust the code in "x1000-cgu.c" to be compatible with the
  new cgu code.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 drivers/clk/ingenic/cgu.c         | 55 +++++++++++++++++++++++++++++----------
 drivers/clk/ingenic/cgu.h         | 12 ++++++++-
 drivers/clk/ingenic/jz4725b-cgu.c |  3 ++-
 drivers/clk/ingenic/jz4740-cgu.c  |  3 ++-
 drivers/clk/ingenic/jz4770-cgu.c  |  6 +++--
 drivers/clk/ingenic/jz4780-cgu.c  |  3 ++-
 drivers/clk/ingenic/x1000-cgu.c   |  6 +++--
 7 files changed, 66 insertions(+), 22 deletions(-)

diff --git a/drivers/clk/ingenic/cgu.c b/drivers/clk/ingenic/cgu.c
index 6e96303..c3c69a8 100644
--- a/drivers/clk/ingenic/cgu.c
+++ b/drivers/clk/ingenic/cgu.c
@@ -84,7 +84,7 @@ ingenic_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 	pll_info = &clk_info->pll;
 
 	spin_lock_irqsave(&cgu->lock, flags);
-	ctl = readl(cgu->base + pll_info->reg);
+	ctl = readl(cgu->base + pll_info->reg[1]);
 	spin_unlock_irqrestore(&cgu->lock, flags);
 
 	m = (ctl >> pll_info->m_shift) & GENMASK(pll_info->m_bits - 1, 0);
@@ -93,8 +93,17 @@ ingenic_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 	n += pll_info->n_offset;
 	od_enc = ctl >> pll_info->od_shift;
 	od_enc &= GENMASK(pll_info->od_bits - 1, 0);
-	bypass = !pll_info->no_bypass_bit &&
-		 !!(ctl & BIT(pll_info->bypass_bit));
+
+	if (pll_info->version >= CGU_X1830) {
+		spin_lock_irqsave(&cgu->lock, flags);
+		ctl = readl(cgu->base + pll_info->reg[0]);
+		spin_unlock_irqrestore(&cgu->lock, flags);
+
+		bypass = !pll_info->no_bypass_bit &&
+			 !!(ctl & BIT(pll_info->bypass_bit));
+	} else
+		bypass = !pll_info->no_bypass_bit &&
+			 !!(ctl & BIT(pll_info->bypass_bit));
 
 	if (bypass)
 		return parent_rate;
@@ -106,7 +115,10 @@ ingenic_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 	BUG_ON(od == pll_info->od_max);
 	od++;
 
-	return div_u64((u64)parent_rate * m, n * od);
+	if (pll_info->version >= CGU_X1830)
+		return div_u64((u64)parent_rate * m * 2, n * od);
+	else
+		return div_u64((u64)parent_rate * m, n * od);
 }
 
 static unsigned long
@@ -139,7 +151,10 @@ ingenic_pll_calc(const struct ingenic_cgu_clk_info *clk_info,
 	if (pod)
 		*pod = od;
 
-	return div_u64((u64)parent_rate * m, n * od);
+	if (pll_info->version >= CGU_X1830)
+		return div_u64((u64)parent_rate * m * 2, n * od);
+	else
+		return div_u64((u64)parent_rate * m, n * od);
 }
 
 static inline const struct ingenic_cgu_clk_info *to_clk_info(
@@ -183,7 +198,7 @@ ingenic_pll_set_rate(struct clk_hw *hw, unsigned long req_rate,
 			clk_info->name, req_rate, rate);
 
 	spin_lock_irqsave(&cgu->lock, flags);
-	ctl = readl(cgu->base + pll_info->reg);
+	ctl = readl(cgu->base + pll_info->reg[1]);
 
 	ctl &= ~(GENMASK(pll_info->m_bits - 1, 0) << pll_info->m_shift);
 	ctl |= (m - pll_info->m_offset) << pll_info->m_shift;
@@ -194,7 +209,7 @@ ingenic_pll_set_rate(struct clk_hw *hw, unsigned long req_rate,
 	ctl &= ~(GENMASK(pll_info->od_bits - 1, 0) << pll_info->od_shift);
 	ctl |= pll_info->od_encoding[od - 1] << pll_info->od_shift;
 
-	writel(ctl, cgu->base + pll_info->reg);
+	writel(ctl, cgu->base + pll_info->reg[1]);
 	spin_unlock_irqrestore(&cgu->lock, flags);
 
 	return 0;
@@ -212,16 +227,28 @@ static int ingenic_pll_enable(struct clk_hw *hw)
 	u32 ctl;
 
 	spin_lock_irqsave(&cgu->lock, flags);
-	ctl = readl(cgu->base + pll_info->reg);
 
-	ctl &= ~BIT(pll_info->bypass_bit);
+	if (pll_info->version >= CGU_X1830) {
+		ctl = readl(cgu->base + pll_info->reg[0]);
+
+		ctl &= ~BIT(pll_info->bypass_bit);
+
+		writel(ctl, cgu->base + pll_info->reg[0]);
+
+		ctl = readl(cgu->base + pll_info->reg[1]);
+	} else {
+		ctl = readl(cgu->base + pll_info->reg[1]);
+
+		ctl &= ~BIT(pll_info->bypass_bit);
+	}
+
 	ctl |= BIT(pll_info->enable_bit);
 
-	writel(ctl, cgu->base + pll_info->reg);
+	writel(ctl, cgu->base + pll_info->reg[1]);
 
 	/* wait for the PLL to stabilise */
 	for (i = 0; i < timeout; i++) {
-		ctl = readl(cgu->base + pll_info->reg);
+		ctl = readl(cgu->base + pll_info->reg[1]);
 		if (ctl & BIT(pll_info->stable_bit))
 			break;
 		mdelay(1);
@@ -245,11 +272,11 @@ static void ingenic_pll_disable(struct clk_hw *hw)
 	u32 ctl;
 
 	spin_lock_irqsave(&cgu->lock, flags);
-	ctl = readl(cgu->base + pll_info->reg);
+	ctl = readl(cgu->base + pll_info->reg[1]);
 
 	ctl &= ~BIT(pll_info->enable_bit);
 
-	writel(ctl, cgu->base + pll_info->reg);
+	writel(ctl, cgu->base + pll_info->reg[1]);
 	spin_unlock_irqrestore(&cgu->lock, flags);
 }
 
@@ -263,7 +290,7 @@ static int ingenic_pll_is_enabled(struct clk_hw *hw)
 	u32 ctl;
 
 	spin_lock_irqsave(&cgu->lock, flags);
-	ctl = readl(cgu->base + pll_info->reg);
+	ctl = readl(cgu->base + pll_info->reg[1]);
 	spin_unlock_irqrestore(&cgu->lock, flags);
 
 	return !!(ctl & BIT(pll_info->enable_bit));
diff --git a/drivers/clk/ingenic/cgu.h b/drivers/clk/ingenic/cgu.h
index 0dc8004..5f87be4 100644
--- a/drivers/clk/ingenic/cgu.h
+++ b/drivers/clk/ingenic/cgu.h
@@ -42,8 +42,18 @@
  * @stable_bit: the index of the stable bit in the PLL control register
  * @no_bypass_bit: if set, the PLL has no bypass functionality
  */
+enum ingenic_cgu_version {
+	CGU_JZ4740,
+	CGU_JZ4725B,
+	CGU_JZ4770,
+	CGU_JZ4780,
+	CGU_X1000,
+	CGU_X1830,
+};
+
 struct ingenic_cgu_pll_info {
-	unsigned reg;
+	enum ingenic_cgu_version version;
+	unsigned reg[2];
 	const s8 *od_encoding;
 	u8 m_shift, m_bits, m_offset;
 	u8 n_shift, n_bits, n_offset;
diff --git a/drivers/clk/ingenic/jz4725b-cgu.c b/drivers/clk/ingenic/jz4725b-cgu.c
index a3b4635..6da7b41 100644
--- a/drivers/clk/ingenic/jz4725b-cgu.c
+++ b/drivers/clk/ingenic/jz4725b-cgu.c
@@ -53,7 +53,8 @@ static const struct ingenic_cgu_clk_info jz4725b_cgu_clocks[] = {
 		"pll", CGU_CLK_PLL,
 		.parents = { JZ4725B_CLK_EXT, -1, -1, -1 },
 		.pll = {
-			.reg = CGU_REG_CPPCR,
+			.version = CGU_JZ4725B,
+			.reg = { -1, CGU_REG_CPPCR },
 			.m_shift = 23,
 			.m_bits = 9,
 			.m_offset = 2,
diff --git a/drivers/clk/ingenic/jz4740-cgu.c b/drivers/clk/ingenic/jz4740-cgu.c
index 4f0e92c..3cf800d 100644
--- a/drivers/clk/ingenic/jz4740-cgu.c
+++ b/drivers/clk/ingenic/jz4740-cgu.c
@@ -68,7 +68,8 @@ static const struct ingenic_cgu_clk_info jz4740_cgu_clocks[] = {
 		"pll", CGU_CLK_PLL,
 		.parents = { JZ4740_CLK_EXT, -1, -1, -1 },
 		.pll = {
-			.reg = CGU_REG_CPPCR,
+			.version = CGU_JZ4740,
+			.reg = { -1, CGU_REG_CPPCR },
 			.m_shift = 23,
 			.m_bits = 9,
 			.m_offset = 2,
diff --git a/drivers/clk/ingenic/jz4770-cgu.c b/drivers/clk/ingenic/jz4770-cgu.c
index 956dd65..a62dfb1 100644
--- a/drivers/clk/ingenic/jz4770-cgu.c
+++ b/drivers/clk/ingenic/jz4770-cgu.c
@@ -101,7 +101,8 @@ static const struct ingenic_cgu_clk_info jz4770_cgu_clocks[] = {
 		"pll0", CGU_CLK_PLL,
 		.parents = { JZ4770_CLK_EXT },
 		.pll = {
-			.reg = CGU_REG_CPPCR0,
+			.version = CGU_JZ4770,
+			.reg = { -1, CGU_REG_CPPCR0 },
 			.m_shift = 24,
 			.m_bits = 7,
 			.m_offset = 1,
@@ -123,7 +124,8 @@ static const struct ingenic_cgu_clk_info jz4770_cgu_clocks[] = {
 		"pll1", CGU_CLK_PLL,
 		.parents = { JZ4770_CLK_EXT },
 		.pll = {
-			.reg = CGU_REG_CPPCR1,
+			.version = CGU_JZ4770,
+			.reg = { -1, CGU_REG_CPPCR1 },
 			.m_shift = 24,
 			.m_bits = 7,
 			.m_offset = 1,
diff --git a/drivers/clk/ingenic/jz4780-cgu.c b/drivers/clk/ingenic/jz4780-cgu.c
index ea905ff..59356d1b 100644
--- a/drivers/clk/ingenic/jz4780-cgu.c
+++ b/drivers/clk/ingenic/jz4780-cgu.c
@@ -220,7 +220,8 @@ static const struct ingenic_cgu_clk_info jz4780_cgu_clocks[] = {
 	/* PLLs */
 
 #define DEF_PLL(name) { \
-	.reg = CGU_REG_ ## name, \
+	.version = CGU_JZ4780, \
+	.reg = { -1, CGU_REG_ ## name }, \
 	.m_shift = 19, \
 	.m_bits = 13, \
 	.m_offset = 1, \
diff --git a/drivers/clk/ingenic/x1000-cgu.c b/drivers/clk/ingenic/x1000-cgu.c
index b22d87b..7179b9f 100644
--- a/drivers/clk/ingenic/x1000-cgu.c
+++ b/drivers/clk/ingenic/x1000-cgu.c
@@ -57,7 +57,8 @@ static const struct ingenic_cgu_clk_info x1000_cgu_clocks[] = {
 		"apll", CGU_CLK_PLL,
 		.parents = { X1000_CLK_EXCLK, -1, -1, -1 },
 		.pll = {
-			.reg = CGU_REG_APLL,
+			.version = CGU_X1000,
+			.reg = { -1, CGU_REG_APLL },
 			.m_shift = 24,
 			.m_bits = 7,
 			.m_offset = 1,
@@ -78,7 +79,8 @@ static const struct ingenic_cgu_clk_info x1000_cgu_clocks[] = {
 		"mpll", CGU_CLK_PLL,
 		.parents = { X1000_CLK_EXCLK, -1, -1, -1 },
 		.pll = {
-			.reg = CGU_REG_MPLL,
+			.version = CGU_X1000,
+			.reg = { -1, CGU_REG_MPLL },
 			.m_shift = 24,
 			.m_bits = 7,
 			.m_offset = 1,
-- 
2.7.4


