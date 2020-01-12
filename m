Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA50E13857B
	for <lists+linux-mips@lfdr.de>; Sun, 12 Jan 2020 09:21:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732371AbgALIVM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 12 Jan 2020 03:21:12 -0500
Received: from forward102p.mail.yandex.net ([77.88.28.102]:55370 "EHLO
        forward102p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732369AbgALIVL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 12 Jan 2020 03:21:11 -0500
X-Greylist: delayed 341 seconds by postgrey-1.27 at vger.kernel.org; Sun, 12 Jan 2020 03:21:10 EST
Received: from forward103q.mail.yandex.net (forward103q.mail.yandex.net [IPv6:2a02:6b8:c0e:50:0:640:b21c:d009])
        by forward102p.mail.yandex.net (Yandex) with ESMTP id DF1AA1D40A7B;
        Sun, 12 Jan 2020 11:15:41 +0300 (MSK)
Received: from mxback12q.mail.yandex.net (mxback12q.mail.yandex.net [IPv6:2a02:6b8:c0e:1b3:0:640:3818:d096])
        by forward103q.mail.yandex.net (Yandex) with ESMTP id D981961E0004;
        Sun, 12 Jan 2020 11:15:41 +0300 (MSK)
Received: from vla1-ee05250d997a.qloud-c.yandex.net (vla1-ee05250d997a.qloud-c.yandex.net [2a02:6b8:c0d:3495:0:640:ee05:250d])
        by mxback12q.mail.yandex.net (mxback/Yandex) with ESMTP id FtiXaFgyPz-Ffh0cOpa;
        Sun, 12 Jan 2020 11:15:41 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1578816941;
        bh=QiD7FdoBSDhrTqxbbKQb//gLnNRoKM1HasAgElmWEfk=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=BqPbUKBn1pAUFJ13PDleOfECkIKQtiiTOF0TG3s3AtDm3oBlDqhAdtGO9cUt0aEuO
         VomSQsf0/c2Na6QS30147EkevRamJAaAY5H1xsHcizVRcG8VDhCHUDG+4xnAaSPxjz
         AB2W3chKQRBFjtJrPQisCktowhqyGD0QwXLL9l/M=
Authentication-Results: mxback12q.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by vla1-ee05250d997a.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id 3jM5RHRYtF-FSV4molR;
        Sun, 12 Jan 2020 11:15:33 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.co,
        devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v3 07/10] MIPS: Loongson64: Drop legacy IRQ code
Date:   Sun, 12 Jan 2020 16:14:13 +0800
Message-Id: <20200112081416.722218-8-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200112081416.722218-1-jiaxun.yang@flygoat.com>
References: <20200112081416.722218-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

We've made generic irqchip drivers for Loongson-3 platform, it's time
to say goodbye to these legacy code.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 .../include/asm/mach-loongson64/boot_param.h  |   2 +
 arch/mips/include/asm/mach-loongson64/irq.h   |  29 ----
 arch/mips/loongson64/Makefile                 |   2 +-
 arch/mips/loongson64/init.c                   |   6 +
 arch/mips/loongson64/irq.c                    | 162 ------------------
 arch/mips/loongson64/smp.c                    |  28 ++-
 6 files changed, 20 insertions(+), 209 deletions(-)
 delete mode 100644 arch/mips/loongson64/irq.c

diff --git a/arch/mips/include/asm/mach-loongson64/boot_param.h b/arch/mips/include/asm/mach-loongson64/boot_param.h
index 8c286bedff3e..2ed483e32d8c 100644
--- a/arch/mips/include/asm/mach-loongson64/boot_param.h
+++ b/arch/mips/include/asm/mach-loongson64/boot_param.h
@@ -2,6 +2,8 @@
 #ifndef __ASM_MACH_LOONGSON64_BOOT_PARAM_H_
 #define __ASM_MACH_LOONGSON64_BOOT_PARAM_H_
 
+#include <linux/types.h>
+
 #define SYSTEM_RAM_LOW		1
 #define SYSTEM_RAM_HIGH		2
 #define SYSTEM_RAM_RESERVED	3
diff --git a/arch/mips/include/asm/mach-loongson64/irq.h b/arch/mips/include/asm/mach-loongson64/irq.h
index 73a89913dc38..12208119aac0 100644
--- a/arch/mips/include/asm/mach-loongson64/irq.h
+++ b/arch/mips/include/asm/mach-loongson64/irq.h
@@ -7,34 +7,5 @@
 /* cpu core interrupt numbers */
 #define MIPS_CPU_IRQ_BASE 56
 
