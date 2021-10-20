Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B55ED43532A
	for <lists+linux-mips@lfdr.de>; Wed, 20 Oct 2021 20:51:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231703AbhJTSxO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 Oct 2021 14:53:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231529AbhJTSxA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 20 Oct 2021 14:53:00 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CF6BC06161C;
        Wed, 20 Oct 2021 11:50:46 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id k26so3730795pfi.5;
        Wed, 20 Oct 2021 11:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cvv2iZxij6FWrFEEKivGkcFAPGtCwuGKeJ0S/lB+6EU=;
        b=qohmFo7HSTuJiAuIg8jC9flJcI1Tz+q6TCYy7uEX1gXUDQ9oekWlTqYalK8iWW+mbk
         MT8LiO+KjgBDe7X2n6d5Zxa2thuN2px4LR/56XUbp3kkFs8AWOqvdx2h50r62Z3fvyvl
         MLop1X59Rk4uXj5ceRKB9legRu4YYKtqE50RTblCBy5ARZd/JKKra7VppZDKjvi5Ot/R
         AsMQX6Pg1fc2uLmopGB8v6jS38aB7B38NSgSMYHfXMV43dAOZmLtVGiZE8AAMnnOtggm
         MgJdPYPEhnUSAtN5sppUN+A9Q4imzs4EFaQJSGAY9wiFTrhu1Y7tN3qGszVBlTuTdrUO
         /uWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cvv2iZxij6FWrFEEKivGkcFAPGtCwuGKeJ0S/lB+6EU=;
        b=MlHM0DhG+QtLmk9mZdO2oTGuEBGo/IjloeXoPyGaExfZV3BV36PYKsa46pXOs02IUJ
         GpHWumw/Gc3Ft7VuXorqzQ4sWGckoZFfhQCtI9f5hSTC/WGQUxZpFI3Z84x2i3tztoNs
         pvht8UQmIxU2kpS9wg+GaNWyLxYo7Yie5Zu7NBAn3+dgJXUvQcx/oqqj9tOlvfKVzTZv
         8t9foawvKPwbLJ+fVqxD//m8Rvl5PL7sqmCGqqgqveQuCP4ZrcR02mtFQeeihz5nNFFp
         hhOVB7jz6Gkc1IdUTGvWUarzpbxaKLE9EB9aDpC3CJ/nNjZB7CVpKqeLxlG7xS2F+sbr
         ZTWQ==
X-Gm-Message-State: AOAM530ddkWcT+NN6Pa3/vR/hBWCr8E7UbRpLt0REyFZMdVCZa3CI7VW
        +axQdNquQPPQSQ3YqdW82S58Jv9uZWs=
X-Google-Smtp-Source: ABdhPJyq0DSVNz71EBMdhA5txyFDLR2UKlGDUpXfcZZbCJzNwUZ45gyW393A5LrdSIZpv8Cpckh+bw==
X-Received: by 2002:a05:6a00:d63:b0:44d:186d:c4c0 with SMTP id n35-20020a056a000d6300b0044d186dc4c0mr608662pfv.47.1634755845385;
        Wed, 20 Oct 2021 11:50:45 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id o127sm3267863pfb.216.2021.10.20.11.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 11:50:44 -0700 (PDT)
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
Subject: [PATCH v6 12/13] ARM: bcm: Removed forced select of interrupt controllers
Date:   Wed, 20 Oct 2021 11:48:58 -0700
Message-Id: <20211020184859.2705451-13-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211020184859.2705451-1-f.fainelli@gmail.com>
References: <20211020184859.2705451-1-f.fainelli@gmail.com>
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

