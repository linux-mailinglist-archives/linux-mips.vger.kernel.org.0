Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 546DEAA649
	for <lists+linux-mips@lfdr.de>; Thu,  5 Sep 2019 16:46:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728258AbfIEOqe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 5 Sep 2019 10:46:34 -0400
Received: from forward106p.mail.yandex.net ([77.88.28.109]:43266 "EHLO
        forward106p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725290AbfIEOqe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 5 Sep 2019 10:46:34 -0400
Received: from mxback12j.mail.yandex.net (mxback12j.mail.yandex.net [IPv6:2a02:6b8:0:1619::87])
        by forward106p.mail.yandex.net (Yandex) with ESMTP id 047CD1C80562;
        Thu,  5 Sep 2019 17:46:29 +0300 (MSK)
Received: from smtp2o.mail.yandex.net (smtp2o.mail.yandex.net [2a02:6b8:0:1a2d::26])
        by mxback12j.mail.yandex.net (nwsmtp/Yandex) with ESMTP id xlJJNOjLsu-kS8mpYUN;
        Thu, 05 Sep 2019 17:46:28 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1567694788;
        bh=tqrCk2lHh7uLbBYfb1q4A+xs3HDXcUI81jcco/99ZUo=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=HUbcK77CdBwL8bTU2ibVss+awv1NS9TVSWmAZXi8LsNKVYLPZtTAnmozAUbFd4VmY
         qu1kPbM8FcRxmQOHOYfDE4DhW4aRpk49hLqn0EEKQ1VOAm0WFaouVU5p98c2CdKjzx
         dIXWmL4Xxm4YW0MHGz7V1R0FdbLeSvDVXMyPMc18=
Authentication-Results: mxback12j.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp2o.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id zkoybIaMjG-kHxWMmZW;
        Thu, 05 Sep 2019 17:46:26 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.co,
        devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 11/19] MIPS: Loongson64: Drop legacy IRQ code
Date:   Thu,  5 Sep 2019 22:43:08 +0800
Message-Id: <20190905144316.12527-12-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190905144316.12527-1-jiaxun.yang@flygoat.com>
References: <20190905144316.12527-1-jiaxun.yang@flygoat.com>
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
 arch/mips/include/asm/mach-loongson64/irq.h |   1 -
 arch/mips/loongson64/irq.c                  | 167 +-------------------
 arch/mips/loongson64/smp.c                  |  26 ++-
 3 files changed, 11 insertions(+), 183 deletions(-)

diff --git a/arch/mips/include/asm/mach-loongson64/irq.h b/arch/mips/include/asm/mach-loongson64/irq.h
index baed43285163..e57a21fc581c 100644
--- a/arch/mips/include/asm/mach-loongson64/irq.h
+++ b/arch/mips/include/asm/mach-loongson64/irq.h
@@ -35,7 +35,6 @@
 #define LOONGSON_INT_COREx_INTy(x, y)	(1<<(x) | 1<<(y+4))	/* route to int y of core x */
 
 extern void fixup_irqs(void);
-extern void loongson3_ipi_interrupt(void);
 
 #include_next <irq.h>
 #endif /* __ASM_MACH_LOONGSON64_IRQ_H_ */
diff --git a/arch/mips/loongson64/irq.c b/arch/mips/loongson64/irq.c
index 4d7b80a0ffb9..78cd824cc84e 100644
--- a/arch/mips/loongson64/irq.c
+++ b/arch/mips/loongson64/irq.c
@@ -3,180 +3,17 @@
 #include <irq.h>
 #include <linux/interrupt.h>
 #include <linux/init.h>
+#include <linux/irqchip.h>
 
 #include <asm/irq_cpu.h>
-#include <asm/i8259.h>
 #include <asm/mipsregs.h>
 
 #include "smp.h"
 
