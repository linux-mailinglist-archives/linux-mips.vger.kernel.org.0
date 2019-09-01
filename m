Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EE7AA4A22
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 17:47:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729173AbfIAPr1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 11:47:27 -0400
Received: from pio-pvt-msa2.bahnhof.se ([79.136.2.41]:57456 "EHLO
        pio-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729159AbfIAPr1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 11:47:27 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 3513340484
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:47:25 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id YLwueEjwB2Ts for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 17:47:24 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 5CF484047D
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:47:24 +0200 (CEST)
Date:   Sun, 1 Sep 2019 17:47:24 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 026/120] MIPS: PS2: Interrupt controller (INTC) IRQ support
Message-ID: <4396db79b04c1eb3e24e051d1a406d25506875a3.1567326213.git.noring@nocrew.org>
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
I'm not sure edges or HARDIRQS_SW_RESEND etc. are needed.
---
 arch/mips/include/asm/mach-ps2/irq.h |   2 +
 arch/mips/ps2/Makefile               |   1 +
 arch/mips/ps2/intc-irq.c             | 112 +++++++++++++++++++++++++++
 arch/mips/ps2/irq.c                  |   2 +
 4 files changed, 117 insertions(+)
 create mode 100644 arch/mips/ps2/intc-irq.c

diff --git a/arch/mips/include/asm/mach-ps2/irq.h b/arch/mips/include/asm/mach-ps2/irq.h
index d6f72a7e37a3..071c8139dabe 100644
--- a/arch/mips/include/asm/mach-ps2/irq.h
+++ b/arch/mips/include/asm/mach-ps2/irq.h
@@ -71,4 +71,6 @@
 #define IRQ_C0_DMAC	51
 #define IRQ_C0_IRQ7	55
 
+int __init intc_irq_init(void);
+
 #endif /* __ASM_MACH_PS2_IRQ_H */
diff --git a/arch/mips/ps2/Makefile b/arch/mips/ps2/Makefile
index d5d089c61381..ccdfb80c9f03 100644
--- a/arch/mips/ps2/Makefile
+++ b/arch/mips/ps2/Makefile
@@ -1,2 +1,3 @@
+obj-y		+= intc-irq.o
 obj-y		+= irq.o
 obj-y		+= memory.o
diff --git a/arch/mips/ps2/intc-irq.c b/arch/mips/ps2/intc-irq.c
new file mode 100644
index 000000000000..36cdc3dd31ca
--- /dev/null
+++ b/arch/mips/ps2/intc-irq.c
@@ -0,0 +1,112 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PlayStation 2 Interrupt controller (INTC) IRQs
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
+#include <asm/mach-ps2/irq.h>
+
+static void intc_reverse_mask(struct irq_data *data)
+{
+	outl(BIT(data->irq - IRQ_INTC), INTC_MASK);
+}
+
+static void intc_mask_ack(struct irq_data *data)
+{
+	const unsigned int bit = BIT(data->irq - IRQ_INTC);
+
+	outl(bit, INTC_MASK);
+	outl(bit, INTC_STAT);
+}
+
+#define INTC_IRQ_TYPE(irq_, name_)				\
+	{							\
+		.irq = irq_,					\
+		.irq_chip = {					\
+			.name = name_,				\
+			.irq_unmask = intc_reverse_mask,	\
+			.irq_mask = intc_reverse_mask,		\
+			.irq_mask_ack = intc_mask_ack,		\
+		}						\
+	}
+
+static struct {
+	unsigned int irq;
+	struct irq_chip irq_chip;
+} intc_irqs[] = {
+	INTC_IRQ_TYPE(IRQ_INTC_GS,     "INTC GS"),
+	INTC_IRQ_TYPE(IRQ_INTC_SBUS,   "INTC SBUS"),
+	INTC_IRQ_TYPE(IRQ_INTC_VB_ON,  "INTC VB on"),
+	INTC_IRQ_TYPE(IRQ_INTC_VB_OFF, "INTC VB off"),
+	INTC_IRQ_TYPE(IRQ_INTC_VIF0,   "INTC VIF0"),
+	INTC_IRQ_TYPE(IRQ_INTC_VIF1,   "INTC VIF1"),
+	INTC_IRQ_TYPE(IRQ_INTC_VU0,    "INTC VU0"),
+	INTC_IRQ_TYPE(IRQ_INTC_VU1,    "INTC VU1"),
+	INTC_IRQ_TYPE(IRQ_INTC_IPU,    "INTC IPU"),
+	INTC_IRQ_TYPE(IRQ_INTC_TIMER0, "INTC timer0"),
+	INTC_IRQ_TYPE(IRQ_INTC_TIMER1, "INTC timer1"),
+	INTC_IRQ_TYPE(IRQ_INTC_TIMER2, "INTC timer2"),
+	INTC_IRQ_TYPE(IRQ_INTC_TIMER3, "INTC timer3"),
+	INTC_IRQ_TYPE(IRQ_INTC_SFIFO,  "INTC SFIFO"),
+	INTC_IRQ_TYPE(IRQ_INTC_VU0WD,  "INTC VU0WD"),
+	INTC_IRQ_TYPE(IRQ_INTC_PGPU,   "INTC PGPU"),
+};
+
+static irqreturn_t intc_cascade(int irq, void *data)
+{
+	unsigned int pending, irq_intc;
+	irqreturn_t status = IRQ_NONE;
+
+	for (pending = inl(INTC_STAT); pending; pending &= ~BIT(irq_intc)) {
+		irq_intc = __fls(pending);
+
+		if (generic_handle_irq(irq_intc + IRQ_INTC) < 0)
+			spurious_interrupt();
+		else
+			status = IRQ_HANDLED;
+	}
+
+	return status;
+}
+
+static struct irqaction cascade_intc_irqaction = {
+	.name = "INTC cascade",
+	.handler = intc_cascade,
+};
+
+int __init intc_irq_init(void)
+{
+	size_t i;
+	int err;
+
+	/* Clear mask and status registers */
+	outl(inl(INTC_MASK), INTC_MASK);
+	outl(inl(INTC_STAT), INTC_STAT);
+
+	for (i = 0; i < ARRAY_SIZE(intc_irqs); i++)
+		irq_set_chip_and_handler(intc_irqs[i].irq,
+			&intc_irqs[i].irq_chip, handle_level_irq);
+
+	/* FIXME: Is HARDIRQS_SW_RESEND needed? Are these edge types needed? */
+	irq_set_irq_type(IRQ_INTC_GS, IRQ_TYPE_EDGE_FALLING);
+	irq_set_irq_type(IRQ_INTC_SBUS, IRQ_TYPE_EDGE_FALLING);
+	irq_set_irq_type(IRQ_INTC_VB_ON, IRQ_TYPE_EDGE_RISING);
+	irq_set_irq_type(IRQ_INTC_VB_OFF, IRQ_TYPE_EDGE_FALLING);
+
+	err = setup_irq(IRQ_C0_INTC, &cascade_intc_irqaction);
+	if (err)
+		pr_err("irq: Failed to setup INTC IRQs (err = %d)\n", err);
+
+	return err;
+}
diff --git a/arch/mips/ps2/irq.c b/arch/mips/ps2/irq.c
index 09047e128ce8..935171a1e3bd 100644
--- a/arch/mips/ps2/irq.c
+++ b/arch/mips/ps2/irq.c
@@ -17,6 +17,8 @@
 void __init arch_init_irq(void)
 {
 	mips_cpu_irq_init();
+
+	intc_irq_init();
 }
 
 asmlinkage void plat_irq_dispatch(void)
-- 
2.21.0

