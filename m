Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 199EE435324
	for <lists+linux-mips@lfdr.de>; Wed, 20 Oct 2021 20:50:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231603AbhJTSxI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 Oct 2021 14:53:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231352AbhJTSw6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 20 Oct 2021 14:52:58 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37388C061769;
        Wed, 20 Oct 2021 11:50:43 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id 75so23349863pga.3;
        Wed, 20 Oct 2021 11:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DgNlnw/X0eZIQ1orBNwNN4B1FWjS3NXzL3tygL/Zpc0=;
        b=nclhbtnO1d3VUqCjuO6fbVBLJwRCFzgkiQCrv3xYB3HM5GTyWvBhu6RljQKGdK2pK5
         FR176iIdQqTr2RIJHZjvYaiVc8DtqG8Kbl30nEEs5hFoUAMhNRAedi+tAgyIhIw2qHbY
         Ah6th4TjmsOMkzx1p9m/a9z00gKcRY1FsArZ5GN/5oDFODb5uFWozEanMBUoZ6aKDxiG
         zWu1j9qJbrdumFiOrnH9tMw8uQWqPs5UYM+hatVgL/rBcTBxkszxKOv81hdZ38ezJL2R
         KPmZAnmi7K4LCsVXzYCCrxAcf2u+tMkzemWMSxWNfVLCrJrwvyHXKpP1nTOWgsGza8/k
         DSuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DgNlnw/X0eZIQ1orBNwNN4B1FWjS3NXzL3tygL/Zpc0=;
        b=LO2Er46BJlHPvKRrzLFe47v+6kjjbImxjxRqvPi3g1Wv1GrWBPsZpJ+ofu5FTLVYh+
         4PiS8wV+LueSx08FoHVO3kEf5Om3OuvzeLjOFvFaT5sGkJcpGeUKt6AFMKTwm7rk9M9F
         b3Rup9a6AQe4axqxvQpOC8Okq6SwZMkn0p1RAdoENDa9H7AIDZdkfvv7+Skxo7q1Pupu
         fWT7l9JEh4of84Z3vmO2zUMRGPxXPN48MoQQnS3uKG5Mju5/J7R16/VleK16YicHzbMK
         S6V+hOs0cIJF0MJXsf5PeV+5aqOFHhaj/mQl/h8u1VQRqnio4Lfmw4Pwh4puLz1OHpLH
         /nGA==
X-Gm-Message-State: AOAM531Thiqca4vaeZzKc8K8wMMm0xjkDALVvxVccN0rzrfA/k5ewIDa
        SwlIxXaWXi68D60qTa+8K7QxK4MH4KQ=
X-Google-Smtp-Source: ABdhPJxxYfaTpM34yX+EnA7h6FN0DD/aOb+FRn6t5KRFu0Tua/JQSghv55UaM3L5Rms0kPaDPlsd8A==
X-Received: by 2002:a05:6a00:2389:b0:44d:6d57:a38e with SMTP id f9-20020a056a00238900b0044d6d57a38emr1053648pfc.50.1634755842459;
        Wed, 20 Oct 2021 11:50:42 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id o127sm3267863pfb.216.2021.10.20.11.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 11:50:41 -0700 (PDT)
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
Subject: [PATCH v6 10/13] irqchip/irq-bcm7120-l2: Switch to IRQCHIP_PLATFORM_DRIVER
Date:   Wed, 20 Oct 2021 11:48:56 -0700
Message-Id: <20211020184859.2705451-11-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211020184859.2705451-1-f.fainelli@gmail.com>
References: <20211020184859.2705451-1-f.fainelli@gmail.com>
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
 drivers/irqchip/irq-bcm7120-l2.c | 21 +++++++++++++++------
 2 files changed, 18 insertions(+), 7 deletions(-)

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
index f23d7651ea84..d80e67a6aad2 100644
--- a/drivers/irqchip/irq-bcm7120-l2.c
+++ b/drivers/irqchip/irq-bcm7120-l2.c
@@ -220,6 +220,7 @@ static int __init bcm7120_l2_intc_probe(struct device_node *dn,
 {
 	unsigned int clr = IRQ_NOREQUEST | IRQ_NOPROBE | IRQ_NOAUTOEN;
 	struct bcm7120_l2_intc_data *data;
+	struct platform_device *pdev;
 	struct irq_chip_generic *gc;
 	struct irq_chip_type *ct;
 	int ret = 0;
@@ -230,7 +231,13 @@ static int __init bcm7120_l2_intc_probe(struct device_node *dn,
 	if (!data)
 		return -ENOMEM;
 
-	data->num_parent_irqs = of_irq_count(dn);
+	pdev = of_find_device_by_node(dn);
+	if (!pdev) {
+		ret = -ENODEV;
+		goto out_free_data;
+	}
+
+	data->num_parent_irqs = platform_irq_count(pdev);
 	if (data->num_parent_irqs <= 0) {
 		pr_err("invalid number of parent interrupts\n");
 		ret = -ENOMEM;
@@ -329,6 +336,7 @@ static int __init bcm7120_l2_intc_probe(struct device_node *dn,
 		if (data->map_base[idx])
 			iounmap(data->map_base[idx]);
 	}
+out_free_data:
 	kfree(data);
 	return ret;
 }
@@ -347,8 +355,9 @@ static int __init bcm7120_l2_intc_probe_3380(struct device_node *dn,
 				     "BCM3380 L2");
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

