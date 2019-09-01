Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A991AA4A2B
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 17:48:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725954AbfIAPsY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 11:48:24 -0400
Received: from pio-pvt-msa2.bahnhof.se ([79.136.2.41]:57502 "EHLO
        pio-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729151AbfIAPsY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 11:48:24 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id BC5EF3F9B6
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:48:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id AD1PnPto9xjE for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 17:48:21 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 062113F21C
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:48:20 +0200 (CEST)
Date:   Sun, 1 Sep 2019 17:48:20 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 030/120] MIPS: PS2: Timer support
Message-ID: <dd92b624fe575229937010f66e131fb9744e2da4.1567326213.git.noring@nocrew.org>
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

The Emotion Engine has 4 independent timers with 16-bit counters[1]. The
bus clock or an external (H-BLANK or V-BLANK) clock perform the counting.
When a counter reaches a specified reference value, or when it overflows,
an interrupt is asserted. The timer status register indicates the cause.

Timers 0 and 1 have hold registers for recording the counter value when
an SBUS interrupt occurs.

Timer registers are 32-bit long and only word-accessible.

References:

[1] "EE User's Manual", version 6.0, Sony Computer Entertainment Inc.,
    pp. 33-39.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 arch/mips/ps2/Makefile |   1 +
 arch/mips/ps2/time.c   | 153 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 154 insertions(+)
 create mode 100644 arch/mips/ps2/time.c

diff --git a/arch/mips/ps2/Makefile b/arch/mips/ps2/Makefile
index 1e6406f42b3a..2015870f9fe7 100644
--- a/arch/mips/ps2/Makefile
+++ b/arch/mips/ps2/Makefile
@@ -2,3 +2,4 @@ obj-y		+= dmac-irq.o
 obj-y		+= intc-irq.o
 obj-y		+= irq.o
 obj-y		+= memory.o
