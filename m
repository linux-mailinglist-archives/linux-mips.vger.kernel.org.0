Return-Path: <linux-mips+bounces-10522-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BAFB33178
	for <lists+linux-mips@lfdr.de>; Sun, 24 Aug 2025 18:35:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64EB9443683
	for <lists+linux-mips@lfdr.de>; Sun, 24 Aug 2025 16:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 671421F30AD;
	Sun, 24 Aug 2025 16:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UJh5kFRI"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5532728373;
	Sun, 24 Aug 2025 16:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756053348; cv=none; b=BqmtbcpWpKcpt5dyiGnIpJeWoNgCGIwu+Z9oKJIiokhcjzr/1eLYuDavib7l+WBUdLfOaBzgWqgK1psLHICuTY3qT1c2GvkSKDDxCLxS6rFnVvnwV3ujO5VgtcFDXIVKLdfJnqCd1o2Cq+dhO5DfdVkKmPjryT616ntJYqltgPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756053348; c=relaxed/simple;
	bh=EM9Nav+3S9KhLi/vvXSh4qqmvjGLcqeeSpr5KERssgA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RmApDyRlYgFtwUBKLlgHTyFAZS6EtfOaRDm1OZ5ICoVs7zu4NTQ86t+dCqM5HIgP/gX61lByYFsnpTq5iHqwE7S0ruyv52K4YunAUhyz6UJra8gDHWHlAGODpfMcNOLSoY4LQpjQqWz0mT4/C4EfQ1YCkTxPF7uGKzEo8vyShtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UJh5kFRI; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3c46686d1e6so2182345f8f.3;
        Sun, 24 Aug 2025 09:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756053344; x=1756658144; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=j1dp6/FMYZfzt9h93PgasS1M+fmXls/gospL5+SDXw4=;
        b=UJh5kFRIL1iOjoHgQ8Hs1PxGuh+N7GSg/eR2f2AAexuqPiyxRckI3DnHTxHMK1RPU4
         09TME2oKijNEZrKjz4yzTIsCOH+P+F9XWZJDdzY8sYvfWPCTlWDyPuh85CJ5SeIBfAcz
         Qmuo2nUJRycpm68FSav6481tJR0jRNs2ucm8qKpdfIODoplI5x7Up+pohzXJa6s2S6gu
         Q2nH7ZDTew1+APkPeEzLyQDxAVhLflMQJCt2WaxcrWs89quVTc7zTwRsj0toJKONpqMI
         4IyxE6WWdBXEkFPRSGU1V9RqZoetiLCE+qlioK269WEYv9E/hLSMCrNKDHvtiSv98YVD
         XfGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756053344; x=1756658144;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j1dp6/FMYZfzt9h93PgasS1M+fmXls/gospL5+SDXw4=;
        b=lF5Lf9xipj1wHM4gjQb+cxb1mvFvpE6ApNqf/Oet1uw8SzQm5rX/oGM5aJhUd3zOuT
         hyElp6qbBntmvQTImXJL/6vHmjtbOP8XX+6aWtlmry3ZHvnnu64G3kATwBtyvhMDY4XP
         jis+L4/9x3cd5ZVfN05hIBwgTkairvkUXhcsnMl4fmbJCkMm//dCo+i7jeYRBaf3H5pg
         GkqZCTs3nMuoTFTCaax5JqYVaR8MG0lsEWOThTXWtlc5cRBg5Mscobs748eFeTCDhHvF
         RqWKppFjixVTYxUiPxPnpDwTN+yHn5Hx+UgwDLWV+jiRoYVOXQUVhSFbuqOO6fTLdYyt
         EDHw==
X-Forwarded-Encrypted: i=1; AJvYcCWSN8CwRV2Qd3tbRHiWtOz6J/tGLZEv9BXc5fBolZVxkeBRd7qOve3Gmjj6q++YNUUD/Kw3DXkb3S/R@vger.kernel.org
X-Gm-Message-State: AOJu0YxgL417W738pGYtShM7H9do4igEre8+mxX4G7VeUiMBTpeSLn15
	hxk9e2chou5q0ln62AflkGHZ5iKWwjMlmDey1aEfvC6XK0mljKOE8kM3
