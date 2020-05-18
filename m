Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F4D51D6F57
	for <lists+linux-mips@lfdr.de>; Mon, 18 May 2020 05:33:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726726AbgERDdg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 17 May 2020 23:33:36 -0400
Received: from mail.loongson.cn ([114.242.206.163]:44026 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726696AbgERDdg (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 17 May 2020 23:33:36 -0400
Received: from [10.20.42.25] (unknown [10.20.42.25])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn2oFAsJeS+81AA--.22S3;
        Mon, 18 May 2020 11:33:26 +0800 (CST)
Subject: Re: mm/memory.c: Add update local tlb for smp race
To:     David Hildenbrand <david@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>
References: <1589439021-17005-1-git-send-email-maobibo@loongson.cn>
 <c86a9a0d-3975-adbe-d97b-deceb566786e@redhat.com>
 <df1ab51c-810a-f7ce-e591-d4fbbed95dab@loongson.cn>
Cc:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
From:   maobibo <maobibo@loongson.cn>
Message-ID: <c5cec2be-c6ae-3c1f-d3b5-2e5e68e2dc2b@loongson.cn>
Date:   Mon, 18 May 2020 11:33:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <df1ab51c-810a-f7ce-e591-d4fbbed95dab@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dxn2oFAsJeS+81AA--.22S3
X-Coremail-Antispam: 1UD129KBjvJXoWxKw4xKFW8AFW7ur1xWFWktFb_yoWxurW7pF
        93GanFqFs7Xr1UCr4Iqw1qvr1Sva4rKFyUJry3K3WFy3srtr1fKay5G3yF9FWkArn3Gwsr
        JF4jgF43uayrZaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkmb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
        vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
        Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJV
        W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG
        8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r
        1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij
        64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr
        0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
        IxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUgg_TUUUUU
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 05/16/2020 05:34 PM, maobibo wrote:
> 
> 
> On 05/15/2020 09:50 PM, David Hildenbrand wrote:
>> On 14.05.20 08:50, Bibo Mao wrote:
>>> If there are two threads hitting page fault at the address, one
>>> thread updates pte entry and local tlb, the other thread can update
>>> local tlb also, rather than give up and let page fault happening
>>> again.
>>
>> Let me suggest
>>
>> "mm/memory: optimize concurrent page faults at same address
>>
>> If two threads concurrently fault at the same address, the thread that
>> won the race updates the PTE and its local TLB. For now, the other
>> thread gives up, simply does nothing, and continues.
>>
>> It could happen that this second thread triggers another fault, whereby
>> it only updates its local TLB while handling the fault. Instead of
>> triggering another fault, let's directly update the local TLB of the
>> second thread.
>> "
>>
>> If I got the intention of this patch correctly.
>>
>> Are there any performance numbers to support this patch?
>>
>> (I can't say too much about the correctness and/or usefulness of this patch)
> 
> yes, that is the situation. On MIPS platform software can update TLB,
> so update_mmu_cache is used here. This does not happen frequently, and with the three series patches in later mail. I test lat_pagefault in lmbench, here is is result:
> 
> with these three series patches, 
> # ./lat_pagefault  -N 10  /tmp/1 
> Pagefaults on /tmp/1: 1.4973 microseconds
> # ./lat_pagefault -P 4 -N 10  /tmp/1 
> Pagefaults on /tmp/1: 1.5716 microseconds
> 
> original version, without these three series patch
> #  ./lat_pagefault  -N 10  /tmp/1 
> Pagefaults on /tmp/1: 1.6489 microseconds
> # ./lat_pagefault -P 4 -N 10  /tmp/1
> Pagefaults on /tmp/1: 1.7214 microseconds
> 

I tested the three patches one by one, there is no obvious improvement with
lat_pagefault case, I guess that it happens seldom where multiple threads access
the same page at the same time. 

The improvement is because of another modification where pte_mkyoung is added
to get readable privilege on MIPS system.

regards
bibo, mao

>>>
>>> 	modified:   mm/memory.c
>>
>> This does not belong into a patch description.
> 
> well, I will modify the patch description.
> 
> regards
> bibo,mao
> 
> 
>>
>>
>>> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
>>> ---
>>>  mm/memory.c | 30 ++++++++++++++++++++++--------
>>>  1 file changed, 22 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/mm/memory.c b/mm/memory.c
>>> index f703fe8..3a741ce 100644
>>> --- a/mm/memory.c
>>> +++ b/mm/memory.c
>>> @@ -2436,11 +2436,10 @@ static inline bool cow_user_page(struct page *dst, struct page *src,
>>>  		if (!likely(pte_same(*vmf->pte, vmf->orig_pte))) {
>>>  			/*
>>>  			 * Other thread has already handled the fault
>>> -			 * and we don't need to do anything. If it's
>>> -			 * not the case, the fault will be triggered
>>> -			 * again on the same address.
>>> +			 * and update local tlb only
>>>  			 */
>>>  			ret = false;
>>> +			update_mmu_cache(vma, addr, vmf->pte);
>>>  			goto pte_unlock;
>>>  		}
>>>  
>>> @@ -2463,8 +2462,9 @@ static inline bool cow_user_page(struct page *dst, struct page *src,
>>>  		vmf->pte = pte_offset_map_lock(mm, vmf->pmd, addr, &vmf->ptl);
>>>  		locked = true;
>>>  		if (!likely(pte_same(*vmf->pte, vmf->orig_pte))) {
>>> -			/* The PTE changed under us. Retry page fault. */
>>> +			/* The PTE changed under us. update local tlb */
>>>  			ret = false;
>>> +			update_mmu_cache(vma, addr, vmf->pte);
>>>  			goto pte_unlock;
>>>  		}
>>>  
>>> @@ -2704,6 +2704,7 @@ static vm_fault_t wp_page_copy(struct vm_fault *vmf)
>>>  		}
>>>  		flush_cache_page(vma, vmf->address, pte_pfn(vmf->orig_pte));
>>>  		entry = mk_pte(new_page, vma->vm_page_prot);
>>> +		entry = pte_mkyoung(entry);
>>>  		entry = maybe_mkwrite(pte_mkdirty(entry), vma);
>>>  		/*
>>>  		 * Clear the pte entry and flush it first, before updating the
>>> @@ -2752,6 +2753,7 @@ static vm_fault_t wp_page_copy(struct vm_fault *vmf)
>>>  		new_page = old_page;
>>>  		page_copied = 1;
>>>  	} else {
>>> +		update_mmu_cache(vma, vmf->address, vmf->pte);
>>>  		mem_cgroup_cancel_charge(new_page, memcg, false);
>>>  	}
>>>  
>>> @@ -2812,6 +2814,7 @@ vm_fault_t finish_mkwrite_fault(struct vm_fault *vmf)
>>>  	 * pte_offset_map_lock.
>>>  	 */
>>>  	if (!pte_same(*vmf->pte, vmf->orig_pte)) {
>>> +		update_mmu_cache(vmf->vma, vmf->address, vmf->pte);
>>>  		pte_unmap_unlock(vmf->pte, vmf->ptl);
>>>  		return VM_FAULT_NOPAGE;
>>>  	}
>>> @@ -2936,6 +2939,7 @@ static vm_fault_t do_wp_page(struct vm_fault *vmf)
>>>  			vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd,
>>>  					vmf->address, &vmf->ptl);
>>>  			if (!pte_same(*vmf->pte, vmf->orig_pte)) {
>>> +				update_mmu_cache(vma, vmf->address, vmf->pte);
>>>  				unlock_page(vmf->page);
>>>  				pte_unmap_unlock(vmf->pte, vmf->ptl);
>>>  				put_page(vmf->page);
>>> @@ -3341,8 +3345,10 @@ static vm_fault_t do_anonymous_page(struct vm_fault *vmf)
>>>  						vma->vm_page_prot));
>>>  		vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd,
>>>  				vmf->address, &vmf->ptl);
>>> -		if (!pte_none(*vmf->pte))
>>> +		if (!pte_none(*vmf->pte)) {
>>> +			update_mmu_cache(vma, vmf->address, vmf->pte);
>>>  			goto unlock;
>>> +		}
>>>  		ret = check_stable_address_space(vma->vm_mm);
>>>  		if (ret)
>>>  			goto unlock;
>>> @@ -3373,13 +3379,16 @@ static vm_fault_t do_anonymous_page(struct vm_fault *vmf)
>>>  	__SetPageUptodate(page);
>>>  
>>>  	entry = mk_pte(page, vma->vm_page_prot);
>>> +	entry = pte_mkyoung(entry);
>>>  	if (vma->vm_flags & VM_WRITE)
>>>  		entry = pte_mkwrite(pte_mkdirty(entry));
>>>  
>>>  	vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd, vmf->address,
>>>  			&vmf->ptl);
>>> -	if (!pte_none(*vmf->pte))
>>> +	if (!pte_none(*vmf->pte)) {
>>> +		update_mmu_cache(vma, vmf->address, vmf->pte);
>>>  		goto release;
>>> +	}
>>>  
>>>  	ret = check_stable_address_space(vma->vm_mm);
>>>  	if (ret)
>>> @@ -3646,11 +3655,14 @@ vm_fault_t alloc_set_pte(struct vm_fault *vmf, struct mem_cgroup *memcg,
>>>  	}
>>>  
>>>  	/* Re-check under ptl */
>>> -	if (unlikely(!pte_none(*vmf->pte)))
>>> +	if (unlikely(!pte_none(*vmf->pte))) {
>>> +		update_mmu_cache(vma, vmf->address, vmf->pte);
>>>  		return VM_FAULT_NOPAGE;
>>> +	}
>>>  
>>>  	flush_icache_page(vma, page);
>>>  	entry = mk_pte(page, vma->vm_page_prot);
>>> +	entry = pte_mkyoung(entry);
>>>  	if (write)
>>>  		entry = maybe_mkwrite(pte_mkdirty(entry), vma);
>>>  	/* copy-on-write page */
>>> @@ -4224,8 +4236,10 @@ static vm_fault_t handle_pte_fault(struct vm_fault *vmf)
>>>  	vmf->ptl = pte_lockptr(vmf->vma->vm_mm, vmf->pmd);
>>>  	spin_lock(vmf->ptl);
>>>  	entry = vmf->orig_pte;
>>> -	if (unlikely(!pte_same(*vmf->pte, entry)))
>>> +	if (unlikely(!pte_same(*vmf->pte, entry))) {
>>> +		update_mmu_cache(vmf->vma, vmf->address, vmf->pte);
>>>  		goto unlock;
>>> +	}
>>>  	if (vmf->flags & FAULT_FLAG_WRITE) {
>>>  		if (!pte_write(entry))
>>>  			return do_wp_page(vmf);
>>>
>>
>>

