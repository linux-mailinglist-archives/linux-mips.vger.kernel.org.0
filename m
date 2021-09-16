Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77E2740D37B
	for <lists+linux-mips@lfdr.de>; Thu, 16 Sep 2021 08:54:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234516AbhIPGzu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Sep 2021 02:55:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:37896 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234539AbhIPGzt (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 16 Sep 2021 02:55:49 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E36F561130;
        Thu, 16 Sep 2021 06:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631775269;
        bh=Ol1XFd62XpvtwjSoE4VloV0AF34Y5shkTI/ViuSsdLo=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=OAVFoWAxrGMI7fZOS50r73OnNiCQKnzKHeEcCiYsxSOjL16q6UDKegWRRVIHC9hrL
         bhnD0qQHjqimKu8I15pJqOgeeuAeJD0JEilgZx+cUEhv588hT96G9e3gMpYvVA7olA
         HE1fwNroJmBXrZJWdA4zv6XFrwAy/HJOfipE5K7UNvl1cRsvsokECE0mJdu54AbccO
         QkuoA03inJO8sGbrxNQyIQEi/8wfJx07TSiNYrghGJI16eHD4QWyyCWp42V5GeRkf7
         zTY3XJR6whJSmJ0U3VeDc+mRxmN2+AVkvE7b7+ofeAHO/ANgRuP3vBzVb/VBCFukZF
         jj2kaqh+Iz+ug==
Subject: Re: [PATCH v3] MIPS: add support for buggy MT7621S core detection
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>, liwei391@huawei.com,
        macro@orcam.me.uk, nbd@nbd.name,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        yangtiezhu@loongson.cn
References: <4d9e3b39-7caa-d372-5d7b-42dcec36fec7@kernel.org>
 <CAMhs-H-_6fH00g4tkF7KBgO_HvA1c6QVV8ph2gSXFaoVUAZRUQ@mail.gmail.com>
From:   Greg Ungerer <gerg@kernel.org>
Message-ID: <39287d82-0d02-92e8-d12a-085998d16acf@kernel.org>
Date:   Thu, 16 Sep 2021 16:54:25 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAMhs-H-_6fH00g4tkF7KBgO_HvA1c6QVV8ph2gSXFaoVUAZRUQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Sergio,

On 16/9/21 4:33 pm, Sergio Paracuellos wrote:
> On Thu, Sep 16, 2021 at 4:57 AM Greg Ungerer <gerg@kernel.org> wrote:
>>
>> Hi Ilya,
>>
>>> Most MT7621 SoCs have 2 cores, which is detected and supported properly
>>> by CPS.
>>>
>>> Unfortunately, MT7621 SoC has a less common S variant with only one core.
>>> On MT7621S, GCR_CONFIG still reports 2 cores, which leads to hangs when
>>> starting SMP. CPULAUNCH registers can be used in that case to detect the
>>> absence of the second core and override the GCR_CONFIG PCORES field.
>>>
>>> Rework a long-standing OpenWrt patch to override the value of
>>> mips_cps_numcores on single-core MT7621 systems.
>>>
>>> Tested on a dual-core MT7621 device (Ubiquiti ER-X) and a single-core
>>> MT7621 device (Netgear R6220).
>>
>> This is breaking core detection on my MT7621 based platforms.
>> I only get 2 cores detected now running 5.13. Reverting this change gives
>> me 4 cores back.
> 
> I also have a 4 core mt7621 based board and this patch change does not
> have problems for me. Let me know if you need me to check something
> from my board.
> 
> I noticed that on boot the following message appears and might be
> related with the way used here to make the core number detection:
> 
> [    0.000000] VPE topology {2,2} total 4
> 
> Is this the same for your board?

When booting with this patch applied I get:

     VPE topology {2} total 2

with patch reverted I get:

     VPE topology {2,2} total 4

Regards
Greg


> Best regards,
>       Sergio Paracuellos
> 
>>
>>   From a fully working (pre-change) system I get:
>>
>> # cat /proc/cpuinfo
>> system type             : MediaTek MT7621 ver:1 eco:3
>> machine                 : Digi EX15
>> processor               : 0
>> cpu model               : MIPS 1004Kc V2.15
>> BogoMIPS                : 586.13
>> wait instruction        : yes
>> microsecond timers      : yes
>> tlb_entries             : 32
>> extra interrupt vector  : yes
>> hardware watchpoint     : yes, count: 4, address/irw mask: [0x0ffc, 0x0ffc, 0x0ffb, 0x0ffb]
>> isa                     : mips1 mips2 mips32r1 mips32r2
>> ASEs implemented        : mips16 dsp mt
>> shadow register sets    : 1
>> kscratch registers      : 0
>> package                 : 0
>> core                    : 0
>> VPE                     : 0
>> VCED exceptions         : not available
>> VCEI exceptions         : not available
>>
>> processor               : 1
>> cpu model               : MIPS 1004Kc V2.15
>> BogoMIPS                : 586.13
>> wait instruction        : yes
>> microsecond timers      : yes
>> tlb_entries             : 32
>> extra interrupt vector  : yes
>> hardware watchpoint     : yes, count: 4, address/irw mask: [0x0ffc, 0x0ffc, 0x0ffb, 0x0ffb]
>> isa                     : mips1 mips2 mips32r1 mips32r2
>> ASEs implemented        : mips16 dsp mt
>> shadow register sets    : 1
>> kscratch registers      : 0
>> package                 : 0
>> core                    : 0
>> VPE                     : 1
>> VCED exceptions         : not available
>> VCEI exceptions         : not available
>>
>> processor               : 2
>> cpu model               : MIPS 1004Kc V2.15
>> BogoMIPS                : 586.13
>> wait instruction        : yes
>> microsecond timers      : yes
>> tlb_entries             : 32
>> extra interrupt vector  : yes
>> hardware watchpoint     : yes, count: 4, address/irw mask: [0x0ffc, 0x0ffc, 0x0ffb, 0x0ffb]
>> isa                     : mips1 mips2 mips32r1 mips32r2
>> ASEs implemented        : mips16 dsp mt
>> shadow register sets    : 1
>> kscratch registers      : 0
>> package                 : 0
>> core                    : 1
>> VPE                     : 0
>> VCED exceptions         : not available
>> VCEI exceptions         : not available
>>
>> processor               : 3
>> cpu model               : MIPS 1004Kc V2.15
>> BogoMIPS                : 586.13
>> wait instruction        : yes
>> microsecond timers      : yes
>> tlb_entries             : 32
>> extra interrupt vector  : yes
>> hardware watchpoint     : yes, count: 4, address/irw mask: [0x0ffc, 0x0ffc, 0x0ffb, 0x0ffb]
>> isa                     : mips1 mips2 mips32r1 mips32r2
>> ASEs implemented        : mips16 dsp mt
>> shadow register sets    : 1
>> kscratch registers      : 0
>> package                 : 0
>> core                    : 1
>> VPE                     : 1
>> VCED exceptions         : not available
>> VCEI exceptions         : not available
>>
>>
>> After this patch is applied:
>>
>> # cat /proc/cpuinfo
>> system type             : MediaTek MT7621 ver:1 eco:3
>> machine                 : Digi EX15
>> processor               : 0
>> cpu model               : MIPS 1004Kc V2.15
>> BogoMIPS                : 586.13
>> wait instruction        : yes
>> microsecond timers      : yes
>> tlb_entries             : 32
>> extra interrupt vector  : yes
>> hardware watchpoint     : yes, count: 4, address/irw mask: [0x0ffc, 0x0ffc, 0x0ffb, 0x0ffb]
>> isa                     : mips1 mips2 mips32r1 mips32r2
>> ASEs implemented        : mips16 dsp mt
>> shadow register sets    : 1
>> kscratch registers      : 0
>> package                 : 0
>> core                    : 0
>> VPE                     : 0
>> VCED exceptions         : not available
>> VCEI exceptions         : not available
>>
>> processor               : 1
>> cpu model               : MIPS 1004Kc V2.15
>> BogoMIPS                : 586.13
>> wait instruction        : yes
>> microsecond timers      : yes
>> tlb_entries             : 32
>> extra interrupt vector  : yes
>> hardware watchpoint     : yes, count: 4, address/irw mask: [0x0ffc, 0x0ffc, 0x0ffb, 0x0ffb]
>> isa                     : mips1 mips2 mips32r1 mips32r2
>> ASEs implemented        : mips16 dsp mt
>> shadow register sets    : 1
>> kscratch registers      : 0
>> package                 : 0
>> core                    : 0
>> VPE                     : 1
>> VCED exceptions         : not available
>> VCEI exceptions         : not available
>>
>> Any ideas?
>>
>> Regards
>> Greg
>>
>>
>>> Original 4.14 OpenWrt patch:
>>> Link: https://git.openwrt.org/?p=openwrt/openwrt.git;a=commitdiff;h=4cdbc90a376dd0555201c1434a2081e055e9ceb7
>>> Current 5.10 OpenWrt patch:
>>> Link: https://git.openwrt.org/?p=openwrt/openwrt.git;a=blob;f=target/linux/ramips/patches-5.10/320-mt7621-core-detect-hack.patch;h=c63f0f4c1ec742e24d8480e80553863744b58f6a;hb=10267e17299806f9885d086147878f6c492cb904
>>>
>>> Suggested-by: Felix Fietkau <nbd@nbd.name>
>>> Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
>>> ---
>>>   arch/mips/include/asm/mips-cps.h | 23 ++++++++++++++++++++++-
>>>   1 file changed, 22 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/mips/include/asm/mips-cps.h b/arch/mips/include/asm/mips-cps.h
>>> index fd43d876892e..35fb8ee6dd33 100644
>>> --- a/arch/mips/include/asm/mips-cps.h
>>> +++ b/arch/mips/include/asm/mips-cps.h
>>> @@ -10,6 +10,8 @@
>>>   #include <linux/io.h>
>>>   #include <linux/types.h>
>>>
>>> +#include <asm/mips-boards/launch.h>
>>> +
>>>   extern unsigned long __cps_access_bad_size(void)
>>>        __compiletime_error("Bad size for CPS accessor");
>>>
>>> @@ -165,11 +167,30 @@ static inline uint64_t mips_cps_cluster_config(unsigned int cluster)
>>>    */
>>>   static inline unsigned int mips_cps_numcores(unsigned int cluster)
>>>   {
>>> +     unsigned int ncores;
>>> +
>>>        if (!mips_cm_present())
>>>                return 0;
>>>
>>>        /* Add one before masking to handle 0xff indicating no cores */
>>> -     return (mips_cps_cluster_config(cluster) + 1) & CM_GCR_CONFIG_PCORES;
>>> +     ncores = (mips_cps_cluster_config(cluster) + 1) & CM_GCR_CONFIG_PCORES;
>>> +
>>> +     if (IS_ENABLED(CONFIG_SOC_MT7621)) {
>>> +             struct cpulaunch *launch;
>>> +
>>> +             /*
>>> +              * Ralink MT7621S SoC is single core, but the GCR_CONFIG method
>>> +              * always reports 2 cores. Check the second core's LAUNCH_FREADY
>>> +              * flag to detect if the second core is missing. This method
>>> +              * only works before the core has been started.
>>> +              */
>>> +             launch = (struct cpulaunch *)CKSEG0ADDR(CPULAUNCH);
>>> +             launch += 2; /* MT7621 has 2 VPEs per core */
>>> +             if (!(launch->flags & LAUNCH_FREADY))
>>> +                     ncores = 1;
>>> +     }
>>> +
>>> +     return ncores;
>>>   }
>>>
>>>   /**
>>> --
>>> 2.31.1
>>
