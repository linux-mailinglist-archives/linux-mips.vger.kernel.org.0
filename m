Return-Path: <linux-mips+bounces-9823-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E4EB07203
	for <lists+linux-mips@lfdr.de>; Wed, 16 Jul 2025 11:42:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4EC316274F
	for <lists+linux-mips@lfdr.de>; Wed, 16 Jul 2025 09:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E50622EF646;
	Wed, 16 Jul 2025 09:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cpjtkl6x"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08F32701CE;
	Wed, 16 Jul 2025 09:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752658915; cv=none; b=c3lDew0I7Zv8t4siVOEffXTx2A2C+Zq2bytbHRHIziZGPkQ5n6VPDUThE2MQ8c5kzY+NNz3cmWjU024lQklORlMOq+oIGupc+bN3b0Qm5hYW8A19ixYqfxMbVC38r5yXDRoDVdXqExt+Qr9qjzAm1akqz8fcYq4SEMlq9hznZ9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752658915; c=relaxed/simple;
	bh=0zQw3Y7sNLP/ZJsjNVbVJe5uTrMbiyRpO+AyWlkpAvw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K7kg2pr2cfYmZ128DUWVJEYuXnHg1sirCCQIvymuf5D3fqVQSzg88hP2JAZLNGUrFKim0ETqJ+Y71TtsDHcQGHvrrtKORuEUT7xL6X8dWeesYQDxYN9B0E81g9MDu3PpzynxsI8f4G5okUAtMjFZokhdGmgBNZ2PWJAnXaCdx0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cpjtkl6x; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-558fa0b2c99so5238577e87.2;
        Wed, 16 Jul 2025 02:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752658912; x=1753263712; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DTzh11qE1Aq7QYMndmWPIvzi24OXXMC+pZA0nytp/QA=;
        b=Cpjtkl6x3j1m4npGyW27gmqTqoWoXcODaf9QUO6xPdgPD8IDAjTEqKnOhUT0iWDfdO
         N7i8QdVkqYrCHC1h4ebOC5uQt/a6AJbaAipYNO2JmyxabC6GGyqXFhr6RvRn8958TfjS
         j3QZCUNoKWt/YZibWA4/5g7uz/A5V5BrKRJG+XwHLSkazdPbG+oMcSSiT+ybzW8x5NZr
         3pah/JiPE3URZEYWel2CK41+haKE1UljiwGNLs90fz5bXZZMuqm7KstB47DtwqBscIz2
         s4+r47XS/rZtAbXQoFQHYvLK6r9f2ZrKZCHvUqCYo66oMgVm9vxWOaJy+eV4bYmZApJk
         oQ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752658912; x=1753263712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DTzh11qE1Aq7QYMndmWPIvzi24OXXMC+pZA0nytp/QA=;
        b=cTnKSx5B3gpWJDG9jcLvRA8tu12bHs788YeNGh/DExu5CKDF6niEusbd4U3RECld0n
         9x79N2ODBeokZme5gsTFUMfN3XUYFTTG3okqNRtfo+sXA6RK+SqVjic5zds2E3gz2V5Z
         KKDFvfTbmRu8FvTek81subyEDTCGJ/ZVnXeEe2ObcdQ/CyiUrX0VPbyvTY+6KG66QjWR
         62dfqdz7DIlkcGrT/hMrqndbBFq5cxeh0u+UKlgZsG97zAjm1Pzl5699gXrg3TQImO80
         rwEBmKoGNE6sTfqsaaPzJHtFthczK/7dLhWKE+VWwYvi4uvBw/88AzW3FQX+qWJ7F/eq
         IRbw==
X-Forwarded-Encrypted: i=1; AJvYcCVSWcJbi8x8tByXZtjqGsItQm84U5JhzhLHmtgVgG6BsyWcAAiJ79/n1kuNVkimhIv0ldZZho7lNaMa0FpG@vger.kernel.org, AJvYcCWlCFbmipzzUgZ+VBfl8xVMie20yN5aKAFjypPLBZ0yXNGIOxBcXi6yrc5zlRfRAyCklRjCrzhDiR5h@vger.kernel.org, AJvYcCXUlCsNyszwQORFeyGs/MZHiAmZFxB9q0if/dMNhxH5UhEDZzIvi5mC+V3J2SRuPdIrnQhKJu6eOl0leQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMkbIP8TdE+DIyGTTJyKlteEkFhoCcQT14Dce2RQeazf6Sljm5
	0yk6lm88D3iTjzBnMUjH9ttlOGN6lwJGmser0XtU7H6A9+/8Dezrv0KFI3xa0uBLJ+1tnsoeIap
	zl2WYE6R7mhG4F3OAnirD15jM5FRalQc=
