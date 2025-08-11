Return-Path: <linux-mips+bounces-10163-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D9EB20FBC
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 17:33:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38A1D682402
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 15:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81792307ACE;
	Mon, 11 Aug 2025 15:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LG6fbJnF"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBF72F1FF1;
	Mon, 11 Aug 2025 15:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754925518; cv=none; b=irK6qiQX5OV8eAhnPU1VEQANf0IgwCx/OtmyoNbbKR6+hhhP/MQa85Tb8jG3zkO3vw+9kvncj5fEmm8td932xHQvY187sp/QZjQSzS2xKyf9IjEszWTrC9GCrHdJ2Wz22RFpTbI73R9nAfCrMM2XR8jb+WeyZ7wA3Fy62K8+/mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754925518; c=relaxed/simple;
	bh=fWFu3vlBVFN5H1FR4ay+h6xPRtNgDx9gHEBPY57HflE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kv69CDxnYY7hB0csavtJ44VUTZDcQ802Pav2jzecn3rU7wB/ePkGVMe8Bb5J1ArRZM+77SM3bk7VqPV4YwIeuZsSb3eFq8NXHuVxnPdDl0RtE4EldoumsZFXVllMC5ioMqVlm65cwBmob8LXv5tlVxd3H8LPSHkg9jsEYahEFes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LG6fbJnF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 639C7C32786;
	Mon, 11 Aug 2025 15:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925514;
	bh=fWFu3vlBVFN5H1FR4ay+h6xPRtNgDx9gHEBPY57HflE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LG6fbJnFJETFaBrzUVglcy4uRFQeCNO6vxDy9JIi/F5Ix4TT+dwEzwPQSPYyl96jD
	 2pOuJjte2fcRLqIDZDsQoTL0IlBG8erijF02sbhIJbGglX0C+GKiAIjmOVn9nwyYus
	 FEfSqcacxaDzmmeg2uVnE6LV4WTJMQLUYRAJ6jDLUH4THWOTEFWGd6AqP2AohOBQQm
	 kUwu4f+0ROgBNzQ/0IQVyn8jtrWuN3a0SBiuMdIO5f+oe936+hcg+ZkIZefizUuxzX
	 DpN5e4BVSE9HpRJPLfjxpZuQX55/31NQbl9VtoSD2y2EQCiqFM71dil3wmn/cEaYDA
	 nkPKVyWxSLqmw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43DEDCA0ED8;
	Mon, 11 Aug 2025 15:18:34 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:19:22 -0400
Subject: [PATCH 090/114] clk: qcom: alpha-pll: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-90-b3bf97b038dc@redhat.com>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Keguang Zhang <keguang.zhang@gmail.com>, 
 Taichi Sugaya <sugaya.taichi@socionext.com>, 
 Takao Orito <orito.takao@socionext.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Michal Simek <michal.simek@amd.com>, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <mani@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Max Filippov <jcmvbkbc@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Andrea della Porta <andrea.porta@suse.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Qin Jian <qinjian@cqplus1.com>, Viresh Kumar <vireshk@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Alex Helms <alexander.helms.jy@renesas.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 sophgo@lists.linux.dev, linux-mips@vger.kernel.org, imx@lists.linux.dev, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com, 
 linux-actions@lists.infradead.org, asahi@lists.linux.dev, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925498; l=16291;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=vTFCt7Dl/tI993ayx+5Els3H3uKEmyT5dptl/u4S2sM=;
 b=tvzWN2DGW9Jhfrq66L8bHPjOQ6e6TTwi6TfAyYLZcKXij9iHlvqD8o8oIP499gdtt0A6ifBFa
 zNowBBVqN/sDGEmAPGAJC11kFiRjkFxQVAM3lW8HatGe6mpEyA4Gbh9
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Endpoint-Received: by B4 Relay for bmasney@redhat.com/20250528 with
 auth_id=472
X-Original-From: Brian Masney <bmasney@redhat.com>
Reply-To: bmasney@redhat.com

