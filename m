Return-Path: <linux-mips+bounces-10154-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D728B20F8C
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 17:31:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDBA11A23AA8
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 15:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 660B02F533C;
	Mon, 11 Aug 2025 15:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fs8mgTZh"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2192F1FC1;
	Mon, 11 Aug 2025 15:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754925518; cv=none; b=hTogPR44ha6GkBaN9qRzYcXuIYQNT8r5hH81dOufx8J/C1XNa8/8gOirIFnuOvYiBUb4wxcNMaZWjRk3D9cLAX4ogJXDNb5DtRl5Ukb0OS5HZZvAe8k7jGsuwi+G6kFw7pDonEy0SFobxNtfmB6mU5+2e/jcvm1AnIxjAPBOKCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754925518; c=relaxed/simple;
	bh=JbAFsuFtdb23xFCUE5PoYk+wnoLjpHf6TmfmPQNwmD0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UYn8jP8c+wnPLb0oKIV3yz/U61VcjzdYb/Sn/iaCjSIIAZbTW3ClYf5zStxX3EOGJbXGZS1K5EbhtADQtG4avymJMFb/jLo45W6lVKy/5n+/d5JuohxTgNBdkAVXtmI10tW7xJeuorw4cUdK9Itk0tjUQ4kxU/e65R+gZ5yap6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fs8mgTZh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 13539C4DE0A;
	Mon, 11 Aug 2025 15:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925514;
	bh=JbAFsuFtdb23xFCUE5PoYk+wnoLjpHf6TmfmPQNwmD0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Fs8mgTZh2HrqAhKx6QpFlTRi25VDinSofra7I3YjTQoiVCJWCymdC6SiirxJxkT0X
	 CbjyNo+Q11ZT8vHvqpeRPw0LjDoPEGC+9dZ+Ry1OksMxS+dsYb+TLlfW53e4gB3l0D
	 +CFS54d1FVVDiA/278Jweaiad2G8WXaetceqYer/TTdhShrWj9S6JQe5HFAt24TJUM
	 4+TgmUJor5tQ98+jt6HDG0AjEttpQcl03w5LYqPOGxxtxBZrHOnAA83svu2GjMxngW
	 mWOPJPknwzG8j1WW2AcxSt1X4x9c7aCdC/gZaOzl74CuLCoi4byImMN+db7jLhzVXV
	 B+WuVebEknrRQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2DB3CA0EC4;
	Mon, 11 Aug 2025 15:18:33 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:19:19 -0400
Subject: [PATCH 087/114] clk: mvebu: corediv: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-87-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925498; l=2796;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=NS9zgUZ/lkWw958Faw/x74CjsEPIvLlB4+FSKZAsyx8=;
 b=nZ53u2dYSOTsFRAIdh3yMPgJZh9VCXPHelYAsSZINROYBNVpBhjrqlzP90BgrmJNP+n6QGLLT
 V4L2PUdSQwCBZJiiUco50Koj59cdo0HIDYsE2R7HozKZBoeaF+fwyI1
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
 drivers/clk/mvebu/clk-corediv.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/mvebu/clk-corediv.c b/drivers/clk/mvebu/clk-corediv.c
index 818b175391fadb9dbfd2ea7950598741b008d0ba..628032341cbb879628f1e0219689801d26d10f7f 100644
--- a/drivers/clk/mvebu/clk-corediv.c
+++ b/drivers/clk/mvebu/clk-corediv.c
@@ -135,19 +135,21 @@ static unsigned long clk_corediv_recalc_rate(struct clk_hw *hwclk,
 	return parent_rate / div;
 }
 
-static long clk_corediv_round_rate(struct clk_hw *hwclk, unsigned long rate,
-			       unsigned long *parent_rate)
+static int clk_corediv_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	/* Valid ratio are 1:4, 1:5, 1:6 and 1:8 */
 	u32 div;
 
-	div = *parent_rate / rate;
+	div = req->best_parent_rate / req->rate;
 	if (div < 4)
 		div = 4;
 	else if (div > 6)
 		div = 8;
 
-	return *parent_rate / div;
+	req->rate = req->best_parent_rate / div;
+
+	return 0;
 }
 
 static int clk_corediv_set_rate(struct clk_hw *hwclk, unsigned long rate,
@@ -199,7 +201,7 @@ static const struct clk_corediv_soc_desc armada370_corediv_soc = {
 		.disable = clk_corediv_disable,
 		.is_enabled = clk_corediv_is_enabled,
 		.recalc_rate = clk_corediv_recalc_rate,
-		.round_rate = clk_corediv_round_rate,
+		.determine_rate = clk_corediv_determine_rate,
 		.set_rate = clk_corediv_set_rate,
 	},
 	.ratio_reload = BIT(8),
@@ -215,7 +217,7 @@ static const struct clk_corediv_soc_desc armada380_corediv_soc = {
 		.disable = clk_corediv_disable,
 		.is_enabled = clk_corediv_is_enabled,
 		.recalc_rate = clk_corediv_recalc_rate,
-		.round_rate = clk_corediv_round_rate,
+		.determine_rate = clk_corediv_determine_rate,
 		.set_rate = clk_corediv_set_rate,
 	},
 	.ratio_reload = BIT(8),
@@ -228,7 +230,7 @@ static const struct clk_corediv_soc_desc armada375_corediv_soc = {
 	.ndescs = ARRAY_SIZE(mvebu_corediv_desc),
 	.ops = {
 		.recalc_rate = clk_corediv_recalc_rate,
-		.round_rate = clk_corediv_round_rate,
+		.determine_rate = clk_corediv_determine_rate,
 		.set_rate = clk_corediv_set_rate,
 	},
 	.ratio_reload = BIT(8),
@@ -240,7 +242,7 @@ static const struct clk_corediv_soc_desc mv98dx3236_corediv_soc = {
 	.ndescs = ARRAY_SIZE(mv98dx3236_corediv_desc),
 	.ops = {
 		.recalc_rate = clk_corediv_recalc_rate,
-		.round_rate = clk_corediv_round_rate,
+		.determine_rate = clk_corediv_determine_rate,
 		.set_rate = clk_corediv_set_rate,
 	},
 	.ratio_reload = BIT(10),

-- 
2.50.1



