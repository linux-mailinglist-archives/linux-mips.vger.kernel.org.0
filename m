Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0BDA43D618
	for <lists+linux-mips@lfdr.de>; Wed, 27 Oct 2021 23:56:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229811AbhJ0V6a (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 Oct 2021 17:58:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbhJ0V63 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 27 Oct 2021 17:58:29 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78859C061570;
        Wed, 27 Oct 2021 14:56:03 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id l13so9154413lfg.6;
        Wed, 27 Oct 2021 14:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z2xk/yYNwT3cyP5MTokWZ18/2f0cF6Zs0eQ+JbtiC/I=;
        b=li32teQrKORxlW9POadHjR1uJqr331VYCWUBVkouYkgb/gTh7wQByxOMMcep/vbhkK
         0o5ZGnkxNVA2GfjYuDon9aXxHfMOP2NavJ4ouOYOgqWgKwAyylNfBUAJRxmU533fAkKS
         6io8VRbM7bRQTqoPG+nQplze9ybUSWnTVkr5ws36RIJD/16oTgKs4/h/YbXLlR0tuh1p
         p/cGxvEnNIvMgVdPkneTeWX6SUvdV9+c2nmLwK9Ox4C/twy76SSX2n6EpebHNYY22u/5
         sueQliVytPZFEmsmdMXRqmJ2OWsvl8zqixsLLateH1VmMus5XVpo4meqQVj4w+by8DTd
         grVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z2xk/yYNwT3cyP5MTokWZ18/2f0cF6Zs0eQ+JbtiC/I=;
        b=hYtdDOLQ6nDQngHo0zo0EWEWvpcdyqfa587KeQoMvKsdwzAGoAx+IiiAxEkKmiiqd/
         PEDBAq1f7zejPuzFOCW2tb3USN4H1Hf2uHXsXcebxMUjIhf3d7NoVNSoAL4zHQUwoL/L
         OQ2I2FL7PYm941NMrf/2eJ3p2cxJF6k/SjErb1wiA/WxLp85BZP+i9XUyaNrSJVy8cya
         FhwLdL/uVYiphn4mdORlYqmS+VphNbLmxNpAadXiNHXPIffSv4jBrOPp0zk+y/RyTHcP
         tfdu6LZKEzybc1HrvTGT5iah2THn71+H7xCM3pQBX+s79gF91kIQDFsKJotcAu0s1qOJ
         vn5w==
X-Gm-Message-State: AOAM530gR3Vti8+jce/2nzLH+KmMN+BDFcKwfBSsSo2aMNsjeL0yMN49
        AImKbqlxBb0cKsew6FEgC6Y=
X-Google-Smtp-Source: ABdhPJz93GVAocPdfrC1yAGHhyWtbF9sRWj1ADWKSAN8YjwzsdbMb4XCM5PdPO8OmuFHdaeVe3G+Zg==
X-Received: by 2002:ac2:4543:: with SMTP id j3mr238380lfm.391.1635371761841;
        Wed, 27 Oct 2021 14:56:01 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id g35sm110207lfv.248.2021.10.27.14.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 14:56:01 -0700 (PDT)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 3/3] watchdog: bcm63xx_wdt: support BCM4908
Date:   Wed, 27 Oct 2021 23:55:31 +0200
Message-Id: <20211027215531.9996-3-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211027215531.9996-1-zajec5@gmail.com>
References: <20211027215531.9996-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

So far bcm63xx_wdt included support for Broadcom's watchdog block of old
MIPS devices only. It was also a fully platform (non-DT) driver.

