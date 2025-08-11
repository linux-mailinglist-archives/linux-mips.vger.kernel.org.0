Return-Path: <linux-mips+bounces-10158-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DE6B20FB5
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 17:33:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 899BD1A24160
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 15:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDA78302CCC;
	Mon, 11 Aug 2025 15:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="muXlH9I1"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA7D2F49FB;
	Mon, 11 Aug 2025 15:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754925519; cv=none; b=eiItNnrYcz+lDIQSxP+L0DfiseImDBljSawEtRAQ+p8hHouamfzaUiFqpcllBipf37i41GWqzc58aKnMCMAtu1W44E10c0q//k5qMk6AQPIIUa5QJadR6xdW460NHorsnW/h/rguj0YDUVluvm0ffw64NJyo68ZbLMGbaG2rl7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754925519; c=relaxed/simple;
	bh=I06g9EZ+WeE9wpMdXbgUNj6cuTI+vnV/N4MiCLjBRto=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BfYvzAwZISoiqyDyq2MtURD4WHcm325jwPAExcAItiwWXaEw3vcNnfK63xVD76N57JPov3gZ3F5a/P+X9rvV9ttvbA2SH5tKSfvWa5frz/CQ/8HUlFFsKQF6kWubAMrPX9dkqck+XtAki2lgcCMGe+dQfcD584i90W4XswlYRQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=muXlH9I1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3F222C4FE0F;
	Mon, 11 Aug 2025 15:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925516;
	bh=I06g9EZ+WeE9wpMdXbgUNj6cuTI+vnV/N4MiCLjBRto=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=muXlH9I12xudI1gel43aCQiNXldBaYO92+fpo+deer1eYA+4PlBbVjrbo2tjk3OR/
	 32k3HwoanF4BrW2/Jgdx+E/GCQifGj83wRm3+dlt0O08zO0kU3osha3vowrnGesSXa
	 KH+fcCiZKrtwotho5j7Dz+jZmbhMOsNygrJXw2xpjwBefljTfL0goVnOeJN1H+yVtw
	 atj9gVbqosDL5GEq5X0jviMCtdNJIYEKQ1jH203gIl7+COrVZKwwATn4A7P6VSiaoT
	 Ak+n9Uvtgs/kfxSukJYgfEUZIVtnjb5XPhoxXywbPNwd5vxyIVFKmfr87UeGhayu50
	 49Oc0JXirtPvg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03D5ACA0ED3;
	Mon, 11 Aug 2025 15:18:36 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:19:40 -0400
Subject: [PATCH 108/114] clk: versatile: icst: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-108-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925498; l=3737;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=s6RrIFratukpDYKqOi9KzbyMVPMeFX+Sv4XuD3QoLpU=;
 b=u+oEBWc/MchojuVxUSN0tz+lCPTO3tXOYo+ZzRrOF/c29BFEP2K2uZuXAcj8p7GUxOUfw7pDI
 LHL7LIH8TfNAi3s/C2jJXayNi/tsw7YnWMh8Xvmo0uF0O2HJvTdYhBb
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
 drivers/clk/versatile/clk-icst.c | 72 +++++++++++++++++++++++++---------------
 1 file changed, 45 insertions(+), 27 deletions(-)

diff --git a/drivers/clk/versatile/clk-icst.c b/drivers/clk/versatile/clk-icst.c
index b69c3fbdfbce66876d5b1d4faaf4050759e44561..86ca04ad9fab0334f7b051377db709338a1f7244 100644
--- a/drivers/clk/versatile/clk-icst.c
+++ b/drivers/clk/versatile/clk-icst.c
@@ -234,39 +234,51 @@ static unsigned long icst_recalc_rate(struct clk_hw *hw,
 	return icst->rate;
 }
 
-static long icst_round_rate(struct clk_hw *hw, unsigned long rate,
-			    unsigned long *prate)
+static int icst_determine_rate(struct clk_hw *hw,
+			       struct clk_rate_request *req)
 {
 	struct clk_icst *icst = to_icst(hw);
 	struct icst_vco vco;
 
 	if (icst->ctype == ICST_INTEGRATOR_AP_CM ||
 	    icst->ctype == ICST_INTEGRATOR_CP_CM_CORE) {
-		if (rate <= 12000000)
-			return 12000000;
-		if (rate >= 160000000)
-			return 160000000;
-		/* Slam to closest megahertz */
-		return DIV_ROUND_CLOSEST(rate, 1000000) * 1000000;
+		if (req->rate <= 12000000)
+			req->rate = 12000000;
+		else if (req->rate >= 160000000)
+			req->rate = 160000000;
+		else {
+			/* Slam to closest megahertz */
+			req->rate = DIV_ROUND_CLOSEST(req->rate, 1000000) * 1000000;
+		}
+
+		return 0;
 	}
 
 	if (icst->ctype == ICST_INTEGRATOR_CP_CM_MEM) {
-		if (rate <= 6000000)
-			return 6000000;
-		if (rate >= 66000000)
-			return 66000000;
-		/* Slam to closest 0.5 megahertz */
-		return DIV_ROUND_CLOSEST(rate, 500000) * 500000;
+		if (req->rate <= 6000000)
+			req->rate = 6000000;
+		else if (req->rate >= 66000000)
+			req->rate = 66000000;
+		else {
+			/* Slam to closest 0.5 megahertz */
+			req->rate = DIV_ROUND_CLOSEST(req->rate, 500000) * 500000;
+		}
+
+		return 0;
 	}
 
 	if (icst->ctype == ICST_INTEGRATOR_AP_SYS) {
 		/* Divides between 3 and 50 MHz in steps of 0.25 MHz */
-		if (rate <= 3000000)
-			return 3000000;
-		if (rate >= 50000000)
-			return 5000000;
-		/* Slam to closest 0.25 MHz */
-		return DIV_ROUND_CLOSEST(rate, 250000) * 250000;
+		if (req->rate <= 3000000)
+			req->rate = 3000000;
+		else if (req->rate >= 50000000)
+			req->rate = 5000000;
+		else {
+			/* Slam to closest 0.25 MHz */
+			req->rate = DIV_ROUND_CLOSEST(req->rate, 250000) * 250000;
+		}
+
+		return 0;
 	}
 
 	if (icst->ctype == ICST_INTEGRATOR_AP_PCI) {
@@ -274,14 +286,20 @@ static long icst_round_rate(struct clk_hw *hw, unsigned long rate,
 		 * If we're below or less than halfway from 25 to 33 MHz
 		 * select 25 MHz
 		 */
-		if (rate <= 25000000 || rate < 29000000)
-			return 25000000;
-		/* Else just return the default frequency */
-		return 33000000;
+		if (req->rate <= 25000000 || req->rate < 29000000)
+			req->rate = 25000000;
+		else {
+			/* Else just return the default frequency */
+			req->rate = 33000000;
+		}
+
+		return 0;
 	}
 
-	vco = icst_hz_to_vco(icst->params, rate);
-	return icst_hz(icst->params, vco);
+	vco = icst_hz_to_vco(icst->params, req->rate);
+	req->rate = icst_hz(icst->params, vco);
+
+	return 0;
 }
 
 static int icst_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -329,7 +347,7 @@ static int icst_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops icst_ops = {
 	.recalc_rate = icst_recalc_rate,
-	.round_rate = icst_round_rate,
+	.determine_rate = icst_determine_rate,
 	.set_rate = icst_set_rate,
 };
 

-- 
2.50.1



