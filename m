Return-Path: <linux-mips+bounces-10117-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B29FAB20EDD
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 17:27:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0D2A1884E17
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 15:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88EB22EAD05;
	Mon, 11 Aug 2025 15:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TAjnmagr"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA53B2EA49B;
	Mon, 11 Aug 2025 15:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754925512; cv=none; b=e4+rSAOxgy6Y7Up+i3JWoTW2VL83lfPtEQtxO0vhy2ZT/H+lQmEcglBZNM8tYuLwvSAjRRk7ETJYzqpNafimnLYQTHN0E2OSyA5ffw3K5dZ3DKHJI8sCgTRD9HuS2FIls0ot0tPvMBCiL3W9ntRl157p82UnYD+DrGRb6t2HKMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754925512; c=relaxed/simple;
	bh=T6svf9I7sAp3NdpQAtgmdqBSvkBTYYQQ/oqhcJFt+cs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EcMxBinRxifRxLG/bP6/oxnSrPiSExUX3D7OOXOXbVv7OB/qOcD8CMPcT0cHYV4/AqL99PXfFpMdcrqlHzbxUkCsjKG65nOGrRSa0JkZTeJecwOQAojhC2Oc/tVc+1Oljz4T+0S13eWmKsgDEAKdstzawAJcUeFkon7q2LDpru0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TAjnmagr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 42D85C4FE94;
	Mon, 11 Aug 2025 15:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925511;
	bh=T6svf9I7sAp3NdpQAtgmdqBSvkBTYYQQ/oqhcJFt+cs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TAjnmagrq0XbpUXlIikGEB89htJlCqnQn8attoZAmMIBC0vTypnkbuWerGLtyGayL
	 ZCyzFmXd90CtA64Y3wWr0cn+j8kWZpMfq9GIK38WHCTxwVlHM3eHDM4Zn1VRdzOp5w
	 tqLs36mH5ww9mQi/MqdAWFbH/jgle2kpCmOyQfk6QqZGYsc+co6Zyhf3amRv9u5wcG
	 cVgxdKV8GWyhEP8yrTv4bGwMtk+o8JwVq/zB5AkqpdCy5QONvrLDT06LCKXtmwijBX
	 x1z84gu4IzNhKig8+QF7aYeMBtrSbnlAjUTbyr5ZrNZkni2w0UYviXLaF6UYA8IILJ
	 Qlj6RFONUCfjA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28F17C87FDA;
	Mon, 11 Aug 2025 15:18:31 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:18:51 -0400
Subject: [PATCH 059/114] clk: stm32: stm32mp1: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-59-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925498; l=1570;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=OMkXt6ulJtXQgDcGvQq+EbcFPGGf/lhpnwaFULBTG/M=;
 b=DbiFC17Emo7Oq3yS/Q8DEleOwuM3UzLqwJsExDRUQv2YV/5reOSWynDQcyu56einvRfRTfkkf
 1w8rwQURnM6CW7TRxqi99xc57cksAjuZA/1y38sQVZHcgRkw7E4uayU
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
 drivers/clk/stm32/clk-stm32mp1.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/stm32/clk-stm32mp1.c b/drivers/clk/stm32/clk-stm32mp1.c
index b8b45ed22f981df580506f3d4ca801ba11d2bab2..2d9ccd96ec98c05eb836d632bfd9903de60ba1bb 100644
--- a/drivers/clk/stm32/clk-stm32mp1.c
+++ b/drivers/clk/stm32/clk-stm32mp1.c
@@ -970,12 +970,15 @@ static unsigned long __bestmult(struct clk_hw *hw, unsigned long rate,
 	return mult;
 }
 
-static long timer_ker_round_rate(struct clk_hw *hw, unsigned long rate,
-				 unsigned long *parent_rate)
+static int timer_ker_determine_rate(struct clk_hw *hw,
+				    struct clk_rate_request *req)
 {
-	unsigned long factor = __bestmult(hw, rate, *parent_rate);
+	unsigned long factor = __bestmult(hw, req->rate,
+					  req->best_parent_rate);
 
-	return *parent_rate * factor;
+	req->rate = req->best_parent_rate * factor;
+
+	return 0;
 }
 
 static int timer_ker_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -1026,7 +1029,7 @@ static unsigned long timer_ker_recalc_rate(struct clk_hw *hw,
 
 static const struct clk_ops timer_ker_ops = {
 	.recalc_rate	= timer_ker_recalc_rate,
-	.round_rate	= timer_ker_round_rate,
+	.determine_rate = timer_ker_determine_rate,
 	.set_rate	= timer_ker_set_rate,
 
 };

-- 
2.50.1



