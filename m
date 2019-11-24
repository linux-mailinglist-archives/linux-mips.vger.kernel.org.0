Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36BEF1083D5
	for <lists+linux-mips@lfdr.de>; Sun, 24 Nov 2019 15:42:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbfKXOmL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 24 Nov 2019 09:42:11 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25834 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726961AbfKXOmL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 24 Nov 2019 09:42:11 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1574606485; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=KtaHlF1g5PIwK/COgj65Rx7iZuz8VBxERJH9szlPN2Aq4kU57oqOLrCFgnUnbsfqmNIjTIbiQGsEFDI/LBxPwpT8s2bfn/qrZOaoPpjuoKNjRJOWZFW9lOepqjUYYnmF6ZHBZBZhavoUAY9HtXv2SXksh6Ie6rkPjv9xiFAm3mY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1574606485; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=v10loUIFVGp5wJp51goNeV+KZvmuw/2OqwsYCfRbhNE=; 
        b=XsQtAAGdM0GV88EabeLMf7aB8FKAktvdhHtmsXsame3kxxIOpV1QB/9Nbk3lpcc+0prBRbgYgqeOdBzeLgjVXG1+O9zz04EmJmVb1PL6OpySrJwnC0qOjk5sglbEzb6SFSsNDghIxLiSzq5PxCU1DPZegbX1A0ej7b9UjhJrvyg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=subject:to:references:cc:from:message-id:date:user-agent:mime-version:in-reply-to:content-type; 
  b=wDYtnF3i/unOpZ2+xEkf8fxlAc5V9jplt4rdTwwQHY0vxrBgxSFvDVu4AQkzKRPiLlEnZ/jpcXB4
    wyh5NYqzdBQllNrpgimGMh/uuRVaff8R8520wa82qscVXz+BUYbg  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574606485;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
        bh=v10loUIFVGp5wJp51goNeV+KZvmuw/2OqwsYCfRbhNE=;
        b=dRCEInXrY65KdZcEFB670pYETAythxJWLYl7hZFGu0ASUzEvXHFj6Z9abxc9UBsl
        XjPi3MQY76EYgkqu5TEBOOACsAJg0d/SR6a9P2GfABKpHB2PxL1WaORowsqdII+tMM1
        v3yPOpyHizedP+6NjVcb8EWXbovdMltFJwW2cDrU=
Received: from [192.168.88.130] (171.221.112.247 [171.221.112.247]) by mx.zohomail.com
        with SMTPS id 1574606484912233.6894301029912; Sun, 24 Nov 2019 06:41:24 -0800 (PST)
Subject: Re: [PATCH v2 1/4] MIPS: Ingenic: initial X1000 support.
To:     Paul Cercueil <paul@crapouillou.net>
References: <1574476344-62631-1-git-send-email-zhouyanjie@zoho.com>
 <1574476344-62631-2-git-send-email-zhouyanjie@zoho.com>
 <1574600994.3.2@crapouillou.net>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        paul.burton@mips.com, paulburton@kernel.org, jhogan@kernel.org,
        mripard@kernel.org, shawnguo@kernel.org, mark.rutland@arm.com,
        syq@debian.org, ralf@linux-mips.org, heiko@sntech.de,
        icenowy@aosc.io, laurent.pinchart@ideasonboard.com,
        krzk@kernel.org, geert+renesas@glider.be,
        prasannatsmkumar@gmail.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, 772753199@qq.com
From:   Zhou Yanjie <zhouyanjie@zoho.com>
Message-ID: <5DDA968B.5050101@zoho.com>
Date:   Sun, 24 Nov 2019 22:41:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1574600994.3.2@crapouillou.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

