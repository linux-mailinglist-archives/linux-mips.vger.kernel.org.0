Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0103B41B5FA
	for <lists+linux-mips@lfdr.de>; Tue, 28 Sep 2021 20:23:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242270AbhI1SYk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Sep 2021 14:24:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242267AbhI1SY0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 Sep 2021 14:24:26 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 945BBC061749;
        Tue, 28 Sep 2021 11:22:42 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id y8so19620289pfa.7;
        Tue, 28 Sep 2021 11:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cvv2iZxij6FWrFEEKivGkcFAPGtCwuGKeJ0S/lB+6EU=;
        b=M60DBj5JGGyTdfa6TNjs3+dFtzjvLP46HZPcndTv52vLqBd8TuRmcqncQcP5js1ueV
         JZF9C8goAepNGU47poIvk242uS+8eo7FcK4gtQqzBS24XCVhWUs+p0CtVsfQiiMncqE9
         +IWS5aAL6lf6FoLRojC4hHfM1ZAMf8JSObC/640cm8Y/rEUMqOSybiIin5rQ4wMzTBVS
         b4o3IKzHlwHqtwKS+pM2P43q14HBgF5B0AOjBM6fmvJyD+vHcXy+FHH/lQrg54W4BveR
         Uzelr367s+1kWFApR0eH5E+7LS6hCZUKHUV3AsLY6OQwmheMZSR/uTs4ueG7feMFCICW
         EEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cvv2iZxij6FWrFEEKivGkcFAPGtCwuGKeJ0S/lB+6EU=;
        b=I8GLh1AHm9eIsqTamLZCfjtv3kC3nehYbwmQRfmojtdZPQBMyPSOHYfqf67BzTgxoV
         CJYshwG9jQCU1YZU92ZbMpmXVJ1rQhi1aPXt+/XWuehC5BrBYm+oIRa3ra+YTxOxHlyV
         lWt0s0eQ+lvrhw7dP80ZWYEfe9eLhH5K+1x1IlFscln7g6DIj41zTlv5Te/zbnqPEXmQ
         T3A1aAkrpR/lmC1qmZTEA/nvhmDgU3w6MjhzMaNny2jYmY7E/seTXbwZn1ecHmKwYyNF
         CF4Z0+4nelw/P9vkW8rIFpYNRwzt566/FKLet/OTJ2fTlW3ZeTyMpjErIpJ0eCX4wM2+
         BKSw==
X-Gm-Message-State: AOAM530IwG7LvSUxDX3A5SFtT4VkTgEOa69Sbdj4xDWPQ82TTiX3fGWz
        jje7DM5BKteSBYkkuDj7Ma2q8Tlr36g=
X-Google-Smtp-Source: ABdhPJy09zpefjloqZzg0k0EEip8PmilCqhXjcR92DepO7vMmL9jP8rmuTM7q+/i+u2U8tBq31Jobg==
X-Received: by 2002:aa7:9851:0:b0:44b:a36d:e0a2 with SMTP id n17-20020aa79851000000b0044ba36de0a2mr3594642pfq.1.1632853361772;
        Tue, 28 Sep 2021 11:22:41 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id x19sm20855288pfn.105.2021.09.28.11.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 11:22:41 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com (maintainer:BROADCOM
        BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE...),
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM
        SUB-ARCHITECTURES), linux-mips@vger.kernel.org (open list:MIPS),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE)
Subject: [PATCH v3 13/14] ARM: bcm: Removed forced select of interrupt controllers
Date:   Tue, 28 Sep 2021 11:21:38 -0700
Message-Id: <20210928182139.652896-14-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210928182139.652896-1-f.fainelli@gmail.com>
References: <20210928182139.652896-1-f.fainelli@gmail.com>
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