+obj-y		+= time.o
diff --git a/arch/mips/ps2/time.c b/arch/mips/ps2/time.c
new file mode 100644
index 000000000000..4979679bc909
--- /dev/null
+++ b/arch/mips/ps2/time.c
@@ -0,0 +1,153 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PlayStation 2 timer functions
+ *
+ * Copyright (C) 2010-2013 Jürgen Urban
+ * Copyright (C) 2017-2019 Fredrik Noring
+ */
+
+#include <linux/errno.h>
+#include <linux/init.h>
+#include <linux/kernel_stat.h>
+#include <linux/sched.h>
+#include <linux/kernel.h>
+#include <linux/param.h>
+#include <linux/string.h>
+#include <linux/mm.h>
+#include <linux/interrupt.h>
+#include <linux/timex.h>
+
+#include <asm/bootinfo.h>
+#include <asm/time.h>
+#include <asm/mipsregs.h>
+#include <asm/io.h>
+#include <asm/irq.h>
+#include <asm/mach-ps2/irq.h>
+
+#define CPU_FREQ		294912000	/* CPU clock frequency (Hz) */
+#define BUS_CLOCK		(CPU_FREQ/2)	/* Bus clock frequency (Hz) */
+#define TM_COMPARE_VALUE	(BUS_CLOCK/256/HZ)  /* To generate HZ event */
+
+/*
+ * The Emotion Engine has four independent timers with 16-bit counters. The
+ * bus clock or an external (H-BLANK or V-BLANK) clock performs the counting.
+ * When a counter reaches a specified reference value, or when it overflows,
+ * an interrupt is asserted. The timer status register indicates the cause.
+ *
+ * Timers 0 and 1 have hold registers for recording the counter value when an
+ * SBUS interrupt occurs.
+ *
+ * Timer registers are 32-bit long and only word-accessible.
+ */
+
+#define T0_COUNT		0x10000000	/* Timer 0 counter value */
+#define T0_MODE			0x10000010	/* Timer 0 mode/status */
+#define T0_COMP			0x10000020	/* Timer 0 compare value */
+#define T0_HOLD			0x10000030	/* Timer 0 hold value */
+
+#define T1_COUNT		0x10000800	/* Timer 1 counter value */
+#define T1_MODE			0x10000810	/* Timer 1 mode/status */
+#define T1_COMP			0x10000820	/* Timer 1 compare value */
+#define T1_HOLD			0x10000830	/* Timer 1 hold value */
+
+#define T2_COUNT		0x10001000	/* Timer 2 counter value */
+#define T2_MODE			0x10001010	/* Timer 2 mode/status */
+#define T2_COMP			0x10001020	/* Timer 2 compare value */
+
+#define T3_COUNT		0x10001800	/* Timer 3 counter value */
+#define T3_MODE			0x10001810	/* Timer 3 mode/status */
+#define T3_COMP			0x10001820	/* Timer 3 compare value */
+
+#define TM_MODE_CLKS_BUSCLK	(0 << 0) /* BUSCLK (147.456 MHz) */
+#define TM_MODE_CLKS_BUSCLK_16	(1 << 0) /* 1/16 of BUSCLK */
+#define TM_MODE_CLKS_BUSCLK_256	(2 << 0) /* 1/256 of BUSCLK */
+#define TM_MODE_CLKS_EXTERNAL	(3 << 0) /* External clock (V-BLANK) */
+#define TM_MODE_GATE_DISABLE	(0 << 2) /* Gate function is not used */
+#define TM_MODE_GATE_ENABLE	(1 << 2) /* Gate function is used */
+#define TM_MODE_GATS_H_BLANK	(0 << 3) /* H-BLANK (disabled if CLKS is 3) */
+#define TM_MODE_GATS_V_BLANK	(1 << 3) /* V-BLANK */
+#define TM_MODE_GATM_WHILE_LOW	(0 << 4) /* Count while gate signal is low */
+#define TM_MODE_GATM_RESET_RISE	(1 << 4) /* Reset and start on rising edge */
+#define TM_MODE_GATM_RESET_FALL	(2 << 4) /* Reset and start on falling edge */
+#define TM_MODE_GATM_RESET_BOTH	(3 << 4) /* Reset and start on both edges */
+#define TM_MODE_ZRET_KEEP	(0 << 6) /* Keep counting ignoring reference */
+#define TM_MODE_ZRET_CLEAR	(1 << 6) /* Zero counter reaching reference */
+#define TM_MODE_CUE_STOP	(0 << 7) /* Stop counting */
+#define TM_MODE_CUE_START	(1 << 7) /* Start counting */
+#define TM_MODE_CMPE_DISABLE	(0 << 8) /* Disable compare interrupts */
+#define TM_MODE_CMPE_ENABLE	(1 << 8) /* Interrupt reaching reference */
+#define TM_MODE_OVFE_DISABLE	(0 << 9) /* Disable overflow interrupts */
+#define TM_MODE_OVFE_ENABLE	(1 << 9) /* Interrupt on overflow */
+
+/*
+ * The equal status flag bit is 1 when a compare-interrupt
+ * has occured. Write 1 to clear.
+ */
+#define TM_MODE_EQUAL_FLAG	(1 << 10)
+
+/*
+ * The overflow status flag bit is 1 when an overflow-interrupt
+ * has occured. Write 1 to clear.
+ */
+#define TM_MODE_OVERFLOW_FLAG	(1 << 11)
+
+static irqreturn_t ps2_timer_interrupt(int irq, void *dev_id)
+{
+	struct clock_event_device *cd = dev_id;
+
+	outl(inl(T0_MODE), T0_MODE); /* Clear the interrupt */
+
+	cd->event_handler(cd);
+
+	return IRQ_HANDLED;
+}
+
+static int timer0_periodic(struct clock_event_device *evt)
+{
+	outl(0, T0_COUNT);
+	outl(TM_COMPARE_VALUE, T0_COMP);
+	outl(TM_MODE_CLKS_BUSCLK_256 | TM_MODE_ZRET_CLEAR | TM_MODE_CUE_START |
+		TM_MODE_CMPE_ENABLE | TM_MODE_EQUAL_FLAG, T0_MODE);
+
+	return 0;
+}
+
+static int timer0_shutdown(struct clock_event_device *evt)
+{
+	outl(0, T0_MODE); /* Stop timer */
+
+	return 0;
+}
+
+static struct irqaction timer0_irqaction = {
+	.handler	= ps2_timer_interrupt,
+	.flags		= IRQF_PERCPU | IRQF_TIMER,
+	.name		= "intc-timer0",
+};
+
+static struct clock_event_device timer0_clockevent_device = {
+	.name		= "timer0",
+	/* FIXME: Timer is also able to provide CLOCK_EVT_FEAT_ONESHOT. */
+	.features	= CLOCK_EVT_FEAT_PERIODIC,
+
+	/* FIXME: .mult, .shift, .max_delta_ns and .min_delta_ns left uninitialized */
+
+	.rating		= 300, /* FIXME: Check value. */
+	.irq		= IRQ_INTC_TIMER0,
+	.set_state_periodic	= timer0_periodic,
+	.set_state_shutdown	= timer0_shutdown,
+};
+
+void __init plat_time_init(void)
+{
+	/* Add timer 0 as clock event source. */
+	timer0_clockevent_device.cpumask = cpumask_of(smp_processor_id());
+	clockevents_register_device(&timer0_clockevent_device);
+	timer0_irqaction.dev_id = &timer0_clockevent_device;
+	setup_irq(IRQ_INTC_TIMER0, &timer0_irqaction);
+
+	/* FIXME: Timer 1 is free and can also be configured as clock event source. */
+
+	/* Setup frequency for IP7 timer interrupt. */
+	mips_hpt_frequency = CPU_FREQ;
+}
-- 
2.21.0