-#define LOONGSON_UART_IRQ   (MIPS_CPU_IRQ_BASE + 2) /* UART */
-#define LOONGSON_BRIDGE_IRQ (MIPS_CPU_IRQ_BASE + 3) /* CASCADE */
-#define LOONGSON_TIMER_IRQ  (MIPS_CPU_IRQ_BASE + 7) /* CPU Timer */
-
-#define LOONGSON_HT1_CFG_BASE		loongson_sysconf.ht_control_base
-#define LOONGSON_HT1_INT_VECTOR_BASE	(LOONGSON_HT1_CFG_BASE + 0x80)
-#define LOONGSON_HT1_INT_EN_BASE	(LOONGSON_HT1_CFG_BASE + 0xa0)
-#define LOONGSON_HT1_INT_VECTOR(n)	\
-		LOONGSON3_REG32(LOONGSON_HT1_INT_VECTOR_BASE, 4 * (n))
-#define LOONGSON_HT1_INTN_EN(n)		\
-		LOONGSON3_REG32(LOONGSON_HT1_INT_EN_BASE, 4 * (n))
-
-#define LOONGSON_INT_ROUTER_OFFSET	0x1400
-#define LOONGSON_INT_ROUTER_INTEN	\
-	  LOONGSON3_REG32(LOONGSON3_REG_BASE, LOONGSON_INT_ROUTER_OFFSET + 0x24)
-#define LOONGSON_INT_ROUTER_INTENSET	\
-	  LOONGSON3_REG32(LOONGSON3_REG_BASE, LOONGSON_INT_ROUTER_OFFSET + 0x28)
-#define LOONGSON_INT_ROUTER_INTENCLR	\
-	  LOONGSON3_REG32(LOONGSON3_REG_BASE, LOONGSON_INT_ROUTER_OFFSET + 0x2c)
-#define LOONGSON_INT_ROUTER_ENTRY(n)	\
-	  LOONGSON3_REG8(LOONGSON3_REG_BASE, LOONGSON_INT_ROUTER_OFFSET + n)
-#define LOONGSON_INT_ROUTER_LPC		LOONGSON_INT_ROUTER_ENTRY(0x0a)
-#define LOONGSON_INT_ROUTER_HT1(n)	LOONGSON_INT_ROUTER_ENTRY(n + 0x18)
-
-#define LOONGSON_INT_COREx_INTy(x, y)	(1<<(x) | 1<<(y+4))	/* route to int y of core x */
-
-extern void fixup_irqs(void);
-extern void loongson3_ipi_interrupt(struct pt_regs *regs);
-
 #include_next <irq.h>
 #endif /* __ASM_MACH_LOONGSON64_IRQ_H_ */
diff --git a/arch/mips/loongson64/Makefile b/arch/mips/loongson64/Makefile
index 7821891bc5d0..b7f40b179c71 100644
--- a/arch/mips/loongson64/Makefile
+++ b/arch/mips/loongson64/Makefile
@@ -2,7 +2,7 @@
 #
 # Makefile for Loongson-3 family machines
 #
-obj-$(CONFIG_MACH_LOONGSON64) += irq.o cop2-ex.o platform.o acpi_init.o dma.o \
+obj-$(CONFIG_MACH_LOONGSON64) += cop2-ex.o platform.o acpi_init.o dma.o \
 				setup.o init.o env.o time.o reset.o \
 
 obj-$(CONFIG_SMP)	+= smp.o
diff --git a/arch/mips/loongson64/init.c b/arch/mips/loongson64/init.c
index 5ac1a0f35ca4..da38944471f4 100644
--- a/arch/mips/loongson64/init.c
+++ b/arch/mips/loongson64/init.c
@@ -4,6 +4,7 @@
  * Author: Wu Zhangjin, wuzhangjin@gmail.com
  */
 
+#include <linux/irqchip.h>
 #include <linux/memblock.h>
 #include <asm/bootinfo.h>
 #include <asm/traps.h>
@@ -44,3 +45,8 @@ void __init prom_init(void)
 void __init prom_free_prom_memory(void)
 {
 }
