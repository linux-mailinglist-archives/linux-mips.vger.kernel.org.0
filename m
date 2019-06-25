Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFFF7522D3
	for <lists+linux-mips@lfdr.de>; Tue, 25 Jun 2019 07:29:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726783AbfFYF3w (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 25 Jun 2019 01:29:52 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:35849 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726009AbfFYF3v (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 25 Jun 2019 01:29:51 -0400
Received: by mail-io1-f65.google.com with SMTP id h6so475443ioh.3;
        Mon, 24 Jun 2019 22:29:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MYUiPcf5RNWGOQUq7NpIrQgIK0WGzaR6xdyIKOYFVRU=;
        b=DFZKOiz1WyZvHdem/rdMWpLpRb+t4MzvZgmz9lS5fB+so3Hcz72HyIvNUhKJsRU31V
         Lw0rIrPMyB7a9EFf2fxinCHQu0JIsybQYMcX8P5nQ8S4E7GJlTq3NnZk7Jx7cEMVVoyq
         fw8RVhfcAH8nEv4pfdaVdmV5qbQPqmSUHcwP04rho6XwL9Q/YBXJvdy6QP/LFZC3Jo/q
         HOhycgP/dH35esuBTESOeEdobYAjQ4GpRNTcRQqqTK3PC8SyjitoTKwyuGX2pql+OHwW
         V+BiZ3ptbPCBV/PogJfYKR8TTrd8B5BGnRBIkqwTwnXbtaj7Cv+obU3O5MpX4mwQWYWb
         f3HA==
X-Gm-Message-State: APjAAAUMk/16b9Vp5RhBqcoMDvorabFasICHH/o2Sk7dqM1W0fq+MB+c
        uWUdDXbUkqf6ang0ec/seVKo5Ehbfrp+om7kJDuehA==
X-Google-Smtp-Source: APXvYqzl/YK06q/o3k/iCtkW4OABCLfQXuU0wfB1EvfVqq/jXv0xKo+3GYXqQ5dTbDeIVCET6Wr2KMIs9dGRJlfWIh8=
X-Received: by 2002:a02:8816:: with SMTP id r22mr34047002jai.60.1561440591131;
 Mon, 24 Jun 2019 22:29:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190603065324.9724-1-hch@lst.de> <20190603065324.9724-2-hch@lst.de>
In-Reply-To: <20190603065324.9724-2-hch@lst.de>
From:   Ley Foon Tan <lftan@altera.com>
Date:   Tue, 25 Jun 2019 13:29:40 +0800
Message-ID: <CAFiDJ5-HwPR-SWUkYA9=Jn_iHnZ+xWzx6RrcHPNy8kA0jmeZfw@mail.gmail.com>
Subject: Re: [PATCH 1/2] nios2: use the generic uncached segment support in dma-direct
To:     Christoph Hellwig <hch@lst.de>
Cc:     Michal Simek <monstr@monstr.eu>, linux-mips@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jun 3, 2019 at 2:54 PM Christoph Hellwig <hch@lst.de> wrote:
>
> Stop providing our own arch alloc/free hooks and just expose the segment
> offset and use the generic dma-direct allocator.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Ley Foon Tan <ley.foon.tan@intel.com>

> ---
>  arch/nios2/Kconfig            |  1 +
>  arch/nios2/include/asm/page.h |  6 ------
>  arch/nios2/mm/dma-mapping.c   | 34 +++++++++++++++-------------------
>  3 files changed, 16 insertions(+), 25 deletions(-)
>
> diff --git a/arch/nios2/Kconfig b/arch/nios2/Kconfig
> index 26a9c760a98b..44b5da37e8bd 100644
> --- a/arch/nios2/Kconfig
> +++ b/arch/nios2/Kconfig
> @@ -4,6 +4,7 @@ config NIOS2
>         select ARCH_32BIT_OFF_T
>         select ARCH_HAS_SYNC_DMA_FOR_CPU
>         select ARCH_HAS_SYNC_DMA_FOR_DEVICE
> +       select ARCH_HAS_UNCACHED_SEGMENT
>         select ARCH_NO_SWAP
>         select TIMER_OF
>         select GENERIC_ATOMIC64
> diff --git a/arch/nios2/include/asm/page.h b/arch/nios2/include/asm/page.h
> index f1fbdc47bdaf..79fcac61f6ef 100644
> --- a/arch/nios2/include/asm/page.h
> +++ b/arch/nios2/include/asm/page.h
> @@ -101,12 +101,6 @@ static inline bool pfn_valid(unsigned long pfn)
>  # define VM_DATA_DEFAULT_FLAGS (VM_READ | VM_WRITE | \
>                                  VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
>
> -# define UNCAC_ADDR(addr)      \
> -       ((void *)((unsigned)(addr) | CONFIG_NIOS2_IO_REGION_BASE))
> -# define CAC_ADDR(addr)                \
> -       ((void *)(((unsigned)(addr) & ~CONFIG_NIOS2_IO_REGION_BASE) |   \
> -               CONFIG_NIOS2_KERNEL_REGION_BASE))
> -
>  #include <asm-generic/memory_model.h>
>
>  #include <asm-generic/getorder.h>
> diff --git a/arch/nios2/mm/dma-mapping.c b/arch/nios2/mm/dma-mapping.c
> index 4af9e5b5ba1c..9cb238664584 100644
> --- a/arch/nios2/mm/dma-mapping.c
> +++ b/arch/nios2/mm/dma-mapping.c
> @@ -60,32 +60,28 @@ void arch_sync_dma_for_cpu(struct device *dev, phys_addr_t paddr,
>         }
>  }
>
> -void *arch_dma_alloc(struct device *dev, size_t size, dma_addr_t *dma_handle,
> -               gfp_t gfp, unsigned long attrs)
> +void arch_dma_prep_coherent(struct page *page, size_t size)
>  {
> -       void *ret;
> +       unsigned long start = (unsigned long)page_address(page);
>
> -       /* optimized page clearing */
> -       gfp |= __GFP_ZERO;
> +       flush_dcache_range(start, start + size);
> +}
>
> -       if (dev == NULL || (dev->coherent_dma_mask < 0xffffffff))
> -               gfp |= GFP_DMA;
> +void *uncached_kernel_address(void *ptr)
> +{
> +       unsigned long addr = (unsigned long)ptr;
>
> -       ret = (void *) __get_free_pages(gfp, get_order(size));
> -       if (ret != NULL) {
> -               *dma_handle = virt_to_phys(ret);
> -               flush_dcache_range((unsigned long) ret,
> -                       (unsigned long) ret + size);
> -               ret = UNCAC_ADDR(ret);
> -       }
> +       addr |= CONFIG_NIOS2_IO_REGION_BASE;
>
> -       return ret;
> +       return (void *)ptr;
>  }
>
> -void arch_dma_free(struct device *dev, size_t size, void *vaddr,
> -               dma_addr_t dma_handle, unsigned long attrs)
> +void *cached_kernel_address(void *ptr)
>  {
> -       unsigned long addr = (unsigned long) CAC_ADDR((unsigned long) vaddr);
> +       unsigned long addr = (unsigned long)ptr;
> +
> +       addr &= ~CONFIG_NIOS2_IO_REGION_BASE;
> +       addr |= CONFIG_NIOS2_KERNEL_REGION_BASE;
>
> -       free_pages(addr, get_order(size));
> +       return (void *)ptr;
>  }
> --
> 2.20.1
>
