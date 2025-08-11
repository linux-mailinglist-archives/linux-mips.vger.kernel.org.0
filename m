Return-Path: <linux-mips+bounces-10084-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E81B6B20E02
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 17:22:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8337D621404
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 15:21:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14A342E7167;
	Mon, 11 Aug 2025 15:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OISyr9Nf"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470BE2E54D5;
	Mon, 11 Aug 2025 15:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754925508; cv=none; b=qmMs/YWI7YgvsUNaAkbQh1AfS+FlqnpJFThZtcXFU7OK4aEfUxKTXWmFtJqy3yiI36ODAnhkuIGMrrIE2XAhpdGF33fRMeJJC6yD1NvuBhaZnPxfAGIsNs8226K4deIUJKsQnkRXZ4UDmUdvlDd6nB0Ls5wEyaMAnRNMynxu1Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754925508; c=relaxed/simple;
	bh=zMy6whF6uKQ1TUzx17dFw1StJamO9kLFNyTBGcp6mAQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z+WDfHC/YcOAmCEX8hMmVdiN8JX9VlhUVfZvgVnTcv/7QhMais0ZWVkva/rhiL8/sl9gXxBjhNCjhmHUYj/s88Q3mwg1OTvYoPUTU5u9R53yHdK+ya+UNynllrS9spavChtTO0W+JVlKuOO4pIOBDzsmMFKx1xBkcRnGwbdTKik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OISyr9Nf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 28B71C4CEFF;
	Mon, 11 Aug 2025 15:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925508;
	bh=zMy6whF6uKQ1TUzx17dFw1StJamO9kLFNyTBGcp6mAQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OISyr9Nfh5//srgsIzU5HjQlI5maAJGDmSAct+6THYDZvoxeiRoubgVhYJ4mdLFx4
	 ZzCl2vvDNTqmQTY7u00wim9Jqp+IqRdhZmkbAZCy5AgLhYoGVpqCkD1jNgWTXx4yV3
	 L6sj88dowt1PKZQxq5Sa33Vi/8VCWl/7OXJ6xYh3/LwTYPBwxmIhmdqcqOlM8vxziP
	 Q1b0XAvoog6bKGbp2m+xt0DB/LGkA9mJ+OWFQIXglkBuRNa/FzgGDJOivPE3r6zDiy
	 47HRbarerlQIhDc8edo1na97jd7z6nS4tODBU7LIcqiw+WaLdSbjhLAsVb15mWyGsQ
	 H0f9QB86PFakw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18BE3CA0EC4;
	Mon, 11 Aug 2025 15:18:28 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:18:20 -0400
Subject: [PATCH 028/114] clk: milbeaut: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-28-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925497; l=2218;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=5TdaCYdNCxvtkvciw+iLI7X0B3hQqFVvjJmg7rSFzmU=;
 b=e/NyMnffsCwpeedyIkqkgkajSKAMa4dsuRJNgY+hbjCH1vZeUN/Z2aGHGhUDQNmD4KDP64ttS
 hAypdkGK3uHCv6C6A9OVfoqzT9uwhDOYr9qD1oeu/ATPAEsOUa15Z3T
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
 drivers/clk/clk-milbeaut.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/clk-milbeaut.c b/drivers/clk/clk-milbeaut.c
index 18c20aff45f7698ac40451ef8000ec4fc4efc96b..b4f9b7143eaa658a7f2a14ff3cc9d91d8aa071c6 100644
--- a/drivers/clk/clk-milbeaut.c
+++ b/drivers/clk/clk-milbeaut.c
@@ -386,8 +386,8 @@ static unsigned long m10v_clk_divider_recalc_rate(struct clk_hw *hw,
 				   divider->flags, divider->width);
 }
 
-static long m10v_clk_divider_round_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long *prate)
+static int m10v_clk_divider_determine_rate(struct clk_hw *hw,
+					   struct clk_rate_request *req)
 {
 	struct m10v_clk_divider *divider = to_m10v_div(hw);
 
@@ -398,13 +398,19 @@ static long m10v_clk_divider_round_rate(struct clk_hw *hw, unsigned long rate,
 		val = readl(divider->reg) >> divider->shift;
 		val &= clk_div_mask(divider->width);
 
-		return divider_ro_round_rate(hw, rate, prate, divider->table,
-					     divider->width, divider->flags,
-					     val);
+		req->rate = divider_ro_round_rate(hw, req->rate,
+						  &req->best_parent_rate,
+						  divider->table,
+						  divider->width,
+						  divider->flags, val);
+
+		return 0;
 	}
 
-	return divider_round_rate(hw, rate, prate, divider->table,
-				  divider->width, divider->flags);
+	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
+				       divider->table, divider->width, divider->flags);
+
+	return 0;
 }
 
 static int m10v_clk_divider_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -450,7 +456,7 @@ static int m10v_clk_divider_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops m10v_clk_divider_ops = {
 	.recalc_rate = m10v_clk_divider_recalc_rate,
-	.round_rate = m10v_clk_divider_round_rate,
+	.determine_rate = m10v_clk_divider_determine_rate,
 	.set_rate = m10v_clk_divider_set_rate,
 };
 

-- 
2.50.1



