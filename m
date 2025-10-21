Return-Path: <linux-mips+bounces-11825-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 627FABF7B20
	for <lists+linux-mips@lfdr.de>; Tue, 21 Oct 2025 18:35:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C76919A0389
	for <lists+linux-mips@lfdr.de>; Tue, 21 Oct 2025 16:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73F2F393DC0;
	Tue, 21 Oct 2025 16:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="nE5siTkC"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D56436CDF5;
	Tue, 21 Oct 2025 16:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761064408; cv=none; b=OmjiwWfKXT32PFAtAkraPHOz9EiQ8gysDgYLLO9xhiy1RBLsOeoDQt/W4oNc/JknWJjm8GjllEmBqgH+HKFV62jcT91s7GERiBGNn1DPl+Geh9HrPY5kx3s/6tmJ9yvrpzeB7Dx6pu/g4h88cTTDaOpHzGUbB51jhpmwAJj4pFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761064408; c=relaxed/simple;
	bh=YfW7eaofKeij3YIheqmN9e/fMEX8qvmArJW7hECgxE8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VJYI+EFqP9otwItBMMjEF/Ywwjnfm3yPGH93DoAYCMANcOGiRkGh+a0Ad7d3QxAY+hssPcEp7AOpkh21aG5BikNqf5MM389NOi6n6mLBNX39iAso8122qD6vWO8HNPPDWrCW2uZbN+/ykjrfcHPdJGyidEItlDCGh7bcVymnz4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=nE5siTkC; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E927B4E4122A;
	Tue, 21 Oct 2025 16:33:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BDE0360680;
	Tue, 21 Oct 2025 16:33:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7E0F3102F241E;
	Tue, 21 Oct 2025 18:33:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761064403; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=55HIhuBijKuHS2lkpMwIPNwxEIwRl8+fBGb4Po3C0G0=;
	b=nE5siTkC0EXtHonMTAKegXtp0rapyGqObL9hyxCLDBIv7wPa2CKlXTv4oHAEJJ77fIxGkx
	dZdALa24VQWG/phbLuGKtH81f/7cHlieY1A9SbD8k7QQt9k1fMauwCmrVj2u7A2wmnxo2M
	D1bHrMn6bvBGPQFwarbUPc6zycfuPUVKGLEGWO1J/gc6gQuWSEO4wg6e0CVQVkmK1rEvxd
	GOATDQgpFOppTwSJK24AjsPGVwbN0yDw7lfAbmgggfjH8pIhymhKRHLeISvQJL13lb5/RP
	8YYWk5v9avNfkKzeBcoWrSBQ1Kh7cxfLeVJaomPNHWDu/YIk40In178whortEg==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Tue, 21 Oct 2025 18:32:47 +0200
Subject: [PATCH net-next 06/12] net: macb: Add "mobileye,eyeq5-gem"
 compatible
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251021-macb-eyeq5-v1-6-3b0b5a9d2f85@bootlin.com>
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

Add support for the two GEM instances inside Mobileye EyeQ5 SoCs, using
compatible "mobileye,eyeq5-gem". With it, add a custom init sequence
that must grab a generic PHY and initialise it.

We use bp->phy in both RGMII and SGMII cases. Tell our mode by adding a
phy_set_mode_ext() during macb_open(), before phy_power_on(). We are
the first users of bp->phy that use it in non-SGMII cases.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/net/ethernet/cadence/macb_main.c | 38 ++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index e681d7f39dfe..6ea99c5fd95c 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -2964,6 +2964,10 @@ static int macb_open(struct net_device *dev)
 
 	macb_init_hw(bp);
 
+	err = phy_set_mode_ext(bp->phy, PHY_MODE_ETHERNET, bp->phy_interface);
+	if (err)
+		goto reset_hw;
+
 	err = phy_power_on(bp->phy);
 	if (err)
 		goto reset_hw;
@@ -5188,6 +5192,28 @@ static int init_reset_optional(struct platform_device *pdev)
 	return ret;
 }
 
+static int eyeq5_init(struct platform_device *pdev)
+{
+	struct net_device *netdev = platform_get_drvdata(pdev);
+	struct macb *bp = netdev_priv(netdev);
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	bp->phy = devm_phy_get(dev, NULL);
+	if (IS_ERR(bp->phy))
+		return dev_err_probe(dev, PTR_ERR(bp->phy),
+				     "failed to get PHY\n");
+
+	ret = phy_init(bp->phy);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to init PHY\n");
+
+	ret = macb_init(pdev);
+	if (ret)
+		phy_exit(bp->phy);
+	return ret;
+}
+
 static const struct macb_usrio_config sama7g5_usrio = {
 	.mii = 0,
 	.rmii = 1,
@@ -5342,6 +5368,17 @@ static const struct macb_config versal_config = {
 	.usrio = &macb_default_usrio,
 };
 
+static const struct macb_config eyeq5_config = {
+	.caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE | MACB_CAPS_JUMBO |
+		MACB_CAPS_GEM_HAS_PTP | MACB_CAPS_QUEUE_DISABLE |
+		MACB_CAPS_NO_LSO,
+	.dma_burst_length = 16,
+	.clk_init = macb_clk_init,
+	.init = eyeq5_init,
+	.jumbo_max_len = 10240,
+	.usrio = &macb_default_usrio,
+};
+
 static const struct macb_config raspberrypi_rp1_config = {
 	.caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE | MACB_CAPS_CLK_HW_CHG |
 		MACB_CAPS_JUMBO |
@@ -5373,6 +5410,7 @@ static const struct of_device_id macb_dt_ids[] = {
 	{ .compatible = "microchip,mpfs-macb", .data = &mpfs_config },
 	{ .compatible = "microchip,sama7g5-gem", .data = &sama7g5_gem_config },
 	{ .compatible = "microchip,sama7g5-emac", .data = &sama7g5_emac_config },
+	{ .compatible = "mobileye,eyeq5-gem", .data = &eyeq5_config },
 	{ .compatible = "raspberrypi,rp1-gem", .data = &raspberrypi_rp1_config },
 	{ .compatible = "xlnx,zynqmp-gem", .data = &zynqmp_config},
 	{ .compatible = "xlnx,zynq-gem", .data = &zynq_config },

-- 
2.51.1


