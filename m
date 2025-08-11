Return-Path: <linux-mips+bounces-10130-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A9BB20F26
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 17:29:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 813A63A327E
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 15:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC7AB2EE5F0;
	Mon, 11 Aug 2025 15:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pXjAPlyT"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964312ED850;
	Mon, 11 Aug 2025 15:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754925516; cv=none; b=Av/mvZdU5vkFCGaAFcSQwFzG+NlKuf9aNI4u0w8GS6hJHckpcCQAS8/X4+Gl61hMZWMvHbjwSwBpCJqjCehB1NyGFOupawfw0HLmtVZ6CgqEb3ojfjyczR/3vlfNuefzcm5IHkTz0YK4YfZigJ5bI7tvxsJrBJNFVRpp5hqUoPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754925516; c=relaxed/simple;
	bh=2g/djq+4hFXZ0OOpbfyEXaF7jGDLKXPmkpmBtLAB3Ck=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bw9VcuwPcuY5C+89txgTLvwWiDNioL0os+0bmPR3cRXzmx3zSsWNbSgk1TCNKbQOO/LZCH6qxztIj9OG06HSFsnF83XR2M38w4pAgwJKQTzJKhWXyVDOByNPCuPjK1zXR48UxOrJ3lplwkYB9UxcwdUQHjRwAiLOEN/S2x1QxsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pXjAPlyT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2C265C55DE5;
	Mon, 11 Aug 2025 15:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925513;
	bh=2g/djq+4hFXZ0OOpbfyEXaF7jGDLKXPmkpmBtLAB3Ck=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pXjAPlyTiZ+nc5r+9dCI9/qyGPY4diEGKH4WmUtzu6l3S+4FUC2XYbLzMIRdB/Mxb
	 gE30D46+pLV/v88cmuefiMOsV4qsHGt9vfEFQ9FBABJrqFa4bPxjotxQWCFAcFMAPf
	 A7Mry+/G9ewgUAzJhr0hsInc8Fb5c5O7w451BC1MtepzwevpHI/27XaM1zXgF35+BQ
	 4ILfyxFHuHlYASsSKF8kn0h/+QKlgPrZor9EdmKVfIWDAqXj4U1ur/c6nYM720LbiZ
	 YyAKjetEmcfYYdLFuVNGaEpPxMnHT5XS8eazcRpSwD2xAQOvt+BgssNt1zemZEKeAD
	 xj0BEoKZ7/U+Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1205CCA0ED3;
	Mon, 11 Aug 2025 15:18:33 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:19:10 -0400
Subject: [PATCH 078/114] clk: bcm: iproc-asiu: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-78-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925498; l=1957;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=6ioMu4+9UAItFS7H+eBG3CyIWro6x44XklxAacg3uaw=;
 b=vLu64vwwALh+I9RSN6KksddaCwCNlfEXyI3Fcmya/ds2RbS7mGsDALrDSl5rC7ne7egWrNKVD
 npXIYcWo63FAuTzcQ0NBiAuy5N6L2TJdOnfq6b8kKP3Tw/W3gYlf+xc
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
 drivers/clk/bcm/clk-iproc-asiu.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/bcm/clk-iproc-asiu.c b/drivers/clk/bcm/clk-iproc-asiu.c
index dcacf55c55ae06bc45fd5585265084075353b379..83ec13da9b2e1de9438ee4fb23b8e2e1852d59f2 100644
--- a/drivers/clk/bcm/clk-iproc-asiu.c
+++ b/drivers/clk/bcm/clk-iproc-asiu.c
@@ -98,22 +98,27 @@ static unsigned long iproc_asiu_clk_recalc_rate(struct clk_hw *hw,
 	return clk->rate;
 }
 
-static long iproc_asiu_clk_round_rate(struct clk_hw *hw, unsigned long rate,
-				      unsigned long *parent_rate)
+static int iproc_asiu_clk_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
 {
 	unsigned int div;
 
-	if (rate == 0 || *parent_rate == 0)
+	if (req->rate == 0 || req->best_parent_rate == 0)
 		return -EINVAL;
 
-	if (rate == *parent_rate)
-		return *parent_rate;
+	if (req->rate == req->best_parent_rate)
+		return 0;
 
-	div = DIV_ROUND_CLOSEST(*parent_rate, rate);
-	if (div < 2)
-		return *parent_rate;
+	div = DIV_ROUND_CLOSEST(req->best_parent_rate, req->rate);
+	if (div < 2) {
+		req->rate = req->best_parent_rate;
 
-	return *parent_rate / div;
+		return 0;
+	}
+
+	req->rate = req->best_parent_rate / div;
+
+	return 0;
 }
 
 static int iproc_asiu_clk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -168,7 +173,7 @@ static const struct clk_ops iproc_asiu_ops = {
 	.enable = iproc_asiu_clk_enable,
 	.disable = iproc_asiu_clk_disable,
 	.recalc_rate = iproc_asiu_clk_recalc_rate,
-	.round_rate = iproc_asiu_clk_round_rate,
+	.determine_rate = iproc_asiu_clk_determine_rate,
 	.set_rate = iproc_asiu_clk_set_rate,
 };
 

-- 
2.50.1



