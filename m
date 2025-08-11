Return-Path: <linux-mips+bounces-10145-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4D7B20F5F
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 17:31:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10B4A3B6D65
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 15:28:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80BFF2F3C1A;
	Mon, 11 Aug 2025 15:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EJNYcMcJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71432EFDAC;
	Mon, 11 Aug 2025 15:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754925517; cv=none; b=cujR3I/bjwOERqtcE9pkbYV1uCuE/3aWkw+QL3pYiO8lHb5b2trKB0cRP/Dm2UtHZG+bycH/Vg3M619F5b6XHTJHrQNt/uppgQNh4nfMLYt6BhDriYsLAPJOvJfeFaB2ThNfotXkKxrRsnpAByiWvc4FkpVxYcaBZIquWTmSZeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754925517; c=relaxed/simple;
	bh=0qRwAyI6BBJq6rdVO6xTsGUiWxnfqdNJv4I89uhp6PE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yu15YkJSnqMnMw/HL002nHlcQtPixMWloFb1Ey2+fOevKWRrfgQQ8ktYtoUVSUDTfLAC+L+upuZ1YNavLiaK0sQ7fY2okYTBubIg3rCOoHGfGzlsDnwNo61w/xuCkTUsNpPQ/i1GV6CalI5Eph1plHYf+y4IgWvg8qYDk7F4llU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EJNYcMcJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 17D7CC56874;
	Mon, 11 Aug 2025 15:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925516;
	bh=0qRwAyI6BBJq6rdVO6xTsGUiWxnfqdNJv4I89uhp6PE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=EJNYcMcJgJfGLB8KQajBCkdDDpfXj6eEvnoAC3mmXdDy7uvjtQ0PpxeiRqPo76Mpz
	 9hIUjdGEy7I5FBtvfbcTZ/eRB7dC2wRUUakyIjCo2SBivN43Xf8YreKlVQ6FCPcfdi
	 BCTUAsi65yWu2Mj0sDHvkWIVkz8brD42mJX8cSvhaHKT4S9awrahjNrEOMQb4yFB96
	 lY4SH+vy5FSBSpziPKm0MRedYqzlIfrOQkjDLbSyi9lxnzHdDrkjRW5qTrG6Xmo3Vr
	 Jy9vgMAkB4HKTZsyag4ZpSdmkQX9gMZ1ZKsfuZj2u79ZqkzQ6EN32Qe7oZTmJoOsi9
	 UgN+Tc14LdQQg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1B5ACA0EDA;
	Mon, 11 Aug 2025 15:18:35 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:19:39 -0400
Subject: [PATCH 107/114] clk: versaclock7: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-107-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925498; l=3930;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=pV0hzX5meej1V9jCXC+yNB+MJ8wG4M3giNUgVcvRU6k=;
 b=Wdn2Qf11E4dJPJknD+q7/QSac+tyKquY4ucfn3WYnbfrHqheDIUvUlz/ppyf2ZscSer1ShS6t
 4+ibqLTJPFrBF9rvjpWKjY/ljTSBF/A9Puce8k+rLTXd4V9Vvqnqy0A
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
 drivers/clk/clk-versaclock7.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/clk-versaclock7.c b/drivers/clk/clk-versaclock7.c
index 483285b30c13d90117850458998b8fd6136574b8..adcc603e32593121f7e760e62e77a06a976672e7 100644
--- a/drivers/clk/clk-versaclock7.c
+++ b/drivers/clk/clk-versaclock7.c
@@ -900,17 +900,18 @@ static unsigned long vc7_fod_recalc_rate(struct clk_hw *hw, unsigned long parent
 	return fod_rate;
 }
 
-static long vc7_fod_round_rate(struct clk_hw *hw, unsigned long rate, unsigned long *parent_rate)
+static int vc7_fod_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
 {
 	struct vc7_fod_data *fod = container_of(hw, struct vc7_fod_data, hw);
 	unsigned long fod_rate;
 
 	pr_debug("%s - %s: requested rate: %lu, parent_rate: %lu\n",
-		 __func__, clk_hw_get_name(hw), rate, *parent_rate);
+		 __func__, clk_hw_get_name(hw), req->rate, req->best_parent_rate);
 
