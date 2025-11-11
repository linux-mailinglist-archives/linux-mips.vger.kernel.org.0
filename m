Return-Path: <linux-mips+bounces-12192-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A51C4D898
	for <lists+linux-mips@lfdr.de>; Tue, 11 Nov 2025 12:56:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 679454F8D19
	for <lists+linux-mips@lfdr.de>; Tue, 11 Nov 2025 11:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5972E3563CE;
	Tue, 11 Nov 2025 11:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U8wDzG2j"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117782FCC1D;
	Tue, 11 Nov 2025 11:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762861690; cv=none; b=cubzvfEkNEPLzbigtnaIyNsDCL6ZbHyZesuF3/PYEFWFt0k/CE0nFarz0fbW4aPxs4TVKt20eqS3YN5TwqqK8olsElk7dEVJ/ubSyaaSHNkE5kgP6XqwXOsi6WXGLtxQYW0mrNddhMIhMhMMEAJT2vEX5vbqRThsYO8ByAQULLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762861690; c=relaxed/simple;
	bh=jxi1Gv6OcPtGGFXGFF2QxkwKjLaMbfnLeBrhrAyU/Tg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eBb8CuLulkcRfgDBNrTtvai+z/CPZGRVItQRz7rSFsDqGRI2o6PT3i/ZB3TSNixW3FzznThFhMdiP46o2EBRIaaW8hEblvHrSJVBKgOrhbqUmb0z9fgIJtMfMLKa66ObFGY59erJygs8ZvthxnTwhG8FWxjduQxvhyv/pb6W4Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U8wDzG2j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E74BC116D0;
	Tue, 11 Nov 2025 11:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762861689;
	bh=jxi1Gv6OcPtGGFXGFF2QxkwKjLaMbfnLeBrhrAyU/Tg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U8wDzG2jhPfzS4KLy6BBXjLkq8tbdJdbZ2HLPt/oCduCWbREVPz6XahhQXZNBZvqk
	 rL61nJbROp9KbKpanxP6Xm+RhhBC2JjGt3mq5g1Vt8UeeKM8gOKgcYiPO0I2jAA8oR
	 2vP9zcZsjezzMSY7lXp0qcTehuQ5Bvcn5PLIyv21tVd9pJmlDNPzRzYLCVga+fJVZC
	 exeLAcTwq2GZWVxiqi/O5Hs9YfEKaR3AZUbkmkVOA0uPAeCkVjy4pmp9+BXSwywuet
	 qQS5xfNfqALbItTHOqCEixH82CxNQPweybJmarDGuJMjWDhzcw/4Ag1g8TdQPeJwJh
	 M8yYB1Fdu26pw==
Date: Tue, 11 Nov 2025 11:47:53 +0000
From: Simon Horman <horms@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Vinod Koul <vkoul@kernel.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Matthew Gerlach <matthew.gerlach@altera.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
	Romain Gantois <romain.gantois@bootlin.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Minda Chen <minda.chen@starfivetech.com>,
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Shuang Liang <liangshuang@eswincomputing.com>,
	Zhi Li <lizhi2@eswincomputing.com>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	"G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>,
	Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>,
	Samin Guo <samin.guo@starfivetech.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Swathi K S <swathi.ks@samsung.com>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Drew Fustini <dfustini@tenstorrent.com>,
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org,
	linux-mips@vger.kernel.org, imx@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v5 8/8] net: stmmac: qcom-ethqos: add support for sa8255p
Message-ID: <aRMiafCQNPVDOljU@horms.kernel.org>
References: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
 <20251107-qcom-sa8255p-emac-v5-8-01d3e3aaf388@linaro.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107-qcom-sa8255p-emac-v5-8-01d3e3aaf388@linaro.org>

On Fri, Nov 07, 2025 at 11:29:58AM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

...

