Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C845ED31F
	for <lists+linux-mips@lfdr.de>; Sun,  3 Nov 2019 12:26:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727647AbfKCL0a (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 3 Nov 2019 06:26:30 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:37506 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727641AbfKCL0a (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 3 Nov 2019 06:26:30 -0500
Received: by mail-io1-f65.google.com with SMTP id 1so15462418iou.4
        for <linux-mips@vger.kernel.org>; Sun, 03 Nov 2019 03:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yVmXUq2UYujMVjMnkVCv4m5c2tnXTv/E89Mw72+n2+s=;
        b=Z263X9agd0ptENjVH1J5nZtn2Aalkk9EzFTfpiLNLdzs2m0bBai0TLN5p1F2VW2s33
         P6IR3R40TDBv9DCT3ohouNbCfAd10jIlM66pmBILQwtzQLFMemr4r/loeIADf+M1UwwN
         6zFlSfgoq9VeviiLG1LdQSMYu7CRSzGyodJ5GO1nEYWaJY58fsoaoM8QDsqRF9mwHLbM
         Dl5oC2logc2AGf8UmJ/+ejc16gMw5E7X5XlADX14P5gANUrf5kTozUS+OmkVCHyK+CH7
         fXffmJwmJNlVnP5JhKYZMyZJ0cnVxJG2IJdsSD47PHSiC3XBzsdPy+0rbFJCstD3mfNj
         3ArA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yVmXUq2UYujMVjMnkVCv4m5c2tnXTv/E89Mw72+n2+s=;
        b=bpfjl+vnG6opLMUyDnk4Q8aWe4HWwRbfoDVmk6xOT6lg9imccxBDi4qqUiog+qvCUC
         xXuV5DLgOAtf7IQ8nIsAEJyiS8n7KxIWY4N6hZtL4JOfuABL4S5t5tZSs9rc1y709HJH
         11M1Zfk7JQtoaeRn1/mUS1+BWakACodYk2PMFq56UDT5fVEfAmeIJThmGJnZBfzlfjNx
         M6PYo91DjV4wi3DBb/frCm0DzXQVKMyB9sv1nbr4Hxt8VZAfKFXG8obLEKYsZvqQI/vi
         VBL5z5eU6V707hxNdcDfIk9oWEt9sd7oyaSn/k8AXS4cjo6n99c674y5txju/XQztXv1
         d3Lw==
X-Gm-Message-State: APjAAAVV4WgDgBGSRx7+Zipu0FDzajPR510vfrCcZQwXo2YnZrzSPZlf
        buWdtOX+armfEDlOJBI9RyhTd8l0wf38IKlo+0CwfjHk5PE=
X-Google-Smtp-Source: APXvYqyfla/HB2EXHFlG1iDl+rG+tfSnx5zCTLOtwsfIiBAD1TnP79BjClMzDlTMxRoW/hecmyOZp2RvijOar86l7Fc=
X-Received: by 2002:a5e:9741:: with SMTP id h1mr18353645ioq.143.1572780388766;
 Sun, 03 Nov 2019 03:26:28 -0800 (PST)
MIME-Version: 1.0
References: <1572758417-29265-1-git-send-email-chenhc@lemote.com> <1572758417-29265-2-git-send-email-chenhc@lemote.com>
In-Reply-To: <1572758417-29265-2-git-send-email-chenhc@lemote.com>
From:   Huacai Chen <chenhuacai@gmail.com>
Date:   Sun, 3 Nov 2019 19:26:12 +0800
Message-ID: <CAAhV-H4yxWrxpmD9A7RdHGQXvvxJJ=vBHOgGWOuOGVYVALwu6A@mail.gmail.com>
Subject: Re: [PATCH 2/3] MIPS: Loongson: Rename LOONGSON1 to LOONGSON32
To:     Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>
Cc:     Paul Burton <paul.burton@mips.com>,
        Linux MIPS Mailing List <linux-mips@linux-mips.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, all,

I have some trouble to send the first patch of this series, my first
patch is "MIPS: Loongson: Remove Loongson-2E/2F support" and it is as
big as 200KB+. I have tried many times but it doesn't appear in
maillist (my personal e-mail can receive it).

Anyone has some methods? below is the summary of the first patch:

MAINTAINERS                                        |   9 -
 arch/mips/Kbuild.platforms                         |   1 -
 arch/mips/Kconfig                                  |  80 +----
 arch/mips/configs/fuloong2e_defconfig              | 236 --------------
 arch/mips/configs/lemote2f_defconfig               | 351 ---------------------
 arch/mips/include/asm/bootinfo.h                   |  15 -
 arch/mips/include/asm/cpu-type.h                   |   4 -
 arch/mips/include/asm/cpu.h                        |   2 +-
 arch/mips/include/asm/hazards.h                    |   4 +-
 .../asm/mach-loongson2ef/cpu-feature-overrides.h   |  44 ---
 .../include/asm/mach-loongson2ef/cs5536/cs5536.h   | 306 ------------------
 .../asm/mach-loongson2ef/cs5536/cs5536_mfgpt.h     |  36 ---
 .../asm/mach-loongson2ef/cs5536/cs5536_pci.h       | 153 ---------
 .../asm/mach-loongson2ef/cs5536/cs5536_vsm.h       |  32 --
 arch/mips/include/asm/mach-loongson2ef/loongson.h  | 328 -------------------
 arch/mips/include/asm/mach-loongson2ef/machine.h   |  23 --
 .../include/asm/mach-loongson2ef/mc146818rtc.h     |  36 ---
 arch/mips/include/asm/mach-loongson2ef/mem.h       |  37 ---
 arch/mips/include/asm/mach-loongson2ef/pci.h       |  46 ---
 arch/mips/include/asm/mach-loongson2ef/spaces.h    |  10 -
 .../asm/mach-loongson64/cpu-feature-overrides.h    |   3 +-
 arch/mips/include/asm/module.h                     |   2 -
 arch/mips/include/asm/r4kcache.h                   |  23 +-
 arch/mips/kernel/cpu-probe.c                       |  14 -
 arch/mips/loongson2ef/Kconfig                      |  93 ------
 arch/mips/loongson2ef/Makefile                     |  18 --
 arch/mips/loongson2ef/Platform                     |  32 --
 arch/mips/loongson2ef/common/Makefile              |  27 --
 arch/mips/loongson2ef/common/bonito-irq.c          |  49 ---
 arch/mips/loongson2ef/common/cmdline.c             |  44 ---
 arch/mips/loongson2ef/common/cs5536/Makefile       |  12 -
 arch/mips/loongson2ef/common/cs5536/cs5536_acc.c   | 136 --------
 arch/mips/loongson2ef/common/cs5536/cs5536_ehci.c  | 156 ---------
 arch/mips/loongson2ef/common/cs5536/cs5536_ide.c   | 188 -----------
 arch/mips/loongson2ef/common/cs5536/cs5536_isa.c   | 326 -------------------
 arch/mips/loongson2ef/common/cs5536/cs5536_mfgpt.c | 207 ------------
 arch/mips/loongson2ef/common/cs5536/cs5536_ohci.c  | 145 ---------
 arch/mips/loongson2ef/common/cs5536/cs5536_pci.c   |  84 -----
 arch/mips/loongson2ef/common/early_printk.c        |  38 ---
 arch/mips/loongson2ef/common/env.c                 |  71 -----
 arch/mips/loongson2ef/common/init.c                |  51 ---
 arch/mips/loongson2ef/common/irq.c                 |  63 ----
 arch/mips/loongson2ef/common/machtype.c            |  62 ----
 arch/mips/loongson2ef/common/mem.c                 | 120 -------
 arch/mips/loongson2ef/common/pci.c                 |  89 ------
 arch/mips/loongson2ef/common/platform.c            |  27 --
 arch/mips/loongson2ef/common/pm.c                  | 158 ----------
 arch/mips/loongson2ef/common/reset.c               |  73 -----
 arch/mips/loongson2ef/common/rtc.c                 |  39 ---
 arch/mips/loongson2ef/common/serial.c              |  86 -----
 arch/mips/loongson2ef/common/setup.c               |  30 --
 arch/mips/loongson2ef/common/time.c                |  28 --
 arch/mips/loongson2ef/common/uart_base.c           |  41 ---
 arch/mips/loongson2ef/fuloong-2e/Makefile          |   6 -
 arch/mips/loongson2ef/fuloong-2e/dma.c             |  12 -
 arch/mips/loongson2ef/fuloong-2e/irq.c             |  65 ----
 arch/mips/loongson2ef/fuloong-2e/reset.c           |  19 --
 arch/mips/loongson2ef/lemote-2f/Makefile           |  12 -
 arch/mips/loongson2ef/lemote-2f/clock.c            | 143 ---------
 arch/mips/loongson2ef/lemote-2f/dma.c              |  14 -
 arch/mips/loongson2ef/lemote-2f/ec_kb3310b.c       | 125 --------
 arch/mips/loongson2ef/lemote-2f/ec_kb3310b.h       | 184 -----------
 arch/mips/loongson2ef/lemote-2f/irq.c              | 126 --------
 arch/mips/loongson2ef/lemote-2f/machtype.c         |  41 ---
 arch/mips/loongson2ef/lemote-2f/pm.c               | 145 ---------
 arch/mips/loongson2ef/lemote-2f/reset.c            | 155 ---------
 arch/mips/mm/c-r4k.c                               |  69 +---
 arch/mips/mm/tlb-r4k.c                             |   3 -
 arch/mips/mm/tlbex.c                               | 154 +++++----
 arch/mips/oprofile/Makefile                        |   1 -
 arch/mips/oprofile/common.c                        |   4 -
 arch/mips/oprofile/op_model_loongson2.c            | 161 ----------
 arch/mips/pci/Makefile                             |   2 -
 arch/mips/pci/fixup-fuloong2e.c                    | 221 -------------
 arch/mips/pci/fixup-lemote2f.c                     | 156 ---------
 arch/mips/pci/ops-loongson2.c                      | 213 -------------
 drivers/cpufreq/Kconfig                            |  13 -
 drivers/cpufreq/Makefile                           |   1 -
 drivers/cpufreq/loongson2_cpufreq.c                | 197 ------------
 drivers/gpio/Kconfig                               |   4 +-
 80 files changed, 88 insertions(+), 6446 deletions(-)
 delete mode 100644 arch/mips/configs/fuloong2e_defconfig
 delete mode 100644 arch/mips/configs/lemote2f_defconfig
 delete mode 100644
arch/mips/include/asm/mach-loongson2ef/cpu-feature-overrides.h
 delete mode 100644 arch/mips/include/asm/mach-loongson2ef/cs5536/cs5536.h
 delete mode 100644 arch/mips/include/asm/mach-loongson2ef/cs5536/cs5536_mfgpt.h
 delete mode 100644 arch/mips/include/asm/mach-loongson2ef/cs5536/cs5536_pci.h
 delete mode 100644 arch/mips/include/asm/mach-loongson2ef/cs5536/cs5536_vsm.h
 delete mode 100644 arch/mips/include/asm/mach-loongson2ef/loongson.h
 delete mode 100644 arch/mips/include/asm/mach-loongson2ef/machine.h
 delete mode 100644 arch/mips/include/asm/mach-loongson2ef/mc146818rtc.h
 delete mode 100644 arch/mips/include/asm/mach-loongson2ef/mem.h
 delete mode 100644 arch/mips/include/asm/mach-loongson2ef/pci.h
 delete mode 100644 arch/mips/include/asm/mach-loongson2ef/spaces.h
 delete mode 100644 arch/mips/loongson2ef/Kconfig
 delete mode 100644 arch/mips/loongson2ef/Makefile
 delete mode 100644 arch/mips/loongson2ef/Platform
 delete mode 100644 arch/mips/loongson2ef/common/Makefile
 delete mode 100644 arch/mips/loongson2ef/common/bonito-irq.c
 delete mode 100644 arch/mips/loongson2ef/common/cmdline.c
 delete mode 100644 arch/mips/loongson2ef/common/cs5536/Makefile
 delete mode 100644 arch/mips/loongson2ef/common/cs5536/cs5536_acc.c
 delete mode 100644 arch/mips/loongson2ef/common/cs5536/cs5536_ehci.c
 delete mode 100644 arch/mips/loongson2ef/common/cs5536/cs5536_ide.c
 delete mode 100644 arch/mips/loongson2ef/common/cs5536/cs5536_isa.c
 delete mode 100644 arch/mips/loongson2ef/common/cs5536/cs5536_mfgpt.c
 delete mode 100644 arch/mips/loongson2ef/common/cs5536/cs5536_ohci.c
 delete mode 100644 arch/mips/loongson2ef/common/cs5536/cs5536_pci.c
 delete mode 100644 arch/mips/loongson2ef/common/early_printk.c
 delete mode 100644 arch/mips/loongson2ef/common/env.c
 delete mode 100644 arch/mips/loongson2ef/common/init.c
 delete mode 100644 arch/mips/loongson2ef/common/irq.c
 delete mode 100644 arch/mips/loongson2ef/common/machtype.c
 delete mode 100644 arch/mips/loongson2ef/common/mem.c
 delete mode 100644 arch/mips/loongson2ef/common/pci.c
 delete mode 100644 arch/mips/loongson2ef/common/platform.c
 delete mode 100644 arch/mips/loongson2ef/common/pm.c
 delete mode 100644 arch/mips/loongson2ef/common/reset.c
 delete mode 100644 arch/mips/loongson2ef/common/rtc.c
 delete mode 100644 arch/mips/loongson2ef/common/serial.c
 delete mode 100644 arch/mips/loongson2ef/common/setup.c
 delete mode 100644 arch/mips/loongson2ef/common/time.c
 delete mode 100644 arch/mips/loongson2ef/common/uart_base.c
 delete mode 100644 arch/mips/loongson2ef/fuloong-2e/Makefile
 delete mode 100644 arch/mips/loongson2ef/fuloong-2e/dma.c
 delete mode 100644 arch/mips/loongson2ef/fuloong-2e/irq.c
 delete mode 100644 arch/mips/loongson2ef/fuloong-2e/reset.c
 delete mode 100644 arch/mips/loongson2ef/lemote-2f/Makefile
 delete mode 100644 arch/mips/loongson2ef/lemote-2f/clock.c
 delete mode 100644 arch/mips/loongson2ef/lemote-2f/dma.c
 delete mode 100644 arch/mips/loongson2ef/lemote-2f/ec_kb3310b.c
 delete mode 100644 arch/mips/loongson2ef/lemote-2f/ec_kb3310b.h
 delete mode 100644 arch/mips/loongson2ef/lemote-2f/irq.c
 delete mode 100644 arch/mips/loongson2ef/lemote-2f/machtype.c
 delete mode 100644 arch/mips/loongson2ef/lemote-2f/pm.c
 delete mode 100644 arch/mips/loongson2ef/lemote-2f/reset.c
 delete mode 100644 arch/mips/oprofile/op_model_loongson2.c
 delete mode 100644 arch/mips/pci/fixup-fuloong2e.c
 delete mode 100644 arch/mips/pci/fixup-lemote2f.c
 delete mode 100644 arch/mips/pci/ops-loongson2.c
 delete mode 100644 drivers/cpufreq/loongson2_cpufreq.c

On Sun, Nov 3, 2019 at 1:18 PM Huacai Chen <chenhc@lemote.com> wrote:
>
> Old Loongson-2E/2F has been removed, new Loongson-2/3 use LOONGSON64,
> So rename LOONGSON1 to LOONGSON32 will make the naming style unified.
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
> index 03e9304..b578eae 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -1480,7 +1480,7 @@ config CPU_LOONGSON3_WORKAROUNDS
>  config CPU_LOONGSON1B
>         bool "Loongson 1B"
>         depends on SYS_HAS_CPU_LOONGSON1B
> -       select CPU_LOONGSON1
> +       select CPU_LOONGSON32
>         select LEDS_GPIO_REGISTER
>         help
>           The Loongson 1B is a 32-bit SoC, which implements the MIPS32
> @@ -1490,7 +1490,7 @@ config CPU_LOONGSON1B
>  config CPU_LOONGSON1C
>         bool "Loongson 1C"
>         depends on SYS_HAS_CPU_LOONGSON1C
> -       select CPU_LOONGSON1
> +       select CPU_LOONGSON32
>         select LEDS_GPIO_REGISTER
>         help
>           The Loongson 1C is a 32-bit SoC, which implements the MIPS32
> @@ -1853,7 +1853,7 @@ config SYS_SUPPORTS_ZBOOT_UART_PROM
>         bool
>         select SYS_SUPPORTS_ZBOOT
>
> -config CPU_LOONGSON1
> +config CPU_LOONGSON32
>         bool
>         select CPU_MIPS32
>         select CPU_MIPSR2
> diff --git a/arch/mips/include/asm/cpu-type.h b/arch/mips/include/asm/cpu-type.h
> index f40da24..d324c3d 100644
> --- a/arch/mips/include/asm/cpu-type.h
> +++ b/arch/mips/include/asm/cpu-type.h
> @@ -21,7 +21,7 @@ static inline int __pure __get_cpu_type(const int cpu_type)
>
>  #if defined(CONFIG_SYS_HAS_CPU_LOONGSON1B) || \
>      defined(CONFIG_SYS_HAS_CPU_LOONGSON1C)
> -       case CPU_LOONGSON1:
> +       case CPU_LOONGSON32:
>  #endif
>
>  #ifdef CONFIG_SYS_HAS_CPU_MIPS32_R1
> diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
> index b39ae3f..2d74f03 100644
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
> index 03cc882..161e7b5 100644
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
>  #elif defined CONFIG_CPU_LOONGSON64
>  #define MODULE_PROC_FAMILY "LOONGSON64 "
>  #elif defined CONFIG_CPU_CAVIUM_OCTEON
> diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
> index 0933cfb..229d0ae 100644
> --- a/arch/mips/kernel/cpu-probe.c
> +++ b/arch/mips/kernel/cpu-probe.c
> @@ -1557,7 +1557,7 @@ static inline void cpu_probe_legacy(struct cpuinfo_mips *c, unsigned int cpu)
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
> index cbfa849..606aa12 100644
> --- a/arch/mips/oprofile/common.c
> +++ b/arch/mips/oprofile/common.c
> @@ -92,7 +92,7 @@ int __init oprofile_arch_init(struct oprofile_operations *ops)
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
