Return-Path: <linux-mips+bounces-12303-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD57C70077
	for <lists+linux-mips@lfdr.de>; Wed, 19 Nov 2025 17:21:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 845CF503C24
	for <lists+linux-mips@lfdr.de>; Wed, 19 Nov 2025 15:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D11B35F8A3;
	Wed, 19 Nov 2025 15:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ScKdkdOI"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62EF327C10
	for <linux-mips@vger.kernel.org>; Wed, 19 Nov 2025 15:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567485; cv=none; b=eU21SaAJKKPT6h6kwLg81YPWdufOp6cdRXyI2TIZfGSRNVOzfclDEWFF7tTUwkV+rQkD13kAcgfrzzpE4H8Z5iVYup09zz8qJyl3xEt4yGXmwK95yiRJOIlWgVZiGoqTu/JoDQ3KfQYWhI2n2YcDOLoR7mg6S6Slrp4j9sNT/QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567485; c=relaxed/simple;
	bh=S63TG8xNOcQZcLoO4dkYed9u/K6wYYzrizL3nYPKntg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sqXgnixrz+eRsu91oFjmarF/GpnYo2Pz8pwhahrwwcAE7vjfbIjoVIY+fndapBvGTqCqUHz3YLJHulRV4s5b+z3GdhY9PMr9AUDVgS7tnY549T0DeTYgJHRSv4ByTbvTG1HEYPKaDM6Eje2F2YbRIPbrQ6+VuLxj+tHMGPCCFdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ScKdkdOI; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 19575C11190;
	Wed, 19 Nov 2025 15:50:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5335A60699;
	Wed, 19 Nov 2025 15:51:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C5F1210371A75;
	Wed, 19 Nov 2025 16:51:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763567480; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/eLWDd5hWvYbPca/EklNrX1O6zckyQobOuG2mMOxQ0U=;
	b=ScKdkdOIpvpIFnjPt99/MDoXY2bppPwPz2Nfuap7hL9X5okWSKHpg9GTUShQA4arzNpf5z
	4jSbLrdSOjvvC5Pu4yXM/1ppVB60cwEuGEX3L6HNTdykcO5oV+MiLC3JnkVGW2S1gl+1+1
	dXrT/PpP3QoFcPD5Nqs40RVOGyFSNLzjhJVjg35LQ25QDKcVF7dlmVjoUprJY926DAVhV1
	8ABMoqHakKyZ2nT7Q7AMVwRZBaH6id0vPlGCYGy1KUhebMH3qVydlq3L6c1eFoV1ifp23e
	Wa/NlFEwKgZ9xZdPW+HkcR0cmDmPzUYcYyvERgktu8376mNuo3btk8XMJ90UMA==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 19 Nov 2025 16:51:10 +0100
Subject: [PATCH v3 2/7] phy: Add driver for EyeQ5 Ethernet PHY wrapper
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251119-macb-phy-v3-2-e9a7be186a33@bootlin.com>
References: <20251119-macb-phy-v3-0-e9a7be186a33@bootlin.com>
In-Reply-To: <20251119-macb-phy-v3-0-e9a7be186a33@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-clk@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

EyeQ5 embeds a system-controller called OLB. It features many unrelated
registers, and some of those are registers used to configure the
integration of the RGMII/SGMII Cadence PHY used by MACB/GEM instances.

Wrap in a neat generic PHY provider, exposing two PHYs with standard
phy_init() / phy_set_mode() / phy_power_on() operations.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 MAINTAINERS                 |   1 +
 drivers/phy/Kconfig         |  13 +++
 drivers/phy/Makefile        |   1 +
 drivers/phy/phy-eyeq5-eth.c | 254 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 269 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b0223cfb2583..28c0b12dd125 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17403,6 +17403,7 @@ F:	arch/mips/boot/dts/mobileye/
 F:	arch/mips/configs/eyeq5_defconfig
 F:	arch/mips/mobileye/board-epm5.its.S
 F:	drivers/clk/clk-eyeq.c
