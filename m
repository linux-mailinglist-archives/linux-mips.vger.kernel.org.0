Return-Path: <linux-mips+bounces-10123-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C8687B20EAE
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 17:26:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8697C2A0066
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 15:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA5DA2ECD06;
	Mon, 11 Aug 2025 15:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d+y38EIe"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD6C2EBBAD;
	Mon, 11 Aug 2025 15:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754925514; cv=none; b=S38VNEZyKpwepsZBLIO+WuBpGW3NKkoesZvOLo4zDo7nrXI3RSKabLw54nuOFIE7idofuntUf3c40vXlKtqRUiCJaBa74yWVpdTlAwYdk9qkptLO+eW/QUA+rJ/HKEB95PbAtxWPnwayBfSXSJXFp7y4Etmbe1ksyfakqAwDHx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754925514; c=relaxed/simple;
	bh=OpZx/iplDnGkLBoiPyBHZFgdrbKK0ZveU1UXkfHX+Nw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=idCWpniIuM7UQjdE3tTrQtUvD78vsMILo6XcwjbfKJ13HuWR5eLUlFv/yckZU4RbA3xNwdixAVdwevQ8nBoLx5+NCIgZgytFLjbVtMqIYSyqRBtlC6yvk9NtLmm9Ltw65v+EAMnUzi/HX0zg45tNNRIlNscdOPpFTicG5fNxKm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d+y38EIe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0898FC116C6;
	Mon, 11 Aug 2025 15:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925512;
	bh=OpZx/iplDnGkLBoiPyBHZFgdrbKK0ZveU1UXkfHX+Nw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=d+y38EIeQ6kCnMrYZ01dKW2JvLFaAiczo6Mbyyd3C42+ltEz2F2lHn/khDNU6Ok1D
	 6peI5ifpMu6Q1ISCi6rFS/PPjFawwmlBRKMyLqB3X0DdsMxCHnmpK7DS7mNG82WlYp
	 kOLeLaLl0mxps/93O/vse8xfS/nUFMc/pMBombY4QMuic2azX4zpDpkrAn2ryi7PRo
	 aOImbYDrxe3QJhw2Xv1LKQetEKoBQNv4J9EXzdqjEPaSS13cqD4jWeUpfFLk0SDtPd
	 sVn2KE3qvlL8IsPjw0bmHIzbUIRaMFLLmpFWKaLWrflfDKuQtQp4sICTPlMAWMT7LB
	 sLAjLyIDdrA8A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD1F6C87FD2;
	Mon, 11 Aug 2025 15:18:31 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:18:58 -0400
Subject: [PATCH 066/114] clk: xilinx: xlnx-clock-wizard: convert from
 round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-66-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925498; l=5292;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=BWOB+xAtAII8SggUbIYHLjNCW0927ZNtUJkwA7KOXIM=;
 b=ryZ+IQSP039uUqGz9z1Fkzb2PsZcnEcVVnTU95hN1WUhS0L0na/UMu0rIlaHj+f1yfuU3xXrE
 B+XuvWRrdEmBUDiMSTgEGz6AOA09az87Gg6hZyzcFIGWbUFJQ0d5W4N
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
 drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 55 ++++++++++++++++--------------
 1 file changed, 30 insertions(+), 25 deletions(-)

diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
index 0295a13a811cf8e00fd49879eefc5bcf4fb89228..3ee14770212a9f241d49123b25cee7abca350194 100644
--- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
@@ -322,8 +322,8 @@ static int clk_wzrd_dynamic_reconfig(struct clk_hw *hw, unsigned long rate,
 	return err;
 }
 
