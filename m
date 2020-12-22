Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61ABF2E062A
	for <lists+linux-mips@lfdr.de>; Tue, 22 Dec 2020 07:43:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725961AbgLVGmR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Dec 2020 01:42:17 -0500
Received: from mail.loongson.cn ([114.242.206.163]:58714 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725964AbgLVGmR (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 22 Dec 2020 01:42:17 -0500
Received: from [10.130.0.64] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx78sMleFfSEsDAA--.8078S3;
        Tue, 22 Dec 2020 14:41:17 +0800 (CST)
Subject: Re: [PATCH V3] MIPS: Loongson64: Add kexec/kdump support
To:     Huacai Chen <chenhuacai@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Eric Biederman <ebiederm@xmission.com>,
        Dave Young <dyoung@redhat.com>, Baoquan He <bhe@redhat.com>,
        Vivek Goyal <vgoyal@redhat.com>
References: <20201221120220.3186744-1-chenhuacai@kernel.org>
Cc:     linux-mips@vger.kernel.org, kexec@lists.infradead.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Youling Tang <tangyouling@loongson.cn>
From:   Jinyang He <hejinyang@loongson.cn>
Message-ID: <a671a323-768b-b461-2ce4-ecc1e92d4cc6@loongson.cn>
Date:   Tue, 22 Dec 2020 14:41:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20201221120220.3186744-1-chenhuacai@kernel.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dx78sMleFfSEsDAA--.8078S3
X-Coremail-Antispam: 1UD129KBjvJXoW3Gr4xKF1fXFyfKw47Jr18Krg_yoWfGw1rpF
        W5C3WDKFZ5Xr42yrn5Zw4UZa4ruwn5AFy7Xa17C3s5GasrKr1UJF9YgFnFqFWvkrW5tF4S
        qFWYgr1FkF43K3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUB014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
        xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
        n2IY04v7Mxk0xIA0c2IEe2xFo4CEbIxvr21lc2xSY4AK67AK6r47MxAIw28IcxkI7VAKI4
        8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
        wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjx
        v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20E
        Y4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
        0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUea0PDUUUU
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 12/21/2020 08:02 PM, Huacai Chen wrote:

> From: Huacai Chen <chenhc@lemote.com>
>
> Add kexec/kdump support for Loongson64 by:
> 1, Provide Loongson-specific kexec functions: loongson_kexec_prepare(),
>     loongson_kexec_shutdown() and loongson_crash_shutdown();
> 2, Provide Loongson-specific assembly code in kexec_smp_wait();
>
> To start Loongson64, The boot CPU needs 3 parameters:
> fw_arg0: the number of arguments in cmdline (i.e., argc).
> fw_arg1: structure holds cmdline such as "root=/dev/sda1 console=tty"
>           (i.e., argv).
> fw_arg2: environment (i.e., envp, additional boot parameters from LEFI).
>
> Non-boot CPUs do not need one parameter as the IPI mailbox base address.
> They query their own IPI mailbox to get PC, SP and GP in a loopi, until
> the boot CPU brings them up.
>
> loongson_kexec_prepare(): Setup cmdline for kexec/kdump. The kexec/kdump
> cmdline comes from kexec's "append" option string. This structure will
> be parsed in fw_init_cmdline() of arch/mips/fw/lib/cmdline.c. Both image
> ->control_code_page and the cmdline need to be in a safe memory region
> (memory allocated by the old kernel may be corrupted by the new kernel).
> In order to maintain compatibility for the old firmware, the low 2MB is
> reserverd and safe for Loongson. So let KEXEC_CTRL_CODE and KEXEC_ARGV_
> ADDR be here. LEFI parameters may be corrupted at runtime, so backup it
> at mips_reboot_setup(), and then restore it at loongson_kexec_shutdown()
> /loongson_crash_shutdown().
>
> loongson_kexec_shutdown(): Wake up all present CPUs and let them go to
> reboot_code_buffer. Pass the kexec parameters to kexec_args.
>
> loongson_crash_shutdown(): Pass the kdump parameters to kexec_args.
>
> The assembly part in kexec_smp_wait provide a routine as BIOS does, in
> order to keep secondary CPUs in a querying loop.
>
> The layout of low 2MB memory in our design:
> 0x80000000, the first MB, the first 64K, Exception vectors
> 0x80010000, the first MB, the second 64K, STR (suspend) data
> 0x80020000, the first MB, the third and fourth 64K, UEFI HOB
> 0x80040000, the first MB, the fifth 64K, RT-Thread for SMC
> 0x80100000, the second MB, the first 64K, KEXEC code
> 0x80108000, the second MB, the second 64K, KEXEC data
>
> Cc: Eric Biederman <ebiederm@xmission.com>
> Signed-off-by: Huacai Chen <chenhuacai@kernel.org>
> Signed-off-by: Jinyang He <hejinyang@loongson.cn>
> Signed-off-by: Youling Tang <tangyouling@loongson.cn>
> ---
>   V3: Some minor improvements suggested by Jinyang He.
>
>   arch/mips/kernel/relocate_kernel.S |  28 +++++++
>   arch/mips/loongson64/reset.c       | 113 +++++++++++++++++++++++++++++
>   2 files changed, 141 insertions(+)
kexec-tools v2.0.21
3A3000/7A1000 3A4000/7A1000

Test kexec:

# kexec -l vmlinux --append="<cmdline>"
# kexec -e

Result: OK!

Test kdump: We need a capture kernel to dump the panic kernel.
To build the capture kernel:
make loongson3_defconfig and set CONFIG_PROC_VMCORE=y , CONFIG_CRASH_DUMP=y
and CONFIG_PHYSICAL_START=0xffffffff84000000

# kexec -p vmlinux(capture) --append="<cmdline>"
# echo c > /proc/sysrq-trigger

Result: OK!

Tested-by: Jinyang He <hejinyang@loongson.cn>

Thanks, :-)
Jinyang

> diff --git a/arch/mips/kernel/relocate_kernel.S b/arch/mips/kernel/relocate_kernel.S
> index ac870893ba2d..f649ffa0f427 100644
> --- a/arch/mips/kernel/relocate_kernel.S
> +++ b/arch/mips/kernel/relocate_kernel.S
> @@ -6,6 +6,7 @@
>   
>   #include <asm/asm.h>
>   #include <asm/asmmacro.h>
> +#include <asm/cpu.h>
>   #include <asm/regdef.h>
>   #include <asm/mipsregs.h>
>   #include <asm/stackframe.h>
> @@ -133,6 +134,33 @@ LEAF(kexec_smp_wait)
>   #else
>   	sync
>   #endif
> +
> +#ifdef CONFIG_CPU_LOONGSON64
> +	/* s0:prid s1:initfn */
> +	/* a0:base t1:cpuid t2:node t9:count */
> +	mfc0		t1, CP0_EBASE
> +	andi		t1, MIPS_EBASE_CPUNUM
> +	dins		a0, t1, 8, 2       /* insert core id*/
> +	dext		t2, t1, 2, 2
> +	dins		a0, t2, 44, 2      /* insert node id */
> +	mfc0		s0, CP0_PRID
> +	andi		s0, s0, (PRID_IMP_MASK | PRID_REV_MASK)
> +	beq		s0, (PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3B_R1), 1f
> +	beq		s0, (PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3B_R2), 1f
> +	b		2f                 /* Loongson-3A1000/3A2000/3A3000/3A4000 */
> +1:	dins		a0, t2, 14, 2      /* Loongson-3B1000/3B1500 need bit 15~14 */
> +2:	li		t9, 0x100          /* wait for init loop */
> +3:	addiu		t9, -1             /* limit mailbox access */
> +	bnez		t9, 3b
> +	lw		s1, 0x20(a0)       /* check PC as an indicator */
> +	beqz		s1, 2b
> +	ld		s1, 0x20(a0)       /* get PC via mailbox reg0 */
> +	ld		sp, 0x28(a0)       /* get SP via mailbox reg1 */
> +	ld		gp, 0x30(a0)       /* get GP via mailbox reg2 */
> +	ld		a1, 0x38(a0)
> +	jr		s1                 /* jump to initial PC */
> +#endif
> +
>   	j		s1
>   	END(kexec_smp_wait)
>   #endif
> diff --git a/arch/mips/loongson64/reset.c b/arch/mips/loongson64/reset.c
> index 3bb8a1ed9348..c97bfdc8c922 100644
> --- a/arch/mips/loongson64/reset.c
> +++ b/arch/mips/loongson64/reset.c
> @@ -6,9 +6,14 @@
>    * Copyright (C) 2009 Lemote, Inc.
>    * Author: Zhangjin Wu, wuzhangjin@gmail.com
>    */
> +#include <linux/cpu.h>
> +#include <linux/delay.h>
>   #include <linux/init.h>
> +#include <linux/kexec.h>
>   #include <linux/pm.h>
> +#include <linux/slab.h>
>   
> +#include <asm/bootinfo.h>
>   #include <asm/idle.h>
>   #include <asm/reboot.h>
>   
> @@ -47,12 +52,120 @@ static void loongson_halt(void)
>   	}
>   }
>   
> +#ifdef CONFIG_KEXEC
> +
> +/* 0X80000000~0X80200000 is safe */
> +#define MAX_ARGS	64
> +#define KEXEC_CTRL_CODE	0xFFFFFFFF80100000UL
> +#define KEXEC_ARGV_ADDR	0xFFFFFFFF80108000UL
> +#define KEXEC_ARGV_SIZE	COMMAND_LINE_SIZE
> +#define KEXEC_ENVP_SIZE	4800
> +
> +static int kexec_argc;
> +static int kdump_argc;
> +static void *kexec_argv;
> +static void *kdump_argv;
> +static void *kexec_envp;
> +
> +static int loongson_kexec_prepare(struct kimage *image)
> +{
> +	int i, argc = 0;
> +	unsigned int *argv;
> +	char *str, *ptr, *bootloader = "kexec";
> +
> +	/* argv at offset 0, argv[] at offset KEXEC_ARGV_SIZE/2 */
> +	if (image->type == KEXEC_TYPE_DEFAULT)
> +		argv = (unsigned int *)kexec_argv;
> +	else
> +		argv = (unsigned int *)kdump_argv;
> +
> +	argv[argc++] = (unsigned int)(KEXEC_ARGV_ADDR + KEXEC_ARGV_SIZE/2);
> +
> +	for (i = 0; i < image->nr_segments; i++) {
> +		if (!strncmp(bootloader, (char *)image->segment[i].buf,
> +				strlen(bootloader))) {
> +			/*
> +			 * convert command line string to array
> +			 * of parameters (as bootloader does).
> +			 */
> +			int offt;
> +			str = (char *)argv + KEXEC_ARGV_SIZE/2;
> +			memcpy(str, image->segment[i].buf, KEXEC_ARGV_SIZE/2);
> +			ptr = strchr(str, ' ');
> +
> +			while (ptr && (argc < MAX_ARGS)) {
> +				*ptr = '\0';
> +				if (ptr[1] != ' ') {
> +					offt = (int)(ptr - str + 1);
> +					argv[argc] = KEXEC_ARGV_ADDR + KEXEC_ARGV_SIZE/2 + offt;
> +					argc++;
> +				}
> +				ptr = strchr(ptr + 1, ' ');
> +			}
> +			break;
> +		}
> +	}
> +
> +	if (image->type == KEXEC_TYPE_DEFAULT)
> +		kexec_argc = argc;
> +	else
> +		kdump_argc = argc;
> +
> +	/* kexec/kdump need a safe page to save reboot_code_buffer */
> +	image->control_code_page = virt_to_page((void *)KEXEC_CTRL_CODE);
> +
> +	return 0;
> +}
> +
> +static void loongson_kexec_shutdown(void)
> +{
> +#ifdef CONFIG_SMP
> +	int cpu;
> +
> +	/* All CPUs go to reboot_code_buffer */
> +	for_each_possible_cpu(cpu)
> +		if (!cpu_online(cpu))
> +			cpu_device_up(get_cpu_device(cpu));
> +#endif
> +	kexec_args[0] = kexec_argc;
> +	kexec_args[1] = fw_arg1;
> +	kexec_args[2] = fw_arg2;
> +	secondary_kexec_args[0] = TO_UNCAC(0x3ff01000);
> +	memcpy((void *)fw_arg1, kexec_argv, KEXEC_ARGV_SIZE);
> +	memcpy((void *)fw_arg2, kexec_envp, KEXEC_ENVP_SIZE);
> +}
> +
> +static void loongson_crash_shutdown(struct pt_regs *regs)
> +{
> +	default_machine_crash_shutdown(regs);
> +	kexec_args[0] = kdump_argc;
> +	kexec_args[1] = fw_arg1;
> +	kexec_args[2] = fw_arg2;
> +	secondary_kexec_args[0] = TO_UNCAC(0x3ff01000);
> +	memcpy((void *)fw_arg1, kdump_argv, KEXEC_ARGV_SIZE);
> +	memcpy((void *)fw_arg2, kexec_envp, KEXEC_ENVP_SIZE);
> +}
> +
> +#endif
> +
>   static int __init mips_reboot_setup(void)
>   {
>   	_machine_restart = loongson_restart;
>   	_machine_halt = loongson_halt;
>   	pm_power_off = loongson_poweroff;
>   
> +#ifdef CONFIG_KEXEC
> +	kexec_argv = kmalloc(KEXEC_ARGV_SIZE, GFP_KERNEL);
> +	kdump_argv = kmalloc(KEXEC_ARGV_SIZE, GFP_KERNEL);
> +	kexec_envp = kmalloc(KEXEC_ENVP_SIZE, GFP_KERNEL);
> +	fw_arg1 = KEXEC_ARGV_ADDR;
> +	memcpy(kexec_envp, (void *)fw_arg2, KEXEC_ENVP_SIZE);
> +
> +	_machine_kexec_prepare = loongson_kexec_prepare;
> +	_machine_kexec_shutdown = loongson_kexec_shutdown;
> +	_machine_crash_shutdown = loongson_crash_shutdown;
> +#endif
> +
>   	return 0;
>   }
>   

