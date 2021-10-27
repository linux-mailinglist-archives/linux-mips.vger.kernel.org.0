Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBB1C43D615
	for <lists+linux-mips@lfdr.de>; Wed, 27 Oct 2021 23:56:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229807AbhJ0V63 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 Oct 2021 17:58:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbhJ0V61 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 27 Oct 2021 17:58:27 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F594C061570;
        Wed, 27 Oct 2021 14:56:01 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id u21so9122139lff.8;
        Wed, 27 Oct 2021 14:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9fQ+qAuU0GEnMNZofISer1TEhl6Hb2oIM6VVFmoCdrU=;
        b=ffzm7+R8Z8hTiCzw1KmJhoIE2nWK7+CfUoHwuk1epA//g6xU2Lc+obbiL5wdpvOnmc
         LEtT4d1gMZnhAH7DabCefDEGkKL7HW2nqXvrNqcVEVTV5W+thvVDqx7pVFIJUFN8HaQk
         AFnBXkFh8GxkxkmRp7N8R8LHmAa9PqB/857XoKVk4cnkGwc8iyk21GCcGZcauBf/ZoA2
         q6Xx0kkQucaJ6PckCZc9Tngn6A/APp+zfmBqy5RH7HSoHTwFkffWOUG7S89MEj1pbd+U
         XqqaeGdyUtGXf0G55XeOPDS2ZryqaOst/5uzTSVmgRx7O5VSKXXl2dwf2mof4jZ+CKbV
         0txw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9fQ+qAuU0GEnMNZofISer1TEhl6Hb2oIM6VVFmoCdrU=;
        b=5Eu97WCGDbHPPpPxQ97GmkryceYwXaa+fWgG2G/f3peDJZ4UIxr+P2aUwDlYAObfsD
         Rz0f3Aizi7cEyKCljLCHQT7Tn3kYeDftdPjCQDIvLcu005Fvk+RtO1bLNljYnH8w67Oj
         Wgm/KZTmoS1jAKJitrcenqNv8GSBxvXHg47/oZVcKNOA1VI72LFIL0REFRNsLYeZMmld
         WkahkaM0OahjP6QSNhVLYyeoYYadrWi+oCVfOkrX63f0DRZRycPH6Tg4psrQCP0vdqEc
         iWRWCLLQ5yP1cePqy8snIaNj5MMdiHd0zAQDLS/vuiBVFQRhuxeKtk/3JwrVuD23WHaY
         mCgw==
X-Gm-Message-State: AOAM530mcYdjpmmWp5y5cwboED6sSMnAgryzRZUvAjbRziV7wsB4STnB
        66iCpJppnH5EXiH8MTEcESY=
X-Google-Smtp-Source: ABdhPJzPIqKjdKOhay+GyaYt1BFfe7s3iZsZR77fK7uXLMSq/MjqRPPT7xobC9q2QM9i+mAodZcr9Q==
X-Received: by 2002:a05:6512:456:: with SMTP id y22mr271300lfk.554.1635371759789;
        Wed, 27 Oct 2021 14:55:59 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id g35sm110207lfv.248.2021.10.27.14.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 14:55:59 -0700 (PDT)
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
Subject: [PATCH 2/3] watchdog: bcm63xx_wdt: support compiling with COMPILE_TEST
Date:   Wed, 27 Oct 2021 23:55:30 +0200
Message-Id: <20211027215531.9996-2-zajec5@gmail.com>
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

Most of this driver uses generic code and can be compile tested on any
platform / arch. Move watchdog specific defines to a globally available
header and check for BCM63XX for platform specific code.

This helps maintaining kernel / driver and will allow adding support for
other platforms later.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/mips/bcm63xx/prom.c                      |  1 +
 arch/mips/bcm63xx/setup.c                     |  1 +
 .../include/asm/mach-bcm63xx/bcm63xx_regs.h   | 22 ------------
 drivers/watchdog/Kconfig                      |  2 +-
 drivers/watchdog/bcm63xx_wdt.c                | 35 +++++++++++++++----
 include/linux/bcm63xx_wdt.h                   | 24 +++++++++++++
 6 files changed, 55 insertions(+), 30 deletions(-)
 create mode 100644 include/linux/bcm63xx_wdt.h

