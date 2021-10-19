Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F61A434116
	for <lists+linux-mips@lfdr.de>; Tue, 19 Oct 2021 23:59:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230261AbhJSWB4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 Oct 2021 18:01:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230137AbhJSWBi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 19 Oct 2021 18:01:38 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFD84C061774;
        Tue, 19 Oct 2021 14:59:19 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id t184so1207617pfd.0;
        Tue, 19 Oct 2021 14:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T+nuZjtMi8lifdnlhi4/+fNb2Wj4qKRZZKIw/UMDjOI=;
        b=pnk2Ki9piaE+Jf4iFrqOU1lKxOr4VVKqgnzA6M0Q1bvCpFY0cqleKo31AGAzmqF0e1
         NSFhLdZ5Fq3W4nymSNGrhF0/syk0CZKc5+levWF5Afh0mmgNn1li4LB64emC+RRfU2t3
         hHP7JBe/gsgD+QdqRp1HZemxZ4WKQTa5S2w2W+ujJJn8pl41ymO/xKUDMHdhevll4LOk
         wNwqIfZYLkxH4XTcBaJAFHKwN3mFB2aBgJSOvDjrhP4m8OCI0zoKGDiX0izDyi/lLeBC
         cA6Iv0n/Ys+U40IggBld3Nssr5StzgHVt1myOzTCPAM6RjVBAoCEqDAboW5fyHVzCtPC
         Vk5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T+nuZjtMi8lifdnlhi4/+fNb2Wj4qKRZZKIw/UMDjOI=;
        b=XQBRDSNyC5wLeQrHPAHkVvUeCKysqPCVGeKqC6Pi3cmNmghN0v3mNDJ+g3ZLR4Z79t
         HuXgLJn5jtLc56LelkcB/VZhsORVS5GpspHKSyxxts/4v8KOSxhpSfWazbKvwvhHiCxX
         u00SD3I1wZ9n5n8/2ETP4grAw03tnaBp+Jizo7SERqoW7mNLhSrlQfd2zu7JAZIA1T15
         q2DocTPnbFbFo/58idhLQPmn9mNM1z62ixljiKW18CVKUldR3PM0OGDZlHO7w0MycNtX
         Je65543bkM4+4j2q/3EpF1MyABp+6hS5HIUklPBio5Q+7gCcOKrTRYZ7wVnEfc1v0Erp
         Ac9w==
X-Gm-Message-State: AOAM530lvTtyHW+dgP60dSkjfLmjDh1/fnX8NDJwBc3JGZi2S5daQsJK
        1VEkEefBH/9qSSCTdlxFjRmGf5D0tYI=
X-Google-Smtp-Source: ABdhPJxLuePV0+uMoFQjH8ssdV4w2GVRjyIuIhxVjnIoy7crBYQp4NMCio/lroj0C7Pdni9mP1UP6Q==
X-Received: by 2002:aa7:9d0b:0:b0:44c:62a6:8679 with SMTP id k11-20020aa79d0b000000b0044c62a68679mr2384955pfp.0.1634680759089;
        Tue, 19 Oct 2021 14:59:19 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id bf7sm139325pjb.14.2021.10.19.14.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 14:59:18 -0700 (PDT)
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
Subject: [PATCH v5 11/14] irqchip/irq-bcm7120-l2: Switch to IRQCHIP_PLATFORM_DRIVER
Date:   Tue, 19 Oct 2021 14:58:52 -0700
Message-Id: <20211019215855.1920099-12-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019215855.1920099-1-f.fainelli@gmail.com>
References: <20211019215855.1920099-1-f.fainelli@gmail.com>
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

