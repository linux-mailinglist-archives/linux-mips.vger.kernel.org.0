Return-Path: <linux-mips+bounces-8275-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1973A6C321
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 20:15:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF3CE189BD2D
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 19:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6236E234969;
	Fri, 21 Mar 2025 19:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LbCk/wxO"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8962231A32;
	Fri, 21 Mar 2025 19:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742584451; cv=none; b=lA2+KaUD9qt4BosBHSMjeN5oO6JSnnFERdFt1GaWmExH7FoKkkolxdjIow8LHJfqdszHsOga6bKOZNQVvvJoN7H6cqW6f8YTfxlzpYfiZ8XZdv9qskfBoZF8t0Y0chUFxB127VscUHGer3N+u/ArRYvOkTkoJ2mXV3F+zZDe2V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742584451; c=relaxed/simple;
	bh=h17c156Isf+2vFXQftwmNHCYXvjATwwvuh96GqtzytM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mHIhxlWMcoOCQimKF5osFZlSty7Rikda5h62CkGTWvTFyrnmvRYpT3e2U35Qq6AcBtYlWsPTDp2CKtCSmI8ztsKkQ7fC3wTmNFmGkJ0N7NhoyTdAzJWOAyIB9JSohQGkb9r5VeHs2dk2xy3LfogFhPI/zU/u50ub/UJwgnrjZNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LbCk/wxO; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6E6E444559;
	Fri, 21 Mar 2025 19:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742584447;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xOdKX6boAEAH9arMzCvFQuOb94FnbdUL3B+JMds4yyA=;
	b=LbCk/wxO4ma+T4UTtCM4T6xDwpBCHadJD0SEHPCDbmJ4JndK5uoBcTOz2ws2lmX4eUPfmu
	BxYoTA5baNVbDgKUTz6ZckBiL1sD9vlMilEVdzwqbRBWKxPFXb1UdkyzSU8D7aSR2qnFfY
	b6BK6/c5OLJEwTMhKR0E5c0otmCSpEiww9KN0twICsPkuRuRT+ozI3laRrR6XppIgglqnk
	xhm1zQNacVOVqG3t9e1SiofzdsejNsLEKpCHnPblOwzr8xT+i09LDiZfEBWVmrnYUGv0pn
	th33vVZaPMZEmnoyXH73ffLWLImLN0KJ3Z64GMk1GbxwtMUb6nBQC+cv8uhELg==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Fri, 21 Mar 2025 20:09:38 +0100
Subject: [PATCH net-next 07/13] net: macb: move HW IP alignment value to
 macb_config
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250321-macb-v1-7-537b7e37971d@bootlin.com>
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

The controller does IP alignment (two bytes). However, we match that on
the software side with:

	skb_reserve(skb, NET_IP_ALIGN);

The NET_IP_ALIGN value is arch-dependent and picked based on unaligned
CPU access performance. The hardware alignment value should be
compatible-specific rather than arch-specific. Offer a path forward by
adding a hw_ip_align field inside macb_config.

Values for macb_config->hw_ip_align are picked based on upstream
devicetrees:

    Compatible             |  DTS folders              |  hw_ip_align
   ------------------------|---------------------------|----------------
   cdns,at91sam9260-macb   | arch/arm/                 | 2
   cdns,macb               | arch/{arm,riscv}/         | NET_IP_ALIGN
   cdns,np4-macb           | NULL                      | NET_IP_ALIGN
   cdns,pc302-gem          | NULL                      | NET_IP_ALIGN
   cdns,gem                | arch/{arm,arm64}/         | NET_IP_ALIGN
   cdns,sam9x60-macb       | arch/arm/                 | 2
   atmel,sama5d2-gem       | arch/arm/                 | 2
   atmel,sama5d29-gem      | arch/arm/                 | 2
   atmel,sama5d3-gem       | arch/arm/                 | 2
   atmel,sama5d3-macb      | arch/arm/                 | 2
   atmel,sama5d4-gem       | arch/arm/                 | 2
   cdns,at91rm9200-emac    | arch/arm/                 | 2
   cdns,emac               | arch/arm/                 | 2
   cdns,zynqmp-gem         | *same as xlnx,zynqmp-gem* | 0
   cdns,zynq-gem           | *same as xlnx,zynq-gem*   | 2
   sifive,fu540-c000-gem   | arch/riscv/               | 2
   microchip,mpfs-macb     | arch/riscv/               | 2
   microchip,sama7g5-gem   | arch/arm/                 | 2
   microchip,sama7g5-emac  | arch/arm/                 | 2
   xlnx,zynqmp-gem         | arch/arm64/               | 0
   xlnx,zynq-gem           | arch/arm/                 | 2
   xlnx,versal-gem         | NULL                      | NET_IP_ALIGN

