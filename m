Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 604C719EB43
	for <lists+linux-mips@lfdr.de>; Sun,  5 Apr 2020 14:45:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726671AbgDEMpk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 5 Apr 2020 08:45:40 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:57861 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726626AbgDEMpk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 5 Apr 2020 08:45:40 -0400
Received: from mail-qk1-f172.google.com ([209.85.222.172]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MBE3k-1jTMui06wA-00Cgnw; Sun, 05 Apr 2020 14:45:38 +0200
Received: by mail-qk1-f172.google.com with SMTP id z15so7047259qki.7;
        Sun, 05 Apr 2020 05:45:37 -0700 (PDT)
X-Gm-Message-State: AGi0PuZ5IZCoyThY5s83+oahcdvmia0m0BSubcfrQbetgf7YnVbPqct9
        0i0nWFMLQUmbOHdk6iBNOYn2BUkensAh8E+kCB0=
X-Google-Smtp-Source: APiQypKlKm5u3myZf/GwFpSyF6fIiqJOxT5moUwM4gaZfAI+KUBEWYbYQYwZh31yY3jPs9ZHIBimRXzXSm0vY+Q4Zqk=
X-Received: by 2002:a37:6455:: with SMTP id y82mr17373098qkb.286.1586090736480;
 Sun, 05 Apr 2020 05:45:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200405025123.154688-1-sboyd@kernel.org> <20200405025123.154688-7-sboyd@kernel.org>
In-Reply-To: <20200405025123.154688-7-sboyd@kernel.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Sun, 5 Apr 2020 14:45:20 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2M54quhRNK4xvwjz9O9oZwgrobc_wtkGaeA2PMYwOUdg@mail.gmail.com>
Message-ID: <CAK8P3a2M54quhRNK4xvwjz9O9oZwgrobc_wtkGaeA2PMYwOUdg@mail.gmail.com>
Subject: Re: [PATCH 6/9] clk: Allow the common clk framework to be selectable
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mark Salter <msalter@redhat.com>,
        Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Guan Xuetao <gxt@pku.edu.cn>,
        Russell King <linux@armlinux.org.uk>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        linux-c6x-dev@linux-c6x.org,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-sh list <linux-sh@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:s9GIWuPh2wPqFIdt+bFrY/z0h262eHWTOJr4HxpC6mH2widZvOo
 rjc2behki1TOKtNu7+cOZx+b9RaxnELswNCEo4qAp+F7KAN1GhYapNjlN0P4jDJW8acqgJ7
 P+KWx0cmF/5ATm94HRo6q25sSzDRzrZEFuoonfY42fU55WRjI8oS0jaMFoHPB6Ifc/1jcEV
 plF/foFLtweZnvhC3ODuQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:spf/WT7vaD4=:lTLw/iCYFbB0EQzxRHNJrH
 LFidJEvQe2rrqpAPwTnoDv2HeiFr29b2tCiUJRPXNLRNeiI9FR4BudlSqLv4KNw4CvPQ+OiJn
 9LYJF6rIu1HLnhor89I24KIGCEvwEiSOao11fiIbWXouCW4s7ARVYwuthPR24Qq4/YSpI7/M5
 l3zwg0mZqxIh52aI13eRHwP9YW4etB8KDYdoPQZquVxbPAU/klp9t3CFgFKCIT1CPpa5+WAMI
 IYDnC5scuo90gbIac26uFHO1ob21A/4GcO3CnbikW8t88mBCh65BXfdOFWCBZ57sUqauXzHcG
 qAz8KoLXDc31bx4dJTju30AN2G0cNFI4tE0S9cab47wyaJXHiI7pYmRSGScg2SIjr38R6/n9y
 uN0LiUPkpDy6Vmf+cYp4GbPk/y9wT2u0xRjq1i1NaAVQS5UvbKtrYGq08WBjbDU4S9t2jczZL
 7VmKZtT2mwPLsM7R8Web/m5Wm+zxLqj4/AsHvhNkW5z9wfyGdm6aYK864LWV+Onh7d7e5uoUO
 eYn6aVhsToXleJO1Y0hMULnqMg6xBsjuoUpmxCdh11a7O+QYokYoKGJ2VxmTx1D+P1ydtv+bp
 t1gWlmILrvQ6YAx4Z4M/zuvNZ9mR8TJYWEqQDHl+pc8uVQiHktUHFqk0MfIU3eUI7aYQodHZ7
 cQnv/SXeg23xjNWcacgzBDGJYCdFfvcHpbqz/dQz9bm6baODNNesyXHiLzuRPauh1g7arX/0r
 1Ggsv1GiGUdRysZC/jSLRC38/DHatFJTjkuGiut0PGQDFx6Q7U2gqj1hF+Ry2i6TWDOLEQtXo
 ANm5T2CNRfl5xBTh1yX4fMTyOODA9aHcomfSuZA6qK00cnzQZU=
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Apr 5, 2020 at 4:51 AM Stephen Boyd <sboyd@kernel.org> wrote:
> There's one snag with doing this, and that's making sure that randconfig
> builds don't select this option when some architecture or platform
> implements 'struct clk' outside of the common clk framework. Introduce a
> new config option 'HAVE_LEGACY_CLK' to indicate those platforms that
> haven't migrated to the common clk framework and therefore shouldn't be
> allowed to select this new config option. Also add a note that we hope
> one day to remove this config entirely.

Good idea!

I've looked through the individual ones and commented a bit on
what I think may or may not happen with them.

ralink SOC_MT7621 is the only one that I think you got wrong,
as it already has common-clk support.

>  arch/arm/Kconfig              |  2 ++
>  arch/c6x/Kconfig              |  1 +
>  arch/m68k/Kconfig.cpu         |  2 +-
>  arch/mips/Kconfig             |  6 ++++--
>  arch/mips/loongson2ef/Kconfig |  2 +-
>  arch/sh/boards/Kconfig        |  5 +++++
>  arch/unicore32/Kconfig        |  2 +-
>  drivers/clk/Kconfig           | 17 +++++++++++++----
>  8 files changed, 28 insertions(+), 9 deletions(-)
>
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index eeabdc5a3dd2..0606e1bbd7b6 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -364,6 +364,7 @@ config ARCH_EP93XX
>         select CPU_ARM920T
>         select GENERIC_CLOCKEVENTS
>         select GPIOLIB
> +       select HAVE_LEGACY_CLK
>         help
>           This enables support for the Cirrus EP93xx series of CPUs.
>
> @@ -522,6 +523,7 @@ config ARCH_OMAP1
>         select GENERIC_IRQ_MULTI_HANDLER
>         select GPIOLIB
>         select HAVE_IDE
> +       select HAVE_LEGACY_CLK
>         select IRQ_DOMAIN
>         select NEED_MACH_IO_H if PCCARD
>         select NEED_MACH_MEMORY_H

Ah nice, I thought there were more than two implementations
left. I need to refresh the series for OMAP1 that I did last year
and debug the regression that caused. I think Linus Walleij
has looked into the ep93xx one at some point.

> diff --git a/arch/c6x/Kconfig b/arch/c6x/Kconfig
> index e65e8d82442a..6444ebfd06a6 100644
> --- a/arch/c6x/Kconfig
> +++ b/arch/c6x/Kconfig
> @@ -11,6 +11,7 @@ config C6X
>         select ARCH_HAS_SYNC_DMA_FOR_CPU
>         select ARCH_HAS_SYNC_DMA_FOR_DEVICE
>         select CLKDEV_LOOKUP
> +       select HAVE_LEGACY_CLK
>         select GENERIC_ATOMIC64
>         select GENERIC_IRQ_SHOW
>         select HAVE_ARCH_TRACEHOOK

This was last touched in 2012 when TMS320C6678 support
was added. It seems to be based on the original same code
as omap1 and omap2 that eventually turned into the common
clock subsystem, so it would clearly be possible to do a
step-by-step conversion like I did for omap1, but I suspect
we can wait for all of c6x-linux to become obsolete enough.

> diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
> index 60ac1cd8b96f..bd2d29c22a10 100644
> --- a/arch/m68k/Kconfig.cpu
> +++ b/arch/m68k/Kconfig.cpu
> @@ -28,7 +28,7 @@ config COLDFIRE
>         select CPU_HAS_NO_MULDIV64
>         select GENERIC_CSUM
>         select GPIOLIB
> -       select HAVE_CLK
> +       select HAVE_LEGACY_CLK
>
>  endchoice

The coldfire clock implementation looks rather simple compared
to chips from the 2010s: most chips have only fixed clocks,
and three of them have one of two registers of clock gates.

It shouldn't be hard to convert, but enabling common-clk will
cause a noticeable kernel size increase on the fairly limited
hardware.

Simply enabling COMMON_CLK in m5475evb_defconfig
results in a 1.7% or 40KB growth in kernel size, plus there
would be additional dynamic memory usage:

   text    data     bss     dec     hex filename
1934726 263616   83284 2281626 22d09a obj/vmlinux-before
1971989 266192   83308 2321489 236c51 obj/vmlinux-after

> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index e53a8dd5c19b..fa02c715ab25 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -181,7 +181,7 @@ config AR7
>         select SYS_SUPPORTS_ZBOOT_UART16550
>         select GPIOLIB
>         select VLYNQ
> -       select HAVE_CLK
> +       select HAVE_LEGACY_CLK
>         help
>           Support for the Texas Instruments AR7 System-on-a-Chip
>           family: TNETD7100, 7200 and 7300.

I suspect this platform is fairly dead, OpenWRT dropped support for it,
and the known machines have at most 16MB of RAM, which limits
the number of use cases that also want to build recent kernels.

> @@ -296,9 +296,9 @@ config BCM63XX
>         select SYS_HAS_EARLY_PRINTK
>         select SWAP_IO_SPACE
>         select GPIOLIB
> -       select HAVE_CLK
>         select MIPS_L1_CACHE_SHIFT_4
>         select CLKDEV_LOOKUP
> +       select HAVE_LEGACY_CLK
>         help
>           Support for BCM63XX based boards
>
> @@ -419,6 +419,7 @@ config LANTIQ
>         select SWAP_IO_SPACE
>         select BOOT_RAW
>         select CLKDEV_LOOKUP
> +       select HAVE_LEGACY_CLK
>         select USE_OF
>         select PINCTRL
>         select PINCTRL_LANTIQ
> @@ -656,6 +657,7 @@ config RALINK
>         select SYS_SUPPORTS_MIPS16
>         select SYS_HAS_EARLY_PRINTK
>         select CLKDEV_LOOKUP
> +       select HAVE_LEGACY_CLK
>         select ARCH_HAS_RESET_CONTROLLER
>         select RESET_CONTROLLER

All three of these are older platforms that still have a number of machines
supported in OpenWRT, so there is hope that someone would do the work
to add common-clk support. Both Lantiq and Ralink have been converted
to device tree not too long ago.

I think the RALINK entry needs to be changed, as this includes
SOC_MT7621, which already uses COMMON_CLK.

> diff --git a/arch/mips/loongson2ef/Kconfig b/arch/mips/loongson2ef/Kconfig
> index 595dd48e1e4d..c9ec43afde73 100644
> --- a/arch/mips/loongson2ef/Kconfig
> +++ b/arch/mips/loongson2ef/Kconfig
> @@ -46,7 +46,7 @@ config LEMOTE_MACH2F
>         select CSRC_R4K if ! MIPS_EXTERNAL_TIMER
>         select DMA_NONCOHERENT
>         select GENERIC_ISA_DMA_SUPPORT_BROKEN
> -       select HAVE_CLK
> +       select HAVE_LEGACY_CLK
>         select FORCE_PCI
>         select I8259
>         select IRQ_MIPS_CPU

For all I can tell, this driver only uses the clock interface for
its cpufreq driver, and the actual API definition looks bogus.

Half of it could be folded into the cpufreq driver, and the rest
of it removed, along with arch/mips/include/asm/clock.h

> diff --git a/arch/sh/boards/Kconfig b/arch/sh/boards/Kconfig
> index cee24c308337..fb0ca0c1efe1 100644
> --- a/arch/sh/boards/Kconfig
> +++ b/arch/sh/boards/Kconfig
> @@ -7,6 +7,11 @@ config SOLUTION_ENGINE
>  config SH_ALPHA_BOARD
>         bool
>
> +config SH_CUSTOM_CLK
> +       def_bool y
> +       depends on !SH_DEVICE_TREE
> +       select HAVE_LEGACY_CLK
> +
>  config SH_DEVICE_TREE
>         bool
>         select OF

It's going to be hard to find anyone willing to touch this, as the code
is very large but has few users these days.

drivers/sh/clk/ is basically a generic clk subsystem on its own, and
there are at least 28 different arch/sh SoCs with drivers for it.

       Arnd
