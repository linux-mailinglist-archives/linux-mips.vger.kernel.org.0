Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0F594276A0
	for <lists+linux-mips@lfdr.de>; Sat,  9 Oct 2021 04:22:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244557AbhJICX7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 Oct 2021 22:23:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244640AbhJICXM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 8 Oct 2021 22:23:12 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 649D3C0613EE;
        Fri,  8 Oct 2021 19:20:49 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id d13-20020a17090ad3cd00b0019e746f7bd4so10618761pjw.0;
        Fri, 08 Oct 2021 19:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5ALk99V/yV50Q7B1PyIb1+nfNEsL1ZZBgIrsEIIgD/g=;
        b=hwzgru1aZMAwfrvVGh2qdKu+NGHgUvHLDHdM3vQvgCU6/2UOJCtSZXDCaYHNkc7V4R
         QT0uCUn/oPzdmxKJ0a9QqIDSFtIq1ztTmQo61VZLUadSm8fgP8xS8Dp8s2JLkUAO4Cs8
         3GTSxvgHBsyqzTAiGeqsPA7JpngNisT9lz2L6ST+U3bxN6blPYNbr6ggPt+iypJgcASx
         Xvayj6OzIYId5Geaq2cRJ2ZhrRMrkE7Twtkpf1VJMfDcqEbzmqkhb9qj3kNCJfVmmwqN
         n6miuCaYiJohks8Vgjus/az9ok3SvoIfn7V1gbLS+mmu75KgCYg7Satzf5blrxX22hfS
         pVJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5ALk99V/yV50Q7B1PyIb1+nfNEsL1ZZBgIrsEIIgD/g=;
        b=d1sy97NYrhTss3akoCt0dSsMK9RWMXC/iipqRJ5gpqmQPqvycA+zQEgRNwijfuCa30
         UjbzoiGwBXyRicgBAE/LPWSjVV3gWdHGbw2JlBNk1CxLmCRQqrUnsQP/4BNqCQKspry2
         MNNqUI4R9Ypt7jT/aIYpLrrp6uQ+cZPDekXsdL+ACn7zTO8qpsgxcaAxBWMevi5Cr/jg
         RISS8c0pExVbc1mprbndvVy/Z0JGc+VdxV8J3n8VrqP+JV8z/GzryExbB/zDa1uiweN1
         ZbrmZCERso1M4t1U39GESd59d3e8P4CU4O4/SYQWjf+28Nl1gJc+sURtHhON/Pjtlz6R
         34fg==
X-Gm-Message-State: AOAM531BVlyZ1nPxfIwb9ZskMsISV+B3dVu5Hf7tF2DDltGCuUdcMrAL
        Mk12TA0bTupgBUiJmeMUNiiuYl80mSk=
X-Google-Smtp-Source: ABdhPJx46q70MQN9RfNnUCvx1o4/5BP6Zn3gnlrWX1/ENSBxwfbhZqwBEZHKsgKnnTa8dDDQJ4CSlg==
X-Received: by 2002:a17:90a:39c5:: with SMTP id k5mr16170324pjf.211.1633746048546;
        Fri, 08 Oct 2021 19:20:48 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id pi9sm444692pjb.31.2021.10.08.19.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 19:20:48 -0700 (PDT)
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
Subject: [PATCH v4 12/14] arm64: broadcom: Removed forced select of interrupt controllers
Date:   Fri,  8 Oct 2021 19:20:21 -0700
Message-Id: <20211009022023.3796472-13-f.fainelli@gmail.com>
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

