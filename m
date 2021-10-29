Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D58643FEE8
	for <lists+linux-mips@lfdr.de>; Fri, 29 Oct 2021 17:01:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbhJ2PED (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 Oct 2021 11:04:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229807AbhJ2PEC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 Oct 2021 11:04:02 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03943C061570;
        Fri, 29 Oct 2021 08:01:34 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id bi35so21576907lfb.9;
        Fri, 29 Oct 2021 08:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=POI671egV+JT5DmVV8hgnUJu1/BtlTBpN4RvR23Avbk=;
        b=R9hkJSJqC5/XUnefXE3XpzDh/dqHF69SgarQlekH0rRN5WOscJGEzaLu/GrLOhdxwj
         721cvHU++LHvac/9Yzt0JM/RLvuTHUqMyH5+ErOVqjKwj2dinKME8ipEOXZmtgcH1vuY
         xUMnglbOzPkgb/VV3LDP/+I2sZ6SvD7Mo10dJEUOCivyZuNQmvsN2ASmAAqY8jU0JpWJ
         lwtPywBFGfzAheL0fzd41VEB3CPSeKbiutt0SmxHVQ3vQWymEmkAn5GXthSrfQAlb6gq
         khE98iDNtmukSfCJ+9RWURkiMg1VYxbYxQ1mvRiMrPH7CLe60xB9Dru8vSJIikPTczya
         Vaeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=POI671egV+JT5DmVV8hgnUJu1/BtlTBpN4RvR23Avbk=;
        b=PlOsNuJd/Oxfq6WXZp2/eM/P3Hd2Zq0ZvZQvrk3nd2JphahlpbTSzwlfAYXq2iWwEZ
         UKY3ttZgTN3mtsWys4t05mbgM3q90OPx4j5aPZIzKMFDCdAbLcLeB8Gmy350ihNuyim5
         wISHHmUJzzfGmHU4SLzKeMjDjUw2MP4iLIELQPTKVRlKoIqvTFX0ruhzm6SsQjarhcTB
         N+XU3udG40pm4NqOjwFZF+6O/N7uGxFk1Tyrl2hYtoSRULhPlmEnHrjFNuReEqvgpgcG
         Qt9oa26qrx1jo28EFtuJ61G6CG7/d1ph5jiCIT8+JAW8k7pBxV8cYTaUIkneUdZhsqsW
         YfCQ==
X-Gm-Message-State: AOAM532i8YkOto74B85r0lLtVq8auXRg4VP+PQGrouF5r9qO3WcXNjbi
        IH8PsV3DhvdtpkcjnP2+Avw=
X-Google-Smtp-Source: ABdhPJyU/Il6ZM3I3exBvsbI2kvDQMEoGYkRXwj9DMjl5HtnA7skrG0r9o4wpOqzZWBKaGJ0JIgYAg==
X-Received: by 2002:ac2:562c:: with SMTP id b12mr10495475lff.422.1635519690700;
        Fri, 29 Oct 2021 08:01:30 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id s13sm90358ljo.56.2021.10.29.08.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 08:01:30 -0700 (PDT)
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
Subject: [PATCH V2 3/3] watchdog: bcm7038_wdt: support BCM4908 SoC
Date:   Fri, 29 Oct 2021 17:00:51 +0200
Message-Id: <20211029150051.3955-3-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211029150051.3955-1-zajec5@gmail.com>
References: <20211029150051.3955-1-zajec5@gmail.com>
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

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
V2: Simplify commit message
    Use registers names matching Broadcom's SDK / docs
---
 drivers/watchdog/Kconfig       |  2 +-
 drivers/watchdog/bcm7038_wdt.c | 89 ++++++++++++++++++++++++++--------
 2 files changed, 69 insertions(+), 22 deletions(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 0fab8230b663..ca600e6d21be 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1743,7 +1743,7 @@ config BCM7038_WDT
 	tristate "BCM7038 Watchdog"
 	select WATCHDOG_CORE
 	depends on HAS_IOMEM
-	depends on ARCH_BRCMSTB || BMIPS_GENERIC || COMPILE_TEST
+	depends on ARCH_BCM4908 || ARCH_BRCMSTB || BMIPS_GENERIC || COMPILE_TEST
 	help
 	 Watchdog driver for the built-in hardware in Broadcom 7038 and
 	 later SoCs used in set-top boxes.  BCM7038 was made public
diff --git a/drivers/watchdog/bcm7038_wdt.c b/drivers/watchdog/bcm7038_wdt.c
index acaaa0005d5b..79408c4f2615 100644
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
 
+enum bcm7038_wdt_soc {
+	BCM7038_WDT_SOC_BCM4908,
+	BCM7038_WDT_SOC_BCM7038,
+};
+
 struct bcm7038_watchdog {
+	enum bcm7038_wdt_soc	soc;
 	void __iomem		*base;
 	struct watchdog_device	wdd;
 	u32			rate;
@@ -34,8 +38,52 @@ struct bcm7038_watchdog {
 
 static bool nowayout = WATCHDOG_NOWAYOUT;
 
-static inline void bcm7038_wdt_write(u32 value, void __iomem *addr)
+static const struct of_device_id bcm7038_wdt_match[] = {
+	{ .compatible = "brcm,bcm4908-wdt", .data = (const void *)BCM7038_WDT_SOC_BCM4908, },
+	{ .compatible = "brcm,bcm7038-wdt", .data = (const void *)BCM7038_WDT_SOC_BCM7038, },
+	{},
+};
+MODULE_DEVICE_TABLE(of, bcm7038_wdt_match);
+
+enum bcm7038_wdt_regs {
+	BCM7038_WDT_REG_DEF_COUNT = 0,
+	BCM7038_WDT_REG_CTL,
+	BCM7038_WDT_REG_SOFT_RST,
+};
+
+static const u16 bcm7038_wdt_regs_bcm4908[] = {
+	[BCM7038_WDT_REG_DEF_COUNT]	= 0x28,
+	[BCM7038_WDT_REG_CTL]		= 0x2c,
+	[BCM7038_WDT_REG_SOFT_RST]	= 0x34,
+};
+
+static const u16 bcm7038_wdt_regs_bcm7038[] = {
+	[BCM7038_WDT_REG_DEF_COUNT]	= 0x00,
+	[BCM7038_WDT_REG_CTL]		= 0x04,
+};
+
+static void __iomem *bcm7038_wdt_reg_addr(struct watchdog_device *wdog,
+					  enum bcm7038_wdt_regs reg)
 {
+	struct bcm7038_watchdog *wdt = watchdog_get_drvdata(wdog);
+	void __iomem *addr = wdt->base;
+
+	switch (wdt->soc) {
+	case BCM7038_WDT_SOC_BCM4908:
+		return addr + bcm7038_wdt_regs_bcm4908[reg];
+	case BCM7038_WDT_SOC_BCM7038:
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
+	bcm7038_wdt_write(wdog, BCM7038_WDT_REG_DEF_COUNT, timeout);
 }
 
 static int bcm7038_wdt_ping(struct watchdog_device *wdog)
 {
-	struct bcm7038_watchdog *wdt = watchdog_get_drvdata(wdog);
-
-	bcm7038_wdt_write(WDT_START_1, wdt->base + WDT_CMD_REG);
-	bcm7038_wdt_write(WDT_START_2, wdt->base + WDT_CMD_REG);
+	bcm7038_wdt_write(wdog, BCM7038_WDT_REG_CTL, WDT_START_1);
+	bcm7038_wdt_write(wdog, BCM7038_WDT_REG_CTL, WDT_START_2);
 
 	return 0;
 }
@@ -83,10 +132,8 @@ static int bcm7038_wdt_start(struct watchdog_device *wdog)
 
 static int bcm7038_wdt_stop(struct watchdog_device *wdog)
 {
-	struct bcm7038_watchdog *wdt = watchdog_get_drvdata(wdog);
-
-	bcm7038_wdt_write(WDT_STOP_1, wdt->base + WDT_CMD_REG);
-	bcm7038_wdt_write(WDT_STOP_2, wdt->base + WDT_CMD_REG);
+	bcm7038_wdt_write(wdog, BCM7038_WDT_REG_CTL, WDT_STOP_1);
+	bcm7038_wdt_write(wdog, BCM7038_WDT_REG_CTL, WDT_STOP_2);
 
 	return 0;
 }
@@ -107,7 +154,7 @@ static unsigned int bcm7038_wdt_get_timeleft(struct watchdog_device *wdog)
 	struct bcm7038_watchdog *wdt = watchdog_get_drvdata(wdog);
 	u32 time_left;
 
-	time_left = bcm7038_wdt_read(wdt->base + WDT_CMD_REG);
+	time_left = bcm7038_wdt_read(wdog, BCM7038_WDT_REG_CTL);
 
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
+	wdt->soc = (enum bcm7038_wdt_soc)of_id->data;
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

