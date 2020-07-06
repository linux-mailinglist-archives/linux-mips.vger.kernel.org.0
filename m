Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5236215149
	for <lists+linux-mips@lfdr.de>; Mon,  6 Jul 2020 05:12:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728633AbgGFDMv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 5 Jul 2020 23:12:51 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:35701 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726430AbgGFDMu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 5 Jul 2020 23:12:50 -0400
Received: by mail-io1-f65.google.com with SMTP id v8so37752458iox.2
        for <linux-mips@vger.kernel.org>; Sun, 05 Jul 2020 20:12:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Hogr/DpIqtBCX0bcqECqcvwg8oGp2AYqK3uvHpviYtM=;
        b=aAF+fGPskwaRBaTiV0YbpgqSMP4EeY8JtjWBPDtBPgV4IgF5KP74NRSdfHCgp1FSq9
         OlswclXUFL4A2K/sp2245yUtc75OuLTJwj91ui1+SKG5KxQnxCqj0pAwaRteEdzSEoJg
         rVgqSowoxhnc/6QkeQ1kPWRkAE9AiKPTk71b2iEURZosad5Wlry0wNMaGhi4YPqPrmvi
         iMvt++5mIJBy1Te0Aqp4Vwv5/QcYufgBgXmLgm+orB8Foi7PGMXrOuHfdQ9lj0IzDBvT
         F1DgsHhQVgrjMxH060hMlyNVQJPgUi/BV5S3LD1nmQWSEQOWUsnZBK9y//34O9MX7Coc
         GZ/Q==
X-Gm-Message-State: AOAM5337DsMQRN53bMlRh5wxWNiAAhZoRiUO1MCnQe27RK/u9vzrH7ke
        p0wtQ0Szt9rF8DdG+gfpHZtWEMJHUtZ4I4ygC6MEzeK5GkR4+Q==
X-Google-Smtp-Source: ABdhPJxU4/Cah4Ig2HrNy8IBfzPmJr+5RBmQbZC2n0inM4zp2Wadnzu0/YF87VVnTshmVlsvfgY2DcjF3Qa0hGDzXl0=
X-Received: by 2002:a05:6638:2649:: with SMTP id n9mr15180437jat.126.1594005169035;
 Sun, 05 Jul 2020 20:12:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200705165050.2078964-1-git@xen0n.name> <20200705165050.2078964-4-git@xen0n.name>
In-Reply-To: <20200705165050.2078964-4-git@xen0n.name>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Mon, 6 Jul 2020 11:12:37 +0800
Message-ID: <CAAhV-H5cryG__92tRiddW3U+3D_DL+W6K0qTOAXsN3O+8qEbtg@mail.gmail.com>
Subject: Re: [PATCH 3/3] MIPS: handle Loongson-specific GSExc exception
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

On Mon, Jul 6, 2020 at 12:52 AM WANG Xuerui <git@xen0n.name> wrote:
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
> instructions can trigger the also-undocumented GSExcCode 8. Processor
> state is not corrupted, but we cannot continue without further knowledge,
> and Loongson is not providing that information as of this writing. So we
> send SIGILL on seeing this exception code to thwart easy local DoS
> attacks.
>
> Other exception codes are made fatal, partly because of insufficient
> knowledge, also partly because they are not as easily reproduced. None
> of them are encountered in the wild with upstream kernels so far.
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
>  arch/mips/kernel/cpu-probe.c         |  5 +++-
>  arch/mips/kernel/genex.S             |  7 ++++++
>  arch/mips/kernel/traps.c             | 35 ++++++++++++++++++++++++++++
>  6 files changed, 56 insertions(+), 1 deletion(-)
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
Why not simply define it like this?
#ifndef cpu_has_gsexcex
#define cpu_has_gsexcex       __opt(MIPS_CPU_GSEXCEX)
#endif

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
> index 513b1a054588..9db89b134959 100644
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
> index 3404011eb7cf..01d9d5b97f06 100644
> --- a/arch/mips/kernel/cpu-probe.c
> +++ b/arch/mips/kernel/cpu-probe.c
> @@ -1655,7 +1655,7 @@ static inline void cpu_probe_legacy(struct cpuinfo_mips *c, unsigned int cpu)
>
>                 c->options = R4K_OPTS |
>                              MIPS_CPU_FPU | MIPS_CPU_LLSC |
> -                            MIPS_CPU_32FPR;
> +                            MIPS_CPU_32FPR | MIPS_CPU_GSEXCEX;
>                 c->tlbsize = 64;
>                 set_cpu_asid_mask(c, MIPS_ENTRYHI_ASID);
>                 c->writecombine = _CACHE_UNCACHED_ACCELERATED;
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
You defined MIPS_CPU_GSEXCEX for Loongson-3A1000/Loongson-3B1500, so
they will come here, right? But they don't have DIAG1, so the behavior
is UNDEFINED, right?

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
Thanks,
Huacai
