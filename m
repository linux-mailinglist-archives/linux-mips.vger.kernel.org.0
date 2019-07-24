Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A965B72F7B
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jul 2019 15:04:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726766AbfGXNEE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Jul 2019 09:04:04 -0400
Received: from foss.arm.com ([217.140.110.172]:40630 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726767AbfGXNED (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Jul 2019 09:04:03 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29A9128;
        Wed, 24 Jul 2019 06:04:03 -0700 (PDT)
Received: from [10.1.196.133] (e112269-lin.cambridge.arm.com [10.1.196.133])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1FC383F71A;
        Wed, 24 Jul 2019 06:04:00 -0700 (PDT)
Subject: Re: [PATCH v9 04/21] mips: mm: Add p?d_leaf() definitions
To:     Paul Burton <paul.burton@mips.com>
Cc:     Mark Rutland <Mark.Rutland@arm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>,
        "Liang, Kan" <kan.liang@linux.intel.com>,
        "x86@kernel.org" <x86@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        James Hogan <jhogan@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Morse <james.morse@arm.com>,
        Andrew Morton <akpm@linux-foundation.org>
References: <20190722154210.42799-1-steven.price@arm.com>
 <20190722154210.42799-5-steven.price@arm.com>
 <20190722214722.wdlj6a3der3r2oro@pburton-laptop>
From:   Steven Price <steven.price@arm.com>
Message-ID: <85b20d93-bb60-b9e2-ea6a-92ca6f90abc6@arm.com>
Date:   Wed, 24 Jul 2019 14:03:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190722214722.wdlj6a3der3r2oro@pburton-laptop>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 22/07/2019 22:47, Paul Burton wrote:
> Hi Steven,
> 
> On Mon, Jul 22, 2019 at 04:41:53PM +0100, Steven Price wrote:
>> walk_page_range() is going to be allowed to walk page tables other than
>> those of user space. For this it needs to know when it has reached a
>> 'leaf' entry in the page tables. This information is provided by the
>> p?d_leaf() functions/macros.
>>
>> For mips, we only support large pages on 64 bit.
> 
> That ceases to be true with commit 35476311e529 ("MIPS: Add partial
> 32-bit huge page support") in mips-next, so I think it may be best to
> move the definition to asm/pgtable.h so that both 32b & 64b kernels can
> pick it up.

Thanks for pointing that out. I'll move the definitions as you suggest.

Steve

> Thanks,
>     Paul
> 
>> For 64 bit if _PAGE_HUGE is defined we can simply look for it. When not
>> defined we can be confident that there are no leaf pages in existence
>> and fall back on the generic implementation (added in a later patch)
>> which returns 0.
>>
>> CC: Ralf Baechle <ralf@linux-mips.org>
>> CC: Paul Burton <paul.burton@mips.com>
>> CC: James Hogan <jhogan@kernel.org>
>> CC: linux-mips@vger.kernel.org
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>>  arch/mips/include/asm/pgtable-64.h | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/arch/mips/include/asm/pgtable-64.h b/arch/mips/include/asm/pgtable-64.h
>> index 93a9dce31f25..2bdbf8652b5f 100644
>> --- a/arch/mips/include/asm/pgtable-64.h
>> +++ b/arch/mips/include/asm/pgtable-64.h
>> @@ -273,6 +273,10 @@ static inline int pmd_present(pmd_t pmd)
>>  	return pmd_val(pmd) != (unsigned long) invalid_pte_table;
>>  }
>>  
>> +#ifdef _PAGE_HUGE
>> +#define pmd_leaf(pmd)	((pmd_val(pmd) & _PAGE_HUGE) != 0)
>> +#endif
>> +
>>  static inline void pmd_clear(pmd_t *pmdp)
>>  {
>>  	pmd_val(*pmdp) = ((unsigned long) invalid_pte_table);
>> @@ -297,6 +301,10 @@ static inline int pud_present(pud_t pud)
>>  	return pud_val(pud) != (unsigned long) invalid_pmd_table;
>>  }
>>  
>> +#ifdef _PAGE_HUGE
>> +#define pud_leaf(pud)	((pud_val(pud) & _PAGE_HUGE) != 0)
>> +#endif
>> +
>>  static inline void pud_clear(pud_t *pudp)
>>  {
>>  	pud_val(*pudp) = ((unsigned long) invalid_pmd_table);
>> -- 
>> 2.20.1
>>
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 

