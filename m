Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70C2E440210
	for <lists+linux-mips@lfdr.de>; Fri, 29 Oct 2021 20:35:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230467AbhJ2ShN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 Oct 2021 14:37:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231157AbhJ2ShI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 Oct 2021 14:37:08 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A75DC061766;
        Fri, 29 Oct 2021 11:34:40 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id y14-20020a17090a2b4e00b001a5824f4918so4452920pjc.4;
        Fri, 29 Oct 2021 11:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AYKs8DG5aY7Ez32ozoVHTajRv/Q2Rt0Xxh3ZKd1RZW4=;
        b=jOTKtbWjKy0S4Qh+8mtMjxBhT5aoLSrORa87133JyvVJ01Pfk18PFdmZ2dq9OTg0Pm
         mVCHTuQ4gU4nsXlmuDVSlkXgqDReZXg5TuX3bo0ULZwDS9sbCSL3Ol70CSzFhvwOyhYk
         /jzOLbl9iBLOjfoKe6UcQF2Tmi7JG9G6QphLSaVXOQoXGArdF7uaxN8GDMHzizslKRyF
         whJvASn9z+/lALDSuZHQlL02mTMfZUBEJJyGCRdSlThi6IharESaqnoYD8Ou91f5idhJ
         clbIs5Ct+gf6qqVaXfgoqrEaxx8VV0Gv1PAx6r0ahVzAO+1UXnCtOtPScF38OCMK8WHF
         8n7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AYKs8DG5aY7Ez32ozoVHTajRv/Q2Rt0Xxh3ZKd1RZW4=;
        b=6Wbx0ibf32NEwyHmXE+Ydwn/td3X0+hn5HPU1AoGQeTi6tIHy7V/8UdZwBtb5rjwxY
         Ig04WdYYY8LpgNf/wPVZbfOSPzn57Fr1e8gZ0jGfx8J0MXGsCgV65iX78mtgf73u44k2
         eF3FKGXmcAzfZD3IbF15NTyBqRCjQyBolt4VIp/wUERttx/kM3s5YILslBZ0SCSeoXPS
         Z40nw6SvBZvDvAX+Ui89dBFxnYK5FTuR94k0DkNAkn+x5VreeN1mJkoMQZStQZHov5Jw
         bAiemntR5fSFZ6bUWhGGqJhq9Eno/Geo4JI4VXICtQ4Hiub6KctttpxmmQ1eN1qEiTuP
         ORFg==
X-Gm-Message-State: AOAM531Bapg2nH1IUdfU/ALgSv6wp4z2cKzSOsVPbqCZuf76wpZAkd3u
        w035ueR65T+hmZfZryLORyUCwQcgyM4=
X-Google-Smtp-Source: ABdhPJyjPjKys0TeB7U5Sl0deBind/c0gthESyEQbeTkDRuAR21InRPXLbTYSFLaM+77/A70pXMDTQ==
X-Received: by 2002:a17:903:246:b0:13f:2ff9:8b93 with SMTP id j6-20020a170903024600b0013f2ff98b93mr11445830plh.54.1635532479360;
        Fri, 29 Oct 2021 11:34:39 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id j15sm7730868pfh.35.2021.10.29.11.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 11:34:38 -0700 (PDT)
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
Subject: [PATCH v2 4/7] watchdog: Allow building BCM7038_WDT for BCM63XX
Date:   Fri, 29 Oct 2021 11:34:27 -0700
Message-Id: <20211029183430.4086765-5-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029183430.4086765-1-f.fainelli@gmail.com>
References: <20211029183430.4086765-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

CONFIG_BCM63XX denotes the legacy MIPS-based DSL SoCs which utilize the
same piece of hardware as a watchdog, make it possible to select that
driver for those platforms.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/watchdog/Kconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index bf59faeb3de1..24a775dd2bf1 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1756,12 +1756,13 @@ config BCM7038_WDT
 	tristate "BCM7038 Watchdog"
 	select WATCHDOG_CORE
 	depends on HAS_IOMEM
-	depends on ARCH_BRCMSTB || BMIPS_GENERIC || COMPILE_TEST
+	depends on ARCH_BRCMSTB || BMIPS_GENERIC || BCM63XX || COMPILE_TEST
 	help
 	 Watchdog driver for the built-in hardware in Broadcom 7038 and
 	 later SoCs used in set-top boxes.  BCM7038 was made public
 	 during the 2004 CES, and since then, many Broadcom chips use this
-	 watchdog block, including some cable modem chips.
+	 watchdog block, including some cable modem chips and DSL (63xx)
+	 chips.
 
 config IMGPDC_WDT
 	tristate "Imagination Technologies PDC Watchdog Timer"
-- 
2.25.1