X-Gm-Gg: ASbGncsgiwjESA7dIav8E15W+mB9OsuwBNp11P6gK7Q2AgGbYSZkwF8n2i76Fg/zbld
	KtL8/EmsHdpXgxCjfEiPALZNawdQlLaAGU2nzp8MMLMp2dEMaBWvZujUldvBtJBNqZ/OsXqoVBP
	+3byyWCIRoEeWwOEkgi+2lugaNPNY/o/5f9g58nEu4GhAGrreaxQ8L4y54n/7QQeNgiYCLFDGpj
	FQzePPrysp6r3UlN7QKAd5pw78d7lP98/1RT52U2NbAvEnpvtjgxMWnBBTIxAsO/DQIrNSoAAGK
	bVYI3RyvbAcjLVm92UI+O2R5zZkDjHdfxsqee/8nTdoou2nipows5eFaj++7dUXtPAAnalnp+qu
	9J1BNPuddRxFtCfn/9mpUcjWu09YQ8ZUvB5GSGyC5FXkvdddgiSMw6Vht9Iwu/Q+Awn1BFOFrvX
	ih2OkfynDx8qqXCBM3diYV9Nce+ozHA55iXDh8to4e6yh9lt09QlsJJzwYAXDdPA==
X-Google-Smtp-Source: AGHT+IEBme/ER7cC6DzcHSJrGCPZZ05ND5avyXAi2Oxq/hOE4jTXyl7HJ9ALVqzPEvdIQDQ3f35dBg==
X-Received: by 2002:a5d:5f81:0:b0:3bb:2fb3:9ce8 with SMTP id ffacd0b85a97d-3c5dc7353b1mr5352578f8f.30.1756053344316;
        Sun, 24 Aug 2025 09:35:44 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f13:aa00:1012:45db:ba43:6966? (p200300ea8f13aa00101245dbba436966.dip0.t-ipconnect.de. [2003:ea:8f13:aa00:1012:45db:ba43:6966])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45b5757453fsm74604845e9.14.2025.08.24.09.35.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Aug 2025 09:35:43 -0700 (PDT)
