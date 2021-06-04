Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC9FB39B84E
	for <lists+linux-mips@lfdr.de>; Fri,  4 Jun 2021 13:52:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230246AbhFDLxw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 4 Jun 2021 07:53:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229682AbhFDLxw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 4 Jun 2021 07:53:52 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 373B2C061763;
        Fri,  4 Jun 2021 04:52:06 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id n17-20020a7bc5d10000b0290169edfadac9so7753838wmk.1;
        Fri, 04 Jun 2021 04:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SmBykUAHwb33q76FE7n++M2GRAkAkX9TUwvnlibu7Iw=;
        b=YSMG48WwtX2vDWePRoDbCk2CCd731DZb70MW0oN/qziN+qPo8b9azlOVn4+71e0wD0
         N5JEifHlQZh/XL76RZbwpatAI1T95O8VtTNik9jdO/WqbtSmZAkBcU+bcxFv2Pt7MS66
         VhPSzvtW9yUfSvtmDmG/qekzOvjxpLXFBnJoM1qRxE8bW4wn/QN0nINVMgJugmmeTomA
         TYUDjjDn3wt956bhlhU3YqrGYjCX99ttDIho4d/tn1g03F54BpUzGesFtL8NCIrbjkS0
         Kmn62TlzLgA1yJJFJjiHm9Ql1Wpypsrje2YyRbnYGH1/SN4lkwVEsoD6xxizDF7GtKL3
         mMhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SmBykUAHwb33q76FE7n++M2GRAkAkX9TUwvnlibu7Iw=;
        b=jP+7SGZbVQtL3Iv62fHbFj2tA91XtO1yvWmoGH3ZEcJFV79thNzmW4jpaphM030U+b
         2CUCl0UU9qo2qFCjnUiousmyShqqv7pHJ6f4EkcDtBuDbbzwjt1ziMyiRyrqiAIj0NPG
         AyiPpPqsve9sx1eKPenVfg4Tda6QnsQRJLifyMyRUqoyBcVPfeQYYLEhzAqc73c5BPWE
         KXGoJYu4R+fK48brwqg+Tl4p7XiI1V8bbGLrRaR70XvwcUYykkL37U16ElSzfeZ60bBh
         3tQHx3tf8/UX1fjKAK7Q3marjNurZUZPmqqElUQ4GRQLpcQqNVVmqy5vwLDRJllKP1hx
         74/g==
X-Gm-Message-State: AOAM532n9NKBXUpWk6Ilj1fwtHjO2srjm+DMr5bIsJ1+0MEADl/Ix88M
        vZ5oKecpDv4Grx2cOKHuFVg=
X-Google-Smtp-Source: ABdhPJzzuK8vWp/xkgFJgfGk3MgPEqqFKmSS/GNSDsxbcvJPCh+wEgYd5rJ7ItyDrCnrxbg3MxuyXQ==
X-Received: by 2002:a05:600c:2199:: with SMTP id e25mr3270247wme.140.1622807524849;
        Fri, 04 Jun 2021 04:52:04 -0700 (PDT)
Received: from localhost.localdomain (113.red-88-4-247.dynamicip.rima-tde.net. [88.4.247.113])
        by smtp.gmail.com with ESMTPSA id v10sm6924530wre.33.2021.06.04.04.52.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Jun 2021 04:52:04 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     john@phrozen.org
Cc:     linus.walleij@linaro.org, tsbogend@alpha.franken.de,
        linux-gpio@vger.kernel.org, linux-mips@vger.kernel.org,
        ilya.lipnitskiy@gmail.com, neil@brown.name
Subject: [PATCH 4/6] pinctrl: ralink: move RT305X SoC pinmux config into a new 'pinctrl-rt305x.c' file
Date:   Fri,  4 Jun 2021 13:51:57 +0200
Message-Id: <20210604115159.8834-5-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210604115159.8834-1-sergio.paracuellos@gmail.com>
References: <20210604115159.8834-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Move all related code for SoC RT305X into a new driver located
in 'pinctrl-rt305x.c' source file.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 arch/mips/include/asm/mach-ralink/rt305x.h |  24 ----
 arch/mips/ralink/rt305x.c                  |  77 ------------
 drivers/pinctrl/ralink/Kconfig             |   5 +
 drivers/pinctrl/ralink/Makefile            |   1 +
 drivers/pinctrl/ralink/pinctrl-rt305x.c    | 136 +++++++++++++++++++++
 5 files changed, 142 insertions(+), 101 deletions(-)
 create mode 100644 drivers/pinctrl/ralink/pinctrl-rt305x.c

