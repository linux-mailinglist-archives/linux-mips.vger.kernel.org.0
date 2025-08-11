Return-Path: <linux-mips+bounces-10166-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A069B20F92
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 17:32:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 119652A8024
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 15:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7241307AF7;
	Mon, 11 Aug 2025 15:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="noLQ+tAl"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57712F49ED;
	Mon, 11 Aug 2025 15:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754925518; cv=none; b=LOAsXUKnU4GAX9Iyo1VEaBoVrW/a/v97fujYX3+0X8EFHPJjfO1J8QQ+X+snpB8MIBkUdlET2MaVODNxgr14oS3f0KWdbekFfmrdnp9eR5LDTkIXsdllAWKbiOjtZQyb/ogwvlPQ0yQX7WVv9l47Occrol+uPTa71cWwbOPX4pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754925518; c=relaxed/simple;
	bh=95nJNVyHARzLkGa9z0lh7B2BLhwNxZAqYCnshJkN1zA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XmmKo70NJpWno0zrzeAp+F8AMJsnCNo1/OAO5Ib5eEhcPk9PE9YEOosEg+aXrIkiw9vO2AM9db4T/cFXFFzxNtYWIs1T5sz7gvS8q2E+hihY/jg5V00MEI6SvuOzckQiDEDfgNf4Xu3MuJdon/OtBqV0+sTqe/u1heHwf5Z5ULs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=noLQ+tAl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E5EB4C4FF54;
	Mon, 11 Aug 2025 15:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925516;
	bh=95nJNVyHARzLkGa9z0lh7B2BLhwNxZAqYCnshJkN1zA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=noLQ+tAllsdJsRyJZi892ugQQOb+/v2nRGmSsAtKhAkmiNMuCczG28eAP6hfKGK0B
	 2v061h5JPTTKlgs9YUfSVpLesXlYJ7egzMrj7QHXxh2/ZquBrRm82taDO54cJzd90y
	 NIcV6GV3PT7Uao7bjL4O1V5AtiTb6N9hQ+NG8r7O0a0GobijwhlfA2/9cjelXAWr+G
	 +G+hXmkdSclWxzaJNub7GxfonHW/4Bgm95D14zf1LeIyVOgUeW/xo2BD2y9/h6Q1x6
	 f0xR9+Ymk8Y22Vj50yxFjg8tI+dS/TwH/icIARGFri/E392L1zJJC7xWkq0+VIaVCj
	 H2sOrkNOh8x5Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B28B2CA0ED1;
	Mon, 11 Aug 2025 15:18:35 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:19:37 -0400
Subject: [PATCH 105/114] clk: ux500: prcmu: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-105-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925498; l=2161;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=Iri56Jk5inQfMBQxAgO8VkEUwGzLeEItJq1ve9UYodA=;
 b=DsD44CqhHZt7aqK04qeiU6Ui+tTj7Lyld//Cp+zJ9xJgJTaAKY6yIDLLPqTRsL+cXpcocyy+k
 Hdl2EQH1B1kDq9SF4a2SNeCj0tmgb2D4I3LgqSWcj/91T4w7R8vzOOG
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
 drivers/clk/ux500/clk-prcmu.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/ux500/clk-prcmu.c b/drivers/clk/ux500/clk-prcmu.c
index 5cbf24c94606081b0ec18c8aaa201ef89b54edf0..f775e18acd468d91cc2d6cf7a289bb722d614141 100644
--- a/drivers/clk/ux500/clk-prcmu.c
+++ b/drivers/clk/ux500/clk-prcmu.c
@@ -53,11 +53,13 @@ static unsigned long clk_prcmu_recalc_rate(struct clk_hw *hw,
 	return prcmu_clock_rate(clk->cg_sel);
 }
 
-static long clk_prcmu_round_rate(struct clk_hw *hw, unsigned long rate,
-				 unsigned long *parent_rate)
+static int clk_prcmu_determine_rate(struct clk_hw *hw,
+				    struct clk_rate_request *req)
 {
 	struct clk_prcmu *clk = to_clk_prcmu(hw);
-	return prcmu_round_clock_rate(clk->cg_sel, rate);
+	req->rate = prcmu_round_clock_rate(clk->cg_sel, req->rate);
+
+	return 0;
 }
 
 static int clk_prcmu_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -157,7 +159,7 @@ static const struct clk_ops clk_prcmu_scalable_ops = {
 	.prepare = clk_prcmu_prepare,
 	.unprepare = clk_prcmu_unprepare,
 	.recalc_rate = clk_prcmu_recalc_rate,
-	.round_rate = clk_prcmu_round_rate,
+	.determine_rate = clk_prcmu_determine_rate,
 	.set_rate = clk_prcmu_set_rate,
 };
 
@@ -169,7 +171,7 @@ static const struct clk_ops clk_prcmu_gate_ops = {
 
 static const struct clk_ops clk_prcmu_scalable_rate_ops = {
 	.recalc_rate = clk_prcmu_recalc_rate,
-	.round_rate = clk_prcmu_round_rate,
+	.determine_rate = clk_prcmu_determine_rate,
 	.set_rate = clk_prcmu_set_rate,
 };
 
@@ -187,7 +189,7 @@ static const struct clk_ops clk_prcmu_opp_volt_scalable_ops = {
 	.prepare = clk_prcmu_opp_volt_prepare,
 	.unprepare = clk_prcmu_opp_volt_unprepare,
 	.recalc_rate = clk_prcmu_recalc_rate,
-	.round_rate = clk_prcmu_round_rate,
+	.determine_rate = clk_prcmu_determine_rate,
 	.set_rate = clk_prcmu_set_rate,
 };
 

-- 
2.50.1



