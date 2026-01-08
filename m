Return-Path: <linux-mips+bounces-12784-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF02D046BA
	for <lists+linux-mips@lfdr.de>; Thu, 08 Jan 2026 17:34:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9AB5A31EA785
	for <lists+linux-mips@lfdr.de>; Thu,  8 Jan 2026 15:25:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81778438FE4;
	Thu,  8 Jan 2026 09:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K4CM4fLS"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0B9356A1E
	for <linux-mips@vger.kernel.org>; Thu,  8 Jan 2026 09:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767864262; cv=none; b=MufT3ZIwMDRt5L1nIWQ1plihlcJWxR5Y63HSFkF1UTJ2gGYqWov5VxdMivJXLPAmZETwU5wwuQ55OFyHrp20t6gbdOHdDzitF0RSRCeAnZECuNfgJWP0dUHjj40u7k+dlUYiYQimEZQz9nPfHkYs4L7zvtK3Bs03kkVir7+Jnpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767864262; c=relaxed/simple;
	bh=eCAFwZItVaL9X0VRtZazJLMFqaZWFCVs7aA1WeF3a6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NeaiBYTr8Vsgxf+4uDJaeEMI98CwYLeVH9g929G14jGGfVkn3BTu2HCXu104m2E5GQPh0+1N9fymGn+v1eZ5fNTuw24srpVUj7FTrmAWklVRs5BZ7iQ65MVcHq5dqzH28H7oMLNUMjRH4vLidryxCjIk/9XTRKpWOfc8eDf1grU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K4CM4fLS; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-382fa663249so19618411fa.0
        for <linux-mips@vger.kernel.org>; Thu, 08 Jan 2026 01:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767864251; x=1768469051; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O50KBUnGST61ZefwYqUJR7pUIsjZIrmO+en74z/l02I=;
        b=K4CM4fLS+J13nqAhhKllJivCa5v6S2OobRjp8bGFuVsdj3k7OAhQ6CbYAt9mrUpGDq
         cx+z0altteu4YDpSAVCe7SmtUv9lnKmAs/EF2a/O58la7/I6FGXfY0MqtNl1eevxxMQQ
         8ZdzYvp2ssqPi3q83cTa0LQ/PZorJIdkDbowB51hDVx7yAVkXmK6ZD9H80+kEpE10rwk
         TKfsNL7t8ZDmdJicBIpoDDe9xL9fLV98prJZ7v5Qxfg2iT1ZzhBQaGuZy95UdNxQcM1S
         L/FeWn5fXWzKP8ylFEfuHvQXd9dYazzZr2Vbn7Q6YmCgbmxLNikqjbdMr9aACVUqVj9I
         LCMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767864251; x=1768469051;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O50KBUnGST61ZefwYqUJR7pUIsjZIrmO+en74z/l02I=;
        b=miOiwG2CnIjL6CnizJhv8D9HHNG800177pdUlfVgBV2XxRH3G8xy7gvD0njOJZs2AY
         zaDeYmixjg39CRzU5xokbw6JLZ4AbLZxglglkH2a4ryfxKJRc0kKmhJ7971qFrzXtpSZ
         gG839TgDdLmyWsMbaY4Jaioaz3R4HsEAFC5Lj8YqedJadxFbSE2pIWUu6ID2UEYct8tb
         uvjveMV+vxTqg+pbf6vB3UAu7zzqxA7bSkbYY2X3iSSiy4Bj7ctukojwDx06x3WCyORG
         OBrlFKwX7KsLTfSwRSX4V12AnKh4cy4VhbniE8u1gTUNyxg6JUqws/5iPWmt1YXOXdqN
         QDvA==
X-Forwarded-Encrypted: i=1; AJvYcCX37FhWk8L0VuZCtkmA/wWJSh6beenlLOfSh7teXG3n2Yj4sOsyrWsJUVGhz5qPDfIf+Nxx0qG2arqe@vger.kernel.org
X-Gm-Message-State: AOJu0YwV5PVQspNy9e8SZSJ0BkqGCIdDZ54YVf2H4sII9eetxW7DeyQl
	7B6CxkvGWcXJXTmyvbTkBYKzAMFe8r+pd1xDptBJ59k+PGx2y0bF1F1G
X-Gm-Gg: AY/fxX7a/4rM8a+gSUb5+PATOtiXOnWnmF0uVJYLi55pC3wtO7jLKKcoLkr3oYpn2k4
	gaVkXaOOT8R0NtuSY2fab8GHT0BiHG4H266M5iQeNjeILZoVqN0E5OjY7kZbtgBlHxVmdZmvnfG
	inNq48I36M6CvWDRtFv0VGpxXdztMVeN1MFs1xfBk8hqRDweLUTbfWtVPyBXVEbRu9Mzw/jF1YL
	k+01CJxXcjUeOug5T/PvLwZMq/gPWB6dbgcwvOFqVKI96+ySFuHkC5PsG0qcN69z1SFm4yOYZ93
	a+zRJEE2SreRcE8PPqw9G5cgEwmswfgJOBSc2wdrufe9mfO3s8sAy4Nvuej4wVieuZ5yKUulyuS
	HYjTjn3MvC0So1PYBrKh0zMpB6cOsRmJieDsK9QfIf+A4TX62uE7VtKhbVlXEBlZoHgvp/SDftJ
	yoSoOMgBk/uorq2Q==
