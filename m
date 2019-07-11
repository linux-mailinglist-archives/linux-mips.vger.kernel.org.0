Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7B31657A4
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jul 2019 15:08:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728699AbfGKNIa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 11 Jul 2019 09:08:30 -0400
Received: from foss.arm.com ([217.140.110.172]:45926 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728655AbfGKNI3 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 11 Jul 2019 09:08:29 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B73762B;
        Thu, 11 Jul 2019 06:08:28 -0700 (PDT)
Received: from [10.1.196.72] (e119884-lin.cambridge.arm.com [10.1.196.72])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4435C3F59C;
        Thu, 11 Jul 2019 06:08:26 -0700 (PDT)
Subject: Re: [PATCH] vsyscall: use __iter_div_u64_rem()
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-mips@vger.kernel.org,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Salyzyn <salyzyn@android.com>,
        Peter Collingbourne <pcc@google.com>,
        Shuah Khan <shuah@kernel.org>,
        Dmitry Safonov <0x7f454c46@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Huw Davies <huw@codeweavers.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
References: <20190710130206.1670830-1-arnd@arndb.de>
 <33511b0e-6d7b-c156-c415-7a609b049567@arm.com>
 <CAK8P3a1EBaWdbAEzirFDSgHVJMtWjuNt2HGG8z+vpXeNHwETFQ@mail.gmail.com>
From:   Vincenzo Frascino <vincenzo.frascino@arm.com>
Message-ID: <049c3a69-e2da-4169-da4a-8e46cbcd323c@arm.com>
Date:   Thu, 11 Jul 2019 14:08:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1EBaWdbAEzirFDSgHVJMtWjuNt2HGG8z+vpXeNHwETFQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Arnd,

On 11/07/2019 13:28, Arnd Bergmann wrote:
> On Thu, Jul 11, 2019 at 2:14 PM Vincenzo Frascino
> <vincenzo.frascino@arm.com> wrote:
>>
>>
>> Could you please tell me which version of the compiler did you use?
>>
>> My building command is:
>>
>> # make mrproper && make CC=clang HOSTCC=clang i386_defconfig && make ARCH=i386
>> CC=clang HOSTCC=clang -j56
>>
> 
> See below for the patch I am using locally to work around this.
> That patch is probably wrong, so I have not submitted it yet, but it
> gives you a clean build ;-)
> 
>      Arnd
> 

Thank you, I will give it a go :-)

> 8<---
> Subject: [PATCH] x86: percpu: fix clang 32-bit build
> 
> clang does not like an inline assembly with a "=q" contraint for
> a 64-bit output:
> 
> arch/x86/events/perf_event.h:824:21: error: invalid output size for
> constraint '=q'
>         u64 disable_mask = __this_cpu_read(cpu_hw_events.perf_ctr_virt_mask);
>                            ^
> include/linux/percpu-defs.h:447:2: note: expanded from macro '__this_cpu_read'
>         raw_cpu_read(pcp);                                              \
>         ^
> include/linux/percpu-defs.h:421:28: note: expanded from macro 'raw_cpu_read'
>  #define raw_cpu_read(pcp)
> __pcpu_size_call_return(raw_cpu_read_, pcp)
>                                         ^
> include/linux/percpu-defs.h:322:23: note: expanded from macro
> '__pcpu_size_call_return'
>         case 1: pscr_ret__ = stem##1(variable); break;                  \
>                              ^
> <scratch space>:357:1: note: expanded from here
> raw_cpu_read_1
> ^
> arch/x86/include/asm/percpu.h:394:30: note: expanded from macro 'raw_cpu_read_1'
>  #define raw_cpu_read_1(pcp)             percpu_from_op(, "mov", pcp)
>                                         ^
> arch/x86/include/asm/percpu.h:189:15: note: expanded from macro 'percpu_from_op'
>                     : "=q" (pfo_ret__)                  \
>                             ^
> 
> According to the commit that introduced the "q" constraint, this was
> needed to fix miscompilation, but it gives no further detail.
> 
> Using the normal "=r" constraint seems to work so far.
> 
> Fixes: 3c598766a2ba ("x86: fix percpu_{to,from}_op()")
> Cc: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> diff --git a/arch/x86/include/asm/percpu.h b/arch/x86/include/asm/percpu.h
> index 2278797c769d..e791fbf4018f 100644
> --- a/arch/x86/include/asm/percpu.h
> +++ b/arch/x86/include/asm/percpu.h
> @@ -99,7 +99,7 @@ do {                                                  \
>         case 1:                                         \
>                 asm qual (op "b %1,"__percpu_arg(0)     \
>                     : "+m" (var)                        \
> -                   : "qi" ((pto_T__)(val)));           \
> +                   : "ri" ((pto_T__)(val)));           \
>                 break;                                  \
>         case 2:                                         \
>                 asm qual (op "w %1,"__percpu_arg(0)     \
> @@ -144,7 +144,7 @@ do {
>                          \
>                 else                                                    \
>                         asm qual ("addb %1, "__percpu_arg(0)            \
>                             : "+m" (var)                                \
> -                           : "qi" ((pao_T__)(val)));                   \
> +                           : "ri" ((pao_T__)(val)));                   \
>                 break;                                                  \
>         case 2:                                                         \
>                 if (pao_ID__ == 1)                                      \
> @@ -186,7 +186,7 @@ do {
>                          \
>         switch (sizeof(var)) {                          \
>         case 1:                                         \
>                 asm qual (op "b "__percpu_arg(1)",%0"   \
> -                   : "=q" (pfo_ret__)                  \
> +                   : "=r" (pfo_ret__)                  \
>                     : "m" (var));                       \
>                 break;                                  \
>         case 2:                                         \
> @@ -215,7 +215,7 @@ do {
>                          \
>         switch (sizeof(var)) {                          \
>         case 1:                                         \
>                 asm(op "b "__percpu_arg(P1)",%0"        \
> -                   : "=q" (pfo_ret__)                  \
> +                   : "=r" (pfo_ret__)                  \
>                     : "p" (&(var)));                    \
>                 break;                                  \
>         case 2:                                         \
> 

-- 
Regards,
Vincenzo
