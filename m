Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F41139B855
	for <lists+linux-mips@lfdr.de>; Fri,  4 Jun 2021 13:52:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230267AbhFDLyE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 4 Jun 2021 07:54:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230271AbhFDLyE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 4 Jun 2021 07:54:04 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DE74C06174A;
        Fri,  4 Jun 2021 04:52:04 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id b145-20020a1c80970000b029019c8c824054so7741228wmd.5;
        Fri, 04 Jun 2021 04:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IyHT2Cjs6sGP9rhUMpWc1FCsrE1dG+uZuKy815sykVw=;
        b=HNGyTJSgnRSZQWoKI2ysce5lDWbzhbvvax7IZzyxiscyWq2pBSA5YXSmBzD+edfVcl
         /r2kfyvBgwr09ju+Vvj81BDYd/aOb7adqYj00iUGy6ePhKGPiKVwgjllyrKn9Cc6IFX8
         PEYjtsqitu+SQqq7wHQFNuZ1TdBF6qo7Iy6bdKA+auBkFw1afQ2Jp5HknbVEnsYW02R+
         wTxY9TTf9PrItF9CEgpdy6cV7MfSn4q3cAbPtV+dcoYX8MAfp+wOE1mHq+4oS40W1rS8
         OqdxWq3b36YyvBrEncfJJNl/7cLlDHexOoV+bUqHMU8PUnaHREVizTEZPbaZnEDvJKnq
         xCYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IyHT2Cjs6sGP9rhUMpWc1FCsrE1dG+uZuKy815sykVw=;
        b=YGukn0UseTsPBcVJO8CHUhxYTafzGbioewZ7yHE05ZQEhDsGXUWvWC/Cyt/fQrGoR9
         Tm15YW5JV3cvPj9DmClL1PDlHXkVO3YI1ljDW6mo4hJcP4P6wrRoFkJ18JsF9nG8uuI3
         BoUMGCzLMJc1Qim+K+htt0xnHCUs0flEUoOIZ0aDfDjRdW1Z4EoU1dCvfGMnTb1Byjqe
         Y5wWIoEWE6oAQqXYSAcoUT6peEOVDrHQpX7JWd8cDuPdo6WL0Na9Vo+N2A3FhArzgS68
         CgMuAMVknl6KnNnPn/XO2kUTGBQsQeoEgnodaRRfB8hfCXLqfLXWTDa6iqR83RTbWRLo
         2wiQ==
X-Gm-Message-State: AOAM533eSBPaU7zM/qT2onGXC+6uk+HG88F4uW4gxZvpgxYeB9kQWgSZ
        i4GKsEasR9Uj3s2yFMu+KAg=
X-Google-Smtp-Source: ABdhPJwtMQSb6jfAdU2JY2GtwFYZRziwtBepBz690iWlVo/jQToBNPYn3qTg04abUs1CxTkJlHSqEA==
X-Received: by 2002:a1c:bcd6:: with SMTP id m205mr3453765wmf.12.1622807523032;
        Fri, 04 Jun 2021 04:52:03 -0700 (PDT)
Received: from localhost.localdomain (113.red-88-4-247.dynamicip.rima-tde.net. [88.4.247.113])
        by smtp.gmail.com with ESMTPSA id v10sm6924530wre.33.2021.06.04.04.52.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Jun 2021 04:52:02 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     john@phrozen.org
Cc:     linus.walleij@linaro.org, tsbogend@alpha.franken.de,
        linux-gpio@vger.kernel.org, linux-mips@vger.kernel.org,
        ilya.lipnitskiy@gmail.com, neil@brown.name
Subject: [PATCH 2/6] pinctrl: ralink: move MT7621 SoC pinmux config into a new 'pinctrl-mt7621.c' file
Date:   Fri,  4 Jun 2021 13:51:55 +0200
Message-Id: <20210604115159.8834-3-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210604115159.8834-1-sergio.paracuellos@gmail.com>
References: <20210604115159.8834-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Move all related code for SoC MT7621 into a new driver located
in 'pinctrl-mt7621.c' source file.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 arch/mips/ralink/mt7621.c               |  88 ------------------
 drivers/pinctrl/ralink/Kconfig          |   5 +
 drivers/pinctrl/ralink/Makefile         |   2 +
 drivers/pinctrl/ralink/pinctrl-mt7621.c | 116 ++++++++++++++++++++++++
 4 files changed, 123 insertions(+), 88 deletions(-)
 create mode 100644 drivers/pinctrl/ralink/pinctrl-mt7621.c

