Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C524E228EEE
	for <lists+linux-mips@lfdr.de>; Wed, 22 Jul 2020 06:20:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726254AbgGVEUa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Jul 2020 00:20:30 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:34361 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbgGVEU3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 22 Jul 2020 00:20:29 -0400
Received: by mail-io1-f66.google.com with SMTP id q74so1184497iod.1
        for <linux-mips@vger.kernel.org>; Tue, 21 Jul 2020 21:20:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X1VESZGP7SyOZBkxBX/jU+SjFKbz15fEZOcSysOfh/M=;
        b=U04s2xeJN1holEQfiN21FJjIBmLKrojXhHmY+QWsODAYC8uYubAH1kUwLk4CUd6g6q
         qhlhLRdgevBUxxvmpNV0MF+bc2s8cSNjwEv6pZU5SilEk2HBUxdv4LxKGJn6PIlLiyRE
         ZPk6ojyGH0xmKFbUDln1DtzdvjC/0RCW8RzPGUpDWr8t1jbRS1CWWkNJ46SiN3YbaZ8b
         bnPl8bUZVTm2AKQAp4L7V9ufVj4RJgssgSzYCOWbNz87jJGrjsLC0/A1VumEzn0ciY8n
         BMd3Q9M3HO0queZQxpba4DQu/lmR5tEJ5wOUPdiN0HzsWrGsygA3uGAt0aazyNQJ1gYt
         g5pA==
X-Gm-Message-State: AOAM531Dd19FTXRgRKG+ySanDOGjOOE2Y3Q4kZJ5vQMFtoN86ecPgdJn
        NwK2SAmt5C0zwvMSs5qaoQxkulpNbr/zMyAZRTQ=
X-Google-Smtp-Source: ABdhPJxRz5X9WlZ/BWWZCgwVav4fknBtFYw9JfnMJQKPKSbsL2hyU+lP9UjM2hJLvROL1nQIpZctg5UHLpshgMfVGVs=
X-Received: by 2002:a5e:da06:: with SMTP id x6mr30918499ioj.196.1595391628386;
 Tue, 21 Jul 2020 21:20:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200721183739.1410221-1-git@xen0n.name> <20200721183739.1410221-4-git@xen0n.name>
In-Reply-To: <20200721183739.1410221-4-git@xen0n.name>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Wed, 22 Jul 2020 12:20:16 +0800
Message-ID: <CAAhV-H4ELLywGXQH4vU=6V5vSA4=nMMGNtAhMLL+kfacTnB7Og@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] MIPS: handle Loongson-specific GSExc exception
To:     WANG Xuerui <git@xen0n.name>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Xuerui,

