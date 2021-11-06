Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 724A1446E9C
	for <lists+linux-mips@lfdr.de>; Sat,  6 Nov 2021 16:19:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233782AbhKFPVs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 6 Nov 2021 11:21:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230023AbhKFPVp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 6 Nov 2021 11:21:45 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1234::107])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70502C061570;
        Sat,  6 Nov 2021 08:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:Subject:From:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=2SNcg52vIVAV2RGaoghGxpbzKdUjRFvMiPi9grwWv2g=; b=rvZeeZ23HXCP6UaTpr1aaayIvf
        F0WvGb6yCIM96To1VzUVbd7NN4VS2KFACgft637AL3Oes7SghjmjCTUcn5yAGkrPFjs2RHQXV/L9j
        d/WYTmb/0jhhlf0QPpFborO7+3H8Z9Quvb4nA+bSPcsCcjQGG132NxBfF7PVHTLsLPRgo0o70i4HL
        lZn5JiynTp9SZ3XZ/ng7ynn/2T1Xyajip0TGVaW60iyTXYyTy4/fTwHasWQPh817Gl71isVzvxLPK
        d/0DuWBh56e7uY0uw/03YcJiAGLjWehBO5s0Ac5gIzXOhX+OAZ/N5toF6hvQfR7H+xEfxHJt0G+V/
        TY97m9IQ==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by merlin.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mjNT8-008ZDI-O2; Sat, 06 Nov 2021 15:18:59 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [RFC PATCH] mips: BCM63XX: select CPU_SUPPORTS_32BIT_KERNEL
To:     Florian Fainelli <f.fainelli@gmail.com>,
        linux-kernel@vger.kernel.org
Cc:     kernel test robot <lkp@intel.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        Paul Burton <paulburton@kernel.org>,
        Maxime Bizon <mbizon@freebox.fr>,
        Ralf Baechle <ralf@linux-mips.org>
References: <20211106025823.32437-1-rdunlap@infradead.org>
 <249707d6-660f-99ce-b7d3-c48dc7209bbe@gmail.com>
 <38ac1242-7e6f-12db-861b-8923cb6fef07@infradead.org>
