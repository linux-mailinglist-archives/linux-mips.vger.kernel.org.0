Return-Path: <linux-mips+bounces-13589-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHU6JAXvsmnAQwAAu9opvQ
	(envelope-from <linux-mips+bounces-13589-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 12 Mar 2026 17:51:17 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E118B275F83
	for <lists+linux-mips@lfdr.de>; Thu, 12 Mar 2026 17:51:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BADE43141CC0
	for <lists+linux-mips@lfdr.de>; Thu, 12 Mar 2026 16:45:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50DAB3FB062;
	Thu, 12 Mar 2026 16:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="ltvfPEjX"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB0A3FA5F6;
	Thu, 12 Mar 2026 16:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773333891; cv=none; b=JXZrzWHUzadlBK1/7Zx9uETO1NoqqS1ynrqea6PuJ5olr3V1w05nThI08ctar/WLQZES85wAe3wUBjxT9elJ+d/VREVFtkRBHzibtEG3i/rSnaQ97X0keOydzzktfn99mAvbsodDL+RxF0fOYEm+rsaLanDEWhwR8SzRzXqSGjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773333891; c=relaxed/simple;
	bh=KEM55sR/TogjZ5VezzIFYBS9pLPjpt5yZlbGzFiX0kQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tcN5j1AC56mRxo+invFF1Jb/tZKjFaxlnB3V6oV1JE3jvnewTv6gFEikpVZ6TZVr9ou4rCcY2ICEDFrAGNhqrN9x17jLh2TyweEd4PlIALA+HNGNmy9OTEuKjPjLjtr/rIT44nXJ6o4JhV2KhBGk7L60w/ljpOWwuiMSAyevTIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=ltvfPEjX; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EFF992C6C3F;
	Thu, 12 Mar 2026 17:44:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1773333887; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=lIVo4U43vKJTmOpE3Xdpd73u3mWBksP94PzdDDxFbsc=;
	b=ltvfPEjXYedsVa93vCEHWNIzS8nfdV4XQBCObsn/FAP3xYtyOYePkZll1dHY/ZPk2+SbHM
	MJDD6kfvLyq0lZ0W1u0Ow3uqAxdY5GJ7xOhzjzJGHibmdZTu5DHiJNI4F1N7OgBG5s1k8+
	8AiwtBh3dBj53qPH57VmYpYXn8PW1ON5oCFNg/wyVPm64tJWGDGgcdsJsMHNj62TvNB/ul
	iK5j0g821nEKgLK3LYXl5RE84wHkz4nJpxyr4g8o9yBfFVTl8q3rfVvmYOBFL7Dmngk763
	usCqUW/FEe5Hh1TfU/Z4bTH2azLR7pRCCZoMbIw/Jn1AXjCxti0RIrw1kK0JuQ==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-phy@lists.infradead.org
Cc: naseefkm@gmail.com,
	vkoul@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH 2/2] phy: econet: Add PCIe PHY driver for EcoNet EN751221 and EN7528 SoCs.
