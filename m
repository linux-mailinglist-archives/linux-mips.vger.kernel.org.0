Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92B581DB1D2
	for <lists+linux-mips@lfdr.de>; Wed, 20 May 2020 13:33:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726803AbgETLdl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 May 2020 07:33:41 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:35796 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726224AbgETLdj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 20 May 2020 07:33:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1589974415; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TWC5gxvbriGrxeZ8oZuy55XmzHSHiR+0C8qg4bhKmQk=;
        b=jj4L6YOrSNx/LHPHIVVxf6oqcQ4Q9ss7BkxdaaV76gNDBmrY3nwgRoltyuBrj6H6boUcwv
        +NpK75SH/SBtgldB30Qc4qr7YiIdZd20ef4MxvnEDCKJ0YcH3wOgcf4InFW4QO0dKEpM4e
        7cBqCK6U77A5/G/GOjLQhD6HjuPS3k4=
Date:   Wed, 20 May 2020 13:33:22 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v8 1/6] MIPS: JZ4780: Introduce SMP support.
To:     Zhou Yanjie <zhouyanjie@wanyeetech.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, tsbogend@alpha.franken.de,
        paulburton@kernel.org, jiaxun.yang@flygoat.com, chenhc@lemote.com,
        tglx@linutronix.de, robh+dt@kernel.org, daniel.lezcano@linaro.org,
        keescook@chromium.org, krzk@kernel.org, hns@goldelico.com,
        ebiederm@xmission.com, dongsheng.qiu@ingenic.com,
        yanfei.li@ingenic.com, rick.tyliu@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Message-Id: <M3OMAQ.GEVVI159THK33@crapouillou.net>
In-Reply-To: <5EC4DADD.1000801@wanyeetech.com>
References: <1589898923-60048-1-git-send-email-zhouyanjie@wanyeetech.com>
        <1589898923-60048-3-git-send-email-zhouyanjie@wanyeetech.com>
        <M1GLAQ.UK9S5G64TOOO3@crapouillou.net> <5EC4DADD.1000801@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,

