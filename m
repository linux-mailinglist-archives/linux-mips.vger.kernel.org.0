Return-Path: <linux-mips+bounces-9528-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 123DAAEB249
	for <lists+linux-mips@lfdr.de>; Fri, 27 Jun 2025 11:12:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6000E7A666E
	for <lists+linux-mips@lfdr.de>; Fri, 27 Jun 2025 09:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28CEF2BEC35;
	Fri, 27 Jun 2025 09:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="oVoSw4l2"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2642BCF6A;
	Fri, 27 Jun 2025 09:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751015390; cv=none; b=HxCnty0+E/Cxb533apQ52Z4Fn8ZOY0EhzD+nhJvPCIU+OAcojGQR/UeNEdRJkNJShpY23IJe+bjoWJ3/G+UDO0EUCL7hScCjzEfnSuywb+sQF/SZ94S8pPkY/2bYHGCzEH3vBFXgJjWF1IqX1tSqN3pw5owgvuHFCySZtmVXncU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751015390; c=relaxed/simple;
	bh=JUhHkYVjxv9jgtD5di33weonKWWUNIZfTz5wUlPr+zQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MqQslsT9S6hRB/7Xicbj/Vm/sjQmAn1qDhpms6jCy52VDwAY2ouqzCjtqTY1s63caCC0acEYLyop3TLzNIuQqOXI9jMHXy4cwPrvMHOIN/pPXpvkKAd40cub1LoCuOrU9AI1PilLJ0pP8ZklhoniGA4GmPuQENpNokV1Ek3+SZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=oVoSw4l2; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 98A934390D;
	Fri, 27 Jun 2025 09:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751015386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DsPseUSzo4ypDpOkxYewbhgGY7MJbAesCo6Z26EKGMg=;
	b=oVoSw4l2TCFavN36foCMMGbVrTL8OfCJ/OLwTisVf/4MxLxfG6v5CpwX6p0+LoB57hk1rp
	jFnSu1PhxYFhj7N87KB6pS5TxIOomfCgw7/0p02uiO/dCdXfFeEJpnlHoms6uXvIxbOz41
	fTBgdIWwoU+clOhQcnpeJoKkAcUnGOF6gWVjo+nvuzmd82adve1ZTHlAt9bKaa+fog8tLR
	fJ35Sr4cH/SDrO+qnBtFQiEcr3kv0mevZ3QwvZN72XcLFqppSv6j/jNxWQc66ZpBkVMhdw
	wbG2HJkaerEWbDkBrMdycIsptKIQWsO1cSNgoL+l8qkEwfu54iNyMOhNo8Yvig==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Fri, 27 Jun 2025 11:08:57 +0200
Subject: [PATCH net-next v2 11/18] net: macb: single dma_alloc_coherent()
 for DMA descriptors
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250627-macb-v2-11-ff8207d0bb77@bootlin.com>
References: <20250627-macb-v2-0-ff8207d0bb77@bootlin.com>
In-Reply-To: <20250627-macb-v2-0-ff8207d0bb77@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
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
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvieeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepvfhhrohoucfnvggsrhhunhcuoehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelvefhkeeufedvkefghefhgfdukeejlefgtdehtdeivddtteetgedvieelieeuhfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgunecuvehluhhsthgvrhfuihiivgepuddtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemieeigegsmehftdhffhemfhgvuddtmeelvghfugdphhgvlhhopegludelvddrudeikedruddtrddvudegngdpmhgrihhlfhhrohhmpehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefvddprhgtphhtthhopehrihgthhgrrhgutghotghhrhgrnhesghhmrghilhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehvlhgrughimhhirhdrkhhonhgurhgrthhivghvsehmohgsihhlvgihvgdrt
 ghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhm
X-GND-Sasl: theo.lebrun@bootlin.com

Move from two (Tx/Rx) dma_alloc_coherent() for DMA descriptor rings *per
queue* to two dma_alloc_coherent() overall.

