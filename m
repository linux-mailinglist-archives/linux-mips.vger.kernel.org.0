Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 338D2440218
	for <lists+linux-mips@lfdr.de>; Fri, 29 Oct 2021 20:35:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230168AbhJ2ShQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 Oct 2021 14:37:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230509AbhJ2ShN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 Oct 2021 14:37:13 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D807C061570;
        Fri, 29 Oct 2021 11:34:44 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id l203so10016422pfd.2;
        Fri, 29 Oct 2021 11:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zWHBIEcvoeupNEkr+7OvuNvuzEArssjhvYw0m7qAAEk=;
        b=kIIeB4esScXEFsvrUoZDME8FYdVf1VWGPtUumBrrm+Xh+na1/8qW7O/nXQWQ13jAMK
         6FSoOcNvQyuTuw/PX75A8+lYfogAA2+m6iUtGEvAzept23UBttI9KXGTIWqdEUNO1AG6
         r4EAsXJmZwWMRB3ASKVLfao3Qy5zLESoGnVYsJdJW5koQIuASFCGmYJpO48aLA6bGLte
         LO7puKutboac/ONoti+zzJ8R4Gyj5f+iLChNi8bQhM4nzQxwuY9GiKq/UjYi8U2DLJHH
         kF+u4Afmk96W8XDDH33aQL/z+4dGQh34+WZ5LK1qFm7TjKODXSZgkBrx1Uz2TjPKc2tf
         VAcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zWHBIEcvoeupNEkr+7OvuNvuzEArssjhvYw0m7qAAEk=;
        b=qkuCYqeC9FSkKsHdiaV96frir6txDYUGNu7haROnYpTLmB3mxXzrqVtsTWA24Vono1
         fXKAZMMjWHSjMm5Gnih40l9op5oTKl9d05oOHzyC64N8uD0mahcibazkBqwbOgJBmxTz
         AGs8MzdQKLKxQVufFdo/fennvVHw27wZIzZE15lihzXJrb3BpTRkBR0yJSSHwmHSDjlW
         qSVCNWnxxqwdbyPvU9HQuX6xOYdxviVnd8/578yZE4nTgZS+ayR/Hok7x3ey/xvXaOh0
         R1wiMH0CVsNv4AWHQeH+KtjLewF9IJPh+Mx8yYZb2Pl0J8wneqkpCzuqDQZEDM5ei5fI
         1sMw==
X-Gm-Message-State: AOAM5313yHjatpM8pwT6ncECdUWIBlIQZiem8wUE8FiM3xoC7LbPEugP
        y1aTRahfwf6Sm1xMTzXUddiMYTKA+Ow=
X-Google-Smtp-Source: ABdhPJwy0TJVYrNtoCTVMmU9GaGIF5hKicBn4y2EIbWmg+yquzZ9HGS4j+RZswwFNLqlQEqedrqusQ==
X-Received: by 2002:a62:ab14:0:b0:47b:e126:ea50 with SMTP id p20-20020a62ab14000000b0047be126ea50mr12562259pff.58.1635532483497;
        Fri, 29 Oct 2021 11:34:43 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id j15sm7730868pfh.35.2021.10.29.11.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 11:34:42 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     rafal@milecki.pl, Florian Fainelli <f.fainelli@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        bcm-kernel-feedback-list@broadcom.com (maintainer:BROADCOM BCM63XX ARM
        ARCHITECTURE), Justin Chen <justinpopo6@gmail.com>,
        linux-watchdog@vger.kernel.org (open list:WATCHDOG DEVICE DRIVERS),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        linux-mips@vger.kernel.org (open list:MIPS),
        linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM63XX
        ARM ARCHITECTURE)
Subject: [PATCH v2 7/7] watchdog: Remove BCM63XX_WDT
Date:   Fri, 29 Oct 2021 11:34:30 -0700
Message-Id: <20211029183430.4086765-8-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029183430.4086765-1-f.fainelli@gmail.com>
References: <20211029183430.4086765-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Now that we can utilize the BCM7038_WDT driver, remove that one which
was not converted to the watchdog APIs. There are a couple of notable
differences with how the bcm7038_wdt driver proceeds:

- bcm63xx_wdt would register with the ad-hoc BCM63xx hardware timer API,
  but this would only be used in order to catch the interrupt *before* a
  SoC reset and make the kernel "die"

