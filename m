Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 231A4166ED7
	for <lists+linux-mips@lfdr.de>; Fri, 21 Feb 2020 06:15:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727074AbgBUFOn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Feb 2020 00:14:43 -0500
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17855 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726018AbgBUFOn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 21 Feb 2020 00:14:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1582261985;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=z8xfYY1oGTzcoLAgttAm9nrkip2cQNuXBdes8Ar4O58=;
        b=F/f8spRjTzvaJgpQybtl7uR0aaJALJmkqdTDVSWsFGyHxYYveHlwKwURW0NtDk+C
        Dji9ueVDS+9k4sA6bFEaoyVI4INhVSsC+355wKjJBbbBf+nx/MaKBHs5ko4+6b6Wm33
        yDo6K5oCQtATj0IVP1HKRUmYOfqozOVyAQdz++4E=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by mx.zoho.com.cn
        with SMTPS id 1582261983888313.2127495354823; Fri, 21 Feb 2020 13:13:03 +0800 (CST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Huacai Chen <chenhc@lemote.com>,
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Message-ID: <20200221050942.507775-7-jiaxun.yang@flygoat.com>
Subject: [PATCH v4 06/10] MIPS: Loongson64: Drop legacy IRQ code
Date:   Fri, 21 Feb 2020 13:09:21 +0800
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200221050942.507775-1-jiaxun.yang@flygoat.com>
References: <20200221050942.507775-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Content-Type: text/plain; charset=utf8
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

diff --git a/arch/mips/include/asm/mach-loongson64/boot_param.h b/arch/mips=
/include/asm/mach-loongson64/boot_param.h
index 8c286bedff3e..2ed483e32d8c 100644
--- a/arch/mips/include/asm/mach-loongson64/boot_param.h
+++ b/arch/mips/include/asm/mach-loongson64/boot_param.h
@@ -2,6 +2,8 @@
 #ifndef __ASM_MACH_LOONGSON64_BOOT_PARAM_H_
 #define __ASM_MACH_LOONGSON64_BOOT_PARAM_H_
=20
+#include <linux/types.h>
+
 #define SYSTEM_RAM_LOW=09=091
 #define SYSTEM_RAM_HIGH=09=092
 #define SYSTEM_RAM_RESERVED=093
diff --git a/arch/mips/include/asm/mach-loongson64/irq.h b/arch/mips/includ=
e/asm/mach-loongson64/irq.h
index 73a89913dc38..12208119aac0 100644
--- a/arch/mips/include/asm/mach-loongson64/irq.h
+++ b/arch/mips/include/asm/mach-loongson64/irq.h
@@ -7,34 +7,5 @@
 /* cpu core interrupt numbers */
 #define MIPS_CPU_IRQ_BASE 56
=20
-#define LOONGSON_UART_IRQ   (MIPS_CPU_IRQ_BASE + 2) /* UART */
-#define LOONGSON_BRIDGE_IRQ (MIPS_CPU_IRQ_BASE + 3) /* CASCADE */
-#define LOONGSON_TIMER_IRQ  (MIPS_CPU_IRQ_BASE + 7) /* CPU Timer */
-
-#define LOONGSON_HT1_CFG_BASE=09=09loongson_sysconf.ht_control_base
-#define LOONGSON_HT1_INT_VECTOR_BASE=09(LOONGSON_HT1_CFG_BASE + 0x80)
-#define LOONGSON_HT1_INT_EN_BASE=09(LOONGSON_HT1_CFG_BASE + 0xa0)
-#define LOONGSON_HT1_INT_VECTOR(n)=09\
-=09=09LOONGSON3_REG32(LOONGSON_HT1_INT_VECTOR_BASE, 4 * (n))
-#define LOONGSON_HT1_INTN_EN(n)=09=09\
-=09=09LOONGSON3_REG32(LOONGSON_HT1_INT_EN_BASE, 4 * (n))
-
-#define LOONGSON_INT_ROUTER_OFFSET=090x1400
-#define LOONGSON_INT_ROUTER_INTEN=09\
-=09  LOONGSON3_REG32(LOONGSON3_REG_BASE, LOONGSON_INT_ROUTER_OFFSET + 0x24=
)
-#define LOONGSON_INT_ROUTER_INTENSET=09\
-=09  LOONGSON3_REG32(LOONGSON3_REG_BASE, LOONGSON_INT_ROUTER_OFFSET + 0x28=
)
-#define LOONGSON_INT_ROUTER_INTENCLR=09\
-=09  LOONGSON3_REG32(LOONGSON3_REG_BASE, LOONGSON_INT_ROUTER_OFFSET + 0x2c=
)
-#define LOONGSON_INT_ROUTER_ENTRY(n)=09\
-=09  LOONGSON3_REG8(LOONGSON3_REG_BASE, LOONGSON_INT_ROUTER_OFFSET + n)
-#define LOONGSON_INT_ROUTER_LPC=09=09LOONGSON_INT_ROUTER_ENTRY(0x0a)
-#define LOONGSON_INT_ROUTER_HT1(n)=09LOONGSON_INT_ROUTER_ENTRY(n + 0x18)
-
-#define LOONGSON_INT_COREx_INTy(x, y)=09(1<<(x) | 1<<(y+4))=09/* route to =
int y of core x */
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
-obj-$(CONFIG_MACH_LOONGSON64) +=3D irq.o cop2-ex.o platform.o acpi_init.o =
dma.o \
+obj-$(CONFIG_MACH_LOONGSON64) +=3D cop2-ex.o platform.o acpi_init.o dma.o =
\
 =09=09=09=09setup.o init.o env.o time.o reset.o \
=20
 obj-$(CONFIG_SMP)=09+=3D smp.o
diff --git a/arch/mips/loongson64/init.c b/arch/mips/loongson64/init.c
index 5ac1a0f35ca4..da38944471f4 100644
--- a/arch/mips/loongson64/init.c
+++ b/arch/mips/loongson64/init.c
@@ -4,6 +4,7 @@
  * Author: Wu Zhangjin, wuzhangjin@gmail.com
  */
=20
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
+=09irqchip_init();
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
-unsigned int irq_cpu[16] =3D {[0 ... 15] =3D -1};
-unsigned int ht_irq[] =3D {0, 1, 3, 4, 5, 6, 7, 8, 12, 14, 15};
-unsigned int local_irq =3D 1<<0 | 1<<1 | 1<<2 | 1<<7 | 1<<8 | 1<<12;
-
-int plat_set_irq_affinity(struct irq_data *d, const struct cpumask *affini=
ty,
-=09=09=09  bool force)
-{
-=09unsigned int cpu;
-=09struct cpumask new_affinity;
-
-=09/* I/O devices are connected on package-0 */
-=09cpumask_copy(&new_affinity, affinity);
-=09for_each_cpu(cpu, affinity)
-=09=09if (cpu_data[cpu].package > 0)
-=09=09=09cpumask_clear_cpu(cpu, &new_affinity);
-
-=09if (cpumask_empty(&new_affinity))
-=09=09return -EINVAL;
-
-=09cpumask_copy(d->common->affinity, &new_affinity);
-
-=09return IRQ_SET_MASK_OK_NOCOPY;
-}
-
-static void ht_irqdispatch(void)
-{
-=09unsigned int i, irq;
-=09struct irq_data *irqd;
-=09struct cpumask affinity;
-
-=09irq =3D LOONGSON_HT1_INT_VECTOR(0);
-=09LOONGSON_HT1_INT_VECTOR(0) =3D irq; /* Acknowledge the IRQs */
-
-=09for (i =3D 0; i < ARRAY_SIZE(ht_irq); i++) {
-=09=09if (!(irq & (0x1 << ht_irq[i])))
-=09=09=09continue;
-
-=09=09/* handled by local core */
-=09=09if (local_irq & (0x1 << ht_irq[i])) {
-=09=09=09do_IRQ(ht_irq[i]);
-=09=09=09continue;
-=09=09}
-
-=09=09irqd =3D irq_get_irq_data(ht_irq[i]);
-=09=09cpumask_and(&affinity, irqd->common->affinity, cpu_active_mask);
-=09=09if (cpumask_empty(&affinity)) {
-=09=09=09do_IRQ(ht_irq[i]);
-=09=09=09continue;
-=09=09}
-
-=09=09irq_cpu[ht_irq[i]] =3D cpumask_next(irq_cpu[ht_irq[i]], &affinity);
-=09=09if (irq_cpu[ht_irq[i]] >=3D nr_cpu_ids)
-=09=09=09irq_cpu[ht_irq[i]] =3D cpumask_first(&affinity);
-
-=09=09if (irq_cpu[ht_irq[i]] =3D=3D 0) {
-=09=09=09do_IRQ(ht_irq[i]);
-=09=09=09continue;
-=09=09}
-
-=09=09/* balanced by other cores */
-=09=09loongson3_send_irq_by_ipi(irq_cpu[ht_irq[i]], (0x1 << ht_irq[i]));
-=09}
-}
-
-#define UNUSED_IPS (CAUSEF_IP5 | CAUSEF_IP4 | CAUSEF_IP1 | CAUSEF_IP0)
-
-asmlinkage void plat_irq_dispatch(void)
-{
-=09unsigned int pending;
-
-=09pending =3D read_c0_cause() & read_c0_status() & ST0_IM;
-
-=09if (pending & CAUSEF_IP7)
-=09=09do_IRQ(LOONGSON_TIMER_IRQ);
-#if defined(CONFIG_SMP)
-=09if (pending & CAUSEF_IP6)
-=09=09loongson3_ipi_interrupt(NULL);
-#endif
-=09if (pending & CAUSEF_IP3)
-=09=09ht_irqdispatch();
-=09if (pending & CAUSEF_IP2)
-=09=09do_IRQ(LOONGSON_UART_IRQ);
-=09if (pending & UNUSED_IPS) {
-=09=09pr_err("%s : spurious interrupt\n", __func__);
-=09=09spurious_interrupt();
-=09}
-}
-
-static inline void mask_loongson_irq(struct irq_data *d) { }
-static inline void unmask_loongson_irq(struct irq_data *d) { }
-
- /* For MIPS IRQs which shared by all cores */
-static struct irq_chip loongson_irq_chip =3D {
-=09.name=09=09=3D "Loongson",
-=09.irq_ack=09=3D mask_loongson_irq,
-=09.irq_mask=09=3D mask_loongson_irq,
-=09.irq_mask_ack=09=3D mask_loongson_irq,
-=09.irq_unmask=09=3D unmask_loongson_irq,
-=09.irq_eoi=09=3D unmask_loongson_irq,
-};
-
-void irq_router_init(void)
-{
-=09int i;
-
-=09/* route LPC int to cpu core0 int 0 */
-=09LOONGSON_INT_ROUTER_LPC =3D
-=09=09LOONGSON_INT_COREx_INTy(loongson_sysconf.boot_cpu_id, 0);
-=09/* route HT1 int0 ~ int7 to cpu core0 INT1*/
-=09for (i =3D 0; i < 8; i++)
-=09=09LOONGSON_INT_ROUTER_HT1(i) =3D
-=09=09=09LOONGSON_INT_COREx_INTy(loongson_sysconf.boot_cpu_id, 1);
-=09/* enable HT1 interrupt */
-=09LOONGSON_HT1_INTN_EN(0) =3D 0xffffffff;
-=09/* enable router interrupt intenset */
-=09LOONGSON_INT_ROUTER_INTENSET =3D
-=09=09LOONGSON_INT_ROUTER_INTEN | (0xffff << 16) | 0x1 << 10;
-}
-
-void __init arch_init_irq(void)
-{
-=09struct irq_chip *chip;
-
-=09clear_c0_status(ST0_IM | ST0_BEV);
-
-=09irq_router_init();
-=09mips_cpu_irq_init();
-=09init_i8259_irqs();
-=09chip =3D irq_get_chip(I8259A_IRQ_BASE);
-=09chip->irq_set_affinity =3D plat_set_irq_affinity;
-
-=09irq_set_chip_and_handler(LOONGSON_UART_IRQ,
-=09=09=09&loongson_irq_chip, handle_percpu_irq);
-=09irq_set_chip_and_handler(LOONGSON_BRIDGE_IRQ,
-=09=09=09&loongson_irq_chip, handle_percpu_irq);
-
-=09set_c0_status(STATUSF_IP2 | STATUSF_IP3 | STATUSF_IP6);
-}
-
-#ifdef CONFIG_HOTPLUG_CPU
-
-void fixup_irqs(void)
-{
-=09irq_cpu_offline();
-=09clear_c0_status(ST0_IM);
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
=20
+#include <irq.h>
 #include <linux/init.h>
 #include <linux/cpu.h>
 #include <linux/sched.h>
@@ -25,6 +26,8 @@
=20
 DEFINE_PER_CPU(int, cpu_state);
=20
+#define LS_IPI_IRQ (MIPS_CPU_IRQ_BASE + 6)
+
 static void *ipi_set0_regs[16];
 static void *ipi_clear0_regs[16];
 static void *ipi_status0_regs[16];
@@ -302,20 +305,13 @@ loongson3_send_ipi_mask(const struct cpumask *mask, u=
nsigned int action)
 =09=09ipi_write_action(cpu_logical_map(i), (u32)action);
 }
=20
-#define IPI_IRQ_OFFSET 6
-
-void loongson3_send_irq_by_ipi(int cpu, int irqs)
-{
-=09ipi_write_action(cpu_logical_map(cpu), irqs << IPI_IRQ_OFFSET);
-}
=20
-void loongson3_ipi_interrupt(struct pt_regs *regs)
+static irqreturn_t loongson3_ipi_interrupt(int irq, void *dev_id)
 {
 =09int i, cpu =3D smp_processor_id();
-=09unsigned int action, c0count, irqs;
+=09unsigned int action, c0count;
=20
 =09action =3D ipi_read_clear(cpu);
-=09irqs =3D action >> IPI_IRQ_OFFSET;
=20
 =09if (action & SMP_RESCHEDULE_YOURSELF)
 =09=09scheduler_ipi();
@@ -335,13 +331,7 @@ void loongson3_ipi_interrupt(struct pt_regs *regs)
 =09=09__wbflush(); /* Let others see the result ASAP */
 =09}
=20
-=09if (irqs) {
-=09=09int irq;
-=09=09while ((irq =3D ffs(irqs))) {
-=09=09=09do_IRQ(irq-1);
-=09=09=09irqs &=3D ~(1<<(irq-1));
-=09=09}
-=09}
+=09return IRQ_HANDLED;
 }
=20
 #define MAX_LOOPS 800
@@ -438,6 +428,9 @@ static void __init loongson3_smp_setup(void)
=20
 static void __init loongson3_prepare_cpus(unsigned int max_cpus)
 {
+=09if (request_irq(LS_IPI_IRQ, loongson3_ipi_interrupt,
+=09=09=09IRQF_PERCPU | IRQF_NO_SUSPEND, "SMP_IPI", NULL))
+=09=09pr_err("Failed to request IPI IRQ\n");
 =09init_cpu_present(cpu_possible_mask);
 =09per_cpu(cpu_state, smp_processor_id()) =3D CPU_ONLINE;
 }
@@ -484,7 +477,8 @@ static int loongson3_cpu_disable(void)
 =09set_cpu_online(cpu, false);
 =09calculate_cpu_foreign_map();
 =09local_irq_save(flags);
-=09fixup_irqs();
+=09irq_cpu_offline();
+=09clear_c0_status(ST0_IM);
 =09local_irq_restore(flags);
 =09local_flush_tlb_all();
=20
--=20
2.25.0


