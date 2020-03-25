Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F385191ED0
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2020 03:04:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727249AbgCYCEW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 24 Mar 2020 22:04:22 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:39323 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727228AbgCYCEW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 24 Mar 2020 22:04:22 -0400
Received: by mail-il1-f193.google.com with SMTP id r5so462660ilq.6;
        Tue, 24 Mar 2020 19:04:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vnKvVj2Ng4BgbSzzE1QqTi7VFIQ6ah/PCDpZ6rL7Rsk=;
        b=b6xc5bmVhRX1tbUgSwMpznNKCviRBiPwS3Rw2SAdyarAX8FI0mWeXqoZcS4NTb3wjQ
         3kJkv21RKo19tnqPhcKdsWPJtQ3fL3F3lYH7KS4SAa3mAA4yg/Un5ad6dcbSWDzIPgxG
         4apFic+imrB4X7CmJGfOq2EAa1omUmJvHDLK7CZQS1PEESQMzYMUkX/zTqcROmPJ7cMk
         VfVtSyakXMSlI1QMf0sb/DBokQ0s429b0pR6RLgRvW5eYfUSuLkSEMV157JQhyBbF269
         ofM77R0QwKJdHaHvjV1Q36XZOa5lh8yD/OrzFclwpg7OQO3Yzpx8IYfkiT5mFv181Pa6
         RjEw==
X-Gm-Message-State: ANhLgQ1j6AqbRmdF6V5VMZ5+3JKuRowVWY1l2PXUc8PyyLZyJtscGZT/
        x5I03nmBPtKhIV9f74dTiUGGy9+S/WbN7qtkpaI=
X-Google-Smtp-Source: ADFU+vsGQrlnzoK70Gr21b2lt5autKGXUDQUcM9lLu2lULH6+4iuicsZW/s1uBBU6j55yRxPj1ehXSPCXL6F1QVFNyk=
X-Received: by 2002:a92:48d6:: with SMTP id j83mr1343042ilg.287.1585101860912;
 Tue, 24 Mar 2020 19:04:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200324153624.23109-1-jiaxun.yang@flygoat.com> <20200324153624.23109-10-jiaxun.yang@flygoat.com>
In-Reply-To: <20200324153624.23109-10-jiaxun.yang@flygoat.com>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Wed, 25 Mar 2020 10:11:05 +0800
Message-ID: <CAAhV-H57na90xg0+cXeGC_rih9wiZBEZcVm+3AnY90To19wqbw@mail.gmail.com>
Subject: Re: [PATCH v6 09/11] MIPS: Loongson64: Add generic dts
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Jiaxun,

