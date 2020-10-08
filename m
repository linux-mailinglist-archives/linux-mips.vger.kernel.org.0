Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3902D287705
	for <lists+linux-mips@lfdr.de>; Thu,  8 Oct 2020 17:20:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730895AbgJHPUM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 8 Oct 2020 11:20:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730884AbgJHPUM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 8 Oct 2020 11:20:12 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6BB0C061755;
        Thu,  8 Oct 2020 08:20:10 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id w11so6948363lfn.2;
        Thu, 08 Oct 2020 08:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qtifquMav/oAuxi0fBBR/fdCrfO/J3dcXlVGiaf5nR0=;
        b=i66guiOCi0ta4CzZCAZcm+eUipqTM1KA/5PiRnyA/Ov+jOPAPepKqkpBP2Aem/DFhr
         EMH/bEYWNrMJ2nrWH2pOlQRgqplIEKOIkRGk+JDwKC6l+aZL+aDNDSdO/bbEhWONX17o
         f/9H5XkmkUFItlLtS15xlD9ua82WBoJHtsX69iCQM1wTNhwzLbbDgGvL1X1G/Iyk8s0V
         BEUagyXInrJFJD5jFaQ6eCWcH/Fg5Y6KL0uk9LoGCJOKvX6IXtOdG3TZg/+wj78S/q06
         XPUsu4Vtu7fu47V8Nt3kHAgE9FXuNuX3OSmUrwePwprXNnjwX4naLmFlxhnW3bJjlvTW
         fN0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qtifquMav/oAuxi0fBBR/fdCrfO/J3dcXlVGiaf5nR0=;
        b=tEmxN3hRCgGnvecme2oKcirsuOBMH7+7OelHLITYNVexQ2nW8vvyxBx2MY6UHaFsZC
         EBKUodhybyLCf9PncSKzN/gdpI80Qb4hmHot/Qfq25AC6rjx6wNYMOpwEegvMin4/xR7
         Eh94FKfkI1tBKrvy8z/HeXS0y0gZAKWOZCFkpw2RIJ6xYYLOZQ0SySVj+u6+vmhv18zX
         nQMP//6qR/RmvCj3TodqY5AZHqrWkj3jSJUvYyaZJAONKokFCdChVZ9oCHGOucAKgb3Q
         cbwmlLLHH08+ScvEjoUpbWFlvvZimH59bkz0/1S5rnh3srAbTCXVjJ/l3i1Rkl0AQJd4
         Hhlw==
X-Gm-Message-State: AOAM5300LarobjuGP/5+G6jjdIFwW8iW1uL0tUzWi0X4hUE3sJOAViOj
        Lh0nM570MX2r1p5fJA/DeAWzbuofYRg=
X-Google-Smtp-Source: ABdhPJzK3idvrBXGxFdqDS+ORK+ac5x3eyR4ozh05MjTbVRYKV0E7kTkIwJtEZq2n5YMMaIadSj9/g==
X-Received: by 2002:ac2:5048:: with SMTP id a8mr2716306lfm.60.1602170409250;
        Thu, 08 Oct 2020 08:20:09 -0700 (PDT)
Received: from mobilestation ([95.79.141.114])
        by smtp.gmail.com with ESMTPSA id s17sm837273lfp.117.2020.10.08.08.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 08:20:08 -0700 (PDT)
Date:   Thu, 8 Oct 2020 18:20:06 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Hauke Mehrtens <hauke@hauke-m.de>,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        "Maciej W. Rozycki" <macro@linux-mips.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        John Crispin <john@phrozen.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] MIPS: replace add_memory_region with memblock
Message-ID: <20201008152006.4khkbzsxqmmz76rw@mobilestation>
References: <20201008084357.42780-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201008084357.42780-1-tsbogend@alpha.franken.de>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello Thomas

On Thu, Oct 08, 2020 at 10:43:54AM +0200, Thomas Bogendoerfer wrote:
> add_memory_region was the old interface for registering memory and
> was already changed to used memblock internaly. Replace it by
> directly calling memblock functions.