Date: Thu, 12 Mar 2026 16:44:32 +0000
Message-Id: <20260312164432.569566-3-cjd@cjdns.fr>
In-Reply-To: <20260312164432.569566-1-cjd@cjdns.fr>
References: <20260312164432.569566-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[cjdns.fr,none];
	R_DKIM_ALLOW(-0.20)[cjdns.fr:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linaro.org,vger.kernel.org,cjdns.fr];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-13589-lists,linux-mips=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cjd@cjdns.fr,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[cjdns.fr:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: E118B275F83
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Introduce support for EcoNet PCIe PHY controllers found in EN751221
and EN7528 SoCs, these SoCs are not identical but are similar, each
having one Gen1 port, and one Gen1/Gen2 port.

Co-developed-by: Ahmed Naseef <naseefkm@gmail.com>
Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
[cjd@cjdns.fr: add EN751221 support and refactor for clarity]
Co-developed-by: Caleb James DeLisle <cjd@cjdns.fr>
Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 MAINTAINERS                   |   1 +
 drivers/phy/Kconfig           |  12 +++
 drivers/phy/Makefile          |   1 +
 drivers/phy/phy-econet-pcie.c | 180 ++++++++++++++++++++++++++++++++++
 4 files changed, 194 insertions(+)
 create mode 100644 drivers/phy/phy-econet-pcie.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 557b6a47ec98..0b2b129e168b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9125,6 +9125,7 @@ M:	Caleb James DeLisle <cjd@cjdns.fr>
 L:	linux-mips@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/phy/econet,en751221-pcie-phy.yaml
+F:	drivers/phy/phy-econet-pcie.c
 
 ECRYPT FILE SYSTEM
 M:	Tyler Hicks <code@tyhicks.com>
diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 02467dfd4fb0..60efc37f6eb0 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -123,6 +123,18 @@ config PHY_AIROHA_PCIE
 	  This driver create the basic PHY instance and provides initialize
 	  callback for PCIe GEN3 port.
 
+config PHY_ECONET_PCIE
+	tristate "EcoNet PCIe-PHY Driver"
+	depends on ECONET || COMPILE_TEST
+	depends on OF
+	select GENERIC_PHY
+	select REGMAP_MMIO
+	help
+	  Say Y here to add support for EcoNet PCIe PHY driver.
+	  This driver create the basic PHY instance and provides initialize
+	  callback for PCIe GEN1 and GEN2 ports. This PHY is found on
+	  EcoNet SoCs including EN751221 and EN7528.
+
 config PHY_NXP_PTN3222
 	tristate "NXP PTN3222 1-port eUSB2 to USB2 redriver"
 	depends on I2C
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index a648c2e02a83..a77f182ee8f3 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_PHY_PISTACHIO_USB)		+= phy-pistachio-usb.o
 obj-$(CONFIG_PHY_SNPS_EUSB2)		+= phy-snps-eusb2.o
 obj-$(CONFIG_USB_LGM_PHY)		+= phy-lgm-usb.o
 obj-$(CONFIG_PHY_AIROHA_PCIE)		+= phy-airoha-pcie.o
+obj-$(CONFIG_PHY_ECONET_PCIE)		+= phy-econet-pcie.o
 obj-$(CONFIG_PHY_NXP_PTN3222)		+= phy-nxp-ptn3222.o
 obj-$(CONFIG_PHY_SPACEMIT_K1_PCIE)	+= phy-spacemit-k1-pcie.o
 obj-$(CONFIG_GENERIC_PHY)		+= allwinner/	\