- bcm6xx_wdt would register a software timer and kick it every second in
  order to pet the watchdog, thus offering a two step watchdog process.
  This is not something that is brought over to the bcm7038_wdt as it is
  deemed unnecessary. If user-space cannot pet the watchdog, but a
  kernel timer can, the system is still in a bad shape anyway.

bcm7038_wdt is simpler in its behavior and behaves as a standard
watchdog driver and is not making use of any specific platform APIs,
therefore making it more maintainable and extensible.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/watchdog/Kconfig       |  10 --
 drivers/watchdog/Makefile      |   1 -
 drivers/watchdog/bcm63xx_wdt.c | 315 ---------------------------------
 3 files changed, 326 deletions(-)
 delete mode 100644 drivers/watchdog/bcm63xx_wdt.c

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 24a775dd2bf1..acebf9caf6d1 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1709,16 +1709,6 @@ config OCTEON_WDT
 	  from the first interrupt, it is then only poked when the
 	  device is written.
 
-config BCM63XX_WDT
-	tristate "Broadcom BCM63xx hardware watchdog"
-	depends on BCM63XX
-	help
-	  Watchdog driver for the built in watchdog hardware in Broadcom
-	  BCM63xx SoC.
-
-	  To compile this driver as a loadable module, choose M here.
-	  The module will be called bcm63xx_wdt.
-
 config BCM2835_WDT
 	tristate "Broadcom BCM2835 hardware watchdog"
 	depends on ARCH_BCM2835 || (OF && COMPILE_TEST)
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index 1bd2d6f37c53..9811c4b1cd16 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -154,7 +154,6 @@ obj-$(CONFIG_XILINX_WATCHDOG) += of_xilinx_wdt.o
 # MIPS Architecture
 obj-$(CONFIG_ATH79_WDT) += ath79_wdt.o
 obj-$(CONFIG_BCM47XX_WDT) += bcm47xx_wdt.o
-obj-$(CONFIG_BCM63XX_WDT) += bcm63xx_wdt.o
 obj-$(CONFIG_RC32434_WDT) += rc32434_wdt.o
 obj-$(CONFIG_INDYDOG) += indydog.o
 obj-$(CONFIG_JZ4740_WDT) += jz4740_wdt.o
