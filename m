Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B3AE44EFA0
	for <lists+linux-mips@lfdr.de>; Fri, 12 Nov 2021 23:46:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236060AbhKLWtj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 12 Nov 2021 17:49:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236029AbhKLWtg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 12 Nov 2021 17:49:36 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49C3DC06120A;
        Fri, 12 Nov 2021 14:46:45 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id gt5so7887360pjb.1;
        Fri, 12 Nov 2021 14:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gI8AFWtxI/KJkQAnjbp+w24JZkImGuhWbpWDDQUGQHU=;
        b=RUnnpjWZxG/idK0IzPqNkknV/LVERtESsx0P0BPHsfl3qb9ln4nexXyB+lykLjrzQo
         rS/8uS0iEyL/mICsQk4X6vWmSoFRY0J7V7GQgLW+Zv/pR8axhkqa+76fBpLGzmreMc0Z
         Tn0z5GDG7WfE0/YCMVOStQWqisQJB9tV15roqc6XiHV7RqBorl4+SBXUluYrWoZhFa+A
         fZi/CZEoPGKwmcTjMD//fiEcHaLAy7Q5VQ1/JVv+pmlh4+F0qsJ1f3dGTBTcetlESsMD
         m64QmOBnulnvtYSJo+wRJJm9VsP50Z1Fxbe+JYMMsqkNna+/Knd4yE0Y6h67rwWBsCYw
         TbhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gI8AFWtxI/KJkQAnjbp+w24JZkImGuhWbpWDDQUGQHU=;
        b=gJPY6vHH9y5VfjugLrtU3kTy8Du6EvEzNs/nYc1GR9kSiGYgA9p3YGyMPWn4tM6agm
         XVSFlus/Dc2jrvEXIEdoc5Jo9yzWIOLJHUJjvRxIe6sEKPzZkvczZv6MS09U/O2TqVrw
         T0zkD/Kj/xjsMFrNJbDTsQ19H1u1bnX6q0MTb/wCR3J5pFAPLeYv+6tuqk5n8Dp7xQvB
         Gy5YMrJZpgO1397ihUSrslw5ARrq7fbysex5wWiYyByuJ3/iWgLQEwB0/20UtXBgkn3Y
         n0mclt998UZH0KTPPj5wo0pUxZs5EflaIb3ceQ2Amc3lMsr2VPvD6z2oO7Ntv2VB590Z
         i34A==
X-Gm-Message-State: AOAM533jYLqAGp4eTUpMpXqGh65LMEgebypPX/C4wdB7QylKjaH//H4C
        pCHLONbhAmVdwcAHlvEVs2Ce3wyyvhA=
X-Google-Smtp-Source: ABdhPJxDZiOZHfO72CyvwShmY1cagdVI0oKqcEgaxsvfap0N9RjsD1u9AMI4eYYxwUH21borBS7j0g==
X-Received: by 2002:a17:90a:c394:: with SMTP id h20mr22513603pjt.136.1636757204541;
        Fri, 12 Nov 2021 14:46:44 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id k14sm5647004pga.65.2021.11.12.14.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 14:46:44 -0800 (PST)
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
Subject: [PATCH v5 4/7] watchdog: Allow building BCM7038_WDT for BCM63XX
Date:   Fri, 12 Nov 2021 14:46:33 -0800
Message-Id: <20211112224636.395101-5-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211112224636.395101-1-f.fainelli@gmail.com>
References: <20211112224636.395101-1-f.fainelli@gmail.com>
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
 drivers/watchdog/Kconfig | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 9d222ba17ec6..a86fc5432748 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1740,15 +1740,16 @@ config BCM_KONA_WDT_DEBUG
 	  If in doubt, say 'N'.
 
 config BCM7038_WDT
-	tristate "BCM7038 Watchdog"
+	tristate "BCM63xx/BCM7038 Watchdog"
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

