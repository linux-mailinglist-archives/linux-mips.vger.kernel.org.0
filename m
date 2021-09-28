Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EBFD41A57D
	for <lists+linux-mips@lfdr.de>; Tue, 28 Sep 2021 04:29:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238764AbhI1CbK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Sep 2021 22:31:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238650AbhI1CbK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 Sep 2021 22:31:10 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F8D6C061575;
        Mon, 27 Sep 2021 19:29:31 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id h12so3505596pjj.1;
        Mon, 27 Sep 2021 19:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T+nuZjtMi8lifdnlhi4/+fNb2Wj4qKRZZKIw/UMDjOI=;
        b=d6J2f0FeVpkXY5AhAWv6IeyoWbAJ1N7QPf4/aPgFI2+zScDU1JAV6BSHaPl1UxsVgg
         9r3gmyD3pclxnSnqITasL9cdXveDnZajiiVWnrrOCpB8X742fqO8nnuVjisGO9xb800O
         tV0+3MC243XX0u4+5cMXe5+70cPKAW8oxYHvTficTCRSuficZQVBsFR6xbk5Waj7CNwp
         Fg22IceT2AQzkjp8w0s9YNZu4VvoJz8nn5epl2xVDkq0hrlEW46OlmsJmy/HuFjaoTy8
         77sECY6n88P1UYhHfA9/zgkD8ohEDIVoVQCb/OpZirPmN7q1iwebCQ1WWT0Uu/8mqr5A
         9xKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T+nuZjtMi8lifdnlhi4/+fNb2Wj4qKRZZKIw/UMDjOI=;
        b=4qRFU5E9aXgfnBES+PU59pPKfrVCkP7INdOY0ltFtPPHaimFODydEQOuEgONSSwHYJ
         Hcw2/GaPGnXM+iPFcIwzrZcIMy4WE09rDm/sYOIh1DZjY8bXh63mTguFNor7/VqsxDMt
         ZqEQeiVQ3Hj6kEZUKvhJVqX0b2zhGFVcK+24vbwtt0EUT5CKMpIPVhu6jcWZR0WIxnwk
         5DmMCUWIAots5WoJZv2HZhPw2+hbn8OL5csExcNK9SWcFggyV/7o0rcUNd8AnYfgBvSY
         S5r0xKyXd3mclIWgZUzN3XUnEq/0KehTWtDUkRxE47vDGHBps0cIcImzCcBW8syPVsCC
         Sf5Q==
X-Gm-Message-State: AOAM5334zfO1wLwA8X+bKIRwSHo3h+8uvfrxJNcnYjZVpELf34zW9awP
        REFdNGZqTehp4Ek4/VFL3hYYWuKo43Q=
X-Google-Smtp-Source: ABdhPJwfFa/cLXR6ZrxhszdYreZWklI52XpSp0IKqvnfcxbGm1yDHT78oie6L7f1lYIgfRojjYOSaA==
X-Received: by 2002:a17:90a:a78e:: with SMTP id f14mr2526344pjq.235.1632796170728;
        Mon, 27 Sep 2021 19:29:30 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id k14sm633261pji.45.2021.09.27.19.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 19:29:30 -0700 (PDT)
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
Subject: [PATCH v2 09/12] irqchip/irq-bcm7120-l2: Switch to IRQCHIP_PLATFORM_DRIVER
Date:   Mon, 27 Sep 2021 19:27:12 -0700
Message-Id: <20210928022715.369160-10-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210928022715.369160-1-f.fainelli@gmail.com>
References: <20210928022715.369160-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Allow the user selection and building of this interrupt controller
driver as a module since it is used on ARM/ARM64 based systems as a
second level interrupt controller hanging off the ARM GIC and is
therefore loadable during boot.

