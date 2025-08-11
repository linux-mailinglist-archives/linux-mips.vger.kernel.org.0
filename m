Return-Path: <linux-mips+bounces-10115-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D0CB20E6E
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 17:24:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BBA4163D3C
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 15:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B3E72EACEB;
	Mon, 11 Aug 2025 15:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bHe8YByV"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47AC2EA724;
	Mon, 11 Aug 2025 15:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754925513; cv=none; b=L6S6laDyWAM54GL89d6fh2hf8/9jC8mfalsdLrlxYikRO3aY9ZWmOFakOJls29irxf0cbbA9jP08rG+mQtikiNPMjwHcQwuJILPLkFbaICYXcq8klM61Smy1nV8p0E2zL1eohNHTKCR9M5GD30WPCl13QrvDJiyG9iXB+12ilIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754925513; c=relaxed/simple;
	bh=kyXwVH/uH12G7KnV8s+VJp2QA1FKPQ38QMmrM7aLhb0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c3tq3g5a2m1dH0v680JlhK8UJUM2QiAbFpWt9ld31uOeE2QFaTZC/iV8M1A3FbfsCyXEVzYzoszLNyN/yOgvblUJSvSEsty1rVeqXqpMmtFEAWGuWKXNa30P9v7CJUx8VTDbLkZkPwmfc5uKo/NJFq/j5yxXfNyEKq468ncnqIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bHe8YByV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61A67C4AF67;
	Mon, 11 Aug 2025 15:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925511;
	bh=kyXwVH/uH12G7KnV8s+VJp2QA1FKPQ38QMmrM7aLhb0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bHe8YByVTug7zFBSasY2LjdYzD6ctHsYLGlxPjMxLIAWKxclApNmZPOisbwfxuu/w
	 zy88B4Vm/wgCT70vme4k9TRefnxZS7V0MQ/ZvAQD6Zx98veNDrh2LC4b3Bhy11sath
	 xeMSB3BsKdqqNZQwsFbWjhDeJvRMbxagTR4busninzSqF6RrtM9jTvIOso6hGM3O2b
	 lsTts1+v4G5tA8fymMD8dt1oX3oE69DXQ80zJsyS1S55VtVM6y6/CD7Nm4QwdZxcAW
	 54FyWcLcHSHMMll4EzMNp2nun7/s0wM9tIsnjTqBI4NnmgYfWlR+IJyuGoZ6fYj6+o
	 QYTZuDVRvoBqA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 531F9CA0EC4;
	Mon, 11 Aug 2025 15:18:31 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:18:53 -0400
Subject: [PATCH 061/114] clk: versaclock3: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-61-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925498; l=5741;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=x1gk5CWY++REB/H0mP/sVdcE9c/YjIWz/q2lVSc7ESA=;
 b=peRVxnYs7QDW/YHfBEOKOACtE5gDHZfYw8aUr3ja2EfQNK9f9nV/lM84YyA0fUXdVXbM8Xmpn
 +mM7A/gFsAFAtaY1WFRt8TWSirYPkMsSt9X+JJVvlKBeKoGu9FoBqmD
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

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk-versaclock3.c | 70 +++++++++++++++++++++++++------------------
 1 file changed, 41 insertions(+), 29 deletions(-)

diff --git a/drivers/clk/clk-versaclock3.c b/drivers/clk/clk-versaclock3.c
index 9fe27dace1117aa9e2f29be76744cdefceea3de3..1849863dbd673f3b133b9a295dc608ea43931de6 100644
--- a/drivers/clk/clk-versaclock3.c
+++ b/drivers/clk/clk-versaclock3.c
@@ -289,22 +289,25 @@ static unsigned long vc3_pfd_recalc_rate(struct clk_hw *hw,
 	return rate;
 }
 
