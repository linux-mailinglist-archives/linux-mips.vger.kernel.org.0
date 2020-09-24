Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 084DF27650E
	for <lists+linux-mips@lfdr.de>; Thu, 24 Sep 2020 02:31:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726694AbgIXAbx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 23 Sep 2020 20:31:53 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:46371 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726466AbgIXAbx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 23 Sep 2020 20:31:53 -0400
Received: by mail-il1-f195.google.com with SMTP id l16so1350130ilt.13
        for <linux-mips@vger.kernel.org>; Wed, 23 Sep 2020 17:31:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+lCw31FO/Z011lIYpX+gNYx6ddM7jUPZzKuHVU/rJ3Q=;
        b=sfgUFOEzOfMsDR69JBmxXe/2WbLFN6gdk3V8DM7nOlngJzT4m4YJocDOwwfXr8tpfb
         d4EEzUTHEhidQPQanDQoM8gKzMbOovYgTyK0kMsKyf39Ve6IBgLrN/YRBD3aEfd7vvwy
         v7MDl0UHMiFSy+E8rBcqwDhJCZEHp6wtRmp/jGMwoyvwCHKGMVCdzGTimaygtqaz3NYK
         ZkFOSREKngwleutD990NlqVUMz0RHlCyV6qq3XiIKa42AJBzhlJrWHBEdx149WobL8Pe
         AvZfB79Q4SbQF1JmHP7OReXyvFhq4jeiCMY+rvkEcUqHr+cOK/T3GQr5IfcvPtQqaYKs
         B39Q==
X-Gm-Message-State: AOAM533di90fr0AcwDmohN4Mhkr1YhFV1/peMAS7teZby84jrLF4Ip/I
        vtGL3nq/QdAiucvcRFOrx90EtX+FHgF18eWSbCNWgbxONC16rg==
X-Google-Smtp-Source: ABdhPJy8DkqrqVT6JCPZ0TmqIOkcqJXoGa3iOUdcPI4XF+c+2LMZZvvXHvIEi4eQcN/xyhfjUbCNMGT8nrACUpiNEHw=
X-Received: by 2002:a92:bf0e:: with SMTP id z14mr990058ilh.171.1600907511567;
 Wed, 23 Sep 2020 17:31:51 -0700 (PDT)
MIME-Version: 1.0
References: <1600828257-31316-1-git-send-email-chenhc@lemote.com>
 <1600828257-31316-3-git-send-email-chenhc@lemote.com> <2c8b9035-1ca4-cd46-5039-4e1a4af3a0c6@loongson.cn>
In-Reply-To: <2c8b9035-1ca4-cd46-5039-4e1a4af3a0c6@loongson.cn>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Thu, 24 Sep 2020 08:31:39 +0800
Message-ID: <CAAhV-H6F9yuxwqDENMWxL1X7AGCozp7x+pkPKA10oimTVEso6Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] MIPS: Loongson64: Add kexec/kdump support
To:     Jinyang He <hejinyang@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Eric Biederman <ebiederm@xmission.com>,
        Dave Young <dyoung@redhat.com>, Baoquan He <bhe@redhat.com>,
        Vivek Goyal <vgoyal@redhat.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        kexec@lists.infradead.org, Fuxin Zhang <zhangfx@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Youling Tang <tangyouling@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Jinyang,

