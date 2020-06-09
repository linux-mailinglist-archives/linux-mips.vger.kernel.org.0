Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65CAC1F38B2
	for <lists+linux-mips@lfdr.de>; Tue,  9 Jun 2020 12:53:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726918AbgFIKxA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Jun 2020 06:53:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727777AbgFIKwv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Jun 2020 06:52:51 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17A45C08C5C2;
        Tue,  9 Jun 2020 03:52:50 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id r7so20793359wro.1;
        Tue, 09 Jun 2020 03:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qdOuIEoqs/+VDBW0OKFccriMXr4tmsLSpKU4xXreWrI=;
        b=pURvbwHJ0Q3YJ8g99HOsbCYQc+cYayvcMnQnatAXEU/KG76IQo8BsRyJiP1xKy+I2o
         3EeLXDXloJLbigMVWbi3dMBLWhZuqiX6bUnwGWQAXpAX5OlE7umr5OXKBmLgpE8r5aic
         jfIlPpghtCNN4SwxeLCmiRgHTr8uQ0Pm/ZFiwL5/j+mw2CPoJw0NFpFo8Ees9B9uJX8u
         ctT586qoUaxWonJ9ApUWMtypLsdvjSPJ3wBoKckN3ZCdfQ4vNyU6QEMugdkrmp5w5YBX
         hXgD2Dk1wC7Lg/oaBAo0aPx9Ur9t5Cf27L+fNDvIymxVjMzy/1qvQ1VzQf/c0BakVFGT
         gkqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qdOuIEoqs/+VDBW0OKFccriMXr4tmsLSpKU4xXreWrI=;
        b=k2NEH/IKcWnqRvXaJVVOrgg2evxj65wKeyFPPtfX537FO06RKskyjIJDlcr4I9cjlA
         QlUsyItRbp/Lg51DNZvGsSBgh/CNgbKpjpBLHpx6gXqvRTFHJu5c51gj+fOZhVWkhI58
         k4XSmk27Q1hTEFOWJfhxQFytWp/0K/6y33IV9uxfRLx+o8JNLFmYLS4YpJFyVBcbbUXr
         Gmi3ego5C9m3njo5dH5wzNOYL77XqZC6hAVAoR/DsUY6zC0Ph6twhRm5ciPoWhGyBCsO
         y5mZbeeOkmVkycm8GB4KebgVI6ZtgBUzMNybUPdW1NjfKrNydtftE8aJwfmMOCo4KPNr
         OaAg==
X-Gm-Message-State: AOAM532deQhEwlbHV9CWL7OlEFvxSPmVrhEuwtLoz4Wf9QGIcHgYO2Cw
        1QFPyWPBPsMRcCTewl6OxRhAHfiJFf4dlA==
X-Google-Smtp-Source: ABdhPJzacyMzl5AcSYWGgfLsv0Eu2pANVtVHHoPdnZapMYpFzRu0zmU0d52povmbP5Di5kGTlWzOUw==
X-Received: by 2002:adf:e387:: with SMTP id e7mr3752845wrm.70.1591699968682;
        Tue, 09 Jun 2020 03:52:48 -0700 (PDT)
Received: from skynet.lan (28.red-83-49-61.dynamicip.rima-tde.net. [83.49.61.28])
        by smtp.gmail.com with ESMTPSA id h5sm2949931wrw.85.2020.06.09.03.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 03:52:48 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        robh+dt@kernel.org, f.fainelli@gmail.com, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH 2/4] soc: bcm: add BCM63xx power domain driver
Date:   Tue,  9 Jun 2020 12:52:42 +0200
Message-Id: <20200609105244.4014823-3-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200609105244.4014823-1-noltari@gmail.com>
References: <20200609105244.4014823-1-noltari@gmail.com>
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
 drivers/soc/bcm/Kconfig         |   8 +
 drivers/soc/bcm/Makefile        |   1 +
 drivers/soc/bcm/bcm63xx-power.c | 374 ++++++++++++++++++++++++++++++++
 3 files changed, 383 insertions(+)
 create mode 100644 drivers/soc/bcm/bcm63xx-power.c

diff --git a/drivers/soc/bcm/Kconfig b/drivers/soc/bcm/Kconfig
index 648e32693b7e..a2e60d28370b 100644
--- a/drivers/soc/bcm/Kconfig
+++ b/drivers/soc/bcm/Kconfig
@@ -13,6 +13,14 @@ config BCM2835_POWER
 	  firmware means that Linux usage of the same power domain
 	  must be accessed using the RASPBERRYPI_POWER driver
 
+config BCM63XX_POWER
+	bool "BCM63xx power domain driver"
+	depends on BMIPS_GENERIC || (COMPILE_TEST && OF)
+	select PM_GENERIC_DOMAINS if PM
+	help
+	  This enables support for the BCM63xx power domains controller on
+	  BCM6318, BCM6328, BCM6362 and BCM63268 SoCs.
+
 config RASPBERRYPI_POWER
 	bool "Raspberry Pi power domain driver"
 	depends on ARCH_BCM2835 || (COMPILE_TEST && OF)
diff --git a/drivers/soc/bcm/Makefile b/drivers/soc/bcm/Makefile
index d92268a829a9..e6c3d04a4a83 100644
--- a/drivers/soc/bcm/Makefile
+++ b/drivers/soc/bcm/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_BCM2835_POWER)	+= bcm2835-power.o
+obj-$(CONFIG_BCM63XX_POWER)	+= bcm63xx-power.o
 obj-$(CONFIG_RASPBERRYPI_POWER)	+= raspberrypi-power.o
 obj-$(CONFIG_SOC_BRCMSTB)	+= brcmstb/
diff --git a/drivers/soc/bcm/bcm63xx-power.c b/drivers/soc/bcm/bcm63xx-power.c
new file mode 100644
index 000000000000..b6e51b721f09
--- /dev/null
+++ b/drivers/soc/bcm/bcm63xx-power.c
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

