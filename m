Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC296166648
	for <lists+linux-mips@lfdr.de>; Thu, 20 Feb 2020 19:28:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728654AbgBTS2D (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 20 Feb 2020 13:28:03 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:38840 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728111AbgBTS2D (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 20 Feb 2020 13:28:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1582223280; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qS+C2RRxc94REY8Frsza+FKQ4h+JmTy5BStexGqo8Yg=;
        b=uPKMxgVss3t86TCKsvDMgLko4tvwsWaK/LxQc7CuzlTDnWwKsiH6z6k9nMpW9pMdpDharu
        p15+IRZm/5OieagBJVzLswVcXvTj64/MfxsolDMl7tCLyCIWUU18HBc7lN6fG1mtnCNBRV
        hlWhFe02jsmCBmoTpQ5ZNxLgIMUMeYY=
Date:   Thu, 20 Feb 2020 15:27:35 -0300
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v6 2/7] MIPS: JZ4780: Introduce SMP support.
To:     =?UTF-8?b?5ZGo55Cw5p2w?= "(Zhou Yanjie)" 
        <zhouyanjie@wanyeetech.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        tglx@linutronix.de, ralf@linux-mips.org, paulburton@kernel.org,
        jiaxun.yang@flygoat.com, chenhc@lemote.com, sboyd@kernel.org,
        mturquette@baylibre.com, mark.rutland@arm.com, robh+dt@kernel.org,
        daniel.lezcano@linaro.org, geert+renesas@glider.be,
        krzk@kernel.org, ebiederm@xmission.com, miquel.raynal@bootlin.com,
        keescook@chromium.org, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, dongsheng.qiu@ingenic.com
Message-Id: <1582223255.3.1@crapouillou.net>
In-Reply-To: <1582215889-113034-4-git-send-email-zhouyanjie@wanyeetech.com>
References: <1582215889-113034-1-git-send-email-zhouyanjie@wanyeetech.com>
        <1582215889-113034-4-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,


Le ven., f=C3=A9vr. 21, 2020 at 00:24, =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Ya=
njie)=20
<zhouyanjie@wanyeetech.com> a =C3=A9crit :
> Forward port smp support from kernel 3.18.3 of CI20_linux
> to upstream kernel 5.6.
>=20
> Tested-by: H. Nikolaus Schaller <hns@goldelico.com>
> Tested-by: Paul Boddie <paul@boddie.org.uk>
> Signed-off-by: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@wany=
eetech.com>
> Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>=20
> Notes:
>     v1->v2:
>     1.Remove unnecessary "plat_irq_dispatch(void)" in irq-ingenic.c.
>     2.Add a timeout check for "jz4780_boot_secondary()" to avoid a=20
> dead loop.
>     3.Replace hard code in smp.c with macro.
>=20
>     v2->v3:
>     1.Remove unnecessary "extern void (*r4k_blast_dcache)(void)" in=20
> smp.c.
>     2.Use "for_each_of_cpu_node" instead "for_each_compatible_node"=20
> in smp.c.
>     3.Use "of_cpu_node_to_id" instead "of_property_read_u32_index" in=20
> smp.c.
>     4.Move LCR related operations to jz4780-cgu.c.
>=20
>     v3->v4:
>     Rebase on top of kernel 5.6-rc1.
>=20
>     v4->v5:
>     1.Splitting changes involving "jz4780-cgu.c" into separate commit.
>     2.Use "request_irq()" replace "setup_irq()".
>=20
>     v5->v6:
>     In order to have a kernel that works on multiple SoCs at the same
>     time, use "IS_ENABLED()" replace "#ifdef".
>=20
>  arch/mips/include/asm/mach-jz4740/smp.h |  81 ++++++++++
>  arch/mips/jz4740/Kconfig                |   3 +
>  arch/mips/jz4740/Makefile               |   5 +
>  arch/mips/jz4740/prom.c                 |   4 +
>  arch/mips/jz4740/smp-entry.S            |  57 +++++++
>  arch/mips/jz4740/smp.c                  | 254=20
> ++++++++++++++++++++++++++++++++
>  arch/mips/kernel/idle.c                 |  36 ++++-
>  7 files changed, 439 insertions(+), 1 deletion(-)
>  create mode 100644 arch/mips/include/asm/mach-jz4740/smp.h
>  create mode 100644 arch/mips/jz4740/smp-entry.S
>  create mode 100644 arch/mips/jz4740/smp.c
>=20
> diff --git a/arch/mips/include/asm/mach-jz4740/smp.h=20
> b/arch/mips/include/asm/mach-jz4740/smp.h
> new file mode 100644
> index 00000000..af3c21b
> --- /dev/null
> +++ b/arch/mips/include/asm/mach-jz4740/smp.h
> @@ -0,0 +1,81 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + *  Copyright (C) 2013, Paul Burton <paul.burton@imgtec.com>
> + *  JZ4780 SMP definitions
> + */
> +
> +#ifndef __MIPS_ASM_MACH_JZ4740_JZ4780_SMP_H__
> +#define __MIPS_ASM_MACH_JZ4740_JZ4780_SMP_H__
> +
> +#define read_c0_corectrl()		__read_32bit_c0_register($12, 2)
> +#define write_c0_corectrl(val)		__write_32bit_c0_register($12, 2,=20
> val)
> +
> +#define read_c0_corestatus()		__read_32bit_c0_register($12, 3)
> +#define write_c0_corestatus(val)	__write_32bit_c0_register($12, 3,=20
> val)
> +
> +#define read_c0_reim()			__read_32bit_c0_register($12, 4)
> +#define write_c0_reim(val)		__write_32bit_c0_register($12, 4, val)
> +
> +#define read_c0_mailbox0()		__read_32bit_c0_register($20, 0)
> +#define write_c0_mailbox0(val)		__write_32bit_c0_register($20, 0,=20
> val)
> +
> +#define read_c0_mailbox1()		__read_32bit_c0_register($20, 1)
> +#define write_c0_mailbox1(val)		__write_32bit_c0_register($20, 1,=20
> val)
> +
> +#define smp_clr_pending(mask) do {		\
> +		unsigned int stat;		\
> +		stat =3D read_c0_corestatus();	\
> +		stat &=3D ~((mask) & 0xff);	\
> +		write_c0_corestatus(stat);	\
> +	} while (0)
> +
> +/*
> + * Core Control register
> + */
> +#define CORECTRL_SLEEP1M_SHIFT	17
> +#define CORECTRL_SLEEP1M	(_ULCAST_(0x1) << CORECTRL_SLEEP1M_SHIFT)
> +#define CORECTRL_SLEEP0M_SHIFT	16
> +#define CORECTRL_SLEEP0M	(_ULCAST_(0x1) << CORECTRL_SLEEP0M_SHIFT)
> +#define CORECTRL_RPC1_SHIFT	9
> +#define CORECTRL_RPC1		(_ULCAST_(0x1) << CORECTRL_RPC1_SHIFT)
> +#define CORECTRL_RPC0_SHIFT	8
> +#define CORECTRL_RPC0		(_ULCAST_(0x1) << CORECTRL_RPC0_SHIFT)
> +#define CORECTRL_SWRST1_SHIFT	1
> +#define CORECTRL_SWRST1		(_ULCAST_(0x1) << CORECTRL_SWRST1_SHIFT)
> +#define CORECTRL_SWRST0_SHIFT	0
> +#define CORECTRL_SWRST0		(_ULCAST_(0x1) << CORECTRL_SWRST0_SHIFT)
> +
> +/*
> + * Core Status register
> + */
> +#define CORESTATUS_SLEEP1_SHIFT	17
> +#define CORESTATUS_SLEEP1	(_ULCAST_(0x1) << CORESTATUS_SLEEP1_SHIFT)
> +#define CORESTATUS_SLEEP0_SHIFT	16
> +#define CORESTATUS_SLEEP0	(_ULCAST_(0x1) << CORESTATUS_SLEEP0_SHIFT)
> +#define CORESTATUS_IRQ1P_SHIFT	9
> +#define CORESTATUS_IRQ1P	(_ULCAST_(0x1) << CORESTATUS_IRQ1P_SHIFT)
> +#define CORESTATUS_IRQ0P_SHIFT	8
> +#define CORESTATUS_IRQ0P	(_ULCAST_(0x1) << CORESTATUS_IRQ8P_SHIFT)
> +#define CORESTATUS_MIRQ1P_SHIFT	1
> +#define CORESTATUS_MIRQ1P	(_ULCAST_(0x1) << CORESTATUS_MIRQ1P_SHIFT)
> +#define CORESTATUS_MIRQ0P_SHIFT	0
> +#define CORESTATUS_MIRQ0P	(_ULCAST_(0x1) << CORESTATUS_MIRQ0P_SHIFT)
> +
> +/*
> + * Reset Entry & IRQ Mask register
> + */
> +#define REIM_ENTRY_SHIFT	16
> +#define REIM_ENTRY		(_ULCAST_(0xffff) << REIM_ENTRY_SHIFT)
> +#define REIM_IRQ1M_SHIFT	9
> +#define REIM_IRQ1M		(_ULCAST_(0x1) << REIM_IRQ1M_SHIFT)
> +#define REIM_IRQ0M_SHIFT	8
> +#define REIM_IRQ0M		(_ULCAST_(0x1) << REIM_IRQ0M_SHIFT)
> +#define REIM_MBOXIRQ1M_SHIFT	1
> +#define REIM_MBOXIRQ1M		(_ULCAST_(0x1) << REIM_MBOXIRQ1M_SHIFT)
> +#define REIM_MBOXIRQ0M_SHIFT	0
> +#define REIM_MBOXIRQ0M		(_ULCAST_(0x1) << REIM_MBOXIRQ0M_SHIFT)
> +
> +extern void jz4780_smp_init(void);
> +extern void jz4780_secondary_cpu_entry(void);
> +
> +#endif /* __MIPS_ASM_MACH_JZ4740_JZ4780_SMP_H__ */
> diff --git a/arch/mips/jz4740/Kconfig b/arch/mips/jz4740/Kconfig
> index 412d2fa..0239597 100644
> --- a/arch/mips/jz4740/Kconfig
> +++ b/arch/mips/jz4740/Kconfig
> @@ -34,9 +34,12 @@ config MACH_JZ4770
>=20
>  config MACH_JZ4780
>  	bool
> +	select GENERIC_CLOCKEVENTS_BROADCAST if SMP
>  	select MIPS_CPU_SCACHE
> +	select NR_CPUS_DEFAULT_2
>  	select SYS_HAS_CPU_MIPS32_R2
>  	select SYS_SUPPORTS_HIGHMEM
> +	select SYS_SUPPORTS_SMP
>=20
>  config MACH_X1000
>  	bool
> diff --git a/arch/mips/jz4740/Makefile b/arch/mips/jz4740/Makefile
> index 6de14c0..0a0f024 100644
> --- a/arch/mips/jz4740/Makefile
> +++ b/arch/mips/jz4740/Makefile
> @@ -12,3 +12,8 @@ CFLAGS_setup.o =3D=20
> -I$(src)/../../../scripts/dtc/libfdt
>  # PM support
>=20
>  obj-$(CONFIG_PM) +=3D pm.o
> +
> +# SMP support
> +
> +obj-$(CONFIG_SMP) +=3D smp.o
> +obj-$(CONFIG_SMP) +=3D smp-entry.o
> diff --git a/arch/mips/jz4740/prom.c b/arch/mips/jz4740/prom.c
> index ff4555c..026259e 100644
> --- a/arch/mips/jz4740/prom.c
> +++ b/arch/mips/jz4740/prom.c
> @@ -8,10 +8,14 @@
>=20
>  #include <asm/bootinfo.h>
>  #include <asm/fw/fw.h>
> +#include <asm/mach-jz4740/smp.h>
>=20
>  void __init prom_init(void)
>  {
>  	fw_init_cmdline();
> +
> +	if (IS_ENABLED(CONFIG_MACH_JZ4780) && IS_ENABLED(CONFIG_SMP))
> +		jz4780_smp_init();

I guess it's OK for a first version, but SMP should really be decoupled=20
from the SoC version. A SMP-enabled kernel should be able to also=20
support non-SMP SoCs.


>  }
>=20
>  void __init prom_free_prom_memory(void)
> diff --git a/arch/mips/jz4740/smp-entry.S=20
> b/arch/mips/jz4740/smp-entry.S
> new file mode 100644
> index 00000000..20049a3
> --- /dev/null
> +++ b/arch/mips/jz4740/smp-entry.S
> @@ -0,0 +1,57 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + *  Copyright (C) 2013, Paul Burton <paul.burton@imgtec.com>
> + *  JZ4780 SMP entry point
> + */
> +
> +#include <asm/addrspace.h>
> +#include <asm/asm.h>
> +#include <asm/asmmacro.h>
> +#include <asm/cacheops.h>
> +#include <asm/mipsregs.h>
> +
> +#define CACHE_SIZE (32 * 1024)
> +#define CACHE_LINESIZE 32
> +
> +.extern jz4780_cpu_entry_sp
> +.extern jz4780_cpu_entry_gp
> +
> +.section .text.smp-entry
> +.balign 0x10000
> +.set noreorder
> +LEAF(jz4780_secondary_cpu_entry)
> +	mtc0	zero, CP0_CAUSE
> +
> +	li	t0, ST0_CU0
> +	mtc0	t0, CP0_STATUS
> +
> +	/* cache setup */
> +	li	t0, KSEG0
> +	ori	t1, t0, CACHE_SIZE
> +	mtc0	zero, CP0_TAGLO, 0
> +1:	cache	Index_Store_Tag_I, 0(t0)
> +	cache	Index_Store_Tag_D, 0(t0)
> +	bne	t0, t1, 1b
> +	 addiu	t0, t0, CACHE_LINESIZE
> +
> +	/* kseg0 cache attribute */
> +	mfc0	t0, CP0_CONFIG, 0
> +	ori	t0, t0, CONF_CM_CACHABLE_NONCOHERENT
> +	mtc0	t0, CP0_CONFIG, 0
> +
> +	/* pagemask */
> +	mtc0	zero, CP0_PAGEMASK, 0
> +
> +	/* retrieve sp */
> +	la	t0, jz4780_cpu_entry_sp
> +	lw	sp, 0(t0)
> +
> +	/* retrieve gp */
> +	la	t0, jz4780_cpu_entry_gp
> +	lw	gp, 0(t0)
> +
> +	/* jump to the kernel in kseg0 */
> +	la	t0, smp_bootstrap
> +	jr	t0
> +	 nop
> +	END(jz4780_secondary_cpu_entry)
> diff --git a/arch/mips/jz4740/smp.c b/arch/mips/jz4740/smp.c
> new file mode 100644
> index 00000000..5fe0cf3
> --- /dev/null
> +++ b/arch/mips/jz4740/smp.c
> @@ -0,0 +1,254 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + *  Copyright (C) 2013, Paul Burton <paul.burton@imgtec.com>
> + *  JZ4780 SMP
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/interrupt.h>
> +#include <linux/of.h>
> +#include <linux/sched.h>
> +#include <linux/sched/task_stack.h>
> +#include <linux/smp.h>
> +#include <linux/tick.h>
> +#include <asm/mach-jz4740/smp.h>
> +#include <asm/smp-ops.h>
> +
> +static struct clk *cpu_clock_gates[CONFIG_NR_CPUS] =3D { NULL };
> +
> +u32 jz4780_cpu_entry_sp;
> +u32 jz4780_cpu_entry_gp;
> +
> +static struct cpumask cpu_running;

