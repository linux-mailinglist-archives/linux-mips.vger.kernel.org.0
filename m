Return-Path: <linux-mips+bounces-10100-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3128B20E26
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 17:23:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E17A716B276
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 15:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B6F82E92D6;
	Mon, 11 Aug 2025 15:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eicOe+rm"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEAD12E92A5;
	Mon, 11 Aug 2025 15:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754925510; cv=none; b=XvY6GSgY9RVTrYUJ/J83O9lBGo4e19vkMceIKYJ5Xw9rakq9NIMPxt5qFna9JFKjYM6OZQs9gJVyoMxvoOOCtVWz+YoGHqqDUJ4rKvyVGbOEfinDDYcY3K/Y5UDxeT5qZRC+AB09ryhrAL4JEwL8JL0B5PHUHKseiISOp95ug+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754925510; c=relaxed/simple;
	bh=/xbZfJSWvgdrl56vtnWeCWhWPwuGG/9fbB17u7Zh+os=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mu4o9A3sDVPQ5RgL2Ri90i1iXmEDKxkpZ4ZJqea8UGw2jd50tXUv1k3PNWwrWKJJw2s9q315nT8L6pNXEqGOvJnolz2MaYXehaKHcLu5tnEFOztPJxOq1YghcJes2S+fzAocaPnng6MxPLYX3gRCNl5qo5yOKncpU7mCS9WkgKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eicOe+rm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D0284C4CEF5;
	Mon, 11 Aug 2025 15:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925509;
	bh=/xbZfJSWvgdrl56vtnWeCWhWPwuGG/9fbB17u7Zh+os=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=eicOe+rmPzTbK81aaaLg0N2PLwABrySSQigI8l1wTp9DfW/by0z7m2ZSXskzMSySo
	 4u44god1D1RspSWXnpLeVHdcNGAjHAV8gl718mPMCdwoWa3R8wBQ7+67xLr0oc8hsx
	 YrB5d6GfK0T4AUPdvGcH8MMPYHfRCyLkPztHjo+Zr/KdmZyC1Oxo6VtZ6aP5Hhhg5q
	 NQR26tAX7R7zLSBNP++ER9psV81xlGW5bN4db6NJWdtSqnNY6m3ZhNcVgADghV78zq
	 2IuP1i7N9YYS1ES7TwaNkGREcudFR+QzPUwMdSXXT9PgP9+EvsVkBFXgtFHHMK1M3B
	 84CMzInmee+xA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD9D3C87FD2;
	Mon, 11 Aug 2025 15:18:29 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:18:36 -0400
Subject: [PATCH 044/114] clk: si544: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-44-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925498; l=1503;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=fVELDYjSyI3lUqmGhDZt2zJiIzyldRApSKQVIiZoQQc=;
 b=mXhZDIe2ygJEtQnwK6iMSzuNOozId22qmcQlmwQLfFq1GIf1Zsc4/MiB2qDJEao85Qr9DATBb
 PBR/+f6XuiFDi3gSkSnXvUTuo2rqaXmEr1A/Q8nkhuGhfsTsRfTJ2Bl
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
 drivers/clk/clk-si544.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/clk-si544.c b/drivers/clk/clk-si544.c
index ca3473efa314b44b7eff6bc3ec9eafa518e0bd9e..09c06ecec1a52a6a521428e349cbd4cf166bbea3 100644
--- a/drivers/clk/clk-si544.c
+++ b/drivers/clk/clk-si544.c
@@ -307,16 +307,16 @@ static unsigned long si544_recalc_rate(struct clk_hw *hw,
 	return si544_calc_rate(&settings);
 }
 
-static long si544_round_rate(struct clk_hw *hw, unsigned long rate,
-		unsigned long *parent_rate)
+static int si544_determine_rate(struct clk_hw *hw,
+				struct clk_rate_request *req)
 {
 	struct clk_si544 *data = to_clk_si544(hw);
 
-	if (!is_valid_frequency(data, rate))
+	if (!is_valid_frequency(data, req->rate))
 		return -EINVAL;
 
 	/* The accuracy is less than 1 Hz, so any rate is possible */
-	return rate;
+	return 0;
 }
 
 /* Calculates the maximum "small" change, 950 * rate / 1000000 */
@@ -408,7 +408,7 @@ static const struct clk_ops si544_clk_ops = {
 	.unprepare = si544_unprepare,
 	.is_prepared = si544_is_prepared,
 	.recalc_rate = si544_recalc_rate,
-	.round_rate = si544_round_rate,
+	.determine_rate = si544_determine_rate,
 	.set_rate = si544_set_rate,
 };
 

-- 
2.50.1



