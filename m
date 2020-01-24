Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C441B14850E
	for <lists+linux-mips@lfdr.de>; Fri, 24 Jan 2020 13:18:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730682AbgAXMR6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Jan 2020 07:17:58 -0500
Received: from forward101o.mail.yandex.net ([37.140.190.181]:47013 "EHLO
        forward101o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730037AbgAXMR6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 24 Jan 2020 07:17:58 -0500
Received: from mxback4g.mail.yandex.net (mxback4g.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:165])
        by forward101o.mail.yandex.net (Yandex) with ESMTP id 702EE3C02141;
        Fri, 24 Jan 2020 15:17:49 +0300 (MSK)
Received: from myt4-07bed427b9db.qloud-c.yandex.net (myt4-07bed427b9db.qloud-c.yandex.net [2a02:6b8:c00:887:0:640:7be:d427])
        by mxback4g.mail.yandex.net (mxback/Yandex) with ESMTP id 8clbfvkAQJ-HlMumOnm;
        Fri, 24 Jan 2020 15:17:49 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1579868269;
        bh=SkQRh3tt4zAWBa4JBX6TRbor9WaPmaTtHy84dsdVgYI=;
        h=From:To:Subject:CC:References:Date:In-Reply-To:Message-ID;
        b=iuM3ri7C7COHJb0bcIBVviN+bnygndk9G+tRatFguvxXSVau9r94Cl2p3/RdDhbhc
         ZdL7N4Xm+wvHLr3gJ/H6Nsvl/imlopkbS5CB7ddeZ/Qo8FkgVUZlFW/ZfjXfcJpYPU
         iRfr3rsRb6GKTsGR3LJOcePUvR9/GhfgFu5ORMd4=
Authentication-Results: mxback4g.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by myt4-07bed427b9db.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id oYazNvl0FA-HiUuXZrM;
        Fri, 24 Jan 2020 15:17:44 +0300
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client certificate not present)
Date:   Fri, 24 Jan 2020 20:17:35 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <1579867508-81499-3-git-send-email-zhouyanjie@wanyeetech.com>
References: <1579867508-81499-1-git-send-email-zhouyanjie@wanyeetech.com> <1579867508-81499-3-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 1/6] MIPS: JZ4780: Introduce SMP support.
To:     =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>, linux-mips@vger.kernel.org
CC:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, paulburton@kernel.org,
        jhogan@kernel.org, tglx@linutronix.de, daniel.lezcano@linaro.org,
        shawnguo@kernel.org, mark.rutland@arm.com, syq@debian.org,
        ralf@linux-mips.org, miquel.raynal@bootlin.com,
        keescook@chromium.org, ebiederm@xmission.com, krzk@kernel.org,
        geert+renesas@glider.be, paul@crapouillou.net,
        prasannatsmkumar@gmail.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, mturquette@baylibre.com, sboyd@kernel.org,
        chenhc@lemote.com, paul@boddie.org.uk, hns@goldelico.com,
        mips-creator-ci20-dev@googlegroups.com, rick.tyliu@ingenic.com
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <F90879F9-1CA8-4292-AC4D-B0E8E9D01AF2@flygoat.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B41=E6=9C=8824=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=888=
:05:03, "=E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie)" <zhouyanjie@wanyeetech=
=2Ecom> =E5=86=99=E5=88=B0:
>Forward port smp support from kernel 3=2E18=2E3 of CI20_linux
>to upstream kernel 5=2E5=2E
>
>Tested-by: H=2E Nikolaus Schaller <hns@goldelico=2Ecom>
>Tested-by: Paul Boddie <paul@boddie=2Eorg=2Euk>
>Signed-off-by: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@wany=
eetech=2Ecom>

Happy Chinese Newyear!

Reviewed-by: Jiaxun Yang <jiaxun=2Eyang@flygoat=2Ecom>


