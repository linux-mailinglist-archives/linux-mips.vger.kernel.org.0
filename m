Return-Path: <linux-mips+bounces-10058-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C43BB20D92
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 17:19:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67E32621088
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 15:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C281C2E1741;
	Mon, 11 Aug 2025 15:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LnqqTvDa"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E74E2E11B5;
	Mon, 11 Aug 2025 15:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754925505; cv=none; b=nBt1SQPgVTsFcW2DBSjUunsDFWauDBVvSPDSQ+X82LwsBsmEW1pqp97yhbG4tFatVrbWGod2biVdhwKzb72GtYsccsRBNEF9020AJ2/ni8bgj5HsuTYOJWyZBif7vMgxbHTqdFsvxnbwDhhIZvnD4uIFINseI84N0JOnomNsSrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754925505; c=relaxed/simple;
	bh=TdaQSq8mvIeYrNZnjdupEaO4ED3EgZ0Ms8W6bgzfct0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A08GbJybnx/mm7DJLKASCdhwjxIXeMzSUCnfRysSR85MpvR6QBXIpAKswodF86cwBwc2LxAcvg36oBTU60d1rWS/WjIgZlmJYYF51F8v0WGbOdic+nQbo7SX9fP844yaTcXuDSl8B09f1nZyp+l2YnPoJHMCRQpCyLZv8bqezYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LnqqTvDa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2DE40C4CEFD;
	Mon, 11 Aug 2025 15:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925505;
	bh=TdaQSq8mvIeYrNZnjdupEaO4ED3EgZ0Ms8W6bgzfct0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LnqqTvDalOStN3eWhPvsFIj0dHDBnnBxTeyPZlz1jBgoOxDPmsKpnYji5IAXr0DIW
	 Q5G8ZsfG3kvUbL5HWfRXbcjTza8++Mggep0+I12ldkzovgbBoL6SD3n3e1u65QJFv5
	 RD+GV9B5eWmLEyB/JChnPMBIkr5ScHjHkXP0C+Z3/jhGjBY+nc+jByMSjiRe2WlOZz
	 6CietEbHp//Mjr1WLJPdxcwDStKM3MyYTc17+h+qYl7/Y7tdAAKdnCFYByAFJDaUXz
	 yHm1f9m3Umk0lP0OXKrxHeen7wUlghgUR0n85HUK1XzBqO41RRNSZ3CJoAGIx6kXX5
	 mIVs7hu4d++vA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BA60C88CB9;
	Mon, 11 Aug 2025 15:18:25 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:17:54 -0400
Subject: [PATCH 002/114] clk: at91: peripheral: convert from round_rate()
 to determine_rate()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-2-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925497; l=3764;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=zyirca0yClNWaEsyA4yRgSm6IFANUNOLKtijue+IPEE=;
 b=xHxpbiLsoHOJfs6e9F9K2fRn+qjwW0kTAOujiN6+xnAyQ/u85/MgOQbCfuxXUqagPg+DhuFsi
 tjlaNX3CkRnDuZ/BhKkfkxulkwqkrNMislS7D8M4mmchajF/BU1U3yg
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

This driver already has a clk_sam9x5_peripheral_determine_rate()
implementation, however it can change the parent rate. The existing
round rate does not have this functionality. I could add a check
for CLK_SET_RATE_PARENT, and combine the two functions, however there
are some other minor differences in the two implementations. I don't
have access to this particular hardware. I believe that they could
be combined, however it would need to be tested on real hardware.
So, let's play it safe and convert the existing round rate
implementation to ensure that the driver keeps the same functionality
as before.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/at91/clk-peripheral.c | 41 +++++++++++++++++++++++----------------
 1 file changed, 24 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/at91/clk-peripheral.c b/drivers/clk/at91/clk-peripheral.c
index 629f050a855aaebfd1a03ff87c2b016cd2284a5a..e700f40fd87f9327365f250366f7f7bde01f5987 100644
--- a/drivers/clk/at91/clk-peripheral.c
+++ b/drivers/clk/at91/clk-peripheral.c
@@ -335,50 +335,57 @@ static int clk_sam9x5_peripheral_determine_rate(struct clk_hw *hw,
 	return 0;
 }
 
-static long clk_sam9x5_peripheral_round_rate(struct clk_hw *hw,
-					     unsigned long rate,
-					     unsigned long *parent_rate)
+static int clk_sam9x5_peripheral_no_parent_determine_rate(struct clk_hw *hw,
+							  struct clk_rate_request *req)
 {
 	int shift = 0;
 	unsigned long best_rate;
 	unsigned long best_diff;
-	unsigned long cur_rate = *parent_rate;
+	unsigned long cur_rate = req->best_parent_rate;
 	unsigned long cur_diff;
 	struct clk_sam9x5_peripheral *periph = to_clk_sam9x5_peripheral(hw);
 
-	if (periph->id < PERIPHERAL_ID_MIN || !periph->range.max)
-		return *parent_rate;
+	if (periph->id < PERIPHERAL_ID_MIN || !periph->range.max) {
+		req->rate = req->best_parent_rate;
+
+		return 0;
+	}
 
 	if (periph->range.max) {
 		for (; shift <= PERIPHERAL_MAX_SHIFT; shift++) {
-			cur_rate = *parent_rate >> shift;
+			cur_rate = req->best_parent_rate >> shift;
 			if (cur_rate <= periph->range.max)
 				break;
 		}
 	}
 
-	if (rate >= cur_rate)
-		return cur_rate;
+	if (req->rate >= cur_rate) {
+		req->rate = cur_rate;
+
+		return 0;
+	}
 
-	best_diff = cur_rate - rate;
+	best_diff = cur_rate - req->rate;
 	best_rate = cur_rate;
 	for (; shift <= PERIPHERAL_MAX_SHIFT; shift++) {
-		cur_rate = *parent_rate >> shift;
-		if (cur_rate < rate)
-			cur_diff = rate - cur_rate;
+		cur_rate = req->best_parent_rate >> shift;
+		if (cur_rate < req->rate)
+			cur_diff = req->rate - cur_rate;
 		else
-			cur_diff = cur_rate - rate;
+			cur_diff = cur_rate - req->rate;
 
 		if (cur_diff < best_diff) {
 			best_diff = cur_diff;
 			best_rate = cur_rate;
 		}
 
-		if (!best_diff || cur_rate < rate)
+		if (!best_diff || cur_rate < req->rate)
 			break;
 	}
 
-	return best_rate;
+	req->rate = best_rate;
+
+	return 0;
 }
 
 static int clk_sam9x5_peripheral_set_rate(struct clk_hw *hw,
@@ -430,7 +437,7 @@ static const struct clk_ops sam9x5_peripheral_ops = {
 	.disable = clk_sam9x5_peripheral_disable,
 	.is_enabled = clk_sam9x5_peripheral_is_enabled,
 	.recalc_rate = clk_sam9x5_peripheral_recalc_rate,
-	.round_rate = clk_sam9x5_peripheral_round_rate,
+	.determine_rate = clk_sam9x5_peripheral_no_parent_determine_rate,
 	.set_rate = clk_sam9x5_peripheral_set_rate,
 	.save_context = clk_sam9x5_peripheral_save_context,
 	.restore_context = clk_sam9x5_peripheral_restore_context,

-- 
2.50.1



