Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 614F934DE83
	for <lists+linux-mips@lfdr.de>; Tue, 30 Mar 2021 04:36:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230122AbhC3Cfn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Mar 2021 22:35:43 -0400
Received: from mail.loongson.cn ([114.242.206.163]:37414 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229911AbhC3Cfk (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 29 Mar 2021 22:35:40 -0400
Received: from [10.130.0.65] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Ax7chwjmJgMTACAA--.2026S3;
        Tue, 30 Mar 2021 10:35:29 +0800 (CST)
Subject: Re: [PATCH] MIPS: Loongson64: enable CONFIG_USB_SERIAL_PL2303
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <20210329071558.3492-1-zhangqing@loongson.cn>
 <b48ce495-129b-4e07-8d74-d1231073235b@www.fastmail.com>
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        linux-kernel@vger.kernel.org
From:   zhangqing <zhangqing@loongson.cn>
Message-ID: <69cc8399-1a1a-a75e-1f43-6359188592e9@loongson.cn>
Date:   Tue, 30 Mar 2021 10:35:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <b48ce495-129b-4e07-8d74-d1231073235b@www.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Ax7chwjmJgMTACAA--.2026S3
X-Coremail-Antispam: 1UD129KBjvJXoWxXryfZr4fXF1kZw4kJw4xJFb_yoW5Zw1rpF
        yxArWDCF4kGFn5WFsFvFykWw48JF9xJrn2va18GryxtF93Z3yqvr1vy3ZrJws7Xr1kJa1F
        vFyfKa9agF4Iy37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvqb7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
        vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
        Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJV
        W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG
        8wCY02Avz4vE14v_Gr1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2
        IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v2
        6r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2
        IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E
        87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0x
        ZFpf9x07j1VbkUUUUU=
X-CM-SenderInfo: x2kd0wptlqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 03/30/2021 09:48 AM, Jiaxun Yang wrote:
>
> On Mon, Mar 29, 2021, at 3:15 PM, Qing Zhang wrote:
>> When using the Loongson-3A4000 machine for serial port debugging,
>> there is no /dev/ttyUSB* output, which makes the serial port unavailable,
>> For convenience, we open this configuration.
>>
>> zhangqing@loongson-pc:~$ cat /sys/firmware/lefi/boardinfo
>> Board Info
>> Manufacturer		: THTF
>> Board Name		: THTF-LS3A4000-7A1000-ML4A
>> Family			: LOONGSON3
>>
>> BIOS Info
>> Vendor			: ZD tech
>> Version			: ZD tech-V2.1.1
>> ROM Size		: 4 KB
>> Release Date		: 2020-06-29
>>
>> zhangqing@loongson-pc:~$ lsusb
>> Bus 006 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
>> Bus 005 Device 003: ID 093a:2510 Pixart Imaging, Inc. Optical Mouse
>> Bus 005 Device 002: ID 0c45:760b Microdia USB Keyboard
>> Bus 005 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
>> Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
>> Bus 004 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
>> Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
>> Bus 003 Device 003: ID 067b:2303 Prolific Technology, Inc. PL2303 Serial Port
>> Bus 003 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
>>
>> Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
> Please, don't add random stuff to defconfig.
> Carry it locally in your config as the device doesn't come with the borad, it's your accessory.

Hi, jiaxun

Thank you for your reply:-)，

PL2303 is a commonly used accessory,

I see that other platforms are turned on by default, so I also enabled it.

eg:

arch/powerpc/configs/g5_defconfig:191:CONFIG_USB_SERIAL_PL2303=m
arch/powerpc/configs/ppc6xx_defconfig:902:CONFIG_USB_SERIAL_PL2303=m
arch/mips/configs/rm200_defconfig:310:CONFIG_USB_SERIAL_PL2303=m
arch/mips/configs/loongson3_defconfig:323:CONFIG_USB_SERIAL_PL2303=m
arch/mips/configs/mtx1_defconfig:559:CONFIG_USB_SERIAL_PL2303=m
arch/mips/configs/pistachio_defconfig:240:CONFIG_USB_SERIAL_PL2303=m
arch/mips/configs/loongson1c_defconfig:88:CONFIG_USB_SERIAL_PL2303=m
arch/mips/configs/loongson1b_defconfig:87:CONFIG_USB_SERIAL_PL2303=m
arch/arm/configs/spitz_defconfig:183:CONFIG_USB_SERIAL_PL2303=m
arch/arm/configs/s3c2410_defconfig:323:CONFIG_USB_SERIAL_PL2303=y
arch/arm/configs/omap2plus_defconfig:430:CONFIG_USB_SERIAL_PL2303=m
arch/arm/configs/at91_dt_defconfig:166:CONFIG_USB_SERIAL_PL2303=y
arch/arm/configs/s3c6400_defconfig:57:CONFIG_USB_SERIAL_PL2303=m
arch/arm/configs/corgi_defconfig:189:CONFIG_USB_SERIAL_PL2303=m
arch/arm/configs/sama5_defconfig:183:CONFIG_USB_SERIAL_PL2303=y
arch/arm/configs/pxa_defconfig:572:CONFIG_USB_SERIAL_PL2303=m
arch/arm/configs/ep93xx_defconfig:101:CONFIG_USB_SERIAL_PL2303=y
arch/arm/configs/omap1_defconfig:185:CONFIG_USB_SERIAL_PL2303=y
arch/arm/configs/badge4_defconfig:90:CONFIG_USB_SERIAL_PL2303=m
arch/sh/configs/landisk_defconfig:91:CONFIG_USB_SERIAL_PL2303=m
arch/sh/configs/titan_defconfig:218:CONFIG_USB_SERIAL_PL2303=m

Thanks,

Qing

>
> Thanks.
>

