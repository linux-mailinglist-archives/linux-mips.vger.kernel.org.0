Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4120C8D28B
	for <lists+linux-mips@lfdr.de>; Wed, 14 Aug 2019 13:54:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726230AbfHNLyu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 14 Aug 2019 07:54:50 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:44422 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726166AbfHNLyu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 14 Aug 2019 07:54:50 -0400
Received: by mail-lj1-f195.google.com with SMTP id e24so7822319ljg.11
        for <linux-mips@vger.kernel.org>; Wed, 14 Aug 2019 04:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=TT7cWQoPf4v7vmBGOC0bMv6q73++CO3GV4GXJFPVNeA=;
        b=WKf0+wPFKoIYMO5qh+2jldBhKqPaGIS7zN2WP3XTC7yNznqHvPA2jQbLDmH9or7N+M
         bHeNC9auT/bJ5aFGT1Te/Y1p4caGJRgaTujJZoa6Iey2cO4/ID6jL3piRq0WZrlMkFiu
         1mh3XvfVxpfNKTDmUkaWKb+1oRiDSe++StHb/KgKtGjPyuQDlhUwzYUk+i4+YoXTD8Bf
         voQ17ERucP/gipzIjd+aAo37lYSrFnOT5c8Uv2gvrc7Szyzam4GrhA8UmZ8GCRNed+ls
         lLV2r18fUDYMQmEhzks5igRGUAXyGKnC6gQGj4JQbhSdRkLaPPlr5pBVdviHpaKyhCaL
         aH8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TT7cWQoPf4v7vmBGOC0bMv6q73++CO3GV4GXJFPVNeA=;
        b=kzFbjXbhh7/Q7VlYyYUgTHAHofpXFkQ22PuFF8nEi3gvULBUIhOFxj/jqbdx4qSK/g
         6pNnKX6Mt4/lsKW998H3rGp8AGgLsht1oJMTUSvPvQwWpIReH4t9M9xSn8JT7R82Drka
         5mKGDeY6IaoBhdk2vGBW1mWQVaSj4t4wtteWjbfFv2WWQRCLZmGIbHTo98+RqyYwjU4L
         EoTK4wCt+fF29XZNISbVHs36E56o/vQNlCslK6Kr6L6voN8CXjg3Nld1cFC9aFBrQSrY
         RFdUMNsksh+pgwBzOwv04L1AAXrTmTNdke35Nj9Eu5kpwNDbuXNaxZROOYZPVo0iRCtp
         aeBA==
X-Gm-Message-State: APjAAAUPjH3+WvZ3tgp/bhCTLTduQ24QLxe+EQ8ljspr6c28F4eb47Ge
        apvb9rsHCJZZHnMg3dC1zsBotUVQ
X-Google-Smtp-Source: APXvYqwlgYt5YOIrwRv3G5qu/Swxv9omlHhoI26RzOhoOA70ChEBGYNhwNpdK53MZzImhpTLe0ZZBg==
X-Received: by 2002:a2e:990f:: with SMTP id v15mr11984421lji.127.1565783686326;
        Wed, 14 Aug 2019 04:54:46 -0700 (PDT)
Received: from mobilestation ([95.79.14.48])
        by smtp.gmail.com with ESMTPSA id q17sm7167110lfb.26.2019.08.14.04.54.44
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 14 Aug 2019 04:54:45 -0700 (PDT)
Date:   Wed, 14 Aug 2019 14:54:43 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, paul.burton@mips.com,
        yasha.che3@gmail.com, aurelien@aurel32.net, sfr@canb.auug.org.au,
        matt.redfearn@mips.com, chenhc@lemote.com
Subject: Re: [PATCH 1/7] MIPS: init: Drop boot_mem_map
Message-ID: <20190814115441.r6zkx3wnr7oetsfp@mobilestation>
References: <20190808075013.4852-1-jiaxun.yang@flygoat.com>
 <20190808075013.4852-2-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190808075013.4852-2-jiaxun.yang@flygoat.com>
User-Agent: NeoMutt/20180716
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello Jiaxun,

On Thu, Aug 08, 2019 at 03:50:07PM +0800, Jiaxun Yang wrote:
> boot_mem_map was introduced very early and cannot handle memory maps
> with nid. Nowadays, memblock can exactly replace boot_mem_map.
> 