On 2019=E5=B9=B411=E6=9C=8824=E6=97=A5 21:09, Paul Cercueil wrote:
> Hi Zhou,
>
>
> Le sam., nov. 23, 2019 at 10:32, Zhou Yanjie <zhouyanjie@zoho.com> a=20
> =C3=A9crit :
>> Support the Ingenic X1000 SoC using the code under arch/mips/jz4740.
>> This is left unselectable in Kconfig until a X1000 based board is
>> added in a later commit.
>>
>> Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
>> ---
>>
>> Notes:
>>     v1->v2:
>>     Rebase on top of mips-next, use ingenic-timer driver
>>     for system timer and clocksource.
>>
>>  arch/mips/boot/dts/ingenic/x1000.dtsi | 183=20
>> ++++++++++++++++++++++++++++++++++
>>  arch/mips/jz4740/Kconfig              |   6 ++
>>  2 files changed, 189 insertions(+)
>>  create mode 100644 arch/mips/boot/dts/ingenic/x1000.dtsi
>>
>> diff --git a/arch/mips/boot/dts/ingenic/x1000.dtsi=20
>> b/arch/mips/boot/dts/ingenic/x1000.dtsi
>> new file mode 100644
>> index 00000000..02a9b2a
>> --- /dev/null
>> +++ b/arch/mips/boot/dts/ingenic/x1000.dtsi
>> @@ -0,0 +1,183 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +#include <dt-bindings/clock/x1000-cgu.h>
>> +
>> +/ {
>> +    #address-cells =3D <1>;
>> +    #size-cells =3D <1>;
>> +    compatible =3D "ingenic,x1000", "ingenic,x1000e";
>> +
>> +    cpuintc: interrupt-controller {
>> +        #address-cells =3D <0>;
>> +        #interrupt-cells =3D <1>;
>> +        interrupt-controller;
>> +        compatible =3D "mti,cpu-interrupt-controller";
>> +    };
>> +
>> +    intc: interrupt-controller@10001000 {
>> +        compatible =3D "ingenic,x1000-intc", "ingenic,jz4780-intc";
>> +        reg =3D <0x10001000 0x50>;
>> +
>> +        interrupt-controller;
>> +        #interrupt-cells =3D <1>;
>> +
>> +        interrupt-parent =3D <&cpuintc>;
>> +        interrupts =3D <2>;
>> +    };
>> +
>> +    exclk: ext {
>> +        compatible =3D "fixed-clock";
>> +        #clock-cells =3D <0>;
>> +    };
>> +
>> +    rtclk: rtc {
>> +        compatible =3D "fixed-clock";
>> +        #clock-cells =3D <0>;
>> +        clock-frequency =3D <32768>;
>> +    };
>> +
>> +    cgu: x1000-cgu@10000000 {
>> +        compatible =3D "ingenic,x1000-cgu";
>> +        reg =3D <0x10000000 0x100>;
>> +
>> +        #clock-cells =3D <1>;
>> +
>> +        clocks =3D <&exclk>, <&rtclk>;
>> +        clock-names =3D "ext", "rtc";
>> +    };
>> +
>> +    apb {
>> +        compatible =3D "simple-bus";
>> +        #address-cells =3D <1>;
>> +        #size-cells =3D <1>;
>> +        ranges =3D <>;
>
> You can drop the 'apb' node and list the children in the top node=20
> directly. That's what we do in the devicetree for the other Ingenic SoCs.
>

Sure, I'll drop it in v2.

Thanks and best regards!

> Cheers,
> -Paul
>
>
>> +
>> +        tcu: timer@10002000 {
>> +            compatible =3D "ingenic,x1000-tcu",
>> +                     "ingenic,jz4770-tcu",
>> +                     "simple-mfd";
>> +            reg =3D <0x10002000 0x1000>;
>> +            #address-cells =3D <1>;
>> +            #size-cells =3D <1>;
>> +            ranges =3D <0x0 0x10002000 0x1000>;
>> +
>> +            #clock-cells =3D <1>;
>> +
>> +            clocks =3D <&cgu X1000_CLK_RTCLK
>> +                  &cgu X1000_CLK_EXCLK
>> +                  &cgu X1000_CLK_PCLK>;
>> +            clock-names =3D "rtc", "ext", "pclk";
>> +
>> +            interrupt-controller;
>> +            #interrupt-cells =3D <1>;
>> +
>> +            interrupt-parent =3D <&intc>;
>> +            interrupts =3D <27 26 25>;
>> +        };
>> +
>> +        uart0: serial@10030000 {
>> +            compatible =3D "ingenic,x1000-uart";
>> +            reg =3D <0x10030000 0x100>;
>> +
>> +            interrupt-parent =3D <&intc>;
>> +            interrupts =3D <51>;
>> +
>> +            clocks =3D <&exclk>, <&cgu X1000_CLK_UART0>;
>> +            clock-names =3D "baud", "module";
>> +
>> +            status =3D "disabled";
>> +        };
>> +
>> +        uart1: serial@10031000 {
>> +            compatible =3D "ingenic,x1000-uart";
>> +            reg =3D <0x10031000 0x100>;
>> +
>> +            interrupt-parent =3D <&intc>;
>> +            interrupts =3D <50>;
>> +
>> +            clocks =3D <&exclk>, <&cgu X1000_CLK_UART1>;
>> +            clock-names =3D "baud", "module";
>> +
>> +            status =3D "disabled";
>> +        };
>> +
>> +        uart2: serial@10032000 {
>> +            compatible =3D "ingenic,x1000-uart";
>> +            reg =3D <0x10032000 0x100>;
>> +
>> +            interrupt-parent =3D <&intc>;
>> +            interrupts =3D <49>;
>> +
>> +            clocks =3D <&exclk>, <&cgu X1000_CLK_UART2>;
>> +            clock-names =3D "baud", "module";
>> +
>> +            status =3D "disabled";
>> +        };
>> +
>> +        pinctrl: pin-controller@10010000 {
>> +            compatible =3D "ingenic,x1000-pinctrl";
>> +            reg =3D <0x10010000 0x800>;
>> +            #address-cells =3D <1>;
>> +            #size-cells =3D <0>;
>> +
>> +            gpa: gpio@0 {
>> +                compatible =3D "ingenic,x1000-gpio";
>> +                reg =3D <0>;
>> +
>> +                gpio-controller;
>> +                gpio-ranges =3D <&pinctrl 0 0 32>;
>> +                #gpio-cells =3D <2>;
>> +
>> +                interrupt-controller;
>> +                #interrupt-cells =3D <2>;
>> +
>> +                interrupt-parent =3D <&intc>;
>> +                interrupts =3D <17>;
>> +            };
>> +
>> +            gpb: gpio@1 {
>> +                compatible =3D "ingenic,x1000-gpio";
>> +                reg =3D <1>;
>> +
>> +                gpio-controller;
>> +                gpio-ranges =3D <&pinctrl 0 32 32>;
>> +                #gpio-cells =3D <2>;
>> +
>> +                interrupt-controller;
>> +                #interrupt-cells =3D <2>;
>> +
>> +                interrupt-parent =3D <&intc>;
>> +                interrupts =3D <16>;
>> +            };
>> +
>> +            gpc: gpio@2 {
>> +                compatible =3D "ingenic,x1000-gpio";
>> +                reg =3D <2>;
>> +
>> +                gpio-controller;
>> +                gpio-ranges =3D <&pinctrl 0 64 32>;
>> +                #gpio-cells =3D <2>;
>> +
>> +                interrupt-controller;
>> +                #interrupt-cells =3D <2>;
>> +
>> +                interrupt-parent =3D <&intc>;
>> +                interrupts =3D <15>;
>> +            };
>> +
>> +            gpd: gpio@3 {
>> +                compatible =3D "ingenic,x1000-gpio";
>> +                reg =3D <3>;
>> +
>> +                gpio-controller;
>> +                gpio-ranges =3D <&pinctrl 0 96 32>;
>> +                #gpio-cells =3D <2>;
>> +
>> +                interrupt-controller;
>> +                #interrupt-cells =3D <2>;
>> +
>> +                interrupt-parent =3D <&intc>;
>> +                interrupts =3D <14>;
>> +            };
>> +        };
>> +    };
>> +};
>> diff --git a/arch/mips/jz4740/Kconfig b/arch/mips/jz4740/Kconfig
>> index 4dd0c44..6b96844 100644
>> --- a/arch/mips/jz4740/Kconfig
>> +++ b/arch/mips/jz4740/Kconfig
>> @@ -33,3 +33,9 @@ config MACH_JZ4780
>>      select MIPS_CPU_SCACHE
>>      select SYS_HAS_CPU_MIPS32_R2
>>      select SYS_SUPPORTS_HIGHMEM
>> +
>> +config MACH_X1000
>> +    bool
>> +    select MIPS_CPU_SCACHE
>> +    select SYS_HAS_CPU_MIPS32_R2
>> +    select SYS_SUPPORTS_HIGHMEM
>> --=20
>> 2.7.4
>>
>>
>
>



