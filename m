Return-Path: <linux-mips+bounces-10155-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3D0B20F37
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 17:30:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02C053E321B
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 15:28:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7355E2F546A;
	Mon, 11 Aug 2025 15:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TIx6M302"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BB82F1FCF;
	Mon, 11 Aug 2025 15:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754925518; cv=none; b=u3+Pspjo4i3G848F7A+lLIbf6wjr5I+keZQW1EJ+tA2fT4gcYaQcyiigAihDjWX3qCtg/aHvjIn4ap4jjtI/GoiOq5WzT1+ZP7NqeyKZglOOFTT0LD88HxIullclEY8q6xJxTSendXYUFeb3N1Ox/0oLUXRroWRU6rbFrKB3kww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754925518; c=relaxed/simple;
	bh=vS0PONQnjdY3pmtNgoksHe0uUxgMUEGojR5iVB36WRA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WQekFqc30EVrzAHDURl77rVlhHSw5vgex3GfPI4oe3D0vNQUe7urgzqOVfOpVSHcp8cv/zStwk4tIyfkLPjo2LKSDdXRJiYVOz2z3vxvRYqWoAyldIBR8wsxoy7CggkxDL2Jjx2p9oawCHmxzGK+vhVIacqFtUYCS3mFZKpfMXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TIx6M302; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 94E54C4DDF6;
	Mon, 11 Aug 2025 15:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925513;
	bh=vS0PONQnjdY3pmtNgoksHe0uUxgMUEGojR5iVB36WRA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TIx6M302VTmHvoaRyvVgYFr88HQA3d1zhbcXXrkrF+ivv40NN5tk9ZsZPD48kE5YW
	 HdAcv7ooA2w87LPMsQB1cKJMcNw1OiuszJEge+2DeWG8+iwPrXUSNafKlxdgwgOP1U
	 Dpr15UMYCQgSCUjTWCfxnv7hxl+PI/19stRUPDzf86U9CHaHFRWPYX+2ncgmBq3BVz
	 WtIy2sig5fJZZOYptZeVJ+WMFWas6c7g5WMMMRISWHSfsZd1bEBIWrVn+yJm2qRagx
	 onWj2W8momz7lnidwOQtf0HOmg6TbPQwVtksXZEWvhdGN+i3k5s26q1Hr91+9e3ARp
	 AzG93+EqPEjqg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FFA0CA0EC4;
	Mon, 11 Aug 2025 15:18:33 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:19:15 -0400
Subject: [PATCH 083/114] clk: microchip: core: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-83-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925498; l=4230;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=YMDl5Dg1ebY0oa3yJn1kDt9B+GTjRRC9X+mnPj0mD4I=;
 b=xu1TDAVDPkAH51Z+kE+nyZyIn7jkJ+ucnQ6UYpyM4dhn8XGohcz6jVtEkAirsskvNjAeAUjcu
 blgPTKZ0CHUBpnEIuyWGuaS+gDAb1GA14gDpIqpHXimnvaVyNxaeZl0
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
 drivers/clk/microchip/clk-core.c | 44 ++++++++++++++++++++++++----------------
 1 file changed, 27 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/microchip/clk-core.c b/drivers/clk/microchip/clk-core.c
index 6fbc6dc50ca3d9f1f0aecc5e43f4d41f23cb371a..3e03e10539c72cc28e53401093e37409c2ea3d08 100644
--- a/drivers/clk/microchip/clk-core.c
+++ b/drivers/clk/microchip/clk-core.c
@@ -155,11 +155,13 @@ static unsigned long pbclk_recalc_rate(struct clk_hw *hw,
 	return parent_rate / pbclk_read_pbdiv(pb);
 }
 