This is not used anywhere, is it?

> +
> +static DEFINE_SPINLOCK(smp_lock);
> +
> +static irqreturn_t mbox_handler(int irq, void *dev_id)
> +{
> +	int cpu =3D smp_processor_id();
> +	u32 action, status;
> +
> +	spin_lock(&smp_lock);
> +
> +	switch (cpu) {
> +	case 0:
> +		action =3D read_c0_mailbox0();
> +		write_c0_mailbox0(0);
> +		break;
> +	case 1:
> +		action =3D read_c0_mailbox1();
> +		write_c0_mailbox1(0);
> +		break;
> +	default:
> +		panic("unhandled cpu %d!", cpu);

XBurst has 4 mailboxes, maybe add them here?

> +	}
> +
> +	/* clear pending mailbox interrupt */
> +	status =3D read_c0_corestatus();
> +	status &=3D ~(CORESTATUS_MIRQ0P << cpu);
> +	write_c0_corestatus(status);
> +
> +	spin_unlock(&smp_lock);
> +
> +	if (action & SMP_RESCHEDULE_YOURSELF)
> +		scheduler_ipi();
> +	if (action & SMP_CALL_FUNCTION)
> +		generic_smp_call_function_interrupt();
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static void jz4780_smp_setup(void)
> +{
> +	u32 addr, reim;
> +	int cpu;
> +
> +	reim =3D read_c0_reim();
> +
> +	for (cpu =3D 0; cpu < NR_CPUS; cpu++) {
> +		__cpu_number_map[cpu] =3D cpu;
> +		__cpu_logical_map[cpu] =3D cpu;
> +		set_cpu_possible(cpu, true);
> +	}
> +
> +	/* mask mailbox interrupts for this core */
> +	reim &=3D ~REIM_MBOXIRQ0M;
> +	write_c0_reim(reim);
> +
> +	/* clear mailboxes & pending mailbox IRQs */
> +	write_c0_mailbox0(0);
> +	write_c0_mailbox1(0);
> +	write_c0_corestatus(0);
> +
> +	/* set reset entry point */
> +	addr =3D KSEG1ADDR((u32)&jz4780_secondary_cpu_entry);
> +	WARN_ON(addr & ~REIM_ENTRY);
> +	reim &=3D ~REIM_ENTRY;
> +	reim |=3D addr & REIM_ENTRY;
> +
> +	/* unmask mailbox interrupts for this core */
> +	reim |=3D REIM_MBOXIRQ0M;
> +	write_c0_reim(reim);
> +	set_c0_status(STATUSF_IP3);
> +	irq_enable_hazard();
> +
> +	cpumask_set_cpu(cpu, &cpu_running);
> +}
> +
> +static void jz4780_smp_prepare_cpus(unsigned int max_cpus)
> +{
> +	struct device_node *cpu_node;
> +	unsigned cpu, ctrl;
> +	int err;
> +
> +	/* setup the mailbox IRQ */
> +	err =3D request_irq(MIPS_CPU_IRQ_BASE + 3, mbox_handler,
> +			IRQF_PERCPU | IRQF_NO_THREAD, "core mailbox", NULL);
> +	if (err)
> +		pr_err("request_irq() on core mailbox failed\n");
> +
> +	init_cpu_present(cpu_possible_mask);

jz4780_smp_setup() marks CPUs 0..NR_CPUS as possible, NR_CPUS being a=20
config option that can be anywhere between 2 and 256. This basically=20
says that up to 256 CPUs are actually present.

> +
> +	ctrl =3D read_c0_corectrl();
> +
> +	for (cpu =3D 0; cpu < max_cpus; cpu++) {
> +		/* use reset entry point from REIM register */
> +		ctrl |=3D CORECTRL_RPC0 << cpu;

max_cpus is just NR_CPUS, so this does not work. You should move this=20
in the "for_each_of_cpu_node" below.

> +	}
> +
> +	for_each_of_cpu_node(cpu_node) {
> +		cpu =3D of_cpu_node_to_id(cpu_node);
> +		if (cpu < 0) {
> +			pr_err("Failed to read index of %s\n",
> +			       cpu_node->full_name);
> +			continue;
> +		}
> +
> +		cpu_clock_gates[cpu] =3D of_clk_get(cpu_node, 0);
> +		if (IS_ERR(cpu_clock_gates[cpu])) {
> +			cpu_clock_gates[cpu] =3D NULL;
> +			continue;
> +		}
> +
> +		err =3D clk_prepare(cpu_clock_gates[cpu]);
> +		if (err)
> +			pr_err("Failed to prepare CPU clock gate\n");
> +	}
> +
> +	write_c0_corectrl(ctrl);
> +}
> +
> +static int jz4780_boot_secondary(int cpu, struct task_struct *idle)
> +{
> +	unsigned long flags;
> +	u32 ctrl;
> +
> +	spin_lock_irqsave(&smp_lock, flags);
> +
> +	/* ensure the core is in reset */
> +	ctrl =3D read_c0_corectrl();
> +	ctrl |=3D CORECTRL_SWRST0 << cpu;
> +	write_c0_corectrl(ctrl);
> +
> +	/* ungate core clock */
> +	if (cpu_clock_gates[cpu])
> +		clk_enable(cpu_clock_gates[cpu]);
> +
> +	/* set entry sp/gp register values */
> +	jz4780_cpu_entry_sp =3D __KSTK_TOS(idle);
> +	jz4780_cpu_entry_gp =3D (u32)task_thread_info(idle);
> +	smp_wmb();
> +
> +	/* take the core out of reset */
> +	ctrl &=3D ~(CORECTRL_SWRST0 << cpu);
> +	write_c0_corectrl(ctrl);
> +
> +	cpumask_set_cpu(cpu, &cpu_running);
> +
> +	spin_unlock_irqrestore(&smp_lock, flags);
> +
> +	return 0;
> +}
> +
> +static void jz4780_init_secondary(void)
> +{
> +}
> +
> +static void jz4780_smp_finish(void)
> +{
> +	u32 reim;
> +
> +	spin_lock(&smp_lock);
> +
> +	/* unmask mailbox interrupts for this core */
> +	reim =3D read_c0_reim();
> +	reim |=3D REIM_MBOXIRQ0M << smp_processor_id();
> +	write_c0_reim(reim);
> +
> +	spin_unlock(&smp_lock);
> +
> +	/* unmask interrupts for this core */
> +	change_c0_status(ST0_IM, STATUSF_IP3 | STATUSF_IP2 |
> +			 STATUSF_IP1 | STATUSF_IP0);
> +	irq_enable_hazard();
> +
> +	/* force broadcast timer */
> +	tick_broadcast_force();
> +}
> +
> +static void jz4780_send_ipi_single_locked(int cpu, unsigned int=20
> action)
> +{
> +	u32 mbox;
> +
> +	switch (cpu) {
> +	case 0:
> +		mbox =3D read_c0_mailbox0();
> +		write_c0_mailbox0(mbox | action);
> +		break;
> +	case 1:
> +		mbox =3D read_c0_mailbox1();
> +		write_c0_mailbox1(mbox | action);
> +		break;

Same as above - there are 4 mailboxes.

> +	default:
> +		panic("unhandled cpu %d!", cpu);
> +	}
> +}
> +
> +static void jz4780_send_ipi_single(int cpu, unsigned int action)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&smp_lock, flags);
> +	jz4780_send_ipi_single_locked(cpu, action);
> +	spin_unlock_irqrestore(&smp_lock, flags);
> +}
> +
> +static void jz4780_send_ipi_mask(const struct cpumask *mask,
> +				 unsigned int action)
> +{
> +	unsigned long flags;
> +	int cpu;
> +
> +	spin_lock_irqsave(&smp_lock, flags);
> +
> +	for_each_cpu(cpu, mask)
> +		jz4780_send_ipi_single_locked(cpu, action);
> +
> +	spin_unlock_irqrestore(&smp_lock, flags);
> +}
> +
> +static struct plat_smp_ops jz4780_smp_ops =3D {
> +	.send_ipi_single =3D jz4780_send_ipi_single,
> +	.send_ipi_mask =3D jz4780_send_ipi_mask,
> +	.init_secondary =3D jz4780_init_secondary,
> +	.smp_finish =3D jz4780_smp_finish,
> +	.boot_secondary =3D jz4780_boot_secondary,
> +	.smp_setup =3D jz4780_smp_setup,
> +	.prepare_cpus =3D jz4780_smp_prepare_cpus,
> +};
> +
> +void jz4780_smp_init(void)

