Return-Path: <linux-mips+bounces-10529-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D600B339B1
	for <lists+linux-mips@lfdr.de>; Mon, 25 Aug 2025 10:43:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D88721B23C4E
	for <lists+linux-mips@lfdr.de>; Mon, 25 Aug 2025 08:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F3152BD013;
	Mon, 25 Aug 2025 08:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FhTSsXLt"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460C7242D96;
	Mon, 25 Aug 2025 08:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756111246; cv=none; b=XPwwMh2UtelS2wdDAQLkbplqkKzvIrU7MGKZc547SRvCR/f6bw48sB0WreSmoBfBFxUmhFhKH49BI4cqk5d0VqVaCdh3PvA6LOsGH6WgO74rWdjhDcthUsTcyMY0fuM1D6OOfX2AsUQePtQ06NDfETSwXChor0u1JqdRp6SWJrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756111246; c=relaxed/simple;
	bh=aL0MAVPP+baLaUpSwr0jfz0k4rjTubYNQV6vSJB6OP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QumvMAJyCeQvjT3ebz/RN5jOtAa3tW0NOm+MmPCbZS50TTSujzJ4hKx7dtb8jKs9ehrlr8BOGHYFAnkyyV1sCCFUixylZ2LHsDfRyPHHLFxMf50hkQzPhVwUIZ76/ShhwLxzpdFkwH4Z3N1UVmp3/VhvhAyS6peHGEVKanXFEzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FhTSsXLt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A433C4CEED;
	Mon, 25 Aug 2025 08:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756111245;
	bh=aL0MAVPP+baLaUpSwr0jfz0k4rjTubYNQV6vSJB6OP8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FhTSsXLtwO6EYA8rIZFKJgEf1O0j/6AFVpaIb7+0szOlxeqEkxITba+wS9KfZ+kjH
	 dJ4D0usUwHPH2GWzU3dXYRelvBK6F/Z+h883XsJq3lJG4gwBDPoq7M/8L4HEjQ78Vz
	 uw/bRo0VNtHxfdkgkl90Rnhxn0zOB4RalzhxYxbJGexY8w9QaG1wwgcVo4YigkvXdQ
	 HQavQb3MOaV1ehg5AV6v7VNw85VJa0JTCzNxPuL1pTIJOwcfLGwF2EeUKXrxIt0vRt
	 UCzCy8PTNnoYCOQUG/lUyh80qq0nQtE3jstm5jDssnnjYRZ8hsuFayTUr3+h+B+cyD
	 ob0l8lzfNS6fA==
Date: Mon, 25 Aug 2025 16:40:43 +0800
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
Subject: Re: [PATCH 049/114] clk: spacemit: ccu_ddn: convert from
 round_rate() to determine_rate()
Message-ID: <20250825084043-GYA1096417@kernel.org>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-49-b3bf97b038dc@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-49-b3bf97b038dc@redhat.com>

Hi Brian,

  Thanks for doing this

  I will give my rb to 49-51 for SpacemiT, and here we face same
issue as Krzysztof did for samsung, to avoid potential conflicts
we will route the clk patches through SpacemiT SoC tree..

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
>  drivers/clk/spacemit/ccu_ddn.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/spacemit/ccu_ddn.c b/drivers/clk/spacemit/ccu_ddn.c
> index be311b045698e95a688a35858a8ac1bcfbffd2c7..02b68ea84db9bd3ecdde41f8013c48263edbd917 100644
> --- a/drivers/clk/spacemit/ccu_ddn.c
> +++ b/drivers/clk/spacemit/ccu_ddn.c
> @@ -39,13 +39,16 @@ static unsigned long ccu_ddn_calc_best_rate(struct ccu_ddn *ddn,
>  	return ccu_ddn_calc_rate(prate, *num, *den);
>  }
>  
> -static long ccu_ddn_round_rate(struct clk_hw *hw, unsigned long rate,
> -			       unsigned long *prate)
> +static int ccu_ddn_determine_rate(struct clk_hw *hw,
> +				  struct clk_rate_request *req)
>  {
>  	struct ccu_ddn *ddn = hw_to_ccu_ddn(hw);
>  	unsigned long num, den;
>  
> -	return ccu_ddn_calc_best_rate(ddn, rate, *prate, &num, &den);
> +	req->rate = ccu_ddn_calc_best_rate(ddn, req->rate,
> +					   req->best_parent_rate, &num, &den);
> +
> +	return 0;
>  }
>  
>  static unsigned long ccu_ddn_recalc_rate(struct clk_hw *hw, unsigned long prate)
> @@ -78,6 +81,6 @@ static int ccu_ddn_set_rate(struct clk_hw *hw, unsigned long rate,
>  
>  const struct clk_ops spacemit_ccu_ddn_ops = {
>  	.recalc_rate	= ccu_ddn_recalc_rate,
> -	.round_rate	= ccu_ddn_round_rate,
> +	.determine_rate = ccu_ddn_determine_rate,
>  	.set_rate	= ccu_ddn_set_rate,
>  };
> 
> -- 
> 2.50.1
> 
> 

-- 
Yixun Lan (dlan)