From: Brian Masney <bmasney@redhat.com>

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Note that prior to running the Coccinelle,
clk_alpha_pll_postdiv_round_ro_rate() was renamed to
clk_alpha_pll_postdiv_ro_round_rate().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/qcom/clk-alpha-pll.c | 136 ++++++++++++++++++++++-----------------
 1 file changed, 77 insertions(+), 59 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index fec6eb376e2707deda11609fe5d0d45082048a0b..7eb2f7bee3a6164bbe38b12a572527ec79ebbb36 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -849,22 +849,25 @@ static int clk_alpha_pll_hwfsm_set_rate(struct clk_hw *hw, unsigned long rate,
 					clk_alpha_pll_hwfsm_is_enabled);
 }
 
-static long clk_alpha_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				     unsigned long *prate)
+static int clk_alpha_pll_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
 {
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
 	u32 l, alpha_width = pll_alpha_width(pll);
 	u64 a;
 	unsigned long min_freq, max_freq;
 
-	rate = alpha_pll_round_rate(rate, *prate, &l, &a, alpha_width);
-	if (!pll->vco_table || alpha_pll_find_vco(pll, rate))
-		return rate;
+	req->rate = alpha_pll_round_rate(req->rate, req->best_parent_rate, &l,
+					 &a, alpha_width);
+	if (!pll->vco_table || alpha_pll_find_vco(pll, req->rate))
+		return 0;
 
 	min_freq = pll->vco_table[0].min_freq;
 	max_freq = pll->vco_table[pll->num_vco - 1].max_freq;
 
-	return clamp(rate, min_freq, max_freq);
+	req->rate = clamp(req->rate, min_freq, max_freq);
+
+	return 0;
 }
 
 void clk_huayra_2290_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
@@ -1048,12 +1051,15 @@ static int alpha_pll_huayra_set_rate(struct clk_hw *hw, unsigned long rate,
 	return 0;
 }
 
