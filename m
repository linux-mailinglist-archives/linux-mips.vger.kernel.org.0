Return-Path: <linux-mips+bounces-12014-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C733C29EE6
	for <lists+linux-mips@lfdr.de>; Mon, 03 Nov 2025 04:16:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CBAF6347BF6
	for <lists+linux-mips@lfdr.de>; Mon,  3 Nov 2025 03:16:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA50F155322;
	Mon,  3 Nov 2025 03:16:00 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996B6B663;
	Mon,  3 Nov 2025 03:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762139760; cv=none; b=Et38ailS5wtYFLWOFvAMM46SWfsFRBgNhrx2VgskbamUKMQNJ2RKvLXJG1cZEg5AI3Fjxf+ehLLGO+wnZr4O/3ptfJQhcXHV1Xwa6x6mAnwmrGzA1bIdYRQHmytfLIKj7702xz8uHaNd0T3WlMBdpK9O42Fy3QjLznHQLanITQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762139760; c=relaxed/simple;
	bh=PJx0HWoEEcs+Uc8d495i6e3iUYjf9DGJNO+LHpcf9wU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OURZ06b4z6beAm94h/kMdVHCsiOT8dAIs8GFTNr7F7xrii9cqUxHxwSGI2/oaK+gP+6UsSB+RLUIm2SlpP6Lk/1A+C8Vp8PL48xjxMaAtbeo9c6gqm5Mff48XR82JlKsnAOaLpCOp7w4SXTcleYfY8KLZsY5eGsQEK7uJdgq+BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A85D8C4CEE7;
	Mon,  3 Nov 2025 03:15:55 +0000 (UTC)
Message-ID: <7a495800-a639-4356-bc23-1134280c350c@linux-m68k.org>
Date: Mon, 3 Nov 2025 13:15:53 +1000
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/6] net: fec: register a fixed phy using
 fixed_phy_register_100fd if needed
To: Heiner Kallweit <hkallweit1@gmail.com>,
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
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <adf4dc5c-5fa3-4ae6-a75c-a73954dede73@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Heiner,

On 31/10/25 07:42, Heiner Kallweit wrote:
> In case of coldfire/5272 a fixed phy is used, which so far is created
> by platform code, using fixed_phy_add(). This function has a number of
> problems, therefore create a potentially needed fixed phy here, using
> fixed_phy_register_100fd.
> 
> Note 1: This includes a small functional change, as coldfire/5272
> created a fixed phy in half-duplex mode. Likely this was by mistake,
> because the fec MAC is 100FD-capable, and connection is to a switch.
> 
> Note 2: Usage of phy_find_next() makes use of the fact that dev_id can
> only be 0 or 1.
> 
> Due to lack of hardware, this is compile-tested only.

I did not get net-next and try this all out, but it doesn't compile when
applied to 6.18-rc4.


> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>   drivers/net/ethernet/freescale/Kconfig    |  1 +
>   drivers/net/ethernet/freescale/fec_main.c | 52 +++++++++++------------
>   2 files changed, 27 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/net/ethernet/freescale/Kconfig b/drivers/net/ethernet/freescale/Kconfig
> index bbef47c34..e2a591cf9 100644
> --- a/drivers/net/ethernet/freescale/Kconfig
> +++ b/drivers/net/ethernet/freescale/Kconfig
> @@ -28,6 +28,7 @@ config FEC
>   	depends on PTP_1588_CLOCK_OPTIONAL
>   	select CRC32
>   	select PHYLIB
> +	select FIXED_PHY if M5272

Does it make sense to limit this to 5272 only here?
I get that this most closely keeps functionality same as before.

Regards
Greg



