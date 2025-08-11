Return-Path: <linux-mips+bounces-10140-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85379B20F2C
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 17:29:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E86473E0091
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 15:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BE222F0C6F;
	Mon, 11 Aug 2025 15:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OUWRvmtu"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6636F2EF654;
	Mon, 11 Aug 2025 15:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754925517; cv=none; b=U6feFhDbBlBHIs2YUxKfMplvRYWKQniseHhjr4j6QoXrJ4Nu+PAS/owLqBF+Xz8VNzbEHsG7V/C02Isd+iqRayxtlEeWr6n2qDjn8aXE7Tc4w0u3fCZxk3YTODuyp94f2DoX6KKVkHUaR1Hsfmyp9S4uZ7vRAhLWB1Zir+VH2k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754925517; c=relaxed/simple;
	bh=8yFQn/0V+G3SE/Nld8CAixy+jX80NpW3cIdqK6pmmEc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A6mC4UApQvW8VMTlwi0D4a3fF63S5vMUy0i4a5TdJMjBrYznBiqVoeGofdAMXIavLs+/AyXOhDbBu+TH+QorntwqmMcHq0VSfw/krzmg/oUkk7m4c97xag+fJVS+EDoS8oKTnnT5bpKY7iGgwqVCfPT6QJDkmmPU/zUstqhvi7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OUWRvmtu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 18188C4E68D;
	Mon, 11 Aug 2025 15:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925515;
	bh=8yFQn/0V+G3SE/Nld8CAixy+jX80NpW3cIdqK6pmmEc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OUWRvmtuSXdlVptyhtHZ2gbwlpDfcA24qyzed+7thXBwJYd6MGGB3OYsMXVGmS55e
	 /iRpfoAGramTBbLXzGFMZXbJohYCj47HMJAJYqGq9U7cvuJmDyagciX4j2HXldxH82
	 b8iB1J/wlUs4ZtSL7tNxwY33jKNWnhUkHxUKW5DaIRSZD5SBOSTgyCc5aHZDOBP8Yv
	 f3Bx+L2zvxO7zvtu/Yyx27gcMVegzXRMiWnTpUu0FsBV13HvvJOYNzPL3cqEoB23/C
	 nvWKl5EqV/ylz5W+CWjVIyr6PhY04kx4nXCieuBUuDapq+VXsYr98Ow/YagmsBWnxe
	 UUlsv8QBKbmkw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8F35CA0ED8;
	Mon, 11 Aug 2025 15:18:34 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:19:29 -0400
Subject: [PATCH 097/114] clk: rp1: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-97-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925498; l=4461;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=rdxgpdA+5LOZ/7CHakL5ki1icj7gNHfthuGcJ7vBYJk=;
 b=yt/m+CsjZ2sdii1+ZCBUSFlC7Hfk3mz5ymDXaz2sgWd/cE4Nyh/h9+AJD/8y+hn/vG5XBHOBw
 GNti/3o14ZSBQhvTCB4TmL3xyG6EVakz6hYA8E2hIypKOOVRqrrCOr5
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
 drivers/clk/clk-rp1.c | 45 ++++++++++++++++++++++++++-------------------
 1 file changed, 26 insertions(+), 19 deletions(-)

diff --git a/drivers/clk/clk-rp1.c b/drivers/clk/clk-rp1.c
index afff90d487341cee0463e62e4066ff0eb723bd07..8d985c431d9e35a5bfe48b45a24bf26555659b7c 100644
--- a/drivers/clk/clk-rp1.c
+++ b/drivers/clk/clk-rp1.c
@@ -530,13 +530,15 @@ static unsigned long rp1_pll_core_recalc_rate(struct clk_hw *hw,
 	return calc_rate;
 }
 
-static long rp1_pll_core_round_rate(struct clk_hw *hw, unsigned long rate,
-				    unsigned long *parent_rate)
+static int rp1_pll_core_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	u32 fbdiv_int, fbdiv_frac;
 
