Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A51015FFE6
	for <lists+linux-mips@lfdr.de>; Sat, 15 Feb 2020 19:56:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727755AbgBOS4P (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 15 Feb 2020 13:56:15 -0500
Received: from out28-145.mail.aliyun.com ([115.124.28.145]:55232 "EHLO
        out28-145.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726608AbgBOS4P (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 15 Feb 2020 13:56:15 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436282|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.329164-0.0149602-0.655876;DS=CONTINUE|ham_regular_dialog|0.0178661-0.00137838-0.980756;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03294;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=24;RT=24;SR=0;TI=SMTPD_---.GoTIZgt_1581792955;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GoTIZgt_1581792955)
          by smtp.aliyun-inc.com(10.147.42.241);
          Sun, 16 Feb 2020 02:56:07 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, paul@crapouillou.net,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, ralf@linux-mips.org, paulburton@kernel.org,
        jiaxun.yang@flygoat.com, chenhc@lemote.com, allison@lohutok.net,
        tglx@linutronix.de, daniel.lezcano@linaro.org,
        geert+renesas@glider.be, krzk@kernel.org, keescook@chromium.org,
        ebiederm@xmission.com, miquel.raynal@bootlin.com,
        paul@boddie.org.uk, hns@goldelico.com,
        mips-creator-ci20-dev@googlegroups.com
Subject: [PATCH v5 2/7] MIPS: JZ4780: Introduce SMP support.
Date:   Sun, 16 Feb 2020 02:55:27 +0800
Message-Id: <1581792932-108032-4-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581792932-108032-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1581792932-108032-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Forward port smp support from kernel 3.18.3 of CI20_linux
to upstream kernel 5.6.

Tested-by: H. Nikolaus Schaller <hns@goldelico.com>
Tested-by: Paul Boddie <paul@boddie.org.uk>
Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---

Notes:
    v1->v2:
    1.Remove unnecessary "plat_irq_dispatch(void)" in irq-ingenic.c.
    2.Add a timeout check for "jz4780_boot_secondary()" to avoid a dead loop.
    3.Replace hard code in smp.c with macro.
    
    v2->v3:
    1.Remove unnecessary "extern void (*r4k_blast_dcache)(void)" in smp.c.
    2.Use "for_each_of_cpu_node" instead "for_each_compatible_node" in smp.c.
    3.Use "of_cpu_node_to_id" instead "of_property_read_u32_index" in smp.c.
    4.Move LCR related operations to jz4780-cgu.c.
    
    v3->v4:
    Rebase on top of kernel 5.6-rc1.
    
    v4->v5:
    1.Splitting changes involving "jz4780-cgu.c" into separate commit.
    2.Use "request_irq()" replace "setup_irq()".

 arch/mips/include/asm/mach-jz4740/jz4780-smp.h |  91 ++++++++
 arch/mips/jz4740/Kconfig                       |   3 +
 arch/mips/jz4740/Makefile                      |   5 +
 arch/mips/jz4740/prom.c                        |   4 +
 arch/mips/jz4740/smp-entry.S                   |  57 +++++
 arch/mips/jz4740/smp.c                         | 283 +++++++++++++++++++++++++
 arch/mips/kernel/idle.c                        |  14 +-
 7 files changed, 456 insertions(+), 1 deletion(-)
 create mode 100644 arch/mips/include/asm/mach-jz4740/jz4780-smp.h
 create mode 100644 arch/mips/jz4740/smp-entry.S
 create mode 100644 arch/mips/jz4740/smp.c

diff --git a/arch/mips/include/asm/mach-jz4740/jz4780-smp.h b/arch/mips/include/asm/mach-jz4740/jz4780-smp.h
new file mode 100644
index 00000000..3f592ce
--- /dev/null
+++ b/arch/mips/include/asm/mach-jz4740/jz4780-smp.h
@@ -0,0 +1,91 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ *  Copyright (C) 2013, Paul Burton <paul.burton@imgtec.com>
+ *  JZ4780 SMP definitions
+ */
+
+#ifndef __MIPS_ASM_MACH_JZ4740_JZ4780_SMP_H__
+#define __MIPS_ASM_MACH_JZ4740_JZ4780_SMP_H__
+
+#define read_c0_corectrl()		__read_32bit_c0_register($12, 2)
+#define write_c0_corectrl(val)		__write_32bit_c0_register($12, 2, val)
+
+#define read_c0_corestatus()		__read_32bit_c0_register($12, 3)
+#define write_c0_corestatus(val)	__write_32bit_c0_register($12, 3, val)
+
+#define read_c0_reim()			__read_32bit_c0_register($12, 4)
+#define write_c0_reim(val)		__write_32bit_c0_register($12, 4, val)
+
+#define read_c0_mailbox0()		__read_32bit_c0_register($20, 0)
+#define write_c0_mailbox0(val)		__write_32bit_c0_register($20, 0, val)
+
+#define read_c0_mailbox1()		__read_32bit_c0_register($20, 1)
+#define write_c0_mailbox1(val)		__write_32bit_c0_register($20, 1, val)
+
+#define smp_clr_pending(mask) do {		\
+		unsigned int stat;		\
+		stat = read_c0_corestatus();	\
+		stat &= ~((mask) & 0xff);	\
+		write_c0_corestatus(stat);	\
+	} while (0)
+
+/*
+ * Core Control register
+ */
+#define CORECTRL_SLEEP1M_SHIFT	17
+#define CORECTRL_SLEEP1M	(_ULCAST_(0x1) << CORECTRL_SLEEP1M_SHIFT)
+#define CORECTRL_SLEEP0M_SHIFT	16
+#define CORECTRL_SLEEP0M	(_ULCAST_(0x1) << CORECTRL_SLEEP0M_SHIFT)
+#define CORECTRL_RPC1_SHIFT	9
+#define CORECTRL_RPC1		(_ULCAST_(0x1) << CORECTRL_RPC1_SHIFT)
+#define CORECTRL_RPC0_SHIFT	8
+#define CORECTRL_RPC0		(_ULCAST_(0x1) << CORECTRL_RPC0_SHIFT)
+#define CORECTRL_SWRST1_SHIFT	1
+#define CORECTRL_SWRST1		(_ULCAST_(0x1) << CORECTRL_SWRST1_SHIFT)
+#define CORECTRL_SWRST0_SHIFT	0
+#define CORECTRL_SWRST0		(_ULCAST_(0x1) << CORECTRL_SWRST0_SHIFT)
+
+/*
+ * Core Status register
+ */
+#define CORESTATUS_SLEEP1_SHIFT	17
+#define CORESTATUS_SLEEP1	(_ULCAST_(0x1) << CORESTATUS_SLEEP1_SHIFT)
+#define CORESTATUS_SLEEP0_SHIFT	16
+#define CORESTATUS_SLEEP0	(_ULCAST_(0x1) << CORESTATUS_SLEEP0_SHIFT)
+#define CORESTATUS_IRQ1P_SHIFT	9
+#define CORESTATUS_IRQ1P	(_ULCAST_(0x1) << CORESTATUS_IRQ1P_SHIFT)
+#define CORESTATUS_IRQ0P_SHIFT	8
+#define CORESTATUS_IRQ0P	(_ULCAST_(0x1) << CORESTATUS_IRQ8P_SHIFT)
+#define CORESTATUS_MIRQ1P_SHIFT	1
+#define CORESTATUS_MIRQ1P	(_ULCAST_(0x1) << CORESTATUS_MIRQ1P_SHIFT)
+#define CORESTATUS_MIRQ0P_SHIFT	0
+#define CORESTATUS_MIRQ0P	(_ULCAST_(0x1) << CORESTATUS_MIRQ0P_SHIFT)
+
+/*
+ * Reset Entry & IRQ Mask register
+ */
+#define REIM_ENTRY_SHIFT	16
+#define REIM_ENTRY		(_ULCAST_(0xffff) << REIM_ENTRY_SHIFT)
+#define REIM_IRQ1M_SHIFT	9
+#define REIM_IRQ1M		(_ULCAST_(0x1) << REIM_IRQ1M_SHIFT)
+#define REIM_IRQ0M_SHIFT	8
+#define REIM_IRQ0M		(_ULCAST_(0x1) << REIM_IRQ0M_SHIFT)
+#define REIM_MBOXIRQ1M_SHIFT	1
+#define REIM_MBOXIRQ1M		(_ULCAST_(0x1) << REIM_MBOXIRQ1M_SHIFT)
+#define REIM_MBOXIRQ0M_SHIFT	0
+#define REIM_MBOXIRQ0M		(_ULCAST_(0x1) << REIM_MBOXIRQ0M_SHIFT)
+
+#ifdef CONFIG_SMP
+
+extern void jz4780_smp_wait_irqoff(void);
+
+extern void jz4780_smp_init(void);
+extern void jz4780_secondary_cpu_entry(void);
+
+#else /* !CONFIG_SMP */
+
+static inline void jz4780_smp_init(void) { }
+
+#endif /* !CONFIG_SMP */
+
+#endif /* __MIPS_ASM_MACH_JZ4740_JZ4780_SMP_H__ */
diff --git a/arch/mips/jz4740/Kconfig b/arch/mips/jz4740/Kconfig
index 412d2fa..0239597 100644
--- a/arch/mips/jz4740/Kconfig
+++ b/arch/mips/jz4740/Kconfig
@@ -34,9 +34,12 @@ config MACH_JZ4770
 
 config MACH_JZ4780
 	bool
+	select GENERIC_CLOCKEVENTS_BROADCAST if SMP
 	select MIPS_CPU_SCACHE
+	select NR_CPUS_DEFAULT_2
 	select SYS_HAS_CPU_MIPS32_R2
 	select SYS_SUPPORTS_HIGHMEM
+	select SYS_SUPPORTS_SMP
 
 config MACH_X1000
 	bool
diff --git a/arch/mips/jz4740/Makefile b/arch/mips/jz4740/Makefile
index 6de14c0..0a0f024 100644
--- a/arch/mips/jz4740/Makefile
+++ b/arch/mips/jz4740/Makefile
@@ -12,3 +12,8 @@ CFLAGS_setup.o = -I$(src)/../../../scripts/dtc/libfdt
 # PM support
 
 obj-$(CONFIG_PM) += pm.o
+
+# SMP support
+
+obj-$(CONFIG_SMP) += smp.o
+obj-$(CONFIG_SMP) += smp-entry.o
diff --git a/arch/mips/jz4740/prom.c b/arch/mips/jz4740/prom.c
index ff4555c..a79159e 100644
--- a/arch/mips/jz4740/prom.c
+++ b/arch/mips/jz4740/prom.c
@@ -8,10 +8,14 @@
 
 #include <asm/bootinfo.h>
 #include <asm/fw/fw.h>
+#include <asm/mach-jz4740/jz4780-smp.h>
 
 void __init prom_init(void)
 {
 	fw_init_cmdline();
+#if defined(CONFIG_MACH_JZ4780) && defined(CONFIG_SMP)
+	jz4780_smp_init();
+#endif
 }
 
 void __init prom_free_prom_memory(void)
diff --git a/arch/mips/jz4740/smp-entry.S b/arch/mips/jz4740/smp-entry.S
new file mode 100644
index 00000000..20049a3
--- /dev/null
+++ b/arch/mips/jz4740/smp-entry.S
@@ -0,0 +1,57 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ *  Copyright (C) 2013, Paul Burton <paul.burton@imgtec.com>
+ *  JZ4780 SMP entry point
+ */
+
+#include <asm/addrspace.h>
+#include <asm/asm.h>
+#include <asm/asmmacro.h>
+#include <asm/cacheops.h>
+#include <asm/mipsregs.h>
+
+#define CACHE_SIZE (32 * 1024)
+#define CACHE_LINESIZE 32
+
+.extern jz4780_cpu_entry_sp
+.extern jz4780_cpu_entry_gp
+
+.section .text.smp-entry
+.balign 0x10000
+.set noreorder
+LEAF(jz4780_secondary_cpu_entry)
+	mtc0	zero, CP0_CAUSE
+
+	li	t0, ST0_CU0
+	mtc0	t0, CP0_STATUS
+
+	/* cache setup */
+	li	t0, KSEG0
+	ori	t1, t0, CACHE_SIZE
+	mtc0	zero, CP0_TAGLO, 0
+1:	cache	Index_Store_Tag_I, 0(t0)
+	cache	Index_Store_Tag_D, 0(t0)
+	bne	t0, t1, 1b
+	 addiu	t0, t0, CACHE_LINESIZE
+
+	/* kseg0 cache attribute */
+	mfc0	t0, CP0_CONFIG, 0
+	ori	t0, t0, CONF_CM_CACHABLE_NONCOHERENT
+	mtc0	t0, CP0_CONFIG, 0
+
+	/* pagemask */
+	mtc0	zero, CP0_PAGEMASK, 0
+
+	/* retrieve sp */
+	la	t0, jz4780_cpu_entry_sp
+	lw	sp, 0(t0)
+
+	/* retrieve gp */
+	la	t0, jz4780_cpu_entry_gp
+	lw	gp, 0(t0)
+
+	/* jump to the kernel in kseg0 */
+	la	t0, smp_bootstrap
+	jr	t0
+	 nop
+	END(jz4780_secondary_cpu_entry)
diff --git a/arch/mips/jz4740/smp.c b/arch/mips/jz4740/smp.c
new file mode 100644
index 00000000..826fd0f
--- /dev/null
+++ b/arch/mips/jz4740/smp.c
@@ -0,0 +1,283 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *  Copyright (C) 2013, Paul Burton <paul.burton@imgtec.com>
+ *  JZ4780 SMP
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/interrupt.h>
+#include <linux/of.h>
+#include <linux/sched.h>
+#include <linux/sched/task_stack.h>
+#include <linux/smp.h>
+#include <linux/tick.h>
+#include <asm/mach-jz4740/jz4780-smp.h>
+#include <asm/r4kcache.h>
+#include <asm/smp-ops.h>
+
+static struct clk *cpu_clock_gates[CONFIG_NR_CPUS] = { NULL };
+
+u32 jz4780_cpu_entry_sp;
+u32 jz4780_cpu_entry_gp;
+
+static struct cpumask cpu_running;
+
+static DEFINE_SPINLOCK(smp_lock);
+
+/*
+ * The Ingenic jz4780 SMP variant has to write back dirty cache lines before
+ * executing wait. The CPU & cache clock will be gated until we return from
+ * the wait, and if another core attempts to access data from our data cache
+ * during this time then it will lock up.
+ */
+void jz4780_smp_wait_irqoff(void)
+{
+	unsigned long pending = read_c0_cause() & read_c0_status() & CAUSEF_IP;
+
+	/*
+	 * Going to idle has a significant overhead due to the cache flush so
+	 * try to avoid it if we'll immediately be woken again due to an IRQ.
+	 */
+	if (!need_resched() && !pending) {
+		r4k_blast_dcache();
+
+		__asm__(
+		"	.set push	\n"
+		"	.set mips3	\n"
+		"	sync		\n"
+		"	wait		\n"
+		"	.set pop	\n");
+	}
+
+	local_irq_enable();
+}
+
+static irqreturn_t mbox_handler(int irq, void *dev_id)
+{
+	int cpu = smp_processor_id();
+	u32 action, status;
+
+	spin_lock(&smp_lock);
+
+	switch (cpu) {
+	case 0:
+		action = read_c0_mailbox0();
+		write_c0_mailbox0(0);
+		break;
+	case 1:
+		action = read_c0_mailbox1();
+		write_c0_mailbox1(0);
+		break;
+	default:
+		panic("unhandled cpu %d!", cpu);
+	}
+
+	/* clear pending mailbox interrupt */
+	status = read_c0_corestatus();
+	status &= ~(CORESTATUS_MIRQ0P << cpu);
+	write_c0_corestatus(status);
+
+	spin_unlock(&smp_lock);
+
+	if (action & SMP_RESCHEDULE_YOURSELF)
+		scheduler_ipi();
+	if (action & SMP_CALL_FUNCTION)
+		generic_smp_call_function_interrupt();
+
+	return IRQ_HANDLED;
+}
+
+static void jz4780_smp_setup(void)
+{
+	u32 addr, reim;
+	int cpu;
+
+	reim = read_c0_reim();
+
+	for (cpu = 0; cpu < NR_CPUS; cpu++) {
+		__cpu_number_map[cpu] = cpu;
+		__cpu_logical_map[cpu] = cpu;
+		set_cpu_possible(cpu, true);
+	}
+
+	/* mask mailbox interrupts for this core */
+	reim &= ~REIM_MBOXIRQ0M;
+	write_c0_reim(reim);
+
+	/* clear mailboxes & pending mailbox IRQs */
+	write_c0_mailbox0(0);
+	write_c0_mailbox1(0);
+	write_c0_corestatus(0);
+
+	/* set reset entry point */
+	addr = KSEG1ADDR((u32)&jz4780_secondary_cpu_entry);
+	WARN_ON(addr & ~REIM_ENTRY);
+	reim &= ~REIM_ENTRY;
+	reim |= addr & REIM_ENTRY;
+
+	/* unmask mailbox interrupts for this core */
+	reim |= REIM_MBOXIRQ0M;
+	write_c0_reim(reim);
+	set_c0_status(STATUSF_IP3);
+	irq_enable_hazard();
+
+	cpumask_set_cpu(cpu, &cpu_running);
+}
+
+static void jz4780_smp_prepare_cpus(unsigned int max_cpus)
+{
+	struct device_node *cpu_node;
+	unsigned cpu, ctrl;
+	int err;
+
+	/* setup the mailbox IRQ */
+	err = request_irq(MIPS_CPU_IRQ_BASE + 3, mbox_handler,
+				IRQF_PERCPU | IRQF_NO_THREAD, "core mailbox", NULL);
+	if (err)
+		pr_err("request_irq() on core mailbox failed\n");
+
+	init_cpu_present(cpu_possible_mask);
+
+	ctrl = read_c0_corectrl();
+
+	for (cpu = 0; cpu < max_cpus; cpu++) {
+		/* use reset entry point from REIM register */
+		ctrl |= CORECTRL_RPC0 << cpu;
+	}
+
+	for_each_of_cpu_node(cpu_node) {
+		cpu = of_cpu_node_to_id(cpu_node);
+		if (cpu < 0) {
+			pr_err("Failed to read index of %s\n",
+			       cpu_node->full_name);
+			continue;
+		}
+
+		cpu_clock_gates[cpu] = of_clk_get(cpu_node, 0);
+		if (IS_ERR(cpu_clock_gates[cpu])) {
+			cpu_clock_gates[cpu] = NULL;
+			continue;
+		}
+
+		err = clk_prepare(cpu_clock_gates[cpu]);
+		if (err)
+			pr_err("Failed to prepare CPU clock gate\n");
+	}
+
+	write_c0_corectrl(ctrl);
+}
+
+static int jz4780_boot_secondary(int cpu, struct task_struct *idle)
+{
+	unsigned long flags;
+	u32 ctrl;
+
+	spin_lock_irqsave(&smp_lock, flags);
+
+	/* ensure the core is in reset */
+	ctrl = read_c0_corectrl();
+	ctrl |= CORECTRL_SWRST0 << cpu;
+	write_c0_corectrl(ctrl);
+
+	/* ungate core clock */
+	if (cpu_clock_gates[cpu])
+		clk_enable(cpu_clock_gates[cpu]);
+
+	/* set entry sp/gp register values */
+	jz4780_cpu_entry_sp = __KSTK_TOS(idle);
+	jz4780_cpu_entry_gp = (u32)task_thread_info(idle);
+	smp_wmb();
+
+	/* take the core out of reset */
+	ctrl &= ~(CORECTRL_SWRST0 << cpu);
+	write_c0_corectrl(ctrl);
+
+	cpumask_set_cpu(cpu, &cpu_running);
+
+	spin_unlock_irqrestore(&smp_lock, flags);
+
+	return 0;
+}
+
+static void jz4780_init_secondary(void)
+{
+}
+
+static void jz4780_smp_finish(void)
+{
+	u32 reim;
+
+	spin_lock(&smp_lock);
+
+	/* unmask mailbox interrupts for this core */
+	reim = read_c0_reim();
+	reim |= REIM_MBOXIRQ0M << smp_processor_id();
+	write_c0_reim(reim);
+
+	spin_unlock(&smp_lock);
+
+	/* unmask interrupts for this core */
+	change_c0_status(ST0_IM, STATUSF_IP3 | STATUSF_IP2 |
+			 STATUSF_IP1 | STATUSF_IP0);
+	irq_enable_hazard();
+
+	/* force broadcast timer */
+	tick_broadcast_force();
+}
+
+static void jz4780_send_ipi_single_locked(int cpu, unsigned int action)
+{
+	u32 mbox;
+
+	switch (cpu) {
+	case 0:
+		mbox = read_c0_mailbox0();
+		write_c0_mailbox0(mbox | action);
+		break;
+	case 1:
+		mbox = read_c0_mailbox1();
+		write_c0_mailbox1(mbox | action);
+		break;
+	default:
+		panic("unhandled cpu %d!", cpu);
+	}
+}
+
+static void jz4780_send_ipi_single(int cpu, unsigned int action)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&smp_lock, flags);
+	jz4780_send_ipi_single_locked(cpu, action);
+	spin_unlock_irqrestore(&smp_lock, flags);
+}
+
+static void jz4780_send_ipi_mask(const struct cpumask *mask,
+				 unsigned int action)
+{
+	unsigned long flags;
+	int cpu;
+
+	spin_lock_irqsave(&smp_lock, flags);
+
+	for_each_cpu(cpu, mask)
+		jz4780_send_ipi_single_locked(cpu, action);
+
+	spin_unlock_irqrestore(&smp_lock, flags);
+}
+
+static struct plat_smp_ops jz4780_smp_ops = {
+	.send_ipi_single = jz4780_send_ipi_single,
+	.send_ipi_mask = jz4780_send_ipi_mask,
+	.init_secondary = jz4780_init_secondary,
+	.smp_finish = jz4780_smp_finish,
+	.boot_secondary = jz4780_boot_secondary,
+	.smp_setup = jz4780_smp_setup,
+	.prepare_cpus = jz4780_smp_prepare_cpus,
+};
+
+void jz4780_smp_init(void)
+{
+	register_smp_ops(&jz4780_smp_ops);
+}
diff --git a/arch/mips/kernel/idle.c b/arch/mips/kernel/idle.c
index 37f8e78..a406de3 100644
--- a/arch/mips/kernel/idle.c
+++ b/arch/mips/kernel/idle.c
@@ -19,6 +19,10 @@
 #include <asm/idle.h>
 #include <asm/mipsregs.h>
 
+#ifdef CONFIG_MACH_JZ4780
+# include <asm/mach-jz4740/jz4780-smp.h>
+#endif
+
 /*
  * Not all of the MIPS CPUs have the "wait" instruction available. Moreover,
  * the implementation of the "wait" feature differs between CPU families. This
@@ -172,7 +176,6 @@ void __init check_wait(void)
 	case CPU_CAVIUM_OCTEON_PLUS:
 	case CPU_CAVIUM_OCTEON2:
 	case CPU_CAVIUM_OCTEON3:
-	case CPU_XBURST:
 	case CPU_LOONGSON32:
 	case CPU_XLR:
 	case CPU_XLP:
@@ -246,6 +249,15 @@ void __init check_wait(void)
 		   cpu_wait = r4k_wait;
 		 */
 		break;
+	case CPU_XBURST:
+#if defined(CONFIG_MACH_JZ4780) && defined(CONFIG_SMP)
+		if (NR_CPUS > 1)
+			cpu_wait = jz4780_smp_wait_irqoff;
+		else
+			cpu_wait = r4k_wait;
+#else
+		cpu_wait = r4k_wait;
+#endif
 	default:
 		break;
 	}
-- 
2.7.4