>   	select PAGE_POOL
>   	imply PAGE_POOL_STATS
>   	imply NET_SELFTESTS
> diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
> index c60ed8bac..0b71e4c15 100644
> --- a/drivers/net/ethernet/freescale/fec_main.c
> +++ b/drivers/net/ethernet/freescale/fec_main.c
> @@ -52,6 +52,7 @@
>   #include <linux/of_net.h>
>   #include <linux/phy.h>
>   #include <linux/pinctrl/consumer.h>
> +#include <linux/phy_fixed.h>
>   #include <linux/platform_device.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/prefetch.h>
> @@ -2476,11 +2477,8 @@ static int fec_enet_parse_rgmii_delay(struct fec_enet_private *fep,
>   static int fec_enet_mii_probe(struct net_device *ndev)
>   {
>   	struct fec_enet_private *fep = netdev_priv(ndev);
> -	struct phy_device *phy_dev = NULL;
> -	char mdio_bus_id[MII_BUS_ID_SIZE];
> -	char phy_name[MII_BUS_ID_SIZE + 3];
> -	int phy_id;
> -	int dev_id = fep->dev_id;
> +	struct phy_device *phy_dev;
> +	int ret;
>   
>   	if (fep->phy_node) {
>   		phy_dev = of_phy_connect(ndev, fep->phy_node,
> @@ -2492,30 +2490,28 @@ static int fec_enet_mii_probe(struct net_device *ndev)
>   		}
>   	} else {
>   		/* check for attached phy */
> -		for (phy_id = 0; (phy_id < PHY_MAX_ADDR); phy_id++) {
> -			if (!mdiobus_is_registered_device(fep->mii_bus, phy_id))
> -				continue;
> -			if (dev_id--)
> -				continue;
> -			strscpy(mdio_bus_id, fep->mii_bus->id, MII_BUS_ID_SIZE);
> -			break;
> -		}
> +		phy_dev = phy_find_first(fep->mii_bus);
> +		if (fep->dev_id && phy_dev)
> +			phy_dev = phy_find_next(fep->mii_bus, phy_dev);
>   
> -		if (phy_id >= PHY_MAX_ADDR) {
> +		if (!phy_dev) {
>   			netdev_info(ndev, "no PHY, assuming direct connection to switch\n");
> -			strscpy(mdio_bus_id, "fixed-0", MII_BUS_ID_SIZE);
> -			phy_id = 0;
> +			phy_dev = fixed_phy_register_100fd();
> +			if (IS_ERR(phy_dev)) {
> +				netdev_err(ndev, "could not register fixed PHY\n");
> +				return PTR_ERR(phy_dev);
> +			}
>   		}
>   
> -		snprintf(phy_name, sizeof(phy_name),
> -			 PHY_ID_FMT, mdio_bus_id, phy_id);
> -		phy_dev = phy_connect(ndev, phy_name, &fec_enet_adjust_link,
> -				      fep->phy_interface);
> -	}
> +		ret = phy_connect_direct(ndev, phy_dev, &fec_enet_adjust_link,
> +					 fep->phy_interface);
> +		if (ret) {
> +			if (phy_is_pseudo_fixed_link(phy_dev))
> +				fixed_phy_unregister(phy_dev);
> +			netdev_err(ndev, "could not attach to PHY\n");
> +			return ret;
> +		}
>   
> -	if (IS_ERR(phy_dev)) {
> -		netdev_err(ndev, "could not attach to PHY\n");
> -		return PTR_ERR(phy_dev);
>   	}
>   
>   	/* mask with MAC supported features */
> @@ -3622,8 +3618,9 @@ static int
>   fec_enet_close(struct net_device *ndev)
>   {
>   	struct fec_enet_private *fep = netdev_priv(ndev);
> +	struct phy_device *phy_dev = ndev->phydev;
>   
> -	phy_stop(ndev->phydev);
> +	phy_stop(phy_dev);
>   
>   	if (netif_device_present(ndev)) {
>   		napi_disable(&fep->napi);
> @@ -3631,7 +3628,10 @@ fec_enet_close(struct net_device *ndev)
>   		fec_stop(ndev);
>   	}
>   
> -	phy_disconnect(ndev->phydev);
> +	phy_disconnect(phy_dev);
> +
> +	if (!fep->phy_node && phy_is_pseudo_fixed_link(phy_dev))
> +		fixed_phy_unregister(phy_dev);
>   
>   	if (fep->quirks & FEC_QUIRK_ERR006687)
>   		imx6q_cpuidle_fec_irqs_unused();


