Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98FF3446C5F
	for <lists+linux-mips@lfdr.de>; Sat,  6 Nov 2021 05:45:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233489AbhKFErl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 6 Nov 2021 00:47:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbhKFErk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 6 Nov 2021 00:47:40 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47190C061570;
        Fri,  5 Nov 2021 21:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=tkrN1PChHWiWX89Z211Oaby0ydZaWkoJO6ww8tMjwhs=; b=3uwFuizcDLaDwBsFXjYw8DAjRE
        2+sodVbBG4/g08qN9Tfgd33FSvuTR6w7v58KLUu+vksojWrQ3D7fPh34IeAKu0ycBpWBuAVafRLVw
        TnDN47Yn3APqx31YzQL+9ro4Z0Y63aBsOYe42NfGw5RpgP9w0fukPKMyXWw5CeeIQPqWUiAqoSfNR
        olurc1NEOHvsnGTkUYb8ZJriXQDtKjeSdc/a1bfjlVPPJe1EI1UoFlkTgnDlBLeC/rNih2CYohH8K
        eVoMnu5w20rMQjtbNL7AJ811c+Zx8iTnsS1m5OPz75gwmPVmiOxdMHYau4r2GqoGIzV+79Frb+RMu
        hjt9BGuA==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mjDZX-00CfDi-J8; Sat, 06 Nov 2021 04:44:55 +0000
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
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <38ac1242-7e6f-12db-861b-8923cb6fef07@infradead.org>
Date:   Fri, 5 Nov 2021 21:44:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <249707d6-660f-99ce-b7d3-c48dc7209bbe@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 11/5/21 8:31 PM, Florian Fainelli wrote:
> 
> 
> On 11/5/2021 7:58 PM, Randy Dunlap wrote:
>>
>> Several header files need info on CONFIG_32BIT or CONFIG_64BIT,
>> but kconfig symbol BCM63XX does not provide that info. This leads
>> to many build errors, e.g.:
>>
>>     arch/mips/include/asm/page.h:196:13: error: use of undeclared identifier 'CAC_BASE'
>>             return x - PAGE_OFFSET + PHYS_OFFSET;
>>     arch/mips/include/asm/mach-generic/spaces.h:91:23: note: expanded from macro 'PAGE_OFFSET'
>>     #define PAGE_OFFSET             (CAC_BASE + PHYS_OFFSET)
>>     arch/mips/include/asm/io.h:134:28: error: use of undeclared identifier 'CAC_BASE'
>>             return (void *)(address + PAGE_OFFSET - PHYS_OFFSET);
>>     arch/mips/include/asm/mach-generic/spaces.h:91:23: note: expanded from macro 'PAGE_OFFSET'
>>     #define PAGE_OFFSET             (CAC_BASE + PHYS_OFFSET)
>>
>> arch/mips/include/asm/uaccess.h:82:10: error: use of undeclared identifier '__UA_LIMIT'
>>             return (__UA_LIMIT & (addr | (addr + size) | __ua_size(size))) == 0;
>>
>>
>> Fixes: e7300d04bd08 ("MIPS: BCM63xx: Add support for the Broadcom BCM63xx family of SOCs.")
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
>> Cc: Florian Fainelli <f.fainelli@gmail.com>
>> Cc: bcm-kernel-feedback-list@broadcom.com
>> Cc: linux-mips@vger.kernel.org
>> Cc: Paul Burton <paulburton@kernel.org>
>> Cc: Maxime Bizon <mbizon@freebox.fr>
>> Cc: Ralf Baechle <ralf@linux-mips.org>
>> ---
>> Note: I did see a bunch of build errors like this one:
>> ../arch/mips/kernel/r4k_fpu.S:217: Error: opcode not supported on this processor: mips1 (mips1) `ldc1 $f24,192($4)'
>> but I'm hoping/guessing that this is due to not having a proper compiler
>> for the BCM63xx target.
>>
>>   arch/mips/Kconfig |    1 +
>>   1 file changed, 1 insertion(+)
>>
>> --- linux-next-20211105.orig/arch/mips/Kconfig
>> +++ linux-next-20211105/arch/mips/Kconfig
>> @@ -329,6 +329,7 @@ config BCM63XX
>>       select SYNC_R4K
>>       select DMA_NONCOHERENT
>>       select IRQ_MIPS_CPU
>> +    select CPU_SUPPORTS_32BIT_KERNEL
> 
> That's one option, the other could be to add:
> 
>          select SYS_HAS_CPU_BMIPS32_3300
>          select SYS_HAS_CPU_BMIPS4350
>          select SYS_HAS_CPU_BMIPS4380
> 
> Which would ensure that CPU_SUPPORTS_32BIT_KERNEL is selected AFAICT. Can you try that? What config file did you use to produce that build error BTW?

The .config file that is attached to this report from the kernel test robot:
https://lore.kernel.org/all/202111051920.dcCUQ0QN-lkp@intel.com/

Yes, I'll give your suggestion a try on Saturday.

thanks.--
~Randy
