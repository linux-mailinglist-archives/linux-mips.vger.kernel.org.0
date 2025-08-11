Return-Path: <linux-mips+bounces-10088-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE868B20E3E
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 17:23:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B72D1A21A86
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 15:22:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D2792E763C;
	Mon, 11 Aug 2025 15:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BNPtBhr9"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801BC2E5B2B;
	Mon, 11 Aug 2025 15:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754925508; cv=none; b=QHk4Ye0W5lqxY3LGfPs2hLpmGuS7t0d9EZTRBXUOhQ5GwuYXUV+fQpXn0diAd9oPhQC7fsAEloSiOAdKMh1jbORWf/gGlt15J+nsl5Jx+jzTEtmYbvWNi0nmXp+CRXdQUL+MNeOVc6lMXV7IO6/XkBJSNjvE7fqCy28gRu9IeHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754925508; c=relaxed/simple;
	bh=JXFxzPmNEcmAc9CaGg3a44Xz6AHd9Frd9XNjsAxp210=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CJAD7gbCzDpp2jI8gFIne11LtWMzrITuJjC1+nskI6I/ZrniYX0EvyC1UXTurEGrgys/UYmSoW/hcTkI/Kq6keLeurEuN4TceeWRMLwWQ6auVbG3IpDBGbHVVH/yuUl+a/n1KS5Kx/dVEndcfoouir0+bz0QF3cymhqKML3D14M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BNPtBhr9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 551A9C4CEF8;
	Mon, 11 Aug 2025 15:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925508;
	bh=JXFxzPmNEcmAc9CaGg3a44Xz6AHd9Frd9XNjsAxp210=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BNPtBhr9qBZIApf/cKfIg9eiluUfd22RE6MmEGdcKiUGgm8O/qzlFns6ao1Zuffxq
	 EhqLNA972TApavC2JiNerCkHqQE2FEsBFCq6KGCz3wDKQoGtqH4mjNvL5Y9+U8WjO5
	 QEDZ+UbynpCtv2bKrplNU5shAj1xabtuDQxQK48AR+ylyMEVTMAANc/MdIjUSPtFHv
	 jqL7nJDkvX5I8e2CUM1cBC1cnavzf/s9Juy3fe3NqLKORMdNdFXMUAcjxF9m8IpPWx
	 n05Tq79n8CaraY5LqzyZ3dk0gtVQlYKkD94eqXja9MUbHg7d4JIqN8+KG50ZqIALi4
	 D5FdR/jQHCd7g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47D74C88CB9;
	Mon, 11 Aug 2025 15:18:28 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:18:22 -0400
Subject: [PATCH 030/114] clk: mmp: frac: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-30-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925497; l=2117;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=nbS+lfseW4POf+7BKNGCbFuuk4z3vqh5brFU07BCWjY=;
 b=TxNZDlVqAB/rK83cdrpvc0jn++UNNk6hgPv5sXh/3OQ/S/DFzXtYhHVM02DhfEqyVBbsnp9jF
 eO6x4YmPLY1AOuCF7wFj/UUbs3nsp+tbfFitys89bDtBMo8m2AYgHiW
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
 drivers/clk/mmp/clk-frac.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/mmp/clk-frac.c b/drivers/clk/mmp/clk-frac.c
index 6556f6ada2e830178b9525462f684bad683db454..0b1bb01346f0d7b450e85b805f6c84da6f803f56 100644
--- a/drivers/clk/mmp/clk-frac.c
+++ b/drivers/clk/mmp/clk-frac.c
@@ -21,8 +21,8 @@
 
 #define to_clk_factor(hw) container_of(hw, struct mmp_clk_factor, hw)
 
-static long clk_factor_round_rate(struct clk_hw *hw, unsigned long drate,
-		unsigned long *prate)
+static int clk_factor_determine_rate(struct clk_hw *hw,
+				     struct clk_rate_request *req)
 {
 	struct mmp_clk_factor *factor = to_clk_factor(hw);
 	u64 rate = 0, prev_rate;
@@ -33,19 +33,20 @@ static long clk_factor_round_rate(struct clk_hw *hw, unsigned long drate,
 		d = &factor->ftbl[i];
 
 		prev_rate = rate;
-		rate = (u64)(*prate) * d->denominator;
+		rate = (u64)(req->best_parent_rate) * d->denominator;
 		do_div(rate, d->numerator * factor->masks->factor);
-		if (rate > drate)
+		if (rate > req->rate)
 			break;
 	}
-	if ((i == 0) || (i == factor->ftbl_cnt)) {
-		return rate;
-	} else {
-		if ((drate - prev_rate) > (rate - drate))
-			return rate;
-		else
-			return prev_rate;
-	}
+
+	if ((i == 0) || (i == factor->ftbl_cnt))
+		req->rate = rate;
+	else if ((req->rate - prev_rate) > (rate - req->rate))
+		req->rate = rate;
+	else
+		req->rate = prev_rate;
+
+	return 0;
 }
 
 static unsigned long clk_factor_recalc_rate(struct clk_hw *hw,
@@ -160,7 +161,7 @@ static int clk_factor_init(struct clk_hw *hw)
 
 static const struct clk_ops clk_factor_ops = {
 	.recalc_rate = clk_factor_recalc_rate,
-	.round_rate = clk_factor_round_rate,
+	.determine_rate = clk_factor_determine_rate,
 	.set_rate = clk_factor_set_rate,
 	.init = clk_factor_init,
 };

-- 
2.50.1



