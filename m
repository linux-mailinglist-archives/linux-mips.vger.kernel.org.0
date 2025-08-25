Return-Path: <linux-mips+bounces-10577-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CE8B3458E
	for <lists+linux-mips@lfdr.de>; Mon, 25 Aug 2025 17:20:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A1553AC987
	for <lists+linux-mips@lfdr.de>; Mon, 25 Aug 2025 15:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2535B2FFDCE;
	Mon, 25 Aug 2025 15:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="LVBNi+Im";
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="IrRd//3z"
X-Original-To: linux-mips@vger.kernel.org
Received: from bayard.4d2.org (bayard.4d2.org [155.254.16.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856542FF164;
	Mon, 25 Aug 2025 15:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=155.254.16.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756135158; cv=none; b=nCShYWCiu37k/2TMwSY+wYSyucx1IXCjcRXmqCR+kdhJfeeITqhsfc7InjBnJMfn6cz0YIDaJQPHf4lTlW2n/8/+CDHF8XgHfe3TTXTaeTSFztxlKq0TObd6y8w2nPFUFhqjjUIsfqOZVKcykfy96i4KVmbFz8lX4NkC+Yb2P5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756135158; c=relaxed/simple;
	bh=sMV/r13xaDCOGwclCYrCYPx8JsEJQfAVbK0WWd0PfCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aSrP1pLffttyePFt9/j7htou0dacIfkjpFtYGvo3/8EEX/M4hyMzFX/zvh3FGZ1z/XIulK4ArzW8vS/wjXAdFxejmI8qnpPkUW8I235BLAosr9nUR28MEZXrwFeWthFMEDha+iDvEElMavH+M2azZNemfnizauyAMy2QuJwAdZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org; spf=pass smtp.mailfrom=4d2.org; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=LVBNi+Im; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=IrRd//3z; arc=none smtp.client-ip=155.254.16.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=4d2.org
Received: from localhost (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 0609712FB9EB;
	Mon, 25 Aug 2025 08:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1756135155; bh=sMV/r13xaDCOGwclCYrCYPx8JsEJQfAVbK0WWd0PfCk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LVBNi+Im+aE9A0i5lAqxDVbL8nde7dQ0kJ1y4RfcnGxgXlSKWf5ABjkDhp66hQl4E
	 L/Ihmrybt8QmU3CGGxWCaYDVeSHEOXcjwruSHd0yVxhsRSK1pxH2DDx5xY1T3yL+P8
	 KaZ9N+IIVMAR8E2Cry7XdVzoLg1tCN/l1nYOB5MI9nCGcFhHmgYBaHQmPo/93JZoDV
	 1qTluZsjJdXrXS+2FheIvSlos9kKnFD7uEAUD6nwGo98yhV1IYFJ82xS50RbstuKWI
	 N3HuH3hJt010tYYMf/yeJRsg9CenroFQ5av1pu/eXHgvpLL79MvnRdysDZix0+7tzo
	 WBtEFY4C7ccLg==
X-Virus-Scanned: amavis at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by localhost (bayard.4d2.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yrx7ihXHFQrb; Mon, 25 Aug 2025 08:19:13 -0700 (PDT)
Received: from ketchup (unknown [117.171.64.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 10EB112FB435;
	Mon, 25 Aug 2025 08:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1756135108; bh=sMV/r13xaDCOGwclCYrCYPx8JsEJQfAVbK0WWd0PfCk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IrRd//3zvi/Xe7ZKmGPCo0Qo7oL9twAQW4yP6V/ajKSU8jvufzcK3JPGF+z+hZcKm
	 ++Q94D6SultYJ8lvWKyvCXegESPdKdtWJCcSNJVGKuwpMn/Y3z1PKJpukDw/lbK7Xh
	 LyNsb7Y4uYafp9bd+7+uP7BGV0kjsTtGI2o10xvfd96VVsD/6yBjBpZiFtcbmG/aQS
	 zX51QF6IrHFZs4FrUQ43w42nbzhmzMZvH/XhjtqG6Ul26kuNYr7VuowAkaH81wardA
	 R8K/dmy27Idr7nhcOCjaf80CTfywcJywGfHO700ptNzCL20BRirZ1y0kyWmO/5qYz5
	 8f+DJCtT1p1lw==
Date: Mon, 25 Aug 2025 15:18:04 +0000
From: Haylen Chu <heylenay@4d2.org>
To: bmasney@redhat.com, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Paul Cercueil <paul@crapouillou.net>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Yixun Lan <dlan@gentoo.org>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com, Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Michal Simek <michal.simek@amd.com>,
	Maxime Ripard <mripard@kernel.org>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrea della Porta <andrea.porta@suse.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Qin Jian <qinjian@cqplus1.com>, Viresh Kumar <vireshk@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Alex Helms <alexander.helms.jy@renesas.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	sophgo@lists.linux.dev, linux-mips@vger.kernel.org,
	imx@lists.linux.dev, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
	patches@opensource.cirrus.com, linux-actions@lists.infradead.org,
	asahi@lists.linux.dev, linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev
Subject: Re: [PATCH 050/114] clk: spacemit: ccu_mix: convert from
 round_rate() to determine_rate()
Message-ID: <aKx-rDkmp5V-RVjZ@ketchup>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-50-b3bf97b038dc@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-50-b3bf97b038dc@redhat.com>

On Mon, Aug 11, 2025 at 11:18:42AM -0400, Brian Masney via B4 Relay wrote:
> From: Brian Masney <bmasney@redhat.com>
> 
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/clk/spacemit/ccu_mix.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)

Reviewed-by: Haylen Chu <heylenay@4d2.org>