-static long pbclk_round_rate(struct clk_hw *hw, unsigned long rate,
-			     unsigned long *parent_rate)
+static int pbclk_determine_rate(struct clk_hw *hw,
+				struct clk_rate_request *req)
 {
-	return calc_best_divided_rate(rate, *parent_rate,
-				      PB_DIV_MAX, PB_DIV_MIN);
+	req->rate = calc_best_divided_rate(req->rate, req->best_parent_rate,
+					   PB_DIV_MAX, PB_DIV_MIN);
+
+	return 0;
 }
 
 static int pbclk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -207,7 +209,7 @@ const struct clk_ops pic32_pbclk_ops = {
 	.disable	= pbclk_disable,
 	.is_enabled	= pbclk_is_enabled,
 	.recalc_rate	= pbclk_recalc_rate,
-	.round_rate	= pbclk_round_rate,
+	.determine_rate = pbclk_determine_rate,
 	.set_rate	= pbclk_set_rate,
 };
 
@@ -372,16 +374,18 @@ static unsigned long roclk_recalc_rate(struct clk_hw *hw,
 	return roclk_calc_rate(parent_rate, rodiv, rotrim);
 }
 
-static long roclk_round_rate(struct clk_hw *hw, unsigned long rate,
-			     unsigned long *parent_rate)
+static int roclk_determine_rate(struct clk_hw *hw,
+				struct clk_rate_request *req)
 {
 	u32 rotrim, rodiv;
 
 	/* calculate dividers for new rate */
-	roclk_calc_div_trim(rate, *parent_rate, &rodiv, &rotrim);
+	roclk_calc_div_trim(req->rate, req->best_parent_rate, &rodiv, &rotrim);
 
 	/* caclulate new rate (rounding) based on new rodiv & rotrim */
-	return roclk_calc_rate(*parent_rate, rodiv, rotrim);
+	req->rate = roclk_calc_rate(req->best_parent_rate, rodiv, rotrim);
+
+	return 0;
 }
 
 static int roclk_determine_rate(struct clk_hw *hw,
@@ -665,12 +669,15 @@ static unsigned long spll_clk_recalc_rate(struct clk_hw *hw,
 	return rate64;
 }
 
-static long spll_clk_round_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long *parent_rate)
+static int spll_clk_determine_rate(struct clk_hw *hw,
+				   struct clk_rate_request *req)
 {
 	struct pic32_sys_pll *pll = clkhw_to_spll(hw);
 
-	return spll_calc_mult_div(pll, rate, *parent_rate, NULL, NULL);
+	req->rate = spll_calc_mult_div(pll, req->rate, req->best_parent_rate,
+				       NULL, NULL);
+
+	return 0;
 }
 
 static int spll_clk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -725,7 +732,7 @@ static int spll_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 /* SPLL clock operation */
 const struct clk_ops pic32_spll_ops = {
 	.recalc_rate	= spll_clk_recalc_rate,
-	.round_rate	= spll_clk_round_rate,
+	.determine_rate = spll_clk_determine_rate,
 	.set_rate	= spll_clk_set_rate,
 };
 
@@ -780,10 +787,13 @@ static unsigned long sclk_get_rate(struct clk_hw *hw, unsigned long parent_rate)
 	return parent_rate / div;
 }
 
-static long sclk_round_rate(struct clk_hw *hw, unsigned long rate,
-			    unsigned long *parent_rate)
+static int sclk_determine_rate(struct clk_hw *hw,
+			       struct clk_rate_request *req)
 {
-	return calc_best_divided_rate(rate, *parent_rate, SLEW_SYSDIV, 1);
+	req->rate = calc_best_divided_rate(req->rate, req->best_parent_rate,
+					   SLEW_SYSDIV, 1);
+
+	return 0;
 }
 
 static int sclk_set_rate(struct clk_hw *hw,
@@ -909,7 +919,7 @@ static int sclk_init(struct clk_hw *hw)
 const struct clk_ops pic32_sclk_ops = {
 	.get_parent	= sclk_get_parent,
 	.set_parent	= sclk_set_parent,
-	.round_rate	= sclk_round_rate,
+	.determine_rate = sclk_determine_rate,
 	.set_rate	= sclk_set_rate,
 	.recalc_rate	= sclk_get_rate,
 	.init		= sclk_init,

-- 
2.50.1



