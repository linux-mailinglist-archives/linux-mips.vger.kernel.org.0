Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97BD8435327
	for <lists+linux-mips@lfdr.de>; Wed, 20 Oct 2021 20:50:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231488AbhJTSxI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 Oct 2021 14:53:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231515AbhJTSw7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 20 Oct 2021 14:52:59 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92577C06176C;
        Wed, 20 Oct 2021 11:50:44 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id a15-20020a17090a688f00b001a132a1679bso1241498pjd.0;
        Wed, 20 Oct 2021 11:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5ALk99V/yV50Q7B1PyIb1+nfNEsL1ZZBgIrsEIIgD/g=;
        b=TAuk2jn374g9wQdgNFuqPGwkxrWxFwhaHobnKd4lOgCPnec6v0XmtlgNe6rlQtyrdC
         2ftXib02gb7DZIk2M8PtapR9HLef3oOd0IJEHFucGGNPChuT/p2hhPOXgjZFTOWomB1g
         B1AVSCTyz6rbXcabR45cOzgctfVPsEl7Q28NhWmivYdLRkGgQDzk472K8FZX2NIQ1GQU
         Ev0kNPPo2OgF4xlEKpQIjZ7D1eKiNhrqdrNhdccacaSvasTLHVsV9feLR+EtE7AH59VA
         1+XCdD2p1sauaUalTcGGQJWHKs+YT+RGf9l9vT6dK/FKWxIz+FHM2YXaObLMBlzllQ1B
         CIpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5ALk99V/yV50Q7B1PyIb1+nfNEsL1ZZBgIrsEIIgD/g=;
        b=q8SMO0bhSlzOVrO6e7QK3EobZOTG4Qe2qNk2+qUJvwn6gjbbORM007j8LfwiRjYrlZ
         GWDoEVFAtUMoXVQZK+jGLpixP6MAQiXP1uc9K7unD5e+DGn3PZDoDstkdvi83JfHuuwN
         MvzYqmA/zRVeRW7YPlDnkx0bU4NTc//WTYI1bDKOGZzMFkEbRzipZJb7r/gW3H0kdpPx
         DLnN3iTSEvbF7ylEM7S3xAOMdZqfgshadQWx53747NvjRRHmNKkrwjU5xTDafZWI2KSR
         CIjlL+9LgidM37LeknzZrLPmvsZ/nHmGWlSWvvAzE0SUZB1r3EUxQsYkI9jD9OH71p15
         wL9Q==
X-Gm-Message-State: AOAM533aFlv1D7sCtbluMT4VXvF78a+nQUrT+OpUNrkzkH6sXMCn1qU+
        qW2wul1bZn1v9EcJNv6ajpEr4VNtRKU=
X-Google-Smtp-Source: ABdhPJySfx8R9v6bRAeT2LsmOi1+1HftWXhsN+IeBm1YO/wLGEke5Ai/qDLYTcNwiRN0z4E4kH3hcQ==
X-Received: by 2002:a17:902:d718:b0:13d:e2ec:1741 with SMTP id w24-20020a170902d71800b0013de2ec1741mr843381ply.38.1634755843773;
        Wed, 20 Oct 2021 11:50:43 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id o127sm3267863pfb.216.2021.10.20.11.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 11:50:43 -0700 (PDT)
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
Subject: [PATCH v6 11/13] arm64: broadcom: Removed forced select of interrupt controllers
Date:   Wed, 20 Oct 2021 11:48:57 -0700
Message-Id: <20211020184859.2705451-12-f.fainelli@gmail.com>
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