X-Gm-Gg: ASbGncswJ4Ug1q2/82YoFyzNd7/ZMowxti2ICR9KhnZygHTSrY6BXFL95fAhfAgU6UU
	FqNFI1TcMYaua4l4l/3ADyvlM4NjXiOzufg7buHQACGfb4Z7QmJJOw0klmfBs7f0iBtT2HrfYI6
	5/fHJzEVmKMOjHZYaYxFBwmVwRqgsoyDQKqbKuBb3FmuEUJTInRzRQJjuIoApwFtYzQHfBcq2QR
	6eL1LlGgR2F85Hany8=
X-Google-Smtp-Source: AGHT+IG3OILo61yOuxFn+Fc85CBvzf/yi0KNUig7gw5QljWJa5ohkfWldIjyatKP4INES1J2t5WEeM6OfW/dR7gbfz8=
X-Received: by 2002:a05:6512:1147:b0:553:a456:a0c1 with SMTP id
 2adb3069b0e04-55a233d97d2mr774688e87.43.1752658911632; Wed, 16 Jul 2025
 02:41:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709-loongson1-arch-v2-0-bcff6e518c09@gmail.com>
 <20250709-loongson1-arch-v2-3-bcff6e518c09@gmail.com> <20250710-ancient-ibex-of-adventure-30030a@krzk-bin>
In-Reply-To: <20250710-ancient-ibex-of-adventure-30030a@krzk-bin>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Wed, 16 Jul 2025 17:41:14 +0800
X-Gm-Features: Ac12FXz1HBYeB40pqPFU375B-7clc7iM_1QEG3247AIxPozwifRzC_JCyTdhRgs
Message-ID: <CAJhJPsU8En_frOvwV0HgFoucrd4dme2LJ+Je6DcQj4yrNqXsjg@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] MIPS: dts: loongson: Add LS1B-DEMO board
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 10, 2025 at 8:27=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Wed, Jul 09, 2025 at 07:05:54PM +0800, Keguang Zhang wrote:
> > Add a device tree for LS1B-DEMO board, supporting CPU, clock, INTC,
> > UART, Ethernet, GPIO, USB host, RTC, watchdog, DMA, NAND, and AC97.
> >
> > Additionally, since the current bootloader for Loongson1 does not suppo=
rt
> > FDT, introduce CONFIG_BUILTIN_DTB_NAME to enable a built-in DTB.
> >
> > Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
> > ---
> >  MAINTAINERS                                 |   1 +
> >  arch/mips/boot/dts/Makefile                 |   1 +
> >  arch/mips/boot/dts/loongson/Makefile        |   6 +
> >  arch/mips/boot/dts/loongson/loongson1.dtsi  | 136 +++++++++++++++++++
> >  arch/mips/boot/dts/loongson/loongson1b.dtsi | 198 ++++++++++++++++++++=
++++++++
> >  arch/mips/boot/dts/loongson/ls1b-demo.dts   | 108 +++++++++++++++
> >  6 files changed, 450 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index c3f7fbd0d67a..0089ebca31cf 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -16683,6 +16683,7 @@ M:    Keguang Zhang <keguang.zhang@gmail.com>
> >  L:   linux-mips@vger.kernel.org
> >  S:   Maintained
> >  F:   Documentation/devicetree/bindings/*/loongson,ls1*.yaml
> > +F:   arch/mips/boot/dts/loongson/loongson1*
> >  F:   arch/mips/include/asm/mach-loongson32/
> >  F:   arch/mips/loongson32/
> >  F:   drivers/*/*loongson1*
> > diff --git a/arch/mips/boot/dts/Makefile b/arch/mips/boot/dts/Makefile
> > index 7375c6ced82b..6d9dbe945541 100644
> > --- a/arch/mips/boot/dts/Makefile
> > +++ b/arch/mips/boot/dts/Makefile
> > @@ -8,6 +8,7 @@ subdir-$(CONFIG_FIT_IMAGE_FDT_BOSTON) +=3D img
> >  subdir-$(CONFIG_MACH_INGENIC)                +=3D ingenic
> >  subdir-$(CONFIG_LANTIQ)                      +=3D lantiq
> >  subdir-$(CONFIG_MACH_LOONGSON64)     +=3D loongson
> > +subdir-$(CONFIG_MACH_LOONGSON32)     +=3D loongson
> >  subdir-$(CONFIG_SOC_VCOREIII)                +=3D mscc
> >  subdir-$(CONFIG_MIPS_MALTA)          +=3D mti
> >  subdir-$(CONFIG_LEGACY_BOARD_SEAD3)  +=3D mti
> > diff --git a/arch/mips/boot/dts/loongson/Makefile b/arch/mips/boot/dts/=
loongson/Makefile
> > index 5e3ab984d70f..2facf251fb6a 100644
> > --- a/arch/mips/boot/dts/loongson/Makefile
> > +++ b/arch/mips/boot/dts/loongson/Makefile
> > @@ -5,3 +5,9 @@ dtb-$(CONFIG_MACH_LOONGSON64) +=3D loongson64c_4core_rs=
780e.dtb
> >  dtb-$(CONFIG_MACH_LOONGSON64)        +=3D loongson64c_8core_rs780e.dtb
> >  dtb-$(CONFIG_MACH_LOONGSON64)        +=3D loongson64g_4core_ls7a.dtb
> >  dtb-$(CONFIG_MACH_LOONGSON64)        +=3D loongson64v_4core_virtio.dtb
> > +
> > +ifneq ($(CONFIG_BUILTIN_DTB_NAME),)
> > +dtb-y        :=3D $(addsuffix .dtb, $(CONFIG_BUILTIN_DTB_NAME))
> > +else
>
> This does not really look related to new board.

