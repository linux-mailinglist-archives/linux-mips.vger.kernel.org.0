Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DE8E2E7D9B
	for <lists+linux-mips@lfdr.de>; Thu, 31 Dec 2020 02:24:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbgLaBY1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 30 Dec 2020 20:24:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:59330 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726322AbgLaBY0 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 30 Dec 2020 20:24:26 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A13312222D
        for <linux-mips@vger.kernel.org>; Thu, 31 Dec 2020 01:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609377825;
        bh=BoRpIrF4EW+C+PPh21gaIZfjNMoZGrf+zuACMPZahWA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=s7W0wPkwHS1SxH5e3qK/wthStHboPzqc4NcdqMa6/YiQIdiec3+Xp1yYU/xsd0b8J
         pwV0A0J41+eTwbtYIMy+od01uI9AZOLsoXtuzwzxv4FkuByzWmXEKQ+hbUCqY2nQ2X
         tXda6tNO0N+QvkV/7nlERncJW+5Zyg3T6UImZvhTl313JDAYz+pkccxY/5yN9BHhGx
         hTHn5zi3p444+tUhY+jvTV83gzN9m4lVoOdJWfWmijPGpapBzQ3Ej1R5vzwV+CHRBe
         SA8VU0sBrTvV69dwGSvvyqXOP54w5kpjeTNIzAESVc35HTtUYWcauYP/E07br2Nrsm
         XLsV24AaJZkQA==
Received: by mail-il1-f174.google.com with SMTP id n9so16317466ili.0
        for <linux-mips@vger.kernel.org>; Wed, 30 Dec 2020 17:23:45 -0800 (PST)
X-Gm-Message-State: AOAM531cd7Mq7GRZE8Ar6/izz5wdbU4cRQUNYax2Pis+CNcVmXEWpz8x
        4dhCaqNlnPHTGVXQ19288b0qUOhkEeEou4JoQg4=
X-Google-Smtp-Source: ABdhPJxLW9Tb7RP2srT0yxHctXypUOJ5c+IVy8fhUOandUM3FvQLbjxCjxuhlYnFjc+r/e9eeQ0kMArv1/kCHnQmiaI=
X-Received: by 2002:a92:870b:: with SMTP id m11mr52083854ild.134.1609377824964;
 Wed, 30 Dec 2020 17:23:44 -0800 (PST)
MIME-Version: 1.0
References: <20201221120220.3186744-1-chenhuacai@kernel.org> <a671a323-768b-b461-2ce4-ecc1e92d4cc6@loongson.cn>
In-Reply-To: <a671a323-768b-b461-2ce4-ecc1e92d4cc6@loongson.cn>
From:   Huacai Chen <chenhuacai@kernel.org>
Date:   Thu, 31 Dec 2020 09:23:33 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4GDxhg1YqWy-g7VuCeE7BZ0ibaVSr1ibzJqXjuaBn3_w@mail.gmail.com>
Message-ID: <CAAhV-H4GDxhg1YqWy-g7VuCeE7BZ0ibaVSr1ibzJqXjuaBn3_w@mail.gmail.com>
Subject: Re: [PATCH V3] MIPS: Loongson64: Add kexec/kdump support
To:     Jinyang He <hejinyang@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Eric Biederman <ebiederm@xmission.com>,
        Dave Young <dyoung@redhat.com>, Baoquan He <bhe@redhat.com>,
        Vivek Goyal <vgoyal@redhat.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        kexec@lists.infradead.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Youling Tang <tangyouling@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Thomas,

