Return-Path: <linux-mips+bounces-10059-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 104E5B20D7D
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 17:19:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97CE117CCB7
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 15:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC1B12E1754;
	Mon, 11 Aug 2025 15:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uO0itys8"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D0E2E11C6;
	Mon, 11 Aug 2025 15:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754925505; cv=none; b=t2toX4pJ1SkMQb/klBwreIOmdUu3Gykjf4rirgBWa74+1ETCStOd95Lb2G7VGIp4pb6WhPkVepCrAvho7TVxr6SJzTsrY1Hj1j9rzeqbOgmpSieDFT9VodRnRZkQUgC9wBR7sT/q+qKt7hCkvSJpitnNZWPJwXDX3Md2UderjXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754925505; c=relaxed/simple;
	bh=QwCvYSi7oYXstdT2DyXr0f3ZFKbxUGLkDDPHK/1uHFk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bt9QnXHBxbzqH+Syqs85/3SynyALG8JYDZHAxBsVzLQoJnl336ANLKck6Q0b6GOYO+M4kmymUq9u1c7YbliFjLVRddFs1AUfQrJ62s33RvWzGncYnm7KCSbXacTEADEWc+iVf5aWrSD96DcIU1bFxp17KajaWyVZ6WcCMZtIytQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uO0itys8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 55512C116C6;
	Mon, 11 Aug 2025 15:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925505;
	bh=QwCvYSi7oYXstdT2DyXr0f3ZFKbxUGLkDDPHK/1uHFk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=uO0itys8wScIVlo6jOid3yFBpIRGmmHbZOAkYoI0GYQzeEkvQW/LuOD2xbhzb8pzh
	 RBUzbWXLFsF52oIk+6w1S4oJK+0gqhr8K3yhsMIXHtxPB/88yPIlo9V3Wunjy+1jlP
	 GkOocJk3Qf2B9895MHkUwYQx1gtXWQmVc+I7zoYTRAceQYnLmxHCaye40fxvacUuSE
	 OEIMSTrDPACD0mGAwt4r2I60NRg6yjuHNJOlT6FclSrUY1OvZV0xQAFaLv9h3km7ZH
	 LHl2vCcIuFjIPsb/h4w3m24P9ezbKeQWfqzzoF0ykKH+eN0rVq1TNAj7NIOKnbX5IJ
	 otAyNWCv3ZSQQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46B6BC87FDA;
	Mon, 11 Aug 2025 15:18:25 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:17:56 -0400
Subject: [PATCH 004/114] clk: at91: audio-pll: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-4-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925497; l=4707;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=SGuw9JWwq1o444YOUxZkRtwxJ8APzz0URtEM9+13sSI=;
 b=rQevtpMTTg6AuxnWclCBYR4DBW+XT5DBJ/qMYawxw+fPmJ+1r3Z0RGI7ddAzU4PeeYmsgdcf+
 7B/fVywiFKRCqXPAxx3m+mC5TIs6FBc7Dbf3TiCgQ5IL0FSxlxlfDeQ
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
 drivers/clk/at91/clk-audio-pll.c | 42 ++++++++++++++++++++++------------------
 1 file changed, 23 insertions(+), 19 deletions(-)

diff --git a/drivers/clk/at91/clk-audio-pll.c b/drivers/clk/at91/clk-audio-pll.c
index a92da64c12e1cff5961d0b85bd630a25015206b1..bf9b635ac9d6e2fa3523376799315f04ea0ead2a 100644
--- a/drivers/clk/at91/clk-audio-pll.c
+++ b/drivers/clk/at91/clk-audio-pll.c
@@ -270,8 +270,8 @@ static int clk_audio_pll_frac_determine_rate(struct clk_hw *hw,
 	return 0;
 }
 
