Return-Path: <linux-mips+bounces-9595-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 901ABAEFFEE
	for <lists+linux-mips@lfdr.de>; Tue,  1 Jul 2025 18:33:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 522D27A7168
	for <lists+linux-mips@lfdr.de>; Tue,  1 Jul 2025 16:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C41427A924;
	Tue,  1 Jul 2025 16:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Ju+xTz/G"
X-Original-To: linux-mips@vger.kernel.org
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AB2279DD8
	for <linux-mips@vger.kernel.org>; Tue,  1 Jul 2025 16:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751387594; cv=none; b=M7XX6u6K7av9aNBSabvJBzp0xoGiOrFc5U8fQOQBJZDhtyWakzQM3OfLvIXv42mSDQUZbLpNuPcl8sCirY/PR1flyqqX9kM90/Kgcy1KDqxNHd8cTsTDdYx0GkyyAgFoUHg146DVIeHfFKfqD1exYjV4RJzPuZYjQM7EghG/zQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751387594; c=relaxed/simple;
	bh=cYcTvErTdUiGz4HGSo3g3lV+5DJH+CuVIJXqNpULwPg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HnPiseRFxPhyXGMBYOK4VSmWo+mBuFBy0QdEXQonevLGjG6/Y4ZMy0MjZiNCcBFJ1SL0c7uCFbfE4/x8YtdkhYh8Y1twBWKFtDF9CGCqHN0cOqRaQe1rCWo2lKZ5yy1elBVfmgnmVvywjUSBMmpmKlxovPXh/wWB6GFoTmTSdNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Ju+xTz/G; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <7752e805-0a06-46ed-b4ac-a51081a73f78@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751387579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j04zcoZXlPQ2qOZxAyDtyKIp/7+XM+QSiGk1gGR0QUc=;
	b=Ju+xTz/G5fb+wlJYkXEWRGHEdx3g5TOUDlmIH2PwBRPG4cQMJTl6eX/sqDpUGXVxFEkgBC
	Bla3HiZYfX21Sl+v4RhprTORRrTEgRIOJeeN9eDj8TlE8KEfZY5IpB5Vur9C7ZVPT6PXw8
	ToHrkIH3HW+qSrP4qbfirHzI3OBhGSE=
Date: Tue, 1 Jul 2025 12:32:51 -0400
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net-next v2 11/18] net: macb: single dma_alloc_coherent()
 for DMA descriptors
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
 <20250627-macb-v2-11-ff8207d0bb77@bootlin.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250627-macb-v2-11-ff8207d0bb77@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 6/27/25 05:08, Théo Lebrun wrote:
> Move from two (Tx/Rx) dma_alloc_coherent() for DMA descriptor rings *per
> queue* to two dma_alloc_coherent() overall.
> 
> Issue is with how all queues share the same register for configuring the
> upper 32-bits of Tx/Rx descriptor rings. For example, with Tx, notice
> how TBQPH does *not* depend on the queue index:
> 
> 	#define GEM_TBQP(hw_q)		(0x0440 + ((hw_q) << 2))
> 	#define GEM_TBQPH(hw_q)		(0x04C8)
> 
> 	queue_writel(queue, TBQP, lower_32_bits(queue->tx_ring_dma));
> 	#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
> 	if (bp->hw_dma_cap & HW_DMA_CAP_64B)
> 		queue_writel(queue, TBQPH, upper_32_bits(queue->tx_ring_dma));
> 	#endif
> 
> To maxime our chances of getting valid DMA addresses, we do a single

maximize

> dma_alloc_coherent() across queues.

Is there really any chance involved (other than avoiding ENOMEM)?

> This improves the odds because
> alloc_pages() guarantees natural alignment. It cannot ensure valid DMA
> addresses because of IOMMU or codepaths that don't go through
> alloc_pages().
> 
> We error out if all rings don't have the same upper 32 bits, which is
> better than the current (theoretical, not reproduced) silent corruption
> caused by hardware that accesses invalid addresses.

