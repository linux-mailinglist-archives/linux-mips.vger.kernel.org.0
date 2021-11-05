Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 653E44465FC
	for <lists+linux-mips@lfdr.de>; Fri,  5 Nov 2021 16:42:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233506AbhKEPpC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 Nov 2021 11:45:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233252AbhKEPo5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 5 Nov 2021 11:44:57 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ED4BC061205;
        Fri,  5 Nov 2021 08:42:18 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id x131so4020056pfc.12;
        Fri, 05 Nov 2021 08:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KS/QFIB9iRAFf7dtvYUgDKvUDEV07sqKABKwHV353E8=;
        b=JoVkkcDwILwUiocAfNN7cj2sO19IjA2XBxqfzYB87vvIvITa39tkTepB/7nZAEVxGq
         liMEvAaTYX8Mj+SZqda9YfhioUih5VcEQkuEOfs3ECUR+ZfdIFoNtQWQVnEOGUgTF79K
         2kY5kUrYvK6bDlIVQEdWAlBMh2VC0g38R0zqBGSi4SdcDTom9W9DAYEjQPU8r4mIPZtQ
         J3GY9zpi1RSg8KluP6FGF/ww50iuORMMH5l1NPyLOKeCuLnaHHOfVrklt9zVnrjFzmBc
         wzKOFq0zR/vCofN4Oxoa/SHRFUbkW34jivQrNomPjZuQdhNHQpNfh0/mWcMzCaIuYJ9P
         5qhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KS/QFIB9iRAFf7dtvYUgDKvUDEV07sqKABKwHV353E8=;
        b=7cnb55Sy51tSHk7OfbxYapBR9gLGDd4cADQFSMOD8Mlp5bjXDthNnewzIKe/RZoZPd
         90N33BWkyomzNLDGYCCkUyqW357BCft52PlF/ZmoVAL/n9FT2SPuLPjr2v5gQVkQQv4/
         DE3yLrdk2OHMilKkB54Z8pmKz2pEPUYaAH8Ynfwr8xrZqhxlmMwyEemiPDxHkOXp+c9c
         r2YeObFAyFliL7BtnsjboY1xef63+ZSyj2cRhJ8IsuxQbag4TCi1fvoGZiH0K6KZKmnS
         qwDk72UOyEJ2ceTQzWhr0qfPmPD53KSK9CjHo7VpzYrPx8tv4KUdQ772zzvexjFbnRTP
         omTg==
X-Gm-Message-State: AOAM5316qOJoCQ6+t2Th9WUiyDjFMuiqYvyd/7d7wMQ18eL8f2dF4Ndb
        xX1jn8eDOQiSlWErvA11bfhqDl6yOh0=
X-Google-Smtp-Source: ABdhPJwrEy/mXd3F+6ZsSqC0bKKGMmeEjHrZI+54vC9BIZ8bVwKr38+xbqen8ZrgaWENlv4RLwt/RQ==
X-Received: by 2002:a63:86c1:: with SMTP id x184mr35817576pgd.114.1636126937333;
        Fri, 05 Nov 2021 08:42:17 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id b8sm7547097pfi.103.2021.11.05.08.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 08:42:16 -0700 (PDT)
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
Subject: [PATCH v4 3/7] watchdog: bcm7038_wdt: Support platform data configuration
Date:   Fri,  5 Nov 2021 08:42:04 -0700
Message-Id: <20211105154208.614260-4-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211105154208.614260-1-f.fainelli@gmail.com>
References: <20211105154208.614260-1-f.fainelli@gmail.com>
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

