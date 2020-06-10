Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D28361F5918
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2020 18:33:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730692AbgFJQdJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Jun 2020 12:33:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728730AbgFJQdH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Jun 2020 12:33:07 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00DE8C03E96B;
        Wed, 10 Jun 2020 09:33:07 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id x14so3015530wrp.2;
        Wed, 10 Jun 2020 09:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8yi/gY3pbWHmPAVksg2if5LxnnJAebye20EywiAtIn4=;
        b=EbHwwmxYTdSvBxXziI9tZ1YN9CF/Y4OmEo6ZFjjLIR0iCFTaYh0hpx0vWL/3uoBjL6
         Ej2K7IcFPyMfkBf2mbUs5hExdq6QewYnxhG08Y9km6OP8kOf8Sgy5R9MfQP8vbkffW3s
         A9hoJpIzWVyZ0UyD4dUjEEgQ1wMuCMg8ntQzo35hkmdzuM+1hWKxud1OfDaBT8PlozPA
         PNj5jclrDQjLwfnBv8e9pBhMpPO47lBNxFNo6qxGi37S77Svr8FV349tm/SN3ELHCFk2
         S5C/Br4m2jTyL7D4YaiZQIZSSFcmJGLinNH8kuv3C7s8yi94e9lBOSF7KDiBWxwlJxdH
         JjwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8yi/gY3pbWHmPAVksg2if5LxnnJAebye20EywiAtIn4=;
        b=WCtnv1LGcC5AweYa1UsknhuNUwHN0NJ9aAPrikXOShXY7da6rPzsBn4P9tEsMrbI44
         jNFYmyaL9NNxO+EdJgbmqsVp/JDbeFPuyR8+tHclkBTMUCCx3dekfJOjI0ukrGhLkvEA
         X82ugKrxIpDpimgZa4o8e24vzD+jejLBrL4yLpKmuK+4DVLlRIRYV4edPCCrXKML5jvH
         3GvJJVsyRTXX+y2lFllS1PFsVX7qHJSqF0HsCmshcT2ObWSCsT19HzWVghfbFwtmnUc6
         uvgiSVU6EpgIx5YD2ghATn2M2p6ryKm9b1LOUinOpyMbLUjM2/G9tn6OwZPRcPk4ptMX
         zbaQ==
X-Gm-Message-State: AOAM530IFHoG/SWtmGjTpdHpvScHQZptIykksy4vIbEog6yUEMe/MINO
        pfbZZZ2KWGfIp/YP8sA5wPU5qAPYZJo=
X-Google-Smtp-Source: ABdhPJz5AZUR01ZQEVImzJkJeKSOySv1Gl8Y7BtaiGK0ph9StAiy5CqqsyTlh5eCjzvmIBtTGIuBBQ==
X-Received: by 2002:adf:dd06:: with SMTP id a6mr4801776wrm.142.1591806785567;
        Wed, 10 Jun 2020 09:33:05 -0700 (PDT)
Received: from skynet.lan (28.red-83-49-61.dynamicip.rima-tde.net. [83.49.61.28])
        by smtp.gmail.com with ESMTPSA id t7sm414430wrq.41.2020.06.10.09.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 09:33:05 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        robh+dt@kernel.org, f.fainelli@gmail.com, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v2 2/6] soc: bcm: add BCM63xx power domain driver
Date:   Wed, 10 Jun 2020 18:32:57 +0200
Message-Id: <20200610163301.461160-3-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200610163301.461160-1-noltari@gmail.com>
References: <20200609105244.4014823-1-noltari@gmail.com>
 <20200610163301.461160-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

