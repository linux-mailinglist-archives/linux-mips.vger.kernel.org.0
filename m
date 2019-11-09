Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC642F5E94
	for <lists+linux-mips@lfdr.de>; Sat,  9 Nov 2019 12:05:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbfKILFK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 9 Nov 2019 06:05:10 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:35142 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726143AbfKILFJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 9 Nov 2019 06:05:09 -0500
Received: by mail-io1-f65.google.com with SMTP id x21so9156238iol.2
        for <linux-mips@vger.kernel.org>; Sat, 09 Nov 2019 03:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rkX7Mr8ZHigREAkLghKBUDQwAV411Qmv9rFgNaPE5W8=;
        b=vSGto2nUVdRwb9ynrczzHIPuSJ7lgINpBCoIu6NL2PMHg/D5dlSxTCJwJDsfEWSFSv
         WyQ+L7bE6gr2B322SWEWzt0yudN9ZBEaVU4qzIkqe51xy5C9fTmmeHz7BvgK36I345p6
         GC2Teo+tdzZgqyOmg3XDY8ke0tL3BsovsbEpEK1d78FScXFHCbXIp/4PttQygwXEPpl3
         2wIe/wfX6OTPFxTDGSxA7w0IihGPKAqE6j8CZNVZHRT/M3whMvKthGm7Lrum1qdTm33Z
         dYp241UZ3B5TCfUt6Msbz3gR4V5u2YcH/HTLIklR/tTsiypYTYdrv4oJo2UG2Zcii01m
         UPfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rkX7Mr8ZHigREAkLghKBUDQwAV411Qmv9rFgNaPE5W8=;
        b=EekwscjtrQeg+UMtsZvcxpcNzOqedw14HHTruOEcbzTruJHstZipcNI5AMaQTjQOGW
         zvj12elYCRX6weJxosHCk6lq6X1VM3pnk/BKx7hUAvcabZpVZYiIPaY1kXxCOOXDKD6Q
         oQD9YM8RiZW3E4fTffrUFBYkHusCN5XL5U38V59/8SSFTczLtTw2mbncEZPWkMwCo4EX
         R86F5/W6rO9eU0Cd5XMOujzCU0AI63Ao5C0R2ffzktncPY7e+EYFly5zdBEHfUsEffse
         YOJneQ0JX7IW8+q6rl2gDThn3wS95y7ufHgIYqIwUUnLDXVitaHbK9c/ZaIIAzD4LEsQ
         swJQ==
X-Gm-Message-State: APjAAAXGdf3liXc88nXhCT3GLf3mSt7JPHjdky26T78eJbgki2Yhg3O+
        lMoar4rAEP3fvk6TfJ882XlsesElV80XVFAHsDI=
X-Google-Smtp-Source: APXvYqwShhJVLgwtl0LFRIQ+EpRl9dm/jjhh+iBnU14LiAsydVeNrNH1MogYD6si/BajSe3pj6lZaHp3ivM7n7zIokk=
X-Received: by 2002:a05:6638:304:: with SMTP id w4mr12360400jap.57.1573297508616;
 Sat, 09 Nov 2019 03:05:08 -0800 (PST)
MIME-Version: 1.0
References: <1572847881-21712-1-git-send-email-chenhc@lemote.com>
In-Reply-To: <1572847881-21712-1-git-send-email-chenhc@lemote.com>
From:   Huacai Chen <chenhuacai@gmail.com>
Date:   Sat, 9 Nov 2019 19:10:53 +0800
Message-ID: <CAAhV-H52BpgnyCQAh8WVLUEj5JALiPK7RX544CRjAYbty3JdGw@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] MIPS: Loongson: Rename LOONGSON1 to LOONGSON32
To:     Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>
Cc:     Paul Burton <paul.burton@mips.com>,
        Paul Burton <paulburton@kernel.org>,
        Linux MIPS Mailing List <linux-mips@linux-mips.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Paul,

