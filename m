Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B3C31D6019
	for <lists+linux-mips@lfdr.de>; Sat, 16 May 2020 11:46:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727008AbgEPJne (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 16 May 2020 05:43:34 -0400
Received: from mail.loongson.cn ([114.242.206.163]:56674 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727006AbgEPJne (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 16 May 2020 05:43:34 -0400
Received: from [10.20.42.25] (unknown [10.20.42.25])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxf9+ftb9eyGs1AA--.4S3;
        Sat, 16 May 2020 17:42:56 +0800 (CST)
Subject: Re: [PATCH 2/3] mm/memory.c: Update local TLB if PTE entry exists
To:     Andrew Morton <akpm@linux-foundation.org>
References: <1589515809-32422-1-git-send-email-maobibo@loongson.cn>
 <1589515809-32422-2-git-send-email-maobibo@loongson.cn>
 <20200515134046.cf107c6a13b9604c46ad71b8@linux-foundation.org>
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
        "Maciej W. Rozycki" <macro@wdc.com>, linux-mm@kvack.org
From:   maobibo <maobibo@loongson.cn>
Message-ID: <61ebeb0a-89cf-834f-1d20-765a2ab43161@loongson.cn>
Date:   Sat, 16 May 2020 17:42:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20200515134046.cf107c6a13b9604c46ad71b8@linux-foundation.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dxf9+ftb9eyGs1AA--.4S3
X-Coremail-Antispam: 1UD129KBjvJXoWxJryxGry5Ww47Cr1xXr4DCFg_yoW8CFy7pr
        9aka9FqFs7tw18Wr4xXr1qqr18Z342qFy5C34fta4Yk3sFqrs5tFWrGw4F9rW5Zr1fuF4q
        ya1jgr17Zan7ZFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9mb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
        C2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
        F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r
        4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xK
        xwCYjI0SjxkI62AI1cAE67vIY487MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxV
        CFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r10
        6r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxV
        WUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG
        6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr
        0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07b0NVkUUUUU=
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 05/16/2020 04:40 AM, Andrew Morton wrote:
> On Fri, 15 May 2020 12:10:08 +0800 Bibo Mao <maobibo@loongson.cn> wrote:
> 
>> If there are two threads hitting page fault at the same page,
>> one thread updates PTE entry and local TLB, the other can
>> update local tlb also, rather than give up and do page fault
>> again.
>>
>> ...
>>
>> --- a/mm/memory.c
>> +++ b/mm/memory.c
>> @@ -1770,8 +1770,8 @@ static vm_fault_t insert_pfn(struct vm_area_struct *vma, unsigned long addr,
>>  			}
>>  			entry = pte_mkyoung(*pte);
>>  			entry = maybe_mkwrite(pte_mkdirty(entry), vma);
>> -			if (ptep_set_access_flags(vma, addr, pte, entry, 1))
>> -				update_mmu_cache(vma, addr, pte);
>> +			ptep_set_access_flags(vma, addr, pte, entry, 1);
>> +			update_mmu_cache(vma, addr, pte);
> 
> Presumably these changes mean that other architectures will run
> update_mmu_cache() more frequently than they used to.  How much more
> frequently, and what will be the impact of this change?  (Please fully
> explain all this in the changelog).
> 
It is only useful for those architects where software can update tlb, if the  function update_mmu_cache is used for other reason, it will bring out somewhat impact, and I will explain it in the changelog.

>>  		}
>>  		goto out_unlock;
>>  	}
>>
>> ...
>>
>> @@ -2463,7 +2462,8 @@ static inline bool cow_user_page(struct page *dst, struct page *src,
>>  		vmf->pte = pte_offset_map_lock(mm, vmf->pmd, addr, &vmf->ptl);
>>  		locked = true;
>>  		if (!likely(pte_same(*vmf->pte, vmf->orig_pte))) {
>> -			/* The PTE changed under us. Retry page fault. */
>> +			/* The PTE changed under us, update local tlb */
>> +			pdate_mmu_cache(vma, addr, vmf->pte);
> 
> Missing a 'u' there.  Which tells me this patch isn't the one which you
> tested!
> 
Sorry about it, I will refresh the patch and add modification about this obvious typo

regards
bibo, mao
>>  			ret = false;
>>  			goto pte_unlock;
>>  		}
>>
>> ...
>>

