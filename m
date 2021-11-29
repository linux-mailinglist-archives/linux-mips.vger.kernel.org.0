Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91DC746268A
	for <lists+linux-mips@lfdr.de>; Mon, 29 Nov 2021 23:50:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235443AbhK2WyB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Nov 2021 17:54:01 -0500
Received: from mail-qt1-f178.google.com ([209.85.160.178]:44017 "EHLO
        mail-qt1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235713AbhK2WxG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 29 Nov 2021 17:53:06 -0500
Received: by mail-qt1-f178.google.com with SMTP id q14so18265189qtx.10;
        Mon, 29 Nov 2021 14:49:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oq7rSvRN8ZmF8826TeWA1nFVHMF74d3/NsU+2BMgrzA=;
        b=QyWasYPklsbKpNLnuhQAfkow9UuPzTC6g/dIr3OAC/szR6t0pyV0Eqp2gIAgSV8/wz
         kqVrdZ/9nawbYPuLhWwW8UzwS5l9lqTX8uILLnSZ2nV+amXV7kNmtVED1StmaAWrcj8s
         UuDtCNhxtC1X2YfUYfwVNNw1d0fA0BSJ3rYYnN0E4lzuR9B0QZh5op/nq1pf02ylWVy1
         LEpJLmGeFmUNIXkqEBPRxGUIOnXMsDxwS6guJszi0eW4gAr8ZILn1ibfPpmNsGNMhkDi
         4vX8/YWv8SRfa/BGrpYmeXMGTIPU7N0B4+3hpWZZ9tjt3/Ipx7qdAoPxjpyuMKbz8PEw
         m8kQ==
X-Gm-Message-State: AOAM531vmJM2Sm4eI/CSORznBnBEgo6J7PmhypM2LQxrkbPcKs0g7MIP
        p7UGk3BlHn5p2hMdzCLoH9c=
X-Google-Smtp-Source: ABdhPJxnPvgLuExnZ/ccsT7KqYyls4Id19XqxozgRZPGiHFhvLeIoUIbisNi5P/Pe4vmzv7DzMoClA==
X-Received: by 2002:a05:622a:24c:: with SMTP id c12mr38014924qtx.483.1638226186251;
        Mon, 29 Nov 2021 14:49:46 -0800 (PST)
Received: from fedora (pool-173-68-57-129.nycmny.fios.verizon.net. [173.68.57.129])
        by smtp.gmail.com with ESMTPSA id r16sm9636543qkp.42.2021.11.29.14.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 14:49:45 -0800 (PST)
Date:   Mon, 29 Nov 2021 17:49:43 -0500
From:   Dennis Zhou <dennis@kernel.org>
To:     Kefeng Wang <wangkefeng.wang@huawei.com>
Cc:     akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, tj@kernel.org, gregkh@linuxfoundation.org,
        cl@linux.com, catalin.marinas@arm.com, will@kernel.org,
        tsbogend@alpha.franken.de, mpe@ellerman.id.au,
        benh@kernel.crashing.org, paulus@samba.org,
        paul.walmsley@sifive.com, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, davem@davemloft.net, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
        hpa@zytor.com, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH RFC 4/4] mm: percpu: Add generic pcpu_populate_pte()
 function
Message-ID: <YaVZB/Lcis4iQ3RY@fedora>
References: <20211121093557.139034-1-wangkefeng.wang@huawei.com>
 <20211121093557.139034-5-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211121093557.139034-5-wangkefeng.wang@huawei.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Nov 21, 2021 at 05:35:57PM +0800, Kefeng Wang wrote:
