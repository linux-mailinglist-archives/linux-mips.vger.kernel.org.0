Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D9043A20B
	for <lists+linux-mips@lfdr.de>; Sat,  8 Jun 2019 22:48:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727447AbfFHUs7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 8 Jun 2019 16:48:59 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:38928 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727364AbfFHUs7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 8 Jun 2019 16:48:59 -0400
Received: by mail-wm1-f65.google.com with SMTP id z23so4845168wma.4
        for <linux-mips@vger.kernel.org>; Sat, 08 Jun 2019 13:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MoZjR9jhSXzyqQW22exJXKfbEIeTd2cihZt9BF+xunE=;
        b=Arz2tdFnwZAfPn9yvYESN1oHv483tTp0KiFFbGdctYKJluDbAgjPvYgZVerrGVMpB6
         bRRbceCOr8K3TDc5awmoDotgRRA1I8zmtppvZf1TfKVLAS5+2Uo1t1JO73U2YZk5n0B8
         Gc0jWdFygunwkuORSM5rNXAmTIlZZCbUtqPrvKoVA7vvSUo8xMG2Z1Ycu6ZpVY4smwWY
         ZRFvsK1CeA2/071J9ad9tGTHAvzY5KyoG6cMBomyJ0PhAZtu8BOV4mAKcxJQKLGfTs16
         Qi+3wONNK2aA3jOicGj80DdDjH97rGtmUeZCQMggxl19PDjoYBGhn22qdHctUyP6khB3
         atug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MoZjR9jhSXzyqQW22exJXKfbEIeTd2cihZt9BF+xunE=;
        b=rXj0Q6/sO20EOeUWisi35BuJ6DH06dWieeY50EYxgWBLO0sAldFFOyUcGIVb5tW1D6
         L5oTetwl9U2KJlf7dzYfoFpVhd75+5+ARtzhQP0POWtYwdoYefT/dn2PQfEYlwHoMEzW
         4WLd012A8LZYG2eCMYVos/+BCOQqR2L6N0hXClgN0dx8H8I+Wd/oO84c0M3I73QOcnMC
         TDgk+rip9gNmOYbqN+UX5CLMACDSncNGJLizC0z7wUpHWj99ZL9ja5ramC3/X9RaT6A4
         7rEaEfpBMPRZs2sSCYkh6Q3REE/Nhk0AdQJQ9m+jxnURuCz7CJXmOpSZgjXNhRFxPgpQ
         G4+g==
X-Gm-Message-State: APjAAAUlii4fRiLsotArYL+XvGCoBtwdOHFCeK9EkHN+MY06N7y9tdX3
        8QRyr2aFUUvq7/NScYIIrOuW+n9T
X-Google-Smtp-Source: APXvYqyqYEpOEfFObllVg2oJn0todAk5ZL6aELmirw4OublJHxWoYN1WJ0i6m3NV5OTdgbFiZTyltw==
X-Received: by 2002:a1c:2004:: with SMTP id g4mr7437798wmg.173.1560026935169;
        Sat, 08 Jun 2019 13:48:55 -0700 (PDT)
Received: from kontron.lan (2001-1ae9-0ff1-f191-359a-8d64-e90a-f663.ip6.tmcz.cz. [2001:1ae9:ff1:f191:359a:8d64:e90a:f663])
        by smtp.gmail.com with ESMTPSA id f204sm4986394wme.18.2019.06.08.13.48.54
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 08 Jun 2019 13:48:54 -0700 (PDT)
From:   petrcvekcz@gmail.com
X-Google-Original-From: petrcvekcz.gmail.com
To:     hauke@hauke-m.de, john@phrozen.org
Cc:     Petr Cvek <petrcvekcz@gmail.com>, linux-mips@vger.kernel.org,
        openwrt-devel@lists.openwrt.org, pakahmar@hotmail.com
Subject: [PATCH v1 7/7] MIPS: lantiq: Add SMP support for lantiq interrupt controller
Date:   Sat,  8 Jun 2019 22:48:10 +0200
Message-Id: <07892acc26ae73c6567254a28faac7a723cedbc3.1560024463.git.petrcvekcz@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1560024463.git.petrcvekcz@gmail.com>
References: <cover.1560024463.git.petrcvekcz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Petr Cvek <petrcvekcz@gmail.com>

Some lantiq devices have two ICU controllers. Both are respectively
routed to the individual VPEs. The patch adds the support for the second
ICU.

