Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E5ED1C2A65
	for <lists+linux-mips@lfdr.de>; Sun,  3 May 2020 08:24:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726902AbgECGYS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 3 May 2020 02:24:18 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:38220 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726884AbgECGYR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 3 May 2020 02:24:17 -0400
Received: by mail-io1-f65.google.com with SMTP id d7so4098616ioq.5
        for <linux-mips@vger.kernel.org>; Sat, 02 May 2020 23:24:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CC33JiTqVLRtYFSe08mHap/fIkRvGxa4yNOUU7Zr+dU=;
        b=CUqmGIw+KKlbHKKZYqhPJSbmzO9RvgI4qTIcQUaOt21GRRi2yd3yGOWFcepE2uYdjX
         fn/jA4J0L5OXUracm27m4S1uG5kUol8E+1yIpUKmNFBxP/kWZayty5ZzgqUVwHev97hH
         0e8lQPfXNp0alFbKEo4xqxo5hkvtGHv6lWhM6xhIxsFtuxurAClvoI4yrWOzWyPQM1uC
         mXdllM6PkKLDmy+0V7cb1KjKZpaPxgS4Xl4vIV4MbI/n3/FyePeM53kx6ATOfCvwvlld
         E0JcmVcq0nTURZorsDtWBd0NCGQJEI8DsY4on3dbniik1RcZmB/iLv1D2N0/ms9/GIDt
         1C3g==
X-Gm-Message-State: AGi0PuaKGRDy0Zm8J/eENFgjTReL1df1Oe5nDbzvLWVkqj9DegFYa6jZ
        bGEIZwRpwXW09v/cPjzvD0Cf9dUItcKyIYrXDV7M85GrTkE=
X-Google-Smtp-Source: APiQypJ7M40dgnK/TP6L+WY7so3LGhl+I13TU7rXt2+QcCn6t6yD7Dj3ZQDmj5T1SLCN3+iJkTTUDkHuCpQaX5rceEA=
X-Received: by 2002:a02:ba05:: with SMTP id z5mr6098186jan.123.1588487055229;
 Sat, 02 May 2020 23:24:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200502133846.40590-1-git@xen0n.name> <20200502133846.40590-5-git@xen0n.name>
In-Reply-To: <20200502133846.40590-5-git@xen0n.name>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Sun, 3 May 2020 14:31:50 +0800
Message-ID: <CAAhV-H5U+KHzORKVjrteYggF24WUAz+dsNL_-YJ_0vKvo2Mw1A@mail.gmail.com>
Subject: Re: [PATCH 4/4] MIPS: emulate CPUCFG instruction on older Loongson64 cores
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

