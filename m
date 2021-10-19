Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 085384340F8
	for <lists+linux-mips@lfdr.de>; Tue, 19 Oct 2021 23:59:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbhJSWBW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 Oct 2021 18:01:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbhJSWBU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 19 Oct 2021 18:01:20 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 789BCC061768;
        Tue, 19 Oct 2021 14:59:06 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id v8so1145698pfu.11;
        Tue, 19 Oct 2021 14:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=knXL02VOmkFLU9YLWF/5g5SfaxjLRPWcMFGGkfQ2MJo=;
        b=J+bh9w6aQV5iXo7J6TIa1ul0MoxIg7yVn5hvtsa5Q5IAo7h29Xhz+WFwGg0o2ja4JD
         iUTXrKfNk2rmhsKYmfF1VB2gv3CohHuYRZkWpG1wFi2j3QRZ17vsb9z/lzC4rWZvPyAU
         EID8cEcjJ/2HcKQ0SPyqe5S05W6eEnIQz4zU5GuKiCJ/BhQ8tEI9f19gdvqdBuRKKtLe
         iDqHyEeN33YKQ2CU2DbV8/1N5flnMz3vmojbomEDvHXEbBQW2/gkCrlPOfqRv9MbaoIw
         Y1Cq1Lw7Xu9A0ah5d43Ia/Hnw4OA1nhVmACgd1RaEmWQGMahfP30Udp2egS0xyXyseod
         u25Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=knXL02VOmkFLU9YLWF/5g5SfaxjLRPWcMFGGkfQ2MJo=;
        b=ZX2R95tdCYK/EFznJU8WWnrLkhtHWWiSiHMmtrNUZIFvQ5ZbBJI1oglFV1kWtbtT5m
         otI4i34a/4OoZZrOtI4wCXBjcXtNfkpcGdWE6YgZ1jk5VohUaNulYUjTzuxXA3oHuEOr
         uCzADcX+FhHddAMtkWvWfw0EpN7wEidtp9Wsryacn0028ON7UDU36YysnjBrjbbNZtmj
         RYiQ1Qi0O0xCT/VjIc3B4ZeRsHZDCM42fos29hfglOnzWv9IQNeaCnsVHSGpqY2Xs63V
         FsYqvuC7XckEisw0v1I3YiZO6gEVrnI6V0QDhQ+9NyD51xtvDtr7CjYAxkKBU3rfgETu
         /W5w==
X-Gm-Message-State: AOAM532DoaihWuWSUcl7wxr+EEc+d3+E0O+oxZ+dK8ChasYUcER36qTR
        1yu8Swwl+IK5pRZKEvhpUF8RXiNsG7I=
X-Google-Smtp-Source: ABdhPJy+NOsLn0raHM4ZDL83rHjFaSBpPTZAUubBRpBpGrD32O0ki56vb2RyQVDqxdAtAoZpE0tJTA==
X-Received: by 2002:a62:7a8b:0:b0:44d:47e2:99bf with SMTP id v133-20020a627a8b000000b0044d47e299bfmr2305391pfc.64.1634680745695;
        Tue, 19 Oct 2021 14:59:05 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id bf7sm139325pjb.14.2021.10.19.14.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 14:59:05 -0700 (PDT)
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
Subject: [PATCH v5 03/14] irqchip/irq-bcm7038-l1: Remove .irq_cpu_offline()
Date:   Tue, 19 Oct 2021 14:58:44 -0700
Message-Id: <20211019215855.1920099-4-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019215855.1920099-1-f.fainelli@gmail.com>
References: <20211019215855.1920099-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

With arch/mips/kernel/smp-bmips.c having been migrated away from
irq_cpu_offline() and use irq_migrate_all_off_this_cpu() instead, we no
longer need to implement an .irq_cpu_offline() callback. This is a
necessary change to facilitate the building of this driver as a module.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/irqchip/irq-bcm7038-l1.c | 30 ------------------------------
 1 file changed, 30 deletions(-)

diff --git a/drivers/irqchip/irq-bcm7038-l1.c b/drivers/irqchip/irq-bcm7038-l1.c
index a035c385ca7a..750156217c82 100644
--- a/drivers/irqchip/irq-bcm7038-l1.c
+++ b/drivers/irqchip/irq-bcm7038-l1.c
@@ -221,33 +221,6 @@ static int bcm7038_l1_set_affinity(struct irq_data *d,
 	return 0;
 }
 
-#ifdef CONFIG_SMP
-static void bcm7038_l1_cpu_offline(struct irq_data *d)
-{
-	struct cpumask *mask = irq_data_get_affinity_mask(d);
-	int cpu = smp_processor_id();
-	cpumask_t new_affinity;
-
-	/* This CPU was not on the affinity mask */
-	if (!cpumask_test_cpu(cpu, mask))
-		return;
-
-	if (cpumask_weight(mask) > 1) {
-		/*
-		 * Multiple CPU affinity, remove this CPU from the affinity
-		 * mask
-		 */
-		cpumask_copy(&new_affinity, mask);
-		cpumask_clear_cpu(cpu, &new_affinity);
-	} else {
-		/* Only CPU, put on the lowest online CPU */
-		cpumask_clear(&new_affinity);
-		cpumask_set_cpu(cpumask_first(cpu_online_mask), &new_affinity);
-	}
-	irq_set_affinity_locked(d, &new_affinity, false);
-}
-#endif
-
 static int __init bcm7038_l1_init_one(struct device_node *dn,
 				      unsigned int idx,
 				      struct bcm7038_l1_chip *intc)
@@ -396,9 +369,6 @@ static struct irq_chip bcm7038_l1_irq_chip = {
 	.irq_mask		= bcm7038_l1_mask,
 	.irq_unmask		= bcm7038_l1_unmask,
 	.irq_set_affinity	= bcm7038_l1_set_affinity,
-#ifdef CONFIG_SMP
-	.irq_cpu_offline	= bcm7038_l1_cpu_offline,
-#endif
 #ifdef CONFIG_PM_SLEEP
 	.irq_set_wake		= bcm7038_l1_set_wake,
 #endif
-- 
2.25.1

