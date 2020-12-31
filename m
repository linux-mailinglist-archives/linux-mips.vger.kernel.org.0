Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76F072E8130
	for <lists+linux-mips@lfdr.de>; Thu, 31 Dec 2020 17:13:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727042AbgLaQN1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 31 Dec 2020 11:13:27 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:49681 "EHLO
        wnew1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727040AbgLaQN1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 31 Dec 2020 11:13:27 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.west.internal (Postfix) with ESMTP id 4BA441CE7;
        Thu, 31 Dec 2020 11:12:40 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Thu, 31 Dec 2020 11:12:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=J
        TeXXkB7Yz01QZ/0Eiu8gvuqDLPnPVcULKzyYYZHko0=; b=k3TRzJYNEP7tzXIyT
        c0XTvrHdVbY2jhErTxNZOCNf3t2DZCePbPSa4shXOkTETBb4xbGyu+er73CKOMBQ
        bW9UlX1Mdw5xgTil8bsH4TacYm14qNTOnatCoFX686VNTvO2cipBoVY1MwhyyK/u
        q1MyI7wc/llWeaXD+Pt92JQ88dmf5CBJQ/b0dqB0z82BrPM6KoncOPCIfAzNAS4z
        811tQsxSJjMouGFHCQ6BnZEE1aGNotUOu1tIKhz/s4td+PaEjkLQ/3fF+RV8yUMo
        9qlxat+9e+Mu4UAddZRyZgbXBvEsHuB/OaG9NKX5X/vq2Hw5Yv/VZgMJ36UyJIF8
        s3jSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=JTeXXkB7Yz01QZ/0Eiu8gvuqDLPnPVcULKzyYYZHk
        o0=; b=PSQ4nb1H+a/xtft7bV8g7H8qfxHX3O7LHWmtp4WPJ2nwtrTVaC5OJusG8
        VP1Gy71nkswN1/UXdwvH2Gne8tcyO9Hp9Y/mtKmjg2mROYBS/mbn4vRYurs5RUbP
        Hul7B2Xa0aA0tCPk3KID4/lSQg5Qetc2fwHf9weiUd3NnPoS3MxwOC6dItqulyqJ
        xSbsHDXjacTzrzhUZkEvZsLqqVm2x718RJbMYy76WTJPV1ZqaQC78WVEx8/Rt4v2
        bQ/NACR+UuIM1yAjKAF6T38OjxAySBlyD43Rr/tD7wsn/rvfPh8U/GXjjUr3zduS
        oyguXCxLQBoxGp/e/44pvF9+ZBw4A==
X-ME-Sender: <xms:cvjtX7JRdGPkauonBE9FqAKwPwC58-AIFQtwjAt6a-_n-mtXmobP1w>
    <xme:cvjtX_LQ-s2ma_pFhDNa3p9EWSDy61Go93-6FvADdYjpLe-2IFt9UlOSA_PRFFLiz
    7RdjmAmHogL9mK_4a8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddvhedgkeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeeihffghfeikedugeejvefgffevgeevgeehfffhudeiieffffev
    ffeugeevfefgfeenucfkphepiedtrddujeejrddukeelrddujedunecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghes
    fhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:cvjtXzu7_H0r-br4-3Coe3cYoYcvjdrNC9BEwonAVLLbox4T45imbg>
    <xmx:cvjtX0YmGr5TOGVSArsFSCT3SW-tffDUa2soD7VFb4mpb4O89udgaA>
    <xmx:cvjtXyb0UKiCKg_NrhzdtVMS7056_GhMxcewRSs5mN8WIxrMIgp1fg>
    <xmx:d_jtX4lkvS0a2y3Q-8K-kOCRWJIx56K6_uu_ZHnrOPvtcZgFur3IE5IHWLvopzXb>
Received: from [192.168.1.203] (unknown [60.177.189.171])
        by mail.messagingengine.com (Postfix) with ESMTPA id 6A25B1080057;
        Thu, 31 Dec 2020 11:12:27 -0500 (EST)
