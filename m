Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41CF744EF9D
	for <lists+linux-mips@lfdr.de>; Fri, 12 Nov 2021 23:46:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236070AbhKLWtj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 12 Nov 2021 17:49:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236048AbhKLWtf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 12 Nov 2021 17:49:35 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 374F0C061203;
        Fri, 12 Nov 2021 14:46:44 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id gx15-20020a17090b124f00b001a695f3734aso8792148pjb.0;
        Fri, 12 Nov 2021 14:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KS/QFIB9iRAFf7dtvYUgDKvUDEV07sqKABKwHV353E8=;
        b=BIyGn2he8gllDdl0etGy+C7nF7ouoa4payiBpYKO02FR92clorAeJyRlMuZ+vsVX3N
         vz9sWOo4jivx3CsPYWuWpuEz6Cu5TUDzgfo+F5KR97JWIaWeFvz8FvLzU3+W/KMq2BH+
         EiSnPIpR+dALq/ewZXWf6h5I+It3CbAUbEG+YQCYbGzHW4hD164hhkkohG1z2WDu5XdO
         jKvWybiNzDMRiaUety1P7M9rlWeNxowMitDMYvUTwCthHa0+ch2c0ICxdYLlFs8LIWrF
         PvUgudb+P6bZ8yE1PZvcMX9p3WnMa+WxWv/X/djHRHjYot9IM1vSAeYaY1pJlMMx2Gk4
         F3eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KS/QFIB9iRAFf7dtvYUgDKvUDEV07sqKABKwHV353E8=;
        b=CL+mjAXMG8kIVglkL2KXcIrZH/RK++IsltG5uflr0wLUKmWghgBDX2RoE0DPIr+GHS
         Zgy33DoAT/ZD2UWw+TIoBKSoN8j2aUuwnO16F8jvg3VHpPb/gk0heR7o61SEkLFOm78o
         nCTFsfGPjKdxwtQ1ovyvpz3+n+nYmWTot2nmqkhz9vu3ssm+q5phWwN3SZfDq0CaSjJZ
         qJpGWC9n6CjftTCi5tgE7Uu6Ec6DUz2FvA1kr7OgzSF0vrAEI87EYsRMT9IiGC4GK6dT
         BgLpbMkB+2iH2keY/GDQ7y0PywNaRc03VyK97qfbK9K2hy2y2enuk5Zv3AlGGTjzoPgX
         BIfQ==
X-Gm-Message-State: AOAM5307ZekDW68WeKIZawSngkKtvysPIYXbmEwKyJGH1a5CiuA5Fvel
        92w2myD5ZsDpOuRWALU9en7KcpzDyhs=
X-Google-Smtp-Source: ABdhPJxGsIhLDTyWc27klyD4bVPuwkTAn1EX/VDpKm9GtaZ5DqXbPZeWhXdx4UwrqhlS6IgCoAl5Wg==
X-Received: by 2002:a17:902:9882:b0:143:91ca:ca6e with SMTP id s2-20020a170902988200b0014391caca6emr12127134plp.64.1636757203382;
        Fri, 12 Nov 2021 14:46:43 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id k14sm5647004pga.65.2021.11.12.14.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 14:46:42 -0800 (PST)
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
Subject: [PATCH v5 3/7] watchdog: bcm7038_wdt: Support platform data configuration
Date:   Fri, 12 Nov 2021 14:46:32 -0800
Message-Id: <20211112224636.395101-4-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211112224636.395101-1-f.fainelli@gmail.com>
References: <20211112224636.395101-1-f.fainelli@gmail.com>
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

