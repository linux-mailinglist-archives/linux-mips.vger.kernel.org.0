Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B315BC4806
	for <lists+linux-mips@lfdr.de>; Wed,  2 Oct 2019 09:02:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726231AbfJBHCh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Oct 2019 03:02:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:59796 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726010AbfJBHCh (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 2 Oct 2019 03:02:37 -0400
Received: from rapoport-lnx (nesher1.haifa.il.ibm.com [195.110.40.7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 31DEF205F4;
        Wed,  2 Oct 2019 07:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569999755;
        bh=gfvMJztY6ERx8bgCJdAV+p+v7AS+PD1KWinNzWKnGaM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=INBGA54onbDExead9nvuRAysyQDSrniONlAkQrW5MCrghycHdn51SXN2Vq++k3faq
         DOHBKBseZVjhVToyHIqEgSxM9fn7Td07CFMYvyJ2N7hNdsKQasrvxpCxtLwTV6TrY9
         QwizayAknp/X3si6G3pYjZuq1NLFJJcDXshI6OIk=
Date:   Wed, 2 Oct 2019 10:02:29 +0300
From:   Mike Rapoport <rppt@kernel.org>
To:     Paul Burton <paul.burton@mips.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Rapoport <rppt@linux.ibm.com>,
        Thomas Bogendoerfer <tbogendoerfer@suse.de>
Subject: Re: [PATCH v2] mips: sgi-ip27: switch from DISCONTIGMEM to SPARSEMEM
Message-ID: <20191002070226.GA3897@rapoport-lnx>
References: <1568632390-20893-1-git-send-email-rppt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1568632390-20893-1-git-send-email-rppt@kernel.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

Any updates on this?

On Mon, Sep 16, 2019 at 02:13:10PM +0300, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> The memory initialization of SGI-IP27 is already half-way to support
> SPARSEMEM. It only had free_bootmem_with_active_regions() left-overs
> interfering with sparse_memory_present_with_active_regions().
> 
> Replace these calls with simpler memblocks_present() call in prom_meminit()
> and adjust arch/mips/Kconfig to enable SPARSEMEM and SPARSEMEM_EXTREME for
> SGI-IP27.
> 
> Co-developed-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
> Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
> 
> v2: don't add extra sparse_init() and use memblocks_present() instead of
> sparse_memory_present_with_active_regions()
> 
>  arch/mips/Kconfig                | 12 ++----------
>  arch/mips/sgi-ip27/ip27-memory.c |  6 ++----
>  2 files changed, 4 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index d50fafd..e4b02b5 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -669,6 +669,7 @@ config SGI_IP22
>  config SGI_IP27
>  	bool "SGI IP27 (Origin200/2000)"
>  	select ARCH_HAS_PHYS_TO_DMA
> +	select ARCH_SPARSEMEM_ENABLE
>  	select FW_ARC
>  	select FW_ARC64
>  	select BOOT_ELF64
> @@ -2633,18 +2634,9 @@ config ARCH_FLATMEM_ENABLE
>  	def_bool y
>  	depends on !NUMA && !CPU_LOONGSON2
>  
> -config ARCH_DISCONTIGMEM_ENABLE
> -	bool
> -	default y if SGI_IP27
> -	help
> -	  Say Y to support efficient handling of discontiguous physical memory,
> -	  for architectures which are either NUMA (Non-Uniform Memory Access)
> -	  or have huge holes in the physical address space for other reasons.
> -	  See <file:Documentation/vm/numa.rst> for more.
> -
>  config ARCH_SPARSEMEM_ENABLE
>  	bool
> -	select SPARSEMEM_STATIC
> +	select SPARSEMEM_STATIC if !SGI_IP27
>  
>  config NUMA
>  	bool "NUMA Support"
> diff --git a/arch/mips/sgi-ip27/ip27-memory.c b/arch/mips/sgi-ip27/ip27-memory.c
> index fb077a9..9db8692 100644
> --- a/arch/mips/sgi-ip27/ip27-memory.c
> +++ b/arch/mips/sgi-ip27/ip27-memory.c
> @@ -406,12 +406,8 @@ static void __init node_mem_init(cnodeid_t node)
>  	slot_freepfn += PFN_UP(sizeof(struct pglist_data) +
>  			       sizeof(struct hub_data));
>  
> -	free_bootmem_with_active_regions(node, end_pfn);
> -
>  	memblock_reserve(slot_firstpfn << PAGE_SHIFT,
>  			 ((slot_freepfn - slot_firstpfn) << PAGE_SHIFT));
> -
> -	sparse_memory_present_with_active_regions(node);
>  }
>  
>  /*
> @@ -444,6 +440,8 @@ void __init prom_meminit(void)
>  		}
>  		__node_data[node] = &null_node;
>  	}
> +
> +	memblocks_present();
>  }
>  
>  void __init prom_free_prom_memory(void)
> -- 
> 2.7.4
> 

-- 
Sincerely yours,
Mike.
