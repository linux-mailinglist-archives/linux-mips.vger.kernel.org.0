Return-Path: <linux-mips+bounces-9543-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51ED3AED597
	for <lists+linux-mips@lfdr.de>; Mon, 30 Jun 2025 09:29:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 781EE163DDE
	for <lists+linux-mips@lfdr.de>; Mon, 30 Jun 2025 07:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A567221B191;
	Mon, 30 Jun 2025 07:29:41 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90A166BFC0;
	Mon, 30 Jun 2025 07:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751268581; cv=none; b=n/a6AHMyzBnYsE2d3D6sBG+kMQLtRr4V7kNvCNKTmxfeGx8dMRJ37av1xrKwYSwEzVmoPbvA8XkifBi3rT1gyqBMZc+zKB8GTsKZv7SJU/eQFnYIbqA+SHjNwtBItmxTsArMwiQ0CQIYItGgQmRxTsu3euZoGV4hkwQFGM2+4wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751268581; c=relaxed/simple;
	bh=a0h2GHTo3K13Mw0AUJepxxnoHiBa6c5feuRAOj5bqrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=se+8uCAb693l/ZudXpleRgZ8KNozfSPYjDPG+86xD1UfRWv4y0cm2GZBtIrS01d1raW4kxYxnpSDziC1gQzh/iyUWaJyli7WBQlkTEJDbO5COsS2yXjz0iwb15kmJVnA8blOvdK2afwnOS/HqY+JOqogwFpqhRi2ni7sQGwtbBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D663F152B;
	Mon, 30 Jun 2025 00:29:22 -0700 (PDT)
Received: from [10.163.37.132] (unknown [10.163.37.132])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 800EF3F6A8;
	Mon, 30 Jun 2025 00:29:34 -0700 (PDT)
Message-ID: <4f8b7ac8-7dcd-4cc9-a97f-4d6ab573e83a@arm.com>
Date: Mon, 30 Jun 2025 12:59:31 +0530
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/hugetlb: Remove prepare_hugepage_range()
To: Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>, David Hildenbrand <david@redhat.com>
References: <20250627160707.2124580-1-peterx@redhat.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250627160707.2124580-1-peterx@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/06/25 9:37 PM, Peter Xu wrote:
> Only mips and loongarch implemented this API, however what it does was
> checking against stack overflow for either len or addr.  That's already
> done in arch's arch_get_unmapped_area*() functions, even though it may not
> be 100% identical checks.
> 
> For example, for both of the architectures, there will be a trivial
> difference on how stack top was defined.  The old code uses STACK_TOP which
> may be slightly smaller than TASK_SIZE on either of them, but the hope is
> that shouldn't be a problem.
> 
> It means the whole API is pretty much obsolete at least now, remove it
> completely.

Agreed, this API is now redundant.