On Wed, Jul 22, 2020 at 2:38 AM WANG Xuerui <git@xen0n.name> wrote:
>
> Newer Loongson cores (Loongson-3A R2 and newer) use the
> implementation-dependent ExcCode 16 to signal Loongson-specific
> exceptions. The extended cause is put in the non-standard CP0.Diag1
> register which is CP0 Register 22 Select 1, called GSCause in Loongson
> manuals. Inside is an exception code bitfield called GSExcCode, only
> codes 0 to 6 inclusive are documented (so far, in the Loongson 3A3000
> User Manual, Volume 2).
>
> During experiments, it was found that some undocumented unprivileged
> instructions can trigger the also-undocumented GSExcCode 8 on Loongson
> 3A4000. Processor state is not corrupted, but we cannot continue without
> further knowledge, and Loongson is not providing that information as of
> this writing. So we send SIGILL on seeing this exception code to thwart
> easy local DoS attacks.
>
> Other exception codes are made fatal, partly because of insufficient
> knowledge, also partly because they are not as easily reproduced. None
> of them are encountered in the wild with upstream kernels and userspace
> so far.
>
> Some older cores (Loongson-3A1000 and Loongson-3B1500) have ExcCode 16
> too, but the semantic is equivalent to GSExcCode 0. Because the
> respective manuals did not mention the CP0.Diag1 register or its read
> behavior, these cores are not covered in this patch, as MFC0 from
> non-existent CP0 registers is UNDEFINED according to the MIPS
> architecture spec.
>
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> Cc: Huacai Chen <chenhc@lemote.com>
> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Cc: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/mips/include/asm/cpu-features.h |  6 +++++
>  arch/mips/include/asm/cpu.h          |  1 +
>  arch/mips/include/asm/mipsregs.h     |  3 +++
>  arch/mips/kernel/cpu-probe.c         |  3 +++
>  arch/mips/kernel/genex.S             |  7 ++++++
>  arch/mips/kernel/traps.c             | 35 ++++++++++++++++++++++++++++
>  6 files changed, 55 insertions(+)
>
> diff --git a/arch/mips/include/asm/cpu-features.h b/arch/mips/include/asm/cpu-features.h
> index 0b1bc7ed913b..1e8794b39759 100644
> --- a/arch/mips/include/asm/cpu-features.h
> +++ b/arch/mips/include/asm/cpu-features.h
> @@ -572,6 +572,12 @@
>  # define cpu_has_ftlbparex     __opt(MIPS_CPU_FTLBPAREX)
>  #endif
>
> +#if defined(CONFIG_CPU_LOONGSON64) && !defined(cpu_has_gsexcex)
> +# define cpu_has_gsexcex       __opt(MIPS_CPU_GSEXCEX)
> +#elif !defined(cpu_has_gsexcex)
> +# define cpu_has_gsexcex       0
> +#endif
Still, I don't see any obvious benefit from this complecated definition.

