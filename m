Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F33634E88B
	for <lists+linux-mips@lfdr.de>; Tue, 30 Mar 2021 15:11:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231434AbhC3NLK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Mar 2021 09:11:10 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:15404 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232079AbhC3NLE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 30 Mar 2021 09:11:04 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4F8qXV2VMXznTlj;
        Tue, 30 Mar 2021 21:09:14 +0800 (CST)
Received: from [10.174.177.244] (10.174.177.244) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Tue, 30 Mar 2021 21:10:52 +0800
Subject: Re: [PATCH v2] mm: Move mem_init_print_info() into mm_init()
To:     <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
CC:     Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Richard Henderson <rth@twiddle.net>,
        Guo Ren <guoren@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jonas Bonn <jonas@southpole.se>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "Peter Zijlstra" <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, <linux-alpha@vger.kernel.org>,
        <linux-snps-arc@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-csky@vger.kernel.org>, <linux-hexagon@vger.kernel.org>,
        <linux-ia64@vger.kernel.org>, <linux-m68k@lists.linux-m68k.org>,
        <linux-mips@vger.kernel.org>, <openrisc@lists.librecores.org>,
        <linux-parisc@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
        <linux-riscv@lists.infradead.org>, <linux-s390@vger.kernel.org>,
        <linux-sh@vger.kernel.org>, <sparclinux@vger.kernel.org>,
        <linux-um@lists.infradead.org>, <linux-xtensa@linux-xtensa.org>,
        <linux-mm@kvack.org>
References: <4d488195-7281-9238-b30d-9f89a6100fb9@csgroup.eu>
 <20210317015210.33641-1-wangkefeng.wang@huawei.com>
From:   Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <46ecb35c-4a5d-db0b-d5f8-b53ff0583d49@huawei.com>
Date:   Tue, 30 Mar 2021 21:10:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20210317015210.33641-1-wangkefeng.wang@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.177.244]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Andrew, kindly ping