+F:	drivers/phy/phy-eyeq5-eth.c
 F:	drivers/pinctrl/pinctrl-eyeq5.c
 F:	drivers/reset/reset-eyeq.c
 F:	include/dt-bindings/clock/mobileye,eyeq5-clk.h
diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 678dd0452f0a..1aa6eff12dbc 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -101,6 +101,19 @@ config PHY_NXP_PTN3222
 	  schemes. It supports all three USB 2.0 data rates: Low Speed, Full
 	  Speed and High Speed.
 
+config PHY_EYEQ5_ETH
+	tristate "Ethernet PHY Driver on EyeQ5"
+	depends on OF
+	depends on MACH_EYEQ5 || COMPILE_TEST
+	select AUXILIARY_BUS
+	select GENERIC_PHY
+	default MACH_EYEQ5
+	help
+	  Enable this to support the Ethernet PHY integrated on EyeQ5.
+	  It supports both RGMII and SGMII. Registers are located in a
+	  shared register region called OLB. If M is selected, the
+	  module will be called phy-eyeq5-eth.
+
 source "drivers/phy/allwinner/Kconfig"
 source "drivers/phy/amlogic/Kconfig"
 source "drivers/phy/broadcom/Kconfig"
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index bfb27fb5a494..8289497ece55 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -13,6 +13,7 @@ obj-$(CONFIG_PHY_SNPS_EUSB2)		+= phy-snps-eusb2.o
 obj-$(CONFIG_USB_LGM_PHY)		+= phy-lgm-usb.o
 obj-$(CONFIG_PHY_AIROHA_PCIE)		+= phy-airoha-pcie.o
 obj-$(CONFIG_PHY_NXP_PTN3222)		+= phy-nxp-ptn3222.o
+obj-$(CONFIG_PHY_EYEQ5_ETH)		+= phy-eyeq5-eth.o
 obj-y					+= allwinner/	\
 					   amlogic/	\
 					   broadcom/	\
