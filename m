Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76C9F265347
	for <lists+linux-mips@lfdr.de>; Thu, 10 Sep 2020 23:31:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728233AbgIJVbC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 10 Sep 2020 17:31:02 -0400
Received: from foss.arm.com ([217.140.110.172]:36660 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730955AbgIJNvz (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 10 Sep 2020 09:51:55 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 155C1113E;
        Thu, 10 Sep 2020 06:51:54 -0700 (PDT)
Received: from [10.57.40.122] (unknown [10.57.40.122])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8BEE23F66E;
        Thu, 10 Sep 2020 06:51:51 -0700 (PDT)
Subject: Re: [PATCH 12/12] dma-mapping: move the dma_declare_coherent_memory
 documentation
To:     Christoph Hellwig <hch@lst.de>, Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        iommu@lists.linux-foundation.org
Cc:     Tomasz Figa <tfiga@chromium.org>, Joerg Roedel <joro@8bytes.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org
References: <20200908164758.3177341-1-hch@lst.de>
 <20200908164758.3177341-13-hch@lst.de>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <07c51b70-fb7d-cf44-b5c3-54e3148c11ae@arm.com>
Date:   Thu, 10 Sep 2020 14:51:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200908164758.3177341-13-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2020-09-08 17:47, Christoph Hellwig wrote:
> dma_declare_coherent_memory should not be in a DMA API guide aimed
> at driver writers (that is consumers of the API).  Move it to a comment
> near the function instead.

I still think there might be an occasional valid use for device-local 
memory outside the scope of platform code without the driver having to 
go full ZONE_DEVICE/HMM/TTM, e.g. with stuff like PCIe-based FPGA 
prototyping cards, but the kind of driver I'm imagining for that case 
would never be upstream anyway (if it were even written, rather than 
just using hard-coded hacks), so meh.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   Documentation/core-api/dma-api.rst | 24 ------------------------
>   kernel/dma/coherent.c              | 17 +++++++++++++++++
>   2 files changed, 17 insertions(+), 24 deletions(-)
> 
> diff --git a/Documentation/core-api/dma-api.rst b/Documentation/core-api/dma-api.rst
> index 3b3abbbb4b9a6f..90239348b30f6f 100644
> --- a/Documentation/core-api/dma-api.rst
> +++ b/Documentation/core-api/dma-api.rst
> @@ -586,30 +586,6 @@ the DMA_ATTR_NON_CONSISTENT flag starting at virtual address vaddr and
>   continuing on for size.  Again, you *must* observe the cache line
>   boundaries when doing this.
>   
> -::
> -
> -	int
> -	dma_declare_coherent_memory(struct device *dev, phys_addr_t phys_addr,
> -				    dma_addr_t device_addr, size_t size);
> -
> -Declare region of memory to be handed out by dma_alloc_coherent() when
> -it's asked for coherent memory for this device.
> -
> -phys_addr is the CPU physical address to which the memory is currently
> -assigned (this will be ioremapped so the CPU can access the region).
> -
> -device_addr is the DMA address the device needs to be programmed
> -with to actually address this memory (this will be handed out as the
> -dma_addr_t in dma_alloc_coherent()).
> -
> -size is the size of the area (must be multiples of PAGE_SIZE).
> -
> -As a simplification for the platforms, only *one* such region of
> -memory may be declared per device.
> -
> -For reasons of efficiency, most platforms choose to track the declared
> -region only at the granularity of a page.  For smaller allocations,
> -you should use the dma_pool() API.
>   
>   Part III - Debug drivers use of the DMA-API
>   -------------------------------------------
> diff --git a/kernel/dma/coherent.c b/kernel/dma/coherent.c
> index 2a0c4985f38e41..f85d14bbfcbe03 100644
> --- a/kernel/dma/coherent.c
> +++ b/kernel/dma/coherent.c
> @@ -107,6 +107,23 @@ static int dma_assign_coherent_memory(struct device *dev,
>   	return 0;
>   }
>   
> +/*
> + * Declare a region of memory to be handed out by dma_alloc_coherent() when it
> + * is asked for coherent memory for this device.  This shall only be used
> + * from platform code, usually based on the device tree description.
> + *
> + * phys_addr is the CPU physical address to which the memory is currently
> + * assigned (this will be ioremapped so the CPU can access the region).
> + *
> + * device_addr is the DMA address the device needs to be programmed with to
> + * actually address this memory (this will be handed out as the dma_addr_t in
> + * dma_alloc_coherent()).
> + *
> + * size is the size of the area (must be a multiple of PAGE_SIZE).
> + *
> + * As a simplification for the platforms, only *one* such region of memory may
> + * be declared per device.
> + */
>   int dma_declare_coherent_memory(struct device *dev, phys_addr_t phys_addr,
>   				dma_addr_t device_addr, size_t size)
>   {
> 