BCM6318, BCM6328, BCM6362 and BCM63268 SoCs have a power domain controller
to enable/disable certain components in order to save power.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v2: Introduce bcm63xx folder in drivers/soc/bcm and update MAINTAINERS.

 MAINTAINERS                             |   1 +
 drivers/soc/bcm/Kconfig                 |  10 +
 drivers/soc/bcm/Makefile                |   1 +
 drivers/soc/bcm/bcm63xx/Kconfig         |  12 +
 drivers/soc/bcm/bcm63xx/Makefile        |   2 +
 drivers/soc/bcm/bcm63xx/bcm63xx-power.c | 374 ++++++++++++++++++++++++
 6 files changed, 400 insertions(+)
 create mode 100644 drivers/soc/bcm/bcm63xx/Kconfig
 create mode 100644 drivers/soc/bcm/bcm63xx/Makefile
 create mode 100644 drivers/soc/bcm/bcm63xx/bcm63xx-power.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 77a3fa5e3edd..e9ba7b955d5f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3442,6 +3442,7 @@ F:	arch/mips/bmips/*
 F:	arch/mips/boot/dts/brcm/bcm*.dts*
 F:	arch/mips/include/asm/mach-bmips/*
 F:	arch/mips/kernel/*bmips*
+F:	drivers/soc/bcm/bcm63xx
 F:	drivers/irqchip/irq-bcm63*
 F:	drivers/irqchip/irq-bcm7*
 F:	drivers/irqchip/irq-brcmstb*
diff --git a/drivers/soc/bcm/Kconfig b/drivers/soc/bcm/Kconfig
index 648e32693b7e..24f92a6e882a 100644
--- a/drivers/soc/bcm/Kconfig
+++ b/drivers/soc/bcm/Kconfig
@@ -22,6 +22,15 @@ config RASPBERRYPI_POWER
 	  This enables support for the RPi power domains which can be enabled
 	  or disabled via the RPi firmware.
 
+config SOC_BCM63XX
+	bool "Broadcom 63xx SoC drivers"
+	depends on BMIPS_GENERIC || COMPILE_TEST
+	help
+	  Enables drivers for the Broadcom 63xx series of chips.
+	  Drivers can be enabled individually within this menu.
+
+	  If unsure, say N.
+
 config SOC_BRCMSTB
 	bool "Broadcom STB SoC drivers"
 	depends on ARM || ARM64 || BMIPS_GENERIC || COMPILE_TEST
@@ -33,6 +42,7 @@ config SOC_BRCMSTB
 
 	  If unsure, say N.
 
+source "drivers/soc/bcm/bcm63xx/Kconfig"
 source "drivers/soc/bcm/brcmstb/Kconfig"
 
 endmenu
diff --git a/drivers/soc/bcm/Makefile b/drivers/soc/bcm/Makefile
index d92268a829a9..7bc90e0bd773 100644
--- a/drivers/soc/bcm/Makefile
+++ b/drivers/soc/bcm/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_BCM2835_POWER)	+= bcm2835-power.o
 obj-$(CONFIG_RASPBERRYPI_POWER)	+= raspberrypi-power.o
+obj-$(CONFIG_SOC_BCM63XX)	+= bcm63xx/
 obj-$(CONFIG_SOC_BRCMSTB)	+= brcmstb/
diff --git a/drivers/soc/bcm/bcm63xx/Kconfig b/drivers/soc/bcm/bcm63xx/Kconfig
new file mode 100644
index 000000000000..16f648a6c70a
--- /dev/null
+++ b/drivers/soc/bcm/bcm63xx/Kconfig
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0-only
+if SOC_BCM63XX
+
+config BCM63XX_POWER
+	bool "BCM63xx power domain driver"
+	depends on BMIPS_GENERIC || (COMPILE_TEST && OF)
+	select PM_GENERIC_DOMAINS if PM
+	help
+	  This enables support for the BCM63xx power domains controller on
+	  BCM6318, BCM6328, BCM6362 and BCM63268 SoCs.
+
+endif # SOC_BCM63XX
diff --git a/drivers/soc/bcm/bcm63xx/Makefile b/drivers/soc/bcm/bcm63xx/Makefile
new file mode 100644
index 000000000000..0710d5e018cc
--- /dev/null
+++ b/drivers/soc/bcm/bcm63xx/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_BCM63XX_POWER) += bcm63xx-power.o
diff --git a/drivers/soc/bcm/bcm63xx/bcm63xx-power.c b/drivers/soc/bcm/bcm63xx/bcm63xx-power.c
new file mode 100644
index 000000000000..b6e51b721f09
--- /dev/null
+++ b/drivers/soc/bcm/bcm63xx/bcm63xx-power.c
@@ -0,0 +1,374 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * BCM63xx Power Domain Controller Driver
+ *
+ * Copyright (C) 2020 Álvaro Fernández Rojas <noltari@gmail.com>
+ */
+
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pm_domain.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+
+struct bcm63xx_power_dev {
+	struct generic_pm_domain genpd;
+	struct bcm63xx_power *power;
+	uint32_t mask;
+};
+
+struct bcm63xx_power {
+	void __iomem *base;
+	spinlock_t lock;
+	struct bcm63xx_power_dev *dev;
+	struct genpd_onecell_data genpd_data;
+	struct generic_pm_domain **genpd;
+};
+
+struct bcm63xx_power_data {
+	const char * const name;
+	uint8_t bit;
+	unsigned int flags;
+};
+
+static int bcm63xx_power_get_state(struct bcm63xx_power_dev *pmd, bool *is_on)
+{
+	struct bcm63xx_power *power = pmd->power;
+
+	if (!pmd->mask) {
+		*is_on = false;
+		return -EINVAL;
+	}
+
+	*is_on = !(__raw_readl(power->base) & pmd->mask);
+
+	return 0;
+}
+
+static int bcm63xx_power_set_state(struct bcm63xx_power_dev *pmd, bool on)
+{
+	struct bcm63xx_power *power = pmd->power;
+	unsigned long flags;
+	uint32_t val;
+
+	if (!pmd->mask)
+		return -EINVAL;
+
+	spin_lock_irqsave(&power->lock, flags);
+	val = __raw_readl(power->base);
+	if (on)
+		val &= ~pmd->mask;
+	else
+		val |= pmd->mask;
+	__raw_writel(val, power->base);
+	spin_unlock_irqrestore(&power->lock, flags);
+
+	return 0;
+}
+
+static int bcm63xx_power_on(struct generic_pm_domain *genpd)
+{
+	struct bcm63xx_power_dev *pmd = container_of(genpd,
+		struct bcm63xx_power_dev, genpd);
+
+	return bcm63xx_power_set_state(pmd, true);
+}
+
+static int bcm63xx_power_off(struct generic_pm_domain *genpd)
+{
+	struct bcm63xx_power_dev *pmd = container_of(genpd,
+		struct bcm63xx_power_dev, genpd);
+
+	return bcm63xx_power_set_state(pmd, false);
+}
+
+static int bcm63xx_power_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct resource *res;
+	const struct bcm63xx_power_data *entry, *table;
+	struct bcm63xx_power *power;
+	unsigned int ndom;
+	uint8_t max_bit = 0;
+	int ret;
+
+	power = devm_kzalloc(dev, sizeof(*power), GFP_KERNEL);
+	if (!power)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	power->base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(power->base))
+		return PTR_ERR(power->base);
+
+	table = of_device_get_match_data(dev);
+	if (!table)
+		return -EINVAL;
+
+	power->genpd_data.num_domains = 0;
+	ndom = 0;
+	for (entry = table; entry->name; entry++) {
+		max_bit = max(max_bit, entry->bit);
+		ndom++;
+	}
+
+	if (!ndom)
+		return -ENODEV;
+
+	power->genpd_data.num_domains = max_bit + 1;
+
+	power->dev = devm_kcalloc(dev, power->genpd_data.num_domains,
+				  sizeof(struct bcm63xx_power_dev),
+				  GFP_KERNEL);
+	if (!power->dev)
+		return -ENOMEM;
+
+	power->genpd = devm_kcalloc(dev, power->genpd_data.num_domains,
+				    sizeof(struct generic_pm_domain *),
+				    GFP_KERNEL);
+	if (!power->genpd)
+		return -ENOMEM;
+
+	power->genpd_data.domains = power->genpd;
+
+	ndom = 0;
+	for (entry = table; entry->name; entry++) {
+		struct bcm63xx_power_dev *pmd = &power->dev[ndom];
+		bool is_on;
+
+		pmd->power = power;
+		pmd->mask = BIT(entry->bit);
+		pmd->genpd.name = entry->name;
+		pmd->genpd.flags = entry->flags;
+
+		ret = bcm63xx_power_get_state(pmd, &is_on);
+		if (ret)
+			dev_warn(dev, "unable to get current state for %s\n",
+				 pmd->genpd.name);
+
+		pmd->genpd.power_on = bcm63xx_power_on;
+		pmd->genpd.power_off = bcm63xx_power_off;
+
+		pm_genpd_init(&pmd->genpd, NULL, !is_on);
+		power->genpd[entry->bit] = &pmd->genpd;
+
+		ndom++;
+	}
+
+	spin_lock_init(&power->lock);
+
+	ret = of_genpd_add_provider_onecell(np, &power->genpd_data);
+	if (ret) {
+		dev_err(dev, "failed to register genpd driver: %d\n", ret);
+		return ret;
+	}
+
+	dev_info(dev, "registered %u power domains\n", ndom);
+
+	return 0;
+}
+
+static const struct bcm63xx_power_data bcm6318_power_domains[] = {
+	{
+		.name = "pcie",
+		.bit = 0,
+	}, {
+		.name = "usb",
+		.bit = 1,
+	}, {
+		.name = "ephy0",
+		.bit = 2,
+	}, {
+		.name = "ephy1",
+		.bit = 3,
+	}, {
+		.name = "ephy2",
+		.bit = 4,
+	}, {
+		.name = "ephy3",
+		.bit = 5,
+	}, {
+		.name = "ldo2p5",
+		.bit = 6,
+		.flags = GENPD_FLAG_ALWAYS_ON,
+	}, {
+		.name = "ldo2p9",
+		.bit = 7,
+		.flags = GENPD_FLAG_ALWAYS_ON,
+	}, {
+		.name = "sw1p0",
+		.bit = 8,
+		.flags = GENPD_FLAG_ALWAYS_ON,
+	}, {
+		.name = "pad",
+		.bit = 9,
+		.flags = GENPD_FLAG_ALWAYS_ON,
+	}, {
+		/* sentinel */
+	},
+};
+
+static const struct bcm63xx_power_data bcm6328_power_domains[] = {
+	{
+		.name = "adsl2-mips",
+		.bit = 0,
+	}, {
+		.name = "adsl2-phy",
+		.bit = 1,
+	}, {
+		.name = "adsl2-afe",
+		.bit = 2,
+	}, {
+		.name = "sar",
+		.bit = 3,
+	}, {
+		.name = "pcm",
+		.bit = 4,
+	}, {
+		.name = "usbd",
+		.bit = 5,
+	}, {
+		.name = "usbh",
+		.bit = 6,
+	}, {
+		.name = "pcie",
+		.bit = 7,
+	}, {
+		.name = "robosw",
+		.bit = 8,
+	}, {
+		.name = "ephy",
+		.bit = 9,
+	}, {
+		/* sentinel */
+	},
+};
+
+static const struct bcm63xx_power_data bcm6362_power_domains[] = {
+	{
+		.name = "sar",
+		.bit = 0,
+	}, {
+		.name = "ipsec",
+		.bit = 1,
+	}, {
+		.name = "mips",
+		.bit = 2,
+		.flags = GENPD_FLAG_ALWAYS_ON,
+	}, {
+		.name = "dect",
+		.bit = 3,
+	}, {
+		.name = "usbh",
+		.bit = 4,
+	}, {
+		.name = "usbd",
+		.bit = 5,
+	}, {
+		.name = "robosw",
+		.bit = 6,
+	}, {
+		.name = "pcm",
+		.bit = 7,
+	}, {
+		.name = "periph",
+		.bit = 8,
+		.flags = GENPD_FLAG_ALWAYS_ON,
+	}, {
+		.name = "adsl-phy",
+		.bit = 9,
+	}, {
+		.name = "gmii-pads",
+		.bit = 10,
+	}, {
+		.name = "fap",
+		.bit = 11,
+	}, {
+		.name = "pcie",
+		.bit = 12,
+	}, {
+		.name = "wlan-pads",
+		.bit = 13,
+	}, {
+		/* sentinel */
+	},
+};
+
+static const struct bcm63xx_power_data bcm63268_power_domains[] = {
+	{
+		.name = "sar",
+		.bit = 0,
+	}, {
+		.name = "ipsec",
+		.bit = 1,
+	}, {
+		.name = "mips",
+		.bit = 2,
+		.flags = GENPD_FLAG_ALWAYS_ON,
+	}, {
+		.name = "dect",
+		.bit = 3,
+	}, {
+		.name = "usbh",
+		.bit = 4,
+	}, {
+		.name = "usbd",
+		.bit = 5,
+	}, {
+		.name = "robosw",
+		.bit = 6,
+	}, {
+		.name = "pcm",
+		.bit = 7,
+	}, {
+		.name = "periph",
+		.bit = 8,
+		.flags = GENPD_FLAG_ALWAYS_ON,
+	}, {
+		.name = "vdsl-phy",
+		.bit = 9,
+	}, {
+		.name = "vdsl-mips",
+		.bit = 10,
+	}, {
+		.name = "fap",
+		.bit = 11,
+	}, {
+		.name = "pcie",
+		.bit = 12,
+	}, {
+		.name = "wlan-pads",
+		.bit = 13,
+	}, {
+		/* sentinel */
+	},
+};
+
+static const struct of_device_id bcm63xx_power_of_match[] = {
+	{
+		.compatible = "brcm,bcm6318-power-controller",
+		.data = &bcm6318_power_domains,
+	}, {
+		.compatible = "brcm,bcm6328-power-controller",
+		.data = &bcm6328_power_domains,
+	}, {
+		.compatible = "brcm,bcm6362-power-controller",
+		.data = &bcm6362_power_domains,
+	}, {
+		.compatible = "brcm,bcm63268-power-controller",
+		.data = &bcm63268_power_domains,
+	}, {
+		/* sentinel */
+	}
+};
+
+static struct platform_driver bcm63xx_power_driver = {
+	.driver = {
+		.name = "bcm63xx-power-controller",
+		.of_match_table = bcm63xx_power_of_match,
+	},
+	.probe  = bcm63xx_power_probe,
+};
+builtin_platform_driver(bcm63xx_power_driver);
-- 
2.26.2

