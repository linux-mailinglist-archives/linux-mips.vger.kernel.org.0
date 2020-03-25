Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19AC3191ED5
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2020 03:09:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727230AbgCYCJo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 24 Mar 2020 22:09:44 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17815 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727212AbgCYCJo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 24 Mar 2020 22:09:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1585102110;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:To:CC:From:Message-ID;
        bh=SKr6ILJ7x7CdTNGu98Mhj3KZx5bIO0x3oUWoAsnJIbM=;
        b=e30yOhFMTAIB0cMIGU2OElCzuNfAUT2U5oUf8EPEb4gSmj62XAGDmmP2yEtLf5d4
        XySg1ebxbTKp6eJEndJWQ7qk9RkGRR7wwAROdN65WhTBlC8i8Y0ajS1eeWmrAlUOeu0
        FEnMmlyUjkWQtND2Y66eTgV+qCxSd9N/sq1bm+Cs=
Received: from [10.233.233.252] (183.157.60.227 [183.157.60.227]) by mx.zoho.com.cn
        with SMTPS id 1585102109206108.44346982451668; Wed, 25 Mar 2020 10:08:29 +0800 (CST)
Date:   Wed, 25 Mar 2020 10:08:25 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <CAAhV-H57na90xg0+cXeGC_rih9wiZBEZcVm+3AnY90To19wqbw@mail.gmail.com>
References: <20200324153624.23109-1-jiaxun.yang@flygoat.com> <20200324153624.23109-10-jiaxun.yang@flygoat.com> <CAAhV-H57na90xg0+cXeGC_rih9wiZBEZcVm+3AnY90To19wqbw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 09/11] MIPS: Loongson64: Add generic dts
To:     Huacai Chen <chenhc@lemote.com>
CC:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <5234EAAC-126F-402B-84A8-494C1AF5A912@flygoat.com>
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B43=E6=9C=8825=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=881=
0:11:05, Huacai Chen <chenhc@lemote=2Ecom> =E5=86=99=E5=88=B0:
>Hi, Jiaxun,
>
>On Tue, Mar 24, 2020 at 11:40 PM Jiaxun Yang <jiaxun=2Eyang@flygoat=2Ecom=
>
>wrote:
>>
>> Add generic device dts for Loongson-3 devices=2E
>> They are currently almost identical but will be different later=2E
>> Some PCH devices like PCI Host Bridge is still enabled by platform
>> code for now=2E
>>
>> Co-developed-by: Huacai Chen <chenhc@lemote=2Ecom>
>> Signed-off-by: Jiaxun Yang <jiaxun=2Eyang@flygoat=2Ecom>
>> ---
>>  arch/mips/Kconfig                             |  6 +-
>>  arch/mips/boot/dts/Makefile                   |  1 +
>>  arch/mips/boot/dts/loongson/Makefile          |  4 ++
>>  =2E=2E=2E/boot/dts/loongson/loongson3-package=2Edtsi  | 62
>+++++++++++++++++++
>>  =2E=2E=2E/dts/loongson/loongson3_4core_rs780e=2Edts   | 25 ++++++++
>>  =2E=2E=2E/dts/loongson/loongson3_8core_rs780e=2Edts   | 25 ++++++++
>>  arch/mips/boot/dts/loongson/rs780e-pch=2Edtsi   | 26 ++++++++
>>  7 files changed, 147 insertions(+), 2 deletions(-)
>>  create mode 100644 arch/mips/boot/dts/loongson/Makefile
>>  create mode 100644
>arch/mips/boot/dts/loongson/loongson3-package=2Edtsi
>>  create mode 100644
>arch/mips/boot/dts/loongson/loongson3_4core_rs780e=2Edts
>>  create mode 100644
>arch/mips/boot/dts/loongson/loongson3_8core_rs780e=2Edts
>>  create mode 100644 arch/mips/boot/dts/loongson/rs780e-pch=2Edtsi
>>
>> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
>> index ca3045b2a2d9=2E=2E4a0b2f494d79 100644
>> --- a/arch/mips/Kconfig
>> +++ b/arch/mips/Kconfig
>> @@ -486,9 +486,11 @@ config MACH_LOONGSON64
>>         select SYS_SUPPORTS_HIGHMEM
>>         select SYS_SUPPORTS_LITTLE_ENDIAN
>>         select SYS_SUPPORTS_ZBOOT
>> -       select LOONGSON_MC146818
>>         select ZONE_DMA32
>>         select NUMA
>> +       select COMMON_CLK
>> +       select USE_OF
>> +       select BUILTIN_DTB
>>         help
>>           This enables the support of Loongson-2/3 family of
>machines=2E
>>
>> @@ -3081,7 +3083,7 @@ endchoice
>>  choice
>>         prompt "Kernel command line type" if !CMDLINE_OVERRIDE
>>         default MIPS_CMDLINE_FROM_DTB if USE_OF && !ATH79 &&
>!MACH_INGENIC && \
>> -                                        !MIPS_MALTA && \
>> +                                        !MACH_LOONGSON64 &&
>!MIPS_MALTA && \
>>                                          !CAVIUM_OCTEON_SOC
>>         default MIPS_CMDLINE_FROM_BOOTLOADER
>>
>> diff --git a/arch/mips/boot/dts/Makefile
>b/arch/mips/boot/dts/Makefile
>> index 1e79cab8e269=2E=2Ed429a69bfe30 100644
>> --- a/arch/mips/boot/dts/Makefile
>> +++ b/arch/mips/boot/dts/Makefile
>> @@ -4,6 +4,7 @@ subdir-y        +=3D cavium-octeon
>>  subdir-y       +=3D img
>>  subdir-y       +=3D ingenic
>>  subdir-y       +=3D lantiq
>> +subdir-y       +=3D loongson
>>  subdir-y       +=3D mscc
>>  subdir-y       +=3D mti
>>  subdir-y       +=3D netlogic
>> diff --git a/arch/mips/boot/dts/loongson/Makefile
>b/arch/mips/boot/dts/loongson/Makefile
>> new file mode 100644
>> index 000000000000=2E=2E56d379471262
>> --- /dev/null
>> +++ b/arch/mips/boot/dts/loongson/Makefile
>> @@ -0,0 +1,4 @@
>> +# SPDX_License_Identifier: GPL_2=2E0
>> +dtb-$(CONFIG_MACH_LOONGSON64)  +=3D loongson3_4core_rs780e=2Edtb
>loongson3_8core_rs780e=2Edtb
>> +
>> +obj-$(CONFIG_BUILTIN_DTB)      +=3D $(addsuffix =2Eo, $(dtb-y))
>> diff --git a/arch/mips/boot/dts/loongson/loongson3-package=2Edtsi
>b/arch/mips/boot/dts/loongson/loongson3-package=2Edtsi
>> new file mode 100644
>> index 000000000000=2E=2Ed09c313603f1
>> --- /dev/null
>> +++ b/arch/mips/boot/dts/loongson/loongson3-package=2Edtsi
>> @@ -0,0 +1,62 @@
>> +// SPDX-License-Identifier: GPL-2=2E0
>> +
>> +#include <dt-bindings/interrupt-controller/irq=2Eh>
>> +
>> +/ {
>> +       #address-cells =3D <2>;
>> +       #size-cells =3D <2>;
>> +
>I still add something like this here:
>
>                cpu@0 {
>                        compatible =3D "loongson,loongson3";
>                        device_type =3D "cpu";
>                        reg =3D <0x0>;
>                        next-level-cache =3D <&scache0>;
>                };
>
>Because it at least solve the problem of cache hierarchy, which cause
>"lscpu" crash=2E

That's another problem=2E
Previous discussion with rob and Paul all suggested that we shouldn't add =
cpu node=2E
At least for now=2E

>
>> +       cpuintc: interrupt-controller {
>> +               #address-cells =3D <0>;
>> +               #interrupt-cells =3D <1>;
>> +               interrupt-controller;
>> +               compatible =3D "mti,cpu-interrupt-controller";
>> +       };
>> +
>> +       package0: bus@1fe00000 {
>> +               compatible =3D "simple-bus";
>> +               #address-cells =3D <2>;
>> +               #size-cells =3D <1>;
>> +               ranges =3D <0 0x1fe00000 0 0x1fe00000 0x100000
>> +                       0 0x3ff00000 0 0x3ff00000 0x100000
>> +                       0xefd 0xfb000000 0xefd 0xfb000000 0x10000000
>/* 3A HT Config Space */
>> +                       0x1efd 0xfb000000 0x1efd 0xfb000000
>0x10000000 /* 3B HT Config Space */>;
>> +
>> +               liointc: interrupt-controller@3ff01400 {
>> +                       compatible =3D "loongson,liointc-1=2E0";
>> +                       reg =3D <0 0x3ff01400 0x64>;
>> +
>> +                       interrupt-controller;
>> +                       #interrupt-cells =3D <2>;
>> +
>> +                       interrupt-parent =3D <&cpuintc>;
>> +                       interrupts =3D <2>, <3>;
>> +                       interrupt-names =3D "int0", "int1";
>> +
>> +                       loongson,parent_int_map =3D <0xf0ffffff>, /*
>int0 */
>> +                                               <0x0f000000>, /* int1
>*/
>> +                                               <0x00000000>, /* int2
>*/
>> +                                               <0x00000000>; /* int3
>*/
>> +
>> +               };
>> +
>> +               cpu_uart0: serial@1fe001e0 {
>> +                       compatible =3D "ns16550a";
>> +                       reg =3D <0 0x1fe001e0 0x8>;
>> +                       clock-frequency =3D <33000000>;
>> +                       interrupt-parent =3D <&liointc>;
>> +                       interrupts =3D <10 IRQ_TYPE_LEVEL_HIGH>;
>> +                       no-loopback-test;
>> +               };
>> +
>> +               cpu_uart1: serial@1fe001e8 {
>> +                       status =3D "disabled";
>Why disable UART1 by default, is it cause problems?

Yes=2E It would cause endless suprious interrupt=2E
And most machine didn't exposed that port=2E
So I'd prefer disable it=2E

>
>> +                       compatible =3D "ns16550a";
>> +                       reg =3D <0 0x1fe001e8 0x8>;
>> +                       clock-frequency =3D <33000000>;
>> +                       interrupts =3D <10 IRQ_TYPE_LEVEL_HIGH>;
>> +                       interrupt-parent =3D <&liointc>;
>> +                       no-loopback-test;
>> +               };
>> +       };
>> +};
>> diff --git a/arch/mips/boot/dts/loongson/loongson3_4core_rs780e=2Edts
>b/arch/mips/boot/dts/loongson/loongson3_4core_rs780e=2Edts
>> new file mode 100644
>> index 000000000000=2E=2E6b5694ca0f95
>> --- /dev/null
>> +++ b/arch/mips/boot/dts/loongson/loongson3_4core_rs780e=2Edts
>> @@ -0,0 +1,25 @@
>> +// SPDX-License-Identifier: GPL-2=2E0
>> +
>> +/dts-v1/;
>> +
>> +#include "loongson3-package=2Edtsi"
>> +#include "rs780e-pch=2Edtsi"
>> +
>> +/ {
>> +       compatible =3D "loongson,loongson3-4core-rs780e";
>> +};
>> +
>> +&package0 {
>> +       htpic: interrupt-controller@efdfb000080 {
>> +               compatible =3D "loongson,htpic-1=2E0";
>> +               reg =3D <0xefd 0xfb000080 0x40>;
>> +               interrupt-controller;
>> +               #interrupt-cells =3D <1>;
>> +
>> +               interrupt-parent =3D <&liointc>;
>> +               interrupts =3D <24 IRQ_TYPE_LEVEL_HIGH>,
>> +                               <25 IRQ_TYPE_LEVEL_HIGH>,
>> +                               <26 IRQ_TYPE_LEVEL_HIGH>,
>> +                               <27 IRQ_TYPE_LEVEL_HIGH>;
>> +       };
>> +};
>> diff --git a/arch/mips/boot/dts/loongson/loongson3_8core_rs780e=2Edts
>b/arch/mips/boot/dts/loongson/loongson3_8core_rs780e=2Edts
>> new file mode 100644
>> index 000000000000=2E=2Effefa2f829b0
>> --- /dev/null
>> +++ b/arch/mips/boot/dts/loongson/loongson3_8core_rs780e=2Edts
>> @@ -0,0 +1,25 @@
>> +// SPDX-License-Identifier: GPL-2=2E0
>> +
>> +/dts-v1/;
>> +
>> +#include "loongson3-package=2Edtsi"
>> +#include "rs780e-pch=2Edtsi"
>> +
>> +/ {
>> +       compatible =3D "loongson,loongson3-8core-rs780e";
>> +};
>> +
>> +&package0 {
>> +       htpic: interrupt-controller@1efdfb000080 {
>> +               compatible =3D "loongson,htpic-1=2E0";
>> +               reg =3D <0x1efd 0xfb000080 0x40>;
>> +               interrupt-controller;
>> +               #interrupt-cells =3D <1>;
>> +
>> +               interrupt-parent =3D <&liointc>;
>> +               interrupts =3D <24 IRQ_TYPE_LEVEL_HIGH>,
>> +                               <25 IRQ_TYPE_LEVEL_HIGH>,
>> +                               <26 IRQ_TYPE_LEVEL_HIGH>,
>> +                               <27 IRQ_TYPE_LEVEL_HIGH>;
>> +       };
>> +};
>> diff --git a/arch/mips/boot/dts/loongson/rs780e-pch=2Edtsi
>b/arch/mips/boot/dts/loongson/rs780e-pch=2Edtsi
>> new file mode 100644
>> index 000000000000=2E=2E45c54d555fa4
>> --- /dev/null
>> +++ b/arch/mips/boot/dts/loongson/rs780e-pch=2Edtsi
>> @@ -0,0 +1,26 @@
>> +// SPDX-License-Identifier: GPL-2=2E0
>> +
>> +/ {
>> +       bus@10000000 {
>> +               compatible =3D "simple-bus";
>> +               #address-cells =3D <2>;
>> +               #size-cells =3D <2>;
>> +               ranges =3D <0 0x10000000 0 0x10000000 0 0x10000000
>> +                               0 0x40000000 0 0x40000000 0
>0x40000000
>> +                               0xfd 0xfe000000 0xfd 0xfe000000  0
>0x2000000 /* PCI Config Space */>;
>> +
>> +               isa {
>> +                       compatible =3D "isa";
>> +                       #address-cells =3D <2>;
>> +                       #size-cells =3D <1>;
>> +                       ranges =3D <1 0 0 0 0x1000>;
>> +
>> +                       rtc0: rtc@70 {
>> +                               compatible =3D "motorola,mc146818";
>> +                               reg =3D <1 0x70 0x8>;
>> +                               interrupts =3D <8>;
>> +                               interrupt-parent =3D <&htpic>;
>> +                       };
>> +               };
>> +       };
>> +};
>> --
>> 2=2E26=2E0=2Erc2
>>
>>
>
>Regards,
>Huacai

--=20
Jiaxun Yang