-	return get_pll_core_divider(hw, rate, *parent_rate,
-				    &fbdiv_int, &fbdiv_frac);
+	req->rate = get_pll_core_divider(hw, req->rate, req->best_parent_rate,
+					 &fbdiv_int, &fbdiv_frac);
+
+	return 0;
 }
 
 static void get_pll_prim_dividers(unsigned long rate, unsigned long parent_rate,
@@ -614,14 +616,16 @@ static unsigned long rp1_pll_recalc_rate(struct clk_hw *hw,
 	return DIV_ROUND_CLOSEST(parent_rate, prim_div1 * prim_div2);
 }
 
-static long rp1_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-			       unsigned long *parent_rate)
+static int rp1_pll_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
 {
 	u32 div1, div2;
 
-	get_pll_prim_dividers(rate, *parent_rate, &div1, &div2);
+	get_pll_prim_dividers(req->rate, req->best_parent_rate, &div1, &div2);
 
-	return DIV_ROUND_CLOSEST(*parent_rate, div1 * div2);
+	req->rate = DIV_ROUND_CLOSEST(req->best_parent_rate, div1 * div2);
+
+	return 0;
 }
 
 static int rp1_pll_ph_is_on(struct clk_hw *hw)
@@ -671,13 +675,15 @@ static unsigned long rp1_pll_ph_recalc_rate(struct clk_hw *hw,
 	return parent_rate / data->fixed_divider;
 }
 
-static long rp1_pll_ph_round_rate(struct clk_hw *hw, unsigned long rate,
-				  unsigned long *parent_rate)
+static int rp1_pll_ph_determine_rate(struct clk_hw *hw,
+				     struct clk_rate_request *req)
 {
 	struct rp1_clk_desc *pll_ph = container_of(hw, struct rp1_clk_desc, hw);
 	const struct rp1_pll_ph_data *data = pll_ph->data;
 
-	return *parent_rate / data->fixed_divider;
+	req->rate = req->best_parent_rate / data->fixed_divider;
+
+	return 0;
 }
 
 static int rp1_pll_divider_is_on(struct clk_hw *hw)
@@ -754,11 +760,12 @@ static unsigned long rp1_pll_divider_recalc_rate(struct clk_hw *hw,
 	return clk_divider_ops.recalc_rate(hw, parent_rate);
 }
 
-static long rp1_pll_divider_round_rate(struct clk_hw *hw,
-				       unsigned long rate,
-				       unsigned long *parent_rate)
+static int rp1_pll_divider_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
-	return clk_divider_ops.round_rate(hw, rate, parent_rate);
+	req->rate = clk_divider_ops.determine_rate(hw, req);
+
+	return 0;
 }
 
 static int rp1_clock_is_on(struct clk_hw *hw)
@@ -1068,13 +1075,13 @@ static const struct clk_ops rp1_pll_core_ops = {
 	.unprepare = rp1_pll_core_off,
 	.set_rate = rp1_pll_core_set_rate,
 	.recalc_rate = rp1_pll_core_recalc_rate,
-	.round_rate = rp1_pll_core_round_rate,
+	.determine_rate = rp1_pll_core_determine_rate,
 };
 
 static const struct clk_ops rp1_pll_ops = {
 	.set_rate = rp1_pll_set_rate,
 	.recalc_rate = rp1_pll_recalc_rate,
-	.round_rate = rp1_pll_round_rate,
+	.determine_rate = rp1_pll_determine_rate,
 };
 
 static const struct clk_ops rp1_pll_ph_ops = {
@@ -1082,7 +1089,7 @@ static const struct clk_ops rp1_pll_ph_ops = {
 	.prepare = rp1_pll_ph_on,
 	.unprepare = rp1_pll_ph_off,
 	.recalc_rate = rp1_pll_ph_recalc_rate,
-	.round_rate = rp1_pll_ph_round_rate,
+	.determine_rate = rp1_pll_ph_determine_rate,
 };
 
 static const struct clk_ops rp1_pll_divider_ops = {
@@ -1091,7 +1098,7 @@ static const struct clk_ops rp1_pll_divider_ops = {
 	.unprepare = rp1_pll_divider_off,
 	.set_rate = rp1_pll_divider_set_rate,
 	.recalc_rate = rp1_pll_divider_recalc_rate,
-	.round_rate = rp1_pll_divider_round_rate,
+	.determine_rate = rp1_pll_divider_determine_rate,
 };
 
 static const struct clk_ops rp1_clk_ops = {

-- 
2.50.1