Issue is with how all queues share the same register for configuring the
upper 32-bits of Tx/Rx descriptor rings. For example, with Tx, notice
how TBQPH does *not* depend on the queue index:

	#define GEM_TBQP(hw_q)		(0x0440 + ((hw_q) << 2))
	#define GEM_TBQPH(hw_q)		(0x04C8)

	queue_writel(queue, TBQP, lower_32_bits(queue->tx_ring_dma));
	#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
	if (bp->hw_dma_cap & HW_DMA_CAP_64B)
		queue_writel(queue, TBQPH, upper_32_bits(queue->tx_ring_dma));
	#endif

To maxime our chances of getting valid DMA addresses, we do a single
dma_alloc_coherent() across queues. This improves the odds because
alloc_pages() guarantees natural alignment. It cannot ensure valid DMA
addresses because of IOMMU or codepaths that don't go through
alloc_pages().

We error out if all rings don't have the same upper 32 bits, which is
better than the current (theoretical, not reproduced) silent corruption
caused by hardware that accesses invalid addresses.

Two considerations:
 - dma_alloc_coherent() gives us page alignment. Here we remove this
   containst meaning each queue's ring won't be page-aligned anymore.
 - This can save some memory. Less allocations means less overhead
   (constant cost per alloc) and less wasted bytes due to alignment
   constraints.

Fixes: 02c958dd3446 ("net/macb: add TX multiqueue support for gem")
Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/net/ethernet/cadence/macb_main.c | 83 ++++++++++++++++++--------------
 1 file changed, 46 insertions(+), 37 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index d3b3635998cad095246edf8a75faebbcf7115355..48b75d95861317b9925b366446c7572c7e186628 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -2445,33 +2445,32 @@ static void macb_free_rx_buffers(struct macb *bp)
 
 static void macb_free_consistent(struct macb *bp)
 {
-	struct macb_queue *queue;
+	size_t size, tx_size_per_queue, rx_size_per_queue;
+	struct macb_queue *queue, *queue0 = bp->queues;
+	struct device *dev = &bp->pdev->dev;
 	unsigned int q;
-	int size;
 
 	if (bp->rx_ring_tieoff) {
-		dma_free_coherent(&bp->pdev->dev, macb_dma_desc_get_size(bp),
+		dma_free_coherent(dev, macb_dma_desc_get_size(bp),
 				  bp->rx_ring_tieoff, bp->rx_ring_tieoff_dma);
 		bp->rx_ring_tieoff = NULL;
 	}
 
 	bp->macbgem_ops.mog_free_rx_buffers(bp);
 
+	tx_size_per_queue = TX_RING_BYTES(bp) + bp->tx_bd_rd_prefetch;
+	size = bp->num_queues * tx_size_per_queue;
+	dma_free_coherent(dev, size, queue0->tx_ring, queue0->tx_ring_dma);
+
+	rx_size_per_queue = RX_RING_BYTES(bp) + bp->rx_bd_rd_prefetch;
+	size = bp->num_queues * rx_size_per_queue;
+	dma_free_coherent(dev, size, queue0->rx_ring, queue0->rx_ring_dma);
+
 	for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue) {
 		kfree(queue->tx_skb);
 		queue->tx_skb = NULL;
-		if (queue->tx_ring) {
-			size = TX_RING_BYTES(bp) + bp->tx_bd_rd_prefetch;
-			dma_free_coherent(&bp->pdev->dev, size,
-					  queue->tx_ring, queue->tx_ring_dma);
-			queue->tx_ring = NULL;
-		}
-		if (queue->rx_ring) {
-			size = RX_RING_BYTES(bp) + bp->rx_bd_rd_prefetch;
-			dma_free_coherent(&bp->pdev->dev, size,
-					  queue->rx_ring, queue->rx_ring_dma);
-			queue->rx_ring = NULL;
-		}
+		queue->tx_ring = NULL; /* Single buffer owned by queue0 */
+		queue->rx_ring = NULL; /* Single buffer owned by queue0 */
 	}
 }
 
