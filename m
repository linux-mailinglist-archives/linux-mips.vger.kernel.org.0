Return-Path: <linux-mips+bounces-10067-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD6BB20DDF
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 17:21:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3A89190027C
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 15:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CEAC2E3B0E;
	Mon, 11 Aug 2025 15:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rsyU60xe"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049372E338D;
	Mon, 11 Aug 2025 15:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754925507; cv=none; b=qa/M34h9WcVsUa1A9Wfe6mQ79yxPLRTlVodx/r6s6ltyVEA90yH4Cakhsx6qMYyPb6RxRrwQJ0k/3SrS2Q8ire8zrZED8S936RmLri5KG4xF4Pze/66t07rlKNblg4bwepuWY0mwtSkuZOmQF2eAsv6TPwytpixoYkZMAmhAhIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754925507; c=relaxed/simple;
	bh=7rX1geJ4QcH2XspxzkfcE9ZNpmbJNXPpOWIuEdUFhdY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HO/HTC+StvF6rkHAb9uoaapqh9qkKY4dStoXQiUZktbzPKcf6Zjaqs0Z4/mJvDWM0m3rvhFA2iu7zGw5kgrei0hUQ/Zr4+3SZO5ewZQ5MTX3g63xCCFCvcDlKELaB5tq0alAV3gxSkpYbNZquFPwGonHPWBE0o8JsssXKWGFkvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rsyU60xe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 26987C4AF15;
	Mon, 11 Aug 2025 15:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925506;
	bh=7rX1geJ4QcH2XspxzkfcE9ZNpmbJNXPpOWIuEdUFhdY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rsyU60xeZiGIWaLFBsV4tAX8KWHxlGzo4VX4D+1ASRTA6V12s5hSBcm6/7Mx3QIMq
	 usIX2kkwtiq1/a4MKZZ9yZjJl6RFS4S4k4cotkIxbFE2v2osmU6LpbN5nr5beRrSQ1
	 xUFxGctqxMtapdqOGeB38tva2b+tMFaNtmmy2LmQ/iFsIy98GHBTljuGJccMORIhH0
	 62WQR0w46soNV2fVldeMTjgdNusHvEtHfG5HCmc3sZWwUex2wwt4SsNS2vHLH2U8mj
	 ZNpCuRZJrxWnI42vECGECO76Z3YvXALY3xuymD1WnoPrjPX6WGcq/B61NVO0+CG5M6
	 yJ+mJtZ/MF/Hw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D3CCC88CB9;
	Mon, 11 Aug 2025 15:18:26 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:18:04 -0400
Subject: [PATCH 012/114] clk: cdce925: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-12-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925497; l=4117;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=mLxtPz4K1JQXjrMRMOJ4qFaMMnmNFAZE+gNOLsYKYyc=;
 b=j6GkpR0WY5JRaQ5XaSrii+/y3khi7YcIEkrih2qQ54+o1rhl7fwcEU1Nzv8rakTLfcnOFSyt8
 vr/RoOkOAAFDCMO9z37B2S6gm0OkX4uwFgfanLcH7ZqTcbYqSTQMNvs
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
 drivers/clk/clk-cdce925.c | 50 +++++++++++++++++++++++++++--------------------
 1 file changed, 29 insertions(+), 21 deletions(-)

diff --git a/drivers/clk/clk-cdce925.c b/drivers/clk/clk-cdce925.c
index c51818c1af982619265306bbd418929a948a4c72..0b2ad21e6e4d34ea1297de489b2e226ff2af40c4 100644
--- a/drivers/clk/clk-cdce925.c
+++ b/drivers/clk/clk-cdce925.c
@@ -128,13 +128,15 @@ static void cdce925_pll_find_rate(unsigned long rate,
 	}
 }
 
-static long cdce925_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-		unsigned long *parent_rate)
+static int cdce925_pll_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	u16 n, m;
 
