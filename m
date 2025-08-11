Return-Path: <linux-mips+bounces-10099-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E35BBB20E85
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 17:25:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE798427A3C
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 15:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 069352E92D5;
	Mon, 11 Aug 2025 15:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pc2y+ckB"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB1B2E8E1D;
	Mon, 11 Aug 2025 15:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754925510; cv=none; b=iggEghcZTeSj38H/w0vsFlDkc62QkBwF2+9R5NUkUcIws8tJZ0pxLkKFeHtusaIt39CLotRvT0wWqACbLIyOLsxAjJ7N4YIlJ828cMtAhPovJAMLEUTJFFvhKQhYkgmgLpUGX61nT508c64CEuWi7VTFVEP0e/daT+b495g5utY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754925510; c=relaxed/simple;
	bh=Apc2qzNpfS9aAHI8h/9ad7fvCKlHY8Hm4ds5yDJuMxY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZJx+gm5KMn64xkiX87eqqywL60Z4ERDV97Ss/u8H3uOXjzt+r+RqyPytJkdjVsPR73FVyswqggVLgRwjJBZrvwUR7YY0ZWgNX2z8MqCCkfAYZkMbqh6JWbCzD46oNzpAr8jn2OdBbUprRtXlFJLvRcygRlcJ89IKL3rnve3mNu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pc2y+ckB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6125C19421;
	Mon, 11 Aug 2025 15:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925509;
	bh=Apc2qzNpfS9aAHI8h/9ad7fvCKlHY8Hm4ds5yDJuMxY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Pc2y+ckBwV6Rdu49pgbnKxX8piZe7F+BV9WP5MLfbHVH9rYb3qLklc2ucy3MxIrpo
	 Ez8CA8oE1fk0yFR1LgKKedg8trPwICBnZsEhl2IgwFt234xrsj49yEv5hX56Iq1uD1
	 F2o0UQ7o1zBc6v8INWCZvtQ4emAbXpiDRhX9cRER0+VfVSzRPLc8fgP+psn+W1O5OP
	 xuv8nMzO7ym+lDgJBQe8UIVtUgf9PigsaNLs3f8EGfEy5+l7gT5a8aJr51mKVmN3wG
	 2SraZuhAlNj+AcxdWycxr/btBCZOM7mY2+5QhqPP7xDxbBR01mOk2938UL41QbFmXh
	 KgiaTMhfUfQzQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9657DC87FDA;
	Mon, 11 Aug 2025 15:18:29 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:18:35 -0400
Subject: [PATCH 043/114] clk: si5341: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-43-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925498; l=1946;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=VSclFs7R89Y+Lsm61Wi5Kzy/FJb3iOqfzn5aANhegPc=;
 b=flWSSXi6CEENtdFwyXcyp3r9Kub5eRxDOAYKZ/Npi1LtbV7xxzxgOYvzm2I3AsyOaNwIt8AHw
 esev6EsAl3zCadBDavASsob5DvzObWhBdDc6yl/uXR7h9oJCiYxZi60
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
 drivers/clk/clk-si5341.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/clk-si5341.c b/drivers/clk/clk-si5341.c
index 5004888c7eca5f85a444ec6de684b8dd79635622..2499b771cd83e313eafd83cb0519b1b94da73a61 100644
--- a/drivers/clk/clk-si5341.c
+++ b/drivers/clk/clk-si5341.c
@@ -663,8 +663,8 @@ static unsigned long si5341_synth_clk_recalc_rate(struct clk_hw *hw,
 	return f;
 }
 
-static long si5341_synth_clk_round_rate(struct clk_hw *hw, unsigned long rate,
-		unsigned long *parent_rate)
+static int si5341_synth_clk_determine_rate(struct clk_hw *hw,
+					   struct clk_rate_request *req)
 {
 	struct clk_si5341_synth *synth = to_clk_si5341_synth(hw);
 	u64 f;
@@ -672,15 +672,21 @@ static long si5341_synth_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 	/* The synthesizer accuracy is such that anything in range will work */
 	f = synth->data->freq_vco;
 	do_div(f, SI5341_SYNTH_N_MAX);
-	if (rate < f)
-		return f;
+	if (req->rate < f) {
+		req->rate = f;
+
+		return 0;
+	}
 
 	f = synth->data->freq_vco;
 	do_div(f, SI5341_SYNTH_N_MIN);
-	if (rate > f)
-		return f;
+	if (req->rate > f) {
+		req->rate = f;
 
-	return rate;
+		return 0;
+	}
+
+	return 0;
 }
 
 static int si5341_synth_program(struct clk_si5341_synth *synth,
@@ -741,7 +747,7 @@ static const struct clk_ops si5341_synth_clk_ops = {
 	.prepare = si5341_synth_clk_prepare,
 	.unprepare = si5341_synth_clk_unprepare,
 	.recalc_rate = si5341_synth_clk_recalc_rate,
-	.round_rate = si5341_synth_clk_round_rate,
+	.determine_rate = si5341_synth_clk_determine_rate,
 	.set_rate = si5341_synth_clk_set_rate,
 };
 

-- 
2.50.1