-static long alpha_pll_huayra_round_rate(struct clk_hw *hw, unsigned long rate,
-					unsigned long *prate)
+static int alpha_pll_huayra_determine_rate(struct clk_hw *hw,
+					   struct clk_rate_request *req)
 {
 	u32 l, a;
 
-	return alpha_huayra_pll_round_rate(rate, *prate, &l, &a);
+	req->rate = alpha_huayra_pll_round_rate(req->rate,
+						req->best_parent_rate, &l, &a);
+
+	return 0;
 }
 
 static int trion_pll_is_enabled(struct clk_alpha_pll *pll,
@@ -1175,7 +1181,7 @@ const struct clk_ops clk_alpha_pll_ops = {
 	.disable = clk_alpha_pll_disable,
 	.is_enabled = clk_alpha_pll_is_enabled,
 	.recalc_rate = clk_alpha_pll_recalc_rate,
-	.round_rate = clk_alpha_pll_round_rate,
+	.determine_rate = clk_alpha_pll_determine_rate,
 	.set_rate = clk_alpha_pll_set_rate,
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_ops);
@@ -1185,7 +1191,7 @@ const struct clk_ops clk_alpha_pll_huayra_ops = {
 	.disable = clk_alpha_pll_disable,
 	.is_enabled = clk_alpha_pll_is_enabled,
 	.recalc_rate = alpha_pll_huayra_recalc_rate,
-	.round_rate = alpha_pll_huayra_round_rate,
+	.determine_rate = alpha_pll_huayra_determine_rate,
 	.set_rate = alpha_pll_huayra_set_rate,
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_huayra_ops);
@@ -1195,7 +1201,7 @@ const struct clk_ops clk_alpha_pll_hwfsm_ops = {
 	.disable = clk_alpha_pll_hwfsm_disable,
 	.is_enabled = clk_alpha_pll_hwfsm_is_enabled,
 	.recalc_rate = clk_alpha_pll_recalc_rate,
-	.round_rate = clk_alpha_pll_round_rate,
+	.determine_rate = clk_alpha_pll_determine_rate,
 	.set_rate = clk_alpha_pll_hwfsm_set_rate,
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_hwfsm_ops);
@@ -1205,7 +1211,7 @@ const struct clk_ops clk_alpha_pll_fixed_trion_ops = {
 	.disable = clk_trion_pll_disable,
 	.is_enabled = clk_trion_pll_is_enabled,
 	.recalc_rate = clk_trion_pll_recalc_rate,
-	.round_rate = clk_alpha_pll_round_rate,
+	.determine_rate = clk_alpha_pll_determine_rate,
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_fixed_trion_ops);
 
@@ -1240,9 +1246,8 @@ static const struct clk_div_table clk_alpha_2bit_div_table[] = {
 	{ }
 };
 
-static long
-clk_alpha_pll_postdiv_round_rate(struct clk_hw *hw, unsigned long rate,
-				 unsigned long *prate)
+static int clk_alpha_pll_postdiv_determine_rate(struct clk_hw *hw,
+						struct clk_rate_request *req)
 {
 	struct clk_alpha_pll_postdiv *pll = to_clk_alpha_pll_postdiv(hw);
 	const struct clk_div_table *table;
@@ -1252,13 +1257,15 @@ clk_alpha_pll_postdiv_round_rate(struct clk_hw *hw, unsigned long rate,
 	else
 		table = clk_alpha_div_table;
 
-	return divider_round_rate(hw, rate, prate, table,
-				  pll->width, CLK_DIVIDER_POWER_OF_TWO);
+	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
+				       table, pll->width,
+				       CLK_DIVIDER_POWER_OF_TWO);
+
+	return 0;
 }
 
-static long
-clk_alpha_pll_postdiv_round_ro_rate(struct clk_hw *hw, unsigned long rate,
-				    unsigned long *prate)
+static int clk_alpha_pll_postdiv_ro_determine_rate(struct clk_hw *hw,
+						   struct clk_rate_request *req)
 {
 	struct clk_alpha_pll_postdiv *pll = to_clk_alpha_pll_postdiv(hw);
 	u32 ctl, div;
@@ -1270,9 +1277,12 @@ clk_alpha_pll_postdiv_round_ro_rate(struct clk_hw *hw, unsigned long rate,
 	div = 1 << fls(ctl);
 
 	if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT)
-		*prate = clk_hw_round_rate(clk_hw_get_parent(hw), div * rate);
+		req->best_parent_rate = clk_hw_round_rate(clk_hw_get_parent(hw),
+							  div * req->rate);
+
+	req->rate = DIV_ROUND_UP_ULL((u64) req->best_parent_rate, div);
 
-	return DIV_ROUND_UP_ULL((u64)*prate, div);
+	return 0;
 }
 
 static int clk_alpha_pll_postdiv_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -1291,13 +1301,13 @@ static int clk_alpha_pll_postdiv_set_rate(struct clk_hw *hw, unsigned long rate,
 
 const struct clk_ops clk_alpha_pll_postdiv_ops = {
 	.recalc_rate = clk_alpha_pll_postdiv_recalc_rate,
-	.round_rate = clk_alpha_pll_postdiv_round_rate,
+	.determine_rate = clk_alpha_pll_postdiv_determine_rate,
 	.set_rate = clk_alpha_pll_postdiv_set_rate,
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_ops);
 
 const struct clk_ops clk_alpha_pll_postdiv_ro_ops = {
-	.round_rate = clk_alpha_pll_postdiv_round_ro_rate,
+	.determine_rate = clk_alpha_pll_postdiv_ro_determine_rate,
 	.recalc_rate = clk_alpha_pll_postdiv_recalc_rate,
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_ro_ops);
@@ -1542,7 +1552,7 @@ const struct clk_ops clk_alpha_pll_fabia_ops = {
 	.is_enabled = clk_alpha_pll_is_enabled,
 	.set_rate = alpha_pll_fabia_set_rate,
 	.recalc_rate = alpha_pll_fabia_recalc_rate,
-	.round_rate = clk_alpha_pll_round_rate,
+	.determine_rate = clk_alpha_pll_determine_rate,
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_fabia_ops);
 
@@ -1551,7 +1561,7 @@ const struct clk_ops clk_alpha_pll_fixed_fabia_ops = {
 	.disable = alpha_pll_fabia_disable,
 	.is_enabled = clk_alpha_pll_is_enabled,
 	.recalc_rate = alpha_pll_fabia_recalc_rate,
-	.round_rate = clk_alpha_pll_round_rate,
+	.determine_rate = clk_alpha_pll_determine_rate,
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_fixed_fabia_ops);
 
@@ -1602,14 +1612,16 @@ clk_trion_pll_postdiv_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 	return (parent_rate / div);
 }
 
-static long
-clk_trion_pll_postdiv_round_rate(struct clk_hw *hw, unsigned long rate,
-				 unsigned long *prate)
+static int clk_trion_pll_postdiv_determine_rate(struct clk_hw *hw,
+						struct clk_rate_request *req)
 {
 	struct clk_alpha_pll_postdiv *pll = to_clk_alpha_pll_postdiv(hw);
 
-	return divider_round_rate(hw, rate, prate, pll->post_div_table,
-				  pll->width, CLK_DIVIDER_ROUND_CLOSEST);
+	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
+				       pll->post_div_table,
+				       pll->width, CLK_DIVIDER_ROUND_CLOSEST);
+
+	return 0;
 };
 
 static int
