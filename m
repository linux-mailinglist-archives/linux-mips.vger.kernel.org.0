Return-Path: <linux-mips+bounces-10165-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBF6B20FCE
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 17:34:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66AB01889EF1
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 15:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E553F3093AA;
	Mon, 11 Aug 2025 15:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Az40kbOY"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E85A2F1FE6;
	Mon, 11 Aug 2025 15:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754925518; cv=none; b=sP9QEHOAGDy9zy3k82lBYqZ+S1hKKNh7I9tWlPeqDhOcERBO5c5zjSS73UqPBhz3t2UutTAgGES6y6hgpPT0Gk5quAMXCw10EVcdm1HOfcWb85DVFjIx8rpvyn+DV/l6MPFxhCnipLqmHhXD0exbO8ba5g+xC9ze9wwVhAv/peA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754925518; c=relaxed/simple;
	bh=fO4pH87z4eFHV4v/UgUqY5rSOEH48M2+go45AbeR5hY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J7QQLXzj+3ZEuul24eg6ruOkE2VRIGn5QUY5usTwQv/GeK4Ov39fiywH8KkDtE+D6fZjfaBJN5Vn2PBira++TtxPyfP2RV+sMfYWlYg65JVr4UjuAwwbb2E/s6j4QrI3nMwDmFd5u4z8t7syAH4RTgU7g98ngbhD74ukV1Focf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Az40kbOY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 567B9C2BC9E;
	Mon, 11 Aug 2025 15:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925514;
	bh=fO4pH87z4eFHV4v/UgUqY5rSOEH48M2+go45AbeR5hY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Az40kbOYTjlgYiXf3jjjLhMpPiWqBJGXjNhWKuhKgKEgS0dqb7ksH6Q7dmTZwcNLu
	 Q1b+4goEv1kcxdQMEkzty/r214s9B3tItzaRMvtrGCNaz4PyyKhGQIM0pc/OFgroC8
	 hd+7LnD9Mc2mHA/ITSucZb892rUGZbWKVXHhpbZC2vOVHJh/S6e9Zlgf8rHmf3Kv5p
	 i8X96l9eJZfwfDtqJNItGtF0tpTvGWlO8P1OoIV80Kh9ubFHjcug1c5Mn4HOhwdEKi
	 utFwT4d2JT6QbAZII6EyM96YreAhBcX5kyIAuBJQpb3fzPEg9y7kgq8sGU7guyq3Mj
	 hHO+uNEhSZ6jg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B438CA0ED1;
	Mon, 11 Aug 2025 15:18:34 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:19:21 -0400
Subject: [PATCH 089/114] clk: mvebu: dove-divider: convert from
 round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-89-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925498; l=1944;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=oV0L5pMbnuZkTYfF/ENUrwPv2qnrSE+KwezXJZqTf5o=;
 b=z5YAGbnnIfP8tmH1fAIJfEAzFrdo1ho+qJgzsp+GA6lQ+bPMwed35cDDYIinKL/+duQ/lEln4
 yueROUQJxkqDln8CE70UWMlcaXy3iFRwwxeYtzv+Kcqln7gguFaV2Z0
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
 drivers/clk/mvebu/dove-divider.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/mvebu/dove-divider.c b/drivers/clk/mvebu/dove-divider.c
index 0a90452ee808b6bf2f1f9f815624b99720c3a81f..47cc49e4cd9992ce32c7215fdda42762f2caff39 100644
--- a/drivers/clk/mvebu/dove-divider.c
+++ b/drivers/clk/mvebu/dove-divider.c
@@ -108,23 +108,23 @@ static unsigned long dove_recalc_rate(struct clk_hw *hw, unsigned long parent)
 	return rate;
 }
 
-static long dove_round_rate(struct clk_hw *hw, unsigned long rate,
-			    unsigned long *parent)
+static int dove_determine_rate(struct clk_hw *hw,
+			       struct clk_rate_request *req)
 {
 	struct dove_clk *dc = to_dove_clk(hw);
-	unsigned long parent_rate = *parent;
+	unsigned long parent_rate = req->best_parent_rate;
 	int divider;
 
-	divider = dove_calc_divider(dc, rate, parent_rate, false);
+	divider = dove_calc_divider(dc, req->rate, parent_rate, false);
 	if (divider < 0)
 		return divider;
 
-	rate = DIV_ROUND_CLOSEST(parent_rate, divider);
+	req->rate = DIV_ROUND_CLOSEST(parent_rate, divider);
 
 	pr_debug("%s(): %s divider=%u parent=%lu rate=%lu\n",
-		 __func__, dc->name, divider, parent_rate, rate);
+		 __func__, dc->name, divider, parent_rate, req->rate);
 
-	return rate;
+	return 0;
 }
 
 static int dove_set_clock(struct clk_hw *hw, unsigned long rate,
@@ -154,7 +154,7 @@ static int dove_set_clock(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops dove_divider_ops = {
 	.set_rate	= dove_set_clock,
-	.round_rate	= dove_round_rate,
+	.determine_rate = dove_determine_rate,
 	.recalc_rate	= dove_recalc_rate,
 };
 

-- 
2.50.1



