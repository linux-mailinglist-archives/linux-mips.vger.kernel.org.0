Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D51C841CA79
	for <lists+linux-mips@lfdr.de>; Wed, 29 Sep 2021 18:40:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345996AbhI2Qll (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Sep 2021 12:41:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:42032 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1345941AbhI2Qlk (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 29 Sep 2021 12:41:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8683761411;
        Wed, 29 Sep 2021 16:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632933599;
        bh=t8dn/WnbBBYbLwRPmrH71m1uQ/o93fnaL1REzEP+yOs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SuGn5wf4j66NI18xGqtKOMcbTU3KcbpcZgDCLxzsuVnUtCLZTFT19+lBcWHpX8l5Y
         4HJt3SEXjTF8YFlmYhiRqC3Q7e2EIIhbZHzkA4PWpwavCaveL76xurOeZQChTMoP9G
         rSRG1qLj38huXnzTeWAzkYTYXFbJIAMb5egCuWxdDLUhGyl1zH02ClSM0KB9MmcD49
         nLWVlcXk/IDGZs0YiU+Hh7V4VGJe5X3YINZpqugr6yEpnMKAIHPeLZUU7CqOhCT879
         znp+/oqCsnMuduLTlsGm00As2ESqshUFy23cAs69hXOWfZANijgY7kzxg3rq/btf3P
         sqf5f4Xu/Jqag==
Date:   Wed, 29 Sep 2021 09:39:58 -0700
From:   Mike Rapoport <rppt@kernel.org>
To:     David Hildenbrand <david@redhat.com>
Cc:     linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Michal Hocko <mhocko@suse.com>,
        Oscar Salvador <osalvador@suse.de>,
        Jianyong Wu <Jianyong.Wu@arm.com>,
        "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
        Vineet Gupta <vgupta@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Eric Biederman <ebiederm@xmission.com>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-snps-arc@lists.infradead.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-mm@kvack.org,
        kexec@lists.infradead.org
Subject: Re: [PATCH v1 3/4] memblock: add MEMBLOCK_DRIVER_MANAGED to mimic
 IORESOURCE_SYSRAM_DRIVER_MANAGED
Message-ID: <YVSW3uuu7mIcJMm3@kernel.org>
References: <20210927150518.8607-1-david@redhat.com>
 <20210927150518.8607-4-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210927150518.8607-4-david@redhat.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On Mon, Sep 27, 2021 at 05:05:17PM +0200, David Hildenbrand wrote:
> Let's add a flag that corresponds to IORESOURCE_SYSRAM_DRIVER_MANAGED.
> Similar to MEMBLOCK_HOTPLUG, most infrastructure has to treat such memory
> like ordinary MEMBLOCK_NONE memory -- for example, when selecting memory
> regions to add to the vmcore for dumping in the crashkernel via
> for_each_mem_range().
 
Can you please elaborate on the difference in semantics of MEMBLOCK_HOTPLUG
and MEMBLOCK_DRIVER_MANAGED?
Unless I'm missing something they both mark memory that can be unplugged
anytime and so it should not be used in certain cases. Why is there a need
for a new flag?

> However, especially kexec_file is not supposed to select such memblocks via
> for_each_free_mem_range() / for_each_free_mem_range_reverse() to place
> kexec images, similar to how we handle IORESOURCE_SYSRAM_DRIVER_MANAGED
> without CONFIG_ARCH_KEEP_MEMBLOCK.
> 
> Let's document why kexec_walk_memblock() won't try placing images on
> areas marked MEMBLOCK_DRIVER_MANAGED -- similar to
> IORESOURCE_SYSRAM_DRIVER_MANAGED handling in locate_mem_hole_callback()
> via kexec_walk_resources().
> 
> We'll make sure that memory hotplug code sets the flag where applicable
> (IORESOURCE_SYSRAM_DRIVER_MANAGED) next. This prepares architectures
> that need CONFIG_ARCH_KEEP_MEMBLOCK, such as arm64, for virtio-mem
> support.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  include/linux/memblock.h | 16 ++++++++++++++--
>  kernel/kexec_file.c      |  5 +++++
>  mm/memblock.c            |  4 ++++
>  3 files changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/memblock.h b/include/linux/memblock.h
> index b49a58f621bc..7d8d656d5082 100644
> --- a/include/linux/memblock.h
> +++ b/include/linux/memblock.h
> @@ -33,12 +33,17 @@ extern unsigned long long max_possible_pfn;
>   * @MEMBLOCK_NOMAP: don't add to kernel direct mapping and treat as
>   * reserved in the memory map; refer to memblock_mark_nomap() description
>   * for further details
> + * @MEMBLOCK_DRIVER_MANAGED: memory region that is always detected via a driver,
> + * corresponding to IORESOURCE_SYSRAM_DRIVER_MANAGED in the kernel resource
> + * tree. Especially kexec should never use this memory for placing images and
> + * shouldn't expose this memory to the second kernel.
>   */
>  enum memblock_flags {
>  	MEMBLOCK_NONE		= 0x0,	/* No special request */
>  	MEMBLOCK_HOTPLUG	= 0x1,	/* hotpluggable region */
>  	MEMBLOCK_MIRROR		= 0x2,	/* mirrored region */
>  	MEMBLOCK_NOMAP		= 0x4,	/* don't add to kernel direct mapping */
> +	MEMBLOCK_DRIVER_MANAGED = 0x8,	/* always detected via a driver */
>  };
>  
>  /**
> @@ -209,7 +214,8 @@ static inline void __next_physmem_range(u64 *idx, struct memblock_type *type,
>   */
>  #define for_each_mem_range(i, p_start, p_end) \
>  	__for_each_mem_range(i, &memblock.memory, NULL, NUMA_NO_NODE,	\
> -			     MEMBLOCK_HOTPLUG, p_start, p_end, NULL)
> +			     MEMBLOCK_HOTPLUG | MEMBLOCK_DRIVER_MANAGED, \
> +			     p_start, p_end, NULL)
>  
>  /**
>   * for_each_mem_range_rev - reverse iterate through memblock areas from
> @@ -220,7 +226,8 @@ static inline void __next_physmem_range(u64 *idx, struct memblock_type *type,
>   */
>  #define for_each_mem_range_rev(i, p_start, p_end)			\
>  	__for_each_mem_range_rev(i, &memblock.memory, NULL, NUMA_NO_NODE, \
> -				 MEMBLOCK_HOTPLUG, p_start, p_end, NULL)
> +				 MEMBLOCK_HOTPLUG | MEMBLOCK_DRIVER_MANAGED,\
> +				 p_start, p_end, NULL)
>  
>  /**
>   * for_each_reserved_mem_range - iterate over all reserved memblock areas
> @@ -250,6 +257,11 @@ static inline bool memblock_is_nomap(struct memblock_region *m)
>  	return m->flags & MEMBLOCK_NOMAP;
>  }
>  
> +static inline bool memblock_is_driver_managed(struct memblock_region *m)
> +{
> +	return m->flags & MEMBLOCK_DRIVER_MANAGED;
> +}
> +
>  int memblock_search_pfn_nid(unsigned long pfn, unsigned long *start_pfn,
>  			    unsigned long  *end_pfn);
>  void __next_mem_pfn_range(int *idx, int nid, unsigned long *out_start_pfn,
> diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
> index 33400ff051a8..8347fc158d2b 100644
> --- a/kernel/kexec_file.c
> +++ b/kernel/kexec_file.c
> @@ -556,6 +556,11 @@ static int kexec_walk_memblock(struct kexec_buf *kbuf,
>  	if (kbuf->image->type == KEXEC_TYPE_CRASH)
>  		return func(&crashk_res, kbuf);
>  
> +	/*
> +	 * Using MEMBLOCK_NONE will properly skip MEMBLOCK_DRIVER_MANAGED. See
> +	 * IORESOURCE_SYSRAM_DRIVER_MANAGED handling in
> +	 * locate_mem_hole_callback().
> +	 */
>  	if (kbuf->top_down) {
>  		for_each_free_mem_range_reverse(i, NUMA_NO_NODE, MEMBLOCK_NONE,
>  						&mstart, &mend, NULL) {
> diff --git a/mm/memblock.c b/mm/memblock.c
> index 47a56b223141..540a35317fb0 100644
> --- a/mm/memblock.c
> +++ b/mm/memblock.c
> @@ -979,6 +979,10 @@ static bool should_skip_region(struct memblock_type *type,
>  	if (!(flags & MEMBLOCK_NOMAP) && memblock_is_nomap(m))
>  		return true;
>  
> +	/* skip driver-managed memory unless we were asked for it explicitly */
> +	if (!(flags & MEMBLOCK_DRIVER_MANAGED) && memblock_is_driver_managed(m))
> +		return true;
> +
>  	return false;
>  }
>  
> -- 
> 2.31.1
> 

-- 
Sincerely yours,
Mike.
