Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F0B340D52A
	for <lists+linux-mips@lfdr.de>; Thu, 16 Sep 2021 10:54:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235226AbhIPI4I (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Sep 2021 04:56:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234462AbhIPI4H (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 16 Sep 2021 04:56:07 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF7CFC061574;
        Thu, 16 Sep 2021 01:54:47 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id g184so5504114pgc.6;
        Thu, 16 Sep 2021 01:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=LWUCp8cVagg5kfmeD8CZNpFMqbHS2lYZAfYA2ed5ufE=;
        b=V6o5ku9+FcuUTQr1WxlsPtOthDzv3oQz4sYjnsMaiBuL+5Y9WEPP5uX0tNvwxrugyl
         hz8fHuB32FNJ74R8A4HcTIkbcCZg5qqQAulINpm4NhcV/lkGklYUhGy+pL8qOYkpJ1tn
         suelvT04EjesUllZWQx9pTMqYOIiwHCvmxCgedvDHG/U/kmPJ85RnD6vJAxSvTgEXbVR
         dIP8cDJ0dwmzg9FJVe4VtXgfq0OEX4DDuNFAhPrwvawpMeAZvMR6y2DHQigDoLePG57u
         +h26UaTrlSADP5wqa+sGhfjBXyaId5TTUU7oQ9aQrWtxBMjknQqHZu1rKl7GiW0RULR6
         S2Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LWUCp8cVagg5kfmeD8CZNpFMqbHS2lYZAfYA2ed5ufE=;
        b=xyy6wtcGou2/SDthv7KPKfQDWPaYasOg1tVZMlnd1zr4ESOhG3bfp43FX/3nshAKdQ
         hXQ2sW6EfwY4ZqYzWXeOUNQ5mw5pvIaRJQa1U1g0gIbCf8doJ9nlOab/jygZtk37kMuP
         88fQWHoQI7Zs+LtLXFcNy6dkn0SqK0tpA6OPUiTds7+mFusajUOHGwG1opf/GP3TqxeG
         VIebDgM/BIGSHpCfMa9i3NX4p8+fAWhooRtjdKrPOyCelSZlreIwI20r1BnPzN7g9Iqc
         RhLw1+s5nJwY/qomvlMbM6RXsHpzQ5OuGyr72kf2RWndLdLJsqtrXDZHtVqgYuVRotxO
         m27w==
X-Gm-Message-State: AOAM530AHGzTCVgxMXgtr/WxpeVbYOHOSZMrIOYracDYqcuqB3CGtKL2
        T0/K3qU9jyOIphDl4Nb4xi4=
X-Google-Smtp-Source: ABdhPJyRQLWjNzqvkwFhusMaVJgK/4uYyAEiGfg7JdP7OotAtrXncI7frQGGoSFagHH6D7x9HsadAw==
X-Received: by 2002:a62:7d0f:0:b0:43e:11e2:d490 with SMTP id y15-20020a627d0f000000b0043e11e2d490mr4390191pfc.56.1631782487065;
        Thu, 16 Sep 2021 01:54:47 -0700 (PDT)
Received: from ?IPV6:2403:6200:8976:5c0d::d3d? ([2403:6200:8976:5c0d::d3d])
        by smtp.gmail.com with ESMTPSA id h10sm6704902pjs.51.2021.09.16.01.54.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Sep 2021 01:54:46 -0700 (PDT)
Message-ID: <07fc9510-148a-4ae9-e240-7d5402e0e2d7@gmail.com>
Date:   Thu, 16 Sep 2021 15:54:40 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3] MIPS: add support for buggy MT7621S core detection
Content-Language: en-US
To:     Greg Ungerer <gerg@kernel.org>, ilya.lipnitskiy@gmail.com
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        liwei391@huawei.com, macro@orcam.me.uk, nbd@nbd.name,
        tsbogend@alpha.franken.de, yangtiezhu@loongson.cn
References: <4d9e3b39-7caa-d372-5d7b-42dcec36fec7@kernel.org>
From:   Strontium <strntydog@gmail.com>
In-Reply-To: <4d9e3b39-7caa-d372-5d7b-42dcec36fec7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Greg,

I had trouble with this as well.  This line from the patch:

> if (!(launch->flags & LAUNCH_FREADY))

is checking ram which I believe is supposed to be set by the bootloader.
On my platform it looked like the preloaded uboot wasn't setting that as
expected.
If you have control over your bootloader you can force this ram address
to be what the kernel wants, or you can do what i did, because i didn't
have that targets uboot src, and wedge before the kernel starts to force
the ram to the required state, like so:

#define CORE0_INITIAL_CPU_STATE (0xf00)
#define CORE_FL_OFFSET (0x1C)
#define FLAG_LAUNCH_FREADY (1)

#define WRITEREG(r, v) *(volatile uint32_t *)(r) = v
#define KSEG1ADDR(_x) (((_x)&0x1fffffff) | 0xa0000000)

void set_core(uint32_t core)
{
    uint32_t start = CORE0_INITIAL_CPU_STATE + (0x40 * core);
    WRITEREG(KSEG1ADDR(start + CORE_FL_OFFSET), FLAG_LAUNCH_FREADY);
}

void fix_cores(void) {
    // Fixes the flags for each core, just before running the kernel.
    // Means we don't have to patch the kernel check for valid CPU's.
    for (int i = 0; i < 4; i++) {
        set_core(i);
    }
}

It seems that memory section is supposed to set all the cores registers
before the kernel runs, but i never found it did anything except that 1
flag.

Obviously a better way would be to properly detect the number of cores
and not rely on the boot loader to set a flag in ram, I don't know if
that's even possible.

Steven Johnson

On 16/9/21 09:56, Greg Ungerer wrote:
> Hi Ilya,
>
>> Most MT7621 SoCs have 2 cores, which is detected and supported properly
>> by CPS.
>>
>> Unfortunately, MT7621 SoC has a less common S variant with only one
>> core.
>> On MT7621S, GCR_CONFIG still reports 2 cores, which leads to hangs when
>> starting SMP. CPULAUNCH registers can be used in that case to detect the
>> absence of the second core and override the GCR_CONFIG PCORES field.
>>
>> Rework a long-standing OpenWrt patch to override the value of
>> mips_cps_numcores on single-core MT7621 systems.
>>
>> Tested on a dual-core MT7621 device (Ubiquiti ER-X) and a single-core
>> MT7621 device (Netgear R6220).
>
> This is breaking core detection on my MT7621 based platforms.
> I only get 2 cores detected now running 5.13. Reverting this change gives
> me 4 cores back.
>
> From a fully working (pre-change) system I get:
>
> # cat /proc/cpuinfo
> system type        : MediaTek MT7621 ver:1 eco:3
> machine            : Digi EX15
> processor        : 0
> cpu model        : MIPS 1004Kc V2.15
> BogoMIPS        : 586.13
> wait instruction    : yes
> microsecond timers    : yes
> tlb_entries        : 32
> extra interrupt vector    : yes
> hardware watchpoint    : yes, count: 4, address/irw mask: [0x0ffc,
> 0x0ffc, 0x0ffb, 0x0ffb]
> isa            : mips1 mips2 mips32r1 mips32r2
> ASEs implemented    : mips16 dsp mt
> shadow register sets    : 1
> kscratch registers    : 0
> package            : 0
> core            : 0
> VPE            : 0
> VCED exceptions        : not available
> VCEI exceptions        : not available
>
> processor        : 1
> cpu model        : MIPS 1004Kc V2.15
> BogoMIPS        : 586.13
> wait instruction    : yes
> microsecond timers    : yes
> tlb_entries        : 32
> extra interrupt vector    : yes
> hardware watchpoint    : yes, count: 4, address/irw mask: [0x0ffc,
> 0x0ffc, 0x0ffb, 0x0ffb]
> isa            : mips1 mips2 mips32r1 mips32r2
> ASEs implemented    : mips16 dsp mt
> shadow register sets    : 1
> kscratch registers    : 0
> package            : 0
> core            : 0
> VPE            : 1
> VCED exceptions        : not available
> VCEI exceptions        : not available
>
> processor        : 2
> cpu model        : MIPS 1004Kc V2.15
> BogoMIPS        : 586.13
> wait instruction    : yes
> microsecond timers    : yes
> tlb_entries        : 32
> extra interrupt vector    : yes
> hardware watchpoint    : yes, count: 4, address/irw mask: [0x0ffc,
> 0x0ffc, 0x0ffb, 0x0ffb]
> isa            : mips1 mips2 mips32r1 mips32r2
> ASEs implemented    : mips16 dsp mt
> shadow register sets    : 1
> kscratch registers    : 0
> package            : 0
> core            : 1
> VPE            : 0
> VCED exceptions        : not available
> VCEI exceptions        : not available
>
> processor        : 3
> cpu model        : MIPS 1004Kc V2.15
> BogoMIPS        : 586.13
> wait instruction    : yes
> microsecond timers    : yes
> tlb_entries        : 32
> extra interrupt vector    : yes
> hardware watchpoint    : yes, count: 4, address/irw mask: [0x0ffc,
> 0x0ffc, 0x0ffb, 0x0ffb]
> isa            : mips1 mips2 mips32r1 mips32r2
> ASEs implemented    : mips16 dsp mt
> shadow register sets    : 1
> kscratch registers    : 0
> package            : 0
> core            : 1
> VPE            : 1
> VCED exceptions        : not available
> VCEI exceptions        : not available
>
>
> After this patch is applied:
>
> # cat /proc/cpuinfo
> system type        : MediaTek MT7621 ver:1 eco:3
> machine            : Digi EX15
> processor        : 0
> cpu model        : MIPS 1004Kc V2.15
> BogoMIPS        : 586.13
> wait instruction    : yes
> microsecond timers    : yes
> tlb_entries        : 32
> extra interrupt vector    : yes
> hardware watchpoint    : yes, count: 4, address/irw mask: [0x0ffc,
> 0x0ffc, 0x0ffb, 0x0ffb]
> isa            : mips1 mips2 mips32r1 mips32r2
> ASEs implemented    : mips16 dsp mt
> shadow register sets    : 1
> kscratch registers    : 0
> package            : 0
> core            : 0
> VPE            : 0
> VCED exceptions        : not available
> VCEI exceptions        : not available
>
> processor        : 1
> cpu model        : MIPS 1004Kc V2.15
> BogoMIPS        : 586.13
> wait instruction    : yes
> microsecond timers    : yes
> tlb_entries        : 32
> extra interrupt vector    : yes
> hardware watchpoint    : yes, count: 4, address/irw mask: [0x0ffc,
> 0x0ffc, 0x0ffb, 0x0ffb]
> isa            : mips1 mips2 mips32r1 mips32r2
> ASEs implemented    : mips16 dsp mt
> shadow register sets    : 1
> kscratch registers    : 0
> package            : 0
> core            : 0
> VPE            : 1
> VCED exceptions        : not available
> VCEI exceptions        : not available
>
> Any ideas?
>
> Regards
> Greg
>
>
>> Original 4.14 OpenWrt patch:
>> Link:
>> https://git.openwrt.org/?p=openwrt/openwrt.git;a=commitdiff;h=4cdbc90a376dd0555201c1434a2081e055e9ceb7
>> Current 5.10 OpenWrt patch:
>> Link:
>> https://git.openwrt.org/?p=openwrt/openwrt.git;a=blob;f=target/linux/ramips/patches-5.10/320-mt7621-core-detect-hack.patch;h=c63f0f4c1ec742e24d8480e80553863744b58f6a;hb=10267e17299806f9885d086147878f6c492cb904
>>
>> Suggested-by: Felix Fietkau <nbd@nbd.name>
>> Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
>> ---
>>  arch/mips/include/asm/mips-cps.h | 23 ++++++++++++++++++++++-
>>  1 file changed, 22 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/mips/include/asm/mips-cps.h
>> b/arch/mips/include/asm/mips-cps.h
>> index fd43d876892e..35fb8ee6dd33 100644
>> --- a/arch/mips/include/asm/mips-cps.h
>> +++ b/arch/mips/include/asm/mips-cps.h
>> @@ -10,6 +10,8 @@
>>  #include <linux/io.h>
>>  #include <linux/types.h>
>>  
>> +#include <asm/mips-boards/launch.h>
>> +
>>  extern unsigned long __cps_access_bad_size(void)
>>      __compiletime_error("Bad size for CPS accessor");
>>  
>> @@ -165,11 +167,30 @@ static inline uint64_t
>> mips_cps_cluster_config(unsigned int cluster)
>>   */
>>  static inline unsigned int mips_cps_numcores(unsigned int cluster)
>>  {
>> +    unsigned int ncores;
>> +
>>      if (!mips_cm_present())
>>          return 0;
>>  
>>      /* Add one before masking to handle 0xff indicating no cores */
>> -    return (mips_cps_cluster_config(cluster) + 1) &
>> CM_GCR_CONFIG_PCORES;
>> +    ncores = (mips_cps_cluster_config(cluster) + 1) &
>> CM_GCR_CONFIG_PCORES;
>> +
>> +    if (IS_ENABLED(CONFIG_SOC_MT7621)) {
>> +        struct cpulaunch *launch;
>> +
>> +        /*
>> +         * Ralink MT7621S SoC is single core, but the GCR_CONFIG method
>> +         * always reports 2 cores. Check the second core's
>> LAUNCH_FREADY
>> +         * flag to detect if the second core is missing. This method
>> +         * only works before the core has been started.
>> +         */
>> +        launch = (struct cpulaunch *)CKSEG0ADDR(CPULAUNCH);
>> +        launch += 2; /* MT7621 has 2 VPEs per core */
>> +        if (!(launch->flags & LAUNCH_FREADY))
>> +            ncores = 1;
>> +    }
>> +
>> +    return ncores;
>>  }
>>  
>>  /**
>> -- 
>> 2.31.1
>