On Sat, May 2, 2020 at 9:47 PM WANG Xuerui <git@xen0n.name> wrote:
>
> CPUCFG is the instruction for querying processor characteristics on
> newer Loongson processors, much like CPUID of x86. Since the instruction
> is supposedly designed to provide a unified way to do feature detection
> (without having to, for example, parse /proc/cpuinfo which is too
> heavyweight), it is important to provide compatibility for older cores
> without native support. Fortunately, most of the fields can be
> synthesized without changes to semantics. Performance is not really big
> a concern, because feature detection logic is not expected to be
> invoked very often in typical userland applications.
>
> The instruction can't be emulated on LOONGSON_2EF cores, according to
> FlyGoat's experiments. Because the LWC2 opcode is assigned to other
> valid instructions on 2E and 2F, no RI exception is raised for us to
> intercept. So compatibility is only extended back furthest to
> Loongson-3A1000. Loongson-2K is covered too, as it is basically a remix
> of various blocks from the 3A/3B models from a kernel perspective.
>
> This is lightly based on Loongson's work on their Linux 3.10 fork, for
> being the authority on the right feature flags to fill in, where things
> aren't otherwise discoverable.
>
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> Cc: Huacai Chen <chenhc@lemote.com>
> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Cc: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/mips/Kconfig                             |  11 ++
>  arch/mips/include/asm/cpu-info.h              |   9 ++
>  .../include/asm/mach-loongson64/cpucfg-emul.h |  67 +++++++++
>  arch/mips/kernel/cpu-probe.c                  | 129 ++++++++++++++++++
>  arch/mips/kernel/traps.c                      |  57 ++++++++
>  arch/mips/loongson64/Makefile                 |   1 +
>  arch/mips/loongson64/cpucfg-emul.c            |  80 +++++++++++
>  7 files changed, 354 insertions(+)
>  create mode 100644 arch/mips/include/asm/mach-loongson64/cpucfg-emul.h
>  create mode 100644 arch/mips/loongson64/cpucfg-emul.c
>
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 9f15539a6342..2ab189001917 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -1508,6 +1508,17 @@ config CPU_LOONGSON3_WORKAROUNDS
>
>           If unsure, please say Y.
>
> +config CPU_LOONGSON3_CPUCFG_EMULATION
> +       bool "Emulate the CPUCFG instruction on older cores"
> +       default y
> +       depends on CPU_LOONGSON64
> +       help
> +         Loongson-3A R4 and newer have the CPUCFG instruction available for
> +         userland to query CPU capabilities, much like CPUID on x86. This
> +         option provides emulation of the instruction on older cores.
> +
> +         If unsure, please say Y.
> +
>  config CPU_LOONGSON2E
>         bool "Loongson 2E"
>         depends on SYS_HAS_CPU_LOONGSON2E
> diff --git a/arch/mips/include/asm/cpu-info.h b/arch/mips/include/asm/cpu-info.h
> index ed7ffe4e63a3..43c238567a80 100644
> --- a/arch/mips/include/asm/cpu-info.h
> +++ b/arch/mips/include/asm/cpu-info.h
> @@ -105,6 +105,15 @@ struct cpuinfo_mips {
>         unsigned int            gtoffset_mask;
>         unsigned int            guestid_mask;
>         unsigned int            guestid_cache;
> +
> +#ifdef CONFIG_CPU_LOONGSON3_CPUCFG_EMULATION
> +       /* CPUCFG data for this CPU, synthesized at probe time.
> +        *
> +        * CPUCFG select 0 is PRId, others are unimplemented for now. So the
> +        * only stored values are for CPUCFG selects 1-3 inclusive.
> +        */
> +       u32 loongson3_cpucfg_data[3];
> +#endif
>  } __attribute__((aligned(SMP_CACHE_BYTES)));
>
>  extern struct cpuinfo_mips cpu_data[];
> diff --git a/arch/mips/include/asm/mach-loongson64/cpucfg-emul.h b/arch/mips/include/asm/mach-loongson64/cpucfg-emul.h
> new file mode 100644
> index 000000000000..b9f6b2aa98f9
> --- /dev/null
> +++ b/arch/mips/include/asm/mach-loongson64/cpucfg-emul.h
> @@ -0,0 +1,67 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_MACH_LOONGSON64_CPUCFG_EMUL_H_
> +#define _ASM_MACH_LOONGSON64_CPUCFG_EMUL_H_
> +
> +#include <asm/cpu-info.h>
> +
> +#include <loongson_regs.h>
> +
> +#define LOONGSON_FPREV_MASK 0x7
> +
> +#ifdef CONFIG_CPU_LOONGSON3_CPUCFG_EMULATION
> +
> +/* Finalize synthesis of CPUCFG data by patching the partially filled data
> + * with dynamically detected CPU characteristics. This keeps the amount of
> + * hard-coded logic at a minimum.
> + */
> +void loongson3_cpucfg_finish_synthesis(struct cpuinfo_mips *c);
> +
> +static inline u32 loongson3_cpucfg_read_synthesized(
> +       struct cpuinfo_mips *c,
> +       __u64 sel)
> +{
> +       switch (sel) {
> +       case LOONGSON_CFG0:
> +               return c->processor_id;
> +       case LOONGSON_CFG1:
> +       case LOONGSON_CFG2:
> +       case LOONGSON_CFG3:
> +               return c->loongson3_cpucfg_data[sel - 1];
> +       case LOONGSON_CFG4:
> +       case LOONGSON_CFG5:
> +               /* CPUCFG selects 4 and 5 are related to the processor clock.
> +                * Unimplemented for now.
> +                */
> +               return 0;
> +       case LOONGSON_CFG6:
> +               /* CPUCFG select 6 is for the undocumented Safe Extension. */
> +               return 0;
> +       case LOONGSON_CFG7:
> +               /* CPUCFG select 7 is for the virtualization extension.
> +                * We don't know if the two currently known features are
> +                * supported on older cores according to the public
> +                * documentation, so leave this at zero.
> +                */
> +               return 0;
> +       }
> +
> +       /*
> +        * Return 0 for unrecognized CPUCFG selects, which is real hardware
> +        * behavior observed on Loongson 3A R4.
> +        */
> +       return 0;
> +}
> +#else
> +static void loongson3_cpucfg_finish_synthesis(struct cpuinfo_mips *c)
> +{
> +}
> +
> +static inline u32 loongson3_cpucfg_read_synthesized(
> +       struct cpuinfo_mips *c,
> +       __u64 sel)
> +{
> +       return 0;
> +}
> +#endif
> +
> +#endif /* _ASM_MACH_LOONGSON64_CPUCFG_EMUL_H_ */
> diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
> index ca2e6f1af4fe..907e31ff562f 100644
> --- a/arch/mips/kernel/cpu-probe.c
> +++ b/arch/mips/kernel/cpu-probe.c
> @@ -28,6 +28,8 @@
>  #include <asm/spram.h>
>  #include <linux/uaccess.h>
>
> +#include <asm/mach-loongson64/cpucfg-emul.h>
> +
>  /* Hardware capabilities */
>  unsigned int elf_hwcap __read_mostly;
>  EXPORT_SYMBOL_GPL(elf_hwcap);
> @@ -1580,6 +1582,24 @@ static inline void cpu_probe_legacy(struct cpuinfo_mips *c, unsigned int cpu)
>                         set_isa(c, MIPS_CPU_ISA_M64R1);
>                         c->ases |= (MIPS_ASE_LOONGSON_MMI | MIPS_ASE_LOONGSON_CAM |
>                                 MIPS_ASE_LOONGSON_EXT);
> +#ifdef CONFIG_CPU_LOONGSON3_CPUCFG_EMULATION
> +                       /* Add CPUCFG features non-discoverable otherwise. */
> +                       c->loongson3_cpucfg_data[0] |= (LOONGSON_CFG1_LSLDR0 |
> +                               LOONGSON_CFG1_LSSYNCI | LOONGSON_CFG1_LSUCA |
> +                               LOONGSON_CFG1_LLSYNC | LOONGSON_CFG1_TGTSYNC);
> +                       c->loongson3_cpucfg_data[1] |= (LOONGSON_CFG2_LBT1 |
> +                               LOONGSON_CFG2_LPMP | LOONGSON_CFG2_LPM_REV1);
> +                       c->loongson3_cpucfg_data[2] |= (
> +                               LOONGSON_CFG3_LCAM_REV1 |
> +                               LOONGSON_CFG3_LCAMNUM_REV1 |
> +                               LOONGSON_CFG3_LCAMKW_REV1 |
> +                               LOONGSON_CFG3_LCAMVW_REV1);
> +
> +                       /* This feature is set by firmware, but all known
> +                        * Loongson-3A Legacy systems are configured this way.
> +                        */
> +                       c->loongson3_cpucfg_data[0] |= LOONGSON_CFG1_CDMAP;
> +#endif
>                         break;
>                 case PRID_REV_LOONGSON3B_R1:
>                 case PRID_REV_LOONGSON3B_R2:
> @@ -1589,6 +1609,24 @@ static inline void cpu_probe_legacy(struct cpuinfo_mips *c, unsigned int cpu)
>                         set_isa(c, MIPS_CPU_ISA_M64R1);
>                         c->ases |= (MIPS_ASE_LOONGSON_MMI | MIPS_ASE_LOONGSON_CAM |
>                                 MIPS_ASE_LOONGSON_EXT);
> +#ifdef CONFIG_CPU_LOONGSON3_CPUCFG_EMULATION
> +                       /* Add CPUCFG features non-discoverable otherwise. */
> +                       c->loongson3_cpucfg_data[0] |= (LOONGSON_CFG1_LSLDR0 |
> +                               LOONGSON_CFG1_LSSYNCI | LOONGSON_CFG1_LSUCA |
> +                               LOONGSON_CFG1_LLSYNC | LOONGSON_CFG1_TGTSYNC);
> +                       c->loongson3_cpucfg_data[1] |= (LOONGSON_CFG2_LBT1 |
> +                               LOONGSON_CFG2_LPMP | LOONGSON_CFG2_LPM_REV1);
> +                       c->loongson3_cpucfg_data[2] |= (
> +                               LOONGSON_CFG3_LCAM_REV1 |
> +                               LOONGSON_CFG3_LCAMNUM_REV1 |
> +                               LOONGSON_CFG3_LCAMKW_REV1 |
> +                               LOONGSON_CFG3_LCAMVW_REV1);
> +
> +                       /* This feature is set by firmware, but all known
> +                        * Loongson-3B Legacy systems are configured this way.
> +                        */
> +                       c->loongson3_cpucfg_data[0] |= LOONGSON_CFG1_CDMAP;
> +#endif
>                         break;
>                 }
>
> @@ -1957,9 +1995,57 @@ static inline void decode_cpucfg(struct cpuinfo_mips *c)
>                 c->ases |= MIPS_ASE_LOONGSON_CAM;
>  }
>
> +#ifdef CONFIG_CPU_LOONGSON3_CPUCFG_EMULATION
> +static inline int cpu_has_uca(void)
> +{
> +       u32 diag = read_c0_diag();
> +       u32 new_diag;
> +
> +       if (diag & LOONGSON_DIAG_UCAC)
> +               /* UCA is already enabled. */
> +               return 1;
> +
> +       /* See if UCAC bit can be flipped on. This should be safe. */
> +       new_diag = diag | LOONGSON_DIAG_UCAC;
> +       write_c0_diag(new_diag);
> +       new_diag = read_c0_diag();
> +       write_c0_diag(diag);
> +
> +       return (new_diag & LOONGSON_DIAG_UCAC) != 0;
> +}
> +
> +static inline void probe_uca(struct cpuinfo_mips *c)
> +{
> +       if (cpu_has_uca())
> +               c->loongson3_cpucfg_data[0] |= LOONGSON_CFG1_LSUCA;
> +}
> +
> +static inline void decode_loongson_config6(struct cpuinfo_mips *c)
> +{
> +       u32 config6 = read_c0_config6();
> +
> +       if (config6 & MIPS_CONF6_LOONGSON_STFILL)
> +               c->loongson3_cpucfg_data[0] |= LOONGSON_CFG1_SFBP;
> +       if (config6 & MIPS_CONF6_LOONGSON_LLEXC)
> +               c->loongson3_cpucfg_data[0] |= LOONGSON_CFG1_LLEXC;
> +       if (config6 & MIPS_CONF6_LOONGSON_SCRAND)
> +               c->loongson3_cpucfg_data[0] |= LOONGSON_CFG1_SCRAND;
> +}
> +#else
> +static inline void probe_uca(struct cpuinfo_mips *c)
> +{
> +}
> +
> +static inline void decode_loongson_config6(struct cpuinfo_mips *c)
> +{
> +}
> +#endif /* CONFIG_CPU_LOONGSON3_CPUCFG_EMULATION */
> +
>  static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
>  {
>         decode_configs(c);
> +       decode_loongson_config6(c);
> +       probe_uca(c);
>
>         switch (c->processor_id & PRID_IMP_MASK) {
>         case PRID_IMP_LOONGSON_64R: /* Loongson-64 Reduced */
> @@ -1977,6 +2063,21 @@ static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
>                 c->writecombine = _CACHE_UNCACHED_ACCELERATED;
>                 c->ases |= (MIPS_ASE_LOONGSON_MMI | MIPS_ASE_LOONGSON_EXT |
>                                 MIPS_ASE_LOONGSON_EXT2);
> +#ifdef CONFIG_CPU_LOONGSON3_CPUCFG_EMULATION
> +               /* Add CPUCFG features non-discoverable otherwise. */
> +               c->loongson3_cpucfg_data[0] |= (LOONGSON_CFG1_LSLDR0 |
> +                       LOONGSON_CFG1_LSSYNCI | LOONGSON_CFG1_LLSYNC |
> +                       LOONGSON_CFG1_TGTSYNC);
> +               c->loongson3_cpucfg_data[1] |= (LOONGSON_CFG2_LBT1 |
> +                       LOONGSON_CFG2_LBT2 | LOONGSON_CFG2_LPMP |
> +                       LOONGSON_CFG2_LPM_REV2);
> +               c->loongson3_cpucfg_data[2] = 0;
> +
> +               /* This feature is set by firmware, but all known Loongson-2K
> +                * systems are configured this way.
> +                */
> +               c->loongson3_cpucfg_data[0] |= LOONGSON_CFG1_CDMAP;
> +#endif
>                 break;
>         case PRID_IMP_LOONGSON_64C:  /* Loongson-3 Classic */
>                 switch (c->processor_id & PRID_REV_MASK) {
> @@ -2007,6 +2108,26 @@ static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
>                 c->writecombine = _CACHE_UNCACHED_ACCELERATED;
>                 c->ases |= (MIPS_ASE_LOONGSON_MMI | MIPS_ASE_LOONGSON_CAM |
>                         MIPS_ASE_LOONGSON_EXT | MIPS_ASE_LOONGSON_EXT2);
> +#ifdef CONFIG_CPU_LOONGSON3_CPUCFG_EMULATION
> +               /* Add CPUCFG features non-discoverable otherwise. */
> +               c->loongson3_cpucfg_data[0] |= (LOONGSON_CFG1_CNT64 |
> +                       LOONGSON_CFG1_LSLDR0 | LOONGSON_CFG1_LSPREF |
> +                       LOONGSON_CFG1_LSPREFX | LOONGSON_CFG1_LSSYNCI |
> +                       LOONGSON_CFG1_LLSYNC | LOONGSON_CFG1_TGTSYNC);
> +               c->loongson3_cpucfg_data[1] |= (LOONGSON_CFG2_LBT1 |
> +                       LOONGSON_CFG2_LBT2 | LOONGSON_CFG2_LBTMMU |
> +                       LOONGSON_CFG2_LPMP | LOONGSON_CFG2_LPM_REV1 |
> +                       LOONGSON_CFG2_LVZ_REV1);
> +               c->loongson3_cpucfg_data[2] |= (LOONGSON_CFG3_LCAM_REV1 |
> +                       LOONGSON_CFG3_LCAMNUM_REV1 |
> +                       LOONGSON_CFG3_LCAMKW_REV1 |
> +                       LOONGSON_CFG3_LCAMVW_REV1);
> +
> +               /* This feature is set by firmware, but all known Loongson-3
> +                * systems are configured this way.
> +                */
> +               c->loongson3_cpucfg_data[0] |= LOONGSON_CFG1_CDMAP;
> +#endif
>                 break;
>         case PRID_IMP_LOONGSON_64G:
>                 c->cputype = CPU_LOONGSON64;
> @@ -2200,6 +2321,12 @@ void cpu_probe(void)
>         c->fpu_csr31    = FPU_CSR_RN;
>         c->fpu_msk31    = FPU_CSR_RSVD | FPU_CSR_ABS2008 | FPU_CSR_NAN2008;
>
> +#ifdef CONFIG_CPU_LOONGSON3_CPUCFG_EMULATION
> +       c->loongson3_cpucfg_data[0] = 0;
> +       c->loongson3_cpucfg_data[1] = 0;
> +       c->loongson3_cpucfg_data[2] = 0;
> +#endif
> +
>         c->processor_id = read_c0_prid();
>         switch (c->processor_id & PRID_COMP_MASK) {
>         case PRID_COMP_LEGACY:
> @@ -2333,6 +2460,8 @@ void cpu_probe(void)
>         if (cpu_has_vz)
>                 cpu_probe_vz(c);
>
> +       loongson3_cpucfg_finish_synthesis(c);
> +
>         cpu_probe_vmbits(c);
>
>  #ifdef CONFIG_64BIT
> diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
> index 31968cbd6464..0c77ca2f091b 100644
> --- a/arch/mips/kernel/traps.c
> +++ b/arch/mips/kernel/traps.c
> @@ -71,6 +71,8 @@
>  #include <asm/tlbex.h>
>  #include <asm/uasm.h>
>
> +#include <asm/mach-loongson64/cpucfg-emul.h>
> +
>  extern void check_wait(void);
>  extern asmlinkage void rollback_handle_int(void);
>  extern asmlinkage void handle_int(void);
> @@ -693,6 +695,56 @@ static int simulate_sync(struct pt_regs *regs, unsigned int opcode)
>         return -1;                      /* Must be something else ... */
>  }
>
> +/*
> + * Loongson-3 CSR instructions emulation
> + */
> +
> +#ifdef CONFIG_CPU_LOONGSON3_CPUCFG_EMULATION
> +
> +#define LWC2             0xc8000000
> +#define RS               BASE
> +#define CSR_OPCODE2      0x00000118
> +#define CSR_OPCODE2_MASK 0x000007ff
> +#define CSR_FUNC_MASK    RT
> +#define CSR_FUNC_CPUCFG  0x8
> +
> +static int simulate_loongson3_csr_cpucfg(struct pt_regs *regs,
> +                                       unsigned int opcode)
Maybe simulate_loongson3_cpucfg() is a better name?

> +{
> +       int rd = (opcode & RD) >> 11;
> +       int rs = (opcode & RS) >> 21;
> +       __u64 sel = regs->regs[rs];
> +
> +       perf_sw_event(PERF_COUNT_SW_EMULATION_FAULTS, 1, regs, 0);
> +
> +       regs->regs[rd] = loongson3_cpucfg_read_synthesized(&current_cpu_data,
> +               sel);
> +
> +       return 0;
> +}
> +
> +static int simulate_loongson3_csr(struct pt_regs *regs, unsigned int opcode)
> +{
> +       int op = opcode & OPCODE;
> +       int op2 = opcode & CSR_OPCODE2_MASK;
> +
> +       if (op == LWC2 && op2 == CSR_OPCODE2) {
> +               int csr_func = (opcode & CSR_FUNC_MASK) >> 16;
> +
> +               switch (csr_func) {
> +               case CSR_FUNC_CPUCFG:
> +                       return simulate_loongson3_csr_cpucfg(regs, opcode);
> +               }
> +
> +               /* Unrecognized Loongson-3 CSR instruction. */
> +               return -1;
> +       }
> +
> +       /* Not ours.  */
> +       return -1;
> +}
> +#endif /* CONFIG_CPU_LOONGSON3_CPUCFG_EMULATION */
> +
>  asmlinkage void do_ov(struct pt_regs *regs)
>  {
>         enum ctx_state prev_state;
> @@ -1166,6 +1218,11 @@ asmlinkage void do_ri(struct pt_regs *regs)
>
>                 if (status < 0)
>                         status = simulate_fp(regs, opcode, old_epc, old31);
> +
> +#ifdef CONFIG_CPU_LOONGSON3_CPUCFG_EMULATION
> +               if (status < 0)
> +                       status = simulate_loongson3_csr(regs, opcode);
> +#endif
>         } else if (cpu_has_mmips) {
>                 unsigned short mmop[2] = { 0 };
>
> diff --git a/arch/mips/loongson64/Makefile b/arch/mips/loongson64/Makefile
> index 6f3c2b47f66f..61f6add20530 100644
> --- a/arch/mips/loongson64/Makefile
> +++ b/arch/mips/loongson64/Makefile
> @@ -10,3 +10,4 @@ obj-$(CONFIG_NUMA)    += numa.o
>  obj-$(CONFIG_RS780_HPET) += hpet.o
>  obj-$(CONFIG_PCI) += pci.o
>  obj-$(CONFIG_SUSPEND) += pm.o
> +obj-$(CONFIG_CPU_LOONGSON3_CPUCFG_EMULATION) += cpucfg-emul.o
> diff --git a/arch/mips/loongson64/cpucfg-emul.c b/arch/mips/loongson64/cpucfg-emul.c
> new file mode 100644
> index 000000000000..a30f82b55c9e
> --- /dev/null
> +++ b/arch/mips/loongson64/cpucfg-emul.c
> @@ -0,0 +1,80 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/smp.h>
> +#include <asm/cpu.h>
> +#include <asm/cpu-info.h>
> +
> +#include <loongson_regs.h>
> +#include <cpucfg-emul.h>
> +
> +static u32 get_loongson_fprev(struct cpuinfo_mips *c)
> +{
> +       return (c->fpu_id & LOONGSON_FPREV_MASK) << LOONGSON_CFG1_FPREV_OFFSET;
> +}
> +
> +static void patch_cpucfg_sel1(struct cpuinfo_mips *c)
> +{
> +       u64 ases = c->ases;
> +       u64 options = c->options;
> +       u32 data = c->loongson3_cpucfg_data[0];
> +
> +       if (options & MIPS_CPU_FPU) {
> +               data |= LOONGSON_CFG1_FP;
> +               data |= get_loongson_fprev(c);
> +       }
> +       if (ases & MIPS_ASE_LOONGSON_MMI)
> +               data |= LOONGSON_CFG1_MMI;
> +       if (ases & MIPS_ASE_MSA)
> +               data |= LOONGSON_CFG1_MSA1;
> +
> +       c->loongson3_cpucfg_data[0] = data;
> +}
> +
> +static void patch_cpucfg_sel2(struct cpuinfo_mips *c)
> +{
> +       u64 ases = c->ases;
> +       u64 options = c->options;
> +       u32 data = c->loongson3_cpucfg_data[1];
> +
> +       if (ases & MIPS_ASE_LOONGSON_EXT)
> +               data |= LOONGSON_CFG2_LEXT1;
> +       if (ases & MIPS_ASE_LOONGSON_EXT2)
> +               data |= LOONGSON_CFG2_LEXT2;
> +       if (options & MIPS_CPU_LDPTE)
> +               data |= LOONGSON_CFG2_LSPW;
> +
> +       if (ases & MIPS_ASE_VZ)
> +               data |= LOONGSON_CFG2_LVZP;
> +       else
> +               data &= ~LOONGSON_CFG2_LVZREV;
> +
> +       c->loongson3_cpucfg_data[1] = data;
> +}
> +
> +static void patch_cpucfg_sel3(struct cpuinfo_mips *c)
> +{
> +       u64 ases = c->ases;
> +       u32 data = c->loongson3_cpucfg_data[2];
> +
> +       if (ases & MIPS_ASE_LOONGSON_CAM) {
> +               data |= LOONGSON_CFG3_LCAMP;
> +       } else {
> +               data &= ~LOONGSON_CFG3_LCAMREV;
> +               data &= ~LOONGSON_CFG3_LCAMNUM;
> +               data &= ~LOONGSON_CFG3_LCAMKW;
> +               data &= ~LOONGSON_CFG3_LCAMVW;
> +       }
> +
> +       c->loongson3_cpucfg_data[2] = data;
> +}
> +
> +void loongson3_cpucfg_finish_synthesis(struct cpuinfo_mips *c)
> +{
> +       /* CPUs with CPUCFG support don't need to synthesize anything. */
> +       if (cpu_has_cfg())
> +               return;
> +
> +       patch_cpucfg_sel1(c);
> +       patch_cpucfg_sel2(c);
> +       patch_cpucfg_sel3(c);
> +}
> --
> 2.21.0
>