> When NEED_PER_CPU_PAGE_FIRST_CHUNK enabled, we need a function to
> populate pte, add a generic pcpu populate pte function and switch
> to use it.
> 
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  arch/powerpc/kernel/setup_64.c | 47 +--------------------
>  arch/sparc/kernel/smp_64.c     | 57 +------------------------
>  arch/x86/kernel/setup_percpu.c |  5 +--
>  drivers/base/arch_numa.c       | 51 +---------------------
>  include/linux/percpu.h         |  5 +--
>  mm/percpu.c                    | 77 +++++++++++++++++++++++++++++++---
>  6 files changed, 79 insertions(+), 163 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
> index 364b1567f822..1a17828af77f 100644
> --- a/arch/powerpc/kernel/setup_64.c
> +++ b/arch/powerpc/kernel/setup_64.c
> @@ -788,51 +788,6 @@ static int pcpu_cpu_distance(unsigned int from, unsigned int to)
>  unsigned long __per_cpu_offset[NR_CPUS] __read_mostly;
>  EXPORT_SYMBOL(__per_cpu_offset);
>  
> -static void __init pcpu_populate_pte(unsigned long addr)
> -{
> -	pgd_t *pgd = pgd_offset_k(addr);
> -	p4d_t *p4d;
> -	pud_t *pud;
> -	pmd_t *pmd;
> -
> -	p4d = p4d_offset(pgd, addr);
> -	if (p4d_none(*p4d)) {
> -		pud_t *new;
> -
> -		new = memblock_alloc(PUD_TABLE_SIZE, PUD_TABLE_SIZE);
> -		if (!new)
> -			goto err_alloc;
> -		p4d_populate(&init_mm, p4d, new);
> -	}
> -
> -	pud = pud_offset(p4d, addr);
> -	if (pud_none(*pud)) {
> -		pmd_t *new;
> -
> -		new = memblock_alloc(PMD_TABLE_SIZE, PMD_TABLE_SIZE);
> -		if (!new)
> -			goto err_alloc;
> -		pud_populate(&init_mm, pud, new);
> -	}
> -
> -	pmd = pmd_offset(pud, addr);
> -	if (!pmd_present(*pmd)) {
> -		pte_t *new;
> -
> -		new = memblock_alloc(PTE_TABLE_SIZE, PTE_TABLE_SIZE);
> -		if (!new)
> -			goto err_alloc;
> -		pmd_populate_kernel(&init_mm, pmd, new);
> -	}
> -
> -	return;
> -
> -err_alloc:
> -	panic("%s: Failed to allocate %lu bytes align=%lx from=%lx\n",
> -	      __func__, PAGE_SIZE, PAGE_SIZE, PAGE_SIZE);
> -}
> -
> -
>  void __init setup_per_cpu_areas(void)
>  {
>  	const size_t dyn_size = PERCPU_MODULE_RESERVE + PERCPU_DYNAMIC_RESERVE;
> @@ -861,7 +816,7 @@ void __init setup_per_cpu_areas(void)
>  	}
>  
>  	if (rc < 0)
> -		rc = pcpu_page_first_chunk(0, pcpu_cpu_to_node, pcpu_populate_pte);
> +		rc = pcpu_page_first_chunk(0, pcpu_cpu_to_node);
>  	if (rc < 0)
>  		panic("cannot initialize percpu area (err=%d)", rc);
>  
> diff --git a/arch/sparc/kernel/smp_64.c b/arch/sparc/kernel/smp_64.c
> index 198dadddb75d..00dffe2d834b 100644
> --- a/arch/sparc/kernel/smp_64.c
> +++ b/arch/sparc/kernel/smp_64.c
> @@ -1534,59 +1534,6 @@ static int __init pcpu_cpu_distance(unsigned int from, unsigned int to)
>  		return REMOTE_DISTANCE;
>  }
>  
> -static void __init pcpu_populate_pte(unsigned long addr)
> -{
> -	pgd_t *pgd = pgd_offset_k(addr);
> -	p4d_t *p4d;
> -	pud_t *pud;
> -	pmd_t *pmd;
> -
> -	if (pgd_none(*pgd)) {
> -		pud_t *new;
> -
> -		new = memblock_alloc_from(PAGE_SIZE, PAGE_SIZE, PAGE_SIZE);
> -		if (!new)
> -			goto err_alloc;
> -		pgd_populate(&init_mm, pgd, new);
> -	}
> -
> -	p4d = p4d_offset(pgd, addr);
> -	if (p4d_none(*p4d)) {
> -		pud_t *new;
> -
> -		new = memblock_alloc_from(PAGE_SIZE, PAGE_SIZE, PAGE_SIZE);
> -		if (!new)
> -			goto err_alloc;
> -		p4d_populate(&init_mm, p4d, new);
> -	}
> -
> -	pud = pud_offset(p4d, addr);
> -	if (pud_none(*pud)) {
> -		pmd_t *new;
> -
> -		new = memblock_alloc_from(PAGE_SIZE, PAGE_SIZE, PAGE_SIZE);
> -		if (!new)
> -			goto err_alloc;
> -		pud_populate(&init_mm, pud, new);
> -	}
> -
> -	pmd = pmd_offset(pud, addr);
> -	if (!pmd_present(*pmd)) {
> -		pte_t *new;
> -
> -		new = memblock_alloc_from(PAGE_SIZE, PAGE_SIZE, PAGE_SIZE);
> -		if (!new)
> -			goto err_alloc;
> -		pmd_populate_kernel(&init_mm, pmd, new);
> -	}
> -
> -	return;
> -
> -err_alloc:
> -	panic("%s: Failed to allocate %lu bytes align=%lx from=%lx\n",
> -	      __func__, PAGE_SIZE, PAGE_SIZE, PAGE_SIZE);
> -}
> -
>  void __init setup_per_cpu_areas(void)
>  {
>  	unsigned long delta;
> @@ -1604,9 +1551,7 @@ void __init setup_per_cpu_areas(void)
>  				pcpu_fc_names[pcpu_chosen_fc], rc);
>  	}
>  	if (rc < 0)
> -		rc = pcpu_page_first_chunk(PERCPU_MODULE_RESERVE,
> -					   cpu_to_node,
> -					   pcpu_populate_pte);
> +		rc = pcpu_page_first_chunk(PERCPU_MODULE_RESERVE, cpu_to_node);
>  	if (rc < 0)
>  		panic("cannot initialize percpu area (err=%d)", rc);
>  
> diff --git a/arch/x86/kernel/setup_percpu.c b/arch/x86/kernel/setup_percpu.c
> index cd672bd46241..4eadbe45078e 100644
> --- a/arch/x86/kernel/setup_percpu.c
> +++ b/arch/x86/kernel/setup_percpu.c
> @@ -101,7 +101,7 @@ static int __init pcpu_cpu_to_node(int cpu)
>  	return IS_ENABLED(CONFIG_NUMA) ? early_cpu_to_node(cpu) : NUMA_NO_NODE;
>  }
>  
> -static void __init pcpup_populate_pte(unsigned long addr)
> +void __init pcpu_populate_pte(unsigned long addr)
>  {
>  	populate_extra_pte(addr);
>  }
> @@ -163,8 +163,7 @@ void __init setup_per_cpu_areas(void)
>  	}
>  	if (rc < 0)
>  		rc = pcpu_page_first_chunk(PERCPU_FIRST_CHUNK_RESERVE,
> -					   pcpu_cpu_to_node,
> -					   pcpup_populate_pte);
> +					   pcpu_cpu_to_node);

