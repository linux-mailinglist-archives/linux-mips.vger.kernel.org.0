Return-Path: <linux-mips+bounces-9598-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9A2AF00E0
	for <lists+linux-mips@lfdr.de>; Tue,  1 Jul 2025 18:57:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 172645236E9
	for <lists+linux-mips@lfdr.de>; Tue,  1 Jul 2025 16:54:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5839E27FD6D;
	Tue,  1 Jul 2025 16:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="K14Ov+NR"
X-Original-To: linux-mips@vger.kernel.org
Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AFB27FD5D
	for <linux-mips@vger.kernel.org>; Tue,  1 Jul 2025 16:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751388695; cv=none; b=BpBaD5XkQAWq9dtyP4Yu7UVV2rG35EIskfsFHmJnHuEldeGGZtnDmDtyaU+lBoteBmHqcyMczIKJudj/+KnE7K3O6NrpghXWD1KWr8TeM0jDrm3z9ZIUsi/d0gEoUexOECt6hxLVKDhgCYQe6ewqGEw77/3uymSAMigDNXRD77M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751388695; c=relaxed/simple;
	bh=B/taMgfwrhTGncrj3ZJ43u+lA+ZCcutiEzsqql9X8Q8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fqlolKdAH9DvUjnywpGFuIE2YxwjBznCoLP32E+Tx+2Aw86Al65bEkBRxjRpe4uo1YFjqjQtCm4swYS3BI0I8yyUuBnWay3n4WNCU++eUnKmljXhdybgPkIalJZqYOeEn+9NhAa9MgmcVydvnets00hDQeVYp5u3MWuOv+vTVLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=K14Ov+NR; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <fe28f804-feee-4435-823b-5d03986c153b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751388680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fFV2Y1ZWu7rW4X21P0xZgpGTDxMq6xKQ6i6Q3MK2S08=;
	b=K14Ov+NR3NsVPzQm7eadWphxZ3H+IIaVGvtE3m9uhaob7QgGFkE642v1NQgYUgPJo7ly2m
	C2uu1rxJDY1LaRC/5O/6HzgrnfbANHAN8uoyrKr0VGaU5YVZS+pv5s+gUPIyc/BKP21O2H
	a8oUKIUnwgutjKv5ZXIirwZ5Fhb4Vdw=
Date: Tue, 1 Jul 2025 12:51:10 -0400
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net-next v2 15/18] net: macb: Add "mobileye,eyeq5-gem"
 compatible
To: =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Harini Katakam <harini.katakam@xilinx.com>,
 Rafal Ozieblo <rafalo@cadence.com>,
 Haavard Skinnemoen <hskinnemoen@atmel.com>, Jeff Garzik <jeff@garzik.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-mips@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>
References: <20250627-macb-v2-0-ff8207d0bb77@bootlin.com>
 <20250627-macb-v2-15-ff8207d0bb77@bootlin.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250627-macb-v2-15-ff8207d0bb77@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 6/27/25 05:09, Théo Lebrun wrote:
> Add support for the two GEM instances inside Mobileye EyeQ5 SoCs, using
> compatible "mobileye,eyeq5-gem". With it, add a custom init sequence
> that accesses two system-controller registers.
> 
> Noteworthy: NET_IP_ALIGN=2 on MIPS but the hardware does not align and
> low bits aren't configurable, so we cannot respect the requested IP
> header alignment.
> 
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---
>  drivers/net/ethernet/cadence/macb_main.c | 80 ++++++++++++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
> 
> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
> index f9a3a5caebcafe3d9197a3bc7681b64734d7ac93..ed394e5d1ec9b1748282f1448628d5006f3b0971 100644
> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c
> @@ -20,6 +20,7 @@
>  #include <linux/iopoll.h>
>  #include <linux/ip.h>
>  #include <linux/kernel.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/moduleparam.h>
>  #include <linux/netdevice.h>
> @@ -31,6 +32,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/ptp_classify.h>
> +#include <linux/regmap.h>
>  #include <linux/reset.h>
>  #include <linux/slab.h>
>  #include <linux/tcp.h>
> @@ -4957,6 +4959,72 @@ static int init_reset_optional(struct platform_device *pdev)
>  	return ret;
>  }
>  
> +#define EYEQ5_OLB_GP_TX_SWRST_DIS	BIT(0)		// Tx SW reset
> +#define EYEQ5_OLB_GP_TX_M_CLKE		BIT(1)		// Tx M clock enable
> +#define EYEQ5_OLB_GP_SYS_SWRST_DIS	BIT(2)		// Sys SW reset
> +#define EYEQ5_OLB_GP_SYS_M_CLKE		BIT(3)		// Sys clock enable
> +#define EYEQ5_OLB_GP_SGMII_MODE		BIT(4)		// SGMII mode
> +#define EYEQ5_OLB_GP_RGMII_DRV		GENMASK(8, 5)	// RGMII mode
> +
> +#define EYEQ5_OLB_SGMII_PWR_EN		BIT(0)
> +#define EYEQ5_OLB_SGMII_RST_DIS		BIT(1)
> +#define EYEQ5_OLB_SGMII_PLL_EN		BIT(2)
> +#define EYEQ5_OLB_SGMII_SIG_DET_SW	BIT(3)
> +#define EYEQ5_OLB_SGMII_PWR_STATE	BIT(4)
> +#define EYEQ5_OLB_SGMII_PLL_ACK		BIT(18)
> +
> +static int eyeq5_init(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct net_device *netdev = platform_get_drvdata(pdev);
> +	struct macb *bp = netdev_priv(netdev);
> +	struct device_node *np = dev->of_node;
> +	unsigned int gp, sgmii;
> +	struct regmap *regmap;
> +	unsigned int args[2];
> +	unsigned int reg;
> +	int ret;
> +
> +	regmap = syscon_regmap_lookup_by_phandle_args(np, "mobileye,olb", 2, args);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	gp = args[0];
> +	sgmii = args[1];
> +
> +	/* Forced reset */
> +	regmap_write(regmap, gp, 0);
> +	regmap_write(regmap, sgmii, 0);
> +	usleep_range(5, 20);
> +
> +	if (bp->phy_interface == PHY_INTERFACE_MODE_SGMII) 

Isn't this too early? What if you have an SFP and the interface mode is initially
1000Base-X and the user plugs in an SGMII module?

{
> +		regmap_write(regmap, gp, EYEQ5_OLB_GP_SGMII_MODE);
> +
> +		reg = EYEQ5_OLB_SGMII_PWR_EN | EYEQ5_OLB_SGMII_RST_DIS |
> +		      EYEQ5_OLB_SGMII_PLL_EN;
> +		regmap_write(regmap, sgmii, reg);
> +
> +		ret = regmap_read_poll_timeout(regmap, sgmii, reg,
> +					       reg & EYEQ5_OLB_SGMII_PLL_ACK,
> +					       1, 100);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "PLL timeout");
> +
> +		reg = EYEQ5_OLB_SGMII_PWR_STATE | EYEQ5_OLB_SGMII_SIG_DET_SW;
> +		regmap_update_bits(regmap, sgmii, reg, reg);
> +	}
> +
> +	reg = phy_interface_mode_is_rgmii(bp->phy_interface) ? 0x9 : 0x0;
> +	regmap_update_bits(regmap, gp, EYEQ5_OLB_GP_RGMII_DRV,
> +			   FIELD_PREP(EYEQ5_OLB_GP_RGMII_DRV, reg));
> +
> +	reg = EYEQ5_OLB_GP_TX_SWRST_DIS | EYEQ5_OLB_GP_TX_M_CLKE |
> +	      EYEQ5_OLB_GP_SYS_SWRST_DIS | EYEQ5_OLB_GP_SYS_M_CLKE;
> +	regmap_update_bits(regmap, gp, reg, reg);
> +
> +	return macb_init(pdev);
> +}
> +
>  static const struct macb_usrio_config sama7g5_usrio = {
>  	.mii = 0,
>  	.rmii = 1,
> @@ -5109,6 +5177,17 @@ static const struct macb_config versal_config = {
>  	.usrio = &macb_default_usrio,
>  };
>  
> +static const struct macb_config eyeq5_config = {
> +	.caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE | MACB_CAPS_JUMBO |
> +		MACB_CAPS_GEM_HAS_PTP | MACB_CAPS_QUEUE_DISABLE |
> +		MACB_CAPS_NO_LSO,
> +	.dma_burst_length = 16,
> +	.clk_init = macb_clk_init,
> +	.init = eyeq5_init,
> +	.jumbo_max_len = 10240,
> +	.usrio = &macb_default_usrio,
> +};
> +
>  static const struct of_device_id macb_dt_ids[] = {
>  	{ .compatible = "cdns,at91sam9260-macb", .data = &at91sam9260_config },
>  	{ .compatible = "cdns,macb" },
> @@ -5129,6 +5208,7 @@ static const struct of_device_id macb_dt_ids[] = {
>  	{ .compatible = "microchip,mpfs-macb", .data = &mpfs_config },
>  	{ .compatible = "microchip,sama7g5-gem", .data = &sama7g5_gem_config },
>  	{ .compatible = "microchip,sama7g5-emac", .data = &sama7g5_emac_config },
> +	{ .compatible = "mobileye,eyeq5-gem", .data = &eyeq5_config },
>  	{ .compatible = "xlnx,zynqmp-gem", .data = &zynqmp_config},
>  	{ .compatible = "xlnx,zynq-gem", .data = &zynq_config },
>  	{ .compatible = "xlnx,versal-gem", .data = &versal_config},
> 