diff --git a/arch/mips/bcm63xx/prom.c b/arch/mips/bcm63xx/prom.c
index c3a2ea62c5c3..5e602a58a986 100644
--- a/arch/mips/bcm63xx/prom.c
+++ b/arch/mips/bcm63xx/prom.c
@@ -6,6 +6,7 @@
  * Copyright (C) 2008 Maxime Bizon <mbizon@freebox.fr>
  */
 
+#include <linux/bcm63xx_wdt.h>
 #include <linux/init.h>
 #include <linux/memblock.h>
 #include <linux/smp.h>
diff --git a/arch/mips/bcm63xx/setup.c b/arch/mips/bcm63xx/setup.c
index d811e3e03f81..86d4ad7dc8ba 100644
--- a/arch/mips/bcm63xx/setup.c
+++ b/arch/mips/bcm63xx/setup.c
@@ -6,6 +6,7 @@
  * Copyright (C) 2008 Maxime Bizon <mbizon@freebox.fr>
  */
 
+#include <linux/bcm63xx_wdt.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/delay.h>
diff --git a/arch/mips/include/asm/mach-bcm63xx/bcm63xx_regs.h b/arch/mips/include/asm/mach-bcm63xx/bcm63xx_regs.h
index 9ceb5e72889f..fc0272e2dec2 100644
--- a/arch/mips/include/asm/mach-bcm63xx/bcm63xx_regs.h
+++ b/arch/mips/include/asm/mach-bcm63xx/bcm63xx_regs.h
@@ -441,28 +441,6 @@
 #define TIMER_CTL_ENABLE_MASK		(1 << 31)
 
 
-/*************************************************************************
- * _REG relative to RSET_WDT
- *************************************************************************/
-
-/* Watchdog default count register */
-#define WDT_DEFVAL_REG			0x0
-
-/* Watchdog control register */
-#define WDT_CTL_REG			0x4
-
-/* Watchdog control register constants */
-#define WDT_START_1			(0xff00)
-#define WDT_START_2			(0x00ff)
-#define WDT_STOP_1			(0xee00)
-#define WDT_STOP_2			(0x00ee)
-
-/* Watchdog reset length register */
-#define WDT_RSTLEN_REG			0x8
-
-/* Watchdog soft reset register (BCM6328 only) */
-#define WDT_SOFTRESET_REG		0xc
-
 /*************************************************************************
  * _REG relative to RSET_GPIO
  *************************************************************************/
diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index bf59faeb3de1..913cde027e92 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1711,7 +1711,7 @@ config OCTEON_WDT
 
 config BCM63XX_WDT
 	tristate "Broadcom BCM63xx hardware watchdog"
-	depends on BCM63XX
+	depends on BCM63XX || COMPILE_TEST
 	help
 	  Watchdog driver for the built in watchdog hardware in Broadcom
 	  BCM63xx SoC.
diff --git a/drivers/watchdog/bcm63xx_wdt.c b/drivers/watchdog/bcm63xx_wdt.c
index 56cc262571a5..1334e7fe77d8 100644
--- a/drivers/watchdog/bcm63xx_wdt.c
+++ b/drivers/watchdog/bcm63xx_wdt.c
@@ -9,6 +9,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/bcm63xx_wdt.h>
 #include <linux/bitops.h>
 #include <linux/errno.h>
 #include <linux/fs.h>
@@ -27,10 +28,10 @@
 #include <linux/resource.h>
 #include <linux/platform_device.h>
 
-#include <bcm63xx_cpu.h>
+#ifdef BCM63XX
 #include <bcm63xx_io.h>
-#include <bcm63xx_regs.h>
 #include <bcm63xx_timer.h>
+#endif
 
 #define PFX KBUILD_MODNAME
 
@@ -53,26 +54,40 @@ module_param(nowayout, bool, 0);
 MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
 	__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
 
