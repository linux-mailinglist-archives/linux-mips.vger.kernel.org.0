Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51B60191F59
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2020 03:42:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727259AbgCYCmW convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Tue, 24 Mar 2020 22:42:22 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:42574 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727249AbgCYCmW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 24 Mar 2020 22:42:22 -0400
Received: by mail-il1-f195.google.com with SMTP id f16so506899ilj.9;
        Tue, 24 Mar 2020 19:42:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=l/cAZRgqz3ZcWFg8QgUT6KnUVYwAN99fj/1pfAMCGCg=;
        b=F4Jy6y3x6UfXAY5Wkne09DQ1TG8fMrO4+Hgo0BpIO4seBtIfEAj2iOKU3EctLVaL6c
         xJJu+IqoUg5X4x5Nu06S3gPJ3GboirN5qXggnoE3iGCVDc24FhcPDMHgnHXfi5T7ndxp
         jITEIYsXIxw6Q0tXnlX1OtmuloQkOh/NZqsE8dDcLoSxtDbIM12dC8AjH+1INSXLVYe9
         bt3TLnAvTKSEy8qugEaqTphNM0HDOE1ruIi33DqVPypVsvuGcezY2i2wfsG8Sl1+VuWG
         rxPPZfscKc1pJJSLEG9IvGx2kv9QazE7Do0zktM31t4wNHjfUybKyf9ylgZ6j02tByBf
         sMlQ==
X-Gm-Message-State: ANhLgQ10tD7O0svy5fTLzSQZXzQD6HefH2T1cAPSKTE5xp4jibCO4xSy
        +uhVglK3Jxk4KhWR09VYnb5fSiIwu590HiHz6uI=
X-Google-Smtp-Source: ADFU+vtwtiKCArP8bymyiisCae+Kjre+mE6fzgDq2W94kWA2k+qHRBQ/o96TTccslMQvLEZYZ07tts37DXp00W+JjNA=
X-Received: by 2002:a92:8f53:: with SMTP id j80mr1461801ild.171.1585104139035;
 Tue, 24 Mar 2020 19:42:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200324153624.23109-1-jiaxun.yang@flygoat.com>
 <20200324153624.23109-10-jiaxun.yang@flygoat.com> <CAAhV-H57na90xg0+cXeGC_rih9wiZBEZcVm+3AnY90To19wqbw@mail.gmail.com>
 <5234EAAC-126F-402B-84A8-494C1AF5A912@flygoat.com>
In-Reply-To: <5234EAAC-126F-402B-84A8-494C1AF5A912@flygoat.com>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Wed, 25 Mar 2020 10:49:03 +0800
Message-ID: <CAAhV-H5YO-C3Qr+Xnz3fhoUTcZahp0+M7SZfPrKaPSoeLEwz5g@mail.gmail.com>
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
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Jiaxun,

