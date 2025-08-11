Return-Path: <linux-mips+bounces-10063-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6454DB20DA2
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 17:20:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38727622023
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 15:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 356BC2E2675;
	Mon, 11 Aug 2025 15:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VHRsDEmS"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0FC2E1746;
	Mon, 11 Aug 2025 15:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754925506; cv=none; b=jo52aphxFSNEys/DhTCQujkBclUQ1Gs8Tq8PltZU/bUKcdu95wG75jGuEdBNadaMY5qx7Om6GpUxTk11SdEXSfdUVhuLAa/liVTlAomQzcBqZ72vBJH1NjkwlkCj7BOlg+L9WKJlhQuj77hEy2aipZEpy14TsOaSUcxrGqh7AyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754925506; c=relaxed/simple;
	bh=E7C3P6ZNy2rKHQkGfEkPikHIRWZ/Xvgj0NeSfgIHrs8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=og0vbfwWSs7ycjvrTvshux9CGwORNJRTYJRLn9B6W1Jl2AAXzEYjNtudUuet4Gh+TQS5Qoa1/ke5aV1VxbNlBhmmVhyuuzdSlP9DLigW7NXLBros+wj2pM0sRPyd9xkE5dQdCNbW36wvnBfS8zrPN9ettnuWnMj98+sPYbo9OHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VHRsDEmS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B1D0BC2BCFB;
	Mon, 11 Aug 2025 15:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925505;
	bh=E7C3P6ZNy2rKHQkGfEkPikHIRWZ/Xvgj0NeSfgIHrs8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VHRsDEmSBjRKdetcOPNULS116ScKbzgoGND634hKVQx0oA96s8BEcVh8j+K+kdFLW
	 yUZ7ltQUfiKQw6PWppV2GVcsf3yrLkae/gewVW8//raRQlBx4GO28mse7oirloJYN0
	 dxjCQKMfHLXuw1JjA778sR79IXQKA0YT+woJJd5/XJcjKYJ88d+zx42q/0jOD6n6K7
	 BXkXukyyTb8a4hWUOshaLQFYi/yVnOQFvFtNqhi+ayD2iGtgnHm8IXwhe/iJA6OVwC
	 4u1yzsK0Bj7OAJ8jVNmrY2PLmpWUhbGRy6xdS0jP/6y0i5H++0t+1lkYW0PV0qvkFI
	 4G5BlWX3vRVGA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B2A4CA0EC1;
	Mon, 11 Aug 2025 15:18:25 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:18:00 -0400
Subject: [PATCH 008/114] clk: at91: sam9x60-pll: convert from round_rate()
 to determine_rate()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-8-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925497; l=4302;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=OxQaMcKTSkwjmYKLw5h5eyKDpcwcRbzdzL1bNRAhzHc=;
 b=eCz2rWzNoc6MDhDi3s+TtzEA+KkyxL6IXQXbFJ/7MIWOAaNmzMp2adyhQdWMW4LTINxEeWF7j
 80rtY2sTPZOBj0C3cFGU+2bqg238C4+uti4HvqwqtW5xEUni6asYwj+
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
 drivers/clk/at91/clk-sam9x60-pll.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/at91/clk-sam9x60-pll.c b/drivers/clk/at91/clk-sam9x60-pll.c
index cefd9948e10393e4762f8a1f5f2ca0a7e1180a87..bc1498c5704ad9dadbef4e990156602f2dd0bfea 100644
--- a/drivers/clk/at91/clk-sam9x60-pll.c
+++ b/drivers/clk/at91/clk-sam9x60-pll.c
@@ -230,12 +230,16 @@ static long sam9x60_frac_pll_compute_mul_frac(struct sam9x60_pll_core *core,
 	return tmprate;
 }
 
