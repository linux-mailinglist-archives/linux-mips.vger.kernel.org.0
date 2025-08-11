Return-Path: <linux-mips+bounces-10090-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DB5B20E44
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 17:24:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B73F3AB179
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 15:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBBE02E7BDA;
	Mon, 11 Aug 2025 15:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mFgG3loQ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098112E1C78;
	Mon, 11 Aug 2025 15:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754925509; cv=none; b=HmORM/+nBUPiUlwglwN/mrLYZ8KF6+S3xvvKhGp4AukracKPtwtEb9Z6qInhdEg26woxUFM5C3Ahg2Ur57dMLhw4TbSCOoSGzLsXoQ6BBcswJbxEIhWJp5EKO765YiCiDQNTxVlLABXWyq18gGjpWEZmKB+PbHKiBSCoUSfAf2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754925509; c=relaxed/simple;
	bh=EceAz0gkP06guCu7njtkRh0Rlxv1sGIen5KvFDr5Yhc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tXBh7ghrjZp9cUBEXSrRxlNjMAELJjGFewTMdDAseJpY7E6nHzGXdCAi+ZlnmSMU0cPRbe1F2g+zpWtUVaTYYL5JzukekOzf8hv8TuB9OOtLBCLZtvq5Nvrous4FxsL2r2MJ07D5tQIYGwggcmUUn+POGGoWGiek4yTKLQ2lJ/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mFgG3loQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D82FBC4AF1B;
	Mon, 11 Aug 2025 15:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925508;
	bh=EceAz0gkP06guCu7njtkRh0Rlxv1sGIen5KvFDr5Yhc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mFgG3loQTzNEJEvfb7yKawEQS2S1u5xDmEItebIeXipr+4USFmTWjTKMvEj/Vs3Mg
	 JwkejLkwWWadR42nJkn86o+ZwxJVOHTmlyJJ4BSUKxgOXc9nDcOoeuj6xRiRnVoc8Z
	 5CQxnlL9BOsCxXCD5VtTUP1P2fA4ikOiEhZBPPswLSSYsKsdKoEGS+/znWBvsBtzNS
	 hRWEBODnk8HlVUxiOBfsgWhyhS0fNA2AjJGccT6r4gbv+/wRC4eUWfu78s3Tyq+/hQ
	 xNgB/ltwTqMjL3A/LF3iHOctz1I4CYAKOP4oEsEY1DlAPeBzOKrHb25h6kPGD6RVi8
	 L4nuAQx6j/LZA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0DBCC87FD2;
	Mon, 11 Aug 2025 15:18:28 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:18:27 -0400
Subject: [PATCH 035/114] clk: nuvoton: ma35d1-divider: convert from
 round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-35-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925497; l=1810;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=kg08atohLFewl0jOxOzsnjF5Gymt0yX/f+cIJ8dXOXA=;
 b=qFmcgAGLaBbDRycLB4coxbfj8Y/JJhKjcTMkrnwQ8lSeQqTuZDivXIMPyNJd/3F4h55Wx4ELW
 JJMgwNs4wUQDxH29+4RDewAMGj/vwO0jCE2Qaw/XbgNoLrraUg/Jg5i
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
 drivers/clk/nuvoton/clk-ma35d1-divider.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1-divider.c b/drivers/clk/nuvoton/clk-ma35d1-divider.c
index bb8c23d2b895ff1975165443b4bd2541e9d6e272..e39f53d5bf4578c628d34b05233c8e8da317c4d4 100644
--- a/drivers/clk/nuvoton/clk-ma35d1-divider.c
+++ b/drivers/clk/nuvoton/clk-ma35d1-divider.c
@@ -39,12 +39,16 @@ static unsigned long ma35d1_clkdiv_recalc_rate(struct clk_hw *hw, unsigned long
 				   CLK_DIVIDER_ROUND_CLOSEST, dclk->width);
 }
 
-static long ma35d1_clkdiv_round_rate(struct clk_hw *hw, unsigned long rate, unsigned long *prate)
+static int ma35d1_clkdiv_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
 {
 	struct ma35d1_adc_clk_div *dclk = to_ma35d1_adc_clk_div(hw);
 
-	return divider_round_rate(hw, rate, prate, dclk->table,
-				  dclk->width, CLK_DIVIDER_ROUND_CLOSEST);
+	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
+				       dclk->table, dclk->width,
+				       CLK_DIVIDER_ROUND_CLOSEST);
+
+	return 0;
 }
 
 static int ma35d1_clkdiv_set_rate(struct clk_hw *hw, unsigned long rate, unsigned long parent_rate)
@@ -71,7 +75,7 @@ static int ma35d1_clkdiv_set_rate(struct clk_hw *hw, unsigned long rate, unsigne
 
 static const struct clk_ops ma35d1_adc_clkdiv_ops = {
 	.recalc_rate = ma35d1_clkdiv_recalc_rate,
-	.round_rate = ma35d1_clkdiv_round_rate,
+	.determine_rate = ma35d1_clkdiv_determine_rate,
 	.set_rate = ma35d1_clkdiv_set_rate,
 };
 

-- 
2.50.1



