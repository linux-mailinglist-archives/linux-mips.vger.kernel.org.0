Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9660B41B601
	for <lists+linux-mips@lfdr.de>; Tue, 28 Sep 2021 20:23:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242343AbhI1SYl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Sep 2021 14:24:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242221AbhI1SYZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 Sep 2021 14:24:25 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 841DEC06177A;
        Tue, 28 Sep 2021 11:22:39 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id h12so5212279pjj.1;
        Tue, 28 Sep 2021 11:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T+nuZjtMi8lifdnlhi4/+fNb2Wj4qKRZZKIw/UMDjOI=;
        b=G+o2xUh8M8NkfU8NT07HPrClNmOIZMSfAVG7yNAY2y3Wn59GiAHNpo1x731Ch5MfSn
         v1ir4r+zbPIQb6DQmz+oRF2YqZBsUlEDnGap5ajhB5oDQEBgtB15J0TQPtlP8tK3rYLc
         EH1WsMHJHEheeQm64Wc9m/Al+D4ViluDEE6/+Ml5TT0GoMwr8hffKG5Pz300dWuhgzOt
         O7ZjQx1o5Ls9jeyMHLutPbp/0ETqenPDVP5yAzfw87GvqkNeT5MWDRhl1QsLG7qL4ogG
         cSu5R/Y5BO/TnBp+UDCof3QgErs1PLmD0sZEDpl5EzRhZEp1ygM/GCUNWarCKfmvin+5
         e4Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T+nuZjtMi8lifdnlhi4/+fNb2Wj4qKRZZKIw/UMDjOI=;
        b=ziDuJ6bBa9+2sIxre+UQQLowpDbyHFYfxfBMPTAEF6bLaKCTvA86WEurZoonpEvlvc
         FXz4TJDslS1afzO3KLoaDNZWq3IFRvGUqil3a0iB4+N4q/WWsLmjy5f07UHAURPAde9Z
         /hUQFzy6cBsCQu6QM51/Y6g125Lm80XYR0d1P6a/TFaYXRKxmrqOUqDXgBUPoFU9As3e
         0NfQ+uVwskq/CDKfDLzO2gNyDDhEORCIyKZ8Nk9psBNGdUovgU1wnoJu4sCdsoANz9Vu
         fE+NoYRV9ombRwjwRb8xDKWctM0DQFAOS3fCc1fQVkC4DnlaB+BdEtbV3umTQcsU3bj1
         5gWA==
X-Gm-Message-State: AOAM531TWvwobadUkf/sKdcuU3NqmzmFKjXNIHHdGZ6OOYDqGppd0rrf
        dxbWA3AM3ZM+enyHwrr2xtQX/eLLgJQ=
X-Google-Smtp-Source: ABdhPJyK5lvwpIOD+t+3MtZZcxHZuqPusK5TwFvp3Y9TnVD2reoEB8HTRQ85YAUfTWG1t1tC4YWxZw==
X-Received: by 2002:a17:902:6f01:b0:13b:7b8b:84a3 with SMTP id w1-20020a1709026f0100b0013b7b8b84a3mr6242105plk.40.1632853358738;
        Tue, 28 Sep 2021 11:22:38 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id x19sm20855288pfn.105.2021.09.28.11.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 11:22:38 -0700 (PDT)
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
Subject: [PATCH v3 11/14] irqchip/irq-bcm7120-l2: Switch to IRQCHIP_PLATFORM_DRIVER
Date:   Tue, 28 Sep 2021 11:21:36 -0700
Message-Id: <20210928182139.652896-12-f.fainelli@gmail.com>
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

