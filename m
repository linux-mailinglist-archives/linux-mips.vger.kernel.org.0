Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEA922646F4
	for <lists+linux-mips@lfdr.de>; Thu, 10 Sep 2020 15:28:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730654AbgIJN1p (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 10 Sep 2020 09:27:45 -0400
Received: from foss.arm.com ([217.140.110.172]:36000 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730165AbgIJN0O (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 10 Sep 2020 09:26:14 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1EACE106F;
        Thu, 10 Sep 2020 06:26:09 -0700 (PDT)
Received: from [10.57.40.122] (unknown [10.57.40.122])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 44F4D3F66E;
        Thu, 10 Sep 2020 06:26:06 -0700 (PDT)
Subject: Re: [PATCH 09/12] dma-direct: remove __dma_to_phys
To:     Christoph Hellwig <hch@lst.de>, Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        iommu@lists.linux-foundation.org
Cc:     Tomasz Figa <tfiga@chromium.org>, Joerg Roedel <joro@8bytes.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org
References: <20200908164758.3177341-1-hch@lst.de>
 <20200908164758.3177341-10-hch@lst.de>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <5d797c06-401d-62b1-f144-ea6e9a5144dd@arm.com>
Date:   Thu, 10 Sep 2020 14:26:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200908164758.3177341-10-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2020-09-08 17:47, Christoph Hellwig wrote:
> There is no harm in just always clearing the SME encryption bit, while
> significantly simplifying the interface.

After a 10-minute diversion into "but hang on, force_dma_unencrypted() 
is meaningful on PPC and S390 too..." before realising that it all does 
just come back to __sme_clr(), which is indeed a no-op for everyone 
other than AMD, any simplification of this mess is indeed welcome :)

Unless I've massively misunderstood how SME is supposed to work,

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
>   include/linux/dma-direct.h             | 14 +++++---------
>   kernel/dma/direct.c                    |  6 +-----
>   13 files changed, 17 insertions(+), 25 deletions(-)
> 
> diff --git a/arch/arm/include/asm/dma-direct.h b/arch/arm/include/asm/dma-direct.h
> index 7c3001a6a775bf..a8cee87a93e8ab 100644
> --- a/arch/arm/include/asm/dma-direct.h
> +++ b/arch/arm/include/asm/dma-direct.h
> @@ -8,7 +8,7 @@ static inline dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
>   	return pfn_to_dma(dev, __phys_to_pfn(paddr)) + offset;
>   }
>   
> -static inline phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t dev_addr)
> +static inline phys_addr_t dma_to_phys(struct device *dev, dma_addr_t dev_addr)
>   {
>   	unsigned int offset = dev_addr & ~PAGE_MASK;
>   	return __pfn_to_phys(dma_to_pfn(dev, dev_addr)) + offset;
> diff --git a/arch/mips/bmips/dma.c b/arch/mips/bmips/dma.c
> index df56bf4179e347..ba2a5d33dfd3fa 100644
> --- a/arch/mips/bmips/dma.c
> +++ b/arch/mips/bmips/dma.c
> @@ -52,7 +52,7 @@ dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t pa)
>   	return pa;
>   }
>   
> -phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t dma_addr)
> +phys_addr_t dma_to_phys(struct device *dev, dma_addr_t dma_addr)
>   {
>   	struct bmips_dma_range *r;
>   
> diff --git a/arch/mips/cavium-octeon/dma-octeon.c b/arch/mips/cavium-octeon/dma-octeon.c
> index 14ea680d180e07..388b13ba2558c2 100644
> --- a/arch/mips/cavium-octeon/dma-octeon.c
> +++ b/arch/mips/cavium-octeon/dma-octeon.c
> @@ -177,7 +177,7 @@ dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
>   	return paddr;
>   }
>   
> -phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t daddr)
> +phys_addr_t dma_to_phys(struct device *dev, dma_addr_t daddr)
>   {
>   #ifdef CONFIG_PCI
>   	if (dev && dev_is_pci(dev))
> diff --git a/arch/mips/include/asm/dma-direct.h b/arch/mips/include/asm/dma-direct.h
> index 14e352651ce946..8e178651c638c2 100644
> --- a/arch/mips/include/asm/dma-direct.h
> +++ b/arch/mips/include/asm/dma-direct.h
> @@ -3,6 +3,6 @@
>   #define _MIPS_DMA_DIRECT_H 1
>   
>   dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr);
> -phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t daddr);
> +phys_addr_t dma_to_phys(struct device *dev, dma_addr_t daddr);
>   
>   #endif /* _MIPS_DMA_DIRECT_H */
> diff --git a/arch/mips/loongson2ef/fuloong-2e/dma.c b/arch/mips/loongson2ef/fuloong-2e/dma.c
> index e122292bf6660a..83fadeb3fd7d56 100644
> --- a/arch/mips/loongson2ef/fuloong-2e/dma.c
> +++ b/arch/mips/loongson2ef/fuloong-2e/dma.c
> @@ -6,7 +6,7 @@ dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
>   	return paddr | 0x80000000;
>   }
>   
> -phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t dma_addr)
> +phys_addr_t dma_to_phys(struct device *dev, dma_addr_t dma_addr)
>   {
>   	return dma_addr & 0x7fffffff;
>   }
> diff --git a/arch/mips/loongson2ef/lemote-2f/dma.c b/arch/mips/loongson2ef/lemote-2f/dma.c
> index abf0e39d7e4696..302b43a14eee74 100644
> --- a/arch/mips/loongson2ef/lemote-2f/dma.c
> +++ b/arch/mips/loongson2ef/lemote-2f/dma.c
> @@ -6,7 +6,7 @@ dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
>   	return paddr | 0x80000000;
>   }
>   
> -phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t dma_addr)
> +phys_addr_t dma_to_phys(struct device *dev, dma_addr_t dma_addr)
>   {
>   	if (dma_addr > 0x8fffffff)
>   		return dma_addr;
> diff --git a/arch/mips/loongson64/dma.c b/arch/mips/loongson64/dma.c
> index dbfe6e82fddd1c..b3dc5d0bd2b113 100644
> --- a/arch/mips/loongson64/dma.c
> +++ b/arch/mips/loongson64/dma.c
> @@ -13,7 +13,7 @@ dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
>   	return ((nid << 44) ^ paddr) | (nid << node_id_offset);
>   }
>   
> -phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t daddr)
> +phys_addr_t dma_to_phys(struct device *dev, dma_addr_t daddr)
>   {
>   	/* We extract 2bit node id (bit 44~47, only bit 44~45 used now) from
>   	 * Loongson-3's 48bit address space and embed it into 40bit */
> diff --git a/arch/mips/pci/pci-ar2315.c b/arch/mips/pci/pci-ar2315.c
> index 490953f515282a..d88395684f487d 100644
> --- a/arch/mips/pci/pci-ar2315.c
> +++ b/arch/mips/pci/pci-ar2315.c
> @@ -175,7 +175,7 @@ dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
>   	return paddr + ar2315_dev_offset(dev);
>   }
>   
> -phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t dma_addr)
> +phys_addr_t dma_to_phys(struct device *dev, dma_addr_t dma_addr)
>   {
>   	return dma_addr - ar2315_dev_offset(dev);
>   }
> diff --git a/arch/mips/pci/pci-xtalk-bridge.c b/arch/mips/pci/pci-xtalk-bridge.c
> index 9b3cc775c55e05..f1b37f32b55395 100644
> --- a/arch/mips/pci/pci-xtalk-bridge.c
> +++ b/arch/mips/pci/pci-xtalk-bridge.c
> @@ -33,7 +33,7 @@ dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
>   	return bc->baddr + paddr;
>   }
>   
> -phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t dma_addr)
> +phys_addr_t dma_to_phys(struct device *dev, dma_addr_t dma_addr)
>   {
>   	return dma_addr & ~(0xffUL << 56);
>   }
> diff --git a/arch/mips/sgi-ip32/ip32-dma.c b/arch/mips/sgi-ip32/ip32-dma.c
> index fa7b17cb53853e..160317294d97a9 100644
> --- a/arch/mips/sgi-ip32/ip32-dma.c
> +++ b/arch/mips/sgi-ip32/ip32-dma.c
> @@ -27,7 +27,7 @@ dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
>   	return dma_addr;
>   }
>   
> -phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t dma_addr)
> +phys_addr_t dma_to_phys(struct device *dev, dma_addr_t dma_addr)
>   {
>   	phys_addr_t paddr = dma_addr & RAM_OFFSET_MASK;
>   
> diff --git a/arch/powerpc/include/asm/dma-direct.h b/arch/powerpc/include/asm/dma-direct.h
> index abc154d784b078..95b09313d2a4cf 100644
> --- a/arch/powerpc/include/asm/dma-direct.h
> +++ b/arch/powerpc/include/asm/dma-direct.h
> @@ -7,7 +7,7 @@ static inline dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
>   	return paddr + dev->archdata.dma_offset;
>   }
>   
> -static inline phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t daddr)
> +static inline phys_addr_t dma_to_phys(struct device *dev, dma_addr_t daddr)
>   {
>   	return daddr - dev->archdata.dma_offset;
>   }
> diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
> index 20eceb2e4f91f8..f00e262ab6b154 100644
> --- a/include/linux/dma-direct.h
> +++ b/include/linux/dma-direct.h
> @@ -24,11 +24,12 @@ static inline dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
>   	return dev_addr - ((dma_addr_t)dev->dma_pfn_offset << PAGE_SHIFT);
>   }
>   
> -static inline phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t dev_addr)
> +static inline phys_addr_t dma_to_phys(struct device *dev, dma_addr_t dev_addr)
>   {
> -	phys_addr_t paddr = (phys_addr_t)dev_addr;
> +	phys_addr_t paddr = (phys_addr_t)dev_addr +
> +		((phys_addr_t)dev->dma_pfn_offset << PAGE_SHIFT);
>   
> -	return paddr + ((phys_addr_t)dev->dma_pfn_offset << PAGE_SHIFT);
> +	return __sme_clr(paddr);
>   }
>   #endif /* !CONFIG_ARCH_HAS_PHYS_TO_DMA */
>   
> @@ -44,7 +45,7 @@ static inline bool force_dma_unencrypted(struct device *dev)
>   /*
>    * If memory encryption is supported, phys_to_dma will set the memory encryption
>    * bit in the DMA address, and dma_to_phys will clear it.  The raw __phys_to_dma
> - * and __dma_to_phys versions should only be used on non-encrypted memory for
> + * version should only be used on non-encrypted memory for
>    * special occasions like DMA coherent buffers.
>    */
>   static inline dma_addr_t phys_to_dma(struct device *dev, phys_addr_t paddr)
> @@ -52,11 +53,6 @@ static inline dma_addr_t phys_to_dma(struct device *dev, phys_addr_t paddr)
>   	return __sme_set(__phys_to_dma(dev, paddr));
>   }
>   
> -static inline phys_addr_t dma_to_phys(struct device *dev, dma_addr_t daddr)
> -{
> -	return __sme_clr(__dma_to_phys(dev, daddr));
> -}
> -
>   static inline bool dma_capable(struct device *dev, dma_addr_t addr, size_t size,
>   		bool is_ram)
>   {
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index 57a6e7d7cf8f16..bfb479c8a370fa 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -48,11 +48,6 @@ static gfp_t dma_direct_optimal_gfp_mask(struct device *dev, u64 dma_mask,
>   {
>   	u64 dma_limit = min_not_zero(dma_mask, dev->bus_dma_limit);
>   
> -	if (force_dma_unencrypted(dev))
> -		*phys_limit = __dma_to_phys(dev, dma_limit);
> -	else
> -		*phys_limit = dma_to_phys(dev, dma_limit);
> -
>   	/*
>   	 * Optimistically try the zone that the physical address mask falls
>   	 * into first.  If that returns memory that isn't actually addressable
> @@ -61,6 +56,7 @@ static gfp_t dma_direct_optimal_gfp_mask(struct device *dev, u64 dma_mask,
>   	 * Note that GFP_DMA32 and GFP_DMA are no ops without the corresponding
>   	 * zones.
>   	 */
> +	*phys_limit = dma_to_phys(dev, dma_limit);
>   	if (*phys_limit <= DMA_BIT_MASK(zone_dma_bits))
>   		return GFP_DMA;
>   	if (*phys_limit <= DMA_BIT_MASK(32))
> 