diff --git a/drivers/watchdog/bcm63xx_wdt.c b/drivers/watchdog/bcm63xx_wdt.c
deleted file mode 100644
index 7cdb25363ea0..000000000000
--- a/drivers/watchdog/bcm63xx_wdt.c
+++ /dev/null
@@ -1,315 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-/*
- *  Broadcom BCM63xx SoC watchdog driver
- *
- *  Copyright (C) 2007, Miguel Gaio <miguel.gaio@efixo.com>
- *  Copyright (C) 2008, Florian Fainelli <florian@openwrt.org>
- *
- */
-
-#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
-
-#include <linux/bitops.h>
-#include <linux/errno.h>
-#include <linux/fs.h>
-#include <linux/io.h>
-#include <linux/kernel.h>
-#include <linux/miscdevice.h>
-#include <linux/module.h>
-#include <linux/moduleparam.h>
-#include <linux/types.h>
-#include <linux/uaccess.h>
-#include <linux/watchdog.h>
-#include <linux/timer.h>
-#include <linux/jiffies.h>
-#include <linux/interrupt.h>
-#include <linux/ptrace.h>
-#include <linux/resource.h>
-#include <linux/platform_device.h>
-
-#include <bcm63xx_cpu.h>
-#include <bcm63xx_io.h>
-#include <bcm63xx_regs.h>
-#include <bcm63xx_timer.h>
-
-#define PFX KBUILD_MODNAME
-
-#define WDT_HZ		50000000 /* Fclk */
-#define WDT_DEFAULT_TIME	30      /* seconds */
-#define WDT_MAX_TIME		256     /* seconds */
-
-static struct {
-	void __iomem *regs;
-	struct timer_list timer;
-	unsigned long inuse;
-	atomic_t ticks;
-} bcm63xx_wdt_device;
-
-static int expect_close;
-
-static int wdt_time = WDT_DEFAULT_TIME;
-static bool nowayout = WATCHDOG_NOWAYOUT;
-module_param(nowayout, bool, 0);
-MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
-	__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
-
-/* HW functions */
-static void bcm63xx_wdt_hw_start(void)
-{
-	bcm_writel(0xfffffffe, bcm63xx_wdt_device.regs + WDT_DEFVAL_REG);
-	bcm_writel(WDT_START_1, bcm63xx_wdt_device.regs + WDT_CTL_REG);
-	bcm_writel(WDT_START_2, bcm63xx_wdt_device.regs + WDT_CTL_REG);
-}
-
-static void bcm63xx_wdt_hw_stop(void)
-{
-	bcm_writel(WDT_STOP_1, bcm63xx_wdt_device.regs + WDT_CTL_REG);
-	bcm_writel(WDT_STOP_2, bcm63xx_wdt_device.regs + WDT_CTL_REG);
-}
-
-static void bcm63xx_wdt_isr(void *data)
-{
-	struct pt_regs *regs = get_irq_regs();
-
-	die(PFX " fire", regs);
-}
-
-static void bcm63xx_timer_tick(struct timer_list *unused)
-{
-	if (!atomic_dec_and_test(&bcm63xx_wdt_device.ticks)) {
-		bcm63xx_wdt_hw_start();
-		mod_timer(&bcm63xx_wdt_device.timer, jiffies + HZ);
-	} else
-		pr_crit("watchdog will restart system\n");
-}
-
-static void bcm63xx_wdt_pet(void)
-{
-	atomic_set(&bcm63xx_wdt_device.ticks, wdt_time);
-}
-
-static void bcm63xx_wdt_start(void)
-{
-	bcm63xx_wdt_pet();
-	bcm63xx_timer_tick(0);
-}
-
-static void bcm63xx_wdt_pause(void)
-{
-	del_timer_sync(&bcm63xx_wdt_device.timer);
-	bcm63xx_wdt_hw_stop();
-}
-
-static int bcm63xx_wdt_settimeout(int new_time)
-{
-	if ((new_time <= 0) || (new_time > WDT_MAX_TIME))
-		return -EINVAL;
-
-	wdt_time = new_time;
-
-	return 0;
-}
-
-static int bcm63xx_wdt_open(struct inode *inode, struct file *file)
-{
-	if (test_and_set_bit(0, &bcm63xx_wdt_device.inuse))
-		return -EBUSY;
-
-	bcm63xx_wdt_start();
-	return stream_open(inode, file);
-}
-
-static int bcm63xx_wdt_release(struct inode *inode, struct file *file)
-{
-	if (expect_close == 42)
-		bcm63xx_wdt_pause();
-	else {
-		pr_crit("Unexpected close, not stopping watchdog!\n");
-		bcm63xx_wdt_start();
-	}
-	clear_bit(0, &bcm63xx_wdt_device.inuse);
-	expect_close = 0;
-	return 0;
-}
-
-static ssize_t bcm63xx_wdt_write(struct file *file, const char *data,
-				size_t len, loff_t *ppos)
-{
-	if (len) {
-		if (!nowayout) {
-			size_t i;
-
-			/* In case it was set long ago */
-			expect_close = 0;
-
-			for (i = 0; i != len; i++) {
-				char c;
-				if (get_user(c, data + i))
-					return -EFAULT;
-				if (c == 'V')
-					expect_close = 42;
-			}
-		}
-		bcm63xx_wdt_pet();
-	}
-	return len;
-}
-
-static struct watchdog_info bcm63xx_wdt_info = {
-	.identity       = PFX,
-	.options        = WDIOF_SETTIMEOUT |
-				WDIOF_KEEPALIVEPING |
-				WDIOF_MAGICCLOSE,
-};
-
-
-static long bcm63xx_wdt_ioctl(struct file *file, unsigned int cmd,
-				unsigned long arg)
-{
-	void __user *argp = (void __user *)arg;
-	int __user *p = argp;
-	int new_value, retval = -EINVAL;
-
-	switch (cmd) {
-	case WDIOC_GETSUPPORT:
-		return copy_to_user(argp, &bcm63xx_wdt_info,
-			sizeof(bcm63xx_wdt_info)) ? -EFAULT : 0;
-
-	case WDIOC_GETSTATUS:
-	case WDIOC_GETBOOTSTATUS:
-		return put_user(0, p);
-
-	case WDIOC_SETOPTIONS:
-		if (get_user(new_value, p))
-			return -EFAULT;
-
-		if (new_value & WDIOS_DISABLECARD) {
-			bcm63xx_wdt_pause();
-			retval = 0;
-		}
-		if (new_value & WDIOS_ENABLECARD) {
-			bcm63xx_wdt_start();
-			retval = 0;
-		}
-
-		return retval;
-
-	case WDIOC_KEEPALIVE:
-		bcm63xx_wdt_pet();
-		return 0;
-
-	case WDIOC_SETTIMEOUT:
-		if (get_user(new_value, p))
-			return -EFAULT;
-
-		if (bcm63xx_wdt_settimeout(new_value))
-			return -EINVAL;
-
-		bcm63xx_wdt_pet();
-
-	case WDIOC_GETTIMEOUT:
-		return put_user(wdt_time, p);
-
-	default:
-		return -ENOTTY;
-
-	}
-}
-
-static const struct file_operations bcm63xx_wdt_fops = {
-	.owner		= THIS_MODULE,
-	.llseek		= no_llseek,
-	.write		= bcm63xx_wdt_write,
-	.unlocked_ioctl	= bcm63xx_wdt_ioctl,
-	.compat_ioctl	= compat_ptr_ioctl,
-	.open		= bcm63xx_wdt_open,
-	.release	= bcm63xx_wdt_release,
-};
-
-static struct miscdevice bcm63xx_wdt_miscdev = {
-	.minor	= WATCHDOG_MINOR,
-	.name	= "watchdog",
-	.fops	= &bcm63xx_wdt_fops,
-};
-
-
-static int bcm63xx_wdt_probe(struct platform_device *pdev)
-{
-	int ret;
-	struct resource *r;
-
-	timer_setup(&bcm63xx_wdt_device.timer, bcm63xx_timer_tick, 0);
-
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!r) {
-		dev_err(&pdev->dev, "failed to get resources\n");
-		return -ENODEV;
-	}
-
-	bcm63xx_wdt_device.regs = devm_ioremap(&pdev->dev, r->start,
-							resource_size(r));
-	if (!bcm63xx_wdt_device.regs) {
-		dev_err(&pdev->dev, "failed to remap I/O resources\n");
-		return -ENXIO;
-	}
-
-	ret = bcm63xx_timer_register(TIMER_WDT_ID, bcm63xx_wdt_isr, NULL);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "failed to register wdt timer isr\n");
-		return ret;
-	}
-
-	if (bcm63xx_wdt_settimeout(wdt_time)) {
-		bcm63xx_wdt_settimeout(WDT_DEFAULT_TIME);
-		dev_info(&pdev->dev,
-			": wdt_time value must be 1 <= wdt_time <= 256, using %d\n",
-			wdt_time);
-	}
-
-	ret = misc_register(&bcm63xx_wdt_miscdev);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "failed to register watchdog device\n");
-		goto unregister_timer;
-	}
-
-	dev_info(&pdev->dev, " started, timer margin: %d sec\n",
-						WDT_DEFAULT_TIME);
-
-	return 0;
-
-unregister_timer:
-	bcm63xx_timer_unregister(TIMER_WDT_ID);
-	return ret;
-}
-
-static int bcm63xx_wdt_remove(struct platform_device *pdev)
-{
-	if (!nowayout)
-		bcm63xx_wdt_pause();
-
-	misc_deregister(&bcm63xx_wdt_miscdev);
-	bcm63xx_timer_unregister(TIMER_WDT_ID);
-	return 0;
-}
-
-static void bcm63xx_wdt_shutdown(struct platform_device *pdev)
-{
-	bcm63xx_wdt_pause();
-}
-
-static struct platform_driver bcm63xx_wdt_driver = {
-	.probe	= bcm63xx_wdt_probe,
-	.remove = bcm63xx_wdt_remove,
-	.shutdown = bcm63xx_wdt_shutdown,
-	.driver = {
-		.name = "bcm63xx-wdt",
-	}
-};
-
-module_platform_driver(bcm63xx_wdt_driver);
-
-MODULE_AUTHOR("Miguel Gaio <miguel.gaio@efixo.com>");
-MODULE_AUTHOR("Florian Fainelli <florian@openwrt.org>");
-MODULE_DESCRIPTION("Driver for the Broadcom BCM63xx SoC watchdog");
-MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:bcm63xx-wdt");
-- 
2.25.1

