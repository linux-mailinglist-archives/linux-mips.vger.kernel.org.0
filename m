Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF35C1F59DF
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2020 19:16:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729609AbgFJRQm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Jun 2020 13:16:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729601AbgFJRQl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Jun 2020 13:16:41 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BF72C03E96B;
        Wed, 10 Jun 2020 10:16:40 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id e1so3173297wrt.5;
        Wed, 10 Jun 2020 10:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Cd+yLg5g7GZCMBXFToUqfRJ1Udmj1HQHyRsuOZDrCI4=;
        b=Ockfq1GsO2c1O7Zz/abUDIxPV/h1r+b5iE3QrwxL6fvKM3qbxfypsmOYxYP0svXJDT
         CknBZrEV7nVVM/h/6e3ErgzTMSBXpZ3z3wqvJP1Ftdg2kVgQFS5jOUN9DX4VG3UOxT2V
         gyYcRf/Gz1T6iew/dFRJPYwVzJiwmM6+/8LNx0Y0zgjWeGgZSD9tFVsGZv9USg+izHL/
         9MpRKQVBtcol5ViXCtG5cScXpkfs727YSMJbscQxX96WVw2YxS7NzXecAMbwBeASpdcS
         mgbDkiC2+dBhS7m/I0HuxvaUgmaxkpog0cQPuJ1WCGy5TYISA351/xuSf0tTBN/h7rT9
         QHIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cd+yLg5g7GZCMBXFToUqfRJ1Udmj1HQHyRsuOZDrCI4=;
        b=kHZi3am6zqiwHPaSQtifZzqJUJC/AKxNJGjUr4hvYbYIdVxjRiQ8AW2lBBBani3EOe
         r9ttscJgflE9Zi4x58bjNS8LuzQVjJsEWU0o6oHSfZxQVRdOnkgdUT6y/JG07r7TBp/n
         rvjs9PZh4zshmZ7iYz86G7UQhjR4ck+INWjMBEGbADbhISP5fxY1hRKET9zj3h4DiJZg
         g4BOiIzpe8Pq4YQTXE2WmDLgXB9jssNmmlcZ+yuM7S1FeOTHrzwznZLgodmH23LGYcFk
         WOu5gxh53Szl8Xm58pjSTWjtbyZuz36tYHd0w9v4E4vA8Ugx3zy+j/mv12HtRzd7PYcl
         oy7Q==
X-Gm-Message-State: AOAM533AR0Zm4yUvvmnOIF5F2UvWZhtJ+Qg+CnDfeJ47xh6Phb3z9jIJ
        HZArkrPB50QdmW388+9UzJo=
X-Google-Smtp-Source: ABdhPJw9np+QeDblP3jHRs/QzGg/S1hOySO8j1KJj4qqPfF/zXN1g9EFirWdjkDmu4O7pXPf4HuNpQ==
X-Received: by 2002:adf:f58b:: with SMTP id f11mr4864592wro.155.1591809398983;
        Wed, 10 Jun 2020 10:16:38 -0700 (PDT)
Received: from skynet.lan (28.red-83-49-61.dynamicip.rima-tde.net. [83.49.61.28])
        by smtp.gmail.com with ESMTPSA id f11sm589048wrm.13.2020.06.10.10.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 10:16:38 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        robh+dt@kernel.org, f.fainelli@gmail.com, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v3 6/9] soc: bcm: add BCM63xx power domain driver
