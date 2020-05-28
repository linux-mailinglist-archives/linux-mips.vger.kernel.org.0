Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E0891E52E4
	for <lists+linux-mips@lfdr.de>; Thu, 28 May 2020 03:24:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726351AbgE1BYn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 May 2020 21:24:43 -0400
Received: from mail.loongson.cn ([114.242.206.163]:43928 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725747AbgE1BYm (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 27 May 2020 21:24:42 -0400
Received: from [10.130.0.52] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr2vVEs9eUek5AA--.875S3;
        Thu, 28 May 2020 09:24:39 +0800 (CST)
Subject: Re: [PATCH] MIPS: DTS: Only build subdir of current platform
To:     Guenter Roeck <linux@roeck-us.net>
References: <1590027306-2137-1-git-send-email-yangtiezhu@loongson.cn>
 <20200527231055.GA141265@roeck-us.net>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <1f29c8f8-730c-d8d4-c8ed-cdf9f02e981f@loongson.cn>
Date:   Thu, 28 May 2020 09:24:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20200527231055.GA141265@roeck-us.net>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dxr2vVEs9eUek5AA--.875S3
X-Coremail-Antispam: 1UD129KBjvJXoWxJF4xuF1xXr4UtFy3ZrW7XFb_yoWrXw4kpr
        W3Aa1qqayxWF1Syr1fJrykWryfAr45JFZruFs8Gr17Aa9F9a40vr1ftFsayr1UZrWrta4I
        grWfWFW7AFn5AaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvj14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
        4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
        Yx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
        WUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07Al
        zVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
        0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1l
        IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
        AFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_
        Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfU5W
        lkUUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 05/28/2020 07:10 AM, Guenter Roeck wrote:
> On Thu, May 21, 2020 at 10:15:06AM +0800, Tiezhu Yang wrote:
>> Add config check in Makefile to only build the subdir of current platform.
>>
>> E.g. without this patch:
>>
>>    AR      arch/mips/built-in.a
>>    AR      arch/mips/boot/dts/brcm/built-in.a
>>    AR      arch/mips/boot/dts/cavium-octeon/built-in.a
>>    AR      arch/mips/boot/dts/img/built-in.a
>>    AR      arch/mips/boot/dts/ingenic/built-in.a
>>    AR      arch/mips/boot/dts/lantiq/built-in.a
>>    DTC     arch/mips/boot/dts/loongson/loongson3_4core_rs780e.dtb
>>    DTB     arch/mips/boot/dts/loongson/loongson3_4core_rs780e.dtb.S
>>    AS      arch/mips/boot/dts/loongson/loongson3_4core_rs780e.dtb.o
>>    DTC     arch/mips/boot/dts/loongson/loongson3_8core_rs780e.dtb
>>    DTB     arch/mips/boot/dts/loongson/loongson3_8core_rs780e.dtb.S
>>    AS      arch/mips/boot/dts/loongson/loongson3_8core_rs780e.dtb.o
>>    AR      arch/mips/boot/dts/loongson/built-in.a
>>    AR      arch/mips/boot/dts/mscc/built-in.a
>>    AR      arch/mips/boot/dts/mti/built-in.a
>>    AR      arch/mips/boot/dts/netlogic/built-in.a
>>    AR      arch/mips/boot/dts/ni/built-in.a
>>    AR      arch/mips/boot/dts/pic32/built-in.a
>>    AR      arch/mips/boot/dts/qca/built-in.a
>>    AR      arch/mips/boot/dts/ralink/built-in.a
>>    AR      arch/mips/boot/dts/xilfpga/built-in.a
>>    AR      arch/mips/boot/dts/built-in.a
>>
>> With this patch:
>>
>>    AR      arch/mips/built-in.a
>>    DTC     arch/mips/boot/dts/loongson/loongson3_4core_rs780e.dtb
>>    DTB     arch/mips/boot/dts/loongson/loongson3_4core_rs780e.dtb.S
>>    AS      arch/mips/boot/dts/loongson/loongson3_4core_rs780e.dtb.o
>>    DTC     arch/mips/boot/dts/loongson/loongson3_8core_rs780e.dtb
>>    DTB     arch/mips/boot/dts/loongson/loongson3_8core_rs780e.dtb.S
>>    AS      arch/mips/boot/dts/loongson/loongson3_8core_rs780e.dtb.o
>>    AR      arch/mips/boot/dts/loongson/built-in.a
>>    AR      arch/mips/boot/dts/built-in.a
>>
>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> With this patch applied, boston.dtb is no longer built with
> 64r6el_defconfig, even though 64r6el_defconfig enables
> CONFIG_FIT_IMAGE_FDT_BOSTON=y. This is because the img
> subdirectory is now only included if CONFIG_MACH_PISTACHIO=y,
> but that is not the case with 64r6el_defconfig.

Thanks for your report, sorry for this issue.

I received the build error report yesterday from
kbuild test robot <lkp@intel.com>, I will fix it.

>
> Please revisit.
>
> Guenter
>
>> ---
>>   arch/mips/boot/dts/Makefile | 28 ++++++++++++++--------------
>>   1 file changed, 14 insertions(+), 14 deletions(-)
>>
>> diff --git a/arch/mips/boot/dts/Makefile b/arch/mips/boot/dts/Makefile
>> index d429a69..dce32d1 100644
>> --- a/arch/mips/boot/dts/Makefile
>> +++ b/arch/mips/boot/dts/Makefile
>> @@ -1,17 +1,17 @@
>>   # SPDX-License-Identifier: GPL-2.0
>> -subdir-y	+= brcm
>> -subdir-y	+= cavium-octeon
>> -subdir-y	+= img
>> -subdir-y	+= ingenic
>> -subdir-y	+= lantiq
>> -subdir-y	+= loongson
>> -subdir-y	+= mscc
>> -subdir-y	+= mti
>> -subdir-y	+= netlogic
>> -subdir-y	+= ni
>> -subdir-y	+= pic32
>> -subdir-y	+= qca
>> -subdir-y	+= ralink
>> -subdir-y	+= xilfpga
>> +subdir-$(CONFIG_BMIPS_GENERIC)		+= brcm
>> +subdir-$(CONFIG_CAVIUM_OCTEON_SOC)	+= cavium-octeon
>> +subdir-$(CONFIG_MACH_PISTACHIO)		+= img
>> +subdir-$(CONFIG_MACH_INGENIC)		+= ingenic
>> +subdir-$(CONFIG_LANTIQ)			+= lantiq
>> +subdir-$(CONFIG_MACH_LOONGSON64)	+= loongson
>> +subdir-$(CONFIG_MSCC_OCELOT)		+= mscc
>> +subdir-$(CONFIG_MIPS_MALTA)		+= mti
>> +subdir-$(CONFIG_NLM_XLP_BOARD)		+= netlogic
>> +subdir-$(CONFIG_FIT_IMAGE_FDT_NI169445)	+= ni
>> +subdir-$(CONFIG_MACH_PIC32)		+= pic32
>> +subdir-$(CONFIG_ATH79)			+= qca
>> +subdir-$(CONFIG_RALINK)			+= ralink
>> +subdir-$(CONFIG_FIT_IMAGE_FDT_XILFPGA)	+= xilfpga
>>   
>>   obj-$(CONFIG_BUILTIN_DTB)	:= $(addsuffix /, $(subdir-y))
>> -- 
>> 2.1.0
>>