> 
> Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
> Cc: Huacai Chen <chenhuacai@kernel.org>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Muchun Song <muchun.song@linux.dev>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: loongarch@lists.linux.dev
> Cc: linux-mips@vger.kernel.org
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Oscar Salvador <osalvador@suse.de>
> Acked-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  arch/loongarch/include/asm/hugetlb.h | 14 --------------
>  arch/mips/include/asm/hugetlb.h      | 14 --------------
>  fs/hugetlbfs/inode.c                 |  8 ++------
>  include/asm-generic/hugetlb.h        |  8 --------
>  include/linux/hugetlb.h              |  6 ------
>  5 files changed, 2 insertions(+), 48 deletions(-)
> 
> diff --git a/arch/loongarch/include/asm/hugetlb.h b/arch/loongarch/include/asm/hugetlb.h
> index 4dc4b3e04225..ab68b594f889 100644
> --- a/arch/loongarch/include/asm/hugetlb.h
> +++ b/arch/loongarch/include/asm/hugetlb.h
> @@ -10,20 +10,6 @@
>  
>  uint64_t pmd_to_entrylo(unsigned long pmd_val);
>  
> -#define __HAVE_ARCH_PREPARE_HUGEPAGE_RANGE
> -static inline int prepare_hugepage_range(struct file *file,
> -					 unsigned long addr,
> -					 unsigned long len)
> -{
> -	unsigned long task_size = STACK_TOP;
> -
> -	if (len > task_size)
> -		return -ENOMEM;
> -	if (task_size - len < addr)
> -		return -EINVAL;
> -	return 0;
> -}
> -
>  #define __HAVE_ARCH_HUGE_PTE_CLEAR
>  static inline void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
>  				  pte_t *ptep, unsigned long sz)
> diff --git a/arch/mips/include/asm/hugetlb.h b/arch/mips/include/asm/hugetlb.h
> index fbc71ddcf0f6..8c460ce01ffe 100644
> --- a/arch/mips/include/asm/hugetlb.h
> +++ b/arch/mips/include/asm/hugetlb.h
> @@ -11,20 +11,6 @@
>  
>  #include <asm/page.h>
>  
> -#define __HAVE_ARCH_PREPARE_HUGEPAGE_RANGE
> -static inline int prepare_hugepage_range(struct file *file,
> -					 unsigned long addr,
> -					 unsigned long len)
> -{
> -	unsigned long task_size = STACK_TOP;
> -
> -	if (len > task_size)
> -		return -ENOMEM;
> -	if (task_size - len < addr)
> -		return -EINVAL;
> -	return 0;
> -}
> -
>  #define __HAVE_ARCH_HUGE_PTEP_GET_AND_CLEAR
>  static inline pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
>  					    unsigned long addr, pte_t *ptep,
> diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
> index 00b2d1a032fd..81a6acddd690 100644
> --- a/fs/hugetlbfs/inode.c
> +++ b/fs/hugetlbfs/inode.c
> @@ -179,12 +179,8 @@ hugetlb_get_unmapped_area(struct file *file, unsigned long addr,
>  
>  	if (len & ~huge_page_mask(h))
>  		return -EINVAL;
> -	if (flags & MAP_FIXED) {
> -		if (addr & ~huge_page_mask(h))
> -			return -EINVAL;
> -		if (prepare_hugepage_range(file, addr, len))
> -			return -EINVAL;
> -	}
> +	if ((flags & MAP_FIXED) && (addr & ~huge_page_mask(h)))
> +		return -EINVAL;
>  	if (addr)
>  		addr0 = ALIGN(addr, huge_page_size(h));
>  
> diff --git a/include/asm-generic/hugetlb.h b/include/asm-generic/hugetlb.h
> index 3e0a8fe9b108..4bce4f07f44f 100644
> --- a/include/asm-generic/hugetlb.h
> +++ b/include/asm-generic/hugetlb.h
> @@ -114,14 +114,6 @@ static inline int huge_pte_none_mostly(pte_t pte)
>  }
>  #endif
>  
> -#ifndef __HAVE_ARCH_PREPARE_HUGEPAGE_RANGE
> -static inline int prepare_hugepage_range(struct file *file,
> -		unsigned long addr, unsigned long len)
> -{
> -	return 0;
> -}
> -#endif
> -
>  #ifndef __HAVE_ARCH_HUGE_PTEP_SET_WRPROTECT
>  static inline void huge_ptep_set_wrprotect(struct mm_struct *mm,
>  		unsigned long addr, pte_t *ptep)
> diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
> index c6c87eae4a8d..474de8e2a8f2 100644
> --- a/include/linux/hugetlb.h
> +++ b/include/linux/hugetlb.h
> @@ -359,12 +359,6 @@ static inline void hugetlb_show_meminfo_node(int nid)
>  {
>  }
>  
> -static inline int prepare_hugepage_range(struct file *file,
> -				unsigned long addr, unsigned long len)
> -{
> -	return -EINVAL;
> -}
> -
>  static inline void hugetlb_vma_lock_read(struct vm_area_struct *vma)
>  {
>  }

A small nit - there is a now stale in code comment still referring
to prepare_hugepage_range() in hugetlbfs_file_mmap().

Otherwise LGTM.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

