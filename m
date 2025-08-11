Return-Path: <linux-mips+bounces-10142-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02149B20F45
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 17:30:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2EE0422DD4
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 15:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 276862F0C7F;
	Mon, 11 Aug 2025 15:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gCBN9kkh"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA882EFD94;
	Mon, 11 Aug 2025 15:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754925517; cv=none; b=uu2RoUY5niHSNyMBj9GTxNiE46LIf1BzCoDyuq3vbIg5ETwQxH1n2wMPt81hjgkGYQA0VeT4O16PzZlmqkaavymPbAU+y3Mbrh2+1v3HJgODfbi7q7ONA8gMws7PLriECBQ9OKzrZZ1A1mDYi5G4a+Dhi3c/t87q/wOYFt4TiPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754925517; c=relaxed/simple;
	bh=9DhtN6HDc9ThLb4rklRbed5ca1Ez4N6HQQpJ8sOni6g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oQ6YkPtCi2GAgekViYrq2uO1kGVPtE+TRYGqx+iR1Kuv7p9RuHbBlAZNXftKgD+XmxAeF3AljF4XQv3ZkKILmrqFSQfnT5u0Omm8P8qGtzVhu9fjc6Gp+NOAxS4mljPu3KqggSH6/xPmPsxj1f0erKomjSSzKaQ0IxitlG5S2xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gCBN9kkh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E8E56C2BCC7;
	Mon, 11 Aug 2025 15:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925516;
	bh=9DhtN6HDc9ThLb4rklRbed5ca1Ez4N6HQQpJ8sOni6g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gCBN9kkhPenIQ8/o4MOtGaUKkXcX5eiziYAdGSNlX1zZSV/qn+VsWVJDm8diq1Uuc
	 QXFseVBc6N9wFkKEYhAm2LBgVocycxhN1xXVUGRKjNTWZoc973XYJMM18YxINwx0EW
	 tSU3bZstH0+ppN2EauyWXTVjt+U2T4hNe+vCkALcd3BEkfDtgkEz8pycFPsQFRTfNr
	 SUu1jIbb71znM/WSJraxnSJK48adW+3JVaSI1u8p6rYiPec2pKPHFz1iRXdt6LanrF
	 iHHBI0S3TnXBW4V6AoiZYFSWxBdDqRoDdnjKoNtgt1NM8gHGPuLIML3RX03xwkVrnP
	 E95yGFsJe4rhA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDF9ECA0EC8;
	Mon, 11 Aug 2025 15:18:35 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:19:38 -0400
Subject: [PATCH 106/114] clk: versaclock5: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-106-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925498; l=6516;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=XKgkkzQfXsal4tbcIQtc1juzVPJNcjhK8nlpaSZyjxs=;
 b=/kjWcKQ9Zcr2pUuyG6Lr+yWj6Q4DGldsVrZfZ8dUcszB2kOq+wcYal8JNiLPoeTKadFCo9Tka
 YkV2e4JPDpDCttNDDbSVeAhG4NLOZp0im3I/GBJ1u6SmobtclsiEMpv
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
 drivers/clk/clk-versaclock5.c | 71 ++++++++++++++++++++++++-------------------
 1 file changed, 40 insertions(+), 31 deletions(-)

diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index 4200022d20846038f02e191042da2a188c392402..57228e88e81dc6f2af955a82a3275430e46c0920 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -304,11 +304,11 @@ static unsigned long vc5_dbl_recalc_rate(struct clk_hw *hw,
 	return parent_rate;
 }
 
-static long vc5_dbl_round_rate(struct clk_hw *hw, unsigned long rate,
-			       unsigned long *parent_rate)
+static int vc5_dbl_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
 {
-	if ((*parent_rate == rate) || ((*parent_rate * 2) == rate))
-		return rate;
+	if ((req->best_parent_rate == req->rate) || ((req->best_parent_rate * 2) == req->rate))
+		return 0;
 	else
 		return -EINVAL;
 }
@@ -332,7 +332,7 @@ static int vc5_dbl_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops vc5_dbl_ops = {
 	.recalc_rate	= vc5_dbl_recalc_rate,
-	.round_rate	= vc5_dbl_round_rate,
+	.determine_rate = vc5_dbl_determine_rate,
 	.set_rate	= vc5_dbl_set_rate,
 };
 
@@ -363,24 +363,29 @@ static unsigned long vc5_pfd_recalc_rate(struct clk_hw *hw,
 		return parent_rate / VC5_REF_DIVIDER_REF_DIV(div);
 }
 
-static long vc5_pfd_round_rate(struct clk_hw *hw, unsigned long rate,
-			       unsigned long *parent_rate)
+static int vc5_pfd_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
 {
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
+
+		return 0;
+	}
 
-	idiv = DIV_ROUND_UP(*parent_rate, rate);
+	idiv = DIV_ROUND_UP(req->best_parent_rate, req->rate);
 	if (idiv > 127)
 		return -EINVAL;
 
