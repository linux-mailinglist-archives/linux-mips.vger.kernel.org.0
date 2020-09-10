Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF19C26547B
	for <lists+linux-mips@lfdr.de>; Thu, 10 Sep 2020 23:57:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728313AbgIJVm2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 10 Sep 2020 17:42:28 -0400
Received: from foss.arm.com ([217.140.110.172]:35488 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730715AbgIJNCV (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 10 Sep 2020 09:02:21 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 205931063;
        Thu, 10 Sep 2020 06:02:05 -0700 (PDT)
Received: from [10.57.40.122] (unknown [10.57.40.122])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 71A813F66E;
        Thu, 10 Sep 2020 06:02:03 -0700 (PDT)
Subject: Re: [PATCH 07/12] dma-direct: lift gfp_t manipulation out
 of__dma_direct_alloc_pages
To:     Christoph Hellwig <hch@lst.de>, Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        iommu@lists.linux-foundation.org
Cc:     linux-ia64@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
References: <20200908164758.3177341-1-hch@lst.de>
 <20200908164758.3177341-8-hch@lst.de>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <3658a0b7-c2b7-8b03-86c6-219f77799999@arm.com>
Date:   Thu, 10 Sep 2020 14:02:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200908164758.3177341-8-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2020-09-08 17:47, Christoph Hellwig wrote:
> Move the detailed gfp_t setup from __dma_direct_alloc_pages into the
> caller to clean things up a little.

Other than a mild nitpick that it might be nicer to spend one extra line 
to keep both gfp adjustments next to each other,

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   kernel/dma/direct.c | 12 +++++-------
>   1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index 1d564bea58571b..12e9f5f75dfe4b 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -108,7 +108,7 @@ static inline bool dma_should_free_from_pool(struct device *dev,
>   }
>   
>   static struct page *__dma_direct_alloc_pages(struct device *dev, size_t size,
> -		gfp_t gfp, unsigned long attrs)
> +		gfp_t gfp)
>   {
>   	int node = dev_to_node(dev);
>   	struct page *page = NULL;
> @@ -116,11 +116,6 @@ static struct page *__dma_direct_alloc_pages(struct device *dev, size_t size,
>   
>   	WARN_ON_ONCE(!PAGE_ALIGNED(size));
>   
> -	if (attrs & DMA_ATTR_NO_WARN)
> -		gfp |= __GFP_NOWARN;
> -
> -	/* we always manually zero the memory once we are done: */
> -	gfp &= ~__GFP_ZERO;
>   	gfp |= dma_direct_optimal_gfp_mask(dev, dev->coherent_dma_mask,
>   					   &phys_limit);
>   	page = dma_alloc_contiguous(dev, size, gfp);
> @@ -164,6 +159,8 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>   		return arch_dma_alloc(dev, size, dma_handle, gfp, attrs);
>   
>   	size = PAGE_ALIGN(size);
> +	if (attrs & DMA_ATTR_NO_WARN)
> +		gfp |= __GFP_NOWARN;
>   
>   	if (dma_should_alloc_from_pool(dev, gfp, attrs)) {
>   		u64 phys_mask;
> @@ -177,7 +174,8 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>   		goto done;
>   	}
>   
> -	page = __dma_direct_alloc_pages(dev, size, gfp, attrs);
> +	/* we always manually zero the memory once we are done */
> +	page = __dma_direct_alloc_pages(dev, size, gfp & ~__GFP_ZERO);
>   	if (!page)
>   		return NULL;
>   
> 