Will separate this into a single patch.
>
> > +dtb-$(CONFIG_MACH_LOONGSON32)        +=3D ls1b-demo.dtb
> > +endif
> > diff --git a/arch/mips/boot/dts/loongson/loongson1.dtsi b/arch/mips/boo=
t/dts/loongson/loongson1.dtsi
> > new file mode 100644
> > index 000000000000..5ba5a5d131ba
>
> ...
>
> > +             opp-220000000 {
> > +                     opp-hz =3D /bits/ 64 <220000000>;
> > +             };
> > +     };
> > +
> > +     clocksource: timer@1fe5c030 {
>
> This should be in the SoC (see writing bindings, maintainer soc, DTS
> coding style).

Will move it under the APB bus.
>
> > +             compatible =3D "loongson,ls1b-pwmtimer";
> > +             reg =3D <0x1fe5c030 0x10>;
> > +             clocks =3D <&clkc LS1X_CLKID_APB>;
> > +             interrupt-parent =3D <&intc0>;
> > +             interrupts =3D <20 IRQ_TYPE_LEVEL_HIGH>;
> > +     };
> > +
> > +     clkc: clock-controller@1fe78030 {
> > +             compatible =3D "loongson,ls1b-clk";
> > +             reg =3D <0x1fe78030 0x8>;
> > +             clocks =3D <&xtal>;
> > +             #clock-cells =3D <1>;
> > +     };
> > +};
> > +
> > +&soc {
> > +     syscon: syscon@420 {
> > +             compatible =3D "loongson,ls1b-syscon", "syscon";
> > +             reg =3D <0x420 0x8>;
> > +     };
> > +
> > +     dma: dma-controller@1160 {
> > +             compatible =3D "loongson,ls1b-apbdma";
> > +             reg =3D <0x1160 0x4>;
> > +             interrupt-parent =3D <&intc0>;
> > +             interrupts =3D <13 IRQ_TYPE_EDGE_RISING>,
> > +                          <14 IRQ_TYPE_EDGE_RISING>,
> > +                          <15 IRQ_TYPE_EDGE_RISING>;
> > +             interrupt-names =3D "ch0", "ch1", "ch2";
> > +             #dma-cells =3D <1>;
> > +     };
> > +
> > +     ehci: usb@100000 {
> > +             compatible =3D "generic-ehci";
> > +             reg =3D <0x100000 0x100>;
> > +             interrupt-parent =3D <&intc1>;
> > +             interrupts =3D <0 IRQ_TYPE_LEVEL_HIGH>;
> > +             status =3D "disabled";
> > +     };
> > +
> > +     ohci: usb@108000 {
> > +             compatible =3D "generic-ohci";
> > +             reg =3D <0x108000 0x100>;
> > +             interrupt-parent =3D <&intc1>;
> > +             interrupts =3D <1 IRQ_TYPE_LEVEL_HIGH>;
> > +             status =3D "disabled";
> > +     };
> > +
> > +     gmac0: ethernet@110000 {
> > +             compatible =3D "loongson,ls1b-gmac", "snps,dwmac-3.50a";
> > +             reg =3D <0x110000 0x10000>;
> > +             clocks =3D <&clkc LS1X_CLKID_AHB>;
> > +             clock-names =3D "stmmaceth";
> > +             interrupt-parent =3D <&intc1>;
> > +             interrupts =3D <2 IRQ_TYPE_LEVEL_HIGH>;
> > +             interrupt-names =3D "macirq";
> > +             loongson,ls1-syscon =3D <&syscon>;
> > +             snps,pbl =3D <1>;
> > +             status =3D "disabled";
> > +     };
> > +
> > +     gmac1: ethernet@120000 {
> > +             compatible =3D "loongson,ls1b-gmac", "snps,dwmac-3.50a";
> > +             reg =3D <0x120000 0x10000>;
> > +             clocks =3D <&clkc LS1X_CLKID_AHB>;
> > +             clock-names =3D "stmmaceth";
> > +             interrupt-parent =3D <&intc1>;
> > +             interrupts =3D <3 IRQ_TYPE_LEVEL_HIGH>;
> > +             interrupt-names =3D "macirq";
> > +             loongson,ls1-syscon =3D <&syscon>;
> > +             snps,pbl =3D <1>;
> > +             status =3D "disabled";
> > +     };
> > +};
> > +
> > +&apb {
> > +     watchdog: watchdog@1c060 {
> > +             compatible =3D "loongson,ls1b-wdt";
> > +             reg =3D <0x1c060 0xc>;
> > +             clocks =3D <&clkc LS1X_CLKID_APB>;
> > +             status =3D "disabled";
> > +     };
> > +
> > +     rtc: rtc@24000 {
> > +             compatible =3D "loongson,ls1b-rtc";
> > +             reg =3D <0x24000 0x78>;
> > +             interrupt-parent =3D <&intc0>;
> > +             interrupts =3D <24 IRQ_TYPE_LEVEL_HIGH>;
> > +             status =3D "disabled";
> > +     };
> > +
> > +     ac97: audio-controller@34000 {
> > +             compatible =3D "loongson,ls1b-ac97";
> > +             reg =3D <0x34000 0x60>, <0x32420 0x4>, <0x34c4c 0x4>;
> > +             reg-names =3D "ac97", "audio-tx", "audio-rx";
> > +             dmas =3D <&dma 1>, <&dma 2>;
> > +             dma-names =3D "tx", "rx";
> > +             #sound-dai-cells =3D <0>;
> > +             status =3D "disabled";
> > +     };
> > +
> > +     nand: nand-controller@38000 {
> > +             compatible =3D "loongson,ls1b-nand-controller";
> > +             reg =3D <0x38000 0x24>, <0x38040 0x4>;
> > +             reg-names =3D "nand", "nand-dma";
> > +             dmas =3D <&dma 0>;
> > +             dma-names =3D "rxtx";
> > +             #address-cells =3D <1>;
> > +             #size-cells =3D <0>;
> > +             status =3D "disabled";
> > +
> > +             nand@0 {
> > +                     reg =3D <0>;
> > +                     label =3D "ls1x-nand";
> > +                     nand-use-soft-ecc-engine;
> > +                     nand-ecc-algo =3D "hamming";
> > +             };
> > +     };
> > +};
> > +
> > +&cpu0 {
> > +     operating-points-v2 =3D <&cpu_opp_table>;
> > +};
> > +
> > +&gpio0 {
> > +     ngpios =3D <31>;
> > +};
> > +
> > +&gpio1 {
> > +     ngpios =3D <30>;
> > +};
> > +
> > +&uart1 {
> > +     interrupts =3D <3 IRQ_TYPE_LEVEL_HIGH>;
> > +};
> > +
> > +&uart2 {
> > +     interrupts =3D <4 IRQ_TYPE_LEVEL_HIGH>;
> > +};
> > +
> > +&uart3 {
> > +     interrupts =3D <5 IRQ_TYPE_LEVEL_HIGH>;
> > +};
> > diff --git a/arch/mips/boot/dts/loongson/ls1b-demo.dts b/arch/mips/boot=
/dts/loongson/ls1b-demo.dts
> > new file mode 100644
> > index 000000000000..19ea772e6649
> > --- /dev/null
> > +++ b/arch/mips/boot/dts/loongson/ls1b-demo.dts
> > @@ -0,0 +1,108 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2023-2025 Keguang Zhang <keguang.zhang@gmail.com>
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +
> > +#include "loongson1b.dtsi"
> > +
> > +/ {
> > +     compatible =3D "loongson,ls1b-demo", "loongson,ls1b";
> > +     model =3D "LS1B-DEMO Board";
> > +
> > +     memory@0 {
> > +             device_type =3D "memory";
> > +             reg =3D <0x0 0x10000000>;
> > +     };
> > +
> > +     aliases {
> > +             ethernet0 =3D &gmac0;
> > +             ethernet1 =3D &gmac1;
> > +             gpio0 =3D &gpio0;
> > +             gpio1 =3D &gpio1;
> > +             serial0 =3D &uart0;
> > +     };
> > +
> > +     chosen {
> > +             bootargs =3D "console=3DttyS0,38400";
>
> Drop bootargs. You duplicate stdout path.

Will do.
Thanks for the review!
>
> > +             stdout-path =3D "serial0:38400n8";
> > +     };
>
> Best regards,
> Krzysztof
>


--=20
Best regards,

Keguang Zhang

