Return-Path: <linux-mips+bounces-11824-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A944BF7B0C
	for <lists+linux-mips@lfdr.de>; Tue, 21 Oct 2025 18:35:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C8BA19A035F
	for <lists+linux-mips@lfdr.de>; Tue, 21 Oct 2025 16:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BECA369980;
	Tue, 21 Oct 2025 16:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="I0mLE1gh"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B5A3570CA;
	Tue, 21 Oct 2025 16:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761064405; cv=none; b=YySGzBfUEk6RYQBXcVMCe8giVwvi5nWki3yo+NkUxWkELpgTp+pXlCq4ssP8f0gL3djRrVYlLq1qQGN74ECnT/YL/8IjVH9EBKY+E+3krUDVtP6iXQIspTLl83X8Ay9ZUdYZaipx/aYlEdFPz+OUrpCA/evueuJld8UC2pgoR7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761064405; c=relaxed/simple;
	bh=OVeojU0e6cZ4AISHl+17rLRwZGofP8ADuuiMAkxEK20=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rxYsP3/NbpJXwtdsRLjLuIQkMHBtZBXN6gnlT6bC7Cr2GbC9mx4yuHlr0G7mfdk41Q02Hq06VIVUp5q8RxKx2cV/XNteYQrWVbzySswMvvYfLewgjp5A4sIFngTb+BF386XETDKq3mIYXzqbzPoD6YPNUbURAECxEHqQVvzCyFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=I0mLE1gh; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 06C70C0B898;
	Tue, 21 Oct 2025 16:33:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 95BB260680;
	Tue, 21 Oct 2025 16:33:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8D379102F241D;
	Tue, 21 Oct 2025 18:33:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761064400; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=m5DMRTEOrzsIfvkRyqHc14yMBWIw4RysCufBCFCgiU0=;
	b=I0mLE1ghy/2tGEahiXxQjzMrqiyF6+bkbfsX8BGUvOGA7mJroxYSTybmcvWGoYdHau+645
	HpoCpG9UK2l3PDu3MJdv0ZNM/hYjijZrkAFNF+pc2wU3eHW+PP9PaXQpo6bvAPV5U0NXTn
	d+GmA/0E5MvfliAu6ttCXb3EV47sRMFhH7ZhKO/17tLQvqTXlWF5fZgSAxJLuSnwiO5LjT
	crOkMmKuyXWB+fz/UOmc91qgf2QRfHkcw3Pk2Ysqtlxk7I8FVuhTM5KU4ch094Vg07/buW
	tlXvQx/p4bGTRjovtuyFRsSIjAKkvViAZXZ/1He07PBOTZFv2BmWMkFILxp0Fw==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Tue, 21 Oct 2025 18:32:46 +0200
Subject: [PATCH net-next 05/12] net: macb: rename bp->sgmii_phy field to
 bp->phy
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251021-macb-eyeq5-v1-5-3b0b5a9d2f85@bootlin.com>
References: <20251021-macb-eyeq5-v1-0-3b0b5a9d2f85@bootlin.com>
In-Reply-To: <20251021-macb-eyeq5-v1-0-3b0b5a9d2f85@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 Russell King <linux@armlinux.org.uk>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

The bp->sgmii_phy field is initialised at probe by init_reset_optional()
if bp->phy_interface == PHY_INTERFACE_MODE_SGMII. It gets used by:
 - zynqmp_config: "cdns,zynqmp-gem" or "xlnx,zynqmp-gem" compatibles.
 - mpfs_config: "microchip,mpfs-macb" compatible.
 - versal_config: "xlnx,versal-gem" compatible.

Make name more generic as EyeQ5 requires the PHY in SGMII & RGMII cases.

Drop "for ZynqMP SGMII mode" comment that is already a lie, as it gets
used on Microchip platforms as well. And soon it won't be SGMII-only.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/net/ethernet/cadence/macb.h      |  2 +-
 drivers/net/ethernet/cadence/macb_main.c | 26 +++++++++++++-------------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb.h b/drivers/net/ethernet/cadence/macb.h
