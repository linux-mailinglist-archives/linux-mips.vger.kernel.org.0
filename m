Return-Path: <linux-mips+bounces-12300-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E167CC6F900
	for <lists+linux-mips@lfdr.de>; Wed, 19 Nov 2025 16:11:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 739492F4EF
	for <lists+linux-mips@lfdr.de>; Wed, 19 Nov 2025 15:07:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81F6F361DAC;
	Wed, 19 Nov 2025 15:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pydQ9Cm/"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F862877E8
	for <linux-mips@vger.kernel.org>; Wed, 19 Nov 2025 15:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763564673; cv=none; b=UozNjXjt8GCLPn15i8qcIqPR0gHCzf4QOMk829lXX6NTWX9iVM9/e6t50YVf5MAmXiIyoSg27LSKweHEV7LktTbng9BCziVBp8TYrG99G9zgLfLZLlVZEjuKaDm2y2zr1S739A2NVGgwvVoS4KP9Nos4lTPpdzSQYyooC0nhm6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763564673; c=relaxed/simple;
	bh=JWsvclXfQAhpF+gm46D5gt1oWK9nQX08T4sCNZQEqHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s2zxQ8I7AzpynJ820l6Wzmf4hvymHHiazE+Bjm9k8HxH6BWAGjBNPKUfFibgyDJ/8rIrNgF0YFRn4T+f/dRvqDJYcmL33wJusQnItDHcpH3m23jVUqt0/POP7RQt4fqtZxuZny+F5z3spBuppHykPyhvxM2X2uPe2BvtiWoXreI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pydQ9Cm/; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3DC831A1BB1;
	Wed, 19 Nov 2025 15:04:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 12AD160699;
	Wed, 19 Nov 2025 15:04:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4AF2610371A6A;
	Wed, 19 Nov 2025 16:04:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763564668; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=iOlkPCGpg/MS+MVjysj2yGEdNDC307nbqdpz8sSAuv0=;
	b=pydQ9Cm/qN+VYxsz9ea5stWmObgr9qhSdrASCCjEPUvYmak8eHP47YpqmmAg/tkKCk/Jl3
	XjUzyN0fKdeUd4GLVr9+vjbRQYRB1JS0RPpxGjzl1gzELMJNBdieiCGAF4Xccko61ckjiL
	bhqntexyJ9bG6Mm8ZuZmEmSioCgnGbLtDUDV1jAw8fqR4FFR7sgyZfvMKPaQFd05aK2+7K
	VrVAw/L1VhoIC8Qbj1PND/v39ak718JA6YKAtbiQAqGzNsaERPvGuKMkc3+QiRziw/GXFP
	sXOdLDFBk6nZjRZoyPGjNuubGQ2MUqWjnMvMHhDE0bZM4TYIETvG8n/8HYV7FA==
Message-ID: <b04b1abe-c75b-4f59-b9a9-183df0c56d08@bootlin.com>
Date: Wed, 19 Nov 2025 16:04:23 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/3] net: stmmac: move probe/remove calling of
 init/exit
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Chen-Yu Tsai <wens@csie.org>,
 "David S. Miller" <davem@davemloft.net>, Drew Fustini <fustini@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Fu Wei <wefu@redhat.com>,
 Guo Ren <guoren@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Jakub Kicinski <kuba@kernel.org>, Jan Petrous <jan.petrous@oss.nxp.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Keguang Zhang <keguang.zhang@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, s32@nxp.com,
 Samuel Holland <samuel@sholland.org>
References: <aR2V0Kib7j0L4FNN@shell.armlinux.org.uk>
 <E1vLf2Z-0000000FMNH-0xPV@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vLf2Z-0000000FMNH-0xPV@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 19/11/2025 11:03, Russell King (Oracle) wrote:
