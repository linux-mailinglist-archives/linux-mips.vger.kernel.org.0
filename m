Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 921182FC758
	for <lists+linux-mips@lfdr.de>; Wed, 20 Jan 2021 03:02:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731318AbhATBvJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 Jan 2021 20:51:09 -0500
Received: from mail.loongson.cn ([114.242.206.163]:45326 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729988AbhATBuX (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 19 Jan 2021 20:50:23 -0500
Received: from [10.130.0.55] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr78fjAdg7N8HAA--.12559S3;
        Wed, 20 Jan 2021 09:49:19 +0800 (CST)
Subject: Re: [PATCH V3] MIPS: Loongson64: Add kexec/kdump support
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <20201221120220.3186744-1-chenhuacai@kernel.org>
 <a671a323-768b-b461-2ce4-ecc1e92d4cc6@loongson.cn>
 <CAAhV-H4GDxhg1YqWy-g7VuCeE7BZ0ibaVSr1ibzJqXjuaBn3_w@mail.gmail.com>
 <20210107172620.GA13201@alpha.franken.de>
 <1085845b-2c5a-dbb6-62b7-28b55aeacb4c@loongson.cn>
 <20210119210821.GA15589@alpha.franken.de>
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        Eric Biederman <ebiederm@xmission.com>,
        Dave Young <dyoung@redhat.com>, Baoquan He <bhe@redhat.com>,
        Vivek Goyal <vgoyal@redhat.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        kexec@lists.infradead.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Youling Tang <tangyouling@loongson.cn>
From:   Jinyang He <hejinyang@loongson.cn>
Message-ID: <65453f03-4bfe-8458-7884-cdd6ecb3e83b@loongson.cn>
Date:   Wed, 20 Jan 2021 09:49:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20210119210821.GA15589@alpha.franken.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dxr78fjAdg7N8HAA--.12559S3
X-Coremail-Antispam: 1UD129KBjvJXoWxJFy8ZF47KF4UKF4fCFyDJrb_yoWrXF4Dpa
        y5CFn5JF4kGry2ka4Syw18C345Zan8Wry5KF9FgFn5Xa1Yqr1jgF15Z3W8urykuFWrKw4I
        qFyjq3W0va1qyFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUB014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
        4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
        Yx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
        WUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
        Y2ka0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCY02Avz4vE14v_KwCF04k20xvY0x0EwI
        xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
        Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
        IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
        6cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
        0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUoPEfUUUUU
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 01/20/2021 05:08 AM, Thomas Bogendoerfer wrote:

> On Fri, Jan 08, 2021 at 06:07:39PM +0800, Jinyang He wrote:
>> Unlike the cavium-octeon platform, the Loongson64 platform needs some
>> changes. Before the kernel starts, (before entering the kernel_entry), each
>> CPU has its own state (the SMP system). For Loongson64, only the boot CPU
>> will enter the kernel_entry, and other CPUs will query their mailbox value
>> in a loop. This is what the BIOS does for the CPU. Here is different from
>> cavium-octeon. All CPUs will enter the kernel_entry on cavium-octeon
>> platform. Then the kernel_entry_setup, the co-CPUs will enter the query
>> loop. I saw the kernel_entry_setup of other platforms, such as ip27, malta,
>> and generic. They are not like cavium-octeon and the co-CPUs entering the
>> loop may be earlier than entering kernel_entry. So I have reason to guess
>> that most SMP system platform CPUs are similar to Loongson64.
>>
>> relocate_kernel.S is like BIOS doing s omething for the CPU. It allows the
>> boot CPU to start from the new kernel_entry and makes the co-CPUs enter a
>> loop. The already existing infrastructure may be more suitable for non-smp
>> platforms. Although we can do something with plat_smp_ops.kexec_nonboot_cpu,
>> more new problems will arise in that case. The kexec process actually runs
>> on a copy of relocate_kernel.S, which will bring a lot of problems...
>>
>> Above all just my personal thoughts.
> thank you for describing current state. So it looks like kexec and SMP
> is probably only working for Octeon and maybe some MIPS VPE based SMP
> systems, but not with "real" cores.
>
> How about the patch below as preparation for your loongson64 kexec patch ?
> You only need to put write a kexec_smp_wait_final macro and the rest of
> your patch stays the same...
>
> Thomas.

Thank you for this patch. By applying your patch and the revised Huacai's
patch, kexec works well on the Loongson-3A4000. I compared the assembly
code, too. It's the same as the previous patch doing. I think it's correct.
Huacai, how do you think about it?

Thanks, :-)
Jinyang
>
>  From 81d3e1e24a0dae48f310b8d819d625f88139ef9b Mon Sep 17 00:00:00 2001
> From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Date: Tue, 19 Jan 2021 21:58:55 +0100
> Subject: [PATCH] MIPS: Use macro for kexec_smp_wait specials
>
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>   .../include/asm/mach-cavium-octeon/kernel-entry-init.h   | 8 ++++++++
>   arch/mips/kernel/relocate_kernel.S                       | 9 ++++-----
>   2 files changed, 12 insertions(+), 5 deletions(-)
>
> diff --git a/arch/mips/include/asm/mach-cavium-octeon/kernel-entry-init.h b/arch/mips/include/asm/mach-cavium-octeon/kernel-entry-init.h
> index c38b38ce5a3d..b071a7353ee1 100644
> --- a/arch/mips/include/asm/mach-cavium-octeon/kernel-entry-init.h
> +++ b/arch/mips/include/asm/mach-cavium-octeon/kernel-entry-init.h
> @@ -157,4 +157,12 @@
>   	.macro	smp_slave_setup
>   	.endm
>   
> +#define USE_KEXEC_SMP_WAIT_FINAL
> +	.macro  kexec_smp_wait_final
> +	.set push
> +	.set noreorder
> +	synci		0($0)
> +	.set pop
> +	.endm
> +
>   #endif /* __ASM_MACH_CAVIUM_OCTEON_KERNEL_ENTRY_H */
> diff --git a/arch/mips/kernel/relocate_kernel.S b/arch/mips/kernel/relocate_kernel.S
> index ac870893ba2d..f3c908abdbb8 100644
> --- a/arch/mips/kernel/relocate_kernel.S
> +++ b/arch/mips/kernel/relocate_kernel.S
> @@ -11,6 +11,8 @@
>   #include <asm/stackframe.h>
>   #include <asm/addrspace.h>
>   
> +#include <kernel-entry-init.h>
> +
>   LEAF(relocate_new_kernel)
>   	PTR_L a0,	arg0
>   	PTR_L a1,	arg1
> @@ -125,11 +127,8 @@ LEAF(kexec_smp_wait)
>   1:	LONG_L		s0, (t0)
>   	bne		s0, zero,1b
>   
> -#ifdef CONFIG_CPU_CAVIUM_OCTEON
> -	.set push
> -	.set noreorder
> -	synci		0($0)
> -	.set pop
> +#ifdef USE_KEXEC_SMP_WAIT_FINAL
> +	kexec_smp_wait_final
>   #else
>   	sync
>   #endif