diff --git a/arch/mips/ralink/mt7621.c b/arch/mips/ralink/mt7621.c
index f82ad2a621f6..bd71f5b14238 100644
--- a/arch/mips/ralink/mt7621.c
+++ b/arch/mips/ralink/mt7621.c
@@ -18,97 +18,10 @@
 #include <asm/mach-ralink/ralink_regs.h>
 #include <asm/mach-ralink/mt7621.h>
 
-#include <pinmux.h>
-
 #include "common.h"
 
-#define MT7621_GPIO_MODE_UART1		1
-#define MT7621_GPIO_MODE_I2C		2
-#define MT7621_GPIO_MODE_UART3_MASK	0x3
-#define MT7621_GPIO_MODE_UART3_SHIFT	3
-#define MT7621_GPIO_MODE_UART3_GPIO	1
-#define MT7621_GPIO_MODE_UART2_MASK	0x3
-#define MT7621_GPIO_MODE_UART2_SHIFT	5
-#define MT7621_GPIO_MODE_UART2_GPIO	1
-#define MT7621_GPIO_MODE_JTAG		7
-#define MT7621_GPIO_MODE_WDT_MASK	0x3
-#define MT7621_GPIO_MODE_WDT_SHIFT	8
-#define MT7621_GPIO_MODE_WDT_GPIO	1
-#define MT7621_GPIO_MODE_PCIE_RST	0
-#define MT7621_GPIO_MODE_PCIE_REF	2
-#define MT7621_GPIO_MODE_PCIE_MASK	0x3
-#define MT7621_GPIO_MODE_PCIE_SHIFT	10
-#define MT7621_GPIO_MODE_PCIE_GPIO	1
-#define MT7621_GPIO_MODE_MDIO_MASK	0x3
-#define MT7621_GPIO_MODE_MDIO_SHIFT	12
-#define MT7621_GPIO_MODE_MDIO_GPIO	1
-#define MT7621_GPIO_MODE_RGMII1		14
-#define MT7621_GPIO_MODE_RGMII2		15
-#define MT7621_GPIO_MODE_SPI_MASK	0x3
-#define MT7621_GPIO_MODE_SPI_SHIFT	16
-#define MT7621_GPIO_MODE_SPI_GPIO	1
-#define MT7621_GPIO_MODE_SDHCI_MASK	0x3
-#define MT7621_GPIO_MODE_SDHCI_SHIFT	18
-#define MT7621_GPIO_MODE_SDHCI_GPIO	1
-
 static void *detect_magic __initdata = detect_memory_region;
 
