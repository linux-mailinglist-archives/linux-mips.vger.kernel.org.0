Return-Path: <linux-mips+bounces-12208-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A80DDC5362A
	for <lists+linux-mips@lfdr.de>; Wed, 12 Nov 2025 17:27:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 67E7D502F2D
	for <lists+linux-mips@lfdr.de>; Wed, 12 Nov 2025 15:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53730342539;
	Wed, 12 Nov 2025 15:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Rf52EPAv"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3498C33AD95
	for <linux-mips@vger.kernel.org>; Wed, 12 Nov 2025 15:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762962663; cv=none; b=Rdfd5/oWuq121SkO6md6Sf22DMKXtUQN6Ysr2WNb9NAN3RNRQFjWB7KEQvSqM0tIZVVsvIB0wzNVii+VBs7/TB4PinYNa+B2p9ouT5T8AqPmbFMR1yyfhV6KlNlWzEGkkpK8gNxt1iMGf5KQlOuv6R2K0jlFV3QBeuhgUsO1MV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762962663; c=relaxed/simple;
	bh=MFNtveuybcY3Iwuv4PAcw+Ke2Xofpxk2NFLEiC+XRxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aF2sP+0dLdkYIYQKOHZc3/f6zUBFw5TGsq9qk9jf3mQyFvHOEzfijDf7QoHeK8u7ypaqdqL4ZYwuUc694NeklTRSX0HeQMH3HtRdXXJm9tz2sMB0RBx3dTlg4EcP6mUNrJ+MExjZa3bR5taLW8lewj8BET9s88zN8vnjnLy/Mrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Rf52EPAv; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C734E4E4165B;
	Wed, 12 Nov 2025 15:50:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 89CD66070B;
	Wed, 12 Nov 2025 15:50:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 36D47102F192F;
	Wed, 12 Nov 2025 16:50:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762962658; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=PE/by9xGlpliyTkU9/7ICSd2kT72lNbYlkzDGAbEjZc=;
	b=Rf52EPAv3ODh6rEa2D+DkHboNpH9TA7v+uh/li3aVbv7fRladsDLoyJgAI6HxP3Hk6C6W5
	IGZ+6yHtu4DrB/qEukmabXELTAlXzuXW7NIP8zBEv+3mg6jXK3TsC2OjEpapFBwbcx59wp
	H5KNfB0Aoh+HiicSaAy45d44XDzjHuUVNMuwNKI86smm5RZdZYHRErG6gnCO+rerHPkIog
	j/M1osJa7yPCH+GyisDOlOEHo8v5lgQVdpb6Z9MUJBQY6grbgfFIKTB4wAwSfs9tXYgXws
	6Qucm4a2vbXwvJYZNi8zak7TKlQK8PSlvHn0POq61xAecUBw1nPWwiTJYWKI8w==
Message-ID: <0383a8e8-1713-438e-86c6-69c8b01cfb48@bootlin.com>
Date: Wed, 12 Nov 2025 16:50:51 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 05/13] net: stmmac: mediatek: use
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
 <E1vIjTz-0000000DqtP-3N9v@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vIjTz-0000000DqtP-3N9v@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 11/11/2025 09:12, Russell King (Oracle) wrote:
