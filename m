Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E80E839B851
	for <lists+linux-mips@lfdr.de>; Fri,  4 Jun 2021 13:52:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230241AbhFDLxz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 4 Jun 2021 07:53:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230256AbhFDLxz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 4 Jun 2021 07:53:55 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67052C061763;
        Fri,  4 Jun 2021 04:52:09 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id v206-20020a1cded70000b02901a586d3fa23so1178986wmg.4;
        Fri, 04 Jun 2021 04:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zgzNr14dejbxzD+Lxfb+XajjyTrYVI7v8IR+TCn00n4=;
        b=ghnulOqSI4zbXUZ8ikE2Fsha9aaunOr9624cIzTvyBQt0pEjZb7B58LEWQo2rK8aL0
         4czdePqolip0ZoBjKFh1b3zWni9Y4jhEf6rFmGXGz/X6UlCb8orfIfTmsT2df3lpwgDh
         v0R5+fs9YJsT7i4GlKyd9KDhHmZFWWXLIfiAyYReummOIli1WAJP3P4TQfuWkrBHJPph
         VeZWJPUY9P+syY0xVIBi56blfFJEPZQijiSK6BQXD2zm8N2j4io+gHll5trpXadU7niv
         tlPMD65fb2y8pUcDuXGhueKU80l+xmPevggyRmXp8HKGKCZzw7VHg6HRwchnobFhFy+0
         EQFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zgzNr14dejbxzD+Lxfb+XajjyTrYVI7v8IR+TCn00n4=;
        b=VwVZPTZnqOD0whEs5p8erATd5PH99T2TiwsrEA/1l7IxSZi7hszKIV55/z/aUzvk6z
         e6iFRFWq6WgKb6ZLAPi6TNZb5DVugMstH1faFN/zNFfKMna6lcYIUWJKeSRZObjGLLRw
         j5dBRpguk6cOiV4VAZ9g5hs4QBuTgZT1BP/rLiHhMmW4B12nlRM+FUJRxotC+hCCowg1
         LT+Eo5Wg7jlS974GARhWxjxLOT4D+OPzFx0/2p7Eji5ayvsFyyIKfeVSLztO77mhO9Pz
         2CPFnfTrecNaoXZTEnUhw3YIIw/m35JnuQ+1tNYjLCdaRFPr6etZFRLQwjLkhsb7GfUJ
         Ciig==
X-Gm-Message-State: AOAM531cQlYTnxUDkqnMhGndNQ478LozsgyVShkQ+JM+9tgi/ZARt+LS
        /pP6hHzUrGL+/qJTD+fn9Vc=
X-Google-Smtp-Source: ABdhPJyhExvw8MLDm4drRsubA8DuYZkBysej5QfJQktUFXugp09+Srnl/zV2gEDZaTom0EfgaQHPbg==
X-Received: by 2002:a1c:2155:: with SMTP id h82mr3365622wmh.115.1622807526700;
        Fri, 04 Jun 2021 04:52:06 -0700 (PDT)
Received: from localhost.localdomain (113.red-88-4-247.dynamicip.rima-tde.net. [88.4.247.113])
        by smtp.gmail.com with ESMTPSA id v10sm6924530wre.33.2021.06.04.04.52.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Jun 2021 04:52:06 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     john@phrozen.org
Cc:     linus.walleij@linaro.org, tsbogend@alpha.franken.de,
        linux-gpio@vger.kernel.org, linux-mips@vger.kernel.org,
        ilya.lipnitskiy@gmail.com, neil@brown.name
Subject: [PATCH 6/6] pinctrl: ralink: move RT288X SoC pinmux config into a new 'pinctrl-rt288x.c' file
Date:   Fri,  4 Jun 2021 13:51:59 +0200
Message-Id: <20210604115159.8834-7-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210604115159.8834-1-sergio.paracuellos@gmail.com>
References: <20210604115159.8834-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Move all related code for SoC RT288X into a new driver located
in 'pinctrl-rt288x.c' source file.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 arch/mips/include/asm/mach-ralink/rt288x.h |  9 ----
 arch/mips/ralink/rt288x.c                  | 21 --------
 drivers/pinctrl/ralink/Kconfig             |  5 ++
 drivers/pinctrl/ralink/Makefile            |  1 +
 drivers/pinctrl/ralink/pinctrl-rt288x.c    | 60 ++++++++++++++++++++++
 5 files changed, 66 insertions(+), 30 deletions(-)
 create mode 100644 drivers/pinctrl/ralink/pinctrl-rt288x.c