-/* ICU Configuration Regs - r/w */
-
-#define LOONGSON_INTEDGE		LOONGSON_REG(LOONGSON_REGBASE + 0x24)
-#define LOONGSON_INTSTEER		LOONGSON_REG(LOONGSON_REGBASE + 0x28)
-#define LOONGSON_INTPOL			LOONGSON_REG(LOONGSON_REGBASE + 0x2c)
-
-/* ICU Enable Regs - IntEn & IntISR are r/o. */
-
-#define LOONGSON_INTENSET		LOONGSON_REG(LOONGSON_REGBASE + 0x30)
-#define LOONGSON_INTENCLR		LOONGSON_REG(LOONGSON_REGBASE + 0x34)
-#define LOONGSON_INTEN			LOONGSON_REG(LOONGSON_REGBASE + 0x38)
-#define LOONGSON_INTISR			LOONGSON_REG(LOONGSON_REGBASE + 0x3c)
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
-		loongson3_ipi_interrupt();
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
 
 void __init arch_init_irq(void)
 {
-	struct irq_chip *chip;
-
-	/*
-	 * Clear all of the interrupts while we change the able around a bit.
-	 * int-handler is not on bootstrap
-	 */
-	clear_c0_status(ST0_IM | ST0_BEV);
-
-	/* no steer */
-	LOONGSON_INTSTEER = 0;
-
-	/*
-	 * Mask out all interrupt by writing "1" to all bit position in
-	 * the interrupt reset reg.
-	 */
-	LOONGSON_INTENCLR = ~0;
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
+	irqchip_init();
 }
 
 #ifdef CONFIG_HOTPLUG_CPU
diff --git a/arch/mips/loongson64/smp.c b/arch/mips/loongson64/smp.c
index 8ad845e522fb..d53942c56a16 100644
--- a/arch/mips/loongson64/smp.c
+++ b/arch/mips/loongson64/smp.c
@@ -4,6 +4,7 @@
  * Author: Chen Huacai, chenhc@lemote.com
  */
 
+#include <irq.h>
 #include <linux/init.h>
 #include <linux/cpu.h>
 #include <linux/sched.h>
@@ -24,6 +25,8 @@
 
 DEFINE_PER_CPU(int, cpu_state);
 
+#define LS_IPI_IRQ (MIPS_CPU_IRQ_BASE + 6)
+
 static void *ipi_set0_regs[16];
 static void *ipi_clear0_regs[16];
 static void *ipi_status0_regs[16];
@@ -245,21 +248,13 @@ loongson3_send_ipi_mask(const struct cpumask *mask, unsigned int action)
 		loongson3_ipi_write32((u32)action, ipi_set0_regs[cpu_logical_map(i)]);
 }
 
-#define IPI_IRQ_OFFSET 6
-
-void loongson3_send_irq_by_ipi(int cpu, int irqs)
-{
-	loongson3_ipi_write32(irqs << IPI_IRQ_OFFSET, ipi_set0_regs[cpu_logical_map(cpu)]);
-}
-
-void loongson3_ipi_interrupt()
+static irqreturn_t loongson3_ipi_interrupt(int irq, void *dev_id)
 {
 	int i, cpu = smp_processor_id();
-	unsigned int action, c0count, irqs;
+	unsigned int action, c0count;
 
 	/* Load the ipi register to figure out what we're supposed to do */
 	action = loongson3_ipi_read32(ipi_status0_regs[cpu_logical_map(cpu)]);
-	irqs = action >> IPI_IRQ_OFFSET;
 
 	/* Clear the ipi register to clear the interrupt */
 	loongson3_ipi_write32((u32)action, ipi_clear0_regs[cpu_logical_map(cpu)]);
@@ -282,13 +277,7 @@ void loongson3_ipi_interrupt()
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
@@ -384,6 +373,9 @@ static void __init loongson3_smp_setup(void)
 
 static void __init loongson3_prepare_cpus(unsigned int max_cpus)
 {
+	if (request_irq(LS_IPI_IRQ, loongson3_ipi_interrupt,
+			IRQF_PERCPU | IRQF_NO_SUSPEND, "SMP_IPI", NULL))
+			pr_err("Failed to request IPI IRQ\n");
 	init_cpu_present(cpu_possible_mask);
 	per_cpu(cpu_state, smp_processor_id()) = CPU_ONLINE;
 }
-- 
2.22.0

