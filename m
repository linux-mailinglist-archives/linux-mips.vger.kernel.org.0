Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE613391A42
	for <lists+linux-mips@lfdr.de>; Wed, 26 May 2021 16:33:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234739AbhEZOet (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 26 May 2021 10:34:49 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:20173 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234416AbhEZOes (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 26 May 2021 10:34:48 -0400
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 14QEX0hZ030416;
        Wed, 26 May 2021 23:33:01 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 14QEX0hZ030416
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1622039581;
        bh=K2JBpUyGmknhlRJpT71wl4Baxz8GsbPi2HBWhe0fUJY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=cnmXS+DqWdAPC0p8MNIg0X+ZuRBIktoOUUR+EQB4vPPRCGwGVlLjEGNDw3EmAqZlv
         xlyoU4qIgALC1L++WZgyjKMXDzp+GxzDeYEL0F6IhJRd7Rpw2XWDIFJ8o7cQRW8BJc
         58bmB0Jh48QslQPtKIaufL8A/fujJ7UQngW2AlQLs93Fom+msv11CPKYfc9S8R6atG
         3OOPiA7jJYoMBhNmRyZsxR2MDGv0EVvIwT7A7e7yI9l8/pHrO3j3QQFOzjOgPaV2AN
         D3pbKwvq9+nlzItRdCDnwVjN2eBR7ykeJ5nQmYRfOW40+I524Aqu+Vsx77vDiJBmu1
         zIUzibiWGcAvw==
X-Nifty-SrcIP: [209.85.214.181]
Received: by mail-pl1-f181.google.com with SMTP id d20so700064pls.13;
        Wed, 26 May 2021 07:33:00 -0700 (PDT)
X-Gm-Message-State: AOAM530GOUOKnQj3QL/c4ZQ46GiqErhr0ztzPNR1/JAnM+d4jhe3s5UJ
        GuU5kapvCyfdDuHaoVR2HnibyZ/eo5oliR92Jac=
X-Google-Smtp-Source: ABdhPJw/7i4Yr5Lur94Y0RHgLFU9NY7pValTqlXUvZTdqsgLwd6wmbbeeFmUfP1tSYkLq/bZEryNx1br7CSMU1EHLow=
X-Received: by 2002:a17:902:541:b029:f0:3187:409b with SMTP id
 59-20020a1709020541b02900f03187409bmr36247746plf.47.1622039579510; Wed, 26
 May 2021 07:32:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210512075729.60291-1-masahiroy@kernel.org>
In-Reply-To: <20210512075729.60291-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 26 May 2021 23:32:22 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS7cEj9h=Hi0O-AoFjJPg2mxp0zbi8boXj4O9aYt_yg6Q@mail.gmail.com>
Message-ID: <CAK7LNAS7cEj9h=Hi0O-AoFjJPg2mxp0zbi8boXj4O9aYt_yg6Q@mail.gmail.com>
Subject: Re: [PATCH 1/5] kbuild: require all architectures to have arch/$(SRCARCH)/Kbuild
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Albert Ou <aou@eecs.berkeley.edu>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Borislav Petkov <bp@alien8.de>,
        Brian Cain <bcain@codeaurora.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Chris Zankel <chris@zankel.net>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Greentime Hu <green.hu@gmail.com>, Guo Ren <guoren@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Helge Deller <deller@gmx.de>, Ingo Molnar <mingo@redhat.com>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Jeff Dike <jdike@addtoit.com>, Jonas Bonn <jonas@southpole.se>,
        Ley Foon Tan <ley.foon.tan@intel.com>,
        Matt Turner <mattst88@gmail.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michal Marek <michal.lkml@markovi.net>,
        Michal Simek <monstr@monstr.eu>,
        Nick Hu <nickhu@andestech.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Mackerras <paulus@samba.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Rich Felker <dalias@libc.org>,
        Richard Henderson <rth@twiddle.net>,
        Richard Weinberger <richard@nod.at>,
        Russell King <linux@armlinux.org.uk>,
        Stafford Horne <shorne@gmail.com>,
        Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Vincent Chen <deanbo422@gmail.com>,
        Vineet Gupta <vgupta@synopsys.com>,
        Will Deacon <will@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-alpha@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
        linux-ia64@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        "open list:SIFIVE DRIVERS" <linux-riscv@lists.infradead.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        arcml <linux-snps-arc@lists.infradead.org>,
        linux-um@lists.infradead.org,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        openrisc@lists.librecores.org,
        sparclinux <sparclinux@vger.kernel.org>,
        "moderated list:H8/300 ARCHITECTURE" 
        <uclinux-h8-devel@lists.sourceforge.jp>, X86 ML <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, May 12, 2021 at 5:00 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> arch/$(SRCARCH)/Kbuild is useful for Makefile cleanups because you can
> use the obj-y syntax.
>
> Add an empty file if it is missing in arch/$(SRCARCH)/.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---


Applied to linux-kbuild.

>
>  Makefile               | 2 +-
>  arch/alpha/Kbuild      | 1 +
>  arch/arc/Makefile      | 3 ---
>  arch/arm/Makefile      | 1 -
>  arch/arm64/Makefile    | 1 -
>  arch/csky/Kbuild       | 1 +
>  arch/h8300/Kbuild      | 1 +
>  arch/hexagon/Kbuild    | 1 +
>  arch/ia64/Kbuild       | 1 +
>  arch/microblaze/Kbuild | 1 +
>  arch/mips/Makefile     | 3 ---
>  arch/nds32/Kbuild      | 1 +
>  arch/nios2/Kbuild      | 1 +
>  arch/openrisc/Makefile | 1 -
>  arch/parisc/Kbuild     | 1 +
>  arch/powerpc/Makefile  | 3 ---
>  arch/riscv/Makefile    | 1 -
>  arch/s390/Makefile     | 3 ---
>  arch/sh/Kbuild         | 1 +
>  arch/sparc/Makefile    | 3 ---
>  arch/um/Kbuild         | 1 +
>  arch/x86/Makefile      | 3 ---
>  arch/xtensa/Kbuild     | 1 +
>  23 files changed, 13 insertions(+), 23 deletions(-)
>  create mode 100644 arch/alpha/Kbuild
>  create mode 100644 arch/csky/Kbuild
>  create mode 100644 arch/h8300/Kbuild
>  create mode 100644 arch/hexagon/Kbuild
>  create mode 100644 arch/ia64/Kbuild
>  create mode 100644 arch/microblaze/Kbuild
>  create mode 100644 arch/nds32/Kbuild
>  create mode 100644 arch/nios2/Kbuild
>  create mode 100644 arch/parisc/Kbuild
>  create mode 100644 arch/sh/Kbuild
>  create mode 100644 arch/um/Kbuild
>  create mode 100644 arch/xtensa/Kbuild
>
> diff --git a/Makefile b/Makefile
> index 15b6476d0f89..7df040b1b023 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -658,7 +658,7 @@ endif
>
>  ifeq ($(KBUILD_EXTMOD),)
>  # Objects we will link into vmlinux / subdirs we need to visit
> -core-y         := init/ usr/
> +core-y         := init/ usr/ arch/$(SRCARCH)/
>  drivers-y      := drivers/ sound/
>  drivers-$(CONFIG_SAMPLES) += samples/
>  drivers-$(CONFIG_NET) += net/
> diff --git a/arch/alpha/Kbuild b/arch/alpha/Kbuild
> new file mode 100644
> index 000000000000..a4e40e534e6a
> --- /dev/null
> +++ b/arch/alpha/Kbuild
> @@ -0,0 +1 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> diff --git a/arch/arc/Makefile b/arch/arc/Makefile
> index 4392c9c189c4..3e6d4b84797f 100644
> --- a/arch/arc/Makefile
> +++ b/arch/arc/Makefile
> @@ -85,9 +85,6 @@ KBUILD_LDFLAGS        += $(ldflags-y)
>
>  head-y         := arch/arc/kernel/head.o
>
> -# See arch/arc/Kbuild for content of core part of the kernel
> -core-y         += arch/arc/
> -
>  # w/o this dtb won't embed into kernel binary
>  core-y         += arch/arc/boot/dts/
>
> diff --git a/arch/arm/Makefile b/arch/arm/Makefile
> index 415c3514573a..173da685a52e 100644
> --- a/arch/arm/Makefile
> +++ b/arch/arm/Makefile
> @@ -252,7 +252,6 @@ endif
>
>  export TEXT_OFFSET GZFLAGS MMUEXT
>
> -core-y                         += arch/arm/
>  # If we have a machine-specific directory, then include it in the build.
>  core-y                         += $(machdirs) $(platdirs)
>
> diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
> index 7ef44478560d..b73c151f3a53 100644
> --- a/arch/arm64/Makefile
> +++ b/arch/arm64/Makefile
> @@ -149,7 +149,6 @@ KBUILD_CFLAGS += -DKASAN_SHADOW_SCALE_SHIFT=$(KASAN_SHADOW_SCALE_SHIFT)
>  KBUILD_CPPFLAGS += -DKASAN_SHADOW_SCALE_SHIFT=$(KASAN_SHADOW_SCALE_SHIFT)
>  KBUILD_AFLAGS += -DKASAN_SHADOW_SCALE_SHIFT=$(KASAN_SHADOW_SCALE_SHIFT)
>
> -core-y         += arch/arm64/
>  libs-y         := arch/arm64/lib/ $(libs-y)
>  libs-$(CONFIG_EFI_STUB) += $(objtree)/drivers/firmware/efi/libstub/lib.a
>
> diff --git a/arch/csky/Kbuild b/arch/csky/Kbuild
> new file mode 100644
> index 000000000000..a4e40e534e6a
> --- /dev/null
> +++ b/arch/csky/Kbuild
> @@ -0,0 +1 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> diff --git a/arch/h8300/Kbuild b/arch/h8300/Kbuild
> new file mode 100644
> index 000000000000..a4e40e534e6a
> --- /dev/null
> +++ b/arch/h8300/Kbuild
> @@ -0,0 +1 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> diff --git a/arch/hexagon/Kbuild b/arch/hexagon/Kbuild
> new file mode 100644
> index 000000000000..a4e40e534e6a
> --- /dev/null
> +++ b/arch/hexagon/Kbuild
> @@ -0,0 +1 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> diff --git a/arch/ia64/Kbuild b/arch/ia64/Kbuild
> new file mode 100644
> index 000000000000..a4e40e534e6a
> --- /dev/null
> +++ b/arch/ia64/Kbuild
> @@ -0,0 +1 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> diff --git a/arch/microblaze/Kbuild b/arch/microblaze/Kbuild
> new file mode 100644
> index 000000000000..a4e40e534e6a
> --- /dev/null
> +++ b/arch/microblaze/Kbuild
> @@ -0,0 +1 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> diff --git a/arch/mips/Makefile b/arch/mips/Makefile
> index 258234c35a09..4e942b7ef022 100644
> --- a/arch/mips/Makefile
> +++ b/arch/mips/Makefile
> @@ -332,9 +332,6 @@ head-y := arch/mips/kernel/head.o
>  libs-y                 += arch/mips/lib/
>  libs-$(CONFIG_MIPS_FP_SUPPORT) += arch/mips/math-emu/
>
> -# See arch/mips/Kbuild for content of core part of the kernel
> -core-y += arch/mips/
> -
>  drivers-y                      += arch/mips/crypto/
>
>  # suspend and hibernation support
> diff --git a/arch/nds32/Kbuild b/arch/nds32/Kbuild
> new file mode 100644
> index 000000000000..a4e40e534e6a
> --- /dev/null
> +++ b/arch/nds32/Kbuild
> @@ -0,0 +1 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> diff --git a/arch/nios2/Kbuild b/arch/nios2/Kbuild
> new file mode 100644
> index 000000000000..a4e40e534e6a
> --- /dev/null
> +++ b/arch/nios2/Kbuild
> @@ -0,0 +1 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> diff --git a/arch/openrisc/Makefile b/arch/openrisc/Makefile
> index 410e7abfac69..c52de526e518 100644
> --- a/arch/openrisc/Makefile
> +++ b/arch/openrisc/Makefile
> @@ -42,7 +42,6 @@ endif
>
>  head-y                 := arch/openrisc/kernel/head.o
>
> -core-y         += arch/openrisc/
>  libs-y         += $(LIBGCC)
>
>  PHONY += vmlinux.bin
> diff --git a/arch/parisc/Kbuild b/arch/parisc/Kbuild
> new file mode 100644
> index 000000000000..a4e40e534e6a
> --- /dev/null
> +++ b/arch/parisc/Kbuild
> @@ -0,0 +1 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index 3212d076ac6a..af669aa75b73 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -267,9 +267,6 @@ head-$(CONFIG_PPC_FPU)              += arch/powerpc/kernel/fpu.o
>  head-$(CONFIG_ALTIVEC)         += arch/powerpc/kernel/vector.o
>  head-$(CONFIG_PPC_OF_BOOT_TRAMPOLINE)  += arch/powerpc/kernel/prom_init.o
>
> -# See arch/powerpc/Kbuild for content of core part of the kernel
> -core-y += arch/powerpc/
> -
>  # Default to zImage, override when needed
>  all: zImage
>
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 3eb9590a0775..c5f359540862 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -90,7 +90,6 @@ endif
>
>  head-y := arch/riscv/kernel/head.o
>
> -core-y += arch/riscv/
>  core-$(CONFIG_RISCV_ERRATA_ALTERNATIVE) += arch/riscv/errata/
>
>  libs-y += arch/riscv/lib/
> diff --git a/arch/s390/Makefile b/arch/s390/Makefile
> index e443ed9947bd..37b61645694c 100644
> --- a/arch/s390/Makefile
> +++ b/arch/s390/Makefile
> @@ -128,9 +128,6 @@ OBJCOPYFLAGS        := -O binary
>
>  head-y         := arch/s390/kernel/head64.o
>
> -# See arch/s390/Kbuild for content of core part of the kernel
> -core-y         += arch/s390/
> -
>  libs-y         += arch/s390/lib/
>  drivers-y      += drivers/s390/
>
> diff --git a/arch/sh/Kbuild b/arch/sh/Kbuild
> new file mode 100644
> index 000000000000..a4e40e534e6a
> --- /dev/null
> +++ b/arch/sh/Kbuild
> @@ -0,0 +1 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> diff --git a/arch/sparc/Makefile b/arch/sparc/Makefile
> index bee99e65fe23..4e65245bc755 100644
> --- a/arch/sparc/Makefile
> +++ b/arch/sparc/Makefile
> @@ -58,9 +58,6 @@ endif
>
>  head-y                 := arch/sparc/kernel/head_$(BITS).o
>
> -# See arch/sparc/Kbuild for the core part of the kernel
> -core-y                 += arch/sparc/
> -
>  libs-y                 += arch/sparc/prom/
>  libs-y                 += arch/sparc/lib/
>
> diff --git a/arch/um/Kbuild b/arch/um/Kbuild
> new file mode 100644
> index 000000000000..a4e40e534e6a
> --- /dev/null
> +++ b/arch/um/Kbuild
> @@ -0,0 +1 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> index c77c5d8a7b3e..4307bf48ec53 100644
> --- a/arch/x86/Makefile
> +++ b/arch/x86/Makefile
> @@ -239,9 +239,6 @@ head-y += arch/x86/kernel/platform-quirks.o
>
>  libs-y  += arch/x86/lib/
>
> -# See arch/x86/Kbuild for content of core part of the kernel
> -core-y += arch/x86/
> -
>  # drivers-y are linked after core-y
>  drivers-$(CONFIG_MATH_EMULATION) += arch/x86/math-emu/
>  drivers-$(CONFIG_PCI)            += arch/x86/pci/
> diff --git a/arch/xtensa/Kbuild b/arch/xtensa/Kbuild
> new file mode 100644
> index 000000000000..a4e40e534e6a
> --- /dev/null
> +++ b/arch/xtensa/Kbuild
> @@ -0,0 +1 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> --
> 2.27.0
>


-- 
Best Regards
Masahiro Yamada
