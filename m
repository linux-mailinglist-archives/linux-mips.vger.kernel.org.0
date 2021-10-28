Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8781243E72A
	for <lists+linux-mips@lfdr.de>; Thu, 28 Oct 2021 19:23:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230506AbhJ1RZ6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Oct 2021 13:25:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230401AbhJ1RZ4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 Oct 2021 13:25:56 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4E27C061570;
        Thu, 28 Oct 2021 10:23:29 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id r5so4941185pls.1;
        Thu, 28 Oct 2021 10:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2RKkDNLdJnq4A2BSmMNFHi7ZNvXEVLrWpln1RnpbQ84=;
        b=mIjYJzIRfft82DhqEGECkDX9LHm4NnbWhsG1fGHgoS0f7ms33Z87vnyKI5uM0AI5Zp
         82p+ftxZu9RkcE/+mqqvxXJcjEwsPEs8geF/mHglBfgnNma6yIj95VW2iPMo7bi8H4Gl
         aK3NCLTprmeLGZDkom9Dv+6iUJ4mrkKxgi+uROdbCjHDjxDRqsSemsxn6vgnsEN6ZHAy
         2g0n3QAYsFsJvWHGFUFoI0SB+LALYhf2islf7tNaBqF1/Lk2/MN+kM9ZdOqWdRf0luyX
         pToJfIJAsuCNZcm+lgoReySHpHk+0S6GUhhblvquVpX6lIhwB0LcUa7GGi0mxWaJ91uU
         4WSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2RKkDNLdJnq4A2BSmMNFHi7ZNvXEVLrWpln1RnpbQ84=;
        b=kxUjM66ZSSukkHpaOxpl2ukbDZQFNrTieFB4TUTX0ArYazctAoJg8a/esQ9lhO+0av
         U2O/4nnFlGh8DFEx/yMSJai2JcF2UcuzjCgpU3tjWkJSBIgRdOWPlhdEjToJUByw6yyU
         bZpxHw4f7dqYetvoClY0TqGRUUIvlGMqR58lho6v/ETAkeUkz30YNUFWHbl+atki0HZh
         Fo4+SXV/18fOtAhQkm2qylH0KOx1hhQFHr9x/aSVt9Op7M8r5h9efMpigyp4eNJXHOvx
         4XsEx9xB6/Wl3vAPQ5OTA5pea145YGTRxRG7lvpXl8JHXtUyF7JygNSxUgck0Nkwa+US
         itMA==
X-Gm-Message-State: AOAM531uqRlPkiqVdSpmKleJAU2uWlfh5Vlirr3QHctzR9VZlvnKPIZB
        q69e30uSOLWhITgAwjAO6vH5npNTIrw=
X-Google-Smtp-Source: ABdhPJwHjhoDxNVqfzSn3yRcRis3LwJ3IG+q6WQL9QaTHeha9ltR+mN/A6imgl6Cv9Zj67of4VoXjg==
X-Received: by 2002:a17:903:24c:b0:13f:2377:ef3a with SMTP id j12-20020a170903024c00b0013f2377ef3amr5157648plh.59.1635441809012;
        Thu, 28 Oct 2021 10:23:29 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id l20sm3222499pgo.67.2021.10.28.10.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 10:23:28 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     rafal@milecki.pl, Florian Fainelli <f.fainelli@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
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
Subject: [PATCH 3/7] watchdog: bcm7038_wdt: Support platform data configuration
Date:   Thu, 28 Oct 2021 10:23:18 -0700
Message-Id: <20211028172322.4021440-4-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028172322.4021440-1-f.fainelli@gmail.com>
References: <20211028172322.4021440-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The BCM7038 watchdog driver needs to be able to obtain a specific clock
name on BCM63xx platforms which is the "periph" clock ticking at 50MHz.
make it possible to specify the clock name to obtain via platform data.

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

