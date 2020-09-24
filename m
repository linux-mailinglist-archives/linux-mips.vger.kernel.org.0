Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64801276645
	for <lists+linux-mips@lfdr.de>; Thu, 24 Sep 2020 04:15:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726316AbgIXCP1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 23 Sep 2020 22:15:27 -0400
Received: from mail.loongson.cn ([114.242.206.163]:36994 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726281AbgIXCP0 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 23 Sep 2020 22:15:26 -0400
Received: from [10.130.0.60] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxmuQsAWxfPKIXAA--.8348S3;
        Thu, 24 Sep 2020 10:15:09 +0800 (CST)
Subject: Re: [PATCH 3/3] MIPS: Loongson64: Add kexec/kdump support
To:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <1600828257-31316-1-git-send-email-chenhc@lemote.com>
 <1600828257-31316-3-git-send-email-chenhc@lemote.com>
 <46167e76-3179-825c-606c-fc35fda8eb4e@flygoat.com>
 <CAAhV-H6AD5SufuMgYvVppTKytg9GZ5zydn5JLm4nFD84ONTfkg@mail.gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Eric Biederman <ebiederm@xmission.com>,
        Dave Young <dyoung@redhat.com>, Baoquan He <bhe@redhat.com>,
        Vivek Goyal <vgoyal@redhat.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        kexec@lists.infradead.org, Fuxin Zhang <zhangfx@lemote.com>,
        Youling Tang <tangyouling@loongson.cn>
From:   Jinyang He <hejinyang@loongson.cn>
Message-ID: <bb6214e3-05e7-9102-6da9-00d5d4f88e05@loongson.cn>
Date:   Thu, 24 Sep 2020 10:15:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAAhV-H6AD5SufuMgYvVppTKytg9GZ5zydn5JLm4nFD84ONTfkg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxmuQsAWxfPKIXAA--.8348S3
X-Coremail-Antispam: 1UD129KBjvJXoW3JFW8XFW3Zr18ZrWDAw47urg_yoW3KFWfp3
        yUA3WDKF4kGr1Iyw1Fv345ZF4Fq3yrtFZrWa12qr1ru3s0qw1xtrWUWF1fCF97Zr1rtF10
        9a48Wr1vkF4YkaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBY14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
        4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
        7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
        1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
        n2kIc2xKxwCYjI0SjxkI62AI1cAE67vIY487MxkIecxEwVAFwVW8JwCF04k20xvY0x0EwI
        xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
        Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
        IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k2
        6cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
        0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbN6pPUUUUU==
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 09/24/2020 09:19 AM, Huacai Chen wrote:
> Hi, Jiaxun,
>
> On Wed, Sep 23, 2020 at 9:37 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>>
>>
>> 在 2020/9/23 10:30, Huacai Chen 写道:
>>> Add kexec/kdump support for Loongson64 by:
>>> 1, Provide Loongson-specific kexec functions: loongson_kexec_prepare,
>>>      loongson_kexec_shutdown and loongson_crash_shutdown;
>>> 2, Provide Loongson-specific assembly code in kexec_smp_wait;
>>> 3, Clear mailbox in loongson3_smp_setup() since KEXEC bypass BIOS;
>>> 4, KEXEC always run at boot CPU, but KDUMP may triggered at non-boot
>>>      CPU. Loongson64 assume boot CPU is the first possible cpu, so fix
>>>      boot_cpu_id in prom_init_env();
>>>
>>> To start Loongson64, The boot CPU needs 3 parameters:
>>> fw_arg0: the number of arguments in cmdline (i.e., argc).
>>> fw_arg1: structure holds cmdline such as "root=/dev/sda1 console=tty"
>>>            (i.e., argv).
>>> fw_arg2: environment (i.e., envp, additional boot parameters from LEFI).
>>>
>>> Non-boot CPUs do not need parameters at once. They query their own IPI
>>> mailbox to get PC, SP and GP in a loop until boot CPU brings them up.
>>>
>>> loongson_kexec_prepare(): Setup cmdline for kexec/kdump. The kexec/kdump
>>> cmdline comes from kexec's "append" option string. This structure will
>>> be parsed in fw_init_cmdline() of arch/mips/fw/lib/cmdline.c. Both image
>>> ->control_code_page and the cmdline need to be in a safe memory region
>>> (memory allocated by the old kernel may be corrupted by the new kernel).
>>> In order to maintain compatibility for the old firmware, the low 2MB is
>>> reserverd and safe for Loongson. So let KEXEC_CTRL_CODE and KEXEC_ARGV_
>>> ADDR be here. LEFI parameters may be corrupted at runtime, so backup it
>>> at mips_reboot_setup(), and then restore it at loongson_kexec_shutdown()
>>> /loongson_crash_shutdown().
>>>
>>> loongson_kexec_shutdown(): Wake up all present CPUs and let them go to
>>> reboot_code_buffer. Pass the kexec parameters to kexec_args.
>>>
>>> loongson_crash_shutdown(): Pass the kdump parameters to kexec_args.
>>>
>>> The assembly part in kexec_smp_wait provide a routine as BIOS does, in
>>> order to keep secondary CPUs in a querying loop.
>>>
>>> Cc: Eric Biederman <ebiederm@xmission.com>
>>> Signed-off-by: Huacai Chen <chenhc@lemote.com>
>>> Signed-off-by: Jinyang He <hejinyang@loongson.cn>
>>> Signed-off-by: Youling Tang <tangyouling@loongson.cn>
>>> ---
>>>    arch/mips/kernel/relocate_kernel.S |  27 +++++++++
>>>    arch/mips/loongson64/env.c         |   7 +++
>>>    arch/mips/loongson64/reset.c       | 111 +++++++++++++++++++++++++++++++++++++
>>>    arch/mips/loongson64/smp.c         |   5 ++
>>>    4 files changed, 150 insertions(+)
>>>
>>> diff --git a/arch/mips/kernel/relocate_kernel.S b/arch/mips/kernel/relocate_kernel.S
>>> index ac87089..91b2932 100644
>>> --- a/arch/mips/kernel/relocate_kernel.S
>>> +++ b/arch/mips/kernel/relocate_kernel.S
>>> @@ -133,6 +133,33 @@ LEAF(kexec_smp_wait)
>>>    #else
>>>        sync
>>>    #endif
>> Hi Jingyang, Huacai,
>>
>> Thanks a lot for what you have done on Loongson64 support.
>>
>> Just add my cents here.
>>
>>> +
>>> +#ifdef CONFIG_CPU_LOONGSON64
>>> +#define MAILBOX_BASE 0x900000003ff01000
>>> +     /* s0:prid s1:initfn */
>>> +     /* t0:base t1:cpuid t2:node t9:count */
>>> +     mfc0  t1, CP0_EBASE
>>> +     andi  t1, MIPS_EBASE_CPUNUM
>>> +     dli   t0, MAILBOX_BASE    /* mailbox base */
>>> +     dins  t0, t1, 8, 2        /* insert core id*/
>>> +     dext  t2, t1, 2, 2
>>> +     dins  t0, t2, 44, 2       /* insert node id */
>>> +     mfc0  s0, CP0_PRID
>>> +     andi  s0, s0, 0xf
>>> +     blt   s0, 0x6, 1f         /* Loongson-3A1000 */
>>> +     bgt   s0, 0x7, 1f         /* Loongson-3A2000/3A3000 */
>>> +     dins  t0, t2, 14, 2       /* Loongson-3B1000/3B1500 need bit 15~14 */
>>> +1:   li    t9, 0x100           /* wait for init loop */
>>> +2:   addiu t9, -1              /* limit mailbox access */
>>> +     bnez  t9, 2b
>>> +     ld    s1, 0x20(t0)        /* get PC via mailbox reg0 */
>>> +     beqz  s1, 1b
>>> +     ld    sp, 0x28(t0)        /* get SP via mailbox reg1 */
>>> +     ld    gp, 0x30(t0)        /* get GP via mailbox reg2 */
>>> +     ld    a1, 0x38(t0)
>>> +     jr    s1                  /* jump to initial PC */
>>> +#endif
>>> +
>> I'm just a little bit uncomfortable with this kind of hardcoded address.
>> Is it possible to generate kexec_smp_wait with uasm, or pass the SMP
>> base as a parameter of this function?
> This is very difficult, and moreover, uasm wrap the assembly in C
> functions, can it be more beautiful? In my opinion, uasm is only used
> for performance-critical routines, not for beautiful code. But anyway,
> 0x900000003ff01000 should be improved.
>
>> Also I do think we can handle kexec_flag in Loongson's platform SMP,
>> or even generic MIPS SMP code just like what cavium did so this kind
>> of platform quirk can be avoided.
> I doubt this can be done, every CPU has its own method of SMP bringup.
>
>>>        j               s1
>>>        END(kexec_smp_wait)
>>>    #endif
>>> diff --git a/arch/mips/loongson64/env.c b/arch/mips/loongson64/env.c
>>> index 134cb8e..e937f31 100644
>>> --- a/arch/mips/loongson64/env.c
>>> +++ b/arch/mips/loongson64/env.c
>>> @@ -120,6 +120,13 @@ void __init prom_init_env(void)
>>>        loongson_sysconf.nr_cpus = ecpu->nr_cpus;
>>>        loongson_sysconf.boot_cpu_id = ecpu->cpu_startup_core_id;
>>>        loongson_sysconf.reserved_cpus_mask = ecpu->reserved_cores_mask;
>>> +#ifdef CONFIG_KEXEC
>>> +     loongson_sysconf.boot_cpu_id = get_ebase_cpunum();
>>> +     loongson_sysconf.reserved_cpus_mask |=
>>> +             (1 << loongson_sysconf.boot_cpu_id) - 1;
>>> +     pr_info("Boot CPU ID is being fixed from %d to %d\n",
>>> +             ecpu->cpu_startup_core_id, loongson_sysconf.boot_cpu_id);
>>> +#endif
>> This could be done unconditionally and split to another patch,
>> "MIPS: Loongson64: Quirk inaccurate bootcore from the firmware"
> This will be wholly removed.
>
>>>        if (ecpu->nr_cpus > NR_CPUS || ecpu->nr_cpus == 0)
>>>                loongson_sysconf.nr_cpus = NR_CPUS;
>>>        loongson_sysconf.nr_nodes = (loongson_sysconf.nr_cpus +
>>> diff --git a/arch/mips/loongson64/reset.c b/arch/mips/loongson64/reset.c
>>> index 3bb8a1e..b1e71f37 100644
>>> --- a/arch/mips/loongson64/reset.c
>>> +++ b/arch/mips/loongson64/reset.c
>>> @@ -6,9 +6,14 @@
>>>     * Copyright (C) 2009 Lemote, Inc.
>>>     * Author: Zhangjin Wu, wuzhangjin@gmail.com
>>>     */
>>> +#include <linux/cpu.h>
>>> +#include <linux/delay.h>
>>>    #include <linux/init.h>
>>> +#include <linux/kexec.h>
>>>    #include <linux/pm.h>
>>> +#include <linux/slab.h>
>>>
>>> +#include <asm/bootinfo.h>
>>>    #include <asm/idle.h>
>>>    #include <asm/reboot.h>
>>>
>>> @@ -47,12 +52,118 @@ static void loongson_halt(void)
>>>        }
>>>    }
>>>
>>> +#ifdef CONFIG_KEXEC
>>> +
>>> +/* 0X80000000~0X80200000 is safe */
>>> +#define MAX_ARGS     64
>>> +#define KEXEC_CTRL_CODE      0xFFFFFFFF80100000UL
>>> +#define KEXEC_ARGV_ADDR      0xFFFFFFFF80108000UL
>>> +#define KEXEC_ARGV_SIZE      COMMAND_LINE_SIZE
>>> +#define KEXEC_ENVP_SIZE      4800
>> I won't say it's safe.
>> Loongson-2K's PMON may place reboot vector here, also some
>> UEFI firmware may place their suspend stack here.
>> What if we allocate these buffer at runtime?
> The layout of low 2MB in our design:
> 0x80000000 the first MB, the first 64K：Exception vector
> 0x80010000 the first MB, the second 64K：STR(suspend) data
> 0x80020000 the first MB, the third and fourth 64K：UEFI HOB
> 0x80040000 the first MB, the fifth 64K：RT-Thread for SMC
> 0x80100000 the second MB, the first 64K：KEXEC code
> 0x80108000 the second MB, the second 64K：KEXEC data

Hi, Huacai,

Thank you for your explanation. It's really a safe region.
What I want to do is similar to other architecture which find a hole
in Crash kernel. It's also safe if "mem=" limit Capture kernel RAM. "mem="
is useful and sorry for the wrong comment yesterday. "mem=" excluded
cmdline segment and elfcorehdr segment. I have an idea that add a segment
for Loongson64 platform control_code_page. Find the hole by top-down that
different from common bottom-up way.
As you said, it's really difficult. More work should be do not only kernel
but also kexec-tools. At this stage, I am in favor of you that
control_code_page should point to the safe ragion in low 2MB.

> All allocated buffer from the old kernel is not safe, because the new
> kernel may be larger than the old kernel. Even if the low 2MB is not a
> perfect place, it is the best place we can choose.
>
> Huacai
>
>> Thanks.
>>
>> - Jiaxun
>>

