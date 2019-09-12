Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A260B0D5B
	for <lists+linux-mips@lfdr.de>; Thu, 12 Sep 2019 12:58:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731284AbfILK6k (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 12 Sep 2019 06:58:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:57862 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730811AbfILK6j (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 12 Sep 2019 06:58:39 -0400
Received: from rapoport-lnx (unknown [88.157.232.34])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8369821479;
        Thu, 12 Sep 2019 10:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568285918;
        bh=ri4DX0jWeAR1yy3PHEcU0ID7qnBiwLO0Rgp4NA8oeE8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iq0N7apOzLju2Y2Uc5VIqIviB2zX9q93C1e+slLnCqhm8EWOSjQbWvMCASglAws6R
         a8S0jRJ+D7dOOpzA6uQgXzRgyCnqKpTUaLmdpNXj+r06vpN8hH1PN+J2nWUDFuuTRC
         LYk7LFBQIf0tPyQDNuuTZrRigJZZFA/mAnO5M3yA=
Date:   Thu, 12 Sep 2019 11:58:33 +0100
From:   Mike Rapoport <rppt@kernel.org>
To:     Thomas Bogendoerfer <tbogendoerfer@suse.de>
Cc:     Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCH] mips: sgi-ip27: switch from DISCONTIGMEM to SPARSEMEM
Message-ID: <20190912105831.GA10677@rapoport-lnx>
References: <1567662477-27404-1-git-send-email-rppt@kernel.org>
 <20190905152150.f7ff6ef70726085de63df828@suse.de>
 <20190905133251.GA3650@rapoport-lnx>
 <20190905154831.88b7853b47ba7db7bd7626bd@suse.de>
 <20190905154747.GB3650@rapoport-lnx>
 <20190905233800.0f6b3fb3722cde2f5a88663a@suse.de>
 <20190906130223.GA17704@rapoport-lnx>
 <20190909182242.c1ef9717d14b20212ef75954@suse.de>
 <20190910113243.GA19207@rapoport-lnx>
 <20190911160939.19f776535770d12ff51a2af7@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190911160939.19f776535770d12ff51a2af7@suse.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Sep 11, 2019 at 04:09:39PM +0200, Thomas Bogendoerfer wrote:
> On Tue, 10 Sep 2019 12:32:44 +0100
> Mike Rapoport <rppt@kernel.org> wrote:
> 
> > [..]
> 
> Patch below works on the same Origin.
> 
> Does memblocks_present() deal better with the one reserved page per node
> than sparse_memory_present_with_active_regions() ? Or is there a better
> explanation ? My debug prints didn't make sense out of it...

I think the problem is that when we call
sparse_memory_present_with_active_regions() per node, the page for the node
data of the next nodes is not yet reserved and since memory_present() does
memblock allocations it may use that memory.

We can try to verify that with "memblock=debug" in the command line.

Another thing we could try to rule out the differences between
memblocks_present() and sparse_memory_present_with_active_regions() is to
replace memblocks_present() in your patch with
sparse_memory_present_with_active_regions(MAX_NUMNODES).

 
> Thomas.
> 
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index d50fafd7bf3a..e4b02b5f3487 100644
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
> index fb077a947575..370f2ba14a89 100644
> --- a/arch/mips/sgi-ip27/ip27-memory.c
> +++ b/arch/mips/sgi-ip27/ip27-memory.c
> @@ -410,8 +410,6 @@ static void __init node_mem_init(cnodeid_t node)
>  
>  	memblock_reserve(slot_firstpfn << PAGE_SHIFT,
>  			 ((slot_freepfn - slot_firstpfn) << PAGE_SHIFT));
> -
> -	sparse_memory_present_with_active_regions(node);
>  }
>  
>  /*
> @@ -444,6 +442,7 @@ void __init prom_meminit(void)
>  		}
>  		__node_data[node] = &null_node;
>  	}
> +	memblocks_present();
>  }
>  
>  void __init prom_free_prom_memory(void)
> 
> -- 
> SUSE Software Solutions Germany GmbH
> HRB 247165 (AG München)
> Geschäftsführer: Felix Imendörffer

-- 
Sincerely yours,
Mike.
