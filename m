Return-Path: <linux-mips+bounces-8278-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F95EA6C33C
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 20:18:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5DA447A83CF
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 19:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97E26236449;
	Fri, 21 Mar 2025 19:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="eT4UXrfY"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5B02356C0;
	Fri, 21 Mar 2025 19:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742584455; cv=none; b=Jsp49SP/dYia5b8B/Hx7nFRxzh6gR+kfX/M2S0ZL9CdSm2aKwRGeY6QdEEMX6HiDo+c2MXpRxDdTDT4APhf3z3jLj1+rPlZltFbeXIrJAw2ScttskXZ94jSxluFRC4up4+T2P3984W99F1tzhb79DyzrVQOCPUgmhniQSKEvPjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742584455; c=relaxed/simple;
	bh=VVpNTvIDfiVUf7OueLrc5Deb8r8QmakhhKkgdFLArYA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TGurfM2mzvw6q0L3qjVFaFBjpH/PxKOUZqSE8IKkCVJiyiOnBf6foKknS/epwom7d8tzp+smKEOmeQTUNFFaYz3oxwxcBY5wg+Zg0Dw5v66k+hUm1EUvwOmMC/ezwQYKeOs6NxUOdK3c3patLyXMrYQCooUgCRzFMCct966NxFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=eT4UXrfY; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5213044557;
	Fri, 21 Mar 2025 19:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742584451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e87+RGdSOMXNWau7DVuhIt+zOGbm1RxUIpw5rMrMWvc=;
	b=eT4UXrfYvPWiZPi6pfaU4YnJdwis65lGwbBiCac2ZVwkmCObq6bnHXL5sjTzinqg2bFx9X
	OQkgqk2fV9+cRD1BMlSyodlgZG7l3r1kfxXtMLoP2F2SUplUQWcyZqLD/r5RNq0deV++JQ
	+bMGCXQKfZEP7EizxNFNUKQto46FnpXX9Il4z0L0JWujNiTMGSj/OuhAB6b+pBFPnBiFQd
	mN5H7GMTxFFQUuCzCPxSA2GGfPSY55SDty54IfSnftLCJILlpMJQ2lVXIaY23+CExx1hyv
	+uzPYvKHbNM35DK6Sa5/w53Oykt3t+5DfOEZ3vEEE/5uX5nLMUduCseRYdULcg==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Fri, 21 Mar 2025 20:09:41 +0100
Subject: [PATCH net-next 10/13] net: macb: Add "mobileye,eyeq5-gem"
 compatible
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250321-macb-v1-10-537b7e37971d@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheduledtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepvfhhrohoucfnvggsrhhunhcuoehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelvefhkeeufedvkefghefhgfdukeejlefgtdehtdeivddtteetgedvieelieeuhfenucfkphepjeejrddufeehrdekuddrieehnecuvehluhhsthgvrhfuihiivgepkeenucfrrghrrghmpehinhgvthepjeejrddufeehrdekuddrieehpdhhvghloheplgduledvrdduieekrddurdeftdgnpdhmrghilhhfrhhomhepthhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdekpdhrtghpthhtohepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthhopehkuhgsrgesk
 hgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhitgholhgrshdrfhgvrhhrvgesmhhitghrohgthhhiphdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: theo.lebrun@bootlin.com

Add support for the two GEM instances inside Mobileye EyeQ5 SoCs, using
compatible "mobileye,eyeq5-gem". With it, add a custom init sequence
that accesses two system-controller registers.

Noteworthy: NET_IP_ALIGN=2 on MIPS but the hardware does not align and
low bits aren't configurable, so we cannot respect the requested IP
header alignment.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/net/ethernet/cadence/macb_main.c | 95 ++++++++++++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 79161d559166478f85a6f8294d488ed961d9be7f..9f2a5bf9a5ebca5941229bd96091a0fb96f0607d 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -22,6 +22,7 @@
 #include <linux/iopoll.h>
 #include <linux/ip.h>
 #include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/netdevice.h>
@@ -34,6 +35,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/ptp_classify.h>
+#include <linux/regmap.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
 #include <linux/tcp.h>
@@ -4967,6 +4969,86 @@ static int init_reset_optional(struct platform_device *pdev)
 	return ret;
 }
 