-	cdce925_pll_find_rate(rate, *parent_rate, &n, &m);
-	return (long)cdce925_pll_calculate_rate(*parent_rate, n, m);
+	cdce925_pll_find_rate(req->rate, req->best_parent_rate, &n, &m);
+	req->rate = (long)cdce925_pll_calculate_rate(req->best_parent_rate, n, m);
+
+	return 0;
 }
 
 static int cdce925_pll_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -266,7 +268,7 @@ static const struct clk_ops cdce925_pll_ops = {
 	.prepare = cdce925_pll_prepare,
 	.unprepare = cdce925_pll_unprepare,
 	.recalc_rate = cdce925_pll_recalc_rate,
-	.round_rate = cdce925_pll_round_rate,
+	.determine_rate = cdce925_pll_determine_rate,
 	.set_rate = cdce925_pll_set_rate,
 };
 
@@ -420,20 +422,23 @@ static unsigned long cdce925_clk_best_parent_rate(
 	return rate * pdiv_best;
 }
 
-static long cdce925_clk_round_rate(struct clk_hw *hw, unsigned long rate,
-		unsigned long *parent_rate)
+static int cdce925_clk_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
-	unsigned long l_parent_rate = *parent_rate;
-	u16 divider = cdce925_calc_divider(rate, l_parent_rate);
+	unsigned long l_parent_rate = req->best_parent_rate;
+	u16 divider = cdce925_calc_divider(req->rate, l_parent_rate);
 
-	if (l_parent_rate / divider != rate) {
-		l_parent_rate = cdce925_clk_best_parent_rate(hw, rate);
-		divider = cdce925_calc_divider(rate, l_parent_rate);
-		*parent_rate = l_parent_rate;
+	if (l_parent_rate / divider != req->rate) {
+		l_parent_rate = cdce925_clk_best_parent_rate(hw, req->rate);
+		divider = cdce925_calc_divider(req->rate, l_parent_rate);
+		req->best_parent_rate = l_parent_rate;
 	}
 
 	if (divider)
-		return (long)(l_parent_rate / divider);
+		req->rate = (long)(l_parent_rate / divider);
+	else
+		req->rate = 0;
+
 	return 0;
 }
 
@@ -451,7 +456,7 @@ static const struct clk_ops cdce925_clk_ops = {
 	.prepare = cdce925_clk_prepare,
 	.unprepare = cdce925_clk_unprepare,
 	.recalc_rate = cdce925_clk_recalc_rate,
-	.round_rate = cdce925_clk_round_rate,
+	.determine_rate = cdce925_clk_determine_rate,
 	.set_rate = cdce925_clk_set_rate,
 };
 
@@ -473,14 +478,17 @@ static u16 cdce925_y1_calc_divider(unsigned long rate,
 	return (u16)divider;
 }
 
-static long cdce925_clk_y1_round_rate(struct clk_hw *hw, unsigned long rate,
-		unsigned long *parent_rate)
+static int cdce925_clk_y1_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
 {
-	unsigned long l_parent_rate = *parent_rate;
-	u16 divider = cdce925_y1_calc_divider(rate, l_parent_rate);
+	unsigned long l_parent_rate = req->best_parent_rate;
+	u16 divider = cdce925_y1_calc_divider(req->rate, l_parent_rate);
 
 	if (divider)
-		return (long)(l_parent_rate / divider);
+		req->rate = (long)(l_parent_rate / divider);
+	else
+		req->rate = 0;
+
 	return 0;
 }
 
@@ -498,7 +506,7 @@ static const struct clk_ops cdce925_clk_y1_ops = {
 	.prepare = cdce925_clk_prepare,
 	.unprepare = cdce925_clk_unprepare,
 	.recalc_rate = cdce925_clk_recalc_rate,
-	.round_rate = cdce925_clk_y1_round_rate,
+	.determine_rate = cdce925_clk_y1_determine_rate,
 	.set_rate = cdce925_clk_y1_set_rate,
 };
 

-- 
2.50.1



