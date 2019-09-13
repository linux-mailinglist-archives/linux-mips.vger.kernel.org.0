Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F4C7B25E5
	for <lists+linux-mips@lfdr.de>; Fri, 13 Sep 2019 21:17:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389946AbfIMTPv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 13 Sep 2019 15:15:51 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:45094 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388860AbfIMTPv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 13 Sep 2019 15:15:51 -0400
Received: by mail-pf1-f193.google.com with SMTP id y72so18626553pfb.12;
        Fri, 13 Sep 2019 12:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=dcs6bMyS/VDu68tzLaf+jXNYIvYTGSAM7Bablmbjtko=;
        b=sJJ+SsFBjNEeBJLl3+8b06rFGIeb+5olRurrrk19mN5RhLHimGUrcOji5FrI6ujnwp
         JMF7txWsn89EUYJJ3bWFfHm5ElcBO2d5XSxOouVl6ZbIAjtKmMLE88IKvjfZZmDNlmnT
         7DiDhbAgLCz9nRjdh24kCFtkmw5WuIfcwsieJjEBP0lEsr0NKXAVHiKmIhMZbqMcfUbu
         PnZ9S3GcmLy3WkOKpbj++UzDgYq2j8n9cUguVw4uej9i1IqJQ+IyHI2dCZyse3pZCPrE
         z3oDSmUuy16DaNSC35hGOM72ngnymKghDVAZSBqZbxeBwMgON+6fmvE4SrajEHCtdJA8
         NKVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=dcs6bMyS/VDu68tzLaf+jXNYIvYTGSAM7Bablmbjtko=;
        b=cIn2ACRCMjCwtPZhj2K4myTPsYTwaeZ00fp8N0KJ4eGPaMNrvBITRDt5hcjGgJhIBY
         F0seYjJ1kl3OTczg9Cki3p3NJCaKrmTizF/u4EPFUHIgtQp07VB5z6ZQ6JX8Tm8pIQZ9
         tKi+BzO3/yuM+9cmJJ0xTYpX3RJ4F2GJzMPWbac6aF5BMvC9JuikNFiZCXWZgO9MJpMV
         SUw08g7Olm9BRtfh/WA7FIE+A4UAGyYEM0qCRd59L5FZvVwkQoH7DFqxqM5GZi8ssF8s
         +PrF42GP3KdiN7yttfskkrXlDlSZjYrGR5PrBNVvd1iWuGPYYI57ibJNyfyrD70zrgtr
         WnWA==
X-Gm-Message-State: APjAAAUzQLK9FkxQga8SSDCdLofCSTpitpX0NrYVzOtQxbIl99wh8AjT
        u7L6K0T3EtE2db20xUHHfI++CJ92spc=
X-Google-Smtp-Source: APXvYqwZKbhxTZdGWMshxGNcxFTxjfeFGOIkX1BMH19hPGJynwsek8/TY57nQjtt7q/Q3tQ7CN9l7w==
X-Received: by 2002:a63:cb4f:: with SMTP id m15mr44502938pgi.100.1568402148516;
        Fri, 13 Sep 2019 12:15:48 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id m24sm6988149pgj.71.2019.09.13.12.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2019 12:15:47 -0700 (PDT)
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
Subject: [PATCH v2 1/5] irqchip/irq-bcm7038-l1: Add PM support
Date:   Fri, 13 Sep 2019 12:15:38 -0700
Message-Id: <20190913191542.9908-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190913191542.9908-1-f.fainelli@gmail.com>
References: <20190913191542.9908-1-f.fainelli@gmail.com>
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
index fc75c61233aa..f5e4ff5251ab 100644
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
+#ifdef CONFIG_PM_SLEEP
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