On Wed, Sep 23, 2020 at 11:35 AM Jinyang He <hejinyang@loongson.cn> wrote:
>
> Hi, Huacai,
>
> On 09/23/2020 10:30 AM, Huacai Chen wrote:
> > Add kexec/kdump support for Loongson64 by:
> > 1, Provide Loongson-specific kexec functions: loongson_kexec_prepare,
> >     loongson_kexec_shutdown and loongson_crash_shutdown;
> > 2, Provide Loongson-specific assembly code in kexec_smp_wait;
> > 3, Clear mailbox in loongson3_smp_setup() since KEXEC bypass BIOS;
> > 4, KEXEC always run at boot CPU, but KDUMP may triggered at non-boot
> >     CPU. Loongson64 assume boot CPU is the first possible cpu, so fix
> >     boot_cpu_id in prom_init_env();
> >
> > To start Loongson64, The boot CPU needs 3 parameters:
> > fw_arg0: the number of arguments in cmdline (i.e., argc).
> > fw_arg1: structure holds cmdline such as "root=/dev/sda1 console=tty"
> >           (i.e., argv).
> > fw_arg2: environment (i.e., envp, additional boot parameters from LEFI).
> >
> > Non-boot CPUs do not need parameters at once. They query their own IPI
> > mailbox to get PC, SP and GP in a loop until boot CPU brings them up.
> >
> > loongson_kexec_prepare(): Setup cmdline for kexec/kdump. The kexec/kdump
> > cmdline comes from kexec's "append" option string. This structure will
> > be parsed in fw_init_cmdline() of arch/mips/fw/lib/cmdline.c. Both image
> > ->control_code_page and the cmdline need to be in a safe memory region
> > (memory allocated by the old kernel may be corrupted by the new kernel).
> > In order to maintain compatibility for the old firmware, the low 2MB is
> > reserverd and safe for Loongson. So let KEXEC_CTRL_CODE and KEXEC_ARGV_
> > ADDR be here. LEFI parameters may be corrupted at runtime, so backup it
> > at mips_reboot_setup(), and then restore it at loongson_kexec_shutdown()
> > /loongson_crash_shutdown().
> >
> > loongson_kexec_shutdown(): Wake up all present CPUs and let them go to
> > reboot_code_buffer. Pass the kexec parameters to kexec_args.
> >
> > loongson_crash_shutdown(): Pass the kdump parameters to kexec_args.
> >
> > The assembly part in kexec_smp_wait provide a routine as BIOS does, in
> > order to keep secondary CPUs in a querying loop.
> >
> > Cc: Eric Biederman <ebiederm@xmission.com>
> > Signed-off-by: Huacai Chen <chenhc@lemote.com>
> > Signed-off-by: Jinyang He <hejinyang@loongson.cn>
> > Signed-off-by: Youling Tang <tangyouling@loongson.cn>
> > ---
> >   arch/mips/kernel/relocate_kernel.S |  27 +++++++++
> >   arch/mips/loongson64/env.c         |   7 +++
> >   arch/mips/loongson64/reset.c       | 111 +++++++++++++++++++++++++++++++++++++
> >   arch/mips/loongson64/smp.c         |   5 ++
> >   4 files changed, 150 insertions(+)
> >
> > diff --git a/arch/mips/kernel/relocate_kernel.S b/arch/mips/kernel/relocate_kernel.S
> > index ac87089..91b2932 100644
> > --- a/arch/mips/kernel/relocate_kernel.S
> > +++ b/arch/mips/kernel/relocate_kernel.S
> > @@ -133,6 +133,33 @@ LEAF(kexec_smp_wait)
> >   #else
> >       sync
> >   #endif
> > +
> > +#ifdef CONFIG_CPU_LOONGSON64
> > +#define MAILBOX_BASE 0x900000003ff01000
> > +     /* s0:prid s1:initfn */
> > +     /* t0:base t1:cpuid t2:node t9:count */
> > +     mfc0  t1, CP0_EBASE
> > +     andi  t1, MIPS_EBASE_CPUNUM
> > +     dli   t0, MAILBOX_BASE    /* mailbox base */
> > +     dins  t0, t1, 8, 2        /* insert core id*/
> > +     dext  t2, t1, 2, 2
> > +     dins  t0, t2, 44, 2       /* insert node id */
> > +     mfc0  s0, CP0_PRID
> > +     andi  s0, s0, 0xf
> > +     blt   s0, 0x6, 1f         /* Loongson-3A1000 */
> > +     bgt   s0, 0x7, 1f         /* Loongson-3A2000/3A3000 */
> > +     dins  t0, t2, 14, 2       /* Loongson-3B1000/3B1500 need bit 15~14 */
>
> Here is right, and I have a trivial idea that machine type
> can be passed by secondary_kexec_args.
It seems not a good idea, if something is detectable, don't use an argument.

>
> > +1:   li    t9, 0x100           /* wait for init loop */
> > +2:   addiu t9, -1              /* limit mailbox access */
> > +     bnez  t9, 2b
> > +     ld    s1, 0x20(t0)        /* get PC via mailbox reg0 */
> > +     beqz  s1, 1b
> > +     ld    sp, 0x28(t0)        /* get SP via mailbox reg1 */
> > +     ld    gp, 0x30(t0)        /* get GP via mailbox reg2 */
> > +     ld    a1, 0x38(t0)
> > +     jr    s1                  /* jump to initial PC */
> > +#endif
> > +
> >       j               s1
> >       END(kexec_smp_wait)
> >   #endif
> > diff --git a/arch/mips/loongson64/env.c b/arch/mips/loongson64/env.c
> > index 134cb8e..e937f31 100644
> > --- a/arch/mips/loongson64/env.c
> > +++ b/arch/mips/loongson64/env.c
> > @@ -120,6 +120,13 @@ void __init prom_init_env(void)
> >       loongson_sysconf.nr_cpus = ecpu->nr_cpus;
> >       loongson_sysconf.boot_cpu_id = ecpu->cpu_startup_core_id;
> >       loongson_sysconf.reserved_cpus_mask = ecpu->reserved_cores_mask;
> > +#ifdef CONFIG_KEXEC
> > +     loongson_sysconf.boot_cpu_id = get_ebase_cpunum();
> > +     loongson_sysconf.reserved_cpus_mask |=
> > +             (1 << loongson_sysconf.boot_cpu_id) - 1;
> > +     pr_info("Boot CPU ID is being fixed from %d to %d\n",
> > +             ecpu->cpu_startup_core_id, loongson_sysconf.boot_cpu_id);
> > +#endif
>
> I don't think secondary CPU will go here.
> At arch/mips/kernel/machine_kexec.c: kexec_reboot(), CPU0 goes
> relocate_new_kernel() and secondary CPUs go to smp_wait. Why
> kdump may triggered at non-boot CPU?
In the past, kexec_reboot() may not be executed on CPU0. For the kexec
case, kernel_kexec() calls migrate_to_reboot_cpu(), which ensures
kexec_reboot() executed on CPU0. But for the kdump case, crash_kexec()
doesn't call migrate_to_reboot_cpu(), so kexec_reboot() may execute on
any CPU because panic can happen on any CPU. Moreover, crash_kexec()
shouldn't call migrate_to_reboot_cpu(), because it is in a "dangerous"
status, which is different from kexec.

