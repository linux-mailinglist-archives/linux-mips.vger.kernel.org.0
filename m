Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 609F3A4A26
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 17:48:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729167AbfIAPsI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 11:48:08 -0400
Received: from pio-pvt-msa3.bahnhof.se ([79.136.2.42]:41494 "EHLO
        pio-pvt-msa3.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729159AbfIAPsI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 11:48:08 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 502A93F65F
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:48:06 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id swQf4agJgyyI for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 17:48:05 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id AD44F3F615
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:48:05 +0200 (CEST)
Date:   Sun, 1 Sep 2019 17:48:05 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 029/120] MIPS: PS2: DMAC: IRQ support
Message-ID: <ff109142b9ed290001840cea1b6c3b978181deb4.1567326213.git.noring@nocrew.org>
References: <cover.1567326213.git.noring@nocrew.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1567326213.git.noring@nocrew.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 arch/mips/include/asm/mach-ps2/irq.h |   1 +
 arch/mips/ps2/Makefile               |   1 +
 arch/mips/ps2/dmac-irq.c             | 102 +++++++++++++++++++++++++++
 arch/mips/ps2/irq.c                  |   1 +
 4 files changed, 105 insertions(+)
 create mode 100644 arch/mips/ps2/dmac-irq.c

diff --git a/arch/mips/include/asm/mach-ps2/irq.h b/arch/mips/include/asm/mach-ps2/irq.h
index 071c8139dabe..16c96aa7ca09 100644
--- a/arch/mips/include/asm/mach-ps2/irq.h
+++ b/arch/mips/include/asm/mach-ps2/irq.h
@@ -72,5 +72,6 @@
 #define IRQ_C0_IRQ7	55
 
 int __init intc_irq_init(void);
+int __init dmac_irq_init(void);
 
 #endif /* __ASM_MACH_PS2_IRQ_H */
diff --git a/arch/mips/ps2/Makefile b/arch/mips/ps2/Makefile
index ccdfb80c9f03..1e6406f42b3a 100644
--- a/arch/mips/ps2/Makefile
+++ b/arch/mips/ps2/Makefile
@@ -1,3 +1,4 @@
+obj-y		+= dmac-irq.o
 obj-y		+= intc-irq.o
 obj-y		+= irq.o
 obj-y		+= memory.o
diff --git a/arch/mips/ps2/dmac-irq.c b/arch/mips/ps2/dmac-irq.c
new file mode 100644
index 000000000000..8bb75034fd32
--- /dev/null
+++ b/arch/mips/ps2/dmac-irq.c
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PlayStation 2 DMA controller (DMAC) IRQs
+ *
+ * Copyright (C) 2019 Fredrik Noring
+ */
+
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/ioport.h>
+#include <linux/module.h>
+#include <linux/types.h>
+
+#include <asm/io.h>
+#include <asm/irq_cpu.h>
+#include <asm/mipsregs.h>
+
+#include <asm/mach-ps2/dmac.h>
+#include <asm/mach-ps2/irq.h>
+
+static void dmac_reverse_mask(struct irq_data *data)
+{
+	outl(BIT(16 + data->irq - IRQ_DMAC), DMAC_STAT_MASK);
+}
+
+static void dmac_mask_ack(struct irq_data *data)
+{
+	const unsigned int bit = BIT(data->irq - IRQ_DMAC);
+
+	outl((bit << 16) | bit, DMAC_STAT_MASK);
+}
+
+#define DMAC_IRQ_TYPE(irq_, name_)				\
+	{							\
+		.irq = irq_,					\
+		.irq_chip = {					\
+			.name = name_,				\
+			.irq_unmask = dmac_reverse_mask,	\
+			.irq_mask = dmac_reverse_mask,		\
+			.irq_mask_ack = dmac_mask_ack		\
+		}						\
+	}
+
+static struct {
+	unsigned int irq;
+	struct irq_chip irq_chip;
+} dmac_irqs[] = {
+	DMAC_IRQ_TYPE(IRQ_DMAC_VIF0, "DMAC VIF0"),
+	DMAC_IRQ_TYPE(IRQ_DMAC_VIF1, "DMAC VIF1"),
+	DMAC_IRQ_TYPE(IRQ_DMAC_GIF,  "DMAC GIF"),
+	DMAC_IRQ_TYPE(IRQ_DMAC_FIPU, "DMAC fromIPU"),
+	DMAC_IRQ_TYPE(IRQ_DMAC_TIPU, "DMAC toIPU"),
+	DMAC_IRQ_TYPE(IRQ_DMAC_SIF0, "DMAC SIF0"),
+	DMAC_IRQ_TYPE(IRQ_DMAC_SIF1, "DMAC SIF1"),
+	DMAC_IRQ_TYPE(IRQ_DMAC_SIF2, "DMAC SIF2"),
+	DMAC_IRQ_TYPE(IRQ_DMAC_FSPR, "DMAC fromSPR"),
+	DMAC_IRQ_TYPE(IRQ_DMAC_TSPR, "DMAC toSPR"),
+	DMAC_IRQ_TYPE(IRQ_DMAC_S,    "DMAC stall"),
+	DMAC_IRQ_TYPE(IRQ_DMAC_ME,   "DMAC MFIFO empty"),
+	DMAC_IRQ_TYPE(IRQ_DMAC_BE,   "DMAC bus error"),
+};
+
+static irqreturn_t dmac_cascade(int irq, void *data)
+{
+	unsigned int pending = inl(DMAC_STAT_MASK) & 0xffff;
+
+	if (!pending)
+		return IRQ_NONE;
+
+	while (pending) {
+		const unsigned int irq_dmac = __fls(pending);
+
+		if (generic_handle_irq(irq_dmac + IRQ_DMAC) < 0)
+			spurious_interrupt();
+		pending &= ~BIT(irq_dmac);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static struct irqaction cascade_dmac_irqaction = {
+	.name = "DMAC cascade",
+	.handler = dmac_cascade,
+};
+
+int __init dmac_irq_init(void)
+{
+	size_t i;
+	int err;
+
+	outl(inl(DMAC_STAT_MASK), DMAC_STAT_MASK); /* Clear status register */
+
+	for (i = 0; i < ARRAY_SIZE(dmac_irqs); i++)
+		irq_set_chip_and_handler(dmac_irqs[i].irq,
+			&dmac_irqs[i].irq_chip, handle_level_irq);
+
+	err = setup_irq(IRQ_C0_DMAC, &cascade_dmac_irqaction);
+	if (err)
+		pr_err("irq: Failed to setup DMAC IRQs (err = %d)\n", err);
+
+	return err;
+}
diff --git a/arch/mips/ps2/irq.c b/arch/mips/ps2/irq.c
index 935171a1e3bd..7c656e3735a1 100644
--- a/arch/mips/ps2/irq.c
+++ b/arch/mips/ps2/irq.c
@@ -19,6 +19,7 @@ void __init arch_init_irq(void)
 	mips_cpu_irq_init();
 
 	intc_irq_init();
+	dmac_irq_init();
 }
 
 asmlinkage void plat_irq_dispatch(void)
-- 
2.21.0

