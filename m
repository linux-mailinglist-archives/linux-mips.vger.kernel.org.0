Return-Path: <linux-mips+bounces-9525-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04579AEB245
	for <lists+linux-mips@lfdr.de>; Fri, 27 Jun 2025 11:12:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 587483B4917
	for <lists+linux-mips@lfdr.de>; Fri, 27 Jun 2025 09:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92AC629B77E;
	Fri, 27 Jun 2025 09:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gOhLcGgd"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FFC29992B;
	Fri, 27 Jun 2025 09:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751015385; cv=none; b=G38bIbXY5mSYe70wWAgUxBOAUdxyAo0wJuhnNU6v5s3NAQZnK+/Ao433FJ6cd/HIBO076VPhB/e/hdVfop4jFSvqZSY/ohhrzY3RLLmWyt4fCwC6QG4HN5Ayd4m4fNamDN3wZfasmPgxyfmifam929898nCvg3U2Y2Y6G6ovEtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751015385; c=relaxed/simple;
	bh=/7J3mfklQomCj0WW5k4xZWYAbaxECn05MsOXAVEUyW8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JSWro+ABYQWZC5NT3AgolkgDxxvEoCAyAO0QcL3Hhen0bT9DOfLNzReAUawxZYf2zg2GDQJkYu5WNM1hrCxEANVDTJEnsBtdf2WZB8qT+ISRj/A7r/sguppNPnAnN7bUJxdrrPg9DfNrKnqOZ+HY7qnm8Ii6eASfrHYHdBMR7KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gOhLcGgd; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0635543904;
	Fri, 27 Jun 2025 09:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751015381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=27dTvSnSpjlP+MUjOBDz59LLJIusxntTayEOUPM+XNw=;
	b=gOhLcGgdO+CD6wIVc4sv/5MXIw9RmK7LqXd4ZU7lOLsocjvMOt+CtSTNk5N8SrcVJ1q2cY
	6ej6ssZ9wrqSk/Ex3cmLVHtVM5Vx2SQcmOP/qrZTV2EHLVJXYKOP5DgA+eftx1VsGIGUQm
	irwbDukg0FZAdP0VbOuhnR7O3M5ITGX4m5C5B0vVRRDGw+RtgcPZE+R27QM38SUyYpu9Qu
	BTdd0itiI1lVZV4JNhKyxRv1jmprOXlwnTmx9VTI+Yg3OizsHRnNKetmJbNC5chmBv0Sua
	rHPjAhkWII6Ggu3FOyMDM2x7i7+OxMDoVp9xaYEyO8aIISWcSDqfq0vhZQ1sjg==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Fri, 27 Jun 2025 11:08:54 +0200
Subject: [PATCH net-next v2 08/18] net: macb: introduce DMA descriptor
 helpers (is 64bit? is PTP?)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250627-macb-v2-8-ff8207d0bb77@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvieeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepvfhhrohoucfnvggsrhhunhcuoehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelvefhkeeufedvkefghefhgfdukeejlefgtdehtdeivddtteetgedvieelieeuhfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgunecuvehluhhsthgvrhfuihiivgepjeenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgupdhhvghloheplgduledvrdduieekrddutddrvddugegnpdhmrghilhhfrhhomhepthhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedvpdhrtghpthhtoheprhhitghhrghruggtohgthhhrrghnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvhhlrgguihhmihhrrdhkohhnughrrghtihgvvhesmhhosghilhgvhigvrdgto
 hhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomh
X-GND-Sasl: theo.lebrun@bootlin.com

Introduce macb_dma_is_64b() and macb_dma_is_ptp() helper functions.
Many codepaths are made simpler by dropping conditional compilation.

This implies three changes:
 - Always compile related structure definitions inside <macb.h>.
 - Make the field hw_dma_cap in struct macb always present.
 - MACB_EXT_DESC can be dropped as it is useless now.

The common case is:

	#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
		struct macb_dma_desc_64 *desc_64;
		if (bp->hw_dma_cap & HW_DMA_CAP_64B) {
			desc_64 = macb_64b_desc(bp, desc);
			// ...
		}
	#endif

