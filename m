Return-Path: <linux-mips+bounces-13217-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAYBKfUpn2kOZQQAu9opvQ
	(envelope-from <linux-mips+bounces-13217-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 25 Feb 2026 17:57:25 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2985019B10C
	for <lists+linux-mips@lfdr.de>; Wed, 25 Feb 2026 17:57:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 28E7B30B2124
	for <lists+linux-mips@lfdr.de>; Wed, 25 Feb 2026 16:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C9253E8C66;
	Wed, 25 Feb 2026 16:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BJw73SsU"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64E93DA7DF
	for <linux-mips@vger.kernel.org>; Wed, 25 Feb 2026 16:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772038491; cv=none; b=Vm6L08CiwsJQ0pMhNjQPbacuGltCl79bbPUcSbxaJkgCoaXzI8A6TMv3zNQX4fXgA29dGne799ASEUXeE7mwzZUZ9VJVR7Z0ftUs/zczp3NEFFbX3wpgE4pNQvsEChdrg476nyoeIQYKaB+gcXpDdDh+/VnYpdAVZlObfXYh6Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772038491; c=relaxed/simple;
	bh=j9lt66+qyQidpmszRAo3mzBykKBtxR5bZ+aHRmB04Bo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eQOoDVXA2OqljGl1w2A9sRDpPMUWinLW0V2kKaGIlXxAdPSmFaifHj1FACUBtzEoIpJjFYBNqIVKLYFjjGLjEI0khL2GWdaaTEaSj6pZx6OpP8MrfEFCdwRGTBfT2jDKDeICQ3BIxXu0caA103rhdQ2v7Oq3Unexzh0kvCQs/C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BJw73SsU; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2A4E4C40680;
	Wed, 25 Feb 2026 16:55:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 14A705FDE6;
	Wed, 25 Feb 2026 16:54:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 305E8103692EC;
	Wed, 25 Feb 2026 17:54:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772038487; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Q6Yg5BPdjJMGsJ4MZxD4NMJ59IOnKhCzaTE5HJyzuP0=;
	b=BJw73SsU1dzEOnIbaac9e+HHSoTzWEpnAqmGNC9IjxaqhvgZW6YYwADN/mMXfqozCf/cgS
	qBeufGI+rd1aq85zw4PxODXY5wID2NZgiu/FXWe/iZJPQw6y6TqxggCCgIoCvjtMMD8Qfc
	0Gds7y3u/uyXNCfHc4BDmR+zh6OyZay6Cc3y3P+Df4lxHtB9eSJb2idk2mYgQmJEhqA0pA
	2WFkC4IciZ+ey5M4fZNE2zMALNkEy+WdrcAkgojfHRLu+vQ93Y6KkFsCCKnbjTsafD9adV
	EcMBOCrYdm227eQG8PHvbIJrA2+PTBSkAqB2VEYswFUzLATGQ3T5Li81v1MR7A==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 25 Feb 2026 17:54:41 +0100
Subject: [PATCH v7 2/2] phy: Add driver for EyeQ5 Ethernet PHY wrapper
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260225-macb-phy-v7-2-e5211a61db56@bootlin.com>
References: <20260225-macb-phy-v7-0-e5211a61db56@bootlin.com>
In-Reply-To: <20260225-macb-phy-v7-0-e5211a61db56@bootlin.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-13217-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[theo.lebrun@bootlin.com,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bootlin.com:mid,bootlin.com:dkim,bootlin.com:email]
X-Rspamd-Queue-Id: 2985019B10C
X-Rspamd-Action: no action

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
 drivers/phy/phy-eyeq5-eth.c | 261 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 276 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 55af015174a5..6bc2ae3bbd4b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17812,6 +17812,7 @@ F:	arch/mips/boot/dts/mobileye/
 F:	arch/mips/configs/eyeq5_defconfig
 F:	arch/mips/mobileye/board-epm5.its.S
 F:	drivers/clk/clk-eyeq.c
+F:	drivers/phy/phy-eyeq5-eth.c
 F:	drivers/pinctrl/pinctrl-eyeq5.c
 F:	drivers/reset/reset-eyeq.c
 F:	include/dt-bindings/clock/mobileye,eyeq5-clk.h
diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index c86e90027443..2c9f3272b320 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -67,6 +67,19 @@ config PHY_CAN_TRANSCEIVER
 	  functional modes using gpios and sets the attribute max link
 	  rate, for CAN drivers.
 
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
 config PHY_GOOGLE_USB
 	tristate "Google Tensor SoC USB PHY driver"
 	select GENERIC_PHY
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index 4c07926bc47b..57178c17752c 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -9,6 +9,7 @@ obj-$(CONFIG_GENERIC_PHY)		+= phy-core.o
 obj-$(CONFIG_GENERIC_PHY_MIPI_DPHY)	+= phy-core-mipi-dphy.o
 obj-$(CONFIG_PHY_AIROHA_PCIE)		+= phy-airoha-pcie.o
 obj-$(CONFIG_PHY_CAN_TRANSCEIVER)	+= phy-can-transceiver.o
+obj-$(CONFIG_PHY_EYEQ5_ETH)		+= phy-eyeq5-eth.o
 obj-$(CONFIG_PHY_GOOGLE_USB)		+= phy-google-usb.o
 obj-$(CONFIG_PHY_LPC18XX_USB_OTG)	+= phy-lpc18xx-usb-otg.o
 obj-$(CONFIG_PHY_NXP_PTN3222)		+= phy-nxp-ptn3222.o
diff --git a/drivers/phy/phy-eyeq5-eth.c b/drivers/phy/phy-eyeq5-eth.c
new file mode 100644
index 000000000000..883ae82d9434
--- /dev/null
+++ b/drivers/phy/phy-eyeq5-eth.c
@@ -0,0 +1,261 @@
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
+	struct device		*dev;
+	struct phy		*phy;
+	void __iomem		*gp, *sgmii;
+	phy_interface_t		phy_interface;
+	bool			sgmii_support;
+};
+
+struct eq5_phy_private {
+	struct eq5_phy_inst	phys[EQ5_PHY_COUNT];
+};
+
+static int eq5_phy_exit(struct phy *phy)
+{
+	struct eq5_phy_inst *inst = phy_get_drvdata(phy);
+
+	writel(0, inst->gp);
+	writel(0, inst->sgmii);
+	udelay(5); /* settling time */
+	return 0;
+}
+
+static int eq5_phy_init(struct phy *phy)
+{
+	struct eq5_phy_inst *inst = phy_get_drvdata(phy);
+	u32 reg;
+
+	/*
+	 * Hardware stops listening to our instructions once it is started.
+	 * It must be reset to reconfigure it.
+	 */
+	eq5_phy_exit(phy);
+
+	reg = EQ5_GP_TX_SWRST_DIS | EQ5_GP_TX_M_CLKE |
+	      EQ5_GP_SYS_SWRST_DIS | EQ5_GP_SYS_M_CLKE |
+	      FIELD_PREP(EQ5_GP_RGMII_DRV, 0x9);
+	writel(reg, inst->gp);
+
+	return 0;
+}
+
+static int eq5_phy_power_on(struct phy *phy)
+{
+	struct eq5_phy_inst *inst = phy_get_drvdata(phy);
+	u32 reg;
+
+	if (inst->phy_interface == PHY_INTERFACE_MODE_SGMII) {
+		writel(readl(inst->gp) | EQ5_GP_SGMII_MODE, inst->gp);
+
+		reg = EQ5_SGMII_PWR_EN | EQ5_SGMII_RST_DIS | EQ5_SGMII_PLL_EN;
+		writel(reg, inst->sgmii);
+
+		if (readl_poll_timeout(inst->sgmii, reg,
+				       reg & EQ5_SGMII_PLL_ACK, 1, 100)) {
+			dev_err(inst->dev, "PLL timeout\n");
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
+
+	writel(readl(inst->gp) & ~EQ5_GP_SGMII_MODE, inst->gp);
+	writel(0, inst->sgmii);
+
+	return 0;
+}
+
+static int eq5_phy_validate(struct phy *phy, enum phy_mode mode, int submode,
+			    union phy_configure_opts *opts)
+{
+	struct eq5_phy_inst *inst = phy_get_drvdata(phy);
+
+	if (mode != PHY_MODE_ETHERNET)
+		return -EINVAL;
+
+	if (phy_interface_mode_is_rgmii(submode))
+		return 0;
+
+	if (inst->sgmii_support && submode == PHY_INTERFACE_MODE_SGMII)
+		return 0;
+
+	return -EINVAL;
+}
+
+static int eq5_phy_set_mode(struct phy *phy, enum phy_mode mode, int submode)
+{
+	struct eq5_phy_inst *inst = phy_get_drvdata(phy);
+
+	if (eq5_phy_validate(phy, mode, submode, NULL))
+		return -EOPNOTSUPP;
+
+	if (submode == inst->phy_interface)
+		return 0;
+
+	inst->phy_interface = submode;
+
+	if (phy->power_count) {
+		eq5_phy_init(phy);
+		return eq5_phy_power_on(phy);
+	}
+
+	return 0;
+}
+
+static const struct phy_ops eq5_phy_ops = {
+	.init		= eq5_phy_init,
+	.exit		= eq5_phy_exit,
+	.power_on	= eq5_phy_power_on,
+	.power_off	= eq5_phy_power_off,
+	.set_mode	= eq5_phy_set_mode,
+	.validate	= eq5_phy_validate,
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
+static int eq5_phy_probe_phy(struct device *dev, struct eq5_phy_private *priv,
+			     unsigned int index, void __iomem *base,
+			     unsigned int gp, unsigned int sgmii,
+			     bool sgmii_support)
+{
+	struct eq5_phy_inst *inst = &priv->phys[index];
+	struct phy *phy;
+
+	phy = devm_phy_create(dev, dev->of_node, &eq5_phy_ops);
+	if (IS_ERR(phy))
+		return dev_err_probe(dev, PTR_ERR(phy),
+				     "failed to create PHY %u\n", index);
+
+	inst->dev = dev;
+	inst->phy = phy;
+	inst->gp = base + gp;
+	inst->sgmii = base + sgmii;
+	inst->sgmii_support = sgmii_support;
+	phy_set_drvdata(phy, inst);
+
+	/*
+	 * Init inst->phy_interface based on probe hardware state, allowing
+	 * consumers to power us on without first setting the mode.
+	 */
+	if (sgmii_support && (readl(inst->gp) & EQ5_GP_SGMII_MODE))
+		inst->phy_interface = PHY_INTERFACE_MODE_SGMII;
+	else
+		inst->phy_interface = PHY_INTERFACE_MODE_RGMII;
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
+	dev_set_drvdata(dev, priv);
+
+	base = dev_get_platdata(dev);
+
+	ret = eq5_phy_probe_phy(dev, priv, 0, base, EQ5_PHY0_GP,
+				EQ5_PHY0_SGMII, true);
+	if (ret)
+		return ret;
+
+	ret = eq5_phy_probe_phy(dev, priv, 1, base, EQ5_PHY1_GP,
+				EQ5_PHY1_SGMII, false);
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
2.53.0


