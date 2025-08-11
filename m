Return-Path: <linux-mips+bounces-10069-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D521B20DCD
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 17:21:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DEBDF68037D
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 15:20:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AAD82E4268;
	Mon, 11 Aug 2025 15:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aAcNzR3b"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB322E3AE1;
	Mon, 11 Aug 2025 15:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754925507; cv=none; b=HMqQ4wtx7yNokDe5gYJLCDKZbS6D9SVxoSTGC/DQqhoRbdBOn2Nj/xQRxMtVBUu8aLRqu3cxS2I8gwwjQESDSNflQb/LtlSqVnEOGk1BoSiINqcxbZViqXAiIgcHftmZ+BZDU2t2UlCAbBMW1SK9FAgZuRkopfDhHWyKLc46gG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754925507; c=relaxed/simple;
	bh=Axu5a5KswPV1EgvIUu5Vc9gPsQIxcpG9Q9QDX+9LwFs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C0+/ioqyyaPnUYsH49K6T8hQ5S58+4S1PdjzhBfCEdr3wS4HBRBOwz4RKM9pi/IUR36hzizM9wkAqHJ5rqQnhpw9j4yMzhEyZ7Js4da1ymn7gQ6fJpzbv/y4BlUHn6EC8WXqPV/kqhX3dc6cIy/eOQi63Yr7o7WMKOfaCI9GSy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aAcNzR3b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6A50CC4CEFF;
	Mon, 11 Aug 2025 15:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925506;
	bh=Axu5a5KswPV1EgvIUu5Vc9gPsQIxcpG9Q9QDX+9LwFs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=aAcNzR3b0y3PPHNgcj5xW4ERfhJYna8pBMksl6IHznxDCDHnejwHs52G39fQS381V
	 TAswgzvkOKJ+Qs7iivQWB6rMAZnF8kWYoHaVENBpuGyJBNDZh5Xys5t4WWHM3P9iEb
	 w8EguOMaAwL678Ij3QVh6gFSibucwXjr0QhC0ICuZqrrCUXbYsQgZvwtWdF4+IxxUH
	 xXBSavLL9fJhTON02UZavdRCaewfiGUk9a2vlea3UXoYAj80Mf+948CbT9+7r5XDfW
	 I2Ttl5jDzoiaus/wa5dpRl4mkIZuQiJdQqz0YKQUx4IpMOss2op/HCddyn5cpl62ff
	 mL92aBZpxa4NQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54CDFC87FDA;
	Mon, 11 Aug 2025 15:18:26 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:18:06 -0400
Subject: [PATCH 014/114] clk: ep93xx: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-14-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925497; l=1914;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=3JP7dMYtLoQxtBGjPwMKi6Ir7YT5pdLPUf8GaJMmFa0=;
 b=RRCll3J7L/rjd6JsMM5HD2UsZX1rJmfKm0oTSK0t+2WmkbpOkSN1u9mQMZrVpW2oJoAudterD
 vhIUygylIuMDhqOiTY3Z/K2otVUyyEa9LQb6/eEcV55ZqFLC7ZCetu5
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
 drivers/clk/clk-ep93xx.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/clk-ep93xx.c b/drivers/clk/clk-ep93xx.c
index 4bd8d6ecf6a2bde26287e4e949b062a5660139e6..b081ef920e250dd99134af6845c443ee11266da8 100644
--- a/drivers/clk/clk-ep93xx.c
+++ b/drivers/clk/clk-ep93xx.c
@@ -389,23 +389,25 @@ static unsigned long ep93xx_div_recalc_rate(struct clk_hw *hw,
 	return DIV_ROUND_CLOSEST(parent_rate, clk->div[index]);
 }
 
-static long ep93xx_div_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *parent_rate)
+static int ep93xx_div_determine_rate(struct clk_hw *hw,
+				     struct clk_rate_request *req)
 {
 	struct ep93xx_clk *clk = ep93xx_clk_from(hw);
 	unsigned long best = 0, now;
 	unsigned int i;
 
 	for (i = 0; i < clk->num_div; i++) {
-		if ((rate * clk->div[i]) == *parent_rate)
-			return rate;
+		if (req->rate * clk->div[i] == req->best_parent_rate)
+			return 0;
 
-		now = DIV_ROUND_CLOSEST(*parent_rate, clk->div[i]);
-		if (!best || is_best(rate, now, best))
+		now = DIV_ROUND_CLOSEST(req->best_parent_rate, clk->div[i]);
+		if (!best || is_best(req->rate, now, best))
 			best = now;
 	}
 
-	return best;
+	req->rate = best;
+
+	return 0;
 }
 
 static int ep93xx_div_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -437,7 +439,7 @@ static const struct clk_ops ep93xx_div_ops = {
 	.disable = ep93xx_clk_disable,
 	.is_enabled = ep93xx_clk_is_enabled,
 	.recalc_rate = ep93xx_div_recalc_rate,
-	.round_rate = ep93xx_div_round_rate,
+	.determine_rate = ep93xx_div_determine_rate,
 	.set_rate = ep93xx_div_set_rate,
 };
 

-- 
2.50.1



