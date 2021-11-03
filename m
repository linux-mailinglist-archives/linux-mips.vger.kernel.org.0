Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDD12444B61
	for <lists+linux-mips@lfdr.de>; Thu,  4 Nov 2021 00:14:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231359AbhKCXRS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Nov 2021 19:17:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230108AbhKCXQ5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 3 Nov 2021 19:16:57 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07E9DC061203;
        Wed,  3 Nov 2021 16:14:20 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id j9so3735595pgh.1;
        Wed, 03 Nov 2021 16:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KS/QFIB9iRAFf7dtvYUgDKvUDEV07sqKABKwHV353E8=;
        b=me12WnyGdwLMVZ0v7borp06LEDIYMoUZ8EFi4SMmQIiumh8992jWROHeUwgURRBBOg
         xF35bG0dLz6tdn4MXlkgtrYTEUCK3DNf4puhsOFCdxXgEGi0K3vsI/D4NDu5473t3n2G
         P5dmxtDTT2Ku77KOnbh0oCVl7/x4MKvMOdRdRCz1JDW0OJ3k/9BKeWv6VOC7mTj1NU/z
         7OgY2vnKe6GsfY9ozLDQBCb8gHPFRL4Xg5pDAgkGm1mVGIU4eYkPYmoxdLrqoYIXPQhf
         u/x3UwASxkFqlc3qDkOSa24AXhh0sht6XZJ8CNqz/FI6xQlmuSbokimXr0kAmIYCDmxG
         brgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KS/QFIB9iRAFf7dtvYUgDKvUDEV07sqKABKwHV353E8=;
        b=TvG9NZji6ulMV4BqkkVS9NyOzA1RA62ezgepWaD9Ojwi2TMb55rBbuauMjijPspP1z
         wl6ux8W7aC3ph2dJlEfz5/u0VOzITysQAyRFYDE8+1EGM1wInIeQeGPIojZeXj0KPdim
         07CfoBsignhTZ26j6FJvbsNpbnIi5Rf8R4X8NNnqaZYBEPAYXye6/3I1dHajjbMz/E+j
         ow8O7IkeDeLb2lCxWs2Q2dLuwwvZzyO6/P9Bn/QzF/yYnAcfSqyunXyJhh0dqow6in2P
         nHoMC+13/QdkqtYKlGdT27T/g27zLpj+aBdKEzT6hdiBl/kKMx2BRU90EP0DLKONEe+5
         OK2Q==
X-Gm-Message-State: AOAM530cG1q2/R7o5MlVky76BNfhCWMuzZ+aGzTE1h6KiU6JrYb7Liap
        hx1ypmZNxbDg1tSdkVAyS3ZbIayPOE0=
X-Google-Smtp-Source: ABdhPJwtP9MBIxJTTfIoh7nHEOsZ8ARrx44Cp9SZ6rw4PTxqqwC4CDGcAM2Fw7zrsCMUI4lNs6Yi+Q==
X-Received: by 2002:a05:6a00:24d1:b0:481:1ee9:a253 with SMTP id d17-20020a056a0024d100b004811ee9a253mr19047097pfv.16.1635981259287;
        Wed, 03 Nov 2021 16:14:19 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id p7sm2613549pgn.52.2021.11.03.16.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 16:14:19 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
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
Subject: [PATCH v3 3/7] watchdog: bcm7038_wdt: Support platform data configuration
Date:   Wed,  3 Nov 2021 16:13:23 -0700
Message-Id: <20211103231327.385186-4-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103231327.385186-1-f.fainelli@gmail.com>
References: <20211103231327.385186-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The BCM7038 watchdog driver needs to be able to obtain a specific clock
name on BCM63xx platforms which is the "periph" clock ticking at 50MHz.
make it possible to specify the clock name to obtain via platform data.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/watchdog/bcm7038_wdt.c            | 8 +++++++-
 include/linux/platform_data/bcm7038_wdt.h | 8 ++++++++
 2 files changed, 15 insertions(+), 1 deletion(-)
 create mode 100644 include/linux/platform_data/bcm7038_wdt.h

diff --git a/drivers/watchdog/bcm7038_wdt.c b/drivers/watchdog/bcm7038_wdt.c
index acaaa0005d5b..506cd7ef9c77 100644
--- a/drivers/watchdog/bcm7038_wdt.c
+++ b/drivers/watchdog/bcm7038_wdt.c
@@ -10,6 +10,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/platform_data/bcm7038_wdt.h>
 #include <linux/pm.h>
 #include <linux/watchdog.h>
 
@@ -133,8 +134,10 @@ static void bcm7038_clk_disable_unprepare(void *data)
 
 static int bcm7038_wdt_probe(struct platform_device *pdev)
 {
+	struct bcm7038_wdt_platform_data *pdata = pdev->dev.platform_data;
 	struct device *dev = &pdev->dev;
 	struct bcm7038_watchdog *wdt;
+	const char *clk_name = NULL;
 	int err;
 
 	wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
@@ -147,7 +150,10 @@ static int bcm7038_wdt_probe(struct platform_device *pdev)
 	if (IS_ERR(wdt->base))
 		return PTR_ERR(wdt->base);
 
-	wdt->clk = devm_clk_get(dev, NULL);
+	if (pdata && pdata->clk_name)
+		clk_name = pdata->clk_name;
+
+	wdt->clk = devm_clk_get(dev, clk_name);
 	/* If unable to get clock, use default frequency */
 	if (!IS_ERR(wdt->clk)) {
 		err = clk_prepare_enable(wdt->clk);
diff --git a/include/linux/platform_data/bcm7038_wdt.h b/include/linux/platform_data/bcm7038_wdt.h
new file mode 100644
index 000000000000..e18cfd9ec8f9
--- /dev/null
+++ b/include/linux/platform_data/bcm7038_wdt.h
@@ -0,0 +1,8 @@
+#ifndef __BCM7038_WDT_PDATA_H
+#define __BCM7038_WDT_PDATA_H
+
+struct bcm7038_wdt_platform_data {
+	const char *clk_name;
+};
+
+#endif /* __BCM7038_WDT_PDATA_H */
-- 
2.25.1

