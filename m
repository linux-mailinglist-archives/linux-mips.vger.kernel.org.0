Return-Path: <linux-mips+bounces-13328-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHv3F10zp2k9fwAAu9opvQ
	(envelope-from <linux-mips+bounces-13328-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 03 Mar 2026 20:15:41 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D72FB1F5C7F
	for <lists+linux-mips@lfdr.de>; Tue, 03 Mar 2026 20:15:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4DE65309874F
	for <lists+linux-mips@lfdr.de>; Tue,  3 Mar 2026 19:10:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C30EE47ECF8;
	Tue,  3 Mar 2026 19:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="oaJHT7LM"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF85030EF92;
	Tue,  3 Mar 2026 19:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772565043; cv=none; b=XpLDxsGtsnsXslQGnVco7ZB0BKHHTvsM0bPRwlDE0a/QxQWPKdD+1eXAtPwwcxUJGXBrueBu9x8UJCsA7ubJuIdnHPEzQFFOLzlN/6/6/YYZkl86KTAcmj5nkDiZEXAfDO2iBjGsqWxqLmLLQWj3SWL7Qx+ZqV+bXZJMP8IS7CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772565043; c=relaxed/simple;
	bh=FrKhKH8u6PYA+AIVV2zodeRPna/4G+MWYdfsznb+nOU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hTTvBRj43/0Ny3l2mkOzrMm5NYj5CHH8iMskpbtsOFJ28B37U8KHsbg4J7EwVHXJ58oPLtZkNZqO6507itQY21ncTuNyKG0hRCV7MOdQLW1xdErRF41KYv9iAfEJvPZi4VKMbP+BVtWeCQ+05bngaCythQDPuyn2ADiCHPUcdvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=oaJHT7LM; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B452020CDA2;
	Tue,  3 Mar 2026 20:10:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1772565039; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=W+99vBF6+noQZFKfqEyxi1GoYX1wO7PB5DYOpXOMID0=;
	b=oaJHT7LM++Tg5TrOr4NzzfntKBvw+DcjZV+6UerjhwD9eSAooNp7LI1vDK9Z/TP6f5PB6Y
	Ed3mh6JR8dgT0fo4PFQDrzY8CZiOii3y6Z6wH1fdZk/TeqsIco7/3TbifrQyBNkGtssPnA
	+Vem5nbk51HFBaJ6g6jcRVkWQwLl9dNtt1sSUnQDgKGZXAg1NVxsiEgNcwCQpaOBv9XWfC
	qcD+u6FFg//aYqjtablpWLfF+NJ0vcc2QSOzqPekv5FK1IWZwgX0wvjvMtJWFLvqwoe95/
	xjgK+tQEEtf93AiFE5bUk9eGdhZWEh5AfFC+DUGD3fmHPSIxBMZKYFD0o+1V7A==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: naseefkm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	cjd@cjdns.fr,
	tsbogend@alpha.franken.de,
	ryder.lee@mediatek.com,
	jianjun.wang@mediatek.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com,
	vkoul@kernel.org,
	neil.armstrong@linaro.org,
	p.zabel@pengutronix.de,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	nbd@nbd.name,
	ansuelsmth@gmail.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/8] phy: econet: Add PCIe PHY driver for EcoNet EN751221 and EN7528 SoCs.
Date: Tue,  3 Mar 2026 19:09:44 +0000
Message-Id: <20260303190948.694783-5-cjd@cjdns.fr>
In-Reply-To: <20260303190948.694783-1-cjd@cjdns.fr>
References: <20260303190948.694783-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: D72FB1F5C7F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[cjdns.fr,none];
	R_DKIM_ALLOW(-0.20)[cjdns.fr:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[gmail.com,baylibre.com,kernel.org,cjdns.fr,alpha.franken.de,mediatek.com,google.com,linaro.org,pengutronix.de,collabora.com,nbd.name,vger.kernel.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13328-lists,linux-mips=lfdr.de];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cjd@cjdns.fr,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[cjdns.fr:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	RCPT_COUNT_TWELVE(0.00)[29];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,tyhicks.com:email,cjdns.fr:dkim,cjdns.fr:email,cjdns.fr:mid]
X-Rspamd-Action: no action

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
index ae053b1f174f..5d4544590069 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9128,6 +9128,7 @@ M:	Caleb James DeLisle <cjd@cjdns.fr>
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
index 000000000000..f9d6d061f54a
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
+static const struct en75_phy_op en7528_phy_port0[] = {
+	{
+		.reg = EN75_PLL_PH_INV_REG,
+		.mask = EN75_PLL_PH_INV_MASK,
+		.val = 1,
+	},
+	{ /* sentinel */ }
+};
+
+/* EN7528 Port 1 PHY: Rx impedance tuning, target R -5 Ohm */
+static const struct en75_phy_op en7528_phy_port1[] = {
+	{
+		.reg = EN75_RX_IMPEDANCE_REG,
+		.mask = EN75_RX_IMPEDANCE_MASK,
+		.val = EN75_RX_IMPEDANCE_95_OHM,
+	},
+	{ /* sentinel */ }
+};
+
+/* EN751221 Port 1 PHY, set RX detect to 16*8 clock cycles */
+static const struct en75_phy_op en751221_phy_port1[] = {
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
+	{ .compatible = "econet,en7528-pcie-phy0", .data = en7528_phy_port0 },
+	{ .compatible = "econet,en7528-pcie-phy1", .data = en7528_phy_port1 },
+	{ .compatible = "econet,en751221-pcie-phy0", .data = en7528_phy_port0 },
+	{ .compatible = "econet,en751221-pcie-phy1", .data = en751221_phy_port1 },
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


