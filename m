Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4296B41A584
	for <lists+linux-mips@lfdr.de>; Tue, 28 Sep 2021 04:29:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238708AbhI1Cbe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Sep 2021 22:31:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238675AbhI1Cbe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 Sep 2021 22:31:34 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9839C061575;
        Mon, 27 Sep 2021 19:29:55 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id s75so3117983pgs.5;
        Mon, 27 Sep 2021 19:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cvv2iZxij6FWrFEEKivGkcFAPGtCwuGKeJ0S/lB+6EU=;
        b=fgJ8p9ast2DXIumZeFMG8dSVh7ItXK0mMdwQ+5I8syLYHOZ4M+TebIknoSTcmlrK7z
         C3aMTPLdWXH4h2AEDVg2EScfBSZNpHoVRBBA0c73a2pXrGHhDi4HXES2fTZRU4dsmZpy
         Vqw7akBx2u+Kd0lJUq72g+kXcBC0eDSUw8Os70L2aQXpzoqozkewirTquGgrJ/uSBxhB
         2hAEKKN18zCBXfKhrfhfYoMWqLembagINeFPrPl5LPxEXaLWSXKdulAWToemnCO7HkgR
         3vzJss41V/8y9xaoaMT6Vi91npjaKozhNXCQ44kOva+YPBd93ojNB60FMi+eB81M/Gch
         lbkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cvv2iZxij6FWrFEEKivGkcFAPGtCwuGKeJ0S/lB+6EU=;
        b=KE7b959nInUv2BOu8TM2HVtd3tQ4lRn2ssNxH452ZCIle3x3VdgsZG726FFnp6QPz7
         LSPyNWu3Sl4yFmuMTH24vIJ9XoHM29RXn/ghBEwgjjn0L35vB8fyrY63iUVEQjxtiy1O
         8clHVGPcvHBhlMP98ZtiGmApgbaxaDeSSy4v8BlFpGZ6NPIfRiwOC1qfWPnuuwxgtj7q
         VDZgoz0UCo0+Rhi4EvlMoZ3OBZbbM2WdhGn3NJJv0oTUFjUycNXLnHWb+fGORbzEzrAG
         rhQtIGpJFjEpHDWDcmXQHKuKookORuX+8TPADMR4DYGAFGnb5AvCHUGzao8uPjxWyI9h
         a2/w==
X-Gm-Message-State: AOAM531LwAEGsmzY43CXM1Vtgo5WEYjbpDX5eUIwcsADvhTMhhLDh+wv
        j4kXmlVXrqwupNmTjKlXsyEjbReQPLQ=
X-Google-Smtp-Source: ABdhPJxJ9GAXbLlPMq94ovLf5el453NlHICIDwWwckPVoOS1VtNVCoR/DobGsZ1iFSM02KJw8LjlRA==
X-Received: by 2002:a65:6a15:: with SMTP id m21mr1609522pgu.415.1632796194982;
        Mon, 27 Sep 2021 19:29:54 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id k14sm633261pji.45.2021.09.27.19.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 19:29:54 -0700 (PDT)
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
Subject: [PATCH v2 11/12] ARM: bcm: Removed forced select of interrupt controllers
Date:   Mon, 27 Sep 2021 19:27:14 -0700
Message-Id: <20210928022715.369160-12-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210928022715.369160-1-f.fainelli@gmail.com>
References: <20210928022715.369160-1-f.fainelli@gmail.com>
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
 arch/arm/mach-bcm/Kconfig | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/mach-bcm/Kconfig b/arch/arm/mach-bcm/Kconfig
index 2890e61b2b46..bd3f82788ebc 100644
--- a/arch/arm/mach-bcm/Kconfig
+++ b/arch/arm/mach-bcm/Kconfig
@@ -161,7 +161,6 @@ config ARCH_BCM2835
 	select ARM_TIMER_SP804
 	select HAVE_ARM_ARCH_TIMER if ARCH_MULTI_V7
 	select BCM2835_TIMER
-	select BRCMSTB_L2_IRQ
 	select PINCTRL
 	select PINCTRL_BCM2835
 	select MFD_CORE
@@ -209,9 +208,6 @@ config ARCH_BRCMSTB
 	select ARM_GIC
 	select ARM_ERRATA_798181 if SMP
 	select HAVE_ARM_ARCH_TIMER
-	select BCM7038_L1_IRQ
-	select BRCMSTB_L2_IRQ
-	select BCM7120_L2_IRQ
 	select ZONE_DMA if ARM_LPAE
 	select SOC_BRCMSTB
 	select SOC_BUS
-- 
2.25.1

