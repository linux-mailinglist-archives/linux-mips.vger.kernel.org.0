Return-Path: <linux-mips+bounces-12205-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE891C53941
	for <lists+linux-mips@lfdr.de>; Wed, 12 Nov 2025 18:07:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8706505A98
	for <lists+linux-mips@lfdr.de>; Wed, 12 Nov 2025 15:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2E16341653;
	Wed, 12 Nov 2025 15:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VPNbNVWd"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0D8339B36;
	Wed, 12 Nov 2025 15:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762962454; cv=none; b=Uis3Mzn0OUB0u/IlSUgKh/MRKR1D/hcMJPiW7zIW3kI5/7T9WfLuiR75jtRyxR/Mu5OoVvobH++KvxcaVDuw+E3El8wLxKE3clU56s72JU2SAwi3ooOJMoOdL980eUSVB+ttVYh0sPJJvGugmHwXE7Tq8ZBQ/seIETLfVaxt0HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762962454; c=relaxed/simple;
	bh=grhClpwYxRL7qRrt3KerIXRZPEHir6/BUz91D1OlEzk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VXpFsxXLs5j6UduL5Thx2QhqS39IRfXpVWHdK6dYXkY01uLk7TNnRMVKh1G2NsUhVUW0ZUczL7TeTR5ReyPt2h7Cxbzgjl93LvpOqRZ/KAyjTkA0FyoEDdHeY2wKmyk9QcovZ7USyig2pUt8RDQkM+XqCuhUMUQkljdtzSusVyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VPNbNVWd; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 35151C0F56F;
	Wed, 12 Nov 2025 15:47:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CC4FD6070B;
	Wed, 12 Nov 2025 15:47:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A6690102F192F;
	Wed, 12 Nov 2025 16:47:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762962449; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=VhJK/nv+0ASiIHxO+Y11CbUntTVgMQKT69rk/ES1NxI=;
	b=VPNbNVWd/yU7bWsjlIzkW2w0EhFc/4gP4SYgqNN3fnjEQhk4Y3ArPU1hKZ9Uq4/z50CEYc
	IYtLbtP2csSaEN2yWQoWXFRrO/lnICI045SU4ETVnzYqK+g38R2Dijoo9xrCK55VYPTqJI
	sOjYXOdnanpEpY9uMu8zOENWzXrX91lnr48zJAHFEtDEqaw1tEraWOVoxNlawKwmD0xIjA
	y3DdwNG+xrrXceNfju/SKobXyCVYums5BCJDe+KyG8Z8ozXqssCvpFaf/BhMMbBL5CpxDK
	RqjOPD/uUBkVMe5SSiG4mEwV2CEHln8G34NxaHxPG8jPeYtZ7eZ4/KklYf8y1g==
Message-ID: <8ee62480-88bc-4b1c-a7d4-fd86819d0441@bootlin.com>
Date: Wed, 12 Nov 2025 16:47:25 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 02/13] net: stmmac: loongson1: use
 PHY_INTF_SEL_x directly
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
 <E1vIjTk-0000000Dqt6-1gN9@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vIjTk-0000000Dqt6-1gN9@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 11/11/2025 09:11, Russell King (Oracle) wrote:
> Use the PHY_INTF_SEL_xx values directly in ls1c_dwmac_syscon_init(),
> converting them to the PHY_INTF_SELI bitfield when calling
> regmap_update_bits().
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
> index 09e2af1d778a..5f9f66fbc191 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
> @@ -38,8 +38,6 @@
>  #define GMAC_SHUT		BIT(6)
>  
>  #define PHY_INTF_SELI		GENMASK(30, 28)
> -#define PHY_INTF_MII		FIELD_PREP(PHY_INTF_SELI, PHY_INTF_SEL_GMII_MII)
> -#define PHY_INTF_RMII		FIELD_PREP(PHY_INTF_SELI, PHY_INTF_SEL_RMII)
>  
>  struct ls1x_dwmac {
>  	struct plat_stmmacenet_data *plat_dat;
> @@ -140,15 +138,14 @@ static int ls1c_dwmac_syscon_init(struct platform_device *pdev, void *priv)
>  	struct ls1x_dwmac *dwmac = priv;
>  	struct plat_stmmacenet_data *plat = dwmac->plat_dat;
>  	struct regmap *regmap = dwmac->regmap;
> +	int phy_intf_sel;
>  
>  	switch (plat->phy_interface) {
>  	case PHY_INTERFACE_MODE_MII:
> -		regmap_update_bits(regmap, LS1X_SYSCON1, PHY_INTF_SELI,
> -				   PHY_INTF_MII);
> +		phy_intf_sel = PHY_INTF_SEL_GMII_MII;
>  		break;
>  	case PHY_INTERFACE_MODE_RMII:
> -		regmap_update_bits(regmap, LS1X_SYSCON1, PHY_INTF_SELI,
> -				   PHY_INTF_RMII);
> +		phy_intf_sel = PHY_INTF_SEL_RMII;
>  		break;
>  	default:
>  		dev_err(&pdev->dev, "Unsupported PHY-mode %u\n",
> @@ -156,6 +153,8 @@ static int ls1c_dwmac_syscon_init(struct platform_device *pdev, void *priv)
>  		return -EOPNOTSUPP;
>  	}
>  
> +	regmap_update_bits(regmap, LS1X_SYSCON1, PHY_INTF_SELI,
> +			   FIELD_PREP(PHY_INTF_SELI, phy_intf_sel));
>  	regmap_update_bits(regmap, LS1X_SYSCON0, GMAC0_SHUT, 0);
>  
>  	return 0;


