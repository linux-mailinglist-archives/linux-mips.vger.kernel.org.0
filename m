Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F2E6A4A1F
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 17:47:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729160AbfIAPrO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 11:47:14 -0400
Received: from pio-pvt-msa2.bahnhof.se ([79.136.2.41]:57400 "EHLO
        pio-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729152AbfIAPrO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 11:47:14 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id E492040484
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:47:12 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 4swwCxfaarwX for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 17:47:12 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 39BCF4047D
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:47:12 +0200 (CEST)
Date:   Sun, 1 Sep 2019 17:47:12 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 025/120] MIPS: PS2: Define interrupt controller, DMA and
 timer IRQs
Message-ID: <fd7822b56457a19315dcaa7eb396ddf5fe7946c0.1567326213.git.noring@nocrew.org>
References: <cover.1567326213.git.noring@nocrew.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1567326213.git.noring@nocrew.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The interrupt controller (INTC) arbitrates 15 interrupt requests from
multiple processors and asserts INT0[1].

The DMA controller (DMAC) asserts INT1[2].

References:

[1] "EE User's Manual", version 6.0, Sony Computer Entertainment Inc.,
    pp. 27-31.

[2] Ibid. p. 55.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 arch/mips/include/asm/mach-ps2/irq.h | 74 ++++++++++++++++++++++++++++
 arch/mips/ps2/Makefile               |  1 +
 arch/mips/ps2/irq.c                  | 35 +++++++++++++
 3 files changed, 110 insertions(+)
 create mode 100644 arch/mips/include/asm/mach-ps2/irq.h
 create mode 100644 arch/mips/ps2/irq.c

