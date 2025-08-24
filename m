Return-Path: <linux-mips+bounces-10521-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 373CEB33154
	for <lists+linux-mips@lfdr.de>; Sun, 24 Aug 2025 18:05:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 111471B25791
	for <lists+linux-mips@lfdr.de>; Sun, 24 Aug 2025 16:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75EF41EF363;
	Sun, 24 Aug 2025 16:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hauke-m.de header.i=@hauke-m.de header.b="lg6BsDEj"
X-Original-To: linux-mips@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4D51805E;
	Sun, 24 Aug 2025 16:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756051539; cv=none; b=JM18h8WRywZ1laarm6A8YoG4lSXfsCxk6DOYJuxscnZqIxjrUhdAGMVCgnivB6RiZbHF1kn6/oKSL9psUiothcLrbG7F4PNp6TLM0asIarUx6c6TrZrFB3NAD7WPKbKbx/XNF085CFCoD+FQIms1iQ4UAUfVwYK6a+G/D/lJ5Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756051539; c=relaxed/simple;
	bh=Mi7F3tei2rj1HymPB3blUPLuefLWtod+S/dRQyDqiIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Se3kGXSBMZzaoixQqRwI3jwfuChMc3XQ1ZXoDFHVolLyZq3szFeHPMb3MVDOSSktKqG0g86ZbQprH2m2pvUr/CoyWT/OwSM1xtLYGweI2jKev5pp/ZFQgsA8+/7cKlouOZKGZekhrzBPBd54gKsSPseqh3aJEcI6BSgUeryr/a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hauke-m.de; spf=pass smtp.mailfrom=hauke-m.de; dkim=pass (2048-bit key) header.d=hauke-m.de header.i=@hauke-m.de header.b=lg6BsDEj; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hauke-m.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hauke-m.de
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4c8zKm4XK6z9ttW;
	Sun, 24 Aug 2025 18:05:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hauke-m.de; s=MBO0001;
	t=1756051532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lv+ks0EhXGLhxzJIKgt/PifkJOMUPAtRtcGjDgfWzTA=;
	b=lg6BsDEjyqfrxlz6EsZA1h6JdqrEWpUDrq09kMZQ+2Eg7PX9sdTfn7IWC+b0BX8qStAgOm
	hy4v+RdkWvLpd7yFDJRCcldCDzWJo3GcUQM5FpXi+rP/JsD/Rvfa53sL1Y19w6P8xySTra
	gNePx87ZpXgpGVGcp7CCiAyQQD5aPUDEIju4rVCCXL0hsh5hzY4QvoT6KPRudKNR/gf74b
	XdXw0CyljXT31qVLeqsR/bZ31kQPFCf/kiwqaPR9fdN5QWZSKzmfm+/kEeXQz4uheZb6IC
	R97/eKy+9faheJBPa8wDHNT5RaBr32PbIyYBYKaPZmg84eUAqEF7phEhR6avpg==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of hauke@hauke-m.de designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=hauke@hauke-m.de
Message-ID: <3c0f31ce-38a8-4f1e-8c39-6aa6ac879dc6@hauke-m.de>
Date: Sun, 24 Aug 2025 18:05:28 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net-next] net: phy: fixed: let fixed_phy_add always use
 addr 0 and remove return value
To: Heiner Kallweit <hkallweit1@gmail.com>, Greg Ungerer
 <gerg@linux-m68k.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Andrew Lunn
 <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, David Miller <davem@davemloft.net>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 Takumi Sueda <puhitaku@gmail.com>
References: <762700e5-a0b1-41af-aa03-929822a39475@gmail.com>
Content-Language: en-US
From: Hauke Mehrtens <hauke@hauke-m.de>
In-Reply-To: <762700e5-a0b1-41af-aa03-929822a39475@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4c8zKm4XK6z9ttW

