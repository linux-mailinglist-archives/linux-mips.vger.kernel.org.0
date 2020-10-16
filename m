Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA03E29024D
	for <lists+linux-mips@lfdr.de>; Fri, 16 Oct 2020 11:56:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406447AbgJPJzV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 16 Oct 2020 05:55:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406446AbgJPJzV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 16 Oct 2020 05:55:21 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92F81C061755;
        Fri, 16 Oct 2020 02:55:20 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id x16so1788433ljh.2;
        Fri, 16 Oct 2020 02:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CDQCKQDRmwvPS6IKdtTUUCsndid3yeQVHA8ItNC4IFQ=;
        b=diZH4UWIGhNE8QEsSuozXDN58n6EJkCqSG3/pJAgqaO0i8im4jfwp3xamR+DzGlg47
         foEXMBZsVmshF7FtGFg5Yzwjlt/8684UZDUIqePoESGhCINQhN+SawU7oRhMLkb3MVak
         +dErjeujo6YRzIyHMRUC5nkfw9apixxpcUHyRI4FE3J5ap6kFDwfx1PmvEJr6cY1sLJX
         L0/x6o+IGPCx7pc9BXxGW1iuefMSQra5gEPtEGkfN5oXHnp76kj3ixFqAw1SkthA8cMa
         xEEB7QoKNTDFb79b2Vrbl8CfFHk4orShsHJgH/vDw728Snf/l6IK9Qy8DtXngPtP4DIa
         jenw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CDQCKQDRmwvPS6IKdtTUUCsndid3yeQVHA8ItNC4IFQ=;
        b=pDsXWQjAc+3zbGjDNsLlDNfveJ+139TA7cXS2xbcoP0g2MnYwLskpv9ClZOhsQHCvx
         0NBDL8x/avJRje4g4xBL86JXSGfepyIvTw880EuU9v0WIkDig5tJ/U64dHZowCdb6yiZ
         VhNQ6m9YTBuRHRNuuxCgZY50H1h1m0Gs73gCTw1WI0rD8PM0t2gcSOCSGfvJqh1EMhxi
         hKvp8rFw95SZdabOgjDV44hWIZ+9XAYsznPQ47bBXXcIY6WB7nJdf3HvsW+CcIDpMWi4
         5IXDC/rHIifTZDCFgpBqBOQV2UVwS+9suKyrU71wHxfDRupD8CbYoyv5Q5HcQNC/eoye
         4c+A==
X-Gm-Message-State: AOAM531OpS16WlxhmHI8WemSM58nwCPvu/ZnxfEzd/y7zTylOPsyLBbg
        EV8KoofnhTM+6zwSUHqbyU3/rJX4aMTZUAl5
X-Google-Smtp-Source: ABdhPJzHsJCOr078+aBCc4kAwwrpSw7JizthkC0+MsDSMv8WWrndIoXY2Op+Gi1IlqiGLyV+iQZQkQ==
X-Received: by 2002:a2e:9789:: with SMTP id y9mr1121186lji.456.1602842117725;
        Fri, 16 Oct 2020 02:55:17 -0700 (PDT)
Received: from localhost.localdomain (mail.vissa.org. [37.17.23.68])
        by smtp.gmail.com with ESMTPSA id z11sm729253ljk.7.2020.10.16.02.55.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 16 Oct 2020 02:55:17 -0700 (PDT)
From:   Sergey Yasinsky <seregajsv@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Sergey Yasinsky <seregajsv@gmail.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: [PATCH v2 1/1] watchdog: pnx833x_wdt: convert to watchdog core
Date:   Fri, 16 Oct 2020 12:53:27 +0300
Message-Id: <20201016095328.14052-1-seregajsv@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Convert driver from legacy to use the watchdog core and platform driver.
Add new pnx833x_wdt_device platform device for pnx833x_wdt driver.