-static long vc3_pfd_round_rate(struct clk_hw *hw, unsigned long rate,
-			       unsigned long *parent_rate)
+static int vc3_pfd_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
 {
 	struct vc3_hw_data *vc3 = container_of(hw, struct vc3_hw_data, hw);
 	const struct vc3_pfd_data *pfd = vc3->data;
 	unsigned long idiv;
 
 	/* PLL cannot operate with input clock above 50 MHz. */
-	if (rate > 50000000)
+	if (req->rate > 50000000)
 		return -EINVAL;
 
 	/* CLKIN within range of PLL input, feed directly to PLL. */
-	if (*parent_rate <= 50000000)
-		return *parent_rate;
+	if (req->best_parent_rate <= 50000000) {
+		req->rate = req->best_parent_rate;
 
-	idiv = DIV_ROUND_UP(*parent_rate, rate);
+		return 0;
+	}
+
+	idiv = DIV_ROUND_UP(req->best_parent_rate, req->rate);
 	if (pfd->num == VC3_PFD1 || pfd->num == VC3_PFD3) {
 		if (idiv > 63)
 			return -EINVAL;
@@ -313,7 +316,9 @@ static long vc3_pfd_round_rate(struct clk_hw *hw, unsigned long rate,
 			return -EINVAL;
 	}
 
-	return *parent_rate / idiv;
+	req->rate = req->best_parent_rate / idiv;
+
+	return 0;
 }
 
 static int vc3_pfd_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -354,7 +359,7 @@ static int vc3_pfd_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops vc3_pfd_ops = {
 	.recalc_rate = vc3_pfd_recalc_rate,
-	.round_rate = vc3_pfd_round_rate,
+	.determine_rate = vc3_pfd_determine_rate,
 	.set_rate = vc3_pfd_set_rate,
 };
 
@@ -385,36 +390,38 @@ static unsigned long vc3_pll_recalc_rate(struct clk_hw *hw,
 	return rate;
 }
 
-static long vc3_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-			       unsigned long *parent_rate)
+static int vc3_pll_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
 {
 	struct vc3_hw_data *vc3 = container_of(hw, struct vc3_hw_data, hw);
 	const struct vc3_pll_data *pll = vc3->data;
 	u64 div_frc;
 
-	if (rate < pll->vco.min)
-		rate = pll->vco.min;
-	if (rate > pll->vco.max)
-		rate = pll->vco.max;
+	if (req->rate < pll->vco.min)
+		req->rate = pll->vco.min;
+	if (req->rate > pll->vco.max)
+		req->rate = pll->vco.max;
 
-	vc3->div_int = rate / *parent_rate;
+	vc3->div_int = req->rate / req->best_parent_rate;
 
 	if (pll->num == VC3_PLL2) {
 		if (vc3->div_int > 0x7ff)
-			rate = *parent_rate * 0x7ff;
+			req->rate = req->best_parent_rate * 0x7ff;
 
 		/* Determine best fractional part, which is 16 bit wide */
-		div_frc = rate % *parent_rate;
+		div_frc = req->rate % req->best_parent_rate;
 		div_frc *= BIT(16) - 1;
 
-		vc3->div_frc = min_t(u64, div64_ul(div_frc, *parent_rate), U16_MAX);
-		rate = (*parent_rate *
-			(vc3->div_int * VC3_2_POW_16 + vc3->div_frc) / VC3_2_POW_16);
+		vc3->div_frc = min_t(u64,
+				     div64_ul(div_frc, req->best_parent_rate),
+				     U16_MAX);
+		req->rate = (req->best_parent_rate *
+			     (vc3->div_int * VC3_2_POW_16 + vc3->div_frc) / VC3_2_POW_16);
 	} else {
-		rate = *parent_rate * vc3->div_int;
+		req->rate = req->best_parent_rate * vc3->div_int;
 	}
 
-	return rate;
+	return 0;
 }
 
 static int vc3_pll_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -441,7 +448,7 @@ static int vc3_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops vc3_pll_ops = {
 	.recalc_rate = vc3_pll_recalc_rate,
-	.round_rate = vc3_pll_round_rate,
+	.determine_rate = vc3_pll_determine_rate,
 	.set_rate = vc3_pll_set_rate,
 };
 
@@ -498,8 +505,8 @@ static unsigned long vc3_div_recalc_rate(struct clk_hw *hw,
 				   div_data->flags, div_data->width);
 }
 
-static long vc3_div_round_rate(struct clk_hw *hw, unsigned long rate,
-			       unsigned long *parent_rate)
+static int vc3_div_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
 {
 	struct vc3_hw_data *vc3 = container_of(hw, struct vc3_hw_data, hw);
 	const struct vc3_div_data *div_data = vc3->data;
@@ -511,11 +518,16 @@ static long vc3_div_round_rate(struct clk_hw *hw, unsigned long rate,
 		bestdiv >>= div_data->shift;
 		bestdiv &= VC3_DIV_MASK(div_data->width);
 		bestdiv = vc3_get_div(div_data->table, bestdiv, div_data->flags);
-		return DIV_ROUND_UP(*parent_rate, bestdiv);
+		req->rate = DIV_ROUND_UP(req->best_parent_rate, bestdiv);
+
+		return 0;
 	}
 
-	return divider_round_rate(hw, rate, parent_rate, div_data->table,
-				  div_data->width, div_data->flags);
+	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
+				       div_data->table,
+				       div_data->width, div_data->flags);
+
+	return 0;
 }
 
 static int vc3_div_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -534,7 +546,7 @@ static int vc3_div_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops vc3_div_ops = {
 	.recalc_rate = vc3_div_recalc_rate,
-	.round_rate = vc3_div_round_rate,
+	.determine_rate = vc3_div_determine_rate,
 	.set_rate = vc3_div_set_rate,
 };
 

-- 
2.50.1



