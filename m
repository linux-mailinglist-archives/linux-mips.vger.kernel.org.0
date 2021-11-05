Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC9AD446607
	for <lists+linux-mips@lfdr.de>; Fri,  5 Nov 2021 16:43:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233643AbhKEPpH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 Nov 2021 11:45:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233345AbhKEPpD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 5 Nov 2021 11:45:03 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C36E1C061714;
        Fri,  5 Nov 2021 08:42:22 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id c126so760187pfb.0;
        Fri, 05 Nov 2021 08:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S94ZmIDNbR8JM2YMz6OlEqOmqcwIJH7y0fh6ZVlIVsQ=;
        b=IrBZesdN//OmanRHaM50grVnTDwU96QjLEedKib+QYdMa+iZEXMEtxi0sVThuShxmR
         8cuAMq1XCfDSe9p60DUFmG+jgo1IUr2x35dpq1g+e41qPZZ7qRsVf8Y7n4q75i8Yd6hb
         9X0qbqP8FrcyZHI6D57GWGMXvVz7XVSEDzy5I0tG0V9HR9py2g1gNq59ejF7A5Xy+yM6
         pr7hlDbgNVEOFAgWfA6g98Jvn6xvLRhUWErgOGomGJEoH5Z13ypCafRXxzI6OYaPfpXe
         Mbvu1zlGYEV2v39fnzyqntQllN1Tcfb2ha/6T5J+tlkaA1l/Wyu92Z6+dhcZHx3ks9pj
         bf3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S94ZmIDNbR8JM2YMz6OlEqOmqcwIJH7y0fh6ZVlIVsQ=;
        b=qeYH+7ycnqtcC4clbyTPtiWDu80D7z7AuFpAT52tXku6166W9uZb742MbJeC4kYcFk
         khC1IlgHwDFqkkNpi1xpRaDL40P0T6oy7ROhaUX/yhefGiltqtrxuvmmD7dlIY8JXAji
         kpp8BuQ8MvRYJR1jdMVE7iL9MctTHayrhge5Mz3xMs3ZeBxwWhpfDbrllwTCKOUpsM3J
         0RB4JZbB9N4L+9EMCQD47wS3pRv8qGwE2tkkX66Zr3+6+zyLLfUh6rkz/0AtaP1pnAXQ
         sne74qReJBZ1CBPTcNz5KyyiQA3ksaPji52FUZWUPO0c7Bf769su/7byirVPJBLRUzQI
         9ceA==
X-Gm-Message-State: AOAM533sN5ASoMG6dGCc1ZgvoEV8pXjTJfo0BB8wyklyTzs2SE5q1knE
        k3Ob3vUTnZig9AuDqoulXZIeZvUGIHQ=
X-Google-Smtp-Source: ABdhPJyvTCBitdbfgeF8q9FUG9/zMiqLBN/vbJt1PRYZDBMTRRHLxnejUkUZDpE3kISqJ4cUgHrz8g==
X-Received: by 2002:a63:5c6:: with SMTP id 189mr32654852pgf.187.1636126941865;
        Fri, 05 Nov 2021 08:42:21 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id b8sm7547097pfi.103.2021.11.05.08.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 08:42:21 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com (maintainer:BROADCOM BCM63XX ARM
        ARCHITECTURE), Justin Chen <justinpopo6@gmail.com>,
        linux-watchdog@vger.kernel.org (open list:WATCHDOG DEVICE DRIVERS),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        linux-mips@vger.kernel.org (open list:MIPS),
        linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM63XX
        ARM ARCHITECTURE)
Subject: [PATCH v4 6/7] MIPS: BCM63XX: Provide platform data to watchdog device
Date:   Fri,  5 Nov 2021 08:42:07 -0700
Message-Id: <20211105154208.614260-7-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211105154208.614260-1-f.fainelli@gmail.com>
References: <20211105154208.614260-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In order to utilize the bcm7038_wdt.c driver which needs to know the
clock name to obtain, pass it via platform data using the
bcm7038_wdt_platform_data structure.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/mips/bcm63xx/dev-wdt.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/mips/bcm63xx/dev-wdt.c b/arch/mips/bcm63xx/dev-wdt.c
index 2a2346a99bcb..42130914a3c2 100644
--- a/arch/mips/bcm63xx/dev-wdt.c
+++ b/arch/mips/bcm63xx/dev-wdt.c
@@ -9,6 +9,7 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
+#include <linux/platform_data/bcm7038_wdt.h>
 #include <bcm63xx_cpu.h>
 
 static struct resource wdt_resources[] = {
@@ -19,11 +20,18 @@ static struct resource wdt_resources[] = {
 	},
 };
 
+static struct bcm7038_wdt_platform_data bcm63xx_wdt_pdata = {
+	.clk_name	= "periph",
+};
+
 static struct platform_device bcm63xx_wdt_device = {
 	.name		= "bcm63xx-wdt",
 	.id		= -1,
 	.num_resources	= ARRAY_SIZE(wdt_resources),
 	.resource	= wdt_resources,
+	.dev		= {
+		.platform_data = &bcm63xx_wdt_pdata,
+	},
 };
 
 int __init bcm63xx_wdt_register(void)
-- 
2.25.1