+static void bcm63xx_wdt_write_reg(u32 reg, u32 val)
+{
+	void __iomem *addr = bcm63xx_wdt_device.regs;
+
+	addr += reg;
+#ifdef BCM63XX
+	bcm_writel(val, addr);
+#else
+	writel(val, addr);
+#endif
+}
+
 /* HW functions */
 static void bcm63xx_wdt_hw_start(void)
 {
-	bcm_writel(0xfffffffe, bcm63xx_wdt_device.regs + WDT_DEFVAL_REG);
-	bcm_writel(WDT_START_1, bcm63xx_wdt_device.regs + WDT_CTL_REG);
-	bcm_writel(WDT_START_2, bcm63xx_wdt_device.regs + WDT_CTL_REG);
+	bcm63xx_wdt_write_reg(WDT_DEFVAL_REG, 0xfffffffe);
+	bcm63xx_wdt_write_reg(WDT_CTL_REG, WDT_START_1);
+	bcm63xx_wdt_write_reg(WDT_CTL_REG, WDT_START_2);
 }
 
 static void bcm63xx_wdt_hw_stop(void)
 {
-	bcm_writel(WDT_STOP_1, bcm63xx_wdt_device.regs + WDT_CTL_REG);
-	bcm_writel(WDT_STOP_2, bcm63xx_wdt_device.regs + WDT_CTL_REG);
+	bcm63xx_wdt_write_reg(WDT_CTL_REG, WDT_STOP_1);
+	bcm63xx_wdt_write_reg(WDT_CTL_REG, WDT_STOP_2);
 }
 
+#ifdef BCM63XX
 static void bcm63xx_wdt_isr(void *data)
 {
 	struct pt_regs *regs = get_irq_regs();
 
 	die(PFX " fire", regs);
 }
+#endif
 
 static void bcm63xx_timer_tick(struct timer_list *unused)
 {
@@ -255,11 +270,13 @@ static int bcm63xx_wdt_probe(struct platform_device *pdev)
 		return -ENXIO;
 	}
 
+#ifdef BCM63XX
 	ret = bcm63xx_timer_register(TIMER_WDT_ID, bcm63xx_wdt_isr, NULL);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed to register wdt timer isr\n");
 		return ret;
 	}
+#endif
 
 	if (bcm63xx_wdt_settimeout(wdt_time)) {
 		bcm63xx_wdt_settimeout(WDT_DEFAULT_TIME);
@@ -280,7 +297,9 @@ static int bcm63xx_wdt_probe(struct platform_device *pdev)
 	return 0;
 
 unregister_timer:
+#ifdef BCM63XX
 	bcm63xx_timer_unregister(TIMER_WDT_ID);
+#endif
 	return ret;
 }
 
@@ -290,7 +309,9 @@ static int bcm63xx_wdt_remove(struct platform_device *pdev)
 		bcm63xx_wdt_pause();
 
 	misc_deregister(&bcm63xx_wdt_miscdev);
+#ifdef BCM63XX
 	bcm63xx_timer_unregister(TIMER_WDT_ID);
+#endif
 	return 0;
 }
 
diff --git a/include/linux/bcm63xx_wdt.h b/include/linux/bcm63xx_wdt.h
new file mode 100644
index 000000000000..a33d23237b32
--- /dev/null
+++ b/include/linux/bcm63xx_wdt.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#ifndef __BCM63XX_WDT_H
+#define __BCM63XX_WDT_H
+
+/* Watchdog default count register */
+#define WDT_DEFVAL_REG			0x0
+
+/* Watchdog control register */
+#define WDT_CTL_REG			0x4
+
+/* Watchdog control register constants */
+#define WDT_START_1			(0xff00)
+#define WDT_START_2			(0x00ff)
+#define WDT_STOP_1			(0xee00)
+#define WDT_STOP_2			(0x00ee)
+
+/* Watchdog reset length register */
+#define WDT_RSTLEN_REG			0x8
+
+/* Watchdog soft reset register (BCM6328 only) */
+#define WDT_SOFTRESET_REG		0xc
+
+#endif /* __BCM63XX_WDT_H */
-- 
2.31.1

