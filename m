Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CFBA39B866
	for <lists+linux-mips@lfdr.de>; Fri,  4 Jun 2021 13:53:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230305AbhFDLzG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 4 Jun 2021 07:55:06 -0400
Received: from mail-wm1-f46.google.com ([209.85.128.46]:53154 "EHLO
        mail-wm1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230300AbhFDLzG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 4 Jun 2021 07:55:06 -0400
Received: by mail-wm1-f46.google.com with SMTP id f17so5210503wmf.2;
        Fri, 04 Jun 2021 04:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IFkFZkUEu8pyfmElOSW0LNkJkb9AwGYnZod3dF9RUZA=;
        b=VFs6VVQEwxaV72eFc/7Yd+SN5Vx3VqIMOhPcU1YHG3PwUfWT1fikGPakgkTT6LZWpp
         uZSWxVPKcNVOSGKitgF+njSLldoa1/STR8S1Y/ewxnXUE0Fu7SO6uAJ1dFxr6V5rkTLK
         GQ8keo8x/kKOTRpvjBNGbbFj3K3xQzRb6M45HZV+SATuj22DefGSCgGYTw5bEpqIX3gW
         oHPAFQua5W31PHBvE7rHgYxEcLLXNkn92jOqFQX+C8gOluflEITmo+yWLRAjgsEX0DTR
         qkY8IYR+GbPmdRuL65AGLXcLe0dJXcb3w8e2FztDkjIgGLdfqfOlHyrbooSzLFYV9luz
         o6yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IFkFZkUEu8pyfmElOSW0LNkJkb9AwGYnZod3dF9RUZA=;
        b=dLBJZZz8nhNii1mwGDPn7lWZy3mjDUSCCBK1UZLjmBAa25TZ08QrSl80yHliXWJn0j
         t6mZk2ORM9ht8PM0dvZYKqOI0tipXhIEIHyqlqcg1kN1yRKWZ3pi2HkLW//xz7UNeolB
         W6xeGm0L64zK0e9FU1mBIcgM9oS1XHlNnn3hsJfeFK2ebT1tcTm7TsnnE5BvF6QyT3D/
         e8nt9jIM83kbZ8H/eZoUE6tJTGJCi3qp5AzCdx5qOWWDJvsMMhlyWsGB3pgP59FdR9j8
         qZ2Cy2hjjr6GBlB9lyZCdxaEYk0GJKKLJ/cj0AZf/N6HD1VUvXRjXI1CZDR1mhEC/y6u
         lfmQ==
X-Gm-Message-State: AOAM530PNdb1nhz9b10PDhTTVdfVg1YnMxiYLkUq20BNFKBuOMxAsyZV
        2VqjAOplnDpQXAM3LFg3/v1aWu5vtTdsSQ==
X-Google-Smtp-Source: ABdhPJyWEukUTZm93KgnHtIegIsQ9XsuyDLECPOmv6AmlQCJYurXj4Bi2a94xpxpJ8wiZ5/gD07OMA==
X-Received: by 2002:a05:600c:4285:: with SMTP id v5mr3300821wmc.184.1622807523930;
        Fri, 04 Jun 2021 04:52:03 -0700 (PDT)
Received: from localhost.localdomain (113.red-88-4-247.dynamicip.rima-tde.net. [88.4.247.113])
        by smtp.gmail.com with ESMTPSA id v10sm6924530wre.33.2021.06.04.04.52.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Jun 2021 04:52:03 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     john@phrozen.org
Cc:     linus.walleij@linaro.org, tsbogend@alpha.franken.de,
        linux-gpio@vger.kernel.org, linux-mips@vger.kernel.org,
        ilya.lipnitskiy@gmail.com, neil@brown.name
Subject: [PATCH 3/6] pinctrl: ralink: move RT3883 SoC pinmux config into a new 'pinctrl-rt3883.c' file
Date:   Fri,  4 Jun 2021 13:51:56 +0200
Message-Id: <20210604115159.8834-4-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210604115159.8834-1-sergio.paracuellos@gmail.com>
References: <20210604115159.8834-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Move all related code for SoC RT3883 into a new driver located
in 'pinctrl-rt3883.c' source file

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 arch/mips/include/asm/mach-ralink/rt3883.h |  34 -------
 arch/mips/ralink/rt3883.c                  |  45 ---------
 drivers/pinctrl/ralink/Kconfig             |   5 +
 drivers/pinctrl/ralink/Makefile            |   1 +
 drivers/pinctrl/ralink/pinctrl-rt3883.c    | 107 +++++++++++++++++++++
 5 files changed, 113 insertions(+), 79 deletions(-)
 create mode 100644 drivers/pinctrl/ralink/pinctrl-rt3883.c

diff --git a/arch/mips/include/asm/mach-ralink/rt3883.h b/arch/mips/include/asm/mach-ralink/rt3883.h
index 565f2548496a..f250de9c055b 100644
--- a/arch/mips/include/asm/mach-ralink/rt3883.h
+++ b/arch/mips/include/asm/mach-ralink/rt3883.h
@@ -109,40 +109,6 @@
 #define RT3883_CLKCFG1_PCI_CLK_EN	BIT(19)
 #define RT3883_CLKCFG1_UPHY0_CLK_EN	BIT(18)
 
-#define RT3883_GPIO_MODE_UART0_SHIFT	2
-#define RT3883_GPIO_MODE_UART0_MASK	0x7
-#define RT3883_GPIO_MODE_UART0(x)	((x) << RT3883_GPIO_MODE_UART0_SHIFT)
-#define RT3883_GPIO_MODE_UARTF		0x0
-#define RT3883_GPIO_MODE_PCM_UARTF	0x1
-#define RT3883_GPIO_MODE_PCM_I2S	0x2
-#define RT3883_GPIO_MODE_I2S_UARTF	0x3
-#define RT3883_GPIO_MODE_PCM_GPIO	0x4
-#define RT3883_GPIO_MODE_GPIO_UARTF	0x5
-#define RT3883_GPIO_MODE_GPIO_I2S	0x6
-#define RT3883_GPIO_MODE_GPIO		0x7
-
-#define RT3883_GPIO_MODE_I2C		0
-#define RT3883_GPIO_MODE_SPI		1
-#define RT3883_GPIO_MODE_UART1		5
-#define RT3883_GPIO_MODE_JTAG		6
-#define RT3883_GPIO_MODE_MDIO		7
-#define RT3883_GPIO_MODE_GE1		9
-#define RT3883_GPIO_MODE_GE2		10
-
-#define RT3883_GPIO_MODE_PCI_SHIFT	11
-#define RT3883_GPIO_MODE_PCI_MASK	0x7
-#define RT3883_GPIO_MODE_PCI		(RT3883_GPIO_MODE_PCI_MASK << RT3883_GPIO_MODE_PCI_SHIFT)
-#define RT3883_GPIO_MODE_LNA_A_SHIFT	16
-#define RT3883_GPIO_MODE_LNA_A_MASK	0x3
-#define _RT3883_GPIO_MODE_LNA_A(_x)	((_x) << RT3883_GPIO_MODE_LNA_A_SHIFT)
-#define RT3883_GPIO_MODE_LNA_A_GPIO	0x3
-#define RT3883_GPIO_MODE_LNA_A		_RT3883_GPIO_MODE_LNA_A(RT3883_GPIO_MODE_LNA_A_MASK)
-#define RT3883_GPIO_MODE_LNA_G_SHIFT	18
-#define RT3883_GPIO_MODE_LNA_G_MASK	0x3
-#define _RT3883_GPIO_MODE_LNA_G(_x)	((_x) << RT3883_GPIO_MODE_LNA_G_SHIFT)
-#define RT3883_GPIO_MODE_LNA_G_GPIO	0x3
-#define RT3883_GPIO_MODE_LNA_G		_RT3883_GPIO_MODE_LNA_G(RT3883_GPIO_MODE_LNA_G_MASK)
-
 #define RT3883_GPIO_I2C_SD		1
 #define RT3883_GPIO_I2C_SCLK		2
 #define RT3883_GPIO_SPI_CS0		3
diff --git a/arch/mips/ralink/rt3883.c b/arch/mips/ralink/rt3883.c
index ff91f3531ad0..d9875f146d66 100644
--- a/arch/mips/ralink/rt3883.c
+++ b/arch/mips/ralink/rt3883.c
@@ -14,52 +14,9 @@
 #include <asm/mipsregs.h>
 #include <asm/mach-ralink/ralink_regs.h>
 #include <asm/mach-ralink/rt3883.h>
-#include <asm/mach-ralink/pinmux.h>
 
 #include "common.h"
 
-static struct rt2880_pmx_func i2c_func[] =  { FUNC("i2c", 0, 1, 2) };
-static struct rt2880_pmx_func spi_func[] = { FUNC("spi", 0, 3, 4) };
-static struct rt2880_pmx_func uartf_func[] = {
-	FUNC("uartf", RT3883_GPIO_MODE_UARTF, 7, 8),
-	FUNC("pcm uartf", RT3883_GPIO_MODE_PCM_UARTF, 7, 8),
-	FUNC("pcm i2s", RT3883_GPIO_MODE_PCM_I2S, 7, 8),
-	FUNC("i2s uartf", RT3883_GPIO_MODE_I2S_UARTF, 7, 8),
-	FUNC("pcm gpio", RT3883_GPIO_MODE_PCM_GPIO, 11, 4),
-	FUNC("gpio uartf", RT3883_GPIO_MODE_GPIO_UARTF, 7, 4),
-	FUNC("gpio i2s", RT3883_GPIO_MODE_GPIO_I2S, 7, 4),
-};
-static struct rt2880_pmx_func uartlite_func[] = { FUNC("uartlite", 0, 15, 2) };
-static struct rt2880_pmx_func jtag_func[] = { FUNC("jtag", 0, 17, 5) };
-static struct rt2880_pmx_func mdio_func[] = { FUNC("mdio", 0, 22, 2) };
-static struct rt2880_pmx_func lna_a_func[] = { FUNC("lna a", 0, 32, 3) };
-static struct rt2880_pmx_func lna_g_func[] = { FUNC("lna g", 0, 35, 3) };
-static struct rt2880_pmx_func pci_func[] = {
-	FUNC("pci-dev", 0, 40, 32),
-	FUNC("pci-host2", 1, 40, 32),
-	FUNC("pci-host1", 2, 40, 32),
-	FUNC("pci-fnc", 3, 40, 32)
-};
-static struct rt2880_pmx_func ge1_func[] = { FUNC("ge1", 0, 72, 12) };
-static struct rt2880_pmx_func ge2_func[] = { FUNC("ge2", 0, 84, 12) };
-
-static struct rt2880_pmx_group rt3883_pinmux_data[] = {
-	GRP("i2c", i2c_func, 1, RT3883_GPIO_MODE_I2C),
-	GRP("spi", spi_func, 1, RT3883_GPIO_MODE_SPI),
-	GRP("uartf", uartf_func, RT3883_GPIO_MODE_UART0_MASK,
-		RT3883_GPIO_MODE_UART0_SHIFT),
-	GRP("uartlite", uartlite_func, 1, RT3883_GPIO_MODE_UART1),
-	GRP("jtag", jtag_func, 1, RT3883_GPIO_MODE_JTAG),
-	GRP("mdio", mdio_func, 1, RT3883_GPIO_MODE_MDIO),
-	GRP("lna a", lna_a_func, 1, RT3883_GPIO_MODE_LNA_A),
-	GRP("lna g", lna_g_func, 1, RT3883_GPIO_MODE_LNA_G),
-	GRP("pci", pci_func, RT3883_GPIO_MODE_PCI_MASK,
-		RT3883_GPIO_MODE_PCI_SHIFT),
-	GRP("ge1", ge1_func, 1, RT3883_GPIO_MODE_GE1),
-	GRP("ge2", ge2_func, 1, RT3883_GPIO_MODE_GE2),
-	{ 0 }
-};
-
 void __init ralink_clk_init(void)
 {
 	unsigned long cpu_rate, sys_rate;
@@ -142,7 +99,5 @@ void __init prom_soc_init(struct ralink_soc_info *soc_info)
 	soc_info->mem_size_min = RT3883_MEM_SIZE_MIN;
 	soc_info->mem_size_max = RT3883_MEM_SIZE_MAX;
 
-	rt2880_pinmux_data = rt3883_pinmux_data;
-
 	ralink_soc = RT3883_SOC;
 }
diff --git a/drivers/pinctrl/ralink/Kconfig b/drivers/pinctrl/ralink/Kconfig
index ef8990a4c1eb..6f5fb3dc0a41 100644
--- a/drivers/pinctrl/ralink/Kconfig
+++ b/drivers/pinctrl/ralink/Kconfig
@@ -16,4 +16,9 @@ config PINCTRL_MT7621
         depends on RALINK && SOC_MT7621
         select PINCTRL_RT2880
 
+config PINCTRL_RT3883
+        bool "RT3883 pinctrl driver for RALINK/Mediatek SOCs"
+        depends on RALINK && SOC_RT3883
+        select PINCTRL_RT2880
+
 endmenu
diff --git a/drivers/pinctrl/ralink/Makefile b/drivers/pinctrl/ralink/Makefile
index 470855290ff6..86d6f8253afa 100644
--- a/drivers/pinctrl/ralink/Makefile
+++ b/drivers/pinctrl/ralink/Makefile
@@ -2,3 +2,4 @@
 obj-$(CONFIG_PINCTRL_RT2880)   += pinctrl-rt2880.o
 
 obj-$(CONFIG_PINCTRL_MT7621)   += pinctrl-mt7621.o
+obj-$(CONFIG_PINCTRL_RT3883)   += pinctrl-rt3883.o
diff --git a/drivers/pinctrl/ralink/pinctrl-rt3883.c b/drivers/pinctrl/ralink/pinctrl-rt3883.c
new file mode 100644
index 000000000000..3e0e1b4caa64
--- /dev/null
+++ b/drivers/pinctrl/ralink/pinctrl-rt3883.c
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include "pinmux.h"
+
+#define RT3883_GPIO_MODE_UART0_SHIFT	2
+#define RT3883_GPIO_MODE_UART0_MASK	0x7
+#define RT3883_GPIO_MODE_UART0(x)	((x) << RT3883_GPIO_MODE_UART0_SHIFT)
+#define RT3883_GPIO_MODE_UARTF		0x0
+#define RT3883_GPIO_MODE_PCM_UARTF	0x1
+#define RT3883_GPIO_MODE_PCM_I2S	0x2
+#define RT3883_GPIO_MODE_I2S_UARTF	0x3
+#define RT3883_GPIO_MODE_PCM_GPIO	0x4
+#define RT3883_GPIO_MODE_GPIO_UARTF	0x5
+#define RT3883_GPIO_MODE_GPIO_I2S	0x6
+#define RT3883_GPIO_MODE_GPIO		0x7
+
+#define RT3883_GPIO_MODE_I2C		0
+#define RT3883_GPIO_MODE_SPI		1
+#define RT3883_GPIO_MODE_UART1		5
+#define RT3883_GPIO_MODE_JTAG		6
+#define RT3883_GPIO_MODE_MDIO		7
+#define RT3883_GPIO_MODE_GE1		9
+#define RT3883_GPIO_MODE_GE2		10
+
+#define RT3883_GPIO_MODE_PCI_SHIFT	11
+#define RT3883_GPIO_MODE_PCI_MASK	0x7
+#define RT3883_GPIO_MODE_PCI		(RT3883_GPIO_MODE_PCI_MASK << RT3883_GPIO_MODE_PCI_SHIFT)
+#define RT3883_GPIO_MODE_LNA_A_SHIFT	16
+#define RT3883_GPIO_MODE_LNA_A_MASK	0x3
+#define _RT3883_GPIO_MODE_LNA_A(_x)	((_x) << RT3883_GPIO_MODE_LNA_A_SHIFT)
+#define RT3883_GPIO_MODE_LNA_A_GPIO	0x3
+#define RT3883_GPIO_MODE_LNA_A		_RT3883_GPIO_MODE_LNA_A(RT3883_GPIO_MODE_LNA_A_MASK)
+#define RT3883_GPIO_MODE_LNA_G_SHIFT	18
+#define RT3883_GPIO_MODE_LNA_G_MASK	0x3
+#define _RT3883_GPIO_MODE_LNA_G(_x)	((_x) << RT3883_GPIO_MODE_LNA_G_SHIFT)
+#define RT3883_GPIO_MODE_LNA_G_GPIO	0x3
+#define RT3883_GPIO_MODE_LNA_G		_RT3883_GPIO_MODE_LNA_G(RT3883_GPIO_MODE_LNA_G_MASK)
+
+static struct rt2880_pmx_func i2c_func[] =  { FUNC("i2c", 0, 1, 2) };
+static struct rt2880_pmx_func spi_func[] = { FUNC("spi", 0, 3, 4) };
+static struct rt2880_pmx_func uartf_func[] = {
+	FUNC("uartf", RT3883_GPIO_MODE_UARTF, 7, 8),
+	FUNC("pcm uartf", RT3883_GPIO_MODE_PCM_UARTF, 7, 8),
+	FUNC("pcm i2s", RT3883_GPIO_MODE_PCM_I2S, 7, 8),
+	FUNC("i2s uartf", RT3883_GPIO_MODE_I2S_UARTF, 7, 8),
+	FUNC("pcm gpio", RT3883_GPIO_MODE_PCM_GPIO, 11, 4),
+	FUNC("gpio uartf", RT3883_GPIO_MODE_GPIO_UARTF, 7, 4),
+	FUNC("gpio i2s", RT3883_GPIO_MODE_GPIO_I2S, 7, 4),
+};
+static struct rt2880_pmx_func uartlite_func[] = { FUNC("uartlite", 0, 15, 2) };
+static struct rt2880_pmx_func jtag_func[] = { FUNC("jtag", 0, 17, 5) };
+static struct rt2880_pmx_func mdio_func[] = { FUNC("mdio", 0, 22, 2) };
+static struct rt2880_pmx_func lna_a_func[] = { FUNC("lna a", 0, 32, 3) };
+static struct rt2880_pmx_func lna_g_func[] = { FUNC("lna g", 0, 35, 3) };
+static struct rt2880_pmx_func pci_func[] = {
+	FUNC("pci-dev", 0, 40, 32),
+	FUNC("pci-host2", 1, 40, 32),
+	FUNC("pci-host1", 2, 40, 32),
+	FUNC("pci-fnc", 3, 40, 32)
+};
+static struct rt2880_pmx_func ge1_func[] = { FUNC("ge1", 0, 72, 12) };
+static struct rt2880_pmx_func ge2_func[] = { FUNC("ge2", 0, 84, 12) };
+
+static struct rt2880_pmx_group rt3883_pinmux_data[] = {
+	GRP("i2c", i2c_func, 1, RT3883_GPIO_MODE_I2C),
+	GRP("spi", spi_func, 1, RT3883_GPIO_MODE_SPI),
+	GRP("uartf", uartf_func, RT3883_GPIO_MODE_UART0_MASK,
+		RT3883_GPIO_MODE_UART0_SHIFT),
+	GRP("uartlite", uartlite_func, 1, RT3883_GPIO_MODE_UART1),
+	GRP("jtag", jtag_func, 1, RT3883_GPIO_MODE_JTAG),
+	GRP("mdio", mdio_func, 1, RT3883_GPIO_MODE_MDIO),
+	GRP("lna a", lna_a_func, 1, RT3883_GPIO_MODE_LNA_A),
+	GRP("lna g", lna_g_func, 1, RT3883_GPIO_MODE_LNA_G),
+	GRP("pci", pci_func, RT3883_GPIO_MODE_PCI_MASK,
+		RT3883_GPIO_MODE_PCI_SHIFT),
+	GRP("ge1", ge1_func, 1, RT3883_GPIO_MODE_GE1),
+	GRP("ge2", ge2_func, 1, RT3883_GPIO_MODE_GE2),
+	{ 0 }
+};
+
+static int rt3883_pinmux_probe(struct platform_device *pdev)
+{
+	return rt2880_pinmux_init(pdev, rt3883_pinmux_data);
+}
+
+static const struct of_device_id rt3883_pinmux_match[] = {
+	{ .compatible = "ralink,rt2880-pinmux" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, rt3883_pinmux_match);
+
+static struct platform_driver rt3883_pinmux_driver = {
+	.probe = rt3883_pinmux_probe,
+	.driver = {
+		.name = "rt2880-pinmux",
+		.of_match_table = rt3883_pinmux_match,
+	},
+};
+
+static int __init rt3883_pinmux_init(void)
+{
+	return platform_driver_register(&rt3883_pinmux_driver);
+}
+core_initcall_sync(rt3883_pinmux_init);
-- 
2.25.1

