Return-Path: <linux-mips+bounces-9596-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BF0AF0050
	for <lists+linux-mips@lfdr.de>; Tue,  1 Jul 2025 18:44:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 82C8216B4CB
	for <lists+linux-mips@lfdr.de>; Tue,  1 Jul 2025 16:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E356B27FD4E;
	Tue,  1 Jul 2025 16:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="RLgFCTGL"
X-Original-To: linux-mips@vger.kernel.org
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE9527CCEE
	for <linux-mips@vger.kernel.org>; Tue,  1 Jul 2025 16:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751388032; cv=none; b=gpu5e++YLcY8TA/+elzK4y1KglRH7lPqc7phgXPDRuTo+2iGj+4TcgGm48vRBcgtI23Q4GMRSm/XwifhUwEtniyJnvEtalkgY815QldArqv3ssnGKooX8wCWLdtfjSbWianAPpmT/2r0axA4UlmETLQjOMLWc7RrCRRDx2PHXMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751388032; c=relaxed/simple;
	bh=hk/shajpqhbI5aSCnWtJ+BEGb1jgnvRLCCAWvwffxH8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ONUfU6f60LE+Ukmov6iWK91lUR8B1XJn1SLRarygiG54Sl9XlO+GgxYfE7iMOe9ZPlm5GGeYXQpSIvoR1Amsv7CD/I7bUVdvbJGDwdFhE/q9zG6LyONSZlMDwjvPRc6rkRqoiF0XhWhADnetXexRN728KHBQVuEnfOGxnbwsaMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=RLgFCTGL; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <1a4fe95a-f029-43b2-aed1-594365254b6a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751388026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b4v8Xkp+c9mceTr0Q8v7/zrK1IVjBYCeckNhf49+7xs=;
	b=RLgFCTGLYZGv7GE+j3tCpdemaHKjOPsy83ZDnu3AOOXA8PZ6TwJihlUBHoT7RsdgGvY6rs
	iSal0Uk/kJUOk03z5i/GAeuQMbCS3TEj1la5NEJxKz28cXHvOKvXg3HkEhsMlGBvKe6R30
	aQ6wK1DMkfzkt1bFhcGJmZpmKTI4P2o=
Date: Tue, 1 Jul 2025 12:40:17 -0400
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net-next v2 12/18] net: macb: match skb_reserve(skb,
 NET_IP_ALIGN) with HW alignment
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
 <20250627-macb-v2-12-ff8207d0bb77@bootlin.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250627-macb-v2-12-ff8207d0bb77@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 6/27/25 05:08, Théo Lebrun wrote:
> If HW is RSC capable, it cannot add dummy bytes at the start of IP

Receive-side coalescing? Can you add a brief description of this
feature to your commit message?

> packets. Alignment (ie number of dummy bytes) is configured using the
> RBOF field inside the NCFGR register.
> 
> On the software side, the skb_reserve(skb, NET_IP_ALIGN) call must only
> be done if those dummy bytes are added by the hardware; notice the
> skb_reserve() is done AFTER writing the address to the device.
> 
> We cannot do the skb_reserve() call BEFORE writing the address because
> the address field ignores the low 2/3 bits. Conclusion: in some cases,
> we risk not being able to respect the NET_IP_ALIGN value (which is
> picked based on unaligned CPU access performance).
> 
> Fixes: 4df95131ea80 ("net/macb: change RX path for GEM")

Do any existing MACBs support RSC? Is this a fix? 

> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---
>  drivers/net/ethernet/cadence/macb.h      |  3 +++
>  drivers/net/ethernet/cadence/macb_main.c | 21 ++++++++++++++++++---
>  2 files changed, 21 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/cadence/macb.h b/drivers/net/ethernet/cadence/macb.h
> index adc70b6efd52b0b11e436c2c95bb5108c40f3490..d42c81cf441ce435cad38e2dfd779b0e6a141bf3 100644
> --- a/drivers/net/ethernet/cadence/macb.h
> +++ b/drivers/net/ethernet/cadence/macb.h
> @@ -523,6 +523,8 @@
>  /* Bitfields in DCFG6. */
>  #define GEM_PBUF_LSO_OFFSET			27
>  #define GEM_PBUF_LSO_SIZE			1
> +#define GEM_PBUF_RSC_OFFSET			26
> +#define GEM_PBUF_RSC_SIZE			1
>  #define GEM_PBUF_CUTTHRU_OFFSET			25
>  #define GEM_PBUF_CUTTHRU_SIZE			1
>  #define GEM_DAW64_OFFSET			23
> @@ -733,6 +735,7 @@
>  #define MACB_CAPS_MIIONRGMII			BIT(9)
>  #define MACB_CAPS_NEED_TSUCLK			BIT(10)
>  #define MACB_CAPS_QUEUE_DISABLE			BIT(11)
> +#define MACB_CAPS_RSC_CAPABLE			BIT(12)

No need to be _CAPABLE, we're already _CAPS_

>  #define MACB_CAPS_PCS				BIT(24)
>  #define MACB_CAPS_HIGH_SPEED			BIT(25)
>  #define MACB_CAPS_CLK_HW_CHG			BIT(26)
> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
> index 48b75d95861317b9925b366446c7572c7e186628..578e72c7727d4f578478ff2b3d0a6316327271b1 100644
> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c
> @@ -1317,8 +1317,19 @@ static void gem_rx_refill(struct macb_queue *queue)
>  			dma_wmb();
>  			macb_set_addr(bp, desc, paddr);
>  
> -			/* properly align Ethernet header */
> -			skb_reserve(skb, NET_IP_ALIGN);
> +			/* Properly align Ethernet header.
> +			 *
> +			 * Hardware can add dummy bytes if asked using the RBOF
> +			 * field inside the NCFGR register. That feature isn't
> +			 * available if hardware is RSC capable.
> +			 *
> +			 * We cannot fallback to doing the 2-byte shift before
> +			 * DMA mapping because the address field does not allow
> +			 * setting the low 2/3 bits.
> +			 * It is 3 bits if HW_DMA_CAP_PTP, else 2 bits.
> +			 */
> +			if (!(bp->caps & MACB_CAPS_RSC_CAPABLE))
> +				skb_reserve(skb, NET_IP_ALIGN);
>  		} else {
>  			desc->ctrl = 0;
>  			dma_wmb();
> @@ -2787,7 +2798,9 @@ static void macb_init_hw(struct macb *bp)
>  	macb_set_hwaddr(bp);
>  
>  	config = macb_mdc_clk_div(bp);
> -	config |= MACB_BF(RBOF, NET_IP_ALIGN);	/* Make eth data aligned */
> +	/* Make eth data aligned. If RSC capable, that offset is ignored by HW. */
> +	if (!(bp->caps & MACB_CAPS_RSC_CAPABLE))
> +		config |= MACB_BF(RBOF, NET_IP_ALIGN);
>  	config |= MACB_BIT(DRFCS);		/* Discard Rx FCS */
>  	if (bp->caps & MACB_CAPS_JUMBO)
>  		config |= MACB_BIT(JFRAME);	/* Enable jumbo frames */
> @@ -4108,6 +4121,8 @@ static void macb_configure_caps(struct macb *bp,
>  		dcfg = gem_readl(bp, DCFG2);
>  		if ((dcfg & (GEM_BIT(RX_PKT_BUFF) | GEM_BIT(TX_PKT_BUFF))) == 0)
>  			bp->caps |= MACB_CAPS_FIFO_MODE;
> +		if (GEM_BFEXT(PBUF_RSC, gem_readl(bp, DCFG6)))
> +			bp->caps |= MACB_CAPS_RSC_CAPABLE;
>  		if (gem_has_ptp(bp)) {
>  			if (!GEM_BFEXT(TSU, gem_readl(bp, DCFG5)))
>  				dev_err(&bp->pdev->dev,
> 