> +
>  #ifdef CONFIG_SMP
>  /*
>   * Some systems share FTLB RAMs between threads within a core (siblings in
> diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
> index 3a4773714b29..1b4a67c84538 100644
> --- a/arch/mips/include/asm/cpu.h
> +++ b/arch/mips/include/asm/cpu.h
> @@ -426,6 +426,7 @@ enum cpu_type_enum {
>  #define MIPS_CPU_MM_FULL       BIT_ULL(59)     /* CPU supports write-through full merge */
>  #define MIPS_CPU_MAC_2008_ONLY BIT_ULL(60)     /* CPU Only support MAC2008 Fused multiply-add instruction */
>  #define MIPS_CPU_FTLBPAREX     BIT_ULL(61)     /* CPU has FTLB parity exception */
> +#define MIPS_CPU_GSEXCEX       BIT_ULL(62)     /* CPU has GSExc exception */
>
>  /*
>   * CPU ASE encodings
> diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
> index 5ba268266d16..4ddc12e4444a 100644
> --- a/arch/mips/include/asm/mipsregs.h
> +++ b/arch/mips/include/asm/mipsregs.h
> @@ -474,6 +474,9 @@
>  /* Implementation specific trap codes used by MIPS cores */
>  #define MIPS_EXCCODE_TLBPAR    16      /* TLB parity error exception */
>
> +/* Implementation specific trap codes used by Loongson cores */
> +#define LOONGSON_EXCCODE_GSEXC 16      /* Loongson-specific exception */
> +
>  /*
>   * Bits in the coprocessor 0 config register.
>   */
> diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
> index 9e325862e810..9bb4a8732847 100644
> --- a/arch/mips/kernel/cpu-probe.c
> +++ b/arch/mips/kernel/cpu-probe.c
> @@ -2043,6 +2043,9 @@ static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
>  {
>         decode_configs(c);
>
> +       /* All Loongson processors covered here define ExcCode 16 as GSExc. */
> +       c->options |= MIPS_CPU_GSEXCEX;
> +
>         switch (c->processor_id & PRID_IMP_MASK) {
>         case PRID_IMP_LOONGSON_64R: /* Loongson-64 Reduced */
>                 switch (c->processor_id & PRID_REV_MASK) {
> diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
> index a1b966f3578e..a7fe30363dda 100644
> --- a/arch/mips/kernel/genex.S
> +++ b/arch/mips/kernel/genex.S
> @@ -498,6 +498,12 @@ NESTED(nmi_handler, PT_SIZE, sp)
>         KMODE
>         .endm
>
> +       .macro __build_clear_gsexc
> +       MFC0    a1, CP0_DIAGNOSTIC1
> +       TRACE_IRQS_ON
> +       STI
> +       .endm
> +
>         .macro  __BUILD_silent exception
>         .endm
>
> @@ -556,6 +562,7 @@ NESTED(nmi_handler, PT_SIZE, sp)
>         BUILD_HANDLER fpe fpe fpe silent                /* #15 */
>  #endif
>         BUILD_HANDLER ftlb ftlb none silent             /* #16 */
> +       BUILD_HANDLER gsexc gsexc gsexc silent          /* #16 */
>         BUILD_HANDLER msa msa sti silent                /* #21 */
>         BUILD_HANDLER mdmx mdmx sti silent              /* #22 */
>  #ifdef CONFIG_HARDWARE_WATCHPOINTS
> diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
> index 25a8a0d441be..fdb51e1f5f84 100644
> --- a/arch/mips/kernel/traps.c
> +++ b/arch/mips/kernel/traps.c
> @@ -90,6 +90,7 @@ extern asmlinkage void handle_tr(void);
>  extern asmlinkage void handle_msa_fpe(void);
>  extern asmlinkage void handle_fpe(void);
>  extern asmlinkage void handle_ftlb(void);
> +extern asmlinkage void handle_gsexc(void);
>  extern asmlinkage void handle_msa(void);
>  extern asmlinkage void handle_mdmx(void);
>  extern asmlinkage void handle_watch(void);
> @@ -1900,6 +1901,37 @@ asmlinkage void do_ftlb(void)
>         cache_parity_error();
>  }
>
> +asmlinkage void do_gsexc(struct pt_regs *regs, u32 diag1)
> +{
> +       u32 exccode = (diag1 & LOONGSON_DIAG1_EXCCODE) >>
> +                       LOONGSON_DIAG1_EXCCODE_SHIFT;
> +       enum ctx_state prev_state;
> +
> +       prev_state = exception_enter();
> +
> +       switch (exccode) {
> +       case 0x08:
> +               /* Undocumented exception, will trigger on certain
> +                * also-undocumented instructions accessible from userspace.
> +                * Processor state is not otherwise corrupted, but currently
> +                * we don't know how to proceed. Maybe there is some
> +                * undocumented control flag to enable the instructions?
> +                */
> +               force_sig(SIGILL);
> +               break;
> +
> +       default:
> +               /* None of the other exceptions, documented or not, have
> +                * further details given; none are encountered in the wild
> +                * either. Panic in case some of them turn out to be fatal.
> +                */
> +               show_regs(regs);
> +               panic("Unhandled Loongson exception - GSCause = %08x", diag1);
> +       }
> +
> +       exception_exit(prev_state);
> +}
> +
>  /*
>   * SDBBP EJTAG debug exception handler.
>   * We skip the instruction and return to the next instruction.
> @@ -2457,6 +2489,9 @@ void __init trap_init(void)
>         if (cpu_has_ftlbparex)
>                 set_except_vector(MIPS_EXCCODE_TLBPAR, handle_ftlb);
>
> +       if (cpu_has_gsexcex)
> +               set_except_vector(LOONGSON_EXCCODE_GSEXC, handle_gsexc);
> +
>         if (cpu_has_rixiex) {
>                 set_except_vector(EXCCODE_TLBRI, tlb_do_page_fault_0);
>                 set_except_vector(EXCCODE_TLBXI, tlb_do_page_fault_0);
> --
> 2.25.1
>
