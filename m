Return-Path: <linux-mips+bounces-10075-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B214B20DE1
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 17:21:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA62E627113
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 15:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56A0A2E5B03;
	Mon, 11 Aug 2025 15:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="plhY4fja"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B632E4264;
	Mon, 11 Aug 2025 15:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754925507; cv=none; b=mycvVAmviWODO2DAFCtlKcTQ1cjvGIVCKZAihYBJTDLfNviA0BiJ+rReinNeCl346D+RfZkOWOdDACA/PkbbWQmqKkefl9yEvVTirhmD8JdMKUGJ2bE08RemvonL0qaGH1oV4Qfe/YI7bFnzjZGZvxlaWIcBfss38OsfDInOo+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754925507; c=relaxed/simple;
	bh=pMSzs+LLQG/nV8KzlANIdjdPWA+TqzqMKv3U3QB7ebM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m/3TiKi60W06yYtJb6DtngWAI+VXXK1issUNbwRQf3qpNgZRAFdh4kINOV8x+TPUI75CcZ3ZqRpTigZ1J2pnO9Ci9JNHU28o9Jxhl0/W+H3MejRTJuezaHeWClM/BhYtFskmAgTJGfe4oDdsL07C3D7F+tyHSP4vZJ7rRbuQu9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=plhY4fja; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 08D0FC4CEF7;
	Mon, 11 Aug 2025 15:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925507;
	bh=pMSzs+LLQG/nV8KzlANIdjdPWA+TqzqMKv3U3QB7ebM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=plhY4fja1ygSEJLSTJG8dQiEYHuFNFBe4XitmxVdlN7Ea1SuHiLQ69WnavKsQJ17V
	 oRz+pZtQZyJ3ejlPs/TLItv9IDYszXPdXxvG+N/ebx470Ps3J+xuJmcjf5I4xNWWc/
	 Y2Kuz/5C7Aaz2wVTfkTeB/Lbirhp90Y53kVE17p3ie7YryF4BQcPdgdfGHKQ85D3/p
	 q8hKOKXeismBM7HQT1kZBfc2BkgmrzcI0wWIck82/rRtq30qKXnGRZ0bfCKH7hqUYj
	 lU/Ew8qxiTgMOXcEhRpD1C+m/5hGGcZWgaEKcmyjB8O3XIJd3TbsR1T3toNrrwmkmC
	 It0oL8UEH64Fw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E66AEC87FD2;
	Mon, 11 Aug 2025 15:18:26 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:18:11 -0400
Subject: [PATCH 019/114] clk: hisilicon: hi3660-stub: move comma from
 declaration of DEFINE_CLK_STUB()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-19-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925497; l=1857;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=pA5mClIAqWRD8xr23+LW8paHRk4bx6Ip6j+lR6gsEH4=;
 b=/4xa+9ZPbf1YpEA8q63RlWiisStSIhIqYd5eTHQrEvH3tDR3ww5drLjmHYBPoDFxS5vVEOwzG
 iA8xPx+82hLBFeEgQKvF4kjQtv0Kp39kEqcfrO9GEkgnniXf6kRNkKx
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Endpoint-Received: by B4 Relay for bmasney@redhat.com/20250528 with
 auth_id=472
X-Original-From: Brian Masney <bmasney@redhat.com>
Reply-To: bmasney@redhat.com

From: Brian Masney <bmasney@redhat.com>

When trying to use Coccinelle to make changes inside drivers/clk/, it
really does not like the trailing comma at the end of the declaration
of DEFINE_CLK_STUB, and fails to process this file. It also looks weird
to not have commas to separate the various array members of
hi3660_stub_clks. Let's move the trailing comma out of the define so
that Coccinelle can be ran against this source file.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/hisilicon/clk-hi3660-stub.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/hisilicon/clk-hi3660-stub.c b/drivers/clk/hisilicon/clk-hi3660-stub.c
index 3a653d54bee0562d26d0de1dd31525786d05d40d..b0a996385301af7bcce231be9e7d5092dd21c3ac 100644
--- a/drivers/clk/hisilicon/clk-hi3660-stub.c
+++ b/drivers/clk/hisilicon/clk-hi3660-stub.c
@@ -34,7 +34,7 @@
 			.num_parents = 0,			\
 			.flags = CLK_GET_RATE_NOCACHE,		\
 		},						\
-	},
+	}
 
 #define to_stub_clk(_hw) container_of(_hw, struct hi3660_stub_clk, hw)
 
@@ -102,10 +102,10 @@ static const struct clk_ops hi3660_stub_clk_ops = {
 };
 
 static struct hi3660_stub_clk hi3660_stub_clks[HI3660_CLK_STUB_NUM] = {
-	DEFINE_CLK_STUB(HI3660_CLK_STUB_CLUSTER0, 0x0001030A, "cpu-cluster.0")
-	DEFINE_CLK_STUB(HI3660_CLK_STUB_CLUSTER1, 0x0002030A, "cpu-cluster.1")
-	DEFINE_CLK_STUB(HI3660_CLK_STUB_GPU, 0x0003030A, "clk-g3d")
-	DEFINE_CLK_STUB(HI3660_CLK_STUB_DDR, 0x00040309, "clk-ddrc")
+	DEFINE_CLK_STUB(HI3660_CLK_STUB_CLUSTER0, 0x0001030A, "cpu-cluster.0"),
+	DEFINE_CLK_STUB(HI3660_CLK_STUB_CLUSTER1, 0x0002030A, "cpu-cluster.1"),
+	DEFINE_CLK_STUB(HI3660_CLK_STUB_GPU, 0x0003030A, "clk-g3d"),
+	DEFINE_CLK_STUB(HI3660_CLK_STUB_DDR, 0x00040309, "clk-ddrc"),
 };
 
 static struct clk_hw *hi3660_stub_clk_hw_get(struct of_phandle_args *clkspec,

-- 
2.50.1



