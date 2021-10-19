Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 744BC434119
	for <lists+linux-mips@lfdr.de>; Tue, 19 Oct 2021 23:59:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230136AbhJSWB5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 Oct 2021 18:01:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230170AbhJSWBj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 19 Oct 2021 18:01:39 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FC48C061779;
        Tue, 19 Oct 2021 14:59:23 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id j190so13898408pgd.0;
        Tue, 19 Oct 2021 14:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cvv2iZxij6FWrFEEKivGkcFAPGtCwuGKeJ0S/lB+6EU=;
        b=puyoSqrav3ko0lxLZDxOgj+HF1tMBUhtqeS8ibOhQkHM6TZio2/uRT9KT/AchkliH3
         ojpy87guSLAevK+3haRFgpyrMyenPSCxA/7CDUwQNDghnHe1BonrgUntG+wx2GlzwV/w
         oFvg2SQa2sTNuLN0OS3TC4d3u9P4F1+jU/4NjMmAYds3xMymzYbZQUKXh08AQeHsIQH9
         dV/8N7WeiA8dANrE6ZS4h4KRMuKbWSFgIchErMO0d7Hm/o+TRrcvYGkoyZTAvnJ5RpNP
         0LlcwFaFC1omp4VwK4XmrfAMSm9glKW0hKMXS4zWp6DlQlGaNwhi7U2NTaQPz0k7a1mi
         Y7nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cvv2iZxij6FWrFEEKivGkcFAPGtCwuGKeJ0S/lB+6EU=;
        b=ZEq9yTEGBLinFIuy54638MDNDnm5jNx8YGgCw+skk+pbu9h9x+/Ny6VsEKh543LVq2
         hbaUS5zDKXBVnG3Xm0HLPtnRDAUjpapzI3YioUk6aJBm2PWnc8Wd1o643zEnBW1YrhXe
         mikGmeA/NZp3u1Vea4lLLU7t7gDnsNNzsrv1jkYweqoVBeztvdMRUypIK+Nip9aHo8f+
         +HNRFxF2iGbLcVTMHBSiVHnMMSn2ys/b0i2SCfpgmRsC8zqeHqmSKq16H79/VRldf1br
         BkD8ycEmCksxTd2S5h9zWKFPVN33Z4Ol4g5dyFjRldBme1gJC8U+NEd1NTex+mFx62bh
         m3+A==
X-Gm-Message-State: AOAM531hgb3CrESmh9QRhbCTgh7rHuMNdPYGz292wx57+8ypj/sLZhSU
        qQGU//3EiSm2AROnYOBykj3v4x63Hv4=
X-Google-Smtp-Source: ABdhPJxhzjt2b4JpAP5y08pLkv/ZLh6VuVP+HWQ9UgMTyxUq1vcrNg8BwCWVmSqBUvmU5OQowhuk1Q==
X-Received: by 2002:a63:3d8c:: with SMTP id k134mr30384423pga.394.1634680762159;
        Tue, 19 Oct 2021 14:59:22 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id bf7sm139325pjb.14.2021.10.19.14.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 14:59:21 -0700 (PDT)
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
Subject: [PATCH v5 13/14] ARM: bcm: Removed forced select of interrupt controllers
Date:   Tue, 19 Oct 2021 14:58:54 -0700
Message-Id: <20211019215855.1920099-14-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019215855.1920099-1-f.fainelli@gmail.com>
References: <20211019215855.1920099-1-f.fainelli@gmail.com>
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