However, after commit 62cac480f33f8f9413d609cb1601b0ee5 ("MIPS: kexec:
Make a framework for both jumping and halting on nonboot CPUs"),
kexec_reboot() works as you say. So you are right here and the "fixup"
will be removed in the next version. Since the "fixup" doesn't break
anything, I have never removed it.

>
> >       if (ecpu->nr_cpus > NR_CPUS || ecpu->nr_cpus == 0)
> >               loongson_sysconf.nr_cpus = NR_CPUS;
> >       loongson_sysconf.nr_nodes = (loongson_sysconf.nr_cpus +
> > diff --git a/arch/mips/loongson64/reset.c b/arch/mips/loongson64/reset.c
> > index 3bb8a1e..b1e71f37 100644
> > --- a/arch/mips/loongson64/reset.c
> > +++ b/arch/mips/loongson64/reset.c
> > @@ -6,9 +6,14 @@
> >    * Copyright (C) 2009 Lemote, Inc.
> >    * Author: Zhangjin Wu, wuzhangjin@gmail.com
> >    */
> > +#include <linux/cpu.h>
> > +#include <linux/delay.h>
> >   #include <linux/init.h>
> > +#include <linux/kexec.h>
> >   #include <linux/pm.h>
> > +#include <linux/slab.h>
> >
> > +#include <asm/bootinfo.h>
> >   #include <asm/idle.h>
> >   #include <asm/reboot.h>
> >
> > @@ -47,12 +52,118 @@ static void loongson_halt(void)
> >       }
> >   }
> >
> > +#ifdef CONFIG_KEXEC
> > +
> > +/* 0X80000000~0X80200000 is safe */
> > +#define MAX_ARGS     64
> > +#define KEXEC_CTRL_CODE      0xFFFFFFFF80100000UL
> > +#define KEXEC_ARGV_ADDR      0xFFFFFFFF80108000UL
> > +#define KEXEC_ARGV_SIZE      COMMAND_LINE_SIZE
> > +#define KEXEC_ENVP_SIZE      4800
> > +
> > +static int kexec_argc;
> > +static int kdump_argc;
> > +static void *kexec_argv;
> > +static void *kdump_argv;
> > +static void *kexec_envp;
> > +
> > +static int loongson_kexec_prepare(struct kimage *image)
> > +{
> > +     int i, argc = 0;
> > +     unsigned int *argv;
> > +     char *str, *ptr, *bootloader = "kexec";
> > +
> > +     /* argv at offset 0, argv[] at offset KEXEC_ARGV_SIZE/2 */
> > +     if (image->type == KEXEC_TYPE_DEFAULT)
> > +             argv = (unsigned int *)kexec_argv;
> > +     else
> > +             argv = (unsigned int *)kdump_argv;
> > +
> > +     argv[argc++] = (unsigned int)(KEXEC_ARGV_ADDR + KEXEC_ARGV_SIZE/2);
> > +
> > +     for (i = 0; i < image->nr_segments; i++) {
> > +             if (!strncmp(bootloader, (char *)image->segment[i].buf,
> > +                             strlen(bootloader))) {
> > +                     /*
> > +                      * convert command line string to array
> > +                      * of parameters (as bootloader does).
> > +                      */
> > +                     int offt;
> > +                     str = (char *)argv + KEXEC_ARGV_SIZE/2;
> > +                     memcpy(str, image->segment[i].buf, KEXEC_ARGV_SIZE/2);
> > +                     ptr = strchr(str, ' ');
> > +
> > +                     while (ptr && (argc < MAX_ARGS)) {
> > +                             *ptr = '\0';
> > +                             if (ptr[1] != ' ') {
> > +                                     offt = (int)(ptr - str + 1);
> > +                                     argv[argc] = KEXEC_ARGV_ADDR + KEXEC_ARGV_SIZE/2 + offt;
> > +                                     argc++;
> > +                             }
> > +                             ptr = strchr(ptr + 1, ' ');
> > +                     }
> > +                     break;
> > +             }
> > +     }
> > +
> > +     if (image->type == KEXEC_TYPE_DEFAULT)
> > +             kexec_argc = argc;
> > +     else
> > +             kdump_argc = argc;
> > +
> > +     /* kexec/kdump need a safe page to save reboot_code_buffer */
> > +     image->control_code_page = virt_to_page((void *)KEXEC_CTRL_CODE);
>
> I thought find a hole in Crash Kernel may better than a static position.
> It just a trivial idea, too.
It is very difficult, the "safe region" should not be corrupted by
both the old and new kernel, so the low 2MB is a good place.


>
> > +
> > +     return 0;
> > +}
> > +
> > +static void loongson_kexec_shutdown(void)
> > +{
> > +#ifdef CONFIG_SMP
> > +     int cpu;
> > +
> > +     /* All CPUs go to reboot_code_buffer */
> > +     for_each_possible_cpu(cpu)
> > +             if (!cpu_online(cpu))
> > +                     cpu_device_up(get_cpu_device(cpu));
> > +#endif
> > +     kexec_args[0] = kexec_argc;
> > +     kexec_args[1] = fw_arg1;
> > +     kexec_args[2] = fw_arg2;
> > +     memcpy((void *)fw_arg1, kexec_argv, KEXEC_ARGV_SIZE);
> > +     memcpy((void *)fw_arg2, kexec_envp, KEXEC_ENVP_SIZE);
> > +}
> > +
> > +static void loongson_crash_shutdown(struct pt_regs *regs)
> > +{
> > +     default_machine_crash_shutdown(regs);
> > +     kexec_args[0] = kdump_argc;
> > +     kexec_args[1] = fw_arg1;
> > +     kexec_args[2] = fw_arg2;
> > +     memcpy((void *)fw_arg1, kdump_argv, KEXEC_ARGV_SIZE);
> > +     memcpy((void *)fw_arg2, kexec_envp, KEXEC_ENVP_SIZE);
> > +}
> > +
> > +#endif
> > +
> >   static int __init mips_reboot_setup(void)
> >   {
> >       _machine_restart = loongson_restart;
> >       _machine_halt = loongson_halt;
> >       pm_power_off = loongson_poweroff;
> >
> > +#ifdef CONFIG_KEXEC
> > +     kexec_argv = kmalloc(KEXEC_ARGV_SIZE, GFP_KERNEL);
> > +     kdump_argv = kmalloc(KEXEC_ARGV_SIZE, GFP_KERNEL);
> > +     kexec_envp = kmalloc(KEXEC_ENVP_SIZE, GFP_KERNEL);
> > +     fw_arg1 = KEXEC_ARGV_ADDR;
> > +     memcpy(kexec_envp, (void *)fw_arg2, KEXEC_ENVP_SIZE);
> > +
> > +     _machine_kexec_prepare = loongson_kexec_prepare;
> > +     _machine_kexec_shutdown = loongson_kexec_shutdown;
> > +     _machine_crash_shutdown = loongson_crash_shutdown;
> > +#endif
> > +
> >       return 0;
> >   }
> >
> > diff --git a/arch/mips/loongson64/smp.c b/arch/mips/loongson64/smp.c
> > index e744e1b..55697ac 100644
> > --- a/arch/mips/loongson64/smp.c
> > +++ b/arch/mips/loongson64/smp.c
> > @@ -420,6 +420,11 @@ static void __init loongson3_smp_setup(void)
> >       ipi_status0_regs_init();
> >       ipi_en0_regs_init();
> >       ipi_mailbox_buf_init();
> > +
> > +     /* BIOS clear the mailbox, but KEXEC bypass BIOS so clear here */
> > +     for (i = 0; i < loongson_sysconf.nr_cpus; i++)
> > +             loongson3_ipi_write64(0, (void *)(ipi_mailbox_buf[i]+0x0));
> > +
>
> Does it need? It take a long time after secondary CPUs geting PC in a loop.
> Or you can clear it early.
This is nearly the same story as the above "fixup". In the past, if
kdump triggered on a non-boot CPU, the boot CPU would go to the query
loop. So, this will also be removed. Thank you.

>
> Thanks,
> - Jinyang.
>
> >       cpu_set_core(&cpu_data[0],
> >                    cpu_logical_map(0) % loongson_sysconf.cores_per_package);
> >       cpu_data[0].package = cpu_logical_map(0) / loongson_sysconf.cores_per_package;
>
