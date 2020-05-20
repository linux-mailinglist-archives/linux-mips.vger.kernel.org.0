Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6655F1DAD2A
	for <lists+linux-mips@lfdr.de>; Wed, 20 May 2020 10:23:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726570AbgETIXM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 May 2020 04:23:12 -0400
Received: from mail.loongson.cn ([114.242.206.163]:38488 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726403AbgETIXM (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 20 May 2020 04:23:12 -0400
Received: from [10.20.42.25] (unknown [10.20.42.25])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxP2jB6MReLuc2AA--.129S3;
        Wed, 20 May 2020 16:22:26 +0800 (CST)
Subject: Re: [PATCH v4 3/4] mm/memory.c: Add memory read privilege on page
 fault handling
To:     Andrew Morton <akpm@linux-foundation.org>
References: <1589882610-7291-1-git-send-email-maobibo@loongson.cn>
 <1589882610-7291-3-git-send-email-maobibo@loongson.cn>
 <20200519183035.14fc56ba957266dde87a7778@linux-foundation.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Paul Burton <paulburton@kernel.org>,
        Dmitry Korotin <dkorotin@wavecomp.com>,
        =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
        Stafford Horne <shorne@gmail.com>,
        Steven Price <steven.price@arm.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Rapoport <rppt@linux.ibm.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "Maciej W. Rozycki" <macro@wdc.com>, linux-mm@kvack.org,
        David Hildenbrand <david@redhat.com>
From:   maobibo <maobibo@loongson.cn>
Message-ID: <55379391-7c1f-7d0e-773e-d44fa95e0e24@loongson.cn>
Date:   Wed, 20 May 2020 16:22:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20200519183035.14fc56ba957266dde87a7778@linux-foundation.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9DxP2jB6MReLuc2AA--.129S3
X-Coremail-Antispam: 1UD129KBjvJXoW7CF4DtF1fWF4rKFyxJr1fWFg_yoW8ury7pF
        ykCF1jvF4DJr17AFyxGws7ur1fC3yfKFsrurn3KryDC3Z8JrnYgrs7JayYgFy8GF4jv3Wr
        Ar4qqFZ8ZanFvaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvEb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
        vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
        F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
        4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xK
        xwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
        1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
        b7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
        vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI
        42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
        evJa73UjIFyTuYvjxUg0D7DUUUU
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 05/20/2020 09:30 AM, Andrew Morton wrote:
> On Tue, 19 May 2020 18:03:29 +0800 Bibo Mao <maobibo@loongson.cn> wrote:
> 
>> Here add pte_sw_mkyoung function to make page readable on MIPS
>> platform during page fault handling. This patch improves page
>> fault latency about 10% on my MIPS machine with lmbench
>> lat_pagefault case.
>>
>> It is noop function on other arches, there is no negative
>> influence on those architectures.
>>
>> --- a/arch/mips/include/asm/pgtable.h
>> +++ b/arch/mips/include/asm/pgtable.h
>> @@ -414,6 +414,8 @@ static inline pte_t pte_mkyoung(pte_t pte)
>>  	return pte;
>>  }
>>  
>> +#define pte_sw_mkyoung	pte_mkyoung
>> +
>>  #ifdef CONFIG_MIPS_HUGE_TLB_SUPPORT
>>  static inline int pte_huge(pte_t pte)	{ return pte_val(pte) & _PAGE_HUGE; }
>>  
>> --- a/include/asm-generic/pgtable.h
>> +++ b/include/asm-generic/pgtable.h
>> @@ -227,6 +227,21 @@ static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addres
>>  }
>>  #endif
>>  
>> +/*
>> + * On some architectures hardware does not set page access bit when accessing
>> + * memory page, it is responsibilty of software setting this bit. It brings
>> + * out extra page fault penalty to track page access bit. For optimization page
>> + * access bit can be set during all page fault flow on these arches.
>> + * To be differentiate with macro pte_mkyoung, this macro is used on platforms
>> + * where software maintains page access bit.
>> + */
>> +#ifndef pte_sw_mkyoung
>> +static inline pte_t pte_sw_mkyoung(pte_t pte)
>> +{
>> +	return pte;
>> +}
>> +#endif
> 
> Yup, that's neat enough.  Thanks for making this change.  It looks like
> all architectures include asm-generic/pgtable.h so that's fine.
> 
> It's conventional to add a
> 
> #define pte_sw_mkyoung pte_sw_mkyoung
> 
> immediately above the #endif there, so we can't try to implement
> pte_sw_mkyoung() twice if this header gets included twice.  But the
> header has #ifndef _ASM_GENERIC_PGTABLE_H around the whole thing so
> that should be OK.

Sure, will do, and thanks for your kindly help and guidance

 

