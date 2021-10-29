Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EFD444020B
	for <lists+linux-mips@lfdr.de>; Fri, 29 Oct 2021 20:34:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231262AbhJ2ShM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 Oct 2021 14:37:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230419AbhJ2ShH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 Oct 2021 14:37:07 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06FDFC061714;
        Fri, 29 Oct 2021 11:34:39 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id s24so7426887plp.0;
        Fri, 29 Oct 2021 11:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KS/QFIB9iRAFf7dtvYUgDKvUDEV07sqKABKwHV353E8=;
        b=B2UiioGffHt5mNj/7Xj0XMUQPH4n2y9lJ+N3OnGgeeAzT8KxZDRGpLrMCumrRjUmRJ
         1RPP2acX4eeX9SIbzAZ99j95ciYvTmwSNtMYk0UwFI/1IQwObaplTlnJyy7lP4LOUyAM
         6RuGulPPn1qhI9L+f4HbGO/YIsEzxJndBlZsqdIqKRIhZEI6W8ybtDrSrcETrJ2mhxgA
         IIxjSlRdqEHUEdeC8fQ/5F0+RFwvlPr7PyozJOdua9/MdjEwQg3sKflNNqcRjP1md5gb
         rebRt2KCWqsKyjHxoX9bCL94Nff+TKjlG1y6edsJemRGx6PPgOy9/nxkCd3qWeilf/ys
         h44g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KS/QFIB9iRAFf7dtvYUgDKvUDEV07sqKABKwHV353E8=;
        b=u6xvkQxHD2vPxERjue4r8C4//CEpRiIEnuDXongyg4igl07X6GeRVrdSAKAmO3pKnJ
         Fq95OfxzCLFQQAQ9XSSSc6IPQxdPFergLayehooKFfJXIroT5ZzjsdIOVu8B1rVfEVqT
         0r6hvlCIRqexVlIgLkPq8YbGDjG+aFGOA592buT9LDpQD4ZCTTwDl2u8jjJRYUT+0TtZ
         M36EQtn3Zf0W40MBl78jvlR35YQO2UhUj0rGE8Ca8apa0+mF3/cHi3wR94dRpYVRSGA5
         ouxblZYZk6wFTHWnH3AG8TncLVAZYqC2yT5Fff37FaryKK656pZFl9FEMK1MsJS6VsCA
         /ntg==
X-Gm-Message-State: AOAM531y9/+QsyTR89ClZm6+tewos6OjvkqSUFCRPUS3ER+y8Yljmn3P
        /W2Xl6VP0NEmet1sgU5biVsinm6pN0I=
X-Google-Smtp-Source: ABdhPJxMVj6wK3FCKR+yxIexnahKPndvOCDIRDoFoUymJ4h+UoK5h17lbhNMYdXIkkMtI81gg4xdLQ==
X-Received: by 2002:a17:90b:3802:: with SMTP id mq2mr13182411pjb.213.1635532478146;
        Fri, 29 Oct 2021 11:34:38 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id j15sm7730868pfh.35.2021.10.29.11.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 11:34:37 -0700 (PDT)
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
Subject: [PATCH v2 3/7] watchdog: bcm7038_wdt: Support platform data configuration
Date:   Fri, 29 Oct 2021 11:34:26 -0700
Message-Id: <20211029183430.4086765-4-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029183430.4086765-1-f.fainelli@gmail.com>
References: <20211029183430.4086765-1-f.fainelli@gmail.com>
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

