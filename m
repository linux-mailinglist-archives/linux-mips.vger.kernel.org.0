Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DE151E3467
	for <lists+linux-mips@lfdr.de>; Wed, 27 May 2020 03:07:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728080AbgE0BG4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 May 2020 21:06:56 -0400
Received: from mail.loongson.cn ([114.242.206.163]:53282 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727852AbgE0BG4 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 26 May 2020 21:06:56 -0400
Received: from [10.20.42.25] (unknown [10.20.42.25])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxJuoOvc1eSHI5AA--.349S3;
        Wed, 27 May 2020 09:06:23 +0800 (CST)
Subject: Re: [PATCH v6 1/4] MIPS: Do not flush tlb page when updating PTE
 entry
To:     Andrew Morton <akpm@linux-foundation.org>
References: <1590375160-6997-1-git-send-email-maobibo@loongson.cn>
 <20200525144241.f0e55183a846607cdbb0d819@linux-foundation.org>
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
Message-ID: <a7263f61-2159-5831-8afd-bc38e7e1cb6b@loongson.cn>
Date:   Wed, 27 May 2020 09:06:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20200525144241.f0e55183a846607cdbb0d819@linux-foundation.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9AxJuoOvc1eSHI5AA--.349S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw18JFy5CF13ZF1rZr17Awb_yoW8GFWDpF
        ZrJan5ta97Wry8CrW8Zwsa9FZIy397Jr4vgrn8GrZIv3W5t3WfKrsxG3yrtas5XryUG3W8
        tr40grsrXw1jg37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9Ib7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4
        A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
        64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8Jw
        Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
        c7I2V7IY0VAS07AlzVAYIcxG8wCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4I
        kC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWU
        WwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr
        0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVW8
        JVW3JwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJb
        IYCTnIWIevJa73UjIFyTuYvjxUqhvKUUUUU
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 05/26/2020 05:42 AM, Andrew Morton wrote:
> On Mon, 25 May 2020 10:52:37 +0800 Bibo Mao <maobibo@loongson.cn> wrote:
> 
>> It is not necessary to flush tlb page on all CPUs if suitable PTE
>> entry exists already during page fault handling, just updating
>> TLB is fine.
>>
>> Here redefine flush_tlb_fix_spurious_fault as empty on MIPS system.
>>
>> ...
>>
>> --- a/arch/mips/include/asm/pgtable.h
>> +++ b/arch/mips/include/asm/pgtable.h
>> @@ -478,6 +478,8 @@ static inline pgprot_t pgprot_writecombine(pgprot_t _prot)
>>  	return __pgprot(prot);
>>  }
>>  
>> +#define flush_tlb_fix_spurious_fault(vma, address) do { } while (0)
>> +
> 
> static inline C would be preferred, if that works.  For a number of reasons:
> 
> - looks nicer
> 
> - more likely to get a code comment (for some reason)
> 
> - adds typechecking.  So right now a MIPS developer could do
> 
> 	struct wibble a;
> 	struct wobble b;
> 
> 	flush_tlb_fix_spurious_fault(&a, &b);
> 
>   and there would be no compiler warning.  Then the code gets merged
>   upstream and in come the embarrassing emails!
> 
> - avoids unused-var warnings
> 
> 	foo()
> 	{
> 		struct address_space a;
> 		struct vm_area_struct v;
> 
> 		flush_tlb_fix_spurious_fault(&v, &a);
> 	}
> 
> will generate unused-variable warnings if
> flush_tlb_fix_spurious_fault() is a macro.  Making
> flush_tlb_fix_spurious_fault() inlined C prevents this.
> 
Sure, I will modify this and send another version.

