Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 464D04DCD6
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2019 23:39:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726192AbfFTVjd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 20 Jun 2019 17:39:33 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:38030 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726190AbfFTVjc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 20 Jun 2019 17:39:32 -0400
Received: by mail-wm1-f66.google.com with SMTP id s15so4543381wmj.3
        for <linux-mips@vger.kernel.org>; Thu, 20 Jun 2019 14:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dozCcXmpw1UY9jDcU/XY3MvBANFja3vOP+h5t7mgFkw=;
        b=X8EQ3mCETPx+8ZyddlVvEwf5HgKHBXzuxmT9l9CrSl3vGc4eEU8SXF1VPqsOFDEPAp
         LN16LD4tPCaqkPmI61gEY61R5vJ9KZP+iAnX6+WBOJ6n4dfBuo2rKeo0Up1IwLIFGAKG
         aDgWdo0oKS0xi8hPwDHq5vqsHma4KiAmhGJYS+OfAGuSbsKlfUBA6bADcozNaWtuMqfG
         Gybn+6oxG8NUTe/CKzFoRPnh2QryvmgDxcytSbN3J+xlhuthOEmKqkIaBsvpE8jLttOM
         tZSpdPBjIHffo+D6UFNDYG41xYs3jZBxA/g2xBUZWfkgUGGrViFrMu5LGpNv3JihjwMr
         hWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dozCcXmpw1UY9jDcU/XY3MvBANFja3vOP+h5t7mgFkw=;
        b=qOgcA7rA4i8og8WQsSZM9oFNQFhQlUHaEVUZWKymofWTTQJ4bSsVEfHN3PHV+nMfNj
         PZxqoxkx6Tew3t9xHucPqvAWJSzSXBl1Sr7e32cXHZH6SDrclw1/TXUWwIiwWpRGkeYB
         ll6A4+NoWormXEOxhm095MUMNPOXMc7KTiLEzWKAxR3ezjKMXsaLlQdPuOzbQHbqwzM7
         P4Bk7e4ce6lG10izZ4bplAX+Zod/kcF/oL0TwUtgl1Sq9uM+Uunkuukcc05ZMcweJ4L4
         +M6RgYsq5ymW7HQvik0Dae8H0EzY3U5e0bJ0v4db5k+jlmquf8c/QakoR7GeyIQFbtzm
         kLjA==
X-Gm-Message-State: APjAAAUTOXsxIf7FdLk0BCVO9WdGhXJy7m0BfK3dCt4L7sqD5DGCZ/u2
        hHuy8S+8QN4pFeZI3TzV4tgsCAeQ
X-Google-Smtp-Source: APXvYqwx9fcdlbmZJaLTy2tS4ObS5plaC6+s+iwBcjW1ymabafrmUcgzpoiaEmtgH4a5gHXoD1lXiA==
X-Received: by 2002:a1c:a654:: with SMTP id p81mr941823wme.36.1561066769680;
        Thu, 20 Jun 2019 14:39:29 -0700 (PDT)
Received: from kontron.lan (2001-1ae9-0ff1-f191-ecaa-d74f-d492-3738.ip6.tmcz.cz. [2001:1ae9:ff1:f191:ecaa:d74f:d492:3738])
        by smtp.gmail.com with ESMTPSA id j4sm575426wrx.57.2019.06.20.14.39.28
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 20 Jun 2019 14:39:29 -0700 (PDT)
From:   petrcvekcz@gmail.com
X-Google-Original-From: petrcvekcz.gmail.com
To:     hauke@hauke-m.de, john@phrozen.org
Cc:     Petr Cvek <petrcvekcz@gmail.com>, linux-mips@vger.kernel.org,
        openwrt-devel@lists.openwrt.org, pakahmar@hotmail.com
Subject: [PATCH v2 7/7] MIPS: lantiq: Add SMP support for lantiq interrupt controller
Date:   Thu, 20 Jun 2019 23:39:39 +0200
Message-Id: <e520b867ef328c21c144847f3658fcb1ab186706.1561065843.git.petrcvekcz@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1561065843.git.petrcvekcz@gmail.com>
References: <cover.1561065843.git.petrcvekcz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Petr Cvek <petrcvekcz@gmail.com>

Some lantiq devices have two ICU controllers. The IRQ signal is routed
to both of them and user can chose which ICU will resend the IRQ to their
respective VPE. The patch adds the support for the second ICU.

