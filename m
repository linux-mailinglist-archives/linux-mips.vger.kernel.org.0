Return-Path: <linux-mips+bounces-12864-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EB2D14A6E
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 19:04:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D661130DB4BD
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 18:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E38037F75C;
	Mon, 12 Jan 2026 18:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="feB0lBBc"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355E22749C7;
	Mon, 12 Jan 2026 18:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768240812; cv=none; b=MdVsoSNeyl0vxmYPE3UuN9S7qQFMh5SVszACwn1OjrN0YCoKu8UJQW38hpPi2WuuuRgWCRFqUQCEsTehPL4hwhyjZDScYupBQPSCLSCFcPZD4YUNauD9y2K3Uwsm5MKVF+9ccX+bKNjk0tflayntGYdBDgpFrE4975LlpnUnDVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768240812; c=relaxed/simple;
	bh=mGbofIjwnm9caXWlIFuD+vvkQiRMHg0CWCn2+iWjokQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZYFiooY0b1a/i6UV9W/Jo7nfz2yNL0fO9jAgK+zkV8vpQXMDDQMITwx/J2Eh6q1rdqmydYkEY6cWFDtleelSANRcPJRydhws7DBw/0NRxpkOZZwAsx3uLaPpmexn2bSd2N3qG273KlN3H4dFkXDwFZkzE/VzOH2fUMrLsZ45Tro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=feB0lBBc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB923C16AAE;
	Mon, 12 Jan 2026 18:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768240811;
	bh=mGbofIjwnm9caXWlIFuD+vvkQiRMHg0CWCn2+iWjokQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=feB0lBBcPjMm6TcLwyV7ebbxAv/YTwcCPMIuU2dVmvhL5mGCrIawtev3cma1EX2dA
	 gimcge4/rXibL+oI/bA4/8WLwnYBQjmUWgdqxGK+z6QcoubI5S8MGhmHsN6RGU3I0m
	 bOaihftKwYyTpOxlZre+emHgYCTF4qUVx3nrUpVhTKwciuti+mwHDDCK+Uudv2JTSh
	 R6RBys8rz+B/35nVnKrzi3MKeFCyoNWx7MF7/pgVShpqzu4mBxe+J9/cv0NwkEif1g
	 VG+WPfM/JevSndphvgNzv7J2+6JAdWpT5GxWT+B4lRohyxUT14oeDlYMchDvMoo1+A
	 VALVB9TuQpPSg==
From: Jakub Kicinski <kuba@kernel.org>
To: bartosz.golaszewski@oss.qualcomm.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	jbrunet@baylibre.com,
	linux-stm32@st-md-mailman.stormreply.com,
	devicetree@vger.kernel.org,
	neil.armstrong@linaro.org,
	unicorn_wang@outlook.com,
	andrew+netdev@lunn.ch,
	vkoul@kernel.org,
	peppe.cavallaro@st.com,
	jernej.skrabec@gmail.com,
	samin.guo@starfivetech.com,
	david.wu@rock-chips.com,
	christophe.roullier@foss.st.com,
	linux-amlogic@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	martin.blumenstingl@googlemail.com,
	robh@kernel.org,
	linux-imx@nxp.com,
	andersson@kernel.org,
	joabreu@synopsys.com,
	s32@nxp.com,
	swathi.ks@samsung.com,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	keguang.zhang@gmail.com,
	kernel@pengutronix.de,
	romain.gantois@bootlin.com,
	brgl@kernel.org,
	sophgo@lists.linux.dev,
	netdev@vger.kernel.org,
	xiaoning.wang@nxp.com,
	imx@lists.linux.dev,
	dfustini@tenstorrent.com,
	davem@davemloft.net,
	jan.petrous@oss.nxp.com,
	magnus.damm@gmail.com,
	lizhi2@eswincomputing.com,
	linux-sunxi@lists.linux.dev,
	linux-mips@vger.kernel.org,
	vineetha.g.jaya.kumaran@intel.com,
	matthew.gerlach@altera.com,
	wefu@redhat.com,
	geert+renesas@glider.be,
	edumazet@google.com,
	linux-kernel@vger.kernel.org,
	Frank.Li@nxp.com,
	conor+dt@kernel.org,
	mripard@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@esmil.dk,
	linux-renesas-soc@vger.kernel.org,
	alexandre.torgue@foss.st.com,
	inochiama@gmail.com,
	minda.chen@starfivetech.com,
	s.hauer@pengutronix.de,
	nobuhiro.iwamatsu.x90@mail.toshiba,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	fustini@kernel.org,
	richardcochran@gmail.com,
	pabeni@redhat.com,
	shawnguo@kernel.org,
	wens@kernel.org,
	heiko@sntech.de,
	guoren@kernel.org,
	weishangjuan@eswincomputing.com,
	mcoquelin.stm32@gmail.com,
	khilman@baylibre.com,
	festevam@gmail.com,
	liangshuang@eswincomputing.com,
	krzysztof.kozlowski@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	linux-rockchip@lists.infradead.org,
	samuel@sholland.org
