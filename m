Return-Path: <linux-mips+bounces-12209-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC29C53465
	for <lists+linux-mips@lfdr.de>; Wed, 12 Nov 2025 17:07:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 74F9E4F726C
	for <lists+linux-mips@lfdr.de>; Wed, 12 Nov 2025 15:56:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9A8F345759;
	Wed, 12 Nov 2025 15:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mH4S60as"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8325833D6F7
	for <linux-mips@vger.kernel.org>; Wed, 12 Nov 2025 15:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762962756; cv=none; b=BMPJ5A/3f2t9zCaabx5H4a6vY9FvO2048KfmDW3I+7g1sDzOXU/zHoGEadGx1v1wPDQN5BioUHAj29YmWqloAeAhfxNbkruj3R8VXFOcS0K22bCt5lKJOBU52BAxV0u685VJ7K6ytZvVmuqZWvW0tiCPRMnyQYzVa5C+p/3GQ7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762962756; c=relaxed/simple;
	bh=tR7bI/m025l7tOJNK6FhBW5pPPIFCb98vBpLMQ0VV+U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TSPGiIbBCN634jCASfoxugcMVfBZnZBGB6SCWkShWvYMqxUzsgt+dfSXlJ7eqO/+1TlhI1Jg9wHTmY3o3/MMuV8X3f60rGafxv5v17Y08fCqmHGA26XwH7TB6tUo/hmrYm/Y+OHW0a63jL0hIm1ebkPKHAbJVoae7R7RlYI7I/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mH4S60as; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E69621A1A2E;
	Wed, 12 Nov 2025 15:52:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B917D6070B;
	Wed, 12 Nov 2025 15:52:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 14C42102F1C6A;
	Wed, 12 Nov 2025 16:52:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762962751; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=r4KXq6vkaTt39JXbcQflKkjoNE2v/KM+S0WlsXZAnWY=;
	b=mH4S60asMSlrYa5LEl6HMPEaLrLHp3nTRcdY789GHstthPo+1ZKZOasDuBrvb/B7xSIJEn
	gLzFsmmQ0/YWMUZHd/Z8nE9LwO7kahUfw3IPS08jPLIbyJ1yFIKoMI2HU9OGN5Vztdt57z
	obPJXopwHPqceIemoztIMNv9uBZZYwgqEEGBlbSxJkL78OokCAW/aHVsokKNEOg1DXfpY4
	SqWYxCOGnZoqaZ9zVjUpQxVeBTpLPYJ0PY4dkUZ6rS3UkYEtghKVjpNqjJgew8uhSYn1Fa
	ljP0wuCUmm4Jp1567gNaGadL5i/B1bXOwL1NTRRMtnsEKZp0j9AqTV3k5nc9cA==
Message-ID: <a4dfe008-a7e2-4323-bed5-a444dcc6aa3d@bootlin.com>
Date: Wed, 12 Nov 2025 16:52:23 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 06/13] net: stmmac: mediatek: simplify
 set_interface() methods
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
 <E1vIjU4-0000000DqtV-3qsX@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vIjU4-0000000DqtV-3qsX@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 11/11/2025 09:12, Russell King (Oracle) wrote:
> Use the phy_intf_sel field value when deciding what other options to
> apply for the configuration register.
> 
> Note that this will allow GMII as well as MII as the phy_intf_sel
> value is the same for both.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  .../ethernet/stmicro/stmmac/dwmac-mediatek.c  | 50 +++++--------------
>  1 file changed, 12 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> index 0f32732efb75..1f2d7d19ca56 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> @@ -110,26 +110,13 @@ static const char * const mt8195_dwmac_clk_l[] = {
>  static int mt2712_set_interface(struct mediatek_dwmac_plat_data *plat,
>  				u8 phy_intf_sel)
>  {
> -	int rmii_clk_from_mac = plat->rmii_clk_from_mac ? RMII_CLK_SRC_INTERNAL : 0;
> -	int rmii_rxc = plat->rmii_rxc ? RMII_CLK_SRC_RXC : 0;
> -	u32 intf_val;
> +	u32 intf_val = phy_intf_sel;
>  
> -	intf_val = phy_intf_sel;
> -
> -	/* select phy interface in top control domain */
> -	switch (plat->phy_mode) {
> -	case PHY_INTERFACE_MODE_RMII:
> -		intf_val |= rmii_rxc | rmii_clk_from_mac;
> -		break;
> -	case PHY_INTERFACE_MODE_MII:
> -	case PHY_INTERFACE_MODE_RGMII:
> -	case PHY_INTERFACE_MODE_RGMII_TXID:
> -	case PHY_INTERFACE_MODE_RGMII_RXID:
> -	case PHY_INTERFACE_MODE_RGMII_ID:
> -		break;
> -	default:
> -		dev_err(plat->dev, "phy interface not supported\n");
> -		return -EINVAL;
> +	if (phy_intf_sel == PHY_INTF_SEL_RMII) {
> +		if (plat->rmii_clk_from_mac)
> +			intf_val |= RMII_CLK_SRC_INTERNAL;
> +		if (plat->rmii_rxc)
> +			intf_val |= RMII_CLK_SRC_RXC;
>  	}
>  
>  	regmap_write(plat->peri_regmap, PERI_ETH_PHY_INTF_SEL, intf_val);
> @@ -289,26 +276,13 @@ static const struct mediatek_dwmac_variant mt2712_gmac_variant = {
>  static int mt8195_set_interface(struct mediatek_dwmac_plat_data *plat,
>  				u8 phy_intf_sel)
>  {
> -	int rmii_clk_from_mac = plat->rmii_clk_from_mac ? MT8195_RMII_CLK_SRC_INTERNAL : 0;
> -	int rmii_rxc = plat->rmii_rxc ? MT8195_RMII_CLK_SRC_RXC : 0;
> -	u32 intf_val;
> +	u32 intf_val = FIELD_PREP(MT8195_ETH_INTF_SEL, phy_intf_sel);
>  
> -	intf_val = FIELD_PREP(MT8195_ETH_INTF_SEL, phy_intf_sel);
> -
> -	/* select phy interface in top control domain */
> -	switch (plat->phy_mode) {
> -	case PHY_INTERFACE_MODE_RMII:
> -		intf_val |= rmii_rxc | rmii_clk_from_mac;
> -		break;
> -	case PHY_INTERFACE_MODE_MII:
> -	case PHY_INTERFACE_MODE_RGMII:
> -	case PHY_INTERFACE_MODE_RGMII_TXID:
> -	case PHY_INTERFACE_MODE_RGMII_RXID:
> -	case PHY_INTERFACE_MODE_RGMII_ID:
> -		break;
> -	default:
> -		dev_err(plat->dev, "phy interface not supported\n");
> -		return -EINVAL;
> +	if (phy_intf_sel == PHY_INTF_SEL_RMII) {
> +		if (plat->rmii_clk_from_mac)
> +			intf_val |= MT8195_RMII_CLK_SRC_INTERNAL;
> +		if (plat->rmii_rxc)
> +			intf_val |= MT8195_RMII_CLK_SRC_RXC;
>  	}
>  
>  	/* MT8195 only support external PHY */


