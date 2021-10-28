Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1549743DDC8
	for <lists+linux-mips@lfdr.de>; Thu, 28 Oct 2021 11:31:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230105AbhJ1Jdo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Oct 2021 05:33:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230098AbhJ1Jdo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 Oct 2021 05:33:44 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F63CC061570;
        Thu, 28 Oct 2021 02:31:17 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id u21so12213318lff.8;
        Thu, 28 Oct 2021 02:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5SCRR+E6hGA2qUYlZFUC09MM/t1uJnD/XLaVJ8yfNfk=;
        b=DIPttbwdnzYKTfXlI6MpZLACsySVnJjafi/Cj4futVxmFjkow5Tup11a5aSutu7COq
         FatUpMi61V6yWEoPZzhaBLMIXpJWkOFJ4R+UESLPOZ+yCzoPeZQZ67U6ElGS2o2lr7rE
         fMtMgxdDn0w3ksR0+aWxjPBJOlR548utKKa4PAuURNr4s35RCgHTMCjB3Wn4lAe5U2cZ
         jR4DTITlTVOjxWRBvn0JNWcPycCnS9KJm8vkHqYSeb6oVj1a3+klyPhFaTeiSiT+TYO4
         3gJ54Mz2nm1fC7pQOAYxjRhgP+vOvEV4mdPOK/sRPID8Q/nkyXa77hGmLf8w7wffQy5/
         /7Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5SCRR+E6hGA2qUYlZFUC09MM/t1uJnD/XLaVJ8yfNfk=;
        b=6hlUpvT6CClcYTKlpuW7JswIbrlPpz+HVNFrzw4xBVQ0AgeC07vQ7havNIgxrcMwSP
         J60jKR5CKQa7Q/Zdrb9KcYFL7vSImV3LKkHyAocgzES1nbg/0MosW6mLlGYRM2qTI5/E
         Ib8K5/RRuMacLyvwsh/YEI21RAkRIFO88ig13fVrUQYKs//VWajWq8oUehTaIGzzQcL7
         jlLEjcHPSTOhZvlCndCuX3RazI5IrZAmpbuZqrzVa3CCQQo3s6ZD04rlD/2aR42ojp6A
         Sp8HSthPDybrdiS9XlujbK56SY5gCpnXIBXtS9rXtq46QZQbsbAKACZmjllcoNTox97L
         DrwA==
X-Gm-Message-State: AOAM533YrF0QmnvsYJYj+q6TtjQJOaIvnBlO3fIp9D+XmbCwxNvreVoH
        +RtRnJ5/RYTs5jT+DCopsUQ=
X-Google-Smtp-Source: ABdhPJzHdKxqhsU7CoH1gvpFRrC1HQosEE7pvQ3GRH5o89V/kvy/XsJXdCk2D7WOcoxrEq+EL13rlQ==
X-Received: by 2002:a05:6512:3049:: with SMTP id b9mr3103568lfb.660.1635413475449;
        Thu, 28 Oct 2021 02:31:15 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id o26sm231548ljg.92.2021.10.28.02.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 02:31:15 -0700 (PDT)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 3/3] watchdog: bcm7038_wdt: support BCM4908 SoC
Date:   Thu, 28 Oct 2021 11:30:59 +0200
Message-Id: <20211028093059.32535-3-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211028093059.32535-1-zajec5@gmail.com>
References: <20211028093059.32535-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

Hardware supported by this driver goes back to the old bcm63xx days. It
was then reused in BCM7038 and later also in BCM4908.

Depending on SoC model registers layout differs a bit. This commit
introduces support for per-chipset registers offsets & adds BCM4908
layout.