Date:   Wed, 10 Jun 2020 19:16:27 +0200
Message-Id: <20200610171630.465579-7-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200610171630.465579-1-noltari@gmail.com>
References: <20200610163301.461160-1-noltari@gmail.com>
 <20200610171630.465579-1-noltari@gmail.com>
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
 v3: Use dt-bindings definitions in power domain driver.
 v2: Introduce bcm63xx folder in drivers/soc/bcm and update MAINTAINERS.

 MAINTAINERS                             |   1 +
 drivers/soc/bcm/Kconfig                 |  10 +
 drivers/soc/bcm/Makefile                |   1 +
 drivers/soc/bcm/bcm63xx/Kconfig         |  12 +
 drivers/soc/bcm/bcm63xx/Makefile        |   2 +
 drivers/soc/bcm/bcm63xx/bcm63xx-power.c | 378 ++++++++++++++++++++++++
 6 files changed, 404 insertions(+)
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
index 000000000000..515fe182dc34
--- /dev/null
+++ b/drivers/soc/bcm/bcm63xx/bcm63xx-power.c
@@ -0,0 +1,378 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * BCM63xx Power Domain Controller Driver
+ *
+ * Copyright (C) 2020 Álvaro Fernández Rojas <noltari@gmail.com>
+ */
+
+#include <dt-bindings/soc/bcm6318-pm.h>
+#include <dt-bindings/soc/bcm6328-pm.h>
+#include <dt-bindings/soc/bcm6362-pm.h>
+#include <dt-bindings/soc/bcm63268-pm.h>
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
+		.bit = BCM6318_POWER_DOMAIN_PCIE,
+	}, {
+		.name = "usb",
+		.bit = BCM6318_POWER_DOMAIN_USB,
+	}, {
+		.name = "ephy0",
+		.bit = BCM6318_POWER_DOMAIN_EPHY0,
+	}, {
+		.name = "ephy1",
+		.bit = BCM6318_POWER_DOMAIN_EPHY1,
+	}, {
+		.name = "ephy2",
+		.bit = BCM6318_POWER_DOMAIN_EPHY2,
+	}, {
+		.name = "ephy3",
+		.bit = BCM6318_POWER_DOMAIN_EPHY3,
+	}, {
+		.name = "ldo2p5",
+		.bit = BCM6318_POWER_DOMAIN_LDO2P5,
+		.flags = GENPD_FLAG_ALWAYS_ON,
+	}, {
+		.name = "ldo2p9",
+		.bit = BCM6318_POWER_DOMAIN_LDO2P9,
+		.flags = GENPD_FLAG_ALWAYS_ON,
+	}, {
+		.name = "sw1p0",
+		.bit = BCM6318_POWER_DOMAIN_SW1P0,
+		.flags = GENPD_FLAG_ALWAYS_ON,
+	}, {
+		.name = "pad",
+		.bit = BCM6318_POWER_DOMAIN_PAD,
+		.flags = GENPD_FLAG_ALWAYS_ON,
+	}, {
+		/* sentinel */
+	},
+};
+
+static const struct bcm63xx_power_data bcm6328_power_domains[] = {
+	{
+		.name = "adsl2-mips",
+		.bit = BCM6328_POWER_DOMAIN_ADSL2_MIPS,
+	}, {
+		.name = "adsl2-phy",
+		.bit = BCM6328_POWER_DOMAIN_ADSL2_PHY,
+	}, {
+		.name = "adsl2-afe",
+		.bit = BCM6328_POWER_DOMAIN_ADSL2_AFE,
+	}, {
+		.name = "sar",
+		.bit = BCM6328_POWER_DOMAIN_SAR,
+	}, {
+		.name = "pcm",
+		.bit = BCM6328_POWER_DOMAIN_PCM,
+	}, {
+		.name = "usbd",
+		.bit = BCM6328_POWER_DOMAIN_USBD,
+	}, {
+		.name = "usbh",
+		.bit = BCM6328_POWER_DOMAIN_USBH,
+	}, {
+		.name = "pcie",
+		.bit = BCM6328_POWER_DOMAIN_PCIE,
+	}, {
+		.name = "robosw",
+		.bit = BCM6328_POWER_DOMAIN_ROBOSW,
+	}, {
+		.name = "ephy",
+		.bit = BCM6328_POWER_DOMAIN_EPHY,
+	}, {
+		/* sentinel */
+	},
+};
+
+static const struct bcm63xx_power_data bcm6362_power_domains[] = {
+	{
+		.name = "sar",
+		.bit = BCM6362_POWER_DOMAIN_SAR,
+	}, {
+		.name = "ipsec",
+		.bit = BCM6362_POWER_DOMAIN_IPSEC,
+	}, {
+		.name = "mips",
+		.bit = BCM6362_POWER_DOMAIN_MIPS,
+		.flags = GENPD_FLAG_ALWAYS_ON,
+	}, {
+		.name = "dect",
+		.bit = BCM6362_POWER_DOMAIN_DECT,
+	}, {
+		.name = "usbh",
+		.bit = BCM6362_POWER_DOMAIN_USBH,
+	}, {
+		.name = "usbd",
+		.bit = BCM6362_POWER_DOMAIN_USBD,
+	}, {
+		.name = "robosw",
+		.bit = BCM6362_POWER_DOMAIN_ROBOSW,
+	}, {
+		.name = "pcm",
+		.bit = BCM6362_POWER_DOMAIN_PCM,
+	}, {
+		.name = "periph",
+		.bit = BCM6362_POWER_DOMAIN_PERIPH,
+		.flags = GENPD_FLAG_ALWAYS_ON,
+	}, {
+		.name = "adsl-phy",
+		.bit = BCM6362_POWER_DOMAIN_ADSL_PHY,
+	}, {
+		.name = "gmii-pads",
+		.bit = BCM6362_POWER_DOMAIN_GMII_PADS,
+	}, {
+		.name = "fap",
+		.bit = BCM6362_POWER_DOMAIN_FAP,
+	}, {
+		.name = "pcie",
+		.bit = BCM6362_POWER_DOMAIN_PCIE,
+	}, {
+		.name = "wlan-pads",
+		.bit = BCM6362_POWER_DOMAIN_WLAN_PADS,
+	}, {
+		/* sentinel */
+	},
+};
+
+static const struct bcm63xx_power_data bcm63268_power_domains[] = {
+	{
+		.name = "sar",
+		.bit = BCM63268_POWER_DOMAIN_SAR,
+	}, {
+		.name = "ipsec",
+		.bit = BCM63268_POWER_DOMAIN_IPSEC,
+	}, {
+		.name = "mips",
+		.bit = BCM63268_POWER_DOMAIN_MIPS,
+		.flags = GENPD_FLAG_ALWAYS_ON,
+	}, {
+		.name = "dect",
+		.bit = BCM63268_POWER_DOMAIN_DECT,
+	}, {
+		.name = "usbh",
+		.bit = BCM63268_POWER_DOMAIN_USBH,
+	}, {
+		.name = "usbd",
+		.bit = BCM63268_POWER_DOMAIN_USBD,
+	}, {
+		.name = "robosw",
+		.bit = BCM63268_POWER_DOMAIN_ROBOSW,
+	}, {
+		.name = "pcm",
+		.bit = BCM63268_POWER_DOMAIN_PCM,
+	}, {
+		.name = "periph",
+		.bit = BCM63268_POWER_DOMAIN_PERIPH,
+		.flags = GENPD_FLAG_ALWAYS_ON,
+	}, {
+		.name = "vdsl-phy",
+		.bit = BCM63268_POWER_DOMAIN_VDSL_PHY,
+	}, {
+		.name = "vdsl-mips",
+		.bit = BCM63268_POWER_DOMAIN_VDSL_MIPS,
+	}, {
+		.name = "fap",
+		.bit = BCM63268_POWER_DOMAIN_FAP,
+	}, {
+		.name = "pcie",
+		.bit = BCM63268_POWER_DOMAIN_PCIE,
+	}, {
+		.name = "wlan-pads",
+		.bit = BCM63268_POWER_DOMAIN_WLAN_PADS,
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

