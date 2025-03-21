Return-Path: <linux-mips+bounces-8276-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA066A6C32E
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 20:17:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A5EE3BFDB4
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 19:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99FAB235374;
	Fri, 21 Mar 2025 19:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bLtTDgER"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F415B233712;
	Fri, 21 Mar 2025 19:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742584452; cv=none; b=PpbrDvSFYSqyp15X+k0FWZRGb91HCLfILMUz1FX6gZjKTQ6A2MqZ4GoxkLJERZiUrwF5ZL6wwLW6w0UInIIDR9tcH4L8aTw4Xjxg4D4glTz9Du9hyJHNG9+APZ9v9g9layNAJdXCnmnRXrfgLHZpf0HEJn761nXapmDRbeID7kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742584452; c=relaxed/simple;
	bh=zlq+pt124cxNo7pEWPB16TsLvpQzKZow5zwPWKFqUZI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PE7+ekCbCAR8+6+BsDeo81iizETDZCONf42XqK7fwWscktpsukk4GEnyhlRrFKZNJLU+DEPT4HleNE97f46vqYwCoYiiwS6+EB4vHIWrTEBOh7pztqqvOgek68lQDb6QQb47mAOD/agOdoSMtvGRdmd6XUFmlQQBXQaR2geG/rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bLtTDgER; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 20F254455A;
	Fri, 21 Mar 2025 19:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742584448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QZHLZtOsYa//BR6kSb6CcInPA+hroHJebOp/11hJvrE=;
	b=bLtTDgERwHLjpj9YZi0+M4BDAvJ9v3Xhoy987Ji2UtubP1RszK4xrA7AlG6Yq86t7sbcmb
	bd/797eQ//2zjyHp/45ndOnUPeF4KYcZklMbdujhQpf9YJSf9tBk3QzxGNJUIBa0TCTx3t
	ZptPH3Um/n3/tgO8NOzYRY4c7b4iQRSaZdpkzqOTagl8jBKpG8Xz6dS1ZMU78sJRgj6QyB
	GdtdqM26X2vhpLQ7EGISocjhXVv60q+AO4QbOcMvCOAwELcXIXOzeqTXnOTC9CYeO7VSfy
	X3Lg+xbj65tY0qZHCsd0PunqIDbWLMyESRYKeWo5OUpj2yyKdFmVSr2UVhE3Ng==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Fri, 21 Mar 2025 20:09:39 +0100
Subject: [PATCH net-next 08/13] net: macb: introduce DMA descriptor helpers
 (is 64bit? is PTP?)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250321-macb-v1-8-537b7e37971d@bootlin.com>
References: <20250321-macb-v1-0-537b7e37971d@bootlin.com>
In-Reply-To: <20250321-macb-v1-0-537b7e37971d@bootlin.com>
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
 Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-mips@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheduledtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepvfhhrohoucfnvggsrhhunhcuoehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelvefhkeeufedvkefghefhgfdukeejlefgtdehtdeivddtteetgedvieelieeuhfenucfkphepjeejrddufeehrdekuddrieehnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehinhgvthepjeejrddufeehrdekuddrieehpdhhvghloheplgduledvrdduieekrddurdeftdgnpdhmrghilhhfrhhomhepthhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdekpdhrtghpthhtohepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthhopehkuhgsrgesk
 hgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhitgholhgrshdrfhgvrhhrvgesmhhitghrohgthhhiphdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
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
 drivers/net/ethernet/cadence/macb_main.c | 110 +++++++++++--------------------
 2 files changed, 38 insertions(+), 80 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb.h b/drivers/net/ethernet/cadence/macb.h
index 5bf7e7ff70490cdb068bfdbe7cfd5bb8e1db7f86..26e0af44a45926c782cf0f72184332ab3605a178 100644
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
@@ -824,7 +820,6 @@ struct macb_dma_desc {
 	u32	ctrl;
 };
 
-#ifdef MACB_EXT_DESC
 #define HW_DMA_CAP_32B		0
 #define HW_DMA_CAP_64B		(1 << 0)
 #define HW_DMA_CAP_PTP		(1 << 1)
@@ -839,7 +834,6 @@ struct macb_dma_desc_ptp {
 	u32	ts_1;
 	u32	ts_2;
 };
-#endif
 
 /* DMA descriptor bitfields */
 #define MACB_RX_USED_OFFSET			0
@@ -1319,9 +1313,7 @@ struct macb {
 
 	struct phy		*sgmii_phy;	/* for ZynqMP SGMII mode */
 
-#ifdef MACB_EXT_DESC
 	uint8_t hw_dma_cap;
-#endif
 	spinlock_t tsu_clk_lock; /* gem tsu clock locking */
 	unsigned int tsu_rate;
 	struct ptp_clock *ptp_clock;
diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index b32363ba1ec3be0fc42866c8585f0b465d178220..ad154cfe29106f642b32922fd4a03ca63112f4a7 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -98,6 +98,18 @@ struct sifive_fu540_macb_mgmt {
 
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
@@ -127,56 +139,31 @@ struct sifive_fu540_macb_mgmt {
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
@@ -500,17 +487,13 @@ static void macb_init_buffers(struct macb *bp)
 
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
 
@@ -1038,10 +1021,9 @@ static void macb_tx_unmap(struct macb *bp, struct macb_tx_skb *tx_skb, int budge
 
 static void macb_set_addr(struct macb *bp, struct macb_dma_desc *desc, dma_addr_t addr)
 {
-#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
 	struct macb_dma_desc_64 *desc_64;
 
-	if (bp->hw_dma_cap & HW_DMA_CAP_64B) {
+	if (macb_dma_is_64b(bp)) {
 		desc_64 = macb_64b_desc(bp, desc);
 		desc_64->addrh = upper_32_bits(addr);
 		/* The low bits of RX address contain the RX_USED bit, clearing
@@ -1050,26 +1032,22 @@ static void macb_set_addr(struct macb *bp, struct macb_dma_desc *desc, dma_addr_
 		 */
 		dma_wmb();
 	}
-#endif
+
 	desc->addr = lower_32_bits(addr);
 }
 
 static dma_addr_t macb_get_addr(struct macb *bp, struct macb_dma_desc *desc)
 {
-	dma_addr_t addr = 0;
-#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
 	struct macb_dma_desc_64 *desc_64;
+	dma_addr_t addr = 0;
 
-	if (bp->hw_dma_cap & HW_DMA_CAP_64B) {
+	if (macb_dma_is_64b(bp)) {
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
 
@@ -1176,10 +1154,8 @@ static void macb_tx_error_task(struct work_struct *work)
 
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
@@ -2349,11 +2325,9 @@ static netdev_tx_t macb_start_xmit(struct sk_buff *skb, struct net_device *dev)
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
 
@@ -2813,14 +2787,10 @@ static void macb_configure_dma(struct macb *bp)
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
@@ -4326,12 +4296,10 @@ static int macb_init(struct platform_device *pdev)
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
@@ -4340,12 +4308,10 @@ static int macb_init(struct platform_device *pdev)
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
2.48.1