This one can be marked __init.

> +{
> +	register_smp_ops(&jz4780_smp_ops);
> +}
> diff --git a/arch/mips/kernel/idle.c b/arch/mips/kernel/idle.c
> index 37f8e78..a3afd98 100644
> --- a/arch/mips/kernel/idle.c
> +++ b/arch/mips/kernel/idle.c
> @@ -18,6 +18,7 @@
>  #include <asm/cpu-type.h>
>  #include <asm/idle.h>
>  #include <asm/mipsregs.h>
> +#include <asm/r4kcache.h>
>=20
>  /*
>   * Not all of the MIPS CPUs have the "wait" instruction available.=20
> Moreover,
> @@ -88,6 +89,34 @@ static void __cpuidle rm7k_wait_irqoff(void)
>  }
>=20
>  /*
> + * The Ingenic jz4780 SMP variant has to write back dirty cache=20
> lines before
> + * executing wait. The CPU & cache clock will be gated until we=20
> return from
> + * the wait, and if another core attempts to access data from our=20
> data cache
> + * during this time then it will lock up.
> + */
> +void jz4780_smp_wait_irqoff(void)
> +{
> +	unsigned long pending =3D read_c0_cause() & read_c0_status() &=20
> CAUSEF_IP;
> +
> +	/*
> +	 * Going to idle has a significant overhead due to the cache flush=20
> so
> +	 * try to avoid it if we'll immediately be woken again due to an=20
> IRQ.
> +	 */
> +	if (!need_resched() && !pending) {
> +		r4k_blast_dcache();
> +
> +		__asm__(
> +		"	.set push	\n"
> +		"	.set mips3	\n"
> +		"	sync		\n"
> +		"	wait		\n"
> +		"	.set pop	\n");
> +	}
> +
> +	local_irq_enable();
> +}
> +
> +/*
>   * Au1 'wait' is only useful when the 32kHz counter is used as timer,
>   * since coreclock (and the cp0 counter) stops upon executing it.=20
> Only an
>   * interrupt can wake it, so they must be enabled before entering=20
> idle modes.
> @@ -172,7 +201,6 @@ void __init check_wait(void)
>  	case CPU_CAVIUM_OCTEON_PLUS:
>  	case CPU_CAVIUM_OCTEON2:
>  	case CPU_CAVIUM_OCTEON3:
> -	case CPU_XBURST:
>  	case CPU_LOONGSON32:
>  	case CPU_XLR:
>  	case CPU_XLP:
> @@ -246,6 +274,12 @@ void __init check_wait(void)
>  		   cpu_wait =3D r4k_wait;
>  		 */
>  		break;
> +	case CPU_XBURST:
> +		if (IS_ENABLED(CONFIG_MACH_JZ4780) &&
> +				IS_ENABLED(CONFIG_SMP) && (NR_CPUS > 1))
> +			cpu_wait =3D jz4780_smp_wait_irqoff;
> +		else
> +			cpu_wait =3D r4k_wait;
>  	default:
>  		break;
>  	}
> --
> 2.7.4
>=20

=

