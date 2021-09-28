Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14BA041B5DF
	for <lists+linux-mips@lfdr.de>; Tue, 28 Sep 2021 20:22:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242188AbhI1SYF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Sep 2021 14:24:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242162AbhI1SYE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 Sep 2021 14:24:04 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34C1AC06161C;
        Tue, 28 Sep 2021 11:22:25 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id g184so22098835pgc.6;
        Tue, 28 Sep 2021 11:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=knXL02VOmkFLU9YLWF/5g5SfaxjLRPWcMFGGkfQ2MJo=;
        b=YfTvKPMV9bMEJzY5iInORnexx/3hegz8PI3DEcB0pgPFaINO/RNHFnPjSryI+E57GO
         MyFTELurYhdgmIuVtrrTVeldLitYMvKwMESeCojCrKycjhi8vGLm8PZgSUhGeznN3JR1
         bza7N91AlrXdoBa/8yC5N5VROau9/Y4fx9WnNIV7JOTC+eEaj+74ozgOzm+qAY2AdNo3
         ueOXz/VmnWQNXkiQY3rTg0Fwmffn4r5cpMgPo6JNsS0shoD48F3VGqKOgNN923CkYf3O
         t+kqvH6aFEdXDkq1+B+CJu/KaHLxXGthwb9bmvYYL6Hobb0WIyPPBwCWyH0FUzK6pwCp
         /2Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=knXL02VOmkFLU9YLWF/5g5SfaxjLRPWcMFGGkfQ2MJo=;
        b=68ImWXbfycLf32H8vIFb8lduKYNzlNF06EaWTsxqIQtRp81Iivx0CyF6ear990JQFu
         VNz4xTvTzdGkRBx/u7tAKgBGUJ26B2911uvZRaBPoXgsVn4H4np8z4tz5aPiBQ1mxoY1
         U6GsFeHgBRpUGoVrToZczPZy0HqVTqmSoiM++w7Z9MRPek59RYC/K5gDnBcy3Sxg7I/W
         VfMFLGenR1HTTi3dBkqC9n1nTNLBeYHRkh1Xh6dVlTG+6qvN9oZgQAJZy+i+X2WmMi+C
         rG219rpcws9QkQ8ADk7IjrOh+00qkra5w8Yl3vf+ONdQXlj0UNJ+TiJGVVjECklRMsNH
         pP7g==
X-Gm-Message-State: AOAM531dba1DMq5ozlROzYHiSpGZL0X9+lr7wCxSkzTxLhMP8kfl0OEf
        mapDxZ/is5KOsvb5u7OuvqWdNzT+0T0=
X-Google-Smtp-Source: ABdhPJzBkkkTfPaj6nkEz7iWLe04W8uwPzujCOo5VdzxnWQ+PdGxbj9GhnDWDX8j1UiqMe9Iw1umqg==
X-Received: by 2002:a65:448a:: with SMTP id l10mr5712298pgq.313.1632853344389;
        Tue, 28 Sep 2021 11:22:24 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id x19sm20855288pfn.105.2021.09.28.11.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 11:22:23 -0700 (PDT)
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
Subject: [PATCH v3 02/14] irqchip/irq-bcm7038-l1: Remove .irq_cpu_offline()
Date:   Tue, 28 Sep 2021 11:21:27 -0700
Message-Id: <20210928182139.652896-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210928182139.652896-1-f.fainelli@gmail.com>
References: <20210928182139.652896-1-f.fainelli@gmail.com>
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