diff --git a/arch/mips/include/asm/mach-ralink/rt305x.h b/arch/mips/include/asm/mach-ralink/rt305x.h
index b54619dc4b88..4d8e8c8d83ce 100644
--- a/arch/mips/include/asm/mach-ralink/rt305x.h
+++ b/arch/mips/include/asm/mach-ralink/rt305x.h
@@ -114,30 +114,6 @@ static inline int soc_is_rt5350(void)
 #define RT305X_GPIO_GE0_TXD0		40
 #define RT305X_GPIO_GE0_RXCLK		51
 
-#define RT305X_GPIO_MODE_UART0_SHIFT	2
-#define RT305X_GPIO_MODE_UART0_MASK	0x7
-#define RT305X_GPIO_MODE_UART0(x)	((x) << RT305X_GPIO_MODE_UART0_SHIFT)
-#define RT305X_GPIO_MODE_UARTF		0
-#define RT305X_GPIO_MODE_PCM_UARTF	1
-#define RT305X_GPIO_MODE_PCM_I2S	2
-#define RT305X_GPIO_MODE_I2S_UARTF	3
-#define RT305X_GPIO_MODE_PCM_GPIO	4
-#define RT305X_GPIO_MODE_GPIO_UARTF	5
-#define RT305X_GPIO_MODE_GPIO_I2S	6
-#define RT305X_GPIO_MODE_GPIO		7
-
-#define RT305X_GPIO_MODE_I2C		0
-#define RT305X_GPIO_MODE_SPI		1
-#define RT305X_GPIO_MODE_UART1		5
-#define RT305X_GPIO_MODE_JTAG		6
-#define RT305X_GPIO_MODE_MDIO		7
-#define RT305X_GPIO_MODE_SDRAM		8
-#define RT305X_GPIO_MODE_RGMII		9
-#define RT5350_GPIO_MODE_PHY_LED	14
-#define RT5350_GPIO_MODE_SPI_CS1	21
-#define RT3352_GPIO_MODE_LNA		18
-#define RT3352_GPIO_MODE_PA		20
-
 #define RT3352_SYSC_REG_SYSCFG0		0x010
 #define RT3352_SYSC_REG_SYSCFG1         0x014
 #define RT3352_SYSC_REG_CLKCFG1         0x030
diff --git a/arch/mips/ralink/rt305x.c b/arch/mips/ralink/rt305x.c
index c5b63c142705..8b095a9dcb15 100644
--- a/arch/mips/ralink/rt305x.c
+++ b/arch/mips/ralink/rt305x.c
@@ -16,83 +16,9 @@
 #include <asm/mipsregs.h>
 #include <asm/mach-ralink/ralink_regs.h>
 #include <asm/mach-ralink/rt305x.h>
-#include <asm/mach-ralink/pinmux.h>
 
 #include "common.h"
 