Signed-off-by: Sergey Yasinsky <seregajsv@gmail.com>
---
 arch/mips/pnx833x/common/platform.c |   6 +
 drivers/watchdog/Kconfig            |   2 +-
 drivers/watchdog/pnx833x_wdt.c      | 244 +++++++++-------------------
 3 files changed, 80 insertions(+), 172 deletions(-)

diff --git a/arch/mips/pnx833x/common/platform.c b/arch/mips/pnx833x/common/platform.c
index 5fa0373f1c9e..3371f860efc2 100644
--- a/arch/mips/pnx833x/common/platform.c
+++ b/arch/mips/pnx833x/common/platform.c
@@ -207,12 +207,18 @@ static struct platform_device pnx833x_flash_nand = {
 	},
 };
 
+static struct platform_device pnx833x_wdt_device = {
+	.name		= "pnx833x_wdt",
+	.id		= -1,
+};
+
 static struct platform_device *pnx833x_platform_devices[] __initdata = {
 	&pnx833x_uart_device,
 	&pnx833x_usb_ehci_device,
 	&pnx833x_ethernet_device,
 	&pnx833x_sata_device,
 	&pnx833x_flash_nand,
+	&pnx833x_wdt_device,
 };
 
 static int __init pnx833x_platform_init(void)
diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index ab7aad5a1e69..e9b86dbbb8fa 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1686,7 +1686,7 @@ config WDT_MTX1
 config PNX833X_WDT
 	tristate "PNX833x Hardware Watchdog"
 	depends on SOC_PNX8335
-	depends on BROKEN
+	select WATCHDOG_CORE
 	help
 	  Hardware driver for the PNX833x's watchdog. This is a
 	  watchdog timer that will reboot the machine after a programmable
diff --git a/drivers/watchdog/pnx833x_wdt.c b/drivers/watchdog/pnx833x_wdt.c
index 4097d076aab8..8896e1cb109e 100644
--- a/drivers/watchdog/pnx833x_wdt.c
+++ b/drivers/watchdog/pnx833x_wdt.c
@@ -17,21 +17,11 @@
 
 #include <linux/module.h>
 #include <linux/moduleparam.h>
-#include <linux/types.h>
-#include <linux/kernel.h>
-#include <linux/fs.h>
-#include <linux/mm.h>
-#include <linux/miscdevice.h>
+#include <linux/platform_device.h>
 #include <linux/watchdog.h>
-#include <linux/notifier.h>
-#include <linux/reboot.h>
-#include <linux/init.h>
 #include <asm/mach-pnx833x/pnx833x.h>
 
-#define WATCHDOG_TIMEOUT 30		/* 30 sec Maximum timeout */
 #define WATCHDOG_COUNT_FREQUENCY 68000000U /* Watchdog counts at 68MHZ. */
-#define	PNX_WATCHDOG_TIMEOUT	(WATCHDOG_TIMEOUT * WATCHDOG_COUNT_FREQUENCY)
-#define PNX_TIMEOUT_VALUE	2040000000U
 
 /** CONFIG block */
 #define PNX833X_CONFIG                      (0x07000U)
@@ -43,13 +33,11 @@
 #define PNX833X_RESET                       (0x08000U)
 #define PNX833X_RESET_CONFIG                (0x08)
 
-static int pnx833x_wdt_alive;
-
-/* Set default timeout in MHZ.*/
-static int pnx833x_wdt_timeout = PNX_WATCHDOG_TIMEOUT;
+#define WATCHDOG_DEFAULT_TIMEOUT 30
+static int pnx833x_wdt_timeout;
 module_param(pnx833x_wdt_timeout, int, 0);
-MODULE_PARM_DESC(timeout, "Watchdog timeout in Mhz. (68Mhz clock), default="
-			__MODULE_STRING(PNX_TIMEOUT_VALUE) "(30 seconds).");
+MODULE_PARM_DESC(timeout, "Watchdog timeout in seconds (default="
+				__MODULE_STRING(WATCHDOG_DEFAULT_TIMEOUT) ")");
 
 static bool nowayout = WATCHDOG_NOWAYOUT;
 module_param(nowayout, bool, 0);