Subject: Re: [RESEND,net-next,v6,7/7] net: stmmac: qcom-ethqos: add support for sa8255p
Date: Mon, 12 Jan 2026 10:00:05 -0800
Message-ID: <20260112180005.4144056-1-kuba@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112-qcom-sa8255p-emac-v6-7-86a3d4b2ad83@oss.qualcomm.com>
References: <20260112-qcom-sa8255p-emac-v6-7-86a3d4b2ad83@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least pausible.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
net: stmmac: qcom-ethqos: add support for sa8255p

This commit adds support for the SA8255P SoC which uses power domains
managed via SCMI firmware, rather than the traditional clock/phy-based
power management used by other variants.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 8ba57bba3f2e..54f8ef3cfd7d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c

[ ... ]

> +static void ethqos_disable_serdes(void *data)
> +{
> +	struct qcom_ethqos *ethqos = data;
> +
> +	qcom_ethqos_domain_on(ethqos, ETHQOS_PD_SERDES);
                          ^^

Should this be qcom_ethqos_domain_off() instead of qcom_ethqos_domain_on()?

This function is registered as a cleanup action via devm_add_action_or_reset()
to undo the qcom_ethqos_domain_on(ETHQOS_PD_SERDES) call during probe. Using
domain_on here would increment the PM runtime usage counter again rather than
decrementing it. The serdes power domain would never be properly turned off
on driver removal.

Compare with qcom_ethqos_pd_serdes_powerdown() which correctly uses
qcom_ethqos_domain_off().

> +}

[ ... ]

> +static int qcom_ethqos_pd_init(struct device *dev, void *priv)
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

[ ... ]

>  	if (pm_data && pm_data->use_domains) {
>  		ethqos->set_serdes_speed = ethqos_set_serdes_speed_pd;
>
> +		ret = devm_pm_domain_attach_list(dev, &pm_data->pd,
> +						 &ethqos->pd.pd_list);
> +		if (ret < 0)
> +			return dev_err_probe(dev, ret, "Failed to attach power domains\n");
> +
> +		plat_dat->clks_config = ethqos_pd_clks_config;
> +		plat_dat->serdes_powerup = qcom_ethqos_pd_serdes_powerup;
> +		plat_dat->serdes_powerdown = qcom_ethqos_pd_serdes_powerdown;
> +		plat_dat->exit = qcom_ethqos_pd_exit;
> +		plat_dat->init = qcom_ethqos_pd_init;
                             ^^^^^^^^^^^^^^^^^^^^^^^

> +		plat_dat->clk_ptp_rate = pm_data->clk_ptp_rate;
> +
> +		ret = qcom_ethqos_pd_init(dev, ethqos);
                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Is qcom_ethqos_pd_init() being called twice?

It is assigned to plat_dat->init above, and then called directly here. Later,
devm_stmmac_pltfr_probe() -> stmmac_pltfr_probe() -> stmmac_dvr_probe() will
call plat_dat->init() again (see stmmac_main.c stmmac_dvr_probe function).

Each call to qcom_ethqos_pd_init() increments the PM runtime usage counter
for ETHQOS_PD_CORE and ETHQOS_PD_MDIO via pm_runtime_resume_and_get(). With
two calls, the refcount would be 2 for each domain, but qcom_ethqos_pd_exit()
only decrements once per domain. This would leave the power domains with a
dangling reference.

Perhaps the direct call to qcom_ethqos_pd_init() here should be removed, and
let stmmac_dvr_probe() invoke it through the plat_dat->init callback?

> +		if (ret)
> +			return ret;

[ ... ]

