Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE75710D20E
	for <lists+linux-mips@lfdr.de>; Fri, 29 Nov 2019 08:49:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726822AbfK2HtN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 Nov 2019 02:49:13 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25806 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726360AbfK2HtN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 Nov 2019 02:49:13 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1575013702; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=KDSy1+WrAh6dXP5Xz0wj2NajCaVNY+F+wLSMKWiSFgsLU8PQwkYyMtn24zSP8NMJbdx+pHKHbNkMj3p3vHFy/QjXQ7itqMXLDwns0+cDhailFXCVsw+K0yoDbiIdNkw+iwJxXQXj5KFsrtxBq2+ujAeMwlatilgSOqZYsCNXY5Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1575013702; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=tDKlRM2OnSa/bddPc0RH20mW/Nz7ORXjS9zi/ab2gcg=; 
        b=F8XqSbjS4s4Zu4c36wApOp+5Y5q0NJqrrdMzbEe4pNFB1OpVTu+v5Vr6SLLM0yk+wURRdgevwkgEAxRtI9Mm8h4Nuaa/DlVZBgVdc5I+8dGk3f1dOXK6qYfTHl43fwlGuoP/BV3GOrOP8LNC2Ic33m5DFPhDxVDwWuc6AmCx+v8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=subject:to:references:cc:from:message-id:date:user-agent:mime-version:in-reply-to:content-type; 
  b=Hbn3OYrHKYm2Js3p92I8nrDFRrSpzw5FO23UumEOLQSZp13l1eGRiovpTdjvgVAks43KoTTABIxu
    GnjbREmAQDitiyL/u5CpLic4gnunzpba5eNCYarA7fOIVpxBnwtq  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1575013702;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
        bh=tDKlRM2OnSa/bddPc0RH20mW/Nz7ORXjS9zi/ab2gcg=;
        b=N56SRiA1tTNl/iMHEMExaTWQyPwZwWYnrPd8QuRNKsEttz3ihOU+5S6YFKGgYD75
        YDLldHbabdpdHion6QGMeZu2R5HUzggvxG7w09YMNECPzUJ1naHcbxroWY0UBnasOhI
        9IonG7nFY72nAi7fEDj5Mj4Zh0Eiuco0VfiaIAIM=
Received: from [192.168.88.130] (117.136.62.83 [117.136.62.83]) by mx.zohomail.com
        with SMTPS id 1575013699957475.9849040704013; Thu, 28 Nov 2019 23:48:19 -0800 (PST)
Subject: Re: [PATCH v4 4/6] MIPS: Ingenic: Initial YSH & ATIL CU Neo board
 support.
To:     Paul Cercueil <paul@crapouillou.net>
References: <1574787974-58040-1-git-send-email-zhouyanjie@zoho.com>
 <1574787974-58040-5-git-send-email-zhouyanjie@zoho.com>
 <1574873873.3.1@crapouillou.net> <5DDF5711.9050008@zoho.com>
 <1574944293.3.0@crapouillou.net>
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
Message-ID: <5DE0CD34.6070504@zoho.com>
Date:   Fri, 29 Nov 2019 15:48:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1574944293.3.0@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

