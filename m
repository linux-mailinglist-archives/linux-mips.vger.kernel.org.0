Return-Path: <linux-mips+bounces-10089-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BE3B20DF5
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 17:22:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 285B816C334
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 15:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 998412E7BB5;
	Mon, 11 Aug 2025 15:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D9kmMUpu"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C916D2E62A7;
	Mon, 11 Aug 2025 15:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754925508; cv=none; b=IhTAhe8u1CZtP1hGiWoa35FzTXFHWIAdwJpl2FS+yYSg/YDyqN1WZc2sFvYeObkx9DuuHXXpCEb3Ko8QTcodmrbThaUfmCd1rC70dqIRBQhkjrBX9hXgHflfnzeKhdNvmPqjuE7duLCpITfKPCjnPyBokAMXZb7PnaT2zXSRbNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754925508; c=relaxed/simple;
	bh=hbS8CYxpFwoJ/d88pmWH5n/4v8GkiSjM3O4wXzP/9so=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LsArfJuo0yVKTKeyLNopO7llebhjYBWnBo7MCaTeNoghT+dsptvXMYSmwnzaaa314GZo1WFxxki7QOaoZ4POiyLeefIqoVClNlDutTLjuMbfTJwP4o/9sMLCYjko81BQuHfSq3YPT3ilT+yOXM/uxl1qX/5PCDjGEDzPYbo3VfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D9kmMUpu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9AE6DC113D0;
	Mon, 11 Aug 2025 15:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925508;
	bh=hbS8CYxpFwoJ/d88pmWH5n/4v8GkiSjM3O4wXzP/9so=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=D9kmMUpuTPGVoYfxdQ+LJhPXeNdBZ6bLp1MhP5zE1WDpOmMuYpgHZb9TDdkBuZVpg
	 ag5G7lPWoaO+lP9HOARK/LzHqv/JMvMcTOXU2Jdp1OlTv0m2hMPddRNoaBcEmTmgy8
	 BHoqmn+YwFf7oAxwOIb06Dk34+S2RqYN7aNhikYBGCK/VFYTBA+h04AdOBHXUkFKK1
	 2d0yxI8s6G8I8q7rGF0rHvwaGrUoFWnNU+W6H3EbC+KOy94uT4SmM6+TfilvJBdWJ/
	 An8YLWyACMc3XzCQi3kRBDvDYq5CdgMw/2MJjbzRz6taiw4F0mAODZVZEYgZx3ItJ4
	 zwybPt26NONOQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AB98C87FDA;
	Mon, 11 Aug 2025 15:18:28 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:18:25 -0400
Subject: [PATCH 033/114] clk: mxs: frac: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-33-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925497; l=1902;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=0/Bpo/91/6j37KFABTNfZnt6KuCfaX73g0Ji8rBEBLM=;
 b=Dt7u37BfGK3Us9/hCOPyDMriis1li2id2do/OdtdRGgZx7PPUlfIr/ZFY3VTE5hW+HMno1wub
 1kOKEzO+6Z1DTZGLWUUlSStkvCLw1/YKNLBoyuMUUaio5by7moKX9UZ
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
 drivers/clk/mxs/clk-frac.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/mxs/clk-frac.c b/drivers/clk/mxs/clk-frac.c
index bba0d840dd76c78c1eb88f4f30a9c431a40522c4..73f514fb84ffb9a680bab2711d16b282b71bf7b6 100644
--- a/drivers/clk/mxs/clk-frac.c
+++ b/drivers/clk/mxs/clk-frac.c
@@ -44,18 +44,18 @@ static unsigned long clk_frac_recalc_rate(struct clk_hw *hw,
 	return tmp_rate >> frac->width;
 }
 
-static long clk_frac_round_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long *prate)
+static int clk_frac_determine_rate(struct clk_hw *hw,
+				   struct clk_rate_request *req)
 {
 	struct clk_frac *frac = to_clk_frac(hw);
-	unsigned long parent_rate = *prate;
+	unsigned long parent_rate = req->best_parent_rate;
 	u32 div;
 	u64 tmp, tmp_rate, result;
 
-	if (rate > parent_rate)
+	if (req->rate > parent_rate)
 		return -EINVAL;
 
-	tmp = rate;
+	tmp = req->rate;
 	tmp <<= frac->width;
 	do_div(tmp, parent_rate);
 	div = tmp;
@@ -67,7 +67,9 @@ static long clk_frac_round_rate(struct clk_hw *hw, unsigned long rate,
 	result = tmp_rate >> frac->width;
 	if ((result << frac->width) < tmp_rate)
 		result += 1;
-	return result;
+	req->rate = result;
+
+	return 0;
 }
 
 static int clk_frac_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -103,7 +105,7 @@ static int clk_frac_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops clk_frac_ops = {
 	.recalc_rate = clk_frac_recalc_rate,
-	.round_rate = clk_frac_round_rate,
+	.determine_rate = clk_frac_determine_rate,
 	.set_rate = clk_frac_set_rate,
 };
 

-- 
2.50.1