I think this is addressed by the previous patch.

> Two considerations:
>  - dma_alloc_coherent() gives us page alignment. Here we remove this
>    containst meaning each queue's ring won't be page-aligned anymore.

constraint

>  - This can save some memory. Less allocations means less overhead

fewer

>    (constant cost per alloc) and less wasted bytes due to alignment
>    constraints.

I think it's probably a bit of a wash with reasonably-sized rings.
Although the prefetch probably interacts poorly with the default "round"
power-of-two ring sizes.

> Fixes: 02c958dd3446 ("net/macb: add TX multiqueue support for gem")
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---
>  drivers/net/ethernet/cadence/macb_main.c | 83 ++++++++++++++++++--------------
>  1 file changed, 46 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
> index d3b3635998cad095246edf8a75faebbcf7115355..48b75d95861317b9925b366446c7572c7e186628 100644
> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c
> @@ -2445,33 +2445,32 @@ static void macb_free_rx_buffers(struct macb *bp)
>  
>  static void macb_free_consistent(struct macb *bp)
>  {
> -	struct macb_queue *queue;
> +	size_t size, tx_size_per_queue, rx_size_per_queue;
> +	struct macb_queue *queue, *queue0 = bp->queues;
> +	struct device *dev = &bp->pdev->dev;
>  	unsigned int q;
> -	int size;
>  
>  	if (bp->rx_ring_tieoff) {
> -		dma_free_coherent(&bp->pdev->dev, macb_dma_desc_get_size(bp),
> +		dma_free_coherent(dev, macb_dma_desc_get_size(bp),
>  				  bp->rx_ring_tieoff, bp->rx_ring_tieoff_dma);
>  		bp->rx_ring_tieoff = NULL;
>  	}
>  
>  	bp->macbgem_ops.mog_free_rx_buffers(bp);
>  
> +	tx_size_per_queue = TX_RING_BYTES(bp) + bp->tx_bd_rd_prefetch;
> +	size = bp->num_queues * tx_size_per_queue;

Can you refactor the size calculation into a helper function?

> +	dma_free_coherent(dev, size, queue0->tx_ring, queue0->tx_ring_dma);
> +
> +	rx_size_per_queue = RX_RING_BYTES(bp) + bp->rx_bd_rd_prefetch;
> +	size = bp->num_queues * rx_size_per_queue;
> +	dma_free_coherent(dev, size, queue0->rx_ring, queue0->rx_ring_dma);
> +
>  	for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue) {
>  		kfree(queue->tx_skb);
>  		queue->tx_skb = NULL;
> -		if (queue->tx_ring) {
> -			size = TX_RING_BYTES(bp) + bp->tx_bd_rd_prefetch;
> -			dma_free_coherent(&bp->pdev->dev, size,
> -					  queue->tx_ring, queue->tx_ring_dma);
> -			queue->tx_ring = NULL;
> -		}
> -		if (queue->rx_ring) {
> -			size = RX_RING_BYTES(bp) + bp->rx_bd_rd_prefetch;
> -			dma_free_coherent(&bp->pdev->dev, size,
> -					  queue->rx_ring, queue->rx_ring_dma);
> -			queue->rx_ring = NULL;
> -		}
> +		queue->tx_ring = NULL; /* Single buffer owned by queue0 */
> +		queue->rx_ring = NULL; /* Single buffer owned by queue0 */

OK, but queue0 doesn't own the ring either at this point (it's free'd).

>  	}
>  }
>  
> @@ -2513,37 +2512,47 @@ static int macb_alloc_rx_buffers(struct macb *bp)
>  
>  static int macb_alloc_consistent(struct macb *bp)
>  {
> +	size_t size, tx_size_per_queue, rx_size_per_queue;
> +	dma_addr_t tx_dma, rx_dma;
> +	struct device *dev = &bp->pdev->dev;
>  	struct macb_queue *queue;
>  	unsigned int q;
> -	int size;
> +	void *tx, *rx;
> +
> +	/*
> +	 * Upper 32-bits of Tx/Rx DMA descriptor for each queues much match!
> +	 * We cannot enforce this guarantee, the best we can do is do a single
> +	 * allocation and hope it will land into alloc_pages() that guarantees
> +	 * natural alignment of physical addresses.
> +	 */
> +
> +	tx_size_per_queue = TX_RING_BYTES(bp) + bp->tx_bd_rd_prefetch;
> +	size = bp->num_queues * tx_size_per_queue;
> +	tx = dma_alloc_coherent(dev, size, &tx_dma, GFP_KERNEL);
> +	if (!tx || upper_32_bits(tx_dma) != upper_32_bits(tx_dma + size - 1))
> +		goto out_err;
> +	netdev_dbg(bp->dev, "Allocated %zu bytes for %u TX rings at %08lx (mapped %p)\n",
> +		   size, bp->num_queues, (unsigned long)tx_dma, tx);
> +
> +	rx_size_per_queue = RX_RING_BYTES(bp) + bp->rx_bd_rd_prefetch;
> +	size = bp->num_queues * rx_size_per_queue;
> +	rx = dma_alloc_coherent(dev, size, &rx_dma, GFP_KERNEL);
> +	if (!rx || upper_32_bits(rx_dma) != upper_32_bits(rx_dma + size - 1))
> +		goto out_err;
> +	netdev_dbg(bp->dev, "Allocated %zu bytes for %u RX rings at %08lx (mapped %p)\n",
> +		   size, bp->num_queues, (unsigned long)rx_dma, rx);
>  
>  	for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue) {
> -		size = TX_RING_BYTES(bp) + bp->tx_bd_rd_prefetch;
> -		queue->tx_ring = dma_alloc_coherent(&bp->pdev->dev, size,
> -						    &queue->tx_ring_dma,
> -						    GFP_KERNEL);
> -		if (!queue->tx_ring ||
> -		    upper_32_bits(queue->tx_ring_dma) != upper_32_bits(bp->queues->tx_ring_dma))
> -			goto out_err;
> -		netdev_dbg(bp->dev,
> -			   "Allocated TX ring for queue %u of %d bytes at %08lx (mapped %p)\n",
> -			   q, size, (unsigned long)queue->tx_ring_dma,
> -			   queue->tx_ring);
> +		queue->tx_ring = tx + tx_size_per_queue * q;
> +		queue->tx_ring_dma = tx_dma + tx_size_per_queue * q;
> +
> +		queue->rx_ring = rx + rx_size_per_queue * q;
> +		queue->rx_ring_dma = rx_dma + rx_size_per_queue * q;
>  
>  		size = bp->tx_ring_size * sizeof(struct macb_tx_skb);
>  		queue->tx_skb = kmalloc(size, GFP_KERNEL);
>  		if (!queue->tx_skb)
>  			goto out_err;
> -
> -		size = RX_RING_BYTES(bp) + bp->rx_bd_rd_prefetch;
> -		queue->rx_ring = dma_alloc_coherent(&bp->pdev->dev, size,
> -						 &queue->rx_ring_dma, GFP_KERNEL);
> -		if (!queue->rx_ring ||
> -		    upper_32_bits(queue->rx_ring_dma) != upper_32_bits(bp->queues->rx_ring_dma))
> -			goto out_err;
> -		netdev_dbg(bp->dev,
> -			   "Allocated RX ring of %d bytes at %08lx (mapped %p)\n",
> -			   size, (unsigned long)queue->rx_ring_dma, queue->rx_ring);
>  	}
>  	if (bp->macbgem_ops.mog_alloc_rx_buffers(bp))
>  		goto out_err;
> 

Reviewed-by: Sean Anderson <sean.anderson@linux.dev>

