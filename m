Return-Path: <linux-mips+bounces-8270-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B58FAA6C315
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 20:15:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 434493BE8A5
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 19:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0B28230BC1;
	Fri, 21 Mar 2025 19:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WsPdoAHB"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A17A22DF84;
	Fri, 21 Mar 2025 19:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742584447; cv=none; b=SBilnm57VG2oMVQ12Pf4DOYQQ2dRkToJ37LDrgPSPgcF5E64aHDB3eOKvbHzZ63I6HCwo9vImgdXlvlLBuq6j8LFjtsnKXYYJfyWz03Tojg56GQHm3Gc1lOZ0mEXQnBkWgNeUb/gK5fl4eT+aGAQgC6qxNkXcoKUL39zYGUveuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742584447; c=relaxed/simple;
	bh=koQpyf7jRL4k57uMr51F3kKrIfstJz2l0lc6gDN1pqM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C363kMIB6xa/X+Im3nHOSmLYa71qU+qK1uiXXOK2sb640uuq/JLUCze1ycK/HxxnOEjAjuWGtIeVL71sfTub8NhqfkSfMxqHzAmE22nqzppVRgBpHzr7xBOlP20jwwPim5+5AD3xk97KlhIDe6uoJi52E3a7zK7FH6AVgv47sp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WsPdoAHB; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4B84A44558;
	Fri, 21 Mar 2025 19:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742584443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J3cXgGc4bn0Gbvqr0NtDmMZgufHdfFhvshdl+bFHAKw=;
	b=WsPdoAHBBA4KnQD1BRUJF7V/Ssx0s2JVoZoFjRsTpnAdDSQgCw7J0lMugTITl/Wekvn11Z
	JIiB6GX+Xi1Nr68Gbr7VvnyU2XEb8/esxhvxIzvFVAzB8V6ugJCRJmwXLoOtnbo8OhWT2k
	D+A5lZs8Aeuf4TbWFZciYedp/vomad66JpXXnAp/AwVTO28o0BdCZ719fm6nl0PQvXw364
	PlKJkHS3nCQUsn2iCfEGNN8IkIM5aTF4bzIn8vibU58XqJPlxpv/xlBcIuBSWylEfgkFB6
	uBMTrPKKzIYSZB/RHyGzJH5sNy7+Fj08vMkXRgc+cSm84hMjaL2yoObGfj1bQg==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Fri, 21 Mar 2025 20:09:36 +0100
Subject: [PATCH net-next 05/13] net: macb: add no LSO capability
 (MACB_CAPS_NO_LSO)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250321-macb-v1-5-537b7e37971d@bootlin.com>
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

LSO is runtime-detected using the PBUF_LSO field inside register
designcfg_debug6/GEM_DCFG6. Allow disabling that feature if it is
broken by using struct macb_config->caps.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/net/ethernet/cadence/macb.h      | 1 +
 drivers/net/ethernet/cadence/macb_main.c | 5 +++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb.h b/drivers/net/ethernet/cadence/macb.h
index 3b43cb9468e3618754ff2bc6c5f360447bdeeed0..e9da6e3b869fc772613a0d6b86308917c9bff7fe 100644
--- a/drivers/net/ethernet/cadence/macb.h
+++ b/drivers/net/ethernet/cadence/macb.h
@@ -739,6 +739,7 @@
 #define MACB_CAPS_MIIONRGMII			BIT(9)
 #define MACB_CAPS_NEED_TSUCLK			BIT(10)
 #define MACB_CAPS_QUEUE_DISABLE			BIT(11)
+#define MACB_CAPS_NO_LSO			BIT(12)
 #define MACB_CAPS_PCS				BIT(24)
 #define MACB_CAPS_HIGH_SPEED			BIT(25)
 #define MACB_CAPS_CLK_HW_CHG			BIT(26)
diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index b5797c1ac0a41e9472883b013c1e44a01092f257..807f7abbd9941bf624f14a5ddead68dad1c8deb2 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -4373,8 +4373,9 @@ static int macb_init(struct platform_device *pdev)
 	/* Set features */
 	dev->hw_features = NETIF_F_SG;
 
-	/* Check LSO capability */
-	if (GEM_BFEXT(PBUF_LSO, gem_readl(bp, DCFG6)))
+	/* Check LSO capability; capability is for buggy HW */
+	if (!(bp->caps & MACB_CAPS_NO_LSO) &&
+	    GEM_BFEXT(PBUF_LSO, gem_readl(bp, DCFG6)))
 		dev->hw_features |= MACB_NETIF_LSO;
 
 	/* Checksum offload is only available on gem with packet buffer */

-- 
2.48.1


