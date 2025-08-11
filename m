Return-Path: <linux-mips+bounces-10107-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B7ABDB20E9A
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 17:25:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A89B190029B
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 15:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 560822EA163;
	Mon, 11 Aug 2025 15:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HUx/vexG"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032B22E9EB9;
	Mon, 11 Aug 2025 15:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754925512; cv=none; b=dvd66xYhCAQSGrMXTGhnl0q6SAsaz9JxrSCQ4cHLmPaEpekH/vHBQaI4ioBZ4CWHoPfbmMlNT7gPpDBP7T6HcAruDLVCJT3Hhx0CVT8lqp6qHiFcSQ2KhPAGxXj6ORK1b+VGHtlZaU/ypl3NAcJJAMUsSCCI1INddqvT7hiPRfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754925512; c=relaxed/simple;
	bh=MhEGRNx5PEKUNY1zKi5fR7x2pFBbHeEH8AEkTPsWEKM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jz7YIfnRCUvMiGAUgMcqok5V4rMbZ3straZmhyYL/a+Mb1tlRb/h3/oIMB2QFfeMPE8nV92VQ9X3+bxWksG0xe79rCDYobLTOlUYPfoyyTfeNWblVvs/m8vQazuGVLKRM4zphnZEqVQktN2L5LO/wkkds9s14oOVqpybBaGmYh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HUx/vexG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E10D6C4CEF8;
	Mon, 11 Aug 2025 15:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925510;
	bh=MhEGRNx5PEKUNY1zKi5fR7x2pFBbHeEH8AEkTPsWEKM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HUx/vexGMtUMukHYUUT6xkyBbsUR2c7wR4pRyO+IyDr9KZFtUM6L2QPudEzuARxYK
	 C78VC98KRC8EGebbVR2K/lAaSgwgS1MSf864vhHuie0DsmizbwTfOxVkanqF39bzOE
	 PBq6JSijov71Dld3Cdx3EftV2cMuuQau4XHu80sD8pVySXhvoztSkD99C6Cgvdr4Yq
	 COcjGUdK7Ztsncay5p9yeA1UGg/t68QRSd09d8X5VpnNPz+LbwRPLlJtrFs7zpkK4H
	 PAqMfqt8hptPU1PXLNW7K/0R23qaqcWtx8ueKs1/IlenWuZj3rWWd3pzlJZOihI41Y
	 +2fBR79wJSh/w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C86E8C88CB9;
	Mon, 11 Aug 2025 15:18:29 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:18:37 -0400
Subject: [PATCH 045/114] clk: si570: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-45-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925498; l=2083;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=u1OMhMwXuV7+/nhwfF+uE+ysp+6puvUWRn+/hBv686M=;
 b=zpWpLy+2xiSBJ6LH++CWDJRg9CmksGcCmVV92O/D6wLJsbE+fqWNn7gTXf4hZ8lkhalu8vaHJ
 PIgZEXW+ERCCeTAnIfuj3No+uaGXP+qj9mx5ugWj7Hvgybp28YzzirP
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
 drivers/clk/clk-si570.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/clk-si570.c b/drivers/clk/clk-si570.c
index e97fe90443a645c905465ad37cb5490c0c096834..b0b1830dd4302f9ad92023de2e0276cd8ea02639 100644
--- a/drivers/clk/clk-si570.c
+++ b/drivers/clk/clk-si570.c
@@ -246,34 +246,40 @@ static unsigned long si570_recalc_rate(struct clk_hw *hw,
 	return rate;
 }
 
-static long si570_round_rate(struct clk_hw *hw, unsigned long rate,
-		unsigned long *parent_rate)
+static int si570_determine_rate(struct clk_hw *hw,
+				struct clk_rate_request *req)
 {
 	int err;
 	u64 rfreq;
 	unsigned int n1, hs_div;
 	struct clk_si570 *data = to_clk_si570(hw);
 
-	if (!rate)
+	if (!req->rate) {
+		req->rate = 0;
+
 		return 0;
+	}
 
-	if (div64_u64(abs(rate - data->frequency) * 10000LL,
+	if (div64_u64(abs(req->rate - data->frequency) * 10000LL,
 				data->frequency) < 35) {
-		rfreq = div64_u64((data->rfreq * rate) +
-				div64_u64(data->frequency, 2), data->frequency);
+		rfreq = div64_u64((data->rfreq * req->rate) +
+				  div64_u64(data->frequency, 2),
+				  data->frequency);
 		n1 = data->n1;
 		hs_div = data->hs_div;
 
 	} else {
-		err = si570_calc_divs(rate, data, &rfreq, &n1, &hs_div);
+		err = si570_calc_divs(req->rate, data, &rfreq, &n1, &hs_div);
 		if (err) {
 			dev_err(&data->i2c_client->dev,
 					"unable to round rate\n");
+			req->rate = 0;
+
 			return 0;
 		}
 	}
 
-	return rate;
+	return 0;
 }
 
 /**
@@ -368,7 +374,7 @@ static int si570_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops si570_clk_ops = {
 	.recalc_rate = si570_recalc_rate,
-	.round_rate = si570_round_rate,
+	.determine_rate = si570_determine_rate,
 	.set_rate = si570_set_rate,
 };
 

-- 
2.50.1



