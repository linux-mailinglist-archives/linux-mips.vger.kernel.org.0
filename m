Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1954144EFAB
	for <lists+linux-mips@lfdr.de>; Fri, 12 Nov 2021 23:47:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235908AbhKLWtp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 12 Nov 2021 17:49:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236052AbhKLWti (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 12 Nov 2021 17:49:38 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC1C5C0613F5;
        Fri, 12 Nov 2021 14:46:47 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id t5-20020a17090a4e4500b001a0a284fcc2so8324127pjl.2;
        Fri, 12 Nov 2021 14:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S94ZmIDNbR8JM2YMz6OlEqOmqcwIJH7y0fh6ZVlIVsQ=;
        b=OM6XOf5hWr2D5bJKa9xIdGPgfJ/wfHAhF5GW3mWj6qfDVF4FeHyye5D4k88rGzgc4H
         39dPf0eKew71/uhYteVkUNIlNo36k4m608WAZjerNT3ViYvp8Ao9t11j1LylXc3M87KG
         nY975Z7PMwidrZ6Pp/X+GQm8Nx/c/XbySKgEkuHFQgw9ty/t09saO/i8+UoCdW+HIY2e
         oH6EX3m3a2O6ZX4P3qqV2dQVM76HmBQhkZJA4o+Zw53xXdo1HOy6Ey4ZXhcSRhw0/ZRj
         1BTV+Jt4Z0iuJvthAORUP1Wf+8yjLaWhYUVKBDHBXizASEOXMQtnbbHWjYKmbUkmrina
         K8Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S94ZmIDNbR8JM2YMz6OlEqOmqcwIJH7y0fh6ZVlIVsQ=;
        b=VNegyDsQSorFtbm0FsFcEPkuGcT7ogZXoAPP4qRRfUQ6uVen4yiQt3ZAlB3QJTNFoi
         owpCPUjkRgicfl58JOD3x8kqh2Mk3hb2ZxvzaH99i9IiMzIXPNt4wXzOjdSnttq5xt4a
         5iaoTSNSDVbkWSM+HhLVp32zUllYcM+c7ubw+HkWzNm7gjJIIgFqUZkjSVZsnGf7ZDLE
         3JmH/yc9zXjtQVI+NwJerJqrsit2Us4FLF1z10F+gqVhrEqoWGVketd/IwWrs1a6wODQ
         dzbh4SSamEshcKz1jHk3VpOfMaU6CmttdMTlcK/EiU5Cr6eakg59aAo2LcLKuhzrJkrr
         xMGA==
X-Gm-Message-State: AOAM533pyd1uabZ8LZHguMv3v4EBIBxuAhckIM/vGUDdkq6yaxahe7Ve
        dy3xJOR84tw4EK7KduBvfxZ7+gLGc9o=
X-Google-Smtp-Source: ABdhPJxjNRFyodytAdEAoxVQBOTuJ3dbe2y3zrt9uQEtSkMS1mXEcyi+CPAQFv95Bh0GVaKPrRVcqg==
X-Received: by 2002:a17:903:2352:b0:142:76bc:de3b with SMTP id c18-20020a170903235200b0014276bcde3bmr12012450plh.36.1636757206809;
        Fri, 12 Nov 2021 14:46:46 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id k14sm5647004pga.65.2021.11.12.14.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 14:46:46 -0800 (PST)
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
Subject: [PATCH v5 6/7] MIPS: BCM63XX: Provide platform data to watchdog device
Date:   Fri, 12 Nov 2021 14:46:35 -0800
Message-Id: <20211112224636.395101-7-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211112224636.395101-1-f.fainelli@gmail.com>
References: <20211112224636.395101-1-f.fainelli@gmail.com>
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