+#define EYEQ5_OLB_GP_TX_SWRST_DIS	BIT(0)		// Tx SW reset
+#define EYEQ5_OLB_GP_TX_M_CLKE		BIT(1)		// Tx M clock enable
+#define EYEQ5_OLB_GP_SYS_SWRST_DIS	BIT(2)		// Sys SW reset
+#define EYEQ5_OLB_GP_SYS_M_CLKE		BIT(3)		// Sys clock enable
+#define EYEQ5_OLB_GP_SGMII_MODE		BIT(4)		// SGMII mode
+#define EYEQ5_OLB_GP_RGMII_DRV		GENMASK(8, 5)	// RGMII mode
+#define EYEQ5_OLB_GP_SMA_DRV		GENMASK(12, 9)
+#define EYEQ5_OLB_GP_RGMII_PD		BIT(13)		// RGMII pull-down
+#define EYEQ5_OLB_GP_MDIO_PU		BIT(14)		// RGMII pull-up
+#define EYEQ5_OLB_GP_RGMII_RX_ST	BIT(15)		// Schmitt trigger on RGMII Rx
+#define EYEQ5_OLB_GP_RGMII_TX_ST	BIT(16)		// Schmitt trigger on RGMII Tx
+#define EYEQ5_OLB_GP_MDIO_ST		BIT(17)
+#define EYEQ5_OLB_GP_MDC_ST		BIT(18)
+#define EYEQ5_OLB_GP_MBIST_ENABLE	BIT(19)
+
+#define EYEQ5_OLB_SGMII_PWR_EN		BIT(0)
+#define EYEQ5_OLB_SGMII_RST_DIS		BIT(1)
+#define EYEQ5_OLB_SGMII_PLL_EN		BIT(2)
+#define EYEQ5_OLB_SGMII_SIG_DET_SW	BIT(3)
+#define EYEQ5_OLB_SGMII_PWR_STATE_MASK	GENMASK(8, 4)
+#define EYEQ5_OLB_SGMII_PWR_STATE	BIT(4)
+#define EYEQ5_OLB_SGMII_TX_ELECT_IDLE	BIT(9)		// Tx elect idle
+#define EYEQ5_OLB_SGMII_POWER_ACK	BIT(16)
+#define EYEQ5_OLB_SGMII_PLL_ACK		BIT(18)
+#define EYEQ5_OLB_SGMII_SIG_DET		BIT(19)
+#define EYEQ5_OLB_SGMII_PWR_STATE_ACK	GENMASK(24, 20)
+
+static int eyeq5_init(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct net_device *netdev = platform_get_drvdata(pdev);
+	struct macb *bp = netdev_priv(netdev);
+	struct device_node *np = dev->of_node;
+	unsigned int gp, sgmii;
+	struct regmap *regmap;
+	unsigned int args[2];
+	unsigned int reg;
+	int ret;
+
+	regmap = syscon_regmap_lookup_by_phandle_args(np, "mobileye,olb", 2, args);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	gp = args[0];
+	sgmii = args[1];
+
+	/* Forced reset */
+	regmap_write(regmap, gp, 0);
+	regmap_write(regmap, sgmii, 0);
+	usleep_range(5, 20);
+
+	if (bp->phy_interface == PHY_INTERFACE_MODE_SGMII) {
+		regmap_write(regmap, gp, EYEQ5_OLB_GP_SGMII_MODE);
+
+		reg = EYEQ5_OLB_SGMII_PWR_EN | EYEQ5_OLB_SGMII_RST_DIS |
+		      EYEQ5_OLB_SGMII_PLL_EN;
+		regmap_write(regmap, sgmii, reg);
+
+		ret = regmap_read_poll_timeout(regmap, sgmii, reg,
+					       reg & EYEQ5_OLB_SGMII_PLL_ACK,
+					       1, 100);
+		if (ret)
+			return dev_err_probe(dev, ret, "PLL timeout");
+
+		regmap_read(regmap, sgmii, &reg);
+		reg |= EYEQ5_OLB_SGMII_PWR_STATE | EYEQ5_OLB_SGMII_SIG_DET_SW;
+		regmap_write(regmap, sgmii, reg);
+	}
+
+	regmap_read(regmap, gp, &reg);
+	reg &= ~EYEQ5_OLB_GP_RGMII_DRV;
+	if (phy_interface_mode_is_rgmii(bp->phy_interface))
+		reg |= FIELD_PREP(EYEQ5_OLB_GP_RGMII_DRV, 0x9);
+	reg |= EYEQ5_OLB_GP_TX_SWRST_DIS | EYEQ5_OLB_GP_TX_M_CLKE;
+	reg |= EYEQ5_OLB_GP_SYS_SWRST_DIS | EYEQ5_OLB_GP_SYS_M_CLKE;
+	regmap_write(regmap, gp, reg);
+
+	return macb_init(pdev);
+}
+
 static const struct macb_usrio_config sama7g5_usrio = {
 	.mii = 0,
 	.rmii = 1,
@@ -5135,6 +5217,18 @@ static const struct macb_config versal_config = {
 	.usrio = &macb_default_usrio,
 };
 
+static const struct macb_config eyeq5_config = {
+	.caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE | MACB_CAPS_JUMBO |
+		MACB_CAPS_GEM_HAS_PTP | MACB_CAPS_QUEUE_DISABLE |
+		MACB_CAPS_NO_LSO,
+	.hw_ip_align = 0,
+	.dma_burst_length = 16,
+	.clk_init = macb_clk_init,
+	.init = eyeq5_init,
+	.jumbo_max_len = 10240,
+	.usrio = &macb_default_usrio,
+};
+
 static const struct of_device_id macb_dt_ids[] = {
 	{ .compatible = "cdns,at91sam9260-macb", .data = &at91sam9260_config },
 	{ .compatible = "cdns,macb" },
@@ -5152,6 +5246,7 @@ static const struct of_device_id macb_dt_ids[] = {
 	{ .compatible = "cdns,zynqmp-gem", .data = &zynqmp_config}, /* deprecated */
 	{ .compatible = "cdns,zynq-gem", .data = &zynq_config }, /* deprecated */
 	{ .compatible = "sifive,fu540-c000-gem", .data = &fu540_c000_config },
+	{ .compatible = "mobileye,eyeq5-gem", .data = &eyeq5_config },
 	{ .compatible = "microchip,mpfs-macb", .data = &mpfs_config },
 	{ .compatible = "microchip,sama7g5-gem", .data = &sama7g5_gem_config },
 	{ .compatible = "microchip,sama7g5-emac", .data = &sama7g5_emac_config },

-- 
2.48.1


