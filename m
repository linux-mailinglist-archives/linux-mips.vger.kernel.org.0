Return-Path: <linux-mips+bounces-10076-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1CCB20DE6
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 17:22:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2ACEB42184B
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 15:21:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70DD72E5B1D;
	Mon, 11 Aug 2025 15:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g/k/KnWE"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36F52E5437;
	Mon, 11 Aug 2025 15:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754925508; cv=none; b=ESVzfkrupoxW6EIcvCOHVfaab8V1ulFONgCuajWpkKWh8i82IwfoemY4Bg1tOkO7tEPkGxR48Kh0Nsz/j7Xkxy+DhsIAYsJWanG5GLcLcGeMYw5RqnD3J1Gys6nD+RLepKHhH3XJssAgIxW01JNiOIIprsgr2k/R7gal5DCZrFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754925508; c=relaxed/simple;
	bh=MzHLgVmKNa5PIg7HU99Xpn5O/IxxNAFjxoNdOfTPe98=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=THUJzPUr2I8N0ZNH1KkwZmj5jxb7H5aZH7cz9uVQQrorfQO4Ugj4qu0pjLAxfqIYFeHXvWH54+wJpFG5FHISbg0OIB99s7bTviuNAPaderqhzy+5vUzBg5cNzdTMhLRWGyKlcdFh1sqk9cutb9ddnpbQd9XA6T9FyW0PN8LSgL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g/k/KnWE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C980FC4CEFB;
	Mon, 11 Aug 2025 15:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925507;
	bh=MzHLgVmKNa5PIg7HU99Xpn5O/IxxNAFjxoNdOfTPe98=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=g/k/KnWEmB9PBwfARWiW5NjmKibxW1st9m8CTiJwkFTbMCjCTcbf2tAWcxlRgc4ZP
	 gxWxpNQKoLQDuhaLorUGFqbSFCF0Il876eLiktJp/qOGeT1J5e0Nk7JkeVLDuedMkr
	 zHACDoxjTFYPkW310PUEjmv+qs9eJdtD4C+kfjttqf4Hv0mLtcTatr5hLqHP8v8Por
	 3o4DTOM0M7/WxFApLoNxqBZbURyWRtyuZGekIZWTqm8tzrYtEO3kyhKqA9KWP2IqiC
	 U12RGV6z/E66Udn0abi7TcWWNjHyivElaxYltn9ICxYcprWZQiy8QKAe1Ee226o6qp
	 T+EnAD1AYgcKA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1AC1C87FDA;
	Mon, 11 Aug 2025 15:18:27 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:18:17 -0400
Subject: [PATCH 025/114] clk: lmk04832: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-25-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925497; l=4980;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=9O7D+PzW9sSLSVVFExkKFtyqAN3GMPP9N1Dgoo8gkGE=;
 b=aTysmohN1diC+9F+HZIE9SMH2yR9uD+qUQYPgc/TmgS71HgDgduLFTAqtgB5vPpvM7xP6sPqI
 /yX/An0BW1gDNQTvoe0ZtjY60AtJ1VWZrDIcLQpk/BNuOK1JQWH2xOW
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
 drivers/clk/clk-lmk04832.c | 53 +++++++++++++++++++++++++++-------------------
 1 file changed, 31 insertions(+), 22 deletions(-)

diff --git a/drivers/clk/clk-lmk04832.c b/drivers/clk/clk-lmk04832.c
index 2bcf422f0b04e6789993849b1d80123872978418..b2107b31efa28ee93e83639d220a8bcaaeab49e4 100644
--- a/drivers/clk/clk-lmk04832.c
+++ b/drivers/clk/clk-lmk04832.c
@@ -491,28 +491,33 @@ static long lmk04832_calc_pll2_params(unsigned long prate, unsigned long rate,
 	return DIV_ROUND_CLOSEST(prate * 2 * pll2_p * pll2_n, pll2_r);
 }
 
-static long lmk04832_vco_round_rate(struct clk_hw *hw, unsigned long rate,
-				    unsigned long *prate)
+static int lmk04832_vco_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	struct lmk04832 *lmk = container_of(hw, struct lmk04832, vco);
 	unsigned int n, p, r;
 	long vco_rate;
 	int ret;
 
-	ret = lmk04832_check_vco_ranges(lmk, rate);
+	ret = lmk04832_check_vco_ranges(lmk, req->rate);
 	if (ret < 0)
 		return ret;
 
-	vco_rate = lmk04832_calc_pll2_params(*prate, rate, &n, &p, &r);
+	vco_rate = lmk04832_calc_pll2_params(req->best_parent_rate, req->rate,
+					     &n, &p, &r);
 	if (vco_rate < 0) {
 		dev_err(lmk->dev, "PLL2 parameters out of range\n");
-		return vco_rate;
+		req->rate = vco_rate;
+
+		return 0;
 	}
 