-static long clk_audio_pll_pad_round_rate(struct clk_hw *hw, unsigned long rate,
-					 unsigned long *parent_rate)
+static int clk_audio_pll_pad_determine_rate(struct clk_hw *hw,
+					    struct clk_rate_request *req)
 {
 	struct clk_hw *pclk = clk_hw_get_parent(hw);
 	long best_rate = -EINVAL;
@@ -283,7 +283,7 @@ static long clk_audio_pll_pad_round_rate(struct clk_hw *hw, unsigned long rate,
 	int best_diff = -1;
 
 	pr_debug("A PLL/PAD: %s, rate = %lu (parent_rate = %lu)\n", __func__,
-		 rate, *parent_rate);
+		 req->rate, req->best_parent_rate);
 
 	/*
 	 * Rate divisor is actually made of two different divisors, multiplied
@@ -304,12 +304,12 @@ static long clk_audio_pll_pad_round_rate(struct clk_hw *hw, unsigned long rate,
 				continue;
 
 			best_parent_rate = clk_hw_round_rate(pclk,
-							rate * tmp_qd * div);
+							req->rate * tmp_qd * div);
 			tmp_rate = best_parent_rate / (div * tmp_qd);
-			tmp_diff = abs(rate - tmp_rate);
+			tmp_diff = abs(req->rate - tmp_rate);
 
 			if (best_diff < 0 || best_diff > tmp_diff) {
-				*parent_rate = best_parent_rate;
+				req->best_parent_rate = best_parent_rate;
 				best_rate = tmp_rate;
 				best_diff = tmp_diff;
 			}
@@ -318,11 +318,13 @@ static long clk_audio_pll_pad_round_rate(struct clk_hw *hw, unsigned long rate,
 	pr_debug("A PLL/PAD: %s, best_rate = %ld, best_parent_rate = %lu\n",
 		 __func__, best_rate, best_parent_rate);
 
-	return best_rate;
+	req->rate = best_rate;
+
+	return 0;
 }
 
-static long clk_audio_pll_pmc_round_rate(struct clk_hw *hw, unsigned long rate,
-					 unsigned long *parent_rate)
+static int clk_audio_pll_pmc_determine_rate(struct clk_hw *hw,
+					    struct clk_rate_request *req)
 {
 	struct clk_hw *pclk = clk_hw_get_parent(hw);
 	long best_rate = -EINVAL;
@@ -333,20 +335,20 @@ static long clk_audio_pll_pmc_round_rate(struct clk_hw *hw, unsigned long rate,
 	int best_diff = -1;
 
 	pr_debug("A PLL/PMC: %s, rate = %lu (parent_rate = %lu)\n", __func__,
-		 rate, *parent_rate);
+		 req->rate, req->best_parent_rate);
 
-	if (!rate)
+	if (!req->rate)
 		return 0;
 
 	best_parent_rate = clk_round_rate(pclk->clk, 1);
-	div = max(best_parent_rate / rate, 1UL);
+	div = max(best_parent_rate / req->rate, 1UL);
 	for (; div <= AUDIO_PLL_QDPMC_MAX; div++) {
-		best_parent_rate = clk_round_rate(pclk->clk, rate * div);
+		best_parent_rate = clk_round_rate(pclk->clk, req->rate * div);
 		tmp_rate = best_parent_rate / div;
-		tmp_diff = abs(rate - tmp_rate);
+		tmp_diff = abs(req->rate - tmp_rate);
 
 		if (best_diff < 0 || best_diff > tmp_diff) {
-			*parent_rate = best_parent_rate;
+			req->best_parent_rate = best_parent_rate;
 			best_rate = tmp_rate;
 			best_diff = tmp_diff;
 			tmp_qd = div;
@@ -356,9 +358,11 @@ static long clk_audio_pll_pmc_round_rate(struct clk_hw *hw, unsigned long rate,
 	}
 
 	pr_debug("A PLL/PMC: %s, best_rate = %ld, best_parent_rate = %lu (qd = %d)\n",
-		 __func__, best_rate, *parent_rate, tmp_qd - 1);
+		 __func__, best_rate, req->best_parent_rate, tmp_qd - 1);
+
+	req->rate = best_rate;
 
-	return best_rate;
+	return 0;
 }
 
 static int clk_audio_pll_frac_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -436,7 +440,7 @@ static const struct clk_ops audio_pll_pad_ops = {
 	.enable = clk_audio_pll_pad_enable,
 	.disable = clk_audio_pll_pad_disable,
 	.recalc_rate = clk_audio_pll_pad_recalc_rate,
-	.round_rate = clk_audio_pll_pad_round_rate,
+	.determine_rate = clk_audio_pll_pad_determine_rate,
 	.set_rate = clk_audio_pll_pad_set_rate,
 };
 
@@ -444,7 +448,7 @@ static const struct clk_ops audio_pll_pmc_ops = {
 	.enable = clk_audio_pll_pmc_enable,
 	.disable = clk_audio_pll_pmc_disable,
 	.recalc_rate = clk_audio_pll_pmc_recalc_rate,
-	.round_rate = clk_audio_pll_pmc_round_rate,
+	.determine_rate = clk_audio_pll_pmc_determine_rate,
 	.set_rate = clk_audio_pll_pmc_set_rate,
 };
 

-- 
2.50.1