-static struct rt2880_pmx_func uart1_grp[] =  { FUNC("uart1", 0, 1, 2) };
-static struct rt2880_pmx_func i2c_grp[] =  { FUNC("i2c", 0, 3, 2) };
-static struct rt2880_pmx_func uart3_grp[] = {
-	FUNC("uart3", 0, 5, 4),
-	FUNC("i2s", 2, 5, 4),
-	FUNC("spdif3", 3, 5, 4),
-};
-static struct rt2880_pmx_func uart2_grp[] = {
-	FUNC("uart2", 0, 9, 4),
-	FUNC("pcm", 2, 9, 4),
-	FUNC("spdif2", 3, 9, 4),
-};
-static struct rt2880_pmx_func jtag_grp[] = { FUNC("jtag", 0, 13, 5) };
-static struct rt2880_pmx_func wdt_grp[] = {
-	FUNC("wdt rst", 0, 18, 1),
-	FUNC("wdt refclk", 2, 18, 1),
-};
-static struct rt2880_pmx_func pcie_rst_grp[] = {
-	FUNC("pcie rst", MT7621_GPIO_MODE_PCIE_RST, 19, 1),
-	FUNC("pcie refclk", MT7621_GPIO_MODE_PCIE_REF, 19, 1)
-};
-static struct rt2880_pmx_func mdio_grp[] = { FUNC("mdio", 0, 20, 2) };
-static struct rt2880_pmx_func rgmii2_grp[] = { FUNC("rgmii2", 0, 22, 12) };
-static struct rt2880_pmx_func spi_grp[] = {
-	FUNC("spi", 0, 34, 7),
-	FUNC("nand1", 2, 34, 7),
-};
-static struct rt2880_pmx_func sdhci_grp[] = {
-	FUNC("sdhci", 0, 41, 8),
-	FUNC("nand2", 2, 41, 8),
-};
-static struct rt2880_pmx_func rgmii1_grp[] = { FUNC("rgmii1", 0, 49, 12) };
-
-static struct rt2880_pmx_group mt7621_pinmux_data[] = {
-	GRP("uart1", uart1_grp, 1, MT7621_GPIO_MODE_UART1),
-	GRP("i2c", i2c_grp, 1, MT7621_GPIO_MODE_I2C),
-	GRP_G("uart3", uart3_grp, MT7621_GPIO_MODE_UART3_MASK,
-		MT7621_GPIO_MODE_UART3_GPIO, MT7621_GPIO_MODE_UART3_SHIFT),
-	GRP_G("uart2", uart2_grp, MT7621_GPIO_MODE_UART2_MASK,
-		MT7621_GPIO_MODE_UART2_GPIO, MT7621_GPIO_MODE_UART2_SHIFT),
-	GRP("jtag", jtag_grp, 1, MT7621_GPIO_MODE_JTAG),
-	GRP_G("wdt", wdt_grp, MT7621_GPIO_MODE_WDT_MASK,
-		MT7621_GPIO_MODE_WDT_GPIO, MT7621_GPIO_MODE_WDT_SHIFT),
-	GRP_G("pcie", pcie_rst_grp, MT7621_GPIO_MODE_PCIE_MASK,
-		MT7621_GPIO_MODE_PCIE_GPIO, MT7621_GPIO_MODE_PCIE_SHIFT),
-	GRP_G("mdio", mdio_grp, MT7621_GPIO_MODE_MDIO_MASK,
-		MT7621_GPIO_MODE_MDIO_GPIO, MT7621_GPIO_MODE_MDIO_SHIFT),
-	GRP("rgmii2", rgmii2_grp, 1, MT7621_GPIO_MODE_RGMII2),
-	GRP_G("spi", spi_grp, MT7621_GPIO_MODE_SPI_MASK,
-		MT7621_GPIO_MODE_SPI_GPIO, MT7621_GPIO_MODE_SPI_SHIFT),
-	GRP_G("sdhci", sdhci_grp, MT7621_GPIO_MODE_SDHCI_MASK,
-		MT7621_GPIO_MODE_SDHCI_GPIO, MT7621_GPIO_MODE_SDHCI_SHIFT),
-	GRP("rgmii1", rgmii1_grp, 1, MT7621_GPIO_MODE_RGMII1),
-	{ 0 }
-};
-
 phys_addr_t mips_cpc_default_phys_base(void)
 {
 	panic("Cannot detect cpc address");
@@ -219,7 +132,6 @@ void __init prom_soc_init(struct ralink_soc_info *soc_info)
 		(rev & CHIP_REV_ECO_MASK));
 
 	soc_info->mem_detect = mt7621_memory_detect;
-	rt2880_pinmux_data = mt7621_pinmux_data;
 
 	soc_dev_init(soc_info, rev);
 
diff --git a/drivers/pinctrl/ralink/Kconfig b/drivers/pinctrl/ralink/Kconfig
index 8c5f6341477f..ef8990a4c1eb 100644
--- a/drivers/pinctrl/ralink/Kconfig
+++ b/drivers/pinctrl/ralink/Kconfig
@@ -11,4 +11,9 @@ config PINCTRL_RT2880
         select PINMUX
         select GENERIC_PINCONF
 
