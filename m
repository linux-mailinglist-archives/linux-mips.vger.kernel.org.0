Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 518BD444B65
	for <lists+linux-mips@lfdr.de>; Thu,  4 Nov 2021 00:15:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229964AbhKCXRV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Nov 2021 19:17:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230414AbhKCXRA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 3 Nov 2021 19:17:00 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8296FC06127A;
        Wed,  3 Nov 2021 16:14:23 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id k4so4090335plx.8;
        Wed, 03 Nov 2021 16:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S94ZmIDNbR8JM2YMz6OlEqOmqcwIJH7y0fh6ZVlIVsQ=;
        b=oUOMWLm7pFApmOxrY5LbpiR/ypi1CNlykSlB/f5ivWHC4SL333V57CaG20RkPpzg+S
         ndPL7vMDzQqkcr7NajmQWcJCUC8C/gW7U+YlI8h4ySIZJw2ppQziWafQujGrRN6lfmTI
         tW7s9jbjZuV2BufJhSPOsvrQ2wXosrbEo3Aom0rhcs1y5HNecyxjzNgknJ0yi1mFTYHu
         XgbbAjqYXEtYtkiMryHl7vWS3RHQjXYIPBUlukwLrOW1spUIRldUPHDkuMszUwX43iso
         RTE8amvuqlCQOQ/2YyyYUVQp8RCa1x81fStvvN0kZARK0QVF3pyZxKUO4ZBVsJey/+dg
         urWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S94ZmIDNbR8JM2YMz6OlEqOmqcwIJH7y0fh6ZVlIVsQ=;
        b=EcdnSNW05PIVhqceyWrxthe7ju1t8EdI9ML/djj59LQzhtWIJuOIHybx4Qj8/TGiqn
         JkOVLyl811LPwxwhr6A6z5Jh2zf6yYqCUtqvG4Lo5lyrK8Ky6yKVnORK9MZqMBdfkUL0
         JtasohxN89+fm9oYJujS67fMEL27IdgoiHTEl9BPkWDtqWSAmdgpV/mYNfnvnycmHOzY
         1y+HS6hpCpFQhmZG91mrdoB3AmEthAr+XnJ1xCnVPclF73vWPP2BU11WPBgU9QDSjWtM
         VY8PqNObT5AOH7t2vA1qVbOSWGWtN/FsuG1qASoNVrWqIkKG+Ep1NNT4XW+PRQDkLs4y
         6dbA==
X-Gm-Message-State: AOAM531ySi7EiVNR780wEey9J3TNf2GYFSQs0EXU8UgMlej95Mc45hX5
        hqLt3HnHD2i9C2N4A7XEuumi43tGDds=
X-Google-Smtp-Source: ABdhPJxEYzC6KYaWHuW8EtDqKdl9Emje1OiMe/c8PqUhl5nf/Ax7475nv1y2qE2+9Pek1ix77miQQA==
X-Received: by 2002:a17:903:22c5:b0:142:3100:65af with SMTP id y5-20020a17090322c500b00142310065afmr713080plg.83.1635981262807;
        Wed, 03 Nov 2021 16:14:22 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id p7sm2613549pgn.52.2021.11.03.16.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 16:14:22 -0700 (PDT)
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
Subject: [PATCH v3 6/7] MIPS: BCM63XX: Provide platform data to watchdog device
Date:   Wed,  3 Nov 2021 16:13:26 -0700
Message-Id: <20211103231327.385186-7-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103231327.385186-1-f.fainelli@gmail.com>
References: <20211103231327.385186-1-f.fainelli@gmail.com>
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

