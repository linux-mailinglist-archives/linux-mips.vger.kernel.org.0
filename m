Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0833228839
	for <lists+linux-mips@lfdr.de>; Tue, 21 Jul 2020 20:29:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726658AbgGUS3p (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Jul 2020 14:29:45 -0400
Received: from [115.28.160.31] ([115.28.160.31]:56154 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1726458AbgGUS3o (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 21 Jul 2020 14:29:44 -0400
Received: from [192.168.9.172] (unknown [112.65.61.50])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 03C8E60116;
        Wed, 22 Jul 2020 02:29:39 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1595356180; bh=QLIMsR9VfebjDUAQiBDDvFCORNvK5evpfduMsCRC5lU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=tN0vTrmy2o2emglrdTkmiu3L6YJvMZ7eH5pzhD24XwftZjrf5clXcPY9T5N2Bs2is
         JUNynJb+4x5wWo1sA4pGXd3Gw9YT7sfiuu7wl7U3HdwZV0RUs7Mkb6WZOnjC5uZ6IQ
         eUkKn9tlwf57fVA/8juvBtd0br7Pyiw7sCAj5sq4=
Subject: Re: [PATCH 3/3] MIPS: handle Loongson-specific GSExc exception
To:     Huacai Chen <chenhc@lemote.com>, WANG Xuerui <git@xen0n.name>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
References: <20200705165050.2078964-1-git@xen0n.name>
 <20200705165050.2078964-4-git@xen0n.name>
 <CAAhV-H5cryG__92tRiddW3U+3D_DL+W6K0qTOAXsN3O+8qEbtg@mail.gmail.com>
From:   WANG Xuerui <i@xen0n.name>
Message-ID: <5d679a9f-30b7-fe20-82ac-8ac9c5f35fc5@xen0n.name>
Date:   Wed, 22 Jul 2020 02:29:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:80.0) Gecko/20100101
 Thunderbird/80.0a1
MIME-Version: 1.0
In-Reply-To: <CAAhV-H5cryG__92tRiddW3U+3D_DL+W6K0qTOAXsN3O+8qEbtg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

Sorry for the delayed response, I fell sick for a few days after sending 
the patch and then $DAY_JOB got busier. Still recovering from a wrecked 
circadian rhythm but got healthy enough to revise my patches.

On 7/6/20 11:12 AM, Huacai Chen wrote:

> diff --git a/arch/mips/include/asm/cpu-features.h b/arch/mips/include/asm/cpu-features.h
> index 0b1bc7ed913b..1e8794b39759 100644
> --- a/arch/mips/include/asm/cpu-features.h
> +++ b/arch/mips/include/asm/cpu-features.h
> @@ -572,6 +572,12 @@
>   # define cpu_has_ftlbparex     __opt(MIPS_CPU_FTLBPAREX)
>   #endif
>
> +#if defined(CONFIG_CPU_LOONGSON64) && !defined(cpu_has_gsexcex)
> +# define cpu_has_gsexcex       __opt(MIPS_CPU_GSEXCEX)
> +#elif !defined(cpu_has_gsexcex)
> +# define cpu_has_gsexcex       0
> +#endif
> Why not simply define it like this?
> #ifndef cpu_has_gsexcex
> #define cpu_has_gsexcex       __opt(MIPS_CPU_GSEXCEX)
> #endif

This is so that the logic is completely optimized out on non-Loongson 
platforms. See for example how the cpu_has_msa option above is similarly 
guarded by CONFIG_CPU_HAS_MSA.

>> +
>>   #ifdef CONFIG_SMP
>>   /*
>>    * Some systems share FTLB RAMs between threads within a core (siblings in
>> diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
>> index 3a4773714b29..1b4a67c84538 100644
>> --- a/arch/mips/include/asm/cpu.h
>> +++ b/arch/mips/include/asm/cpu.h
>> @@ -426,6 +426,7 @@ enum cpu_type_enum {
>>   #define MIPS_CPU_MM_FULL       BIT_ULL(59)     /* CPU supports write-through full merge */
>>   #define MIPS_CPU_MAC_2008_ONLY BIT_ULL(60)     /* CPU Only support MAC2008 Fused multiply-add instruction */
>>   #define MIPS_CPU_FTLBPAREX     BIT_ULL(61)     /* CPU has FTLB parity exception */
>> +#define MIPS_CPU_GSEXCEX       BIT_ULL(62)     /* CPU has GSExc exception */
>>
>>   /*
>>    * CPU ASE encodings
>> diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
>> index 513b1a054588..9db89b134959 100644
>> --- a/arch/mips/include/asm/mipsregs.h
>> +++ b/arch/mips/include/asm/mipsregs.h
>> @@ -474,6 +474,9 @@
>>   /* Implementation specific trap codes used by MIPS cores */
>>   #define MIPS_EXCCODE_TLBPAR    16      /* TLB parity error exception */
>>
>> +/* Implementation specific trap codes used by Loongson cores */
>> +#define LOONGSON_EXCCODE_GSEXC 16      /* Loongson-specific exception */
>> +
>>   /*
>>    * Bits in the coprocessor 0 config register.
>>    */
>> diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
>> index 3404011eb7cf..01d9d5b97f06 100644
>> --- a/arch/mips/kernel/cpu-probe.c
>> +++ b/arch/mips/kernel/cpu-probe.c
>> @@ -1655,7 +1655,7 @@ static inline void cpu_probe_legacy(struct cpuinfo_mips *c, unsigned int cpu)
>>
>>                  c->options = R4K_OPTS |
>>                               MIPS_CPU_FPU | MIPS_CPU_LLSC |
>> -                            MIPS_CPU_32FPR;
>> +                            MIPS_CPU_32FPR | MIPS_CPU_GSEXCEX;
>>                  c->tlbsize = 64;
>>                  set_cpu_asid_mask(c, MIPS_ENTRYHI_ASID);
>>                  c->writecombine = _CACHE_UNCACHED_ACCELERATED;
>> @@ -2043,6 +2043,9 @@ static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
>>   {
>>          decode_configs(c);
>>
>> +       /* All Loongson processors covered here define ExcCode 16 as GSExc. */
>> +       c->options |= MIPS_CPU_GSEXCEX;
>> +
>>          switch (c->processor_id & PRID_IMP_MASK) {
>>          case PRID_IMP_LOONGSON_64R: /* Loongson-64 Reduced */
>>                  switch (c->processor_id & PRID_REV_MASK) {
>> diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
>> index a1b966f3578e..a7fe30363dda 100644
>> --- a/arch/mips/kernel/genex.S
>> +++ b/arch/mips/kernel/genex.S
>> @@ -498,6 +498,12 @@ NESTED(nmi_handler, PT_SIZE, sp)
>>          KMODE
>>          .endm
>>
>> +       .macro __build_clear_gsexc
>> +       MFC0    a1, CP0_DIAGNOSTIC1
> You defined MIPS_CPU_GSEXCEX for Loongson-3A1000/Loongson-3B1500, so
> they will come here, right? But they don't have DIAG1, so the behavior
> is UNDEFINED, right?
You're right, the addition in cpu_probe_legacy is leftover code that 
should have been removed. I'll send v2.
>> +       TRACE_IRQS_ON
>> +       STI
>> +       .endm
>> +
>>          .macro  __BUILD_silent exception
>>          .endm
>>
>> @@ -556,6 +562,7 @@ NESTED(nmi_handler, PT_SIZE, sp)
>>          BUILD_HANDLER fpe fpe fpe silent                /* #15 */
>>   #endif
>>          BUILD_HANDLER ftlb ftlb none silent             /* #16 */
>> +       BUILD_HANDLER gsexc gsexc gsexc silent          /* #16 */
>>          BUILD_HANDLER msa msa sti silent                /* #21 */
>>          BUILD_HANDLER mdmx mdmx sti silent              /* #22 */
>>   #ifdef CONFIG_HARDWARE_WATCHPOINTS
>> diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
>> index 25a8a0d441be..fdb51e1f5f84 100644
>> --- a/arch/mips/kernel/traps.c
>> +++ b/arch/mips/kernel/traps.c
>> @@ -90,6 +90,7 @@ extern asmlinkage void handle_tr(void);
>>   extern asmlinkage void handle_msa_fpe(void);
>>   extern asmlinkage void handle_fpe(void);
>>   extern asmlinkage void handle_ftlb(void);
>> +extern asmlinkage void handle_gsexc(void);
>>   extern asmlinkage void handle_msa(void);
>>   extern asmlinkage void handle_mdmx(void);
>>   extern asmlinkage void handle_watch(void);
>> @@ -1900,6 +1901,37 @@ asmlinkage void do_ftlb(void)
>>          cache_parity_error();
>>   }
>>
>> +asmlinkage void do_gsexc(struct pt_regs *regs, u32 diag1)
>> +{
>> +       u32 exccode = (diag1 & LOONGSON_DIAG1_EXCCODE) >>
>> +                       LOONGSON_DIAG1_EXCCODE_SHIFT;
>> +       enum ctx_state prev_state;
>> +
>> +       prev_state = exception_enter();
>> +
>> +       switch (exccode) {
>> +       case 0x08:
>> +               /* Undocumented exception, will trigger on certain
>> +                * also-undocumented instructions accessible from userspace.
>> +                * Processor state is not otherwise corrupted, but currently
>> +                * we don't know how to proceed. Maybe there is some
>> +                * undocumented control flag to enable the instructions?
>> +                */
>> +               force_sig(SIGILL);
>> +               break;
>> +
>> +       default:
>> +               /* None of the other exceptions, documented or not, have
>> +                * further details given; none are encountered in the wild
>> +                * either. Panic in case some of them turn out to be fatal.
>> +                */
>> +               show_regs(regs);
>> +               panic("Unhandled Loongson exception - GSCause = %08x", diag1);
>> +       }
>> +
>> +       exception_exit(prev_state);
>> +}
>> +
>>   /*
>>    * SDBBP EJTAG debug exception handler.
>>    * We skip the instruction and return to the next instruction.
>> @@ -2457,6 +2489,9 @@ void __init trap_init(void)
>>          if (cpu_has_ftlbparex)
>>                  set_except_vector(MIPS_EXCCODE_TLBPAR, handle_ftlb);
>>
>> +       if (cpu_has_gsexcex)
>> +               set_except_vector(LOONGSON_EXCCODE_GSEXC, handle_gsexc);
>> +
>>          if (cpu_has_rixiex) {
>>                  set_except_vector(EXCCODE_TLBRI, tlb_do_page_fault_0);
>>                  set_except_vector(EXCCODE_TLBXI, tlb_do_page_fault_0);
>> --
>> 2.25.1
>>
> Thanks,
> Huacai
