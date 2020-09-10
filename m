Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 316EC2653A7
	for <lists+linux-mips@lfdr.de>; Thu, 10 Sep 2020 23:38:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727907AbgIJVil (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 10 Sep 2020 17:38:41 -0400
Received: from foss.arm.com ([217.140.110.172]:36078 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730827AbgIJNbB (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 10 Sep 2020 09:31:01 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C7717106F;
        Thu, 10 Sep 2020 06:30:22 -0700 (PDT)
Received: from [10.57.40.122] (unknown [10.57.40.122])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C172A3F66E;
        Thu, 10 Sep 2020 06:30:19 -0700 (PDT)
Subject: Re: [PATCH 10/12] dma-direct: rename and cleanup __phys_to_dma
To:     Christoph Hellwig <hch@lst.de>, Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        iommu@lists.linux-foundation.org
Cc:     Tomasz Figa <tfiga@chromium.org>, Joerg Roedel <joro@8bytes.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org
References: <20200908164758.3177341-1-hch@lst.de>
 <20200908164758.3177341-11-hch@lst.de>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <17c556b8-2c02-7d03-404b-194cffcbebfb@arm.com>
Date:   Thu, 10 Sep 2020 14:30:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200908164758.3177341-11-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2020-09-08 17:47, Christoph Hellwig wrote:
> The __phys_to_dma vs phys_to_dma distinction isn't exactly obvious.  Try
> to improve the situation by renaming __phys_to_dma to
> phys_to_dma_unencryped, and not forcing architectures that want to
> override phys_to_dma to actually provide __phys_to_dma.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   arch/arm/include/asm/dma-direct.h      |  2 +-
>   arch/mips/bmips/dma.c                  |  2 +-
>   arch/mips/cavium-octeon/dma-octeon.c   |  2 +-
>   arch/mips/include/asm/dma-direct.h     |  2 +-
>   arch/mips/loongson2ef/fuloong-2e/dma.c |  2 +-
>   arch/mips/loongson2ef/lemote-2f/dma.c  |  2 +-
>   arch/mips/loongson64/dma.c             |  2 +-
>   arch/mips/pci/pci-ar2315.c             |  2 +-
>   arch/mips/pci/pci-xtalk-bridge.c       |  2 +-
>   arch/mips/sgi-ip32/ip32-dma.c          |  2 +-
>   arch/powerpc/include/asm/dma-direct.h  |  2 +-
>   drivers/iommu/intel/iommu.c            |  2 +-
>   include/linux/dma-direct.h             | 28 +++++++++++++++-----------
>   kernel/dma/direct.c                    |  8 ++++----
>   kernel/dma/swiotlb.c                   |  4 ++--
>   15 files changed, 34 insertions(+), 30 deletions(-)
> 
> diff --git a/arch/arm/include/asm/dma-direct.h b/arch/arm/include/asm/dma-direct.h
> index a8cee87a93e8ab..bca0de56753439 100644
> --- a/arch/arm/include/asm/dma-direct.h
> +++ b/arch/arm/include/asm/dma-direct.h
> @@ -2,7 +2,7 @@
>   #ifndef ASM_ARM_DMA_DIRECT_H
>   #define ASM_ARM_DMA_DIRECT_H 1
>   
> -static inline dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
> +static inline dma_addr_t phys_to_dma(struct device *dev, phys_addr_t paddr)
>   {
>   	unsigned int offset = paddr & ~PAGE_MASK;
>   	return pfn_to_dma(dev, __phys_to_pfn(paddr)) + offset;
> diff --git a/arch/mips/bmips/dma.c b/arch/mips/bmips/dma.c
> index ba2a5d33dfd3fa..49061b870680b9 100644
> --- a/arch/mips/bmips/dma.c
> +++ b/arch/mips/bmips/dma.c
> @@ -40,7 +40,7 @@ static struct bmips_dma_range *bmips_dma_ranges;
>   
>   #define FLUSH_RAC		0x100
>   
> -dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t pa)
> +dma_addr_t phys_to_dma(struct device *dev, phys_addr_t pa)
>   {
>   	struct bmips_dma_range *r;
>   
> diff --git a/arch/mips/cavium-octeon/dma-octeon.c b/arch/mips/cavium-octeon/dma-octeon.c
> index 388b13ba2558c2..232fa1017b1ec9 100644
> --- a/arch/mips/cavium-octeon/dma-octeon.c
> +++ b/arch/mips/cavium-octeon/dma-octeon.c
> @@ -168,7 +168,7 @@ void __init octeon_pci_dma_init(void)
>   }
>   #endif /* CONFIG_PCI */
>   
> -dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
> +dma_addr_t phys_to_dma(struct device *dev, phys_addr_t paddr)
>   {
>   #ifdef CONFIG_PCI
>   	if (dev && dev_is_pci(dev))
> diff --git a/arch/mips/include/asm/dma-direct.h b/arch/mips/include/asm/dma-direct.h
> index 8e178651c638c2..9a640118316c9d 100644
> --- a/arch/mips/include/asm/dma-direct.h
> +++ b/arch/mips/include/asm/dma-direct.h
> @@ -2,7 +2,7 @@
>   #ifndef _MIPS_DMA_DIRECT_H
>   #define _MIPS_DMA_DIRECT_H 1
>   
> -dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr);
> +dma_addr_t phys_to_dma(struct device *dev, phys_addr_t paddr);
>   phys_addr_t dma_to_phys(struct device *dev, dma_addr_t daddr);
>   
>   #endif /* _MIPS_DMA_DIRECT_H */
> diff --git a/arch/mips/loongson2ef/fuloong-2e/dma.c b/arch/mips/loongson2ef/fuloong-2e/dma.c
> index 83fadeb3fd7d56..cea167d8aba8db 100644
> --- a/arch/mips/loongson2ef/fuloong-2e/dma.c
> +++ b/arch/mips/loongson2ef/fuloong-2e/dma.c
> @@ -1,7 +1,7 @@
>   // SPDX-License-Identifier: GPL-2.0
>   #include <linux/dma-direct.h>
>   
> -dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
> +dma_addr_t phys_to_dma(struct device *dev, phys_addr_t paddr)
>   {
>   	return paddr | 0x80000000;
>   }
> diff --git a/arch/mips/loongson2ef/lemote-2f/dma.c b/arch/mips/loongson2ef/lemote-2f/dma.c
> index 302b43a14eee74..3c9e994563578c 100644
> --- a/arch/mips/loongson2ef/lemote-2f/dma.c
> +++ b/arch/mips/loongson2ef/lemote-2f/dma.c
> @@ -1,7 +1,7 @@
>   // SPDX-License-Identifier: GPL-2.0
>   #include <linux/dma-direct.h>
>   
> -dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
> +dma_addr_t phys_to_dma(struct device *dev, phys_addr_t paddr)
>   {
>   	return paddr | 0x80000000;
>   }
> diff --git a/arch/mips/loongson64/dma.c b/arch/mips/loongson64/dma.c
> index b3dc5d0bd2b113..364f2f27c8723f 100644
> --- a/arch/mips/loongson64/dma.c
> +++ b/arch/mips/loongson64/dma.c
> @@ -4,7 +4,7 @@
>   #include <linux/swiotlb.h>
>   #include <boot_param.h>
>   
> -dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
> +dma_addr_t phys_to_dma(struct device *dev, phys_addr_t paddr)
>   {
>   	/* We extract 2bit node id (bit 44~47, only bit 44~45 used now) from
>   	 * Loongson-3's 48bit address space and embed it into 40bit */
> diff --git a/arch/mips/pci/pci-ar2315.c b/arch/mips/pci/pci-ar2315.c
> index d88395684f487d..cef4a47ab06311 100644
> --- a/arch/mips/pci/pci-ar2315.c
> +++ b/arch/mips/pci/pci-ar2315.c
> @@ -170,7 +170,7 @@ static inline dma_addr_t ar2315_dev_offset(struct device *dev)
>   	return 0;
>   }
>   
> -dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
> +dma_addr_t phys_to_dma(struct device *dev, phys_addr_t paddr)
>   {
>   	return paddr + ar2315_dev_offset(dev);
>   }
> diff --git a/arch/mips/pci/pci-xtalk-bridge.c b/arch/mips/pci/pci-xtalk-bridge.c
> index f1b37f32b55395..50f7d42cca5a78 100644
> --- a/arch/mips/pci/pci-xtalk-bridge.c
> +++ b/arch/mips/pci/pci-xtalk-bridge.c
> @@ -25,7 +25,7 @@
>   /*
>    * Common phys<->dma mapping for platforms using pci xtalk bridge
>    */
> -dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
> +dma_addr_t phys_to_dma(struct device *dev, phys_addr_t paddr)
>   {
>   	struct pci_dev *pdev = to_pci_dev(dev);
>   	struct bridge_controller *bc = BRIDGE_CONTROLLER(pdev->bus);
> diff --git a/arch/mips/sgi-ip32/ip32-dma.c b/arch/mips/sgi-ip32/ip32-dma.c
> index 160317294d97a9..20c6da9d76bc5e 100644
> --- a/arch/mips/sgi-ip32/ip32-dma.c
> +++ b/arch/mips/sgi-ip32/ip32-dma.c
> @@ -18,7 +18,7 @@
>   
>   #define RAM_OFFSET_MASK 0x3fffffffUL
>   
> -dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
> +dma_addr_t phys_to_dma(struct device *dev, phys_addr_t paddr)
>   {
>   	dma_addr_t dma_addr = paddr & RAM_OFFSET_MASK;
>   
> diff --git a/arch/powerpc/include/asm/dma-direct.h b/arch/powerpc/include/asm/dma-direct.h
> index 95b09313d2a4cf..128304cbee1d87 100644
> --- a/arch/powerpc/include/asm/dma-direct.h
> +++ b/arch/powerpc/include/asm/dma-direct.h
> @@ -2,7 +2,7 @@
>   #ifndef ASM_POWERPC_DMA_DIRECT_H
>   #define ASM_POWERPC_DMA_DIRECT_H 1
>   
> -static inline dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
> +static inline dma_addr_t phys_to_dma(struct device *dev, phys_addr_t paddr)
>   {
>   	return paddr + dev->archdata.dma_offset;
>   }
> diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
> index f8177c59d229a6..7983c13b9eef7d 100644
> --- a/drivers/iommu/intel/iommu.c
> +++ b/drivers/iommu/intel/iommu.c
> @@ -3736,7 +3736,7 @@ bounce_map_single(struct device *dev, phys_addr_t paddr, size_t size,
>   	 */
>   	if (!IS_ALIGNED(paddr | size, VTD_PAGE_SIZE)) {
>   		tlb_addr = swiotlb_tbl_map_single(dev,
> -				__phys_to_dma(dev, io_tlb_start),
> +				phys_to_dma_unencrypted(dev, io_tlb_start),
>   				paddr, size, aligned_size, dir, attrs);
>   		if (tlb_addr == DMA_MAPPING_ERROR) {
>   			goto swiotlb_error;
> diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
> index f00e262ab6b154..805010ea5346f9 100644
> --- a/include/linux/dma-direct.h
> +++ b/include/linux/dma-direct.h
> @@ -16,14 +16,29 @@ extern unsigned int zone_dma_bits;
>   
>   #ifdef CONFIG_ARCH_HAS_PHYS_TO_DMA
>   #include <asm/dma-direct.h>
> +#ifndef phys_to_dma_unencrypted
> +#define phys_to_dma_unencrypted		phys_to_dma
> +#endif
>   #else
> -static inline dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
> +static inline dma_addr_t phys_to_dma_unencrypted(struct device *dev,
> +		phys_addr_t paddr)
>   {
>   	dma_addr_t dev_addr = (dma_addr_t)paddr;
>   
>   	return dev_addr - ((dma_addr_t)dev->dma_pfn_offset << PAGE_SHIFT);
>   }
>   
> +/*
> + * If memory encryption is supported, phys_to_dma will set the memory encryption
> + * bit in the DMA address, and dma_to_phys will clear it.
> + * phys_to_dma_unencrypted is for use on special unencrypted memory like swiotlb
> + * buffers.
> + */
> +static inline dma_addr_t phys_to_dma(struct device *dev, phys_addr_t paddr)
> +{
> +	return __sme_set(phys_to_dma_unencrypted(dev, paddr));
> +}
> +
>   static inline phys_addr_t dma_to_phys(struct device *dev, dma_addr_t dev_addr)
>   {
>   	phys_addr_t paddr = (phys_addr_t)dev_addr +
> @@ -42,17 +57,6 @@ static inline bool force_dma_unencrypted(struct device *dev)
>   }
>   #endif /* CONFIG_ARCH_HAS_FORCE_DMA_UNENCRYPTED */
>   
> -/*
> - * If memory encryption is supported, phys_to_dma will set the memory encryption
> - * bit in the DMA address, and dma_to_phys will clear it.  The raw __phys_to_dma
> - * version should only be used on non-encrypted memory for
> - * special occasions like DMA coherent buffers.
> - */
> -static inline dma_addr_t phys_to_dma(struct device *dev, phys_addr_t paddr)
> -{
> -	return __sme_set(__phys_to_dma(dev, paddr));
> -}
> -
>   static inline bool dma_capable(struct device *dev, dma_addr_t addr, size_t size,
>   		bool is_ram)
>   {
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index bfb479c8a370fa..54db9cfdaecc6d 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -25,7 +25,7 @@ static inline dma_addr_t phys_to_dma_direct(struct device *dev,
>   		phys_addr_t phys)
>   {
>   	if (force_dma_unencrypted(dev))
> -		return __phys_to_dma(dev, phys);
> +		return phys_to_dma_unencrypted(dev, phys);
>   	return phys_to_dma(dev, phys);
>   }
>   
> @@ -438,13 +438,13 @@ int dma_direct_supported(struct device *dev, u64 mask)
>   		return 1;
>   
>   	/*
> -	 * This check needs to be against the actual bit mask value, so
> -	 * use __phys_to_dma() here so that the SME encryption mask isn't
> +	 * This check needs to be against the actual bit mask value, so use
> +	 * phys_to_dma_unencrypted() here so that the SME encryption mask isn't
>   	 * part of the check.
>   	 */
>   	if (IS_ENABLED(CONFIG_ZONE_DMA))
>   		min_mask = min_t(u64, min_mask, DMA_BIT_MASK(zone_dma_bits));
> -	return mask >= __phys_to_dma(dev, min_mask);
> +	return mask >= phys_to_dma_unencrypted(dev, min_mask);
>   }
>   
>   size_t dma_direct_max_mapping_size(struct device *dev)
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index c19379fabd200e..4ea72d145cd27d 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -670,13 +670,13 @@ dma_addr_t swiotlb_map(struct device *dev, phys_addr_t paddr, size_t size,
>   			      swiotlb_force);
>   
>   	swiotlb_addr = swiotlb_tbl_map_single(dev,
> -			__phys_to_dma(dev, io_tlb_start),
> +			phys_to_dma_unencrypted(dev, io_tlb_start),
>   			paddr, size, size, dir, attrs);
>   	if (swiotlb_addr == (phys_addr_t)DMA_MAPPING_ERROR)
>   		return DMA_MAPPING_ERROR;
>   
>   	/* Ensure that the address returned is DMA'ble */
> -	dma_addr = __phys_to_dma(dev, swiotlb_addr);
> +	dma_addr = phys_to_dma_unencrypted(dev, swiotlb_addr);
>   	if (unlikely(!dma_capable(dev, dma_addr, size, true))) {
>   		swiotlb_tbl_unmap_single(dev, swiotlb_addr, size, size, dir,
>   			attrs | DMA_ATTR_SKIP_CPU_SYNC);
> 
