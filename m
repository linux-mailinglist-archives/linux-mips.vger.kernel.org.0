Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 098822FACC3
	for <lists+linux-mips@lfdr.de>; Mon, 18 Jan 2021 22:36:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389505AbhARVfb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 18 Jan 2021 16:35:31 -0500
Received: from mail.loongson.cn ([114.242.206.163]:55252 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2389448AbhARKDd (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 18 Jan 2021 05:03:33 -0500
Received: from [10.130.0.55] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxKL6hXAVgG7UGAA--.10640S3;
        Mon, 18 Jan 2021 18:02:09 +0800 (CST)
Subject: Re: [PATCH 1/4] MIPS: process: Reorder header files
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <1610454557-25867-1-git-send-email-hejinyang@loongson.cn>
 <1610454557-25867-2-git-send-email-hejinyang@loongson.cn>
 <20210115144631.GE15166@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Burton <paulburton@kernel.org>,
        Jun-Ru Chang <jrjang@realtek.com>
From:   Jinyang He <hejinyang@loongson.cn>
Message-ID: <78c9211d-5304-a2b6-3a94-df9b324b7046@loongson.cn>
Date:   Mon, 18 Jan 2021 18:02:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20210115144631.GE15166@alpha.franken.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9DxKL6hXAVgG7UGAA--.10640S3
X-Coremail-Antispam: 1UD129KBjvJXoWxWr4fWryUAF4kZr1ktFy3XFb_yoW5WF1kpF
        4qyF48Jr4DAF18Gr13ur12kF1qqw4DXr13GryjgFyUAa4xtwnYg3yvkrnxtr1kAayqg3WU
        WFZrGFn8C3y5XaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvIb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
        C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
        0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr
        1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l
        c2xSY4AK67AK6r4DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I
        0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWU
        AVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcV
        CY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv
        67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf
        9x07jz7KsUUUUU=
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 01/15/2021 10:46 PM, Thomas Bogendoerfer wrote:

> On Tue, Jan 12, 2021 at 08:29:14PM +0800, Jinyang He wrote:
>> Just reorder the header files.
> This alone isn't worth a commit, IMHO. I bet there are lots of includes
> no longer needed, so removing and sorting them is ok for me.
>
> Thomas.
>

Hi, Thomas,

Thanks for your advice. I analyzed majority of the symbols in this file.
The following are examples of header file references:

Space indicates that it cannot be found. (Maybe I missed it.)

     Header files                                Examples in this file
     #include <linux/completion.h>
*   #include <linux/cpu.h> get_online_cpus
*   #include <linux/errno.h>                    EOPNOTSUPP
     #include <linux/export.h>
*   #include <linux/init.h> arch_initcall
*   #include <linux/kallsyms.h> kallsyms_lookup_name
*   #include <linux/kernel.h> __kernel_text_address
     #include <linux/mm.h>
     #include <linux/mman.h>
*   #include <linux/nmi.h> nmi_cpu_backtrace
*   #include <linux/personality.h> ADDR_NO_RANDOMIZE
     #include <linux/ptrace.h>
*   #include <linux/prctl.h>                    PR_FP_MODE_FR
     #include <linux/random.h>
*   #include <linux/sched.h>                    PF_KTHREAD
*   #include <linux/sched/debug.h> in_sched_functions
     #include <linux/sched/task.h>
*   #include <linux/sched/task_stack.h> task_stack_page
     #include <linux/stddef.h>
     #include <linux/sys.h>
     #include <linux/tick.h>
     #include <linux/uaccess.h>
     #include <linux/unistd.h>

*   #include <asm/abi.h> current->thread.abi->vdso->size
*   #include <asm/asm.h>                        ALMASK
     #include <asm/bootinfo.h>
     #include <asm/cpu.h>
*   #include <asm/dsemul.h> dsemul_thread_cleanup
*   #include <asm/dsp.h>                        init_dsp
     #include <asm/elf.h>
     #include <asm/exec.h>
*   #include <asm/fpu.h>                        lose_fpu
*   #include <asm/inst.h> mips_instruction
     #include <asm/io.h>
*   #include <asm/irq.h>                        on_irq_stack
*   #include <asm/irq_regs.h>                    get_irq_regs
*   #include <asm/isadep.h>                        KU_USER
     #include <asm/mips-cps.h>
*   #include <asm/msa.h>                        is_msa_enabled
*   #include <asm/mipsregs.h>                    ST0_CU0
*   #include <asm/processor.h> VDSO_RANDOMIZE_SIZE
*   #include <asm/reg.h>                        MIPS32_EF_R1
     #include <asm/stacktrace.h>


Here about this file config is:

Enable:
CONFIG_HOTPLUG_CPU, CONFIG_MIPS_FP_SUPPORT, CONFIG_STACKPROTECTOR,
CONFIG_CPU_LOONGSON64, CONFIG_KALLSYMS, CONFIG_64BIT

Disable:
CONFIG_CPU_R3000, CONFIG_CPU_TX39XX, CONFIG_MIPS_MT_FPAFF, 
CONFIG_CPU_MICROMIPS
CONFIG_MIPS_O32_FP64_SUPPORT, CONFIG_32BIT, CONFIG_MIPS32_O32

By including only these header files which marked by '*', I have been able
to compile and use certain functions (unwind_stack) normally. So are other
header files no longer needed?

In addition, <linux/cpu.h> includes <linux/cpumask.h>, and <linux/cpumask.h>
includes <linux/kernel.h>. What should we do?

Thanks,
Jinyang

