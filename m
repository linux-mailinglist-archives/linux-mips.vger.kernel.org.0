Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FB98395212
	for <lists+linux-mips@lfdr.de>; Sun, 30 May 2021 18:50:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229901AbhE3Qvo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 30 May 2021 12:51:44 -0400
Received: from aposti.net ([89.234.176.197]:33452 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229887AbhE3Qvn (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 30 May 2021 12:51:43 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        list@opendingux.net,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 4/6] clk: ingenic: Remove pll_info.no_bypass_bit
Date:   Sun, 30 May 2021 17:49:21 +0100
Message-Id: <20210530164923.18134-5-paul@crapouillou.net>
In-Reply-To: <20210530164923.18134-1-paul@crapouillou.net>
References: <20210530164923.18134-1-paul@crapouillou.net>
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
2.30.2