On 2021/3/17 9:52, Kefeng Wang wrote:
> mem_init_print_info() is called in mem_init() on each architecture,
> and pass NULL argument, so using void argument and move it into mm_init().
>
> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
> v2:
> - Cleanup 'str' line suggested by Christophe and ACK
>
>   arch/alpha/mm/init.c             |  1 -
>   arch/arc/mm/init.c               |  1 -
>   arch/arm/mm/init.c               |  2 --
>   arch/arm64/mm/init.c             |  2 --
>   arch/csky/mm/init.c              |  1 -
>   arch/h8300/mm/init.c             |  2 --
>   arch/hexagon/mm/init.c           |  1 -
>   arch/ia64/mm/init.c              |  1 -
>   arch/m68k/mm/init.c              |  1 -
>   arch/microblaze/mm/init.c        |  1 -
>   arch/mips/loongson64/numa.c      |  1 -
>   arch/mips/mm/init.c              |  1 -
>   arch/mips/sgi-ip27/ip27-memory.c |  1 -
>   arch/nds32/mm/init.c             |  1 -
>   arch/nios2/mm/init.c             |  1 -
>   arch/openrisc/mm/init.c          |  2 --
>   arch/parisc/mm/init.c            |  2 --
>   arch/powerpc/mm/mem.c            |  1 -
>   arch/riscv/mm/init.c             |  1 -
>   arch/s390/mm/init.c              |  2 --
>   arch/sh/mm/init.c                |  1 -
>   arch/sparc/mm/init_32.c          |  2 --
>   arch/sparc/mm/init_64.c          |  1 -
>   arch/um/kernel/mem.c             |  1 -
>   arch/x86/mm/init_32.c            |  2 --
>   arch/x86/mm/init_64.c            |  2 --
>   arch/xtensa/mm/init.c            |  1 -
>   include/linux/mm.h               |  2 +-
>   init/main.c                      |  1 +
>   mm/page_alloc.c                  | 10 +++++-----
>   30 files changed, 7 insertions(+), 42 deletions(-)
>
> diff --git a/arch/alpha/mm/init.c b/arch/alpha/mm/init.c
> index 3c42b3147fd6..a97650a618f1 100644
> --- a/arch/alpha/mm/init.c
> +++ b/arch/alpha/mm/init.c
> @@ -282,5 +282,4 @@ mem_init(void)
>   	set_max_mapnr(max_low_pfn);
>   	high_memory = (void *) __va(max_low_pfn * PAGE_SIZE);
>   	memblock_free_all();
> -	mem_init_print_info(NULL);
>   }
> diff --git a/arch/arc/mm/init.c b/arch/arc/mm/init.c
> index ce07e697916c..33832e36bdb7 100644
> --- a/arch/arc/mm/init.c
> +++ b/arch/arc/mm/init.c
> @@ -194,7 +194,6 @@ void __init mem_init(void)
>   {
>   	memblock_free_all();
>   	highmem_init();
> -	mem_init_print_info(NULL);
>   }
>   
>   #ifdef CONFIG_HIGHMEM
> diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
> index 828a2561b229..7022b7b5c400 100644
> --- a/arch/arm/mm/init.c
> +++ b/arch/arm/mm/init.c
> @@ -316,8 +316,6 @@ void __init mem_init(void)
>   
>   	free_highpages();
>   
> -	mem_init_print_info(NULL);
> -
>   	/*
>   	 * Check boundaries twice: Some fundamental inconsistencies can
>   	 * be detected at build time already.
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index 3685e12aba9b..e8f29a0bb2f1 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -491,8 +491,6 @@ void __init mem_init(void)
>   	/* this will put all unused low memory onto the freelists */
>   	memblock_free_all();
>   
> -	mem_init_print_info(NULL);
> -
>   	/*
>   	 * Check boundaries twice: Some fundamental inconsistencies can be
>   	 * detected at build time already.
> diff --git a/arch/csky/mm/init.c b/arch/csky/mm/init.c
> index 894050a8ce09..bf2004aa811a 100644
> --- a/arch/csky/mm/init.c
> +++ b/arch/csky/mm/init.c
> @@ -107,7 +107,6 @@ void __init mem_init(void)
>   			free_highmem_page(page);
>   	}
>   #endif
> -	mem_init_print_info(NULL);
>   }
>   
>   void free_initmem(void)
> diff --git a/arch/h8300/mm/init.c b/arch/h8300/mm/init.c
> index 1f3b345d68b9..f7bf4693e3b2 100644
> --- a/arch/h8300/mm/init.c
> +++ b/arch/h8300/mm/init.c
> @@ -98,6 +98,4 @@ void __init mem_init(void)
>   
>   	/* this will put all low memory onto the freelists */
>   	memblock_free_all();
> -
> -	mem_init_print_info(NULL);
>   }
> diff --git a/arch/hexagon/mm/init.c b/arch/hexagon/mm/init.c
> index f2e6c868e477..f01e91e10d95 100644
> --- a/arch/hexagon/mm/init.c
> +++ b/arch/hexagon/mm/init.c
> @@ -55,7 +55,6 @@ void __init mem_init(void)
>   {
>   	/*  No idea where this is actually declared.  Seems to evade LXR.  */
>   	memblock_free_all();
> -	mem_init_print_info(NULL);
>   
>   	/*
>   	 *  To-Do:  someone somewhere should wipe out the bootmem map
> diff --git a/arch/ia64/mm/init.c b/arch/ia64/mm/init.c
> index 16d0d7d22657..83280e2df807 100644
> --- a/arch/ia64/mm/init.c
> +++ b/arch/ia64/mm/init.c
> @@ -659,7 +659,6 @@ mem_init (void)
>   	set_max_mapnr(max_low_pfn);
>   	high_memory = __va(max_low_pfn * PAGE_SIZE);
>   	memblock_free_all();
> -	mem_init_print_info(NULL);
>   
>   	/*
>   	 * For fsyscall entrpoints with no light-weight handler, use the ordinary
> diff --git a/arch/m68k/mm/init.c b/arch/m68k/mm/init.c
> index 14c1e541451c..1759ab875d47 100644
> --- a/arch/m68k/mm/init.c
> +++ b/arch/m68k/mm/init.c
> @@ -153,5 +153,4 @@ void __init mem_init(void)
>   	/* this will put all memory onto the freelists */
>   	memblock_free_all();
>   	init_pointer_tables();
> -	mem_init_print_info(NULL);
>   }
> diff --git a/arch/microblaze/mm/init.c b/arch/microblaze/mm/init.c
> index 05cf1fb3f5ff..ab55c70380a5 100644
> --- a/arch/microblaze/mm/init.c
> +++ b/arch/microblaze/mm/init.c
> @@ -131,7 +131,6 @@ void __init mem_init(void)
>   	highmem_setup();
>   #endif
>   
> -	mem_init_print_info(NULL);
>   	mem_init_done = 1;
>   }
>   
> diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
> index 8315c871c435..fa9b4a487a47 100644
> --- a/arch/mips/loongson64/numa.c
> +++ b/arch/mips/loongson64/numa.c
> @@ -178,7 +178,6 @@ void __init mem_init(void)
>   	high_memory = (void *) __va(get_num_physpages() << PAGE_SHIFT);
>   	memblock_free_all();
>   	setup_zero_pages();	/* This comes from node 0 */
> -	mem_init_print_info(NULL);
>   }
>   
>   /* All PCI device belongs to logical Node-0 */
> diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
> index 5cb73bf74a8b..c36358758969 100644
> --- a/arch/mips/mm/init.c
> +++ b/arch/mips/mm/init.c
> @@ -467,7 +467,6 @@ void __init mem_init(void)
>   	memblock_free_all();
>   	setup_zero_pages();	/* Setup zeroed pages.  */
>   	mem_init_free_highmem();
> -	mem_init_print_info(NULL);
>   
>   #ifdef CONFIG_64BIT
>   	if ((unsigned long) &_text > (unsigned long) CKSEG0)
> diff --git a/arch/mips/sgi-ip27/ip27-memory.c b/arch/mips/sgi-ip27/ip27-memory.c
> index 87bb6945ec25..6173684b5aaa 100644
> --- a/arch/mips/sgi-ip27/ip27-memory.c
> +++ b/arch/mips/sgi-ip27/ip27-memory.c
> @@ -420,5 +420,4 @@ void __init mem_init(void)
>   	high_memory = (void *) __va(get_num_physpages() << PAGE_SHIFT);
>   	memblock_free_all();
>   	setup_zero_pages();	/* This comes from node 0 */
> -	mem_init_print_info(NULL);
>   }
> diff --git a/arch/nds32/mm/init.c b/arch/nds32/mm/init.c
> index fa86f7b2f416..f63f839738c4 100644
> --- a/arch/nds32/mm/init.c
> +++ b/arch/nds32/mm/init.c
> @@ -191,7 +191,6 @@ void __init mem_init(void)
>   
>   	/* this will put all low memory onto the freelists */
>   	memblock_free_all();
> -	mem_init_print_info(NULL);
>   
>   	pr_info("virtual kernel memory layout:\n"
>   		"    fixmap  : 0x%08lx - 0x%08lx   (%4ld kB)\n"
> diff --git a/arch/nios2/mm/init.c b/arch/nios2/mm/init.c
> index 61862dbb0e32..613fcaa5988a 100644
> --- a/arch/nios2/mm/init.c
> +++ b/arch/nios2/mm/init.c
> @@ -71,7 +71,6 @@ void __init mem_init(void)
>   
>   	/* this will put all memory onto the freelists */
>   	memblock_free_all();
> -	mem_init_print_info(NULL);
>   }
>   
>   void __init mmu_init(void)
> diff --git a/arch/openrisc/mm/init.c b/arch/openrisc/mm/init.c
> index bf9b2310fc93..d5641198b90c 100644
> --- a/arch/openrisc/mm/init.c
> +++ b/arch/openrisc/mm/init.c
> @@ -211,8 +211,6 @@ void __init mem_init(void)
>   	/* this will put all low memory onto the freelists */
>   	memblock_free_all();
>   
> -	mem_init_print_info(NULL);
> -
>   	printk("mem_init_done ...........................................\n");
>   	mem_init_done = 1;
>   	return;
> diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
> index 9ca4e4ff6895..591a4e939415 100644
> --- a/arch/parisc/mm/init.c
> +++ b/arch/parisc/mm/init.c
> @@ -573,8 +573,6 @@ void __init mem_init(void)
>   #endif
>   		parisc_vmalloc_start = SET_MAP_OFFSET(MAP_START);
>   
> -	mem_init_print_info(NULL);
> -
>   #if 0
>   	/*
>   	 * Do not expose the virtual kernel memory layout to userspace.
> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
> index 4e8ce6d85232..7e11c4cb08b8 100644
> --- a/arch/powerpc/mm/mem.c
> +++ b/arch/powerpc/mm/mem.c
> @@ -312,7 +312,6 @@ void __init mem_init(void)
>   		(mfspr(SPRN_TLB1CFG) & TLBnCFG_N_ENTRY) - 1;
>   #endif
>   
> -	mem_init_print_info(NULL);
>   #ifdef CONFIG_PPC32
>   	pr_info("Kernel virtual memory layout:\n");
>   #ifdef CONFIG_KASAN
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 7f5036fbee8c..3c5ee3b7d811 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -102,7 +102,6 @@ void __init mem_init(void)
>   	high_memory = (void *)(__va(PFN_PHYS(max_low_pfn)));
>   	memblock_free_all();
>   
> -	mem_init_print_info(NULL);
>   	print_vm_layout();
>   }
>   
> diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
> index 0e76b2127dc6..8ac710de1ab1 100644
> --- a/arch/s390/mm/init.c
> +++ b/arch/s390/mm/init.c
> @@ -209,8 +209,6 @@ void __init mem_init(void)
>   	setup_zero_pages();	/* Setup zeroed pages. */
>   
>   	cmma_init_nodat();
> -
> -	mem_init_print_info(NULL);
>   }
>   
>   void free_initmem(void)
> diff --git a/arch/sh/mm/init.c b/arch/sh/mm/init.c
> index 0db6919af8d3..168d7d4dd735 100644
> --- a/arch/sh/mm/init.c
> +++ b/arch/sh/mm/init.c
> @@ -359,7 +359,6 @@ void __init mem_init(void)
>   
>   	vsyscall_init();
>   
> -	mem_init_print_info(NULL);
>   	pr_info("virtual kernel memory layout:\n"
>   		"    fixmap  : 0x%08lx - 0x%08lx   (%4ld kB)\n"
>   		"    vmalloc : 0x%08lx - 0x%08lx   (%4ld MB)\n"
> diff --git a/arch/sparc/mm/init_32.c b/arch/sparc/mm/init_32.c
> index 6139c5700ccc..1e9f577f084d 100644
> --- a/arch/sparc/mm/init_32.c
> +++ b/arch/sparc/mm/init_32.c
> @@ -292,8 +292,6 @@ void __init mem_init(void)
>   
>   		map_high_region(start_pfn, end_pfn);
>   	}
> -
> -	mem_init_print_info(NULL);
>   }
>   
>   void sparc_flush_page_to_ram(struct page *page)
> diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
> index 182bb7bdaa0a..e454f179cf5d 100644
> --- a/arch/sparc/mm/init_64.c
> +++ b/arch/sparc/mm/init_64.c
> @@ -2520,7 +2520,6 @@ void __init mem_init(void)
>   	}
>   	mark_page_reserved(mem_map_zero);
>   
> -	mem_init_print_info(NULL);
>   
>   	if (tlb_type == cheetah || tlb_type == cheetah_plus)
>   		cheetah_ecache_flush_init();
> diff --git a/arch/um/kernel/mem.c b/arch/um/kernel/mem.c
> index 9242dc91d751..9019ff5905b1 100644
> --- a/arch/um/kernel/mem.c
> +++ b/arch/um/kernel/mem.c
> @@ -54,7 +54,6 @@ void __init mem_init(void)
>   	memblock_free_all();
>   	max_low_pfn = totalram_pages();
>   	max_pfn = max_low_pfn;
> -	mem_init_print_info(NULL);
>   	kmalloc_ok = 1;
>   }
>   
> diff --git a/arch/x86/mm/init_32.c b/arch/x86/mm/init_32.c
> index da31c2635ee4..21ffb03f6c72 100644
> --- a/arch/x86/mm/init_32.c
> +++ b/arch/x86/mm/init_32.c
> @@ -755,8 +755,6 @@ void __init mem_init(void)
>   	after_bootmem = 1;
>   	x86_init.hyper.init_after_bootmem();
>   
> -	mem_init_print_info(NULL);
> -
>   	/*
>   	 * Check boundaries twice: Some fundamental inconsistencies can
>   	 * be detected at build time already.
> diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
> index 5430c81eefc9..aa8387aab9c1 100644
> --- a/arch/x86/mm/init_64.c
> +++ b/arch/x86/mm/init_64.c
> @@ -1350,8 +1350,6 @@ void __init mem_init(void)
>   		kclist_add(&kcore_vsyscall, (void *)VSYSCALL_ADDR, PAGE_SIZE, KCORE_USER);
>   
>   	preallocate_vmalloc_pages();
> -
> -	mem_init_print_info(NULL);
>   }
>   
>   #ifdef CONFIG_DEFERRED_STRUCT_PAGE_INIT
> diff --git a/arch/xtensa/mm/init.c b/arch/xtensa/mm/init.c
> index 2daeba9e454e..6a32b2cf2718 100644
> --- a/arch/xtensa/mm/init.c
> +++ b/arch/xtensa/mm/init.c
> @@ -119,7 +119,6 @@ void __init mem_init(void)
>   
>   	memblock_free_all();
>   
> -	mem_init_print_info(NULL);
>   	pr_info("virtual kernel memory layout:\n"
>   #ifdef CONFIG_KASAN
>   		"    kasan   : 0x%08lx - 0x%08lx  (%5lu MB)\n"
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 89314651dd62..c2e0b3495c5a 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2373,7 +2373,7 @@ extern unsigned long free_reserved_area(void *start, void *end,
>   					int poison, const char *s);
>   
>   extern void adjust_managed_page_count(struct page *page, long count);
> -extern void mem_init_print_info(const char *str);
> +extern void mem_init_print_info(void);
>   
>   extern void reserve_bootmem_region(phys_addr_t start, phys_addr_t end);
>   
> diff --git a/init/main.c b/init/main.c
> index 53b278845b88..5581af5b4cb7 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -830,6 +830,7 @@ static void __init mm_init(void)
>   	report_meminit();
>   	stack_depot_init();
>   	mem_init();
> +	mem_init_print_info();
>   	/* page_owner must be initialized after buddy is ready */
>   	page_ext_init_flatmem_late();
>   	kmem_cache_init();
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 55d938297ce6..b5fe5962837c 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -7728,7 +7728,7 @@ unsigned long free_reserved_area(void *start, void *end, int poison, const char
>   	return pages;
>   }
>   
> -void __init mem_init_print_info(const char *str)
> +void __init mem_init_print_info(void)
>   {
>   	unsigned long physpages, codesize, datasize, rosize, bss_size;
>   	unsigned long init_code_size, init_data_size;
> @@ -7767,17 +7767,17 @@ void __init mem_init_print_info(const char *str)
>   #ifdef	CONFIG_HIGHMEM
>   		", %luK highmem"
>   #endif
> -		"%s%s)\n",
> +		")\n",
>   		nr_free_pages() << (PAGE_SHIFT - 10),
>   		physpages << (PAGE_SHIFT - 10),
>   		codesize >> 10, datasize >> 10, rosize >> 10,
>   		(init_data_size + init_code_size) >> 10, bss_size >> 10,
>   		(physpages - totalram_pages() - totalcma_pages) << (PAGE_SHIFT - 10),
> -		totalcma_pages << (PAGE_SHIFT - 10),
> +		totalcma_pages << (PAGE_SHIFT - 10)
>   #ifdef	CONFIG_HIGHMEM
> -		totalhigh_pages() << (PAGE_SHIFT - 10),
> +		, totalhigh_pages() << (PAGE_SHIFT - 10)
>   #endif
> -		str ? ", " : "", str ? str : "");
> +		);
>   }
>   
>   /**
