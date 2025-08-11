Return-Path: <linux-mips+bounces-10162-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5CEB20F86
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 17:31:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 189D82A7998
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 15:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F8343074B7;
	Mon, 11 Aug 2025 15:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OqH0WCHT"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0172F1FEC;
	Mon, 11 Aug 2025 15:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754925518; cv=none; b=KO6e/RVgkZLKopJyugGZ+txqXkv+f4eZ18uoSph7wWGwf6P9FM1sIl+mbfVwVOm/8VmY6jxhjAKcKSd/DJ6s/dMLk/ocS9xaP5DBVfwtKDw07x+IEUHe9Z4VxvFuHHOJie7d632rWViqOaqFSxqMwCQ7jFkdQXtIqQuyj9iOW8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754925518; c=relaxed/simple;
	bh=XdUIZUvwnyftJpT5ch/HgHFIoigfGzrV4iCd9VKZqTQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UKz2mQcCV7809b8TYNG4iE6+n8LqBYpeIf4XZHJcivAFz6KSg9Tplnu8gK7eL8JZ2dYL8hGh7XiV+/xO1yva0zWzGi95/mPlugWOB8uMYzcuotb+g8dLkcIvHsqQDj4c+LV+l7liovusnxDHTSNRRAp9gMWc5nPo039H7hKJWxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OqH0WCHT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 82214C4FF01;
	Mon, 11 Aug 2025 15:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925514;
	bh=XdUIZUvwnyftJpT5ch/HgHFIoigfGzrV4iCd9VKZqTQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OqH0WCHTp4S5ohbAroFUBj/8jh3hyIoKiyfOBkmkscazBRbN+8LiVsxrKpc5PpPWU
	 r7q8Fla5fhQZzA2KwmfF7025SfmRMBgXBGJMwFLF2RYbEga/pd122B5v9+i7AAQRze
	 ClzOlmAJrEUDpsGKBvDqkP7QK5CEjTJWSoqNb2CYoPlHhaSuk4a3jslphsnu9tE+bk
	 ZH46LvPXGiEwpDNkY4bJRj5klEYois3CMYXK/BeJyodVlmCWMTxZeCPpelmK1Wgzqe
	 x214DUSSI1C9FLv6LqAIM7joCpxgSzmpKHf6itww8sEdcwZtq5D9Wx8ku87YWBGQ5w
	 +RWWVLBDx+ucA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B80DCA0ED3;
	Mon, 11 Aug 2025 15:18:34 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:19:23 -0400
Subject: [PATCH 091/114] clk: qcom: regmap-divider: convert from
 round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-91-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925498; l=2812;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=EQCcwOFdygM4Y4d5xyMVYQW7q18iqFwUE0YbNXBmzY0=;
 b=XHOYVo78vIlv+7J6x7VNcONXwhptYWQD6H+jm0MjN4IKO4htNVGtDAXSqsdhOHa7ktB0ujiSg
 D4k1hBYtxSKAJOoyoDXDyi2WEHu7ioerLgWEHkgbjX9En2IqQGPvP1W
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

Note that prior to running the Coccinelle, div_round_ro_rate() was
renamed to div_ro_round_rate().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/qcom/clk-regmap-divider.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/qcom/clk-regmap-divider.c b/drivers/clk/qcom/clk-regmap-divider.c
index 63c9fca0d65d7436db4fe45c17d347baea922900..4f5395f0ab6d0ed8cebbb32cc231063932ba85a1 100644
--- a/drivers/clk/qcom/clk-regmap-divider.c
+++ b/drivers/clk/qcom/clk-regmap-divider.c
@@ -15,8 +15,8 @@ static inline struct clk_regmap_div *to_clk_regmap_div(struct clk_hw *hw)
 	return container_of(to_clk_regmap(hw), struct clk_regmap_div, clkr);
 }
 
-static long div_round_ro_rate(struct clk_hw *hw, unsigned long rate,
-			      unsigned long *prate)
+static int div_ro_determine_rate(struct clk_hw *hw,
+				 struct clk_rate_request *req)
 {
 	struct clk_regmap_div *divider = to_clk_regmap_div(hw);
 	struct clk_regmap *clkr = &divider->clkr;
@@ -26,17 +26,24 @@ static long div_round_ro_rate(struct clk_hw *hw, unsigned long rate,
 	val >>= divider->shift;
 	val &= BIT(divider->width) - 1;
 
-	return divider_ro_round_rate(hw, rate, prate, NULL, divider->width,
-				     CLK_DIVIDER_ROUND_CLOSEST, val);
+	req->rate = divider_ro_round_rate(hw, req->rate,
+					  &req->best_parent_rate, NULL,
+					  divider->width,
+					  CLK_DIVIDER_ROUND_CLOSEST, val);
+
+	return 0;
 }
 
-static long div_round_rate(struct clk_hw *hw, unsigned long rate,
-			   unsigned long *prate)
+static int div_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
 {
 	struct clk_regmap_div *divider = to_clk_regmap_div(hw);
 
-	return divider_round_rate(hw, rate, prate, NULL, divider->width,
-				  CLK_DIVIDER_ROUND_CLOSEST);
+	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
+				       NULL,
+				       divider->width,
+				       CLK_DIVIDER_ROUND_CLOSEST);
+
+	return 0;
 }
 
 static int div_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -70,14 +77,14 @@ static unsigned long div_recalc_rate(struct clk_hw *hw,
 }
 
 const struct clk_ops clk_regmap_div_ops = {
-	.round_rate = div_round_rate,
+	.determine_rate = div_determine_rate,
 	.set_rate = div_set_rate,
 	.recalc_rate = div_recalc_rate,
 };
 EXPORT_SYMBOL_GPL(clk_regmap_div_ops);
 
 const struct clk_ops clk_regmap_div_ro_ops = {
-	.round_rate = div_round_ro_rate,
+	.determine_rate = div_ro_determine_rate,
 	.recalc_rate = div_recalc_rate,
 };
 EXPORT_SYMBOL_GPL(clk_regmap_div_ro_ops);

-- 
2.50.1



