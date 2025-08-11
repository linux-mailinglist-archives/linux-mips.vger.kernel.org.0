Return-Path: <linux-mips+bounces-10146-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41423B20FA4
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 17:32:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DC2818941E4
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 15:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DB332F3C10;
	Mon, 11 Aug 2025 15:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fqfY2rea"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D002EFDA2;
	Mon, 11 Aug 2025 15:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754925517; cv=none; b=DBzEXTvTwh20KSPW+yZw+ltb8niNNRS8ATDBmWWYc6Bny6SFYQ0Dv/30t5ypZ1AWAEcaMRrIsAONVc98hGmrNoiw62mvfzTnDvsT0M/1F8fbnskxqe61JY3xjDTIHNo8A8xAUK6DxR7/jBEfqvZBtLFBv7F5W/PKYC+iXtmOIew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754925517; c=relaxed/simple;
	bh=3Gx03Ubsd5XMlMsMuFXdQK6hi5zxv2zoI8SJJjgJbSc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kuDt/jWQ4UJ1DkU0kWA+N+RlCixC7E2LpoQvmDLfK3ieW2hBRtHFIxWnsWufXPOwpYrzgP3MKgeJQDbSyX3YB+QuSrwySo+uLbG7bd29ZqBlIdzwtgcxXd3Pqrh5DyTDYCVIdvxF59tkLeAgNUopZawIxIIZMrsDveg9xKZsou8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fqfY2rea; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DF6A9C4AF0D;
	Mon, 11 Aug 2025 15:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925513;
	bh=3Gx03Ubsd5XMlMsMuFXdQK6hi5zxv2zoI8SJJjgJbSc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fqfY2reaIr3raNTN9sLMwGg9AlG+1pJUTsqxpKAz0JGBosE5iPq0GoM8LLMewTysx
	 tUP1EmXe2IBufRm8Q1AqHIZEIlaISl/9hQhrH2QSSz6+eu2g9g/UDFKLjINAKpQjRj
	 2PY69D256RPQ8s6vX8+OPu65GCAz31a2NkLEdE6ASHyKZ0wC7h3Ai0cNlF3Dtzaqmh
	 mkiEJ62ax5dM32lWCN0vYRdLL9Yezx4WuV+hPmjK+E6jCJTOlI+y1ND0BZuHFN0cFa
	 DqWVcZTH31KbSJGjzlPds/F5vigTvrBWv53b9HNXxXfkaz445KrHyS9z5Wvmvsl9W8
	 mc595lwvvLJcg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C519ECA0ED1;
	Mon, 11 Aug 2025 15:18:32 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:19:07 -0400
Subject: [PATCH 075/114] clk: apple-nco: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-75-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925498; l=1712;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=6h2xxwGEdK+Wqe4OGkdQF+YuCDgQOB1uNjeimgHHxDs=;
 b=GzFETmQ8VLKjT+mYaxzbS2sPx4d1/254ZhtTZRz5jRInTKHnyUcJbXAPDOt34cI1WGcpcU0P7
 RZ0Ve+f7ARsCKVlLe63f0XM/7NRMtZOv/L4h2vtQ1TrfZGQ8yrTuEpb
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
 drivers/clk/clk-apple-nco.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/clk-apple-nco.c b/drivers/clk/clk-apple-nco.c
index 457a48d4894128fff24d50eb7c9a3cbd7d35f245..d3ced4a0f029ec0440ff42d49d31e314fdf86846 100644
--- a/drivers/clk/clk-apple-nco.c
+++ b/drivers/clk/clk-apple-nco.c
@@ -212,13 +212,15 @@ static unsigned long applnco_recalc_rate(struct clk_hw *hw,
 			((u64) div) * incbase + inc1);
 }
 
-static long applnco_round_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long *parent_rate)
+static int applnco_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
 {
-	unsigned long lo = *parent_rate / (COARSE_DIV_OFFSET + LFSR_TBLSIZE) + 1;
-	unsigned long hi = *parent_rate / COARSE_DIV_OFFSET;
+	unsigned long lo = req->best_parent_rate / (COARSE_DIV_OFFSET + LFSR_TBLSIZE) + 1;
+	unsigned long hi = req->best_parent_rate / COARSE_DIV_OFFSET;
 
-	return clamp(rate, lo, hi);
+	req->rate = clamp(req->rate, lo, hi);
+
+	return 0;
 }
 
 static int applnco_enable(struct clk_hw *hw)
@@ -246,7 +248,7 @@ static void applnco_disable(struct clk_hw *hw)
 static const struct clk_ops applnco_ops = {
 	.set_rate = applnco_set_rate,
 	.recalc_rate = applnco_recalc_rate,
-	.round_rate = applnco_round_rate,
+	.determine_rate = applnco_determine_rate,
 	.enable = applnco_enable,
 	.disable = applnco_disable,
 	.is_enabled = applnco_is_enabled,

-- 
2.50.1



