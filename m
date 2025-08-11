Return-Path: <linux-mips+bounces-10056-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B13B20D88
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 17:19:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C2E3421A8E
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 15:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57F602E040F;
	Mon, 11 Aug 2025 15:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dHUmLXvq"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176842DFF13;
	Mon, 11 Aug 2025 15:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754925505; cv=none; b=W98APdiGJ+xaWO/AZWbmFeef2hDM9RyS5AZD8Uf1a5q6ygCHng0uIoxWeyVZTJJyO6nJx/T9ow2r7V4EZiqNjQ8S1knemFlmeuNonnrGTRk6aozf/P0dvffAF+/ww7dja/ScAkpur0fjTnlEgVf5BrgzW1o2LjgeyLyIt6koTsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754925505; c=relaxed/simple;
	bh=MgeYR6Iq/Ft0fyG1O3BYxzWqcNV87rYQNu31zB6YNEQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hwTqFo4P1Z1tn5/bRqmhCjtlYLxMc1RZF0rw133OQf6vdzyArjhglkkG6v1vLvvtFVuRg0n3qYCyiiC8hJxf4pv5hp4+p/JEUw2zEERdNlMAAsE1yyUSdJLtJh3NQ+s+kwoYNKjWjxEcSAldGD7S2jRdczO00rxBcmYf6Ot9rEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dHUmLXvq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E3DA3C4CEED;
	Mon, 11 Aug 2025 15:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925505;
	bh=MgeYR6Iq/Ft0fyG1O3BYxzWqcNV87rYQNu31zB6YNEQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=dHUmLXvqJkRv/X6YGz9UWRfz2U7ox3ro5X5ECvTpEbYvOWauZ+rMOTKpWOnIX9+Y+
	 UGowbih0fcXSduh0RbAJ5YenJcFsdsamHEqiUAKEVzvgKKs9ju0lG6LKZe2FIo/Bd/
	 Ta+KqizSYi9/GSdtr17f3ZT/VOKY/ZPzI4+r/nLwHDo45nnPsUJbGAiPJUeDb1CFr6
	 gKQ9bU1kZlPWRaa6qFu1TpsOGMublYnFpWj6ZiFOpNp97o/44hf7kHAXzXuucdAws6
	 H8LRgLoD+u4yLi+J/UgG8yU6Hbe40xgAbIQOSIyGTwxyf4+F1sVygR0TDEk+lmubxa
	 oyhyeozsBPcvQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA7F6C87FDA;
	Mon, 11 Aug 2025 15:18:24 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Subject: [PATCH 000/114] clk: convert drivers from deprecated round_rate()
 to determine_rate()
Date: Mon, 11 Aug 2025 11:17:52 -0400
Message-Id: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKAJmmgC/x3MQQqDMBAF0KvIrDtgA9roVUoXqfmpg5LIREUQ7
 97g8m3eSRkqyNRXJyl2yZJiwfNR0TC6+AOLLyZTm6Z+mY6HeeKQlPOKZURkTVv0rG4FN85afH2
 w3rVUgkUR5Ljz9+e6/giFd/RsAAAA
X-Change-ID: 20250729-clk-for-stephen-round-rate-5a88ebdf8da6
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925497; l=22023;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=MgeYR6Iq/Ft0fyG1O3BYxzWqcNV87rYQNu31zB6YNEQ=;
 b=HKE0+vAXgf8uQuwtjg3yptztVl3aLhgwFUY2HbnxlqGEzdj0wXOGrJuryFNnIQwEug2q72c0D
 cS92T0OgonMDCLfRXCVFWWdHhGZgOYdmfEMunggGyqtXOywdj1w40OO
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Endpoint-Received: by B4 Relay for bmasney@redhat.com/20250528 with
 auth_id=472
X-Original-From: Brian Masney <bmasney@redhat.com>
Reply-To: bmasney@redhat.com

The round_rate() clk ops is deprecated in the clk framework in favor
of the determine_rate() clk ops, so let's go ahead and convert the
various clk drivers using the Coccinelle semantic patch posted below.
I did a few minor cosmetic cleanups of the code in a few cases.

This series is broken up into several categories:

- Patch 1 to clk/at91/peripheral is a bug fix for a return value.

- Patch 2 to clk/at91/peripheral wasn't straight forward like the other
  drivers, so I'm explicitly calling this one out separately.