X-Google-Smtp-Source: AGHT+IGdcXNcrSJMUo5rzOhpUERfjTIptDpq2P2C9H1U0wCIgEF/AiEiE+KdQDO/6ObzG0ofCqAsmQ==
X-Received: by 2002:a05:6512:2350:b0:592:f8c0:c8de with SMTP id 2adb3069b0e04-59b6ef08fffmr1929382e87.13.1767864249992;
        Thu, 08 Jan 2026 01:24:09 -0800 (PST)
Received: from [10.38.18.76] ([213.255.186.37])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b6bebfa94sm1498950e87.55.2026.01.08.01.24.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 01:24:09 -0800 (PST)
Message-ID: <5f9a0269-f9d5-4ee0-bf57-62148d762f7f@gmail.com>
Date: Thu, 8 Jan 2026 11:24:07 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 22/28] arch, mm: consolidate initialization of nodes,
 zones and memory map
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Alex Shi <alexs@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>, Borislav Petkov <bp@alien8.de>,
 Brian Cain <bcain@kernel.org>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "David S. Miller" <davem@davemloft.net>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
 Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Jonathan Corbet <corbet@lwn.net>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Magnus Lindholm <linmag7@gmail.com>, Matt Turner <mattst88@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Michal Hocko <mhocko@suse.com>, Michal Simek <monstr@monstr.eu>,
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Pratyush Yadav <pratyush@kernel.org>,
 Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>,
 Stafford Horne <shorne@gmail.com>, Suren Baghdasaryan <surenb@google.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>,
 Vineet Gupta <vgupta@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, x86@kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org, matti Vaittinen <mazziesaccount@gmail.com>
References: <20260102070005.65328-1-rppt@kernel.org>
 <20260102070005.65328-23-rppt@kernel.org>
