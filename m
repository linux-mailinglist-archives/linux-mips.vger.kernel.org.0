Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 165FC4276A4
	for <lists+linux-mips@lfdr.de>; Sat,  9 Oct 2021 04:23:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244394AbhJICZK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 Oct 2021 22:25:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244661AbhJICXM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 8 Oct 2021 22:23:12 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 453FEC06178A;
        Fri,  8 Oct 2021 19:20:51 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id x4so7305139pln.5;
        Fri, 08 Oct 2021 19:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cvv2iZxij6FWrFEEKivGkcFAPGtCwuGKeJ0S/lB+6EU=;
        b=m+yu50ed2jVSOX0M9sHuJNhXc/nCyPAK8gkjfh8Md+/1g1DX2amYjYPMjtpTwTPXY5
         Gs7HlVsnh0le0O2GjbBDvD1NpMwUKlDWCtbjVDDYeHncDRkYsbtrbTCmAncoE+g2HO2N
         wWn+Hi4B1CiA4U11YZHBUxnWQUfTKDH/Zx8tQ4zqCDk7rWMQxqa5GNo+DTsOUZwqueqG
         vqWoPlnY5MJ2H//RaNRbeIH43FXhBeniJnEKolir1M4ZcP2VHEyhIJHPaRpgmH68UyEV
         00fag0vdS6sLiSorNyYSadp78Ee/oXQ7TKZ8J2oGlog3YAbAglb3oVvoHedmZwk1cqFr
         xDBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cvv2iZxij6FWrFEEKivGkcFAPGtCwuGKeJ0S/lB+6EU=;
        b=Q+V1mF92DoA5Nr5U38SVvs2BmRYjzqtgcr4kMH7CR+Kn7RMdXlZMf7690zPxrmGI1a
         M8h67qn+BUNENNXKCtYJsSDEXauoSHTQyRoM7cCXz7IR/Z7KnVswb7+jOykVDB9VeDeW
         KVWfF0nGDVvI3nrc1xFuw+CxjG9RgtFt677ds7tMj8Wf3G2/TBWZx89wSQtRknYPw/8d
         uTHfkGWUOCdgQ6qFcuPftMwp0Z3jLUwT+AMaes5siFoP/Dwlamu/B+iXgPtWfA0IokNe
         OmxD9Acp6s0P6S773vtShRS0TG09uoSaZpDChkrOfdeHC397gTsTNZb0RHkKi2ZmplSU
         uIPA==
X-Gm-Message-State: AOAM533b3O3v9uFoZf408PEkOD4HPGxqrjqtFp62GV+YNZIFyAvSvXjl
        FDI8sX/Rj03v8QtglZZ3Z0Cubau1GNM=
X-Google-Smtp-Source: ABdhPJzvTTzmfKXKSi4ia/rXDIDQdlTEWkuf3Sjm3NpkIWpoiQe/9W6A+86jjjFfVyWVz+ZauROyQA==
X-Received: by 2002:a17:90a:1548:: with SMTP id y8mr16621507pja.151.1633746050443;
        Fri, 08 Oct 2021 19:20:50 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id pi9sm444692pjb.31.2021.10.08.19.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 19:20:49 -0700 (PDT)
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
Subject: [PATCH v4 13/14] ARM: bcm: Removed forced select of interrupt controllers
Date:   Fri,  8 Oct 2021 19:20:22 -0700
Message-Id: <20211009022023.3796472-14-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211009022023.3796472-1-f.fainelli@gmail.com>
References: <20211009022023.3796472-1-f.fainelli@gmail.com>
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

