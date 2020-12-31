Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44CFB2E7D79
	for <lists+linux-mips@lfdr.de>; Thu, 31 Dec 2020 01:31:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbgLaAbj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 30 Dec 2020 19:31:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:56304 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726512AbgLaAbj (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 30 Dec 2020 19:31:39 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6AA9C20758;
        Thu, 31 Dec 2020 00:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609374658;
        bh=kKqtUckptfN3fyv5UANgzrfrdDzorfht98PJVI+nLpU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=fnZ9krWEWc9iCjz6w1Osy9I+DwfV3OCXQNgpvEqZ5MmjXiXhIhPwR3ALX1HN5UueL
         ICSjysYJ7IM0St/EhwKxAD8ocYs5VW2Hcf6qa3qZANr8o9XrqQp2plTsRWMB1Lv5Da
         pfLOUqhkiomaJSdGf66zrAFLL6Viu5ZqOGDSa+lewQmZoC9h01oZx6EWJ1qd4wdB7e
         f2xRgWsxTeoBCh3nSI2GmkcykphZywBR6JasdGs5F8I48HK9YEJKcesCMIlOYdrO95
         AAPHj8JGpNl/l/SQVLTBSyk+QyqC9dxrtcHaOIUtTC3Tg+l5JZSy+14z1zDToCSBVz
         BIgcrE0wt4NvQ==
Received: by mail-il1-f170.google.com with SMTP id w17so16181569ilj.8;
        Wed, 30 Dec 2020 16:30:58 -0800 (PST)
X-Gm-Message-State: AOAM533erlXb0eufrLT/T6zrBZxtUzoVbq0DZcXt4AwFriOLTuLp1re9
        AemhpBY+SzUGf2OC4ga0m8L23LVw4PkBgUzD3z8=
X-Google-Smtp-Source: ABdhPJxf3bK0CS7CC0KSE0eS+CyuCsAY3xrcH14ilkJtjIgnP+Qhgi98rw3eVm3e14IUPygvhXDYZwgBLltzVpN238k=
X-Received: by 2002:a92:870b:: with SMTP id m11mr51952601ild.134.1609374657921;
 Wed, 30 Dec 2020 16:30:57 -0800 (PST)
MIME-Version: 1.0
References: <20201230032314.10042-1-jiaxun.yang@flygoat.com>
In-Reply-To: <20201230032314.10042-1-jiaxun.yang@flygoat.com>
From:   Huacai Chen <chenhuacai@kernel.org>
Date:   Thu, 31 Dec 2020 08:30:46 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4gbuFm++Bkt8eg7qGSYqLqNhtz-wp9hFi=3eznpmR7pg@mail.gmail.com>
Message-ID: <CAAhV-H4gbuFm++Bkt8eg7qGSYqLqNhtz-wp9hFi=3eznpmR7pg@mail.gmail.com>
Subject: Re: [PATCH 1/3] MIPS: Add vulnerabilities infrastructure
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        WANG Xuerui <git@xen0n.name>,
        =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>, Paul Burton <paulburton@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        YunQiang Su <syq@debian.org>,
        Liangliang Huang <huanglllzu@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Jiaxun,

On Wed, Dec 30, 2020 at 11:25 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
> Add infrastructure to display CPU vulnerabilities.
> As most MIPS CPU vendors are dead today and we can't confirm
> vulnerabilities states with them, we'll display vulnerabilities
> as "Unknown" by default and override them in cpu-probe.c
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/mips/Kconfig                |  1 +
>  arch/mips/include/asm/cpu-info.h |  5 ++++
>  arch/mips/include/asm/cpu.h      |  7 +++++
>  arch/mips/kernel/Makefile        |  2 +-
>  arch/mips/kernel/vulnbl.c        | 46 ++++++++++++++++++++++++++++++++
>  5 files changed, 60 insertions(+), 1 deletion(-)
>  create mode 100644 arch/mips/kernel/vulnbl.c
>
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index ef5b2a177b1b..524053b8f769 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -24,6 +24,7 @@ config MIPS
>         select GENERIC_CLOCKEVENTS
>         select GENERIC_CMOS_UPDATE
>         select GENERIC_CPU_AUTOPROBE
> +       select GENERIC_CPU_VULNERABILITIES
>         select GENERIC_GETTIMEOFDAY
>         select GENERIC_IOMAP
>         select GENERIC_IRQ_PROBE
> diff --git a/arch/mips/include/asm/cpu-info.h b/arch/mips/include/asm/cpu-info.h
> index a600670d00e9..1a964dbfc0a8 100644
> --- a/arch/mips/include/asm/cpu-info.h
> +++ b/arch/mips/include/asm/cpu-info.h
> @@ -106,6 +106,11 @@ struct cpuinfo_mips {
>         unsigned int            guestid_mask;
>         unsigned int            guestid_cache;
>
> +       /* Vulnerabilities */
> +       unsigned int            vulnerabilities; /* Vulnerabilities states that we known */
> +       unsigned int            vulnerable; /* Vulnerabilities affated */
What is "affated"? maybe "affected"?

Huacai

> +       unsigned int            mitigations; /* Mitigations */
> +
>  #ifdef CONFIG_CPU_LOONGSON3_CPUCFG_EMULATION
>         /* CPUCFG data for this CPU, synthesized at probe time.
>          *
> diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
> index f5b04e8f6061..3414c9f5464e 100644
> --- a/arch/mips/include/asm/cpu.h
> +++ b/arch/mips/include/asm/cpu.h
> @@ -447,4 +447,11 @@ enum cpu_type_enum {
>  #define MIPS_ASE_LOONGSON_EXT  0x00002000 /* Loongson EXTensions */
>  #define MIPS_ASE_LOONGSON_EXT2 0x00004000 /* Loongson EXTensions R2 */
>
> +/*
> + * CPU security vulnerabilities
> + */
> +#define MIPS_VULNBL_MELTDOWN   BIT(0)
> +#define MIPS_VULNBL_SPECTRE_V1 BIT(1)
> +#define MIPS_VULNBL_SPECTRE_V2 BIT(2)
> +
>  #endif /* _ASM_CPU_H */
> diff --git a/arch/mips/kernel/Makefile b/arch/mips/kernel/Makefile
> index 13a26d254829..39abc8ead5e0 100644
> --- a/arch/mips/kernel/Makefile
> +++ b/arch/mips/kernel/Makefile
> @@ -8,7 +8,7 @@ extra-y         := head.o vmlinux.lds
>  obj-y          += cmpxchg.o cpu-probe.o branch.o elf.o entry.o genex.o idle.o irq.o \
>                    process.o prom.o ptrace.o reset.o setup.o signal.o \
>                    syscall.o time.o topology.o traps.o unaligned.o watch.o \
> -                  vdso.o cacheinfo.o
> +                  vdso.o cacheinfo.o vulnbl.o
>
>  ifdef CONFIG_FUNCTION_TRACER
>  CFLAGS_REMOVE_ftrace.o = -pg
> diff --git a/arch/mips/kernel/vulnbl.c b/arch/mips/kernel/vulnbl.c
> new file mode 100644
> index 000000000000..fc73da6214fe
> --- /dev/null
> +++ b/arch/mips/kernel/vulnbl.c
> @@ -0,0 +1,46 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + *  Copyright (C) 2020, Jiaxun Yang <jiaxun.yang@flygoat.com>
> + *  MIPS CPU vulnerabilities
> + */
> +
> +#include <linux/device.h>
> +
> +#include <asm/cpu-info.h>
> +#include <asm/cpu.h>
> +
> +ssize_t cpu_show_meltdown(struct device *dev,
> +                         struct device_attribute *attr, char *buf)
> +{
> +       if (!(boot_cpu_data.vulnerabilities & MIPS_VULNBL_MELTDOWN))
> +               return sprintf(buf, "Unknown\n");
> +
> +       if (!(boot_cpu_data.vulnerable & MIPS_VULNBL_MELTDOWN))
> +               return sprintf(buf, "Not affected\n");
> +
> +       return sprintf(buf, "Affected\n");
> +}
> +
> +ssize_t cpu_show_spectre_v1(struct device *dev,
> +                           struct device_attribute *attr, char *buf)
> +{
> +       if (!(boot_cpu_data.vulnerabilities & MIPS_VULNBL_SPECTRE_V1))
> +               return sprintf(buf, "Unknown\n");
> +
> +       if (!(boot_cpu_data.vulnerable & MIPS_VULNBL_SPECTRE_V1))
> +               return sprintf(buf, "Not affected\n");
> +
> +       return sprintf(buf, "Affected\n");
> +}
> +
> +ssize_t cpu_show_spectre_v2(struct device *dev,
> +                                  struct device_attribute *attr, char *buf)
> +{
> +       if (!(boot_cpu_data.vulnerabilities & MIPS_VULNBL_SPECTRE_V2))
> +               return sprintf(buf, "Unknown\n");
> +
> +       if (!(boot_cpu_data.vulnerable & MIPS_VULNBL_SPECTRE_V2))
> +               return sprintf(buf, "Not affected\n");
> +
> +       return sprintf(buf, "Affected\n");
> +}
> --
> 2.30.0
>
