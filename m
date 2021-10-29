Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF0AB440217
	for <lists+linux-mips@lfdr.de>; Fri, 29 Oct 2021 20:35:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231364AbhJ2ShP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 Oct 2021 14:37:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231252AbhJ2ShL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 Oct 2021 14:37:11 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CACBC061766;
        Fri, 29 Oct 2021 11:34:43 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id nn3-20020a17090b38c300b001a03bb6c4ebso7973763pjb.1;
        Fri, 29 Oct 2021 11:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bxPuQkzCjr4bMQ3izqSZWCgKaBxIVRYi/TUmbbXS7uE=;
        b=ULqODS4st2cEkpjbN+VcS9QFpsj8FVYc302T/VbSyig8qndFTSLDg3B1NIjOLlw7bk
         BLs6jx2+0GTQoRY9qO6UFzxjCuFfHsb0lxv1CYb0Ytx7Hu4c2HD/Sp1Ml1NGwZCIw5BZ
         Nsja389kYKaMZ55pr+wacdKmoEFMsKBEKbqhOf8ehuv4Evgg3pDBH8Z7lkRc+jFF3xf0
         NT7kQH71vBNnuhrKYtVmUfpA+3gj5Eh2T9GFUCc9GORYnjXyMO2u47fd3mbAgyY4KsUd
         MynObiB/WIR4yNjsJQiNj7zEW5BLOGDVPhR7f2prQ3jPAOvRFz7ewpVPPb79Fy02KIRV
         5Wzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bxPuQkzCjr4bMQ3izqSZWCgKaBxIVRYi/TUmbbXS7uE=;
        b=jbOEvuw3ByLQr5ujZydE+1UUrTeGLdxJ2EZJtkmO3YiLVPWfqXFLT/VixDJzGuyYcI
         sBwesAM6MuDF9613SPVVFqgkHhjF1AYbecJOGMYm2Fp2+l9KMaIgh01YP0Gm1UWQ/paT
         6G6cKRarFsYh18w6XR2griBq4GjN4/wXEyOiv9wEy6IEYgP97gAcx405yghRbKHYJ5+O
         YPXACKLynvAeqs+LZ+NDnbLMi0fHow80lecRFEvkrYu7B24wTBn9pyWndD3oXI9l9XOW
         z6mrB1mSiYjd6TeyESbnamMayussAc3+vETjtfUEVVPgFucEbRu8eUsaD3zEdB3MWKVj
         20Tg==
X-Gm-Message-State: AOAM532JE2lY1MvfZVKz0tcKrTTblFr9H/Zkpk6mn27QPucdzrf/oyv9
        mneBTKb18RG8ZkHkE98vSZDubWsjnvQ=
X-Google-Smtp-Source: ABdhPJyhQph7vUTcpErM+npJza8ndayuNekge5Uz2UBOw056O1Ux9P8dVfpW4exJJisGD1X1ZcVP1Q==
X-Received: by 2002:a17:903:124a:b0:13f:cb85:1a3a with SMTP id u10-20020a170903124a00b0013fcb851a3amr11140944plh.32.1635532482188;
        Fri, 29 Oct 2021 11:34:42 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id j15sm7730868pfh.35.2021.10.29.11.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 11:34:41 -0700 (PDT)
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
Subject: [PATCH v2 6/7] MIPS: BCM63XX: Provide platform data to watchdog device
Date:   Fri, 29 Oct 2021 11:34:29 -0700
Message-Id: <20211029183430.4086765-7-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029183430.4086765-1-f.fainelli@gmail.com>
References: <20211029183430.4086765-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In order to utilize the bcm7038_wdt.c driver which needs to know the
clock name to obtain, pass it via platform data using the
bcm7038_wdt_platform_data structure.

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

