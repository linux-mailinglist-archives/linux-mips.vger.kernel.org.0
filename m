Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97E6E42769F
	for <lists+linux-mips@lfdr.de>; Sat,  9 Oct 2021 04:22:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244556AbhJICX7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 Oct 2021 22:23:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244701AbhJICW5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 8 Oct 2021 22:22:57 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE488C0613E7;
        Fri,  8 Oct 2021 19:20:47 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id m14so9619210pfc.9;
        Fri, 08 Oct 2021 19:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T+nuZjtMi8lifdnlhi4/+fNb2Wj4qKRZZKIw/UMDjOI=;
        b=PpcBimyin5Ej1RL/hbX3YfaP6uvHOyuQ2APIZRjh0TYg8b9xfHmJ8kfayiYH9Flg63
         C8tARaCoaqfNSTDQZEJcIyIQaQ/dxi0ZJPrVb4VixDeZKZp4JZJXgHx/yfxlOFU/jQtC
         IjTZ1eWvfqla518XdNlLtUvwPz1JjOfECdUgQb/QePJ1fqRTnxkL4WcznbFZYj1EfteW
         6pJgcbIPSD5PZGJ243SNzsWTiriLB11+XXHgQeABobg11Ln5ocON54nVzzMK1nLhVeJc
         orShxsK9PZH0LsGZHATZ9cZ0bBIrDcNf4LOkaaicBLD8jNxzTmZNxNnmDL/vp3FWirdp
         BEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T+nuZjtMi8lifdnlhi4/+fNb2Wj4qKRZZKIw/UMDjOI=;
        b=TbQ9MjjyLWKEb6AWYzy1YdTFo5g2auKOW+eNdKJdse5NMUCHGYnrT+I8YkOz0WyO/r
         5m95MrmvZ3JcdBiK/KH2w/mg8PwKjxiqOousYHM5GJaYmCPJbr20JqExXaDlMvtY25yJ
         IQNe/4YgQzqJme7n1PrW1roedDYQX/TPO/Q/c9n8hrFt56E5TSzxelkhYNrPy1+AdzUf
         EJxdVxWwUtLAqdZN6B0NimcdQIIYDZrlHM+nYShBs8/8UkjEajWsq5ujJATpeMS6J9D3
         GS9loPEjigYoeFPfR/SfvOTAmBk1dfjbNVaUR7vRQ/rEEPMqMTm/0AwqVCS/S72gk/JK
         Bf8A==
X-Gm-Message-State: AOAM532GAA3jQchg427w6wrv4Ayi2TnfdnS524lFH8uUkpCgAyEiTQCJ
        GhdooJsiEkM4KN0DL1E/Oespbnm0UNc=
X-Google-Smtp-Source: ABdhPJzyNux7TjxdeK/+G14//P/gTbXH1+cv4k91jYMW0VDllt/pYAjrkv2fXLEl/cUoMu0W93Q0Tg==
X-Received: by 2002:a63:4717:: with SMTP id u23mr7514059pga.359.1633746047052;
        Fri, 08 Oct 2021 19:20:47 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id pi9sm444692pjb.31.2021.10.08.19.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 19:20:46 -0700 (PDT)
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
Subject: [PATCH v4 11/14] irqchip/irq-bcm7120-l2: Switch to IRQCHIP_PLATFORM_DRIVER
Date:   Fri,  8 Oct 2021 19:20:20 -0700
Message-Id: <20211009022023.3796472-12-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211009022023.3796472-1-f.fainelli@gmail.com>
References: <20211009022023.3796472-1-f.fainelli@gmail.com>
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

