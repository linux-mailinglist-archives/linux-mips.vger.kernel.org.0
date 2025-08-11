Return-Path: <linux-mips+bounces-10126-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EA4B20EFC
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 17:28:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6AD873ACF3E
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 15:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EAF02ECD38;
	Mon, 11 Aug 2025 15:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ABWxv3aT"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983902EBDCC;
	Mon, 11 Aug 2025 15:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754925514; cv=none; b=efz3RKD/RrujHrZfYTAVrNUJQRakBvxqrnvdqujKAt5eZam7NP1z0K4Ubx3iYRpBiEOOXE7Rtdh6i0SdtrKj2hu/pfu9clVA9LduYBFOkvzmy3eNv2B/sxas+f67r5yv+XzyQo8Egw+Vg+GCARW+yxlaJCXUk71ObUgxJyiO/og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754925514; c=relaxed/simple;
	bh=JunDHLx8/l0T4rGBMHJKYI8tmtYV2rNYDd/njpYYHVE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LJxI+wRldCiDvcWqJno0+UtMPndtBWyr/UE4Qo4m835gsdS/uMl6myoSh67AQNKEeYTTun2nz+zif8NZ/5dxhp0ixurYl0+QMoXZX0sIdY67ZnL5epddDiU4N3B+8XD8y9sOeCFAbV5Ygul/aSOK9N/q2pag7rO4THMqZ83lYGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ABWxv3aT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 26387C4DE0D;
	Mon, 11 Aug 2025 15:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925512;
	bh=JunDHLx8/l0T4rGBMHJKYI8tmtYV2rNYDd/njpYYHVE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ABWxv3aTOLyUPD0xv/uq6LdXngtkhpvnWZ+AOVH+jvc1SCnXpQwGMQfXE1yw33hMo
	 qZsNBobw3VwnvqjGHkKul/V6iq/gat9UgzWQ9ze+P4Ck9FWWDvrD3qR0mI6/2JyEJC
	 oAsFId3o5YX6MO4gnZk8LyG2MDJQVxLNY8LgzgO7hxkgKHuu8TJD6P/8/afgnbgzBT
	 MhRJTSBqP9LRk2UYSJmGoeBrDgW8EugtHbzt6QhuCMgruMBzLbAvVC2EjruWeAv7rn
	 7EEUc6TPjTe6F48Tc0d6GWK8r5MWr8XwdAyCuJg7Ja0xAZbBcVjVdw4VWKMaf2epXl
	 W7Va30hv96RZQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14176CA0EC8;
	Mon, 11 Aug 2025 15:18:32 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:19:00 -0400
Subject: [PATCH 068/114] clk: zynqmp: divider: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-68-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925498; l=2557;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=Zs0u4KFiPgOdtobNVPTqPSjbiFnfpZhsHHTaehaZD6k=;
 b=Ukt1Oh4/kXrvpMcn8AxKhVmUskoT9oWQ/HPlFC+1vBuz3JBrwb+pctgJdDh3v7rNLkZLUhzih
 5P/QzAkefeZDy0kv01bVpkrPRNcNZF8U3RFg566FCgF0lHOOEp6eJJt
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
 drivers/clk/zynqmp/divider.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/zynqmp/divider.c b/drivers/clk/zynqmp/divider.c
index 5a00487ae408be4ffd586704859b232e934c1f6e..8470b22948252b83567925c704716a027b841562 100644
--- a/drivers/clk/zynqmp/divider.c
+++ b/drivers/clk/zynqmp/divider.c
@@ -118,9 +118,8 @@ static unsigned long zynqmp_clk_divider_recalc_rate(struct clk_hw *hw,
  *
  * Return: 0 on success else error+reason
  */
-static long zynqmp_clk_divider_round_rate(struct clk_hw *hw,
-					  unsigned long rate,
-					  unsigned long *prate)
+static int zynqmp_clk_divider_determine_rate(struct clk_hw *hw,
+					     struct clk_rate_request *req)
 {
 	struct zynqmp_clk_divider *divider = to_zynqmp_clk_divider(hw);
 	const char *clk_name = clk_hw_get_name(hw);
@@ -145,17 +144,21 @@ static long zynqmp_clk_divider_round_rate(struct clk_hw *hw,
 		if (divider->flags & CLK_DIVIDER_POWER_OF_TWO)
 			bestdiv = 1 << bestdiv;
 
-		return DIV_ROUND_UP_ULL((u64)*prate, bestdiv);
+		req->rate = DIV_ROUND_UP_ULL((u64) req->best_parent_rate, bestdiv);
+
+		return 0;
 	}
 
 	width = fls(divider->max_div);
 
-	rate = divider_round_rate(hw, rate, prate, NULL, width, divider->flags);
+	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
+				       NULL, width, divider->flags);
 
-	if (divider->is_frac && (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) && (rate % *prate))
-		*prate = rate;
+	if (divider->is_frac && (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) &&
+	    (req->rate % req->best_parent_rate))
+		req->best_parent_rate = req->rate;
 
-	return rate;
+	return 0;
 }
 
 /**
@@ -199,13 +202,13 @@ static int zynqmp_clk_divider_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops zynqmp_clk_divider_ops = {
 	.recalc_rate = zynqmp_clk_divider_recalc_rate,
-	.round_rate = zynqmp_clk_divider_round_rate,
+	.determine_rate = zynqmp_clk_divider_determine_rate,
 	.set_rate = zynqmp_clk_divider_set_rate,
 };
 
 static const struct clk_ops zynqmp_clk_divider_ro_ops = {
 	.recalc_rate = zynqmp_clk_divider_recalc_rate,
-	.round_rate = zynqmp_clk_divider_round_rate,
+	.determine_rate = zynqmp_clk_divider_determine_rate,
 };
 
 /**

-- 
2.50.1



