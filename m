Return-Path: <linux-mips+bounces-10065-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 869F9B20DB8
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 17:20:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4353A625627
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 15:20:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CDC02E3AE2;
	Mon, 11 Aug 2025 15:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uklCishU"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13442E3371;
	Mon, 11 Aug 2025 15:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754925507; cv=none; b=ChGjIo3GXceu3/fNRK3tQv5u6hUq5wLkxIlQ+aWbBI5H2QdO+VW2GPomZ3Isg2M7hpkqDmelcTrwRBqTftt8a/NQqbXsPQG0eMBsX5qyWo8qKl5UazBqMxxiiQy+jSNwqbasSnya71SSeYFgzZQN3aizdGDiNy21sYk9k3m5rFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754925507; c=relaxed/simple;
	bh=Qlrw2uRVlp0vGDYJY7MoY1jKx9FRqPHx5uCFYZ7JsmE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KLXirZmPYcnoc+d5GPXozsPlVovoY8BMgJSMtssUhi7cg5fvFEjZZZA1TYoIybaYpQ6fvbd5ztwsvtHF1lpckwWZ/XZ8KvVGSLXOJW5xNgz5+5leztImiGpCUBscMYU0lXlYO6e9gipQZeCHXH6XpvuPOqcRgjzjtbhAzuTVtJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uklCishU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E2111C4DDE8;
	Mon, 11 Aug 2025 15:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925506;
	bh=Qlrw2uRVlp0vGDYJY7MoY1jKx9FRqPHx5uCFYZ7JsmE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=uklCishUoIxOpo8h7B22wRQ5RAuC60Yz+J71/cSJyV1yE30qsM8NA0bpTAnOXO4Ae
	 awz9KLYage9GvEh+4ZHjGvaWaa27lbqB7OupVRgwPStDKCnkM2H1B5O+TKhGQRE8eQ
	 Xyp3mvYOg6CFEvgNHo/88l1FE+n50nCVo2xsKt2whkHzAgscZxAu4bWLVCLASjTPpU
	 ju255uuSHrnpjCoef7r0CkMOmBUEGWv55gbT1qVkCaXTGhBFlZ/wbkuPL0zIaVMhKy
	 ZSxycydyjU1S3s23xvdxTOZTmBjh2e/ScFLwVUMlV0w+D5+v4xEfAwAlu28nsdhKk/
	 phB1H3i4S/sgw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF3CBC87FDA;
	Mon, 11 Aug 2025 15:18:25 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:18:02 -0400
Subject: [PATCH 010/114] clk: baikal-t1: ccu-div: convert from round_rate()
 to determine_rate()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-10-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925497; l=3389;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=nym5XjLemEq228LpveT5/ErTWDImRURr5JDDhbNCaL4=;
 b=0DjaR6QeYFxaDSfXoLB4Aix+g0nTT6SM4/R0Dv/DY/yjG/canwRVCudYkR3wHhI7WlX+hA0kw
 4DoiM292XomCrmp7d4tu+5my/w0Aqv5x0RdRRKBTga+DlCAK2UZP2pT
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
 drivers/clk/baikal-t1/ccu-div.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/baikal-t1/ccu-div.c b/drivers/clk/baikal-t1/ccu-div.c
index 8d5fc7158f33f9c5f8a04241cb62f1ec6ced6e5d..849d1f55765f503c23954754b994d1c28fe3f525 100644
--- a/drivers/clk/baikal-t1/ccu-div.c
+++ b/drivers/clk/baikal-t1/ccu-div.c
@@ -228,15 +228,18 @@ static inline unsigned long ccu_div_var_calc_divider(unsigned long rate,
 		       CCU_DIV_CLKDIV_MAX(mask));
 }
 
-static long ccu_div_var_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *parent_rate)
+static int ccu_div_var_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	struct ccu_div *div = to_ccu_div(hw);
 	unsigned long divider;
 
-	divider = ccu_div_var_calc_divider(rate, *parent_rate, div->mask);
+	divider = ccu_div_var_calc_divider(req->rate, req->best_parent_rate,
+					   div->mask);
 
-	return ccu_div_calc_freq(*parent_rate, divider);
+	req->rate = ccu_div_calc_freq(req->best_parent_rate, divider);
+
+	return 0;
 }
 
 /*
@@ -308,12 +311,14 @@ static unsigned long ccu_div_fixed_recalc_rate(struct clk_hw *hw,
 	return ccu_div_calc_freq(parent_rate, div->divider);
 }
 
-static long ccu_div_fixed_round_rate(struct clk_hw *hw, unsigned long rate,
-				     unsigned long *parent_rate)
+static int ccu_div_fixed_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
 {
 	struct ccu_div *div = to_ccu_div(hw);
 
-	return ccu_div_calc_freq(*parent_rate, div->divider);
+	req->rate = ccu_div_calc_freq(req->best_parent_rate, div->divider);
+
+	return 0;
 }
 
 static int ccu_div_fixed_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -534,14 +539,14 @@ static const struct clk_ops ccu_div_var_gate_to_set_ops = {
 	.disable = ccu_div_gate_disable,
 	.is_enabled = ccu_div_gate_is_enabled,
 	.recalc_rate = ccu_div_var_recalc_rate,
-	.round_rate = ccu_div_var_round_rate,
+	.determine_rate = ccu_div_var_determine_rate,
 	.set_rate = ccu_div_var_set_rate_fast,
 	.debug_init = ccu_div_var_debug_init
 };
 
 static const struct clk_ops ccu_div_var_nogate_ops = {
 	.recalc_rate = ccu_div_var_recalc_rate,
-	.round_rate = ccu_div_var_round_rate,
+	.determine_rate = ccu_div_var_determine_rate,
 	.set_rate = ccu_div_var_set_rate_slow,
 	.debug_init = ccu_div_var_debug_init
 };
@@ -551,7 +556,7 @@ static const struct clk_ops ccu_div_gate_ops = {
 	.disable = ccu_div_gate_disable,
 	.is_enabled = ccu_div_gate_is_enabled,
 	.recalc_rate = ccu_div_fixed_recalc_rate,
-	.round_rate = ccu_div_fixed_round_rate,
+	.determine_rate = ccu_div_fixed_determine_rate,
 	.set_rate = ccu_div_fixed_set_rate,
 	.debug_init = ccu_div_gate_debug_init
 };
@@ -565,7 +570,7 @@ static const struct clk_ops ccu_div_buf_ops = {
 
 static const struct clk_ops ccu_div_fixed_ops = {
 	.recalc_rate = ccu_div_fixed_recalc_rate,
-	.round_rate = ccu_div_fixed_round_rate,
+	.determine_rate = ccu_div_fixed_determine_rate,
 	.set_rate = ccu_div_fixed_set_rate,
 	.debug_init = ccu_div_fixed_debug_init
 };

-- 
2.50.1