diff --git a/arch/mips/include/asm/mach-ps2/irq.h b/arch/mips/include/asm/mach-ps2/irq.h
new file mode 100644
index 000000000000..d6f72a7e37a3
--- /dev/null
+++ b/arch/mips/include/asm/mach-ps2/irq.h
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PlayStation 2 IRQs
+ *
+ * Copyright (C) 2000-2002 Sony Computer Entertainment Inc.
+ * Copyright (C) 2010-2013 Jürgen Urban
+ * Copyright (C)      2019 Fredrik Noring
+ */
+
+#ifndef __ASM_MACH_PS2_IRQ_H
+#define __ASM_MACH_PS2_IRQ_H
+
+#define INTC_STAT	0x1000f000	/* Flags are cleared by writing 1 */
+#define INTC_MASK	0x1000f010	/* Bits are reversed by writing 1 */
+
+#define NR_IRQS		56
+
+/*
+ * The interrupt controller (INTC) arbitrates interrupts from peripheral
+ * devices, except for the DMAC.
+ */
+#define IRQ_INTC	0
+#define IRQ_INTC_GS	0	/* Graphics Synthesizer */
+#define IRQ_INTC_SBUS	1	/* Bus connecting the Emotion Engine to the
+				   I/O processor (IOP) via the sub-system
+				   interface (SIF) */
+#define IRQ_INTC_VB_ON	2	/* Vertical blank start */
+#define IRQ_INTC_VB_OFF	3	/* Vertical blank end */
+#define IRQ_INTC_VIF0	4	/* VPU0 interface packet expansion engine */
+#define IRQ_INTC_VIF1	5	/* VPU1 interface packet expansion engine */
+#define IRQ_INTC_VU0	6	/* Vector core operation unit 0 */
+#define IRQ_INTC_VU1	7	/* Vector core operation unit 1 */
+#define IRQ_INTC_IPU	8	/* Image processor unit (MPEG 2 video etc.) */
+#define IRQ_INTC_TIMER0	9	/* Independent screen timer 0 */
+#define IRQ_INTC_TIMER1	10	/* Independent screen timer 1 */
+#define IRQ_INTC_TIMER2	11	/* Independent screen timer 2 */
+#define IRQ_INTC_TIMER3	12	/* Independent screen timer 3 */
+#define IRQ_INTC_SFIFO	13	/* Error detected during SFIFO transfers */
+#define IRQ_INTC_VU0WD	14	/* VU0 watch dog for RUN (sends force break) */
+#define IRQ_INTC_PGPU	15
+
+/* DMA controller */
+#define IRQ_DMAC	16
+#define IRQ_DMAC_VIF0	16	/* Ch0 VPU0 interface (VIF0) */
+#define IRQ_DMAC_VIF1	17	/* Ch1 VPU1 interface (VIF1) */
+#define IRQ_DMAC_GIF	18	/* Ch2 Graphics Synthesizer interface (GIF) */
+#define IRQ_DMAC_FIPU	19	/* Ch3 from image processor unit (IPU) */
+#define IRQ_DMAC_TIPU	20	/* Ch4 to image processor unit (IPU) */
+#define IRQ_DMAC_SIF0	21	/* Ch5 sub-system interface 0 (SIF0) */
+#define IRQ_DMAC_SIF1	22	/* Ch6 sub-system interface 1 (SIF1) */
+#define IRQ_DMAC_SIF2	23	/* Ch7 Sub-system interface 2 (SIF2) */
+#define IRQ_DMAC_FSPR	24	/* Ch8 from scratch-pad RAM (SPR) */
+#define IRQ_DMAC_TSPR	25	/* Ch9 to scratch-pad RAM (SPR) */
+#define IRQ_DMAC_S	29	/* DMA stall */
+#define IRQ_DMAC_ME	30	/* MFIFO empty */
+#define IRQ_DMAC_BE	31	/* Bus error */
+
+/* Graphics Synthesizer */
+#define IRQ_GS		32
+#define IRQ_GS_SIGNAL	32	/* GS signal event control */
+#define IRQ_GS_FINISH	33	/* GS finish event control */
+#define IRQ_GS_HSYNC	34	/* GS horizontal synch interrupt control */
+#define IRQ_GS_VSYNC	35	/* GS vertical synch interrupt control */
+#define IRQ_GS_EDW	36	/* GS rectangular area write termination */
+#define IRQ_GS_EXHSYNC	37
+#define IRQ_GS_EXVSYNC	38
+
+/* MIPS IRQs */
+#define MIPS_CPU_IRQ_BASE 48
+#define IRQ_C0_INTC	50
+#define IRQ_C0_DMAC	51
+#define IRQ_C0_IRQ7	55
+
+#endif /* __ASM_MACH_PS2_IRQ_H */
diff --git a/arch/mips/ps2/Makefile b/arch/mips/ps2/Makefile
index 24d537d2fb9f..d5d089c61381 100644
--- a/arch/mips/ps2/Makefile
+++ b/arch/mips/ps2/Makefile
@@ -1 +1,2 @@
+obj-y		+= irq.o
 obj-y		+= memory.o
diff --git a/arch/mips/ps2/irq.c b/arch/mips/ps2/irq.c
new file mode 100644
index 000000000000..09047e128ce8
--- /dev/null
+++ b/arch/mips/ps2/irq.c
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PlayStation 2 IRQs
+ *
+ * Copyright (C) 2019 Fredrik Noring
+ */
+
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/types.h>
+
+#include <asm/irq_cpu.h>
+#include <asm/mipsregs.h>
+
+#include <asm/mach-ps2/irq.h>
+
+void __init arch_init_irq(void)
+{
+	mips_cpu_irq_init();
+}
+
+asmlinkage void plat_irq_dispatch(void)
+{
+	const unsigned int pending = read_c0_status() & read_c0_cause();
+
+	if (!(pending & (CAUSEF_IP2 | CAUSEF_IP3 | CAUSEF_IP7)))
+		return spurious_interrupt();
+
+	if (pending & CAUSEF_IP2)
+		do_IRQ(IRQ_C0_INTC);	/* INTC interrupt */
+	if (pending & CAUSEF_IP3)
+		do_IRQ(IRQ_C0_DMAC);	/* DMAC interrupt */
+	if (pending & CAUSEF_IP7)
+		do_IRQ(IRQ_C0_IRQ7);	/* Timer interrupt */
+}
-- 
2.21.0