x86 has it's own implementation that differs for 32 bit. I'm not
confident this is correct to drop in as a replacement for x86, so I'd
prefer to keep populate_pte_fn() around.

>  	if (rc < 0)
>  		panic("cannot initialize percpu area (err=%d)", rc);
>  
> diff --git a/drivers/base/arch_numa.c b/drivers/base/arch_numa.c
> index 23a10cc36165..eaa31e567d1e 100644
> --- a/drivers/base/arch_numa.c
> +++ b/drivers/base/arch_numa.c
> @@ -14,7 +14,6 @@
>  #include <linux/of.h>
>  
>  #include <asm/sections.h>
> -#include <asm/pgalloc.h>
>  
>  struct pglist_data *node_data[MAX_NUMNODES] __read_mostly;
>  EXPORT_SYMBOL(node_data);
> @@ -155,52 +154,6 @@ static int __init pcpu_cpu_distance(unsigned int from, unsigned int to)
>  	return node_distance(early_cpu_to_node(from), early_cpu_to_node(to));
>  }
>  
> -#ifdef CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK
> -static void __init pcpu_populate_pte(unsigned long addr)
> -{
> -	pgd_t *pgd = pgd_offset_k(addr);
> -	p4d_t *p4d;
> -	pud_t *pud;
> -	pmd_t *pmd;
> -
> -	p4d = p4d_offset(pgd, addr);
> -	if (p4d_none(*p4d)) {
> -		pud_t *new;
> -
> -		new = memblock_alloc(PAGE_SIZE, PAGE_SIZE);
> -		if (!new)
> -			goto err_alloc;
> -		p4d_populate(&init_mm, p4d, new);
> -	}
> -
> -	pud = pud_offset(p4d, addr);
> -	if (pud_none(*pud)) {
> -		pmd_t *new;
> -
> -		new = memblock_alloc(PAGE_SIZE, PAGE_SIZE);
> -		if (!new)
> -			goto err_alloc;
> -		pud_populate(&init_mm, pud, new);
> -	}
> -
> -	pmd = pmd_offset(pud, addr);
> -	if (!pmd_present(*pmd)) {
> -		pte_t *new;
> -
> -		new = memblock_alloc(PAGE_SIZE, PAGE_SIZE);
> -		if (!new)
> -			goto err_alloc;
> -		pmd_populate_kernel(&init_mm, pmd, new);
> -	}
> -
> -	return;
> -
> -err_alloc:
> -	panic("%s: Failed to allocate %lu bytes align=%lx from=%lx\n",
> -	      __func__, PAGE_SIZE, PAGE_SIZE, PAGE_SIZE);
> -}
> -#endif
> -
>  void __init setup_per_cpu_areas(void)
>  {
>  	unsigned long delta;
> @@ -225,9 +178,7 @@ void __init setup_per_cpu_areas(void)
>  
>  #ifdef CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK
>  	if (rc < 0)
> -		rc = pcpu_page_first_chunk(PERCPU_MODULE_RESERVE,
> -					   early_cpu_to_node,
> -					   pcpu_populate_pte);
> +		rc = pcpu_page_first_chunk(PERCPU_MODULE_RESERVE, early_cpu_to_node);
>  #endif
>  	if (rc < 0)
>  		panic("Failed to initialize percpu areas (err=%d).", rc);
> diff --git a/include/linux/percpu.h b/include/linux/percpu.h
> index d73c97ef4ff4..f1ec5ad1351c 100644
> --- a/include/linux/percpu.h
> +++ b/include/linux/percpu.h
> @@ -95,7 +95,6 @@ extern const char * const pcpu_fc_names[PCPU_FC_NR];
>  extern enum pcpu_fc pcpu_chosen_fc;
>  
>  typedef int (pcpu_fc_cpu_to_node_fn_t)(int cpu);
> -typedef void (*pcpu_fc_populate_pte_fn_t)(unsigned long addr);
>  typedef int (pcpu_fc_cpu_distance_fn_t)(unsigned int from, unsigned int to);
>  
>  extern struct pcpu_alloc_info * __init pcpu_alloc_alloc_info(int nr_groups,
> @@ -113,9 +112,9 @@ extern int __init pcpu_embed_first_chunk(size_t reserved_size, size_t dyn_size,
>  #endif
>  
>  #ifdef CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK
> +void __init pcpu_populate_pte(unsigned long addr);
>  extern int __init pcpu_page_first_chunk(size_t reserved_size,
> -				pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn,
> -				pcpu_fc_populate_pte_fn_t populate_pte_fn);
> +				pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn);
>  #endif
>  
>  extern void __percpu *__alloc_reserved_percpu(size_t size, size_t align) __alloc_size(1);
> diff --git a/mm/percpu.c b/mm/percpu.c
> index efaa1cbaf73d..d907daed04eb 100644
> --- a/mm/percpu.c
> +++ b/mm/percpu.c
> @@ -3162,11 +3162,80 @@ int __init pcpu_embed_first_chunk(size_t reserved_size, size_t dyn_size,
>  #endif /* BUILD_EMBED_FIRST_CHUNK */
>  
>  #ifdef BUILD_PAGE_FIRST_CHUNK
> +#include <asm/pgalloc.h>
> +
> +#ifndef P4D_TABLE_SIZE
> +#define P4D_TABLE_SIZE PAGE_SIZE
> +#endif
> +
> +#ifndef PUD_TABLE_SIZE
> +#define PUD_TABLE_SIZE PAGE_SIZE
> +#endif
> +
> +#ifndef PMD_TABLE_SIZE
> +#define PMD_TABLE_SIZE PAGE_SIZE
> +#endif
> +
> +#ifndef PTE_TABLE_SIZE
> +#define PTE_TABLE_SIZE PAGE_SIZE
> +#endif
> +void __init __weak pcpu_populate_pte(unsigned long addr)
> +{
> +	pgd_t *pgd = pgd_offset_k(addr);
> +	p4d_t *p4d;
> +	pud_t *pud;
> +	pmd_t *pmd;
> +
> +	if (pgd_none(*pgd)) {
> +		p4d_t *new;
> +
> +		new = memblock_alloc_from(P4D_TABLE_SIZE, P4D_TABLE_SIZE, PAGE_SIZE);

It's unnecessary to specify a min_addr to memblock_alloc_from() as it
won't allocate 0 anyway. So please use memblock_alloc() instead.

> +		if (!new)
> +			goto err_alloc;
> +		pgd_populate(&init_mm, pgd, new);
> +	}
> +
> +	p4d = p4d_offset(pgd, addr);
> +	if (p4d_none(*p4d)) {
> +		pud_t *new;
> +
> +		new = memblock_alloc_from(PUD_TABLE_SIZE, PUD_TABLE_SIZE, PAGE_SIZE);

See above.

> +		if (!new)
> +			goto err_alloc;
> +		p4d_populate(&init_mm, p4d, new);
> +	}
> +
> +	pud = pud_offset(p4d, addr);
> +	if (pud_none(*pud)) {
> +		pmd_t *new;
> +
> +		new = memblock_alloc_from(PMD_TABLE_SIZE, PMD_TABLE_SIZE, PAGE_SIZE);

See above.

> +		if (!new)
> +			goto err_alloc;
> +		pud_populate(&init_mm, pud, new);
> +	}
> +
> +	pmd = pmd_offset(pud, addr);
> +	if (!pmd_present(*pmd)) {
> +		pte_t *new;
> +
> +		new = memblock_alloc_from(PTE_TABLE_SIZE, PTE_TABLE_SIZE, PAGE_SIZE);

See above.

> +		if (!new)
> +			goto err_alloc;
> +		pmd_populate_kernel(&init_mm, pmd, new);
> +	}
> +
> +	return;
> +
> +err_alloc:
> +	panic("%s: Failed to allocate %lu bytes align=%lx from=%lx\n",
> +	      __func__, PAGE_SIZE, PAGE_SIZE, PAGE_SIZE);
> +}
> +
>  /**
>   * pcpu_page_first_chunk - map the first chunk using PAGE_SIZE pages
>   * @reserved_size: the size of reserved percpu area in bytes
>   * @cpu_to_nd_fn: callback to convert cpu to it's node, optional
> - * @populate_pte_fn: function to populate pte
>   *
>   * This is a helper to ease setting up page-remapped first percpu
>   * chunk and can be called where pcpu_setup_first_chunk() is expected.
> @@ -3177,9 +3246,7 @@ int __init pcpu_embed_first_chunk(size_t reserved_size, size_t dyn_size,
>   * RETURNS:
>   * 0 on success, -errno on failure.
>   */
> -int __init pcpu_page_first_chunk(size_t reserved_size,
> -				 pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn,
> -				 pcpu_fc_populate_pte_fn_t populate_pte_fn)
> +int __init pcpu_page_first_chunk(size_t reserved_size, pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn)
>  {
>  	static struct vm_struct vm;
>  	struct pcpu_alloc_info *ai;
> @@ -3243,7 +3310,7 @@ int __init pcpu_page_first_chunk(size_t reserved_size,
>  			(unsigned long)vm.addr + unit * ai->unit_size;
>  
>  		for (i = 0; i < unit_pages; i++)
> -			populate_pte_fn(unit_addr + (i << PAGE_SHIFT));
> +			pcpu_populate_pte(unit_addr + (i << PAGE_SHIFT));
>  
>  		/* pte already populated, the following shouldn't fail */
>  		rc = __pcpu_map_pages(unit_addr, &pages[unit * unit_pages],
> -- 
> 2.26.2
> 
