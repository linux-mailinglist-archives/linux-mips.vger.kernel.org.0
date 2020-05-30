Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13AD51E8DCA
	for <lists+linux-mips@lfdr.de>; Sat, 30 May 2020 06:27:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726324AbgE3E1E (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 30 May 2020 00:27:04 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:37811 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725823AbgE3E1E (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 30 May 2020 00:27:04 -0400
Received: by mail-il1-f196.google.com with SMTP id r2so4518750ila.4
        for <linux-mips@vger.kernel.org>; Fri, 29 May 2020 21:27:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VwMK7UfQrYas1jcgJmng6UH2TNDRg3vZM/FQqAJuR9c=;
        b=ticY0AwDLZcKAxaTbr74cvCLuDe9SDWrJYiZJ3on2b7zUdFUeGadOBxOLFBkBZwjPf
         VN/wE/aeIcgvvONMBfIrrcN9J8+DhX2XwQqAXcoFZ3sVSKskhZr5Rm8m7UOhjmJlmuOk
         pUHfKki3353lG+28654hQ5QOG3H4+y1rNQjmWhBvR9I4a56SE0bOhY6h8MhBy6G7qin2
         FUYJAFhiWc9SFKjd7ViVVEsuIxZfaoDiyh5z/sH6jOUyihLL23z7m9gn2ctqzrWSv1Fn
         EKjwmGsmYf43fm352Nw3nE2nUktWbkGeTZ3fk2Mwk0v7V9U5aYpa7zjL/mho96x3PFJQ
         6hJw==
X-Gm-Message-State: AOAM531kQuhxBb/r+j7qxEfrBI5Bp0WmBh4OnueWPLdWAGuaQACu4xfe
        sa6ADxV0JZ3CwENzbEoNy82JwG1jJCSLqA6ZXZCRfDMKn5Q=
X-Google-Smtp-Source: ABdhPJxpu9mBBJLsfY7XlwPzHidoA4rney8Eonxapc+FwP1y7ZSiIpOFU3dQZXS5fj5oD4Erh3WRi+e/zNiYw6X0zvk=
X-Received: by 2002:a92:cf48:: with SMTP id c8mr10534456ilr.147.1590812822834;
 Fri, 29 May 2020 21:27:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200529171000.8905-1-git@xen0n.name> <20200529171000.8905-2-git@xen0n.name>
In-Reply-To: <20200529171000.8905-2-git@xen0n.name>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Sat, 30 May 2020 12:26:51 +0800
Message-ID: <CAAhV-H7t=1Ev6Gs8oQdSkNPUQxN0m4WfHCLPeycxp5XD7Joi7g@mail.gmail.com>
Subject: Re: [PATCH 1/2] MIPS: Loongson64: Guard against future cores without CPUCFG
To:     WANG Xuerui <git@xen0n.name>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Xuerui,

On Sat, May 30, 2020 at 1:11 AM WANG Xuerui <git@xen0n.name> wrote:
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
> index 2d5b16daf331..caff4c921461 100644
> --- a/arch/mips/kernel/traps.c
> +++ b/arch/mips/kernel/traps.c
> @@ -720,6 +720,10 @@ static int simulate_loongson3_cpucfg(struct pt_regs *regs,
>                 int rs = (opcode & RS) >> 21;
>                 __u64 sel = regs->regs[rs];
>
> +               /* Do not emulate on unsupported core models. */
> +               if (!loongson3_cpucfg_emulation_enabled(&current_cpu_data))
> +                       return -1;
> +
>                 perf_sw_event(PERF_COUNT_SW_EMULATION_FAULTS, 1, regs, 0);
>
>                 regs->regs[rd] = loongson3_cpucfg_read_synthesized(
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
I think it is better to use alpha-betical style here, which means move
Loongson-3B after Loongson-3A (not before Loongson-2K).

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
