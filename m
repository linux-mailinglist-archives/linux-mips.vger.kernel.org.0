Return-Path: <linux-mips+bounces-10091-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE9BB20E47
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 17:24:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B39893ABAF9
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 15:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E77FC2E7F19;
	Mon, 11 Aug 2025 15:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bwbkkkP+"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DD22E7176;
	Mon, 11 Aug 2025 15:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754925509; cv=none; b=p4Xx+TMgaZa68PCmnk6zKtQtnYuYxHgv3u6D5ZCXR6PKqUhas1cRr6TpeZCXOogOm7kw+CK/8JiJDYtryUu1FrdKSNedeicZ/fb5+paU/FC2Om6YRmOD0wJM7apEKBw4FOZZz/tMwNpLOi7kaKc34/9FUWnFEMYxvfe/d6xcgYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754925509; c=relaxed/simple;
	bh=queKsTtKB32N7EPjQSUCR/4rTC/5USNoziJ/hkh36Do=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lz68zPpcUG2MX6RYWpoJC2HLEgeIB5MD8dk6JlPkZJs/lEzMxwXqqlJ6lCEf92ys1Tid3/C7alOOOErRL0H9w/kRcNkntjqPEruoqnAU3uz2TSrbWmvFn7ysGyB2VeGjbJu2e8OVo6PUKbNzw4CKTQNa/0CfAf8sOE77FPousNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bwbkkkP+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9972C4CEFF;
	Mon, 11 Aug 2025 15:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925509;
	bh=queKsTtKB32N7EPjQSUCR/4rTC/5USNoziJ/hkh36Do=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bwbkkkP+OMzrmN2zvbzl0YBE6XTdLHAmS2lmkMVTWvPIYvv5K4Yqza+skGrE3oX16
	 2vMgt+Fhaq+x+EFXjNO8B5J36wRJk9kAVOYkjb+opELAhGNSsvcfUoYxBHfretsRLA
	 4zGYB5tubX4WobBHSnJRtGTymUt8CicVtWsuICL0bLiyPac5LO2rYcrQConJ79ktsn
	 cfngnHp2yfE0Bp52S/e06c8odvWOupl48duxmmDzvnnMWG4XzbU2DJU07yEnk/VXlt
	 SXI0dxcK7qVuM0OFyrwEcR2ttGb4de7yPovU0ccJvJqqKfC4opbxfTo00zUqY69v8N
	 pSC7//Tk5wYuA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6325C87FDA;
	Mon, 11 Aug 2025 15:18:28 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:18:28 -0400
Subject: [PATCH 036/114] clk: nuvoton: ma35d1-pll: convert from
 round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-36-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925497; l=2856;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=le7opsxs0SynMMO1WbjAmxEq9McwQ2/93Evsw++xuwQ=;
 b=Kxhwjvdno7BQdbPOQ6FQwluBNf+pBvM1qs5Lxn/nxYkyMDPwVqnZbrDrRrQRloIFcBfsoB6Fk
 Ue2Yz4cZOJrAE4dZQ3/gEwhrcGfLfhaNTnBzchHnHAV2J+2OfHmaoFG
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
 drivers/clk/nuvoton/clk-ma35d1-pll.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1-pll.c b/drivers/clk/nuvoton/clk-ma35d1-pll.c
index ff3fb8b87c24b0fc0823cbd2e3cf311137fa56db..4620acfe47e85f7982325bb5610a23888c7a9cf2 100644
--- a/drivers/clk/nuvoton/clk-ma35d1-pll.c
+++ b/drivers/clk/nuvoton/clk-ma35d1-pll.c
@@ -244,35 +244,43 @@ static unsigned long ma35d1_clk_pll_recalc_rate(struct clk_hw *hw, unsigned long
 	return 0;
 }
 
-static long ma35d1_clk_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				      unsigned long *parent_rate)
+static int ma35d1_clk_pll_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
 {
 	struct ma35d1_clk_pll *pll = to_ma35d1_clk_pll(hw);
 	u32 reg_ctl[3] = { 0 };
 	unsigned long pll_freq;
 	long ret;
 
-	if (*parent_rate < PLL_FREF_MIN_FREQ || *parent_rate > PLL_FREF_MAX_FREQ)
+	if (req->best_parent_rate < PLL_FREF_MIN_FREQ || req->best_parent_rate > PLL_FREF_MAX_FREQ)
 		return -EINVAL;
 
-	ret = ma35d1_pll_find_closest(pll, rate, *parent_rate, reg_ctl, &pll_freq);
+	ret = ma35d1_pll_find_closest(pll, req->rate, req->best_parent_rate,
+				      reg_ctl, &pll_freq);
 	if (ret < 0)
 		return ret;
 
 	switch (pll->id) {
 	case CAPLL:
 		reg_ctl[0] = readl_relaxed(pll->ctl0_base);
-		pll_freq = ma35d1_calc_smic_pll_freq(reg_ctl[0], *parent_rate);
-		return pll_freq;
+		pll_freq = ma35d1_calc_smic_pll_freq(reg_ctl[0], req->best_parent_rate);
+		req->rate = pll_freq;
+
+		return 0;
 	case DDRPLL:
 	case APLL:
 	case EPLL:
 	case VPLL:
 		reg_ctl[0] = readl_relaxed(pll->ctl0_base);
 		reg_ctl[1] = readl_relaxed(pll->ctl1_base);
-		pll_freq = ma35d1_calc_pll_freq(pll->mode, reg_ctl, *parent_rate);
-		return pll_freq;
+		pll_freq = ma35d1_calc_pll_freq(pll->mode, reg_ctl, req->best_parent_rate);
+		req->rate = pll_freq;
+
+		return 0;
 	}
+
+	req->rate = 0;
+
 	return 0;
 }
 
@@ -311,12 +319,12 @@ static const struct clk_ops ma35d1_clk_pll_ops = {
 	.unprepare = ma35d1_clk_pll_unprepare,
 	.set_rate = ma35d1_clk_pll_set_rate,
 	.recalc_rate = ma35d1_clk_pll_recalc_rate,
-	.round_rate = ma35d1_clk_pll_round_rate,
+	.determine_rate = ma35d1_clk_pll_determine_rate,
 };
 
 static const struct clk_ops ma35d1_clk_fixed_pll_ops = {
 	.recalc_rate = ma35d1_clk_pll_recalc_rate,
-	.round_rate = ma35d1_clk_pll_round_rate,
+	.determine_rate = ma35d1_clk_pll_determine_rate,
 };
 
 struct clk_hw *ma35d1_reg_clk_pll(struct device *dev, u32 id, u8 u8mode, const char *name,

-- 
2.50.1



