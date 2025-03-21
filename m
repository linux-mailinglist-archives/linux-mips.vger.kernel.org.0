Return-Path: <linux-mips+bounces-8273-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 152F6A6C328
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 20:16:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53E05485DAB
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 19:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 565392327A7;
	Fri, 21 Mar 2025 19:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="AXkW8KAh"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDD422FF58;
	Fri, 21 Mar 2025 19:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742584449; cv=none; b=p2ohZoqsyeAG/voZTJ7TwRKtp9uVydn2z0cMaYw9Dxp4FDRYzJQm6ALM+AogqwxYP5/KfC9BVuDPDwV5po2EqkCFry4lkXFRRttOUwK2xVAnob/HTRKHoZHNGEiQqvHrpbFOBnXhQVENDJdpnkIMTmoRJ9ETNxVl+6bW+OqBf3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742584449; c=relaxed/simple;
	bh=Ej3YRAxHIHZMXoGrWNyQ1Bsr8WaUTjT0ZXf1W35OfC4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A6njdwgyozInAuZ1VRYnsEmxlZj46wZ3BfykAD1de8uQxjcnGtBcfX4BjqJURWoC28lKdayrfFUn7NLXWqdvLq5xIm3fVYFmnXm0V4cp5ojs2F3ynJvVwLqRES+nSdTp4ilawX0Kiw7MoTr8j4t0w2pKLSzzJ16Ud6pBG6nGab8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=AXkW8KAh; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D230944555;
	Fri, 21 Mar 2025 19:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742584445;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2bKDOW9BooVCSfDA1lWucvGSqOaPkqITYm2kwpCGtTo=;
	b=AXkW8KAh4StYRvomeZA29gu6cPVEPX2IMOetb/EoAtDdprsz2jvzfXu7aHkLHTEB8IWReD
	Dpe/CV7iFBz21/z+3/aZJ5vjC68Nemlv053zT4jYZ5BBwkDSAKBjMrq+M2AIX3gtOrHY/t
	/eYTVWox0baVqNw3eik8W7BZ/1qAJTfBc3/GfJjYTMH8exdgnbCvU9AWHcc6IvTAU28XTl
	/xQ0nTlVbY0Okm1tePXSNMf/SN2Dot8SYT5h9Vwv1wneN61j1k5KTtK9W/uMMmjSz1dSnu
	ya+ZgACyQxcrBr13WeYzfS7E/EEWZxUrmvynNc4lK7bb5TFmg58O5cEo+8O1Xw==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Fri, 21 Mar 2025 20:09:37 +0100
Subject: [PATCH net-next 06/13] net: macb: simplify macb_probe() code
 touching match data
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250321-macb-v1-6-537b7e37971d@bootlin.com>
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

Remove local variables clk_init and init. Those function pointers are
always equivalent to macb_config->clk_init and macb_config->init.

Also remove NULL checks on macb_config as it is always valid:
 - either it is its default value &default_gem_config,
 - or it got overridden using match data.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/net/ethernet/cadence/macb_main.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 807f7abbd9941bf624f14a5ddead68dad1c8deb2..b206966178e3d49a084c754191f77205ff6dd466 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -5177,10 +5177,6 @@ static const struct macb_config default_gem_config = {
 static int macb_probe(struct platform_device *pdev)
 {
 	const struct macb_config *macb_config = &default_gem_config;
-	int (*clk_init)(struct platform_device *, struct clk **,
-			struct clk **, struct clk **,  struct clk **,
-			struct clk **) = macb_config->clk_init;
-	int (*init)(struct platform_device *) = macb_config->init;
 	struct device_node *np = pdev->dev.of_node;
 	struct clk *pclk, *hclk = NULL, *tx_clk = NULL, *rx_clk = NULL;
 	struct clk *tsu_clk = NULL;
@@ -5202,14 +5198,11 @@ static int macb_probe(struct platform_device *pdev)
 		const struct of_device_id *match;
 
 		match = of_match_node(macb_dt_ids, np);
-		if (match && match->data) {
+		if (match && match->data)
 			macb_config = match->data;
-			clk_init = macb_config->clk_init;
-			init = macb_config->init;
-		}
 	}
 
-	err = clk_init(pdev, &pclk, &hclk, &tx_clk, &rx_clk, &tsu_clk);
+	err = macb_config->clk_init(pdev, &pclk, &hclk, &tx_clk, &rx_clk, &tsu_clk);
 	if (err)
 		return err;
 
@@ -5245,15 +5238,13 @@ static int macb_probe(struct platform_device *pdev)
 	}
 	bp->num_queues = num_queues;
 	bp->queue_mask = queue_mask;
-	if (macb_config)
-		bp->dma_burst_length = macb_config->dma_burst_length;
+	bp->dma_burst_length = macb_config->dma_burst_length;
 	bp->pclk = pclk;
 	bp->hclk = hclk;
 	bp->tx_clk = tx_clk;
 	bp->rx_clk = rx_clk;
 	bp->tsu_clk = tsu_clk;
-	if (macb_config)
-		bp->jumbo_max_len = macb_config->jumbo_max_len;
+	bp->jumbo_max_len = macb_config->jumbo_max_len;
 
 	if (!hw_is_gem(bp->regs, bp->native_io))
 		bp->max_tx_length = MACB_MAX_TX_LEN;
@@ -5343,7 +5334,7 @@ static int macb_probe(struct platform_device *pdev)
 		bp->phy_interface = interface;
 
 	/* IP specific init */
-	err = init(pdev);
+	err = macb_config->init(pdev);
 	if (err)
 		goto err_out_free_netdev;
 

-- 
2.48.1


