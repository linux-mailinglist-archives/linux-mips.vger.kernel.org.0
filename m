Return-Path: <linux-mips+bounces-12015-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCEAC2A59F
	for <lists+linux-mips@lfdr.de>; Mon, 03 Nov 2025 08:36:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 533E3188A918
	for <lists+linux-mips@lfdr.de>; Mon,  3 Nov 2025 07:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68EFB2BE631;
	Mon,  3 Nov 2025 07:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KElK1u9L"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4728F2BDC05
	for <linux-mips@vger.kernel.org>; Mon,  3 Nov 2025 07:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762155377; cv=none; b=baWXeS3ZAYDRB8PzIOXYMh3j9oqoGLzt4+TgSVU+d3XtaQE6m7RI/xoRktsvIaSIYdwyqni3iBU1rBs0aaDGsKKZv1K1aZyYRD0Nq9FQWa6HQwNOwqkWORggA2IjTTcdD+iYU0eD210VfkqFeuw/wHBxTIcFA1pyDvVtfaN0+XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762155377; c=relaxed/simple;
	bh=KImMfOPBHJxMvj6GnbGXjOLE3ksMhUz7hd07AjPOnlc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GNkJ09jNzW1nlHznwQ+I7hLU7AHLunw6tQ+V8LRoTjIoHdqcQ/ICOxUP0EhOSEpg6cVwiePp6MSs+wxYATztCXFQoXDfnld4BlBNYOaFAD/sJLkhpYmvx8oQUHX0qDlufP8eui3IEB0l1cbLla+wBUlzjb0OFxp/Ze4sOB/BfsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KElK1u9L; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-429c7e438a8so1362133f8f.2
        for <linux-mips@vger.kernel.org>; Sun, 02 Nov 2025 23:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762155373; x=1762760173; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xy242WDGUqoE91x1eR+As3xqC/KmA/wU0RO3gRLGjUI=;
        b=KElK1u9Lst8xrxCCbIpclYN+NighIp0Y4J4O91AznbsQxYnwp0O770DtB7bZvoSybG
         wV4HjiuNwH6N+YwE8gC+M4j6Nbj2QBo3syt3QbCRBzUE2VhmmcYNZEvE6xsVDNHn2j3e
         jgwvxjLgD4oIOYophmGOov/os41b5TqRAq3OyL00B8UsgiaOUOTbjULoV4TV0YIZP8Fi
         oJ5b9bq46LtVZw74MR0uNL9RFwwYQKPkhtI+CFEymk3kbwjhNr9wwBtD1yv6m7WNa0q+
         +APkstnGJ1b8vGNFiiT/lv+x7Hy4YQzOpLPm/iXIZ9NjCydzqOYDVeeI3yWfLrcVTVDp
         dwpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762155373; x=1762760173;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xy242WDGUqoE91x1eR+As3xqC/KmA/wU0RO3gRLGjUI=;
        b=SH9QEeoG0eviYWU/KfOhQpQGPan5oswer7pkYZPpFrsZ3pL9CNI9RkT1E4132pdtrO
         utk5IVzlZhp1mtj4ZGFgHMBX00JYRId0twEXilE6BRLw7bhe982ijzuCkMFwoNjeKunM
         A1pTCO2lc9XnmGaE6x1XkvQlauZ33bNxMHqkYtgOPcemUAzFMArOkOCKeBHaZkA/yNlQ
         6Nh/GvuNGhC0VEKz4j0vK/5E/YDUC5F3GyLWnpjJAOEuezwnzE0rfDLTw0DDBP3Wre4m
         F7FtofSWvxcDqhJl+XH+XuNHSLruq3t2ZZHHZ0JtFOzkoAcuL8vUtT0a/LkvIRbfMa1O
         9kWw==
X-Forwarded-Encrypted: i=1; AJvYcCU4kyYcZCnZyGEpphJX7IYmkdzBtjJsHmheo8Mj8F2dydBFyMP84xrJTYevMULGNW1fVOqnmuQnNed8@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ0PwbcZoo9DkwY/rFRVtWHNHKYVScqZP3LnDCBH6HT1snKiKB
	oP6md6Hxlmnk2NHw6krjlbVh0b9GVrne620fkzK7gXqQuhFDpgBrnTbI
