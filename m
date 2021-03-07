Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F5813301F7
	for <lists+linux-mips@lfdr.de>; Sun,  7 Mar 2021 15:19:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232192AbhCGOS7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 7 Mar 2021 09:18:59 -0500
Received: from aposti.net ([89.234.176.197]:51684 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230439AbhCGOSm (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 7 Mar 2021 09:18:42 -0500
From:   Paul Cercueil <paul@crapouillou.net>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Zhou Yanjie <zhouyanjie@wanyeetech.com>
Cc:     od@zcrc.me, linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 4/6] clk: ingenic: Remove pll_info.no_bypass_bit
Date:   Sun,  7 Mar 2021 14:17:57 +0000
Message-Id: <20210307141759.30426-5-paul@crapouillou.net>
In-Reply-To: <20210307141759.30426-1-paul@crapouillou.net>
References: <20210307141759.30426-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

We can express that a PLL has no bypass bit by simply setting the
.bypass_bit field to a negative value.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/clk/ingenic/cgu.c        | 4 ++--
 drivers/clk/ingenic/cgu.h        | 7 +++----
 drivers/clk/ingenic/jz4770-cgu.c | 3 +--
 3 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/ingenic/cgu.c b/drivers/clk/ingenic/cgu.c
index 7686072aff8f..58f7ab5cf0fe 100644
--- a/drivers/clk/ingenic/cgu.c
+++ b/drivers/clk/ingenic/cgu.c
@@ -99,7 +99,7 @@ ingenic_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 	od_enc = ctl >> pll_info->od_shift;
 	od_enc &= GENMASK(pll_info->od_bits - 1, 0);
 
-	if (!pll_info->no_bypass_bit) {
+	if (pll_info->bypass_bit >= 0) {
 		ctl = readl(cgu->base + pll_info->bypass_reg);
 
 		bypass = !!(ctl & BIT(pll_info->bypass_bit));
@@ -226,7 +226,7 @@ static int ingenic_pll_enable(struct clk_hw *hw)
 	u32 ctl;
 
 	spin_lock_irqsave(&cgu->lock, flags);
-	if (!pll_info->no_bypass_bit) {
+	if (pll_info->bypass_bit >= 0) {
 		ctl = readl(cgu->base + pll_info->bypass_reg);
 
 		ctl &= ~BIT(pll_info->bypass_bit);
diff --git a/drivers/clk/ingenic/cgu.h b/drivers/clk/ingenic/cgu.h
index 44d97a259692..10521d1b7b12 100644
--- a/drivers/clk/ingenic/cgu.h
+++ b/drivers/clk/ingenic/cgu.h
@@ -39,10 +39,10 @@
  *               their encoded values in the PLL control register, or -1 for
  *               unsupported values
  * @bypass_reg: the offset of the bypass control register within the CGU
- * @bypass_bit: the index of the bypass bit in the PLL control register
+ * @bypass_bit: the index of the bypass bit in the PLL control register, or
+ *              -1 if there is no bypass bit
  * @enable_bit: the index of the enable bit in the PLL control register
  * @stable_bit: the index of the stable bit in the PLL control register
- * @no_bypass_bit: if set, the PLL has no bypass functionality
  */
 struct ingenic_cgu_pll_info {
 	unsigned reg;
@@ -52,10 +52,9 @@ struct ingenic_cgu_pll_info {
 	u8 n_shift, n_bits, n_offset;
 	u8 od_shift, od_bits, od_max;
 	unsigned bypass_reg;
-	u8 bypass_bit;
+	s8 bypass_bit;
 	u8 enable_bit;
 	u8 stable_bit;
-	bool no_bypass_bit;
 };
 
 /**
diff --git a/drivers/clk/ingenic/jz4770-cgu.c b/drivers/clk/ingenic/jz4770-cgu.c
index 381a27f20b51..2321742b3471 100644
--- a/drivers/clk/ingenic/jz4770-cgu.c
+++ b/drivers/clk/ingenic/jz4770-cgu.c
@@ -139,8 +139,7 @@ static const struct ingenic_cgu_clk_info jz4770_cgu_clocks[] = {
 			.od_bits = 2,
 			.od_max = 8,
 			.od_encoding = pll_od_encoding,
-			.bypass_reg = CGU_REG_CPPCR1,
-			.no_bypass_bit = true,
+			.bypass_bit = -1,
 			.enable_bit = 7,
 			.stable_bit = 6,
 		},
-- 
2.30.1

