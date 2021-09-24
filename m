Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BEEE417951
	for <lists+linux-mips@lfdr.de>; Fri, 24 Sep 2021 19:08:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347439AbhIXRJC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Sep 2021 13:09:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347416AbhIXRIx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 24 Sep 2021 13:08:53 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36B0EC061760;
        Fri, 24 Sep 2021 10:07:12 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id j14so6921213plx.4;
        Fri, 24 Sep 2021 10:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5ALk99V/yV50Q7B1PyIb1+nfNEsL1ZZBgIrsEIIgD/g=;
        b=W5mze3xMeug+VzShPMYoE9WUJW+4lqGvITid0RKVzHUGOnkZrSCL7ZT5JAG2OLL4un
         mrl4kzC0BFmToEC/cQIYukwvKLaTGK6KPsZwoijYV4mWcbgIUf1msg2CGtq/khu4QaYP
         1STRfYGQejLRVK2gcYgnAst4xsB9DsO8LRDICNgk1dteLeQ5wXT7SiWzIGqyxPBrtZ1w
         tWIpqZ/qluN3PLGd1BWZQoXo9ohKYF4/4xVzkz9ZicJN17bhbw62z6GKiQrujQ8aQTDV
         fKnzRCtInhvxHfxmlHpwmjqJ+/YGd3sGxwdXnyPLRhbHlQjtxltT2lWylvINag+kgXDo
         89+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5ALk99V/yV50Q7B1PyIb1+nfNEsL1ZZBgIrsEIIgD/g=;
        b=bbFmrr1TyvFLF+bf8eu95bO8X1u5qIr9YPEWRBzPFitWO38QfrkNum7GX0/V3OqqnL
         IG9fciDr3OqlaUHzWcTifkgr14o/iR85BcdpNl3iwJpeskHOATjFHAIlMecwrKXXcu/p
         7cADcZYLvLUbFhr982wNsEgXTF8HQMuNsr2x08mwJaN2T/BvniFhkoyzE5skeEQb8OR5
         5+lv6vLzPKj9Y5ZEs1fiE3JHN7oyuATUwTMA0zT7N+4AxSsSZ4CAEjmvajniHmC2Go27
         UOOvJgsD6i7ty5qwhdMY202OckS0DCvrhZeZ/KuBw34D6ybrVd0ccNUU/O92FHduIxLU
         y8Jw==
X-Gm-Message-State: AOAM53282KOxMgU0UvRWfglBBxhESxYI4H5c1sPrFeCdBjpIU7tBddkO
        P0vAhBNnx+GBP8dix3mWv4gcIf6BzKY=
X-Google-Smtp-Source: ABdhPJx4/WY8NCsHn64dsmSYUYNI/vXUyzu/b0jOiRm+JP64JaclemrbepQwTPKymlGhRbStoVRm7A==
X-Received: by 2002:a17:902:ab16:b0:13a:356c:6a03 with SMTP id ik22-20020a170902ab1600b0013a356c6a03mr9875580plb.38.1632503231516;
        Fri, 24 Sep 2021 10:07:11 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id k22sm9659312pfi.149.2021.09.24.10.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 10:07:11 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com (maintainer:BROADCOM
        BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE...),
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Arnd Bergmann <arnd@arndb.de>,
        Guenter Roeck <linux@roeck-us.net>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Ingo Molnar <mingo@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM PORT),
        linux-sh@vger.kernel.org (open list:SUPERH),
        linux-mips@vger.kernel.org (open list:BROADCOM BMIPS MIPS ARCHITECTURE),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE)
Subject: [PATCH 10/11] arm64: broadcom: Removed forced select of interrupt controllers
Date:   Fri, 24 Sep 2021 10:05:45 -0700
Message-Id: <20210924170546.805663-11-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924170546.805663-1-f.fainelli@gmail.com>
References: <20210924170546.805663-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Now that the various second level interrupt controllers have been moved
to IRQCHIP_PLATFORM_DRIVER and they do default to ARCH_BRCMSTB and
ARCH_BCM2835 where relevant, remove their forced selection from the
machine entry to allow an user to build them as modules.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/arm64/Kconfig.platforms | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index b0ce18d4cc98..2e9440f2da22 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -44,7 +44,6 @@ config ARCH_BCM2835
 	select ARM_AMBA
 	select ARM_GIC
 	select ARM_TIMER_SP804
-	select BRCMSTB_L2_IRQ
 	help
 	  This enables support for the Broadcom BCM2837 and BCM2711 SoC.
 	  These SoCs are used in the Raspberry Pi 3 and 4 devices.
@@ -82,8 +81,6 @@ config ARCH_BITMAIN
 config ARCH_BRCMSTB
 	bool "Broadcom Set-Top-Box SoCs"
 	select ARCH_HAS_RESET_CONTROLLER
-	select BCM7038_L1_IRQ
-	select BRCMSTB_L2_IRQ
 	select GENERIC_IRQ_CHIP
 	select PINCTRL
 	help
-- 
2.25.1