diff --git a/arch/mips/include/asm/mach-ralink/rt288x.h b/arch/mips/include/asm/mach-ralink/rt288x.h
index 5d10178f26af..5f213534f0f5 100644
--- a/arch/mips/include/asm/mach-ralink/rt288x.h
+++ b/arch/mips/include/asm/mach-ralink/rt288x.h
@@ -33,15 +33,6 @@
 #define SYSTEM_CONFIG_CPUCLK_280	0x2
 #define SYSTEM_CONFIG_CPUCLK_300	0x3
 
-#define RT2880_GPIO_MODE_I2C		BIT(0)
-#define RT2880_GPIO_MODE_UART0		BIT(1)
-#define RT2880_GPIO_MODE_SPI		BIT(2)
-#define RT2880_GPIO_MODE_UART1		BIT(3)
-#define RT2880_GPIO_MODE_JTAG		BIT(4)
-#define RT2880_GPIO_MODE_MDIO		BIT(5)
-#define RT2880_GPIO_MODE_SDRAM		BIT(6)
-#define RT2880_GPIO_MODE_PCI		BIT(7)
-
 #define CLKCFG_SRAM_CS_N_WDT		BIT(9)
 
 #define RT2880_SDRAM_BASE		0x08000000
diff --git a/arch/mips/ralink/rt288x.c b/arch/mips/ralink/rt288x.c
index 34083c70ec68..493335db2fe1 100644
--- a/arch/mips/ralink/rt288x.c
+++ b/arch/mips/ralink/rt288x.c
@@ -14,29 +14,9 @@
 #include <asm/mipsregs.h>
 #include <asm/mach-ralink/ralink_regs.h>
 #include <asm/mach-ralink/rt288x.h>
-#include <asm/mach-ralink/pinmux.h>
 
 #include "common.h"
 
-static struct rt2880_pmx_func i2c_func[] = { FUNC("i2c", 0, 1, 2) };
-static struct rt2880_pmx_func spi_func[] = { FUNC("spi", 0, 3, 4) };
-static struct rt2880_pmx_func uartlite_func[] = { FUNC("uartlite", 0, 7, 8) };
-static struct rt2880_pmx_func jtag_func[] = { FUNC("jtag", 0, 17, 5) };
-static struct rt2880_pmx_func mdio_func[] = { FUNC("mdio", 0, 22, 2) };
-static struct rt2880_pmx_func sdram_func[] = { FUNC("sdram", 0, 24, 16) };
-static struct rt2880_pmx_func pci_func[] = { FUNC("pci", 0, 40, 32) };
-
-static struct rt2880_pmx_group rt2880_pinmux_data_act[] = {
-	GRP("i2c", i2c_func, 1, RT2880_GPIO_MODE_I2C),
-	GRP("spi", spi_func, 1, RT2880_GPIO_MODE_SPI),
-	GRP("uartlite", uartlite_func, 1, RT2880_GPIO_MODE_UART0),
-	GRP("jtag", jtag_func, 1, RT2880_GPIO_MODE_JTAG),
-	GRP("mdio", mdio_func, 1, RT2880_GPIO_MODE_MDIO),
-	GRP("sdram", sdram_func, 1, RT2880_GPIO_MODE_SDRAM),
-	GRP("pci", pci_func, 1, RT2880_GPIO_MODE_PCI),
-	{ 0 }
-};
-
 void __init ralink_clk_init(void)
 {
 	unsigned long cpu_rate, wmac_rate = 40000000;
@@ -106,6 +86,5 @@ void __init prom_soc_init(struct ralink_soc_info *soc_info)
 	soc_info->mem_size_min = RT2880_MEM_SIZE_MIN;
 	soc_info->mem_size_max = RT2880_MEM_SIZE_MAX;
 
-	rt2880_pinmux_data = rt2880_pinmux_data_act;
 	ralink_soc = RT2880_SOC;
 }
diff --git a/drivers/pinctrl/ralink/Kconfig b/drivers/pinctrl/ralink/Kconfig
index 6edf0589cf0a..a76ee3deb8c3 100644
--- a/drivers/pinctrl/ralink/Kconfig
+++ b/drivers/pinctrl/ralink/Kconfig
@@ -21,6 +21,11 @@ config PINCTRL_MT7621
         depends on RALINK && SOC_MT7621
         select PINCTRL_RT2880
 
