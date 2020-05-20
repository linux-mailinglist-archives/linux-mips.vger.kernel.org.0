Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35CF11DABF5
	for <lists+linux-mips@lfdr.de>; Wed, 20 May 2020 09:25:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbgETHY4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 May 2020 03:24:56 -0400
Received: from out28-122.mail.aliyun.com ([115.124.28.122]:40646 "EHLO
        out28-122.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726224AbgETHYz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 20 May 2020 03:24:55 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436282|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.198518-0.00665581-0.794827;FP=0|0|0|0|0|-1|-1|-1;HT=e01l07447;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=20;RT=20;SR=0;TI=SMTPD_---.Hb3Bm8r_1589959477;
Received: from 192.168.10.244(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.Hb3Bm8r_1589959477)
          by smtp.aliyun-inc.com(10.147.42.198);
          Wed, 20 May 2020 15:24:40 +0800
Subject: Re: [PATCH v8 1/6] MIPS: JZ4780: Introduce SMP support.
To:     Paul Cercueil <paul@crapouillou.net>
References: <1589898923-60048-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1589898923-60048-3-git-send-email-zhouyanjie@wanyeetech.com>
 <C86LAQ.3VY09SMOY9R23@crapouillou.net>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, tsbogend@alpha.franken.de,
        paulburton@kernel.org, jiaxun.yang@flygoat.com, chenhc@lemote.com,
        tglx@linutronix.de, robh+dt@kernel.org, daniel.lezcano@linaro.org,
        keescook@chromium.org, krzk@kernel.org, hns@goldelico.com,
        ebiederm@xmission.com, dongsheng.qiu@ingenic.com,
        yanfei.li@ingenic.com, rick.tyliu@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <5EC4DB33.8010704@wanyeetech.com>
Date:   Wed, 20 May 2020 15:24:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <C86LAQ.3VY09SMOY9R23@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 2020年05月20日 00:09, Paul Cercueil wrote:
> Hi Zhou,
>
> Le mar. 19 mai 2020 à 22:35, 周琰杰 (Zhou Yanjie) 
> <zhouyanjie@wanyeetech.com> a écrit :
>> Forward port smp support from kernel 3.18.3 of CI20_linux
>> to upstream kernel 5.6.
>>
>> Tested-by: H. Nikolaus Schaller <hns@goldelico.com>
>> Tested-by: Paul Boddie <paul@boddie.org.uk>
>> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>> Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---
>>
>> Notes:
>>     v1->v2:
>>     1.Remove unnecessary "plat_irq_dispatch(void)" in irq-ingenic.c.
>>     2.Add a timeout check for "jz4780_boot_secondary()" to avoid a 
>> dead loop.
>>     3.Replace hard code in smp.c with macro.
>>
>>     v2->v3:
>>     1.Remove unnecessary "extern void (*r4k_blast_dcache)(void)" in 
>> smp.c.
>>     2.Use "for_each_of_cpu_node" instead "for_each_compatible_node" 
>> in smp.c.
>>     3.Use "of_cpu_node_to_id" instead "of_property_read_u32_index" in 
>> smp.c.
>>     4.Move LCR related operations to jz4780-cgu.c.
>>
>>     v3->v4:
>>     Rebase on top of kernel 5.6-rc1.
>>
>>     v4->v5:
>>     1.Splitting changes involving "jz4780-cgu.c" into separate commit.
>>     2.Use "request_irq()" replace "setup_irq()".
>>
>>     v5->v6:
>>     In order to have a kernel that works on multiple SoCs at the same
>>     time, use "IS_ENABLED()" replace "#ifdef".
>>
>>     v6->v7:
>>     1.SMP has be decoupled from the SoC version.
>>     2.Add mailboxes 3 and 4 for XBurst.
>>     3.Adjust code in "jz4780_smp_prepare_cpus()".
>>     4."jz4780_smp_init()" has be marked "__init".
>>
>>     v7->v8:
>>     No change.
>>
>>  arch/mips/include/asm/mach-jz4740/smp.h |  87 +++++++++++
>>  arch/mips/jz4740/Kconfig                |   2 +
>>  arch/mips/jz4740/Makefile               |   5 +
>>  arch/mips/jz4740/prom.c                 |   4 +
>>  arch/mips/jz4740/smp-entry.S            |  57 +++++++
>>  arch/mips/jz4740/smp.c                  | 258 
>> ++++++++++++++++++++++++++++++++
>>  arch/mips/kernel/idle.c                 |  35 ++++-
>>  7 files changed, 447 insertions(+), 1 deletion(-)
>>  create mode 100644 arch/mips/include/asm/mach-jz4740/smp.h
>>  create mode 100644 arch/mips/jz4740/smp-entry.S
>>  create mode 100644 arch/mips/jz4740/smp.c
>>
>> diff --git a/arch/mips/include/asm/mach-jz4740/smp.h 
>> b/arch/mips/include/asm/mach-jz4740/smp.h
>> new file mode 100644
>> index 00000000..86f660f
>> --- /dev/null
>> +++ b/arch/mips/include/asm/mach-jz4740/smp.h
>> @@ -0,0 +1,87 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + *  Copyright (C) 2013, Paul Burton <paul.burton@imgtec.com>
>> + *  JZ4780 SMP definitions
>> + */
>> +
>> +#ifndef __MIPS_ASM_MACH_JZ4740_SMP_H__
>> +#define __MIPS_ASM_MACH_JZ4740_SMP_H__
>> +
>> +#define read_c0_corectrl()        __read_32bit_c0_register($12, 2)
>> +#define write_c0_corectrl(val) __write_32bit_c0_register($12, 2, val)
>> +
>> +#define read_c0_corestatus() __read_32bit_c0_register($12, 3)
>> +#define write_c0_corestatus(val) __write_32bit_c0_register($12, 3, val)
>> +
>> +#define read_c0_reim()            __read_32bit_c0_register($12, 4)
>> +#define write_c0_reim(val) __write_32bit_c0_register($12, 4, val)
>> +
>> +#define read_c0_mailbox0()        __read_32bit_c0_register($20, 0)
>> +#define write_c0_mailbox0(val) __write_32bit_c0_register($20, 0, val)
>> +
>> +#define read_c0_mailbox1()        __read_32bit_c0_register($20, 1)
>> +#define write_c0_mailbox1(val) __write_32bit_c0_register($20, 1, val)
>> +
>> +#define read_c0_mailbox2()        __read_32bit_c0_register($20, 2)
>> +#define write_c0_mailbox2(val) __write_32bit_c0_register($20, 2, val)
>> +
>> +#define read_c0_mailbox3()        __read_32bit_c0_register($20, 3)
>> +#define write_c0_mailbox3(val) __write_32bit_c0_register($20, 3, val)
>> +
>> +#define smp_clr_pending(mask) do {        \
>> +        unsigned int stat;        \
>> +        stat = read_c0_corestatus();    \
>> +        stat &= ~((mask) & 0xff);    \
>> +        write_c0_corestatus(stat);    \
>> +    } while (0)
>> +
>> +/*
>> + * Core Control register
>> + */
>> +#define CORECTRL_SLEEP1M_SHIFT    17
>> +#define CORECTRL_SLEEP1M    (_ULCAST_(0x1) << CORECTRL_SLEEP1M_SHIFT)
>> +#define CORECTRL_SLEEP0M_SHIFT    16
>> +#define CORECTRL_SLEEP0M    (_ULCAST_(0x1) << CORECTRL_SLEEP0M_SHIFT)
>> +#define CORECTRL_RPC1_SHIFT    9
>> +#define CORECTRL_RPC1        (_ULCAST_(0x1) << CORECTRL_RPC1_SHIFT)
>> +#define CORECTRL_RPC0_SHIFT    8
>> +#define CORECTRL_RPC0        (_ULCAST_(0x1) << CORECTRL_RPC0_SHIFT)
>> +#define CORECTRL_SWRST1_SHIFT    1
>> +#define CORECTRL_SWRST1        (_ULCAST_(0x1) << CORECTRL_SWRST1_SHIFT)
>> +#define CORECTRL_SWRST0_SHIFT    0
>> +#define CORECTRL_SWRST0        (_ULCAST_(0x1) << CORECTRL_SWRST0_SHIFT)
>> +
>> +/*
>> + * Core Status register
>> + */
>> +#define CORESTATUS_SLEEP1_SHIFT    17
>> +#define CORESTATUS_SLEEP1    (_ULCAST_(0x1) << CORESTATUS_SLEEP1_SHIFT)
>> +#define CORESTATUS_SLEEP0_SHIFT    16
>> +#define CORESTATUS_SLEEP0    (_ULCAST_(0x1) << CORESTATUS_SLEEP0_SHIFT)
>> +#define CORESTATUS_IRQ1P_SHIFT    9
>> +#define CORESTATUS_IRQ1P    (_ULCAST_(0x1) << CORESTATUS_IRQ1P_SHIFT)
>> +#define CORESTATUS_IRQ0P_SHIFT    8
>> +#define CORESTATUS_IRQ0P    (_ULCAST_(0x1) << CORESTATUS_IRQ8P_SHIFT)
>> +#define CORESTATUS_MIRQ1P_SHIFT    1
>> +#define CORESTATUS_MIRQ1P    (_ULCAST_(0x1) << CORESTATUS_MIRQ1P_SHIFT)
>> +#define CORESTATUS_MIRQ0P_SHIFT    0
>> +#define CORESTATUS_MIRQ0P    (_ULCAST_(0x1) << CORESTATUS_MIRQ0P_SHIFT)
>> +
>> +/*
>> + * Reset Entry & IRQ Mask register
>> + */
>> +#define REIM_ENTRY_SHIFT    16
>> +#define REIM_ENTRY        (_ULCAST_(0xffff) << REIM_ENTRY_SHIFT)
>> +#define REIM_IRQ1M_SHIFT    9
>> +#define REIM_IRQ1M        (_ULCAST_(0x1) << REIM_IRQ1M_SHIFT)
>> +#define REIM_IRQ0M_SHIFT    8
>> +#define REIM_IRQ0M        (_ULCAST_(0x1) << REIM_IRQ0M_SHIFT)
>> +#define REIM_MBOXIRQ1M_SHIFT    1
>> +#define REIM_MBOXIRQ1M        (_ULCAST_(0x1) << REIM_MBOXIRQ1M_SHIFT)
>> +#define REIM_MBOXIRQ0M_SHIFT    0
>> +#define REIM_MBOXIRQ0M        (_ULCAST_(0x1) << REIM_MBOXIRQ0M_SHIFT)
>> +
>> +extern void jz4780_smp_init(void);
>> +extern void jz4780_secondary_cpu_entry(void);
>> +
>> +#endif /* __MIPS_ASM_MACH_JZ4740_SMP_H__ */
>> diff --git a/arch/mips/jz4740/Kconfig b/arch/mips/jz4740/Kconfig
>> index 412d2fa..2b88557 100644
>> --- a/arch/mips/jz4740/Kconfig
>> +++ b/arch/mips/jz4740/Kconfig
>> @@ -34,9 +34,11 @@ config MACH_JZ4770
>>
>>  config MACH_JZ4780
>>      bool
>> +    select GENERIC_CLOCKEVENTS_BROADCAST if SMP
>>      select MIPS_CPU_SCACHE
>>      select SYS_HAS_CPU_MIPS32_R2
>>      select SYS_SUPPORTS_HIGHMEM
>> +    select SYS_SUPPORTS_SMP
>>
>>  config MACH_X1000
>>      bool
>> diff --git a/arch/mips/jz4740/Makefile b/arch/mips/jz4740/Makefile
>> index 6de14c0..0a0f024 100644
>> --- a/arch/mips/jz4740/Makefile
>> +++ b/arch/mips/jz4740/Makefile
>> @@ -12,3 +12,8 @@ CFLAGS_setup.o = -I$(src)/../../../scripts/dtc/libfdt
>>  # PM support
>>
>>  obj-$(CONFIG_PM) += pm.o
>> +
>> +# SMP support
>> +
>> +obj-$(CONFIG_SMP) += smp.o
>> +obj-$(CONFIG_SMP) += smp-entry.o
>> diff --git a/arch/mips/jz4740/prom.c b/arch/mips/jz4740/prom.c
>> index ff4555c..4acf5c2c 100644
>> --- a/arch/mips/jz4740/prom.c
>> +++ b/arch/mips/jz4740/prom.c
>
> That file is gone in mips-next. You should rebase your patchset on top 
> of mips-next.
>

