Return-Path: <linux-mips+bounces-10077-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E83F8B20E0C
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 17:22:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30C781A20B9E
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 15:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 725112E5B22;
	Mon, 11 Aug 2025 15:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NYnlSl7S"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D112E427A;
	Mon, 11 Aug 2025 15:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754925507; cv=none; b=PqtCWpmAgHmPMQ6cpER519h8KXCXTkxRYiyhjVAYakmS45By4kFSIzNJFTRu3KCIvnZP5ykVDqsXDPLp/xjnOIOLRtNJkHNOxZzmsKDw2Sjnq757kCIzDlTSVpdUNAjn3bqsqXtn/DaY+LZ4HW4k7Wcr+UaTiPTyYSgg3cKhXHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754925507; c=relaxed/simple;
	bh=+YJ0W3e8Ry5S5DjS+4PlqX6ML40vEonkexsgUgUrLws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jZW5gbJFt5xbdoAMnvHFpxPgNYNjdW21jkTe2TmQv7sBI/xGIIYulH10krEvCCp+6Ykh0lorPOLp9Ll6teeLxCOUOdaGQKJyXmUceF71BkQC8DakKq5bmhMdXTpH4oz8nao5DfXfnU28TZ3R5cCTVfPUeiJ9bov1j7vwKhXDMkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NYnlSl7S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 48D78C4CEF9;
	Mon, 11 Aug 2025 15:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925507;
	bh=+YJ0W3e8Ry5S5DjS+4PlqX6ML40vEonkexsgUgUrLws=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NYnlSl7SQOCTzm2MntI3w4gqlcpt+oNMR4Gu6ttl0WjHNzwcwH39vQL1xB+TQtBnT
	 Bv8Egl9HJC1rDpH0DG55KgXg5/Hn8d52atezT4ty8cVKJX6nmfJpRJwwpBSwkNw7Ny
	 7QVhrM8TwmHyvs1ZtIJrqIkgrTMJ/EySvlChCi+HK7Ws0ZZPxHowcILFzL578gpofD
	 F9jX1rSRPMvaSUl2g+oE62GVUaqAK3Cy9doqdXF8lafudKqhOwEGIxX4xjhQbsAo4i
	 dCuLrjDMQMJxoIKwnVl7OWuz4LI+FaR9Z2ejNIR/DLg3oCm4MNzPcQ7BXutsE4JJCF
	 Z5gSEnPWlG1lA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27835CA0EC4;
	Mon, 11 Aug 2025 15:18:27 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:18:13 -0400
Subject: [PATCH 021/114] clk: hisilicon: hi6220-stub: convert from
 round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-21-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925497; l=1642;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=e2OVtyr3sWH4fXdNlCM9p9d5GYfBN48B++2MLeRnYhc=;
 b=UWv9utHt6wbmXcSerNUtZQ46BUF8QgIw0Xf0z14cBEkL7zfWJ/zAQ+KXwELOXjfAH3xHutz25
 U+25ao9L/fRBVMiFNc5apjEUTTSGrlOOPGivQ/d2wQvG6Z6HNlj77r6
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
 drivers/clk/hisilicon/clk-hi6220-stub.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/hisilicon/clk-hi6220-stub.c b/drivers/clk/hisilicon/clk-hi6220-stub.c
index a8319795ed1cc349a53ce977881620a11ec650ed..bf99cfafafa0133d64f3fbb09f14242fbabac3a1 100644
--- a/drivers/clk/hisilicon/clk-hi6220-stub.c
+++ b/drivers/clk/hisilicon/clk-hi6220-stub.c
@@ -161,11 +161,11 @@ static int hi6220_stub_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 	return ret;
 }
 
-static long hi6220_stub_clk_round_rate(struct clk_hw *hw, unsigned long rate,
-		unsigned long *parent_rate)
+static int hi6220_stub_clk_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
 	struct hi6220_stub_clk *stub_clk = to_stub_clk(hw);
-	unsigned long new_rate = rate / 1000;  /* kHz */
+	unsigned long new_rate = req->rate / 1000;  /* kHz */
 
 	switch (stub_clk->id) {
 	case HI6220_STUB_ACPU0:
@@ -181,12 +181,14 @@ static long hi6220_stub_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 		break;
 	}
 
-	return new_rate;
+	req->rate = new_rate;
+
+	return 0;
 }
 
 static const struct clk_ops hi6220_stub_clk_ops = {
 	.recalc_rate	= hi6220_stub_clk_recalc_rate,
-	.round_rate	= hi6220_stub_clk_round_rate,
+	.determine_rate = hi6220_stub_clk_determine_rate,
 	.set_rate	= hi6220_stub_clk_set_rate,
 };
 

-- 
2.50.1