On Mon, Nov 4, 2019 at 2:08 PM Huacai Chen <chenhc@lemote.com> wrote:
>
> Now old Loongson-2E/2F use LOONGSON2EF and will be removed in future,
> newer Loongson-2/3 use LOONGSON64. So rename LOONGSON1 to LOONGSON32
> will make the naming style more unified.
I think it is important to make Kconfig symbols stable, so could you
please review this seris and make all
LOONGSON32/LOONGSON64/LOONGSON2EF symbols renaming be completed in the
5.5 cycle.

Thanks,
Huacai

>
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> ---
>  arch/mips/Kconfig                    | 6 +++---
>  arch/mips/include/asm/cpu-type.h     | 2 +-
>  arch/mips/include/asm/cpu.h          | 2 +-
>  arch/mips/include/asm/irqflags.h     | 2 +-
>  arch/mips/include/asm/module.h       | 4 ++--
>  arch/mips/kernel/cpu-probe.c         | 2 +-
>  arch/mips/kernel/idle.c              | 2 +-
>  arch/mips/kernel/perf_event_mipsxx.c | 2 +-
>  arch/mips/kernel/traps.c             | 2 +-
>  arch/mips/loongson32/Kconfig         | 2 +-
>  arch/mips/loongson32/Platform        | 4 ++--
>  arch/mips/oprofile/common.c          | 2 +-
>  arch/mips/oprofile/op_model_mipsxx.c | 2 +-
>  13 files changed, 17 insertions(+), 17 deletions(-)
>
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 7cb8947..02b869d 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -1511,7 +1511,7 @@ config CPU_LOONGSON2F
>  config CPU_LOONGSON1B
>         bool "Loongson 1B"
>         depends on SYS_HAS_CPU_LOONGSON1B
> -       select CPU_LOONGSON1
> +       select CPU_LOONGSON32
>         select LEDS_GPIO_REGISTER
>         help
>           The Loongson 1B is a 32-bit SoC, which implements the MIPS32
> @@ -1521,7 +1521,7 @@ config CPU_LOONGSON1B
>  config CPU_LOONGSON1C
>         bool "Loongson 1C"
>         depends on SYS_HAS_CPU_LOONGSON1C
> -       select CPU_LOONGSON1
> +       select CPU_LOONGSON32
>         select LEDS_GPIO_REGISTER
>         help
>           The Loongson 1C is a 32-bit SoC, which implements the MIPS32
> @@ -1920,7 +1920,7 @@ config CPU_LOONGSON2EF
>         select ARCH_HAS_PHYS_TO_DMA
>         select CPU_HAS_LOAD_STORE_LR
>
> -config CPU_LOONGSON1
> +config CPU_LOONGSON32
>         bool
>         select CPU_MIPS32
>         select CPU_MIPSR2
> diff --git a/arch/mips/include/asm/cpu-type.h b/arch/mips/include/asm/cpu-type.h
> index 5117e91..c46c59b 100644
> --- a/arch/mips/include/asm/cpu-type.h
> +++ b/arch/mips/include/asm/cpu-type.h
> @@ -25,7 +25,7 @@ static inline int __pure __get_cpu_type(const int cpu_type)
>
>  #if defined(CONFIG_SYS_HAS_CPU_LOONGSON1B) || \
>      defined(CONFIG_SYS_HAS_CPU_LOONGSON1C)
> -       case CPU_LOONGSON1:
> +       case CPU_LOONGSON32:
>  #endif
>
>  #ifdef CONFIG_SYS_HAS_CPU_MIPS32_R1
> diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
> index 0e3a8d4..ea83078 100644
> --- a/arch/mips/include/asm/cpu.h
> +++ b/arch/mips/include/asm/cpu.h
> @@ -312,7 +312,7 @@ enum cpu_type_enum {
>          */
>         CPU_4KC, CPU_4KEC, CPU_4KSC, CPU_24K, CPU_34K, CPU_1004K, CPU_74K,
>         CPU_ALCHEMY, CPU_PR4450, CPU_BMIPS32, CPU_BMIPS3300, CPU_BMIPS4350,
> -       CPU_BMIPS4380, CPU_BMIPS5000, CPU_XBURST, CPU_LOONGSON1, CPU_M14KC,
> +       CPU_BMIPS4380, CPU_BMIPS5000, CPU_XBURST, CPU_LOONGSON32, CPU_M14KC,
>         CPU_M14KEC, CPU_INTERAPTIV, CPU_P5600, CPU_PROAPTIV, CPU_1074K,
>         CPU_M5150, CPU_I6400, CPU_P6600, CPU_M6250,
>
> diff --git a/arch/mips/include/asm/irqflags.h b/arch/mips/include/asm/irqflags.h
> index 4d742ac..881754d 100644
> --- a/arch/mips/include/asm/irqflags.h
> +++ b/arch/mips/include/asm/irqflags.h
> @@ -41,7 +41,7 @@ static inline unsigned long arch_local_irq_save(void)
>         "       .set    push                                            \n"
>         "       .set    reorder                                         \n"
>         "       .set    noat                                            \n"
> -#if defined(CONFIG_CPU_LOONGSON64) || defined (CONFIG_CPU_LOONGSON1)
> +#if defined(CONFIG_CPU_LOONGSON64) || defined (CONFIG_CPU_LOONGSON32)
>         "       mfc0    %[flags], $12                                   \n"
>         "       di                                                      \n"
>  #else
> diff --git a/arch/mips/include/asm/module.h b/arch/mips/include/asm/module.h
> index 9fe9515..9846047 100644
> --- a/arch/mips/include/asm/module.h
> +++ b/arch/mips/include/asm/module.h
> @@ -119,8 +119,8 @@ search_module_dbetables(unsigned long addr)
>  #define MODULE_PROC_FAMILY "RM7000 "
>  #elif defined CONFIG_CPU_SB1
>  #define MODULE_PROC_FAMILY "SB1 "
> -#elif defined CONFIG_CPU_LOONGSON1
> -#define MODULE_PROC_FAMILY "LOONGSON1 "
> +#elif defined CONFIG_CPU_LOONGSON32
> +#define MODULE_PROC_FAMILY "LOONGSON32 "
>  #elif defined CONFIG_CPU_LOONGSON2EF
>  #define MODULE_PROC_FAMILY "LOONGSON2EF "
>  #elif defined CONFIG_CPU_LOONGSON64
> diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
> index c849991..105d89c 100644
> --- a/arch/mips/kernel/cpu-probe.c
> +++ b/arch/mips/kernel/cpu-probe.c
> @@ -1571,7 +1571,7 @@ static inline void cpu_probe_legacy(struct cpuinfo_mips *c, unsigned int cpu)
>         case PRID_IMP_LOONGSON_32:  /* Loongson-1 */
>                 decode_configs(c);
>
> -               c->cputype = CPU_LOONGSON1;
> +               c->cputype = CPU_LOONGSON32;
>
>                 switch (c->processor_id & PRID_REV_MASK) {
>                 case PRID_REV_LOONGSON1B:
> diff --git a/arch/mips/kernel/idle.c b/arch/mips/kernel/idle.c
> index 57dfa6c..37f8e78 100644
> --- a/arch/mips/kernel/idle.c
> +++ b/arch/mips/kernel/idle.c
> @@ -173,7 +173,7 @@ void __init check_wait(void)
>         case CPU_CAVIUM_OCTEON2:
>         case CPU_CAVIUM_OCTEON3:
>         case CPU_XBURST:
> -       case CPU_LOONGSON1:
> +       case CPU_LOONGSON32:
>         case CPU_XLR:
>         case CPU_XLP:
>                 cpu_wait = r4k_wait;
> diff --git a/arch/mips/kernel/perf_event_mipsxx.c b/arch/mips/kernel/perf_event_mipsxx.c
> index 0af456a..128fc99 100644
> --- a/arch/mips/kernel/perf_event_mipsxx.c
> +++ b/arch/mips/kernel/perf_event_mipsxx.c
> @@ -1764,7 +1764,7 @@ init_hw_perf_events(void)
>                 mipspmu.general_event_map = &mipsxxcore_event_map;
>                 mipspmu.cache_event_map = &mipsxxcore_cache_map;
>                 break;
> -       case CPU_LOONGSON1:
> +       case CPU_LOONGSON32:
>                 mipspmu.name = "mips/loongson1";
>                 mipspmu.general_event_map = &mipsxxcore_event_map;
>                 mipspmu.cache_event_map = &mipsxxcore_cache_map;
> diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
> index 0c2570e..83f2a43 100644
> --- a/arch/mips/kernel/traps.c
> +++ b/arch/mips/kernel/traps.c
> @@ -1761,7 +1761,7 @@ static inline void parity_protection_init(void)
>
>         case CPU_5KC:
>         case CPU_5KE:
> -       case CPU_LOONGSON1:
> +       case CPU_LOONGSON32:
>                 write_c0_ecc(0x80000000);
>                 back_to_back_c0_hazard();
>                 /* Set the PE bit (bit 31) in the c0_errctl register. */
> diff --git a/arch/mips/loongson32/Kconfig b/arch/mips/loongson32/Kconfig
> index 6dacc14..e27879b 100644
> --- a/arch/mips/loongson32/Kconfig
> +++ b/arch/mips/loongson32/Kconfig
> @@ -38,7 +38,7 @@ endchoice
>  menuconfig CEVT_CSRC_LS1X
>         bool "Use PWM Timer for clockevent/clocksource"
>         select MIPS_EXTERNAL_TIMER
> -       depends on CPU_LOONGSON1
> +       depends on CPU_LOONGSON32
>         help
>           This option changes the default clockevent/clocksource to PWM Timer,
>           and is required by Loongson1 CPUFreq support.
> diff --git a/arch/mips/loongson32/Platform b/arch/mips/loongson32/Platform
> index 3332155..7f8e342 100644
> --- a/arch/mips/loongson32/Platform
> +++ b/arch/mips/loongson32/Platform
> @@ -1,4 +1,4 @@
> -cflags-$(CONFIG_CPU_LOONGSON1)         += -march=mips32r2 -Wa,--trap
> +cflags-$(CONFIG_CPU_LOONGSON32)                += -march=mips32r2 -Wa,--trap
>  platform-$(CONFIG_MACH_LOONGSON32)     += loongson32/
>  cflags-$(CONFIG_MACH_LOONGSON32)       += -I$(srctree)/arch/mips/include/asm/mach-loongson32
> -load-$(CONFIG_CPU_LOONGSON1)           += 0xffffffff80200000
> +load-$(CONFIG_CPU_LOONGSON32)          += 0xffffffff80200000
> diff --git a/arch/mips/oprofile/common.c b/arch/mips/oprofile/common.c
> index 25cfa70..03db268 100644
> --- a/arch/mips/oprofile/common.c
> +++ b/arch/mips/oprofile/common.c
> @@ -93,7 +93,7 @@ int __init oprofile_arch_init(struct oprofile_operations *ops)
>         case CPU_P5600:
>         case CPU_I6400:
>         case CPU_M5150:
> -       case CPU_LOONGSON1:
> +       case CPU_LOONGSON32:
>         case CPU_SB1:
>         case CPU_SB1A:
>         case CPU_R10000:
> diff --git a/arch/mips/oprofile/op_model_mipsxx.c b/arch/mips/oprofile/op_model_mipsxx.c
> index 96c13a0..a537bf9 100644
> --- a/arch/mips/oprofile/op_model_mipsxx.c
> +++ b/arch/mips/oprofile/op_model_mipsxx.c
> @@ -420,7 +420,7 @@ static int __init mipsxx_init(void)
>                 op_model_mipsxx_ops.cpu_type = "mips/sb1";
>                 break;
>
> -       case CPU_LOONGSON1:
> +       case CPU_LOONGSON32:
>                 op_model_mipsxx_ops.cpu_type = "mips/loongson1";
>                 break;
>
> --
> 2.7.0
>