+config PINCTRL_MT7621
+        bool "mt7621 pinctrl driver for RALINK/Mediatek SOCs"
+        depends on RALINK && SOC_MT7621
+        select PINCTRL_RT2880
+
 endmenu
diff --git a/drivers/pinctrl/ralink/Makefile b/drivers/pinctrl/ralink/Makefile
index 242554298d07..470855290ff6 100644
--- a/drivers/pinctrl/ralink/Makefile
+++ b/drivers/pinctrl/ralink/Makefile
@@ -1,2 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_PINCTRL_RT2880)   += pinctrl-rt2880.o
+
+obj-$(CONFIG_PINCTRL_MT7621)   += pinctrl-mt7621.o
diff --git a/drivers/pinctrl/ralink/pinctrl-mt7621.c b/drivers/pinctrl/ralink/pinctrl-mt7621.c
new file mode 100644
index 000000000000..7d96144c474e
--- /dev/null
+++ b/drivers/pinctrl/ralink/pinctrl-mt7621.c
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include "pinmux.h"
+
+#define MT7621_GPIO_MODE_UART1		1
+#define MT7621_GPIO_MODE_I2C		2
+#define MT7621_GPIO_MODE_UART3_MASK	0x3
+#define MT7621_GPIO_MODE_UART3_SHIFT	3
+#define MT7621_GPIO_MODE_UART3_GPIO	1
+#define MT7621_GPIO_MODE_UART2_MASK	0x3
+#define MT7621_GPIO_MODE_UART2_SHIFT	5
+#define MT7621_GPIO_MODE_UART2_GPIO	1
+#define MT7621_GPIO_MODE_JTAG		7
+#define MT7621_GPIO_MODE_WDT_MASK	0x3
+#define MT7621_GPIO_MODE_WDT_SHIFT	8
+#define MT7621_GPIO_MODE_WDT_GPIO	1
+#define MT7621_GPIO_MODE_PCIE_RST	0
+#define MT7621_GPIO_MODE_PCIE_REF	2
+#define MT7621_GPIO_MODE_PCIE_MASK	0x3
+#define MT7621_GPIO_MODE_PCIE_SHIFT	10
+#define MT7621_GPIO_MODE_PCIE_GPIO	1
+#define MT7621_GPIO_MODE_MDIO_MASK	0x3
+#define MT7621_GPIO_MODE_MDIO_SHIFT	12
+#define MT7621_GPIO_MODE_MDIO_GPIO	1
+#define MT7621_GPIO_MODE_RGMII1		14
+#define MT7621_GPIO_MODE_RGMII2		15
+#define MT7621_GPIO_MODE_SPI_MASK	0x3
+#define MT7621_GPIO_MODE_SPI_SHIFT	16
+#define MT7621_GPIO_MODE_SPI_GPIO	1
+#define MT7621_GPIO_MODE_SDHCI_MASK	0x3
+#define MT7621_GPIO_MODE_SDHCI_SHIFT	18
+#define MT7621_GPIO_MODE_SDHCI_GPIO	1
+
+static struct rt2880_pmx_func uart1_grp[] =  { FUNC("uart1", 0, 1, 2) };
+static struct rt2880_pmx_func i2c_grp[] =  { FUNC("i2c", 0, 3, 2) };
+static struct rt2880_pmx_func uart3_grp[] = {
+	FUNC("uart3", 0, 5, 4),
+	FUNC("i2s", 2, 5, 4),
+	FUNC("spdif3", 3, 5, 4),
+};
+static struct rt2880_pmx_func uart2_grp[] = {
+	FUNC("uart2", 0, 9, 4),
+	FUNC("pcm", 2, 9, 4),
+	FUNC("spdif2", 3, 9, 4),
+};
+static struct rt2880_pmx_func jtag_grp[] = { FUNC("jtag", 0, 13, 5) };
+static struct rt2880_pmx_func wdt_grp[] = {
+	FUNC("wdt rst", 0, 18, 1),
+	FUNC("wdt refclk", 2, 18, 1),
+};
+static struct rt2880_pmx_func pcie_rst_grp[] = {
+	FUNC("pcie rst", MT7621_GPIO_MODE_PCIE_RST, 19, 1),
+	FUNC("pcie refclk", MT7621_GPIO_MODE_PCIE_REF, 19, 1)
+};
+static struct rt2880_pmx_func mdio_grp[] = { FUNC("mdio", 0, 20, 2) };
+static struct rt2880_pmx_func rgmii2_grp[] = { FUNC("rgmii2", 0, 22, 12) };
+static struct rt2880_pmx_func spi_grp[] = {
+	FUNC("spi", 0, 34, 7),
+	FUNC("nand1", 2, 34, 7),
+};
+static struct rt2880_pmx_func sdhci_grp[] = {
+	FUNC("sdhci", 0, 41, 8),
+	FUNC("nand2", 2, 41, 8),
+};
+static struct rt2880_pmx_func rgmii1_grp[] = { FUNC("rgmii1", 0, 49, 12) };
+
+static struct rt2880_pmx_group mt7621_pinmux_data[] = {
+	GRP("uart1", uart1_grp, 1, MT7621_GPIO_MODE_UART1),
+	GRP("i2c", i2c_grp, 1, MT7621_GPIO_MODE_I2C),
+	GRP_G("uart3", uart3_grp, MT7621_GPIO_MODE_UART3_MASK,
+		MT7621_GPIO_MODE_UART3_GPIO, MT7621_GPIO_MODE_UART3_SHIFT),
+	GRP_G("uart2", uart2_grp, MT7621_GPIO_MODE_UART2_MASK,
+		MT7621_GPIO_MODE_UART2_GPIO, MT7621_GPIO_MODE_UART2_SHIFT),
+	GRP("jtag", jtag_grp, 1, MT7621_GPIO_MODE_JTAG),
+	GRP_G("wdt", wdt_grp, MT7621_GPIO_MODE_WDT_MASK,
+		MT7621_GPIO_MODE_WDT_GPIO, MT7621_GPIO_MODE_WDT_SHIFT),
+	GRP_G("pcie", pcie_rst_grp, MT7621_GPIO_MODE_PCIE_MASK,
+		MT7621_GPIO_MODE_PCIE_GPIO, MT7621_GPIO_MODE_PCIE_SHIFT),
+	GRP_G("mdio", mdio_grp, MT7621_GPIO_MODE_MDIO_MASK,
+		MT7621_GPIO_MODE_MDIO_GPIO, MT7621_GPIO_MODE_MDIO_SHIFT),
+	GRP("rgmii2", rgmii2_grp, 1, MT7621_GPIO_MODE_RGMII2),
+	GRP_G("spi", spi_grp, MT7621_GPIO_MODE_SPI_MASK,
+		MT7621_GPIO_MODE_SPI_GPIO, MT7621_GPIO_MODE_SPI_SHIFT),
+	GRP_G("sdhci", sdhci_grp, MT7621_GPIO_MODE_SDHCI_MASK,
+		MT7621_GPIO_MODE_SDHCI_GPIO, MT7621_GPIO_MODE_SDHCI_SHIFT),
+	GRP("rgmii1", rgmii1_grp, 1, MT7621_GPIO_MODE_RGMII1),
+	{ 0 }
+};
+
+static int mt7621_pinmux_probe(struct platform_device *pdev)
+{
+	return rt2880_pinmux_init(pdev, mt7621_pinmux_data);
+}
+
+static const struct of_device_id mt7621_pinmux_match[] = {
+	{ .compatible = "ralink,rt2880-pinmux" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, mt7621_pinmux_match);
+
+static struct platform_driver mt7621_pinmux_driver = {
+	.probe = mt7621_pinmux_probe,
+	.driver = {
+		.name = "rt2880-pinmux",
+		.of_match_table = mt7621_pinmux_match,
+	},
+};
+
+static int __init mt7621_pinmux_init(void)
+{
+	return platform_driver_register(&mt7621_pinmux_driver);
+}
+core_initcall_sync(mt7621_pinmux_init);
-- 
2.25.1

