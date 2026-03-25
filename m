Return-Path: <linux-mips+bounces-13941-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBKdOBoVxGmfwAQAu9opvQ
	(envelope-from <linux-mips+bounces-13941-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2026 18:02:18 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A420F329869
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2026 18:02:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 11408310FFDB
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2026 16:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B031A3FB7DF;
	Wed, 25 Mar 2026 16:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qDB30oUW"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F1C3FAE0E;
	Wed, 25 Mar 2026 16:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774457656; cv=none; b=TFdbFO4Zta9KrDvMvOncNJ+iVyc3/uu6VxSDaBmAqOilqWRt8cuFVfNOfEKvaAy7m1fWFlY8z2i23x7TcRYhy1pKvmOcHedIN2F4DfEAZ/HdPGsii0G32Pj9RxfcAEJ3WOto+n6aZWK9Tm76USp4T4Q8HhhU/14E3ZBh0o10/SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774457656; c=relaxed/simple;
	bh=oMuUWLmoNITVcQzV/o3it6GVvrYLaH+S1Qr6U989rSY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jg0hjiQ5orSBo1X7qmNjy9KaQYmd0GdhFGKKhKVBXt1F4GMVbxzbFgSL1g8LnddXKvqEefVr342IhnUhJjduRVjbHlldDLtQSY6zKKvlNck/xy9FoqVaqbB22cdymHopfeA2dKyONUsJ/2DjrtVl1RJm51dy2WQRyNijja8UmDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qDB30oUW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49A05C4CEF7;
	Wed, 25 Mar 2026 16:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774457655;
	bh=oMuUWLmoNITVcQzV/o3it6GVvrYLaH+S1Qr6U989rSY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qDB30oUW5a/3zO8cnh+u95v1NNfWmdGI2IjUhVXfyQO4SZA9TyoTDvTMqD+MHZCZB
	 NbZtSa7ImOyDdMHoSkCtK7kMx2M9RnDL3kZd0WZAGqqSFNhJA4Vyj+bRdJUtT/WJ1+
	 smzMbNGLEjkZHNkEwdIxqekKRq5iCdcpKCC+5KHh0JNGfGHt78pBcZNG2XZr+ZjCL8
	 +pQPBWT2Qxf0S+D+n9gEGvUaIXjm0r1poXr0/YGLOZB2oBLm4MXdkhUtjKNkn3Qdqe
	 uvMiMQG7Gvnj5hAOzCxfefchzrdYpSo9zodIbgOmf0vcfll+P9lh2ztHg9oF7j+3q5
	 jVMvbkd5KgOww==
From: Simon Horman <horms@kernel.org>
To: bartosz.golaszewski@oss.qualcomm.com
Cc: Simon Horman <horms@kernel.org>,
	magnus.damm@gmail.com,
	jernej.skrabec@gmail.com,
	s32@nxp.com,
	krzysztof.kozlowski@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev,
	festevam@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	wens@kernel.org,
	netdev@vger.kernel.org,
	geert+renesas@glider.be,
	linux-stm32@st-md-mailman.stormreply.com,
	dfustini@tenstorrent.com,
	andersson@kernel.org,
	khilman@baylibre.com,
	linux-mips@vger.kernel.org,
	mripard@kernel.org,
	romain.gantois@bootlin.com,
	vkoul@kernel.org,
	linux-renesas-soc@vger.kernel.org,
	jbrunet@baylibre.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	sophgo@lists.linux.dev,
	brgl@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-sunxi@lists.linux.dev,
	conor+dt@kernel.org,
	davem@davemloft.net,
	jan.petrous@oss.nxp.com,
	shawnguo@kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	bartosz.golaszewski@linaro.org,
	peppe.cavallaro@st.com,
	krzk+dt@kernel.org,
	mohd.anwar@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	martin.blumenstingl@googlemail.com,
	andrew+netdev@lunn.ch,
	rrendec@redhat.com,
	linux-rockchip@lists.infradead.org,
	christophe.roullier@foss.st.com,
	linux-kernel@vger.kernel.org,
	neil.armstrong@linaro.org,
	alexandre.torgue@foss.st.com,
	edumazet@google.com,
	robh@kernel.org
Subject: Re: [PATCH net-next v10 6/6] net: stmmac: qcom-ethqos: add support for sa8255p
Date: Wed, 25 Mar 2026 16:53:35 +0000
Message-ID: <20260325165335.326630-1-horms@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260323-qcom-sa8255p-emac-v10-6-79302b238a16@oss.qualcomm.com>
References: <20260323-qcom-sa8255p-emac-v10-6-79302b238a16@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,nxp.com,oss.qualcomm.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,glider.be,st-md-mailman.stormreply.com,tenstorrent.com,baylibre.com,bootlin.com,redhat.com,bp.renesas.com,davemloft.net,oss.nxp.com,linaro.org,st.com,googlemail.com,lunn.ch,foss.st.com,google.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13941-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[horms@kernel.org,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_GT_50(0.00)[53];
	TAGGED_RCPT(0.00)[linux-mips,renesas,dt,netdev];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A420F329869
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
net: stmmac: qcom-ethqos: add support for sa8255p

Extend the driver to support a new model - sa8255p. Unlike the
previously supported variants, this one's power management is done in
the firmware using SCMI. This is modeled in linux using power domains so
add support for them.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index f32ff0d9ce51..09ce80b446cb 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c

[ ... ]

> @@ -710,6 +785,45 @@ static int ethqos_mac_finish_serdes(struct net_device *ndev, void *priv,
>  	return ret;
>  }
>
> +static int ethqos_mac_finish_serdes_pd(struct net_device *ndev, void *priv,
> +				       unsigned int mode,
> +				       phy_interface_t interface)
> +{
> +	struct qcom_ethqos *ethqos = priv;
> +	struct device *dev = ethqos->pd.pd_list->pd_devs[ETHQOS_PD_SERDES];
> +	int ret = 0;
> +
> +	qcom_ethqos_set_sgmii_loopback(ethqos, false);
> +
> +	if (interface == PHY_INTERFACE_MODE_SGMII ||
> +	    interface == PHY_INTERFACE_MODE_2500BASEX)
> +		ret = dev_pm_opp_set_level(dev, ethqos->pd.serdes_level);
> +
> +	return ret;
> +}
> +
> +static int qcom_ethqos_pd_serdes_powerup(struct net_device *ndev, void *priv)
> +{
> +	struct qcom_ethqos *ethqos = priv;
> +	struct device *dev = ethqos->pd.pd_list->pd_devs[ETHQOS_PD_SERDES];
> +	int ret;
> +
> +	ret = qcom_ethqos_domain_on(ethqos, ETHQOS_PD_SERDES);
> +	if (ret < 0)
> +		return ret;
> +
> +	return dev_pm_opp_set_level(dev, ethqos->pd.serdes_level);
> +}

Does this leak the PM runtime reference if dev_pm_opp_set_level() fails?

qcom_ethqos_pd_serdes_powerup() calls qcom_ethqos_domain_on() which
acquires a PM runtime reference via pm_runtime_resume_and_get():

qcom_ethqos_pd_serdes_powerup()
  qcom_ethqos_domain_on()
    pm_runtime_resume_and_get(dev)

If the subsequent dev_pm_opp_set_level() fails, the function returns the
error without calling qcom_ethqos_domain_off() to release the reference.

The caller stmmac_legacy_serdes_power_up() in stmmac_main.c does not set
legacy_serdes_is_powered=true on error, so stmmac_legacy_serdes_power_down()
in the cleanup path skips the powerdown call.

In the existing non-PD code path, qcom_ethqos_serdes_powerup() correctly
handles this case by calling phy_exit() when phy_power_on() fails:

drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c:qcom_ethqos_serdes_powerup() {
	ret = phy_init(ethqos->pm.serdes_phy);
	if (ret)
		return ret;

	ret = phy_power_on(ethqos->pm.serdes_phy);
	if (ret) {
		phy_exit(ethqos->pm.serdes_phy);
		return ret;
	}
	...
}

Should qcom_ethqos_pd_serdes_powerup() call qcom_ethqos_domain_off()
before returning the error from dev_pm_opp_set_level()?

> +
> +static void qcom_ethqos_pd_serdes_powerdown(struct net_device *ndev, void *priv)
> +{
> +	struct qcom_ethqos *ethqos = priv;
> +	struct device *dev = ethqos->pd.pd_list->pd_devs[ETHQOS_PD_SERDES];
> +
> +	dev_pm_opp_set_level(dev, 0);
> +	qcom_ethqos_domain_off(ethqos, ETHQOS_PD_SERDES);
> +}

[ ... ]