> +static int qcom_ethqos_pd_init(struct platform_device *pdev, void *priv)
> +{
> +	struct qcom_ethqos *ethqos = priv;
> +	int ret;
> +
> +	/*
> +	 * Enable functional clock to prevent DMA reset after timeout due
> +	 * to no PHY clock being enabled after the hardware block has been
> +	 * power cycled. The actual configuration will be adjusted once
> +	 * ethqos_fix_mac_speed() is called.
> +	 */
> +	ethqos_set_func_clk_en(ethqos);
> +
> +	ret = qcom_ethqos_domain_on(ethqos, ETHQOS_PD_CORE);
> +	if (ret)
> +		return ret;
> +
> +	ret = qcom_ethqos_domain_on(ethqos, ETHQOS_PD_MDIO);
> +	if (ret) {
> +		qcom_ethqos_domain_off(ethqos, ETHQOS_PD_CORE);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void qcom_ethqos_pd_exit(struct platform_device *pdev, void *data)
> +{
> +	struct qcom_ethqos *ethqos = data;
> +
> +	qcom_ethqos_domain_off(ethqos, ETHQOS_PD_MDIO);
> +	qcom_ethqos_domain_off(ethqos, ETHQOS_PD_CORE);
> +}
> +
>  static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
>  {
>  	struct plat_stmmacenet_data *plat_dat = priv->plat;

...

> @@ -852,28 +993,63 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>  	ethqos->rgmii_config_loopback_en = drv_data->rgmii_config_loopback_en;
>  	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
>  	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
> -
> -	ethqos->pm.link_clk = devm_clk_get(dev, clk_name);
> -	if (IS_ERR(ethqos->pm.link_clk))
> -		return dev_err_probe(dev, PTR_ERR(ethqos->pm.link_clk),
> -				     "Failed to get link_clk\n");
> -
> -	ret = ethqos_clks_config(ethqos, true);
> -	if (ret)
> -		return ret;
> -
> -	ret = devm_add_action_or_reset(dev, ethqos_clks_disable, ethqos);
> -	if (ret)
> -		return ret;
> -
> -	ethqos->pm.serdes_phy = devm_phy_optional_get(dev, "serdes");
> -	if (IS_ERR(ethqos->pm.serdes_phy))
> -		return dev_err_probe(dev, PTR_ERR(ethqos->pm.serdes_phy),
> -				     "Failed to get serdes phy\n");
> -
> -	ethqos->set_serdes_speed = ethqos_set_serdes_speed_phy;
>  	ethqos->serdes_speed = SPEED_1000;
> -	ethqos_update_link_clk(ethqos, SPEED_1000);
> +
> +	if (pm_data && pm_data->use_domains) {
> +		ethqos->set_serdes_speed = ethqos_set_serdes_speed_pd;
> +
> +		ret = devm_pm_domain_attach_list(dev, &pm_data->pd,
> +						 &ethqos->pd.pd_list);
> +		if (ret < 0)
> +			return dev_err_probe(dev, ret, "Failed to attach power domains\n");
> +
> +		plat_dat->clks_config = ethqos_pd_clks_config;
> +		plat_dat->serdes_powerup = qcom_ethqos_pd_serdes_powerup;
> +		plat_dat->serdes_powerdown = qcom_ethqos_pd_serdes_powerdown;
> +		plat_dat->exit = qcom_ethqos_pd_exit;

Hi Bartosz,

It seems that the intention of this is to ensure
that domains turned on by qcom_ethqos_pd_init()
are turned off again on exit or clean-up in error paths.

> +		plat_dat->init = qcom_ethqos_pd_init;
> +		plat_dat->clk_ptp_rate = pm_data->clk_ptp_rate;
> +
> +		ret = qcom_ethqos_pd_init(pdev, ethqos);
> +		if (ret)
> +			return ret;

And here those domains are turned on.

> +
> +		ret = qcom_ethqos_domain_on(ethqos, ETHQOS_PD_SERDES);
> +		if (ret)

But it seems that if we reach this error path then the cleanup is not
performed. This is because plat_dat and thus it's exit callback are
registered until the call to devm_stmmac_pltfr_probe() towards the end of
this function.

Sorry if I'm on the wrong track here. I did dig into it.
But this was flagged by Claude Code running
https://github.com/masoncl/review-prompts/

> +			return dev_err_probe(dev, ret,
> +					     "Failed to enable the serdes power domain\n");

...