@@ -62,21 +50,21 @@ module_param(start_enabled, int, 0);
 MODULE_PARM_DESC(start_enabled, "Watchdog is started on module insertion "
 				"(default=" __MODULE_STRING(START_DEFAULT) ")");
 
-static void pnx833x_wdt_start(void)
+static int pnx833x_wdt_start(struct watchdog_device *wdd)
 {
 	/* Enable watchdog causing reset. */
 	PNX833X_REG(PNX833X_RESET + PNX833X_RESET_CONFIG) |= 0x1;
 	/* Set timeout.*/
-	PNX833X_REG(PNX833X_CONFIG +
-		PNX833X_CONFIG_CPU_WATCHDOG_COMPARE) = pnx833x_wdt_timeout;
+	PNX833X_REG(PNX833X_CONFIG + PNX833X_CONFIG_CPU_WATCHDOG_COMPARE) =
+		wdd->timeout * WATCHDOG_COUNT_FREQUENCY;
 	/* Enable watchdog. */
 	PNX833X_REG(PNX833X_CONFIG +
 				PNX833X_CONFIG_CPU_COUNTERS_CONTROL) |= 0x1;
 
-	pr_info("Started watchdog timer\n");
+	return 0;
 }
 
-static void pnx833x_wdt_stop(void)
+static int pnx833x_wdt_stop(struct watchdog_device *wdd)
 {
 	/* Disable watchdog causing reset. */
 	PNX833X_REG(PNX833X_RESET + PNX833X_CONFIG) &= 0xFFFFFFFE;
@@ -84,193 +72,107 @@ static void pnx833x_wdt_stop(void)
 	PNX833X_REG(PNX833X_CONFIG +
 			PNX833X_CONFIG_CPU_COUNTERS_CONTROL) &= 0xFFFFFFFE;
 
-	pr_info("Stopped watchdog timer\n");
-}
-
-static void pnx833x_wdt_ping(void)
-{
-	PNX833X_REG(PNX833X_CONFIG +
-		PNX833X_CONFIG_CPU_WATCHDOG_COMPARE) = pnx833x_wdt_timeout;
-}
-
-/*
- *	Allow only one person to hold it open
- */
-static int pnx833x_wdt_open(struct inode *inode, struct file *file)
-{
-	if (test_and_set_bit(0, &pnx833x_wdt_alive))
-		return -EBUSY;
-
-	if (nowayout)
-		__module_get(THIS_MODULE);
-
-	/* Activate timer */
-	if (!start_enabled)
-		pnx833x_wdt_start();
-
-	pnx833x_wdt_ping();
-
-	pr_info("Started watchdog timer\n");
-
-	return stream_open(inode, file);
-}
-
-static int pnx833x_wdt_release(struct inode *inode, struct file *file)
-{
-	/* Shut off the timer.
-	 * Lock it in if it's a module and we defined ...NOWAYOUT */
-	if (!nowayout)
-		pnx833x_wdt_stop(); /* Turn the WDT off */
-
-	clear_bit(0, &pnx833x_wdt_alive);
 	return 0;
 }
 
-static ssize_t pnx833x_wdt_write(struct file *file, const char *data, size_t len, loff_t *ppos)
+static int pnx833x_wdt_ping(struct watchdog_device *wdd)
 {
-	/* Refresh the timer. */
-	if (len)
-		pnx833x_wdt_ping();
+	PNX833X_REG(PNX833X_CONFIG + PNX833X_CONFIG_CPU_WATCHDOG_COMPARE) =
+		wdd->timeout * WATCHDOG_COUNT_FREQUENCY;
 
-	return len;
+	return 0;
 }
 