diff --git a/drivers/phy/phy-econet-pcie.c b/drivers/phy/phy-econet-pcie.c
new file mode 100644
index 000000000000..d2c6e0c1f331
--- /dev/null
+++ b/drivers/phy/phy-econet-pcie.c
@@ -0,0 +1,180 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Author: Caleb James DeLisle <cjd@cjdns.fr>
+ *	   Ahmed Naseef <naseefkm@gmail.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+/* Rx detection timing for EN751221: 16*8 clock cycles  */
+#define EN751221_RXDET_VAL		16
+
+/* Rx detection timing when in power mode 3 */
+#define EN75_RXDET_P3_REG		0xa28
+#define EN75_RXDET_P3_MASK		GENMASK(17, 9)
+
+/* Rx detection timing when in power mode 2 */
+#define EN75_RXDET_P2_REG		0xa2c
+#define EN75_RXDET_P2_MASK		GENMASK(8, 0)
+
+/* Rx impedance */
+#define EN75_RX_IMPEDANCE_REG		0xb2c
+#define EN75_RX_IMPEDANCE_MASK		GENMASK(13, 12)
+enum en75_rx_impedance {
+	EN75_RX_IMPEDANCE_100_OHM	= 0,
+	EN75_RX_IMPEDANCE_95_OHM	= 1,
+	EN75_RX_IMPEDANCE_90_OHM	= 2,
+};
+
+/* PLL Invert clock */
+#define EN75_PLL_PH_INV_REG		0x4a0
+#define EN75_PLL_PH_INV_MASK		BIT(5)
+
+struct en75_phy_op {
+	u32 reg;
+	u32 mask;
+	u32 val;
+};
+
+struct en7528_pcie_phy {
+	struct regmap *regmap;
+	const struct en75_phy_op *data;
+};
+
+/* Port 0 PHY: set LCDDS_CLK_PH_INV for PLL operation */
+static const struct en75_phy_op en7528_phy_gen1[] = {
+	{
+		.reg = EN75_PLL_PH_INV_REG,
+		.mask = EN75_PLL_PH_INV_MASK,
+		.val = 1,
+	},
+	{ /* sentinel */ }
+};
+
+/* EN7528 Port 1 PHY: Rx impedance tuning, target R -5 Ohm */
+static const struct en75_phy_op en7528_phy_gen2[] = {
+	{
+		.reg = EN75_RX_IMPEDANCE_REG,
+		.mask = EN75_RX_IMPEDANCE_MASK,
+		.val = EN75_RX_IMPEDANCE_95_OHM,
+	},
+	{ /* sentinel */ }
+};
+
+/* EN751221 Port 1 PHY, set RX detect to 16*8 clock cycles */
+static const struct en75_phy_op en751221_phy_gen2[] = {
+	{
+		.reg = EN75_RXDET_P3_REG,
+		.mask = EN75_RXDET_P3_MASK,
+		.val = EN751221_RXDET_VAL,
+	},
+	{
+		.reg = EN75_RXDET_P2_REG,
+		.mask = EN75_RXDET_P2_MASK,
+		.val = EN751221_RXDET_VAL,
+	},
+	{ /* sentinel */ }
+};
+
+static int en75_pcie_phy_init(struct phy *phy)
+{
+	struct en7528_pcie_phy *ephy = phy_get_drvdata(phy);
+	const struct en75_phy_op *data = ephy->data;
+	int i, ret;
+	u32 val;
+
+	for (i = 0; data[i].mask || data[i].val; i++) {
+		if (i)
+			usleep_range(1000, 2000);
+
+		val = field_prep(data[i].mask, data[i].val);
+
+		ret = regmap_update_bits(ephy->regmap, data[i].reg,
+					 data[i].mask, val);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct phy_ops en75_pcie_phy_ops = {
+	.init	= en75_pcie_phy_init,
+	.owner	= THIS_MODULE,
+};
+
+static int en75_pcie_phy_probe(struct platform_device *pdev)
+{
+	struct regmap_config regmap_config = {
+		.reg_bits = 32,
+		.val_bits = 32,
+		.reg_stride = 4,
+	};
+	struct device *dev = &pdev->dev;
+	const struct en75_phy_op *data;
+	struct phy_provider *provider;
+	struct en7528_pcie_phy *ephy;
+	void __iomem *base;
+	struct phy *phy;
+	int i;
+
+	data = of_device_get_match_data(dev);
+	if (!data)
+		return -EINVAL;
+
+	ephy = devm_kzalloc(dev, sizeof(*ephy), GFP_KERNEL);
+	if (!ephy)
+		return -ENOMEM;
+
+	ephy->data = data;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	/* Set max_register to highest used register */
+	for (i = 0; data[i].mask || data[i].val; i++)
+		if (data[i].reg > regmap_config.max_register)
+			regmap_config.max_register = data[i].reg;
+
+	ephy->regmap = devm_regmap_init_mmio(dev, base, &regmap_config);
+	if (IS_ERR(ephy->regmap))
+		return PTR_ERR(ephy->regmap);
+
+	phy = devm_phy_create(dev, dev->of_node, &en75_pcie_phy_ops);
+	if (IS_ERR(phy))
+		return PTR_ERR(phy);
+
+	phy_set_drvdata(phy, ephy);
+
+	provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+
+	return PTR_ERR_OR_ZERO(provider);
+}
+
+static const struct of_device_id en75_pcie_phy_ids[] = {
+	{ .compatible = "econet,en7528-pcie-gen1", .data = en7528_phy_gen1 },
+	{ .compatible = "econet,en7528-pcie-gen2", .data = en7528_phy_gen2 },
+	{ .compatible = "econet,en751221-pcie-gen1", .data = en7528_phy_gen1 },
+	{ .compatible = "econet,en751221-pcie-gen2", .data = en751221_phy_gen2 },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, en75_pcie_phy_ids);
+
+static struct platform_driver en75_pcie_phy_driver = {
+	.probe = en75_pcie_phy_probe,
+	.driver = {
+		.name = "econet-pcie-phy",
+		.of_match_table = en75_pcie_phy_ids,
+	},
+};
+module_platform_driver(en75_pcie_phy_driver);
+
+MODULE_AUTHOR("Caleb James DeLisle <cjd@cjdns.fr>");
+MODULE_DESCRIPTION("EcoNet PCIe PHY driver");
+MODULE_LICENSE("GPL");
-- 
2.39.5


