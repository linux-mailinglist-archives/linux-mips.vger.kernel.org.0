Return-Path: <linux-mips+bounces-10135-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9FEB20F61
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 17:31:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 84DFC1A23427
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 15:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DFD42EFD85;
	Mon, 11 Aug 2025 15:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C+UAOvCt"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396042ED84E;
	Mon, 11 Aug 2025 15:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754925517; cv=none; b=qONCt1blZkrhf/wHwAQoiLFh11qScI35Nft9qBq7pCgEvwr0x23VErbVDvD04P188vB9Zat7JBJ4YuGQx2k/WvjZ5u2HNGHn5LKh9PH3Ov79n9IGkM1OILzcsu736lssS+UxOCkFc8dfc6j04OcHWU62zpoeClzpmerMN+Bi9N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754925517; c=relaxed/simple;
	bh=6lj3V1C0/DftyeMH7vl66XV+5XnLIK0s8oSagPukryg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=elCdUrrOjHJv8qa7rClMiCwv5ukl4bozS0UwpamZw0sl4RhS8yaDEzFJnddgtaiu0raFvMJ7p0XS2w9BqHFi3ucGMHNGuw7AZG+5okQStgOIuDZsc0ct8G6d/8/He9cm0dG/7ywttSDf8J0aPAyk04tTdhUa1c0lUDlob8QaWWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C+UAOvCt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6AFFBC567DB;
	Mon, 11 Aug 2025 15:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925515;
	bh=6lj3V1C0/DftyeMH7vl66XV+5XnLIK0s8oSagPukryg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=C+UAOvCtZbUbMG5rntyUPCH5KCueNTX6QwCJ+yP4jbgGVKwgKbCeqbf68229foLj/
	 jqGv43HcjbFRHQunSzyw7y+p2LtQBGCCGRPdW7dilDUuT97Wt7PAOEh5aesfYy7+4J
	 QY3ok77rAwMtb+KEkX5sd4KRbP+5wvojFGwNBEd4m2Iwq771GmmkdG7dJc5e0S12K7
	 m0QZPXAivqZ5zu9GknrHDSsHL90vBWB6+kTV65jnwvl8QyJr1Hr03NhLkdJU+t4egP
	 nDglTUc0BgX8SAbCPY20JkRe94znMjxts8g5SRFhnpZyzbklPRA7nqvkYuuw9wZ3fO
	 MNeH174keSSIA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C267CA0EC8;
	Mon, 11 Aug 2025 15:18:35 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:19:32 -0400
Subject: [PATCH 100/114] clk: sp7021: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-100-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925498; l=1961;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=83siigDgElU7FqWleUU9IM12P9ymZvPWIUf1vsjwjv8=;
 b=4DY/vRjmlVCFDKUCXNIA9Ns89LQVD88Si/kjdjbIM7teu2NWiMJmxa2/4qNATLPRoV+DVZ6N/
 ALPMaIHijxdCUkfNA1BHx3FhxvR17L8Q8Lw62MBES1g8RW2hOqsQqZp
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
 drivers/clk/clk-sp7021.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/clk-sp7021.c b/drivers/clk/clk-sp7021.c
index 95d66191df4bdb3609128ea097be896ef3a1038a..445e3da50e29f931b73f05fe956d9d38affe0ca7 100644
--- a/drivers/clk/clk-sp7021.c
+++ b/drivers/clk/clk-sp7021.c
@@ -412,25 +412,27 @@ static long sp_pll_calc_div(struct sp_pll *clk, unsigned long rate)
 	return fbdiv;
 }
 
-static long sp_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-			      unsigned long *prate)
+static int sp_pll_determine_rate(struct clk_hw *hw,
+				 struct clk_rate_request *req)
 {
 	struct sp_pll *clk = to_sp_pll(hw);
 	long ret;
 
-	if (rate == *prate) {
-		ret = *prate; /* bypass */
+	if (req->rate == req->best_parent_rate) {
+		ret = req->best_parent_rate; /* bypass */
 	} else if (clk->div_width == DIV_A) {
-		ret = plla_round_rate(clk, rate);
+		ret = plla_round_rate(clk, req->rate);
 	} else if (clk->div_width == DIV_TV) {
-		ret = plltv_div(clk, rate);
+		ret = plltv_div(clk, req->rate);
 		if (ret < 0)
-			ret = *prate;
+			ret = req->best_parent_rate;
 	} else {
-		ret = sp_pll_calc_div(clk, rate) * clk->brate;
+		ret = sp_pll_calc_div(clk, req->rate) * clk->brate;
 	}
 
-	return ret;
+	req->rate = ret;
+
+	return 0;
 }
 
 static unsigned long sp_pll_recalc_rate(struct clk_hw *hw,
@@ -535,7 +537,7 @@ static const struct clk_ops sp_pll_ops = {
 	.enable = sp_pll_enable,
 	.disable = sp_pll_disable,
 	.is_enabled = sp_pll_is_enabled,
-	.round_rate = sp_pll_round_rate,
+	.determine_rate = sp_pll_determine_rate,
 	.recalc_rate = sp_pll_recalc_rate,
 	.set_rate = sp_pll_set_rate
 };

-- 
2.50.1