-static long clk_wzrd_round_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long *prate)
+static int clk_wzrd_determine_rate(struct clk_hw *hw,
+				   struct clk_rate_request *req)
 {
 	u8 div;
 
@@ -331,9 +331,11 @@ static long clk_wzrd_round_rate(struct clk_hw *hw, unsigned long rate,
 	 * since we don't change parent rate we just round rate to closest
 	 * achievable
 	 */
-	div = DIV_ROUND_CLOSEST(*prate, rate);
+	div = DIV_ROUND_CLOSEST(req->best_parent_rate, req->rate);
 
-	return *prate / div;
+	req->rate = req->best_parent_rate / div;
+
+	return 0;
 }
 
 static int clk_wzrd_get_divisors_ver(struct clk_hw *hw, unsigned long rate,
@@ -642,14 +644,14 @@ static unsigned long clk_wzrd_recalc_rate_all_ver(struct clk_hw *hw,
 			divider->flags, divider->width);
 }
 
-static long clk_wzrd_round_rate_all(struct clk_hw *hw, unsigned long rate,
-				    unsigned long *prate)
+static int clk_wzrd_determine_rate_all(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
 	u32 m, d, o;
 	int err;
 
-	err = clk_wzrd_get_divisors(hw, rate, *prate);
+	err = clk_wzrd_get_divisors(hw, req->rate, req->best_parent_rate);
 	if (err)
 		return err;
 
@@ -657,19 +659,20 @@ static long clk_wzrd_round_rate_all(struct clk_hw *hw, unsigned long rate,
 	d = divider->d;
 	o = divider->o;
 
-	rate = div_u64(*prate * (m * 1000 + divider->m_frac), d * (o * 1000 + divider->o_frac));
-	return rate;
+	req->rate = div_u64(req->best_parent_rate * (m * 1000 + divider->m_frac),
+			    d * (o * 1000 + divider->o_frac));
+	return 0;
 }
 
-static long clk_wzrd_ver_round_rate_all(struct clk_hw *hw, unsigned long rate,
-					unsigned long *prate)
+static int clk_wzrd_ver_determine_rate_all(struct clk_hw *hw,
+					   struct clk_rate_request *req)
 {
 	struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
 	unsigned long int_freq;
 	u32 m, d, o, div, f;
 	int err;
 
-	err = clk_wzrd_get_divisors_ver(hw, rate, *prate);
+	err = clk_wzrd_get_divisors_ver(hw, req->rate, req->best_parent_rate);
 	if (err)
 		return err;
 
@@ -678,36 +681,38 @@ static long clk_wzrd_ver_round_rate_all(struct clk_hw *hw, unsigned long rate,
 	o = divider->o;
 
 	div = d * o;
-	int_freq =  divider_recalc_rate(hw, *prate * m, div, divider->table,
+	int_freq =  divider_recalc_rate(hw, req->best_parent_rate * m, div,
+					divider->table,
 					divider->flags, divider->width);
 
-	if (rate > int_freq) {
-		f = DIV_ROUND_CLOSEST_ULL(rate * WZRD_FRAC_POINTS, int_freq);
-		rate = DIV_ROUND_CLOSEST(int_freq * f, WZRD_FRAC_POINTS);
+	if (req->rate > int_freq) {
+		f = DIV_ROUND_CLOSEST_ULL(req->rate * WZRD_FRAC_POINTS,
+					  int_freq);
+		req->rate = DIV_ROUND_CLOSEST(int_freq * f, WZRD_FRAC_POINTS);
 	}
-	return rate;
+	return 0;
 }
 
 static const struct clk_ops clk_wzrd_ver_divider_ops = {
-	.round_rate = clk_wzrd_round_rate,
+	.determine_rate = clk_wzrd_determine_rate,
 	.set_rate = clk_wzrd_ver_dynamic_reconfig,
 	.recalc_rate = clk_wzrd_recalc_rate_ver,
 };
 
 static const struct clk_ops clk_wzrd_ver_div_all_ops = {
-	.round_rate = clk_wzrd_ver_round_rate_all,
+	.determine_rate = clk_wzrd_ver_determine_rate_all,
 	.set_rate = clk_wzrd_dynamic_all_ver,
 	.recalc_rate = clk_wzrd_recalc_rate_all_ver,
 };
 
 static const struct clk_ops clk_wzrd_clk_divider_ops = {
-	.round_rate = clk_wzrd_round_rate,
+	.determine_rate = clk_wzrd_determine_rate,
 	.set_rate = clk_wzrd_dynamic_reconfig,
 	.recalc_rate = clk_wzrd_recalc_rate,
 };
 
 static const struct clk_ops clk_wzrd_clk_div_all_ops = {
-	.round_rate = clk_wzrd_round_rate_all,
+	.determine_rate = clk_wzrd_determine_rate_all,
 	.set_rate = clk_wzrd_dynamic_all,
 	.recalc_rate = clk_wzrd_recalc_rate_all,
 };
@@ -769,14 +774,14 @@ static int clk_wzrd_dynamic_reconfig_f(struct clk_hw *hw, unsigned long rate,
 				WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
 }
 
-static long clk_wzrd_round_rate_f(struct clk_hw *hw, unsigned long rate,
-				  unsigned long *prate)
+static int clk_wzrd_determine_rate_f(struct clk_hw *hw,
+				     struct clk_rate_request *req)
 {
-	return rate;
+	return 0;
 }
 
 static const struct clk_ops clk_wzrd_clk_divider_ops_f = {
-	.round_rate = clk_wzrd_round_rate_f,
+	.determine_rate = clk_wzrd_determine_rate_f,
 	.set_rate = clk_wzrd_dynamic_reconfig_f,
 	.recalc_rate = clk_wzrd_recalc_ratef,
 };

-- 
2.50.1



