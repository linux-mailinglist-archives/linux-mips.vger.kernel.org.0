Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A834B25BC
	for <lists+linux-mips@lfdr.de>; Fri, 13 Sep 2019 21:10:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388214AbfIMTKc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 13 Sep 2019 15:10:32 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:34259 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388321AbfIMTKc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 13 Sep 2019 15:10:32 -0400
Received: by mail-pl1-f195.google.com with SMTP id d3so13666238plr.1;
        Fri, 13 Sep 2019 12:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=FFcP+UDVFEHmJs1QxzZlzSRhhd6SePZOlYiyZUxy6po=;
        b=rd9zXjfQyCb3Bo8/P721KqHGHmPAJdBE4Wvuh9BsBaFIMShZkZreNJdo45Iil47Q5O
         OJ1xVbGjR4CtVETA8CGjZgFkhg5sWt5vWyp8po9A9iiw0vybB5CW9ZzVryy8jydu8ibr
         I+flMYYZb9/gcuzP2XbygxSjwejGAa/u7XsEnlTWPeQ1KIew1BrWuKQc8a6duT8Lc7se
         ny9adHtm4i2uxwvfEvCOQKgfwCAW24Lr4uvig+e471z50K8bkPJ7QBv20hkg36gURXwb
         pVrhJB7ZI5FO6B64XUX/C6rIofqWwUhGjXII0k72FrVaRkQP1ZiF7PgGie4Zvws9Gk6R
         tygA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=FFcP+UDVFEHmJs1QxzZlzSRhhd6SePZOlYiyZUxy6po=;
        b=ivq6Cnd9Ek4yOfQ6a0qwWUMW8qPOTwK0NA3Kl/V1bLyL6u7y7s0tNW7H/j6syUntQO
         0mU63NNTn73UyFLjVuPf+ieTXIPF+bJz1vAkQnSVd5MY4qSbP5FFveZtaqsW5dJFb0rD
         y9ZI0bd6St7H65OOzZWBxrMrkCKHyUX0lfnbWlv0w9HL7yxQGibe+ZGl0y891oTsyUPR
         r9k1kaZ7NTranGdJfExdqch7PXQkvUtifK5dfOlftKC1a3xEuYAnqVrBeEK0oXUcmCJA
         m30JqN+cquXPTTy4As5P6gpK1LiEH+4QtDnvLJIlPXiWt/aUDzfSqlFjUZzZkMYxqFE/
         Li3g==
X-Gm-Message-State: APjAAAWz1pidOOEcncNtupg19FzCCzBQAyhrc1kWXiJPA4eQiNxeqrEX
        OiT9WCDp2t+5KH+Mv5i6XGq/RpZ8q6U=
X-Google-Smtp-Source: APXvYqyUX3O49Mdt0MzVDLtyNcXrGaddTXK4bW6BELEhUNQ8Ab33gUUR75qABZaEiC50qikFLcf60w==
X-Received: by 2002:a17:902:8c8a:: with SMTP id t10mr28825173plo.109.1568401831271;
        Fri, 13 Sep 2019 12:10:31 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id r18sm27273779pfc.3.2019.09.13.12.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2019 12:10:30 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Justin Chen <justinpopo6@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kevin Cernekee <cernekee@gmail.com>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        bcm-kernel-feedback-list@broadcom.com (open list:BROADCOM BMIPS MIPS
        ARCHITECTURE),
        linux-mips@vger.kernel.org (open list:BROADCOM BMIPS MIPS ARCHITECTURE)
Subject: [PATCH 1/6] irqchip/irq-bcm7038-l1: Add PM support
Date:   Fri, 13 Sep 2019 12:10:21 -0700
Message-Id: <20190913191026.8801-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190913191026.8801-1-f.fainelli@gmail.com>
References: <20190913191026.8801-1-f.fainelli@gmail.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Justin Chen <justinpopo6@gmail.com>

The current l1 controller does not mask any interrupts when dropping
into suspend. This mean we can receive unexpected wake up sources.
Modified MIPS l1 controller to mask the all non-wake interrupts before
dropping into suspend.

Signed-off-by: Justin Chen <justinpopo6@gmail.com>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/irqchip/irq-bcm7038-l1.c | 98 ++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/drivers/irqchip/irq-bcm7038-l1.c b/drivers/irqchip/irq-bcm7038-l1.c
index fc75c61233aa..c7e37eefec6d 100644
--- a/drivers/irqchip/irq-bcm7038-l1.c
+++ b/drivers/irqchip/irq-bcm7038-l1.c
@@ -27,6 +27,7 @@
 #include <linux/types.h>
 #include <linux/irqchip.h>
 #include <linux/irqchip/chained_irq.h>
+#include <linux/syscore_ops.h>
 
 #define IRQS_PER_WORD		32
 #define REG_BYTES_PER_IRQ_WORD	(sizeof(u32) * 4)
@@ -39,6 +40,10 @@ struct bcm7038_l1_chip {
 	unsigned int		n_words;
 	struct irq_domain	*domain;
 	struct bcm7038_l1_cpu	*cpus[NR_CPUS];
+#ifdef CONFIG_PM_SLEEP
+	struct list_head	list;
+	u32			wake_mask[MAX_WORDS];
+#endif
 	u8			affinity[MAX_WORDS * IRQS_PER_WORD];
 };
 