On 8/22/25 22:36, Heiner Kallweit wrote:
> We have only two users of fixed_phy_add(), both use address 0 and
> ignore the return value. So simplify fixed_phy_add() accordingly.
> 
> Whilst at it, constify the fixed_phy_status configs.
> 
> Note:
> fixed_phy_add() is a legacy function which shouldn't be used in new
> code, as it's use may be problematic:
> - No check whether a fixed phy exists already at the given address
> - If fixed_phy_register() is called afterwards by any other driver,
>    then it will also use phy_addr 0, because fixed_phy_add() ignores
>    the ida which manages address assignment
> Drivers using a fixed phy created by fixed_phy_add() in platform code,
> should dynamically create a fixed phy with fixed_phy_register()
> instead.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>   arch/m68k/coldfire/m5272.c  | 4 ++--
>   arch/mips/bcm47xx/setup.c   | 4 ++--
>   drivers/net/phy/fixed_phy.c | 4 ++--
>   include/linux/phy_fixed.h   | 8 ++------
>   4 files changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/m68k/coldfire/m5272.c b/arch/m68k/coldfire/m5272.c
> index 5b70dfdab..918e2a323 100644
> --- a/arch/m68k/coldfire/m5272.c
> +++ b/arch/m68k/coldfire/m5272.c
> @@ -108,7 +108,7 @@ void __init config_BSP(char *commandp, int size)
>    * an ethernet switch. In this case we need to use the fixed phy type,
>    * and we need to declare it early in boot.
>    */
> -static struct fixed_phy_status nettel_fixed_phy_status __initdata = {
> +static const struct fixed_phy_status nettel_fixed_phy_status __initconst = {
>   	.link	= 1,
>   	.speed	= 100,
>   	.duplex	= 0,
> @@ -119,7 +119,7 @@ static struct fixed_phy_status nettel_fixed_phy_status __initdata = {
>   static int __init init_BSP(void)
>   {
>   	m5272_uarts_init();
> -	fixed_phy_add(0, &nettel_fixed_phy_status);
> +	fixed_phy_add(&nettel_fixed_phy_status);
>   	clkdev_add_table(m5272_clk_lookup, ARRAY_SIZE(m5272_clk_lookup));
>   	return 0;
>   }
> diff --git a/arch/mips/bcm47xx/setup.c b/arch/mips/bcm47xx/setup.c
> index de426a474..a93a4266d 100644
> --- a/arch/mips/bcm47xx/setup.c
> +++ b/arch/mips/bcm47xx/setup.c
> @@ -256,7 +256,7 @@ static int __init bcm47xx_cpu_fixes(void)
>   }
>   arch_initcall(bcm47xx_cpu_fixes);
>   
> -static struct fixed_phy_status bcm47xx_fixed_phy_status __initdata = {
> +static const struct fixed_phy_status bcm47xx_fixed_phy_status __initconst = {
>   	.link	= 1,
>   	.speed	= SPEED_100,
>   	.duplex	= DUPLEX_FULL,
> @@ -282,7 +282,7 @@ static int __init bcm47xx_register_bus_complete(void)
>   	bcm47xx_leds_register();
>   	bcm47xx_workarounds();
>   
> -	fixed_phy_add(0, &bcm47xx_fixed_phy_status);
> +	fixed_phy_add(&bcm47xx_fixed_phy_status);
>   	return 0;
>   }
>   device_initcall(bcm47xx_register_bus_complete);
> diff --git a/drivers/net/phy/fixed_phy.c b/drivers/net/phy/fixed_phy.c
> index 7902b35c5..b39532abf 100644
> --- a/drivers/net/phy/fixed_phy.c
> +++ b/drivers/net/phy/fixed_phy.c
> @@ -153,9 +153,9 @@ static int fixed_phy_add_gpiod(unsigned int irq, int phy_addr,
>   	return 0;
>   }
>   
> -int fixed_phy_add(int phy_addr, const struct fixed_phy_status *status)
> +void fixed_phy_add(const struct fixed_phy_status *status)
>   {
> -	return fixed_phy_add_gpiod(PHY_POLL, phy_addr, status, NULL);
> +	fixed_phy_add_gpiod(PHY_POLL, 0, status, NULL);
>   }
>   EXPORT_SYMBOL_GPL(fixed_phy_add);
>   
> diff --git a/include/linux/phy_fixed.h b/include/linux/phy_fixed.h
> index 5399b9e41..6227a1bde 100644
> --- a/include/linux/phy_fixed.h
> +++ b/include/linux/phy_fixed.h
> @@ -17,7 +17,7 @@ struct net_device;
>   
>   #if IS_ENABLED(CONFIG_FIXED_PHY)
>   extern int fixed_phy_change_carrier(struct net_device *dev, bool new_carrier);
> -int fixed_phy_add(int phy_id, const struct fixed_phy_status *status);
> +void fixed_phy_add(const struct fixed_phy_status *status);
>   struct phy_device *fixed_phy_register(const struct fixed_phy_status *status,
>   				      struct device_node *np);
>   
> @@ -26,11 +26,7 @@ extern int fixed_phy_set_link_update(struct phy_device *phydev,
>   			int (*link_update)(struct net_device *,
>   					   struct fixed_phy_status *));
>   #else
> -static inline int fixed_phy_add(int phy_id,
> -				const struct fixed_phy_status *status)
> -{
> -	return -ENODEV;
> -}
> +static inline void fixed_phy_add(const struct fixed_phy_status *status) {}
>   static inline struct phy_device *
>   fixed_phy_register(const struct fixed_phy_status *status,
>   		   struct device_node *np)

Hi,

I do not use this hardware any more, but Takumi reported that 
fixed_phy_add() is not working for the PHY registration on brcm47xx any 
more and we have to use fixed_phy_register(), see:
https://github.com/openwrt/openwrt/pull/19610

Does this need a bigger refactoring anyway?

Hauke

