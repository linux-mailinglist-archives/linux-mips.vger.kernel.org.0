Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D124035ECEC
	for <lists+linux-mips@lfdr.de>; Wed, 14 Apr 2021 08:10:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349069AbhDNGLP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 14 Apr 2021 02:11:15 -0400
Received: from pegase1.c-s.fr ([93.17.236.30]:22095 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229840AbhDNGLP (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 14 Apr 2021 02:11:15 -0400
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 4FKsXp6CPzzB09bD;
        Wed, 14 Apr 2021 08:10:50 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id bgEX-Y99N3ka; Wed, 14 Apr 2021 08:10:50 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 4FKsXp513xzB09bB;
        Wed, 14 Apr 2021 08:10:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 8F6CC8B7B6;
        Wed, 14 Apr 2021 08:10:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id 8t_hMitD6rsU; Wed, 14 Apr 2021 08:10:51 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 62A328B75F;
        Wed, 14 Apr 2021 08:10:50 +0200 (CEST)
Subject: Re: [PATCH] mm: Define ARCH_HAS_FIRST_USER_ADDRESS
To:     Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
        akpm@linux-foundation.org
Cc:     linux-s390@vger.kernel.org, x86@kernel.org,
        linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        linux-sh@vger.kernel.org, linux-um@lists.infradead.org,
        linux-mips@vger.kernel.org, linux-csky@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        openrisc@lists.librecores.org, linux-alpha@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org
References: <1618368899-20311-1-git-send-email-anshuman.khandual@arm.com>
 <f29ba8e2-3071-c963-1e9f-e8c88526ed8d@csgroup.eu>
 <6d24d3cc-b2df-f0d7-f4bf-f505f679c77e@arm.com>
From:   Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <ec7bbb30-dbbd-197b-4d65-eb3600fe6413@csgroup.eu>
Date:   Wed, 14 Apr 2021 08:10:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <6d24d3cc-b2df-f0d7-f4bf-f505f679c77e@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le 14/04/2021 à 07:59, Anshuman Khandual a écrit :
> 
> 
> On 4/14/21 10:52 AM, Christophe Leroy wrote:
>>
>>
>> Le 14/04/2021 à 04:54, Anshuman Khandual a écrit :
>>> Currently most platforms define FIRST_USER_ADDRESS as 0UL duplicating the
>>> same code all over. Instead define a new option ARCH_HAS_FIRST_USER_ADDRESS
>>> for those platforms which would override generic default FIRST_USER_ADDRESS
>>> value 0UL. This makes it much cleaner with reduced code.
>>>
>>> Cc: linux-alpha@vger.kernel.org
>>> Cc: linux-snps-arc@lists.infradead.org
>>> Cc: linux-arm-kernel@lists.infradead.org
>>> Cc: linux-csky@vger.kernel.org
>>> Cc: linux-hexagon@vger.kernel.org
>>> Cc: linux-ia64@vger.kernel.org
>>> Cc: linux-m68k@lists.linux-m68k.org
>>> Cc: linux-mips@vger.kernel.org
>>> Cc: openrisc@lists.librecores.org
>>> Cc: linux-parisc@vger.kernel.org
>>> Cc: linuxppc-dev@lists.ozlabs.org
>>> Cc: linux-riscv@lists.infradead.org
>>> Cc: linux-s390@vger.kernel.org
>>> Cc: linux-sh@vger.kernel.org
>>> Cc: sparclinux@vger.kernel.org
>>> Cc: linux-um@lists.infradead.org
>>> Cc: linux-xtensa@linux-xtensa.org
>>> Cc: x86@kernel.org
>>> Cc: linux-mm@kvack.org
>>> Cc: linux-kernel@vger.kernel.org
>>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>>> ---
>>>    arch/alpha/include/asm/pgtable.h             | 1 -
>>>    arch/arc/include/asm/pgtable.h               | 6 ------
>>>    arch/arm/Kconfig                             | 1 +
>>>    arch/arm64/include/asm/pgtable.h             | 2 --
>>>    arch/csky/include/asm/pgtable.h              | 1 -
>>>    arch/hexagon/include/asm/pgtable.h           | 3 ---
>>>    arch/ia64/include/asm/pgtable.h              | 1 -
>>>    arch/m68k/include/asm/pgtable_mm.h           | 1 -
>>>    arch/microblaze/include/asm/pgtable.h        | 2 --
>>>    arch/mips/include/asm/pgtable-32.h           | 1 -
>>>    arch/mips/include/asm/pgtable-64.h           | 1 -
>>>    arch/nds32/Kconfig                           | 1 +
>>>    arch/nios2/include/asm/pgtable.h             | 2 --
>>>    arch/openrisc/include/asm/pgtable.h          | 1 -
>>>    arch/parisc/include/asm/pgtable.h            | 2 --
>>>    arch/powerpc/include/asm/book3s/pgtable.h    | 1 -
>>>    arch/powerpc/include/asm/nohash/32/pgtable.h | 1 -
>>>    arch/powerpc/include/asm/nohash/64/pgtable.h | 2 --
>>>    arch/riscv/include/asm/pgtable.h             | 2 --
>>>    arch/s390/include/asm/pgtable.h              | 2 --
>>>    arch/sh/include/asm/pgtable.h                | 2 --
>>>    arch/sparc/include/asm/pgtable_32.h          | 1 -
>>>    arch/sparc/include/asm/pgtable_64.h          | 3 ---
>>>    arch/um/include/asm/pgtable-2level.h         | 1 -
>>>    arch/um/include/asm/pgtable-3level.h         | 1 -
>>>    arch/x86/include/asm/pgtable_types.h         | 2 --
>>>    arch/xtensa/include/asm/pgtable.h            | 1 -
>>>    include/linux/mm.h                           | 4 ++++
>>>    mm/Kconfig                                   | 4 ++++
>>>    29 files changed, 10 insertions(+), 43 deletions(-)
>>>
>>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>>> index 8ba434287387..47098ccd715e 100644
>>> --- a/include/linux/mm.h
>>> +++ b/include/linux/mm.h
>>> @@ -46,6 +46,10 @@ extern int sysctl_page_lock_unfairness;
>>>      void init_mm_internals(void);
>>>    +#ifndef ARCH_HAS_FIRST_USER_ADDRESS
>>
>> I guess you didn't test it ..... :)
> 
> In fact I did :) Though just booted it on arm64 and cross compiled on
> multiple others platforms.
> 
>>
>> should be #ifndef CONFIG_ARCH_HAS_FIRST_USER_ADDRESS
> 
> Right, meant that instead.
> 
>>
>>> +#define FIRST_USER_ADDRESS    0UL
>>> +#endif
>>
>> But why do we need a config option at all for that ?
>>
>> Why not just:
>>
>> #ifndef FIRST_USER_ADDRESS
>> #define FIRST_USER_ADDRESS    0UL
>> #endif
> 
> This sounds simpler. But just wondering, would not there be any possibility
> of build problems due to compilation sequence between arch and generic code ?
> 

For sure it has to be addresses carefully, but there are already a lot of stuff like that around 
pgtables.h

For instance, pte_offset_kernel() has a generic definition in linux/pgtables.h based on whether it 
is already defined or not.

Taking into account that FIRST_USER_ADDRESS is today in the architectures's asm/pgtables.h, I think 
putting the fallback definition in linux/pgtable.h would do the trick.
