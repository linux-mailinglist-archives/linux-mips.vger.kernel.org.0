Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0ACB51ED1
	for <lists+linux-mips@lfdr.de>; Tue, 25 Jun 2019 00:59:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727556AbfFXW6V (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Jun 2019 18:58:21 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:33060 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727399AbfFXW6U (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 24 Jun 2019 18:58:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1561417098; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jGSvDmOQ+PB+iXnJHHlUsvl57F0N+4FAJTw75/c9Ctg=;
        b=s4QCN1T1RSS0OKVE4MiGMfGxHksPFGJcWIbglcp2OM5tTQi47n7DIu+clwoQEyHpukcHWl
        IdL0s3l4wXYye8UDpKDdDty++bKXfO09xFVsUvvvluz+XvOUyGQwQGZJH7ZNa+KNCW420w
        Yu7mGeU0fEt7G7QudmE+Blrejx64nBE=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Lee Jones <lee.jones@linaro.org>
Cc:     Mathieu Malaterre <malat@debian.org>, od@zcrc.me,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-clk@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
        Artur Rojek <contact@artur-rojek.eu>
Subject: [PATCH v13 04/13] mfd: Add Ingenic TCU driver
Date:   Tue, 25 Jun 2019 00:57:50 +0200
Message-Id: <20190624225759.18299-5-paul@crapouillou.net>
In-Reply-To: <20190624225759.18299-1-paul@crapouillou.net>
References: <20190624225759.18299-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This driver will provide a regmap that can be retrieved very early in
the boot process through the API function ingenic_tcu_get_regmap().

Additionally, it will call devm_of_platform_populate() so that all the
children devices will be probed.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Mathieu Malaterre <malat@debian.org>
Tested-by: Artur Rojek <contact@artur-rojek.eu>
---

Notes:
    v12: New patch
    
    v13: No change

 drivers/mfd/Kconfig             |   8 +++
 drivers/mfd/Makefile            |   1 +
 drivers/mfd/ingenic-tcu.c       | 113 ++++++++++++++++++++++++++++++++
 include/linux/mfd/ingenic-tcu.h |   8 +++
 4 files changed, 130 insertions(+)
 create mode 100644 drivers/mfd/ingenic-tcu.c

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index a17d275bf1d4..f3ed22613cbc 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -495,6 +495,14 @@ config HTC_I2CPLD
 	  This device provides input and output GPIOs through an I2C
 	  interface to one or more sub-chips.
 
+config INGENIC_TCU
+	bool "Ingenic Timer/Counter Unit (TCU) support"
+	depends on MIPS || COMPILE_TEST
+	select REGMAP_MMIO
+	help
+	  Say yes here to support the Timer/Counter Unit (TCU) IP present
+	  in the JZ47xx SoCs from Ingenic.
+
 config MFD_INTEL_QUARK_I2C_GPIO
 	tristate "Intel Quark MFD I2C GPIO"
 	depends on PCI
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 52b1a90ff515..fb89e131ae98 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -180,6 +180,7 @@ obj-$(CONFIG_AB8500_CORE)	+= ab8500-core.o ab8500-sysctrl.o
 obj-$(CONFIG_MFD_TIMBERDALE)    += timberdale.o
 obj-$(CONFIG_PMIC_ADP5520)	+= adp5520.o
 obj-$(CONFIG_MFD_KEMPLD)	+= kempld-core.o
+obj-$(CONFIG_INGENIC_TCU)	+= ingenic-tcu.o
 obj-$(CONFIG_MFD_INTEL_QUARK_I2C_GPIO)	+= intel_quark_i2c_gpio.o
 obj-$(CONFIG_LPC_SCH)		+= lpc_sch.o
 obj-$(CONFIG_LPC_ICH)		+= lpc_ich.o
diff --git a/drivers/mfd/ingenic-tcu.c b/drivers/mfd/ingenic-tcu.c
new file mode 100644
index 000000000000..6c1d5e4310c1
--- /dev/null
+++ b/drivers/mfd/ingenic-tcu.c
@@ -0,0 +1,113 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * JZ47xx SoCs TCU MFD driver
+ * Copyright (C) 2019 Paul Cercueil <paul@crapouillou.net>
+ */
+
+#include <linux/mfd/ingenic-tcu.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+struct ingenic_soc_info {
+	unsigned int num_channels;
+};
+
+static struct regmap *tcu_regmap __initdata;
+
+static const struct regmap_config ingenic_tcu_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = TCU_REG_OST_CNTHBUF,
+};
+
+static const struct ingenic_soc_info jz4740_soc_info = {
+	.num_channels = 8,
+};
+
+static const struct ingenic_soc_info jz4725b_soc_info = {
+	.num_channels = 6,
+};
+
+static const struct of_device_id ingenic_tcu_of_match[] = {
+	{ .compatible = "ingenic,jz4740-tcu", .data = &jz4740_soc_info, },
+	{ .compatible = "ingenic,jz4725b-tcu", .data = &jz4725b_soc_info, },
+	{ .compatible = "ingenic,jz4770-tcu", .data = &jz4740_soc_info, },
+	{ }
+};
+
+static struct regmap * __init ingenic_tcu_create_regmap(struct device_node *np)
+{
+	struct resource res;
+	void __iomem *base;
+	struct regmap *map;
+
+	if (!of_match_node(ingenic_tcu_of_match, np))
+		return ERR_PTR(-EINVAL);
+
+	base = of_io_request_and_map(np, 0, "TCU");
+	if (IS_ERR(base))
+		return ERR_PTR(PTR_ERR(base));
+
+	map = regmap_init_mmio(NULL, base, &ingenic_tcu_regmap_config);
+	if (IS_ERR(map))
+		goto err_iounmap;
+
+	return map;
+
+err_iounmap:
+	iounmap(base);
+	of_address_to_resource(np, 0, &res);
+	release_mem_region(res.start, resource_size(&res));
+
+	return map;
+}
+
+static int __init ingenic_tcu_probe(struct platform_device *pdev)
+{
+	struct regmap *map = ingenic_tcu_get_regmap(pdev->dev.of_node);
+
+	platform_set_drvdata(pdev, map);
+
+	regmap_attach_dev(&pdev->dev, map, &ingenic_tcu_regmap_config);
+
+	return devm_of_platform_populate(&pdev->dev);
+}
+
+static struct platform_driver ingenic_tcu_driver = {
+	.driver = {
+		.name = "ingenic-tcu",
+		.of_match_table = ingenic_tcu_of_match,
+	},
+};
+
+static int __init ingenic_tcu_platform_init(void)
+{
+	return platform_driver_probe(&ingenic_tcu_driver,
+				     ingenic_tcu_probe);
+}
+subsys_initcall(ingenic_tcu_platform_init);
+
+struct regmap * __init ingenic_tcu_get_regmap(struct device_node *np)
+{
+	if (!tcu_regmap)
+		tcu_regmap = ingenic_tcu_create_regmap(np);
+
+	return tcu_regmap;
+}
+
+bool ingenic_tcu_pwm_can_use_chn(struct device *dev, unsigned int channel)
+{
+	const struct ingenic_soc_info *soc = device_get_match_data(dev->parent);
+
+	/* Enable all TCU channels for PWM use by default except channels 0/1 */
+	u32 pwm_channels_mask = GENMASK(soc->num_channels - 1, 2);
+
+	device_property_read_u32(dev->parent, "ingenic,pwm-channels-mask",
+				 &pwm_channels_mask);
+
+	return !!(pwm_channels_mask & BIT(channel));
+}
+EXPORT_SYMBOL_GPL(ingenic_tcu_pwm_can_use_chn);
diff --git a/include/linux/mfd/ingenic-tcu.h b/include/linux/mfd/ingenic-tcu.h
index 2083fa20821d..21df23916cd2 100644
--- a/include/linux/mfd/ingenic-tcu.h
+++ b/include/linux/mfd/ingenic-tcu.h
@@ -6,6 +6,11 @@
 #define __LINUX_MFD_INGENIC_TCU_H_
 
 #include <linux/bitops.h>
+#include <linux/init.h>
+
+struct device;
+struct device_node;
+struct regmap;
 
 #define TCU_REG_WDT_TDR		0x00
 #define TCU_REG_WDT_TCER	0x04
@@ -53,4 +58,7 @@
 #define TCU_REG_TCNTc(c)	(TCU_REG_TCNT0 + ((c) * TCU_CHANNEL_STRIDE))
 #define TCU_REG_TCSRc(c)	(TCU_REG_TCSR0 + ((c) * TCU_CHANNEL_STRIDE))
 
+struct regmap * __init ingenic_tcu_get_regmap(struct device_node *np);
+bool ingenic_tcu_pwm_can_use_chn(struct device *dev, unsigned int channel);
+
 #endif /* __LINUX_MFD_INGENIC_TCU_H_ */
-- 
2.21.0.593.g511ec345e18