X-Gm-Gg: ASbGnct+dlSrwX2SALKT0Y3D7MkJRTbLn4hPqn6UUmrYF3F6lfmX9HgEV0fpSVvtMIp
	8TYxE7Hdn74uvCFdutbBz33sK/4NVmgNdm1/rBdrcsfTxxiv/lm/VrI5a1xS14Ptz1wIwdLt+Fr
	boqiUmKDKVfwLSwgZKwza2kgjckL1U4DrrmBo5xZ9eHoLOkwftEb+UbX0fM7HmU5pxg5rDfAFnT
	yzH99JUmNIixhS0cLvY4X70kBXGxBKC81dduehyUH4Wvu3a8VxnNoQnqohHVUc4SEv9n4BuCAcg
	/qdD5e0dWaDqIwmj/NFHlWRCvPA6OcVrhM6sKimhY+a+EpkqgKuZYAG2mCGCgyFukvBW8TjRXhd
	ZGs/Wd8yMU1XbrssxzmAauRx1rQXiQz1JcLYcj9rIL5H89PTG7NQ/ZJB9Lc1SXwbnF8RFLQp/RV
	tiKjdzuzvczMINsXK6p/4cVayilfrHbQdKOTP2Y3ViaqgIipOvkXRwkTTTDuucmnsdMDmyq/QfV
	XGaHjEi1AIeaq79pdjP8vXdxTVRzqFijImJtehZX5e9+SmEtAlBaA==
X-Google-Smtp-Source: AGHT+IGVnLrE9OIWhpiHYyEFkXyZRArW2hWys6rXTWz6yN6lGED8eruKLvg3nkjVzrRE8Fc1QB6LXA==
X-Received: by 2002:a5d:5d89:0:b0:429:8a71:d57 with SMTP id ffacd0b85a97d-429bd688474mr9767699f8f.27.1762155373261;
        Sun, 02 Nov 2025 23:36:13 -0800 (PST)
