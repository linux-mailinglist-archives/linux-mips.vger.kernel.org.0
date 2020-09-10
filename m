Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EA0826547E
	for <lists+linux-mips@lfdr.de>; Thu, 10 Sep 2020 23:57:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728220AbgIJVm2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 10 Sep 2020 17:42:28 -0400
Received: from foss.arm.com ([217.140.110.172]:35410 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730898AbgIJM6O (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 10 Sep 2020 08:58:14 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CDF1313D5;
        Thu, 10 Sep 2020 05:57:55 -0700 (PDT)
Received: from [10.57.40.122] (unknown [10.57.40.122])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 54FF43F66E;
        Thu, 10 Sep 2020 05:57:51 -0700 (PDT)
Subject: Re: [PATCH 06/12] dma-direct: remove dma_direct_{alloc,free}_pages
To:     Christoph Hellwig <hch@lst.de>, Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        iommu@lists.linux-foundation.org
Cc:     linux-ia64@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
References: <20200908164758.3177341-1-hch@lst.de>
 <20200908164758.3177341-7-hch@lst.de>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <d944983d-fd7e-f59b-75a9-c6e60919f3a5@arm.com>
Date:   Thu, 10 Sep 2020 13:57:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200908164758.3177341-7-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2020-09-08 17:47, Christoph Hellwig wrote:
> Just merge these helpers into the main dma_direct_{alloc,free} routines,
> as the additional checks are always false for the two callers.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   arch/x86/kernel/amd_gart_64.c |  6 +++---
>   include/linux/dma-direct.h    |  4 ----
>   kernel/dma/direct.c           | 39 ++++++++++++++---------------------
>   kernel/dma/pool.c             |  2 +-
>   4 files changed, 19 insertions(+), 32 deletions(-)
> 
> diff --git a/arch/x86/kernel/amd_gart_64.c b/arch/x86/kernel/amd_gart_64.c
> index bccc5357bffd6c..153374b996a279 100644
> --- a/arch/x86/kernel/amd_gart_64.c
> +++ b/arch/x86/kernel/amd_gart_64.c
> @@ -467,7 +467,7 @@ gart_alloc_coherent(struct device *dev, size_t size, dma_addr_t *dma_addr,
>   {
>   	void *vaddr;
>   
> -	vaddr = dma_direct_alloc_pages(dev, size, dma_addr, flag, attrs);
> +	vaddr = dma_direct_alloc(dev, size, dma_addr, flag, attrs);
>   	if (!vaddr ||
>   	    !force_iommu || dev->coherent_dma_mask <= DMA_BIT_MASK(24))
>   		return vaddr;
> @@ -479,7 +479,7 @@ gart_alloc_coherent(struct device *dev, size_t size, dma_addr_t *dma_addr,
>   		goto out_free;
>   	return vaddr;
>   out_free:
> -	dma_direct_free_pages(dev, size, vaddr, *dma_addr, attrs);
> +	dma_direct_free(dev, size, vaddr, *dma_addr, attrs);
>   	return NULL;
>   }
>   
> @@ -489,7 +489,7 @@ gart_free_coherent(struct device *dev, size_t size, void *vaddr,
>   		   dma_addr_t dma_addr, unsigned long attrs)
>   {
>   	gart_unmap_page(dev, dma_addr, size, DMA_BIDIRECTIONAL, 0);
> -	dma_direct_free_pages(dev, size, vaddr, dma_addr, attrs);
> +	dma_direct_free(dev, size, vaddr, dma_addr, attrs);
>   }
>   
>   static int no_agp;
> diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
> index 95e3e28bd93f47..20eceb2e4f91f8 100644
> --- a/include/linux/dma-direct.h
> +++ b/include/linux/dma-direct.h
> @@ -77,10 +77,6 @@ void *dma_direct_alloc(struct device *dev, size_t size, dma_addr_t *dma_handle,
>   		gfp_t gfp, unsigned long attrs);
>   void dma_direct_free(struct device *dev, size_t size, void *cpu_addr,
>   		dma_addr_t dma_addr, unsigned long attrs);
> -void *dma_direct_alloc_pages(struct device *dev, size_t size,
> -		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs);
> -void dma_direct_free_pages(struct device *dev, size_t size, void *cpu_addr,
> -		dma_addr_t dma_addr, unsigned long attrs);
>   int dma_direct_get_sgtable(struct device *dev, struct sg_table *sgt,
>   		void *cpu_addr, dma_addr_t dma_addr, size_t size,
>   		unsigned long attrs);
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index 949c1cbf08b2d5..1d564bea58571b 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -151,13 +151,18 @@ static struct page *__dma_direct_alloc_pages(struct device *dev, size_t size,
>   	return page;
>   }
>   
> -void *dma_direct_alloc_pages(struct device *dev, size_t size,
> +void *dma_direct_alloc(struct device *dev, size_t size,
>   		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
>   {
>   	struct page *page;
>   	void *ret;
>   	int err;
>   
> +	if (!IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED) &&
> +	    !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
> +	    dma_alloc_need_uncached(dev, attrs))
> +		return arch_dma_alloc(dev, size, dma_handle, gfp, attrs);
> +
>   	size = PAGE_ALIGN(size);
>   
>   	if (dma_should_alloc_from_pool(dev, gfp, attrs)) {
> @@ -256,11 +261,18 @@ void *dma_direct_alloc_pages(struct device *dev, size_t size,
>   	return NULL;
>   }
>   
> -void dma_direct_free_pages(struct device *dev, size_t size, void *cpu_addr,
> -		dma_addr_t dma_addr, unsigned long attrs)
> +void dma_direct_free(struct device *dev, size_t size,
> +		void *cpu_addr, dma_addr_t dma_addr, unsigned long attrs)
>   {
>   	unsigned int page_order = get_order(size);
>   
> +	if (!IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED) &&
> +	    !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
> +	    dma_alloc_need_uncached(dev, attrs)) {
> +		arch_dma_free(dev, size, cpu_addr, dma_addr, attrs);
> +		return;
> +	}
> +
>   	/* If cpu_addr is not from an atomic pool, dma_free_from_pool() fails */
>   	if (dma_should_free_from_pool(dev, attrs) &&
>   	    dma_free_from_pool(dev, cpu_addr, PAGE_ALIGN(size)))
> @@ -284,27 +296,6 @@ void dma_direct_free_pages(struct device *dev, size_t size, void *cpu_addr,
>   	dma_free_contiguous(dev, dma_direct_to_page(dev, dma_addr), size);
>   }
>   
> -void *dma_direct_alloc(struct device *dev, size_t size,
> -		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
> -{
> -	if (!IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED) &&
> -	    !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
> -	    dma_alloc_need_uncached(dev, attrs))
> -		return arch_dma_alloc(dev, size, dma_handle, gfp, attrs);
> -	return dma_direct_alloc_pages(dev, size, dma_handle, gfp, attrs);
> -}
> -
> -void dma_direct_free(struct device *dev, size_t size,
> -		void *cpu_addr, dma_addr_t dma_addr, unsigned long attrs)
> -{
> -	if (!IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED) &&
> -	    !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
> -	    dma_alloc_need_uncached(dev, attrs))
> -		arch_dma_free(dev, size, cpu_addr, dma_addr, attrs);
> -	else
> -		dma_direct_free_pages(dev, size, cpu_addr, dma_addr, attrs);
> -}
> -
>   #if defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE) || \
>       defined(CONFIG_SWIOTLB)
>   void dma_direct_sync_sg_for_device(struct device *dev,
> diff --git a/kernel/dma/pool.c b/kernel/dma/pool.c
> index 1281c0f0442bc5..fe11643ff9cc7b 100644
> --- a/kernel/dma/pool.c
> +++ b/kernel/dma/pool.c
> @@ -115,7 +115,7 @@ static int atomic_pool_expand(struct gen_pool *pool, size_t pool_size,
>   #endif
>   	/*
>   	 * Memory in the atomic DMA pools must be unencrypted, the pools do not
> -	 * shrink so no re-encryption occurs in dma_direct_free_pages().
> +	 * shrink so no re-encryption occurs in dma_direct_free().
>   	 */
>   	ret = set_memory_decrypted((unsigned long)page_to_virt(page),
>   				   1 << order);
> 