-	if (rate != vco_rate)
+	if (req->rate != vco_rate)
 		return -EINVAL;
 
-	return vco_rate;
+	req->rate = vco_rate;
+
+	return 0;
 }
 
 static int lmk04832_vco_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -579,7 +584,7 @@ static const struct clk_ops lmk04832_vco_ops = {
 	.prepare = lmk04832_vco_prepare,
 	.unprepare = lmk04832_vco_unprepare,
 	.recalc_rate = lmk04832_vco_recalc_rate,
-	.round_rate = lmk04832_vco_round_rate,
+	.determine_rate = lmk04832_vco_determine_rate,
 	.set_rate = lmk04832_vco_set_rate,
 };
 
@@ -888,25 +893,27 @@ static unsigned long lmk04832_sclk_recalc_rate(struct clk_hw *hw,
 	return DIV_ROUND_CLOSEST(prate, sysref_div);
 }
 
-static long lmk04832_sclk_round_rate(struct clk_hw *hw, unsigned long rate,
-				     unsigned long *prate)
+static int lmk04832_sclk_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
 {
 	struct lmk04832 *lmk = container_of(hw, struct lmk04832, sclk);
 	unsigned long sclk_rate;
 	unsigned int sysref_div;
 
-	sysref_div = DIV_ROUND_CLOSEST(*prate, rate);
-	sclk_rate = DIV_ROUND_CLOSEST(*prate, sysref_div);
+	sysref_div = DIV_ROUND_CLOSEST(req->best_parent_rate, req->rate);
+	sclk_rate = DIV_ROUND_CLOSEST(req->best_parent_rate, sysref_div);
 
 	if (sysref_div < 0x07 || sysref_div > 0x1fff) {
 		dev_err(lmk->dev, "SYSREF divider out of range\n");
 		return -EINVAL;
 	}
 
-	if (rate != sclk_rate)
+	if (req->rate != sclk_rate)
 		return -EINVAL;
 
-	return sclk_rate;
+	req->rate = sclk_rate;
+
+	return 0;
 }
 
 static int lmk04832_sclk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -945,7 +952,7 @@ static const struct clk_ops lmk04832_sclk_ops = {
 	.prepare = lmk04832_sclk_prepare,
 	.unprepare = lmk04832_sclk_unprepare,
 	.recalc_rate = lmk04832_sclk_recalc_rate,
-	.round_rate = lmk04832_sclk_round_rate,
+	.determine_rate = lmk04832_sclk_determine_rate,
 	.set_rate = lmk04832_sclk_set_rate,
 };
 
@@ -1069,26 +1076,28 @@ static unsigned long lmk04832_dclk_recalc_rate(struct clk_hw *hw,
 	return rate;
 }
 
-static long lmk04832_dclk_round_rate(struct clk_hw *hw, unsigned long rate,
-				     unsigned long *prate)
+static int lmk04832_dclk_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
 {
 	struct lmk_dclk *dclk = container_of(hw, struct lmk_dclk, hw);
 	struct lmk04832 *lmk = dclk->lmk;
 	unsigned long dclk_rate;
 	unsigned int dclk_div;
 
-	dclk_div = DIV_ROUND_CLOSEST(*prate, rate);
-	dclk_rate = DIV_ROUND_CLOSEST(*prate, dclk_div);
+	dclk_div = DIV_ROUND_CLOSEST(req->best_parent_rate, req->rate);
+	dclk_rate = DIV_ROUND_CLOSEST(req->best_parent_rate, dclk_div);
 
 	if (dclk_div < 1 || dclk_div > 0x3ff) {
 		dev_err(lmk->dev, "%s_div out of range\n", clk_hw_get_name(hw));
 		return -EINVAL;
 	}
 
-	if (rate != dclk_rate)
+	if (req->rate != dclk_rate)
 		return -EINVAL;
 
-	return dclk_rate;
+	req->rate = dclk_rate;
+
+	return 0;
 }
 
 static int lmk04832_dclk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -1158,7 +1167,7 @@ static const struct clk_ops lmk04832_dclk_ops = {
 	.prepare = lmk04832_dclk_prepare,
 	.unprepare = lmk04832_dclk_unprepare,
 	.recalc_rate = lmk04832_dclk_recalc_rate,
-	.round_rate = lmk04832_dclk_round_rate,
+	.determine_rate = lmk04832_dclk_determine_rate,
 	.set_rate = lmk04832_dclk_set_rate,
 };
 

-- 
2.50.1



