Return-Path: <linux-mips+bounces-10124-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB06B20EB5
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 17:26:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D8152A1A51
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 15:25:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D99C52ECD03;
	Mon, 11 Aug 2025 15:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HMFaH3nu"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7762EBBB7;
	Mon, 11 Aug 2025 15:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754925514; cv=none; b=BaW4vfbP5PI1AxpbrZuFq3irW/O1yV2R1tmzLg974LStMcFPuG1rDCxU/ti9uFNLImze/b3nlto9SHgclCA4aNPioEGfFh1qu2W8kJ+A6Bo9gAj+fDEx9s1ezVNGzVyfNWTclaiJncDcaQFb2OxP9Q420y/Cl2yjyXOXb92r8X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754925514; c=relaxed/simple;
	bh=886H/n+ok80mLXkVrmS6YcevLoJQHX9bhodmGIII/GE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r+1C5rTfY5dmrrLtEQKzdQIF9Klfyn2JqvAHEyUse9KM2THoSApa88RAE/A5vrBdt+M4OfG99rjPt1TpQSXNUtE5gkUDdZfe30sNCN2ly31pL9WV5rjUN0YrKibC5stUNWBmSepYoZMzB4rNYqxIh9p1wU2UKqAc6w0bbEzSSdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HMFaH3nu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6C4E4C4CEFE;
	Mon, 11 Aug 2025 15:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925512;
	bh=886H/n+ok80mLXkVrmS6YcevLoJQHX9bhodmGIII/GE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HMFaH3nufzX0kUVW/50h6mCzrGoCsSEZb23J5KLBx21+vfabFFefboD1Lh2fowK66
	 1/Gc8nFQSBJv9rnEndazwo03Kkbnjl66DKNthmJ+c7s7EolOUrqziV+OCpmGEOn805
	 qi+jDpXVpKck6BjkXlQajtsYmel6w+/CW2W35Jb5r/2hJoLeLrMvkkEvZw21nASTKt
	 vLtvF/1r3WzkqJ5XmMivUa91tB/WSpGS8eWzM67d52XUuM0YBzF4QnwhD5QAzUj9Rd
	 JP5DXely99jKAiYzDWgsBjiwez4FURLZRoiPHScE+r+53cBMQ8EXuIePD/eXcoje3b
	 hAB52beBy9igg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54FA9C87FD2;
	Mon, 11 Aug 2025 15:18:32 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:19:03 -0400
Subject: [PATCH 071/114] clk: actions: owl-composite: convert from
 round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-71-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925498; l=1656;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=rppRbGPELjN20Eg42v9ZOmEzkkXGAODN+hzSiKR7wPQ=;
 b=xqF1eoy8nHktQVdHk5LO771dB8JtR/uR1+DrGu0qXqdC3Dh1OaHMmzI021ud72YEIUAVMcsip
 yJ9zJyIpo0xBV21DL1imLpWgwybiD2R1/gDavVwe+SW73X3FEfrUZSf
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
 drivers/clk/actions/owl-composite.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/actions/owl-composite.c b/drivers/clk/actions/owl-composite.c
index 48f177f6ce9cfacda80b4809b52a24f4fcd30871..00b74f8bc4375a8f42e9b54c7bf1affe91e1074a 100644
--- a/drivers/clk/actions/owl-composite.c
+++ b/drivers/clk/actions/owl-composite.c
@@ -122,13 +122,13 @@ static int owl_comp_fact_set_rate(struct clk_hw *hw, unsigned long rate,
 					rate, parent_rate);
 }
 
-static long owl_comp_fix_fact_round_rate(struct clk_hw *hw, unsigned long rate,
-			unsigned long *parent_rate)
+static int owl_comp_fix_fact_determine_rate(struct clk_hw *hw,
+					    struct clk_rate_request *req)
 {
 	struct owl_composite *comp = hw_to_owl_comp(hw);
 	struct clk_fixed_factor *fix_fact_hw = &comp->rate.fix_fact_hw;
 
-	return comp->fix_fact_ops->round_rate(&fix_fact_hw->hw, rate, parent_rate);
+	return comp->fix_fact_ops->determine_rate(&fix_fact_hw->hw, req);
 }
 
 static unsigned long owl_comp_fix_fact_recalc_rate(struct clk_hw *hw,
@@ -193,7 +193,7 @@ const struct clk_ops owl_comp_fix_fact_ops = {
 	.is_enabled	= owl_comp_is_enabled,
 
 	/* fix_fact_ops */
-	.round_rate	= owl_comp_fix_fact_round_rate,
+	.determine_rate = owl_comp_fix_fact_determine_rate,
 	.recalc_rate	= owl_comp_fix_fact_recalc_rate,
 	.set_rate	= owl_comp_fix_fact_set_rate,
 };

-- 
2.50.1



