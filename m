Return-Path: <linux-mips+bounces-10239-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDD1B22BDC
	for <lists+linux-mips@lfdr.de>; Tue, 12 Aug 2025 17:39:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6ABC9426C64
	for <lists+linux-mips@lfdr.de>; Tue, 12 Aug 2025 15:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8634C2F5481;
	Tue, 12 Aug 2025 15:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LiZpRdpD"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB6D10E3;
	Tue, 12 Aug 2025 15:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755013154; cv=none; b=ntMjPdejpXvBHRb9CgK+nrv+aUsAXRWGjH7qVbwjRpqsS21NJVa78OlUT2hBGNj/8stVyZJQlhHh67pzP043piPR3frKBNaLxgQy8zIqd/tYbBrZrXA7vBqmpomBZM0FDExUTUGTehlUp5vRw4i/frx4+gZVOjNIAprxqm1XXEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755013154; c=relaxed/simple;
	bh=iGUpF1C71k7qo9/61ohvQv5Z7z5laJQcZjUsXmHz/vc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pt2CUML2WU0StiS8ogpgc9qfX0Fd/ncK9vppdttRzoQukRSvb7erxtgeupniJ7J5n+H4uJR8jsDmdpV8YMTg9LjtINh59L1whArUysy/XEc7lyMv5Qlc1aOTzJgC4qH8kuc7ZXV3K5wLw7Eijh/hITeBCEuRwr8eYH6LzSrR5vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LiZpRdpD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 284FDC4CEF0;
	Tue, 12 Aug 2025 15:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755013153;
	bh=iGUpF1C71k7qo9/61ohvQv5Z7z5laJQcZjUsXmHz/vc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LiZpRdpDhra8HQLi6oTJvzINkJJSuv23n4QKhmL0GdIDFfOjMCDM1OqYhcWHHq3TI
	 L28O5b3iPN5wVc9EXSMe1wiMP/NajukL3ql7pF4a85lv1fNAUZsV+TlMAAvN2rrzmr
	 wRMnMSseO6nd8/EPTJY79HOmJ9zeY5vY0LS0u24hUa3icUGD8uDqDLMHMPTvWLEQv1
	 l7Tw7lcXGU5Rs7ZD4eklupowdOLUecuU8uOFa6RlUoRtZfGlD+/8Ge0Ca3RaSQaoYZ
	 h2ClWJH1Q8I12fZ++utjNSDaO59Bx51zYgkj3Rxo8YY8S6cPtFbxYBa0hRIu+GN5Me
	 k5jWalHFpopnQ==
Date: Tue, 12 Aug 2025 21:08:28 +0530
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
Subject: Re: [PATCH 079/114] clk: bm1880: convert from round_rate() to
 determine_rate()
Message-ID: <tcl4eqicuqcptnbo4mcvjhacxkh2gh344k2bdrwfjbqflxspy7@x24np6pxjacf>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-79-b3bf97b038dc@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-79-b3bf97b038dc@redhat.com>

On Mon, Aug 11, 2025 at 11:19:11AM GMT, Brian Masney via B4 Relay wrote:
> From: Brian Masney <bmasney@redhat.com>
> 
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 

Once this patch gets merged, the 'Coccinelle semantic patch on the cover letter
of this series' becomes irrelevant. I'd suggest to either include the script
here or do not mention it at all.

- Mani

> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/clk/clk-bm1880.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/clk/clk-bm1880.c b/drivers/clk/clk-bm1880.c
> index 002f7360b1c6c6e3058606a0808115b48fd3147a..dac190bc6e19a6dd4be413ea52d41f74934a1aa9 100644
> --- a/drivers/clk/clk-bm1880.c
> +++ b/drivers/clk/clk-bm1880.c
> @@ -608,8 +608,8 @@ static unsigned long bm1880_clk_div_recalc_rate(struct clk_hw *hw,
>  	return rate;
>  }
>  
> -static long bm1880_clk_div_round_rate(struct clk_hw *hw, unsigned long rate,
> -				      unsigned long *prate)
> +static int bm1880_clk_div_determine_rate(struct clk_hw *hw,
> +					 struct clk_rate_request *req)
>  {
>  	struct bm1880_div_hw_clock *div_hw = to_bm1880_div_clk(hw);
>  	struct bm1880_div_clock *div = &div_hw->div;
> @@ -621,13 +621,18 @@ static long bm1880_clk_div_round_rate(struct clk_hw *hw, unsigned long rate,
>  		val = readl(reg_addr) >> div->shift;
>  		val &= clk_div_mask(div->width);
>  
> -		return divider_ro_round_rate(hw, rate, prate, div->table,
> -					     div->width, div->flags,
> -					     val);
> +		req->rate = divider_ro_round_rate(hw, req->rate,
> +						  &req->best_parent_rate,
> +						  div->table,
> +						  div->width, div->flags, val);
> +
> +		return 0;
>  	}
>  
> -	return divider_round_rate(hw, rate, prate, div->table,
> -				  div->width, div->flags);
> +	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
> +				       div->table, div->width, div->flags);
> +
> +	return 0;
>  }
>  
>  static int bm1880_clk_div_set_rate(struct clk_hw *hw, unsigned long rate,
> @@ -665,7 +670,7 @@ static int bm1880_clk_div_set_rate(struct clk_hw *hw, unsigned long rate,
>  
>  static const struct clk_ops bm1880_clk_div_ops = {
>  	.recalc_rate = bm1880_clk_div_recalc_rate,
> -	.round_rate = bm1880_clk_div_round_rate,
> +	.determine_rate = bm1880_clk_div_determine_rate,
>  	.set_rate = bm1880_clk_div_set_rate,
>  };
>  
> 
> -- 
> 2.50.1
> 
> 

-- 
மணிவண்ணன் சதாசிவம்