+config PINCTRL_RT288X
+        bool "RT288X pinctrl driver for RALINK/Mediatek SOCs"
+        depends on RALINK && SOC_RT288X
+        select PINCTRL_RT2880
+
 config PINCTRL_RT305X
         bool "RT305X pinctrl driver for RALINK/Mediatek SOCs"
         depends on RALINK && SOC_RT305X
diff --git a/drivers/pinctrl/ralink/Makefile b/drivers/pinctrl/ralink/Makefile
index 9b99b20e51e6..a15610206ced 100644
--- a/drivers/pinctrl/ralink/Makefile
+++ b/drivers/pinctrl/ralink/Makefile
@@ -3,5 +3,6 @@ obj-$(CONFIG_PINCTRL_RT2880)   += pinctrl-rt2880.o
 
 obj-$(CONFIG_PINCTRL_MT7620)   += pinctrl-mt7620.o
 obj-$(CONFIG_PINCTRL_MT7621)   += pinctrl-mt7621.o
+obj-$(CONFIG_PINCTRL_RT288X)   += pinctrl-rt288x.o
 obj-$(CONFIG_PINCTRL_RT305X)   += pinctrl-rt305x.o
 obj-$(CONFIG_PINCTRL_RT3883)   += pinctrl-rt3883.o
diff --git a/drivers/pinctrl/ralink/pinctrl-rt288x.c b/drivers/pinctrl/ralink/pinctrl-rt288x.c
new file mode 100644
index 000000000000..0744aebbace5
--- /dev/null
+++ b/drivers/pinctrl/ralink/pinctrl-rt288x.c
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/bitops.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include "pinmux.h"
+
+#define RT2880_GPIO_MODE_I2C		BIT(0)
+#define RT2880_GPIO_MODE_UART0		BIT(1)
+#define RT2880_GPIO_MODE_SPI		BIT(2)
+#define RT2880_GPIO_MODE_UART1		BIT(3)
+#define RT2880_GPIO_MODE_JTAG		BIT(4)
+#define RT2880_GPIO_MODE_MDIO		BIT(5)
+#define RT2880_GPIO_MODE_SDRAM		BIT(6)
+#define RT2880_GPIO_MODE_PCI		BIT(7)
+
+static struct rt2880_pmx_func i2c_func[] = { FUNC("i2c", 0, 1, 2) };
+static struct rt2880_pmx_func spi_func[] = { FUNC("spi", 0, 3, 4) };
+static struct rt2880_pmx_func uartlite_func[] = { FUNC("uartlite", 0, 7, 8) };
+static struct rt2880_pmx_func jtag_func[] = { FUNC("jtag", 0, 17, 5) };
+static struct rt2880_pmx_func mdio_func[] = { FUNC("mdio", 0, 22, 2) };
+static struct rt2880_pmx_func sdram_func[] = { FUNC("sdram", 0, 24, 16) };
+static struct rt2880_pmx_func pci_func[] = { FUNC("pci", 0, 40, 32) };
+
+static struct rt2880_pmx_group rt2880_pinmux_data_act[] = {
+	GRP("i2c", i2c_func, 1, RT2880_GPIO_MODE_I2C),
+	GRP("spi", spi_func, 1, RT2880_GPIO_MODE_SPI),
+	GRP("uartlite", uartlite_func, 1, RT2880_GPIO_MODE_UART0),
+	GRP("jtag", jtag_func, 1, RT2880_GPIO_MODE_JTAG),
+	GRP("mdio", mdio_func, 1, RT2880_GPIO_MODE_MDIO),
+	GRP("sdram", sdram_func, 1, RT2880_GPIO_MODE_SDRAM),
+	GRP("pci", pci_func, 1, RT2880_GPIO_MODE_PCI),
+	{ 0 }
+};
+
+static int rt288x_pinmux_probe(struct platform_device *pdev)
+{
+	return rt2880_pinmux_init(pdev, rt2880_pinmux_data_act);
+}
+
+static const struct of_device_id rt288x_pinmux_match[] = {
+	{ .compatible = "ralink,rt2880-pinmux" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, rt288x_pinmux_match);
+
+static struct platform_driver rt288x_pinmux_driver = {
+	.probe = rt288x_pinmux_probe,
+	.driver = {
+		.name = "rt2880-pinmux",
+		.of_match_table = rt288x_pinmux_match,
+	},
+};
+
+static int __init rt288x_pinmux_init(void)
+{
+	return platform_driver_register(&rt288x_pinmux_driver);
+}
+core_initcall_sync(rt288x_pinmux_init);
-- 
2.25.1

