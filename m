Return-Path: <linux-mips+bounces-12206-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 90169C53389
	for <lists+linux-mips@lfdr.de>; Wed, 12 Nov 2025 16:57:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C854B350AB5
	for <lists+linux-mips@lfdr.de>; Wed, 12 Nov 2025 15:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA95A33F8B9;
	Wed, 12 Nov 2025 15:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LnZMVGfY"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B2133F372
	for <linux-mips@vger.kernel.org>; Wed, 12 Nov 2025 15:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762962483; cv=none; b=JLBMDHqVrxi0CXjftdM343j2RewL/SlA3+hrlNQb4fUheuRiMJS57vWTKgdmyqU95gVkNpBeu3f1piOhwszB4AgVh8PDvmDfHAQD0BB/JLinH/LlB2NuGtaqx38Fys/n+CmxXG7ZGgjS/mk6AFYmhOn5K0ZZKIi7PTMn9TgzJO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762962483; c=relaxed/simple;
	bh=ygELS8hZslFMTCZ+0LcZV2QXKG/NdeYcYSa6ECGENCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZTEmJDd/w83T0EhV2N5HSSJ7v2XCPraJCGQllHvOa0pVqVC9MzdpSoZX2oL/E523cYclMm+FFhK62PDNEgqvhnGgRDo2r7gjpSWvu3pSAg1n2c+L5OrkjxKzGsKRtVo1lYiOY3TffICzPkZV0RSWffvWrBLCqjmD3wlu2FBTBPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LnZMVGfY; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1F5761A1A4D;
	Wed, 12 Nov 2025 15:48:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E7C2F6070B;
	Wed, 12 Nov 2025 15:47:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BC440102F1C26;
	Wed, 12 Nov 2025 16:47:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762962478; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=p+HInJWYvj2EbsQSrQ08qaFvego5yMYy0Y/L5C536i8=;
	b=LnZMVGfYx4JIkgZ0Ij0YvUWtCZRvN4HKk6pXwIobuWFpTpxcBI9lfc8Tws8Zg4Dyd8b3k5
	LkzMbtgJ4Ef0ZgmANMNlmp6ENJAd+NpZ2ry/lM3aDENQytAuaRMP4GqLSei6QX63BvSGJ2
	eTSC/cw2nM6U2nWghrBpDforF1L5XcCQM866onJDZZecaj2TCiHCr/KbO8cVsZFA7jAnA/
	0Kdc2b4kVJeYheJNGtqM5yQxaBqdVzYAXirqATeEpI4AbKw7nGo578gTSvdFcJ0FCMWmvY
	x6s7BtQEM0BWunfkg/k8BALQhE6PXrlszHy4zMGP18q5B9MKxMZ7nbJsUC/hKA==
Message-ID: <69d274c0-8133-4646-bbac-d30e6573dda8@bootlin.com>
Date: Wed, 12 Nov 2025 16:47:53 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 03/13] net: stmmac: loongson1: use
 stmmac_get_phy_intf_sel()
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "David S. Miller" <davem@davemloft.net>,
 Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Keguang Zhang <keguang.zhang@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Minda Chen <minda.chen@starfivetech.com>, netdev@vger.kernel.org,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
 Paolo Abeni <pabeni@redhat.com>
References: <aRLvrfx6tOa-RhrY@shell.armlinux.org.uk>
 <E1vIjTp-0000000DqtC-2DmI@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vIjTp-0000000DqtC-2DmI@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 11/11/2025 09:11, Russell King (Oracle) wrote:
> Use stmmac_get_phy_intf_sel() to decode the PHY interface mode to the
> phy_intf_sel value, validate the result and use that to set the
> control register to select the operating mode for the DWMAC core.
> 
> Note that this will allow GMII as well as MII as the phy_intf_sel
> value is the same for both.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
> index 5f9f66fbc191..894ee66f5c9b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
> @@ -140,14 +140,9 @@ static int ls1c_dwmac_syscon_init(struct platform_device *pdev, void *priv)
>  	struct regmap *regmap = dwmac->regmap;
>  	int phy_intf_sel;
>  
> -	switch (plat->phy_interface) {
> -	case PHY_INTERFACE_MODE_MII:
> -		phy_intf_sel = PHY_INTF_SEL_GMII_MII;
> -		break;
> -	case PHY_INTERFACE_MODE_RMII:
> -		phy_intf_sel = PHY_INTF_SEL_RMII;
> -		break;
> -	default:
> +	phy_intf_sel = stmmac_get_phy_intf_sel(plat->phy_interface);
> +	if (phy_intf_sel != PHY_INTF_SEL_GMII_MII &&
> +	    phy_intf_sel != PHY_INTF_SEL_RMII) {
>  		dev_err(&pdev->dev, "Unsupported PHY-mode %u\n",
>  			plat->phy_interface);
>  		return -EOPNOTSUPP;


