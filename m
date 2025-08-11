Return-Path: <linux-mips+bounces-10066-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB18B20D9F
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 17:20:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47D31162C0C
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 15:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3951D2E3AF6;
	Mon, 11 Aug 2025 15:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WNCJxZjQ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB342E3378;
	Mon, 11 Aug 2025 15:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754925507; cv=none; b=OIevjp+F5ValgUVlmn5y9U+HbxOl+TdfjVnM3MMl3zm8XY2qVQJcz60g5n76iUUEAop/TnZoUBYhmAZAVvCNl1/HC4J0UEeZihjCZ5l6QPLN/M/yJAFSI5IpS74tD1PBIfsNM6POwzgfpPTVQlyP5KL8bLYpVzmmG0Nf/nH5VfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754925507; c=relaxed/simple;
	bh=X4e2Fknx80T84aTEhcMFhuDeqmdcTguiBfpiDntAQuU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L7bNuRVFE6+5jhCYBuWzfkiizJ2zYU1YKRKMitIoVpVi17fqefqNzcJYklnWH3Sm1AcZO3cw1Uup58Cl5qADx9RvhWAj5qQ7oENoKtlvqhON2hQTRyRe3DQCazxF6O018jjiVoq4SiX0aozE+shvafuZllT4CbXsFGutjF1wZH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WNCJxZjQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 071A5C4CEF9;
	Mon, 11 Aug 2025 15:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925506;
	bh=X4e2Fknx80T84aTEhcMFhuDeqmdcTguiBfpiDntAQuU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WNCJxZjQrbDr0iYIWO/HYF/Y144lIX80FZF9qc/Ptu0zVF2cOtcFDXcjUsu+jk781
	 AWuB5SpOB6MDtn2+z2JVZ09u7zdpBDflMRc7xEF02f9I5PSki38GRUl6GU9f03HLqx
	 jg9a7l7AV3E12MZYKC0s++d21J+3A2u7ujRwNZJ77PFAwRn+CDDnBWjqS3uz0WiH9G
	 Wyijt/UXGhqSj4T+LsOrM+KUFuII47ESBIhhyhoRqfkw6zZYAAk7vknHpC2ZGNRc2p
	 xskTCgak3VTRC+WwvUJgWJPwUJHzantR2TMnOpHO17VRV71Q1W5C5/AmUYSD+qX4VL
	 wNjI981QvezEA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8634CA0EC5;
	Mon, 11 Aug 2025 15:18:25 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:18:03 -0400
Subject: [PATCH 011/114] clk: baikal-t1: ccu-pll: convert from round_rate()
 to determine_rate()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-11-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925497; l=1959;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=Rir3EwEBie1sPj5NCtSVFsGCoQCOIrz/9MT2zbH+7Pc=;
 b=01t51IygvBOWZ2CKoHAJ0HkUooFlr6DFhgjoMi4GucTkeVEIgTfMzBHL3emzcRIFfdOQ28Avr
 Yz+s8f6VL5lAsPxL+LRfhPHs8KFDsuUC8ZrmpAf/Ww2psKAv+/7QMBL
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
 drivers/clk/baikal-t1/ccu-pll.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/baikal-t1/ccu-pll.c b/drivers/clk/baikal-t1/ccu-pll.c
index 13ef28001439e37ff4c5230a82fd4a81728861cc..357269f41cdcf5772ee56fc55f1fdb3e67d823e6 100644
--- a/drivers/clk/baikal-t1/ccu-pll.c
+++ b/drivers/clk/baikal-t1/ccu-pll.c
@@ -228,14 +228,16 @@ static void ccu_pll_calc_factors(unsigned long rate, unsigned long parent_rate,
 	}
 }
 
-static long ccu_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-			       unsigned long *parent_rate)
+static int ccu_pll_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
 {
 	unsigned long nr = 1, nf = 1, od = 1;
 
-	ccu_pll_calc_factors(rate, *parent_rate, &nr, &nf, &od);
+	ccu_pll_calc_factors(req->rate, req->best_parent_rate, &nr, &nf, &od);
 
-	return ccu_pll_calc_freq(*parent_rate, nr, nf, od);
+	req->rate = ccu_pll_calc_freq(req->best_parent_rate, nr, nf, od);
+
+	return 0;
 }
 
 /*
@@ -481,7 +483,7 @@ static const struct clk_ops ccu_pll_gate_to_set_ops = {
 	.disable = ccu_pll_disable,
 	.is_enabled = ccu_pll_is_enabled,
 	.recalc_rate = ccu_pll_recalc_rate,
-	.round_rate = ccu_pll_round_rate,
+	.determine_rate = ccu_pll_determine_rate,
 	.set_rate = ccu_pll_set_rate_norst,
 	.debug_init = ccu_pll_debug_init
 };
@@ -491,7 +493,7 @@ static const struct clk_ops ccu_pll_straight_set_ops = {
 	.disable = ccu_pll_disable,
 	.is_enabled = ccu_pll_is_enabled,
 	.recalc_rate = ccu_pll_recalc_rate,
-	.round_rate = ccu_pll_round_rate,
+	.determine_rate = ccu_pll_determine_rate,
 	.set_rate = ccu_pll_set_rate_reset,
 	.debug_init = ccu_pll_debug_init
 };

-- 
2.50.1