Le mer. 20 mai 2020 =C3=A0 15:23, Zhou Yanjie <zhouyanjie@wanyeetech.com> a=
=20
=C3=A9crit :
> Hi Paul,
>=20
> On 2020=E5=B9=B405=E6=9C=8820=E6=97=A5 03:41, Paul Cercueil wrote:
>> Hi Zhou,
>>=20
>> Le mar. 19 mai 2020 =C3=A0 22:35, =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanj=
ie)=20
>> =7F<zhouyanjie@wanyeetech.com> a =C3=A9crit :
>>> Forward port smp support from kernel 3.18.3 of CI20_linux
>>> to upstream kernel 5.6.
>>>=20
>>> Tested-by: H. Nikolaus Schaller <hns@goldelico.com>
>>> Tested-by: Paul Boddie <paul@boddie.org.uk>
>>> Signed-off-by: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@wa=
nyeetech.com>
>>> Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>> ---
>>>=20
>>> Notes:
>>>     v1->v2:
>>>     1.Remove unnecessary "plat_irq_dispatch(void)" in irq-ingenic.c.
>>>     2.Add a timeout check for "jz4780_boot_secondary()" to avoid a=20
>>> =7F=7Fdead loop.
>>>     3.Replace hard code in smp.c with macro.
>>>=20
>>>     v2->v3:
>>>     1.Remove unnecessary "extern void (*r4k_blast_dcache)(void)" in=20
>>> =7F=7Fsmp.c.
>>>     2.Use "for_each_of_cpu_node" instead "for_each_compatible_node"=20
>>> =7F=7Fin smp.c.
>>>     3.Use "of_cpu_node_to_id" instead "of_property_read_u32_index"=20
>>> in =7F=7Fsmp.c.
>>>     4.Move LCR related operations to jz4780-cgu.c.
>>>=20
>>>     v3->v4:
>>>     Rebase on top of kernel 5.6-rc1.
>>>=20
>>>     v4->v5:
>>>     1.Splitting changes involving "jz4780-cgu.c" into separate=20
>>> commit.
>>>     2.Use "request_irq()" replace "setup_irq()".
>>>=20
>>>     v5->v6:
>>>     In order to have a kernel that works on multiple SoCs at the=20
>>> same
>>>     time, use "IS_ENABLED()" replace "#ifdef".
>>>=20
>>>     v6->v7:
>>>     1.SMP has be decoupled from the SoC version.
>>>     2.Add mailboxes 3 and 4 for XBurst.
>>>     3.Adjust code in "jz4780_smp_prepare_cpus()".
>>>     4."jz4780_smp_init()" has be marked "__init".
>>>=20
>>>     v7->v8:
>>>     No change.
>>>=20
>>>  arch/mips/include/asm/mach-jz4740/smp.h |  87 +++++++++++
>>>  arch/mips/jz4740/Kconfig                |   2 +
>>>  arch/mips/jz4740/Makefile               |   5 +
>>>  arch/mips/jz4740/prom.c                 |   4 +
>>>  arch/mips/jz4740/smp-entry.S            |  57 +++++++
>>>  arch/mips/jz4740/smp.c                  | 258=20
>>> =7F=7F++++++++++++++++++++++++++++++++
>>>  arch/mips/kernel/idle.c                 |  35 ++++-
>>>  7 files changed, 447 insertions(+), 1 deletion(-)
>>>  create mode 100644 arch/mips/include/asm/mach-jz4740/smp.h
>>>  create mode 100644 arch/mips/jz4740/smp-entry.S
>>>  create mode 100644 arch/mips/jz4740/smp.c
>>>=20
>>> diff --git a/arch/mips/include/asm/mach-jz4740/smp.h=20
>>> =7F=7Fb/arch/mips/include/asm/mach-jz4740/smp.h
>>> new file mode 100644
>>> index 00000000..86f660f
>>> --- /dev/null
>>> +++ b/arch/mips/include/asm/mach-jz4740/smp.h
>>> @@ -0,0 +1,87 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>> +/*
>>> + *  Copyright (C) 2013, Paul Burton <paul.burton@imgtec.com>
>>> + *  JZ4780 SMP definitions
>>> + */
>>> +
>>> +#ifndef __MIPS_ASM_MACH_JZ4740_SMP_H__
>>> +#define __MIPS_ASM_MACH_JZ4740_SMP_H__
>>> +
>>> +#define read_c0_corectrl()        __read_32bit_c0_register($12, 2)
>>> +#define write_c0_corectrl(val) __write_32bit_c0_register($12, 2,=20
>>> val)
>>> +
>>> +#define read_c0_corestatus() __read_32bit_c0_register($12, 3)
>>> +#define write_c0_corestatus(val) __write_32bit_c0_register($12, 3,=20
>>> val)
>>> +
>>> +#define read_c0_reim()            __read_32bit_c0_register($12, 4)
>>> +#define write_c0_reim(val) __write_32bit_c0_register($12, 4, val)
>>> +
>>> +#define read_c0_mailbox0()        __read_32bit_c0_register($20, 0)
>>> +#define write_c0_mailbox0(val) __write_32bit_c0_register($20, 0,=20
>>> val)
>>> +
>>> +#define read_c0_mailbox1()        __read_32bit_c0_register($20, 1)
>>> +#define write_c0_mailbox1(val) __write_32bit_c0_register($20, 1,=20
>>> val)
>>> +
>>> +#define read_c0_mailbox2()        __read_32bit_c0_register($20, 2)
>>> +#define write_c0_mailbox2(val) __write_32bit_c0_register($20, 2,=20
>>> val)
>>> +
>>> +#define read_c0_mailbox3()        __read_32bit_c0_register($20, 3)
>>> +#define write_c0_mailbox3(val) __write_32bit_c0_register($20, 3,=20
>>> val)
>>> +
>>> +#define smp_clr_pending(mask) do {        \
>>> +        unsigned int stat;        \
>>> +        stat =3D read_c0_corestatus();    \
>>> +        stat &=3D ~((mask) & 0xff);    \
>>> +        write_c0_corestatus(stat);    \
>>> +    } while (0)
>>> +
>>> +/*
>>> + * Core Control register
>>> + */
>>> +#define CORECTRL_SLEEP1M_SHIFT    17
>>> +#define CORECTRL_SLEEP1M    (_ULCAST_(0x1) <<=20
>>> CORECTRL_SLEEP1M_SHIFT)
>>> +#define CORECTRL_SLEEP0M_SHIFT    16
>>> +#define CORECTRL_SLEEP0M    (_ULCAST_(0x1) <<=20
>>> CORECTRL_SLEEP0M_SHIFT)
>>> +#define CORECTRL_RPC1_SHIFT    9
>>> +#define CORECTRL_RPC1        (_ULCAST_(0x1) << CORECTRL_RPC1_SHIFT)
>>> +#define CORECTRL_RPC0_SHIFT    8
>>> +#define CORECTRL_RPC0        (_ULCAST_(0x1) << CORECTRL_RPC0_SHIFT)
>>> +#define CORECTRL_SWRST1_SHIFT    1
>>> +#define CORECTRL_SWRST1        (_ULCAST_(0x1) <<=20
>>> CORECTRL_SWRST1_SHIFT)
>>> +#define CORECTRL_SWRST0_SHIFT    0
>>> +#define CORECTRL_SWRST0        (_ULCAST_(0x1) <<=20
>>> CORECTRL_SWRST0_SHIFT)
>>> +
>>> +/*
>>> + * Core Status register
>>> + */
>>> +#define CORESTATUS_SLEEP1_SHIFT    17
>>> +#define CORESTATUS_SLEEP1    (_ULCAST_(0x1) <<=20
>>> CORESTATUS_SLEEP1_SHIFT)
>>> +#define CORESTATUS_SLEEP0_SHIFT    16
>>> +#define CORESTATUS_SLEEP0    (_ULCAST_(0x1) <<=20
>>> CORESTATUS_SLEEP0_SHIFT)
>>> +#define CORESTATUS_IRQ1P_SHIFT    9
>>> +#define CORESTATUS_IRQ1P    (_ULCAST_(0x1) <<=20
>>> CORESTATUS_IRQ1P_SHIFT)
>>> +#define CORESTATUS_IRQ0P_SHIFT    8
>>> +#define CORESTATUS_IRQ0P    (_ULCAST_(0x1) <<=20
>>> CORESTATUS_IRQ8P_SHIFT)
>>> +#define CORESTATUS_MIRQ1P_SHIFT    1
>>> +#define CORESTATUS_MIRQ1P    (_ULCAST_(0x1) <<=20
>>> CORESTATUS_MIRQ1P_SHIFT)
>>> +#define CORESTATUS_MIRQ0P_SHIFT    0
>>> +#define CORESTATUS_MIRQ0P    (_ULCAST_(0x1) <<=20
>>> CORESTATUS_MIRQ0P_SHIFT)
>>> +
>>> +/*
>>> + * Reset Entry & IRQ Mask register
>>> + */
>>> +#define REIM_ENTRY_SHIFT    16
>>> +#define REIM_ENTRY        (_ULCAST_(0xffff) << REIM_ENTRY_SHIFT)
>>> +#define REIM_IRQ1M_SHIFT    9
>>> +#define REIM_IRQ1M        (_ULCAST_(0x1) << REIM_IRQ1M_SHIFT)
>>> +#define REIM_IRQ0M_SHIFT    8
>>> +#define REIM_IRQ0M        (_ULCAST_(0x1) << REIM_IRQ0M_SHIFT)
>>> +#define REIM_MBOXIRQ1M_SHIFT    1
>>> +#define REIM_MBOXIRQ1M        (_ULCAST_(0x1) <<=20
>>> REIM_MBOXIRQ1M_SHIFT)
>>> +#define REIM_MBOXIRQ0M_SHIFT    0
>>> +#define REIM_MBOXIRQ0M        (_ULCAST_(0x1) <<=20
>>> REIM_MBOXIRQ0M_SHIFT)
>>> +
>>> +extern void jz4780_smp_init(void);
>>> +extern void jz4780_secondary_cpu_entry(void);
>>> +
>>> +#endif /* __MIPS_ASM_MACH_JZ4740_SMP_H__ */
>>> diff --git a/arch/mips/jz4740/Kconfig b/arch/mips/jz4740/Kconfig
>>> index 412d2fa..2b88557 100644
>>> --- a/arch/mips/jz4740/Kconfig
>>> +++ b/arch/mips/jz4740/Kconfig
>>> @@ -34,9 +34,11 @@ config MACH_JZ4770
>>>=20
>>>  config MACH_JZ4780
>>>      bool
>>> +    select GENERIC_CLOCKEVENTS_BROADCAST if SMP
>>>      select MIPS_CPU_SCACHE
>>>      select SYS_HAS_CPU_MIPS32_R2
>>>      select SYS_SUPPORTS_HIGHMEM
>>> +    select SYS_SUPPORTS_SMP
>>>=20
>>>  config MACH_X1000
>>>      bool
>>> diff --git a/arch/mips/jz4740/Makefile b/arch/mips/jz4740/Makefile
>>> index 6de14c0..0a0f024 100644
>>> --- a/arch/mips/jz4740/Makefile
>>> +++ b/arch/mips/jz4740/Makefile
>>> @@ -12,3 +12,8 @@ CFLAGS_setup.o =3D=20
>>> -I$(src)/../../../scripts/dtc/libfdt
>>>  # PM support
>>>=20
>>>  obj-$(CONFIG_PM) +=3D pm.o
>>> +
>>> +# SMP support
>>> +
>>> +obj-$(CONFIG_SMP) +=3D smp.o
>>> +obj-$(CONFIG_SMP) +=3D smp-entry.o
>>> diff --git a/arch/mips/jz4740/prom.c b/arch/mips/jz4740/prom.c
>>> index ff4555c..4acf5c2c 100644
>>> --- a/arch/mips/jz4740/prom.c
>>> +++ b/arch/mips/jz4740/prom.c
>>> @@ -8,10 +8,14 @@
>>>=20
>>>  #include <asm/bootinfo.h>
>>>  #include <asm/fw/fw.h>
>>> +#include <asm/mach-jz4740/smp.h>
>>>=20
>>>  void __init prom_init(void)
>>>  {
>>>      fw_init_cmdline();
>>> +
>>> +    if (IS_ENABLED(CONFIG_SMP))
>>> +        jz4780_smp_init();
>>>  }
>>>=20
>>>  void __init prom_free_prom_memory(void)
>>> diff --git a/arch/mips/jz4740/smp-entry.S=20
>>> b/arch/mips/jz4740/smp-entry.S
>>> new file mode 100644
>>> index 00000000..20049a3
>>> --- /dev/null
>>> +++ b/arch/mips/jz4740/smp-entry.S
>>> @@ -0,0 +1,57 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>> +/*
>>> + *  Copyright (C) 2013, Paul Burton <paul.burton@imgtec.com>
>>> + *  JZ4780 SMP entry point
>>> + */
>>> +
>>> +#include <asm/addrspace.h>
>>> +#include <asm/asm.h>
>>> +#include <asm/asmmacro.h>
>>> +#include <asm/cacheops.h>
>>> +#include <asm/mipsregs.h>
>>> +
>>> +#define CACHE_SIZE (32 * 1024)
>>> +#define CACHE_LINESIZE 32
>>> +
>>> +.extern jz4780_cpu_entry_sp
>>> +.extern jz4780_cpu_entry_gp
>>> +
>>> +.section .text.smp-entry
>>> +.balign 0x10000
>>> +.set noreorder
>>> +LEAF(jz4780_secondary_cpu_entry)
>>> +    mtc0    zero, CP0_CAUSE
>>> +
>>> +    li    t0, ST0_CU0
>>> +    mtc0    t0, CP0_STATUS
>>> +
>>> +    /* cache setup */
>>> +    li    t0, KSEG0
>>> +    ori    t1, t0, CACHE_SIZE
>>> +    mtc0    zero, CP0_TAGLO, 0
>>> +1:    cache    Index_Store_Tag_I, 0(t0)
>>> +    cache    Index_Store_Tag_D, 0(t0)
>>> +    bne    t0, t1, 1b
>>> +     addiu    t0, t0, CACHE_LINESIZE
>>> +
>>> +    /* kseg0 cache attribute */
>>> +    mfc0    t0, CP0_CONFIG, 0
>>> +    ori    t0, t0, CONF_CM_CACHABLE_NONCOHERENT
>>> +    mtc0    t0, CP0_CONFIG, 0
>>> +
>>> +    /* pagemask */
>>> +    mtc0    zero, CP0_PAGEMASK, 0
>>> +
>>> +    /* retrieve sp */
>>> +    la    t0, jz4780_cpu_entry_sp
>>> +    lw    sp, 0(t0)
>>> +
>>> +    /* retrieve gp */
>>> +    la    t0, jz4780_cpu_entry_gp
>>> +    lw    gp, 0(t0)
>>> +
>>> +    /* jump to the kernel in kseg0 */
>>> +    la    t0, smp_bootstrap
>>> +    jr    t0
>>> +     nop
>>> +    END(jz4780_secondary_cpu_entry)
>>> diff --git a/arch/mips/jz4740/smp.c b/arch/mips/jz4740/smp.c
>>> new file mode 100644
>>> index 00000000..d95d22a
>>> --- /dev/null
>>> +++ b/arch/mips/jz4740/smp.c
>>> @@ -0,0 +1,258 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + *  Copyright (C) 2013, Paul Burton <paul.burton@imgtec.com>
>>> + *  JZ4780 SMP
>>> + */
>>> +
>>> +#include <linux/clk.h>
>>> +#include <linux/delay.h>
>>> +#include <linux/interrupt.h>
>>> +#include <linux/of.h>
>>> +#include <linux/sched.h>
>>> +#include <linux/sched/task_stack.h>
>>> +#include <linux/smp.h>
>>> +#include <linux/tick.h>
>>> +#include <asm/mach-jz4740/smp.h>
>>> +#include <asm/smp-ops.h>
>>> +
>>> +static struct clk *cpu_clock_gates[CONFIG_NR_CPUS] =3D { NULL };
>>> +
>>> +u32 jz4780_cpu_entry_sp;
>>> +u32 jz4780_cpu_entry_gp;
>>> +
>>> +static struct cpumask cpu_running;
>>=20
>> This cpumask is written, but never read anywhere. Since it's static,=20
>> I =7Fbelieve it's dead code.
>>=20
>=20
> Sure, I will remove it.
>=20
>>> +
>>> +static DEFINE_SPINLOCK(smp_lock);
>>> +
>>> +static irqreturn_t mbox_handler(int irq, void *dev_id)
>>> +{
>>> +    int cpu =3D smp_processor_id();
>>> +    u32 action, status;
>>> +
>>> +    spin_lock(&smp_lock);
>>> +
>>> +    switch (cpu) {
>>> +    case 0:
>>> +        action =3D read_c0_mailbox0();
>>> +        write_c0_mailbox0(0);
>>> +        break;
>>> +    case 1:
>>> +        action =3D read_c0_mailbox1();
>>> +        write_c0_mailbox1(0);
>>> +        break;
>>> +    case 2:
>>> +        action =3D read_c0_mailbox2();
>>> +        write_c0_mailbox2(0);
>>> +        break;
>>> +    case 3:
>>> +        action =3D read_c0_mailbox3();
>>> +        write_c0_mailbox3(0);
>>> +        break;
>>> +    default:
>>> +        panic("unhandled cpu %d!", cpu);
>>> +    }
>>> +
>>> +    /* clear pending mailbox interrupt */
>>> +    status =3D read_c0_corestatus();
>>> +    status &=3D ~(CORESTATUS_MIRQ0P << cpu);
>>> +    write_c0_corestatus(status);
>>> +
>>> +    spin_unlock(&smp_lock);
>>> +
>>> +    if (action & SMP_RESCHEDULE_YOURSELF)
>>> +        scheduler_ipi();
>>> +    if (action & SMP_CALL_FUNCTION)
>>> +        generic_smp_call_function_interrupt();
>>> +
>>> +    return IRQ_HANDLED;
>>> +}
>>> +
>>> +static void jz4780_smp_setup(void)
>>> +{
>>> +    u32 addr, reim;
>>> +    int cpu;
>>> +
>>> +    reim =3D read_c0_reim();
>>> +
>>> +    for (cpu =3D 0; cpu < NR_CPUS; cpu++) {
>>> +        __cpu_number_map[cpu] =3D cpu;
>>> +        __cpu_logical_map[cpu] =3D cpu;
>>> +        set_cpu_possible(cpu, true);
>>=20
>> I assume if you do that, you will have num_possible_cpus() =3D=3D=20
>> NR_CPUS, =7Fwhich is not what you want.
>>=20
>> Correct me if I'm wrong, but I think you would need to call=20
>> =7Fset_cpu_possible() for each CPU node found.
>>=20
>=20
> Yes, the current way is indeed a little problem, it will cause=20
> num_possible_cpus() =3D=3D NR_CPUS, I will try to find a better way.

You can do:

for_each_of_cpu_node(cpu_node) {
       cpu =3D of_cpu_node_to_id(cpu_node);
       __cpu_number_map[cpu] =3D cpu;
       __cpu_logical_map[cpu] =3D cpu;
       set_cpu_possible(cpu, true);
}


>>> +    }
>>> +
>>> +    /* mask mailbox interrupts for this core */
>>> +    reim &=3D ~REIM_MBOXIRQ0M;
>>> +    write_c0_reim(reim);
>>> +
>>> +    /* clear mailboxes & pending mailbox IRQs */
>>> +    write_c0_mailbox0(0);
>>> +    write_c0_mailbox1(0);
>>=20
>> Write mailbox2/3 too.
>>=20
>=20
> Although the XBurst1 architecture can have up to four cores, but=20
> JZ4780 only has two. If we need to write all four mailboxes here, do=20
> we need change the function name to "xburst1_smp_setup" or other=20
> similar names? This seems more appropriate.

Yes, these functions are not jz4780-specific, you can rename them all.

>>> +    write_c0_corestatus(0);
>>> +
>>> +    /* set reset entry point */
>>> +    addr =3D KSEG1ADDR((u32)&jz4780_secondary_cpu_entry);
>>> +    WARN_ON(addr & ~REIM_ENTRY);
>>> +    reim &=3D ~REIM_ENTRY;
>>> +    reim |=3D addr & REIM_ENTRY;
>>> +
>>> +    /* unmask mailbox interrupts for this core */
>>> +    reim |=3D REIM_MBOXIRQ0M;
>>> +    write_c0_reim(reim);
>>> +    set_c0_status(STATUSF_IP3);
>>> +    irq_enable_hazard();
>>> +
>>> +    cpumask_set_cpu(cpu, &cpu_running);
>>> +}
>>> +
>>> +static void jz4780_smp_prepare_cpus(unsigned int max_cpus)
>>> +{
>>> +    struct device_node *cpu_node;
>>> +    unsigned cpu, ctrl;
>>> +    int err;
>>> +
>>> +    /* setup the mailbox IRQ */
>>> +    err =3D request_irq(MIPS_CPU_IRQ_BASE + 3, mbox_handler,
>>> +            IRQF_PERCPU | IRQF_NO_THREAD, "core mailbox", NULL);
>>=20
>> Please don't hardcode the IRQ number. Instead, it should be read=20
>> from =7Fdevicetree, maybe from the 'cpus' node (not sure).
>>=20
>=20
> OK, I'll try to figure it out.
>=20
>>> +    if (err)
>>> +        pr_err("request_irq() on core mailbox failed\n");
>>> +
>>> +    ctrl =3D read_c0_corectrl();
>>> +
>>> +    for_each_of_cpu_node(cpu_node) {
>>> +        cpu =3D of_cpu_node_to_id(cpu_node);
>>> +        if (cpu < 0) {
>>> +            pr_err("Failed to read index of %s\n",
>>> +                   cpu_node->full_name);
>>> +            continue;
>>> +        }
>>> +
>>> +        /* use reset entry point from REIM register */
>>> +        ctrl |=3D CORECTRL_RPC0 << cpu;
>>> +
>>> +        cpu_clock_gates[cpu] =3D of_clk_get(cpu_node, 0);
>>> +        if (IS_ERR(cpu_clock_gates[cpu])) {
>>> +            cpu_clock_gates[cpu] =3D NULL;
>>> +            continue;
>>> +        }
>>> +
>>> +        err =3D clk_prepare(cpu_clock_gates[cpu]);
>>> +        if (err)
>>> +            pr_err("Failed to prepare CPU clock gate\n");
>>=20
>> I'd suggest to call clk_prepare() in jz4780_boot_secondary(), since=20
>> =7Fyou can't handle errors here. That would also avoid the static=20
>> =7Fcpu_clock_gates[] array which can grow quite big since its size is=20
>> =7Fgiven by NR_CPUS.
>>=20
>=20
> Sure, I will move it to jz4780_boot_secondary().
>=20
>>> +    }
>>> +
>>> +    write_c0_corectrl(ctrl);
>>> +}
>>> +
>>> +static int jz4780_boot_secondary(int cpu, struct task_struct *idle)
>>> +{
>>> +    unsigned long flags;
>>> +    u32 ctrl;
>>> +
>>> +    spin_lock_irqsave(&smp_lock, flags);
>>> +
>>> +    /* ensure the core is in reset */
>>> +    ctrl =3D read_c0_corectrl();
>>> +    ctrl |=3D CORECTRL_SWRST0 << cpu;
>>> +    write_c0_corectrl(ctrl);
>>> +
>>> +    /* ungate core clock */
>>> +    if (cpu_clock_gates[cpu])
>>> +        clk_enable(cpu_clock_gates[cpu]);
>>=20
>> You should check the return value of clk_enable().
>>=20
>> +        break;
>=20
> Sure.
>=20
>>> +
>>> +    /* set entry sp/gp register values */
>>> +    jz4780_cpu_entry_sp =3D __KSTK_TOS(idle);
>>> +    jz4780_cpu_entry_gp =3D (u32)task_thread_info(idle);
>>> +    smp_wmb();
>>> +
>>> +    /* take the core out of reset */
>>> +    ctrl &=3D ~(CORECTRL_SWRST0 << cpu);
>>> +    write_c0_corectrl(ctrl);
>>> +
>>> +    cpumask_set_cpu(cpu, &cpu_running);
>>> +
>>> +    spin_unlock_irqrestore(&smp_lock, flags);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static void jz4780_init_secondary(void)
>>> +{
>>> +}
>>> +
>>> +static void jz4780_smp_finish(void)
>>> +{
>>> +    u32 reim;
>>> +
>>> +    spin_lock(&smp_lock);
>>> +
>>> +    /* unmask mailbox interrupts for this core */
>>> +    reim =3D read_c0_reim();
>>> +    reim |=3D REIM_MBOXIRQ0M << smp_processor_id();
>>> +    write_c0_reim(reim);
>>> +
>>> +    spin_unlock(&smp_lock);
>>> +
>>> +    /* unmask interrupts for this core */
>>> +    change_c0_status(ST0_IM, STATUSF_IP3 | STATUSF_IP2 |
>>> +             STATUSF_IP1 | STATUSF_IP0);
>>> +    irq_enable_hazard();
>>> +
>>> +    /* force broadcast timer */
>>> +    tick_broadcast_force();
>>> +}
>>> +
>>> +static void jz4780_send_ipi_single_locked(int cpu, unsigned int=20
>>> action)
>>> +{
>>> +    u32 mbox;
>>> +
>>> +    switch (cpu) {
>>> +    case 0:
>>> +        mbox =3D read_c0_mailbox0();
>>> +        write_c0_mailbox0(mbox | action);
>>> +        break;
>>> +    case 1:
>>> +        mbox =3D read_c0_mailbox1();
>>> +        write_c0_mailbox1(mbox | action);
>>=20
>> Handle mailboxes 2/3 too here.
>>=20
>=20
> Same to the above, do we need to change the function to a more=20
> appropriate name?
>=20
>>> +    default:
>>> +        panic("unhandled cpu %d!", cpu);
>>> +    }
>>> +}
>>> +
>>> +static void jz4780_send_ipi_single(int cpu, unsigned int action)
>>> +{
>>> +    unsigned long flags;
>>> +
>>> +    spin_lock_irqsave(&smp_lock, flags);
>>> +    jz4780_send_ipi_single_locked(cpu, action);
>>> +    spin_unlock_irqrestore(&smp_lock, flags);
>>> +}
>>> +
>>> +static void jz4780_send_ipi_mask(const struct cpumask *mask,
>>> +                 unsigned int action)
>>> +{
>>> +    unsigned long flags;
>>> +    int cpu;
>>> +
>>> +    spin_lock_irqsave(&smp_lock, flags);
>>> +
>>> +    for_each_cpu(cpu, mask)
>>> +        jz4780_send_ipi_single_locked(cpu, action);
>>> +
>>> +    spin_unlock_irqrestore(&smp_lock, flags);
>>> +}
>>> +
>>> +static struct plat_smp_ops jz4780_smp_ops =3D {
>>> +    .send_ipi_single =3D jz4780_send_ipi_single,
>>> +    .send_ipi_mask =3D jz4780_send_ipi_mask,
>>> +    .init_secondary =3D jz4780_init_secondary,
>>> +    .smp_finish =3D jz4780_smp_finish,
>>> +    .boot_secondary =3D jz4780_boot_secondary,
>>> +    .smp_setup =3D jz4780_smp_setup,
>>> +    .prepare_cpus =3D jz4780_smp_prepare_cpus,
>>> +};
>>> +
>>> +void __init jz4780_smp_init(void)
>>> +{
>>> +    register_smp_ops(&jz4780_smp_ops);
>>> +}
>>> diff --git a/arch/mips/kernel/idle.c b/arch/mips/kernel/idle.c
>>> index 37f8e78..d33f2d4 100644
>>> --- a/arch/mips/kernel/idle.c
>>> +++ b/arch/mips/kernel/idle.c
>>> @@ -18,6 +18,7 @@
>>>  #include <asm/cpu-type.h>
>>>  #include <asm/idle.h>
>>>  #include <asm/mipsregs.h>
>>> +#include <asm/r4kcache.h>
>>>=20
>>>  /*
>>>   * Not all of the MIPS CPUs have the "wait" instruction available.=20
>>> =7F=7FMoreover,
>>> @@ -88,6 +89,34 @@ static void __cpuidle rm7k_wait_irqoff(void)
>>>  }
>>>=20
>>>  /*
>>> + * The Ingenic jz4780 SMP variant has to write back dirty cache=20
>>> =7F=7Flines before
>>> + * executing wait. The CPU & cache clock will be gated until we=20
>>> =7F=7Freturn from
>>> + * the wait, and if another core attempts to access data from our=20
>>> =7F=7Fdata cache
>>> + * during this time then it will lock up.
>>> + */
>>> +void jz4780_smp_wait_irqoff(void)
>>> +{
>>> +    unsigned long pending =3D read_c0_cause() & read_c0_status() &=20
>>> =7F=7FCAUSEF_IP;
>>> +
>>> +    /*
>>> +     * Going to idle has a significant overhead due to the cache=20
>>> =7F=7Fflush so
>>> +     * try to avoid it if we'll immediately be woken again due to=20
>>> an =7F=7FIRQ.
>>> +     */
>>=20
>> You could add a fast path here where you just call r4k_wait() if=20
>> =7Fnum_online_cpus() < 2.
>>=20
>=20
> Please correct me if I'm wrong, if we add it here, when the number of=20
> CPU cores is greater than 1 (which should be the case on most=20
> occasions), each call to "jz4780_smp_wait_irqoff" will generate=20
> additional overhead (judging the number of CPUs), is it better to=20
> change "if (IS_ENABLED(CONFIG_SMP))" in "case CPU_XBURST" below to=20
> "if (IS_ENABLED(CONFIG_SMP) && (num_possible_cpus() > 1))"?

Is the number of possible CPUs already known when cpu_wait is set?

Cheers,
-Paul

> Thanks and best regards!
>=20
>> -Paul
>>=20
>>> +    if (!need_resched() && !pending) {
>>> +        r4k_blast_dcache();
>>> +
>>> +        __asm__(
>>> +        "    .set push    \n"
>>> +        "    .set mips3    \n"
>>> +        "    sync        \n"
>>> +        "    wait        \n"
>>> +        "    .set pop    \n");
>>> +    }
>>> +
>>> +    local_irq_enable();
>>> +}
>>> +
>>> +/*
>>>   * Au1 'wait' is only useful when the 32kHz counter is used as=20
>>> timer,
>>>   * since coreclock (and the cp0 counter) stops upon executing it.=20
>>> =7F=7FOnly an
>>>   * interrupt can wake it, so they must be enabled before entering=20
>>> =7F=7Fidle modes.
>>> @@ -172,7 +201,6 @@ void __init check_wait(void)
>>>      case CPU_CAVIUM_OCTEON_PLUS:
>>>      case CPU_CAVIUM_OCTEON2:
>>>      case CPU_CAVIUM_OCTEON3:
>>> -    case CPU_XBURST:
>>>      case CPU_LOONGSON32:
>>>      case CPU_XLR:
>>>      case CPU_XLP:
>>> @@ -246,6 +274,11 @@ void __init check_wait(void)
>>>             cpu_wait =3D r4k_wait;
>>>           */
>>>          break;
>>> +    case CPU_XBURST:
>>> +        if (IS_ENABLED(CONFIG_SMP))
>>> +            cpu_wait =3D jz4780_smp_wait_irqoff;
>>> +        else
>>> +            cpu_wait =3D r4k_wait;
>>>      default:
>>>          break;
>>>      }
>>> --
>>> 2.7.4
>>>=20
>>=20
>=20