-	return *parent_rate / idiv;
+	req->rate = req->best_parent_rate / idiv;
+
+	return 0;
 }
 
 static int vc5_pfd_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -420,7 +425,7 @@ static int vc5_pfd_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops vc5_pfd_ops = {
 	.recalc_rate	= vc5_pfd_recalc_rate,
-	.round_rate	= vc5_pfd_round_rate,
+	.determine_rate = vc5_pfd_determine_rate,
 	.set_rate	= vc5_pfd_set_rate,
 };
 
@@ -444,30 +449,32 @@ static unsigned long vc5_pll_recalc_rate(struct clk_hw *hw,
 	return (parent_rate * div_int) + ((parent_rate * div_frc) >> 24);
 }
 
-static long vc5_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-			       unsigned long *parent_rate)
+static int vc5_pll_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
 {
 	struct vc5_hw_data *hwdata = container_of(hw, struct vc5_hw_data, hw);
 	struct vc5_driver_data *vc5 = hwdata->vc5;
 	u32 div_int;
 	u64 div_frc;
 
-	rate = clamp(rate, VC5_PLL_VCO_MIN, vc5->chip_info->vco_max);
+	req->rate = clamp(req->rate, VC5_PLL_VCO_MIN, vc5->chip_info->vco_max);
 
 	/* Determine integer part, which is 12 bit wide */
-	div_int = rate / *parent_rate;
+	div_int = req->rate / req->best_parent_rate;
 	if (div_int > 0xfff)
-		rate = *parent_rate * 0xfff;
+		req->rate = req->best_parent_rate * 0xfff;
 
 	/* Determine best fractional part, which is 24 bit wide */
-	div_frc = rate % *parent_rate;
+	div_frc = req->rate % req->best_parent_rate;
 	div_frc *= BIT(24) - 1;
-	do_div(div_frc, *parent_rate);
+	do_div(div_frc, req->best_parent_rate);
 
 	hwdata->div_int = div_int;
 	hwdata->div_frc = (u32)div_frc;
 
-	return (*parent_rate * div_int) + ((*parent_rate * div_frc) >> 24);
+	req->rate = (req->best_parent_rate * div_int) + ((req->best_parent_rate * div_frc) >> 24);
+
+	return 0;
 }
 
 static int vc5_pll_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -488,7 +495,7 @@ static int vc5_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops vc5_pll_ops = {
 	.recalc_rate	= vc5_pll_recalc_rate,
-	.round_rate	= vc5_pll_round_rate,
+	.determine_rate = vc5_pll_determine_rate,
 	.set_rate	= vc5_pll_set_rate,
 };
 
@@ -520,17 +527,17 @@ static unsigned long vc5_fod_recalc_rate(struct clk_hw *hw,
 	return div64_u64((u64)f_in << 24ULL, ((u64)div_int << 24ULL) + div_frc);
 }
 
-static long vc5_fod_round_rate(struct clk_hw *hw, unsigned long rate,
-			       unsigned long *parent_rate)
+static int vc5_fod_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
 {
 	struct vc5_hw_data *hwdata = container_of(hw, struct vc5_hw_data, hw);
 	/* VCO frequency is divided by two before entering FOD */
-	u32 f_in = *parent_rate / 2;
+	u32 f_in = req->best_parent_rate / 2;
 	u32 div_int;
 	u64 div_frc;
 
 	/* Determine integer part, which is 12 bit wide */
-	div_int = f_in / rate;
+	div_int = f_in / req->rate;
 	/*
 	 * WARNING: The clock chip does not output signal if the integer part
 	 *          of the divider is 0xfff and fractional part is non-zero.
@@ -538,18 +545,20 @@ static long vc5_fod_round_rate(struct clk_hw *hw, unsigned long rate,
 	 */
 	if (div_int > 0xffe) {
 		div_int = 0xffe;
-		rate = f_in / div_int;
+		req->rate = f_in / div_int;
 	}
 
 	/* Determine best fractional part, which is 30 bit wide */
-	div_frc = f_in % rate;
+	div_frc = f_in % req->rate;
 	div_frc <<= 24;
-	do_div(div_frc, rate);
+	do_div(div_frc, req->rate);
 
 	hwdata->div_int = div_int;
 	hwdata->div_frc = (u32)div_frc;
 
-	return div64_u64((u64)f_in << 24ULL, ((u64)div_int << 24ULL) + div_frc);
+	req->rate = div64_u64((u64)f_in << 24ULL, ((u64)div_int << 24ULL) + div_frc);
+
+	return 0;
 }
 
 static int vc5_fod_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -589,7 +598,7 @@ static int vc5_fod_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops vc5_fod_ops = {
 	.recalc_rate	= vc5_fod_recalc_rate,
-	.round_rate	= vc5_fod_round_rate,
+	.determine_rate = vc5_fod_determine_rate,
 	.set_rate	= vc5_fod_set_rate,
 };
 

-- 
2.50.1



