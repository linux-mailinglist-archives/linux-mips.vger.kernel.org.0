Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9ADA2717FA
	for <lists+linux-mips@lfdr.de>; Sun, 20 Sep 2020 22:51:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726332AbgITUv5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 20 Sep 2020 16:51:57 -0400
Received: from mx2.suse.de ([195.135.220.15]:39326 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726126AbgITUv5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 20 Sep 2020 16:51:57 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id C9CABAC12;
        Sun, 20 Sep 2020 20:52:29 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: SGI-IP30: Move irq bits to better header files
Date:   Sun, 20 Sep 2020 22:51:50 +0200
Message-Id: <20200920205151.112113-1-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.16.4
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Move HEART specific parts of mach-ip30/irq.h to asm/sgi/heart.h and IP30
specific parts to sgi-ip30/ip30-common.h.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/include/asm/mach-ip30/irq.h | 87 -----------------------------------
 arch/mips/include/asm/sgi/heart.h     | 51 ++++++++++++++++++++
 arch/mips/sgi-ip30/ip30-common.h      | 14 ++++++
 arch/mips/sgi-ip30/ip30-irq.c         |  2 +
 4 files changed, 67 insertions(+), 87 deletions(-)
 delete mode 100644 arch/mips/include/asm/mach-ip30/irq.h

diff --git a/arch/mips/include/asm/mach-ip30/irq.h b/arch/mips/include/asm/mach-ip30/irq.h
deleted file mode 100644
index 27ba899c95be..000000000000
--- a/arch/mips/include/asm/mach-ip30/irq.h
+++ /dev/null
@@ -1,87 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * HEART IRQ defines
- *
- * Copyright (C) 2009 Johannes Dickgreber <tanzy@gmx.de>
- *		 2014-2016 Joshua Kinard <kumba@gentoo.org>
- *
- */
-
-#ifndef __ASM_MACH_IP30_IRQ_H
-#define __ASM_MACH_IP30_IRQ_H
-
-/*
- * HEART has 64 hardware interrupts, but use 128 to leave room for a few
- * software interrupts as well (such as the CPU timer interrupt.
- */
-#define NR_IRQS				128
-
-extern void __init ip30_install_ipi(void);
-
-/*
- * HEART has 64 interrupt vectors available to it, subdivided into five
- * priority levels.  They are numbered 0 to 63.
- */
-#define HEART_NUM_IRQS			64
-
-/*
- * These are the five interrupt priority levels and their corresponding
- * CPU IPx interrupt pins.
- *
- * Level 4 - Error Interrupts.
- * Level 3 - HEART timer interrupt.
- * Level 2 - CPU IPI, CPU debug, power putton, general device interrupts.
- * Level 1 - General device interrupts.
- * Level 0 - General device GFX flow control interrupts.
- */
-#define HEART_L4_INT_MASK		0xfff8000000000000ULL	/* IP6 */
-#define HEART_L3_INT_MASK		0x0004000000000000ULL	/* IP5 */
-#define HEART_L2_INT_MASK		0x0003ffff00000000ULL	/* IP4 */
-#define HEART_L1_INT_MASK		0x00000000ffff0000ULL	/* IP3 */
-#define HEART_L0_INT_MASK		0x000000000000ffffULL	/* IP2 */
-
-/* HEART L0 Interrupts (Low Priority) */
-#define HEART_L0_INT_GENERIC		 0
-#define HEART_L0_INT_FLOW_CTRL_HWTR_0	 1
-#define HEART_L0_INT_FLOW_CTRL_HWTR_1	 2
-
-/* HEART L2 Interrupts (High Priority) */
-#define HEART_L2_INT_RESCHED_CPU_0	46
-#define HEART_L2_INT_RESCHED_CPU_1	47
-#define HEART_L2_INT_CALL_CPU_0		48
-#define HEART_L2_INT_CALL_CPU_1		49
-
-/* HEART L3 Interrupts (Compare/Counter Timer) */
-#define HEART_L3_INT_TIMER		50
-
-/* HEART L4 Interrupts (Errors) */
-#define HEART_L4_INT_XWID_ERR_9		51
-#define HEART_L4_INT_XWID_ERR_A		52
-#define HEART_L4_INT_XWID_ERR_B		53
-#define HEART_L4_INT_XWID_ERR_C		54
-#define HEART_L4_INT_XWID_ERR_D		55
-#define HEART_L4_INT_XWID_ERR_E		56
-#define HEART_L4_INT_XWID_ERR_F		57
-#define HEART_L4_INT_XWID_ERR_XBOW	58
-#define HEART_L4_INT_CPU_BUS_ERR_0	59
-#define HEART_L4_INT_CPU_BUS_ERR_1	60
-#define HEART_L4_INT_CPU_BUS_ERR_2	61
-#define HEART_L4_INT_CPU_BUS_ERR_3	62
-#define HEART_L4_INT_HEART_EXCP		63
-
-/*
- * Power Switch is wired via BaseIO BRIDGE slot #6.
- *
- * ACFail is wired via BaseIO BRIDGE slot #7.
- */
-#define IP30_POWER_IRQ		HEART_L2_INT_POWER_BTN
-
-#include <asm/mach-generic/irq.h>
-
-#define IP30_HEART_L0_IRQ	(MIPS_CPU_IRQ_BASE + 2)
-#define IP30_HEART_L1_IRQ	(MIPS_CPU_IRQ_BASE + 3)
-#define IP30_HEART_L2_IRQ	(MIPS_CPU_IRQ_BASE + 4)
-#define IP30_HEART_TIMER_IRQ	(MIPS_CPU_IRQ_BASE + 5)
-#define IP30_HEART_ERR_IRQ	(MIPS_CPU_IRQ_BASE + 6)
-
-#endif /* __ASM_MACH_IP30_IRQ_H */
diff --git a/arch/mips/include/asm/sgi/heart.h b/arch/mips/include/asm/sgi/heart.h
index c423221b4792..0d03751955c4 100644
--- a/arch/mips/include/asm/sgi/heart.h
+++ b/arch/mips/include/asm/sgi/heart.h
@@ -264,6 +264,57 @@ struct ip30_heart_regs {		/* 0x0ff00000 */
 #define HC_NCOR_MEM_ERR			BIT(1)
 #define HC_COR_MEM_ERR			BIT(0)
 
+/*
+ * HEART has 64 interrupt vectors available to it, subdivided into five
+ * priority levels.  They are numbered 0 to 63.
+ */
+#define HEART_NUM_IRQS			64
+
+/*
+ * These are the five interrupt priority levels and their corresponding
+ * CPU IPx interrupt pins.
+ *
+ * Level 4 - Error Interrupts.
+ * Level 3 - HEART timer interrupt.
+ * Level 2 - CPU IPI, CPU debug, power putton, general device interrupts.
+ * Level 1 - General device interrupts.
+ * Level 0 - General device GFX flow control interrupts.
+ */
+#define HEART_L4_INT_MASK		0xfff8000000000000ULL	/* IP6 */
+#define HEART_L3_INT_MASK		0x0004000000000000ULL	/* IP5 */
+#define HEART_L2_INT_MASK		0x0003ffff00000000ULL	/* IP4 */
+#define HEART_L1_INT_MASK		0x00000000ffff0000ULL	/* IP3 */
+#define HEART_L0_INT_MASK		0x000000000000ffffULL	/* IP2 */
+
+/* HEART L0 Interrupts (Low Priority) */
+#define HEART_L0_INT_GENERIC		 0
+#define HEART_L0_INT_FLOW_CTRL_HWTR_0	 1
+#define HEART_L0_INT_FLOW_CTRL_HWTR_1	 2
+
+/* HEART L2 Interrupts (High Priority) */
+#define HEART_L2_INT_RESCHED_CPU_0	46
+#define HEART_L2_INT_RESCHED_CPU_1	47
+#define HEART_L2_INT_CALL_CPU_0		48
+#define HEART_L2_INT_CALL_CPU_1		49
+
+/* HEART L3 Interrupts (Compare/Counter Timer) */
+#define HEART_L3_INT_TIMER		50
+
+/* HEART L4 Interrupts (Errors) */
+#define HEART_L4_INT_XWID_ERR_9		51
+#define HEART_L4_INT_XWID_ERR_A		52
+#define HEART_L4_INT_XWID_ERR_B		53
+#define HEART_L4_INT_XWID_ERR_C		54
+#define HEART_L4_INT_XWID_ERR_D		55
+#define HEART_L4_INT_XWID_ERR_E		56
+#define HEART_L4_INT_XWID_ERR_F		57
+#define HEART_L4_INT_XWID_ERR_XBOW	58
+#define HEART_L4_INT_CPU_BUS_ERR_0	59
+#define HEART_L4_INT_CPU_BUS_ERR_1	60
+#define HEART_L4_INT_CPU_BUS_ERR_2	61
+#define HEART_L4_INT_CPU_BUS_ERR_3	62
+#define HEART_L4_INT_HEART_EXCP		63
+
 extern struct ip30_heart_regs __iomem *heart_regs;
 
 #define heart_read	____raw_readq
diff --git a/arch/mips/sgi-ip30/ip30-common.h b/arch/mips/sgi-ip30/ip30-common.h
index d2bcaee712f3..7b5db24b6279 100644
--- a/arch/mips/sgi-ip30/ip30-common.h
+++ b/arch/mips/sgi-ip30/ip30-common.h
@@ -3,6 +3,20 @@
 #ifndef __IP30_COMMON_H
 #define __IP30_COMMON_H
 
+/*
+ * Power Switch is wired via BaseIO BRIDGE slot #6.
+ *
+ * ACFail is wired via BaseIO BRIDGE slot #7.
+ */
+#define IP30_POWER_IRQ		HEART_L2_INT_POWER_BTN
+
+#define IP30_HEART_L0_IRQ	(MIPS_CPU_IRQ_BASE + 2)
+#define IP30_HEART_L1_IRQ	(MIPS_CPU_IRQ_BASE + 3)
+#define IP30_HEART_L2_IRQ	(MIPS_CPU_IRQ_BASE + 4)
+#define IP30_HEART_TIMER_IRQ	(MIPS_CPU_IRQ_BASE + 5)
+#define IP30_HEART_ERR_IRQ	(MIPS_CPU_IRQ_BASE + 6)
+
+extern void __init ip30_install_ipi(void);
 extern struct plat_smp_ops ip30_smp_ops;
 extern void __init ip30_per_cpu_init(void);
 
diff --git a/arch/mips/sgi-ip30/ip30-irq.c b/arch/mips/sgi-ip30/ip30-irq.c
index c2ffcb920250..e8374e4c705b 100644
--- a/arch/mips/sgi-ip30/ip30-irq.c
+++ b/arch/mips/sgi-ip30/ip30-irq.c
@@ -14,6 +14,8 @@
 #include <asm/irq_cpu.h>
 #include <asm/sgi/heart.h>
 
+#include "ip30-common.h"
+
 struct heart_irq_data {
 	u64	*irq_mask;
 	int	cpu;
-- 
2.16.4