-static struct rt2880_pmx_func i2c_func[] =  { FUNC("i2c", 0, 1, 2) };
-static struct rt2880_pmx_func spi_func[] = { FUNC("spi", 0, 3, 4) };
-static struct rt2880_pmx_func uartf_func[] = {
-	FUNC("uartf", RT305X_GPIO_MODE_UARTF, 7, 8),
-	FUNC("pcm uartf", RT305X_GPIO_MODE_PCM_UARTF, 7, 8),
-	FUNC("pcm i2s", RT305X_GPIO_MODE_PCM_I2S, 7, 8),
-	FUNC("i2s uartf", RT305X_GPIO_MODE_I2S_UARTF, 7, 8),
-	FUNC("pcm gpio", RT305X_GPIO_MODE_PCM_GPIO, 11, 4),
-	FUNC("gpio uartf", RT305X_GPIO_MODE_GPIO_UARTF, 7, 4),
-	FUNC("gpio i2s", RT305X_GPIO_MODE_GPIO_I2S, 7, 4),
-};
-static struct rt2880_pmx_func uartlite_func[] = { FUNC("uartlite", 0, 15, 2) };
-static struct rt2880_pmx_func jtag_func[] = { FUNC("jtag", 0, 17, 5) };
-static struct rt2880_pmx_func mdio_func[] = { FUNC("mdio", 0, 22, 2) };
-static struct rt2880_pmx_func rt5350_led_func[] = { FUNC("led", 0, 22, 5) };
-static struct rt2880_pmx_func rt5350_cs1_func[] = {
-	FUNC("spi_cs1", 0, 27, 1),
-	FUNC("wdg_cs1", 1, 27, 1),
-};
-static struct rt2880_pmx_func sdram_func[] = { FUNC("sdram", 0, 24, 16) };
-static struct rt2880_pmx_func rt3352_rgmii_func[] = {
-	FUNC("rgmii", 0, 24, 12)
-};
-static struct rt2880_pmx_func rgmii_func[] = { FUNC("rgmii", 0, 40, 12) };
-static struct rt2880_pmx_func rt3352_lna_func[] = { FUNC("lna", 0, 36, 2) };
-static struct rt2880_pmx_func rt3352_pa_func[] = { FUNC("pa", 0, 38, 2) };
-static struct rt2880_pmx_func rt3352_led_func[] = { FUNC("led", 0, 40, 5) };
-static struct rt2880_pmx_func rt3352_cs1_func[] = {
-	FUNC("spi_cs1", 0, 45, 1),
-	FUNC("wdg_cs1", 1, 45, 1),
-};
-
-static struct rt2880_pmx_group rt3050_pinmux_data[] = {
-	GRP("i2c", i2c_func, 1, RT305X_GPIO_MODE_I2C),
-	GRP("spi", spi_func, 1, RT305X_GPIO_MODE_SPI),
-	GRP("uartf", uartf_func, RT305X_GPIO_MODE_UART0_MASK,
-		RT305X_GPIO_MODE_UART0_SHIFT),
-	GRP("uartlite", uartlite_func, 1, RT305X_GPIO_MODE_UART1),
-	GRP("jtag", jtag_func, 1, RT305X_GPIO_MODE_JTAG),
-	GRP("mdio", mdio_func, 1, RT305X_GPIO_MODE_MDIO),
-	GRP("rgmii", rgmii_func, 1, RT305X_GPIO_MODE_RGMII),
-	GRP("sdram", sdram_func, 1, RT305X_GPIO_MODE_SDRAM),
-	{ 0 }
-};
-
-static struct rt2880_pmx_group rt3352_pinmux_data[] = {
-	GRP("i2c", i2c_func, 1, RT305X_GPIO_MODE_I2C),
-	GRP("spi", spi_func, 1, RT305X_GPIO_MODE_SPI),
-	GRP("uartf", uartf_func, RT305X_GPIO_MODE_UART0_MASK,
-		RT305X_GPIO_MODE_UART0_SHIFT),
-	GRP("uartlite", uartlite_func, 1, RT305X_GPIO_MODE_UART1),
-	GRP("jtag", jtag_func, 1, RT305X_GPIO_MODE_JTAG),
-	GRP("mdio", mdio_func, 1, RT305X_GPIO_MODE_MDIO),
-	GRP("rgmii", rt3352_rgmii_func, 1, RT305X_GPIO_MODE_RGMII),
-	GRP("lna", rt3352_lna_func, 1, RT3352_GPIO_MODE_LNA),
-	GRP("pa", rt3352_pa_func, 1, RT3352_GPIO_MODE_PA),
-	GRP("led", rt3352_led_func, 1, RT5350_GPIO_MODE_PHY_LED),
-	GRP("spi_cs1", rt3352_cs1_func, 2, RT5350_GPIO_MODE_SPI_CS1),
-	{ 0 }
-};
-
-static struct rt2880_pmx_group rt5350_pinmux_data[] = {
-	GRP("i2c", i2c_func, 1, RT305X_GPIO_MODE_I2C),
-	GRP("spi", spi_func, 1, RT305X_GPIO_MODE_SPI),
-	GRP("uartf", uartf_func, RT305X_GPIO_MODE_UART0_MASK,
-		RT305X_GPIO_MODE_UART0_SHIFT),
-	GRP("uartlite", uartlite_func, 1, RT305X_GPIO_MODE_UART1),
-	GRP("jtag", jtag_func, 1, RT305X_GPIO_MODE_JTAG),
-	GRP("led", rt5350_led_func, 1, RT5350_GPIO_MODE_PHY_LED),
-	GRP("spi_cs1", rt5350_cs1_func, 2, RT5350_GPIO_MODE_SPI_CS1),
-	{ 0 }
-};
-
 static unsigned long rt5350_get_mem_size(void)
 {
 	void __iomem *sysc = (void __iomem *) KSEG1ADDR(RT305X_SYSC_BASE);
@@ -265,14 +191,11 @@ void __init prom_soc_init(struct ralink_soc_info *soc_info)
 	soc_info->mem_base = RT305X_SDRAM_BASE;
 	if (soc_is_rt5350()) {
 		soc_info->mem_size = rt5350_get_mem_size();
-		rt2880_pinmux_data = rt5350_pinmux_data;
 	} else if (soc_is_rt305x() || soc_is_rt3350()) {
 		soc_info->mem_size_min = RT305X_MEM_SIZE_MIN;
 		soc_info->mem_size_max = RT305X_MEM_SIZE_MAX;
-		rt2880_pinmux_data = rt3050_pinmux_data;
 	} else if (soc_is_rt3352()) {
 		soc_info->mem_size_min = RT3352_MEM_SIZE_MIN;
 		soc_info->mem_size_max = RT3352_MEM_SIZE_MAX;
-		rt2880_pinmux_data = rt3352_pinmux_data;
 	}
 }