@@ -47,6 +52,17 @@ struct bcm7038_l1_cpu {
 	u32			mask_cache[0];
 };
 
+/*
+ * We keep a list of bcm7038_l1_chip used for suspend/resume. This hack is
+ * used because the struct chip_type suspend/resume hooks are not called
+ * unless chip_type is hooked onto a generic_chip. Since this driver does
+ * not use generic_chip, we need to manually hook our resume/suspend to
+ * syscore_ops.
+ */
+#ifdef CONFIG_PM_SLEEP
+static LIST_HEAD(bcm7038_l1_intcs_list);
+#endif
+
 /*
  * STATUS/MASK_STATUS/MASK_SET/MASK_CLEAR are packed one right after another:
  *
@@ -287,6 +303,77 @@ static int __init bcm7038_l1_init_one(struct device_node *dn,
 	return 0;
 }
 
+#ifdef CONFIG_PM_SLEEP
+static int bcm7038_l1_suspend(void)
+{
+	struct bcm7038_l1_chip *intc;
+	unsigned long flags;
+	int boot_cpu, word;
+
+	/* Wakeup interrupt should only come from the boot cpu */
+	boot_cpu = cpu_logical_map(smp_processor_id());
+
+	list_for_each_entry(intc, &bcm7038_l1_intcs_list, list) {
+		raw_spin_lock_irqsave(&intc->lock, flags);
+		for (word = 0; word < intc->n_words; word++) {
+			l1_writel(~intc->wake_mask[word],
+				intc->cpus[boot_cpu]->map_base +
+				reg_mask_set(intc, word));
+			l1_writel(intc->wake_mask[word],
+				intc->cpus[boot_cpu]->map_base +
+				reg_mask_clr(intc, word));
+		}
+		raw_spin_unlock_irqrestore(&intc->lock, flags);
+	}
+
+	return 0;
+}
+
+static void bcm7038_l1_resume(void)
+{
+	struct bcm7038_l1_chip *intc;
+	unsigned long flags;
+	int boot_cpu, word;
+
+	boot_cpu = cpu_logical_map(smp_processor_id());
+
+	list_for_each_entry(intc, &bcm7038_l1_intcs_list, list) {
+		raw_spin_lock_irqsave(&intc->lock, flags);
+		for (word = 0; word < intc->n_words; word++) {
+			l1_writel(intc->cpus[boot_cpu]->mask_cache[word],
+				intc->cpus[boot_cpu]->map_base +
+				reg_mask_set(intc, word));
+			l1_writel(~intc->cpus[boot_cpu]->mask_cache[word],
+				intc->cpus[boot_cpu]->map_base +
+				reg_mask_clr(intc, word));
+		}
+		raw_spin_unlock_irqrestore(&intc->lock, flags);
+	}
+}
+
+static struct syscore_ops bcm7038_l1_syscore_ops = {
+	.suspend	= bcm7038_l1_suspend,
+	.resume		= bcm7038_l1_resume,
+};
+
+static int bcm7038_l1_set_wake(struct irq_data *d, unsigned int on)
+{
+	struct bcm7038_l1_chip *intc = irq_data_get_irq_chip_data(d);
+	unsigned long flags;
+	u32 word = d->hwirq / IRQS_PER_WORD;
+	u32 mask = BIT(d->hwirq % IRQS_PER_WORD);
+
+	raw_spin_lock_irqsave(&intc->lock, flags);
+	if (on)
+		intc->wake_mask[word] |= mask;
+	else
+		intc->wake_mask[word] &= ~mask;
+	raw_spin_unlock_irqrestore(&intc->lock, flags);
+
+	return 0;
+}
+#endif
+
 static struct irq_chip bcm7038_l1_irq_chip = {
 	.name			= "bcm7038-l1",
 	.irq_mask		= bcm7038_l1_mask,
@@ -295,6 +382,9 @@ static struct irq_chip bcm7038_l1_irq_chip = {
 #ifdef CONFIG_SMP
 	.irq_cpu_offline	= bcm7038_l1_cpu_offline,
 #endif
+#if CONFIG_PM_SLEEP
+	.irq_set_wake		= bcm7038_l1_set_wake,
+#endif
 };
 
 static int bcm7038_l1_map(struct irq_domain *d, unsigned int virq,
@@ -340,6 +430,14 @@ int __init bcm7038_l1_of_init(struct device_node *dn,
 		goto out_unmap;
 	}
 
+#ifdef CONFIG_PM_SLEEP
+	/* Add bcm7038_l1_chip into a list */
+	INIT_LIST_HEAD(&intc->list);
+	list_add_tail(&intc->list, &bcm7038_l1_intcs_list);
+
+	register_syscore_ops(&bcm7038_l1_syscore_ops);
+#endif
+
 	pr_info("registered BCM7038 L1 intc (%pOF, IRQs: %d)\n",
 		dn, IRQS_PER_WORD * intc->n_words);
 
-- 
2.17.1

