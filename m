Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D31A9435309
	for <lists+linux-mips@lfdr.de>; Wed, 20 Oct 2021 20:50:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231352AbhJTSws (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 Oct 2021 14:52:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231344AbhJTSwr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 20 Oct 2021 14:52:47 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C3ABC061753;
        Wed, 20 Oct 2021 11:50:32 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id g184so23314072pgc.6;
        Wed, 20 Oct 2021 11:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=knXL02VOmkFLU9YLWF/5g5SfaxjLRPWcMFGGkfQ2MJo=;
        b=CwnpnmqoUyzLPixiuryd7FzMM5VmBOzK2mWYjj4QKPObFUKVSD2YTl0IuVjioR1efF
         hO/I7iPFWkxHOuuUjnkZBdHbNxwOVAOAFwMx2gNIEHHFZpf5AbariY/Hh3adtGFY2oM/
         K8/YWv4dateizvYxq+XyVSPFnqsTDC9Q6FC+vpJZQ8chIhHsdUeBWhQo3xVdIESv2Wku
         T//3yC6Y7rLkIDzxGQOU60VLlhuw3hFmjw1UN1Za373gXRcs30OH52LLtP5YanCHzzq0
         4oxVA3NHHx7fcF+LXh5JiWz0/OiV85z75JBZykZnHTDmOTVFR0YtaTvndGXZeo98YdOf
         eeuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=knXL02VOmkFLU9YLWF/5g5SfaxjLRPWcMFGGkfQ2MJo=;
        b=Tf8Etr0SdyRFcS3612xJ0+2ovOtisJRqx1XGKC52QURjZ4nfbeE+strSBkV38cvX0u
         iQWyWsZV3oMfuXivt8zyOGQeeR4hHnwn7Da0amhKDrpX9L8D4ReE6kW8usCzJG0CLE5Z
         qCIgvRdtjzJ38E/ehw0alau04Rq54wYcNS3My3zVpNH1SuhAEvBEiI6BhSG2Xl+FCsoO
         XGolejJOYYpNKHqlwIN/f/RNyEVexlTSV1y1BjNLGj/MOAm4nQ3XU49tB+BUHdCtf3dd
         gUk+mdUXSDI+X1IOkcctfWmH0/y/5zYiSiIL48oio+1aWQNGbV+21LJp5UprwbQ5NuaF
         Hsjg==
X-Gm-Message-State: AOAM531cJkXpX5EyQ0osHyqb1gOVRlgakFCSwDJHCJNVgl8GlvCbpbQO
        9VHnAtOouspNvUPMRmhO45xZp3W4/NY=
X-Google-Smtp-Source: ABdhPJzbj1QnVdC00Dq8Zv2WOsoZwPyQb9sp5RFakZ/P6+eWTPhc+1XfO06ZwHAyNL4/qFNke95Lvw==
X-Received: by 2002:a63:7b03:: with SMTP id w3mr752742pgc.285.1634755831288;
        Wed, 20 Oct 2021 11:50:31 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id o127sm3267863pfb.216.2021.10.20.11.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 11:50:30 -0700 (PDT)
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
Subject: [PATCH v6 02/13] irqchip/irq-bcm7038-l1: Remove .irq_cpu_offline()
Date:   Wed, 20 Oct 2021 11:48:48 -0700
Message-Id: <20211020184859.2705451-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211020184859.2705451-1-f.fainelli@gmail.com>
References: <20211020184859.2705451-1-f.fainelli@gmail.com>
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