@@ -2513,37 +2512,47 @@ static int macb_alloc_rx_buffers(struct macb *bp)
 
 static int macb_alloc_consistent(struct macb *bp)
 {
+	size_t size, tx_size_per_queue, rx_size_per_queue;
+	dma_addr_t tx_dma, rx_dma;
+	struct device *dev = &bp->pdev->dev;
 	struct macb_queue *queue;
 	unsigned int q;
-	int size;
+	void *tx, *rx;
+
+	/*
+	 * Upper 32-bits of Tx/Rx DMA descriptor for each queues much match!
+	 * We cannot enforce this guarantee, the best we can do is do a single
+	 * allocation and hope it will land into alloc_pages() that guarantees
+	 * natural alignment of physical addresses.
+	 */
+
+	tx_size_per_queue = TX_RING_BYTES(bp) + bp->tx_bd_rd_prefetch;
+	size = bp->num_queues * tx_size_per_queue;
+	tx = dma_alloc_coherent(dev, size, &tx_dma, GFP_KERNEL);
+	if (!tx || upper_32_bits(tx_dma) != upper_32_bits(tx_dma + size - 1))
+		goto out_err;
+	netdev_dbg(bp->dev, "Allocated %zu bytes for %u TX rings at %08lx (mapped %p)\n",
+		   size, bp->num_queues, (unsigned long)tx_dma, tx);
+
+	rx_size_per_queue = RX_RING_BYTES(bp) + bp->rx_bd_rd_prefetch;
+	size = bp->num_queues * rx_size_per_queue;
+	rx = dma_alloc_coherent(dev, size, &rx_dma, GFP_KERNEL);
+	if (!rx || upper_32_bits(rx_dma) != upper_32_bits(rx_dma + size - 1))
+		goto out_err;
+	netdev_dbg(bp->dev, "Allocated %zu bytes for %u RX rings at %08lx (mapped %p)\n",
+		   size, bp->num_queues, (unsigned long)rx_dma, rx);
 
 	for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue) {
-		size = TX_RING_BYTES(bp) + bp->tx_bd_rd_prefetch;
-		queue->tx_ring = dma_alloc_coherent(&bp->pdev->dev, size,
-						    &queue->tx_ring_dma,
-						    GFP_KERNEL);
-		if (!queue->tx_ring ||
-		    upper_32_bits(queue->tx_ring_dma) != upper_32_bits(bp->queues->tx_ring_dma))
-			goto out_err;
-		netdev_dbg(bp->dev,
-			   "Allocated TX ring for queue %u of %d bytes at %08lx (mapped %p)\n",
-			   q, size, (unsigned long)queue->tx_ring_dma,
-			   queue->tx_ring);
+		queue->tx_ring = tx + tx_size_per_queue * q;
+		queue->tx_ring_dma = tx_dma + tx_size_per_queue * q;
+
+		queue->rx_ring = rx + rx_size_per_queue * q;
+		queue->rx_ring_dma = rx_dma + rx_size_per_queue * q;
 
 		size = bp->tx_ring_size * sizeof(struct macb_tx_skb);
 		queue->tx_skb = kmalloc(size, GFP_KERNEL);
 		if (!queue->tx_skb)
 			goto out_err;
-
-		size = RX_RING_BYTES(bp) + bp->rx_bd_rd_prefetch;
-		queue->rx_ring = dma_alloc_coherent(&bp->pdev->dev, size,
-						 &queue->rx_ring_dma, GFP_KERNEL);
-		if (!queue->rx_ring ||
-		    upper_32_bits(queue->rx_ring_dma) != upper_32_bits(bp->queues->rx_ring_dma))
-			goto out_err;
-		netdev_dbg(bp->dev,
-			   "Allocated RX ring of %d bytes at %08lx (mapped %p)\n",
-			   size, (unsigned long)queue->rx_ring_dma, queue->rx_ring);
 	}
 	if (bp->macbgem_ops.mog_alloc_rx_buffers(bp))
 		goto out_err;

-- 
2.50.0