Received: from ?IPV6:2003:ea:8f0d:b700:d90a:9c99:d3d5:33f3? (p200300ea8f0db700d90a9c99d3d533f3.dip0.t-ipconnect.de. [2003:ea:8f0d:b700:d90a:9c99:d3d5:33f3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429d1061e42sm6679455f8f.37.2025.11.02.23.36.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Nov 2025 23:36:12 -0800 (PST)
Message-ID: <fe2e1f1f-3d34-441b-ab97-cb39c10225a9@gmail.com>
Date: Mon, 3 Nov 2025 08:36:12 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/6] net: fec: register a fixed phy using
 fixed_phy_register_100fd if needed
To: Greg Ungerer <gerg@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Hauke Mehrtens
 <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Michael Chan <michael.chan@broadcom.com>, Wei Fang <wei.fang@nxp.com>,
 Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 David Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>
Cc: linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 imx@lists.linux.dev, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
References: <0285fcb0-0fb5-4f6f-823c-7b6e85e28ba3@gmail.com>
 <adf4dc5c-5fa3-4ae6-a75c-a73954dede73@gmail.com>
 <7a495800-a639-4356-bc23-1134280c350c@linux-m68k.org>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <7a495800-a639-4356-bc23-1134280c350c@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/3/2025 4:15 AM, Greg Ungerer wrote:
> Hi Heiner,
> 
> On 31/10/25 07:42, Heiner Kallweit wrote:
>> In case of coldfire/5272 a fixed phy is used, which so far is created
>> by platform code, using fixed_phy_add(). This function has a number of
>> problems, therefore create a potentially needed fixed phy here, using
>> fixed_phy_register_100fd.
>>
>> Note 1: This includes a small functional change, as coldfire/5272
>> created a fixed phy in half-duplex mode. Likely this was by mistake,
>> because the fec MAC is 100FD-capable, and connection is to a switch.
>>
>> Note 2: Usage of phy_find_next() makes use of the fact that dev_id can
>> only be 0 or 1.
>>
>> Due to lack of hardware, this is compile-tested only.
> 
> I did not get net-next and try this all out, but it doesn't compile when
> applied to 6.18-rc4.
> 
> 
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>   drivers/net/ethernet/freescale/Kconfig    |  1 +
>>   drivers/net/ethernet/freescale/fec_main.c | 52 +++++++++++------------
>>   2 files changed, 27 insertions(+), 26 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/freescale/Kconfig b/drivers/net/ethernet/freescale/Kconfig
>> index bbef47c34..e2a591cf9 100644
>> --- a/drivers/net/ethernet/freescale/Kconfig
>> +++ b/drivers/net/ethernet/freescale/Kconfig
>> @@ -28,6 +28,7 @@ config FEC
>>       depends on PTP_1588_CLOCK_OPTIONAL
>>       select CRC32
>>       select PHYLIB
>> +    select FIXED_PHY if M5272
> 
> Does it make sense to limit this to 5272 only here?
> I get that this most closely keeps functionality same as before.
> 
On DT-based systems FIXED_PHY is selected by OF_MDIO.
For non-DT systems I limited this to M5272, because it provides the
same functionality as before, and reduces object code size a little
on other platforms due to using fixed_phy function stubs.

> Regards
> Greg
> 
> 
> 
>>       select PAGE_POOL
>>       imply PAGE_POOL_STATS
>>       imply NET_SELFTESTS
>> diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
>> index c60ed8bac..0b71e4c15 100644
>> --- a/drivers/net/ethernet/freescale/fec_main.c
>> +++ b/drivers/net/ethernet/freescale/fec_main.c
>> @@ -52,6 +52,7 @@
>>   #include <linux/of_net.h>
>>   #include <linux/phy.h>
>>   #include <linux/pinctrl/consumer.h>
>> +#include <linux/phy_fixed.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/pm_runtime.h>
>>   #include <linux/prefetch.h>
>> @@ -2476,11 +2477,8 @@ static int fec_enet_parse_rgmii_delay(struct fec_enet_private *fep,
>>   static int fec_enet_mii_probe(struct net_device *ndev)
>>   {
>>       struct fec_enet_private *fep = netdev_priv(ndev);
>> -    struct phy_device *phy_dev = NULL;
>> -    char mdio_bus_id[MII_BUS_ID_SIZE];
>> -    char phy_name[MII_BUS_ID_SIZE + 3];
>> -    int phy_id;
>> -    int dev_id = fep->dev_id;
>> +    struct phy_device *phy_dev;
>> +    int ret;
>>         if (fep->phy_node) {
>>           phy_dev = of_phy_connect(ndev, fep->phy_node,
>> @@ -2492,30 +2490,28 @@ static int fec_enet_mii_probe(struct net_device *ndev)
>>           }
>>       } else {
>>           /* check for attached phy */
>> -        for (phy_id = 0; (phy_id < PHY_MAX_ADDR); phy_id++) {
>> -            if (!mdiobus_is_registered_device(fep->mii_bus, phy_id))
>> -                continue;
>> -            if (dev_id--)
>> -                continue;
>> -            strscpy(mdio_bus_id, fep->mii_bus->id, MII_BUS_ID_SIZE);
>> -            break;
>> -        }
>> +        phy_dev = phy_find_first(fep->mii_bus);
>> +        if (fep->dev_id && phy_dev)
>> +            phy_dev = phy_find_next(fep->mii_bus, phy_dev);
>>   -        if (phy_id >= PHY_MAX_ADDR) {
>> +        if (!phy_dev) {
>>               netdev_info(ndev, "no PHY, assuming direct connection to switch\n");
>> -            strscpy(mdio_bus_id, "fixed-0", MII_BUS_ID_SIZE);
>> -            phy_id = 0;
>> +            phy_dev = fixed_phy_register_100fd();
>> +            if (IS_ERR(phy_dev)) {
>> +                netdev_err(ndev, "could not register fixed PHY\n");
>> +                return PTR_ERR(phy_dev);
>> +            }
>>           }
>>   -        snprintf(phy_name, sizeof(phy_name),
>> -             PHY_ID_FMT, mdio_bus_id, phy_id);
>> -        phy_dev = phy_connect(ndev, phy_name, &fec_enet_adjust_link,
>> -                      fep->phy_interface);
>> -    }
>> +        ret = phy_connect_direct(ndev, phy_dev, &fec_enet_adjust_link,
>> +                     fep->phy_interface);
>> +        if (ret) {
>> +            if (phy_is_pseudo_fixed_link(phy_dev))
>> +                fixed_phy_unregister(phy_dev);
>> +            netdev_err(ndev, "could not attach to PHY\n");
>> +            return ret;
>> +        }
>>   -    if (IS_ERR(phy_dev)) {
>> -        netdev_err(ndev, "could not attach to PHY\n");
>> -        return PTR_ERR(phy_dev);
>>       }
>>         /* mask with MAC supported features */
>> @@ -3622,8 +3618,9 @@ static int
>>   fec_enet_close(struct net_device *ndev)
>>   {
>>       struct fec_enet_private *fep = netdev_priv(ndev);
>> +    struct phy_device *phy_dev = ndev->phydev;
>>   -    phy_stop(ndev->phydev);
>> +    phy_stop(phy_dev);
>>         if (netif_device_present(ndev)) {
>>           napi_disable(&fep->napi);
>> @@ -3631,7 +3628,10 @@ fec_enet_close(struct net_device *ndev)
>>           fec_stop(ndev);
>>       }
>>   -    phy_disconnect(ndev->phydev);
>> +    phy_disconnect(phy_dev);
>> +
>> +    if (!fep->phy_node && phy_is_pseudo_fixed_link(phy_dev))
>> +        fixed_phy_unregister(phy_dev);
>>         if (fep->quirks & FEC_QUIRK_ERR006687)
>>           imx6q_cpuidle_fec_irqs_unused();
> 