And replaced by:

	struct macb_dma_desc_64 *desc_64;
	if (macb_dma_is_64b(bp)) {
		desc_64 = macb_64b_desc(bp, desc);
		// ...
	}

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/net/ethernet/cadence/macb.h      |   8 ---
 drivers/net/ethernet/cadence/macb_main.c | 113 +++++++++++--------------------
 2 files changed, 40 insertions(+), 81 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb.h b/drivers/net/ethernet/cadence/macb.h
index 3b43cb9468e3618754ff2bc6c5f360447bdeeed0..707b3286a6b8408a3bc4bbbcb1335ae8c3cd95ad 100644
--- a/drivers/net/ethernet/cadence/macb.h
+++ b/drivers/net/ethernet/cadence/macb.h
@@ -15,10 +15,6 @@
 #include <linux/phy/phy.h>
 #include <linux/workqueue.h>
 
-#if defined(CONFIG_ARCH_DMA_ADDR_T_64BIT) || defined(CONFIG_MACB_USE_HWSTAMP)
-#define MACB_EXT_DESC
-#endif
-
 #define MACB_GREGS_NBR 16
 #define MACB_GREGS_VERSION 2
 #define MACB_MAX_QUEUES 8
@@ -823,7 +819,6 @@ struct macb_dma_desc {
 	u32	ctrl;
 };
 
-#ifdef MACB_EXT_DESC
 #define HW_DMA_CAP_32B		0
 #define HW_DMA_CAP_64B		(1 << 0)
 #define HW_DMA_CAP_PTP		(1 << 1)
@@ -838,7 +833,6 @@ struct macb_dma_desc_ptp {
 	u32	ts_1;
 	u32	ts_2;
 };
-#endif
 
 /* DMA descriptor bitfields */
 #define MACB_RX_USED_OFFSET			0
