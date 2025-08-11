Return-Path: <linux-mips+bounces-10118-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77145B20E86
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 17:25:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A97362A26B3
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 15:25:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04A7A2EB5C1;
	Mon, 11 Aug 2025 15:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t2hwY9sd"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D26B2EACF7;
	Mon, 11 Aug 2025 15:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754925513; cv=none; b=N+esugATQjr63VKq+L/gpimSOq43TmufWGlxj/ZP0d0quIMAX96Rn0jjAL+6xqxcRo5h6TkjRu3Bi+HA56FUFbCS9t5JeQBiX+Opcle9YRsFowjnIrbsaLPYMsuMDswTWz4Z+s60vy9BGHq6PZggSqBjSt2cOT4xUQGei1U42D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754925513; c=relaxed/simple;
	bh=RNPN2SiCBEbc+AcF/cCn7c00+Qgz+KU2YQyyc+F0hh8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xauk1OOxIgOs73en6GuZa+vXKS21JQQ/pJp8use+76XhMwncNFLBcpRFxDZstRFTDBwZ4uuBSW55bmBhknLHe3dSqv7DJBeKFoy0/wQK3dHM2B8GXEs2GTyxIyAtAX0csDUs9p/7yICAeqsVkBKuv30wDZOI/+wqgN9d/qGAmWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t2hwY9sd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A86C0C2BCB3;
	Mon, 11 Aug 2025 15:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925511;
	bh=RNPN2SiCBEbc+AcF/cCn7c00+Qgz+KU2YQyyc+F0hh8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=t2hwY9sdUh0bm2cJzQus5a7pmmTtJ1p10X4Pqq7bErinFn93puCU3RhuSQpXD2VNM
	 DnkH6sDiwtEZg22wt1xhACCaFQ62Pc1UmsR9IaV+toF64SMmorMGwW732gtr/gc/pw
	 ifeOCgQ5KLWkEJhudQ26hBMLXqB0Kj7jgpcxi2F5lfPPkVF+O/9lhcc1tC7AJkLcqX
	 v8jbZ7VNKkS+6lqWI7MxnHy9aWKmNrbu/7sQcqSVyYnIb9emYa9URvMUZuEoKbh2Y3
	 cgWU5ZO60SSbJthgMpeKsFlEGR3JL43AVOJYC6+FQA5yuppJuAXHVVxaNXGEAm+SpV
	 lKC9os4EPHuHQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96794CA0EC8;
	Mon, 11 Aug 2025 15:18:31 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:18:55 -0400
Subject: [PATCH 063/114] clk: wm831x: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-63-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925498; l=1764;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=i3mGQJOb3sx5V+uesOSQVIfVUYnnH5uB5xAx+9cEFco=;
 b=aidwsVEIvZ+L+XneRcHzWbpXu94vZIAi7Yj2KRjHRri8gKtW0c35Ea1zgQaMMkInRQPd/tOVx
 9oCiKSbQHxUBeyDV1JzfSaCerGqesbxDPGJP4z48iYQ/SSe7+qsc6RO
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
 drivers/clk/clk-wm831x.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/clk-wm831x.c b/drivers/clk/clk-wm831x.c
index 34e9d4d541e25c1adf766b48333f11c2d5b219fb..263e927138c2ead84d9f154d5e0f2d7b068f1c1f 100644
--- a/drivers/clk/clk-wm831x.c
+++ b/drivers/clk/clk-wm831x.c
@@ -133,18 +133,20 @@ static unsigned long wm831x_fll_recalc_rate(struct clk_hw *hw,
 	return 0;
 }
 
-static long wm831x_fll_round_rate(struct clk_hw *hw, unsigned long rate,
-				  unsigned long *unused)
+static int wm831x_fll_determine_rate(struct clk_hw *hw,
+				     struct clk_rate_request *req)
 {
 	int best = 0;
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(wm831x_fll_auto_rates); i++)
-		if (abs(wm831x_fll_auto_rates[i] - rate) <
-		    abs(wm831x_fll_auto_rates[best] - rate))
+		if (abs(wm831x_fll_auto_rates[i] - req->rate) <
+		    abs(wm831x_fll_auto_rates[best] - req->rate))
 			best = i;
 
-	return wm831x_fll_auto_rates[best];
+	req->rate = wm831x_fll_auto_rates[best];
+
+	return 0;
 }
 
 static int wm831x_fll_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -214,7 +216,7 @@ static const struct clk_ops wm831x_fll_ops = {
 	.is_prepared = wm831x_fll_is_prepared,
 	.prepare = wm831x_fll_prepare,
 	.unprepare = wm831x_fll_unprepare,
-	.round_rate = wm831x_fll_round_rate,
+	.determine_rate = wm831x_fll_determine_rate,
 	.recalc_rate = wm831x_fll_recalc_rate,
 	.set_rate = wm831x_fll_set_rate,
 	.get_parent = wm831x_fll_get_parent,

-- 
2.50.1



