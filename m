Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B13A441B5FF
	for <lists+linux-mips@lfdr.de>; Tue, 28 Sep 2021 20:23:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242342AbhI1SYl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Sep 2021 14:24:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242222AbhI1SYZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 Sep 2021 14:24:25 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19C47C06177B;
        Tue, 28 Sep 2021 11:22:41 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id n18so22057605pgm.12;
        Tue, 28 Sep 2021 11:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5ALk99V/yV50Q7B1PyIb1+nfNEsL1ZZBgIrsEIIgD/g=;
        b=lcMf2uYuDXr4vVi/DkRQdxje2Bq7Gu0PsejcNuYQcLHVGdyPFCeHeYr8L6kr0fRHvl
         c9+0cTNbjSD3cD5S7WZro2iyL0D4Sj3w9N22shviue+wctgbDTfwJ8QcQxTSbMXBKqPv
         9ZWeWDfTWm+Bt3qN64hou0d8bjYSKCvLVUP0DKfbo3PG+4fwlxWYXGEEC3OsJWCCeKIR
         hUC0mD+gaJ6eRrqyOBtChQFSvSXCVVjH2cEo1O4e3JcTCMAV+f4y2kwNWKCUyU7Ywt84
         QEXckRchPgeUZb9T8paxfgXibtP5z0f6rqWt56cmuSeccdqB1CCYMOA8rSawtM9FLwwd
         RtaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5ALk99V/yV50Q7B1PyIb1+nfNEsL1ZZBgIrsEIIgD/g=;
        b=g4j8TrR2eDFG7cG0pZeMbMO6nYJlscDkwHs0kjPBZH+SJLRvVxIV8XKGYZwbSRXUKk
         1yJCr/VjkxwnfOx4q1gK8+H/YdRm25vzGdCipd7ES8wCenir844weMEGM1kfYiyZoBF/
         TOB76RxF+wNpF9nSWwky0Hgzxt8rk9LluKsZEr2x/zz+5jIW6CeDk/X05wRaXO7t4x1r
         1llgYMstl9lhYllXKJP+XC+DVWGJwA1z2d7W5mB1qG0Hz/8drMhsvrDhmAjuL3po/C4t
         WvYgCovQx2kene5K64r9uhLY6GHQbgP5LpH1irUJmtWNQN/FpyCHhf2AKc2rkku8mRRS
         +R7Q==
X-Gm-Message-State: AOAM532utIdO7Won0pWLPR2dnnMJNrAWncQRfmZKYzTHE5Uf72aTL02H
        M7+z1LpLveOY50ZEXQ/yUz6CzQ0d0nI=
X-Google-Smtp-Source: ABdhPJzq2CeEoz1qAaLWTWoo4xYrAetR5aJdpAf3QfSgn+WmMio9ms/k07gYA2Fp0iV35vnwTB+3IA==
X-Received: by 2002:aa7:82d0:0:b0:413:5e93:2f7a with SMTP id f16-20020aa782d0000000b004135e932f7amr6857004pfn.16.1632853360272;
        Tue, 28 Sep 2021 11:22:40 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id x19sm20855288pfn.105.2021.09.28.11.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 11:22:39 -0700 (PDT)
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
Subject: [PATCH v3 12/14] arm64: broadcom: Removed forced select of interrupt controllers
Date:   Tue, 28 Sep 2021 11:21:37 -0700
Message-Id: <20210928182139.652896-13-f.fainelli@gmail.com>
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

