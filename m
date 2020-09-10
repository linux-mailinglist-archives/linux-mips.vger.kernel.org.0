Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72698265390
	for <lists+linux-mips@lfdr.de>; Thu, 10 Sep 2020 23:37:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728392AbgIJVhN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 10 Sep 2020 17:37:13 -0400
Received: from foss.arm.com ([217.140.110.172]:36190 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728442AbgIJNeW (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 10 Sep 2020 09:34:22 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D844106F;
        Thu, 10 Sep 2020 06:34:21 -0700 (PDT)
Received: from [10.57.40.122] (unknown [10.57.40.122])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 69B3C3F66E;
        Thu, 10 Sep 2020 06:34:19 -0700 (PDT)
Subject: Re: [PATCH 11/12] dma-mapping: move dma_common_{mmap,get_sgtable} out
 of mapping.c
To:     Christoph Hellwig <hch@lst.de>, Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        iommu@lists.linux-foundation.org
Cc:     Tomasz Figa <tfiga@chromium.org>, Joerg Roedel <joro@8bytes.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org
References: <20200908164758.3177341-1-hch@lst.de>
 <20200908164758.3177341-12-hch@lst.de>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <88bae26e-d5f4-7a00-a88a-b69194d519a4@arm.com>
Date:   Thu, 10 Sep 2020 14:34:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200908164758.3177341-12-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2020-09-08 17:47, Christoph Hellwig wrote:
> Add a new file that contains helpera for misc DMA ops, which is only

The Latin plural of the singular "helperum", I guess? :P

> built when CONFIG_DMA_OPS is set.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   kernel/dma/Makefile      |  1 +
>   kernel/dma/mapping.c     | 47 +-----------------------------------
>   kernel/dma/ops_helpers.c | 51 ++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 53 insertions(+), 46 deletions(-)
>   create mode 100644 kernel/dma/ops_helpers.c
> 
> diff --git a/kernel/dma/Makefile b/kernel/dma/Makefile
> index 32c7c1942bbd6c..dc755ab68aabf9 100644
> --- a/kernel/dma/Makefile
> +++ b/kernel/dma/Makefile
> @@ -1,6 +1,7 @@
>   # SPDX-License-Identifier: GPL-2.0
>   
>   obj-$(CONFIG_HAS_DMA)			+= mapping.o direct.o
> +obj-$(CONFIG_DMA_OPS)			+= ops_helpers.o
>   obj-$(CONFIG_DMA_OPS)			+= dummy.o
>   obj-$(CONFIG_DMA_CMA)			+= contiguous.o
>   obj-$(CONFIG_DMA_DECLARE_COHERENT)	+= coherent.o
> diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
> index 0d129421e75fc8..848c95c27d79ff 100644
> --- a/kernel/dma/mapping.c
> +++ b/kernel/dma/mapping.c
> @@ -8,7 +8,7 @@
>   #include <linux/memblock.h> /* for max_pfn */
>   #include <linux/acpi.h>
>   #include <linux/dma-direct.h>
> -#include <linux/dma-noncoherent.h>
> +#include <linux/dma-mapping.h>
>   #include <linux/export.h>
>   #include <linux/gfp.h>
>   #include <linux/of_device.h>
> @@ -295,22 +295,6 @@ void dma_sync_sg_for_device(struct device *dev, struct scatterlist *sg,
>   }
>   EXPORT_SYMBOL(dma_sync_sg_for_device);
>   
> -/*
> - * Create scatter-list for the already allocated DMA buffer.
> - */
> -int dma_common_get_sgtable(struct device *dev, struct sg_table *sgt,
> -		 void *cpu_addr, dma_addr_t dma_addr, size_t size,
> -		 unsigned long attrs)
> -{
> -	struct page *page = virt_to_page(cpu_addr);
> -	int ret;
> -
> -	ret = sg_alloc_table(sgt, 1, GFP_KERNEL);
> -	if (!ret)
> -		sg_set_page(sgt->sgl, page, PAGE_ALIGN(size), 0);
> -	return ret;
> -}
> -
>   /*
>    * The whole dma_get_sgtable() idea is fundamentally unsafe - it seems
>    * that the intention is to allow exporting memory allocated via the
> @@ -358,35 +342,6 @@ pgprot_t dma_pgprot(struct device *dev, pgprot_t prot, unsigned long attrs)
>   }
>   #endif /* CONFIG_MMU */
>   
> -/*
> - * Create userspace mapping for the DMA-coherent memory.
> - */
> -int dma_common_mmap(struct device *dev, struct vm_area_struct *vma,
> -		void *cpu_addr, dma_addr_t dma_addr, size_t size,
> -		unsigned long attrs)
> -{
> -#ifdef CONFIG_MMU
> -	unsigned long user_count = vma_pages(vma);
> -	unsigned long count = PAGE_ALIGN(size) >> PAGE_SHIFT;
> -	unsigned long off = vma->vm_pgoff;
> -	int ret = -ENXIO;
> -
> -	vma->vm_page_prot = dma_pgprot(dev, vma->vm_page_prot, attrs);
> -
> -	if (dma_mmap_from_dev_coherent(dev, vma, cpu_addr, size, &ret))
> -		return ret;
> -
> -	if (off >= count || user_count > count - off)
> -		return -ENXIO;
> -
> -	return remap_pfn_range(vma, vma->vm_start,
> -			page_to_pfn(virt_to_page(cpu_addr)) + vma->vm_pgoff,
> -			user_count << PAGE_SHIFT, vma->vm_page_prot);
> -#else
> -	return -ENXIO;
> -#endif /* CONFIG_MMU */
> -}
> -
>   /**
>    * dma_can_mmap - check if a given device supports dma_mmap_*
>    * @dev: device to check
> diff --git a/kernel/dma/ops_helpers.c b/kernel/dma/ops_helpers.c
> new file mode 100644
> index 00000000000000..e443c69be4299f
> --- /dev/null
> +++ b/kernel/dma/ops_helpers.c
> @@ -0,0 +1,51 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Helpers for DMA ops implementations.  These generally rely on the fact that
> + * the allocated memory contains normal pages in the direct kernel mapping.
> + */
> +#include <linux/dma-noncoherent.h>
> +
> +/*
> + * Create scatter-list for the already allocated DMA buffer.
> + */
> +int dma_common_get_sgtable(struct device *dev, struct sg_table *sgt,
> +		 void *cpu_addr, dma_addr_t dma_addr, size_t size,
> +		 unsigned long attrs)
> +{
> +	struct page *page = virt_to_page(cpu_addr);
> +	int ret;
> +
> +	ret = sg_alloc_table(sgt, 1, GFP_KERNEL);
> +	if (!ret)
> +		sg_set_page(sgt->sgl, page, PAGE_ALIGN(size), 0);
> +	return ret;
> +}
> +
> +/*
> + * Create userspace mapping for the DMA-coherent memory.
> + */
> +int dma_common_mmap(struct device *dev, struct vm_area_struct *vma,
> +		void *cpu_addr, dma_addr_t dma_addr, size_t size,
> +		unsigned long attrs)
> +{
> +#ifdef CONFIG_MMU
> +	unsigned long user_count = vma_pages(vma);
> +	unsigned long count = PAGE_ALIGN(size) >> PAGE_SHIFT;
> +	unsigned long off = vma->vm_pgoff;
> +	int ret = -ENXIO;
> +
> +	vma->vm_page_prot = dma_pgprot(dev, vma->vm_page_prot, attrs);
> +
> +	if (dma_mmap_from_dev_coherent(dev, vma, cpu_addr, size, &ret))
> +		return ret;
> +
> +	if (off >= count || user_count > count - off)
> +		return -ENXIO;
> +
> +	return remap_pfn_range(vma, vma->vm_start,
> +			page_to_pfn(virt_to_page(cpu_addr)) + vma->vm_pgoff,
> +			user_count << PAGE_SHIFT, vma->vm_page_prot);
> +#else
> +	return -ENXIO;
> +#endif /* CONFIG_MMU */
> +}
> 
