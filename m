Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3903613A056
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jan 2020 05:55:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728633AbgANEzd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Jan 2020 23:55:33 -0500
Received: from forward102o.mail.yandex.net ([37.140.190.182]:56070 "EHLO
        forward102o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726121AbgANEzd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 13 Jan 2020 23:55:33 -0500
Received: from forward100q.mail.yandex.net (forward100q.mail.yandex.net [IPv6:2a02:6b8:c0e:4b:0:640:4012:bb97])
        by forward102o.mail.yandex.net (Yandex) with ESMTP id EFEEE66818C2;
        Tue, 14 Jan 2020 07:55:26 +0300 (MSK)
Received: from mxback10q.mail.yandex.net (mxback10q.mail.yandex.net [IPv6:2a02:6b8:c0e:1b4:0:640:b6ef:cb3])
        by forward100q.mail.yandex.net (Yandex) with ESMTP id E8F447080005;
        Tue, 14 Jan 2020 07:55:26 +0300 (MSK)
Received: from localhost (localhost [::1])
        by mxback10q.mail.yandex.net (mxback/Yandex) with ESMTP id gdkOWWt0M5-tNqmt6QQ;
        Tue, 14 Jan 2020 07:55:26 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1578977726;
        bh=nKx7+Z46oc69nz4fqL+5UmieTf1RZ+gG73gKgUHz4nA=;
        h=Message-Id:Cc:Subject:In-Reply-To:Date:References:To:From;
        b=SY3lXW5GtGjmEXhFVctzX453X9EWbep9Cz0AvgIkET6Bks4ujxNMe6y2Y++x0H2K0
         PpZ9HOz4YOh59t4rZCp7QmB7p6HR+pc6so/+t+C3mOe5gaYpuvKgi1PBNNdO9Osk7e
         T2f/kgS8NPfr1T44K+uZlPWmE2iN/bn8dDI+TiFo=
Authentication-Results: mxback10q.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by vla5-4452c58d5c14.qloud-c.yandex.net with HTTP;
        Tue, 14 Jan 2020 07:55:23 +0300
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Envelope-From: yjx@flygoat.com
To:     =?utf-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "paul.burton@mips.com" <paul.burton@mips.com>,
        "paulburton@kernel.org" <paulburton@kernel.org>,
        "jhogan@kernel.org" <jhogan@kernel.org>,
        "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "syq@debian.org" <syq@debian.org>,
        "ralf@linux-mips.org" <ralf@linux-mips.org>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "jason@lakedaemon.net" <jason@lakedaemon.net>,
        "maz@kernel.org" <maz@kernel.org>,
        "chenhc@lemote.com" <chenhc@lemote.com>,
        "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
        "ebiederm@xmission.com" <ebiederm@xmission.com>,
        "keescook@chromium.org" <keescook@chromium.org>,
        "ak@linux.intel.com" <ak@linux.intel.com>,
        "krzk@kernel.org" <krzk@kernel.org>,
        "paul@crapouillou.net" <paul@crapouillou.net>,
        "prasannatsmkumar@gmail.com" <prasannatsmkumar@gmail.com>,
        "sernia.zhou@foxmail.com" <sernia.zhou@foxmail.com>,
        "zhenwenjin@gmail.com" <zhenwenjin@gmail.com>
In-Reply-To: <1578933813-80122-3-git-send-email-zhouyanjie@wanyeetech.com>
References: <Introduce SMP support for CI20 (based on JZ4780).>
         <1578933813-80122-1-git-send-email-zhouyanjie@wanyeetech.com> <1578933813-80122-3-git-send-email-zhouyanjie@wanyeetech.com>
Subject: Re: [PATCH 1/6] MIPS: JZ4780: Introduce SMP support.
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date:   Tue, 14 Jan 2020 12:55:23 +0800
Message-Id: <3722601578977723@vla5-4452c58d5c14.qloud-c.yandex.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



14.01.2020, 00:44, "周琰杰 (Zhou Yanjie)" <zhouyanjie@wanyeetech.com>:
> Forward port smp support from kernel 3.18.3 of CI20_linux
> to upstream kernel 5.5.
>
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> ---
>  arch/mips/include/asm/mach-jz4740/jz4780-smp.h | 91 ++++++++
>  arch/mips/jz4740/Kconfig | 3 +
>  arch/mips/jz4740/Makefile | 5 +
>  arch/mips/jz4740/prom.c | 4 +
>  arch/mips/jz4740/smp-entry.S | 57 +++++
>  arch/mips/jz4740/smp.c | 300 +++++++++++++++++++++++++
>  arch/mips/kernel/idle.c | 14 +-
>  drivers/irqchip/irq-ingenic.c | 21 ++
>  8 files changed, 494 insertions(+), 1 deletion(-)
>  create mode 100644 arch/mips/include/asm/mach-jz4740/jz4780-smp.h
>  create mode 100644 arch/mips/jz4740/smp-entry.S
>  create mode 100644 arch/mips/jz4740/smp.c

Hi 周琰杰:

Thanks for your work! See my review comments below


> diff --git a/arch/mips/jz4740/smp.c b/arch/mips/jz4740/smp.c
> new file mode 100644
> index 00000000..d36e0b2
> --- /dev/null
> +++ b/arch/mips/jz4740/smp.c
> @@ -0,0 +1,300 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2013, Paul Burton <paul.burton@imgtec.com>
> + * JZ4780 SMP
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/interrupt.h>
> +#include <linux/of.h>
> +#include <linux/sched.h>
> +#include <linux/sched/task_stack.h>
> +#include <linux/smp.h>
> +#include <linux/tick.h>
> +#include <asm/mach-jz4740/jz4780-smp.h>
> +#include <asm/r4kcache.h>
> +#include <asm/smp-ops.h>
> +
> +static struct clk *cpu_clock_gates[CONFIG_NR_CPUS] = { NULL };
> +
> +u32 jz4780_cpu_entry_sp;
> +u32 jz4780_cpu_entry_gp;
> +
> +static struct cpumask cpu_running;
> +
> +static DEFINE_SPINLOCK(smp_lock);
> +
> +extern void (*r4k_blast_dcache)(void);
> +
> +/*
> + * The Ingenic jz4780 SMP variant has to write back dirty cache lines before
> + * executing wait. The CPU & cache clock will be gated until we return from
> + * the wait, and if another core attempts to access data from our data cache
> + * during this time then it will lock up.
> + */
> +void jz4780_smp_wait_irqoff(void)
> +{
> + unsigned long pending = read_c0_cause() & read_c0_status() & CAUSEF_IP;
> +
> + /*
> + * Going to idle has a significant overhead due to the cache flush so
> + * try to avoid it if we'll immediately be woken again due to an IRQ.
> + */
> + if (!need_resched() && !pending) {
> + r4k_blast_dcache();
> +
> + __asm__(
> + " .set push \n"
> + " .set mips3 \n"
> + " sync \n"
> + " wait \n"
> + " .set pop \n");
> + }
> +
> + local_irq_enable();
> +}
> +
> +static irqreturn_t mbox_handler(int irq, void *dev_id)
> +{
> + int cpu = smp_processor_id();
> + u32 action, status;
> +
> + spin_lock(&smp_lock);
> +
> + switch (cpu) {
> + case 0:
> + action = read_c0_mailbox0();
> + write_c0_mailbox0(0);
> + break;
> + case 1:
> + action = read_c0_mailbox1();
> + write_c0_mailbox1(0);
> + break;
> + default:
> + panic("unhandled cpu %d!", cpu);
> + }
> +
> + /* clear pending mailbox interrupt */
> + status = read_c0_corestatus();
> + status &= ~(CORESTATUS_MIRQ0P << cpu);
> + write_c0_corestatus(status);
> +
> + spin_unlock(&smp_lock);
> +
> + if (action & SMP_RESCHEDULE_YOURSELF)
> + scheduler_ipi();
> + if (action & SMP_CALL_FUNCTION)
> + generic_smp_call_function_interrupt();
> +
> + return IRQ_HANDLED;
> +}
> +
> +static struct irqaction mbox_action = {
> + .handler = mbox_handler,
> + .name = "core mailbox",
> + .flags = IRQF_PERCPU | IRQF_NO_THREAD,
> +};
> +
> +static void jz4780_smp_setup(void)
> +{
> + u32 addr, reim;
> + int cpu;
> +
> + reim = read_c0_reim();
> +
> + for (cpu = 0; cpu < NR_CPUS; cpu++) {
> + __cpu_number_map[cpu] = cpu;
> + __cpu_logical_map[cpu] = cpu;
> + set_cpu_possible(cpu, true);
> + }
> +
> + /* mask mailbox interrupts for this core */
> + reim &= ~REIM_MBOXIRQ0M;
> + write_c0_reim(reim);
> +
> + /* clear mailboxes & pending mailbox IRQs */
> + write_c0_mailbox0(0);
> + write_c0_mailbox1(0);
> + write_c0_corestatus(0);
> +
> + /* set reset entry point */
> + addr = KSEG1ADDR((u32)&jz4780_secondary_cpu_entry);
> + WARN_ON(addr & ~REIM_ENTRY);
> + reim &= ~REIM_ENTRY;
> + reim |= addr & REIM_ENTRY;
> +
> + /* unmask mailbox interrupts for this core */
> + reim |= REIM_MBOXIRQ0M;
> + write_c0_reim(reim);
> + set_c0_status(STATUSF_IP3);

Only IP3? Could other interrupt be routed to this core?

> + irq_enable_hazard();
> +
> + cpumask_set_cpu(cpu, &cpu_running);
> +}
> +
> +static void jz4780_smp_prepare_cpus(unsigned int max_cpus)
> +{
> + struct device_node *cpu_node;
> + unsigned cpu, ctrl;
> + int err;
> +
> + /* setup the mailbox IRQ */
> + setup_irq(MIPS_CPU_IRQ_BASE + 3, &mbox_action);
> +
> + init_cpu_present(cpu_possible_mask);
> +
> + ctrl = read_c0_corectrl();
> +
> + for (cpu = 0; cpu < max_cpus; cpu++) {
> + /* use reset entry point from REIM register */
> + ctrl |= CORECTRL_RPC0 << cpu;
> + }
> +
> + for_each_compatible_node(cpu_node, NULL, "ingenic,xburst") {
> + err = of_property_read_u32_index(cpu_node, "reg", 0, &cpu);
> + if (err) {
> + pr_err("Failed to read index of %s\n",
> + cpu_node->full_name);
> + continue;
> + }
> +
> + cpu_clock_gates[cpu] = of_clk_get(cpu_node, 0);
> + if (IS_ERR(cpu_clock_gates[cpu])) {
> + cpu_clock_gates[cpu] = NULL;
> + continue;
> + }
> +
> + err = clk_prepare(cpu_clock_gates[cpu]);
> + if (err)
> + pr_err("Failed to prepare CPU clock gate\n");
> + }
> +
> + write_c0_corectrl(ctrl);
> +}
> +
> +static int jz4780_boot_secondary(int cpu, struct task_struct *idle)
> +{
> + unsigned long flags;
> + u32 ctrl;
> +
> + spin_lock_irqsave(&smp_lock, flags);
> +
> + /* ensure the core is in reset */
> + ctrl = read_c0_corectrl();
> + ctrl |= CORECTRL_SWRST0 << cpu;
> + write_c0_corectrl(ctrl);
> +
> + /* ungate core clock */
> + if (cpu_clock_gates[cpu])
> + clk_enable(cpu_clock_gates[cpu]);
> +
> + /* power up the core */
> + {
> + void __iomem *lpcr = (void __iomem *)0xb0000004;
> + void __iomem *clkgr1 = (void __iomem *)0xb0000028;

Please avoid raw address pointer. If it's clock related, should we make a clk
driver for it? Or add a SMP controller node in DeviceTree for that address?
At least define a macro for it.

> +
> + writel(readl(lpcr) & ~BIT(31), lpcr);
> + writel(readl(clkgr1) & ~BIT(15), clkgr1);

The same, bits need macros. Otherwise, it's too hard for others to read.

> +
> + /* wait for the CPU to be powered up */
> + while (readl(lpcr) & BIT(27))
> + ;

Should we add a timeout check to avoid a dead loop? 

> + }
> +
> + /* set entry sp/gp register values */
> + jz4780_cpu_entry_sp = __KSTK_TOS(idle);
> + jz4780_cpu_entry_gp = (u32)task_thread_info(idle);
> + smp_wmb();
> +
> + /* take the core out of reset */
> + ctrl &= ~(CORECTRL_SWRST0 << cpu);
> + write_c0_corectrl(ctrl);
> +
> + cpumask_set_cpu(cpu, &cpu_running);
> +
> + spin_unlock_irqrestore(&smp_lock, flags);
> +
> + return 0;
> +}
> +
> +static void jz4780_init_secondary(void)
> +{
> +}
> +
> +static void jz4780_smp_finish(void)
> +{
> + u32 reim;
> +
> + spin_lock(&smp_lock);
> +
> + /* unmask mailbox interrupts for this core */
> + reim = read_c0_reim();
> + reim |= REIM_MBOXIRQ0M << smp_processor_id();
> + write_c0_reim(reim);
> +
> + spin_unlock(&smp_lock);
> +
> + /* unmask interrupts for this core */
> + change_c0_status(ST0_IM, STATUSF_IP3 | STATUSF_IP2 |
> + STATUSF_IP1 | STATUSF_IP0);
> + irq_enable_hazard();
> +
> + /* force broadcast timer */
> + tick_broadcast_force();
> +}
> +
> +static void jz4780_send_ipi_single_locked(int cpu, unsigned int action)
> +{
> + u32 mbox;
> +
> + switch (cpu) {
> + case 0:
> + mbox = read_c0_mailbox0();
> + write_c0_mailbox0(mbox | action);
> + break;
> + case 1:
> + mbox = read_c0_mailbox1();
> + write_c0_mailbox1(mbox | action);
> + break;
> + default:
> + panic("unhandled cpu %d!", cpu);
> + }
> +}
> +
> +static void jz4780_send_ipi_single(int cpu, unsigned int action)
> +{
> + unsigned long flags;
> +
> + spin_lock_irqsave(&smp_lock, flags);
> + jz4780_send_ipi_single_locked(cpu, action);
> + spin_unlock_irqrestore(&smp_lock, flags);
> +}
> +
> +static void jz4780_send_ipi_mask(const struct cpumask *mask,
> + unsigned int action)
> +{
> + unsigned long flags;
> + int cpu;
> +
> + spin_lock_irqsave(&smp_lock, flags);
> +
> + for_each_cpu(cpu, mask)
> + jz4780_send_ipi_single_locked(cpu, action);
> +
> + spin_unlock_irqrestore(&smp_lock, flags);
> +}
> +
> +static struct plat_smp_ops jz4780_smp_ops = {
> + .send_ipi_single = jz4780_send_ipi_single,
> + .send_ipi_mask = jz4780_send_ipi_mask,
> + .init_secondary = jz4780_init_secondary,
> + .smp_finish = jz4780_smp_finish,
> + .boot_secondary = jz4780_boot_secondary,
> + .smp_setup = jz4780_smp_setup,
> + .prepare_cpus = jz4780_smp_prepare_cpus,
> +};
> +
> +void jz4780_smp_init(void)
> +{
> + register_smp_ops(&jz4780_smp_ops);
> +}
> diff --git a/arch/mips/kernel/idle.c b/arch/mips/kernel/idle.c
> index 37f8e78..a406de3 100644
> --- a/arch/mips/kernel/idle.c
> +++ b/arch/mips/kernel/idle.c
> @@ -19,6 +19,10 @@
>  #include <asm/idle.h>
>  #include <asm/mipsregs.h>
>
> +#ifdef CONFIG_MACH_JZ4780
> +# include <asm/mach-jz4740/jz4780-smp.h>
> +#endif
> +
>  /*
>   * Not all of the MIPS CPUs have the "wait" instruction available. Moreover,
>   * the implementation of the "wait" feature differs between CPU families. This
> @@ -172,7 +176,6 @@ void __init check_wait(void)
>          case CPU_CAVIUM_OCTEON_PLUS:
>          case CPU_CAVIUM_OCTEON2:
>          case CPU_CAVIUM_OCTEON3:
> - case CPU_XBURST:
>          case CPU_LOONGSON32:
>          case CPU_XLR:
>          case CPU_XLP:
> @@ -246,6 +249,15 @@ void __init check_wait(void)
>                     cpu_wait = r4k_wait;
>                   */
>                  break;
> + case CPU_XBURST:
> +#if defined(CONFIG_MACH_JZ4780) && defined(CONFIG_SMP)
> + if (NR_CPUS > 1)
> + cpu_wait = jz4780_smp_wait_irqoff;
> + else
> + cpu_wait = r4k_wait;
> +#else
> + cpu_wait = r4k_wait;
> +#endif
>          default:
>                  break;
>          }
> diff --git a/drivers/irqchip/irq-ingenic.c b/drivers/irqchip/irq-ingenic.c
> index 01d18b3..56a9648 100644
> --- a/drivers/irqchip/irq-ingenic.c
> +++ b/drivers/irqchip/irq-ingenic.c
> @@ -17,6 +17,7 @@
>  #include <linux/delay.h>
>
>  #include <asm/io.h>
> +#include <asm/mipsregs.h>
>  #include <asm/mach-jz4740/irq.h>
>
>  struct ingenic_intc_data {
> @@ -32,6 +33,26 @@ struct ingenic_intc_data {
>  #define JZ_REG_INTC_PENDING 0x10
>  #define CHIP_SIZE 0x20
>
> +asmlinkage void plat_irq_dispatch(void)
> +{
> + uint32_t pending = read_c0_cause() & read_c0_status() & CAUSEF_IP;
> +
> + if (pending & CAUSEF_IP4) {
> + /* from OS timer */
> + do_IRQ(4);
> +#ifdef CONFIG_SMP
> + } else if (pending & CAUSEF_IP3) {
> + /* from a mailbox write */
> + do_IRQ(3);
> +#endif
> + } else if (pending & CAUSEF_IP2) {
> + /* from interrupt controller */
> + do_IRQ(2);
> + } else {
> + spurious_interrupt();
> + }
> +}
> +

Why we need this? irq-mips-cpu driver is doing the same thing.

>  static irqreturn_t intc_cascade(int irq, void *data)
>  {
>          struct ingenic_intc_data *intc = irq_get_handler_data(irq);
> --
> 2.7.4

Thanks.

--
Jiaxun Yang