On 2019=E5=B9=B411=E6=9C=8828=E6=97=A5 20:31, Paul Cercueil wrote:
> Hi Zhou,
>
>
> Le jeu., nov. 28, 2019 at 13:11, Zhou Yanjie <zhouyanjie@zoho.com> a=20
> =C3=A9crit :
>> Hi Paul,
>>
>> On 2019=E5=B9=B411=E6=9C=8828=E6=97=A5 00:57, Paul Cercueil wrote:
>>> Hi Zhou,
>>>
>>>
>>> Le mer., nov. 27, 2019 at 01:06, Zhou Yanjie <zhouyanjie@zoho.com>=20
>>> a =7F=C3=A9crit :
>>>> Add a device tree for the Ingenic X1000 based YSH & ATIL CU Neo board.
>>>> Note that this is unselectable via Kconfig until the X1000 SoC is made
>>>> selectable in a later commit.
>>>>
>>>> Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
>>>> ---
>>>>
>>>> Notes:
>>>>     v1->v2:
>>>>     Rebase on top of mips-next, use TCU for system timer and=20
>>>> =7F=7Fclocksource.
>>>>
>>>>     v2->v3:
>>>>     No change.
>>>>
>>>>     v3->v4:
>>>>     1.Adjust "model" in "cu1000.dts" to match the description in=20
>>>> =7F=7F"devices.yaml".
>>>>     2.Adjust "bool" in "Kconfig" to avoid duplicate names with=20
>>>> =7F=7Fsubsequent boards.
>>>>
>>>>  arch/mips/boot/dts/ingenic/Makefile   |   1 +
>>>>  arch/mips/boot/dts/ingenic/cu1000.dts |  52 ++++++++++++++++++
>>>>  arch/mips/configs/cu1000_defconfig    | 100=20
>>>> =7F=7F++++++++++++++++++++++++++++++++++
>>>>  arch/mips/jz4740/Kconfig              |   4 ++
>>>>  4 files changed, 157 insertions(+)
>>>>  create mode 100644 arch/mips/boot/dts/ingenic/cu1000.dts
>>>>  create mode 100644 arch/mips/configs/cu1000_defconfig
>>>>
>>>> diff --git a/arch/mips/boot/dts/ingenic/Makefile=20
>>>> =7F=7Fb/arch/mips/boot/dts/ingenic/Makefile
>>>> index 9cc4844..f6db7bb 100644
>>>> --- a/arch/mips/boot/dts/ingenic/Makefile
>>>> +++ b/arch/mips/boot/dts/ingenic/Makefile
>>>> @@ -2,5 +2,6 @@
>>>>  dtb-$(CONFIG_JZ4740_QI_LB60)    +=3D qi_lb60.dtb
>>>>  dtb-$(CONFIG_JZ4770_GCW0)    +=3D gcw0.dtb
>>>>  dtb-$(CONFIG_JZ4780_CI20)    +=3D ci20.dtb
>>>> +dtb-$(CONFIG_X1000_CU1000)    +=3D cu1000.dtb
>>>>
>>>>  obj-$(CONFIG_BUILTIN_DTB)    +=3D $(addsuffix .o, $(dtb-y))
>>>> diff --git a/arch/mips/boot/dts/ingenic/cu1000.dts=20
>>>> =7F=7Fb/arch/mips/boot/dts/ingenic/cu1000.dts
>>>> new file mode 100644
>>>> index 00000000..f92f6af
>>>> --- /dev/null
>>>> +++ b/arch/mips/boot/dts/ingenic/cu1000.dts
>>>> @@ -0,0 +1,52 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +/dts-v1/;
>>>> +
>>>> +#include "x1000.dtsi"
>>>> +#include <dt-bindings/gpio/gpio.h>
>>>> +#include <dt-bindings/clock/ingenic,tcu.h>
>>>> +
>>>> +/ {
>>>> +    compatible =3D "yna,cu1000", "ingenic,x1000";
>>>> +    model =3D "YSH & ATIL General Board CU Neo";
>>>> +
>>>> +    aliases {
>>>> +        serial2 =3D &uart2;
>>>> +    };
>>>> +
>>>> +    chosen {
>>>> +        stdout-path =3D &uart2;
>>>> +    };
>>>> +
>>>> +    memory {
>>>> +        device_type =3D "memory";
>>>> +        reg =3D <0x0 0x04000000>;
>>>> +    };
>>>> +};
>>>> +
>>>> +&exclk {
>>>> +    clock-frequency =3D <24000000>;
>>>> +};
>>>> +
>>>> +&tcu {
>>>> +    /* 1500 kHz for the system timer and clocksource */
>>>> +    assigned-clocks =3D <&tcu TCU_CLK_TIMER0>, <&tcu TCU_CLK_TIMER2>;
>>>> +    assigned-clock-rates =3D <1500000>, <1500000>;
>>>> +
>>>> +    /* Use channel #1 for the system timer channel #2 for the=20
>>>> =7F=7Fclocksource */
>>>> +    ingenic,pwm-channels-mask =3D <0xfa>;
>>>
>>> From the mask used, I'm gessing that you're reserving channels #0=20
>>> and =7F#2, not #1 and #2.
>>>
>>
>> My fault, you are right, it use channels #0 and #2.
>>
>>>> +};
>>>> +
>>>> +&uart2 {
>>>> +    status =3D "okay";
>>>> +
>>>> +    pinctrl-names =3D "default";
>>>> +    pinctrl-0 =3D <&pins_uart2>;
>>>> +};
>>>> +
>>>> +&pinctrl {
>>>> +    pins_uart2: uart2 {
>>>> +        function =3D "uart2";
>>>> +        groups =3D "uart2-data-d";
>>>> +        bias-disable;
>>>> +    };
>>>> +};
>>>> diff --git a/arch/mips/configs/cu1000_defconfig=20
>>>> =7F=7Fb/arch/mips/configs/cu1000_defconfig
>>>> new file mode 100644
>>>> index 00000000..88729ee
>>>> --- /dev/null
>>>> +++ b/arch/mips/configs/cu1000_defconfig
>>>> @@ -0,0 +1,100 @@
>>>> +CONFIG_LOCALVERSION_AUTO=3Dy
>>>> +CONFIG_KERNEL_GZIP=3Dy
>>>> +CONFIG_SYSVIPC=3Dy
>>>> +CONFIG_NO_HZ_IDLE=3Dy
>>>> +CONFIG_HIGH_RES_TIMERS=3Dy
>>>> +CONFIG_PREEMPT=3Dy
>>>> +CONFIG_IKCONFIG=3Dy
>>>> +CONFIG_IKCONFIG_PROC=3Dy
>>>> +CONFIG_LOG_BUF_SHIFT=3D14
>>>> +CONFIG_CGROUPS=3Dy
>>>> +CONFIG_MEMCG=3Dy
>>>> +CONFIG_MEMCG_KMEM=3Dy
>>>> +CONFIG_CGROUP_SCHED=3Dy
>>>> +CONFIG_CGROUP_FREEZER=3Dy
>>>> +CONFIG_CGROUP_DEVICE=3Dy
>>>> +CONFIG_CGROUP_CPUACCT=3Dy
>>>> +CONFIG_NAMESPACES=3Dy
>>>> +CONFIG_USER_NS=3Dy
>>>> +CONFIG_BLK_DEV_INITRD=3Dy
>>>> +CONFIG_INITRAMFS_SOURCE=3D"arch/mips/boot/ramdisk.cpio.gz"
>>>> +CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy
>>>> +CONFIG_SYSCTL_SYSCALL=3Dy
>>>> +CONFIG_KALLSYMS_ALL=3Dy
>>>> +CONFIG_EMBEDDED=3Dy
>>>> +# CONFIG_VM_EVENT_COUNTERS is not set
>>>> +# CONFIG_COMPAT_BRK is not set
>>>> +CONFIG_SLAB=3Dy
>>>> +CONFIG_MACH_INGENIC=3Dy
>>>> +CONFIG_X1000_CU1000=3Dy
>>>> +CONFIG_HIGHMEM=3Dy
>>>> +CONFIG_HZ_100=3Dy
>>>> +CONFIG_HZ=3D100
>>>
>>> This line looks malformed.
>>
>> Ok, I'll remove it in v7.
>>
>>>
>>>> +# CONFIG_SECCOMP is not set
>>>> +# CONFIG_SUSPEND is not set
>>>> +# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
>>>> +# CONFIG_COMPACTION is not set
>>>> +CONFIG_CMA=3Dy
>>>> +CONFIG_CMA_AREAS=3D7
>>>> +CONFIG_UEVENT_HELPER=3Dy
>>>> +CONFIG_UEVENT_HELPER_PATH=3D"/sbin/hotplug"
>>>> +CONFIG_DEVTMPFS=3Dy
>>>> +# CONFIG_FW_LOADER is not set
>>>> +# CONFIG_ALLOW_DEV_COREDUMP is not set
>>>> +# CONFIG_INPUT_MOUSEDEV is not set
>>>> +# CONFIG_INPUT_KEYBOARD is not set
>>>> +# CONFIG_INPUT_MOUSE is not set
>>>> +# CONFIG_SERIO is not set
>>>> +CONFIG_VT_HW_CONSOLE_BINDING=3Dy
>>>> +CONFIG_LEGACY_PTY_COUNT=3D2
>>>> +CONFIG_SERIAL_EARLYCON=3Dy
>>>> +CONFIG_SERIAL_8250=3Dy
>>>> +CONFIG_SERIAL_8250_CONSOLE=3Dy
>>>> +CONFIG_SERIAL_8250_NR_UARTS=3D3
>>>> +CONFIG_SERIAL_8250_RUNTIME_UARTS=3D3
>>>> +CONFIG_SERIAL_8250_INGENIC=3Dy
>>>> +CONFIG_SERIAL_OF_PLATFORM=3Dy
>>>> +# CONFIG_HW_RANDOM is not set
>>>> +CONFIG_GPIO_SYSFS=3Dy
>>>> +# CONFIG_HWMON is not set
>>>> +# CONFIG_LCD_CLASS_DEVICE is not set
>>>> +# CONFIG_BACKLIGHT_CLASS_DEVICE is not set
>>>> +# CONFIG_VGA_CONSOLE is not set
>>>> +# CONFIG_HID is not set
>>>> +# CONFIG_USB_SUPPORT is not set
>>>> +# CONFIG_IOMMU_SUPPORT is not set
>>>> +CONFIG_NVMEM=3Dy
>>>> +CONFIG_NVMEM_SYSFS=3Dy
>>>> +CONFIG_EXT4_FS=3Dy
>>>> +# CONFIG_DNOTIFY is not set
>>>> +CONFIG_PROC_KCORE=3Dy
>>>> +# CONFIG_PROC_PAGE_MONITOR is not set
>>>> +CONFIG_TMPFS=3Dy
>>>> +CONFIG_CONFIGFS_FS=3Dy
>>>> +CONFIG_NLS=3Dy
>>>> +CONFIG_NLS_CODEPAGE_936=3Dy
>>>> +CONFIG_NLS_CODEPAGE_950=3Dy
>>>> +CONFIG_NLS_ASCII=3Dy
>>>> +CONFIG_NLS_ISO8859_1=3Dy
>>>> +CONFIG_NLS_UTF8=3Dy
>>>> +CONFIG_CRYPTO_ECHAINIV=3Dy
>>>> +CONFIG_CRYPTO_AES=3Dy
>>>> +CONFIG_CRYPTO_DEFLATE=3Dy
>>>> +CONFIG_CRYPTO_LZO=3Dy
>>>> +CONFIG_PRINTK_TIME=3Dy
>>>> +CONFIG_CONSOLE_LOGLEVEL_DEFAULT=3D15
>>>> +CONFIG_CONSOLE_LOGLEVEL_QUIET=3D15
>>>> +CONFIG_MESSAGE_LOGLEVEL_DEFAULT=3D7
>>>> +CONFIG_DEBUG_INFO=3Dy
>>>> +CONFIG_STRIP_ASM_SYMS=3Dy
>>>> +CONFIG_DEBUG_FS=3Dy
>>>> +CONFIG_MAGIC_SYSRQ=3Dy
>>>> +CONFIG_PANIC_ON_OOPS=3Dy
>>>> +CONFIG_PANIC_TIMEOUT=3D10
>>>> +# CONFIG_SCHED_DEBUG is not set
>>>> +# CONFIG_DEBUG_PREEMPT is not set
>>>> +CONFIG_STACKTRACE=3Dy
>>>> +# CONFIG_FTRACE is not set
>>>> +CONFIG_CMDLINE_BOOL=3Dy
>>>> +CONFIG_CMDLINE=3D"console=3DttyS2,115200n8 mem=3D32M@0x0 earlycon=20
>>>> =7F=7Fclk_ignore_unused"
>>>
>>> You already specify the stdout-path in the devicetree, no need to=20
>>> pass =7Fthe "console" parameter.
>>>
>>
>> According the test log , if remove "console=3DttyS2,115200n8", serial=20
>> will not
>> initialized and will stuck after:
>>
>> [    0.016815] printk: bootconsole [x1000_uart0] disabled
>>
>> if remove both "console=3DttyS2,115200n8" and "earlycon" it will stuck=
=20
>> after:
>>
>> Starting kernel ...
>>
>> So I think both the "earlycon" and the "console=3DttyS2,115200n8=20
>> earlycon" should be retained.
>
> There must be something wrong with your kernel config. It works here.
>
> Use this as your stdout-path: "serial2:115200n8", unset=20
> CONFIG_CMDLINE_OVERRIDE, enable MIPS_CMDLINE_DTB_EXTEND, and just use=20
> "earlycon clk_ignore_unused" in the devicetree's bootargs. That should=20
> do it.
>

