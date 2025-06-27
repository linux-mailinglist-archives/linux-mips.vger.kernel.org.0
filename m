Return-Path: <linux-mips+bounces-9522-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A84AEB241
	for <lists+linux-mips@lfdr.de>; Fri, 27 Jun 2025 11:11:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C243318976F9
	for <lists+linux-mips@lfdr.de>; Fri, 27 Jun 2025 09:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23E3629898B;
	Fri, 27 Jun 2025 09:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ISzLOXay"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C056F295DAF;
	Fri, 27 Jun 2025 09:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751015381; cv=none; b=uyweo4DHOkSz9oSQYJ0Wp9OCXHnQv6d3i9K1IKdKTKnmJK10qdo+0qG7Wb/qzh8y0XAYMXaGniRm6xo64LnzIvyW0tB/6QKO/AQ4oVNCLAFBunkxWmDpubX1iHnW0lPq26TC/dxbxFyxJB2YniHGym8tyxE1RHnC4CG9p7Z8uXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751015381; c=relaxed/simple;
	bh=Ec13kVbjAjQXKJG75ZXziwJp6QLLZUletwW3vCsU3Uo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A2VDC64h39gsQiUuVxGajNn9bqWA8BrZTi6Cv4dB9SDZN+ZRVFbfpETGrkR/npP9CmpUhRbg2WiaYVvEWJesQmcOMfje/5Sr6do7MwnKiEpBtgwXrnhwQ5L6Fi10m4vPC54lqcj9gCrBd6i3gYCtGf6fIUsNLj/ZiVT6D4Z9fro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ISzLOXay; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A27CD43901;
	Fri, 27 Jun 2025 09:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751015377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bSZIAPBAEVZwX16OcOuKj6UVS1Wla9sgvVcri/K8yrY=;
	b=ISzLOXayjXB1Hp/aq4kSnlJ20HWMcGSk6dBJfFtMiL5NBvMT8JIL4yJL6pGH60aU72ui3i
	2XOXXKJ+a5ESeAJOT8OOhCR+zkG8bMvyL8jvqBK05YN7k8BVkV5WHrxRjERq6wSC4AzakJ
	MZ1BK10bBbFJwhBIoT0Ylj1rJeua5jHNaFKMaSlJ8/Ttf0/PWvKwMCbEQixopVcoPm/NRB
	Zr2gouUsju1kiUKvIWhtnJS0gkR9VLghsszsYw0vEwbtoF4q5Yvmnxee7uzvU6DUpe5Dfc
	r8XJt//bqs+Xs5nMwfijgsO1VVV4iYbOjXUBu2EVAX+OtvSW5qodXc8qEIQnWg==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Fri, 27 Jun 2025 11:08:51 +0200
Subject: [PATCH net-next v2 05/18] net: macb: use BIT() macro for
 capability definitions
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250627-macb-v2-5-ff8207d0bb77@bootlin.com>
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
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Andrew Lunn <andrew@lunn.ch>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvieeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepvfhhrohoucfnvggsrhhunhcuoehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelvefhkeeufedvkefghefhgfdukeejlefgtdehtdeivddtteetgedvieelieeuhfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgunecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgupdhhvghloheplgduledvrdduieekrddutddrvddugegnpdhmrghilhhfrhhomhepthhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfeefpdhrtghpthhtoheprhhitghhrghruggtohgthhhrrghnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvhhlrgguihhmihhrrdhkohhnughrrghtihgvvhesmhhosghilhgvhigvrdgto
 hhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomh
X-GND-Sasl: theo.lebrun@bootlin.com

Replace all capabilities values by calls to the BIT() macro.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/net/ethernet/cadence/macb.h | 40 ++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb.h b/drivers/net/ethernet/cadence/macb.h
index c9a5c8beb2fa8166195d1d83f187d2d0c62668a8..3b43cb9468e3618754ff2bc6c5f360447bdeeed0 100644
--- a/drivers/net/ethernet/cadence/macb.h
+++ b/drivers/net/ethernet/cadence/macb.h
@@ -727,26 +727,26 @@
 #define MACB_MAN_C45_CODE			2
 
 /* Capability mask bits */
-#define MACB_CAPS_ISR_CLEAR_ON_WRITE		0x00000001
-#define MACB_CAPS_USRIO_HAS_CLKEN		0x00000002
-#define MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII	0x00000004
-#define MACB_CAPS_NO_GIGABIT_HALF		0x00000008
-#define MACB_CAPS_USRIO_DISABLED		0x00000010
-#define MACB_CAPS_JUMBO				0x00000020
-#define MACB_CAPS_GEM_HAS_PTP			0x00000040
-#define MACB_CAPS_BD_RD_PREFETCH		0x00000080
-#define MACB_CAPS_NEEDS_RSTONUBR		0x00000100
-#define MACB_CAPS_MIIONRGMII			0x00000200
-#define MACB_CAPS_NEED_TSUCLK			0x00000400
-#define MACB_CAPS_QUEUE_DISABLE			0x00000800
-#define MACB_CAPS_PCS				0x01000000
-#define MACB_CAPS_HIGH_SPEED			0x02000000
-#define MACB_CAPS_CLK_HW_CHG			0x04000000
-#define MACB_CAPS_MACB_IS_EMAC			0x08000000
-#define MACB_CAPS_FIFO_MODE			0x10000000
-#define MACB_CAPS_GIGABIT_MODE_AVAILABLE	0x20000000
-#define MACB_CAPS_SG_DISABLED			0x40000000
-#define MACB_CAPS_MACB_IS_GEM			0x80000000
+#define MACB_CAPS_ISR_CLEAR_ON_WRITE		BIT(0)
+#define MACB_CAPS_USRIO_HAS_CLKEN		BIT(1)
+#define MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII	BIT(2)
+#define MACB_CAPS_NO_GIGABIT_HALF		BIT(3)
+#define MACB_CAPS_USRIO_DISABLED		BIT(4)
+#define MACB_CAPS_JUMBO				BIT(5)
+#define MACB_CAPS_GEM_HAS_PTP			BIT(6)
+#define MACB_CAPS_BD_RD_PREFETCH		BIT(7)
+#define MACB_CAPS_NEEDS_RSTONUBR		BIT(8)
+#define MACB_CAPS_MIIONRGMII			BIT(9)
+#define MACB_CAPS_NEED_TSUCLK			BIT(10)
+#define MACB_CAPS_QUEUE_DISABLE			BIT(11)
+#define MACB_CAPS_PCS				BIT(24)
+#define MACB_CAPS_HIGH_SPEED			BIT(25)
+#define MACB_CAPS_CLK_HW_CHG			BIT(26)
+#define MACB_CAPS_MACB_IS_EMAC			BIT(27)
+#define MACB_CAPS_FIFO_MODE			BIT(28)
+#define MACB_CAPS_GIGABIT_MODE_AVAILABLE	BIT(29)
+#define MACB_CAPS_SG_DISABLED			BIT(30)
+#define MACB_CAPS_MACB_IS_GEM			BIT(31)
 
 /* LSO settings */
 #define MACB_LSO_UFO_ENABLE			0x01

-- 
2.50.0


