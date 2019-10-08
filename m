Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62321CF4B5
	for <lists+linux-mips@lfdr.de>; Tue,  8 Oct 2019 10:13:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730457AbfJHINN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Oct 2019 04:13:13 -0400
Received: from foss.arm.com ([217.140.110.172]:58144 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727724AbfJHINM (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 8 Oct 2019 04:13:12 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C2581570;
        Tue,  8 Oct 2019 01:13:11 -0700 (PDT)
Received: from [10.162.40.139] (p8cg001049571a15.blr.arm.com [10.162.40.139])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 28D403F6C4;
        Tue,  8 Oct 2019 01:12:58 -0700 (PDT)
Subject: Re: [PATCH V4 2/2] mm/pgtable/debug: Add test validating architecture
 page table helpers
To:     "Kirill A. Shutemov" <kirill@shutemov.name>,
        Ingo Molnar <mingo@kernel.org>
Cc:     linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Dan Williams <dan.j.williams@intel.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Michal Hocko <mhocko@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mark Brown <broonie@kernel.org>,
        Steven Price <Steven.Price@arm.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Kees Cook <keescook@chromium.org>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Matthew Wilcox <willy@infradead.org>,
        Sri Krishna chowdary <schowdary@nvidia.com>,
        Dave Hansen <dave.hansen@intel.com>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>,
        Martin Schwidefsky <schwidefsky@de.ibm.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Vineet Gupta <vgupta@synopsys.com>,
        James Hogan <jhogan@kernel.org>,
        Paul Burton <paul.burton@mips.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        linux-snps-arc@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
References: <1570427124-21887-1-git-send-email-anshuman.khandual@arm.com>
 <1570427124-21887-3-git-send-email-anshuman.khandual@arm.com>
 <20191007130617.GB56546@gmail.com> <20191007132607.4q537nauwfn5thol@box>
 <20191007135158.GA36360@gmail.com> <20191007140058.um5g44rvxyzyiref@box>
From:   Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <881796fc-c35e-3790-a1ee-7031c6cdb38d@arm.com>
Date:   Tue, 8 Oct 2019 13:43:22 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191007140058.um5g44rvxyzyiref@box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 10/07/2019 07:30 PM, Kirill A. Shutemov wrote:
> On Mon, Oct 07, 2019 at 03:51:58PM +0200, Ingo Molnar wrote:
>>
>> * Kirill A. Shutemov <kirill@shutemov.name> wrote:
>>
>>> On Mon, Oct 07, 2019 at 03:06:17PM +0200, Ingo Molnar wrote:
>>>>
>>>> * Anshuman Khandual <anshuman.khandual@arm.com> wrote:
>>>>
>>>>> This adds a test module which will validate architecture page table helpers
>>>>> and accessors regarding compliance with generic MM semantics expectations.
>>>>> This will help various architectures in validating changes to the existing
>>>>> page table helpers or addition of new ones.
>>>>>
>>>>> Test page table and memory pages creating it's entries at various level are
>>>>> all allocated from system memory with required alignments. If memory pages
>>>>> with required size and alignment could not be allocated, then all depending
>>>>> individual tests are skipped.
>>>>
>>>>> diff --git a/arch/x86/include/asm/pgtable_64_types.h b/arch/x86/include/asm/pgtable_64_types.h
>>>>> index 52e5f5f2240d..b882792a3999 100644
>>>>> --- a/arch/x86/include/asm/pgtable_64_types.h
>>>>> +++ b/arch/x86/include/asm/pgtable_64_types.h
>>>>> @@ -40,6 +40,8 @@ static inline bool pgtable_l5_enabled(void)
>>>>>  #define pgtable_l5_enabled() 0
>>>>>  #endif /* CONFIG_X86_5LEVEL */
>>>>>  
>>>>> +#define mm_p4d_folded(mm) (!pgtable_l5_enabled())
>>>>> +
>>>>>  extern unsigned int pgdir_shift;
>>>>>  extern unsigned int ptrs_per_p4d;
>>>>
>>>> Any deep reason this has to be a macro instead of proper C?
>>>
>>> It's a way to override the generic mm_p4d_folded(). It can be rewritten
>>> as inline function + define. Something like:
>>>
>>> #define mm_p4d_folded mm_p4d_folded
>>> static inline bool mm_p4d_folded(struct mm_struct *mm)
>>> {
>>> 	return !pgtable_l5_enabled();
>>> }
>>>
>>> But I don't see much reason to be more verbose here than needed.
>>
>> C type checking? Documentation? Yeah, I know it's just a one-liner, but 
>> the principle of the death by a thousand cuts applies here.
> 
> Okay, if you think it worth it. Anshuman, could you fix it up for the next
> submission?

Sure, will do.

> 
> 
>> BTW., any reason this must be in the low level pgtable_64_types.h type 
>> header, instead of one of the API level header files?
> 
> I defined it next pgtable_l5_enabled(). What is more appropriate place to
> you? pgtable_64.h? Yeah, it makes sense.


Needs to be moved to arch/x86/include/asm/pgtable_64.h as well ?
