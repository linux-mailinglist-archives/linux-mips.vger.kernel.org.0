Return-Path: <linux-mips+bounces-9532-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4887CAEB264
	for <lists+linux-mips@lfdr.de>; Fri, 27 Jun 2025 11:14:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7761F641F5E
	for <lists+linux-mips@lfdr.de>; Fri, 27 Jun 2025 09:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE2972D5C8F;
	Fri, 27 Jun 2025 09:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Yt661UtJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1A52D1914;
	Fri, 27 Jun 2025 09:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751015395; cv=none; b=H0STeOCq2zcYJUHms/CdrcMxLQu31GwBAccm/fYTdy3ru2JDMDDHaQqFp1l4SwaqS5zpI1vWC5GZpF45ydeHwWG1DjGLfXGqUY3LxRJ3hImdHbfgrmIG0EcuMy4SJp8LuCgB14EIHj6OywHtowEo38NVVaNXV0OVe5zhk0GR8Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751015395; c=relaxed/simple;
	bh=jc3c9T7zBKk08gXb+SWzLy5BdXpmqLSWASVICeMMYnk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I+xsnr17fuYY+N6YAG+XmAWW7Ep3B96NoUvEUr+b3na0Fhe3Aj5+CJb2sY9MuPE4AmCG1WDKzURK+Wd2KJEnlEUkFx7gotPbsDqiqDlrJto0aBQNCXTBbKKy0sQGt7zLyBANUJ0MbrsOnr2fHxT8JoEWu8mzMB2yiT1EleURHn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Yt661UtJ; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7C13A43916;
	Fri, 27 Jun 2025 09:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751015391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0e77s5AONBGZ93Anb3sgLgMItwu5elVegMgqEAQHQ10=;
	b=Yt661UtJ6JqApeYIF1kmeDaKSR5Hdm9fyk1zP0de/WL3UThjzPa96AtiIn5oAqw04kVong
	rblm/5dOF2f6UV0Z/eGh7sND7/rXg2iAMmDs7umvI0oG2vjbI+C2AmrsInHCnPyVWBmkxV
	HXFHT7qwsGmo9AFw60swfqaxg02Fd717B4cj7Qx8hsoCd1MGCGwG0b0Wl+4DUZl5InU+tc
	JIB1Fzy5ZJw6kxF+1gi7qPNiVTyczbGkUf62RAlj4HwtJCnExInhLlxKT35GzKY9JYtIQS
	A39/dFZ6VkuYFLDOLZY3AE6p2RgdRLR29BdznHDhkPIgxn+UT5L1vRHcizA/FA==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Fri, 27 Jun 2025 11:09:01 +0200
Subject: [PATCH net-next v2 15/18] net: macb: Add "mobileye,eyeq5-gem"
 compatible
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250627-macb-v2-15-ff8207d0bb77@bootlin.com>
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

Add support for the two GEM instances inside Mobileye EyeQ5 SoCs, using
compatible "mobileye,eyeq5-gem". With it, add a custom init sequence
that accesses two system-controller registers.

Noteworthy: NET_IP_ALIGN=2 on MIPS but the hardware does not align and
low bits aren't configurable, so we cannot respect the requested IP
header alignment.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/net/ethernet/cadence/macb_main.c | 80 ++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index f9a3a5caebcafe3d9197a3bc7681b64734d7ac93..ed394e5d1ec9b1748282f1448628d5006f3b0971 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -20,6 +20,7 @@
 #include <linux/iopoll.h>
 #include <linux/ip.h>
 #include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/netdevice.h>
@@ -31,6 +32,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/ptp_classify.h>
+#include <linux/regmap.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
 #include <linux/tcp.h>
@@ -4957,6 +4959,72 @@ static int init_reset_optional(struct platform_device *pdev)
 	return ret;
 }
 
+#define EYEQ5_OLB_GP_TX_SWRST_DIS	BIT(0)		// Tx SW reset
+#define EYEQ5_OLB_GP_TX_M_CLKE		BIT(1)		// Tx M clock enable
+#define EYEQ5_OLB_GP_SYS_SWRST_DIS	BIT(2)		// Sys SW reset
+#define EYEQ5_OLB_GP_SYS_M_CLKE		BIT(3)		// Sys clock enable
+#define EYEQ5_OLB_GP_SGMII_MODE		BIT(4)		// SGMII mode
+#define EYEQ5_OLB_GP_RGMII_DRV		GENMASK(8, 5)	// RGMII mode
+
+#define EYEQ5_OLB_SGMII_PWR_EN		BIT(0)
+#define EYEQ5_OLB_SGMII_RST_DIS		BIT(1)
+#define EYEQ5_OLB_SGMII_PLL_EN		BIT(2)
+#define EYEQ5_OLB_SGMII_SIG_DET_SW	BIT(3)
+#define EYEQ5_OLB_SGMII_PWR_STATE	BIT(4)
+#define EYEQ5_OLB_SGMII_PLL_ACK		BIT(18)
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
+		reg = EYEQ5_OLB_SGMII_PWR_STATE | EYEQ5_OLB_SGMII_SIG_DET_SW;
+		regmap_update_bits(regmap, sgmii, reg, reg);
+	}
+
+	reg = phy_interface_mode_is_rgmii(bp->phy_interface) ? 0x9 : 0x0;
+	regmap_update_bits(regmap, gp, EYEQ5_OLB_GP_RGMII_DRV,
+			   FIELD_PREP(EYEQ5_OLB_GP_RGMII_DRV, reg));
+
+	reg = EYEQ5_OLB_GP_TX_SWRST_DIS | EYEQ5_OLB_GP_TX_M_CLKE |
+	      EYEQ5_OLB_GP_SYS_SWRST_DIS | EYEQ5_OLB_GP_SYS_M_CLKE;
+	regmap_update_bits(regmap, gp, reg, reg);
+
+	return macb_init(pdev);
+}
+
 static const struct macb_usrio_config sama7g5_usrio = {
 	.mii = 0,
 	.rmii = 1,
@@ -5109,6 +5177,17 @@ static const struct macb_config versal_config = {
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
 static const struct of_device_id macb_dt_ids[] = {
 	{ .compatible = "cdns,at91sam9260-macb", .data = &at91sam9260_config },
 	{ .compatible = "cdns,macb" },
@@ -5129,6 +5208,7 @@ static const struct of_device_id macb_dt_ids[] = {
 	{ .compatible = "microchip,mpfs-macb", .data = &mpfs_config },
 	{ .compatible = "microchip,sama7g5-gem", .data = &sama7g5_gem_config },
 	{ .compatible = "microchip,sama7g5-emac", .data = &sama7g5_emac_config },
+	{ .compatible = "mobileye,eyeq5-gem", .data = &eyeq5_config },
 	{ .compatible = "xlnx,zynqmp-gem", .data = &zynqmp_config},
 	{ .compatible = "xlnx,zynq-gem", .data = &zynq_config },
 	{ .compatible = "xlnx,versal-gem", .data = &versal_config},

-- 
2.50.0