The patch changes a register definition of the driver. Instead of an
individual IM, the whole ICU is defined. This will only affects openwrt
patched kernel (vanilla doesn't have additional .dts files).

Also spinlocks has been added, both cores can RMW different bitfields
in the same register. Added affinity set function. The new VPE cpumask
will take into the action at the irq enable.

The functionality was tested on 4.14 openwrt kernel and TP-W9980B modem.

Signed-off-by: Petr Cvek <petrcvekcz@gmail.com>
---
 arch/mips/lantiq/irq.c | 130 +++++++++++++++++++++++++++++++++--------
 1 file changed, 106 insertions(+), 24 deletions(-)

diff --git a/arch/mips/lantiq/irq.c b/arch/mips/lantiq/irq.c
index b9ca20ff07d5..b61d33ff685b 100644
--- a/arch/mips/lantiq/irq.c
+++ b/arch/mips/lantiq/irq.c
@@ -28,6 +28,8 @@
 #define LTQ_ICU_IRSR		0x0018
 #define LTQ_ICU_IMR		0x0020
 
+#define LTQ_ICU_IM_SIZE		0x28
+
 /* register definitions - external irqs */
 #define LTQ_EIU_EXIN_C		0x0000
 #define LTQ_EIU_EXIN_INIC	0x0004
@@ -46,8 +48,11 @@
  */
 #define LTQ_ICU_EBU_IRQ		22
 
-#define ltq_icu_w32(m, x, y)	ltq_w32((x), ltq_icu_membase[m] + (y))
-#define ltq_icu_r32(m, x)	ltq_r32(ltq_icu_membase[m] + (x))
+#define ltq_icu_w32(vpe, m, x, y)	\
+	ltq_w32((x), ltq_icu_membase[vpe] + m*LTQ_ICU_IM_SIZE + (y))
+
+#define ltq_icu_r32(vpe, m, x)		\
+	ltq_r32(ltq_icu_membase[vpe] + m*LTQ_ICU_IM_SIZE + (x))
 
 #define ltq_eiu_w32(x, y)	ltq_w32((x), ltq_eiu_membase + (y))
 #define ltq_eiu_r32(x)		ltq_r32(ltq_eiu_membase + (x))
@@ -57,9 +62,11 @@
 
 static int exin_avail;
 static u32 ltq_eiu_irq[MAX_EIU];
-static void __iomem *ltq_icu_membase[MAX_IM];
+static void __iomem *ltq_icu_membase[NR_CPUS];
 static void __iomem *ltq_eiu_membase;
 static struct irq_domain *ltq_domain;
+static DEFINE_SPINLOCK(ltq_eiu_lock);
+static DEFINE_RAW_SPINLOCK(ltq_icu_lock);
 static int ltq_perfcount_irq;
 
 int ltq_eiu_get_irq(int exin)
@@ -73,45 +80,82 @@ void ltq_disable_irq(struct irq_data *d)
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
+	vpe = cpumask_first(irq_data_get_effective_affinity_mask(d));
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
@@ -148,9 +192,11 @@ static int ltq_eiu_settype(struct irq_data *d, unsigned int type)
 			if (edge)
 				irq_set_handler(d->hwirq, handle_edge_irq);
 
+			spin_lock_irqsave(&ltq_eiu_lock, flags);
 			ltq_eiu_w32((ltq_eiu_r32(LTQ_EIU_EXIN_C) &
 				    (~(7 << (i * 4)))) | (val << (i * 4)),
 				    LTQ_EIU_EXIN_C);
+			spin_unlock_irqrestore(&ltq_eiu_lock, flags);
 		}
 	}
 
@@ -194,6 +240,21 @@ static void ltq_shutdown_eiu_irq(struct irq_data *d)
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
@@ -202,6 +263,9 @@ static struct irq_chip ltq_irq_type = {
 	.irq_ack = ltq_ack_irq,
 	.irq_mask = ltq_disable_irq,
 	.irq_mask_ack = ltq_mask_and_ack_irq,
+#if defined(CONFIG_SMP)
+	.irq_set_affinity = ltq_icu_irq_set_affinity,
+#endif
 };
 
 static struct irq_chip ltq_eiu_type = {
@@ -215,6 +279,9 @@ static struct irq_chip ltq_eiu_type = {
 	.irq_mask = ltq_disable_irq,
 	.irq_mask_ack = ltq_mask_and_ack_irq,
 	.irq_set_type = ltq_eiu_settype,
+#if defined(CONFIG_SMP)
+	.irq_set_affinity = ltq_icu_irq_set_affinity,
+#endif
 };
 
 static void ltq_hw_irq_handler(struct irq_desc *desc)
@@ -222,8 +289,9 @@ static void ltq_hw_irq_handler(struct irq_desc *desc)
 	unsigned int module = irq_desc_get_irq(desc) - 2;
 	u32 irq;
 	irq_hw_number_t hwirq;
+	int vpe = smp_processor_id();
 
-	irq = ltq_icu_r32(module, LTQ_ICU_IOSR);
+	irq = ltq_icu_r32(vpe, module, LTQ_ICU_IOSR);
 	if (irq == 0)
 		return;
 
@@ -244,6 +312,7 @@ static void ltq_hw_irq_handler(struct irq_desc *desc)
 static int icu_map(struct irq_domain *d, unsigned int irq, irq_hw_number_t hw)
 {
 	struct irq_chip *chip = &ltq_irq_type;
+	struct irq_data *data;
 	int i;
 
 	if (hw < MIPS_CPU_IRQ_CASCADE)
@@ -253,6 +322,10 @@ static int icu_map(struct irq_domain *d, unsigned int irq, irq_hw_number_t hw)
 		if (hw == ltq_eiu_irq[i])
 			chip = &ltq_eiu_type;
 
+	data = irq_get_irq_data(irq);
+
+	irq_data_update_effective_affinity(data, cpumask_of(0));
+
 	irq_set_chip_and_handler(irq, chip, handle_level_irq);
 
 	return 0;
@@ -267,28 +340,37 @@ int __init icu_of_init(struct device_node *node, struct device_node *parent)
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