@@ -1316,9 +1310,7 @@ struct macb {
 
 	struct phy		*sgmii_phy;	/* for ZynqMP SGMII mode */
 
-#ifdef MACB_EXT_DESC
 	uint8_t hw_dma_cap;
-#endif
 	spinlock_t tsu_clk_lock; /* gem tsu clock locking */
 	unsigned int tsu_rate;
 	struct ptp_clock *ptp_clock;
diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 6926ea11d71adae7a25d5ee329c148f5882d4184..be667cb5acce85a9d11aaea1f5081a3380b60ef2 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -95,6 +95,18 @@ struct sifive_fu540_macb_mgmt {
 
 #define MACB_MDIO_TIMEOUT	1000000 /* in usecs */
 
+static bool macb_dma_is_64b(struct macb *bp)
+{
+	return IS_ENABLED(CONFIG_ARCH_DMA_ADDR_T_64BIT) &&
+	       bp->hw_dma_cap & HW_DMA_CAP_64B;
+}
+
+static bool macb_dma_is_ptp(struct macb *bp)
+{
+	return IS_ENABLED(CONFIG_MACB_USE_HWSTAMP) &&
+	       bp->hw_dma_cap & HW_DMA_CAP_PTP;
+}
+
 /* DMA buffer descriptor might be different size
  * depends on hardware configuration:
  *
@@ -124,56 +136,31 @@ struct sifive_fu540_macb_mgmt {
  */
 static unsigned int macb_dma_desc_get_size(struct macb *bp)
 {
-#ifdef MACB_EXT_DESC
-	unsigned int desc_size;
+	unsigned int desc_size = sizeof(struct macb_dma_desc);
+
+	if (macb_dma_is_64b(bp))
+		desc_size += sizeof(struct macb_dma_desc_64);
+	if (macb_dma_is_ptp(bp))
+		desc_size += sizeof(struct macb_dma_desc_ptp);
 
-	switch (bp->hw_dma_cap) {
-	case HW_DMA_CAP_64B:
-		desc_size = sizeof(struct macb_dma_desc)
-			+ sizeof(struct macb_dma_desc_64);
-		break;
-	case HW_DMA_CAP_PTP:
-		desc_size = sizeof(struct macb_dma_desc)
-			+ sizeof(struct macb_dma_desc_ptp);
-		break;
-	case HW_DMA_CAP_64B_PTP:
-		desc_size = sizeof(struct macb_dma_desc)
-			+ sizeof(struct macb_dma_desc_64)
-			+ sizeof(struct macb_dma_desc_ptp);
-		break;
-	default:
-		desc_size = sizeof(struct macb_dma_desc);
-	}
 	return desc_size;
-#endif
-	return sizeof(struct macb_dma_desc);
 }
 
 static unsigned int macb_adj_dma_desc_idx(struct macb *bp, unsigned int desc_idx)
 {
-#ifdef MACB_EXT_DESC
-	switch (bp->hw_dma_cap) {
-	case HW_DMA_CAP_64B:
-	case HW_DMA_CAP_PTP:
-		desc_idx <<= 1;
-		break;
-	case HW_DMA_CAP_64B_PTP:
-		desc_idx *= 3;
-		break;
-	default:
-		break;
-	}
-#endif
-	return desc_idx;
+	if (macb_dma_is_64b(bp) && macb_dma_is_ptp(bp))
+		return desc_idx * 3;
+	else if (macb_dma_is_64b(bp) || macb_dma_is_ptp(bp))
+		return desc_idx << 1;
+	else
+		return desc_idx;
 }
 
-#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
 static struct macb_dma_desc_64 *macb_64b_desc(struct macb *bp, struct macb_dma_desc *desc)
 {
 	return (struct macb_dma_desc_64 *)((void *)desc
 		+ sizeof(struct macb_dma_desc));
 }
-#endif
 
 /* Ring buffer accessors */
 static unsigned int macb_tx_ring_wrap(struct macb *bp, unsigned int index)
@@ -497,17 +484,13 @@ static void macb_init_buffers(struct macb *bp)
 
 	for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue) {
 		queue_writel(queue, RBQP, lower_32_bits(queue->rx_ring_dma));
-#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
-		if (bp->hw_dma_cap & HW_DMA_CAP_64B)
+		if (macb_dma_is_64b(bp))
 			queue_writel(queue, RBQPH,
 				     upper_32_bits(queue->rx_ring_dma));
-#endif
 		queue_writel(queue, TBQP, lower_32_bits(queue->tx_ring_dma));
-#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
-		if (bp->hw_dma_cap & HW_DMA_CAP_64B)
+		if (macb_dma_is_64b(bp))
 			queue_writel(queue, TBQPH,
 				     upper_32_bits(queue->tx_ring_dma));
-#endif
 	}
 }
 
