Return-Path: <linux-mips+bounces-10531-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8AEB339C7
	for <lists+linux-mips@lfdr.de>; Mon, 25 Aug 2025 10:44:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8BF83B9957
	for <lists+linux-mips@lfdr.de>; Mon, 25 Aug 2025 08:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEF552D0C6C;
	Mon, 25 Aug 2025 08:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gc94G2p0"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A787A2D0626;
	Mon, 25 Aug 2025 08:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756111298; cv=none; b=k6OVyQ3xQ+YRvllbFq8HtzBlxNy/hU1elnYi+iOEBhWZDy5jxlmZYMwSqL+xKp7k2Z3u1nw/LVajH6Qf015iAhdciEsYB71+bq6yd7HdgyxSxOYeYHiwoi5bP1jWjVFZ7nkFVRZK1kBSS13i3/aOT9Y755ZgtAx4/h8/OvjkbGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756111298; c=relaxed/simple;
	bh=QBpsTTorkc4pTkqdyLYFQrl7G/3d/UIHjKHmGDhjvh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=os/uEZq/hCt4NHbRVpLtcRO2oCrqIdcZSarRsZGQY+OAKotvcnLhPN1rCbGXyZxUCSVVOTKgCCV0yTDW9jwJVlCgQYk3OeINMCr6ku0ep1Urk3auIRdP5uvonEAietL2EI6r/Sg/GTSpqWH2s0CWet0v4YM0bAIwG+RiQM1lGLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gc94G2p0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86D14C116B1;
	Mon, 25 Aug 2025 08:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756111298;
	bh=QBpsTTorkc4pTkqdyLYFQrl7G/3d/UIHjKHmGDhjvh8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gc94G2p0qbx0jlafND6WSRRDnjNbakv8JEjLETlT1wvutg3+AKWAm9shTWfHSh9nH
	 T3texahUXyK7O2oESbwoBQBkFFAJ3KFnYqMT+ZeGTLrgd0yWOnXXMJNOOub9b6eZI4
	 JrKqx6X1NQNrc11YZTMBuP3PvLEcW0W2sbbEeCdQbPszV7fGgdNErXWZKIKoECTuXj
	 JAjAzrvziLXDJ4eGJMeZFJR8kqTAzP5Crlc95tXJwtxy5c+mIbpcVZc0GjmMuNWbUV
	 NQjvrL/A+++kZ/GkL8H/vC77AZONQxtF8wgd/bwy1pjDXOppGKbfgT+fCUOjE0Ahlx
	 OMRZXPhsipZpg==
Date: Mon, 25 Aug 2025 16:41:35 +0800
From: Yixun Lan <dlan@kernel.org>
To: bmasney@redhat.com
Cc: Michael Turquette <mturquette@baylibre.com>,
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
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
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
Message-ID: <20250825084135-GYC1096417@kernel.org>
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

Hi Brian,

On 11:18 Mon 11 Aug     , Brian Masney via B4 Relay wrote:
> From: Brian Masney <bmasney@redhat.com>
> 
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Yixun Lan <dlan@kernel.org>
> ---
>  drivers/clk/spacemit/ccu_pll.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/spacemit/ccu_pll.c b/drivers/clk/spacemit/ccu_pll.c
> index 45f540073a656c0edc341a903acc3f2405971fc9..d92f0dae65a490e9db52f25a538a518baa487ea8 100644
> --- a/drivers/clk/spacemit/ccu_pll.c
> +++ b/drivers/clk/spacemit/ccu_pll.c
> @@ -125,12 +125,14 @@ static unsigned long ccu_pll_recalc_rate(struct clk_hw *hw,
>  	return entry ? entry->rate : 0;
>  }
>  
> -static long ccu_pll_round_rate(struct clk_hw *hw, unsigned long rate,
> -			       unsigned long *prate)
> +static int ccu_pll_determine_rate(struct clk_hw *hw,
> +				  struct clk_rate_request *req)
>  {
>  	struct ccu_pll *pll = hw_to_ccu_pll(hw);
>  
> -	return ccu_pll_lookup_best_rate(pll, rate)->rate;
> +	req->rate = ccu_pll_lookup_best_rate(pll, req->rate)->rate;
> +
> +	return 0;
>  }
>  
>  static int ccu_pll_init(struct clk_hw *hw)
> @@ -152,6 +154,6 @@ const struct clk_ops spacemit_ccu_pll_ops = {
>  	.disable	= ccu_pll_disable,
>  	.set_rate	= ccu_pll_set_rate,
>  	.recalc_rate	= ccu_pll_recalc_rate,
> -	.round_rate	= ccu_pll_round_rate,
> +	.determine_rate = ccu_pll_determine_rate,
>  	.is_enabled	= ccu_pll_is_enabled,
>  };
> 
> -- 
> 2.50.1
> 
> 

-- 
Yixun Lan (dlan)

