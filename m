Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 405D41D600A
	for <lists+linux-mips@lfdr.de>; Sat, 16 May 2020 11:35:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbgEPJev (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 16 May 2020 05:34:51 -0400
Received: from mail.loongson.cn ([114.242.206.163]:55718 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726202AbgEPJev (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 16 May 2020 05:34:51 -0400
Received: from [10.20.42.25] (unknown [10.20.42.25])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Axb+irs79ejWs1AA--.3S3;
        Sat, 16 May 2020 17:34:36 +0800 (CST)
Subject: Re: mm/memory.c: Add update local tlb for smp race
To:     David Hildenbrand <david@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>
References: <1589439021-17005-1-git-send-email-maobibo@loongson.cn>
 <c86a9a0d-3975-adbe-d97b-deceb566786e@redhat.com>
Cc:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
From:   maobibo <maobibo@loongson.cn>
Message-ID: <df1ab51c-810a-f7ce-e591-d4fbbed95dab@loongson.cn>
Date:   Sat, 16 May 2020 17:34:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <c86a9a0d-3975-adbe-d97b-deceb566786e@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Axb+irs79ejWs1AA--.3S3
X-Coremail-Antispam: 1UD129KBjvJXoWxKw4xury3Wr47tr1xJF1rXrb_yoWxXF17pr
        93GanrXF4fXr18Cr4xX3Wqvr1fZa4FgFW8Ary3K3WFy3srtr1Skay5G3yF9rZ7Ar95Gwsr
        JF4jqF4Uuw4ruaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkvb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
        C2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
        F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
        4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487
        MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
        0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0E
        wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
        W8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI
        42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07bOoGdUUUUU=
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 05/15/2020 09:50 PM, David Hildenbrand wrote:
> On 14.05.20 08:50, Bibo Mao wrote:
>> If there are two threads hitting page fault at the address, one
>> thread updates pte entry and local tlb, the other thread can update
>> local tlb also, rather than give up and let page fault happening
>> again.
> 
> Let me suggest
> 
> "mm/memory: optimize concurrent page faults at same address
> 
> If two threads concurrently fault at the same address, the thread that
> won the race updates the PTE and its local TLB. For now, the other
> thread gives up, simply does nothing, and continues.
> 
> It could happen that this second thread triggers another fault, whereby
> it only updates its local TLB while handling the fault. Instead of
> triggering another fault, let's directly update the local TLB of the
> second thread.
> "
> 
> If I got the intention of this patch correctly.
> 
> Are there any performance numbers to support this patch?
> 
> (I can't say too much about the correctness and/or usefulness of this patch)

yes, that is the situation. On MIPS platform software can update TLB,
so update_mmu_cache is used here. This does not happen frequently, and with the three series patches in later mail. I test lat_pagefault in lmbench, here is is result:

with these three series patches, 
# ./lat_pagefault  -N 10  /tmp/1 
Pagefaults on /tmp/1: 1.4973 microseconds
# ./lat_pagefault -P 4 -N 10  /tmp/1 
Pagefaults on /tmp/1: 1.5716 microseconds

original version, without these three series patch
#  ./lat_pagefault  -N 10  /tmp/1 
Pagefaults on /tmp/1: 1.6489 microseconds
# ./lat_pagefault -P 4 -N 10  /tmp/1
Pagefaults on /tmp/1: 1.7214 microseconds

>>
>> 	modified:   mm/memory.c
> 
> This does not belong into a patch description.

well, I will modify the patch description.

regards
bibo,mao


> 
> 
>> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
>> ---
>>  mm/memory.c | 30 ++++++++++++++++++++++--------
>>  1 file changed, 22 insertions(+), 8 deletions(-)
>>
>> diff --git a/mm/memory.c b/mm/memory.c
>> index f703fe8..3a741ce 100644
>> --- a/mm/memory.c
>> +++ b/mm/memory.c
>> @@ -2436,11 +2436,10 @@ static inline bool cow_user_page(struct page *dst, struct page *src,
>>  		if (!likely(pte_same(*vmf->pte, vmf->orig_pte))) {
>>  			/*
>>  			 * Other thread has already handled the fault
>> -			 * and we don't need to do anything. If it's
>> -			 * not the case, the fault will be triggered
>> -			 * again on the same address.
>> +			 * and update local tlb only
>>  			 */
>>  			ret = false;
>> +			update_mmu_cache(vma, addr, vmf->pte);
>>  			goto pte_unlock;
>>  		}
>>  
>> @@ -2463,8 +2462,9 @@ static inline bool cow_user_page(struct page *dst, struct page *src,
>>  		vmf->pte = pte_offset_map_lock(mm, vmf->pmd, addr, &vmf->ptl);
>>  		locked = true;
>>  		if (!likely(pte_same(*vmf->pte, vmf->orig_pte))) {
>> -			/* The PTE changed under us. Retry page fault. */
>> +			/* The PTE changed under us. update local tlb */
>>  			ret = false;
>> +			update_mmu_cache(vma, addr, vmf->pte);
>>  			goto pte_unlock;
>>  		}
>>  
>> @@ -2704,6 +2704,7 @@ static vm_fault_t wp_page_copy(struct vm_fault *vmf)
>>  		}
>>  		flush_cache_page(vma, vmf->address, pte_pfn(vmf->orig_pte));
>>  		entry = mk_pte(new_page, vma->vm_page_prot);
>> +		entry = pte_mkyoung(entry);
>>  		entry = maybe_mkwrite(pte_mkdirty(entry), vma);
>>  		/*
>>  		 * Clear the pte entry and flush it first, before updating the
>> @@ -2752,6 +2753,7 @@ static vm_fault_t wp_page_copy(struct vm_fault *vmf)
>>  		new_page = old_page;
>>  		page_copied = 1;
>>  	} else {
>> +		update_mmu_cache(vma, vmf->address, vmf->pte);
>>  		mem_cgroup_cancel_charge(new_page, memcg, false);
>>  	}
>>  
>> @@ -2812,6 +2814,7 @@ vm_fault_t finish_mkwrite_fault(struct vm_fault *vmf)
>>  	 * pte_offset_map_lock.
>>  	 */
>>  	if (!pte_same(*vmf->pte, vmf->orig_pte)) {
>> +		update_mmu_cache(vmf->vma, vmf->address, vmf->pte);
>>  		pte_unmap_unlock(vmf->pte, vmf->ptl);
>>  		return VM_FAULT_NOPAGE;
>>  	}
>> @@ -2936,6 +2939,7 @@ static vm_fault_t do_wp_page(struct vm_fault *vmf)
>>  			vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd,
>>  					vmf->address, &vmf->ptl);
>>  			if (!pte_same(*vmf->pte, vmf->orig_pte)) {
>> +				update_mmu_cache(vma, vmf->address, vmf->pte);
>>  				unlock_page(vmf->page);
>>  				pte_unmap_unlock(vmf->pte, vmf->ptl);
>>  				put_page(vmf->page);
>> @@ -3341,8 +3345,10 @@ static vm_fault_t do_anonymous_page(struct vm_fault *vmf)
>>  						vma->vm_page_prot));
>>  		vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd,
>>  				vmf->address, &vmf->ptl);
>> -		if (!pte_none(*vmf->pte))
>> +		if (!pte_none(*vmf->pte)) {
>> +			update_mmu_cache(vma, vmf->address, vmf->pte);
>>  			goto unlock;
>> +		}
>>  		ret = check_stable_address_space(vma->vm_mm);
>>  		if (ret)
>>  			goto unlock;
>> @@ -3373,13 +3379,16 @@ static vm_fault_t do_anonymous_page(struct vm_fault *vmf)
>>  	__SetPageUptodate(page);
>>  
>>  	entry = mk_pte(page, vma->vm_page_prot);
>> +	entry = pte_mkyoung(entry);
>>  	if (vma->vm_flags & VM_WRITE)
>>  		entry = pte_mkwrite(pte_mkdirty(entry));
>>  
>>  	vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd, vmf->address,
>>  			&vmf->ptl);
>> -	if (!pte_none(*vmf->pte))
>> +	if (!pte_none(*vmf->pte)) {
>> +		update_mmu_cache(vma, vmf->address, vmf->pte);
>>  		goto release;
>> +	}
>>  
>>  	ret = check_stable_address_space(vma->vm_mm);
>>  	if (ret)
>> @@ -3646,11 +3655,14 @@ vm_fault_t alloc_set_pte(struct vm_fault *vmf, struct mem_cgroup *memcg,
>>  	}
>>  
>>  	/* Re-check under ptl */
>> -	if (unlikely(!pte_none(*vmf->pte)))
>> +	if (unlikely(!pte_none(*vmf->pte))) {
>> +		update_mmu_cache(vma, vmf->address, vmf->pte);
>>  		return VM_FAULT_NOPAGE;
>> +	}
>>  
>>  	flush_icache_page(vma, page);
>>  	entry = mk_pte(page, vma->vm_page_prot);
>> +	entry = pte_mkyoung(entry);
>>  	if (write)
>>  		entry = maybe_mkwrite(pte_mkdirty(entry), vma);
>>  	/* copy-on-write page */
>> @@ -4224,8 +4236,10 @@ static vm_fault_t handle_pte_fault(struct vm_fault *vmf)
>>  	vmf->ptl = pte_lockptr(vmf->vma->vm_mm, vmf->pmd);
>>  	spin_lock(vmf->ptl);
>>  	entry = vmf->orig_pte;
>> -	if (unlikely(!pte_same(*vmf->pte, entry)))
>> +	if (unlikely(!pte_same(*vmf->pte, entry))) {
>> +		update_mmu_cache(vmf->vma, vmf->address, vmf->pte);
>>  		goto unlock;
>> +	}
>>  	if (vmf->flags & FAULT_FLAG_WRITE) {
>>  		if (!pte_write(entry))
>>  			return do_wp_page(vmf);
>>
> 
> 

