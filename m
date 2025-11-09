Return-Path: <linux-mips+bounces-12156-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B07C44291
	for <lists+linux-mips@lfdr.de>; Sun, 09 Nov 2025 17:39:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 91F09346830
	for <lists+linux-mips@lfdr.de>; Sun,  9 Nov 2025 16:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDFF5303C9C;
	Sun,  9 Nov 2025 16:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="aIoKA3TZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0248330103F;
	Sun,  9 Nov 2025 16:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762706348; cv=none; b=IHS8RNyGEwwYNXA/iJDEIGvhvV+ob+3Ie9YrMhKw58tRlKd6cTtr8jYYRjYVwpE5BUaiPVQM0IfDMU5k89wAeAj3lm4K5zuRnXYMV7P1iZWJHjVnW4lSm9LRDqkdAK8iffGu0BiF+cGl2jBoX9gCoON31o0scglEo/ZSdR91P7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762706348; c=relaxed/simple;
	bh=558ql1lBrws+DbFADkW8iDQxNoKcbbz+R8lE0Q/Qe7I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SExuuNRNc/FB20qNGR5albY2fOmN9QpDb3/IAmrcuq7S65BimOu7Cib1zxdKn+MJAyWEmYX2sGOM08Joa+XNNCf8exPV/CUno0VyLbVlrOl1WhyuH9QGlIeCfGEK0vrrZHZJSSHWTIQnxIsm32odxLu+j23PjNoCocVD0w19daQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=aIoKA3TZ; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7598FC108C7;
	Sun,  9 Nov 2025 16:38:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BCD0D606F5;
	Sun,  9 Nov 2025 16:39:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 66E9011853189;
	Sun,  9 Nov 2025 17:38:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762706339; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=ZPRMEMcp2dhUGBHSuTRmxmLz/+slEndBNL5XpFqtZ1U=;
	b=aIoKA3TZ8t6K+Vrshq3NfDorKiZuRejrlRcVM0UIqysbh10hoVWL/cFDQhnbe6lSgmOWR0
	uarz8vGDSht8iVMcwkPYyBxJjPFdP7M6zXkR37d8DrJIdoZygxRdQq+7li1H0hHStZwqWR
	daNbvdSgrgRc7RjtZdrQcXdI8UR0Aph/BG+sFxJJTMPqR/sWkHAj6VUwTAXQK8OSr8e/Mr
	KGNYX84FHVQkFyJhxmFq51m5AWO/5263nSruhA8vU2zzrFNPt2eFYtVdJFTHqJkYsTJkpW
	nyIToGDmgTbgMXEt7bAePomqHPtkWBJ+w4z9jj9+8PmpuLrHiKK2RuV0GMylRw==
Message-ID: <e309efc0-1b03-416c-8464-af92cc428acf@bootlin.com>
Date: Sun, 9 Nov 2025 17:38:45 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 16/16] net: stmmac: visconti: use
 stmmac_get_phy_intf_sel()
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "David S. Miller" <davem@davemloft.net>,
 Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Keguang Zhang <keguang.zhang@gmail.com>, Kevin Hilman
 <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Minda Chen <minda.chen@starfivetech.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
 Paolo Abeni <pabeni@redhat.com>
References: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk>
 <E1vHNSq-0000000DkTN-3RoV@rmk-PC.armlinux.org.uk>
 <14f80863-5766-437a-8e38-8991a1a725f9@bootlin.com>
 <aQ74G_WqoAusC2wd@shell.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <aQ74G_WqoAusC2wd@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 08/11/2025 08:58, Russell King (Oracle) wrote:
> On Fri, Nov 07, 2025 at 07:23:26PM +0100, Maxime Chevallier wrote:
>> Hi Russell,
>>
>> On 07/11/2025 15:29, Russell King (Oracle) wrote:
>>> -	switch (plat_dat->phy_interface) {
>>> -	case PHY_INTERFACE_MODE_RGMII:
>>> -	case PHY_INTERFACE_MODE_RGMII_ID:
>>> -	case PHY_INTERFACE_MODE_RGMII_RXID:
>>> -	case PHY_INTERFACE_MODE_RGMII_TXID:
>>> -		phy_intf_sel = ETHER_CONFIG_INTF_RGMII;
>>> -		break;
>>> -	case PHY_INTERFACE_MODE_MII:
>>> -		phy_intf_sel = ETHER_CONFIG_INTF_MII;
>>> -		break;
>>> -	case PHY_INTERFACE_MODE_RMII:
>>> -		phy_intf_sel = ETHER_CONFIG_INTF_RMII;
>>> -		break;
>>> -	default:
>>> +	int phy_intf_sel;
>>> +
>>> +	phy_intf_sel = stmmac_get_phy_intf_sel(plat_dat->phy_interface);
>>> +	if (phy_intf_sel != PHY_INTF_SEL_GMII_MII &&
>>> +	    phy_intf_sel != PHY_INTF_SEL_RGMII &&
>>> +	    phy_intf_sel != PHY_INTF_SEL_RMII) {
>>>  		dev_err(&pdev->dev, "Unsupported phy-mode (%d)\n", plat_dat->phy_interface);
>>>  		return -EOPNOTSUPP;
>>>  	}
>>
>> Probably not too big of a deal, but don't we now incorrectly accept the
>> "gmii" mode ?
> 
> We will accept GMII mode, but (a) does that matter, and (b) shouldn't
> the DT binding be checking the phy-mode (we have some bindings that do.)

Thanks for the clarification, that's fine by me then :)

Maxime