The patch changes a register definition of the driver. Instead of an
individual IM, the whole ICU is defined. This will only affects openwrt
patched kernel (vanilla doesn't have additional .dts files).

Also spinlocks has been added, both cores can RMW different bitfields
in the same register. Added affinity set function. The new VPE cpumask
will take into the action at the irq enable.

The driver can rotate the preset VPEs affinity cpumask. Either by
an automatic cycling or just by using the first VPE from the affinity
cpumask. This can be switched by macro AUTO_AFFINITY_ROTATION. The
automatic rotation can be switched off from userspace by limiting the IRQ
to only one VPE.

The rotation was taken from MIPS loongson64's ht_irqdispatch().

The functionality was tested on 4.14 openwrt kernel and TP-W9980B modem.

Signed-off-by: Petr Cvek <petrcvekcz@gmail.com>
---
 arch/mips/lantiq/irq.c | 155 ++++++++++++++++++++++++++++++++++-------
 1 file changed, 131 insertions(+), 24 deletions(-)

diff --git a/arch/mips/lantiq/irq.c b/arch/mips/lantiq/irq.c
index b9ca20ff07d5..0cdb7e88bfe5 100644
--- a/arch/mips/lantiq/irq.c
+++ b/arch/mips/lantiq/irq.c
@@ -21,6 +21,15 @@
 #include <lantiq_soc.h>
 #include <irq.h>
 
+/*
+ * If defined, every IRQ enable call will switch the interrupt to
+ * the other VPE. You can limit used VPEs from the userspace.
+ *
+ * If not defined, only the first configured VPE from the userspace
+ * will be used.
+ */
+#define AUTO_AFFINITY_ROTATION
+
 /* register definitions - internal irqs */
 #define LTQ_ICU_ISR		0x0000
 #define LTQ_ICU_IER		0x0008
@@ -46,8 +55,11 @@
  */
 #define LTQ_ICU_EBU_IRQ		22
 
-#define ltq_icu_w32(m, x, y)	ltq_w32((x), ltq_icu_membase[m] + (y))
-#define ltq_icu_r32(m, x)	ltq_r32(ltq_icu_membase[m] + (x))
+#define ltq_icu_w32(vpe, m, x, y)	\
+	ltq_w32((x), ltq_icu_membase[vpe] + m*0x28 + (y))
+
+#define ltq_icu_r32(vpe, m, x)		\
+	ltq_r32(ltq_icu_membase[vpe] + m*0x28 + (x))
 
 #define ltq_eiu_w32(x, y)	ltq_w32((x), ltq_eiu_membase + (y))
 #define ltq_eiu_r32(x)		ltq_r32(ltq_eiu_membase + (x))
@@ -55,11 +67,15 @@
 /* we have a cascade of 8 irqs */
 #define MIPS_CPU_IRQ_CASCADE		8
 
+#define MAX_VPES 2
+
 static int exin_avail;
 static u32 ltq_eiu_irq[MAX_EIU];
-static void __iomem *ltq_icu_membase[MAX_IM];
+static void __iomem *ltq_icu_membase[MAX_VPES];
 static void __iomem *ltq_eiu_membase;
 static struct irq_domain *ltq_domain;
+static DEFINE_SPINLOCK(ltq_eiu_lock);
+static DEFINE_RAW_SPINLOCK(ltq_icu_lock);
 static int ltq_perfcount_irq;
 
 int ltq_eiu_get_irq(int exin)
@@ -73,45 +89,98 @@ void ltq_disable_irq(struct irq_data *d)
 {
 	unsigned long offset = d->hwirq - MIPS_CPU_IRQ_CASCADE;
 	unsigned long im = offset / INT_NUM_IM_OFFSET;
+	unsigned long flags;
+	int vpe;
 
 	offset %= INT_NUM_IM_OFFSET;
-	ltq_icu_w32(im, ltq_icu_r32(im, LTQ_ICU_IER) & ~BIT(offset),
-		    LTQ_ICU_IER);
+
+	raw_spin_lock_irqsave(&ltq_icu_lock, flags);
+	for_each_present_cpu(vpe) {
+		ltq_icu_w32(vpe, im,
+			    ltq_icu_r32(vpe, im, LTQ_ICU_IER) & ~BIT(offset),
+			    LTQ_ICU_IER);
+	}
+	raw_spin_unlock_irqrestore(&ltq_icu_lock, flags);
 }
 
 void ltq_mask_and_ack_irq(struct irq_data *d)
 {
 	unsigned long offset = d->hwirq - MIPS_CPU_IRQ_CASCADE;
 	unsigned long im = offset / INT_NUM_IM_OFFSET;
+	unsigned long flags;
+	int vpe;
 
 	offset %= INT_NUM_IM_OFFSET;
-	ltq_icu_w32(im, ltq_icu_r32(im, LTQ_ICU_IER) & ~BIT(offset),
-		    LTQ_ICU_IER);
-	ltq_icu_w32(im, BIT(offset), LTQ_ICU_ISR);
+
+	raw_spin_lock_irqsave(&ltq_icu_lock, flags);
+	for_each_present_cpu(vpe) {
+		ltq_icu_w32(vpe, im,
+			    ltq_icu_r32(vpe, im, LTQ_ICU_IER) & ~BIT(offset),
+			    LTQ_ICU_IER);
+		ltq_icu_w32(vpe, im, BIT(offset), LTQ_ICU_ISR);
+	}
+	raw_spin_unlock_irqrestore(&ltq_icu_lock, flags);
 }
 
 static void ltq_ack_irq(struct irq_data *d)
 {
 	unsigned long offset = d->hwirq - MIPS_CPU_IRQ_CASCADE;
 	unsigned long im = offset / INT_NUM_IM_OFFSET;
+	unsigned long flags;
+	int vpe;
 
 	offset %= INT_NUM_IM_OFFSET;
-	ltq_icu_w32(im, BIT(offset), LTQ_ICU_ISR);
+
+	raw_spin_lock_irqsave(&ltq_icu_lock, flags);
+	for_each_present_cpu(vpe) {
+		ltq_icu_w32(vpe, im, BIT(offset), LTQ_ICU_ISR);
+	}
+	raw_spin_unlock_irqrestore(&ltq_icu_lock, flags);
 }
 
 void ltq_enable_irq(struct irq_data *d)
 {
 	unsigned long offset = d->hwirq - MIPS_CPU_IRQ_CASCADE;
 	unsigned long im = offset / INT_NUM_IM_OFFSET;
+	unsigned long flags;
+	int vpe;
 
 	offset %= INT_NUM_IM_OFFSET;
-	ltq_icu_w32(im, ltq_icu_r32(im, LTQ_ICU_IER) | BIT(offset),
+
+#if defined(AUTO_AFFINITY_ROTATION)
+	vpe = cpumask_next(smp_processor_id(),
+			   irq_data_get_effective_affinity_mask(d));
+
+	/*
+	 * There is a theoretical race condition if affinity gets changed
+	 * meanwhile, but it would only caused a wrong VPE to be used until
+	 * the next IRQ enable. Also the SoC has only 2 VPEs which fits
+	 * the single u32. You can move spinlock before first mask readout
+	 * and add it to ltq_icu_irq_set_affinity.
+	 */
+
+	if (vpe >= nr_cpu_ids)
+		vpe = cpumask_first(irq_data_get_effective_affinity_mask(d));
+#else
+	vpe = cpumask_first(irq_data_get_effective_affinity_mask(d));
+#endif
+
+	/* This shouldn't be even possible, maybe during CPU hotplug spam */
+	if (unlikely(vpe >= nr_cpu_ids))
+		vpe = smp_processor_id();
+
+	raw_spin_lock_irqsave(&ltq_icu_lock, flags);
+
+	ltq_icu_w32(vpe, im, ltq_icu_r32(vpe, im, LTQ_ICU_IER) | BIT(offset),
 		    LTQ_ICU_IER);
+
+	raw_spin_unlock_irqrestore(&ltq_icu_lock, flags);
 }
 
 static int ltq_eiu_settype(struct irq_data *d, unsigned int type)
 {
 	int i;
+	unsigned long flags;
 
 	for (i = 0; i < exin_avail; i++) {
 		if (d->hwirq == ltq_eiu_irq[i]) {
@@ -148,9 +217,11 @@ static int ltq_eiu_settype(struct irq_data *d, unsigned int type)
 			if (edge)
 				irq_set_handler(d->hwirq, handle_edge_irq);
 
+			spin_lock_irqsave(&ltq_eiu_lock, flags);
 			ltq_eiu_w32((ltq_eiu_r32(LTQ_EIU_EXIN_C) &
 				    (~(7 << (i * 4)))) | (val << (i * 4)),
 				    LTQ_EIU_EXIN_C);
+			spin_unlock_irqrestore(&ltq_eiu_lock, flags);
 		}
 	}
 
@@ -194,6 +265,21 @@ static void ltq_shutdown_eiu_irq(struct irq_data *d)
 	}
 }
 
+#if defined(CONFIG_SMP)
+static int ltq_icu_irq_set_affinity(struct irq_data *d,
+				    const struct cpumask *cpumask, bool force)
+{
+	struct cpumask tmask;
+
+	if (!cpumask_and(&tmask, cpumask, cpu_online_mask))
+		return -EINVAL;
+
+	irq_data_update_effective_affinity(d, &tmask);
+
+	return IRQ_SET_MASK_OK;
+}
+#endif
+
 static struct irq_chip ltq_irq_type = {
 	.name = "icu",
 	.irq_enable = ltq_enable_irq,
@@ -202,6 +288,9 @@ static struct irq_chip ltq_irq_type = {
 	.irq_ack = ltq_ack_irq,
 	.irq_mask = ltq_disable_irq,
 	.irq_mask_ack = ltq_mask_and_ack_irq,
+#if defined(CONFIG_SMP)
+	.irq_set_affinity = ltq_icu_irq_set_affinity,
+#endif
 };
 
 static struct irq_chip ltq_eiu_type = {
@@ -215,6 +304,9 @@ static struct irq_chip ltq_eiu_type = {
 	.irq_mask = ltq_disable_irq,
 	.irq_mask_ack = ltq_mask_and_ack_irq,
 	.irq_set_type = ltq_eiu_settype,
+#if defined(CONFIG_SMP)
+	.irq_set_affinity = ltq_icu_irq_set_affinity,
+#endif
 };
 
 static void ltq_hw_irq_handler(struct irq_desc *desc)
@@ -222,8 +314,9 @@ static void ltq_hw_irq_handler(struct irq_desc *desc)
 	unsigned int module = irq_desc_get_irq(desc) - 2;
 	u32 irq;
 	irq_hw_number_t hwirq;
+	int vpe = smp_processor_id();
 
-	irq = ltq_icu_r32(module, LTQ_ICU_IOSR);
+	irq = ltq_icu_r32(vpe, module, LTQ_ICU_IOSR);
 	if (irq == 0)
 		return;
 
@@ -244,6 +337,7 @@ static void ltq_hw_irq_handler(struct irq_desc *desc)
 static int icu_map(struct irq_domain *d, unsigned int irq, irq_hw_number_t hw)
 {
 	struct irq_chip *chip = &ltq_irq_type;
+	struct irq_data *data;
 	int i;
 
 	if (hw < MIPS_CPU_IRQ_CASCADE)
@@ -253,6 +347,10 @@ static int icu_map(struct irq_domain *d, unsigned int irq, irq_hw_number_t hw)
 		if (hw == ltq_eiu_irq[i])
 			chip = &ltq_eiu_type;
 
+	data = irq_get_irq_data(irq);
+
+	irq_data_update_effective_affinity(data, cpumask_of(0));
+
 	irq_set_chip_and_handler(irq, chip, handle_level_irq);
 
 	return 0;
@@ -267,28 +365,37 @@ int __init icu_of_init(struct device_node *node, struct device_node *parent)
 {
 	struct device_node *eiu_node;
 	struct resource res;
-	int i, ret;
+	int i, ret, vpe;
 
-	for (i = 0; i < MAX_IM; i++) {
-		if (of_address_to_resource(node, i, &res))
-			panic("Failed to get icu memory range");
+	/* load register regions of available ICUs */
+	for_each_possible_cpu(vpe) {
+		if (of_address_to_resource(node, vpe, &res))
+			panic("Failed to get icu%i memory range", vpe);
 
 		if (!request_mem_region(res.start, resource_size(&res),
 					res.name))
-			pr_err("Failed to request icu memory");
+			pr_err("Failed to request icu%i memory\n", vpe);
 
-		ltq_icu_membase[i] = ioremap_nocache(res.start,
+		ltq_icu_membase[vpe] = ioremap_nocache(res.start,
 					resource_size(&res));
-		if (!ltq_icu_membase[i])
-			panic("Failed to remap icu memory");
+
+		if (!ltq_icu_membase[vpe])
+			panic("Failed to remap icu%i memory", vpe);
 	}
 
 	/* turn off all irqs by default */
-	for (i = 0; i < MAX_IM; i++) {
-		/* make sure all irqs are turned off by default */
-		ltq_icu_w32(i, 0, LTQ_ICU_IER);
-		/* clear all possibly pending interrupts */
-		ltq_icu_w32(i, ~0, LTQ_ICU_ISR);
+	for_each_possible_cpu(vpe) {
+		for (i = 0; i < MAX_IM; i++) {
+			/* make sure all irqs are turned off by default */
+			ltq_icu_w32(vpe, i, 0, LTQ_ICU_IER);
+
+			/* clear all possibly pending interrupts */
+			ltq_icu_w32(vpe, i, ~0, LTQ_ICU_ISR);
+			ltq_icu_w32(vpe, i, ~0, LTQ_ICU_IMR);
+
+			/* clear resend */
+			ltq_icu_w32(vpe, i, 0, LTQ_ICU_IRSR);
+		}
 	}
 
 	mips_cpu_irq_init();
-- 
2.21.0