Message-ID: <418949c9-9aa2-4845-be8a-3395413143c3@gmail.com>
Date: Sun, 24 Aug 2025 18:36:24 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: phy: fixed: let fixed_phy_add always use
 addr 0 and remove return value
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
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <3c0f31ce-38a8-4f1e-8c39-6aa6ac879dc6@hauke-m.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/24/2025 6:05 PM, Hauke Mehrtens wrote:
> On 8/22/25 22:36, Heiner Kallweit wrote:
>> We have only two users of fixed_phy_add(), both use address 0 and
>> ignore the return value. So simplify fixed_phy_add() accordingly.
>>
>> Whilst at it, constify the fixed_phy_status configs.
>>
>> Note:
>> fixed_phy_add() is a legacy function which shouldn't be used in new
>> code, as it's use may be problematic:
>> - No check whether a fixed phy exists already at the given address
>> - If fixed_phy_register() is called afterwards by any other driver,
>>    then it will also use phy_addr 0, because fixed_phy_add() ignores
>>    the ida which manages address assignment
>> Drivers using a fixed phy created by fixed_phy_add() in platform code,
>> should dynamically create a fixed phy with fixed_phy_register()
>> instead.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>   arch/m68k/coldfire/m5272.c  | 4 ++--
>>   arch/mips/bcm47xx/setup.c   | 4 ++--
>>   drivers/net/phy/fixed_phy.c | 4 ++--
>>   include/linux/phy_fixed.h   | 8 ++------
>>   4 files changed, 8 insertions(+), 12 deletions(-)
>>
>> diff --git a/arch/m68k/coldfire/m5272.c b/arch/m68k/coldfire/m5272.c
>> index 5b70dfdab..918e2a323 100644
>> --- a/arch/m68k/coldfire/m5272.c
>> +++ b/arch/m68k/coldfire/m5272.c
>> @@ -108,7 +108,7 @@ void __init config_BSP(char *commandp, int size)
>>    * an ethernet switch. In this case we need to use the fixed phy type,
>>    * and we need to declare it early in boot.
>>    */
>> -static struct fixed_phy_status nettel_fixed_phy_status __initdata = {
>> +static const struct fixed_phy_status nettel_fixed_phy_status __initconst = {
>>       .link    = 1,
>>       .speed    = 100,
>>       .duplex    = 0,
>> @@ -119,7 +119,7 @@ static struct fixed_phy_status nettel_fixed_phy_status __initdata = {
>>   static int __init init_BSP(void)
>>   {
>>       m5272_uarts_init();
>> -    fixed_phy_add(0, &nettel_fixed_phy_status);
>> +    fixed_phy_add(&nettel_fixed_phy_status);
>>       clkdev_add_table(m5272_clk_lookup, ARRAY_SIZE(m5272_clk_lookup));
>>       return 0;
>>   }
>> diff --git a/arch/mips/bcm47xx/setup.c b/arch/mips/bcm47xx/setup.c
>> index de426a474..a93a4266d 100644
>> --- a/arch/mips/bcm47xx/setup.c
>> +++ b/arch/mips/bcm47xx/setup.c
>> @@ -256,7 +256,7 @@ static int __init bcm47xx_cpu_fixes(void)
>>   }
>>   arch_initcall(bcm47xx_cpu_fixes);
>>   -static struct fixed_phy_status bcm47xx_fixed_phy_status __initdata = {
>> +static const struct fixed_phy_status bcm47xx_fixed_phy_status __initconst = {
>>       .link    = 1,
>>       .speed    = SPEED_100,
>>       .duplex    = DUPLEX_FULL,
>> @@ -282,7 +282,7 @@ static int __init bcm47xx_register_bus_complete(void)
>>       bcm47xx_leds_register();
>>       bcm47xx_workarounds();
>>   -    fixed_phy_add(0, &bcm47xx_fixed_phy_status);
>> +    fixed_phy_add(&bcm47xx_fixed_phy_status);
>>       return 0;
>>   }
>>   device_initcall(bcm47xx_register_bus_complete);
>> diff --git a/drivers/net/phy/fixed_phy.c b/drivers/net/phy/fixed_phy.c
>> index 7902b35c5..b39532abf 100644
>> --- a/drivers/net/phy/fixed_phy.c
>> +++ b/drivers/net/phy/fixed_phy.c
>> @@ -153,9 +153,9 @@ static int fixed_phy_add_gpiod(unsigned int irq, int phy_addr,
>>       return 0;
>>   }
>>   -int fixed_phy_add(int phy_addr, const struct fixed_phy_status *status)
>> +void fixed_phy_add(const struct fixed_phy_status *status)
>>   {
>> -    return fixed_phy_add_gpiod(PHY_POLL, phy_addr, status, NULL);
>> +    fixed_phy_add_gpiod(PHY_POLL, 0, status, NULL);
>>   }
>>   EXPORT_SYMBOL_GPL(fixed_phy_add);
>>   diff --git a/include/linux/phy_fixed.h b/include/linux/phy_fixed.h
>> index 5399b9e41..6227a1bde 100644
>> --- a/include/linux/phy_fixed.h
>> +++ b/include/linux/phy_fixed.h
>> @@ -17,7 +17,7 @@ struct net_device;
>>     #if IS_ENABLED(CONFIG_FIXED_PHY)
>>   extern int fixed_phy_change_carrier(struct net_device *dev, bool new_carrier);
>> -int fixed_phy_add(int phy_id, const struct fixed_phy_status *status);
>> +void fixed_phy_add(const struct fixed_phy_status *status);
>>   struct phy_device *fixed_phy_register(const struct fixed_phy_status *status,
>>                         struct device_node *np);
>>   @@ -26,11 +26,7 @@ extern int fixed_phy_set_link_update(struct phy_device *phydev,
>>               int (*link_update)(struct net_device *,
>>                          struct fixed_phy_status *));
>>   #else
>> -static inline int fixed_phy_add(int phy_id,
>> -                const struct fixed_phy_status *status)
>> -{
>> -    return -ENODEV;
>> -}
>> +static inline void fixed_phy_add(const struct fixed_phy_status *status) {}
>>   static inline struct phy_device *
>>   fixed_phy_register(const struct fixed_phy_status *status,
>>              struct device_node *np)
> 
> Hi,
> 
> I do not use this hardware any more, but Takumi reported that fixed_phy_add() is not working for the PHY registration on brcm47xx any more and we have to use fixed_phy_register(), see:
> https://github.com/openwrt/openwrt/pull/19610
> 
I suspected already that fixed_phy_add() usage doesn't work any longer, but don't
have hw to test. I think bfa54812f0bc ("net: phy: fixed_phy: set phy_mask before
calling mdiobus_register()") is to blame.
Reverting this commit or changing the line to fmb->mii_bus->phy_mask = ~1;
should fix the problem. Would be great if Takumi could test this.

The cleaner alternative would be:
- remove call to fixed_phy_add() from platform code
- let b44 call fixed_phy_register() if a fixed phy is needed
  Below is a WIP version of this change.

> Does this need a bigger refactoring anyway?
> 
> Hauke

Heiner


---
 drivers/net/ethernet/broadcom/Kconfig |  1 +
 drivers/net/ethernet/broadcom/b44.c   | 33 ++++++++++++++-------------
 2 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/Kconfig b/drivers/net/ethernet/broadcom/Kconfig
index 0fc10e6c6..99292392d 100644
--- a/drivers/net/ethernet/broadcom/Kconfig
+++ b/drivers/net/ethernet/broadcom/Kconfig
@@ -25,6 +25,7 @@ config B44
 	select SSB
 	select MII
 	select PHYLIB
+	select FIXED_PHY
 	help
 	  If you have a network (Ethernet) controller of this type, say Y
 	  or M here.
diff --git a/drivers/net/ethernet/broadcom/b44.c b/drivers/net/ethernet/broadcom/b44.c
index 0353359c3..abbb5953c 100644
--- a/drivers/net/ethernet/broadcom/b44.c
+++ b/drivers/net/ethernet/broadcom/b44.c
@@ -31,6 +31,7 @@
 #include <linux/ssb/ssb.h>
 #include <linux/slab.h>
 #include <linux/phy.h>
+#include <linux/phy_fixed.h>
 
 #include <linux/uaccess.h>
 #include <asm/io.h>
@@ -2233,7 +2234,6 @@ static int b44_register_phy_one(struct b44 *bp)
 	struct mii_bus *mii_bus;
 	struct ssb_device *sdev = bp->sdev;
 	struct phy_device *phydev;
-	char bus_id[MII_BUS_ID_SIZE + 3];
 	struct ssb_sprom *sprom = &sdev->bus->sprom;
 	int err;
 
@@ -2260,27 +2260,26 @@ static int b44_register_phy_one(struct b44 *bp)
 		goto err_out_mdiobus;
 	}
 
-	if (!mdiobus_is_registered_device(bp->mii_bus, bp->phy_addr) &&
-	    (sprom->boardflags_lo & (B44_BOARDFLAG_ROBO | B44_BOARDFLAG_ADM))) {
-
+	phydev = mdiobus_get_phy(bp->mii_bus, bp->phy_addr);
+	if (!phydev &&
+	    sprom->boardflags_lo & (B44_BOARDFLAG_ROBO | B44_BOARDFLAG_ADM)) {
 		dev_info(sdev->dev,
 			 "could not find PHY at %i, use fixed one\n",
 			 bp->phy_addr);
 
-		bp->phy_addr = 0;
-		snprintf(bus_id, sizeof(bus_id), PHY_ID_FMT, "fixed-0",
-			 bp->phy_addr);
-	} else {
-		snprintf(bus_id, sizeof(bus_id), PHY_ID_FMT, mii_bus->id,
-			 bp->phy_addr);
+		phydev = fixed_phy_register(NULL, NULL);
+		if (!IS_ERR(phydev))
+			bp->phy_addr = phydev->mdio.addr;
 	}
 
-	phydev = phy_connect(bp->dev, bus_id, &b44_adjust_link,
-			     PHY_INTERFACE_MODE_MII);
-	if (IS_ERR(phydev)) {
+	if (IS_ERR_OR_NULL(phydev))
+		err = -ENODEV;
+	else
+		err = phy_connect_direct(bp->dev, phydev, &b44_adjust_link,
+					 PHY_INTERFACE_MODE_MII);
+	if (err) {
 		dev_err(sdev->dev, "could not attach PHY at %i\n",
 			bp->phy_addr);
-		err = PTR_ERR(phydev);
 		goto err_out_mdiobus_unregister;
 	}
 
@@ -2293,7 +2292,6 @@ static int b44_register_phy_one(struct b44 *bp)
 	linkmode_copy(phydev->advertising, phydev->supported);
 
 	bp->old_link = 0;
-	bp->phy_addr = phydev->mdio.addr;
 
 	phy_attached_info(phydev);
 
@@ -2313,8 +2311,11 @@ static void b44_unregister_phy_one(struct b44 *bp)
 {
 	struct net_device *dev = bp->dev;
 	struct mii_bus *mii_bus = bp->mii_bus;
+	struct phy_device *phydev = dev->phydev);
 
-	phy_disconnect(dev->phydev);
+	phy_disconnect(phydev);
+	if (phy_is_pseudo_fixed_link(phydev))
+		fixed_phy_unregister(phydev);
 	mdiobus_unregister(mii_bus);
 	mdiobus_free(mii_bus);
 }
-- 
2.50.1