Content-Language: en-US
From: Kalle Niemi <kaleposti@gmail.com>
In-Reply-To: <20260102070005.65328-23-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/2/26 08:59, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> To initialize node, zone and memory map data structures every architecture
> calls free_area_init() during setup_arch() and passes it an array of zone
> limits.
> 
> Beside code duplication it creates "interesting" ordering cases between
> allocation and initialization of hugetlb and the memory map. Some
> architectures allocate hugetlb pages very early in setup_arch() in certain
> cases, some only create hugetlb CMA areas in setup_arch() and sometimes
> hugetlb allocations happen mm_core_init().
> 
> With arch_zone_limits_init() helper available now on all architectures it
> is no longer necessary to call free_area_init() from architecture setup
> code. Rather core MM initialization can call arch_zone_limits_init() in a
> single place.
> 
> This allows to unify ordering of hugetlb vs memory map allocation and
> initialization.
> 
> Remove the call to free_area_init() from architecture specific code and
> place it in a new mm_core_init_early() function that is called immediately
> after setup_arch().
> 
> After this refactoring it is possible to consolidate hugetlb allocations
> and eliminate differences in ordering of hugetlb and memory map
> initialization among different architectures.
> 
> As the first step of this consolidation move hugetlb_bootmem_alloc() to
> mm_core_early_init().
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>   arch/alpha/mm/init.c                 |  9 +--------
>   arch/arc/mm/init.c                   |  5 -----
>   arch/arm/mm/init.c                   | 16 ----------------
>   arch/arm64/mm/init.c                 |  4 ----
>   arch/csky/kernel/setup.c             |  4 ----
>   arch/hexagon/mm/init.c               | 12 ------------
>   arch/loongarch/include/asm/pgtable.h |  2 --
>   arch/loongarch/kernel/setup.c        |  2 --
>   arch/loongarch/mm/init.c             |  8 --------
>   arch/m68k/mm/init.c                  |  3 ---
>   arch/m68k/mm/mcfmmu.c                |  3 ---
>   arch/m68k/mm/motorola.c              |  6 +-----
>   arch/m68k/mm/sun3mmu.c               |  9 ---------
>   arch/microblaze/mm/init.c            |  7 -------
>   arch/mips/loongson64/numa.c          |  4 ----
>   arch/mips/mm/init.c                  |  5 -----
>   arch/mips/sgi-ip27/ip27-memory.c     |  4 ----
>   arch/nios2/mm/init.c                 |  6 ------
>   arch/openrisc/mm/init.c              | 10 ----------
>   arch/parisc/mm/init.c                |  9 ---------
>   arch/powerpc/mm/mem.c                |  4 ----
>   arch/riscv/mm/init.c                 |  9 ---------
>   arch/s390/mm/init.c                  |  5 -----
>   arch/sh/mm/init.c                    |  5 -----
>   arch/sparc/mm/init_64.c              | 11 -----------
>   arch/sparc/mm/srmmu.c                |  7 -------
>   arch/um/kernel/mem.c                 |  5 -----
>   arch/x86/mm/init.c                   | 10 ----------
>   arch/x86/mm/init_32.c                |  1 -
>   arch/x86/mm/init_64.c                |  2 --
>   arch/x86/mm/mm_internal.h            |  1 -
>   arch/xtensa/mm/init.c                |  4 ----
>   include/linux/mm.h                   |  4 ++--
>   init/main.c                          |  1 +
>   mm/mm_init.c                         | 18 ++++++++++--------
>   35 files changed, 15 insertions(+), 200 deletions(-)
> 
> diff --git a/arch/alpha/mm/init.c b/arch/alpha/mm/init.c
> index cd0cb1abde5f..9531cbc761c0 100644
> --- a/arch/alpha/mm/init.c
> +++ b/arch/alpha/mm/init.c
> @@ -220,17 +220,10 @@ void __init arch_zone_limits_init(unsigned long *max_zone_pfn)
>   }
>   
>   /*
> - * paging_init() sets up the memory map.
> + * paging_init() initializes the kernel's ZERO_PGE.
>    */
>   void __init paging_init(void)
>   {
> -	unsigned long max_zone_pfn[MAX_NR_ZONES] = {0, };
> -
> -	/* Initialize mem_map[].  */
> -	arch_zone_limits_init(max_zone_pfn);
> -	free_area_init(max_zone_pfn);
> -
> -	/* Initialize the kernel's ZERO_PGE. */
>   	memset(absolute_pointer(ZERO_PGE), 0, PAGE_SIZE);
>   }
>   
> diff --git a/arch/arc/mm/init.c b/arch/arc/mm/init.c
> index ff7974d38011..a5e92f46e5d1 100644
> --- a/arch/arc/mm/init.c
> +++ b/arch/arc/mm/init.c
> @@ -102,8 +102,6 @@ void __init arch_zone_limits_init(unsigned long *max_zone_pfn)
>    */
>   void __init setup_arch_memory(void)
>   {
> -	unsigned long max_zone_pfn[MAX_NR_ZONES] = { 0 };
> -
>   	setup_initial_init_mm(_text, _etext, _edata, _end);
>   
>   	/* first page of system - kernel .vector starts here */
> @@ -158,9 +156,6 @@ void __init setup_arch_memory(void)
>   	arch_pfn_offset = min(min_low_pfn, min_high_pfn);
>   	kmap_init();
>   #endif /* CONFIG_HIGHMEM */
> -
> -	arch_zone_limits_init(max_zone_pfn);
> -	free_area_init(max_zone_pfn);
>   }
>   
>   void __init arch_mm_preinit(void)
> diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
> index bdcc3639681f..a8f7b4084715 100644
> --- a/arch/arm/mm/init.c
> +++ b/arch/arm/mm/init.c
> @@ -118,15 +118,6 @@ void __init arch_zone_limits_init(unsigned long *max_zone_pfn)
>   #endif
>   }
>   
> -static void __init zone_sizes_init(unsigned long min, unsigned long max_low,
> -	unsigned long max_high)
> -{
> -	unsigned long max_zone_pfn[MAX_NR_ZONES] = { 0 };
> -
> -	arch_zone_limits_init(max_zone_pfn);
> -	free_area_init(max_zone_pfn);
> -}
> -
>   #ifdef CONFIG_HAVE_ARCH_PFN_VALID
>   int pfn_valid(unsigned long pfn)
>   {
> @@ -222,13 +213,6 @@ void __init bootmem_init(void)
>   	 * done after the fixed reservations
>   	 */
>   	sparse_init();
> -
> -	/*
> -	 * Now free the memory - free_area_init needs
> -	 * the sparse mem_map arrays initialized by sparse_init()
> -	 * for memmap_init_zone(), otherwise all PFNs are invalid.
> -	 */
> -	zone_sizes_init(min_low_pfn, max_low_pfn, max_pfn);
>   }
>   
>   /*
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index 06815d34cc11..3641e88ea871 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -134,7 +134,6 @@ void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
>   
>   static void __init dma_limits_init(void)
>   {
> -	unsigned long max_zone_pfns[MAX_NR_ZONES]  = {0};
>   	phys_addr_t __maybe_unused acpi_zone_dma_limit;
>   	phys_addr_t __maybe_unused dt_zone_dma_limit;
>   	phys_addr_t __maybe_unused dma32_phys_limit =
> @@ -160,9 +159,6 @@ static void __init dma_limits_init(void)
>   #endif
>   	if (!arm64_dma_phys_limit)
>   		arm64_dma_phys_limit = PHYS_MASK + 1;
> -
> -	arch_zone_limits_init(max_zone_pfns);
> -	free_area_init(max_zone_pfns);
>   }
>   
>   int pfn_is_map_memory(unsigned long pfn)
> diff --git a/arch/csky/kernel/setup.c b/arch/csky/kernel/setup.c
> index 8968815d93e6..4bf3c01ead3a 100644
> --- a/arch/csky/kernel/setup.c
> +++ b/arch/csky/kernel/setup.c
> @@ -63,7 +63,6 @@ static void __init csky_memblock_init(void)
>   {
>   	unsigned long lowmem_size = PFN_DOWN(LOWMEM_LIMIT - PHYS_OFFSET_OFFSET);
>   	unsigned long sseg_size = PFN_DOWN(SSEG_SIZE - PHYS_OFFSET_OFFSET);
> -	unsigned long max_zone_pfn[MAX_NR_ZONES] = { 0 };
>   	signed long size;
>   
>   	memblock_reserve(__pa(_start), _end - _start);
> @@ -101,9 +100,6 @@ static void __init csky_memblock_init(void)
>   	memblock_set_current_limit(PFN_PHYS(max_low_pfn));
>   
>   	dma_contiguous_reserve(0);
> -
> -	arch_zone_limits_init(max_zone_pfn);
> -	free_area_init(max_zone_pfn);
>   }
>   
>   void __init setup_arch(char **cmdline_p)
> diff --git a/arch/hexagon/mm/init.c b/arch/hexagon/mm/init.c
> index e2c9487d8d34..07086dbd33fd 100644
> --- a/arch/hexagon/mm/init.c
> +++ b/arch/hexagon/mm/init.c
> @@ -66,20 +66,8 @@ void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
>   	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
>   }
>   
> -/*
> - * In order to set up page allocator "nodes",
> - * somebody has to call free_area_init() for UMA.
> - *
> - * In this mode, we only have one pg_data_t
> - * structure: contig_mem_data.
> - */
>   static void __init paging_init(void)
>   {
> -	unsigned long max_zone_pfn[MAX_NR_ZONES] = {0, };
> -
> -	arch_zone_limits_init(max_zone_pfn);
> -	free_area_init(max_zone_pfn);  /*  sets up the zonelists and mem_map  */
> -
>   	/*
>   	 * Set the init_mm descriptors "context" value to point to the
>   	 * initial kernel segment table's physical address.
> diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
> index f41a648a3d9e..c33b3bcb733e 100644
> --- a/arch/loongarch/include/asm/pgtable.h
> +++ b/arch/loongarch/include/asm/pgtable.h
> @@ -353,8 +353,6 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
>   	return pte;
>   }
>   
> -extern void paging_init(void);
> -
>   #define pte_none(pte)		(!(pte_val(pte) & ~_PAGE_GLOBAL))
>   #define pte_present(pte)	(pte_val(pte) & (_PAGE_PRESENT | _PAGE_PROTNONE))
>   #define pte_no_exec(pte)	(pte_val(pte) & _PAGE_NO_EXEC)
> diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
> index 20cb6f306456..708ac025db71 100644
> --- a/arch/loongarch/kernel/setup.c
> +++ b/arch/loongarch/kernel/setup.c
> @@ -621,8 +621,6 @@ void __init setup_arch(char **cmdline_p)
>   	prefill_possible_map();
>   #endif
>   
> -	paging_init();
> -
>   #ifdef CONFIG_KASAN
>   	kasan_init();
>   #endif
> diff --git a/arch/loongarch/mm/init.c b/arch/loongarch/mm/init.c
> index 17235f87eafb..c331bf69d2ec 100644
> --- a/arch/loongarch/mm/init.c
> +++ b/arch/loongarch/mm/init.c
> @@ -68,14 +68,6 @@ void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
>   	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
>   }
>   
> -void __init paging_init(void)
> -{
> -	unsigned long max_zone_pfns[MAX_NR_ZONES];
> -
> -	arch_zone_limits_init(max_zone_pfns);
> -	free_area_init(max_zone_pfns);
> -}
> -
>   void __ref free_initmem(void)
>   {
>   	free_initmem_default(POISON_FREE_INITMEM);
> diff --git a/arch/m68k/mm/init.c b/arch/m68k/mm/init.c
> index 6b1d9d2434b5..53b71f786c27 100644
> --- a/arch/m68k/mm/init.c
> +++ b/arch/m68k/mm/init.c
> @@ -69,13 +69,10 @@ void __init paging_init(void)
>   	 * page_alloc get different views of the world.
>   	 */
>   	unsigned long end_mem = memory_end & PAGE_MASK;
> -	unsigned long max_zone_pfn[MAX_NR_ZONES] = { 0, };
>   
>   	high_memory = (void *) end_mem;
>   
>   	empty_zero_page = memblock_alloc_or_panic(PAGE_SIZE, PAGE_SIZE);
> -	arch_zone_limits_init(max_zone_pfn);
> -	free_area_init(max_zone_pfn);
>   }
>   
>   #endif /* CONFIG_MMU */
> diff --git a/arch/m68k/mm/mcfmmu.c b/arch/m68k/mm/mcfmmu.c
> index 24a6f7bbd1ce..3418fd864237 100644
> --- a/arch/m68k/mm/mcfmmu.c
> +++ b/arch/m68k/mm/mcfmmu.c
> @@ -39,7 +39,6 @@ void __init paging_init(void)
>   	pte_t *pg_table;
>   	unsigned long address, size;
>   	unsigned long next_pgtable;
> -	unsigned long max_zone_pfn[MAX_NR_ZONES] = { 0 };
>   	int i;
>   
>   	empty_zero_page = memblock_alloc_or_panic(PAGE_SIZE, PAGE_SIZE);
> @@ -73,8 +72,6 @@ void __init paging_init(void)
>   	}
>   
>   	current->mm = NULL;
> -	arch_zone_limits_init(max_zone_pfn);
> -	free_area_init(max_zone_pfn);
>   }
>   
>   int cf_tlb_miss(struct pt_regs *regs, int write, int dtlb, int extension_word)
> diff --git a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
> index d6ccd23caf61..127a3fa69f4c 100644
> --- a/arch/m68k/mm/motorola.c
> +++ b/arch/m68k/mm/motorola.c
> @@ -429,7 +429,6 @@ DECLARE_VM_GET_PAGE_PROT
>    */
>   void __init paging_init(void)
>   {
> -	unsigned long max_zone_pfn[MAX_NR_ZONES] = { 0, };
>   	unsigned long min_addr, max_addr;
>   	unsigned long addr;
>   	int i;
> @@ -511,12 +510,9 @@ void __init paging_init(void)
>   	set_fc(USER_DATA);
>   
>   #ifdef DEBUG
> -	printk ("before free_area_init\n");
> +	printk ("before node_set_state\n");
>   #endif
>   	for (i = 0; i < m68k_num_memory; i++)
>   		if (node_present_pages(i))
>   			node_set_state(i, N_NORMAL_MEMORY);
> -
> -	arch_zone_limits_init(max_zone_pfn);
> -	free_area_init(max_zone_pfn);
>   }
> diff --git a/arch/m68k/mm/sun3mmu.c b/arch/m68k/mm/sun3mmu.c
> index fdd69cc4240c..c801677f7df8 100644
> --- a/arch/m68k/mm/sun3mmu.c
> +++ b/arch/m68k/mm/sun3mmu.c
> @@ -41,7 +41,6 @@ void __init paging_init(void)
>   	unsigned long address;
>   	unsigned long next_pgtable;
>   	unsigned long bootmem_end;
> -	unsigned long max_zone_pfn[MAX_NR_ZONES] = { 0, };
>   	unsigned long size;
>   
>   	empty_zero_page = memblock_alloc_or_panic(PAGE_SIZE, PAGE_SIZE);
> @@ -80,14 +79,6 @@ void __init paging_init(void)
>   	mmu_emu_init(bootmem_end);
>   
>   	current->mm = NULL;
> -
> -	/* memory sizing is a hack stolen from motorola.c..  hope it works for us */
> -	arch_zone_limits_init(max_zone_pfn);
> -
> -	/* I really wish I knew why the following change made things better...  -- Sam */
> -	free_area_init(max_zone_pfn);
> -
> -
>   }
>   
>   static const pgprot_t protection_map[16] = {
> diff --git a/arch/microblaze/mm/init.c b/arch/microblaze/mm/init.c
> index 54da60b81094..848cdee1380c 100644
> --- a/arch/microblaze/mm/init.c
> +++ b/arch/microblaze/mm/init.c
> @@ -69,22 +69,15 @@ void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
>    */
>   static void __init paging_init(void)
>   {
> -	unsigned long zones_size[MAX_NR_ZONES];
>   	int idx;
>   
>   	/* Setup fixmaps */
>   	for (idx = 0; idx < __end_of_fixed_addresses; idx++)
>   		clear_fixmap(idx);
>   
> -	/* Clean every zones */
> -	memset(zones_size, 0, sizeof(zones_size));
> -
>   #ifdef CONFIG_HIGHMEM
>   	highmem_init();
>   #endif
> -	arch_zone_limits_init(zones_size);
> -	/* We don't have holes in memory map */
> -	free_area_init(zones_size);
>   }
>   
>   void __init setup_memory(void)
> diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
> index f72a58f87878..2cd95020df08 100644
> --- a/arch/mips/loongson64/numa.c
> +++ b/arch/mips/loongson64/numa.c
> @@ -162,11 +162,7 @@ void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
>   
>   void __init paging_init(void)
>   {
> -	unsigned long zones_size[MAX_NR_ZONES] = {0, };
> -
>   	pagetable_init();
> -	arch_zone_limits_init(zones_size);
> -	free_area_init(zones_size);
>   }
>   
>   /* All PCI device belongs to logical Node-0 */
> diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
> index ab08249cfede..c479c42141c3 100644
> --- a/arch/mips/mm/init.c
> +++ b/arch/mips/mm/init.c
> @@ -417,12 +417,7 @@ void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
>   
>   void __init paging_init(void)
>   {
> -	unsigned long max_zone_pfns[MAX_NR_ZONES];
> -
>   	pagetable_init();
> -
> -	arch_zone_limits_init(max_zone_pfns);
> -	free_area_init(max_zone_pfns);
>   }
>   
>   #ifdef CONFIG_64BIT
> diff --git a/arch/mips/sgi-ip27/ip27-memory.c b/arch/mips/sgi-ip27/ip27-memory.c
> index babeb0e07687..082651facf4f 100644
> --- a/arch/mips/sgi-ip27/ip27-memory.c
> +++ b/arch/mips/sgi-ip27/ip27-memory.c
> @@ -413,9 +413,5 @@ void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
>   
>   void __init paging_init(void)
>   {
> -	unsigned long zones_size[MAX_NR_ZONES] = {0, };
> -
>   	pagetable_init();
> -	arch_zone_limits_init(zones_size);
> -	free_area_init(zones_size);
>   }
> diff --git a/arch/nios2/mm/init.c b/arch/nios2/mm/init.c
> index 2cb666a65d9e..6b22f1995c16 100644
> --- a/arch/nios2/mm/init.c
> +++ b/arch/nios2/mm/init.c
> @@ -51,15 +51,9 @@ void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
>    */
>   void __init paging_init(void)
>   {
> -	unsigned long max_zone_pfn[MAX_NR_ZONES] = { 0 };
> -
>   	pagetable_init();
>   	pgd_current = swapper_pg_dir;
>   
> -	arch_zone_limits_init(max_zone_pfn);
> -	/* pass the memory from the bootmem allocator to the main allocator */
> -	free_area_init(max_zone_pfn);
> -
>   	flush_dcache_range((unsigned long)empty_zero_page,
>   			(unsigned long)empty_zero_page + PAGE_SIZE);
>   }
> diff --git a/arch/openrisc/mm/init.c b/arch/openrisc/mm/init.c
> index 67de93e7a685..78fb0734cdbc 100644
> --- a/arch/openrisc/mm/init.c
> +++ b/arch/openrisc/mm/init.c
> @@ -47,14 +47,6 @@ void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
>   	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
>   }
>   
> -static void __init zone_sizes_init(void)
> -{
> -	unsigned long max_zone_pfn[MAX_NR_ZONES] = { 0 };
> -
> -	arch_zone_limits_init(max_zone_pfn);
> -	free_area_init(max_zone_pfn);
> -}
> -
>   extern const char _s_kernel_ro[], _e_kernel_ro[];
>   
>   /*
> @@ -145,8 +137,6 @@ void __init paging_init(void)
>   
>   	map_ram();
>   
> -	zone_sizes_init();
> -
>   	/* self modifying code ;) */
>   	/* Since the old TLB miss handler has been running up until now,
>   	 * the kernel pages are still all RW, so we can still modify the
> diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
> index dc5bd3efe738..ce6f09ab7a90 100644
> --- a/arch/parisc/mm/init.c
> +++ b/arch/parisc/mm/init.c
> @@ -698,14 +698,6 @@ void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
>   	max_zone_pfns[ZONE_NORMAL] = PFN_DOWN(memblock_end_of_DRAM());
>   }
>   
> -static void __init parisc_bootmem_free(void)
> -{
> -	unsigned long max_zone_pfn[MAX_NR_ZONES] = { 0, };
> -
> -	arch_zone_limits_init(max_zone_pfn);
> -	free_area_init(max_zone_pfn);
> -}
> -
>   void __init paging_init(void)
>   {
>   	setup_bootmem();
> @@ -716,7 +708,6 @@ void __init paging_init(void)
>   	flush_tlb_all_local(NULL);
>   
>   	sparse_init();
> -	parisc_bootmem_free();
>   }
>   
>   static void alloc_btlb(unsigned long start, unsigned long end, int *slot,
> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
> index 32c496bfab4f..72d4993192a6 100644
> --- a/arch/powerpc/mm/mem.c
> +++ b/arch/powerpc/mm/mem.c
> @@ -237,7 +237,6 @@ void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
>    */
>   void __init paging_init(void)
>   {
> -	unsigned long max_zone_pfns[MAX_NR_ZONES];
>   	unsigned long long total_ram = memblock_phys_mem_size();
>   	phys_addr_t top_of_ram = memblock_end_of_DRAM();
>   	int zone_dma_bits;
> @@ -269,9 +268,6 @@ void __init paging_init(void)
>   
>   	zone_dma_limit = DMA_BIT_MASK(zone_dma_bits);
>   
> -	arch_zone_limits_init(max_zone_pfns);
> -	free_area_init(max_zone_pfns);
> -
>   	mark_nonram_nosave();
>   }
>   
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 97e8661fbcff..79b4792578c4 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -87,14 +87,6 @@ void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
>   	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
>   }
>   
> -static void __init zone_sizes_init(void)
> -{
> -	unsigned long max_zone_pfns[MAX_NR_ZONES] = { 0, };
> -
> -	arch_zone_limits_init(max_zone_pfns);
> -	free_area_init(max_zone_pfns);
> -}
> -
>   #if defined(CONFIG_MMU) && defined(CONFIG_DEBUG_VM)
>   
>   #define LOG2_SZ_1K  ilog2(SZ_1K)
> @@ -1443,7 +1435,6 @@ void __init misc_mem_init(void)
>   	/* The entire VMEMMAP region has been populated. Flush TLB for this region */
>   	local_flush_tlb_kernel_range(VMEMMAP_START, VMEMMAP_END);
>   #endif
> -	zone_sizes_init();
>   	arch_reserve_crashkernel();
>   	memblock_dump_all();
>   }
> diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
> index 1c11ad84dddb..9ec608b5cbb1 100644
> --- a/arch/s390/mm/init.c
> +++ b/arch/s390/mm/init.c
> @@ -97,14 +97,9 @@ void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
>    */
>   void __init paging_init(void)
>   {
> -	unsigned long max_zone_pfns[MAX_NR_ZONES];
> -
>   	vmem_map_init();
>   	sparse_init();
>   	zone_dma_limit = DMA_BIT_MASK(31);
> -	memset(max_zone_pfns, 0, sizeof(max_zone_pfns));
> -	arch_zone_limits_init(max_zone_pfns);
> -	free_area_init(max_zone_pfns);
>   }
>   
>   void mark_rodata_ro(void)
> diff --git a/arch/sh/mm/init.c b/arch/sh/mm/init.c
> index 5e7e63642611..3edee854b755 100644
> --- a/arch/sh/mm/init.c
> +++ b/arch/sh/mm/init.c
> @@ -271,7 +271,6 @@ void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
>   
>   void __init paging_init(void)
>   {
> -	unsigned long max_zone_pfns[MAX_NR_ZONES];
>   	unsigned long vaddr, end;
>   
>   	sh_mv.mv_mem_init();
> @@ -325,10 +324,6 @@ void __init paging_init(void)
>   	page_table_range_init(vaddr, end, swapper_pg_dir);
>   
>   	kmap_coherent_init();
> -
> -	memset(max_zone_pfns, 0, sizeof(max_zone_pfns));
> -	arch_zone_limits_init(max_zone_pfns);
> -	free_area_init(max_zone_pfns);
>   }
>   
>   unsigned int mem_init_done = 0;
> diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
> index fbaad449dfc9..931f872ce84a 100644
> --- a/arch/sparc/mm/init_64.c
> +++ b/arch/sparc/mm/init_64.c
> @@ -2459,17 +2459,6 @@ void __init paging_init(void)
>   
>   	kernel_physical_mapping_init();
>   
> -	{
> -		unsigned long max_zone_pfns[MAX_NR_ZONES];
> -
> -		memset(max_zone_pfns, 0, sizeof(max_zone_pfns));
> -
> -		max_zone_pfns[ZONE_NORMAL] = end_pfn;
> -
> -		arch_zone_limits_init(max_zone_pfns);
> -		free_area_init(max_zone_pfns);
> -	}
> -
>   	printk("Booting Linux...\n");
>   }
>   
> diff --git a/arch/sparc/mm/srmmu.c b/arch/sparc/mm/srmmu.c
> index 81e90151db90..1b24c5e8d73d 100644
> --- a/arch/sparc/mm/srmmu.c
> +++ b/arch/sparc/mm/srmmu.c
> @@ -970,13 +970,6 @@ void __init srmmu_paging_init(void)
>   	flush_tlb_all();
>   
>   	sparc_context_init(num_contexts);
> -
> -	{
> -		unsigned long max_zone_pfn[MAX_NR_ZONES] = { 0 };
> -
> -		arch_zone_limits_init(max_zone_pfn);
> -		free_area_init(max_zone_pfn);
> -	}
>   }
>   
>   void mmu_info(struct seq_file *m)
> diff --git a/arch/um/kernel/mem.c b/arch/um/kernel/mem.c
> index 2ac4e9debedd..89c8c8b94a79 100644
> --- a/arch/um/kernel/mem.c
> +++ b/arch/um/kernel/mem.c
> @@ -91,16 +91,11 @@ void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
>   
>   void __init paging_init(void)
>   {
> -	unsigned long max_zone_pfn[MAX_NR_ZONES] = { 0 };
> -
>   	empty_zero_page = (unsigned long *) memblock_alloc_low(PAGE_SIZE,
>   							       PAGE_SIZE);
>   	if (!empty_zero_page)
>   		panic("%s: Failed to allocate %lu bytes align=%lx\n",
>   		      __func__, PAGE_SIZE, PAGE_SIZE);
> -
> -	arch_zone_limits_init(max_zone_pfn);
> -	free_area_init(max_zone_pfn);
>   }
>   
>   /*
> diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
> index e7ef605a18d6..e52a262d3207 100644
> --- a/arch/x86/mm/init.c
> +++ b/arch/x86/mm/init.c
> @@ -1011,16 +1011,6 @@ void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
>   #endif
>   }
>   
> -void __init zone_sizes_init(void)
> -{
> -	unsigned long max_zone_pfns[MAX_NR_ZONES];
> -
> -	memset(max_zone_pfns, 0, sizeof(max_zone_pfns));
> -
> -	arch_zone_limits_init(max_zone_pfns);
> -	free_area_init(max_zone_pfns);
> -}
> -
>   __visible DEFINE_PER_CPU_ALIGNED(struct tlb_state, cpu_tlbstate) = {
>   	.loaded_mm = &init_mm,
>   	.next_asid = 1,
> diff --git a/arch/x86/mm/init_32.c b/arch/x86/mm/init_32.c
> index 8a34fff6ab2b..b55172118c91 100644
> --- a/arch/x86/mm/init_32.c
> +++ b/arch/x86/mm/init_32.c
> @@ -655,7 +655,6 @@ void __init paging_init(void)
>   	 */
>   	olpc_dt_build_devicetree();
>   	sparse_init();
> -	zone_sizes_init();
>   }
>   
>   /*
> diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
> index 9983017ecbe0..4daa40071c9f 100644
> --- a/arch/x86/mm/init_64.c
> +++ b/arch/x86/mm/init_64.c
> @@ -843,8 +843,6 @@ void __init paging_init(void)
>   	 */
>   	node_clear_state(0, N_MEMORY);
>   	node_clear_state(0, N_NORMAL_MEMORY);
> -
> -	zone_sizes_init();
>   }
>   
>   #define PAGE_UNUSED 0xFD
> diff --git a/arch/x86/mm/mm_internal.h b/arch/x86/mm/mm_internal.h
> index 097aadc250f7..7c4a41235323 100644
> --- a/arch/x86/mm/mm_internal.h
> +++ b/arch/x86/mm/mm_internal.h
> @@ -17,7 +17,6 @@ unsigned long kernel_physical_mapping_init(unsigned long start,
>   unsigned long kernel_physical_mapping_change(unsigned long start,
>   					     unsigned long end,
>   					     unsigned long page_size_mask);
> -void zone_sizes_init(void);
>   
>   extern int after_bootmem;
>   
> diff --git a/arch/xtensa/mm/init.c b/arch/xtensa/mm/init.c
> index 60299f359a3c..fe83a68335da 100644
> --- a/arch/xtensa/mm/init.c
> +++ b/arch/xtensa/mm/init.c
> @@ -126,10 +126,6 @@ void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
>   
>   void __init zones_init(void)
>   {
> -	unsigned long max_zone_pfn[MAX_NR_ZONES] = { 0, };
> -
> -	arch_zone_limits_init(max_zone_pfn);
> -	free_area_init(max_zone_pfn);
>   	print_vm_layout();
>   }
>   
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 628c0e0ac313..64d6f9c15ef1 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -45,6 +45,7 @@ struct pt_regs;
>   struct folio_batch;
>   
>   void arch_mm_preinit(void);
> +void mm_core_init_early(void);
>   void mm_core_init(void);
>   void init_mm_internals(void);
>   
> @@ -3536,7 +3537,7 @@ static inline unsigned long get_num_physpages(void)
>   }
>   
>   /*
> - * Using memblock node mappings, an architecture may initialise its
> + * FIXME: Using memblock node mappings, an architecture may initialise its
>    * zones, allocate the backing mem_map and account for memory holes in an
>    * architecture independent manner.
>    *
> @@ -3551,7 +3552,6 @@ static inline unsigned long get_num_physpages(void)
>    *	memblock_add_node(base, size, nid, MEMBLOCK_NONE)
>    * free_area_init(max_zone_pfns);
>    */
> -void free_area_init(unsigned long *max_zone_pfn);
>   void arch_zone_limits_init(unsigned long *max_zone_pfn);
>   unsigned long node_map_pfn_alignment(void);
>   extern unsigned long absent_pages_in_range(unsigned long start_pfn,
> diff --git a/init/main.c b/init/main.c
> index b84818ad9685..445b5643ecec 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -1025,6 +1025,7 @@ void start_kernel(void)
>   	page_address_init();
>   	pr_notice("%s", linux_banner);
>   	setup_arch(&command_line);
> +	mm_core_init_early();
>   	/* Static keys and static calls are needed by LSMs */
>   	jump_label_init();
>   	static_call_init();
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index fc2a6f1e518f..ffc4a0f1fee9 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -1810,7 +1810,6 @@ static void __init set_high_memory(void)
>   
>   /**
>    * free_area_init - Initialise all pg_data_t and zone data
> - * @max_zone_pfn: an array of max PFNs for each zone
>    *
>    * This will call free_area_init_node() for each active node in the system.
>    * Using the page ranges provided by memblock_set_node(), the size of each
> @@ -1821,17 +1820,14 @@ static void __init set_high_memory(void)
>    * starts where the previous one ended. For example, ZONE_DMA32 starts
>    * at arch_max_dma_pfn.
>    */
> -void __init free_area_init(unsigned long *max_zone_pfn)
> +static void __init free_area_init(void)
>   {
> +	unsigned long max_zone_pfn[MAX_NR_ZONES] = { 0 };
>   	unsigned long start_pfn, end_pfn;
>   	int i, nid, zone;
>   	bool descending;
>   
> -	/* Record where the zone boundaries are */
> -	memset(arch_zone_lowest_possible_pfn, 0,
> -				sizeof(arch_zone_lowest_possible_pfn));
> -	memset(arch_zone_highest_possible_pfn, 0,
> -				sizeof(arch_zone_highest_possible_pfn));
> +	arch_zone_limits_init(max_zone_pfn);
>   
>   	start_pfn = PHYS_PFN(memblock_start_of_DRAM());
>   	descending = arch_has_descending_max_zone_pfns();
> @@ -2681,13 +2677,19 @@ void __init __weak mem_init(void)
>   {
>   }
>   
> +void __init mm_core_init_early(void)
> +{
> +	hugetlb_bootmem_alloc();
> +
> +	free_area_init();
> +}
> +
>   /*
>    * Set up kernel memory allocators
>    */
>   void __init mm_core_init(void)
>   {
>   	arch_mm_preinit();
> -	hugetlb_bootmem_alloc();
>   
>   	/* Initializations relying on SMP setup */
>   	BUILD_BUG_ON(MAX_ZONELISTS > 2);
Hello,

This patch got bisected to cause BeagleBone Black boot failure in 
linux-next version next-20260107.

At the moment I cannot provide any helpful information about this.

BR
Kalle