Seeing how much changes the patch introduces, the message doesn't explains
the way the replacement and cleanup is performed. I suggest to extend the
commit message with more descriptive text of what the patch does, what is
removed and why.
As an alternative for better readability the patch could be split up
into a series of smaller commits.

> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/mips/include/asm/bootinfo.h |  15 --
>  arch/mips/kernel/setup.c         | 352 ++++++++-----------------------
>  arch/mips/mm/init.c              |  51 +----
>  3 files changed, 91 insertions(+), 327 deletions(-)
> 
> diff --git a/arch/mips/include/asm/bootinfo.h b/arch/mips/include/asm/bootinfo.h
> index 235bc2f52113..f711ccf7bace 100644
> --- a/arch/mips/include/asm/bootinfo.h
> +++ b/arch/mips/include/asm/bootinfo.h
> @@ -94,21 +94,6 @@ extern unsigned long mips_machtype;
>  #define BOOT_MEM_INIT_RAM	4
>  #define BOOT_MEM_NOMAP		5
>  
> -/*
> - * A memory map that's built upon what was determined
> - * or specified on the command line.
> - */
> -struct boot_mem_map {
> -	int nr_map;
> -	struct boot_mem_map_entry {
> -		phys_addr_t addr;	/* start of memory segment */
> -		phys_addr_t size;	/* size of memory segment */
> -		long type;		/* type of memory segment */
> -	} map[BOOT_MEM_MAP_MAX];
> -};
> -
> -extern struct boot_mem_map boot_mem_map;
> -
>  extern void add_memory_region(phys_addr_t start, phys_addr_t size, long type);
>  extern void detect_memory_region(phys_addr_t start, phys_addr_t sz_min,  phys_addr_t sz_max);
>  
> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> index ab349d2381c3..ceef8240f171 100644
> --- a/arch/mips/kernel/setup.c
> +++ b/arch/mips/kernel/setup.c
> @@ -63,8 +63,6 @@ unsigned long mips_machtype __read_mostly = MACH_UNKNOWN;
>  
>  EXPORT_SYMBOL(mips_machtype);
>  
> -struct boot_mem_map boot_mem_map;
> -
>  static char __initdata command_line[COMMAND_LINE_SIZE];
>  char __initdata arcs_cmdline[COMMAND_LINE_SIZE];
>  
> @@ -92,8 +90,10 @@ EXPORT_SYMBOL(ARCH_PFN_OFFSET);
>  
>  void __init add_memory_region(phys_addr_t start, phys_addr_t size, long type)
>  {
> -	int x = boot_mem_map.nr_map;
> -	int i;
> +	/*
> +	 * Note: This function only exists for historical reason,
> +	 * new code should use memblock_add or memblock_add_node instead.
> +	 */
>  

Since now we discourage to use this method to add the memory regions, what about
printing an info/warning regarding the function being deprecated, for instance
by using pr_*_once()? In addition, since you are going to mark this function
as deprecated, it's better to remove it' usage at least from the generic MIPS code:
arch/mips/kernel/setup.c
arch/mips/kernel/prom.c

On the other hand we can have a good use of this method. Since platforms are using
it to declare the whole memory space, we could perform the regions sanity checks right
here at add-time. For instance this concerns PHYS_OFFSET/PFN_OFFSET checks, HIGHMEM-related
test and so on. We could also perform the {max,min}_low_pfn, max_pfn, high{start,end}_pfn,
calculations right here. In this case the corresponding bootmem_init() code can be just
removed.

What do you think? Paul, your opinion?

>  	/*
>  	 * If the region reaches the top of the physical address space, adjust
> @@ -108,38 +108,20 @@ void __init add_memory_region(phys_addr_t start, phys_addr_t size, long type)
>  		return;
>  	}
>  
> -	/*
> -	 * Try to merge with existing entry, if any.
> -	 */
> -	for (i = 0; i < boot_mem_map.nr_map; i++) {
> -		struct boot_mem_map_entry *entry = boot_mem_map.map + i;
> -		unsigned long top;
> -
> -		if (entry->type != type)
> -			continue;
> -
> -		if (start + size < entry->addr)
> -			continue;			/* no overlap */
> +	memblock_add(start, size);
> +	/* Reserve any memory except the ordinary RAM ranges. */
> +	switch (type) {
> +	case BOOT_MEM_RAM:
> +		break;
>  
> -		if (entry->addr + entry->size < start)
> -			continue;			/* no overlap */
> +	case BOOT_MEM_NOMAP: /* Discard the range from the system. */
> +		memblock_remove(start, size);
> +		break;
>  
> -		top = max(entry->addr + entry->size, start + size);
> -		entry->addr = min(entry->addr, start);
> -		entry->size = top - entry->addr;
> -
> -		return;
> +	default: /* Reserve the rest of the memory types at boot time */
> +		memblock_reserve(start, size);
> +		break;
>  	}
> -
> -	if (boot_mem_map.nr_map == BOOT_MEM_MAP_MAX) {
> -		pr_err("Ooops! Too many entries in the memory map!\n");
> -		return;
> -	}
> -
> -	boot_mem_map.map[x].addr = start;
> -	boot_mem_map.map[x].size = size;
> -	boot_mem_map.map[x].type = type;
> -	boot_mem_map.nr_map++;
>  }
>  
>  void __init detect_memory_region(phys_addr_t start, phys_addr_t sz_min, phys_addr_t sz_max)
> @@ -161,70 +143,6 @@ void __init detect_memory_region(phys_addr_t start, phys_addr_t sz_min, phys_add
>  	add_memory_region(start, size, BOOT_MEM_RAM);
>  }
>  
> -static bool __init __maybe_unused memory_region_available(phys_addr_t start,
> -							  phys_addr_t size)
> -{
> -	int i;
> -	bool in_ram = false, free = true;
> -
> -	for (i = 0; i < boot_mem_map.nr_map; i++) {
> -		phys_addr_t start_, end_;
> -
> -		start_ = boot_mem_map.map[i].addr;
> -		end_ = boot_mem_map.map[i].addr + boot_mem_map.map[i].size;
> -
> -		switch (boot_mem_map.map[i].type) {
> -		case BOOT_MEM_RAM:
> -			if (start >= start_ && start + size <= end_)
> -				in_ram = true;
> -			break;
> -		case BOOT_MEM_RESERVED:
> -		case BOOT_MEM_NOMAP:
> -			if ((start >= start_ && start < end_) ||
> -			    (start < start_ && start + size >= start_))
> -				free = false;
> -			break;
> -		default:
> -			continue;
> -		}
> -	}
> -
> -	return in_ram && free;
> -}
> -
> -static void __init print_memory_map(void)
> -{
> -	int i;
> -	const int field = 2 * sizeof(unsigned long);
> -
> -	for (i = 0; i < boot_mem_map.nr_map; i++) {
> -		printk(KERN_INFO " memory: %0*Lx @ %0*Lx ",
> -		       field, (unsigned long long) boot_mem_map.map[i].size,
> -		       field, (unsigned long long) boot_mem_map.map[i].addr);
> -
> -		switch (boot_mem_map.map[i].type) {
> -		case BOOT_MEM_RAM:
> -			printk(KERN_CONT "(usable)\n");
> -			break;
> -		case BOOT_MEM_INIT_RAM:
> -			printk(KERN_CONT "(usable after init)\n");
> -			break;
> -		case BOOT_MEM_ROM_DATA:
> -			printk(KERN_CONT "(ROM data)\n");
> -			break;
> -		case BOOT_MEM_RESERVED:
> -			printk(KERN_CONT "(reserved)\n");
> -			break;
> -		case BOOT_MEM_NOMAP:
> -			printk(KERN_CONT "(nomap)\n");
> -			break;
> -		default:
> -			printk(KERN_CONT "type %lu\n", boot_mem_map.map[i].type);
> -			break;
> -		}
> -	}
> -}
> -
>  /*
>   * Manage initrd
>   */
> @@ -376,8 +294,11 @@ static void __init bootmem_init(void)
>  
>  static void __init bootmem_init(void)
>  {
> -	phys_addr_t ramstart = PHYS_ADDR_MAX;
> -	int i;
> +	struct memblock_region *mem;
> +	phys_addr_t ramstart, ramend;
> +
> +	ramstart = memblock_start_of_DRAM();
> +	ramend = memblock_end_of_DRAM();
>  
>  	/*
>  	 * Sanity check any INITRD first. We don't take it into account
> @@ -398,115 +319,61 @@ static void __init bootmem_init(void)
>  	min_low_pfn = ~0UL;
>  	max_low_pfn = 0;

This initialization is pointless, since max_low_pfn is static and will be zero anyway,
while min_low_pfn will be reinitialized in the next few lines of code.

>  
> -	/* Find the highest and lowest page frame numbers we have available. */
> -	for (i = 0; i < boot_mem_map.nr_map; i++) {
> -		unsigned long start, end;
> -
> -		if (boot_mem_map.map[i].type != BOOT_MEM_RAM)
> -			continue;
> +#ifdef CONFIG_MIPS_AUTO_PFN_OFFSET
> +	min_low_pfn = PFN_UP(ramstart);
> +	ARCH_PFN_OFFSET = PFN_UP(ramstart);
> +#else
> +	/*
> +	 * Reserve any memory between the start of RAM and PHYS_OFFSET
> +	 */
> +	if (PFN_UP(ramstart) > PHYS_OFFSET)
> +		memblock_reserve(PHYS_OFFSET, PFN_UP(ramstart) - PHYS_OFFSET);

PFN_UP gives you pfn, while PHYS_OFFSET is actual address offset. This is completely
wrong. The former condition was: "(ramstart > PHYS_OFFSET)".
As I see it, this condition could be combined with the next one.

In addition, you are reserving something, which isn't going to be in memory anyway.
Is this correct?

>  
> -		start = PFN_UP(boot_mem_map.map[i].addr);
> -		end = PFN_DOWN(boot_mem_map.map[i].addr
> -				+ boot_mem_map.map[i].size);
> +	if (PFN_UP(ramstart) > ARCH_PFN_OFFSET) {
> +		pr_info("Wasting %lu bytes for tracking %lu unused pages\n",
> +			(unsigned long)((PFN_UP(ramstart) - ARCH_PFN_OFFSET) * sizeof(struct page)),
> +			(unsigned long)(PFN_UP(ramstart) - ARCH_PFN_OFFSET));
> +	} else if (ARCH_PFN_OFFSET - PFN_UP(ramstart) > 0UL) {
> +		pr_info("%lu free pages won't be used\n",
> +			(unsigned long)(ARCH_PFN_OFFSET - PFN_UP(ramstart)));
> +	}
> +	min_low_pfn = ARCH_PFN_OFFSET;
> +#endif
>  
> -		ramstart = min(ramstart, boot_mem_map.map[i].addr);
> +	max_pfn = PFN_DOWN(ramend);

So the next loop is only used to calculate the max_low_pfn and min_low_pfn is
always set to ARCH_PFN_OFFSET, right?
Then as far as I could track the min_low_pfn usage, it isn't utilized that much
in the rest of the system. According to the following changes, you don't use it
after this place either. In this case saving any value in it might be just pointless.
Before your patch, the variable was used to save the lowest low-memory pfn boundary,
which then would be used to set the low memory limit. See the loop:
"Install all valid RAM ranges to the memblock memory region." But since you
removed it, there is no point in the code above. We might need to somehow change
the memoblock lower limit here as well.

> +	for_each_memblock(memory, mem) {
> +		unsigned long start = memblock_region_memory_base_pfn(mem);
> +		unsigned long end = memblock_region_memory_end_pfn(mem);
>  
> -#ifndef CONFIG_HIGHMEM
>  		/*
>  		 * Skip highmem here so we get an accurate max_low_pfn if low
>  		 * memory stops short of high memory.
>  		 * If the region overlaps HIGHMEM_START, end is clipped so
>  		 * max_pfn excludes the highmem portion.
>  		 */
> +		if (memblock_is_nomap(mem))
> +			continue;

Sorry, I don't see a reason why do we have to skip the nomap regions here.
Could you explain?

>  		if (start >= PFN_DOWN(HIGHMEM_START))
>  			continue;
>  		if (end > PFN_DOWN(HIGHMEM_START))
>  			end = PFN_DOWN(HIGHMEM_START);
> -#endif
> -
>  		if (end > max_low_pfn)
>  			max_low_pfn = end;
> -		if (start < min_low_pfn)
> -			min_low_pfn = start;
>  	}
>  
> -	if (min_low_pfn >= max_low_pfn)
> -		panic("Incorrect memory mapping !!!");

Hmm, removing this sanity check doesn't seem right. What if a platform code
haven't added any memory region?

> -
> -#ifdef CONFIG_MIPS_AUTO_PFN_OFFSET
> -	ARCH_PFN_OFFSET = PFN_UP(ramstart);
> -#else
> -	/*
> -	 * Reserve any memory between the start of RAM and PHYS_OFFSET
> -	 */
> -	if (ramstart > PHYS_OFFSET) {
> -		add_memory_region(PHYS_OFFSET, ramstart - PHYS_OFFSET,
> -				  BOOT_MEM_RESERVED);
> -		memblock_reserve(PHYS_OFFSET, ramstart - PHYS_OFFSET);
> -	}
> -
> -	if (min_low_pfn > ARCH_PFN_OFFSET) {
> -		pr_info("Wasting %lu bytes for tracking %lu unused pages\n",
> -			(min_low_pfn - ARCH_PFN_OFFSET) * sizeof(struct page),
> -			min_low_pfn - ARCH_PFN_OFFSET);
> -	} else if (ARCH_PFN_OFFSET - min_low_pfn > 0UL) {
> -		pr_info("%lu free pages won't be used\n",
> -			ARCH_PFN_OFFSET - min_low_pfn);
> +#ifdef CONFIG_HIGHMEM
> +	if (max_pfn > PFN_DOWN(HIGHMEM_START)) {
> +		highstart_pfn = max_low_pfn;
> +		highend_pfn = max_pfn;
>  	}
> -	min_low_pfn = ARCH_PFN_OFFSET;
>  #endif

Are you sure, that 'max_low_pfn' always ends up at the 'highstart_pfn'?
I am not. Even if 'max_pfn' is greater than HIGHMEM_START, since the memory
space may have wholes, the max_low_pfn might be initialized with something
smaller than HIGHMEM_START.

One more problem I see here. What happens if CONFIG_HIGHMEM is disabled and
max_pfn exceeds HIGHMEM_START? We'll end up with unreachable memory...

>  
>  	/*
> -	 * Determine low and high memory ranges
> +	 * In any case the added to the memblock memory regions
> +	 * (highmem/lowmem, available/reserved, etc) are considered
> +	 * as present, so inform sparsemem about them.
>  	 */
> -	max_pfn = max_low_pfn;
> -	if (max_low_pfn > PFN_DOWN(HIGHMEM_START)) {
> -#ifdef CONFIG_HIGHMEM
> -		highstart_pfn = PFN_DOWN(HIGHMEM_START);
> -		highend_pfn = max_low_pfn;
> -#endif
> -		max_low_pfn = PFN_DOWN(HIGHMEM_START);
> -	}
> -
> -	/* Install all valid RAM ranges to the memblock memory region */
> -	for (i = 0; i < boot_mem_map.nr_map; i++) {
> -		unsigned long start, end;
> -
> -		start = PFN_UP(boot_mem_map.map[i].addr);
> -		end = PFN_DOWN(boot_mem_map.map[i].addr
> -				+ boot_mem_map.map[i].size);
> -
> -		if (start < min_low_pfn)
> -			start = min_low_pfn;
> -#ifndef CONFIG_HIGHMEM
> -		/* Ignore highmem regions if highmem is unsupported */
> -		if (end > max_low_pfn)
> -			end = max_low_pfn;
> -#endif

Here we used to set the memory limits if platform code defined something
invalid. Like unreachable memory or a memory less than PHYS_OFFSET.
Since this code is going to be removed, the system might end up with
incorrect memory layout.

> -		if (end <= start)
> -			continue;
> -
> -		memblock_add_node(PFN_PHYS(start), PFN_PHYS(end - start), 0);
> -
> -		/* Reserve any memory except the ordinary RAM ranges. */
> -		switch (boot_mem_map.map[i].type) {
> -		case BOOT_MEM_RAM:
> -			break;
> -		case BOOT_MEM_NOMAP: /* Discard the range from the system. */
> -			memblock_remove(PFN_PHYS(start), PFN_PHYS(end - start));
> -			continue;
> -		default: /* Reserve the rest of the memory types at boot time */
> -			memblock_reserve(PFN_PHYS(start), PFN_PHYS(end - start));
> -			break;
> -		}
> -
> -		/*
> -		 * In any case the added to the memblock memory regions
> -		 * (highmem/lowmem, available/reserved, etc) are considered
> -		 * as present, so inform sparsemem about them.
> -		 */
> -		memory_present(0, start, end);
> -	}
> +	memblocks_present();
>  
>  	/*
>  	 * Reserve initrd memory if needed.
> @@ -528,8 +395,9 @@ static int __init early_parse_mem(char *p)
>  	 * size.
>  	 */
>  	if (usermem == 0) {
> -		boot_mem_map.nr_map = 0;
>  		usermem = 1;
> +		memblock_remove(memblock_start_of_DRAM(),
> +			memblock_end_of_DRAM() - memblock_start_of_DRAM());
>  	}
>  	start = 0;
>  	size = memparse(p, &p);
> @@ -586,14 +454,13 @@ early_param("memmap", early_parse_memmap);
>  unsigned long setup_elfcorehdr, setup_elfcorehdr_size;
>  static int __init early_parse_elfcorehdr(char *p)
>  {
> -	int i;
> +	struct memblock_region *mem;
>  
>  	setup_elfcorehdr = memparse(p, &p);
>  
> -	for (i = 0; i < boot_mem_map.nr_map; i++) {
> -		unsigned long start = boot_mem_map.map[i].addr;
> -		unsigned long end = (boot_mem_map.map[i].addr +
> -				     boot_mem_map.map[i].size);
> +	 for_each_memblock(memory, mem) {
> +		unsigned long start = mem->base;
> +		unsigned long end = mem->end;
>  		if (setup_elfcorehdr >= start && setup_elfcorehdr < end) {
>  			/*
>  			 * Reserve from the elf core header to the end of
> @@ -613,47 +480,20 @@ static int __init early_parse_elfcorehdr(char *p)
>  early_param("elfcorehdr", early_parse_elfcorehdr);
>  #endif
>  
> -static void __init arch_mem_addpart(phys_addr_t mem, phys_addr_t end, int type)
> -{
> -	phys_addr_t size;
> -	int i;
> -
> -	size = end - mem;
> -	if (!size)
> -		return;
> -
> -	/* Make sure it is in the boot_mem_map */
> -	for (i = 0; i < boot_mem_map.nr_map; i++) {
> -		if (mem >= boot_mem_map.map[i].addr &&
> -		    mem < (boot_mem_map.map[i].addr +
> -			   boot_mem_map.map[i].size))
> -			return;
> -	}
> -	add_memory_region(mem, size, type);
> -}
> -
>  #ifdef CONFIG_KEXEC
> -static inline unsigned long long get_total_mem(void)
> -{
> -	unsigned long long total;
> -
> -	total = max_pfn - min_low_pfn;
> -	return total << PAGE_SHIFT;
> -}
> -
>  static void __init mips_parse_crashkernel(void)
>  {
>  	unsigned long long total_mem;
>  	unsigned long long crash_size, crash_base;
>  	int ret;
>  
> -	total_mem = get_total_mem();
> +	total_mem = memblock_phys_mem_size();
>  	ret = parse_crashkernel(boot_command_line, total_mem,
>  				&crash_size, &crash_base);
>  	if (ret != 0 || crash_size <= 0)
>  		return;
>  
> -	if (!memory_region_available(crash_base, crash_size)) {
> +	if (!memblock_find_in_range(crash_base, crash_base + crash_size, crash_size, 0)) {
>  		pr_warn("Invalid memory region reserved for crash kernel\n");
>  		return;
>  	}
> @@ -686,6 +526,17 @@ static void __init request_crashkernel(struct resource *res)
>  }
>  #endif /* !defined(CONFIG_KEXEC)  */
>  
> +static void __init check_kernel_sections_mem(void)
> +{
> +	phys_addr_t start = PFN_DOWN(__pa_symbol(&_text)) << PAGE_SHIFT;
> +	phys_addr_t size = (PFN_UP(__pa_symbol(&_end)) - start) << PAGE_SHIFT;
> +
> +	if (!memblock_is_region_memory(start, size)) {
> +		pr_info("Kernel sections are not in the memory maps\n");
> +		memblock_add(start, size);
> +	}
> +}
> +
>  #define USE_PROM_CMDLINE	IS_ENABLED(CONFIG_MIPS_CMDLINE_FROM_BOOTLOADER)
>  #define USE_DTB_CMDLINE		IS_ENABLED(CONFIG_MIPS_CMDLINE_FROM_DTB)
>  #define EXTEND_WITH_PROM	IS_ENABLED(CONFIG_MIPS_CMDLINE_DTB_EXTEND)
> @@ -731,25 +582,6 @@ static void __init arch_mem_init(char **cmdline_p)
>  	plat_mem_setup();
>  	memblock_set_bottom_up(true);
>  
> -	/*
> -	 * Make sure all kernel memory is in the maps.  The "UP" and
> -	 * "DOWN" are opposite for initdata since if it crosses over
> -	 * into another memory section you don't want that to be
> -	 * freed when the initdata is freed.
> -	 */
> -	arch_mem_addpart(PFN_DOWN(__pa_symbol(&_text)) << PAGE_SHIFT,
> -			 PFN_UP(__pa_symbol(&_edata)) << PAGE_SHIFT,
> -			 BOOT_MEM_RAM);
> -	arch_mem_addpart(PFN_UP(__pa_symbol(&__init_begin)) << PAGE_SHIFT,
> -			 PFN_DOWN(__pa_symbol(&__init_end)) << PAGE_SHIFT,
> -			 BOOT_MEM_INIT_RAM);
> -	arch_mem_addpart(PFN_DOWN(__pa_symbol(&__bss_start)) << PAGE_SHIFT,
> -			 PFN_UP(__pa_symbol(&__bss_stop)) << PAGE_SHIFT,
> -			 BOOT_MEM_RAM);
> -

I see you replaced this code with check_kernel_sections_mem(). Neat.
You could also replace "<< PAGE_SHIFT" with PFN_PHYS() macro in the function.

> -	pr_info("Determined physical RAM map:\n");
> -	print_memory_map();

I'll miss you "print_memory_map()"... =) Nothing is going to print a detected
physical memory layout at boot time. Someone might disagree, but I found this
very useful...

> -
>  #if defined(CONFIG_CMDLINE_BOOL) && defined(CONFIG_CMDLINE_OVERRIDE)
>  	strlcpy(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
>  #else
> @@ -783,14 +615,17 @@ static void __init arch_mem_init(char **cmdline_p)
>  
>  	parse_early_param();
>  
> -	if (usermem) {
> -		pr_info("User-defined physical RAM map:\n");
> -		print_memory_map();
> -	}
> +	if (usermem)
> +		pr_info("User-defined physical RAM map overwrite\n");
> +
> +	check_kernel_sections_mem();
>  
>  	early_init_fdt_reserve_self();
>  	early_init_fdt_scan_reserved_mem();
>  
> +#ifndef CONFIG_NUMA
> +	memblock_set_node(0, PHYS_ADDR_MAX, &memblock.memory, 0);
> +#endif
>  	bootmem_init();
>  
>  	/*
> @@ -835,7 +670,7 @@ static void __init arch_mem_init(char **cmdline_p)
>  
>  static void __init resource_init(void)
>  {
> -	int i;
> +	struct memblock_region *region;
>  
>  	if (UNCAC_BASE != IO_BASE)
>  		return;
> @@ -847,16 +682,10 @@ static void __init resource_init(void)
>  	bss_resource.start = __pa_symbol(&__bss_start);
>  	bss_resource.end = __pa_symbol(&__bss_stop) - 1;
>  
> -	for (i = 0; i < boot_mem_map.nr_map; i++) {
> +	for_each_memblock(memory, region) {
> +		phys_addr_t start = __pfn_to_phys(memblock_region_memory_base_pfn(region));
> +		phys_addr_t end = __pfn_to_phys(memblock_region_memory_end_pfn(region)) - 1;

I haven't seen __pfn_to_phys() macro usage in the MIPS code. Instead the upper-case
versions (PFN_PHYS()/PHYS_PFN()) are utilized. It might be better to follow the
MIPS-platform way. They are identical at this moment though. Paul?

>  		struct resource *res;
> -		unsigned long start, end;
> -
> -		start = boot_mem_map.map[i].addr;
> -		end = boot_mem_map.map[i].addr + boot_mem_map.map[i].size - 1;
> -		if (start >= HIGHMEM_START)
> -			continue;
> -		if (end >= HIGHMEM_START)
> -			end = HIGHMEM_START - 1;
>  
>  		res = memblock_alloc(sizeof(struct resource), SMP_CACHE_BYTES);
>  		if (!res)
> @@ -865,20 +694,7 @@ static void __init resource_init(void)
>  
>  		res->start = start;
>  		res->end = end;
> -		res->flags = IORESOURCE_MEM | IORESOURCE_BUSY;
> -
> -		switch (boot_mem_map.map[i].type) {
> -		case BOOT_MEM_RAM:
> -		case BOOT_MEM_INIT_RAM:
> -		case BOOT_MEM_ROM_DATA:
> -			res->name = "System RAM";

Is that right to also discard the "System RAM" resource name?

> -			res->flags |= IORESOURCE_SYSRAM;
> -			break;
> -		case BOOT_MEM_RESERVED:
> -		case BOOT_MEM_NOMAP:
> -		default:
> -			res->name = "reserved";
> -		}
> +		res->flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
>  
>  		request_resource(&iomem_resource, res);
>  
> diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
> index 8a038b30d3c4..2bb8ebf0d2d5 100644
> --- a/arch/mips/mm/init.c
> +++ b/arch/mips/mm/init.c
> @@ -271,25 +271,17 @@ void __init fixrange_init(unsigned long start, unsigned long end,
>  
>  unsigned __weak platform_maar_init(unsigned num_pairs)
>  {
> -	struct maar_config cfg[BOOT_MEM_MAP_MAX];
> -	unsigned i, num_configured, num_cfg = 0;
> -
> -	for (i = 0; i < boot_mem_map.nr_map; i++) {
> -		switch (boot_mem_map.map[i].type) {
> -		case BOOT_MEM_RAM:
> -		case BOOT_MEM_INIT_RAM:
> -			break;
> -		default:
> -			continue;
> -		}
> +	struct maar_config cfg[32];
> +	unsigned int num_configured, num_cfg = 0;
> +	struct memblock_region *mem;
>  
> +	for_each_memblock(memory, mem) {
>  		/* Round lower up */
> -		cfg[num_cfg].lower = boot_mem_map.map[i].addr;
> +		cfg[num_cfg].lower = __pfn_to_phys(memblock_region_memory_base_pfn(mem));

The same thing with PFN_PHYS()/PHYS_PFN().

>  		cfg[num_cfg].lower = (cfg[num_cfg].lower + 0xffff) & ~0xffff;
>  
>  		/* Round upper down */
> -		cfg[num_cfg].upper = boot_mem_map.map[i].addr +
> -					boot_mem_map.map[i].size;
> +		cfg[num_cfg].upper = __pfn_to_phys(memblock_region_memory_end_pfn(mem));

PFN_PHYS()/PHYS_PFN() again.

>  		cfg[num_cfg].upper = (cfg[num_cfg].upper & ~0xffff) - 1;
>  
>  		cfg[num_cfg].attrs = MIPS_MAAR_S;
> @@ -382,33 +374,6 @@ void maar_init(void)
>  }
>  
>  #ifndef CONFIG_NEED_MULTIPLE_NODES
> -int page_is_ram(unsigned long pagenr)
> -{
> -	int i;
> -
> -	for (i = 0; i < boot_mem_map.nr_map; i++) {
> -		unsigned long addr, end;
> -
> -		switch (boot_mem_map.map[i].type) {
> -		case BOOT_MEM_RAM:
> -		case BOOT_MEM_INIT_RAM:
> -			break;
> -		default:
> -			/* not usable memory */
> -			continue;
> -		}
> -
> -		addr = PFN_UP(boot_mem_map.map[i].addr);
> -		end = PFN_DOWN(boot_mem_map.map[i].addr +
> -			       boot_mem_map.map[i].size);
> -
> -		if (pagenr >= addr && pagenr < end)
> -			return 1;
> -	}
> -
> -	return 0;
> -}
> -
>  void __init paging_init(void)
>  {
>  	unsigned long max_zone_pfns[MAX_NR_ZONES];
> @@ -452,9 +417,7 @@ static inline void mem_init_free_highmem(void)
>  		return;
>  
>  	for (tmp = highstart_pfn; tmp < highend_pfn; tmp++) {
> -		struct page *page = pfn_to_page(tmp);
> -
> -		if (!page_is_ram(tmp))
> +		if (!memblock_is_memory(PFN_PHYS(tmp)))

See. You've used PFN_PHYS() here instead of __pfn_to_phys().

-Sergey

>  			SetPageReserved(page);
>  		else
>  			free_highmem_page(page);
> -- 
> 2.22.0
> 