diff --git a/drivers/pinctrl/ralink/Kconfig b/drivers/pinctrl/ralink/Kconfig
index 6f5fb3dc0a41..705a63d34d3c 100644
--- a/drivers/pinctrl/ralink/Kconfig
+++ b/drivers/pinctrl/ralink/Kconfig
@@ -16,6 +16,11 @@ config PINCTRL_MT7621
         depends on RALINK && SOC_MT7621
         select PINCTRL_RT2880
 
+config PINCTRL_RT305X
+        bool "RT305X pinctrl driver for RALINK/Mediatek SOCs"
+        depends on RALINK && SOC_RT305X
+        select PINCTRL_RT2880
+
 config PINCTRL_RT3883
         bool "RT3883 pinctrl driver for RALINK/Mediatek SOCs"
         depends on RALINK && SOC_RT3883
diff --git a/drivers/pinctrl/ralink/Makefile b/drivers/pinctrl/ralink/Makefile
index 86d6f8253afa..119d30ecea98 100644
--- a/drivers/pinctrl/ralink/Makefile
+++ b/drivers/pinctrl/ralink/Makefile
@@ -2,4 +2,5 @@
 obj-$(CONFIG_PINCTRL_RT2880)   += pinctrl-rt2880.o
 
 obj-$(CONFIG_PINCTRL_MT7621)   += pinctrl-mt7621.o
+obj-$(CONFIG_PINCTRL_RT305X)   += pinctrl-rt305x.o
 obj-$(CONFIG_PINCTRL_RT3883)   += pinctrl-rt3883.o