index 05bfa9bd4782..87414a2ddf6e 100644
--- a/drivers/net/ethernet/cadence/macb.h
+++ b/drivers/net/ethernet/cadence/macb.h
@@ -1341,7 +1341,7 @@ struct macb {
 
 	struct macb_ptp_info	*ptp_info;	/* macb-ptp interface */
 
-	struct phy		*sgmii_phy;	/* for ZynqMP SGMII mode */
+	struct phy		*phy;
 
 	spinlock_t tsu_clk_lock; /* gem tsu clock locking */
 	unsigned int tsu_rate;
diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 2010f9290c5c..e681d7f39dfe 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -2964,7 +2964,7 @@ static int macb_open(struct net_device *dev)
 
 	macb_init_hw(bp);
 
-	err = phy_power_on(bp->sgmii_phy);
+	err = phy_power_on(bp->phy);
 	if (err)
 		goto reset_hw;
 
@@ -2980,7 +2980,7 @@ static int macb_open(struct net_device *dev)
 	return 0;
 
 phy_off:
-	phy_power_off(bp->sgmii_phy);
+	phy_power_off(bp->phy);
 
 reset_hw:
 	macb_reset_hw(bp);
@@ -3012,7 +3012,7 @@ static int macb_close(struct net_device *dev)
 	phylink_stop(bp->phylink);
 	phylink_disconnect_phy(bp->phylink);
 
-	phy_power_off(bp->sgmii_phy);
+	phy_power_off(bp->phy);
 
 	spin_lock_irqsave(&bp->lock, flags);
 	macb_reset_hw(bp);
@@ -5140,13 +5140,13 @@ static int init_reset_optional(struct platform_device *pdev)
 
 	if (bp->phy_interface == PHY_INTERFACE_MODE_SGMII) {
 		/* Ensure PHY device used in SGMII mode is ready */
-		bp->sgmii_phy = devm_phy_optional_get(&pdev->dev, NULL);
+		bp->phy = devm_phy_optional_get(&pdev->dev, NULL);
 
-		if (IS_ERR(bp->sgmii_phy))
-			return dev_err_probe(&pdev->dev, PTR_ERR(bp->sgmii_phy),
+		if (IS_ERR(bp->phy))
+			return dev_err_probe(&pdev->dev, PTR_ERR(bp->phy),
 					     "failed to get SGMII PHY\n");
 
-		ret = phy_init(bp->sgmii_phy);
+		ret = phy_init(bp->phy);
 		if (ret)
 			return dev_err_probe(&pdev->dev, ret,
 					     "failed to init SGMII PHY\n");
@@ -5175,7 +5175,7 @@ static int init_reset_optional(struct platform_device *pdev)
 	/* Fully reset controller at hardware level if mapped in device tree */
 	ret = device_reset_optional(&pdev->dev);
 	if (ret) {
-		phy_exit(bp->sgmii_phy);
+		phy_exit(bp->phy);
 		return dev_err_probe(&pdev->dev, ret, "failed to reset controller");
 	}
 
@@ -5183,7 +5183,7 @@ static int init_reset_optional(struct platform_device *pdev)
 
 err_out_phy_exit:
 	if (ret)
-		phy_exit(bp->sgmii_phy);
+		phy_exit(bp->phy);
 
 	return ret;
 }
@@ -5593,7 +5593,7 @@ static int macb_probe(struct platform_device *pdev)
 	mdiobus_free(bp->mii_bus);
 
 err_out_phy_exit:
-	phy_exit(bp->sgmii_phy);
+	phy_exit(bp->phy);
 
 err_out_free_netdev:
 	free_netdev(dev);
@@ -5617,7 +5617,7 @@ static void macb_remove(struct platform_device *pdev)
 	if (dev) {
 		bp = netdev_priv(dev);
 		unregister_netdev(dev);
-		phy_exit(bp->sgmii_phy);
+		phy_exit(bp->phy);
 		mdiobus_unregister(bp->mii_bus);
 		mdiobus_free(bp->mii_bus);
 
@@ -5644,7 +5644,7 @@ static int __maybe_unused macb_suspend(struct device *dev)
 	u32 tmp;
 
 	if (!device_may_wakeup(&bp->dev->dev))
-		phy_exit(bp->sgmii_phy);
+		phy_exit(bp->phy);
 
 	if (!netif_running(netdev))
 		return 0;
@@ -5773,7 +5773,7 @@ static int __maybe_unused macb_resume(struct device *dev)
 	int err;
 
 	if (!device_may_wakeup(&bp->dev->dev))
-		phy_init(bp->sgmii_phy);
+		phy_init(bp->phy);
 
 	if (!netif_running(netdev))
 		return 0;

-- 
2.51.1