To avoid using of_irq_count() which is not exported towards module,
switch the driver to use the platform_device provided by the irqchip
platform driver code and resolve the number of interrupts using
platform_irq_count().

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/irqchip/Kconfig          |  4 +++-
 drivers/irqchip/irq-bcm7120-l2.c | 28 ++++++++++++++++------------
 2 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index dfe54bf9b35f..c7320bed5668 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -123,7 +123,9 @@ config BCM7038_L1_IRQ
 	select GENERIC_IRQ_EFFECTIVE_AFF_MASK
 
 config BCM7120_L2_IRQ
-	bool
+	tristate "Broadcom STB 7120-style L2 interrupt controller driver"
+	depends on ARCH_BRCMSTB || BMIPS_GENERIC
+	default ARCH_BRCMSTB || BMIPS_GENERIC
 	select GENERIC_IRQ_CHIP
 	select IRQ_DOMAIN
 
diff --git a/drivers/irqchip/irq-bcm7120-l2.c b/drivers/irqchip/irq-bcm7120-l2.c
index f23d7651ea84..9b1edf7747fd 100644
--- a/drivers/irqchip/irq-bcm7120-l2.c
+++ b/drivers/irqchip/irq-bcm7120-l2.c
@@ -214,6 +214,7 @@ static int __init bcm7120_l2_intc_iomap_3380(struct device_node *dn,
 
 static int __init bcm7120_l2_intc_probe(struct device_node *dn,
 				 struct device_node *parent,
+				 struct platform_device *pdev,
 				 int (*iomap_regs_fn)(struct device_node *,
 					struct bcm7120_l2_intc_data *),
 				 const char *intc_name)
@@ -230,7 +231,7 @@ static int __init bcm7120_l2_intc_probe(struct device_node *dn,
 	if (!data)
 		return -ENOMEM;
 
-	data->num_parent_irqs = of_irq_count(dn);
+	data->num_parent_irqs = platform_irq_count(pdev);
 	if (data->num_parent_irqs <= 0) {
 		pr_err("invalid number of parent interrupts\n");
 		ret = -ENOMEM;
@@ -334,21 +335,24 @@ static int __init bcm7120_l2_intc_probe(struct device_node *dn,
 }
 
 static int __init bcm7120_l2_intc_probe_7120(struct device_node *dn,
-					     struct device_node *parent)
+					     struct device_node *parent,
+					     struct platform_device *pdev)
 {
-	return bcm7120_l2_intc_probe(dn, parent, bcm7120_l2_intc_iomap_7120,
-				     "BCM7120 L2");
+	return bcm7120_l2_intc_probe(dn, parent, pdev,
+				     bcm7120_l2_intc_iomap_7120, "BCM7120 L2");
 }
 
 static int __init bcm7120_l2_intc_probe_3380(struct device_node *dn,
-					     struct device_node *parent)
+					     struct device_node *parent,
+					     struct platform_device *pdev)
 {
-	return bcm7120_l2_intc_probe(dn, parent, bcm7120_l2_intc_iomap_3380,
-				     "BCM3380 L2");
+	return bcm7120_l2_intc_probe(dn, parent, pdev,
+				     bcm7120_l2_intc_iomap_3380, "BCM3380 L2");
 }
 
-IRQCHIP_DECLARE(bcm7120_l2_intc, "brcm,bcm7120-l2-intc",
-		bcm7120_l2_intc_probe_7120);
-
-IRQCHIP_DECLARE(bcm3380_l2_intc, "brcm,bcm3380-l2-intc",
-		bcm7120_l2_intc_probe_3380);
+IRQCHIP_PLATFORM_DRIVER_BEGIN(bcm7120_l2)
+IRQCHIP_MATCH("brcm,bcm7120-l2-intc", bcm7120_l2_intc_probe_7120)
+IRQCHIP_MATCH("brcm,bcm3380-l2-intc", bcm7120_l2_intc_probe_3380)
+IRQCHIP_PLATFORM_DRIVER_END(bcm7120_l2)
+MODULE_DESCRIPTION("Broadcom STB 7120-style L2 interrupt controller driver");
+MODULE_LICENSE("GPL v2");
-- 
2.25.1