> Use stmmac_get_phy_intf_sel() to decode the PHY interface mode to the
> phy_intf_sel value, validate the result, and pass that into the
> implementation specific ->dwmac_set_phy_interface() method. Use this
> to configure the PHY interface selection field.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  .../ethernet/stmicro/stmmac/dwmac-mediatek.c  | 43 +++++++++++--------
>  1 file changed, 25 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> index dcdf28418fec..0f32732efb75 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> @@ -85,7 +85,8 @@ struct mediatek_dwmac_plat_data {
>  };
>  
>  struct mediatek_dwmac_variant {
> -	int (*dwmac_set_phy_interface)(struct mediatek_dwmac_plat_data *plat);
> +	int (*dwmac_set_phy_interface)(struct mediatek_dwmac_plat_data *plat,
> +				       u8 phy_intf_sel);
>  	int (*dwmac_set_delay)(struct mediatek_dwmac_plat_data *plat);
>  
>  	/* clock ids to be requested */
> @@ -106,25 +107,25 @@ static const char * const mt8195_dwmac_clk_l[] = {
>  	"axi", "apb", "mac_cg", "mac_main", "ptp_ref"
>  };
>  
> -static int mt2712_set_interface(struct mediatek_dwmac_plat_data *plat)
> +static int mt2712_set_interface(struct mediatek_dwmac_plat_data *plat,
> +				u8 phy_intf_sel)
>  {
>  	int rmii_clk_from_mac = plat->rmii_clk_from_mac ? RMII_CLK_SRC_INTERNAL : 0;
>  	int rmii_rxc = plat->rmii_rxc ? RMII_CLK_SRC_RXC : 0;
> -	u32 intf_val = 0;
> +	u32 intf_val;
> +
> +	intf_val = phy_intf_sel;
>  
>  	/* select phy interface in top control domain */
>  	switch (plat->phy_mode) {
> -	case PHY_INTERFACE_MODE_MII:
> -		intf_val |= PHY_INTF_SEL_GMII_MII;
> -		break;
>  	case PHY_INTERFACE_MODE_RMII:
> -		intf_val |= PHY_INTF_SEL_RMII | rmii_rxc | rmii_clk_from_mac;
> +		intf_val |= rmii_rxc | rmii_clk_from_mac;
>  		break;
> +	case PHY_INTERFACE_MODE_MII:
>  	case PHY_INTERFACE_MODE_RGMII:
>  	case PHY_INTERFACE_MODE_RGMII_TXID:
>  	case PHY_INTERFACE_MODE_RGMII_RXID:
>  	case PHY_INTERFACE_MODE_RGMII_ID:
> -		intf_val |= PHY_INTF_SEL_RGMII;
>  		break;
>  	default:
>  		dev_err(plat->dev, "phy interface not supported\n");
> @@ -285,27 +286,25 @@ static const struct mediatek_dwmac_variant mt2712_gmac_variant = {
>  		.tx_delay_max = 17600,
>  };
>  
> -static int mt8195_set_interface(struct mediatek_dwmac_plat_data *plat)
> +static int mt8195_set_interface(struct mediatek_dwmac_plat_data *plat,
> +				u8 phy_intf_sel)
>  {
>  	int rmii_clk_from_mac = plat->rmii_clk_from_mac ? MT8195_RMII_CLK_SRC_INTERNAL : 0;
>  	int rmii_rxc = plat->rmii_rxc ? MT8195_RMII_CLK_SRC_RXC : 0;
> -	u32 intf_val = 0;
> +	u32 intf_val;
> +
> +	intf_val = FIELD_PREP(MT8195_ETH_INTF_SEL, phy_intf_sel);
>  
>  	/* select phy interface in top control domain */
>  	switch (plat->phy_mode) {
> -	case PHY_INTERFACE_MODE_MII:
> -		intf_val |= FIELD_PREP(MT8195_ETH_INTF_SEL,
> -				       PHY_INTF_SEL_GMII_MII);
> -		break;
>  	case PHY_INTERFACE_MODE_RMII:
>  		intf_val |= rmii_rxc | rmii_clk_from_mac;
> -		intf_val |= FIELD_PREP(MT8195_ETH_INTF_SEL, PHY_INTF_SEL_RMII);
>  		break;
> +	case PHY_INTERFACE_MODE_MII:
>  	case PHY_INTERFACE_MODE_RGMII:
>  	case PHY_INTERFACE_MODE_RGMII_TXID:
>  	case PHY_INTERFACE_MODE_RGMII_RXID:
>  	case PHY_INTERFACE_MODE_RGMII_ID:
> -		intf_val |= FIELD_PREP(MT8195_ETH_INTF_SEL, PHY_INTF_SEL_RGMII);
>  		break;
>  	default:
>  		dev_err(plat->dev, "phy interface not supported\n");
> @@ -525,10 +524,18 @@ static int mediatek_dwmac_init(struct device *dev, void *priv)
>  {
>  	struct mediatek_dwmac_plat_data *plat = priv;
>  	const struct mediatek_dwmac_variant *variant = plat->variant;
> -	int ret;
> +	int phy_intf_sel, ret;
>  
>  	if (variant->dwmac_set_phy_interface) {
> -		ret = variant->dwmac_set_phy_interface(plat);
> +		phy_intf_sel = stmmac_get_phy_intf_sel(plat->phy_mode);
> +		if (phy_intf_sel != PHY_INTF_SEL_GMII_MII &&
> +		    phy_intf_sel != PHY_INTF_SEL_RGMII &&
> +		    phy_intf_sel != PHY_INTF_SEL_RMII) {
> +			dev_err(plat->dev, "phy interface not supported\n");
> +			return phy_intf_sel < 0 ? phy_intf_sel : -EINVAL;
> +		}
> +
> +		ret = variant->dwmac_set_phy_interface(plat, phy_intf_sel);
>  		if (ret) {
>  			dev_err(dev, "failed to set phy interface, err = %d\n", ret);
>  			return ret;


