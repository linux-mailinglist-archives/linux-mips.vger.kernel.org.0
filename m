Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B2E61D4F87
	for <lists+linux-mips@lfdr.de>; Fri, 15 May 2020 15:50:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726163AbgEONus (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 May 2020 09:50:48 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:47808 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726144AbgEONus (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 15 May 2020 09:50:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1589550645;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
        bh=YPxqtz7SrQMxVR0oNRVuYgjhIQY/ehBEOSuzlXDfLLQ=;
        b=McLXuvipd6nWdMnxfBJcK6hs/C6N4BeYvwAy+iwV+O7/drxKwaYJylOm7YGAThmtwMzo5F
        9eZNo8NzPMESGPje2mkGaQrvyX18ExrjM0yfuQ0ez3+yOHOqjDhmAEvmKB8GGzqm1SEOO2
        /wohzs8K5ZSUAWUE6yofbjM3hWaZaSY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44--kSbM8_hNMKoZRIs6-fgFw-1; Fri, 15 May 2020 09:50:41 -0400
X-MC-Unique: -kSbM8_hNMKoZRIs6-fgFw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23E361800D4A;
        Fri, 15 May 2020 13:50:40 +0000 (UTC)
Received: from [10.36.114.77] (ovpn-114-77.ams2.redhat.com [10.36.114.77])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E60BF614E7;
        Fri, 15 May 2020 13:50:37 +0000 (UTC)
Subject: Re: mm/memory.c: Add update local tlb for smp race
To:     Bibo Mao <maobibo@loongson.cn>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
References: <1589439021-17005-1-git-send-email-maobibo@loongson.cn>
From:   David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat GmbH
Message-ID: <c86a9a0d-3975-adbe-d97b-deceb566786e@redhat.com>
Date:   Fri, 15 May 2020 15:50:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1589439021-17005-1-git-send-email-maobibo@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 14.05.20 08:50, Bibo Mao wrote:
> If there are two threads hitting page fault at the address, one
> thread updates pte entry and local tlb, the other thread can update
> local tlb also, rather than give up and let page fault happening
> again.

Let me suggest

"mm/memory: optimize concurrent page faults at same address

If two threads concurrently fault at the same address, the thread that
won the race updates the PTE and its local TLB. For now, the other
thread gives up, simply does nothing, and continues.

It could happen that this second thread triggers another fault, whereby
it only updates its local TLB while handling the fault. Instead of
triggering another fault, let's directly update the local TLB of the
second thread.
"

If I got the intention of this patch correctly.

Are there any performance numbers to support this patch?

(I can't say too much about the correctness and/or usefulness of this patch)

> 
> 	modified:   mm/memory.c

This does not belong into a patch description.


> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
> ---
>  mm/memory.c | 30 ++++++++++++++++++++++--------
>  1 file changed, 22 insertions(+), 8 deletions(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index f703fe8..3a741ce 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -2436,11 +2436,10 @@ static inline bool cow_user_page(struct page *dst, struct page *src,
>  		if (!likely(pte_same(*vmf->pte, vmf->orig_pte))) {
>  			/*
>  			 * Other thread has already handled the fault
> -			 * and we don't need to do anything. If it's
> -			 * not the case, the fault will be triggered
> -			 * again on the same address.
> +			 * and update local tlb only
>  			 */
>  			ret = false;
> +			update_mmu_cache(vma, addr, vmf->pte);
>  			goto pte_unlock;
>  		}
>  
> @@ -2463,8 +2462,9 @@ static inline bool cow_user_page(struct page *dst, struct page *src,
>  		vmf->pte = pte_offset_map_lock(mm, vmf->pmd, addr, &vmf->ptl);
>  		locked = true;
>  		if (!likely(pte_same(*vmf->pte, vmf->orig_pte))) {
> -			/* The PTE changed under us. Retry page fault. */
> +			/* The PTE changed under us. update local tlb */
>  			ret = false;
> +			update_mmu_cache(vma, addr, vmf->pte);
>  			goto pte_unlock;
>  		}
>  
> @@ -2704,6 +2704,7 @@ static vm_fault_t wp_page_copy(struct vm_fault *vmf)
>  		}
>  		flush_cache_page(vma, vmf->address, pte_pfn(vmf->orig_pte));
>  		entry = mk_pte(new_page, vma->vm_page_prot);
> +		entry = pte_mkyoung(entry);
>  		entry = maybe_mkwrite(pte_mkdirty(entry), vma);
>  		/*
>  		 * Clear the pte entry and flush it first, before updating the
> @@ -2752,6 +2753,7 @@ static vm_fault_t wp_page_copy(struct vm_fault *vmf)
>  		new_page = old_page;
>  		page_copied = 1;
>  	} else {
> +		update_mmu_cache(vma, vmf->address, vmf->pte);
>  		mem_cgroup_cancel_charge(new_page, memcg, false);
>  	}
>  
> @@ -2812,6 +2814,7 @@ vm_fault_t finish_mkwrite_fault(struct vm_fault *vmf)
>  	 * pte_offset_map_lock.
>  	 */
>  	if (!pte_same(*vmf->pte, vmf->orig_pte)) {
> +		update_mmu_cache(vmf->vma, vmf->address, vmf->pte);
>  		pte_unmap_unlock(vmf->pte, vmf->ptl);
>  		return VM_FAULT_NOPAGE;
>  	}
> @@ -2936,6 +2939,7 @@ static vm_fault_t do_wp_page(struct vm_fault *vmf)
>  			vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd,
>  					vmf->address, &vmf->ptl);
>  			if (!pte_same(*vmf->pte, vmf->orig_pte)) {
> +				update_mmu_cache(vma, vmf->address, vmf->pte);
>  				unlock_page(vmf->page);
>  				pte_unmap_unlock(vmf->pte, vmf->ptl);
>  				put_page(vmf->page);
> @@ -3341,8 +3345,10 @@ static vm_fault_t do_anonymous_page(struct vm_fault *vmf)
>  						vma->vm_page_prot));
>  		vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd,
>  				vmf->address, &vmf->ptl);
> -		if (!pte_none(*vmf->pte))
> +		if (!pte_none(*vmf->pte)) {
> +			update_mmu_cache(vma, vmf->address, vmf->pte);
>  			goto unlock;
> +		}
>  		ret = check_stable_address_space(vma->vm_mm);
>  		if (ret)
>  			goto unlock;
> @@ -3373,13 +3379,16 @@ static vm_fault_t do_anonymous_page(struct vm_fault *vmf)
>  	__SetPageUptodate(page);
>  
>  	entry = mk_pte(page, vma->vm_page_prot);
> +	entry = pte_mkyoung(entry);
>  	if (vma->vm_flags & VM_WRITE)
>  		entry = pte_mkwrite(pte_mkdirty(entry));
>  
>  	vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd, vmf->address,
>  			&vmf->ptl);
> -	if (!pte_none(*vmf->pte))
> +	if (!pte_none(*vmf->pte)) {
> +		update_mmu_cache(vma, vmf->address, vmf->pte);
>  		goto release;
> +	}
>  
>  	ret = check_stable_address_space(vma->vm_mm);
>  	if (ret)
> @@ -3646,11 +3655,14 @@ vm_fault_t alloc_set_pte(struct vm_fault *vmf, struct mem_cgroup *memcg,
>  	}
>  
>  	/* Re-check under ptl */
> -	if (unlikely(!pte_none(*vmf->pte)))
> +	if (unlikely(!pte_none(*vmf->pte))) {
> +		update_mmu_cache(vma, vmf->address, vmf->pte);
>  		return VM_FAULT_NOPAGE;
> +	}
>  
>  	flush_icache_page(vma, page);
>  	entry = mk_pte(page, vma->vm_page_prot);
> +	entry = pte_mkyoung(entry);
>  	if (write)
>  		entry = maybe_mkwrite(pte_mkdirty(entry), vma);
>  	/* copy-on-write page */
> @@ -4224,8 +4236,10 @@ static vm_fault_t handle_pte_fault(struct vm_fault *vmf)
>  	vmf->ptl = pte_lockptr(vmf->vma->vm_mm, vmf->pmd);
>  	spin_lock(vmf->ptl);
>  	entry = vmf->orig_pte;
> -	if (unlikely(!pte_same(*vmf->pte, entry)))
> +	if (unlikely(!pte_same(*vmf->pte, entry))) {
> +		update_mmu_cache(vmf->vma, vmf->address, vmf->pte);
>  		goto unlock;
> +	}
>  	if (vmf->flags & FAULT_FLAG_WRITE) {
>  		if (!pte_write(entry))
>  			return do_wp_page(vmf);
> 


-- 
Thanks,

David / dhildenb