@@ -1028,10 +1011,9 @@ static void macb_tx_unmap(struct macb *bp, struct macb_tx_skb *tx_skb, int budge
 
 static void macb_set_addr(struct macb *bp, struct macb_dma_desc *desc, dma_addr_t addr)
 {
-#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
-	struct macb_dma_desc_64 *desc_64;
+	if (macb_dma_is_64b(bp)) {
+		struct macb_dma_desc_64 *desc_64;
 
-	if (bp->hw_dma_cap & HW_DMA_CAP_64B) {
 		desc_64 = macb_64b_desc(bp, desc);
 		desc_64->addrh = upper_32_bits(addr);
 		/* The low bits of RX address contain the RX_USED bit, clearing
@@ -1040,26 +1022,23 @@ static void macb_set_addr(struct macb *bp, struct macb_dma_desc *desc, dma_addr_
 		 */
 		dma_wmb();
 	}
-#endif
+
 	desc->addr = lower_32_bits(addr);
 }
 
 static dma_addr_t macb_get_addr(struct macb *bp, struct macb_dma_desc *desc)
 {
 	dma_addr_t addr = 0;
-#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
-	struct macb_dma_desc_64 *desc_64;
 
-	if (bp->hw_dma_cap & HW_DMA_CAP_64B) {
+	if (macb_dma_is_64b(bp)) {
+		struct macb_dma_desc_64 *desc_64;
+
 		desc_64 = macb_64b_desc(bp, desc);
 		addr = ((u64)(desc_64->addrh) << 32);
 	}
-#endif
 	addr |= MACB_BF(RX_WADDR, MACB_BFEXT(RX_WADDR, desc->addr));
-#ifdef CONFIG_MACB_USE_HWSTAMP
-	if (bp->hw_dma_cap & HW_DMA_CAP_PTP)
+	if (macb_dma_is_ptp(bp))
 		addr &= ~GEM_BIT(DMA_RXVALID);
-#endif
 	return addr;
 }
 
@@ -1166,10 +1145,8 @@ static void macb_tx_error_task(struct work_struct *work)
 
 	/* Reinitialize the TX desc queue */
 	queue_writel(queue, TBQP, lower_32_bits(queue->tx_ring_dma));
-#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
-	if (bp->hw_dma_cap & HW_DMA_CAP_64B)
+	if (macb_dma_is_64b(bp))
 		queue_writel(queue, TBQPH, upper_32_bits(queue->tx_ring_dma));
-#endif
 	/* Make TX ring reflect state of hardware */
 	queue->tx_head = 0;
 	queue->tx_tail = 0;
@@ -2321,11 +2298,9 @@ static netdev_tx_t macb_start_xmit(struct sk_buff *skb, struct net_device *dev)
 		return ret;
 	}
 
-#ifdef CONFIG_MACB_USE_HWSTAMP
-	if ((skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP) &&
-	    (bp->hw_dma_cap & HW_DMA_CAP_PTP))
+	if (macb_dma_is_ptp(bp) &&
+	    (skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP))
 		skb_shinfo(skb)->tx_flags |= SKBTX_IN_PROGRESS;
-#endif
 
 	is_lso = (skb_shinfo(skb)->gso_size != 0);
 
@@ -2785,14 +2760,10 @@ static void macb_configure_dma(struct macb *bp)
 			dmacfg &= ~GEM_BIT(TXCOEN);
 
 		dmacfg &= ~GEM_BIT(ADDR64);
-#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
-		if (bp->hw_dma_cap & HW_DMA_CAP_64B)
+		if (macb_dma_is_64b(bp))
 			dmacfg |= GEM_BIT(ADDR64);
-#endif
-#ifdef CONFIG_MACB_USE_HWSTAMP
-		if (bp->hw_dma_cap & HW_DMA_CAP_PTP)
+		if (macb_dma_is_ptp(bp))
 			dmacfg |= GEM_BIT(RXEXT) | GEM_BIT(TXEXT);
-#endif
 		netdev_dbg(bp->dev, "Cadence configure DMA with 0x%08x\n",
 			   dmacfg);
 		gem_writel(bp, DMACFG, dmacfg);
@@ -4298,12 +4269,10 @@ static int macb_init(struct platform_device *pdev)
 			queue->TBQP = GEM_TBQP(hw_q - 1);
 			queue->RBQP = GEM_RBQP(hw_q - 1);
 			queue->RBQS = GEM_RBQS(hw_q - 1);
-#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
-			if (bp->hw_dma_cap & HW_DMA_CAP_64B) {
+			if (macb_dma_is_64b(bp)) {
 				queue->TBQPH = GEM_TBQPH(hw_q - 1);
 				queue->RBQPH = GEM_RBQPH(hw_q - 1);
 			}
-#endif
 		} else {
 			/* queue0 uses legacy registers */
 			queue->ISR  = MACB_ISR;
@@ -4312,12 +4281,10 @@ static int macb_init(struct platform_device *pdev)
 			queue->IMR  = MACB_IMR;
 			queue->TBQP = MACB_TBQP;
 			queue->RBQP = MACB_RBQP;
-#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
-			if (bp->hw_dma_cap & HW_DMA_CAP_64B) {
+			if (macb_dma_is_64b(bp)) {
 				queue->TBQPH = MACB_TBQPH;
 				queue->RBQPH = MACB_RBQPH;
 			}
-#endif
 		}
 
 		/* get irq: here we use the linux queue index, not the hardware

-- 
2.50.0


