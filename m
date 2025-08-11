Return-Path: <linux-mips+bounces-10080-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB91B20E21
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 17:23:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 349DD188BD64
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 15:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B90222E6136;
	Mon, 11 Aug 2025 15:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mUbkN6N+"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176A52E54AD;
	Mon, 11 Aug 2025 15:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754925508; cv=none; b=o+tkUT8sypqLKjCZyoqQfrcjJJAmANa6V/xNTeW7dMGzgjPStIobAo77btzvRf3tNa0kxnU5v8g5Qn4E1POSw8uAe6ZRjKih5SucUI8Wv6WZr984WWNEZYXFK8R5s0eI9++p1sOGbF7gH82aHpEln5PpTnJF0wtw7tDatoBT6u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754925508; c=relaxed/simple;
	bh=/m0n1INc3kjKj/iN6d8ZFdtoDJNBF32BzXLWWav9174=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iJgUGHfjUpW+BP8T86T3XERzi3uLIyHk7nO+KP00POlaLL8410luyqJzYolM2HgopQl9Zekq1Zb3wY5M8t/g8SMzjYzsv8CWmilyQ/RwriVEy+KKeGCKk28OYwB9GQtXghWl/rOKhL9KOouSHE5DM6ePEC+6e3M7VnVdKGseZDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mUbkN6N+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 72F9AC4AF1A;
	Mon, 11 Aug 2025 15:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925507;
	bh=/m0n1INc3kjKj/iN6d8ZFdtoDJNBF32BzXLWWav9174=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mUbkN6N+CNmm8nTVqGRkFckCwJiU1p1E3R9dGgYnaFaLQtoFQb5BwcNUw9d6hkm7g
	 XBR7mrDWtporFUlSsi0382MonLYH2BfvtRnW5JtLXwjQHxGy8l7Tz/wwZJYPKCFmXa
	 7dE6LlaiKs8rhhwF2fClJm+9BV+a4L1YeL4WuYlFltjLoJNxkcrxtA5SO9iJ6my9nd
	 4kBHQPR9g76oyz42O4yvDvZQlvCz0YikpDjQw32JY8htxsYwhPkgLOssNXzlAsnlY1
	 nQAjwFU2PhoJ/59YoDs3gAe2PHstlQgAk1hRJRQL/OxfNz1zy1Habt7SkPzARArisl
	 rutQqSPuNszYg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FB12C88CB9;
	Mon, 11 Aug 2025 15:18:27 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:18:15 -0400
Subject: [PATCH 023/114] clk: ingenic: jz4780-cgu: convert from
 round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-23-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925497; l=1813;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=MPzcrBPQGuTfy56c5U5WcclOdTxeqPehVwkouGqu3Y4=;
 b=fmvYy9drD5J5zVeuCA/o62mRsAJKEF9i+yF7AEdh4jKSXBdGTuOFIpHpll7aYhS8aCTB6bTPn
 O9N7kQvZyOzCAZkEfXW5xZFF+SWrOkWWqFNMrkcqg32x9FVx+8pAVZX
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
 drivers/clk/ingenic/jz4780-cgu.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/ingenic/jz4780-cgu.c b/drivers/clk/ingenic/jz4780-cgu.c
index b1dadc0a5e7556a8570286344818c2d1157bf9e8..07e2f3c5c4549e28726b2dccd5f465f56aa9e694 100644
--- a/drivers/clk/ingenic/jz4780-cgu.c
+++ b/drivers/clk/ingenic/jz4780-cgu.c
@@ -128,19 +128,19 @@ static unsigned long jz4780_otg_phy_recalc_rate(struct clk_hw *hw,
 	return parent_rate;
 }
 
-static long jz4780_otg_phy_round_rate(struct clk_hw *hw, unsigned long req_rate,
-				      unsigned long *parent_rate)
+static int jz4780_otg_phy_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
 {
-	if (req_rate < 15600000)
-		return 12000000;
-
-	if (req_rate < 21600000)
-		return 19200000;
+	if (req->rate < 15600000)
+		req->rate = 12000000;
+	else if (req->rate < 21600000)
+		req->rate = 19200000;
+	else if (req->rate < 36000000)
+		req->rate = 24000000;
+	else
+		req->rate = 48000000;
 
-	if (req_rate < 36000000)
-		return 24000000;
-
-	return 48000000;
+	return 0;
 }
 
 static int jz4780_otg_phy_set_rate(struct clk_hw *hw, unsigned long req_rate,
@@ -212,7 +212,7 @@ static int jz4780_otg_phy_is_enabled(struct clk_hw *hw)
 
 static const struct clk_ops jz4780_otg_phy_ops = {
 	.recalc_rate = jz4780_otg_phy_recalc_rate,
-	.round_rate = jz4780_otg_phy_round_rate,
+	.determine_rate = jz4780_otg_phy_determine_rate,
 	.set_rate = jz4780_otg_phy_set_rate,
 
 	.enable		= jz4780_otg_phy_enable,

-- 
2.50.1