-static long sam9x60_frac_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-					unsigned long *parent_rate)
+static int sam9x60_frac_pll_determine_rate(struct clk_hw *hw,
+					   struct clk_rate_request *req)
 {
 	struct sam9x60_pll_core *core = to_sam9x60_pll_core(hw);
 
-	return sam9x60_frac_pll_compute_mul_frac(core, rate, *parent_rate, false);
+	req->rate = sam9x60_frac_pll_compute_mul_frac(core, req->rate,
+						      req->best_parent_rate,
+						      false);
+
+	return 0;
 }
 
 static int sam9x60_frac_pll_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -321,7 +325,7 @@ static const struct clk_ops sam9x60_frac_pll_ops = {
 	.unprepare = sam9x60_frac_pll_unprepare,
 	.is_prepared = sam9x60_frac_pll_is_prepared,
 	.recalc_rate = sam9x60_frac_pll_recalc_rate,
-	.round_rate = sam9x60_frac_pll_round_rate,
+	.determine_rate = sam9x60_frac_pll_determine_rate,
 	.set_rate = sam9x60_frac_pll_set_rate,
 	.save_context = sam9x60_frac_pll_save_context,
 	.restore_context = sam9x60_frac_pll_restore_context,
@@ -332,7 +336,7 @@ static const struct clk_ops sam9x60_frac_pll_ops_chg = {
 	.unprepare = sam9x60_frac_pll_unprepare,
 	.is_prepared = sam9x60_frac_pll_is_prepared,
 	.recalc_rate = sam9x60_frac_pll_recalc_rate,
-	.round_rate = sam9x60_frac_pll_round_rate,
+	.determine_rate = sam9x60_frac_pll_determine_rate,
 	.set_rate = sam9x60_frac_pll_set_rate_chg,
 	.save_context = sam9x60_frac_pll_save_context,
 	.restore_context = sam9x60_frac_pll_restore_context,
@@ -487,12 +491,15 @@ static long sam9x60_div_pll_compute_div(struct sam9x60_pll_core *core,
 	return best_rate;
 }
 
-static long sam9x60_div_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				       unsigned long *parent_rate)
+static int sam9x60_div_pll_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
 	struct sam9x60_pll_core *core = to_sam9x60_pll_core(hw);
 
-	return sam9x60_div_pll_compute_div(core, parent_rate, rate);
+	req->rate = sam9x60_div_pll_compute_div(core, &req->best_parent_rate,
+						req->rate);
+
+	return 0;
 }
 
 static int sam9x60_div_pll_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -601,7 +608,7 @@ static const struct clk_ops sam9x60_div_pll_ops = {
 	.unprepare = sam9x60_div_pll_unprepare,
 	.is_prepared = sam9x60_div_pll_is_prepared,
 	.recalc_rate = sam9x60_div_pll_recalc_rate,
-	.round_rate = sam9x60_div_pll_round_rate,
+	.determine_rate = sam9x60_div_pll_determine_rate,
 	.set_rate = sam9x60_div_pll_set_rate,
 	.save_context = sam9x60_div_pll_save_context,
 	.restore_context = sam9x60_div_pll_restore_context,
@@ -612,7 +619,7 @@ static const struct clk_ops sam9x60_div_pll_ops_chg = {
 	.unprepare = sam9x60_div_pll_unprepare,
 	.is_prepared = sam9x60_div_pll_is_prepared,
 	.recalc_rate = sam9x60_div_pll_recalc_rate,
-	.round_rate = sam9x60_div_pll_round_rate,
+	.determine_rate = sam9x60_div_pll_determine_rate,
 	.set_rate = sam9x60_div_pll_set_rate_chg,
 	.save_context = sam9x60_div_pll_save_context,
 	.restore_context = sam9x60_div_pll_restore_context,
@@ -623,7 +630,7 @@ static const struct clk_ops sam9x60_fixed_div_pll_ops = {
 	.unprepare = sam9x60_div_pll_unprepare,
 	.is_prepared = sam9x60_div_pll_is_prepared,
 	.recalc_rate = sam9x60_fixed_div_pll_recalc_rate,
-	.round_rate = sam9x60_div_pll_round_rate,
+	.determine_rate = sam9x60_div_pll_determine_rate,
 	.save_context = sam9x60_div_pll_save_context,
 	.restore_context = sam9x60_div_pll_restore_context,
 };

-- 
2.50.1



