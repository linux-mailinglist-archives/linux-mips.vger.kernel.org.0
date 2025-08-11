Return-Path: <linux-mips+bounces-10086-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FB3B20E05
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 17:22:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C686624DE4
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 15:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D3642E7627;
	Mon, 11 Aug 2025 15:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cavdbgVA"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9F72E5B1B;
	Mon, 11 Aug 2025 15:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754925508; cv=none; b=GNWXyZHkxp9WC2ucjbrE+c7/aZhhJ6GoM3Gs6GsDP4WrzW4pZIa8wA/Wm/VZJ3Ih9rnJ7vclEdMpxVtdgbuZB9ndv9kmvJNaHVnwWUFDVv/B1cg/W9TggumYOLdtjlWcmnmceGczgYBivaxgtUqgVkAMo6dgQwllX+A8NMEWC5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754925508; c=relaxed/simple;
	bh=D0+0HBJ7gBFk3mQrClsW6gZHZMCBYhVZq5dCZk+U4EA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jaBl/4B9jAnxbRgSlBsC4oPZnsLtNfHoIllnT9RFlosExpYoWGwvMCYuWPyfG41U/CWGVq9RLYzisnKtMoQn9c1ZJ4kckOKK11IEt8xFJXBPayfN6P/Oi5Qbvpgw0tA1eat2zIGCUlYXUyVm/RWg5oYCGpm+XoOS5kDLfIGSuYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cavdbgVA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 43611C4CEFE;
	Mon, 11 Aug 2025 15:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925508;
	bh=D0+0HBJ7gBFk3mQrClsW6gZHZMCBYhVZq5dCZk+U4EA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cavdbgVAgWi1Q8Iv3Mnf7WEmbB1xdeUHE/blW4Ix8Cq3fip4DW3gG11n97wFYnPzE
	 LkR0+x2CcdazwTXLxUfWeHQwzHCQtaZpHV+GGkGPxT9t6LBLttKmf6OD6FHKyx4vTU
	 9js3oIcu6puaJFBPFUFIxpNJL7gKgBHaZXG8jjWP/CnQ14fbePFkFlqW7c7fcusOsO
	 nTr+O08qe9RiDW33jEdrW5YyzZEgHs8mRBB26nSbOf2dWw9VbkXmeldWq7GQ4/7JNW
	 VgkVqyF8SzeCvJzd5ko9W09AB/4Xzlbq+WimWVXuuNMajhxJcuqSymYXLSs2MUsBEg
	 t96/27rodptwA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31C2BC87FDA;
	Mon, 11 Aug 2025 15:18:28 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:18:21 -0400
Subject: [PATCH 029/114] clk: mmp: audio: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-29-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925497; l=2085;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=+yJFa5zFEUdNyjiEQPxFKaRY/PiG96TT1vlVYCT3CIE=;
 b=1q+FolOnvR2myVfUyWKDb+ibNzbIQfpr6SWmkMEVEG6fb5kEbV/XpQl6dEyLJKWSPsgld0L7u
 0hemjN7BaYtD46ZSFWC89VYR0/EjoOyDSI4MO7q9iEzUnMCEXWmw+k7
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
 drivers/clk/mmp/clk-audio.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/mmp/clk-audio.c b/drivers/clk/mmp/clk-audio.c
index 88d798d510cdbe950a61a0bbb312dc546a6853fb..ed27fc796c941d8cf5b3297573db84a7830b7e4f 100644
--- a/drivers/clk/mmp/clk-audio.c
+++ b/drivers/clk/mmp/clk-audio.c
@@ -164,23 +164,23 @@ static unsigned long audio_pll_recalc_rate(struct clk_hw *hw,
 	return 0;
 }
 
-static long audio_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				 unsigned long *parent_rate)
+static int audio_pll_determine_rate(struct clk_hw *hw,
+				    struct clk_rate_request *req)
 {
 	unsigned int prediv;
 	unsigned int postdiv;
 	long rounded = 0;
 
 	for (prediv = 0; prediv < ARRAY_SIZE(predivs); prediv++) {
-		if (predivs[prediv].parent_rate != *parent_rate)
+		if (predivs[prediv].parent_rate != req->best_parent_rate)
 			continue;
 		for (postdiv = 0; postdiv < ARRAY_SIZE(postdivs); postdiv++) {
 			long freq = predivs[prediv].freq_vco;
 
 			freq /= postdivs[postdiv].divisor;
-			if (freq == rate)
-				return rate;
-			if (freq < rate)
+			if (freq == req->rate)
+				return 0;
+			if (freq < req->rate)
 				continue;
 			if (rounded && freq > rounded)
 				continue;
@@ -188,7 +188,9 @@ static long audio_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 		}
 	}
 
-	return rounded;
+	req->rate = rounded;
+
+	return 0;
 }
 
 static int audio_pll_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -228,7 +230,7 @@ static int audio_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops audio_pll_ops = {
 	.recalc_rate = audio_pll_recalc_rate,
-	.round_rate = audio_pll_round_rate,
+	.determine_rate = audio_pll_determine_rate,
 	.set_rate = audio_pll_set_rate,
 };
 

-- 
2.50.1



