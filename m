Return-Path: <linux-mips+bounces-10101-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA109B20E87
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 17:25:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7743189367B
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 15:23:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E936F2E9EA0;
	Mon, 11 Aug 2025 15:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nM+l/Pt6"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF4F2E9743;
	Mon, 11 Aug 2025 15:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754925511; cv=none; b=PrTmoTmeq4fm3X2lg3eU8VVMCuByJm4xX/ny1EkioXDvi4dz7TuQUU0xFxYHT5bSHe65uumebwdimyARNrPPb6E95WuhQkRZNbMWMTJB2XLnfi0C3ZN3NfwlQSja7iDa5PVtarFhc2JGH9bpYC/Ly9hKka5CdIIfwceIoLFKAAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754925511; c=relaxed/simple;
	bh=nNd8nWnbBfSWCuY5v6Jqah5ZuPH8MeROmp09ygHhFT0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o6ozjfxm+M+LmTY6js8570kCIp8sR2OYDsmgWs560IzKLv7NdrB8mgVtwuJLMOEMx5861EcpV8w27wlNDb9jBO4z/v0Hp/FZQzsU+rLEjk5CNpglTQm80hY8dT4xZHKEahPn3IzDQ5cquTsaV5+9XAqi30JxUEVRpsFq6VbPNRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nM+l/Pt6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7E1E2C2BC9E;
	Mon, 11 Aug 2025 15:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925510;
	bh=nNd8nWnbBfSWCuY5v6Jqah5ZuPH8MeROmp09ygHhFT0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nM+l/Pt6CpTl5ekww5CPutDxjwAIDT6ow3SApaCRzBOXQPZTk+8YwRu3QHrWczV+n
	 v8SEcG6CDYhmQEvMuWm0gFkHswCrqdohb0Sr+ancbgaGKeVMBiBdbLtM+2yJDWVGD4
	 /jG8GlI7877ye+9Dh8di3CRg+nHKoaUsJ7o8iAeIy86eikAC3/VLxVmUGqmwx8QVlV
	 ldqtp4NVgQaAOim3aooPiGg17NnKnotQ/Ik86nAkFtG4UNyDD47Uz0xXgftozRdsYm
	 ANqbEZDpbPqan5LsZstdfI8svp5ecqpwAJJbXt2f9JrSAlAOhu6qb6Tgzf2DbRUTvK
	 EOJOBdR/k4bRQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D349CA0ED1;
	Mon, 11 Aug 2025 15:18:30 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:18:42 -0400
Subject: [PATCH 050/114] clk: spacemit: ccu_mix: convert from round_rate()
 to determine_rate()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-50-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925498; l=1744;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=4hdyJ1mvA5b4yc2QdieijDDxAcJJ/+4zhEd431sykbw=;
 b=6ODQ5IcqI9WyCjasxtM1xkk/JmIS3nwvhlKiVNiAgL5GgGXqsyE1dIXDVSGrQed73P5R9S/fT
 EkByeRZdDptAGUDuFBG7Tj0gswr0Fhnb0VliQ3N2hTZpxNF7MVzVKRq
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
 drivers/clk/spacemit/ccu_mix.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/spacemit/ccu_mix.c b/drivers/clk/spacemit/ccu_mix.c
index 9b852aa61f78aed5256bfe6fc3b01932d6db6256..7b7990875372314dce131295af7f40267d0a127a 100644
--- a/drivers/clk/spacemit/ccu_mix.c
+++ b/drivers/clk/spacemit/ccu_mix.c
@@ -80,10 +80,12 @@ static int ccu_mix_trigger_fc(struct clk_hw *hw)
 					       MIX_FC_TIMEOUT_US);
 }
 
-static long ccu_factor_round_rate(struct clk_hw *hw, unsigned long rate,
-				  unsigned long *prate)
+static int ccu_factor_determine_rate(struct clk_hw *hw,
+				     struct clk_rate_request *req)
 {
-	return ccu_factor_recalc_rate(hw, *prate);
+	req->rate = ccu_factor_recalc_rate(hw, req->best_parent_rate);
+
+	return 0;
 }
 
 static int ccu_factor_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -198,7 +200,7 @@ const struct clk_ops spacemit_ccu_gate_ops = {
 };
 
 const struct clk_ops spacemit_ccu_factor_ops = {
-	.round_rate	= ccu_factor_round_rate,
+	.determine_rate = ccu_factor_determine_rate,
 	.recalc_rate	= ccu_factor_recalc_rate,
 	.set_rate	= ccu_factor_set_rate,
 };
@@ -220,7 +222,7 @@ const struct clk_ops spacemit_ccu_factor_gate_ops = {
 	.enable		= ccu_gate_enable,
 	.is_enabled	= ccu_gate_is_enabled,
 
-	.round_rate	= ccu_factor_round_rate,
+	.determine_rate = ccu_factor_determine_rate,
 	.recalc_rate	= ccu_factor_recalc_rate,
 	.set_rate	= ccu_factor_set_rate,
 };

-- 
2.50.1



