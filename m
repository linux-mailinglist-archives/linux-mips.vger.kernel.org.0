Return-Path: <linux-mips+bounces-10147-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD22B20F63
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 17:31:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AFD4620BCA
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 15:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C66E2EFD96;
	Mon, 11 Aug 2025 15:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UoCLDVmd"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D13D2F1FD7;
	Mon, 11 Aug 2025 15:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754925518; cv=none; b=kpAv0geaEDNcbiABJkuIQ5Szdygrc0mKPTDDms0LArx8FAwcofYmMs8ROEak+yvws4kvS8+4mLXtkviZK1LzoISgZtbAoz8gsL2jGfLzRzgYzalfPPXFjxf4dM8RCNT/igY4y9PlX/M7Fn99oVSc5heoccgUdEeS6aSTpMRFH5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754925518; c=relaxed/simple;
	bh=ODXrWGK8yZS7iMRmtiXT5t45U1KEmnxUjzcglLQNDZk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bSMGCa3xhB7y6FX7oyWJGa5WrhoKydx3uRq2b6RrQp+3bnFAL89AV7mGEqQpACw0gcpqp+sbVTr3mRK5FMvoJ2SDxGVtikTLWPbkqZybYXB69Ug0YVDeh5n5g94SeCJnwQPIwI/+QkeUkfS76/mDvvSZxBZSKNhyvW9LL9HRjeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UoCLDVmd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 41A0DC4DDE2;
	Mon, 11 Aug 2025 15:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925514;
	bh=ODXrWGK8yZS7iMRmtiXT5t45U1KEmnxUjzcglLQNDZk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UoCLDVmdTYjiGpxtC98IKLX/+M0rkeZWyO4nxOlZCxjVbJfPWbLeVzjEuq5T2bq1A
	 ngix+/6O+i0j4vNeGxkuXdKBJzC6BXJGrg8UwE0/5igkwgP9tr5Oq4HDeSL9+Lk0Gd
	 H+r0gIAfBbOjRqrukpyaaRPiqHs4Wtzq0oULjRng2IIXgE8c+q/1LBFCCn/rldo5q2
	 nu1kdPWvXhsPbtBP7COlpuk7wZXffsK9QPlAOsKtrTDkcN8OyB16XcmkIdrDtt7/iA
	 rK4R3hSkzmcbxZkHdjalYXamf0TY1bmhz/WXX9NQh1zUQc+IgI53Q9vOyIkGL3IFGB
	 gWJ2SRmFPBPPg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15924CA0EC8;
	Mon, 11 Aug 2025 15:18:34 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:19:20 -0400
Subject: [PATCH 088/114] clk: mvebu: cpu: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-88-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925498; l=1588;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=OokNVgkRjbnKoQ5w/W5Ca7W4UGOMZKX1UYUaStmr/DY=;
 b=vAC+dhO0kijuJtanVnu+ohRpU9KsfSjVpkI97ouYggo3T3ugsJgM4O7SXkUCLs0VbV70HQ9NO
 jlxyYltDx3gAJhRYmSE8yYRmyBaTVjWje72NEJG9gqk1vPOp5tF7Ni6
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
 drivers/clk/mvebu/clk-cpu.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/mvebu/clk-cpu.c b/drivers/clk/mvebu/clk-cpu.c
index db2b38c21304ecb8cc0bad0ff7de5a0a3c868516..0de7660e73d20b5e2fba349544001f200d859b2d 100644
--- a/drivers/clk/mvebu/clk-cpu.c
+++ b/drivers/clk/mvebu/clk-cpu.c
@@ -56,19 +56,21 @@ static unsigned long clk_cpu_recalc_rate(struct clk_hw *hwclk,
 	return parent_rate / div;
 }
 
-static long clk_cpu_round_rate(struct clk_hw *hwclk, unsigned long rate,
-			       unsigned long *parent_rate)
+static int clk_cpu_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
 {
 	/* Valid ratio are 1:1, 1:2 and 1:3 */
 	u32 div;
 
-	div = *parent_rate / rate;
+	div = req->best_parent_rate / req->rate;
 	if (div == 0)
 		div = 1;
 	else if (div > 3)
 		div = 3;
 
-	return *parent_rate / div;
+	req->rate = req->best_parent_rate / div;
+
+	return 0;
 }
 
 static int clk_cpu_off_set_rate(struct clk_hw *hwclk, unsigned long rate,
@@ -159,7 +161,7 @@ static int clk_cpu_set_rate(struct clk_hw *hwclk, unsigned long rate,
 
 static const struct clk_ops cpu_ops = {
 	.recalc_rate = clk_cpu_recalc_rate,
-	.round_rate = clk_cpu_round_rate,
+	.determine_rate = clk_cpu_determine_rate,
 	.set_rate = clk_cpu_set_rate,
 };
 

-- 
2.50.1