diff --git a/drivers/pinctrl/ralink/pinctrl-rt305x.c b/drivers/pinctrl/ralink/pinctrl-rt305x.c
new file mode 100644
index 000000000000..699fe18e7000
--- /dev/null
+++ b/drivers/pinctrl/ralink/pinctrl-rt305x.c
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <asm/mach-ralink/rt305x.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include "pinmux.h"
+
+#define RT305X_GPIO_MODE_UART0_SHIFT	2
+#define RT305X_GPIO_MODE_UART0_MASK	0x7
+#define RT305X_GPIO_MODE_UART0(x)	((x) << RT305X_GPIO_MODE_UART0_SHIFT)
+#define RT305X_GPIO_MODE_UARTF		0
+#define RT305X_GPIO_MODE_PCM_UARTF	1
+#define RT305X_GPIO_MODE_PCM_I2S	2
+#define RT305X_GPIO_MODE_I2S_UARTF	3
+#define RT305X_GPIO_MODE_PCM_GPIO	4
+#define RT305X_GPIO_MODE_GPIO_UARTF	5
+#define RT305X_GPIO_MODE_GPIO_I2S	6
+#define RT305X_GPIO_MODE_GPIO		7
+
+#define RT305X_GPIO_MODE_I2C		0
+#define RT305X_GPIO_MODE_SPI		1
+#define RT305X_GPIO_MODE_UART1		5
+#define RT305X_GPIO_MODE_JTAG		6
+#define RT305X_GPIO_MODE_MDIO		7
+#define RT305X_GPIO_MODE_SDRAM		8
+#define RT305X_GPIO_MODE_RGMII		9
+#define RT5350_GPIO_MODE_PHY_LED	14
+#define RT5350_GPIO_MODE_SPI_CS1	21
+#define RT3352_GPIO_MODE_LNA		18
+#define RT3352_GPIO_MODE_PA		20
+
+static struct rt2880_pmx_func i2c_func[] =  { FUNC("i2c", 0, 1, 2) };
+static struct rt2880_pmx_func spi_func[] = { FUNC("spi", 0, 3, 4) };
+static struct rt2880_pmx_func uartf_func[] = {
+	FUNC("uartf", RT305X_GPIO_MODE_UARTF, 7, 8),
+	FUNC("pcm uartf", RT305X_GPIO_MODE_PCM_UARTF, 7, 8),
+	FUNC("pcm i2s", RT305X_GPIO_MODE_PCM_I2S, 7, 8),
+	FUNC("i2s uartf", RT305X_GPIO_MODE_I2S_UARTF, 7, 8),
+	FUNC("pcm gpio", RT305X_GPIO_MODE_PCM_GPIO, 11, 4),
+	FUNC("gpio uartf", RT305X_GPIO_MODE_GPIO_UARTF, 7, 4),
+	FUNC("gpio i2s", RT305X_GPIO_MODE_GPIO_I2S, 7, 4),
+};
+static struct rt2880_pmx_func uartlite_func[] = { FUNC("uartlite", 0, 15, 2) };
+static struct rt2880_pmx_func jtag_func[] = { FUNC("jtag", 0, 17, 5) };
+static struct rt2880_pmx_func mdio_func[] = { FUNC("mdio", 0, 22, 2) };
+static struct rt2880_pmx_func rt5350_led_func[] = { FUNC("led", 0, 22, 5) };
+static struct rt2880_pmx_func rt5350_cs1_func[] = {
+	FUNC("spi_cs1", 0, 27, 1),
+	FUNC("wdg_cs1", 1, 27, 1),
+};
+static struct rt2880_pmx_func sdram_func[] = { FUNC("sdram", 0, 24, 16) };
+static struct rt2880_pmx_func rt3352_rgmii_func[] = {
+	FUNC("rgmii", 0, 24, 12)
+};
+static struct rt2880_pmx_func rgmii_func[] = { FUNC("rgmii", 0, 40, 12) };
+static struct rt2880_pmx_func rt3352_lna_func[] = { FUNC("lna", 0, 36, 2) };
+static struct rt2880_pmx_func rt3352_pa_func[] = { FUNC("pa", 0, 38, 2) };
+static struct rt2880_pmx_func rt3352_led_func[] = { FUNC("led", 0, 40, 5) };
+static struct rt2880_pmx_func rt3352_cs1_func[] = {
+	FUNC("spi_cs1", 0, 45, 1),
+	FUNC("wdg_cs1", 1, 45, 1),
+};
+
+static struct rt2880_pmx_group rt3050_pinmux_data[] = {
+	GRP("i2c", i2c_func, 1, RT305X_GPIO_MODE_I2C),
+	GRP("spi", spi_func, 1, RT305X_GPIO_MODE_SPI),
+	GRP("uartf", uartf_func, RT305X_GPIO_MODE_UART0_MASK,
+		RT305X_GPIO_MODE_UART0_SHIFT),
+	GRP("uartlite", uartlite_func, 1, RT305X_GPIO_MODE_UART1),
+	GRP("jtag", jtag_func, 1, RT305X_GPIO_MODE_JTAG),
+	GRP("mdio", mdio_func, 1, RT305X_GPIO_MODE_MDIO),
+	GRP("rgmii", rgmii_func, 1, RT305X_GPIO_MODE_RGMII),
+	GRP("sdram", sdram_func, 1, RT305X_GPIO_MODE_SDRAM),
+	{ 0 }
+};
+
+static struct rt2880_pmx_group rt3352_pinmux_data[] = {
+	GRP("i2c", i2c_func, 1, RT305X_GPIO_MODE_I2C),
+	GRP("spi", spi_func, 1, RT305X_GPIO_MODE_SPI),
+	GRP("uartf", uartf_func, RT305X_GPIO_MODE_UART0_MASK,
+		RT305X_GPIO_MODE_UART0_SHIFT),
+	GRP("uartlite", uartlite_func, 1, RT305X_GPIO_MODE_UART1),
+	GRP("jtag", jtag_func, 1, RT305X_GPIO_MODE_JTAG),
+	GRP("mdio", mdio_func, 1, RT305X_GPIO_MODE_MDIO),
+	GRP("rgmii", rt3352_rgmii_func, 1, RT305X_GPIO_MODE_RGMII),
+	GRP("lna", rt3352_lna_func, 1, RT3352_GPIO_MODE_LNA),
+	GRP("pa", rt3352_pa_func, 1, RT3352_GPIO_MODE_PA),
+	GRP("led", rt3352_led_func, 1, RT5350_GPIO_MODE_PHY_LED),
+	GRP("spi_cs1", rt3352_cs1_func, 2, RT5350_GPIO_MODE_SPI_CS1),
+	{ 0 }
+};
+
+static struct rt2880_pmx_group rt5350_pinmux_data[] = {
+	GRP("i2c", i2c_func, 1, RT305X_GPIO_MODE_I2C),
+	GRP("spi", spi_func, 1, RT305X_GPIO_MODE_SPI),
+	GRP("uartf", uartf_func, RT305X_GPIO_MODE_UART0_MASK,
+		RT305X_GPIO_MODE_UART0_SHIFT),
+	GRP("uartlite", uartlite_func, 1, RT305X_GPIO_MODE_UART1),
+	GRP("jtag", jtag_func, 1, RT305X_GPIO_MODE_JTAG),
+	GRP("led", rt5350_led_func, 1, RT5350_GPIO_MODE_PHY_LED),
+	GRP("spi_cs1", rt5350_cs1_func, 2, RT5350_GPIO_MODE_SPI_CS1),
+	{ 0 }
+};
+
+static int rt305x_pinmux_probe(struct platform_device *pdev)
+{
+	if (soc_is_rt5350())
+		return rt2880_pinmux_init(pdev, rt5350_pinmux_data);
+	else if (soc_is_rt305x() || soc_is_rt3350())
+		return rt2880_pinmux_init(pdev, rt3050_pinmux_data);
+	else if (soc_is_rt3352())
+		return rt2880_pinmux_init(pdev, rt3352_pinmux_data);
+	else
+		return -EINVAL;
+}
+
+static const struct of_device_id rt305x_pinmux_match[] = {
+	{ .compatible = "ralink,rt2880-pinmux" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, rt305x_pinmux_match);
+
+static struct platform_driver rt305x_pinmux_driver = {
+	.probe = rt305x_pinmux_probe,
+	.driver = {
+		.name = "rt2880-pinmux",
+		.of_match_table = rt305x_pinmux_match,
+	},
+};
+
+static int __init rt305x_pinmux_init(void)
+{
+	return platform_driver_register(&rt305x_pinmux_driver);
+}
+core_initcall_sync(rt305x_pinmux_init);
-- 
2.25.1

