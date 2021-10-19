Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3E3A43411A
	for <lists+linux-mips@lfdr.de>; Tue, 19 Oct 2021 23:59:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230282AbhJSWB6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 Oct 2021 18:01:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230145AbhJSWBi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 19 Oct 2021 18:01:38 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 601B3C061768;
        Tue, 19 Oct 2021 14:59:21 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id gn3so1031946pjb.0;
        Tue, 19 Oct 2021 14:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5ALk99V/yV50Q7B1PyIb1+nfNEsL1ZZBgIrsEIIgD/g=;
        b=N46xaqCV1Ya66lu9pnPn3P2UGULweE5FkPxi51wwEsY3ca5TIRpTzowGIL9KK0CPBd
         xTcD4xP4sWSF3N+YSRfzKX/zOJ0ASy5mWLUroMF6p+/7zzT/pCQZ5C4RyCEOQ3kWl0Fn
         4QTFPTlqbPzsd1i+mpwFG3UJnuE+PKVvNMBurUUk4LXu/moYXJlxQ5IWkxS5SIwu3mV7
         Fjmo6dmQRu1yWQpzxvONABKB6yssqySAklq9VFsXYW6R2anUHbMhpbttbKBqVvqlnXge
         WTxNHYIqKjoGntVnE+LVUSQg0v1JKP5ZM0X2PG25/79y/iiz+Fi9bFDA0KhwfsLtnsGT
         9s0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5ALk99V/yV50Q7B1PyIb1+nfNEsL1ZZBgIrsEIIgD/g=;
        b=BOpuWivj3DBoqftjIZDC7fAyfLs9/iCwYHKg6S3xs75BM4jstzCN4NoEnLaHETN/ch
         VHmO9r1L2D1o7WmoDjIKR1CQclmF9FgKNlXpf8odOKBB1XxtPrpOTZP2Cf8oGicDLTMg
         BrZ6NNRSROQHIIokA6v/7QErGq7i7hlOCeytUix5azYtJ+riCPiY0DwqYZ0X/ka0NLYI
         BBqUuWgdY9anGfIjxY2SXFmWlMj5Zxhoz+hWcP2kyIe2TI3sfOCQL0N4S6XwIE6cJOCA
         htbSqg0lVuIkSla4z7IZ/QKjKw4LC2G5DIzuOBieVKqcPS7fAAr/27CNVDZhAFTGcYRx
         hTPQ==
X-Gm-Message-State: AOAM531tYheukhHJBURbh5cH7FAsobpMJNsrjgBsod+MwjCCoXzWG2aZ
        +OdZGRN9oRONCBRIGAfykDQuPAsgl0I=
X-Google-Smtp-Source: ABdhPJzWpyM1C2qGr1nMlYAwXWIVZOv+GkHF0hDeN/rI0sLoSSxh4Qx7D4dUFc53gJhlcJ4NP6RBCQ==
X-Received: by 2002:a17:90b:1a87:: with SMTP id ng7mr2823769pjb.69.1634680760605;
        Tue, 19 Oct 2021 14:59:20 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id bf7sm139325pjb.14.2021.10.19.14.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 14:59:20 -0700 (PDT)
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
Subject: [PATCH v5 12/14] arm64: broadcom: Removed forced select of interrupt controllers
Date:   Tue, 19 Oct 2021 14:58:53 -0700
Message-Id: <20211019215855.1920099-13-f.fainelli@gmail.com>
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

