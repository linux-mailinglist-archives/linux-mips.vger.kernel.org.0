Return-Path: <linux-mips+bounces-10530-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FA7B339B7
	for <lists+linux-mips@lfdr.de>; Mon, 25 Aug 2025 10:43:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5684A1B23B6F
	for <lists+linux-mips@lfdr.de>; Mon, 25 Aug 2025 08:44:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D8602C08C2;
	Mon, 25 Aug 2025 08:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kOMZ2uUV"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A2A2BF009;
	Mon, 25 Aug 2025 08:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756111271; cv=none; b=Sce6MPBNUUdNDzyfjvCdGNC88wODCFfhZ6PDtSxfi83BC5VILvapz2jllBVa3wBZJySsg8Kav28wn2SLwh2P4dvacbOMIKS0/iLD1Tg6JOU5ay9A55FdHdXZh03re4dq/qsNMbNJLIKjfuFK3Lub9w9szxe6jkAFHZFiKZe/DZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756111271; c=relaxed/simple;
	bh=YvGhFydXbrmE9yimRweNKCZChGzfZ1CATQpB6bIekEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OIYT+iVRGZfxMUHy0dpsQXK65gfvAjGw7nN8V6Kn9vbRqIn0ERWxSQnTJedSNg6d61hDDiUMOhS5JXgIj43+6fTnq1HCcGxWuCdCaYW8SDKMOZcOr7K2aHhK+811K4UVpw3EEtH1jyJEZK0VXoxy9bD5AVH10ZCpQUuAEh7qyqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kOMZ2uUV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7064FC4CEF1;
	Mon, 25 Aug 2025 08:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756111270;
	bh=YvGhFydXbrmE9yimRweNKCZChGzfZ1CATQpB6bIekEY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kOMZ2uUVb/0wo3syOidoV1f0HRnUy2RJHSLMdGqk7yLVCovHqwhjwaAlh5RRjGhHZ
	 vntVwdIrQaIPc6RHyWqxDvKuJf4yALVzvwSkz6MQRZOCjYqhY5PmaPIKYrOPpB1p8u
	 ZQQcgaSOLbnXSBweKyIJlNLbQ4eko+2s1j1Kyd2DdcthL3uR+6Q+zm9V6VZoqVXEwk
	 YjSDNkhA9rZ9AoJyJlfQ5AVgcfN/tGkd589lOdTPjxZRJZFSYBmnMyeGFXPtEjvyYF
	 AaBOk5ZqAGeb9e0X69QoM8YFdfSFRB83tOPM4vDNmgfhRwb0C+7Wd6fILQWTsgyp8c
	 FHQseDkSJrtGw==
Date: Mon, 25 Aug 2025 16:41:07 +0800
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
Subject: Re: [PATCH 050/114] clk: spacemit: ccu_mix: convert from
 round_rate() to determine_rate()
Message-ID: <20250825084107-GYB1096417@kernel.org>
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
>  drivers/clk/spacemit/ccu_mix.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/spacemit/ccu_mix.c b/drivers/clk/spacemit/ccu_mix.c
> index 9b852aa61f78aed5256bfe6fc3b01932d6db6256..7b7990875372314dce131295af7f40267d0a127a 100644
> --- a/drivers/clk/spacemit/ccu_mix.c
> +++ b/drivers/clk/spacemit/ccu_mix.c
> @@ -80,10 +80,12 @@ static int ccu_mix_trigger_fc(struct clk_hw *hw)
>  					       MIX_FC_TIMEOUT_US);
>  }
>  
> -static long ccu_factor_round_rate(struct clk_hw *hw, unsigned long rate,
> -				  unsigned long *prate)
> +static int ccu_factor_determine_rate(struct clk_hw *hw,
> +				     struct clk_rate_request *req)
>  {
> -	return ccu_factor_recalc_rate(hw, *prate);
> +	req->rate = ccu_factor_recalc_rate(hw, req->best_parent_rate);
> +
> +	return 0;
>  }
>  
>  static int ccu_factor_set_rate(struct clk_hw *hw, unsigned long rate,
> @@ -198,7 +200,7 @@ const struct clk_ops spacemit_ccu_gate_ops = {
>  };
>  
>  const struct clk_ops spacemit_ccu_factor_ops = {
> -	.round_rate	= ccu_factor_round_rate,
> +	.determine_rate = ccu_factor_determine_rate,
>  	.recalc_rate	= ccu_factor_recalc_rate,
>  	.set_rate	= ccu_factor_set_rate,
>  };
> @@ -220,7 +222,7 @@ const struct clk_ops spacemit_ccu_factor_gate_ops = {
>  	.enable		= ccu_gate_enable,
>  	.is_enabled	= ccu_gate_is_enabled,
>  
> -	.round_rate	= ccu_factor_round_rate,
> +	.determine_rate = ccu_factor_determine_rate,
>  	.recalc_rate	= ccu_factor_recalc_rate,
>  	.set_rate	= ccu_factor_set_rate,
>  };
> 
> -- 
> 2.50.1
> 
> 

-- 
Yixun Lan (dlan)