Thanks for suggesting this cleanup. It's great to see that the leftover of the
old bootmem and MIPS-specific boot_mem_map framework time is going to be finally
removed. A few comments are blow.

> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
> Changes in v2:
> 	fixed missing memblock include in fw/sni/sniprom.c
> 	tested on cobalt, IP22, IP28, IP30, IP32, JAZZ, SNI

...

> diff --git a/arch/mips/kernel/prom.c b/arch/mips/kernel/prom.c
> index 9e50dc8df2f6..fab532cb5a11 100644
> --- a/arch/mips/kernel/prom.c
> +++ b/arch/mips/kernel/prom.c
> @@ -50,14 +50,18 @@ void __init early_init_dt_add_memory_arch(u64 base, u64 size)
>  		size = PHYS_ADDR_MAX - base;
>  	}
>  
> -	add_memory_region(base, size, BOOT_MEM_RAM);
> +	memblock_add(base, size);
>  }
>  
>  int __init early_init_dt_reserve_memory_arch(phys_addr_t base,
>  					phys_addr_t size, bool nomap)
>  {
> -	add_memory_region(base, size,
> -			  nomap ? BOOT_MEM_NOMAP : BOOT_MEM_RESERVED);
> +	if (nomap) {
> +		memblock_remove(base, size);
> +	} else {
> +		memblock_add(base, size);
> +		memblock_reserve(base, size);
> +	}
>  
>  	return 0;
>  }

I guess originally the arch-specific early_init_dt_add_memory_arch() and
early_init_dt_reserve_memory_arch() methods have been added since MIPS's got its
own memory types declarations (BOOT_MEM_RAM, BOOT_MEM_RESERVED, etc) and had had
a specific internal system memory regions mapping (add_memory_region(),
boot_mem_map, etc). Since the leftover of that framework is going to be removed,
we can freely use the standard early_init_dt_add_memory_arch() and
early_init_dt_reserve_memory_arch() implementations from drivers/of/fdt.c:1102
drivers/of/fdt.c:1149 .

At least I don't see a decent reason to preserve them. The memory registration
method does nearly the same sanity checks. The memory reservation function
defers a bit in adding the being reserved memory first. That seems redundant,
since the reserved memory won't be available for the system anyway. Do I miss
something?

> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> index 4c04a86f075b..fb05b66e111f 100644
> --- a/arch/mips/kernel/setup.c
> +++ b/arch/mips/kernel/setup.c
> @@ -91,45 +91,6 @@ unsigned long ARCH_PFN_OFFSET;
>  EXPORT_SYMBOL(ARCH_PFN_OFFSET);
>  #endif
>  
> -void __init add_memory_region(phys_addr_t start, phys_addr_t size, long type)
> -{
> -	/*
> -	 * Note: This function only exists for historical reason,
> -	 * new code should use memblock_add or memblock_add_node instead.
> -	 */
> -
> -	/*
> -	 * If the region reaches the top of the physical address space, adjust
> -	 * the size slightly so that (start + size) doesn't overflow
> -	 */
> -	if (start + size - 1 == PHYS_ADDR_MAX)
> -		--size;
> -
> -	/* Sanity check */
> -	if (start + size < start) {
> -		pr_warn("Trying to add an invalid memory region, skipped\n");
> -		return;
> -	}
> -
> -	if (start < PHYS_OFFSET)
> -		return;
> -
> -	memblock_add(start, size);
> -	/* Reserve any memory except the ordinary RAM ranges. */
> -	switch (type) {
> -	case BOOT_MEM_RAM:
> -		break;
> -
> -	case BOOT_MEM_NOMAP: /* Discard the range from the system. */
> -		memblock_remove(start, size);
> -		break;
> -
> -	default: /* Reserve the rest of the memory types at boot time */
> -		memblock_reserve(start, size);
> -		break;
> -	}
> -}
> -
>  void __init detect_memory_region(phys_addr_t start, phys_addr_t sz_min, phys_addr_t sz_max)
>  {
>  	void *dm = &detect_magic;
> @@ -146,7 +107,7 @@ void __init detect_memory_region(phys_addr_t start, phys_addr_t sz_min, phys_add
>  		((unsigned long long) sz_min) / SZ_1M,
>  		((unsigned long long) sz_max) / SZ_1M);
>  
> -	add_memory_region(start, size, BOOT_MEM_RAM);
> +	memblock_add(start, size);
>  }
>  
>  /*
> @@ -400,7 +361,7 @@ static int __init early_parse_mem(char *p)
>  	if (*p == '@')
>  		start = memparse(p + 1, &p);
>  
> -	add_memory_region(start, size, BOOT_MEM_RAM);
> +	memblock_add(start, size);
>  
>  	return 0;
>  }
> @@ -426,13 +387,14 @@ static int __init early_parse_memmap(char *p)
>  
>  	if (*p == '@') {
>  		start_at = memparse(p+1, &p);
> -		add_memory_region(start_at, mem_size, BOOT_MEM_RAM);
> +		memblock_add(start_at, mem_size);
>  	} else if (*p == '#') {
>  		pr_err("\"memmap=nn#ss\" (force ACPI data) invalid on MIPS\n");
>  		return -EINVAL;
>  	} else if (*p == '$') {
>  		start_at = memparse(p+1, &p);

> -		add_memory_region(start_at, mem_size, BOOT_MEM_RESERVED);
> +		memblock_add(start_at, mem_size);
> +		memblock_reserve(start_at, mem_size);

I suppose we could remove the memory addition from here too. What do you think?

>  	} else {
>  		pr_err("\"memmap\" invalid format!\n");
>  		return -EINVAL;
> @@ -644,7 +606,7 @@ static void __init bootcmdline_init(void)
>   * arch_mem_init - initialize memory management subsystem
>   *
>   *  o plat_mem_setup() detects the memory configuration and will record detected
> - *    memory areas using add_memory_region.
> + *    memory areas using memblock_add.
>   *
>   * At this stage the memory configuration of the system is known to the
>   * kernel but generic memory management system is still entirely uninitialized.
> diff --git a/arch/mips/loongson2ef/common/mem.c b/arch/mips/loongson2ef/common/mem.c
> index ae21f1c62baa..057d58bb470e 100644
> --- a/arch/mips/loongson2ef/common/mem.c
> +++ b/arch/mips/loongson2ef/common/mem.c
> @@ -17,10 +17,7 @@ u32 memsize, highmemsize;
>  
>  void __init prom_init_memory(void)
>  {

> -	add_memory_region(0x0, (memsize << 20), BOOT_MEM_RAM);
> -
> -	add_memory_region(memsize << 20, LOONGSON_PCI_MEM_START - (memsize <<
> -				20), BOOT_MEM_RESERVED);
> +	memblock_add(0x0, (memsize << 20));

Hm, am I missing something or the BOOT_MEM_RESERVED part has been discarded?

>  
>  #ifdef CONFIG_CPU_SUPPORTS_ADDRWINCFG
>  	{
> @@ -41,12 +38,7 @@ void __init prom_init_memory(void)
>  
>  #ifdef CONFIG_64BIT
>  	if (highmemsize > 0)

> -		add_memory_region(LOONGSON_HIGHMEM_START,
> -				  highmemsize << 20, BOOT_MEM_RAM);
> -
> -	add_memory_region(LOONGSON_PCI_MEM_END + 1, LOONGSON_HIGHMEM_START -
> -			  LOONGSON_PCI_MEM_END - 1, BOOT_MEM_RESERVED);
> -
> +		memblock_add(LOONGSON_HIGHMEM_START, highmemsize << 20);

The same question. Is it ok to discard the
[LOONGSON_PCI_MEM_END+1:LOONGSON_HIGHMEM_START-LOONGSON_PCI_MEM_END-1] region
removal operation?

-Sergey

>  #endif /* !CONFIG_64BIT */
>  }
>  