On Wed, Mar 25, 2020 at 10:09 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
>
>
> 于 2020年3月25日 GMT+08:00 上午10:11:05, Huacai Chen <chenhc@lemote.com> 写到:
> >Hi, Jiaxun,
> >
> >On Tue, Mar 24, 2020 at 11:40 PM Jiaxun Yang <jiaxun.yang@flygoat.com>
> >wrote:
> >>
> >> Add generic device dts for Loongson-3 devices.
> >> They are currently almost identical but will be different later.
> >> Some PCH devices like PCI Host Bridge is still enabled by platform
> >> code for now.
> >>
> >> Co-developed-by: Huacai Chen <chenhc@lemote.com>
> >> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> >> ---
> >>  arch/mips/Kconfig                             |  6 +-
> >>  arch/mips/boot/dts/Makefile                   |  1 +
> >>  arch/mips/boot/dts/loongson/Makefile          |  4 ++
> >>  .../boot/dts/loongson/loongson3-package.dtsi  | 62
> >+++++++++++++++++++
> >>  .../dts/loongson/loongson3_4core_rs780e.dts   | 25 ++++++++
> >>  .../dts/loongson/loongson3_8core_rs780e.dts   | 25 ++++++++
> >>  arch/mips/boot/dts/loongson/rs780e-pch.dtsi   | 26 ++++++++
> >>  7 files changed, 147 insertions(+), 2 deletions(-)
> >>  create mode 100644 arch/mips/boot/dts/loongson/Makefile
> >>  create mode 100644
> >arch/mips/boot/dts/loongson/loongson3-package.dtsi
> >>  create mode 100644
> >arch/mips/boot/dts/loongson/loongson3_4core_rs780e.dts
> >>  create mode 100644
> >arch/mips/boot/dts/loongson/loongson3_8core_rs780e.dts
> >>  create mode 100644 arch/mips/boot/dts/loongson/rs780e-pch.dtsi
> >>
> >> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> >> index ca3045b2a2d9..4a0b2f494d79 100644
> >> --- a/arch/mips/Kconfig
> >> +++ b/arch/mips/Kconfig
> >> @@ -486,9 +486,11 @@ config MACH_LOONGSON64
> >>         select SYS_SUPPORTS_HIGHMEM
> >>         select SYS_SUPPORTS_LITTLE_ENDIAN
> >>         select SYS_SUPPORTS_ZBOOT
> >> -       select LOONGSON_MC146818
> >>         select ZONE_DMA32
> >>         select NUMA
> >> +       select COMMON_CLK
> >> +       select USE_OF
> >> +       select BUILTIN_DTB
> >>         help
> >>           This enables the support of Loongson-2/3 family of
> >machines.
> >>
> >> @@ -3081,7 +3083,7 @@ endchoice
> >>  choice
> >>         prompt "Kernel command line type" if !CMDLINE_OVERRIDE
> >>         default MIPS_CMDLINE_FROM_DTB if USE_OF && !ATH79 &&
> >!MACH_INGENIC && \
> >> -                                        !MIPS_MALTA && \
> >> +                                        !MACH_LOONGSON64 &&
> >!MIPS_MALTA && \
> >>                                          !CAVIUM_OCTEON_SOC
> >>         default MIPS_CMDLINE_FROM_BOOTLOADER
> >>
> >> diff --git a/arch/mips/boot/dts/Makefile
> >b/arch/mips/boot/dts/Makefile
> >> index 1e79cab8e269..d429a69bfe30 100644
> >> --- a/arch/mips/boot/dts/Makefile
> >> +++ b/arch/mips/boot/dts/Makefile
> >> @@ -4,6 +4,7 @@ subdir-y        += cavium-octeon
> >>  subdir-y       += img
> >>  subdir-y       += ingenic
> >>  subdir-y       += lantiq
> >> +subdir-y       += loongson
> >>  subdir-y       += mscc
> >>  subdir-y       += mti
> >>  subdir-y       += netlogic
> >> diff --git a/arch/mips/boot/dts/loongson/Makefile
> >b/arch/mips/boot/dts/loongson/Makefile
> >> new file mode 100644
> >> index 000000000000..56d379471262
> >> --- /dev/null
> >> +++ b/arch/mips/boot/dts/loongson/Makefile
> >> @@ -0,0 +1,4 @@
> >> +# SPDX_License_Identifier: GPL_2.0
> >> +dtb-$(CONFIG_MACH_LOONGSON64)  += loongson3_4core_rs780e.dtb
> >loongson3_8core_rs780e.dtb
> >> +
> >> +obj-$(CONFIG_BUILTIN_DTB)      += $(addsuffix .o, $(dtb-y))
> >> diff --git a/arch/mips/boot/dts/loongson/loongson3-package.dtsi
> >b/arch/mips/boot/dts/loongson/loongson3-package.dtsi
> >> new file mode 100644
> >> index 000000000000..d09c313603f1
> >> --- /dev/null
> >> +++ b/arch/mips/boot/dts/loongson/loongson3-package.dtsi
> >> @@ -0,0 +1,62 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +
> >> +#include <dt-bindings/interrupt-controller/irq.h>
> >> +
> >> +/ {
> >> +       #address-cells = <2>;
> >> +       #size-cells = <2>;
> >> +
> >I still add something like this here:
> >
> >                cpu@0 {
> >                        compatible = "loongson,loongson3";
> >                        device_type = "cpu";
> >                        reg = <0x0>;
> >                        next-level-cache = <&scache0>;
> >                };
> >
> >Because it at least solve the problem of cache hierarchy, which cause
> >"lscpu" crash.
>
> That's another problem.
> Previous discussion with rob and Paul all suggested that we shouldn't add cpu node.
> At least for now.
>
Maybe Rob and Paul had never care about the cache hierarchy problem?
And I think the generic .dts files should not be modified from time to
time.

> >
> >> +       cpuintc: interrupt-controller {
> >> +               #address-cells = <0>;
> >> +               #interrupt-cells = <1>;
> >> +               interrupt-controller;
> >> +               compatible = "mti,cpu-interrupt-controller";
> >> +       };
> >> +
> >> +       package0: bus@1fe00000 {
> >> +               compatible = "simple-bus";
> >> +               #address-cells = <2>;
> >> +               #size-cells = <1>;
> >> +               ranges = <0 0x1fe00000 0 0x1fe00000 0x100000
> >> +                       0 0x3ff00000 0 0x3ff00000 0x100000
> >> +                       0xefd 0xfb000000 0xefd 0xfb000000 0x10000000
> >/* 3A HT Config Space */
> >> +                       0x1efd 0xfb000000 0x1efd 0xfb000000
> >0x10000000 /* 3B HT Config Space */>;
> >> +
> >> +               liointc: interrupt-controller@3ff01400 {
> >> +                       compatible = "loongson,liointc-1.0";
> >> +                       reg = <0 0x3ff01400 0x64>;
> >> +
> >> +                       interrupt-controller;
> >> +                       #interrupt-cells = <2>;
> >> +
> >> +                       interrupt-parent = <&cpuintc>;
> >> +                       interrupts = <2>, <3>;
> >> +                       interrupt-names = "int0", "int1";
> >> +
> >> +                       loongson,parent_int_map = <0xf0ffffff>, /*
> >int0 */
> >> +                                               <0x0f000000>, /* int1
> >*/
> >> +                                               <0x00000000>, /* int2
> >*/
> >> +                                               <0x00000000>; /* int3
> >*/
> >> +
> >> +               };
> >> +
> >> +               cpu_uart0: serial@1fe001e0 {
> >> +                       compatible = "ns16550a";
> >> +                       reg = <0 0x1fe001e0 0x8>;
> >> +                       clock-frequency = <33000000>;
> >> +                       interrupt-parent = <&liointc>;
> >> +                       interrupts = <10 IRQ_TYPE_LEVEL_HIGH>;
> >> +                       no-loopback-test;
> >> +               };
> >> +
> >> +               cpu_uart1: serial@1fe001e8 {
> >> +                       status = "disabled";
> >Why disable UART1 by default, is it cause problems?
>
> Yes. It would cause endless suprious interrupt.
> And most machine didn't exposed that port.
> So I'd prefer disable it.
I think the default .dts file should enable devices as many as
possible, and suprious interrupts have not cause serious problems.

>
> >
> >> +                       compatible = "ns16550a";
> >> +                       reg = <0 0x1fe001e8 0x8>;
> >> +                       clock-frequency = <33000000>;
> >> +                       interrupts = <10 IRQ_TYPE_LEVEL_HIGH>;
> >> +                       interrupt-parent = <&liointc>;
> >> +                       no-loopback-test;
> >> +               };
> >> +       };
> >> +};
> >> diff --git a/arch/mips/boot/dts/loongson/loongson3_4core_rs780e.dts
> >b/arch/mips/boot/dts/loongson/loongson3_4core_rs780e.dts
> >> new file mode 100644
> >> index 000000000000..6b5694ca0f95
> >> --- /dev/null
> >> +++ b/arch/mips/boot/dts/loongson/loongson3_4core_rs780e.dts
> >> @@ -0,0 +1,25 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +
> >> +/dts-v1/;
> >> +
> >> +#include "loongson3-package.dtsi"
> >> +#include "rs780e-pch.dtsi"
> >> +
> >> +/ {
> >> +       compatible = "loongson,loongson3-4core-rs780e";
> >> +};
> >> +
> >> +&package0 {
> >> +       htpic: interrupt-controller@efdfb000080 {
> >> +               compatible = "loongson,htpic-1.0";
> >> +               reg = <0xefd 0xfb000080 0x40>;
> >> +               interrupt-controller;
> >> +               #interrupt-cells = <1>;
> >> +
> >> +               interrupt-parent = <&liointc>;
> >> +               interrupts = <24 IRQ_TYPE_LEVEL_HIGH>,
> >> +                               <25 IRQ_TYPE_LEVEL_HIGH>,
> >> +                               <26 IRQ_TYPE_LEVEL_HIGH>,
> >> +                               <27 IRQ_TYPE_LEVEL_HIGH>;
> >> +       };
> >> +};
> >> diff --git a/arch/mips/boot/dts/loongson/loongson3_8core_rs780e.dts
> >b/arch/mips/boot/dts/loongson/loongson3_8core_rs780e.dts
> >> new file mode 100644
> >> index 000000000000..ffefa2f829b0
> >> --- /dev/null
> >> +++ b/arch/mips/boot/dts/loongson/loongson3_8core_rs780e.dts
> >> @@ -0,0 +1,25 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +
> >> +/dts-v1/;
> >> +
> >> +#include "loongson3-package.dtsi"
> >> +#include "rs780e-pch.dtsi"
> >> +
> >> +/ {
> >> +       compatible = "loongson,loongson3-8core-rs780e";
> >> +};
> >> +
> >> +&package0 {
> >> +       htpic: interrupt-controller@1efdfb000080 {
> >> +               compatible = "loongson,htpic-1.0";
> >> +               reg = <0x1efd 0xfb000080 0x40>;
> >> +               interrupt-controller;
> >> +               #interrupt-cells = <1>;
> >> +
> >> +               interrupt-parent = <&liointc>;
> >> +               interrupts = <24 IRQ_TYPE_LEVEL_HIGH>,
> >> +                               <25 IRQ_TYPE_LEVEL_HIGH>,
> >> +                               <26 IRQ_TYPE_LEVEL_HIGH>,
> >> +                               <27 IRQ_TYPE_LEVEL_HIGH>;
> >> +       };
> >> +};
> >> diff --git a/arch/mips/boot/dts/loongson/rs780e-pch.dtsi
> >b/arch/mips/boot/dts/loongson/rs780e-pch.dtsi
> >> new file mode 100644
> >> index 000000000000..45c54d555fa4
> >> --- /dev/null
> >> +++ b/arch/mips/boot/dts/loongson/rs780e-pch.dtsi
> >> @@ -0,0 +1,26 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +
> >> +/ {
> >> +       bus@10000000 {
> >> +               compatible = "simple-bus";
> >> +               #address-cells = <2>;
> >> +               #size-cells = <2>;
> >> +               ranges = <0 0x10000000 0 0x10000000 0 0x10000000
> >> +                               0 0x40000000 0 0x40000000 0
> >0x40000000
> >> +                               0xfd 0xfe000000 0xfd 0xfe000000  0
> >0x2000000 /* PCI Config Space */>;
> >> +
> >> +               isa {
> >> +                       compatible = "isa";
> >> +                       #address-cells = <2>;
> >> +                       #size-cells = <1>;
> >> +                       ranges = <1 0 0 0 0x1000>;
> >> +
> >> +                       rtc0: rtc@70 {
> >> +                               compatible = "motorola,mc146818";
> >> +                               reg = <1 0x70 0x8>;
> >> +                               interrupts = <8>;
> >> +                               interrupt-parent = <&htpic>;
> >> +                       };
> >> +               };
> >> +       };
> >> +};
> >> --
> >> 2.26.0.rc2
> >>
> >>
> >
> >Regards,
> >Huacai
>
> --
> Jiaxun Yang

Regards,
Huacai