-static long pnx833x_wdt_ioctl(struct file *file, unsigned int cmd,
-							unsigned long arg)
+static int pnx833x_wdt_set_timeout(struct watchdog_device *wdd, unsigned int t)
 {
-	int options, new_timeout = 0;
-	uint32_t timeout, timeout_left = 0;
-
-	static const struct watchdog_info ident = {
-		.options = WDIOF_KEEPALIVEPING | WDIOF_SETTIMEOUT,
-		.firmware_version = 0,
-		.identity = "Hardware Watchdog for PNX833x",
-	};
-
-	switch (cmd) {
-	default:
-		return -ENOTTY;
-
-	case WDIOC_GETSUPPORT:
-		if (copy_to_user((struct watchdog_info *)arg,
-				 &ident, sizeof(ident)))
-			return -EFAULT;
-		return 0;
-
-	case WDIOC_GETSTATUS:
-	case WDIOC_GETBOOTSTATUS:
-		return put_user(0, (int *)arg);
-
-	case WDIOC_SETOPTIONS:
-		if (get_user(options, (int *)arg))
-			return -EFAULT;
-
-		if (options & WDIOS_DISABLECARD)
-			pnx833x_wdt_stop();
-
-		if (options & WDIOS_ENABLECARD)
-			pnx833x_wdt_start();
-
-		return 0;
-
-	case WDIOC_KEEPALIVE:
-		pnx833x_wdt_ping();
-		return 0;
-
-	case WDIOC_SETTIMEOUT:
-	{
-		if (get_user(new_timeout, (int *)arg))
-			return -EFAULT;
-
-		pnx833x_wdt_timeout = new_timeout;
-		PNX833X_REG(PNX833X_CONFIG +
-			PNX833X_CONFIG_CPU_WATCHDOG_COMPARE) = new_timeout;
-		return put_user(new_timeout, (int *)arg);
-	}
-
-	case WDIOC_GETTIMEOUT:
-		timeout = PNX833X_REG(PNX833X_CONFIG +
-					PNX833X_CONFIG_CPU_WATCHDOG_COMPARE);
-		return put_user(timeout, (int *)arg);
-
-	case WDIOC_GETTIMELEFT:
-		timeout_left = PNX833X_REG(PNX833X_CONFIG +
-						PNX833X_CONFIG_CPU_WATCHDOG);
-		return put_user(timeout_left, (int *)arg);
-
-	}
+	PNX833X_REG(PNX833X_CONFIG + PNX833X_CONFIG_CPU_WATCHDOG_COMPARE) =
+		t * WATCHDOG_COUNT_FREQUENCY;
+	wdd->timeout = t;
+	return 0;
 }
 
-static int pnx833x_wdt_notify_sys(struct notifier_block *this,
-					unsigned long code, void *unused)
+static unsigned int pnx833x_wdt_get_timeleft(struct watchdog_device *wdd)
 {
-	if (code == SYS_DOWN || code == SYS_HALT)
-		pnx833x_wdt_stop(); /* Turn the WDT off */
+	unsigned int timeout = PNX833X_REG(PNX833X_CONFIG +
+		 PNX833X_CONFIG_CPU_WATCHDOG_COMPARE);
+	unsigned int curval = PNX833X_REG(PNX833X_CONFIG +
+		PNX833X_CONFIG_CPU_WATCHDOG);
 
-	return NOTIFY_DONE;
+	return (timeout - curval) / WATCHDOG_COUNT_FREQUENCY;
 }
 
