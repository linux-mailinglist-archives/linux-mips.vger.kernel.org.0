Return-Path: <linux-mips+bounces-9594-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF74AEFF8C
	for <lists+linux-mips@lfdr.de>; Tue,  1 Jul 2025 18:22:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC1A4444499
	for <lists+linux-mips@lfdr.de>; Tue,  1 Jul 2025 16:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A563027B4FC;
	Tue,  1 Jul 2025 16:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="JIZv0vZl"
X-Original-To: linux-mips@vger.kernel.org
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1F027935A
	for <linux-mips@vger.kernel.org>; Tue,  1 Jul 2025 16:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751386860; cv=none; b=czJKvEJ8O4Z+HGi9cMCxQRWh+tfRN/bz//hW135phjhg+y26wRkkKHUDUIre/1XXjFIPr/2TNSOs7m0Psrdaex68xmvhnfjeAfFGyZIMldfCwsmC3579jFZt8d7XQ+F+5YEc9jjLjCmaadmMiuEN5YEgAHF2PVDH8fBLdhxGcoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751386860; c=relaxed/simple;
	bh=HQktoeVlNcl4UkDcYQChN8gXI5vAV3mCyQeSK5m9Tfk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=IgKl428fhzwXeF1J0FXtfu5/C4Iap8mPpIMVERaDmqud1GQXXbdxGk/kM7d8mVWp0tKsafJ98y4bOUiy7lXnQoLghsIm7olMx4FnDiGIUK7DETkjrH2m9RVkbbFrBkq/nDjleoKvR3HgF8oIKQEcvpBBd4ceipIkFeEw24xnvO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=JIZv0vZl; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <e7daf3f4-de9e-4c06-ae60-6fb215c7364e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751386846;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e1/e3eap9f2tDNMMl9IjOF9XHUaDUuipryrarrhqc5k=;
	b=JIZv0vZlClHXgj7127g8+kz2SRAr0Px3UoYls6ptGkhWdbdq2YobumRaWhdMF90BjQSxlp
	eXwOfHeMmjmbjKXoX7xNNU7RaeiDHkSB6FrpfzvEPDyPkkC38h9m2xx7Bg2U7vQvBCj3tq
	bWXWe1kLdjto2uFwDP38VDeu9Vk92Qc=
Date: Tue, 1 Jul 2025 12:20:37 -0400
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net-next v2 10/18] net: macb: remove illusion about
 TBQPH/RBQPH being per-queue
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
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
 <20250627-macb-v2-10-ff8207d0bb77@bootlin.com>
 <c0037d24-5e24-4682-bc51-889a854d409e@seco.com>
Content-Language: en-US
In-Reply-To: <c0037d24-5e24-4682-bc51-889a854d409e@seco.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 7/1/25 12:15, Sean Anderson wrote:
> On 6/27/25 05:08, Théo Lebrun wrote:
>> The MACB driver acts as if TBQPH/RBQPH are configurable on a per queue
>> basis; this is a lie. A single register configures the upper 32 bits of
>> each DMA descriptor buffers for all queues.
>> 
>> Concrete actions:
>> 
>>  - Drop GEM_TBQPH/GEM_RBQPH macros which have a queue index argument.
>>    Only use MACB_TBQPH/MACB_RBQPH constants.
>> 
>>  - Drop struct macb_queue->TBQPH/RBQPH fields.
>> 
>>  - In macb_init_buffers(): do a single write to TBQPH and RBQPH for all
>>    queues instead of a write per queue.
>> 
>>  - In macb_tx_error_task(): drop the write to TBQPH.
>> 
>>  - In macb_alloc_consistent(): if allocations give different upper
>>    32-bits, fail. Previously, it would have lead to silent memory
>>    corruption as queues would have used the upper 32 bits of the alloc
>>    from queue 0 and their own low 32 bits.
> 
> While better than silent memory corruption, this is not a good solution
> since bringing the netdev up will now randomly fail. Can we allocate the
> rings in one contiguous chunk instead?

Ah, looks like you do this in the next patch. In that case, (with the other
comments addressed)

Reviewed-by: Sean Anderson <sean.anderson@linux.dev>