@@ -1635,18 +1647,21 @@ clk_trion_pll_postdiv_set_rate(struct clk_hw *hw, unsigned long rate,
 
 const struct clk_ops clk_alpha_pll_postdiv_trion_ops = {
 	.recalc_rate = clk_trion_pll_postdiv_recalc_rate,
-	.round_rate = clk_trion_pll_postdiv_round_rate,
+	.determine_rate = clk_trion_pll_postdiv_determine_rate,
 	.set_rate = clk_trion_pll_postdiv_set_rate,
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_trion_ops);
 
-static long clk_alpha_pll_postdiv_fabia_round_rate(struct clk_hw *hw,
-				unsigned long rate, unsigned long *prate)
+static int clk_alpha_pll_postdiv_fabia_determine_rate(struct clk_hw *hw,
+						      struct clk_rate_request *req)
 {
 	struct clk_alpha_pll_postdiv *pll = to_clk_alpha_pll_postdiv(hw);
 
-	return divider_round_rate(hw, rate, prate, pll->post_div_table,
-				pll->width, CLK_DIVIDER_ROUND_CLOSEST);
+	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
+				       pll->post_div_table,
+				       pll->width, CLK_DIVIDER_ROUND_CLOSEST);
+
+	return 0;
 }
 
 static int clk_alpha_pll_postdiv_fabia_set_rate(struct clk_hw *hw,
@@ -1681,7 +1696,7 @@ static int clk_alpha_pll_postdiv_fabia_set_rate(struct clk_hw *hw,
 
 const struct clk_ops clk_alpha_pll_postdiv_fabia_ops = {
 	.recalc_rate = clk_alpha_pll_postdiv_fabia_recalc_rate,
-	.round_rate = clk_alpha_pll_postdiv_fabia_round_rate,
+	.determine_rate = clk_alpha_pll_postdiv_fabia_determine_rate,
 	.set_rate = clk_alpha_pll_postdiv_fabia_set_rate,
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_fabia_ops);
@@ -1833,7 +1848,7 @@ const struct clk_ops clk_alpha_pll_trion_ops = {
 	.disable = clk_trion_pll_disable,
 	.is_enabled = clk_trion_pll_is_enabled,
 	.recalc_rate = clk_trion_pll_recalc_rate,
-	.round_rate = clk_alpha_pll_round_rate,
+	.determine_rate = clk_alpha_pll_determine_rate,
 	.set_rate = alpha_pll_trion_set_rate,
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_trion_ops);
@@ -1844,14 +1859,14 @@ const struct clk_ops clk_alpha_pll_lucid_ops = {
 	.disable = clk_trion_pll_disable,
 	.is_enabled = clk_trion_pll_is_enabled,
 	.recalc_rate = clk_trion_pll_recalc_rate,
-	.round_rate = clk_alpha_pll_round_rate,
+	.determine_rate = clk_alpha_pll_determine_rate,
 	.set_rate = alpha_pll_trion_set_rate,
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_lucid_ops);
 
 const struct clk_ops clk_alpha_pll_postdiv_lucid_ops = {
 	.recalc_rate = clk_alpha_pll_postdiv_fabia_recalc_rate,
-	.round_rate = clk_alpha_pll_postdiv_fabia_round_rate,
+	.determine_rate = clk_alpha_pll_postdiv_fabia_determine_rate,
 	.set_rate = clk_alpha_pll_postdiv_fabia_set_rate,
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_lucid_ops);
@@ -1903,7 +1918,7 @@ const struct clk_ops clk_alpha_pll_agera_ops = {
 	.disable = clk_alpha_pll_disable,
 	.is_enabled = clk_alpha_pll_is_enabled,
 	.recalc_rate = alpha_pll_fabia_recalc_rate,
-	.round_rate = clk_alpha_pll_round_rate,
+	.determine_rate = clk_alpha_pll_determine_rate,
 	.set_rate = clk_alpha_pll_agera_set_rate,
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_agera_ops);
@@ -2119,7 +2134,7 @@ const struct clk_ops clk_alpha_pll_lucid_5lpe_ops = {
 	.disable = alpha_pll_lucid_5lpe_disable,
 	.is_enabled = clk_trion_pll_is_enabled,
 	.recalc_rate = clk_trion_pll_recalc_rate,
-	.round_rate = clk_alpha_pll_round_rate,
+	.determine_rate = clk_alpha_pll_determine_rate,
 	.set_rate = alpha_pll_lucid_5lpe_set_rate,
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_lucid_5lpe_ops);
@@ -2129,13 +2144,13 @@ const struct clk_ops clk_alpha_pll_fixed_lucid_5lpe_ops = {
 	.disable = alpha_pll_lucid_5lpe_disable,
 	.is_enabled = clk_trion_pll_is_enabled,
 	.recalc_rate = clk_trion_pll_recalc_rate,
-	.round_rate = clk_alpha_pll_round_rate,
+	.determine_rate = clk_alpha_pll_determine_rate,
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_fixed_lucid_5lpe_ops);
 
 const struct clk_ops clk_alpha_pll_postdiv_lucid_5lpe_ops = {
 	.recalc_rate = clk_alpha_pll_postdiv_fabia_recalc_rate,
-	.round_rate = clk_alpha_pll_postdiv_fabia_round_rate,
+	.determine_rate = clk_alpha_pll_postdiv_fabia_determine_rate,
 	.set_rate = clk_lucid_5lpe_pll_postdiv_set_rate,
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_lucid_5lpe_ops);
@@ -2304,7 +2319,7 @@ const struct clk_ops clk_alpha_pll_zonda_ops = {
 	.disable = clk_zonda_pll_disable,
 	.is_enabled = clk_trion_pll_is_enabled,
 	.recalc_rate = clk_trion_pll_recalc_rate,
-	.round_rate = clk_alpha_pll_round_rate,
+	.determine_rate = clk_alpha_pll_determine_rate,
 	.set_rate = clk_zonda_pll_set_rate,
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_zonda_ops);
@@ -2529,13 +2544,13 @@ const struct clk_ops clk_alpha_pll_fixed_lucid_evo_ops = {
 	.disable = alpha_pll_lucid_evo_disable,
 	.is_enabled = clk_trion_pll_is_enabled,
 	.recalc_rate = alpha_pll_lucid_evo_recalc_rate,
-	.round_rate = clk_alpha_pll_round_rate,
+	.determine_rate = clk_alpha_pll_determine_rate,
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_fixed_lucid_evo_ops);
 
 const struct clk_ops clk_alpha_pll_postdiv_lucid_evo_ops = {
 	.recalc_rate = clk_alpha_pll_postdiv_fabia_recalc_rate,
-	.round_rate = clk_alpha_pll_postdiv_fabia_round_rate,
+	.determine_rate = clk_alpha_pll_postdiv_fabia_determine_rate,
 	.set_rate = clk_lucid_evo_pll_postdiv_set_rate,
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_lucid_evo_ops);
@@ -2546,7 +2561,7 @@ const struct clk_ops clk_alpha_pll_lucid_evo_ops = {
 	.disable = alpha_pll_lucid_evo_disable,
 	.is_enabled = clk_trion_pll_is_enabled,
 	.recalc_rate = alpha_pll_lucid_evo_recalc_rate,
-	.round_rate = clk_alpha_pll_round_rate,
+	.determine_rate = clk_alpha_pll_determine_rate,
 	.set_rate = alpha_pll_lucid_5lpe_set_rate,
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_lucid_evo_ops);
@@ -2557,7 +2572,7 @@ const struct clk_ops clk_alpha_pll_reset_lucid_evo_ops = {
 	.disable = alpha_pll_reset_lucid_evo_disable,
 	.is_enabled = clk_trion_pll_is_enabled,
 	.recalc_rate = alpha_pll_lucid_evo_recalc_rate,
-	.round_rate = clk_alpha_pll_round_rate,
+	.determine_rate = clk_alpha_pll_determine_rate,
 	.set_rate = alpha_pll_lucid_5lpe_set_rate,
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_reset_lucid_evo_ops);
@@ -2732,22 +2747,25 @@ static unsigned long clk_rivian_evo_pll_recalc_rate(struct clk_hw *hw,
 	return parent_rate * l;
 }
 
-static long clk_rivian_evo_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-					  unsigned long *prate)
+static int clk_rivian_evo_pll_determine_rate(struct clk_hw *hw,
+					     struct clk_rate_request *req)
 {
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
 	unsigned long min_freq, max_freq;
 	u32 l;
 	u64 a;
 
-	rate = alpha_pll_round_rate(rate, *prate, &l, &a, 0);
-	if (!pll->vco_table || alpha_pll_find_vco(pll, rate))
-		return rate;
+	req->rate = alpha_pll_round_rate(req->rate, req->best_parent_rate, &l,
+					 &a, 0);
+	if (!pll->vco_table || alpha_pll_find_vco(pll, req->rate))
+		return 0;
 
 	min_freq = pll->vco_table[0].min_freq;
 	max_freq = pll->vco_table[pll->num_vco - 1].max_freq;
 
-	return clamp(rate, min_freq, max_freq);
+	req->rate = clamp(req->rate, min_freq, max_freq);
+
+	return 0;
 }
 
 const struct clk_ops clk_alpha_pll_rivian_evo_ops = {
@@ -2755,7 +2773,7 @@ const struct clk_ops clk_alpha_pll_rivian_evo_ops = {
 	.disable = alpha_pll_lucid_5lpe_disable,
 	.is_enabled = clk_trion_pll_is_enabled,
 	.recalc_rate = clk_rivian_evo_pll_recalc_rate,
-	.round_rate = clk_rivian_evo_pll_round_rate,
+	.determine_rate = clk_rivian_evo_pll_determine_rate,
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_rivian_evo_ops);
 
@@ -2964,7 +2982,7 @@ const struct clk_ops clk_alpha_pll_regera_ops = {
 	.disable = clk_zonda_pll_disable,
 	.is_enabled = clk_alpha_pll_is_enabled,
 	.recalc_rate = clk_trion_pll_recalc_rate,
-	.round_rate = clk_alpha_pll_round_rate,
+	.determine_rate = clk_alpha_pll_determine_rate,
 	.set_rate = clk_zonda_pll_set_rate,
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_regera_ops);
@@ -3169,7 +3187,7 @@ const struct clk_ops clk_alpha_pll_slew_ops = {
 	.enable = clk_alpha_pll_slew_enable,
 	.disable = clk_alpha_pll_disable,
 	.recalc_rate = clk_alpha_pll_recalc_rate,
-	.round_rate = clk_alpha_pll_round_rate,
+	.determine_rate = clk_alpha_pll_determine_rate,
 	.set_rate = clk_alpha_pll_slew_set_rate,
 };
 EXPORT_SYMBOL(clk_alpha_pll_slew_ops);

-- 
2.50.1



