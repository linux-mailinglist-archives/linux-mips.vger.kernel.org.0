Return-Path: <linux-mips+bounces-12469-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 526F2CBEE28
	for <lists+linux-mips@lfdr.de>; Mon, 15 Dec 2025 17:27:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8070C3015D03
	for <lists+linux-mips@lfdr.de>; Mon, 15 Dec 2025 16:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 294C630FF2A;
	Mon, 15 Dec 2025 16:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="C6pS63rE"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81EF311C09;
	Mon, 15 Dec 2025 16:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765816023; cv=none; b=IhUusuMSbWESeafp6o2wQecOMyHvBUpNos6Du89Kd8iAfoJhi/W5kwy3vh4WyMQfVhV7khKUmCkksVafV1MDxhLij6XoDwq1/zp3uKrFgyW2iOW6quWFRnO1NTfezbbbp2p4wL8HoyF0Uo/yUJHXGiHLb6/hjeZNqC0EjObwcKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765816023; c=relaxed/simple;
	bh=OLHUDmK8vvFnADag7lyiyT2GB2M7Q2/ejF//k6Ptpos=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H10Sd4XGju7CePcvOae3WhLroZaocfgr3qz2EJZDKd8UEO9lHgFr44F/6b2GYUOyJ0LcdtgzoQnk1M3Jv0oxnqrqjFIvVbVuuNxK1sty8ufYy/1nOOjYMQ0xiI+dpi2LIlsvn646YCHkr9JL2e5woFaM9eiZZHNxp5WeKgUsuiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=C6pS63rE; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D241DC19D21;
	Mon, 15 Dec 2025 16:26:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 38CFF60664;
	Mon, 15 Dec 2025 16:26:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 22F2B119427B8;
	Mon, 15 Dec 2025 17:26:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765816017; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6ReHjdAyVBcuPjF5r2gvsVluwjl4asHqr17I206WTJw=;
	b=C6pS63rEfH3Xrz/6YP9rQB99Grh3ow6DFtY4lY7/Z/Tgq3m4cSOnGYtf2T88/vpEXy6rNf
	8S3OQEUX72T+sq2ZkQ2zC2Ia809ELjPfZtSHo1YZQOAArJD8t+KPuN8VIVHi6xh1hRGAqU
	227HJwoMFZzzaI6gI67zQ0/k46su2kgXyRVk9o+IN1uadPwlCiUFqNEPFoviIvZO5TRr1o
	kXa9zDFHh6j7GHCNAKkRLV2V1zqDHwjSAdua3whK4opSLgNpFwtUvp3C4Z5eXwv7+TUlzo
	7DI33PCQyWH1mEEuE7Lepc0wbe+bjLtd6PLEjC/SP5ocJsE0L1w/tWxxvdKkow==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Mon, 15 Dec 2025 17:26:36 +0100
Subject: [PATCH v5 2/7] phy: Add driver for EyeQ5 Ethernet PHY wrapper
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251215-macb-phy-v5-2-a9dfea39da34@bootlin.com>
References: <20251215-macb-phy-v5-0-a9dfea39da34@bootlin.com>
In-Reply-To: <20251215-macb-phy-v5-0-a9dfea39da34@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-clk@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

EyeQ5 embeds a system-controller called OLB. It features many unrelated
registers, and some of those are registers used to configure the
integration of the RGMII/SGMII Cadence PHY used by MACB/GEM instances.

Wrap in a neat generic PHY provider, exposing two PHYs with standard
phy_init() / phy_set_mode() / phy_power_on() operations.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 MAINTAINERS                 |   1 +
 drivers/phy/Kconfig         |  13 +++
 drivers/phy/Makefile        |   1 +
 drivers/phy/phy-eyeq5-eth.c | 249 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 264 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b11839cba9d..2f67ec9fad57 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17605,6 +17605,7 @@ F:	arch/mips/boot/dts/mobileye/
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
index 000000000000..6e28f7e24835
--- /dev/null
+++ b/drivers/phy/phy-eyeq5-eth.c
@@ -0,0 +1,249 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/auxiliary_bus.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/gfp_types.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
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
+	if (args->args_count != 1 || args->args[0] >= EQ5_PHY_COUNT)
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
+	if (IS_ERR(phy))
+		return dev_err_probe(dev, PTR_ERR(phy),
+				     "failed to create PHY %u\n", index);
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
+	if (IS_ERR(provider))
+		return dev_err_probe(dev, PTR_ERR(provider),
+				     "registering provider failed\n");
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
2.52.0


