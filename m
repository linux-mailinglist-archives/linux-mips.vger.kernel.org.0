Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B963641DA0C
	for <lists+linux-mips@lfdr.de>; Thu, 30 Sep 2021 14:41:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351031AbhI3Mne (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Sep 2021 08:43:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:43794 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1350974AbhI3Mn3 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 30 Sep 2021 08:43:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B1BC7613D1;
        Thu, 30 Sep 2021 12:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633005706;
        bh=y6mNZhDNdBoK4I1OPhJ39lKruMgCceiXglnOLxrBycU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=PpXXwQ3Iltz/5vqYJc5Sr1EdoyPUVSIsS3PoiQxjXnT+91yple5g+F61b67nFhQk/
         L/DulYNrQDLsNIlDbnjD91ERKQ1NNkmWQJZpOQ8V6Ohc52ILnmo6RZERmHwyJYCEk/
         y/ablULiJlJhZbSeOP+kxwiOUymLhv4j/ZYKqCDwq7OP6nqSrlsadc9Yg/HHYBijup
         ZAqa+Rma2CkLUgnsmKKwZeIKtNLrex1V6wj3rI3yW/Mllyi6XEgTxMMeGfXkGAf8yG
         P0LQ1RxmRinnjrzQvSub+yWjlcay+gA+Gax7cWICxvoXjuKnpYHpJ+Xq5FUL2/0j5L
         vpz5jxuIOs52Q==
Subject: Re: [PATCH v3] MIPS: add support for buggy MT7621S core detection
To:     Strontium <strntydog@gmail.com>, ilya.lipnitskiy@gmail.com
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        liwei391@huawei.com, macro@orcam.me.uk, nbd@nbd.name,
        tsbogend@alpha.franken.de, yangtiezhu@loongson.cn
References: <4d9e3b39-7caa-d372-5d7b-42dcec36fec7@kernel.org>
 <07fc9510-148a-4ae9-e240-7d5402e0e2d7@gmail.com>
From:   Greg Ungerer <gerg@kernel.org>
Message-ID: <3cc110b0-42cc-d6e0-0404-c5dfc6cd9248@kernel.org>
Date:   Thu, 30 Sep 2021 22:41:42 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <07fc9510-148a-4ae9-e240-7d5402e0e2d7@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Steven,

On 16/9/21 6:54 pm, Strontium wrote:
> Hi Greg,
> 
> I had trouble with this as well.  This line from the patch:
> 
>> if (!(launch->flags & LAUNCH_FREADY))
> 
> is checking ram which I believe is supposed to be set by the bootloader.
> On my platform it looked like the preloaded uboot wasn't setting that as
> expected.
> If you have control over your bootloader you can force this ram address
> to be what the kernel wants, or you can do what i did, because i didn't
> have that targets uboot src, and wedge before the kernel starts to force
> the ram to the required state, like so:

Well, my solution was to revert that patch locally :-)

But many people will not have control of or the desire to change
their u-boot loader. I would have figured this ends up being a
real regression for many (most?) users of this SoC.


> #define CORE0_INITIAL_CPU_STATE (0xf00)
> #define CORE_FL_OFFSET (0x1C)
> #define FLAG_LAUNCH_FREADY (1)
> 
> #define WRITEREG(r, v) *(volatile uint32_t *)(r) = v
> #define KSEG1ADDR(_x) (((_x)&0x1fffffff) | 0xa0000000)
> 
> void set_core(uint32_t core)
> {
>      uint32_t start = CORE0_INITIAL_CPU_STATE + (0x40 * core);
>      WRITEREG(KSEG1ADDR(start + CORE_FL_OFFSET), FLAG_LAUNCH_FREADY);
> }
> 
> void fix_cores(void) {
>      // Fixes the flags for each core, just before running the kernel.
>      // Means we don't have to patch the kernel check for valid CPU's.
>      for (int i = 0; i < 4; i++) {
>          set_core(i);
>      }
> }
> 
> It seems that memory section is supposed to set all the cores registers
> before the kernel runs, but i never found it did anything except that 1
> flag.
> 
> Obviously a better way would be to properly detect the number of cores
> and not rely on the boot loader to set a flag in ram, I don't know if
> that's even possible.