Message-ID: <fc315bee-9751-0be6-1a11-d4a6d4449612@infradead.org>
Date:   Sat, 6 Nov 2021 08:18:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <38ac1242-7e6f-12db-861b-8923cb6fef07@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 11/5/21 9:44 PM, Randy Dunlap wrote:
> On 11/5/21 8:31 PM, Florian Fainelli wrote:
>>
>>
>> On 11/5/2021 7:58 PM, Randy Dunlap wrote:
>>>
>>> Several header files need info on CONFIG_32BIT or CONFIG_64BIT,
>>> but kconfig symbol BCM63XX does not provide that info. This leads
>>> to many build errors, e.g.:
>>>
>>>     arch/mips/include/asm/page.h:196:13: error: use of undeclared identifier 'CAC_BASE'
>>>             return x - PAGE_OFFSET + PHYS_OFFSET;
>>>     arch/mips/include/asm/mach-generic/spaces.h:91:23: note: expanded from macro 'PAGE_OFFSET'
>>>     #define PAGE_OFFSET             (CAC_BASE + PHYS_OFFSET)
>>>     arch/mips/include/asm/io.h:134:28: error: use of undeclared identifier 'CAC_BASE'
>>>             return (void *)(address + PAGE_OFFSET - PHYS_OFFSET);
>>>     arch/mips/include/asm/mach-generic/spaces.h:91:23: note: expanded from macro 'PAGE_OFFSET'
>>>     #define PAGE_OFFSET             (CAC_BASE + PHYS_OFFSET)
>>>
>>> arch/mips/include/asm/uaccess.h:82:10: error: use of undeclared identifier '__UA_LIMIT'
>>>             return (__UA_LIMIT & (addr | (addr + size) | __ua_size(size))) == 0;
>>>
>>>
>>> Fixes: e7300d04bd08 ("MIPS: BCM63xx: Add support for the Broadcom BCM63xx family of SOCs.")
>>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
>>> Cc: Florian Fainelli <f.fainelli@gmail.com>
>>> Cc: bcm-kernel-feedback-list@broadcom.com
>>> Cc: linux-mips@vger.kernel.org
>>> Cc: Paul Burton <paulburton@kernel.org>
>>> Cc: Maxime Bizon <mbizon@freebox.fr>
>>> Cc: Ralf Baechle <ralf@linux-mips.org>
>>> ---
>>> Note: I did see a bunch of build errors like this one:
>>> ../arch/mips/kernel/r4k_fpu.S:217: Error: opcode not supported on this processor: mips1 (mips1) `ldc1 $f24,192($4)'
>>> but I'm hoping/guessing that this is due to not having a proper compiler
>>> for the BCM63xx target.
>>>
>>>   arch/mips/Kconfig |    1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> --- linux-next-20211105.orig/arch/mips/Kconfig
>>> +++ linux-next-20211105/arch/mips/Kconfig
>>> @@ -329,6 +329,7 @@ config BCM63XX
>>>       select SYNC_R4K
>>>       select DMA_NONCOHERENT
>>>       select IRQ_MIPS_CPU
>>> +    select CPU_SUPPORTS_32BIT_KERNEL
>>
>> That's one option, the other could be to add:
>>
>>          select SYS_HAS_CPU_BMIPS32_3300
>>          select SYS_HAS_CPU_BMIPS4350
>>          select SYS_HAS_CPU_BMIPS4380
>>
>> Which would ensure that CPU_SUPPORTS_32BIT_KERNEL is selected AFAICT. Can you try that? What config file did you use to produce that build error BTW?
> 
> The .config file that is attached to this report from the kernel test robot:
> https://lore.kernel.org/all/202111051920.dcCUQ0QN-lkp@intel.com/
> 
> Yes, I'll give your suggestion a try on Saturday.

OK, that works also. I'll send a v2 with that.

However, with that kernel .config file, it does expose another
unrelated longstanding build error:

/opt/crosstool/gcc-11.1.0-nolibc/mips-linux/bin/mips-linux-ld: drivers/iio/adc/ingenic-adc.o: in function `jz4725b_adc_init_clk_div':
ingenic-adc.c:(.text.jz4725b_adc_init_clk_div+0x10): undefined reference to `clk_get_parent'
/opt/crosstool/gcc-11.1.0-nolibc/mips-linux/bin/mips-linux-ld: drivers/iio/adc/ingenic-adc.o: in function `jz4770_adc_init_clk_div':
ingenic-adc.c:(.text.jz4770_adc_init_clk_div+0x10): undefined reference to `clk_get_parent'


I prepared a patch for that on April 26, 2021, but it looks like I never sent it.
Oh, it's incomplete, not really working yet.
Any comments on how to really fix this problem?

---
From: Randy Dunlap <rdunlap@infradead.org>

MIPS does not always provide clk*() interfaces and there are no
always-present stubs for them, so depending on "MIPS || COMPILE_TEST"
is not string enough to prevent build errors.

Likewise MACH_INGENIC_SOC || COMPILE_TEST is not strong enough
since if only COMPILE_TEST=y, there are still the same build errors.

Can we fix the dissonance between HAVE_CLK and COMMON_CLK?

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
  drivers/iio/adc/Kconfig |    2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20210426.orig/drivers/iio/adc/Kconfig
+++ linux-next-20210426/drivers/iio/adc/Kconfig
@@ -501,7 +501,7 @@ config INA2XX_ADC
  
  config INGENIC_ADC
  	tristate "Ingenic JZ47xx SoCs ADC driver"
-	depends on MIPS || COMPILE_TEST
+	depends on MACH_INGENIC_SOC || COMPILE_TEST
  	select IIO_BUFFER
  	help
  	  Say yes here to build support for the Ingenic JZ47xx SoCs ADC unit.




thanks.
-- 
~Randy