-	vc7_calc_fod_divider(rate, *parent_rate,
+	vc7_calc_fod_divider(req->rate, req->best_parent_rate,
 			     &fod->fod_1st_int, &fod->fod_2nd_int, &fod->fod_frac);
-	fod_rate = vc7_calc_fod_2nd_stage_rate(*parent_rate, fod->fod_1st_int,
+	fod_rate = vc7_calc_fod_2nd_stage_rate(req->best_parent_rate, fod->fod_1st_int,
 					       fod->fod_2nd_int, fod->fod_frac);
 
 	pr_debug("%s - %s: fod_1st_int: %u, fod_2nd_int: %u, fod_frac: %llu\n",
@@ -918,7 +919,9 @@ static long vc7_fod_round_rate(struct clk_hw *hw, unsigned long rate, unsigned l
 		 fod->fod_1st_int, fod->fod_2nd_int, fod->fod_frac);
 	pr_debug("%s - %s rate: %lu\n", __func__, clk_hw_get_name(hw), fod_rate);
 
-	return fod_rate;
+	req->rate = fod_rate;
+
+	return 0;
 }
 
 static int vc7_fod_set_rate(struct clk_hw *hw, unsigned long rate, unsigned long parent_rate)
@@ -952,7 +955,7 @@ static int vc7_fod_set_rate(struct clk_hw *hw, unsigned long rate, unsigned long
 
 static const struct clk_ops vc7_fod_ops = {
 	.recalc_rate = vc7_fod_recalc_rate,
-	.round_rate = vc7_fod_round_rate,
+	.determine_rate = vc7_fod_determine_rate,
 	.set_rate = vc7_fod_set_rate,
 };
 
@@ -978,21 +981,24 @@ static unsigned long vc7_iod_recalc_rate(struct clk_hw *hw, unsigned long parent
 	return iod_rate;
 }
 
-static long vc7_iod_round_rate(struct clk_hw *hw, unsigned long rate, unsigned long *parent_rate)
+static int vc7_iod_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
 {
 	struct vc7_iod_data *iod = container_of(hw, struct vc7_iod_data, hw);
 	unsigned long iod_rate;
 
 	pr_debug("%s - %s: requested rate: %lu, parent_rate: %lu\n",
-		 __func__, clk_hw_get_name(hw), rate, *parent_rate);
+		 __func__, clk_hw_get_name(hw), req->rate, req->best_parent_rate);
 
-	vc7_calc_iod_divider(rate, *parent_rate, &iod->iod_int);
-	iod_rate = div64_u64(*parent_rate, iod->iod_int);
+	vc7_calc_iod_divider(req->rate, req->best_parent_rate, &iod->iod_int);
+	iod_rate = div64_u64(req->best_parent_rate, iod->iod_int);
 
 	pr_debug("%s - %s: iod_int: %u\n", __func__, clk_hw_get_name(hw), iod->iod_int);
 	pr_debug("%s - %s rate: %ld\n", __func__, clk_hw_get_name(hw), iod_rate);
 
-	return iod_rate;
+	req->rate = iod_rate;
+
+	return 0;
 }
 
 static int vc7_iod_set_rate(struct clk_hw *hw, unsigned long rate, unsigned long parent_rate)
@@ -1023,7 +1029,7 @@ static int vc7_iod_set_rate(struct clk_hw *hw, unsigned long rate, unsigned long
 
 static const struct clk_ops vc7_iod_ops = {
 	.recalc_rate = vc7_iod_recalc_rate,
-	.round_rate = vc7_iod_round_rate,
+	.determine_rate = vc7_iod_determine_rate,
 	.set_rate = vc7_iod_set_rate,
 };
 

-- 
2.50.1



