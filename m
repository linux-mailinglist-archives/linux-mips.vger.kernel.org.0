Return-Path: <linux-mips+bounces-10129-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E73B20F0F
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 17:29:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DBB6624D82
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 15:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97C6B2ED85D;
	Mon, 11 Aug 2025 15:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dSDSxRPU"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5328E2E610B;
	Mon, 11 Aug 2025 15:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754925516; cv=none; b=sG9O+NDfa5WzrCq8I1yRSsBmcrQzK1yXxxyIuwIhMMYVMgRHatUKmdbuihNA0GjixlAQ0o6/MRpIq+65QMtKkyv11pSAL5nP6w2Qz0emj4WbdfavBVnzaOtP3WpFe6Q+D4Uhhl1Qa+uFP833yCe+gqog5mSkqX3elhQwm8GuKCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754925516; c=relaxed/simple;
	bh=2MQP3in/0DNTL1tFUNdoKk8zcgy1cktnTa17pA2Cp5Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oZt/V6m5gbvEM6uo66/m0emYRLX7V/evGGWS1tsjT5vwaDYF1z1zDoThSpk8MJ5Nu6F1OlAgHq06SaOxdDIYiXEs0k5TBf2piBV6YRGEVcAINl2kGVH/FQPHsPZ7iI+89OndHZTFrt1UKgZX0KOgKUsqLFSdd8/fEJsR4f/6TJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dSDSxRPU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C8301C4FF69;
	Mon, 11 Aug 2025 15:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925512;
	bh=2MQP3in/0DNTL1tFUNdoKk8zcgy1cktnTa17pA2Cp5Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dSDSxRPUQIAPgz0kTtWerHwYTdLYx+GJW0d1n75xbXQ1d9v2VeIxgWHOfj3ZObpMA
	 QtVIlZR3nZkn5RmZZLOi6NxtHkz2xOgYTfXHKIWQRpXNWcXISyYn4aFl4YXOzwQp91
	 nN77D3K2ahZmgh5ztNYyX8n+Fnlfg/UJqOUu6FonVvyHXP6EHAjJ8lZvqYi2TL58Tg
	 RONZrVrJXc66Ku7qwFmBU/D515zpS6T+yexGdx73f9fCb+nz/js1bbi2c4o9e8dxbC
	 iMxQlNYhYkPnLTtYIKJ6uA5K//no6YIZNaJLzwe5G7TWjMrQKngLyiMSmd73xgI498
	 PDUfGumoOryDQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABD62C87FD2;
	Mon, 11 Aug 2025 15:18:32 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:19:06 -0400
Subject: [PATCH 074/114] clk: actions: owl-pll: convert from round_rate()
 to determine_rate()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-74-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925498; l=2031;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=sPT71oy/nWfZWaCZ7el7QuoJ5ywx213EbLL8JhnT798=;
 b=IDpLSapmJO7PXGkC7plnr+o3NMSOGWmV/eJXMUiAXrlNF8HuVybNrfzkKp237krZ1OQLKwfma
 Reujd9fb10CBJ2DdQyK7WJxk2x6RExm5QnmSYYCR1C8ckWx/0GcYV4t
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
 drivers/clk/actions/owl-pll.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/actions/owl-pll.c b/drivers/clk/actions/owl-pll.c
index 155f313986b40f15b7c426f4d49b1ed560acf9c3..869690b79cc16f05d63383b965ae5fc96deee79f 100644
--- a/drivers/clk/actions/owl-pll.c
+++ b/drivers/clk/actions/owl-pll.c
@@ -56,8 +56,8 @@ static const struct clk_pll_table *_get_pll_table(
 	return table;
 }
 
-static long owl_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-		unsigned long *parent_rate)
+static int owl_pll_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
 {
 	struct owl_pll *pll = hw_to_owl_pll(hw);
 	struct owl_pll_hw *pll_hw = &pll->pll_hw;
@@ -65,17 +65,24 @@ static long owl_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 	u32 mul;
 
 	if (pll_hw->table) {
-		clkt = _get_pll_table(pll_hw->table, rate);
-		return clkt->rate;
+		clkt = _get_pll_table(pll_hw->table, req->rate);
+		req->rate = clkt->rate;
+
+		return 0;
 	}
 
 	/* fixed frequency */
-	if (pll_hw->width == 0)
-		return pll_hw->bfreq;
+	if (pll_hw->width == 0) {
+		req->rate = pll_hw->bfreq;
 
-	mul = owl_pll_calculate_mul(pll_hw, rate);
+		return 0;
+	}
+
+	mul = owl_pll_calculate_mul(pll_hw, req->rate);
 
-	return pll_hw->bfreq * mul;
+	req->rate = pll_hw->bfreq * mul;
+
+	return 0;
 }
 
 static unsigned long owl_pll_recalc_rate(struct clk_hw *hw,
@@ -188,7 +195,7 @@ const struct clk_ops owl_pll_ops = {
 	.enable = owl_pll_enable,
 	.disable = owl_pll_disable,
 	.is_enabled = owl_pll_is_enabled,
-	.round_rate = owl_pll_round_rate,
+	.determine_rate = owl_pll_determine_rate,
 	.recalc_rate = owl_pll_recalc_rate,
 	.set_rate = owl_pll_set_rate,
 };

-- 
2.50.1