diff --git a/drivers/phy/phy-eyeq5-eth.c b/drivers/phy/phy-eyeq5-eth.c
new file mode 100644
index 000000000000..c901d1cce0c8
--- /dev/null
+++ b/drivers/phy/phy-eyeq5-eth.c
@@ -0,0 +1,254 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/array_size.h>
+#include <linux/auxiliary_bus.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/bug.h>
+#include <linux/cleanup.h>
+#include <linux/container_of.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/lockdep.h>
+#include <linux/mod_devicetable.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/phy.h>
+#include <linux/phy/phy.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+#define EQ5_PHY_COUNT	2
+
+#define EQ5_PHY0_GP	0x128
+#define EQ5_PHY1_GP	0x12c
+#define EQ5_PHY0_SGMII	0x134
+#define EQ5_PHY1_SGMII	0x138
+
+#define EQ5_GP_TX_SWRST_DIS	BIT(0)		// Tx SW reset
+#define EQ5_GP_TX_M_CLKE	BIT(1)		// Tx M clock enable
+#define EQ5_GP_SYS_SWRST_DIS	BIT(2)		// Sys SW reset
+#define EQ5_GP_SYS_M_CLKE	BIT(3)		// Sys clock enable
+#define EQ5_GP_SGMII_MODE	BIT(4)		// SGMII mode
+#define EQ5_GP_RGMII_DRV	GENMASK(8, 5)	// RGMII drive strength
+
+#define EQ5_SGMII_PWR_EN	BIT(0)
+#define EQ5_SGMII_RST_DIS	BIT(1)
+#define EQ5_SGMII_PLL_EN	BIT(2)
+#define EQ5_SGMII_SIG_DET_SW	BIT(3)
+#define EQ5_SGMII_PWR_STATE	BIT(4)
+#define EQ5_SGMII_PLL_ACK	BIT(18)
+#define EQ5_SGMII_PWR_STATE_ACK	GENMASK(24, 20)
+
+struct eq5_phy_inst {
+	struct eq5_phy_private	*priv;
+	struct phy		*phy;
+	void __iomem		*gp, *sgmii;
+	phy_interface_t		phy_interface;
+};
+
+struct eq5_phy_private {
+	struct device		*dev;
+	struct eq5_phy_inst	phys[EQ5_PHY_COUNT];
+};
+
+static int eq5_phy_init(struct phy *phy)
+{
+	struct eq5_phy_inst *inst = phy_get_drvdata(phy);
+	struct eq5_phy_private *priv = inst->priv;
+	struct device *dev = priv->dev;
+	u32 reg;
+
+	dev_dbg(dev, "phy_init(inst=%td)\n", inst - priv->phys);
+
+	writel(0, inst->gp);
+	writel(0, inst->sgmii);
+
+	udelay(5);
+
+	reg = readl(inst->gp) | EQ5_GP_TX_SWRST_DIS | EQ5_GP_TX_M_CLKE |
+	      EQ5_GP_SYS_SWRST_DIS | EQ5_GP_SYS_M_CLKE |
+	      FIELD_PREP(EQ5_GP_RGMII_DRV, 0x9);
+	writel(reg, inst->gp);
+
+	return 0;
+}
+
+static int eq5_phy_exit(struct phy *phy)
+{
+	struct eq5_phy_inst *inst = phy_get_drvdata(phy);
+	struct eq5_phy_private *priv = inst->priv;
+	struct device *dev = priv->dev;
+
+	dev_dbg(dev, "phy_exit(inst=%td)\n", inst - priv->phys);
+
+	writel(0, inst->gp);
+	writel(0, inst->sgmii);
+	udelay(5);
+
+	return 0;
+}
+
+static int eq5_phy_set_mode(struct phy *phy, enum phy_mode mode, int submode)
+{
+	struct eq5_phy_inst *inst = phy_get_drvdata(phy);
+	struct eq5_phy_private *priv = inst->priv;
+	struct device *dev = priv->dev;
+
+	dev_dbg(dev, "phy_set_mode(inst=%td, mode=%d, submode=%d)\n",
+		inst - priv->phys, mode, submode);
+
+	if (mode != PHY_MODE_ETHERNET)
+		return -EOPNOTSUPP;
+
+	if (!phy_interface_mode_is_rgmii(submode) &&
+	    submode != PHY_INTERFACE_MODE_SGMII)
+		return -EOPNOTSUPP;
+
+	inst->phy_interface = submode;
+	return 0;
+}
+
+static int eq5_phy_power_on(struct phy *phy)
+{
+	struct eq5_phy_inst *inst = phy_get_drvdata(phy);
+	struct eq5_phy_private *priv = inst->priv;
+	struct device *dev = priv->dev;
+	u32 reg;
+
+	dev_dbg(dev, "phy_power_on(inst=%td)\n", inst - priv->phys);
+
+	if (inst->phy_interface == PHY_INTERFACE_MODE_SGMII) {
+		writel(readl(inst->gp) | EQ5_GP_SGMII_MODE, inst->gp);
+
+		reg = EQ5_SGMII_PWR_EN | EQ5_SGMII_RST_DIS | EQ5_SGMII_PLL_EN;
+		writel(reg, inst->sgmii);
+
+		if (readl_poll_timeout(inst->sgmii, reg,
+				       reg & EQ5_SGMII_PLL_ACK, 1, 100)) {
+			dev_err(dev, "PLL timeout\n");
+			return -ETIMEDOUT;
+		}
+
+		reg = readl(inst->sgmii);
+		reg |= EQ5_SGMII_PWR_STATE | EQ5_SGMII_SIG_DET_SW;
+		writel(reg, inst->sgmii);
+	} else {
+		writel(readl(inst->gp) & ~EQ5_GP_SGMII_MODE, inst->gp);
+		writel(0, inst->sgmii);
+	}
+
+	return 0;
+}
+
+static int eq5_phy_power_off(struct phy *phy)
+{
+	struct eq5_phy_inst *inst = phy_get_drvdata(phy);
+	struct eq5_phy_private *priv = inst->priv;
+	struct device *dev = priv->dev;
+
+	dev_dbg(dev, "phy_power_off(inst=%td)\n", inst - priv->phys);
+
+	writel(readl(inst->gp) & ~EQ5_GP_SGMII_MODE, inst->gp);
+	writel(0, inst->sgmii);
+
+	return 0;
+}
+
+static const struct phy_ops eq5_phy_ops = {
+	.init		= eq5_phy_init,
+	.exit		= eq5_phy_exit,
+	.set_mode	= eq5_phy_set_mode,
+	.power_on	= eq5_phy_power_on,
+	.power_off	= eq5_phy_power_off,
+};
+
+static struct phy *eq5_phy_xlate(struct device *dev,
+				 const struct of_phandle_args *args)
+{
+	struct eq5_phy_private *priv = dev_get_drvdata(dev);
+
+	if (args->args_count != 1 || args->args[0] > 1)
+		return ERR_PTR(-EINVAL);
+
+	return priv->phys[args->args[0]].phy;
+}
+
+static int eq5_phy_probe_phy(struct eq5_phy_private *priv, unsigned int index,
+			     void __iomem *base, unsigned int gp,
+			     unsigned int sgmii)
+{
+	struct eq5_phy_inst *inst = &priv->phys[index];
+	struct device *dev = priv->dev;
+	struct phy *phy;
+
+	phy = devm_phy_create(dev, dev->of_node, &eq5_phy_ops);
+	if (IS_ERR(phy)) {
+		dev_err(dev, "failed to create PHY %u\n", index);
+		return PTR_ERR(phy);
+	}
+
+	inst->priv = priv;
+	inst->phy = phy;
+	inst->gp = base + gp;
+	inst->sgmii = base + sgmii;
+	inst->phy_interface = PHY_INTERFACE_MODE_NA;
+	phy_set_drvdata(phy, inst);
+
+	return 0;
+}
+
+static int eq5_phy_probe(struct auxiliary_device *adev,
+			 const struct auxiliary_device_id *id)
+{
+	struct device *dev = &adev->dev;
+	struct phy_provider *provider;
+	struct eq5_phy_private *priv;
+	void __iomem *base;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = dev;
+	dev_set_drvdata(dev, priv);
+
+	base = (void __iomem *)dev_get_platdata(dev);
+
+	ret = eq5_phy_probe_phy(priv, 0, base, EQ5_PHY0_GP, EQ5_PHY0_SGMII);
+	if (ret)
+		return ret;
+
+	ret = eq5_phy_probe_phy(priv, 1, base, EQ5_PHY1_GP, EQ5_PHY1_SGMII);
+	if (ret)
+		return ret;
+
+	provider = devm_of_phy_provider_register(dev, eq5_phy_xlate);
+	if (IS_ERR(provider)) {
+		dev_err(dev, "registering provider failed\n");
+		return PTR_ERR(provider);
+	}
+
+	return 0;
+}
+
+static const struct auxiliary_device_id eq5_phy_id_table[] = {
+	{ .name = "clk_eyeq.phy" },
+	{}
+};
+MODULE_DEVICE_TABLE(auxiliary, eq5_phy_id_table);
+
+static struct auxiliary_driver eq5_phy_driver = {
+	.probe = eq5_phy_probe,
+	.id_table = eq5_phy_id_table,
+};
+module_auxiliary_driver(eq5_phy_driver);
+
+MODULE_DESCRIPTION("EyeQ5 Ethernet PHY driver");
+MODULE_AUTHOR("Théo Lebrun <theo.lebrun@bootlin.com>");
+MODULE_LICENSE("GPL");

-- 
2.51.2


