Return-Path: <linux-mips+bounces-9040-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AE1ABE80A
	for <lists+linux-mips@lfdr.de>; Wed, 21 May 2025 01:30:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 157764C6D2C
	for <lists+linux-mips@lfdr.de>; Tue, 20 May 2025 23:30:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E220925F991;
	Tue, 20 May 2025 23:30:07 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D4025D1F5;
	Tue, 20 May 2025 23:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747783807; cv=none; b=JGbCVkn3CLHo4rCdqmdPPYDMK27Tpn7N22TJF4pxZWwE7GaMnLkpmyDBUv+e1KL5p1kLPjG5K/jrFXDxtKCnUitB2dc0BggqEPxknCpEmacKugJRHEeERVRxgqqFA9V92h2/0E+PEgnLJ70kaDaN1sTrpZ+18+SX64NzXr0Y01s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747783807; c=relaxed/simple;
	bh=/Yn/tU7urG+QqEUQLpNA79C93Cze2XqrbVp4Cz+CeTg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xpj0EmQgLvknQV28jTmqQAZf5j5MKP6DhAJerC+MmtLXVa92eR0YFJ1z6i80HHGYbXnDErNoxCsrlpNiVCzZwa7H7wA/244rYrBDXxBRYNctKMrbucuqbY0SC97+0Sxd/LJG02aZs5X0ryLAwGvTJDZGnYvtqga+9fsT/KGRdUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37EB0C4CEE9;
	Tue, 20 May 2025 23:30:01 +0000 (UTC)
Message-ID: <215dd4bf-04fd-4ce3-ad1c-2ede18e6f152@linux-m68k.org>
Date: Wed, 21 May 2025 09:29:58 +1000
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/3] net: phy: fixed_phy: remove irq argument
 from fixed_phy_add
To: Heiner Kallweit <hkallweit1@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Hauke Mehrtens
 <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vladimir Oltean <olteanv@gmail.com>, Doug Berger <opendmb@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Thangaraj Samynathan <Thangaraj.S@microchip.com>,
 Rengarajan Sundararajan <Rengarajan.S@microchip.com>,
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org,
 Linux USB Mailing List <linux-usb@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
References: <4d4c468e-300d-42c7-92a1-eabbdb6be748@gmail.com>
 <b3b9b3bc-c310-4a54-b376-c909c83575de@gmail.com>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <b3b9b3bc-c310-4a54-b376-c909c83575de@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Heiner,

On 18/5/25 06:34, Heiner Kallweit wrote:
> All callers pass PHY_POLL, therefore remove irq argument from
> fixed_phy_add().
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>   arch/m68k/coldfire/m5272.c  | 2 +-
>   arch/mips/bcm47xx/setup.c   | 2 +-
>   drivers/net/phy/fixed_phy.c | 5 ++---
>   include/linux/phy_fixed.h   | 5 ++---
>   4 files changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/m68k/coldfire/m5272.c b/arch/m68k/coldfire/m5272.c
> index 734dab657..5b70dfdab 100644
> --- a/arch/m68k/coldfire/m5272.c
> +++ b/arch/m68k/coldfire/m5272.c
> @@ -119,7 +119,7 @@ static struct fixed_phy_status nettel_fixed_phy_status __initdata = {
>   static int __init init_BSP(void)
>   {
>   	m5272_uarts_init();
> -	fixed_phy_add(PHY_POLL, 0, &nettel_fixed_phy_status);
> +	fixed_phy_add(0, &nettel_fixed_phy_status);
>   	clkdev_add_table(m5272_clk_lookup, ARRAY_SIZE(m5272_clk_lookup));
>   	return 0;
>   }

Acked-by: Greg Ungerer <gerg@linux-m68k.org>

Regards
Greg


> diff --git a/arch/mips/bcm47xx/setup.c b/arch/mips/bcm47xx/setup.c
> index 247be207f..de426a474 100644
> --- a/arch/mips/bcm47xx/setup.c
> +++ b/arch/mips/bcm47xx/setup.c
> @@ -282,7 +282,7 @@ static int __init bcm47xx_register_bus_complete(void)
>   	bcm47xx_leds_register();
>   	bcm47xx_workarounds();
>   
> -	fixed_phy_add(PHY_POLL, 0, &bcm47xx_fixed_phy_status);
> +	fixed_phy_add(0, &bcm47xx_fixed_phy_status);
>   	return 0;
>   }
>   device_initcall(bcm47xx_register_bus_complete);
> diff --git a/drivers/net/phy/fixed_phy.c b/drivers/net/phy/fixed_phy.c
> index c91adf246..34a71f223 100644
> --- a/drivers/net/phy/fixed_phy.c
> +++ b/drivers/net/phy/fixed_phy.c
> @@ -160,10 +160,9 @@ static int fixed_phy_add_gpiod(unsigned int irq, int phy_addr,
>   	return 0;
>   }
>   
> -int fixed_phy_add(unsigned int irq, int phy_addr,
> -		  struct fixed_phy_status *status)
> +int fixed_phy_add(int phy_addr, struct fixed_phy_status *status)
>   {
> -	return fixed_phy_add_gpiod(irq, phy_addr, status, NULL);
> +	return fixed_phy_add_gpiod(PHY_POLL, phy_addr, status, NULL);
>   }
>   EXPORT_SYMBOL_GPL(fixed_phy_add);
>   
> diff --git a/include/linux/phy_fixed.h b/include/linux/phy_fixed.h
> index 3392c09b5..316bb4ded 100644
> --- a/include/linux/phy_fixed.h
> +++ b/include/linux/phy_fixed.h
> @@ -17,8 +17,7 @@ struct net_device;
>   
>   #if IS_ENABLED(CONFIG_FIXED_PHY)
>   extern int fixed_phy_change_carrier(struct net_device *dev, bool new_carrier);
> -extern int fixed_phy_add(unsigned int irq, int phy_id,
> -			 struct fixed_phy_status *status);
> +int fixed_phy_add(int phy_id, struct fixed_phy_status *status);
>   extern struct phy_device *fixed_phy_register(unsigned int irq,
>   					     struct fixed_phy_status *status,
>   					     struct device_node *np);
> @@ -28,7 +27,7 @@ extern int fixed_phy_set_link_update(struct phy_device *phydev,
>   			int (*link_update)(struct net_device *,
>   					   struct fixed_phy_status *));
>   #else
> -static inline int fixed_phy_add(unsigned int irq, int phy_id,
> +static inline int fixed_phy_add(int phy_id,
>   				struct fixed_phy_status *status)
>   {
>   	return -ENODEV;