Later on BCM63xx SoCs support should be added too (probably as platform
devices due to missing DT). Eventually this driver should replace
bcm63xx_wdt.c.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/watchdog/Kconfig       |  2 +-
 drivers/watchdog/bcm7038_wdt.c | 89 ++++++++++++++++++++++++++--------
 2 files changed, 69 insertions(+), 22 deletions(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index bf59faeb3de1..324aa942b182 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1756,7 +1756,7 @@ config BCM7038_WDT
 	tristate "BCM7038 Watchdog"
 	select WATCHDOG_CORE
 	depends on HAS_IOMEM
-	depends on ARCH_BRCMSTB || BMIPS_GENERIC || COMPILE_TEST
+	depends on ARCH_BCM4908 || ARCH_BRCMSTB || BMIPS_GENERIC || COMPILE_TEST
 	help
 	 Watchdog driver for the built-in hardware in Broadcom 7038 and
 	 later SoCs used in set-top boxes.  BCM7038 was made public
diff --git a/drivers/watchdog/bcm7038_wdt.c b/drivers/watchdog/bcm7038_wdt.c
index acaaa0005d5b..352689f869c1 100644
--- a/drivers/watchdog/bcm7038_wdt.c
+++ b/drivers/watchdog/bcm7038_wdt.c
@@ -9,6 +9,7 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/watchdog.h>
@@ -18,14 +19,17 @@
 #define WDT_STOP_1		0xee00
 #define WDT_STOP_2		0x00ee
 
-#define WDT_TIMEOUT_REG		0x0
-#define WDT_CMD_REG		0x4
-
 #define WDT_MIN_TIMEOUT		1 /* seconds */
 #define WDT_DEFAULT_TIMEOUT	30 /* seconds */
 #define WDT_DEFAULT_RATE	27000000
 
+enum bcm63xx_wdt_soc {
+	BCM63XX_WDT_SOC_BCM4908,
+	BCM63XX_WDT_SOC_BCM7038,
+};
+
 struct bcm7038_watchdog {
+	enum bcm63xx_wdt_soc	soc;
 	void __iomem		*base;
 	struct watchdog_device	wdd;
 	u32			rate;
@@ -34,8 +38,52 @@ struct bcm7038_watchdog {
 
 static bool nowayout = WATCHDOG_NOWAYOUT;
 
-static inline void bcm7038_wdt_write(u32 value, void __iomem *addr)
+static const struct of_device_id bcm7038_wdt_match[] = {
+	{ .compatible = "brcm,bcm4908-wdt", .data = (const void *)BCM63XX_WDT_SOC_BCM4908, },
+	{ .compatible = "brcm,bcm7038-wdt", .data = (const void *)BCM63XX_WDT_SOC_BCM7038, },
+	{},
+};
+MODULE_DEVICE_TABLE(of, bcm7038_wdt_match);
+
+enum bcm7038_wdt_regs {
+	BCM63XX_WDT_REG_DEFVAL = 0,
+	BCM63XX_WDT_REG_CTL,
+	BCM63XX_WDT_REG_SOFTRESET,
+};
+
+static const u16 bcm7038_wdt_regs_bcm4908[] = {
+	[BCM63XX_WDT_REG_DEFVAL]	= 0x28,
+	[BCM63XX_WDT_REG_CTL]		= 0x2c,
+	[BCM63XX_WDT_REG_SOFTRESET]	= 0x34,
+};
+
+static const u16 bcm7038_wdt_regs_bcm7038[] = {
+	[BCM63XX_WDT_REG_DEFVAL]	= 0x00,
+	[BCM63XX_WDT_REG_CTL]		= 0x04,
+};
+
+static void __iomem *bcm7038_wdt_reg_addr(struct watchdog_device *wdog,
+					  enum bcm7038_wdt_regs reg)
 {
+	struct bcm7038_watchdog *wdt = watchdog_get_drvdata(wdog);
+	void __iomem *addr = wdt->base;
+
+	switch (wdt->soc) {
+	case BCM63XX_WDT_SOC_BCM4908:
+		return addr + bcm7038_wdt_regs_bcm4908[reg];
+	case BCM63XX_WDT_SOC_BCM7038:
+		return addr + bcm7038_wdt_regs_bcm7038[reg];
+	default:
+		WARN_ON(1);
+		return NULL;
+	}
+}
+
+static void bcm7038_wdt_write(struct watchdog_device *wdog,
+			      enum bcm7038_wdt_regs reg, u32 value)
+{
+	void __iomem *addr = bcm7038_wdt_reg_addr(wdog, reg);
+
 	/* MIPS chips strapped for BE will automagically configure the
 	 * peripheral registers for CPU-native byte order.
 	 */
@@ -45,8 +93,11 @@ static inline void bcm7038_wdt_write(u32 value, void __iomem *addr)
 		writel_relaxed(value, addr);
 }
 
-static inline u32 bcm7038_wdt_read(void __iomem *addr)
+static inline u32 bcm7038_wdt_read(struct watchdog_device *wdog,
+				   enum bcm7038_wdt_regs reg)
 {
+	void __iomem *addr = bcm7038_wdt_reg_addr(wdog, reg);
+
 	if (IS_ENABLED(CONFIG_MIPS) && IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
 		return __raw_readl(addr);
 	else
@@ -60,15 +111,13 @@ static void bcm7038_wdt_set_timeout_reg(struct watchdog_device *wdog)
 
 	timeout = wdt->rate * wdog->timeout;
 
-	bcm7038_wdt_write(timeout, wdt->base + WDT_TIMEOUT_REG);
+	bcm7038_wdt_write(wdog, BCM63XX_WDT_REG_DEFVAL, timeout);
 }
 
 static int bcm7038_wdt_ping(struct watchdog_device *wdog)
 {
-	struct bcm7038_watchdog *wdt = watchdog_get_drvdata(wdog);
-
-	bcm7038_wdt_write(WDT_START_1, wdt->base + WDT_CMD_REG);
-	bcm7038_wdt_write(WDT_START_2, wdt->base + WDT_CMD_REG);
+	bcm7038_wdt_write(wdog, BCM63XX_WDT_REG_CTL, WDT_START_1);
+	bcm7038_wdt_write(wdog, BCM63XX_WDT_REG_CTL, WDT_START_2);
 
 	return 0;
 }
@@ -83,10 +132,8 @@ static int bcm7038_wdt_start(struct watchdog_device *wdog)
 
 static int bcm7038_wdt_stop(struct watchdog_device *wdog)
 {
-	struct bcm7038_watchdog *wdt = watchdog_get_drvdata(wdog);
-
-	bcm7038_wdt_write(WDT_STOP_1, wdt->base + WDT_CMD_REG);
-	bcm7038_wdt_write(WDT_STOP_2, wdt->base + WDT_CMD_REG);
+	bcm7038_wdt_write(wdog, BCM63XX_WDT_REG_CTL, WDT_STOP_1);
+	bcm7038_wdt_write(wdog, BCM63XX_WDT_REG_CTL, WDT_STOP_2);
 
 	return 0;
 }
@@ -107,7 +154,7 @@ static unsigned int bcm7038_wdt_get_timeleft(struct watchdog_device *wdog)
 	struct bcm7038_watchdog *wdt = watchdog_get_drvdata(wdog);
 	u32 time_left;
 
-	time_left = bcm7038_wdt_read(wdt->base + WDT_CMD_REG);
+	time_left = bcm7038_wdt_read(wdog, BCM63XX_WDT_REG_CTL);
 
 	return time_left / wdt->rate;
 }
@@ -134,6 +181,7 @@ static void bcm7038_clk_disable_unprepare(void *data)
 static int bcm7038_wdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	const struct of_device_id *of_id;
 	struct bcm7038_watchdog *wdt;
 	int err;
 
@@ -143,6 +191,11 @@ static int bcm7038_wdt_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, wdt);
 
+	of_id = of_match_device(bcm7038_wdt_match, dev);
+	if (!of_id)
+		return -EINVAL;
+	wdt->soc = (enum bcm63xx_wdt_soc)of_id->data;
+
 	wdt->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(wdt->base))
 		return PTR_ERR(wdt->base);
@@ -211,12 +264,6 @@ static int bcm7038_wdt_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(bcm7038_wdt_pm_ops, bcm7038_wdt_suspend,
 			 bcm7038_wdt_resume);
 
-static const struct of_device_id bcm7038_wdt_match[] = {
-	{ .compatible = "brcm,bcm7038-wdt" },
-	{},
-};
-MODULE_DEVICE_TABLE(of, bcm7038_wdt_match);
-
 static struct platform_driver bcm7038_wdt_driver = {
 	.probe		= bcm7038_wdt_probe,
 	.driver		= {
-- 
2.31.1