- Patch 3 adds a determine_rate() op and keeps the round_rate() in place
  since this is needed by drivers/clk/actions/owl-composite.c and keeps
  the tree bisectable. The deprecated round_rate() op is dropped in patch
  113.

- Patches 4-70 are for drivers where there is no clk submaintainer
  listed in the MAINTAINERS file. Patch 19 includes a minor fix so that
  Coccinelle can be ran against a particular source file.

- Patches 71-110 are for drivers where this is an entry in MAINTAINERS
  for the driver.

- Patches 111-114 are for drivers that implement both round_rate() and
  determine_rate(), so the round_rate() implementation is dropped.

Once all of my conversion patches across the various trees in the kernel
have been merged, I will post a small series that removes the
round_rate() op from the clk core and the documentation. Here's the
other patch series that are currently in flight that need to be merged
before we can remove round_rate() from the core.

- arm32 (3): https://lore.kernel.org/linux-clk/20250710-arm32-clk-round-rate-v1-0-a9146b77aca9@redhat.com/T/
- clk/tegra (6): https://lore.kernel.org/linux-clk/20250710-clk-tegra-round-rate-v1-0-e48ac3df4279@redhat.com/T/
- clk/ti (7): https://lore.kernel.org/linux-clk/20250811-b4-clk-ti-round-rate-v1-0-cc0840594a49@redhat.com/T/
- clocksource (1): https://lore.kernel.org/linux-clk/20250810-clocksource-round-rate-v1-1-486ef53e45eb@redhat.com/T/
- drm (9): https://lore.kernel.org/linux-clk/20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com/T/
- drm/msm (7): https://lore.kernel.org/linux-clk/20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com/T/
- i2c (1): https://lore.kernel.org/linux-clk/20250810-i2c-round-rate-v1-1-9488b57153e7@redhat.com/T/
- media (4): https://lore.kernel.org/linux-clk/20250710-media-clk-round-rate-v1-0-a9617b061741@redhat.com/T/
- mips (1): https://lore.kernel.org/linux-clk/20250810-mips-round-rate-v1-1-54e424c520dd@redhat.com/T/
- net (1): https://lore.kernel.org/linux-clk/20250810-net-round-rate-v1-1-dbb237c9fe5c@redhat.com/T/
- peci (1): https://lore.kernel.org/linux-clk/20250810-peci-round-rate-v1-1-ec96d216a455@redhat.com/T/
- phy (9): https://lore.kernel.org/linux-phy/20250810-phy-clk-round-rate-v2-0-9162470bb9f2@redhat.com/T/
- pmdomain (1): https://lore.kernel.org/linux-clk/20250810-pmdomain-round-rate-v1-1-1a90dbacdeb6@redhat.com/T/
- tty (1): https://lore.kernel.org/linux-clk/20250810-tty-round-rate-v1-1-849009f3bdfd@redhat.com/T/

Coccinelle semantic patch:

    virtual patch

    // Look up the current name of the round_rate function
    @ has_round_rate @
    identifier round_rate_name =~ ".*_round_rate";
    identifier hw_param, rate_param, parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    	...
    }

    // Rename the route_rate function name to determine_rate()
    @ script:python generate_name depends on has_round_rate @
    round_rate_name << has_round_rate.round_rate_name;
    new_name;
    @@

    coccinelle.new_name = round_rate_name.replace("_round_rate", "_determine_rate")

    // Change rate to req->rate; also change occurrences of 'return XXX'.
    @ chg_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier ERR =~ "E.*";
    expression E;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    -return -ERR;
    +return -ERR;
    |
    - return rate_param;
    + return 0;
    |
    - return E;
    + req->rate = E;
    +
    + return 0;
    |
    - rate_param
    + req->rate
    )
    ...>
    }

    // Coccinelle only transforms the first occurrence of the rate parameter
    // Run a second time. FIXME: Is there a better way to do this?
    @ chg_rate2 depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    - rate_param
    + req->rate
    ...>
    }

    // Change parent_rate to req->best_parent_rate
    @ chg_parent_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    - *parent_rate_param
    + req->best_parent_rate
    |
    - parent_rate_param
    + &req->best_parent_rate
    )
    ...>
    }

    // Convert the function definition from round_rate() to determine_rate()
    @ func_definition depends on chg_rate @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier generate_name.new_name;
    @@

    - long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
    -               unsigned long *parent_rate_param)
    + int new_name(struct clk_hw *hw, struct clk_rate_request *req)
    {
        ...
    }

    // Update the ops from round_rate() to determine_rate()
    @ ops depends on func_definition @
    identifier has_round_rate.round_rate_name;
    identifier generate_name.new_name;
    @@

    {
        ...,
    -   .round_rate = round_rate_name,
    +   .determine_rate = new_name,
        ...,
    }