OK, I will fix it in the next version.

> Cheers,
> -Paul
>
>> @@ -8,10 +8,14 @@
>>
>>  #include <asm/bootinfo.h>
>>  #include <asm/fw/fw.h>
>> +#include <asm/mach-jz4740/smp.h>
>>
>>  void __init prom_init(void)
>>  {
>>      fw_init_cmdline();
>> +
>> +    if (IS_ENABLED(CONFIG_SMP))
>> +        jz4780_smp_init();
>>  }
>>
>>  void __init prom_free_prom_memory(void)
>> diff --git a/arch/mips/jz4740/smp-entry.S b/arch/mips/jz4740/smp-entry.S
>> new file mode 100644
>> index 00000000..20049a3
>> --- /dev/null
>> +++ b/arch/mips/jz4740/smp-entry.S
>> @@ -0,0 +1,57 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + *  Copyright (C) 2013, Paul Burton <paul.burton@imgtec.com>
>> + *  JZ4780 SMP entry point
>> + */
>> +
>> +#include <asm/addrspace.h>
>> +#include <asm/asm.h>
>> +#include <asm/asmmacro.h>
>> +#include <asm/cacheops.h>
>> +#include <asm/mipsregs.h>
>> +
>> +#define CACHE_SIZE (32 * 1024)
>> +#define CACHE_LINESIZE 32
>> +
>> +.extern jz4780_cpu_entry_sp
>> +.extern jz4780_cpu_entry_gp
>> +
>> +.section .text.smp-entry
>> +.balign 0x10000
>> +.set noreorder
>> +LEAF(jz4780_secondary_cpu_entry)
>> +    mtc0    zero, CP0_CAUSE
>> +
>> +    li    t0, ST0_CU0
>> +    mtc0    t0, CP0_STATUS
>> +
>> +    /* cache setup */
>> +    li    t0, KSEG0
>> +    ori    t1, t0, CACHE_SIZE
>> +    mtc0    zero, CP0_TAGLO, 0
>> +1:    cache    Index_Store_Tag_I, 0(t0)
>> +    cache    Index_Store_Tag_D, 0(t0)
>> +    bne    t0, t1, 1b
>> +     addiu    t0, t0, CACHE_LINESIZE
>> +
>> +    /* kseg0 cache attribute */
>> +    mfc0    t0, CP0_CONFIG, 0
>> +    ori    t0, t0, CONF_CM_CACHABLE_NONCOHERENT
>> +    mtc0    t0, CP0_CONFIG, 0
>> +
>> +    /* pagemask */
>> +    mtc0    zero, CP0_PAGEMASK, 0
>> +
>> +    /* retrieve sp */
>> +    la    t0, jz4780_cpu_entry_sp
>> +    lw    sp, 0(t0)
>> +
>> +    /* retrieve gp */
>> +    la    t0, jz4780_cpu_entry_gp
>> +    lw    gp, 0(t0)
>> +
>> +    /* jump to the kernel in kseg0 */
>> +    la    t0, smp_bootstrap
>> +    jr    t0
>> +     nop
>> +    END(jz4780_secondary_cpu_entry)
>> diff --git a/arch/mips/jz4740/smp.c b/arch/mips/jz4740/smp.c
>> new file mode 100644
>> index 00000000..d95d22a
>> --- /dev/null
>> +++ b/arch/mips/jz4740/smp.c
>> @@ -0,0 +1,258 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + *  Copyright (C) 2013, Paul Burton <paul.burton@imgtec.com>
>> + *  JZ4780 SMP
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/delay.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/of.h>
>> +#include <linux/sched.h>
>> +#include <linux/sched/task_stack.h>
>> +#include <linux/smp.h>
>> +#include <linux/tick.h>
>> +#include <asm/mach-jz4740/smp.h>
>> +#include <asm/smp-ops.h>
>> +
>> +static struct clk *cpu_clock_gates[CONFIG_NR_CPUS] = { NULL };
>> +
>> +u32 jz4780_cpu_entry_sp;
>> +u32 jz4780_cpu_entry_gp;
>> +
>> +static struct cpumask cpu_running;
>> +
>> +static DEFINE_SPINLOCK(smp_lock);
>> +
>> +static irqreturn_t mbox_handler(int irq, void *dev_id)
>> +{
>> +    int cpu = smp_processor_id();
>> +    u32 action, status;
>> +
>> +    spin_lock(&smp_lock);
>> +
>> +    switch (cpu) {
>> +    case 0:
>> +        action = read_c0_mailbox0();
>> +        write_c0_mailbox0(0);
>> +        break;
>> +    case 1:
>> +        action = read_c0_mailbox1();
>> +        write_c0_mailbox1(0);
>> +        break;
>> +    case 2:
>> +        action = read_c0_mailbox2();
>> +        write_c0_mailbox2(0);
>> +        break;
>> +    case 3:
>> +        action = read_c0_mailbox3();
>> +        write_c0_mailbox3(0);
>> +        break;
>> +    default:
>> +        panic("unhandled cpu %d!", cpu);
>> +    }
>> +
>> +    /* clear pending mailbox interrupt */
>> +    status = read_c0_corestatus();
>> +    status &= ~(CORESTATUS_MIRQ0P << cpu);
>> +    write_c0_corestatus(status);
>> +
>> +    spin_unlock(&smp_lock);
>> +
>> +    if (action & SMP_RESCHEDULE_YOURSELF)
>> +        scheduler_ipi();
>> +    if (action & SMP_CALL_FUNCTION)
>> +        generic_smp_call_function_interrupt();
>> +
>> +    return IRQ_HANDLED;
>> +}
>> +
>> +static void jz4780_smp_setup(void)
>> +{
>> +    u32 addr, reim;
>> +    int cpu;
>> +
>> +    reim = read_c0_reim();
>> +
>> +    for (cpu = 0; cpu < NR_CPUS; cpu++) {
>> +        __cpu_number_map[cpu] = cpu;
>> +        __cpu_logical_map[cpu] = cpu;
>> +        set_cpu_possible(cpu, true);
>> +    }
>> +
>> +    /* mask mailbox interrupts for this core */
>> +    reim &= ~REIM_MBOXIRQ0M;
>> +    write_c0_reim(reim);
>> +
>> +    /* clear mailboxes & pending mailbox IRQs */
>> +    write_c0_mailbox0(0);
>> +    write_c0_mailbox1(0);
>> +    write_c0_corestatus(0);
>> +
>> +    /* set reset entry point */
>> +    addr = KSEG1ADDR((u32)&jz4780_secondary_cpu_entry);
>> +    WARN_ON(addr & ~REIM_ENTRY);
>> +    reim &= ~REIM_ENTRY;
>> +    reim |= addr & REIM_ENTRY;
>> +
>> +    /* unmask mailbox interrupts for this core */
>> +    reim |= REIM_MBOXIRQ0M;
>> +    write_c0_reim(reim);
>> +    set_c0_status(STATUSF_IP3);
>> +    irq_enable_hazard();
>> +
>> +    cpumask_set_cpu(cpu, &cpu_running);
>> +}
>> +
>> +static void jz4780_smp_prepare_cpus(unsigned int max_cpus)
>> +{
>> +    struct device_node *cpu_node;
>> +    unsigned cpu, ctrl;
>> +    int err;
>> +
>> +    /* setup the mailbox IRQ */
>> +    err = request_irq(MIPS_CPU_IRQ_BASE + 3, mbox_handler,
>> +            IRQF_PERCPU | IRQF_NO_THREAD, "core mailbox", NULL);
>> +    if (err)
>> +        pr_err("request_irq() on core mailbox failed\n");
>> +
>> +    ctrl = read_c0_corectrl();
>> +
>> +    for_each_of_cpu_node(cpu_node) {
>> +        cpu = of_cpu_node_to_id(cpu_node);
>> +        if (cpu < 0) {
>> +            pr_err("Failed to read index of %s\n",
>> +                   cpu_node->full_name);
>> +            continue;
>> +        }
>> +
>> +        /* use reset entry point from REIM register */
>> +        ctrl |= CORECTRL_RPC0 << cpu;
>> +
>> +        cpu_clock_gates[cpu] = of_clk_get(cpu_node, 0);
>> +        if (IS_ERR(cpu_clock_gates[cpu])) {
>> +            cpu_clock_gates[cpu] = NULL;
>> +            continue;
>> +        }
>> +
>> +        err = clk_prepare(cpu_clock_gates[cpu]);
>> +        if (err)
>> +            pr_err("Failed to prepare CPU clock gate\n");
>> +    }
>> +
>> +    write_c0_corectrl(ctrl);
>> +}
>> +
>> +static int jz4780_boot_secondary(int cpu, struct task_struct *idle)
>> +{
>> +    unsigned long flags;
>> +    u32 ctrl;
>> +
>> +    spin_lock_irqsave(&smp_lock, flags);
>> +
>> +    /* ensure the core is in reset */
>> +    ctrl = read_c0_corectrl();
>> +    ctrl |= CORECTRL_SWRST0 << cpu;
>> +    write_c0_corectrl(ctrl);
>> +
>> +    /* ungate core clock */
>> +    if (cpu_clock_gates[cpu])
>> +        clk_enable(cpu_clock_gates[cpu]);
>> +
>> +    /* set entry sp/gp register values */
>> +    jz4780_cpu_entry_sp = __KSTK_TOS(idle);
>> +    jz4780_cpu_entry_gp = (u32)task_thread_info(idle);
>> +    smp_wmb();
>> +
>> +    /* take the core out of reset */
>> +    ctrl &= ~(CORECTRL_SWRST0 << cpu);
>> +    write_c0_corectrl(ctrl);
>> +
>> +    cpumask_set_cpu(cpu, &cpu_running);
>> +
>> +    spin_unlock_irqrestore(&smp_lock, flags);
>> +
>> +    return 0;
>> +}
>> +
>> +static void jz4780_init_secondary(void)
>> +{
>> +}
>> +
>> +static void jz4780_smp_finish(void)
>> +{
>> +    u32 reim;
>> +
>> +    spin_lock(&smp_lock);
>> +
>> +    /* unmask mailbox interrupts for this core */
>> +    reim = read_c0_reim();
>> +    reim |= REIM_MBOXIRQ0M << smp_processor_id();
>> +    write_c0_reim(reim);
>> +
>> +    spin_unlock(&smp_lock);
>> +
>> +    /* unmask interrupts for this core */
>> +    change_c0_status(ST0_IM, STATUSF_IP3 | STATUSF_IP2 |
>> +             STATUSF_IP1 | STATUSF_IP0);
>> +    irq_enable_hazard();
>> +
>> +    /* force broadcast timer */
>> +    tick_broadcast_force();
>> +}
>> +
>> +static void jz4780_send_ipi_single_locked(int cpu, unsigned int action)
>> +{
>> +    u32 mbox;
>> +
>> +    switch (cpu) {
>> +    case 0:
>> +        mbox = read_c0_mailbox0();
>> +        write_c0_mailbox0(mbox | action);
>> +        break;
>> +    case 1:
>> +        mbox = read_c0_mailbox1();
>> +        write_c0_mailbox1(mbox | action);
>> +        break;
>> +    default:
>> +        panic("unhandled cpu %d!", cpu);
>> +    }
>> +}
>> +
>> +static void jz4780_send_ipi_single(int cpu, unsigned int action)
>> +{
>> +    unsigned long flags;
>> +
>> +    spin_lock_irqsave(&smp_lock, flags);
>> +    jz4780_send_ipi_single_locked(cpu, action);
>> +    spin_unlock_irqrestore(&smp_lock, flags);
>> +}
>> +
>> +static void jz4780_send_ipi_mask(const struct cpumask *mask,
>> +                 unsigned int action)
>> +{
>> +    unsigned long flags;
>> +    int cpu;
>> +
>> +    spin_lock_irqsave(&smp_lock, flags);
>> +
>> +    for_each_cpu(cpu, mask)
>> +        jz4780_send_ipi_single_locked(cpu, action);
>> +
>> +    spin_unlock_irqrestore(&smp_lock, flags);
>> +}
>> +
>> +static struct plat_smp_ops jz4780_smp_ops = {
>> +    .send_ipi_single = jz4780_send_ipi_single,
>> +    .send_ipi_mask = jz4780_send_ipi_mask,
>> +    .init_secondary = jz4780_init_secondary,
>> +    .smp_finish = jz4780_smp_finish,
>> +    .boot_secondary = jz4780_boot_secondary,
>> +    .smp_setup = jz4780_smp_setup,
>> +    .prepare_cpus = jz4780_smp_prepare_cpus,
>> +};
>> +
>> +void __init jz4780_smp_init(void)
>> +{
>> +    register_smp_ops(&jz4780_smp_ops);
>> +}
>> diff --git a/arch/mips/kernel/idle.c b/arch/mips/kernel/idle.c
>> index 37f8e78..d33f2d4 100644
>> --- a/arch/mips/kernel/idle.c
>> +++ b/arch/mips/kernel/idle.c
>> @@ -18,6 +18,7 @@
>>  #include <asm/cpu-type.h>
>>  #include <asm/idle.h>
>>  #include <asm/mipsregs.h>
>> +#include <asm/r4kcache.h>
>>
>>  /*
>>   * Not all of the MIPS CPUs have the "wait" instruction available. 
>> Moreover,
>> @@ -88,6 +89,34 @@ static void __cpuidle rm7k_wait_irqoff(void)
>>  }
>>
>>  /*
>> + * The Ingenic jz4780 SMP variant has to write back dirty cache 
>> lines before
>> + * executing wait. The CPU & cache clock will be gated until we 
>> return from
>> + * the wait, and if another core attempts to access data from our 
>> data cache
>> + * during this time then it will lock up.
>> + */
>> +void jz4780_smp_wait_irqoff(void)
>> +{
>> +    unsigned long pending = read_c0_cause() & read_c0_status() & 
>> CAUSEF_IP;
>> +
>> +    /*
>> +     * Going to idle has a significant overhead due to the cache 
>> flush so
>> +     * try to avoid it if we'll immediately be woken again due to an 
>> IRQ.
>> +     */
>> +    if (!need_resched() && !pending) {
>> +        r4k_blast_dcache();
>> +
>> +        __asm__(
>> +        "    .set push    \n"
>> +        "    .set mips3    \n"
>> +        "    sync        \n"
>> +        "    wait        \n"
>> +        "    .set pop    \n");
>> +    }
>> +
>> +    local_irq_enable();
>> +}
>> +
>> +/*
>>   * Au1 'wait' is only useful when the 32kHz counter is used as timer,
>>   * since coreclock (and the cp0 counter) stops upon executing it. 
>> Only an
>>   * interrupt can wake it, so they must be enabled before entering 
>> idle modes.
>> @@ -172,7 +201,6 @@ void __init check_wait(void)
>>      case CPU_CAVIUM_OCTEON_PLUS:
>>      case CPU_CAVIUM_OCTEON2:
>>      case CPU_CAVIUM_OCTEON3:
>> -    case CPU_XBURST:
>>      case CPU_LOONGSON32:
>>      case CPU_XLR:
>>      case CPU_XLP:
>> @@ -246,6 +274,11 @@ void __init check_wait(void)
>>             cpu_wait = r4k_wait;
>>           */
>>          break;
>> +    case CPU_XBURST:
>> +        if (IS_ENABLED(CONFIG_SMP))
>> +            cpu_wait = jz4780_smp_wait_irqoff;
>> +        else
>> +            cpu_wait = r4k_wait;
>>      default:
>>          break;
>>      }
>> -- 
>> 2.7.4
>>
>

