Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9033A427680
	for <lists+linux-mips@lfdr.de>; Sat,  9 Oct 2021 04:21:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244343AbhJICWc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 Oct 2021 22:22:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244245AbhJICW2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 8 Oct 2021 22:22:28 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 859BEC061762;
        Fri,  8 Oct 2021 19:20:32 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id oa6-20020a17090b1bc600b0019ffc4b9c51so10542117pjb.2;
        Fri, 08 Oct 2021 19:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=knXL02VOmkFLU9YLWF/5g5SfaxjLRPWcMFGGkfQ2MJo=;
        b=PMSUeeAYM+oSOKVpdeZKASGuomG/1VnuqZk/Uq6pcXRsTS+Ue+dL7ctnmO7CK4cyo+
         uQEnzGeBaaKpmwDCTEhtv2mddWa3KWk2qvOcvE5ysHODe3eZ6fH5Z5Gl1Ic4OcEpBHFa
         lmi3ZYd1NXuS5I8nzIYe4ikN+QGK3JoE8T4KDkTGQ4Tmfdp5r3Kjz0h5ENzqMOXIQ8jB
         3k4RpZ8vLi8FK+8yhQrdl2zJ4DdUTZjIRZkrwoFyKrMAyG+FkqXkN/VT/z/oP6H82ag/
         mGJEdxxE56MvHnr5fX5ZrgbdcyKX3LKtrpHDxkj//f5OUKjzTXFHv1uX/mF9fSejdcKQ
         i26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=knXL02VOmkFLU9YLWF/5g5SfaxjLRPWcMFGGkfQ2MJo=;
        b=dM4wYnnMd01u64EgaNQxtM0PhHmFoGlqeNRyghv3XCuX7T/AORYiGOvs/WySi1wQ8X
         bH7LHiDAoIPRQfY2POwdOw4xDT1x3I9B8WyeHZDHLrH97mMz2oZRuQvqlbatdWYvCq2o
         ViFrgoTbkvm2z5lRfPkjvL39b/gqF9+ewVGTf/mHX6wk8z6KppWyt+kLNeF0Yqn0gCad
         fv1zQ6yOVIrLExqTEIyNEm+548OmYoRbLvs6JvIHYSsP7JCZ8dHhqRLIj29FBJ4GAb8J
         Nwr1D0U+OsiB810n76PD4Sc+eoMM0EargdDcYU80jyBo3BtfTOZuvh+YkbSlAdHX9vqi
         KjkQ==
X-Gm-Message-State: AOAM533c7lnfFjFkv3B563zlVH+a5mUlO78LkIxnRoyMaq+aTDnC/I1u
        TUE6XtKajsd3vVo+zt9utmsBoIcrHTs=
X-Google-Smtp-Source: ABdhPJzg2OrVUx8X7+f5WBVJ9F/oWRwsNiIZF7TwFPVn4Cq0sLkiujyN2p8LDToBroMMnAdUY/oE0A==
X-Received: by 2002:a17:90a:7d11:: with SMTP id g17mr15405247pjl.19.1633746031721;
        Fri, 08 Oct 2021 19:20:31 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id pi9sm444692pjb.31.2021.10.08.19.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 19:20:31 -0700 (PDT)
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
Subject: [PATCH v4 02/14] irqchip/irq-bcm7038-l1: Remove .irq_cpu_offline()
Date:   Fri,  8 Oct 2021 19:20:11 -0700
Message-Id: <20211009022023.3796472-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211009022023.3796472-1-f.fainelli@gmail.com>
References: <20211009022023.3796472-1-f.fainelli@gmail.com>
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