Note that I used coccinelle 1.2 instead of 1.3 since the newer version
adds unnecessary braces as described in this post.
https://lore.kernel.org/cocci/67642477-5f3e-4b2a-914d-579a54f48cbd@intel.com/

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (114):
      clk: at91: peripheral: fix return value
      clk: at91: peripheral: convert from round_rate() to determine_rate()
      clk: fixed-factor: add determine_rate() ops
      clk: at91: audio-pll: convert from round_rate() to determine_rate()
      clk: at91: h32mx: convert from round_rate() to determine_rate()
      clk: at91: pll: convert from round_rate() to determine_rate()
      clk: at91: plldiv: convert from round_rate() to determine_rate()
      clk: at91: sam9x60-pll: convert from round_rate() to determine_rate()
      clk: at91: usb: convert from round_rate() to determine_rate()
      clk: baikal-t1: ccu-div: convert from round_rate() to determine_rate()
      clk: baikal-t1: ccu-pll: convert from round_rate() to determine_rate()
      clk: cdce925: convert from round_rate() to determine_rate()
      clk: cs2000-cp: convert from round_rate() to determine_rate()
      clk: ep93xx: convert from round_rate() to determine_rate()
      clk: fractional-divider: convert from round_rate() to determine_rate()
      clk: gemini: convert from round_rate() to determine_rate()
      clk: highbank: convert from round_rate() to determine_rate()
      clk: hisilicon: clkdivider-hi6220: convert from round_rate() to determine_rate()
      clk: hisilicon: hi3660-stub: move comma from declaration of DEFINE_CLK_STUB()
      clk: hisilicon: hi3660-stub: convert from round_rate() to determine_rate()
      clk: hisilicon: hi6220-stub: convert from round_rate() to determine_rate()
      clk: ingenic: cgu: convert from round_rate() to determine_rate()
      clk: ingenic: jz4780-cgu: convert from round_rate() to determine_rate()
      clk: ingenic: x1000-cgu: convert from round_rate() to determine_rate()
      clk: lmk04832: convert from round_rate() to determine_rate()
      clk: loongson1: convert from round_rate() to determine_rate()
      clk: max9485: convert from round_rate() to determine_rate()
      clk: milbeaut: convert from round_rate() to determine_rate()
      clk: mmp: audio: convert from round_rate() to determine_rate()
      clk: mmp: frac: convert from round_rate() to determine_rate()
      clk: multiplier: convert from round_rate() to determine_rate()
      clk: mxs: div: convert from round_rate() to determine_rate()
      clk: mxs: frac: convert from round_rate() to determine_rate()
      clk: mxs: ref: convert from round_rate() to determine_rate()
      clk: nuvoton: ma35d1-divider: convert from round_rate() to determine_rate()
      clk: nuvoton: ma35d1-pll: convert from round_rate() to determine_rate()
      clk: nxp: lpc18xx-cgu: convert from round_rate() to determine_rate()
      clk: nxp: lpc32xx: convert from round_rate() to determine_rate()
      clk: pistachio: pll: convert from round_rate() to determine_rate()
      clk: scpi: convert from round_rate() to determine_rate()
      clk: si514: convert from round_rate() to determine_rate()
      clk: si521xx: convert from round_rate() to determine_rate()
      clk: si5341: convert from round_rate() to determine_rate()
      clk: si544: convert from round_rate() to determine_rate()
      clk: si570: convert from round_rate() to determine_rate()
      clk: sifive: sifive-prci: convert from round_rate() to determine_rate()
      clk: sophgo: cv18xx-ip: convert from round_rate() to determine_rate()
      clk: sophgo: sg2042-clkgen: convert from round_rate() to determine_rate()
      clk: spacemit: ccu_ddn: convert from round_rate() to determine_rate()
      clk: spacemit: ccu_mix: convert from round_rate() to determine_rate()
      clk: spacemit: ccu_pll: convert from round_rate() to determine_rate()
      clk: sparx5: convert from round_rate() to determine_rate()
      clk: sprd: div: convert from round_rate() to determine_rate()
      clk: sprd: pll: convert from round_rate() to determine_rate()
      clk: st: clkgen-fsyn: convert from round_rate() to determine_rate()
      clk: st: clkgen-pll: convert from round_rate() to determine_rate()
      clk: stm32f4: convert from round_rate() to determine_rate()
      clk: stm32: stm32-core: convert from round_rate() to determine_rate()
      clk: stm32: stm32mp1: convert from round_rate() to determine_rate()
      clk: tps68470: convert from round_rate() to determine_rate()
      clk: versaclock3: convert from round_rate() to determine_rate()
      clk: vt8500: convert from round_rate() to determine_rate()
      clk: wm831x: convert from round_rate() to determine_rate()
      clk: x86: cgu: convert from round_rate() to determine_rate()
      clk: xgene: convert from round_rate() to determine_rate()
      clk: xilinx: xlnx-clock-wizard: convert from round_rate() to determine_rate()
      clk: xilinx: xlnx_vcu: convert from round_rate() to determine_rate()
      clk: zynqmp: divider: convert from round_rate() to determine_rate()
      clk: zynqmp: pll: convert from round_rate() to determine_rate()
      clk: zynq: pll: convert from round_rate() to determine_rate()
      clk: actions: owl-composite: convert from round_rate() to determine_rate()
      clk: actions: owl-divider: convert from round_rate() to determine_rate()
      clk: actions: owl-factor: convert from round_rate() to determine_rate()
      clk: actions: owl-pll: convert from round_rate() to determine_rate()
      clk: apple-nco: convert from round_rate() to determine_rate()
      clk: axs10x: i2s_pll_clock: convert from round_rate() to determine_rate()
      clk: axs10x: pll_clock: convert from round_rate() to determine_rate()
      clk: bcm: iproc-asiu: convert from round_rate() to determine_rate()
      clk: bm1880: convert from round_rate() to determine_rate()
      clk: cdce706: convert from round_rate() to determine_rate()
      clk: hsdk-pll: convert from round_rate() to determine_rate()
      clk: mediatek: pll: convert from round_rate() to determine_rate()
      clk: microchip: core: convert from round_rate() to determine_rate()
      clk: mstar: msc313-cpupll: convert from round_rate() to determine_rate()
      clk: mvebu: ap-cpu-clk: convert from round_rate() to determine_rate()
      clk: mvebu: armada-37xx-periph: convert from round_rate() to determine_rate()
      clk: mvebu: corediv: convert from round_rate() to determine_rate()
      clk: mvebu: cpu: convert from round_rate() to determine_rate()
      clk: mvebu: dove-divider: convert from round_rate() to determine_rate()
      clk: qcom: alpha-pll: convert from round_rate() to determine_rate()
      clk: qcom: regmap-divider: convert from round_rate() to determine_rate()
      clk: renesas: rzg2l-cpg: convert from round_rate() to determine_rate()
      clk: renesas: rzv2h-cpg: remove round_rate() in favor of determine_rate()
      clk: rockchip: ddr: convert from round_rate() to determine_rate()
      clk: rockchip: half-divider: convert from round_rate() to determine_rate()
      clk: rockchip: pll: convert from round_rate() to determine_rate()
      clk: rp1: convert from round_rate() to determine_rate()
      clk: samsung: cpu: convert from round_rate() to determine_rate()
      clk: samsung: pll: convert from round_rate() to determine_rate()
      clk: sp7021: convert from round_rate() to determine_rate()
      clk: spear: aux-synth: convert from round_rate() to determine_rate()
      clk: spear: frac-synth: convert from round_rate() to determine_rate()
      clk: spear: gpt-synth: convert from round_rate() to determine_rate()
      clk: spear: vco-pll: convert from round_rate() to determine_rate()
      clk: ux500: prcmu: convert from round_rate() to determine_rate()
      clk: versaclock5: convert from round_rate() to determine_rate()
      clk: versaclock7: convert from round_rate() to determine_rate()
      clk: versatile: icst: convert from round_rate() to determine_rate()
      clk: versatile: vexpress-osc: convert from round_rate() to determine_rate()
      clk: visconti: pll: convert from round_rate() to determine_rate()
      clk: divider: remove round_rate() in favor of determine_rate()
      clk: scmi: remove round_rate() in favor of determine_rate()
      clk: sophgo: sg2042-pll: remove round_rate() in favor of determine_rate()
      clk: fixed-factor: drop round_rate() clk ops

 drivers/clk/actions/owl-composite.c        |   8 +-
 drivers/clk/actions/owl-divider.c          |  13 +--
 drivers/clk/actions/owl-factor.c           |  12 +--
 drivers/clk/actions/owl-pll.c              |  25 ++++--
 drivers/clk/at91/clk-audio-pll.c           |  42 +++++----
 drivers/clk/at91/clk-h32mx.c               |  33 ++++---
 drivers/clk/at91/clk-peripheral.c          |  48 ++++++----
 drivers/clk/at91/clk-pll.c                 |  12 +--
 drivers/clk/at91/clk-plldiv.c              |  34 +++++---
 drivers/clk/at91/clk-sam9x60-pll.c         |  29 +++---
 drivers/clk/at91/clk-usb.c                 |  20 +++--
 drivers/clk/axs10x/i2s_pll_clock.c         |  14 +--
 drivers/clk/axs10x/pll_clock.c             |  12 +--
 drivers/clk/baikal-t1/ccu-div.c            |  27 +++---
 drivers/clk/baikal-t1/ccu-pll.c            |  14 +--
 drivers/clk/bcm/clk-iproc-asiu.c           |  25 +++---
 drivers/clk/clk-apple-nco.c                |  14 +--
 drivers/clk/clk-bm1880.c                   |  21 +++--
 drivers/clk/clk-cdce706.c                  |  16 ++--
 drivers/clk/clk-cdce925.c                  |  50 ++++++-----
 drivers/clk/clk-cs2000-cp.c                |  14 +--
 drivers/clk/clk-divider.c                  |  23 -----
 drivers/clk/clk-ep93xx.c                   |  18 ++--
 drivers/clk/clk-fixed-factor.c             |  16 ++--
 drivers/clk/clk-fractional-divider.c       |  25 ++++--
 drivers/clk/clk-gemini.c                   |  15 ++--
 drivers/clk/clk-highbank.c                 |  26 +++---
 drivers/clk/clk-hsdk-pll.c                 |  12 +--
 drivers/clk/clk-lmk04832.c                 |  53 ++++++-----
 drivers/clk/clk-loongson1.c                |  12 +--
 drivers/clk/clk-max9485.c                  |  27 +++---
 drivers/clk/clk-milbeaut.c                 |  22 +++--
 drivers/clk/clk-multiplier.c               |  12 +--
 drivers/clk/clk-rp1.c                      |  45 ++++++----
 drivers/clk/clk-scmi.c                     |  30 -------
 drivers/clk/clk-scpi.c                     |  18 ++--
 drivers/clk/clk-si514.c                    |  24 +++--
 drivers/clk/clk-si521xx.c                  |  14 +--
 drivers/clk/clk-si5341.c                   |  22 +++--
 drivers/clk/clk-si544.c                    |  10 +--
 drivers/clk/clk-si570.c                    |  24 +++--
 drivers/clk/clk-sp7021.c                   |  22 ++---
 drivers/clk/clk-sparx5.c                   |  10 ++-
 drivers/clk/clk-stm32f4.c                  |  26 +++---
 drivers/clk/clk-tps68470.c                 |  12 +--
 drivers/clk/clk-versaclock3.c              |  70 +++++++++------
 drivers/clk/clk-versaclock5.c              |  71 ++++++++-------
 drivers/clk/clk-versaclock7.c              |  30 ++++---
 drivers/clk/clk-vt8500.c                   |  59 ++++++++-----
 drivers/clk/clk-wm831x.c                   |  14 +--
 drivers/clk/clk-xgene.c                    |  41 +++++----
 drivers/clk/hisilicon/clk-hi3660-stub.c    |  18 ++--
 drivers/clk/hisilicon/clk-hi6220-stub.c    |  12 +--
 drivers/clk/hisilicon/clkdivider-hi6220.c  |  12 +--
 drivers/clk/ingenic/cgu.c                  |  12 +--
 drivers/clk/ingenic/jz4780-cgu.c           |  24 ++---
 drivers/clk/ingenic/x1000-cgu.c            |  19 ++--
 drivers/clk/mediatek/clk-pll.c             |  13 +--
 drivers/clk/mediatek/clk-pll.h             |   3 +-
 drivers/clk/mediatek/clk-pllfh.c           |   2 +-
 drivers/clk/microchip/clk-core.c           |  44 ++++++----
 drivers/clk/mmp/clk-audio.c                |  18 ++--
 drivers/clk/mmp/clk-frac.c                 |  27 +++---
 drivers/clk/mstar/clk-msc313-cpupll.c      |  18 ++--
 drivers/clk/mvebu/ap-cpu-clk.c             |  12 +--
 drivers/clk/mvebu/armada-37xx-periph.c     |  15 ++--
 drivers/clk/mvebu/clk-corediv.c            |  18 ++--
 drivers/clk/mvebu/clk-cpu.c                |  12 +--
 drivers/clk/mvebu/dove-divider.c           |  16 ++--
 drivers/clk/mxs/clk-div.c                  |   8 +-
 drivers/clk/mxs/clk-frac.c                 |  16 ++--
 drivers/clk/mxs/clk-ref.c                  |  16 ++--
 drivers/clk/nuvoton/clk-ma35d1-divider.c   |  12 ++-
 drivers/clk/nuvoton/clk-ma35d1-pll.c       |  28 +++---
 drivers/clk/nxp/clk-lpc18xx-cgu.c          |  16 ++--
 drivers/clk/nxp/clk-lpc32xx.c              |  59 +++++++------
 drivers/clk/pistachio/clk-pll.c            |  20 +++--
 drivers/clk/qcom/clk-alpha-pll.c           | 136 ++++++++++++++++-------------
 drivers/clk/qcom/clk-regmap-divider.c      |  27 +++---
 drivers/clk/renesas/rzg2l-cpg.c            |   9 +-
 drivers/clk/renesas/rzv2h-cpg.c            |  10 ---
 drivers/clk/rockchip/clk-ddr.c             |  13 +--
 drivers/clk/rockchip/clk-half-divider.c    |  12 +--
 drivers/clk/rockchip/clk-pll.c             |  23 +++--
 drivers/clk/samsung/clk-cpu.c              |  12 +--
 drivers/clk/samsung/clk-pll.c              |  33 ++++---
 drivers/clk/sifive/fu540-prci.h            |   2 +-
 drivers/clk/sifive/fu740-prci.h            |   2 +-
 drivers/clk/sifive/sifive-prci.c           |  11 +--
 drivers/clk/sifive/sifive-prci.h           |   4 +-
 drivers/clk/sophgo/clk-cv18xx-ip.c         |  10 ++-
 drivers/clk/sophgo/clk-sg2042-clkgen.c     |  17 ++--
 drivers/clk/sophgo/clk-sg2042-pll.c        |  24 ++---
 drivers/clk/spacemit/ccu_ddn.c             |  11 ++-
 drivers/clk/spacemit/ccu_mix.c             |  12 +--
 drivers/clk/spacemit/ccu_pll.c             |  10 ++-
 drivers/clk/spear/clk-aux-synth.c          |  12 +--
 drivers/clk/spear/clk-frac-synth.c         |  12 +--
 drivers/clk/spear/clk-gpt-synth.c          |  12 +--
 drivers/clk/spear/clk-vco-pll.c            |  23 +++--
 drivers/clk/sprd/div.c                     |  13 +--
 drivers/clk/sprd/pll.c                     |   8 +-
 drivers/clk/st/clkgen-fsyn.c               |  33 +++----
 drivers/clk/st/clkgen-pll.c                |  38 ++++----
 drivers/clk/stm32/clk-stm32-core.c         |  28 +++---
 drivers/clk/stm32/clk-stm32mp1.c           |  13 +--
 drivers/clk/ux500/clk-prcmu.c              |  14 +--
 drivers/clk/versatile/clk-icst.c           |  72 +++++++++------
 drivers/clk/versatile/clk-vexpress-osc.c   |  16 ++--
 drivers/clk/visconti/pll.c                 |  17 ++--
 drivers/clk/x86/clk-cgu.c                  |  35 ++++----
 drivers/clk/xilinx/clk-xlnx-clock-wizard.c |  55 ++++++------
 drivers/clk/xilinx/xlnx_vcu.c              |  15 ++--
 drivers/clk/zynq/pll.c                     |  12 +--
 drivers/clk/zynqmp/divider.c               |  23 ++---
 drivers/clk/zynqmp/pll.c                   |  24 ++---
 116 files changed, 1477 insertions(+), 1132 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250729-clk-for-stephen-round-rate-5a88ebdf8da6

Best regards,
-- 
Brian Masney <bmasney@redhat.com>



