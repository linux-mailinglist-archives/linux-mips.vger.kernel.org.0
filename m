Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87DC11E9088
	for <lists+linux-mips@lfdr.de>; Sat, 30 May 2020 12:27:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728430AbgE3K1I (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 30 May 2020 06:27:08 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:43926 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727964AbgE3K1H (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 30 May 2020 06:27:07 -0400
Received: by mail-io1-f66.google.com with SMTP id h10so2002511iob.10
        for <linux-mips@vger.kernel.org>; Sat, 30 May 2020 03:27:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uetNjZFHm6/2KU2oEYei+cZgibaK2n4SCRxhmRfpjfU=;
        b=fC5lSK6IpIgX9gf7k1YrC8GVNHB7eq7jHx9NO9Hqu095dWLFvnEugZXtm6OAtfp/77
         bPfIZugBkebK3srMRv6svQIMa5GiKgYaTUFlNyJO7vdgfk6o/EMWuJIQPGTiKbfVT7yr
         aZHNKZ9surtN8wK/Aag+TbtmSV44O+9uFyOqh7JMwc/O90uZ33D98JBUVhWgiXnFYAT7
         ql9e14Vt01a0F/6bjgjUx5VwTZ/M1YnWlDtUXfjTQDKa5CBbd+WIcCxMzdrgDzGXYaNp
         8d1X3KsxiVFFaP+cw9YHlciTPzpd+PVw6P9DuhId+gR+Zw3EtFoih3taJvlKkgs3odDd
         xz1g==
X-Gm-Message-State: AOAM533IO01ZIOsBmamtX2EfmEiyc7wWGUM3SZh6p1yOiXSFk3kAmdWJ
        xkJGRGqcta/fTR+m4ZrUN6aHSYsuKVwi81LXqWk=
X-Google-Smtp-Source: ABdhPJx8+LT4cWYXhff72Hlorz3uK7jepfPU+c349hKJDl5qYIF8EIgOdeUK7UGbwLf3FFaQaWSowX1nhhPJAwAWpHg=
X-Received: by 2002:a02:ce38:: with SMTP id v24mr11654960jar.137.1590834426210;
 Sat, 30 May 2020 03:27:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200530073243.16411-1-git@xen0n.name> <20200530073243.16411-2-git@xen0n.name>
In-Reply-To: <20200530073243.16411-2-git@xen0n.name>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Sat, 30 May 2020 18:26:55 +0800
Message-ID: <CAAhV-H7CuA8f39Ksf9_ZFRATgW_TEpMQQ+Lt0mnkGrzrXzxhYQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] MIPS: Loongson64: Guard against future cores
 without CPUCFG
To:     WANG Xuerui <git@xen0n.name>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Reviewed-by: Huacai Chen <chenhc@lemote.com>

On Sat, May 30, 2020 at 3:34 PM WANG Xuerui <git@xen0n.name> wrote:
>
> Previously it was thought that all future Loongson cores would come with
> native CPUCFG. From new information shared by Huacai this is definitely
> not true (maybe some future 2K cores, for example), so collisions at
> PRID_REV level are inevitable. The CPU model matching needs to take
> PRID_IMP into consideration.
>
> The emulation logic needs to be disabled for those future cores as well,
> as we cannot possibly encode their non-discoverable features right now.
>
> Reported-by: Huacai Chen <chenhc@lemote.com>
> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> ---
>  .../include/asm/mach-loongson64/cpucfg-emul.h | 11 ++++++
>  arch/mips/kernel/traps.c                      |  4 ++
>  arch/mips/loongson64/cpucfg-emul.c            | 37 ++++++++++---------
>  3 files changed, 35 insertions(+), 17 deletions(-)
>
> diff --git a/arch/mips/include/asm/mach-loongson64/cpucfg-emul.h b/arch/mips/include/asm/mach-loongson64/cpucfg-emul.h
> index 01dc308df7b2..d64af19c210d 100644
> --- a/arch/mips/include/asm/mach-loongson64/cpucfg-emul.h
> +++ b/arch/mips/include/asm/mach-loongson64/cpucfg-emul.h
> @@ -12,6 +12,12 @@
>
>  void loongson3_cpucfg_synthesize_data(struct cpuinfo_mips *c);
>
> +static inline bool loongson3_cpucfg_emulation_enabled(struct cpuinfo_mips *c)
> +{
> +       /* All supported cores have non-zero LOONGSON_CFG1 data. */
> +       return c->loongson3_cpucfg_data[0] != 0;
> +}
> +
>  static inline u32 loongson3_cpucfg_read_synthesized(struct cpuinfo_mips *c,
>         __u64 sel)
>  {
> @@ -53,6 +59,11 @@ static inline void loongson3_cpucfg_synthesize_data(struct cpuinfo_mips *c)
>  {
>  }
>
> +static inline bool loongson3_cpucfg_emulation_enabled(struct cpuinfo_mips *c)
> +{
> +       return false;
> +}
> +
>  static inline u32 loongson3_cpucfg_read_synthesized(struct cpuinfo_mips *c,
>         __u64 sel)
>  {
> diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
> index 2d5b16daf331..22f805a73921 100644
> --- a/arch/mips/kernel/traps.c
> +++ b/arch/mips/kernel/traps.c
> @@ -722,6 +722,10 @@ static int simulate_loongson3_cpucfg(struct pt_regs *regs,
>
>                 perf_sw_event(PERF_COUNT_SW_EMULATION_FAULTS, 1, regs, 0);
>
> +               /* Do not emulate on unsupported core models. */
> +               if (!loongson3_cpucfg_emulation_enabled(&current_cpu_data))
> +                       return -1;
> +
>                 regs->regs[rd] = loongson3_cpucfg_read_synthesized(
>                         &current_cpu_data, sel);
>
> diff --git a/arch/mips/loongson64/cpucfg-emul.c b/arch/mips/loongson64/cpucfg-emul.c
> index fdd52b21c1df..c16023a13379 100644
> --- a/arch/mips/loongson64/cpucfg-emul.c
> +++ b/arch/mips/loongson64/cpucfg-emul.c
> @@ -134,13 +134,9 @@ void loongson3_cpucfg_synthesize_data(struct cpuinfo_mips *c)
>         c->loongson3_cpucfg_data[1] = 0;
>         c->loongson3_cpucfg_data[2] = 0;
>
> -       /* Add CPUCFG features non-discoverable otherwise.
> -        *
> -        * All Loongson processors covered by CPUCFG emulation have distinct
> -        * PRID_REV, so take advantage of this.
> -        */
> -       switch (c->processor_id & PRID_REV_MASK) {
> -       case PRID_REV_LOONGSON3A_R1:
> +       /* Add CPUCFG features non-discoverable otherwise. */
> +       switch (c->processor_id & (PRID_IMP_MASK | PRID_REV_MASK)) {
> +       case PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3A_R1:
>                 c->loongson3_cpucfg_data[0] |= (LOONGSON_CFG1_LSLDR0 |
>                         LOONGSON_CFG1_LSSYNCI | LOONGSON_CFG1_LSUCA |
>                         LOONGSON_CFG1_LLSYNC | LOONGSON_CFG1_TGTSYNC);
> @@ -153,8 +149,8 @@ void loongson3_cpucfg_synthesize_data(struct cpuinfo_mips *c)
>                         LOONGSON_CFG3_LCAMVW_REV1);
>                 break;
>
> -       case PRID_REV_LOONGSON3B_R1:
> -       case PRID_REV_LOONGSON3B_R2:
> +       case PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3B_R1:
> +       case PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3B_R2:
>                 c->loongson3_cpucfg_data[0] |= (LOONGSON_CFG1_LSLDR0 |
>                         LOONGSON_CFG1_LSSYNCI | LOONGSON_CFG1_LSUCA |
>                         LOONGSON_CFG1_LLSYNC | LOONGSON_CFG1_TGTSYNC);
> @@ -167,10 +163,10 @@ void loongson3_cpucfg_synthesize_data(struct cpuinfo_mips *c)
>                         LOONGSON_CFG3_LCAMVW_REV1);
>                 break;
>
> -       case PRID_REV_LOONGSON2K_R1_0:
> -       case PRID_REV_LOONGSON2K_R1_1:
> -       case PRID_REV_LOONGSON2K_R1_2:
> -       case PRID_REV_LOONGSON2K_R1_3:
> +       case PRID_IMP_LOONGSON_64R | PRID_REV_LOONGSON2K_R1_0:
> +       case PRID_IMP_LOONGSON_64R | PRID_REV_LOONGSON2K_R1_1:
> +       case PRID_IMP_LOONGSON_64R | PRID_REV_LOONGSON2K_R1_2:
> +       case PRID_IMP_LOONGSON_64R | PRID_REV_LOONGSON2K_R1_3:
>                 decode_loongson_config6(c);
>                 probe_uca(c);
>
> @@ -183,10 +179,10 @@ void loongson3_cpucfg_synthesize_data(struct cpuinfo_mips *c)
>                 c->loongson3_cpucfg_data[2] = 0;
>                 break;
>
> -       case PRID_REV_LOONGSON3A_R2_0:
> -       case PRID_REV_LOONGSON3A_R2_1:
> -       case PRID_REV_LOONGSON3A_R3_0:
> -       case PRID_REV_LOONGSON3A_R3_1:
> +       case PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3A_R2_0:
> +       case PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3A_R2_1:
> +       case PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3A_R3_0:
> +       case PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3A_R3_1:
>                 decode_loongson_config6(c);
>                 probe_uca(c);
>
> @@ -203,6 +199,13 @@ void loongson3_cpucfg_synthesize_data(struct cpuinfo_mips *c)
>                         LOONGSON_CFG3_LCAMKW_REV1 |
>                         LOONGSON_CFG3_LCAMVW_REV1);
>                 break;
> +
> +       default:
> +               /* It is possible that some future Loongson cores still do
> +                * not have CPUCFG, so do not emulate anything for these
> +                * cores.
> +                */
> +               return;
>         }
>
>         /* This feature is set by firmware, but all known Loongson-64 systems
> --
> 2.26.2
>
