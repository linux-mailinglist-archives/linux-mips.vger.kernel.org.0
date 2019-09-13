Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30735B19BD
	for <lists+linux-mips@lfdr.de>; Fri, 13 Sep 2019 10:42:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387561AbfIMImq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 13 Sep 2019 04:42:46 -0400
Received: from foss.arm.com ([217.140.110.172]:40170 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387499AbfIMImq (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 13 Sep 2019 04:42:46 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D181628;
        Fri, 13 Sep 2019 01:42:44 -0700 (PDT)
Received: from [10.162.41.125] (p8cg001049571a15.blr.arm.com [10.162.41.125])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A21F43F59C;
        Fri, 13 Sep 2019 01:42:34 -0700 (PDT)
Subject: Re: [PATCH] mm/pgtable/debug: Fix test validating architecture page
 table helpers
To:     Christophe Leroy <christophe.leroy@c-s.fr>, linux-mm@kvack.org
Cc:     Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org,
        linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
        James Hogan <jhogan@kernel.org>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Michal Hocko <mhocko@kernel.org>,
        Dave Hansen <dave.hansen@intel.com>,
        Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
        Dan Williams <dan.j.williams@intel.com>,
        linux-s390@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
        x86@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>,
        Matthew Wilcox <willy@infradead.org>,
        Steven Price <Steven.Price@arm.com>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Vlastimil Babka <vbabka@suse.cz>,
        linux-snps-arc@lists.infradead.org,
        Kees Cook <keescook@chromium.org>,
        Mark Brown <broonie@kernel.org>,
        "Kirill A . Shutemov" <kirill@shutemov.name>,
        Thomas Gleixner <tglx@linutronix.de>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        linux-arm-kernel@lists.infradead.org,
        Sri Krishna chowdary <schowdary@nvidia.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        linux-mips@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
        linux-kernel@vger.kernel.org, Paul Burton <paul.burton@mips.com>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Vineet Gupta <vgupta@synopsys.com>,
        Martin Schwidefsky <schwidefsky@de.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linuxppc-dev@lists.ozlabs.org,
        "David S. Miller" <davem@davemloft.net>
References: <1892b37d1fd9a4ed39e76c4b999b6556077201c0.1568355752.git.christophe.leroy@c-s.fr>
 <527dd29d-45fa-4d83-1899-6cbf268dd749@arm.com>
 <e2b42446-7f91-83f1-ac12-08dff75c4d35@c-s.fr>
 <cb226b56-ff20-3136-7ffb-890657e56870@c-s.fr>
From:   Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <bdf7f152-d093-1691-4e96-77da7eb9e20a@arm.com>
Date:   Fri, 13 Sep 2019 14:12:45 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <cb226b56-ff20-3136-7ffb-890657e56870@c-s.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 09/13/2019 12:41 PM, Christophe Leroy wrote:
> 
> 
> Le 13/09/2019 à 09:03, Christophe Leroy a écrit :
>>
>>
>> Le 13/09/2019 à 08:58, Anshuman Khandual a écrit :
>>> On 09/13/2019 11:53 AM, Christophe Leroy wrote:
>>>> Fix build failure on powerpc.
>>>>
>>>> Fix preemption imbalance.
>>>>
>>>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>>>> ---
>>>>   mm/arch_pgtable_test.c | 3 +++
>>>>   1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/mm/arch_pgtable_test.c b/mm/arch_pgtable_test.c
>>>> index 8b4a92756ad8..f2b3c9ec35fa 100644
>>>> --- a/mm/arch_pgtable_test.c
>>>> +++ b/mm/arch_pgtable_test.c
>>>> @@ -24,6 +24,7 @@
>>>>   #include <linux/swap.h>
>>>>   #include <linux/swapops.h>
>>>>   #include <linux/sched/mm.h>
>>>> +#include <linux/highmem.h>
>>>
>>> This is okay.
>>>
>>>>   #include <asm/pgalloc.h>
>>>>   #include <asm/pgtable.h>
>>>> @@ -400,6 +401,8 @@ static int __init arch_pgtable_tests_init(void)
>>>>       p4d_clear_tests(p4dp);
>>>>       pgd_clear_tests(mm, pgdp);
>>>> +    pte_unmap(ptep);
>>>> +
>>>
>>> Now the preemption imbalance via pte_alloc_map() path i.e
>>>
>>> pte_alloc_map() -> pte_offset_map() -> kmap_atomic()
>>>
>>> Is not this very much powerpc 32 specific or this will be applicable
>>> for all platform which uses kmap_XXX() to map high memory ?
>>>
>>
>> See https://elixir.bootlin.com/linux/v5.3-rc8/source/include/linux/highmem.h#L91
>>
>> I think it applies at least to all arches using the generic implementation.
>>
>> Applies also to arm:
>> https://elixir.bootlin.com/linux/v5.3-rc8/source/arch/arm/mm/highmem.c#L52
>>
>> Applies also to mips:
>> https://elixir.bootlin.com/linux/v5.3-rc8/source/arch/mips/mm/highmem.c#L47
>>
>> Same on sparc:
>> https://elixir.bootlin.com/linux/v5.3-rc8/source/arch/sparc/mm/highmem.c#L52
>>
>> Same on x86:
>> https://elixir.bootlin.com/linux/v5.3-rc8/source/arch/x86/mm/highmem_32.c#L34
>>
>> I have not checked others, but I guess it is like that for all.
>>
> 
> 
> Seems like I answered too quickly. All kmap_atomic() do preempt_disable(), but not all pte_alloc_map() call kmap_atomic().
> 
> However, for instance ARM does:
> 
> https://elixir.bootlin.com/linux/v5.3-rc8/source/arch/arm/include/asm/pgtable.h#L200
> 
> And X86 as well:
> 
> https://elixir.bootlin.com/linux/v5.3-rc8/source/arch/x86/include/asm/pgtable_32.h#L51
> 
> Microblaze also:
> 
> https://elixir.bootlin.com/linux/v5.3-rc8/source/arch/microblaze/include/asm/pgtable.h#L495

All the above platforms checks out to be using k[un]map_atomic(). I am wondering whether
any of the intermediate levels will have similar problems on any these 32 bit platforms
or any other platforms which might be using generic k[un]map_atomic(). There can be many
permutations here.

	p4dp = p4d_alloc(mm, pgdp, vaddr);
	pudp = pud_alloc(mm, p4dp, vaddr);
	pmdp = pmd_alloc(mm, pudp, vaddr);

Otherwise pte_alloc_map()/pte_unmap() looks good enough which will atleast take care of
a known failure.