Subject: Re: [PATCH 1/3] MIPS: Add vulnerabilities infrastructure
To:     WANG Xuerui <kernel@xen0n.name>,
        "open list:MIPS" <linux-mips@vger.kernel.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>, Paul Burton <paulburton@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Huacai Chen <chenhc@lemote.com>, YunQiang Su <syq@debian.org>,
        Liangliang Huang <huanglllzu@gmail.com>,
        linux-kernel@vger.kernel.org
References: <20201230032314.10042-1-jiaxun.yang@flygoat.com>
 <7bce9302-2921-ca0a-73b1-b094f92e21cc@xen0n.name>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <d82ec97f-d171-4217-d0c5-0a96b6510284@flygoat.com>
Date:   Fri, 1 Jan 2021 00:12:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <7bce9302-2921-ca0a-73b1-b094f92e21cc@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



在 2020/12/31 23:38, WANG Xuerui 写道:
> Hi Jiaxun,
>
> Overall a nice step towards a more conformant arch/mips! Some nits 
> below though.
>
>
> On 12/30/20 11:23 AM, Jiaxun Yang wrote:
>> Add infrastructure to display CPU vulnerabilities.
>> As most MIPS CPU vendors are dead today and we can't confirm
>> vulnerabilities states with them, we'll display vulnerabilities
>> as "Unknown" by default and override them in cpu-probe.c
> Add trailing period.
>>
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---
>>   arch/mips/Kconfig                |  1 +
>>   arch/mips/include/asm/cpu-info.h |  5 ++++
>>   arch/mips/include/asm/cpu.h      |  7 +++++
>>   arch/mips/kernel/Makefile        |  2 +-
>>   arch/mips/kernel/vulnbl.c        | 46 ++++++++++++++++++++++++++++++++
>>   5 files changed, 60 insertions(+), 1 deletion(-)
>>   create mode 100644 arch/mips/kernel/vulnbl.c
>>
>> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
>> index ef5b2a177b1b..524053b8f769 100644
>> --- a/arch/mips/Kconfig
>> +++ b/arch/mips/Kconfig
>> @@ -24,6 +24,7 @@ config MIPS
>>       select GENERIC_CLOCKEVENTS
>>       select GENERIC_CMOS_UPDATE
>>       select GENERIC_CPU_AUTOPROBE
>> +    select GENERIC_CPU_VULNERABILITIES
>>       select GENERIC_GETTIMEOFDAY
>>       select GENERIC_IOMAP
>>       select GENERIC_IRQ_PROBE
>> diff --git a/arch/mips/include/asm/cpu-info.h 
>> b/arch/mips/include/asm/cpu-info.h
>> index a600670d00e9..1a964dbfc0a8 100644
>> --- a/arch/mips/include/asm/cpu-info.h
>> +++ b/arch/mips/include/asm/cpu-info.h
>> @@ -106,6 +106,11 @@ struct cpuinfo_mips {
>>       unsigned int        guestid_mask;
>>       unsigned int        guestid_cache;
>>   +    /* Vulnerabilities */
>> +    unsigned int        vulnerabilities; /* Vulnerabilities states 
>> that we known */
>> +    unsigned int        vulnerable; /* Vulnerabilities affated */
>> +    unsigned int        mitigations; /* Mitigations */
>
> Could you make the field names a little clearer? Like "known_mask", 
> "affected_mask" and "mitigated_mask"?
>
> Also I wonder if removing the first mask is okay, since if a bit is 
> neither "affected" nor "mitigated" then it must belong to the 
> "unknown" case.

Actually we have no way to mitigate them in kernel for now :-(


>
>> +
>>   #ifdef CONFIG_CPU_LOONGSON3_CPUCFG_EMULATION
>>       /* CPUCFG data for this CPU, synthesized at probe time.
>>        *
>> diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
>> index f5b04e8f6061..3414c9f5464e 100644
>> --- a/arch/mips/include/asm/cpu.h
>> +++ b/arch/mips/include/asm/cpu.h
>> @@ -447,4 +447,11 @@ enum cpu_type_enum {
>>   #define MIPS_ASE_LOONGSON_EXT    0x00002000 /* Loongson EXTensions */
>>   #define MIPS_ASE_LOONGSON_EXT2    0x00004000 /* Loongson EXTensions 
>> R2 */
>>   +/*
>> + * CPU security vulnerabilities
>> + */
>> +#define MIPS_VULNBL_MELTDOWN    BIT(0)
>> +#define MIPS_VULNBL_SPECTRE_V1    BIT(1)
>> +#define MIPS_VULNBL_SPECTRE_V2    BIT(2)
> Looking at the arch/x86 vulnerabilities code, I tend to think that 
> "VULNBL" is not (rather ugly) shorthand for "vulnerability", but 
> "vulnerability blacklist" (!), because they have "VULNWL" for 
> apparently "whitelist". So I suggest writing out "VULNERABILITY" fully 
> for clarity.
>> +
>>   #endif /* _ASM_CPU_H */
>> diff --git a/arch/mips/kernel/Makefile b/arch/mips/kernel/Makefile
>> index 13a26d254829..39abc8ead5e0 100644
>> --- a/arch/mips/kernel/Makefile
>> +++ b/arch/mips/kernel/Makefile
>> @@ -8,7 +8,7 @@ extra-y        := head.o vmlinux.lds
>>   obj-y        += cmpxchg.o cpu-probe.o branch.o elf.o entry.o 
>> genex.o idle.o irq.o \
>>              process.o prom.o ptrace.o reset.o setup.o signal.o \
>>              syscall.o time.o topology.o traps.o unaligned.o watch.o \
>> -           vdso.o cacheinfo.o
>> +           vdso.o cacheinfo.o vulnbl.o
>>     ifdef CONFIG_FUNCTION_TRACER
>>   CFLAGS_REMOVE_ftrace.o = -pg
>> diff --git a/arch/mips/kernel/vulnbl.c b/arch/mips/kernel/vulnbl.c
>> new file mode 100644
>> index 000000000000..fc73da6214fe
>> --- /dev/null
>> +++ b/arch/mips/kernel/vulnbl.c
> Same with this filename.
>> @@ -0,0 +1,46 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + *  Copyright (C) 2020, Jiaxun Yang <jiaxun.yang@flygoat.com>
>> + *  MIPS CPU vulnerabilities
>> + */
>> +
>> +#include <linux/device.h>
>> +
>> +#include <asm/cpu-info.h>
>> +#include <asm/cpu.h>
>> +
>> +ssize_t cpu_show_meltdown(struct device *dev,
>> +              struct device_attribute *attr, char *buf)
>> +{
>> +    if (!(boot_cpu_data.vulnerabilities & MIPS_VULNBL_MELTDOWN))
>> +        return sprintf(buf, "Unknown\n");
>> +
>> +    if (!(boot_cpu_data.vulnerable & MIPS_VULNBL_MELTDOWN))
>> +        return sprintf(buf, "Not affected\n");
>> +
>> +    return sprintf(buf, "Affected\n");
> Be consistent with other arches and use "Vulnerable"?
>> +}
>> +
>> +ssize_t cpu_show_spectre_v1(struct device *dev,
>> +                struct device_attribute *attr, char *buf)
>> +{
>> +    if (!(boot_cpu_data.vulnerabilities & MIPS_VULNBL_SPECTRE_V1))
>> +        return sprintf(buf, "Unknown\n");
>> +
>> +    if (!(boot_cpu_data.vulnerable & MIPS_VULNBL_SPECTRE_V1))
>> +        return sprintf(buf, "Not affected\n");
>> +
>> +    return sprintf(buf, "Affected\n");
> Same as above.
>> +}
>> +
>> +ssize_t cpu_show_spectre_v2(struct device *dev,
>> +                   struct device_attribute *attr, char *buf)
>> +{
>> +    if (!(boot_cpu_data.vulnerabilities & MIPS_VULNBL_SPECTRE_V2))
>> +        return sprintf(buf, "Unknown\n");
>> +
>> +    if (!(boot_cpu_data.vulnerable & MIPS_VULNBL_SPECTRE_V2))
>> +        return sprintf(buf, "Not affected\n");
>> +
>> +    return sprintf(buf, "Affected\n");
> Same as above.
>> +}

