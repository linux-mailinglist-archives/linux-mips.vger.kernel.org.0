Return-Path: <linux-mips+bounces-12207-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DE1C538ED
	for <lists+linux-mips@lfdr.de>; Wed, 12 Nov 2025 18:02:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A11556265A
	for <lists+linux-mips@lfdr.de>; Wed, 12 Nov 2025 15:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD64334575D;
	Wed, 12 Nov 2025 15:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="AFIU84LV"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311E2343201
	for <linux-mips@vger.kernel.org>; Wed, 12 Nov 2025 15:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762962534; cv=none; b=bkOE8FzRUhl2dkQ7N9602aog1f8F3aLP0w+cZjgIaung0aHUI6tWdYB8DWQmn/a3pxQJQL5Nsmm2LAd+rBbBHr67xS5WJwRqJlqVvAOo3Dz5j47+Kzh8Whv6+eRpjIzYYRxu2mvKrZ+Suy+3K4eyyii080byy3AbGvRlY2nuyGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762962534; c=relaxed/simple;
	bh=2kQJTE5RpFtRcZZ0qLDklU/AI8SyfAVF5JPdjEur5kA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VA7TdDwMTFmum1qUE9VpLOIvNxvXvuQxIgPsPbFVq4AhOWT7/wtQf8AOeF71s+KXI6Ch+pqjdRa6PCihxBJ8Pde+pTcVAxoqbegVsAhHUeUi5NeoAOLNc3nEOAUWV4X9G5jU5+pUkDZTF+pXo1Ta8vfMS6F2KjQUcfcuqk3KOhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=AFIU84LV; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 864681A1A4D;
	Wed, 12 Nov 2025 15:48:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5A0AB6070B;
	Wed, 12 Nov 2025 15:48:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6F5A4102F192F;
	Wed, 12 Nov 2025 16:48:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762962529; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=BxPWeNm+YRcGsylPmhFyIf8ssMNkrL6fNFfSq61DRNY=;
	b=AFIU84LVCv9aPJV/SF2tYePN20e+huFLqBLkCZ+66e6kwA1D+2c2BnsoklPeHAC0VQJ9ko
	Jt7TwxQ+npNn2lutRD3zK8ZYbXWgHWAYhpeScp8WhdWA0Yz2yXxLZoqxstpuOZAJtDSm4v
	syciLtpAjhPCI2a6BXgejWJM24YkPPr5z95u0BXlQ1BtH9+xDFHxNAyekzrNABRoTsg5a0
	iUz05/Qe1gycpcQVqKpsA0Ax2RE+lgvSM1PfD8jvi+ye0VjvQAlST/Xo5VlQnuw+0Jpk5s
	tFxrS6XQXFdG+vjipIb7Is4JXA4zuHmzptCiPChilTqbIxx1CeODkYMid718TA==
Message-ID: <4d203e8d-64ba-4b08-9152-a059426a8a79@bootlin.com>
Date: Wed, 12 Nov 2025 16:48:45 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 04/13] net: stmmac: mediatek: use
 PHY_INTF_SEL_x
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
 <E1vIjTu-0000000DqtI-2sUB@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vIjTu-0000000DqtI-2sUB@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 11/11/2025 09:12, Russell King (Oracle) wrote:
> Use PHY_INTF_SEL_x definitions for the fields that correspond to the
> phy_intf_sel inputs to the dwmac core.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  .../ethernet/stmicro/stmmac/dwmac-mediatek.c   | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> index f1b36f0a401d..dcdf28418fec 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> @@ -17,9 +17,6 @@
>  
>  /* Peri Configuration register for mt2712 */
>  #define PERI_ETH_PHY_INTF_SEL	0x418
> -#define PHY_INTF_MII		0
> -#define PHY_INTF_RGMII		1
> -#define PHY_INTF_RMII		4
>  #define RMII_CLK_SRC_RXC	BIT(4)
>  #define RMII_CLK_SRC_INTERNAL	BIT(5)
>  
> @@ -118,16 +115,16 @@ static int mt2712_set_interface(struct mediatek_dwmac_plat_data *plat)
>  	/* select phy interface in top control domain */
>  	switch (plat->phy_mode) {
>  	case PHY_INTERFACE_MODE_MII:
> -		intf_val |= PHY_INTF_MII;
> +		intf_val |= PHY_INTF_SEL_GMII_MII;
>  		break;
>  	case PHY_INTERFACE_MODE_RMII:
> -		intf_val |= (PHY_INTF_RMII | rmii_rxc | rmii_clk_from_mac);
> +		intf_val |= PHY_INTF_SEL_RMII | rmii_rxc | rmii_clk_from_mac;
>  		break;
>  	case PHY_INTERFACE_MODE_RGMII:
>  	case PHY_INTERFACE_MODE_RGMII_TXID:
>  	case PHY_INTERFACE_MODE_RGMII_RXID:
>  	case PHY_INTERFACE_MODE_RGMII_ID:
> -		intf_val |= PHY_INTF_RGMII;
> +		intf_val |= PHY_INTF_SEL_RGMII;
>  		break;
>  	default:
>  		dev_err(plat->dev, "phy interface not supported\n");
> @@ -297,17 +294,18 @@ static int mt8195_set_interface(struct mediatek_dwmac_plat_data *plat)
>  	/* select phy interface in top control domain */
>  	switch (plat->phy_mode) {
>  	case PHY_INTERFACE_MODE_MII:
> -		intf_val |= FIELD_PREP(MT8195_ETH_INTF_SEL, PHY_INTF_MII);
> +		intf_val |= FIELD_PREP(MT8195_ETH_INTF_SEL,
> +				       PHY_INTF_SEL_GMII_MII);
>  		break;
>  	case PHY_INTERFACE_MODE_RMII:
> -		intf_val |= (rmii_rxc | rmii_clk_from_mac);
> -		intf_val |= FIELD_PREP(MT8195_ETH_INTF_SEL, PHY_INTF_RMII);
> +		intf_val |= rmii_rxc | rmii_clk_from_mac;
> +		intf_val |= FIELD_PREP(MT8195_ETH_INTF_SEL, PHY_INTF_SEL_RMII);
>  		break;
>  	case PHY_INTERFACE_MODE_RGMII:
>  	case PHY_INTERFACE_MODE_RGMII_TXID:
>  	case PHY_INTERFACE_MODE_RGMII_RXID:
>  	case PHY_INTERFACE_MODE_RGMII_ID:
> -		intf_val |= FIELD_PREP(MT8195_ETH_INTF_SEL, PHY_INTF_RGMII);
> +		intf_val |= FIELD_PREP(MT8195_ETH_INTF_SEL, PHY_INTF_SEL_RGMII);
>  		break;
>  	default:
>  		dev_err(plat->dev, "phy interface not supported\n");


