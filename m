Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8539E41B5EA
	for <lists+linux-mips@lfdr.de>; Tue, 28 Sep 2021 20:22:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242261AbhI1SYZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Sep 2021 14:24:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242264AbhI1SYU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 Sep 2021 14:24:20 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E563C061767;
        Tue, 28 Sep 2021 11:22:31 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id h12so5212036pjj.1;
        Tue, 28 Sep 2021 11:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IqTvFkxEB42F4FY7x5fTTUp3BY0gcheCImqFREsoxYU=;
        b=kTsIT0G/KrDrPn3Onne9wHI4gnAg3lQlkwbjw7aa0F/HMPSOLZJa/XgGOqjP0TjzAF
         DAMbGwSd3v5ymTWI8TAmhNv+th60xRAfzESFUUuy/yiQzB5d8PlCveNViGKPzP+mADWV
         BManhIsK/G+AZd1IQOyXfLrb41jT9p+gNOOxsHH0bXM879O2/Fti2Ur77REqP3gZIpqA
         iP3YZgRpqKIbHeJtb/OpyBhCvGo8/ylIQ9n+vWolccnS58ZM1dXtlr8PvqtSvtCkv/oR
         kYIQ19Cu3NpDkjCR3x3iwrWgWj9imMsB4Qn8tvRT2mtrx8XSrv4dIAHYojorbvR7j7rK
         bm4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IqTvFkxEB42F4FY7x5fTTUp3BY0gcheCImqFREsoxYU=;
        b=pZLqAvgRCjyaELopxqnT8kqHttXnUe4U8z27xntlWOdTqaAEc4Lh0KzTMIq4K6U+U+
         JBsxGw2PNYoB22uTbnWbc8HSRMcshl8DsBYahY6zB7/ZvWkyzqAdrPUKF2VymBRhOkU7
         rQHI/YVkhUqB9PIgFCwzBc+9c+9KHHTFWBoKJqVJ+erQKcPkhUZESUmqM9Epb7QE2gs0
         +ngn6RzpXcx0cU5XDuseleh5ig9RSvDBBx4nfQXSVqHfm9MpBGyPhu7Ap/Qcka8K6GKX
         K5Ucqw474gk6oP0dqnXaDaHfAa9IaTuScgj2E7YZfIy+Qho2sO/mkjH+cWrz2PWfIBlh
         3c3w==
X-Gm-Message-State: AOAM531etstSWtwqr6BOF340p1VlvaM1Q0m2cVftlWwGbwgHcerSgsTm
        iqkfEdxpAyDWIZVfMnEGuW5FBMnK7Gw=
X-Google-Smtp-Source: ABdhPJwix3fY+AASgKFQmC3akUcOB24p3w4BvdQVDgtUUJYIy85NIPLXbkNDpb+JhP9GBUaUeHdX1Q==
X-Received: by 2002:a17:902:64d6:b0:13e:59fe:8124 with SMTP id y22-20020a17090264d600b0013e59fe8124mr710244pli.89.1632853350732;
        Tue, 28 Sep 2021 11:22:30 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id x19sm20855288pfn.105.2021.09.28.11.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 11:22:30 -0700 (PDT)
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
Subject: [PATCH v3 06/14] irqchip/irq-bcm7038-l1: Switch to IRQCHIP_PLATFORM_DRIVER
Date:   Tue, 28 Sep 2021 11:21:31 -0700
Message-Id: <20210928182139.652896-7-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210928182139.652896-1-f.fainelli@gmail.com>
References: <20210928182139.652896-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Allow the user selection and building of this interrupt controller
driver as a module since it is used on ARM/ARM64 based systems as a
second level interrupt controller hanging off the ARM GIC and is
therefore loadable during boot.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/irqchip/Kconfig          | 4 +++-
 drivers/irqchip/irq-bcm7038-l1.c | 6 +++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 4d5924e9f766..3022f6137096 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -115,7 +115,9 @@ config BCM6345_L1_IRQ
 	select GENERIC_IRQ_EFFECTIVE_AFF_MASK
 
 config BCM7038_L1_IRQ
-	bool
+	tristate "Broadcom STB 7038-style L1/L2 interrupt controller driver"
+	depends on ARCH_BRCMSTB || BMIPS_GENERIC
+	default ARCH_BRCMSTB || BMIPS_GENERIC
 	select GENERIC_IRQ_CHIP
 	select IRQ_DOMAIN
 	select GENERIC_IRQ_EFFECTIVE_AFF_MASK
diff --git a/drivers/irqchip/irq-bcm7038-l1.c b/drivers/irqchip/irq-bcm7038-l1.c
index 357570dd8780..a62b96237b82 100644
--- a/drivers/irqchip/irq-bcm7038-l1.c
+++ b/drivers/irqchip/irq-bcm7038-l1.c
@@ -455,4 +455,8 @@ static int __init bcm7038_l1_of_init(struct device_node *dn,
 	return ret;
 }
 
-IRQCHIP_DECLARE(bcm7038_l1, "brcm,bcm7038-l1-intc", bcm7038_l1_of_init);
+IRQCHIP_PLATFORM_DRIVER_BEGIN(bcm7038_l1)
+IRQCHIP_MATCH("brcm,bcm7038-l1-intc", bcm7038_l1_of_init)
+IRQCHIP_PLATFORM_DRIVER_END(bcm7038_l1)
+MODULE_DESCRIPTION("Broadcom STB 7038-style L1/L2 interrupt controller");
+MODULE_LICENSE("GPL v2");
-- 
2.25.1