>>  - In macb_suspend(): if we use the tie off descriptor for suspend, do
>>    the write once for all queues instead of once per queue.
>> 
>> Fixes: fff8019a08b6 ("net: macb: Add 64 bit addressing support for GEM")
>> Fixes: ae1f2a56d273 ("net: macb: Added support for many RX queues")
>> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> 
> As this is a bugfix, can you move it before your cleanup patches? This
> will make it easier to backport to stable kernels.
> 
>> ---
>>  drivers/net/ethernet/cadence/macb.h      |  4 ----
>>  drivers/net/ethernet/cadence/macb_main.c | 36 +++++++++++++-------------------
>>  2 files changed, 14 insertions(+), 26 deletions(-)
>> 
>> diff --git a/drivers/net/ethernet/cadence/macb.h b/drivers/net/ethernet/cadence/macb.h
>> index 707b3286a6b8408a3bc4bbbcb1335ae8c3cd95ad..adc70b6efd52b0b11e436c2c95bb5108c40f3490 100644
>> --- a/drivers/net/ethernet/cadence/macb.h
>> +++ b/drivers/net/ethernet/cadence/macb.h
>> @@ -209,10 +209,8 @@
>>  
>>  #define GEM_ISR(hw_q)		(0x0400 + ((hw_q) << 2))
>>  #define GEM_TBQP(hw_q)		(0x0440 + ((hw_q) << 2))
>> -#define GEM_TBQPH(hw_q)		(0x04C8)
>>  #define GEM_RBQP(hw_q)		(0x0480 + ((hw_q) << 2))
>>  #define GEM_RBQS(hw_q)		(0x04A0 + ((hw_q) << 2))
>> -#define GEM_RBQPH(hw_q)		(0x04D4)
>>  #define GEM_IER(hw_q)		(0x0600 + ((hw_q) << 2))
>>  #define GEM_IDR(hw_q)		(0x0620 + ((hw_q) << 2))
>>  #define GEM_IMR(hw_q)		(0x0640 + ((hw_q) << 2))
>> @@ -1208,10 +1206,8 @@ struct macb_queue {
>>  	unsigned int		IDR;
>>  	unsigned int		IMR;
>>  	unsigned int		TBQP;
>> -	unsigned int		TBQPH;
>>  	unsigned int		RBQS;
>>  	unsigned int		RBQP;
>> -	unsigned int		RBQPH;
>>  
>>  	/* Lock to protect tx_head and tx_tail */
>>  	spinlock_t		tx_ptr_lock;
>> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
>> index a6633e076644089c796453f856a766299bae2ec6..d3b3635998cad095246edf8a75faebbcf7115355 100644
>> --- a/drivers/net/ethernet/cadence/macb_main.c
>> +++ b/drivers/net/ethernet/cadence/macb_main.c
>> @@ -482,15 +482,15 @@ static void macb_init_buffers(struct macb *bp)
>>  	struct macb_queue *queue;
>>  	unsigned int q;
>>  
>> +	if (macb_dma_is_64b(bp)) {
>> +		/* Single register for all queues' high 32 bits. */
>> +		macb_writel(bp, RBQPH, upper_32_bits(bp->queues->rx_ring_dma));
>> +		macb_writel(bp, TBQPH, upper_32_bits(bp->queues->tx_ring_dma));
>> +	}
>> +
>>  	for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue) {
>>  		queue_writel(queue, RBQP, lower_32_bits(queue->rx_ring_dma));
>> -		if (macb_dma_is_64b(bp))
>> -			queue_writel(queue, RBQPH,
>> -				     upper_32_bits(queue->rx_ring_dma));
>>  		queue_writel(queue, TBQP, lower_32_bits(queue->tx_ring_dma));
>> -		if (macb_dma_is_64b(bp))
>> -			queue_writel(queue, TBQPH,
>> -				     upper_32_bits(queue->tx_ring_dma));
>>  	}
>>  }
>>  
>> @@ -1145,8 +1145,6 @@ static void macb_tx_error_task(struct work_struct *work)
>>  
>>  	/* Reinitialize the TX desc queue */
>>  	queue_writel(queue, TBQP, lower_32_bits(queue->tx_ring_dma));
>> -	if (macb_dma_is_64b(bp))
>> -		queue_writel(queue, TBQPH, upper_32_bits(queue->tx_ring_dma));
>>  	/* Make TX ring reflect state of hardware */
>>  	queue->tx_head = 0;
>>  	queue->tx_tail = 0;
>> @@ -2524,7 +2522,8 @@ static int macb_alloc_consistent(struct macb *bp)
>>  		queue->tx_ring = dma_alloc_coherent(&bp->pdev->dev, size,
>>  						    &queue->tx_ring_dma,
>>  						    GFP_KERNEL);
>> -		if (!queue->tx_ring)
>> +		if (!queue->tx_ring ||
>> +		    upper_32_bits(queue->tx_ring_dma) != upper_32_bits(bp->queues->tx_ring_dma))
>>  			goto out_err;
>>  		netdev_dbg(bp->dev,
>>  			   "Allocated TX ring for queue %u of %d bytes at %08lx (mapped %p)\n",
>> @@ -2539,7 +2538,8 @@ static int macb_alloc_consistent(struct macb *bp)
>>  		size = RX_RING_BYTES(bp) + bp->rx_bd_rd_prefetch;
>>  		queue->rx_ring = dma_alloc_coherent(&bp->pdev->dev, size,
>>  						 &queue->rx_ring_dma, GFP_KERNEL);
>> -		if (!queue->rx_ring)
>> +		if (!queue->rx_ring ||
>> +		    upper_32_bits(queue->rx_ring_dma) != upper_32_bits(bp->queues->rx_ring_dma))
> 
> Can you write this as bp->queues[0].rx_ring_dma for clarity?
> 
>>  			goto out_err;
>>  		netdev_dbg(bp->dev,
>>  			   "Allocated RX ring of %d bytes at %08lx (mapped %p)\n",
>> @@ -4269,10 +4269,6 @@ static int macb_init(struct platform_device *pdev)
>>  			queue->TBQP = GEM_TBQP(hw_q - 1);
>>  			queue->RBQP = GEM_RBQP(hw_q - 1);
>>  			queue->RBQS = GEM_RBQS(hw_q - 1);
>> -			if (macb_dma_is_64b(bp)) {
>> -				queue->TBQPH = GEM_TBQPH(hw_q - 1);
>> -				queue->RBQPH = GEM_RBQPH(hw_q - 1);
>> -			}
>>  		} else {
>>  			/* queue0 uses legacy registers */
>>  			queue->ISR  = MACB_ISR;
>> @@ -4281,10 +4277,6 @@ static int macb_init(struct platform_device *pdev)
>>  			queue->IMR  = MACB_IMR;
>>  			queue->TBQP = MACB_TBQP;
>>  			queue->RBQP = MACB_RBQP;
>> -			if (macb_dma_is_64b(bp)) {
>> -				queue->TBQPH = MACB_TBQPH;
>> -				queue->RBQPH = MACB_RBQPH;
>> -			}
>>  		}
>>  
>>  		/* get irq: here we use the linux queue index, not the hardware
>> @@ -5401,6 +5393,10 @@ static int __maybe_unused macb_suspend(struct device *dev)
>>  		 */
>>  		tmp = macb_readl(bp, NCR);
>>  		macb_writel(bp, NCR, tmp & ~(MACB_BIT(TE) | MACB_BIT(RE)));
>> +#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
>> +		if (!(bp->caps & MACB_CAPS_QUEUE_DISABLE))
>> +			macb_writel(bp, RBQPH, upper_32_bits(bp->rx_ring_tieoff_dma));
>> +#endif
>>  		for (q = 0, queue = bp->queues; q < bp->num_queues;
>>  		     ++q, ++queue) {
>>  			/* Disable RX queues */
>> @@ -5410,10 +5406,6 @@ static int __maybe_unused macb_suspend(struct device *dev)
>>  				/* Tie off RX queues */
>>  				queue_writel(queue, RBQP,
>>  					     lower_32_bits(bp->rx_ring_tieoff_dma));
>> -#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
>> -				queue_writel(queue, RBQPH,
>> -					     upper_32_bits(bp->rx_ring_tieoff_dma));
>> -#endif
>>  			}
>>  			/* Disable all interrupts */
>>  			queue_writel(queue, IDR, -1);
>> 


