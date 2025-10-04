Return-Path: <linux-mips+bounces-11616-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 309A1BB8CB3
	for <lists+linux-mips@lfdr.de>; Sat, 04 Oct 2025 13:20:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F2AA84E169C
	for <lists+linux-mips@lfdr.de>; Sat,  4 Oct 2025 11:20:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 035ED26A0D5;
	Sat,  4 Oct 2025 11:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d8uayQTf"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D3A20FA9C
	for <linux-mips@vger.kernel.org>; Sat,  4 Oct 2025 11:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759576835; cv=none; b=ij+kQbPzBupB3OiV7RE8o3fGKrAK/DkRBPJktA385pD7clJFboykmCtla98IoALxJ9zc9xKekgzsttBOdA0nm73xpzsES3mqfs4co7Sr9/LE4zZqdIH3OKE4HOl31NIJxRpAtPb2DHc5gCPfKZjG7tSF05GgLHmhgk6U9CHq2ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759576835; c=relaxed/simple;
	bh=A6gbkqNPLWsws9l6PA4pY+F5/1LjeKnCBESKwULMJLg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=G4c4ffjJqShQmjQu4pT/dqqCqLkX/EWqttCRzGi4BeTOtGRjw7X5FemJYXG7PzHOPHNhKcQdNWluAnw9QttAUTR6f6ZXd5IIWAREpdnxNo+ZDgQPr3N1yCF+JEFtHDpzGa64FT7jEvH+acnL9gPaILDI+gkv9LB8xC8PvqhBAQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d8uayQTf; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-46e6a6a5e42so15648905e9.0
        for <linux-mips@vger.kernel.org>; Sat, 04 Oct 2025 04:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759576832; x=1760181632; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lbkIsP1rGYqTUmDEWbcljfJKLg/5/O6Q1FlSSvW+JqA=;
        b=d8uayQTfhtLt/DRoJo1i9rLyjYah3ke3w6/qOn32YfPzW1x5RbpLRCnN7YjBj/0lhS
         7oUJUms4J/ZOc/DOFnU29diqoZAvTvuF7pzD5p9UGH9nBszJxHvoFsaJeaS0Lq6oEdB0
         2lcbNIDbhnYi6yVYWN2Upj1rY1fGy3OtUeQzXKR+lhEttoWQDEGv6ymJuWii0cPhJ8Mx
         p3FCoOQNbnJq7mWHkSb8SBVha2NJTNxDvb6ue6Hqexfmo1zUeQrxMp8FrQRQcKBaC4yA
         jUd0NLXx06xRKpCbkPH7imgf2gcsfmXbc7TOfmvaULBEYw5I3oGlIlpSc1ly5V49HYwP
         460A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759576832; x=1760181632;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lbkIsP1rGYqTUmDEWbcljfJKLg/5/O6Q1FlSSvW+JqA=;
        b=Ge7uuFQ+7UFyeNLWjmsKXpChm84nxqcMS5qmFLOZMl3XVXL1W7zPWzM01qO0DORtlu
         CgQ52btDwQ0mnSPlnegQj6GSGvDk9VrLFumwuAh3NGev4VuFGtOi942XMA9LaLhG15/1
         Ewb9WFhy2QnNPYMdT+5ZrCAyWAlZBE2NHiZVeHG+RxE7i7qdueOujStbERtM6uie/eQr
         VcBDhxDiBDLaAxpIOG2PnbepBXqXsUXU+zoqcG+hmc3X4cfK3wL9NcrlbdZrW7MBGBOV
         15D3BEZEG4rLlZQwT/QrEYiuleA+VKWqA3V4W5H3MQfhLDNrnPfnwxWc5IGPPbCXsKM9
         je1A==
X-Forwarded-Encrypted: i=1; AJvYcCWi0/CcTnfISRpThqD7stX2YZOcy4lWpTcsoJlBjqMbkFVEmlYTzgLeWQZSdDKizB4EZEDI5J9C53t3@vger.kernel.org
X-Gm-Message-State: AOJu0YzXzQ3Mom9nBfTFgqsRpzDGpgZy9e7jHjuNbsX5EWUf4jwR/PpO
	eJx04crH6QUMUCxLnlNcCuG8OIknmNdYQ7kp/yUbyanclVP3I/UppSpH