I can't help but think this commit is not a proper fix for this problem.

Regards
Greg


> Steven Johnson
> 
> On 16/9/21 09:56, Greg Ungerer wrote:
>> Hi Ilya,
>>
>>> Most MT7621 SoCs have 2 cores, which is detected and supported properly
>>> by CPS.
>>>
>>> Unfortunately, MT7621 SoC has a less common S variant with only one
>>> core.
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
>>
>>  From a fully working (pre-change) system I get:
>>
>> # cat /proc/cpuinfo
>> system type        : MediaTek MT7621 ver:1 eco:3
>> machine            : Digi EX15
>> processor        : 0
>> cpu model        : MIPS 1004Kc V2.15
>> BogoMIPS        : 586.13
>> wait instruction    : yes
>> microsecond timers    : yes
>> tlb_entries        : 32
>> extra interrupt vector    : yes
>> hardware watchpoint    : yes, count: 4, address/irw mask: [0x0ffc,
>> 0x0ffc, 0x0ffb, 0x0ffb]
>> isa            : mips1 mips2 mips32r1 mips32r2
>> ASEs implemented    : mips16 dsp mt
>> shadow register sets    : 1
>> kscratch registers    : 0
>> package            : 0
>> core            : 0
>> VPE            : 0
>> VCED exceptions        : not available
>> VCEI exceptions        : not available
>>
>> processor        : 1
>> cpu model        : MIPS 1004Kc V2.15
>> BogoMIPS        : 586.13
>> wait instruction    : yes
>> microsecond timers    : yes
>> tlb_entries        : 32
>> extra interrupt vector    : yes
>> hardware watchpoint    : yes, count: 4, address/irw mask: [0x0ffc,
>> 0x0ffc, 0x0ffb, 0x0ffb]
>> isa            : mips1 mips2 mips32r1 mips32r2
>> ASEs implemented    : mips16 dsp mt
>> shadow register sets    : 1
>> kscratch registers    : 0
>> package            : 0
>> core            : 0
>> VPE            : 1
>> VCED exceptions        : not available
>> VCEI exceptions        : not available
>>
>> processor        : 2
>> cpu model        : MIPS 1004Kc V2.15
>> BogoMIPS        : 586.13
>> wait instruction    : yes
>> microsecond timers    : yes
>> tlb_entries        : 32
>> extra interrupt vector    : yes
>> hardware watchpoint    : yes, count: 4, address/irw mask: [0x0ffc,
>> 0x0ffc, 0x0ffb, 0x0ffb]
>> isa            : mips1 mips2 mips32r1 mips32r2
>> ASEs implemented    : mips16 dsp mt
>> shadow register sets    : 1
>> kscratch registers    : 0
>> package            : 0
>> core            : 1
>> VPE            : 0
>> VCED exceptions        : not available
>> VCEI exceptions        : not available
>>
>> processor        : 3
>> cpu model        : MIPS 1004Kc V2.15
>> BogoMIPS        : 586.13
>> wait instruction    : yes
>> microsecond timers    : yes
>> tlb_entries        : 32
>> extra interrupt vector    : yes
>> hardware watchpoint    : yes, count: 4, address/irw mask: [0x0ffc,
>> 0x0ffc, 0x0ffb, 0x0ffb]
>> isa            : mips1 mips2 mips32r1 mips32r2
>> ASEs implemented    : mips16 dsp mt
>> shadow register sets    : 1
>> kscratch registers    : 0
>> package            : 0
>> core            : 1
>> VPE            : 1
>> VCED exceptions        : not available
>> VCEI exceptions        : not available
>>
>>
>> After this patch is applied:
>>
>> # cat /proc/cpuinfo
>> system type        : MediaTek MT7621 ver:1 eco:3
>> machine            : Digi EX15
>> processor        : 0
>> cpu model        : MIPS 1004Kc V2.15
>> BogoMIPS        : 586.13
>> wait instruction    : yes
>> microsecond timers    : yes
>> tlb_entries        : 32
>> extra interrupt vector    : yes
>> hardware watchpoint    : yes, count: 4, address/irw mask: [0x0ffc,
>> 0x0ffc, 0x0ffb, 0x0ffb]
>> isa            : mips1 mips2 mips32r1 mips32r2
>> ASEs implemented    : mips16 dsp mt
>> shadow register sets    : 1
>> kscratch registers    : 0
>> package            : 0
>> core            : 0
>> VPE            : 0
>> VCED exceptions        : not available
>> VCEI exceptions        : not available
>>
>> processor        : 1
>> cpu model        : MIPS 1004Kc V2.15
>> BogoMIPS        : 586.13
>> wait instruction    : yes
>> microsecond timers    : yes
>> tlb_entries        : 32
>> extra interrupt vector    : yes
>> hardware watchpoint    : yes, count: 4, address/irw mask: [0x0ffc,
>> 0x0ffc, 0x0ffb, 0x0ffb]
>> isa            : mips1 mips2 mips32r1 mips32r2
>> ASEs implemented    : mips16 dsp mt
>> shadow register sets    : 1
>> kscratch registers    : 0
>> package            : 0
>> core            : 0
>> VPE            : 1
>> VCED exceptions        : not available
>> VCEI exceptions        : not available
>>
>> Any ideas?
>>
>> Regards
>> Greg
>>
>>
>>> Original 4.14 OpenWrt patch:
>>> Link:
>>> https://git.openwrt.org/?p=openwrt/openwrt.git;a=commitdiff;h=4cdbc90a376dd0555201c1434a2081e055e9ceb7
>>> Current 5.10 OpenWrt patch:
>>> Link:
>>> https://git.openwrt.org/?p=openwrt/openwrt.git;a=blob;f=target/linux/ramips/patches-5.10/320-mt7621-core-detect-hack.patch;h=c63f0f4c1ec742e24d8480e80553863744b58f6a;hb=10267e17299806f9885d086147878f6c492cb904
>>>
>>> Suggested-by: Felix Fietkau <nbd@nbd.name>
>>> Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
>>> ---
>>>   arch/mips/include/asm/mips-cps.h | 23 ++++++++++++++++++++++-
>>>   1 file changed, 22 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/mips/include/asm/mips-cps.h
>>> b/arch/mips/include/asm/mips-cps.h
>>> index fd43d876892e..35fb8ee6dd33 100644
>>> --- a/arch/mips/include/asm/mips-cps.h
>>> +++ b/arch/mips/include/asm/mips-cps.h
>>> @@ -10,6 +10,8 @@
>>>   #include <linux/io.h>
>>>   #include <linux/types.h>
>>>   
>>> +#include <asm/mips-boards/launch.h>
>>> +
>>>   extern unsigned long __cps_access_bad_size(void)
>>>       __compiletime_error("Bad size for CPS accessor");
>>>   
>>> @@ -165,11 +167,30 @@ static inline uint64_t
>>> mips_cps_cluster_config(unsigned int cluster)
>>>    */
>>>   static inline unsigned int mips_cps_numcores(unsigned int cluster)
>>>   {
>>> +    unsigned int ncores;
>>> +
>>>       if (!mips_cm_present())
>>>           return 0;
>>>   
>>>       /* Add one before masking to handle 0xff indicating no cores */
>>> -    return (mips_cps_cluster_config(cluster) + 1) &
>>> CM_GCR_CONFIG_PCORES;
>>> +    ncores = (mips_cps_cluster_config(cluster) + 1) &
>>> CM_GCR_CONFIG_PCORES;
>>> +
>>> +    if (IS_ENABLED(CONFIG_SOC_MT7621)) {
>>> +        struct cpulaunch *launch;
>>> +
>>> +        /*
>>> +         * Ralink MT7621S SoC is single core, but the GCR_CONFIG method
>>> +         * always reports 2 cores. Check the second core's
>>> LAUNCH_FREADY
>>> +         * flag to detect if the second core is missing. This method
>>> +         * only works before the core has been started.
>>> +         */
>>> +        launch = (struct cpulaunch *)CKSEG0ADDR(CPULAUNCH);
>>> +        launch += 2; /* MT7621 has 2 VPEs per core */
>>> +        if (!(launch->flags & LAUNCH_FREADY))
>>> +            ncores = 1;
>>> +    }
>>> +
>>> +    return ncores;
>>>   }
>>>   
>>>   /**
>>> -- 
>>> 2.31.1
>>
> 