>---
>
>Notes:
>    v1-v2:
>    1=2ERemove unnecessary "plat_irq_dispatch(void)" in irq-ingenic=2Ec=
=2E
>2=2EAdd a timeout check for "jz4780_boot_secondary()" to avoid a dead
>loop=2E
>    3=2EReplace hard code in smp=2Ec with macro=2E
>   =20
>    v2->v3:
> 1=2ERemove unnecessary "extern void (*r4k_blast_dcache)(void)" in smp=2E=
c=2E
>2=2EUse "for_each_of_cpu_node" instead "for_each_compatible_node" in
>smp=2Ec=2E
>3=2EUse "of_cpu_node_to_id" instead "of_property_read_u32_index" in
>smp=2Ec=2E
>    4=2EMove LCR related operations to jz4780-cgu=2Ec=2E
>
> arch/mips/include/asm/mach-jz4740/jz4780-smp=2Eh |  91 ++++++++
> arch/mips/jz4740/Kconfig                       |   3 +
> arch/mips/jz4740/Makefile                      |   5 +
> arch/mips/jz4740/prom=2Ec                        |   4 +
> arch/mips/jz4740/smp-entry=2ES                   |  57 +++++
>arch/mips/jz4740/smp=2Ec                         | 286
>+++++++++++++++++++++++++
> arch/mips/kernel/idle=2Ec                        |  14 +-
> drivers/clk/ingenic/jz4780-cgu=2Ec               |  58 ++++-
> 8 files changed, 512 insertions(+), 6 deletions(-)
> create mode 100644 arch/mips/include/asm/mach-jz4740/jz4780-smp=2Eh
> create mode 100644 arch/mips/jz4740/smp-entry=2ES
> create mode 100644 arch/mips/jz4740/smp=2Ec
>
>diff --git a/arch/mips/include/asm/mach-jz4740/jz4780-smp=2Eh
>b/arch/mips/include/asm/mach-jz4740/jz4780-smp=2Eh
>new file mode 100644
>index 00000000=2E=2E3f592ce
>--- /dev/null
>+++ b/arch/mips/include/asm/mach-jz4740/jz4780-smp=2Eh
>@@ -0,0 +1,91 @@
>+/* SPDX-License-Identifier: GPL-2=2E0-or-later */
>+/*
>+ *  Copyright (C) 2013, Paul Burton <paul=2Eburton@imgtec=2Ecom>
>+ *  JZ4780 SMP definitions
>+ */
>+
>+#ifndef __MIPS_ASM_MACH_JZ4740_JZ4780_SMP_H__
>+#define __MIPS_ASM_MACH_JZ4740_JZ4780_SMP_H__
>+
>+#define read_c0_corectrl()		__read_32bit_c0_register($12, 2)
>+#define write_c0_corectrl(val)		__write_32bit_c0_register($12, 2, val)
>+
>+#define read_c0_corestatus()		__read_32bit_c0_register($12, 3)
>+#define write_c0_corestatus(val)	__write_32bit_c0_register($12, 3,
>val)
>+
>+#define read_c0_reim()			__read_32bit_c0_register($12, 4)
>+#define write_c0_reim(val)		__write_32bit_c0_register($12, 4, val)
>+
>+#define read_c0_mailbox0()		__read_32bit_c0_register($20, 0)
>+#define write_c0_mailbox0(val)		__write_32bit_c0_register($20, 0, val)
>+
>+#define read_c0_mailbox1()		__read_32bit_c0_register($20, 1)
>+#define write_c0_mailbox1(val)		__write_32bit_c0_register($20, 1, val)
>+
>+#define smp_clr_pending(mask) do {		\
>+		unsigned int stat;		\
>+		stat =3D read_c0_corestatus();	\
>+		stat &=3D ~((mask) & 0xff);	\
>+		write_c0_corestatus(stat);	\
>+	} while (0)
>+
>+/*
>+ * Core Control register
>+ */
>+#define CORECTRL_SLEEP1M_SHIFT	17
>+#define CORECTRL_SLEEP1M	(_ULCAST_(0x1) << CORECTRL_SLEEP1M_SHIFT)
>+#define CORECTRL_SLEEP0M_SHIFT	16
>+#define CORECTRL_SLEEP0M	(_ULCAST_(0x1) << CORECTRL_SLEEP0M_SHIFT)
>+#define CORECTRL_RPC1_SHIFT	9
>+#define CORECTRL_RPC1		(_ULCAST_(0x1) << CORECTRL_RPC1_SHIFT)
>+#define CORECTRL_RPC0_SHIFT	8
>+#define CORECTRL_RPC0		(_ULCAST_(0x1) << CORECTRL_RPC0_SHIFT)
>+#define CORECTRL_SWRST1_SHIFT	1
>+#define CORECTRL_SWRST1		(_ULCAST_(0x1) << CORECTRL_SWRST1_SHIFT)
>+#define CORECTRL_SWRST0_SHIFT	0
>+#define CORECTRL_SWRST0		(_ULCAST_(0x1) << CORECTRL_SWRST0_SHIFT)
>+
>+/*
>+ * Core Status register
>+ */
>+#define CORESTATUS_SLEEP1_SHIFT	17
>+#define CORESTATUS_SLEEP1	(_ULCAST_(0x1) << CORESTATUS_SLEEP1_SHIFT)
>+#define CORESTATUS_SLEEP0_SHIFT	16
>+#define CORESTATUS_SLEEP0	(_ULCAST_(0x1) << CORESTATUS_SLEEP0_SHIFT)
>+#define CORESTATUS_IRQ1P_SHIFT	9
>+#define CORESTATUS_IRQ1P	(_ULCAST_(0x1) << CORESTATUS_IRQ1P_SHIFT)
>+#define CORESTATUS_IRQ0P_SHIFT	8
>+#define CORESTATUS_IRQ0P	(_ULCAST_(0x1) << CORESTATUS_IRQ8P_SHIFT)
>+#define CORESTATUS_MIRQ1P_SHIFT	1
>+#define CORESTATUS_MIRQ1P	(_ULCAST_(0x1) << CORESTATUS_MIRQ1P_SHIFT)
>+#define CORESTATUS_MIRQ0P_SHIFT	0
>+#define CORESTATUS_MIRQ0P	(_ULCAST_(0x1) << CORESTATUS_MIRQ0P_SHIFT)
>+
>+/*
>+ * Reset Entry & IRQ Mask register
>+ */
>+#define REIM_ENTRY_SHIFT	16
>+#define REIM_ENTRY		(_ULCAST_(0xffff) << REIM_ENTRY_SHIFT)
>+#define REIM_IRQ1M_SHIFT	9
>+#define REIM_IRQ1M		(_ULCAST_(0x1) << REIM_IRQ1M_SHIFT)
>+#define REIM_IRQ0M_SHIFT	8
>+#define REIM_IRQ0M		(_ULCAST_(0x1) << REIM_IRQ0M_SHIFT)
>+#define REIM_MBOXIRQ1M_SHIFT	1
>+#define REIM_MBOXIRQ1M		(_ULCAST_(0x1) << REIM_MBOXIRQ1M_SHIFT)
>+#define REIM_MBOXIRQ0M_SHIFT	0
>+#define REIM_MBOXIRQ0M		(_ULCAST_(0x1) << REIM_MBOXIRQ0M_SHIFT)
>+
>+#ifdef CONFIG_SMP
>+
>+extern void jz4780_smp_wait_irqoff(void);
>+
>+extern void jz4780_smp_init(void);
>+extern void jz4780_secondary_cpu_entry(void);
>+
>+#else /* !CONFIG_SMP */
>+
>+static inline void jz4780_smp_init(void) { }
>+
>+#endif /* !CONFIG_SMP */
>+
>+#endif /* __MIPS_ASM_MACH_JZ4740_JZ4780_SMP_H__ */
>diff --git a/arch/mips/jz4740/Kconfig b/arch/mips/jz4740/Kconfig
>index 412d2fa=2E=2E0239597 100644
>--- a/arch/mips/jz4740/Kconfig
>+++ b/arch/mips/jz4740/Kconfig
>@@ -34,9 +34,12 @@ config MACH_JZ4770
>=20
> config MACH_JZ4780
> 	bool
>+	select GENERIC_CLOCKEVENTS_BROADCAST if SMP
> 	select MIPS_CPU_SCACHE
>+	select NR_CPUS_DEFAULT_2
> 	select SYS_HAS_CPU_MIPS32_R2
> 	select SYS_SUPPORTS_HIGHMEM
>+	select SYS_SUPPORTS_SMP
>=20
> config MACH_X1000
> 	bool
>diff --git a/arch/mips/jz4740/Makefile b/arch/mips/jz4740/Makefile
>index 6de14c0=2E=2E0a0f024 100644
>--- a/arch/mips/jz4740/Makefile
>+++ b/arch/mips/jz4740/Makefile
>@@ -12,3 +12,8 @@ CFLAGS_setup=2Eo =3D -I$(src)/=2E=2E/=2E=2E/=2E=2E/scri=
pts/dtc/libfdt
> # PM support
>=20
> obj-$(CONFIG_PM) +=3D pm=2Eo
>+
>+# SMP support
>+
>+obj-$(CONFIG_SMP) +=3D smp=2Eo
>+obj-$(CONFIG_SMP) +=3D smp-entry=2Eo
>diff --git a/arch/mips/jz4740/prom=2Ec b/arch/mips/jz4740/prom=2Ec
>index ff4555c=2E=2Ea79159e 100644
>--- a/arch/mips/jz4740/prom=2Ec
>+++ b/arch/mips/jz4740/prom=2Ec
>@@ -8,10 +8,14 @@
>=20
> #include <asm/bootinfo=2Eh>
> #include <asm/fw/fw=2Eh>
>+#include <asm/mach-jz4740/jz4780-smp=2Eh>
>=20
> void __init prom_init(void)
> {
> 	fw_init_cmdline();
>+#if defined(CONFIG_MACH_JZ4780) && defined(CONFIG_SMP)
>+	jz4780_smp_init();
>+#endif
> }
>=20
> void __init prom_free_prom_memory(void)
>diff --git a/arch/mips/jz4740/smp-entry=2ES
>b/arch/mips/jz4740/smp-entry=2ES
>new file mode 100644
>index 00000000=2E=2E20049a3
>--- /dev/null
>+++ b/arch/mips/jz4740/smp-entry=2ES
>@@ -0,0 +1,57 @@
>+/* SPDX-License-Identifier: GPL-2=2E0-or-later */
>+/*
>+ *  Copyright (C) 2013, Paul Burton <paul=2Eburton@imgtec=2Ecom>
>+ *  JZ4780 SMP entry point
>+ */
>+
>+#include <asm/addrspace=2Eh>
>+#include <asm/asm=2Eh>
>+#include <asm/asmmacro=2Eh>
>+#include <asm/cacheops=2Eh>
>+#include <asm/mipsregs=2Eh>
>+
>+#define CACHE_SIZE (32 * 1024)
>+#define CACHE_LINESIZE 32
>+
>+=2Eextern jz4780_cpu_entry_sp
>+=2Eextern jz4780_cpu_entry_gp
>+
>+=2Esection =2Etext=2Esmp-entry
>+=2Ebalign 0x10000
>+=2Eset noreorder
>+LEAF(jz4780_secondary_cpu_entry)
>+	mtc0	zero, CP0_CAUSE
>+
>+	li	t0, ST0_CU0
>+	mtc0	t0, CP0_STATUS
>+
>+	/* cache setup */
>+	li	t0, KSEG0
>+	ori	t1, t0, CACHE_SIZE
>+	mtc0	zero, CP0_TAGLO, 0
>+1:	cache	Index_Store_Tag_I, 0(t0)
>+	cache	Index_Store_Tag_D, 0(t0)
>+	bne	t0, t1, 1b
>+	 addiu	t0, t0, CACHE_LINESIZE
>+
>+	/* kseg0 cache attribute */
>+	mfc0	t0, CP0_CONFIG, 0
>+	ori	t0, t0, CONF_CM_CACHABLE_NONCOHERENT
>+	mtc0	t0, CP0_CONFIG, 0
>+
>+	/* pagemask */
>+	mtc0	zero, CP0_PAGEMASK, 0
>+
>+	/* retrieve sp */
>+	la	t0, jz4780_cpu_entry_sp
>+	lw	sp, 0(t0)
>+
>+	/* retrieve gp */
>+	la	t0, jz4780_cpu_entry_gp
>+	lw	gp, 0(t0)
>+
>+	/* jump to the kernel in kseg0 */
>+	la	t0, smp_bootstrap
>+	jr	t0
>+	 nop
>+	END(jz4780_secondary_cpu_entry)
>diff --git a/arch/mips/jz4740/smp=2Ec b/arch/mips/jz4740/smp=2Ec
>new file mode 100644
>index 00000000=2E=2E19b75c2
>--- /dev/null
>+++ b/arch/mips/jz4740/smp=2Ec
>@@ -0,0 +1,286 @@
>+// SPDX-License-Identifier: GPL-2=2E0
>+/*
>+ *  Copyright (C) 2013, Paul Burton <paul=2Eburton@imgtec=2Ecom>
>+ *  JZ4780 SMP
>+ */
>+
>+#include <linux/clk=2Eh>
>+#include <linux/delay=2Eh>
>+#include <linux/interrupt=2Eh>
>+#include <linux/of=2Eh>
>+#include <linux/sched=2Eh>
>+#include <linux/sched/task_stack=2Eh>
>+#include <linux/smp=2Eh>
>+#include <linux/tick=2Eh>
>+#include <asm/mach-jz4740/jz4780-smp=2Eh>
>+#include <asm/r4kcache=2Eh>
>+#include <asm/smp-ops=2Eh>
>+
>+static struct clk *cpu_clock_gates[CONFIG_NR_CPUS] =3D { NULL };
>+
>+u32 jz4780_cpu_entry_sp;
>+u32 jz4780_cpu_entry_gp;
>+
>+static struct cpumask cpu_running;
>+
>+static DEFINE_SPINLOCK(smp_lock);
>+
>+/*
>+ * The Ingenic jz4780 SMP variant has to write back dirty cache lines
>before
>+ * executing wait=2E The CPU & cache clock will be gated until we return
>from
>+ * the wait, and if another core attempts to access data from our data
>cache
>+ * during this time then it will lock up=2E
>+ */
>+void jz4780_smp_wait_irqoff(void)
>+{
>+	unsigned long pending =3D read_c0_cause() & read_c0_status() &
>CAUSEF_IP;
>+
>+	/*
>+	 * Going to idle has a significant overhead due to the cache flush so
>+	 * try to avoid it if we'll immediately be woken again due to an IRQ=2E
>+	 */
>+	if (!need_resched() && !pending) {
>+		r4k_blast_dcache();
>+
>+		__asm__(
>+		"	=2Eset push	\n"
>+		"	=2Eset mips3	\n"
>+		"	sync		\n"
>+		"	wait		\n"
>+		"	=2Eset pop	\n");
>+	}
>+
>+	local_irq_enable();
>+}
>+
>+static irqreturn_t mbox_handler(int irq, void *dev_id)
>+{
>+	int cpu =3D smp_processor_id();
>+	u32 action, status;
>+
>+	spin_lock(&smp_lock);
>+
>+	switch (cpu) {
>+	case 0:
>+		action =3D read_c0_mailbox0();
>+		write_c0_mailbox0(0);
>+		break;
>+	case 1:
>+		action =3D read_c0_mailbox1();
>+		write_c0_mailbox1(0);
>+		break;
>+	default:
>+		panic("unhandled cpu %d!", cpu);
>+	}
>+
>+	/* clear pending mailbox interrupt */
>+	status =3D read_c0_corestatus();
>+	status &=3D ~(CORESTATUS_MIRQ0P << cpu);
>+	write_c0_corestatus(status);
>+
>+	spin_unlock(&smp_lock);
>+
>+	if (action & SMP_RESCHEDULE_YOURSELF)
>+		scheduler_ipi();
>+	if (action & SMP_CALL_FUNCTION)
>+		generic_smp_call_function_interrupt();
>+
>+	return IRQ_HANDLED;
>+}
>+
>+static struct irqaction mbox_action =3D {
>+	=2Ehandler =3D mbox_handler,
>+	=2Ename =3D "core mailbox",
>+	=2Eflags =3D IRQF_PERCPU | IRQF_NO_THREAD,
>+};
>+
>+static void jz4780_smp_setup(void)
>+{
>+	u32 addr, reim;
>+	int cpu;
>+
>+	reim =3D read_c0_reim();
>+
>+	for (cpu =3D 0; cpu < NR_CPUS; cpu++) {
>+		__cpu_number_map[cpu] =3D cpu;
>+		__cpu_logical_map[cpu] =3D cpu;
>+		set_cpu_possible(cpu, true);
>+	}
>+
>+	/* mask mailbox interrupts for this core */
>+	reim &=3D ~REIM_MBOXIRQ0M;
>+	write_c0_reim(reim);
>+
>+	/* clear mailboxes & pending mailbox IRQs */
>+	write_c0_mailbox0(0);
>+	write_c0_mailbox1(0);
>+	write_c0_corestatus(0);
>+
>+	/* set reset entry point */
>+	addr =3D KSEG1ADDR((u32)&jz4780_secondary_cpu_entry);
>+	WARN_ON(addr & ~REIM_ENTRY);
>+	reim &=3D ~REIM_ENTRY;
>+	reim |=3D addr & REIM_ENTRY;
>+
>+	/* unmask mailbox interrupts for this core */
>+	reim |=3D REIM_MBOXIRQ0M;
>+	write_c0_reim(reim);
>+	set_c0_status(STATUSF_IP3);
>+	irq_enable_hazard();
>+
>+	cpumask_set_cpu(cpu, &cpu_running);
>+}
>+
>+static void jz4780_smp_prepare_cpus(unsigned int max_cpus)
>+{
>+	struct device_node *cpu_node;
>+	unsigned cpu, ctrl;
>+	int err;
>+
>+	/* setup the mailbox IRQ */
>+	setup_irq(MIPS_CPU_IRQ_BASE + 3, &mbox_action);
>+
>+	init_cpu_present(cpu_possible_mask);
>+
>+	ctrl =3D read_c0_corectrl();
>+
>+	for (cpu =3D 0; cpu < max_cpus; cpu++) {
>+		/* use reset entry point from REIM register */
>+		ctrl |=3D CORECTRL_RPC0 << cpu;
>+	}
>+
>+	for_each_of_cpu_node(cpu_node) {
>+		cpu =3D of_cpu_node_to_id(cpu_node);
>+		if (cpu < 0) {
>+			pr_err("Failed to read index of %s\n",
>+			       cpu_node->full_name);
>+			continue;
>+		}
>+
>+		cpu_clock_gates[cpu] =3D of_clk_get(cpu_node, 0);
>+		if (IS_ERR(cpu_clock_gates[cpu])) {
>+			cpu_clock_gates[cpu] =3D NULL;
>+			continue;
>+		}
>+
>+		err =3D clk_prepare(cpu_clock_gates[cpu]);
>+		if (err)
>+			pr_err("Failed to prepare CPU clock gate\n");
>+	}
>+
>+	write_c0_corectrl(ctrl);
>+}
>+
>+static int jz4780_boot_secondary(int cpu, struct task_struct *idle)
>+{
>+	unsigned long flags;
>+	u32 ctrl;
>+
>+	spin_lock_irqsave(&smp_lock, flags);
>+
>+	/* ensure the core is in reset */
>+	ctrl =3D read_c0_corectrl();
>+	ctrl |=3D CORECTRL_SWRST0 << cpu;
>+	write_c0_corectrl(ctrl);
>+
>+	/* ungate core clock */
>+	if (cpu_clock_gates[cpu])
>+		clk_enable(cpu_clock_gates[cpu]);
>+
>+	/* set entry sp/gp register values */
>+	jz4780_cpu_entry_sp =3D __KSTK_TOS(idle);
>+	jz4780_cpu_entry_gp =3D (u32)task_thread_info(idle);
>+	smp_wmb();
>+
>+	/* take the core out of reset */
>+	ctrl &=3D ~(CORECTRL_SWRST0 << cpu);
>+	write_c0_corectrl(ctrl);
>+
>+	cpumask_set_cpu(cpu, &cpu_running);
>+
>+	spin_unlock_irqrestore(&smp_lock, flags);
>+
>+	return 0;
>+}
>+
>+static void jz4780_init_secondary(void)
>+{
>+}
>+
>+static void jz4780_smp_finish(void)
>+{
>+	u32 reim;
>+
>+	spin_lock(&smp_lock);
>+
>+	/* unmask mailbox interrupts for this core */
>+	reim =3D read_c0_reim();
>+	reim |=3D REIM_MBOXIRQ0M << smp_processor_id();
>+	write_c0_reim(reim);
>+
>+	spin_unlock(&smp_lock);
>+
>+	/* unmask interrupts for this core */
>+	change_c0_status(ST0_IM, STATUSF_IP3 | STATUSF_IP2 |
>+			 STATUSF_IP1 | STATUSF_IP0);
>+	irq_enable_hazard();
>+
>+	/* force broadcast timer */
>+	tick_broadcast_force();
>+}
>+
>+static void jz4780_send_ipi_single_locked(int cpu, unsigned int
>action)
>+{
>+	u32 mbox;
>+
>+	switch (cpu) {
>+	case 0:
>+		mbox =3D read_c0_mailbox0();
>+		write_c0_mailbox0(mbox | action);
>+		break;
>+	case 1:
>+		mbox =3D read_c0_mailbox1();
>+		write_c0_mailbox1(mbox | action);
>+		break;
>+	default:
>+		panic("unhandled cpu %d!", cpu);
>+	}
>+}
>+
>+static void jz4780_send_ipi_single(int cpu, unsigned int action)
>+{
>+	unsigned long flags;
>+
>+	spin_lock_irqsave(&smp_lock, flags);
>+	jz4780_send_ipi_single_locked(cpu, action);
>+	spin_unlock_irqrestore(&smp_lock, flags);
>+}
>+
>+static void jz4780_send_ipi_mask(const struct cpumask *mask,
>+				 unsigned int action)
>+{
>+	unsigned long flags;
>+	int cpu;
>+
>+	spin_lock_irqsave(&smp_lock, flags);
>+
>+	for_each_cpu(cpu, mask)
>+		jz4780_send_ipi_single_locked(cpu, action);
>+
>+	spin_unlock_irqrestore(&smp_lock, flags);
>+}
>+
>+static struct plat_smp_ops jz4780_smp_ops =3D {
>+	=2Esend_ipi_single =3D jz4780_send_ipi_single,
>+	=2Esend_ipi_mask =3D jz4780_send_ipi_mask,
>+	=2Einit_secondary =3D jz4780_init_secondary,
>+	=2Esmp_finish =3D jz4780_smp_finish,
>+	=2Eboot_secondary =3D jz4780_boot_secondary,
>+	=2Esmp_setup =3D jz4780_smp_setup,
>+	=2Eprepare_cpus =3D jz4780_smp_prepare_cpus,
>+};
>+
>+void jz4780_smp_init(void)
>+{
>+	register_smp_ops(&jz4780_smp_ops);
>+}
>diff --git a/arch/mips/kernel/idle=2Ec b/arch/mips/kernel/idle=2Ec
>index 37f8e78=2E=2Ea406de3 100644
>--- a/arch/mips/kernel/idle=2Ec
>+++ b/arch/mips/kernel/idle=2Ec
>@@ -19,6 +19,10 @@
> #include <asm/idle=2Eh>
> #include <asm/mipsregs=2Eh>
>=20
>+#ifdef CONFIG_MACH_JZ4780
>+# include <asm/mach-jz4740/jz4780-smp=2Eh>
>+#endif
>+
> /*
>* Not all of the MIPS CPUs have the "wait" instruction available=2E
>Moreover,
>* the implementation of the "wait" feature differs between CPU
>families=2E This
>@@ -172,7 +176,6 @@ void __init check_wait(void)
> 	case CPU_CAVIUM_OCTEON_PLUS:
> 	case CPU_CAVIUM_OCTEON2:
> 	case CPU_CAVIUM_OCTEON3:
>-	case CPU_XBURST:
> 	case CPU_LOONGSON32:
> 	case CPU_XLR:
> 	case CPU_XLP:
>@@ -246,6 +249,15 @@ void __init check_wait(void)
> 		   cpu_wait =3D r4k_wait;
> 		 */
> 		break;
>+	case CPU_XBURST:
>+#if defined(CONFIG_MACH_JZ4780) && defined(CONFIG_SMP)
>+		if (NR_CPUS > 1)
>+			cpu_wait =3D jz4780_smp_wait_irqoff;
>+		else
>+			cpu_wait =3D r4k_wait;
>+#else
>+		cpu_wait =3D r4k_wait;
>+#endif
> 	default:
> 		break;
> 	}
>diff --git a/drivers/clk/ingenic/jz4780-cgu=2Ec
>b/drivers/clk/ingenic/jz4780-cgu=2Ec
>index ea905ff=2E=2Ef3eb795 100644
>--- a/drivers/clk/ingenic/jz4780-cgu=2Ec
>+++ b/drivers/clk/ingenic/jz4780-cgu=2Ec
>@@ -16,7 +16,7 @@
>=20
> /* CGU register offsets */
> #define CGU_REG_CLOCKCONTROL	0x00
>-#define CGU_REG_PLLCONTROL	0x0c
>+#define CGU_REG_LCR			0x04
> #define CGU_REG_APLL		0x10
> #define CGU_REG_MPLL		0x14
> #define CGU_REG_EPLL		0x18
>@@ -46,8 +46,8 @@
> #define CGU_REG_CLOCKSTATUS	0xd4
>=20
> /* bits within the OPCR register */
>-#define OPCR_SPENDN0		(1 << 7)
>-#define OPCR_SPENDN1		(1 << 6)
>+#define OPCR_SPENDN0		BIT(7)
>+#define OPCR_SPENDN1		BIT(6)
>=20
> /* bits within the USBPCR register */
> #define USBPCR_USB_MODE		BIT(31)
>@@ -88,6 +88,13 @@
> #define USBVBFIL_IDDIGFIL_MASK	(0xffff << USBVBFIL_IDDIGFIL_SHIFT)
> #define USBVBFIL_USBVBFIL_MASK	(0xffff)
>=20
>+/* bits within the LCR register */
>+#define LCR_PD_SCPU			BIT(31)
>+#define LCR_SCPUS			BIT(27)
>+
>+/* bits within the CLKGR1 register */
>+#define CLKGR1_CORE1		BIT(15)
>+
> static struct ingenic_cgu *cgu;
>=20
> static u8 jz4780_otg_phy_get_parent(struct clk_hw *hw)
>@@ -205,6 +212,47 @@ static const struct clk_ops jz4780_otg_phy_ops =3D {
> 	=2Eset_rate =3D jz4780_otg_phy_set_rate,
> };
>=20
>+static int jz4780_core1_enable(struct clk_hw *hw)
>+{
>+	struct ingenic_clk *ingenic_clk =3D to_ingenic_clk(hw);
>+	struct ingenic_cgu *cgu =3D ingenic_clk->cgu;
>+	const unsigned int timeout =3D 100;
>+	unsigned long flags;
>+	unsigned int i;
>+	u32 lcr, clkgr1;
>+
>+	spin_lock_irqsave(&cgu->lock, flags);
>+
>+	lcr =3D readl(cgu->base + CGU_REG_LCR);
>+	lcr &=3D ~LCR_PD_SCPU;
>+	writel(lcr, cgu->base + CGU_REG_LCR);
>+
>+	clkgr1 =3D readl(cgu->base + CGU_REG_CLKGR1);
>+	clkgr1 &=3D ~CLKGR1_CORE1;
>+	writel(clkgr1, cgu->base + CGU_REG_CLKGR1);
>+
>+	spin_unlock_irqrestore(&cgu->lock, flags);
>+
>+	/* wait for the CPU to be powered up */
>+	for (i =3D 0; i < timeout; i++) {
>+		lcr =3D readl(cgu->base + CGU_REG_LCR);
>+		if (!(lcr & LCR_SCPUS))
>+			break;
>+		mdelay(1);
>+	}
>+
>+	if (i =3D=3D timeout) {
>+		pr_err("%s: Wait for power up core1 timeout\n", __func__);
>+		return -EBUSY;
>+	}
>+
>+	return 0;
>+}
>+
>+static const struct clk_ops jz4780_core1_ops =3D {
>+	=2Eenable =3D jz4780_core1_enable,
>+};
>+
> static const s8 pll_od_encoding[16] =3D {
> 	0x0, 0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7,
> 	0x8, 0x9, 0xa, 0xb, 0xc, 0xd, 0xe, 0xf,
>@@ -699,9 +747,9 @@ static const struct ingenic_cgu_clk_info
>jz4780_cgu_clocks[] =3D {
> 	},
>=20
> 	[JZ4780_CLK_CORE1] =3D {
>-		"core1", CGU_CLK_GATE,
>+		"core1", CGU_CLK_CUSTOM,
> 		=2Eparents =3D { JZ4780_CLK_CPU, -1, -1, -1 },
>-		=2Egate =3D { CGU_REG_CLKGR1, 15 },
>+		=2Ecustom =3D { &jz4780_core1_ops },
> 	},
>=20
> };

--=20
Jiaxun Yang