-static const struct file_operations pnx833x_wdt_fops = {
-	.owner		= THIS_MODULE,
-	.llseek		= no_llseek,
-	.write		= pnx833x_wdt_write,
-	.unlocked_ioctl	= pnx833x_wdt_ioctl,
-	.compat_ioctl	= compat_ptr_ioctl,
-	.open		= pnx833x_wdt_open,
-	.release	= pnx833x_wdt_release,
+static const struct watchdog_info pnx833x_wdt_ident = {
+	.identity = "PNX833x Watchdog Timer",
+	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE | WDIOF_CARDRESET
 };
 
-static struct miscdevice pnx833x_wdt_miscdev = {
-	.minor		= WATCHDOG_MINOR,
-	.name		= "watchdog",
-	.fops		= &pnx833x_wdt_fops,
+static struct watchdog_ops pnx833x_wdt_ops = {
+	.owner = THIS_MODULE,
+	.start = pnx833x_wdt_start,
+	.stop = pnx833x_wdt_stop,
+	.ping = pnx833x_wdt_ping,
+	.set_timeout = pnx833x_wdt_set_timeout,
+	.get_timeleft = pnx833x_wdt_get_timeleft,
 };
 
-static struct notifier_block pnx833x_wdt_notifier = {
-	.notifier_call = pnx833x_wdt_notify_sys,
-};
-
-static int __init watchdog_init(void)
+static int pnx833x_wdt_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
+	struct watchdog_device *wdd;
 	int ret, cause;
 
+	wdd = devm_kzalloc(dev, sizeof(*wdd), GFP_KERNEL);
+	if (!wdd)
+		return -ENOMEM;
+	platform_set_drvdata(pdev, wdd);
+	wdd->info = &pnx833x_wdt_ident;
+	wdd->ops = &pnx833x_wdt_ops;
+	wdd->min_timeout = 1;
+	wdd->max_timeout = U32_MAX / WATCHDOG_COUNT_FREQUENCY;
+	wdd->timeout = WATCHDOG_DEFAULT_TIMEOUT;
+	wdd->parent = dev;
+	watchdog_set_nowayout(wdd, nowayout);
+	watchdog_init_timeout(wdd, pnx833x_wdt_timeout, dev);
+
 	/* Lets check the reason for the reset.*/
 	cause = PNX833X_REG(PNX833X_RESET);
 	/*If bit 31 is set then watchdog was cause of reset.*/
-	if (cause & 0x80000000) {
-		pr_info("The system was previously reset due to the watchdog firing - please investigate...\n");
-	}
+	if (cause & 0x80000000)
+		wdd->bootstatus = WDIOF_CARDRESET;
 
-	ret = register_reboot_notifier(&pnx833x_wdt_notifier);
-	if (ret) {
-		pr_err("cannot register reboot notifier (err=%d)\n", ret);
-		return ret;
+	if (start_enabled) {
+		pnx833x_wdt_start(wdd);
+		set_bit(WDOG_HW_RUNNING, &wdd->status);
 	}
 
-	ret = misc_register(&pnx833x_wdt_miscdev);
+	ret = watchdog_register_device(wdd);
 	if (ret) {
-		pr_err("cannot register miscdev on minor=%d (err=%d)\n",
-		       WATCHDOG_MINOR, ret);
-		unregister_reboot_notifier(&pnx833x_wdt_notifier);
+		pr_err("Failed to register watchdog device");
 		return ret;
 	}
 
-	pr_info("Hardware Watchdog Timer for PNX833x: Version 0.1\n");
-
-	if (start_enabled)
-		pnx833x_wdt_start();
+	pr_info("Hardware Watchdog Timer for PNX833x\n");
 
 	return 0;
 }
 
-static void __exit watchdog_exit(void)
+static int pnx833x_wdt_remove(struct platform_device *pdev)
 {
-	misc_deregister(&pnx833x_wdt_miscdev);
-	unregister_reboot_notifier(&pnx833x_wdt_notifier);
+	struct watchdog_device *wdd = platform_get_drvdata(pdev);
+
+	watchdog_unregister_device(wdd);
+	return 0;
 }
 
-module_init(watchdog_init);
-module_exit(watchdog_exit);
+static struct platform_driver pnx833x_wdt_driver = {
+	.probe		= pnx833x_wdt_probe,
+	.remove		= pnx833x_wdt_remove,
+	.driver		= {
+		.name = "pnx833x_wdt",
+	}
+};
+
+module_platform_driver(pnx833x_wdt_driver);
 
 MODULE_AUTHOR("Daniel Laird/Andre McCurdy");
 MODULE_DESCRIPTION("Hardware Watchdog Device for PNX833x");
-- 
2.26.2

