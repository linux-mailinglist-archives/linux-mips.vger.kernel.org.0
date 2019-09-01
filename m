Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D825A4A81
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 18:20:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728616AbfIAQUb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 12:20:31 -0400
Received: from pio-pvt-msa3.bahnhof.se ([79.136.2.42]:44494 "EHLO
        pio-pvt-msa3.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728496AbfIAQUb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 12:20:31 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id EF4EB3F660
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:20:29 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id xJ3QFlcRDSFt for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 18:20:29 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 467EB3F58C
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:20:29 +0200 (CEST)
Date:   Sun, 1 Sep 2019 18:20:29 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 082/120] MIPS: PS2: GS: IRQ support
Message-ID: <09484c957252ee213b72c6173f692f7b28a29109.1567326213.git.noring@nocrew.org>
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
 arch/mips/include/asm/mach-ps2/irq.h |  1 +
 drivers/ps2/Makefile                 |  1 +
 drivers/ps2/gs-irq.c                 | 93 ++++++++++++++++++++++++++++
 3 files changed, 95 insertions(+)
 create mode 100644 drivers/ps2/gs-irq.c

diff --git a/arch/mips/include/asm/mach-ps2/irq.h b/arch/mips/include/asm/mach-ps2/irq.h
index 57b3e539ad92..132ad329de6b 100644
--- a/arch/mips/include/asm/mach-ps2/irq.h
+++ b/arch/mips/include/asm/mach-ps2/irq.h
@@ -120,6 +120,7 @@
 
 int __init intc_irq_init(void);
 int __init dmac_irq_init(void);
+int gs_irq_init(void);
 
 /*
  * IRQs asserted by the I/O processor (IOP) via the sub-system interface (SIF).
diff --git a/drivers/ps2/Makefile b/drivers/ps2/Makefile
index 533ab86d6a58..7f108d4ee451 100644
--- a/drivers/ps2/Makefile
+++ b/drivers/ps2/Makefile
@@ -1,3 +1,4 @@
+obj-$(CONFIG_PS2_GS)		+= gs-irq.o
 obj-$(CONFIG_PS2_GS)		+= gs-registers.o
 
 obj-m				+= iop-heap.o
diff --git a/drivers/ps2/gs-irq.c b/drivers/ps2/gs-irq.c
new file mode 100644
index 000000000000..55116a8b5582
--- /dev/null
+++ b/drivers/ps2/gs-irq.c
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PlayStation 2 Graphics Synthesizer (GS) IRQs
+ *
+ * Copyright (C) 2019 Fredrik Noring
+ */
+
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/types.h>
+
+#include <asm/irq_cpu.h>
+
+#include <asm/mach-ps2/irq.h>
+#include <asm/mach-ps2/gs.h>
+#include <asm/mach-ps2/gs-registers.h>
+
+static void gs_reverse_mask(struct irq_data *data)
+{
+	gs_xorq_imr(BIT(8 + data->irq - IRQ_GS));
+}
+
+static void gs_ack(struct irq_data *data)
+{
+	gs_writeq_csr(BIT(data->irq - IRQ_GS));
+}
+
+#define GS_IRQ_TYPE(irq_, name_)			\
+	{						\
+		.irq = irq_,				\
+		.irq_chip = {				\
+			.name = name_,			\
+			.irq_unmask = gs_reverse_mask,	\
+			.irq_mask = gs_reverse_mask,	\
+			.irq_ack = gs_ack		\
+		}					\
+	}
+
+static struct {
+	unsigned int irq;
+	struct irq_chip irq_chip;
+} gs_irqs[] = {
+	GS_IRQ_TYPE(IRQ_GS_SIGNAL,  "GS SIGNAL"),
+	GS_IRQ_TYPE(IRQ_GS_FINISH,  "GS FINISH"),
+	GS_IRQ_TYPE(IRQ_GS_HSYNC,   "GS HSYNC"),
+	GS_IRQ_TYPE(IRQ_GS_VSYNC,   "GS VSYNC"),
+	GS_IRQ_TYPE(IRQ_GS_EDW,     "GS EDW"),
+	GS_IRQ_TYPE(IRQ_GS_EXHSYNC, "GS EXHSYNC"),
+	GS_IRQ_TYPE(IRQ_GS_EXVSYNC, "GS EXVSYNC"),
+};
+
+static irqreturn_t gs_cascade(int irq, void *data)
+{
+	unsigned int pending = gs_readq_csr() & 0x1f;
+
+	if (!pending)
+		return IRQ_NONE;
+
+	while (pending) {
+		const unsigned int irq_gs = __fls(pending);
+
+		if (generic_handle_irq(irq_gs + IRQ_GS) < 0)
+			spurious_interrupt();
+		pending &= ~BIT(irq_gs);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static struct irqaction cascade_gs_irqaction = {
+	.name = "GS cascade",
+	.handler = gs_cascade,
+};
+
+int gs_irq_init(void)
+{
+	size_t i;
+	int err;
+
+	gs_writeq_imr(0x7f00);	/* Disable GS interrupts */
+	gs_writeq_csr(0x00ff);	/* Clear GS events */
+
+	for (i = 0; i < ARRAY_SIZE(gs_irqs); i++)
+		irq_set_chip_and_handler(gs_irqs[i].irq,
+			&gs_irqs[i].irq_chip, handle_level_irq);
+
+	err = setup_irq(IRQ_INTC_GS, &cascade_gs_irqaction);
+	if (err)
+		pr_err("gs-irq: Failed to setup GS IRQs (err = %d)\n", err);
+
+	return err;
+}
-- 
2.21.0