The same block was recently found on BCM4908 with just a slightly
different registers layout. Extend this driver to support OF and add
support for per-chipset registers offsets.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/watchdog/Kconfig       |  2 +-
 drivers/watchdog/bcm63xx_wdt.c | 63 ++++++++++++++++++++++++++++++----
 2 files changed, 57 insertions(+), 8 deletions(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 913cde027e92..58a2474cd929 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1711,7 +1711,7 @@ config OCTEON_WDT
 
 config BCM63XX_WDT
 	tristate "Broadcom BCM63xx hardware watchdog"
-	depends on BCM63XX || COMPILE_TEST
+	depends on ARCH_BCM4908 || BCM63XX || COMPILE_TEST
 	help
 	  Watchdog driver for the built in watchdog hardware in Broadcom
 	  BCM63xx SoC.
diff --git a/drivers/watchdog/bcm63xx_wdt.c b/drivers/watchdog/bcm63xx_wdt.c
index 1334e7fe77d8..df3c7dfea00f 100644
--- a/drivers/watchdog/bcm63xx_wdt.c
+++ b/drivers/watchdog/bcm63xx_wdt.c
@@ -18,6 +18,7 @@
 #include <linux/miscdevice.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
+#include <linux/of_device.h>
 #include <linux/types.h>
 #include <linux/uaccess.h>
 #include <linux/watchdog.h>
@@ -39,7 +40,13 @@
 #define WDT_DEFAULT_TIME	30      /* seconds */
 #define WDT_MAX_TIME		256     /* seconds */
 
+enum bcm63xx_wdt_soc {
+	BCM63XX_WDT_SOC_BCM4908,
+	BCM63XX_WDT_SOC_BCM63XX,
+};
+
 static struct {
+	enum bcm63xx_wdt_soc soc;
 	void __iomem *regs;
 	struct timer_list timer;
 	unsigned long inuse;
@@ -54,11 +61,41 @@ module_param(nowayout, bool, 0);
 MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
 	__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
 
-static void bcm63xx_wdt_write_reg(u32 reg, u32 val)
+static const struct of_device_id bcm63xx_wdt_id_table[] = {
+	{ .compatible = "brcm,bcm4908-wdt", .data = (const void *)BCM63XX_WDT_SOC_BCM4908, },
+	{},
+};
+
+enum bcm63xx_wdt_regs {
+	BCM63XX_WDT_REG_DEFVAL = 0,
+	BCM63XX_WDT_REG_CTL,
+	BCM63XX_WDT_REG_SOFTRESET,
+};
+
+static const u16 bcm63xx_wdt_regs_bcm4908[] = {
+	[BCM63XX_WDT_REG_DEFVAL]	= 0x28,
+	[BCM63XX_WDT_REG_CTL]		= 0x2c,
+	[BCM63XX_WDT_REG_SOFTRESET]	= 0x34,
+};
+
+static const u16 bcm63xx_wdt_regs_bcm63xx[] = {
+	[BCM63XX_WDT_REG_DEFVAL]	= WDT_DEFVAL_REG,
+	[BCM63XX_WDT_REG_CTL]		= WDT_CTL_REG,
+};
+
+static void bcm63xx_wdt_write_reg(enum bcm63xx_wdt_regs reg, u32 val)
 {
 	void __iomem *addr = bcm63xx_wdt_device.regs;
 
-	addr += reg;
+	switch (bcm63xx_wdt_device.soc) {
+	case BCM63XX_WDT_SOC_BCM4908:
+		addr += bcm63xx_wdt_regs_bcm4908[reg];
+		break;
+	case BCM63XX_WDT_SOC_BCM63XX:
+		addr += bcm63xx_wdt_regs_bcm63xx[reg];
+		break;
+	}
+
 #ifdef BCM63XX
 	bcm_writel(val, addr);
 #else
@@ -69,15 +106,15 @@ static void bcm63xx_wdt_write_reg(u32 reg, u32 val)
 /* HW functions */
 static void bcm63xx_wdt_hw_start(void)
 {
-	bcm63xx_wdt_write_reg(WDT_DEFVAL_REG, 0xfffffffe);
-	bcm63xx_wdt_write_reg(WDT_CTL_REG, WDT_START_1);
-	bcm63xx_wdt_write_reg(WDT_CTL_REG, WDT_START_2);
+	bcm63xx_wdt_write_reg(BCM63XX_WDT_REG_DEFVAL, 0xfffffffe);
+	bcm63xx_wdt_write_reg(BCM63XX_WDT_REG_CTL, WDT_START_1);
+	bcm63xx_wdt_write_reg(BCM63XX_WDT_REG_CTL, WDT_START_2);
 }
 
 static void bcm63xx_wdt_hw_stop(void)
 {
-	bcm63xx_wdt_write_reg(WDT_CTL_REG, WDT_STOP_1);
-	bcm63xx_wdt_write_reg(WDT_CTL_REG, WDT_STOP_2);
+	bcm63xx_wdt_write_reg(BCM63XX_WDT_REG_CTL, WDT_STOP_1);
+	bcm63xx_wdt_write_reg(BCM63XX_WDT_REG_CTL, WDT_STOP_2);
 }
 
 #ifdef BCM63XX
@@ -252,9 +289,19 @@ static struct miscdevice bcm63xx_wdt_miscdev = {
 
 static int bcm63xx_wdt_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
+	const struct of_device_id *of_id;
 	int ret;
 	struct resource *r;
 
+	of_id = of_match_device(bcm63xx_wdt_id_table, dev);
+	if (of_id) {
+		bcm63xx_wdt_device.soc = (enum bcm63xx_wdt_soc)of_id->data;
+	} else {
+		/* Fallback */
+		bcm63xx_wdt_device.soc = BCM63XX_WDT_SOC_BCM63XX;
+	}
+
 	timer_setup(&bcm63xx_wdt_device.timer, bcm63xx_timer_tick, 0);
 
 	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -326,6 +373,7 @@ static struct platform_driver bcm63xx_wdt_driver = {
 	.shutdown = bcm63xx_wdt_shutdown,
 	.driver = {
 		.name = "bcm63xx-wdt",
+		.of_match_table = bcm63xx_wdt_id_table,
 	}
 };
 
@@ -333,6 +381,7 @@ module_platform_driver(bcm63xx_wdt_driver);
 
 MODULE_AUTHOR("Miguel Gaio <miguel.gaio@efixo.com>");
 MODULE_AUTHOR("Florian Fainelli <florian@openwrt.org>");
+MODULE_DEVICE_TABLE(of, bcm63xx_wdt_id_table);
 MODULE_DESCRIPTION("Driver for the Broadcom BCM63xx SoC watchdog");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:bcm63xx-wdt");
-- 
2.31.1