On Tue, Dec 22, 2020 at 2:41 PM Jinyang He <hejinyang@loongson.cn> wrote:
>
> On 12/21/2020 08:02 PM, Huacai Chen wrote:
>
> > From: Huacai Chen <chenhc@lemote.com>
> >
> > Add kexec/kdump support for Loongson64 by:
> > 1, Provide Loongson-specific kexec functions: loongson_kexec_prepare(),
> >     loongson_kexec_shutdown() and loongson_crash_shutdown();
> > 2, Provide Loongson-specific assembly code in kexec_smp_wait();
> >
> > To start Loongson64, The boot CPU needs 3 parameters:
> > fw_arg0: the number of arguments in cmdline (i.e., argc).
> > fw_arg1: structure holds cmdline such as "root=/dev/sda1 console=tty"
> >           (i.e., argv).
> > fw_arg2: environment (i.e., envp, additional boot parameters from LEFI).
> >
> > Non-boot CPUs do not need one parameter as the IPI mailbox base address.
> > They query their own IPI mailbox to get PC, SP and GP in a loopi, until
> > the boot CPU brings them up.
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
> > The layout of low 2MB memory in our design:
> > 0x80000000, the first MB, the first 64K, Exception vectors
> > 0x80010000, the first MB, the second 64K, STR (suspend) data
> > 0x80020000, the first MB, the third and fourth 64K, UEFI HOB
> > 0x80040000, the first MB, the fifth 64K, RT-Thread for SMC
> > 0x80100000, the second MB, the first 64K, KEXEC code
> > 0x80108000, the second MB, the second 64K, KEXEC data
> >
> > Cc: Eric Biederman <ebiederm@xmission.com>
> > Signed-off-by: Huacai Chen <chenhuacai@kernel.org>
> > Signed-off-by: Jinyang He <hejinyang@loongson.cn>
> > Signed-off-by: Youling Tang <tangyouling@loongson.cn>
> > ---
> >   V3: Some minor improvements suggested by Jinyang He.
> >
> >   arch/mips/kernel/relocate_kernel.S |  28 +++++++
> >   arch/mips/loongson64/reset.c       | 113 +++++++++++++++++++++++++++++
> >   2 files changed, 141 insertions(+)
> kexec-tools v2.0.21
> 3A3000/7A1000 3A4000/7A1000
>
> Test kexec:
>
> # kexec -l vmlinux --append="<cmdline>"
> # kexec -e
>
> Result: OK!
>
> Test kdump: We need a capture kernel to dump the panic kernel.
> To build the capture kernel:
> make loongson3_defconfig and set CONFIG_PROC_VMCORE=y , CONFIG_CRASH_DUMP=y
> and CONFIG_PHYSICAL_START=0xffffffff84000000
>
> # kexec -p vmlinux(capture) --append="<cmdline>"
> # echo c > /proc/sysrq-trigger
>
> Result: OK!
>
> Tested-by: Jinyang He <hejinyang@loongson.cn>
>
> Thanks, :-)
> Jinyang
Any comments?

Huacai
>
> > diff --git a/arch/mips/kernel/relocate_kernel.S b/arch/mips/kernel/relocate_kernel.S
> > index ac870893ba2d..f649ffa0f427 100644
> > --- a/arch/mips/kernel/relocate_kernel.S
> > +++ b/arch/mips/kernel/relocate_kernel.S
> > @@ -6,6 +6,7 @@
> >
> >   #include <asm/asm.h>
> >   #include <asm/asmmacro.h>
> > +#include <asm/cpu.h>
> >   #include <asm/regdef.h>
> >   #include <asm/mipsregs.h>
> >   #include <asm/stackframe.h>
> > @@ -133,6 +134,33 @@ LEAF(kexec_smp_wait)
> >   #else
> >       sync
> >   #endif
> > +
> > +#ifdef CONFIG_CPU_LOONGSON64
> > +     /* s0:prid s1:initfn */
> > +     /* a0:base t1:cpuid t2:node t9:count */
> > +     mfc0            t1, CP0_EBASE
> > +     andi            t1, MIPS_EBASE_CPUNUM
> > +     dins            a0, t1, 8, 2       /* insert core id*/
> > +     dext            t2, t1, 2, 2
> > +     dins            a0, t2, 44, 2      /* insert node id */
> > +     mfc0            s0, CP0_PRID
> > +     andi            s0, s0, (PRID_IMP_MASK | PRID_REV_MASK)
> > +     beq             s0, (PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3B_R1), 1f
> > +     beq             s0, (PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3B_R2), 1f
> > +     b               2f                 /* Loongson-3A1000/3A2000/3A3000/3A4000 */
> > +1:   dins            a0, t2, 14, 2      /* Loongson-3B1000/3B1500 need bit 15~14 */
> > +2:   li              t9, 0x100          /* wait for init loop */
> > +3:   addiu           t9, -1             /* limit mailbox access */
> > +     bnez            t9, 3b
> > +     lw              s1, 0x20(a0)       /* check PC as an indicator */
> > +     beqz            s1, 2b
> > +     ld              s1, 0x20(a0)       /* get PC via mailbox reg0 */
> > +     ld              sp, 0x28(a0)       /* get SP via mailbox reg1 */
> > +     ld              gp, 0x30(a0)       /* get GP via mailbox reg2 */
> > +     ld              a1, 0x38(a0)
> > +     jr              s1                 /* jump to initial PC */
> > +#endif
> > +
> >       j               s1
> >       END(kexec_smp_wait)
> >   #endif
> > diff --git a/arch/mips/loongson64/reset.c b/arch/mips/loongson64/reset.c
> > index 3bb8a1ed9348..c97bfdc8c922 100644
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
> > @@ -47,12 +52,120 @@ static void loongson_halt(void)
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
> > +     secondary_kexec_args[0] = TO_UNCAC(0x3ff01000);
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
> > +     secondary_kexec_args[0] = TO_UNCAC(0x3ff01000);
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
>