X-Gm-Gg: ASbGncszttJU8X+WyvPDtBXV1cGCGBcX6999NofLiDQEVaL+XdWJfiHrv+d5EAOgS42
	m91BZ8cq9I+i/t/4LIj33sxJQbVYL5RGyft2aG6bF5CKw1ILxrqttCgRpJEfqQjc66TUw4hlxWE
	9Xp9Ye8WfM3mVYNMF6ouiiGhrd/ME5IpZ2xNoNBUSwaBJQtj6zA43dqWNmETOt8p1DqVFg8Gn06
	qNxyup8AsMqdDrMII6VWhMzKwFPMUaReD9JUYBt9jE1m7IA3OZqU760YMgZ3K2g22fqZF+gZ35E
	5s3O2t5Z8VCcKWJ+zc01Ar9XCFgIw5+v0Bk7es3s9kN5Cu8iKtZo52i8ficLbRq2vD/svPLS90d
	FeoiaDFkR3Y8LoosuO1QUscPFi7wc1wJFv0PGd/FcIbBBV1Mjp4F0miBdt5auYJnU1/yQYZWnik
	5gIWDPnjiGKzzWW3aN8U+b5DO+65nLDPuA8pGV8q6Gs1zMe0pJ+6jaCPGhgHb4QZh9gWxdsLFGp
	LtM14vnOPxRpSWogt8OI7vN
X-Google-Smtp-Source: AGHT+IFa5UcQgutx0vLHvpiT3XihD7Tx8chIVMEyxBcc9Xb/6ftImpfmkCNl2MA3j99P2OCe52cS7g==
X-Received: by 2002:a05:600d:8110:b0:45d:d5df:ab2d with SMTP id 5b1f17b1804b1-46e71146584mr41396905e9.26.1759576831860;
        Sat, 04 Oct 2025 04:20:31 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f35:9e00:6453:3c70:78b7:3fe5? (p200300ea8f359e0064533c7078b73fe5.dip0.t-ipconnect.de. [2003:ea:8f35:9e00:6453:3c70:78b7:3fe5])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-46e6b23d4c5sm110677325e9.17.2025.10.04.04.20.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Oct 2025 04:20:31 -0700 (PDT)
Message-ID: <a7ee2623-1377-47a9-8e7b-b4e5101fc0e2@gmail.com>
Date: Sat, 4 Oct 2025 13:20:38 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: phy: fixed: let fixed_phy_add always use
 addr 0 and remove return value
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Hauke Mehrtens <hauke@hauke-m.de>, Greg Ungerer <gerg@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, David Miller <davem@davemloft.net>,
 Takumi Sueda <puhitaku@gmail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org
References: <762700e5-a0b1-41af-aa03-929822a39475@gmail.com>
 <3c0f31ce-38a8-4f1e-8c39-6aa6ac879dc6@hauke-m.de>
 <418949c9-9aa2-4845-be8a-3395413143c3@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <418949c9-9aa2-4845-be8a-3395413143c3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/24/2025 6:36 PM, Heiner Kallweit wrote:
> On 8/24/2025 6:05 PM, Hauke Mehrtens wrote:
>> On 8/22/25 22:36, Heiner Kallweit wrote:
>>> We have only two users of fixed_phy_add(), both use address 0 and
>>> ignore the return value. So simplify fixed_phy_add() accordingly.
>>>
>>> Whilst at it, constify the fixed_phy_status configs.
>>>
>>> Note:
>>> fixed_phy_add() is a legacy function which shouldn't be used in new
>>> code, as it's use may be problematic:
>>> - No check whether a fixed phy exists already at the given address
>>> - If fixed_phy_register() is called afterwards by any other driver,
>>>    then it will also use phy_addr 0, because fixed_phy_add() ignores
>>>    the ida which manages address assignment
>>> Drivers using a fixed phy created by fixed_phy_add() in platform code,
>>> should dynamically create a fixed phy with fixed_phy_register()
>>> instead.
>>>
>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>> ---
>>>   arch/m68k/coldfire/m5272.c  | 4 ++--
>>>   arch/mips/bcm47xx/setup.c   | 4 ++--
>>>   drivers/net/phy/fixed_phy.c | 4 ++--
>>>   include/linux/phy_fixed.h   | 8 ++------
>>>   4 files changed, 8 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/arch/m68k/coldfire/m5272.c b/arch/m68k/coldfire/m5272.c
>>> index 5b70dfdab..918e2a323 100644
>>> --- a/arch/m68k/coldfire/m5272.c
>>> +++ b/arch/m68k/coldfire/m5272.c
>>> @@ -108,7 +108,7 @@ void __init config_BSP(char *commandp, int size)
>>>    * an ethernet switch. In this case we need to use the fixed phy type,
>>>    * and we need to declare it early in boot.
>>>    */
>>> -static struct fixed_phy_status nettel_fixed_phy_status __initdata = {
>>> +static const struct fixed_phy_status nettel_fixed_phy_status __initconst = {
>>>       .link    = 1,
>>>       .speed    = 100,
>>>       .duplex    = 0,
>>> @@ -119,7 +119,7 @@ static struct fixed_phy_status nettel_fixed_phy_status __initdata = {
>>>   static int __init init_BSP(void)
>>>   {
>>>       m5272_uarts_init();
>>> -    fixed_phy_add(0, &nettel_fixed_phy_status);
>>> +    fixed_phy_add(&nettel_fixed_phy_status);
>>>       clkdev_add_table(m5272_clk_lookup, ARRAY_SIZE(m5272_clk_lookup));
>>>       return 0;
>>>   }
>>> diff --git a/arch/mips/bcm47xx/setup.c b/arch/mips/bcm47xx/setup.c
>>> index de426a474..a93a4266d 100644
>>> --- a/arch/mips/bcm47xx/setup.c
>>> +++ b/arch/mips/bcm47xx/setup.c
>>> @@ -256,7 +256,7 @@ static int __init bcm47xx_cpu_fixes(void)
>>>   }
>>>   arch_initcall(bcm47xx_cpu_fixes);
>>>   -static struct fixed_phy_status bcm47xx_fixed_phy_status __initdata = {
>>> +static const struct fixed_phy_status bcm47xx_fixed_phy_status __initconst = {
>>>       .link    = 1,
>>>       .speed    = SPEED_100,
>>>       .duplex    = DUPLEX_FULL,
>>> @@ -282,7 +282,7 @@ static int __init bcm47xx_register_bus_complete(void)
>>>       bcm47xx_leds_register();
>>>       bcm47xx_workarounds();
>>>   -    fixed_phy_add(0, &bcm47xx_fixed_phy_status);
>>> +    fixed_phy_add(&bcm47xx_fixed_phy_status);
>>>       return 0;
>>>   }
>>>   device_initcall(bcm47xx_register_bus_complete);
>>> diff --git a/drivers/net/phy/fixed_phy.c b/drivers/net/phy/fixed_phy.c
>>> index 7902b35c5..b39532abf 100644
>>> --- a/drivers/net/phy/fixed_phy.c
>>> +++ b/drivers/net/phy/fixed_phy.c
>>> @@ -153,9 +153,9 @@ static int fixed_phy_add_gpiod(unsigned int irq, int phy_addr,
>>>       return 0;
>>>   }
>>>   -int fixed_phy_add(int phy_addr, const struct fixed_phy_status *status)
>>> +void fixed_phy_add(const struct fixed_phy_status *status)
>>>   {
>>> -    return fixed_phy_add_gpiod(PHY_POLL, phy_addr, status, NULL);
>>> +    fixed_phy_add_gpiod(PHY_POLL, 0, status, NULL);
>>>   }
>>>   EXPORT_SYMBOL_GPL(fixed_phy_add);
>>>   diff --git a/include/linux/phy_fixed.h b/include/linux/phy_fixed.h
>>> index 5399b9e41..6227a1bde 100644
>>> --- a/include/linux/phy_fixed.h
>>> +++ b/include/linux/phy_fixed.h
>>> @@ -17,7 +17,7 @@ struct net_device;
>>>     #if IS_ENABLED(CONFIG_FIXED_PHY)
>>>   extern int fixed_phy_change_carrier(struct net_device *dev, bool new_carrier);
>>> -int fixed_phy_add(int phy_id, const struct fixed_phy_status *status);
>>> +void fixed_phy_add(const struct fixed_phy_status *status);
>>>   struct phy_device *fixed_phy_register(const struct fixed_phy_status *status,
>>>                         struct device_node *np);
>>>   @@ -26,11 +26,7 @@ extern int fixed_phy_set_link_update(struct phy_device *phydev,
>>>               int (*link_update)(struct net_device *,
>>>                          struct fixed_phy_status *));
>>>   #else
>>> -static inline int fixed_phy_add(int phy_id,
>>> -                const struct fixed_phy_status *status)
>>> -{
>>> -    return -ENODEV;
>>> -}
>>> +static inline void fixed_phy_add(const struct fixed_phy_status *status) {}
>>>   static inline struct phy_device *
>>>   fixed_phy_register(const struct fixed_phy_status *status,
>>>              struct device_node *np)
>>
>> Hi,
>>
>> I do not use this hardware any more, but Takumi reported that fixed_phy_add() is not working for the PHY registration on brcm47xx any more and we have to use fixed_phy_register(), see:
>> https://github.com/openwrt/openwrt/pull/19610
>>
> I suspected already that fixed_phy_add() usage doesn't work any longer, but don't
> have hw to test. I think bfa54812f0bc ("net: phy: fixed_phy: set phy_mask before
> calling mdiobus_register()") is to blame.
> Reverting this commit or changing the line to fmb->mii_bus->phy_mask = ~1;
> should fix the problem. Would be great if Takumi could test this.
> 
Did you have the chance to test this?

> The cleaner alternative would be:
> - remove call to fixed_phy_add() from platform code
> - let b44 call fixed_phy_register() if a fixed phy is needed
>   Below is a WIP version of this change.
> 
>> Does this need a bigger refactoring anyway?
>>
>> Hauke
> 
> Heiner
> 
> 
> ---
>  drivers/net/ethernet/broadcom/Kconfig |  1 +
>  drivers/net/ethernet/broadcom/b44.c   | 33 ++++++++++++++-------------
>  2 files changed, 18 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/net/ethernet/broadcom/Kconfig b/drivers/net/ethernet/broadcom/Kconfig
> index 0fc10e6c6..99292392d 100644
> --- a/drivers/net/ethernet/broadcom/Kconfig
> +++ b/drivers/net/ethernet/broadcom/Kconfig
> @@ -25,6 +25,7 @@ config B44
>  	select SSB
>  	select MII
>  	select PHYLIB
> +	select FIXED_PHY
>  	help
>  	  If you have a network (Ethernet) controller of this type, say Y
>  	  or M here.
> diff --git a/drivers/net/ethernet/broadcom/b44.c b/drivers/net/ethernet/broadcom/b44.c
> index 0353359c3..abbb5953c 100644
> --- a/drivers/net/ethernet/broadcom/b44.c
> +++ b/drivers/net/ethernet/broadcom/b44.c
> @@ -31,6 +31,7 @@
>  #include <linux/ssb/ssb.h>
>  #include <linux/slab.h>
>  #include <linux/phy.h>
> +#include <linux/phy_fixed.h>
>  
>  #include <linux/uaccess.h>
>  #include <asm/io.h>
> @@ -2233,7 +2234,6 @@ static int b44_register_phy_one(struct b44 *bp)
>  	struct mii_bus *mii_bus;
>  	struct ssb_device *sdev = bp->sdev;
>  	struct phy_device *phydev;
> -	char bus_id[MII_BUS_ID_SIZE + 3];
>  	struct ssb_sprom *sprom = &sdev->bus->sprom;
>  	int err;
>  
> @@ -2260,27 +2260,26 @@ static int b44_register_phy_one(struct b44 *bp)
>  		goto err_out_mdiobus;
>  	}
>  
> -	if (!mdiobus_is_registered_device(bp->mii_bus, bp->phy_addr) &&
> -	    (sprom->boardflags_lo & (B44_BOARDFLAG_ROBO | B44_BOARDFLAG_ADM))) {
> -
> +	phydev = mdiobus_get_phy(bp->mii_bus, bp->phy_addr);
> +	if (!phydev &&
> +	    sprom->boardflags_lo & (B44_BOARDFLAG_ROBO | B44_BOARDFLAG_ADM)) {
>  		dev_info(sdev->dev,
>  			 "could not find PHY at %i, use fixed one\n",
>  			 bp->phy_addr);
>  
> -		bp->phy_addr = 0;
> -		snprintf(bus_id, sizeof(bus_id), PHY_ID_FMT, "fixed-0",
> -			 bp->phy_addr);
> -	} else {
> -		snprintf(bus_id, sizeof(bus_id), PHY_ID_FMT, mii_bus->id,
> -			 bp->phy_addr);
> +		phydev = fixed_phy_register(NULL, NULL);
> +		if (!IS_ERR(phydev))
> +			bp->phy_addr = phydev->mdio.addr;
>  	}
>  
> -	phydev = phy_connect(bp->dev, bus_id, &b44_adjust_link,
> -			     PHY_INTERFACE_MODE_MII);
> -	if (IS_ERR(phydev)) {
> +	if (IS_ERR_OR_NULL(phydev))
> +		err = -ENODEV;
> +	else
> +		err = phy_connect_direct(bp->dev, phydev, &b44_adjust_link,
> +					 PHY_INTERFACE_MODE_MII);
> +	if (err) {
>  		dev_err(sdev->dev, "could not attach PHY at %i\n",
>  			bp->phy_addr);
> -		err = PTR_ERR(phydev);
>  		goto err_out_mdiobus_unregister;
>  	}
>  
> @@ -2293,7 +2292,6 @@ static int b44_register_phy_one(struct b44 *bp)
>  	linkmode_copy(phydev->advertising, phydev->supported);
>  
>  	bp->old_link = 0;
> -	bp->phy_addr = phydev->mdio.addr;
>  
>  	phy_attached_info(phydev);
>  
> @@ -2313,8 +2311,11 @@ static void b44_unregister_phy_one(struct b44 *bp)
>  {
>  	struct net_device *dev = bp->dev;
>  	struct mii_bus *mii_bus = bp->mii_bus;
> +	struct phy_device *phydev = dev->phydev);
>  
> -	phy_disconnect(dev->phydev);
> +	phy_disconnect(phydev);
> +	if (phy_is_pseudo_fixed_link(phydev))
> +		fixed_phy_unregister(phydev);
>  	mdiobus_unregister(mii_bus);
>  	mdiobus_free(mii_bus);
>  }