> Move the probe/remove time calling of the init()/exit() methods in
> the platform data to the main driver probe/remove functions. This
> allows them to be used by non-platform_device based drivers.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 47 ++++++++++++++-----
>  .../ethernet/stmicro/stmmac/stmmac_platform.c | 23 +--------
>  2 files changed, 36 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 644dccb29f75..aac8188248ff 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -7593,19 +7593,9 @@ struct plat_stmmacenet_data *stmmac_plat_dat_alloc(struct device *dev)
>  }
>  EXPORT_SYMBOL_GPL(stmmac_plat_dat_alloc);
>  
> -/**
> - * stmmac_dvr_probe
> - * @device: device pointer
> - * @plat_dat: platform data pointer
> - * @res: stmmac resource pointer
> - * Description: this is the main probe function used to
> - * call the alloc_etherdev, allocate the priv structure.
> - * Return:
> - * returns 0 on success, otherwise errno.
> - */
> -int stmmac_dvr_probe(struct device *device,
> -		     struct plat_stmmacenet_data *plat_dat,
> -		     struct stmmac_resources *res)
> +static int __stmmac_dvr_probe(struct device *device,
> +			      struct plat_stmmacenet_data *plat_dat,
> +			      struct stmmac_resources *res)
>  {
>  	struct net_device *ndev = NULL;
>  	struct stmmac_priv *priv;
> @@ -7912,6 +7902,34 @@ int stmmac_dvr_probe(struct device *device,
>  
>  	return ret;
>  }
> +
> +/**
> + * stmmac_dvr_probe
> + * @dev: device pointer
> + * @plat_dat: platform data pointer
> + * @res: stmmac resource pointer
> + * Description: this is the main probe function used to
> + * call the alloc_etherdev, allocate the priv structure.
> + * Return:
> + * returns 0 on success, otherwise errno.
> + */
> +int stmmac_dvr_probe(struct device *dev, struct plat_stmmacenet_data *plat_dat,
> +		     struct stmmac_resources *res)
> +{
> +	int ret;
> +
> +	if (plat_dat->init) {
> +		ret = plat_dat->init(dev, plat_dat->bsp_priv);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = __stmmac_dvr_probe(dev, plat_dat, res);
> +	if (ret && plat_dat->exit)
> +		plat_dat->exit(dev, plat_dat->bsp_priv);
> +
> +	return ret;
> +}
>  EXPORT_SYMBOL_GPL(stmmac_dvr_probe);
>  
>  /**
> @@ -7950,6 +7968,9 @@ void stmmac_dvr_remove(struct device *dev)
>  
>  	pm_runtime_disable(dev);
>  	pm_runtime_put_noidle(dev);
> +
> +	if (priv->plat->exit)
> +		priv->plat->exit(dev, priv->plat->bsp_priv);
>  }
>  EXPORT_SYMBOL_GPL(stmmac_dvr_remove);
>  
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index feccb8a3e7e8..9015b7f80d1b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -804,25 +804,12 @@ int stmmac_pltfr_probe(struct platform_device *pdev,
>  		       struct plat_stmmacenet_data *plat,
>  		       struct stmmac_resources *res)
>  {
> -	struct device *dev = &pdev->dev;
> -	int ret;
> -
>  	if (!plat->suspend && plat->exit)
>  		plat->suspend = stmmac_plat_suspend;
>  	if (!plat->resume && plat->init)
>  		plat->resume = stmmac_plat_resume;
>  
> -	ret = stmmac_pltfr_init(dev, plat);
> -	if (ret)
> -		return ret;
> -
> -	ret = stmmac_dvr_probe(dev, plat, res);
> -	if (ret) {
> -		stmmac_pltfr_exit(dev, plat);
> -		return ret;
> -	}
> -
> -	return ret;
> +	return stmmac_dvr_probe(&pdev->dev, plat, res);
>  }
>  EXPORT_SYMBOL_GPL(stmmac_pltfr_probe);
>  
> @@ -864,13 +851,7 @@ EXPORT_SYMBOL_GPL(devm_stmmac_pltfr_probe);
>   */
>  void stmmac_pltfr_remove(struct platform_device *pdev)
>  {
> -	struct net_device *ndev = platform_get_drvdata(pdev);
> -	struct stmmac_priv *priv = netdev_priv(ndev);
> -	struct plat_stmmacenet_data *plat = priv->plat;
> -	struct device *dev = &pdev->dev;
> -
> -	stmmac_dvr_remove(dev);
> -	stmmac_pltfr_exit(dev, plat);
> +	stmmac_dvr_remove(&pdev->dev);
>  }
>  EXPORT_SYMBOL_GPL(stmmac_pltfr_remove);
>  


