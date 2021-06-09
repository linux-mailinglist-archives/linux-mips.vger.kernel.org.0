Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C4EF3A11D1
	for <lists+linux-mips@lfdr.de>; Wed,  9 Jun 2021 12:55:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236639AbhFIK5l (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 9 Jun 2021 06:57:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41295 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237705AbhFIK5j (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 9 Jun 2021 06:57:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623236145;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8eJ75jP8VswGGJerrw0vTcQbjnv4lkuutS1tqnKekIs=;
        b=JgVh2p7hpzGWryyssqBPpmU4jjT55I4Ql07Blz2YJ0NUjFa0m/06JJFH+NZbijbrU9xfR2
        Jx3gJRLoWXbHiDfgad/dkdE4pEDwuLU/w2Q90ngFJ3iYbZXl/w99jrxwCJ/plbPyPh3tp3
        EJH+mWf+2ttuitrpRF1yWqE3vvkh6go=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-smwQvaCCPjKMQBw3f64VeQ-1; Wed, 09 Jun 2021 06:55:44 -0400
X-MC-Unique: smwQvaCCPjKMQBw3f64VeQ-1
Received: by mail-wm1-f71.google.com with SMTP id v2-20020a7bcb420000b0290146b609814dso1817040wmj.0
        for <linux-mips@vger.kernel.org>; Wed, 09 Jun 2021 03:55:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=8eJ75jP8VswGGJerrw0vTcQbjnv4lkuutS1tqnKekIs=;
        b=FOh9MiFJDjyZORWbR0p7KDhySuTS0+7PFoCZ+NwuPhrR4QaY95YmpLpBA14NH3eHov
         t/JHN36mvibf/1IYyTwNL+6ahjaPb93d3Ah9Ikz9R7vaLEwphl9BD5KoJdmEFg7MBc6I
         SyUuHhqY4REvDBMuX0AKSN0Fis6HQbLkC2syGE6oxWIgBHq/0dM0OvBODyTm+xfbmJ1s
         yI6HUtDchTayhG3XPPoV5N7Kf5OKQhJYktw8+2QG8NEWx0dlbwTxK3eiWscTduSPW+n2
         u9Ee2J8j6koqKrD4BPaaOpfLOFpllv+oJlgXqVo/EifvxjUZgvlyjGD1YMdt5lCZKO/m
         ti2Q==
X-Gm-Message-State: AOAM532iazB/g7rGZbh8tdvZXRWPIhKOvBfKOvYzcw4jAHVx4QDP0haS
        q56x1WienFSOEjxyz5w3Le9/+7bAt9k0waxLRJyvKx3zQT+v/j7zwFZD8c4I1DkhJ1ZbditZrNo
        Gm4WUQlOFydIBXzwHP46F3A==
X-Received: by 2002:a5d:5986:: with SMTP id n6mr17137234wri.60.1623236142823;
        Wed, 09 Jun 2021 03:55:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIGfmTwGC2TpIXNbv+PWtjaoi8HXZHgLLq9CIfPD3MO+tKk1vjDrGMDkIUZv5ZbdxqYiN+vw==
X-Received: by 2002:a5d:5986:: with SMTP id n6mr17137201wri.60.1623236142550;
        Wed, 09 Jun 2021 03:55:42 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c611d.dip0.t-ipconnect.de. [91.12.97.29])
        by smtp.gmail.com with ESMTPSA id v17sm15896527wrp.36.2021.06.09.03.55.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jun 2021 03:55:42 -0700 (PDT)
Subject: Re: [PATCH 6/9] arch, mm: remove stale mentions of DISCONIGMEM
To:     Mike Rapoport <rppt@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Jonathan Corbet <corbet@lwn.net>,
        Matt Turner <mattst88@gmail.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Richard Henderson <rth@twiddle.net>,
        Vineet Gupta <vgupta@synopsys.com>, kexec@lists.infradead.org,
        linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-mm@kvack.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org
References: <20210602105348.13387-1-rppt@kernel.org>
 <20210602105348.13387-7-rppt@kernel.org>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <84999e8d-fb52-a6a2-e467-f8cc7ac84325@redhat.com>
Date:   Wed, 9 Jun 2021 12:55:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210602105348.13387-7-rppt@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 02.06.21 12:53, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> There are several places that mention DISCONIGMEM in comments or have stale
> code guarded by CONFIG_DISCONTIGMEM.
> 
> Remove the dead code and update the comments.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>   arch/ia64/kernel/topology.c     | 5 ++---
>   arch/ia64/mm/numa.c             | 5 ++---
>   arch/mips/include/asm/mmzone.h  | 6 ------
>   arch/mips/mm/init.c             | 3 ---
>   arch/nds32/include/asm/memory.h | 6 ------
>   arch/xtensa/include/asm/page.h  | 4 ----
>   include/linux/gfp.h             | 4 ++--
>   7 files changed, 6 insertions(+), 27 deletions(-)
> 
> diff --git a/arch/ia64/kernel/topology.c b/arch/ia64/kernel/topology.c
> index 09fc385c2acd..3639e0a7cb3b 100644
> --- a/arch/ia64/kernel/topology.c
> +++ b/arch/ia64/kernel/topology.c
> @@ -3,9 +3,8 @@
>    * License.  See the file "COPYING" in the main directory of this archive
>    * for more details.
>    *
> - * This file contains NUMA specific variables and functions which can
> - * be split away from DISCONTIGMEM and are used on NUMA machines with
> - * contiguous memory.
> + * This file contains NUMA specific variables and functions which are used on
> + * NUMA machines with contiguous memory.
>    * 		2002/08/07 Erich Focht <efocht@ess.nec.de>
>    * Populate cpu entries in sysfs for non-numa systems as well
>    *  	Intel Corporation - Ashok Raj
> diff --git a/arch/ia64/mm/numa.c b/arch/ia64/mm/numa.c
> index 46b6e5f3a40f..d6579ec3ea32 100644
> --- a/arch/ia64/mm/numa.c
> +++ b/arch/ia64/mm/numa.c
> @@ -3,9 +3,8 @@
>    * License.  See the file "COPYING" in the main directory of this archive
>    * for more details.
>    *
> - * This file contains NUMA specific variables and functions which can
> - * be split away from DISCONTIGMEM and are used on NUMA machines with
> - * contiguous memory.
> + * This file contains NUMA specific variables and functions which are used on
> + * NUMA machines with contiguous memory.
>    *
>    *                         2002/08/07 Erich Focht <efocht@ess.nec.de>
>    */
> diff --git a/arch/mips/include/asm/mmzone.h b/arch/mips/include/asm/mmzone.h
> index b826b8473e95..7649ab45e80c 100644
> --- a/arch/mips/include/asm/mmzone.h
> +++ b/arch/mips/include/asm/mmzone.h
> @@ -20,10 +20,4 @@
>   #define nid_to_addrbase(nid) 0
>   #endif
>   
> -#ifdef CONFIG_DISCONTIGMEM
> -
> -#define pfn_to_nid(pfn)		pa_to_nid((pfn) << PAGE_SHIFT)
> -
> -#endif /* CONFIG_DISCONTIGMEM */
> -
>   #endif /* _ASM_MMZONE_H_ */
> diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
> index c36358758969..97f6ca341448 100644
> --- a/arch/mips/mm/init.c
> +++ b/arch/mips/mm/init.c
> @@ -454,9 +454,6 @@ void __init mem_init(void)
>   	BUILD_BUG_ON(IS_ENABLED(CONFIG_32BIT) && (_PFN_SHIFT > PAGE_SHIFT));
>   
>   #ifdef CONFIG_HIGHMEM
> -#ifdef CONFIG_DISCONTIGMEM
> -#error "CONFIG_HIGHMEM and CONFIG_DISCONTIGMEM dont work together yet"
> -#endif
>   	max_mapnr = highend_pfn ? highend_pfn : max_low_pfn;
>   #else
>   	max_mapnr = max_low_pfn;
> diff --git a/arch/nds32/include/asm/memory.h b/arch/nds32/include/asm/memory.h
> index 940d32842793..62faafbc28e4 100644
> --- a/arch/nds32/include/asm/memory.h
> +++ b/arch/nds32/include/asm/memory.h
> @@ -76,18 +76,12 @@
>    *  virt_to_page(k)	convert a _valid_ virtual address to struct page *
>    *  virt_addr_valid(k)	indicates whether a virtual address is valid
>    */
> -#ifndef CONFIG_DISCONTIGMEM
> -
>   #define ARCH_PFN_OFFSET		PHYS_PFN_OFFSET
>   #define pfn_valid(pfn)		((pfn) >= PHYS_PFN_OFFSET && (pfn) < (PHYS_PFN_OFFSET + max_mapnr))
>   
>   #define virt_to_page(kaddr)	(pfn_to_page(__pa(kaddr) >> PAGE_SHIFT))
>   #define virt_addr_valid(kaddr)	((unsigned long)(kaddr) >= PAGE_OFFSET && (unsigned long)(kaddr) < (unsigned long)high_memory)
>   
> -#else /* CONFIG_DISCONTIGMEM */
> -#error CONFIG_DISCONTIGMEM is not supported yet.
> -#endif /* !CONFIG_DISCONTIGMEM */
> -
>   #define page_to_phys(page)	(page_to_pfn(page) << PAGE_SHIFT)
>   
>   #endif
> diff --git a/arch/xtensa/include/asm/page.h b/arch/xtensa/include/asm/page.h
> index 37ce25ef92d6..493eb7083b1a 100644
> --- a/arch/xtensa/include/asm/page.h
> +++ b/arch/xtensa/include/asm/page.h
> @@ -192,10 +192,6 @@ static inline unsigned long ___pa(unsigned long va)
>   #define pfn_valid(pfn) \
>   	((pfn) >= ARCH_PFN_OFFSET && ((pfn) - ARCH_PFN_OFFSET) < max_mapnr)
>   
> -#ifdef CONFIG_DISCONTIGMEM
> -# error CONFIG_DISCONTIGMEM not supported
> -#endif
> -
>   #define virt_to_page(kaddr)	pfn_to_page(__pa(kaddr) >> PAGE_SHIFT)
>   #define page_to_virt(page)	__va(page_to_pfn(page) << PAGE_SHIFT)
>   #define virt_addr_valid(kaddr)	pfn_valid(__pa(kaddr) >> PAGE_SHIFT)
> diff --git a/include/linux/gfp.h b/include/linux/gfp.h
> index 11da8af06704..dbe1f5fc901d 100644
> --- a/include/linux/gfp.h
> +++ b/include/linux/gfp.h
> @@ -494,8 +494,8 @@ static inline int gfp_zonelist(gfp_t flags)
>    * There are two zonelists per node, one for all zones with memory and
>    * one containing just zones from the node the zonelist belongs to.
>    *
> - * For the normal case of non-DISCONTIGMEM systems the NODE_DATA() gets
> - * optimized to &contig_page_data at compile-time.
> + * For the case of non-NUMA systems the NODE_DATA() gets optimized to
> + * &contig_page_data at compile-time.
>    */
>   static inline struct zonelist *node_zonelist(int nid, gfp_t flags)
>   {
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