On Tue, Mar 24, 2020 at 11:40 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
> Add generic device dts for Loongson-3 devices.
> They are currently almost identical but will be different later.
> Some PCH devices like PCI Host Bridge is still enabled by platform
> code for now.
>
> Co-developed-by: Huacai Chen <chenhc@lemote.com>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/mips/Kconfig                             |  6 +-
>  arch/mips/boot/dts/Makefile                   |  1 +
>  arch/mips/boot/dts/loongson/Makefile          |  4 ++
>  .../boot/dts/loongson/loongson3-package.dtsi  | 62 +++++++++++++++++++
>  .../dts/loongson/loongson3_4core_rs780e.dts   | 25 ++++++++
>  .../dts/loongson/loongson3_8core_rs780e.dts   | 25 ++++++++
>  arch/mips/boot/dts/loongson/rs780e-pch.dtsi   | 26 ++++++++
>  7 files changed, 147 insertions(+), 2 deletions(-)
>  create mode 100644 arch/mips/boot/dts/loongson/Makefile
>  create mode 100644 arch/mips/boot/dts/loongson/loongson3-package.dtsi
>  create mode 100644 arch/mips/boot/dts/loongson/loongson3_4core_rs780e.dts
>  create mode 100644 arch/mips/boot/dts/loongson/loongson3_8core_rs780e.dts
>  create mode 100644 arch/mips/boot/dts/loongson/rs780e-pch.dtsi
>
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index ca3045b2a2d9..4a0b2f494d79 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -486,9 +486,11 @@ config MACH_LOONGSON64
>         select SYS_SUPPORTS_HIGHMEM
>         select SYS_SUPPORTS_LITTLE_ENDIAN
>         select SYS_SUPPORTS_ZBOOT
> -       select LOONGSON_MC146818
>         select ZONE_DMA32
>         select NUMA
> +       select COMMON_CLK
> +       select USE_OF
> +       select BUILTIN_DTB
>         help
>           This enables the support of Loongson-2/3 family of machines.
>
> @@ -3081,7 +3083,7 @@ endchoice
>  choice
>         prompt "Kernel command line type" if !CMDLINE_OVERRIDE
>         default MIPS_CMDLINE_FROM_DTB if USE_OF && !ATH79 && !MACH_INGENIC && \
> -                                        !MIPS_MALTA && \
> +                                        !MACH_LOONGSON64 && !MIPS_MALTA && \
>                                          !CAVIUM_OCTEON_SOC
>         default MIPS_CMDLINE_FROM_BOOTLOADER
>
> diff --git a/arch/mips/boot/dts/Makefile b/arch/mips/boot/dts/Makefile
> index 1e79cab8e269..d429a69bfe30 100644
> --- a/arch/mips/boot/dts/Makefile
> +++ b/arch/mips/boot/dts/Makefile
> @@ -4,6 +4,7 @@ subdir-y        += cavium-octeon
>  subdir-y       += img
>  subdir-y       += ingenic
>  subdir-y       += lantiq
> +subdir-y       += loongson
>  subdir-y       += mscc
>  subdir-y       += mti
>  subdir-y       += netlogic
> diff --git a/arch/mips/boot/dts/loongson/Makefile b/arch/mips/boot/dts/loongson/Makefile
> new file mode 100644
> index 000000000000..56d379471262
> --- /dev/null
> +++ b/arch/mips/boot/dts/loongson/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX_License_Identifier: GPL_2.0
> +dtb-$(CONFIG_MACH_LOONGSON64)  += loongson3_4core_rs780e.dtb loongson3_8core_rs780e.dtb
> +
> +obj-$(CONFIG_BUILTIN_DTB)      += $(addsuffix .o, $(dtb-y))
> diff --git a/arch/mips/boot/dts/loongson/loongson3-package.dtsi b/arch/mips/boot/dts/loongson/loongson3-package.dtsi
> new file mode 100644
> index 000000000000..d09c313603f1
> --- /dev/null
> +++ b/arch/mips/boot/dts/loongson/loongson3-package.dtsi
> @@ -0,0 +1,62 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/ {
> +       #address-cells = <2>;
> +       #size-cells = <2>;
> +
I still add something like this here:

                cpu@0 {
                        compatible = "loongson,loongson3";
                        device_type = "cpu";
                        reg = <0x0>;
                        next-level-cache = <&scache0>;
                };

Because it at least solve the problem of cache hierarchy, which cause
"lscpu" crash.

> +       cpuintc: interrupt-controller {
> +               #address-cells = <0>;
> +               #interrupt-cells = <1>;
> +               interrupt-controller;
> +               compatible = "mti,cpu-interrupt-controller";
> +       };
> +
> +       package0: bus@1fe00000 {
> +               compatible = "simple-bus";
> +               #address-cells = <2>;
> +               #size-cells = <1>;
> +               ranges = <0 0x1fe00000 0 0x1fe00000 0x100000
> +                       0 0x3ff00000 0 0x3ff00000 0x100000
> +                       0xefd 0xfb000000 0xefd 0xfb000000 0x10000000 /* 3A HT Config Space */
> +                       0x1efd 0xfb000000 0x1efd 0xfb000000 0x10000000 /* 3B HT Config Space */>;
> +
> +               liointc: interrupt-controller@3ff01400 {
> +                       compatible = "loongson,liointc-1.0";
> +                       reg = <0 0x3ff01400 0x64>;
> +
> +                       interrupt-controller;
> +                       #interrupt-cells = <2>;
> +
> +                       interrupt-parent = <&cpuintc>;
> +                       interrupts = <2>, <3>;
> +                       interrupt-names = "int0", "int1";
> +
> +                       loongson,parent_int_map = <0xf0ffffff>, /* int0 */
> +                                               <0x0f000000>, /* int1 */
> +                                               <0x00000000>, /* int2 */
> +                                               <0x00000000>; /* int3 */
> +
> +               };
> +
> +               cpu_uart0: serial@1fe001e0 {
> +                       compatible = "ns16550a";
> +                       reg = <0 0x1fe001e0 0x8>;
> +                       clock-frequency = <33000000>;
> +                       interrupt-parent = <&liointc>;
> +                       interrupts = <10 IRQ_TYPE_LEVEL_HIGH>;
> +                       no-loopback-test;
> +               };
> +
> +               cpu_uart1: serial@1fe001e8 {
> +                       status = "disabled";
Why disable UART1 by default, is it cause problems?

> +                       compatible = "ns16550a";
> +                       reg = <0 0x1fe001e8 0x8>;
> +                       clock-frequency = <33000000>;
> +                       interrupts = <10 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-parent = <&liointc>;
> +                       no-loopback-test;
> +               };
> +       };
> +};
> diff --git a/arch/mips/boot/dts/loongson/loongson3_4core_rs780e.dts b/arch/mips/boot/dts/loongson/loongson3_4core_rs780e.dts
> new file mode 100644
> index 000000000000..6b5694ca0f95
> --- /dev/null
> +++ b/arch/mips/boot/dts/loongson/loongson3_4core_rs780e.dts
> @@ -0,0 +1,25 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/dts-v1/;
> +
> +#include "loongson3-package.dtsi"
> +#include "rs780e-pch.dtsi"
> +
> +/ {
> +       compatible = "loongson,loongson3-4core-rs780e";
> +};
> +
> +&package0 {
> +       htpic: interrupt-controller@efdfb000080 {
> +               compatible = "loongson,htpic-1.0";
> +               reg = <0xefd 0xfb000080 0x40>;
> +               interrupt-controller;
> +               #interrupt-cells = <1>;
> +
> +               interrupt-parent = <&liointc>;
> +               interrupts = <24 IRQ_TYPE_LEVEL_HIGH>,
> +                               <25 IRQ_TYPE_LEVEL_HIGH>,
> +                               <26 IRQ_TYPE_LEVEL_HIGH>,
> +                               <27 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +};
> diff --git a/arch/mips/boot/dts/loongson/loongson3_8core_rs780e.dts b/arch/mips/boot/dts/loongson/loongson3_8core_rs780e.dts
> new file mode 100644
> index 000000000000..ffefa2f829b0
> --- /dev/null
> +++ b/arch/mips/boot/dts/loongson/loongson3_8core_rs780e.dts
> @@ -0,0 +1,25 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/dts-v1/;
> +
> +#include "loongson3-package.dtsi"
> +#include "rs780e-pch.dtsi"
> +
> +/ {
> +       compatible = "loongson,loongson3-8core-rs780e";
> +};
> +
> +&package0 {
> +       htpic: interrupt-controller@1efdfb000080 {
> +               compatible = "loongson,htpic-1.0";
> +               reg = <0x1efd 0xfb000080 0x40>;
> +               interrupt-controller;
> +               #interrupt-cells = <1>;
> +
> +               interrupt-parent = <&liointc>;
> +               interrupts = <24 IRQ_TYPE_LEVEL_HIGH>,
> +                               <25 IRQ_TYPE_LEVEL_HIGH>,
> +                               <26 IRQ_TYPE_LEVEL_HIGH>,
> +                               <27 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +};
> diff --git a/arch/mips/boot/dts/loongson/rs780e-pch.dtsi b/arch/mips/boot/dts/loongson/rs780e-pch.dtsi
> new file mode 100644
> index 000000000000..45c54d555fa4
> --- /dev/null
> +++ b/arch/mips/boot/dts/loongson/rs780e-pch.dtsi
> @@ -0,0 +1,26 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/ {
> +       bus@10000000 {
> +               compatible = "simple-bus";
> +               #address-cells = <2>;
> +               #size-cells = <2>;
> +               ranges = <0 0x10000000 0 0x10000000 0 0x10000000
> +                               0 0x40000000 0 0x40000000 0 0x40000000
> +                               0xfd 0xfe000000 0xfd 0xfe000000  0 0x2000000 /* PCI Config Space */>;
> +
> +               isa {
> +                       compatible = "isa";
> +                       #address-cells = <2>;
> +                       #size-cells = <1>;
> +                       ranges = <1 0 0 0 0x1000>;
> +
> +                       rtc0: rtc@70 {
> +                               compatible = "motorola,mc146818";
> +                               reg = <1 0x70 0x8>;
> +                               interrupts = <8>;
> +                               interrupt-parent = <&htpic>;
> +                       };
> +               };
> +       };
> +};
> --
> 2.26.0.rc2
>
>

Regards,
Huacai