+
+void __init arch_init_irq(void)
+{
+	irqchip_init();
+}
diff --git a/arch/mips/loongson64/irq.c b/arch/mips/loongson64/irq.c
deleted file mode 100644
index 79ad797497e4..000000000000
--- a/arch/mips/loongson64/irq.c
+++ /dev/null
@@ -1,162 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-#include <loongson.h>
-#include <irq.h>
-#include <linux/interrupt.h>
-#include <linux/init.h>
-
-#include <asm/irq_cpu.h>
-#include <asm/i8259.h>
-#include <asm/mipsregs.h>
-
-#include "smp.h"
-
-extern void loongson3_send_irq_by_ipi(int cpu, int irqs);
-
-unsigned int irq_cpu[16] = {[0 ... 15] = -1};
-unsigned int ht_irq[] = {0, 1, 3, 4, 5, 6, 7, 8, 12, 14, 15};
-unsigned int local_irq = 1<<0 | 1<<1 | 1<<2 | 1<<7 | 1<<8 | 1<<12;
-
-int plat_set_irq_affinity(struct irq_data *d, const struct cpumask *affinity,
-			  bool force)
-{
-	unsigned int cpu;
-	struct cpumask new_affinity;
-
-	/* I/O devices are connected on package-0 */
-	cpumask_copy(&new_affinity, affinity);
-	for_each_cpu(cpu, affinity)
-		if (cpu_data[cpu].package > 0)
-			cpumask_clear_cpu(cpu, &new_affinity);
-
-	if (cpumask_empty(&new_affinity))
-		return -EINVAL;
-
-	cpumask_copy(d->common->affinity, &new_affinity);
-
-	return IRQ_SET_MASK_OK_NOCOPY;
-}
-
-static void ht_irqdispatch(void)
-{
-	unsigned int i, irq;
-	struct irq_data *irqd;
-	struct cpumask affinity;
-
-	irq = LOONGSON_HT1_INT_VECTOR(0);
-	LOONGSON_HT1_INT_VECTOR(0) = irq; /* Acknowledge the IRQs */
-
-	for (i = 0; i < ARRAY_SIZE(ht_irq); i++) {
-		if (!(irq & (0x1 << ht_irq[i])))
-			continue;
-
-		/* handled by local core */
-		if (local_irq & (0x1 << ht_irq[i])) {
-			do_IRQ(ht_irq[i]);
-			continue;
-		}
-
-		irqd = irq_get_irq_data(ht_irq[i]);
-		cpumask_and(&affinity, irqd->common->affinity, cpu_active_mask);
-		if (cpumask_empty(&affinity)) {
-			do_IRQ(ht_irq[i]);
-			continue;
-		}
-
-		irq_cpu[ht_irq[i]] = cpumask_next(irq_cpu[ht_irq[i]], &affinity);
-		if (irq_cpu[ht_irq[i]] >= nr_cpu_ids)
-			irq_cpu[ht_irq[i]] = cpumask_first(&affinity);
-
-		if (irq_cpu[ht_irq[i]] == 0) {
-			do_IRQ(ht_irq[i]);
-			continue;
-		}
-
-		/* balanced by other cores */
-		loongson3_send_irq_by_ipi(irq_cpu[ht_irq[i]], (0x1 << ht_irq[i]));
-	}
-}
-
-#define UNUSED_IPS (CAUSEF_IP5 | CAUSEF_IP4 | CAUSEF_IP1 | CAUSEF_IP0)
-
-asmlinkage void plat_irq_dispatch(void)
-{
-	unsigned int pending;
-
-	pending = read_c0_cause() & read_c0_status() & ST0_IM;
-
-	if (pending & CAUSEF_IP7)
-		do_IRQ(LOONGSON_TIMER_IRQ);
-#if defined(CONFIG_SMP)
-	if (pending & CAUSEF_IP6)
-		loongson3_ipi_interrupt(NULL);
-#endif
-	if (pending & CAUSEF_IP3)
-		ht_irqdispatch();
-	if (pending & CAUSEF_IP2)
-		do_IRQ(LOONGSON_UART_IRQ);
-	if (pending & UNUSED_IPS) {
-		pr_err("%s : spurious interrupt\n", __func__);
-		spurious_interrupt();
-	}
-}
-
-static inline void mask_loongson_irq(struct irq_data *d) { }
-static inline void unmask_loongson_irq(struct irq_data *d) { }
-
- /* For MIPS IRQs which shared by all cores */
-static struct irq_chip loongson_irq_chip = {
-	.name		= "Loongson",
-	.irq_ack	= mask_loongson_irq,
-	.irq_mask	= mask_loongson_irq,
-	.irq_mask_ack	= mask_loongson_irq,
-	.irq_unmask	= unmask_loongson_irq,
-	.irq_eoi	= unmask_loongson_irq,
-};
-
-void irq_router_init(void)
-{
-	int i;
-
-	/* route LPC int to cpu core0 int 0 */
-	LOONGSON_INT_ROUTER_LPC =
-		LOONGSON_INT_COREx_INTy(loongson_sysconf.boot_cpu_id, 0);
-	/* route HT1 int0 ~ int7 to cpu core0 INT1*/
-	for (i = 0; i < 8; i++)
-		LOONGSON_INT_ROUTER_HT1(i) =
-			LOONGSON_INT_COREx_INTy(loongson_sysconf.boot_cpu_id, 1);
-	/* enable HT1 interrupt */
-	LOONGSON_HT1_INTN_EN(0) = 0xffffffff;
-	/* enable router interrupt intenset */
-	LOONGSON_INT_ROUTER_INTENSET =
-		LOONGSON_INT_ROUTER_INTEN | (0xffff << 16) | 0x1 << 10;
-}
-
-void __init arch_init_irq(void)
-{
-	struct irq_chip *chip;
-
-	clear_c0_status(ST0_IM | ST0_BEV);
-
-	irq_router_init();
-	mips_cpu_irq_init();
-	init_i8259_irqs();
-	chip = irq_get_chip(I8259A_IRQ_BASE);
-	chip->irq_set_affinity = plat_set_irq_affinity;
-
-	irq_set_chip_and_handler(LOONGSON_UART_IRQ,
-			&loongson_irq_chip, handle_percpu_irq);
-	irq_set_chip_and_handler(LOONGSON_BRIDGE_IRQ,
-			&loongson_irq_chip, handle_percpu_irq);
-
-	set_c0_status(STATUSF_IP2 | STATUSF_IP3 | STATUSF_IP6);
-}
-
-#ifdef CONFIG_HOTPLUG_CPU
-
-void fixup_irqs(void)
-{
-	irq_cpu_offline();
-	clear_c0_status(ST0_IM);
-}
-
-#endif
diff --git a/arch/mips/loongson64/smp.c b/arch/mips/loongson64/smp.c
index de8e0741ce2d..e1fe8bbb377d 100644
--- a/arch/mips/loongson64/smp.c
+++ b/arch/mips/loongson64/smp.c
@@ -4,6 +4,7 @@
  * Author: Chen Huacai, chenhc@lemote.com
  */
 