Considerations:
 - cdns,macb has no match data config.
 - cdns,np4-macb, cdns,pc302-gem and xlnx,versal-gem have no upstream
   devicetrees using them.
 - cdns,gem is used on both arm and arm64 platforms. Those do not have
   the same NET_IP_ALIGN value. Also, it uses the same config as
   cdns,pc302-gem.
 - The default config (default_gem_config) behavior isn't changed:
   it uses hw_ip_align == NET_IP_ALIGN.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/net/ethernet/cadence/macb.h      |  2 ++
 drivers/net/ethernet/cadence/macb_main.c | 40 ++++++++++++++++++++++++++++++--
 2 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb.h b/drivers/net/ethernet/cadence/macb.h
index e9da6e3b869fc772613a0d6b86308917c9bff7fe..5bf7e7ff70490cdb068bfdbe7cfd5bb8e1db7f86 100644
--- a/drivers/net/ethernet/cadence/macb.h
+++ b/drivers/net/ethernet/cadence/macb.h
@@ -1191,6 +1191,7 @@ struct macb_usrio_config {
 
 struct macb_config {
 	u32			caps;
+	int			hw_ip_align;
 	unsigned int		dma_burst_length;
 	int	(*clk_init)(struct platform_device *pdev, struct clk **pclk,
 			    struct clk **hclk, struct clk **tx_clk,
@@ -1295,6 +1296,7 @@ struct macb {
 
 	u32			caps;
 	unsigned int		dma_burst_length;
+	int			hw_ip_align;
 
 	phy_interface_t		phy_interface;
 
diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index b206966178e3d49a084c754191f77205ff6dd466..b32363ba1ec3be0fc42866c8585f0b465d178220 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -1352,8 +1352,26 @@ static void gem_rx_refill(struct macb_queue *queue)
 			dma_wmb();
 			macb_set_addr(bp, desc, paddr);
 
-			/* properly align Ethernet header */
-			skb_reserve(skb, NET_IP_ALIGN);
+			/* Properly align Ethernet header.
+			 *
+			 * Here be (small-ish) dragons. 3 features intertwine:
+			 * (1) Hardware adds two dummy bytes. Notice how
+			 *     skb_reserve() is done AFTER dma_map_single().
+			 * (2) The NET_IP_ALIGN value is arch dependent.
+			 * (3) The low 2/3 bits cannot be picked.
+			 *     3 bits if HW_DMA_CAP_PTP.
+			 *
+			 * Notice how (1) and (2) are unrelated (IP-specific
+			 * versus arch-specific) but must agree for a working
+			 * system.
+			 *
+			 * (3) implies we cannot align the IP header (ie respect
+			 * NET_IP_ALIGN) if HW does not add two bytes.
+			 *
+			 * FIXME: migrate away from hw_ip_align == NET_IP_ALIGN
+			 * for all compatibles.
+			 */
+			skb_reserve(skb, bp->hw_ip_align);
 		} else {
 			desc->ctrl = 0;
 			dma_wmb();
@@ -4994,6 +5012,7 @@ static const struct macb_usrio_config sama7g5_usrio = {
 static const struct macb_config fu540_c000_config = {
 	.caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE | MACB_CAPS_JUMBO |
 		MACB_CAPS_GEM_HAS_PTP,
+	.hw_ip_align = 2,
 	.dma_burst_length = 16,
 	.clk_init = fu540_c000_clk_init,
 	.init = fu540_c000_init,
@@ -5003,6 +5022,7 @@ static const struct macb_config fu540_c000_config = {
 
 static const struct macb_config at91sam9260_config = {
 	.caps = MACB_CAPS_USRIO_HAS_CLKEN | MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII,
+	.hw_ip_align = 2,
 	.clk_init = macb_clk_init,
 	.init = macb_init,
 	.usrio = &macb_default_usrio,
@@ -5011,6 +5031,7 @@ static const struct macb_config at91sam9260_config = {
 static const struct macb_config sama5d3macb_config = {
 	.caps = MACB_CAPS_SG_DISABLED |
 		MACB_CAPS_USRIO_HAS_CLKEN | MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII,
+	.hw_ip_align = 2,
 	.clk_init = macb_clk_init,
 	.init = macb_init,
 	.usrio = &macb_default_usrio,
@@ -5018,6 +5039,7 @@ static const struct macb_config sama5d3macb_config = {
 
 static const struct macb_config pc302gem_config = {
 	.caps = MACB_CAPS_SG_DISABLED | MACB_CAPS_GIGABIT_MODE_AVAILABLE,
+	.hw_ip_align = NET_IP_ALIGN,
 	.dma_burst_length = 16,
 	.clk_init = macb_clk_init,
 	.init = macb_init,
@@ -5026,6 +5048,7 @@ static const struct macb_config pc302gem_config = {
 
 static const struct macb_config sama5d2_config = {
 	.caps = MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII | MACB_CAPS_JUMBO,
+	.hw_ip_align = 2,
 	.dma_burst_length = 16,
 	.clk_init = macb_clk_init,
 	.init = macb_init,
@@ -5035,6 +5058,7 @@ static const struct macb_config sama5d2_config = {
 
 static const struct macb_config sama5d29_config = {
 	.caps = MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII | MACB_CAPS_GEM_HAS_PTP,
+	.hw_ip_align = 2,
 	.dma_burst_length = 16,
 	.clk_init = macb_clk_init,
 	.init = macb_init,
@@ -5044,6 +5068,7 @@ static const struct macb_config sama5d29_config = {
 static const struct macb_config sama5d3_config = {
 	.caps = MACB_CAPS_SG_DISABLED | MACB_CAPS_GIGABIT_MODE_AVAILABLE |
 		MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII | MACB_CAPS_JUMBO,
+	.hw_ip_align = 2,
 	.dma_burst_length = 16,
 	.clk_init = macb_clk_init,
 	.init = macb_init,
@@ -5053,6 +5078,7 @@ static const struct macb_config sama5d3_config = {
 
 static const struct macb_config sama5d4_config = {
 	.caps = MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII,
+	.hw_ip_align = 2,
 	.dma_burst_length = 4,
 	.clk_init = macb_clk_init,
 	.init = macb_init,
@@ -5061,6 +5087,7 @@ static const struct macb_config sama5d4_config = {
 
 static const struct macb_config emac_config = {
 	.caps = MACB_CAPS_NEEDS_RSTONUBR | MACB_CAPS_MACB_IS_EMAC,
+	.hw_ip_align = 2,
 	.clk_init = at91ether_clk_init,
 	.init = at91ether_init,
 	.usrio = &macb_default_usrio,
@@ -5068,6 +5095,7 @@ static const struct macb_config emac_config = {
 
 static const struct macb_config np4_config = {
 	.caps = MACB_CAPS_USRIO_DISABLED,
+	.hw_ip_align = NET_IP_ALIGN,
 	.clk_init = macb_clk_init,
 	.init = macb_init,
 	.usrio = &macb_default_usrio,
@@ -5077,6 +5105,7 @@ static const struct macb_config zynqmp_config = {
 	.caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE |
 		MACB_CAPS_JUMBO |
 		MACB_CAPS_GEM_HAS_PTP | MACB_CAPS_BD_RD_PREFETCH,
+	.hw_ip_align = 0,
 	.dma_burst_length = 16,
 	.clk_init = macb_clk_init,
 	.init = init_reset_optional,
@@ -5087,6 +5116,7 @@ static const struct macb_config zynqmp_config = {
 static const struct macb_config zynq_config = {
 	.caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE | MACB_CAPS_NO_GIGABIT_HALF |
 		MACB_CAPS_NEEDS_RSTONUBR,
+	.hw_ip_align = 2,
 	.dma_burst_length = 16,
 	.clk_init = macb_clk_init,
 	.init = macb_init,
@@ -5097,6 +5127,7 @@ static const struct macb_config mpfs_config = {
 	.caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE |
 		MACB_CAPS_JUMBO |
 		MACB_CAPS_GEM_HAS_PTP,
+	.hw_ip_align = 2,
 	.dma_burst_length = 16,
 	.clk_init = macb_clk_init,
 	.init = init_reset_optional,
@@ -5108,6 +5139,7 @@ static const struct macb_config mpfs_config = {
 static const struct macb_config sama7g5_gem_config = {
 	.caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE | MACB_CAPS_CLK_HW_CHG |
 		MACB_CAPS_MIIONRGMII | MACB_CAPS_GEM_HAS_PTP,
+	.hw_ip_align = 2,
 	.dma_burst_length = 16,
 	.clk_init = macb_clk_init,
 	.init = macb_init,
@@ -5118,6 +5150,7 @@ static const struct macb_config sama7g5_emac_config = {
 	.caps = MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII |
 		MACB_CAPS_USRIO_HAS_CLKEN | MACB_CAPS_MIIONRGMII |
 		MACB_CAPS_GEM_HAS_PTP,
+	.hw_ip_align = 2,
 	.dma_burst_length = 16,
 	.clk_init = macb_clk_init,
 	.init = macb_init,
@@ -5128,6 +5161,7 @@ static const struct macb_config versal_config = {
 	.caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE | MACB_CAPS_JUMBO |
 		MACB_CAPS_GEM_HAS_PTP | MACB_CAPS_BD_RD_PREFETCH | MACB_CAPS_NEED_TSUCLK |
 		MACB_CAPS_QUEUE_DISABLE,
+	.hw_ip_align = NET_IP_ALIGN,
 	.dma_burst_length = 16,
 	.clk_init = macb_clk_init,
 	.init = init_reset_optional,
@@ -5167,6 +5201,7 @@ static const struct macb_config default_gem_config = {
 	.caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE |
 		MACB_CAPS_JUMBO |
 		MACB_CAPS_GEM_HAS_PTP,
+	.hw_ip_align = NET_IP_ALIGN,
 	.dma_burst_length = 16,
 	.clk_init = macb_clk_init,
 	.init = macb_init,
@@ -5244,6 +5279,7 @@ static int macb_probe(struct platform_device *pdev)
 	bp->tx_clk = tx_clk;
 	bp->rx_clk = rx_clk;
 	bp->tsu_clk = tsu_clk;
+	bp->hw_ip_align = macb_config->hw_ip_align;
 	bp->jumbo_max_len = macb_config->jumbo_max_len;
 
 	if (!hw_is_gem(bp->regs, bp->native_io))

-- 
2.48.1


