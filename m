Return-Path: <linux-mips+bounces-10578-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BD9B345A1
	for <lists+linux-mips@lfdr.de>; Mon, 25 Aug 2025 17:22:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7A8207B031D
	for <lists+linux-mips@lfdr.de>; Mon, 25 Aug 2025 15:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77E792FF670;
	Mon, 25 Aug 2025 15:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="VUpZlwhP";
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="duEdRiVj"
X-Original-To: linux-mips@vger.kernel.org
Received: from bayard.4d2.org (bayard.4d2.org [155.254.16.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4DD2FE07F;
	Mon, 25 Aug 2025 15:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=155.254.16.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756135167; cv=none; b=RlJTa6kbztsIu7ZuKxq1qiA+L5iXtMpFjSKqY8Dv0dE4ZV788t+E7P+HZRtr2pL7jussmm8f6XK0U5ObQjiUQCd7RhMrX/AZvbyewlIf95bRr3I0m7bxxdyuSRhcmsUIX16BazCbuu6GMnO83NAuSHnZERrIbtcmj1hojbU/9B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756135167; c=relaxed/simple;
	bh=A7Ok+6x0nz7G/NXQZolAaahGwavoIJocShJSVNv4IUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GLCaCRhPR0Y7QayP6YqnkJKSxc0V/zRFW77IGmVcxEwz6jADkL4fjvDGcfAn+we7Cin+l+FQHe+JDkkj3R83JcMskwXkSP6aBS7/3NGP0MEwXonFQOYSK/ADyMZSLqWLa9V84jNZNXvf+aXjIlOeTzs9LCgw9JQf622nkYi99cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org; spf=pass smtp.mailfrom=4d2.org; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=VUpZlwhP; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=duEdRiVj; arc=none smtp.client-ip=155.254.16.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=4d2.org
Received: from localhost (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 754A512FB9E1;
	Mon, 25 Aug 2025 08:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1756135165; bh=A7Ok+6x0nz7G/NXQZolAaahGwavoIJocShJSVNv4IUY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VUpZlwhPxWL3ebw/nnirosxs3Rjd5L7t/60O/HEV9YxrNt2siHqrlZaZDter3XKN8
	 PsYY/F+uuzOxMUIrMLBnzxR2QSneGnJk3Mzpjtjkmr2fNqiymcDPhdiYuRWqL4Ne7k
	 Khi1pAOAQp1g6nHWSv6Qmp2sfIx+7NpAN0IBLMTPHCIWRkkKbZnJAKboONlp8zNsaH
	 UJj/PiwGVbX5uQ74V1aqDseWL5Z+FWFENTfXDe5Sg/K82P6tNRrlpd+cPN9H4oudfz
	 2rDKHuXmgj/vzunHquSVHpf1HL4WLRMLz47qThVFat1+9OveTtQQKe7f77Ne+L/Nw2
	 7EUZh/J1K+4yg==
X-Virus-Scanned: amavis at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by localhost (bayard.4d2.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 98egf3YSLU1r; Mon, 25 Aug 2025 08:19:24 -0700 (PDT)
Received: from ketchup (unknown [117.171.64.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 41E5A12FB9E3;
	Mon, 25 Aug 2025 08:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1756135163; bh=A7Ok+6x0nz7G/NXQZolAaahGwavoIJocShJSVNv4IUY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=duEdRiVjwA2Ug0kAQ3mge4pcWDsoESpJ80SNf7IVWNzZZRpvm9evWQaowfkmCkZ+a
	 oQWfjuZ+IzKzxlNrb09/4ZRdSpGOXBG+6YisKkS1cb/wksihSBhCJJk+lYXYFU6oxF
	 QU4EAvZTzJ1PC9QsR6agnYj/+z7cC1L7x2Cd1zufggZRqATeTKyn2StZ/7c8atpREJ
	 w5ronVaZKmRKyj14LxpKmy7ZO75UbpRAqllX4O/IomGBw8vJLF87Rs4pk9IwW+zy2D
	 NLRc9ZoreAMYv1VcszhcTWaeSAmCBma/XwUAUK2WeCTsX+8xnzC7csZqc2FKwbuYL/
	 P0JKnwjGbGeJg==
Date: Mon, 25 Aug 2025 15:18:57 +0000
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
Subject: Re: [PATCH 051/114] clk: spacemit: ccu_pll: convert from
 round_rate() to determine_rate()
Message-ID: <aKx-4bkkOeVi7j82@ketchup>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-51-b3bf97b038dc@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-51-b3bf97b038dc@redhat.com>

On Mon, Aug 11, 2025 at 11:18:43AM -0400, Brian Masney via B4 Relay wrote:
> From: Brian Masney <bmasney@redhat.com>
> 
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/clk/spacemit/ccu_pll.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

Reviewed-by: Haylen Chu <heylenay@4d2.org>