+#include <irq.h>
 #include <linux/init.h>
 #include <linux/cpu.h>
 #include <linux/sched.h>
@@ -25,6 +26,8 @@
 
 DEFINE_PER_CPU(int, cpu_state);
 
+#define LS_IPI_IRQ (MIPS_CPU_IRQ_BASE + 6)
+
 static void *ipi_set0_regs[16];
 static void *ipi_clear0_regs[16];
 static void *ipi_status0_regs[16];
@@ -302,20 +305,13 @@ loongson3_send_ipi_mask(const struct cpumask *mask, unsigned int action)
 		ipi_write_action(cpu_logical_map(i), (u32)action);
 }
 
-#define IPI_IRQ_OFFSET 6
-
-void loongson3_send_irq_by_ipi(int cpu, int irqs)
-{
-	ipi_write_action(cpu_logical_map(cpu), irqs << IPI_IRQ_OFFSET);
-}
 
-void loongson3_ipi_interrupt(struct pt_regs *regs)
+static irqreturn_t loongson3_ipi_interrupt(int irq, void *dev_id)
 {
 	int i, cpu = smp_processor_id();
-	unsigned int action, c0count, irqs;
+	unsigned int action, c0count;
 
 	action = ipi_read_clear(cpu);
-	irqs = action >> IPI_IRQ_OFFSET;
 
 	if (action & SMP_RESCHEDULE_YOURSELF)
 		scheduler_ipi();
@@ -335,13 +331,7 @@ void loongson3_ipi_interrupt(struct pt_regs *regs)
 		__wbflush(); /* Let others see the result ASAP */
 	}
 
-	if (irqs) {
-		int irq;
-		while ((irq = ffs(irqs))) {
-			do_IRQ(irq-1);
-			irqs &= ~(1<<(irq-1));
-		}
-	}
+	return IRQ_HANDLED;
 }
 
 #define MAX_LOOPS 800
@@ -438,6 +428,9 @@ static void __init loongson3_smp_setup(void)
 
 static void __init loongson3_prepare_cpus(unsigned int max_cpus)
 {
+	if (request_irq(LS_IPI_IRQ, loongson3_ipi_interrupt,
+			IRQF_PERCPU | IRQF_NO_SUSPEND, "SMP_IPI", NULL))
+		pr_err("Failed to request IPI IRQ\n");
 	init_cpu_present(cpu_possible_mask);
 	per_cpu(cpu_state, smp_processor_id()) = CPU_ONLINE;
 }
@@ -484,7 +477,8 @@ static int loongson3_cpu_disable(void)
 	set_cpu_online(cpu, false);
 	calculate_cpu_foreign_map();
 	local_irq_save(flags);
-	fixup_irqs();
+	irq_cpu_offline();
+	clear_c0_status(ST0_IM);
 	local_irq_restore(flags);
 	local_flush_tlb_all();
 
-- 
2.24.1

