Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 102761D89A8
	for <lists+linux-mips@lfdr.de>; Mon, 18 May 2020 22:59:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbgERU5t (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 18 May 2020 16:57:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:36556 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726270AbgERU5t (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 18 May 2020 16:57:49 -0400
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net [73.231.172.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EEF9420756;
        Mon, 18 May 2020 20:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589835468;
        bh=yFKL6q0Ss/A6Efr5StLQDz3hK+V4GQL8fArvDWrB8Iw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=LrMMimDmiD2wKcJAwj8KJkVTOLP7zSYVhM0nSgkv2dxAoziNsQtUCrv+e6Ygu2g7v
         HTQD6cDF7KorRQxy+qKJWsPpx7dcdp/nanguSzYFJgrd4P/bJxRDyBCGFgNp0xWmrJ
         ajuEkib91P8ef9WiGs4TMRVcr84hLgRV9Z4IN3Iw=
Date:   Mon, 18 May 2020 13:57:47 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Bibo Mao <maobibo@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Paul Burton <paulburton@kernel.org>,
        Dmitry Korotin <dkorotin@wavecomp.com>,
        Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
        Stafford Horne <shorne@gmail.com>,
        Steven Price <steven.price@arm.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Rapoport <rppt@linux.ibm.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "Maciej W. Rozycki" <macro@wdc.com>, linux-mm@kvack.org,
        David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 3/3] mm/memory.c: Add memory read privilege before
 filling PTE entry
Message-Id: <20200518135747.d8837ba6742b2d193e14fbb0@linux-foundation.org>
In-Reply-To: <1589778529-25627-3-git-send-email-maobibo@loongson.cn>
References: <1589778529-25627-1-git-send-email-maobibo@loongson.cn>
        <1589778529-25627-3-git-send-email-maobibo@loongson.cn>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 18 May 2020 13:08:49 +0800 Bibo Mao <maobibo@loongson.cn> wrote:

> On mips platform, hw PTE entry valid bit is set in pte_mkyoung
> function, it is used to set physical page with readable privilege.

pte_mkyoung() seems to be a strange place to set the pte's valid bit. 
Why is it done there?  Can it be done within mips's mk_pte()?

> Here add pte_mkyoung function to make page readable on MIPS platform
> during page fault handling. This patch improves page fault latency
> about 10% on my MIPS machine with lmbench lat_pagefault case.
> 
> ...
>
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -2704,6 +2704,7 @@ static vm_fault_t wp_page_copy(struct vm_fault *vmf)
>  		}
>  		flush_cache_page(vma, vmf->address, pte_pfn(vmf->orig_pte));
>  		entry = mk_pte(new_page, vma->vm_page_prot);
> +		entry = pte_mkyoung(entry);
>  		entry = maybe_mkwrite(pte_mkdirty(entry), vma);

What is the effect on non-mips machines?  If it's only "additional
overhead" then it would be better to add a new pte_mkvalid() (or
whatever) and arrange for it to be a no-op on all but mips?

>  		/*
>  		 * Clear the pte entry and flush it first, before updating the
> @@ -3378,6 +3379,7 @@ static vm_fault_t do_anonymous_page(struct vm_fault *vmf)
>  	__SetPageUptodate(page);
>  
>  	entry = mk_pte(page, vma->vm_page_prot);
> +	entry = pte_mkyoung(entry);
>  	if (vma->vm_flags & VM_WRITE)
>  		entry = pte_mkwrite(pte_mkdirty(entry));
>  
> @@ -3660,6 +3662,7 @@ vm_fault_t alloc_set_pte(struct vm_fault *vmf, struct mem_cgroup *memcg,
>  
>  	flush_icache_page(vma, page);
>  	entry = mk_pte(page, vma->vm_page_prot);
> +	entry = pte_mkyoung(entry);
>  	if (write)
>  		entry = maybe_mkwrite(pte_mkdirty(entry), vma);
>  	/* copy-on-write page */
> diff --git a/mm/mprotect.c b/mm/mprotect.c
> index 494192ca..673f1cd 100644
> --- a/mm/mprotect.c
> +++ b/mm/mprotect.c
> @@ -131,6 +131,8 @@ static unsigned long change_pte_range(struct vm_area_struct *vma, pmd_t *pmd,
>  				ptent = pte_clear_uffd_wp(ptent);
>  			}
>  
> +			if (vma->vm_flags & VM_READ)
> +				ptent = pte_mkyoung(ptent);
>  			/* Avoid taking write faults for known dirty pages */
>  			if (dirty_accountable && pte_dirty(ptent) &&
>  					(pte_soft_dirty(ptent) ||