It works, I will change it in v6.

>>
>>> For the "mem" parameter, it's already set in the devicetree, so no=20
>>> =7Fneed to set it again here.
>>> Besides, in the devicetree it is set to 64 MiB.
>>
>> Ok, I'll remove them in v7.
>>
>>>
>>> Why is clk_ignore_unused needed?
>>
>> In fact, I also don't know why "clk_ignore_unused" needed.
>> This part of the parameter is copied from ci20_defconfig,
>> but according to the test, if remove "clk_ignore_unused",
>> it will stuck after :
>>
>> [    0.374361] printk: bootconsole [x1000_uart0] disabled
>>
>> Differeent from the case where "console=3DttyS2,115200n8" is removed,
>> the serial is successfully initialized this time.
>>
>> So I think "clk_ignore_unused" should be retained.
>
> It locks up because Linux disables a clock that is required for the=20
> system. This clock should be requested and enabled by a client driver.=20
> Could you investigate which clock is the problem?
>

I also don't have any good ideas now, but I will try to investigate it.

Thanks and best regards!

> @Paul Burton: do you remember why it was needed on CI20?
>
> In the meantime I suppose "clk_ignore_unused" is fine.
>
> Cheers,
> -Paul
>
>>>
>>>> +CONFIG_CMDLINE_OVERRIDE=3Dy
>>>> diff --git a/arch/mips/jz4740/Kconfig b/arch/mips/jz4740/Kconfig
>>>> index 6b96844..ccaf507 100644
>>>> --- a/arch/mips/jz4740/Kconfig
>>>> +++ b/arch/mips/jz4740/Kconfig
>>>> @@ -16,6 +16,10 @@ config JZ4780_CI20
>>>>      bool "MIPS Creator CI20"
>>>>      select MACH_JZ4780
>>>>
>>>> +config X1000_CU1000
>>>> +    bool "YSH & ATIL General Module CU1000"
>>>> +    select MACH_X1000
>>>> +
>>>>  endchoice
>>>>
>>>>  config MACH_JZ4740
>>>> --=20
>>>> 2.7.4
>>>>
>>>>
>>>
>>>
>>
>>
>>
>
>



