Return-Path: <linux-mips+bounces-10180-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB8CB2112F
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 18:12:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5EB4E18A0B1D
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 16:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACC792E54CE;
	Mon, 11 Aug 2025 16:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MyiP+pGK"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF3F2E54BA;
	Mon, 11 Aug 2025 16:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754928063; cv=none; b=ZlepQsCnNHdekX2OFdvRUa0qK4smVfld6C1UCABGM8xhPN0oyUoeMT4ZOXg7eFoagE45NOIxK5MJk9OOQ3A5m7Rs7g3OFuRAS44fA9x1EKWpAcGvoMFn3auiXV9hcxcgmLvE9eprJOgShYmGYoyCIXKfS3k68t1Tmd1XhhZ8imk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754928063; c=relaxed/simple;
	bh=Mt5Z9iaxEJqunSSWFhe3foZePTxEE32AzKMZx3Qr8RQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IdmCN5O2ghxDAYE2RCr3Q5lM49+T9HxG4kntuYayz4bWR2INTKwIdiQIH6/TrG/MRIYwHAdGZb35cZRuWXbgYlRd5WIv478L8pamFPjUOJMf06HM5xR9zReD+ap30NmASpSn8SB6Euy4KJZRNfBUTQaevmQZDV/2Pz+Q/GwmOjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MyiP+pGK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16A6AC4CEED;
	Mon, 11 Aug 2025 16:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754928062;
	bh=Mt5Z9iaxEJqunSSWFhe3foZePTxEE32AzKMZx3Qr8RQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MyiP+pGKfJHAHSCkg/AuFQl20aYOw9VY+sW09ZDqrRnXl3qhO6kW3xwjReBD5Z32U
	 rc5u4QiD9di8rs5Y26pPKqgz3ObtPPTdetcOMRnY4L3JBnCvV8biR9qNn6DSikeOF7
	 VhE5sUJSpEKSYYri6ra4/Vt6YfnG4ukgWhyQSV/dITF7k1RhjSrtVsfcRLEij9Eys6
	 q9OGM68dgjgR0McTiVcrG5fpKLeSFSRz3ApxW9cooonoB2N5qjQ2mVUArcBqG3wBQ8
	 ehA3INw6J09SgYdPezVfIC1CQjP1rhvwV1/tDG6KwuSpPtIw0jol1Ml6Et91NjCKhR
	 E8uC2ag7Nqdxw==
Date: Mon, 11 Aug 2025 21:30:30 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: bmasney@redhat.com
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Paul Cercueil <paul@crapouillou.net>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Taichi Sugaya <sugaya.taichi@socionext.com>, Takao Orito <orito.takao@socionext.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Michal Simek <michal.simek@amd.com>, Maxime Ripard <mripard@kernel.org>, 
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Daniel Palmer <daniel@thingy.jp>, 
	Romain Perier <romain.perier@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Heiko Stuebner <heiko@sntech.de>, Andrea della Porta <andrea.porta@suse.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Qin Jian <qinjian@cqplus1.com>, Viresh Kumar <vireshk@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Alex Helms <alexander.helms.jy@renesas.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, sophgo@lists.linux.dev, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	patches@opensource.cirrus.com, linux-actions@lists.infradead.org, asahi@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev
Subject: Re: [PATCH 000/114] clk: convert drivers from deprecated
 round_rate() to determine_rate()
Message-ID: <3rhp73jjlpcoutaj56pjhrjtjxugf2nghiygax6s3n47biwfr7@pdk5zorat5dh>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>

On Mon, Aug 11, 2025 at 11:17:52AM GMT, Brian Masney via B4 Relay wrote:
> The round_rate() clk ops is deprecated in the clk framework in favor
> of the determine_rate() clk ops, so let's go ahead and convert the
> various clk drivers using the Coccinelle semantic patch posted below.
> I did a few minor cosmetic cleanups of the code in a few cases.
> 
> This series is broken up into several categories:
> 
> - Patch 1 to clk/at91/peripheral is a bug fix for a return value.
> 
> - Patch 2 to clk/at91/peripheral wasn't straight forward like the other
>   drivers, so I'm explicitly calling this one out separately.
> 
> - Patch 3 adds a determine_rate() op and keeps the round_rate() in place
>   since this is needed by drivers/clk/actions/owl-composite.c and keeps
>   the tree bisectable. The deprecated round_rate() op is dropped in patch
>   113.
> 
> - Patches 4-70 are for drivers where there is no clk submaintainer
>   listed in the MAINTAINERS file. Patch 19 includes a minor fix so that
>   Coccinelle can be ran against a particular source file.
> 
> - Patches 71-110 are for drivers where this is an entry in MAINTAINERS
>   for the driver.
> 
> - Patches 111-114 are for drivers that implement both round_rate() and
>   determine_rate(), so the round_rate() implementation is dropped.
> 
> Once all of my conversion patches across the various trees in the kernel
> have been merged, I will post a small series that removes the
> round_rate() op from the clk core and the documentation. Here's the
> other patch series that are currently in flight that need to be merged
> before we can remove round_rate() from the core.
> 

Please do not CC all reviewers/maintainers of individual clock controller
drivers to all patches, but only to the respective clock controller patches.
It just spams our inbox. CCing all of us in the cover letter is fine though.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

