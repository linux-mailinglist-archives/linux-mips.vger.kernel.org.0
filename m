Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C0B7FC1C9
	for <lists+linux-mips@lfdr.de>; Thu, 14 Nov 2019 09:47:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725976AbfKNIrQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 Nov 2019 03:47:16 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:60341 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725920AbfKNIrQ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 14 Nov 2019 03:47:16 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47DFTs20Lqz9sNT;
        Thu, 14 Nov 2019 19:47:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1573721233;
        bh=6stxD/P99Wd0VO3VjYcBYgKRhWGeDRkv4DHJwuG5urg=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=kVBnH1S6jcLglXb05iWLAEiHR10k0w1FhIdJdWvuStzBNsnARBl4+uSum5s2brxqP
         GJKfzNUU9xlPnXpQFoB7VITQ2OqfqOQs0rAG0CLQ3W5073nN2M00BOeOkimq3YeKkP
         TdbSxqMAPGijfnL7OZRTBDoHc2ILG5v5wUC02n346N7mpwNn7+Y3H79hl5XiAfFXSw
         F8JTEaftbfxSAu4IoLR1A6JgSW2EAokcIko7HMU6NHZhO+81GjkLbdvKtMguFykaGo
         58U9wlWqYA3jIl1yb8C1Zlgl6ro+izLPJI1NtywgXb/5daBLLgSe7ziWWtYWYEOEvc
         1a0vKhm4Wgi6g==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Christoph Hellwig <hch@lst.de>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        iommu@lists.linux-foundation.org,
        Russell King <linux@armlinux.org.uk>
Cc:     linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] dma-direct: unify the dma_capable definitions
In-Reply-To: <20191113073539.9660-2-hch@lst.de>
References: <20191113073539.9660-1-hch@lst.de> <20191113073539.9660-2-hch@lst.de>
Date:   Thu, 14 Nov 2019 19:47:09 +1100
Message-ID: <875zjm26b6.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Christoph Hellwig <hch@lst.de> writes:
> Currently each architectures that wants to override dma_to_phys and
> phys_to_dma also has to provide dma_capable.  But there isn't really
> any good reason for that.  powerpc and mips just have copies of the
> generic one minus the latests fix, and the arm one was the inspiration
> for said fix, but misses the bus_dma_mask handling.
> Make all architectures use the generic version instead.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/arm/include/asm/dma-direct.h     | 19 -------------------
>  arch/mips/include/asm/dma-direct.h    |  8 --------
>  arch/powerpc/include/asm/dma-direct.h |  9 ---------

Looks OK to me.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

> diff --git a/arch/arm/include/asm/dma-direct.h b/arch/arm/include/asm/dma-direct.h
> index b67e5fc1fe43..7c3001a6a775 100644
> --- a/arch/arm/include/asm/dma-direct.h
> +++ b/arch/arm/include/asm/dma-direct.h
> @@ -14,23 +14,4 @@ static inline phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t dev_addr)
>  	return __pfn_to_phys(dma_to_pfn(dev, dev_addr)) + offset;
>  }
>  
> -static inline bool dma_capable(struct device *dev, dma_addr_t addr, size_t size)
> -{
> -	u64 limit, mask;
> -
> -	if (!dev->dma_mask)
> -		return 0;
> -
> -	mask = *dev->dma_mask;
> -
> -	limit = (mask + 1) & ~mask;
> -	if (limit && size > limit)
> -		return 0;
> -
> -	if ((addr | (addr + size - 1)) & ~mask)
> -		return 0;
> -
> -	return 1;
> -}
> -
>  #endif /* ASM_ARM_DMA_DIRECT_H */
> diff --git a/arch/mips/include/asm/dma-direct.h b/arch/mips/include/asm/dma-direct.h
> index b5c240806e1b..14e352651ce9 100644
> --- a/arch/mips/include/asm/dma-direct.h
> +++ b/arch/mips/include/asm/dma-direct.h
> @@ -2,14 +2,6 @@
>  #ifndef _MIPS_DMA_DIRECT_H
>  #define _MIPS_DMA_DIRECT_H 1
>  
> -static inline bool dma_capable(struct device *dev, dma_addr_t addr, size_t size)
> -{
> -	if (!dev->dma_mask)
> -		return false;
> -
> -	return addr + size - 1 <= *dev->dma_mask;
> -}
> -
>  dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr);
>  phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t daddr);
>  
> diff --git a/arch/powerpc/include/asm/dma-direct.h b/arch/powerpc/include/asm/dma-direct.h
> index a2912b47102c..e29e8a236b8d 100644
> --- a/arch/powerpc/include/asm/dma-direct.h
> +++ b/arch/powerpc/include/asm/dma-direct.h
> @@ -2,15 +2,6 @@
>  #ifndef ASM_POWERPC_DMA_DIRECT_H
>  #define ASM_POWERPC_DMA_DIRECT_H 1
>  
> -static inline bool dma_capable(struct device *dev, dma_addr_t addr, size_t size)
> -{
> -	if (!dev->dma_mask)
> -		return false;
> -
> -	return addr + size - 1 <=
> -		min_not_zero(*dev->dma_mask, dev->bus_dma_mask);
> -}
> -
>  static inline dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
>  {
>  	if (!dev)
> diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
> index 6db863c3eb93..991f8aa2676e 100644
> --- a/include/linux/dma-direct.h
> +++ b/include/linux/dma-direct.h
> @@ -24,6 +24,7 @@ static inline phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t dev_addr)
>  
>  	return paddr + ((phys_addr_t)dev->dma_pfn_offset << PAGE_SHIFT);
>  }
> +#endif /* !CONFIG_ARCH_HAS_PHYS_TO_DMA */
>  
>  static inline bool dma_capable(struct device *dev, dma_addr_t addr, size_t size)
>  {
> @@ -38,7 +39,6 @@ static inline bool dma_capable(struct device *dev, dma_addr_t addr, size_t size)
>  
>  	return end <= min_not_zero(*dev->dma_mask, dev->bus_dma_mask);
>  }
> -#endif /* !CONFIG_ARCH_HAS_PHYS_TO_DMA */
>  
>  #ifdef CONFIG_ARCH_HAS_FORCE_DMA_UNENCRYPTED
>  bool force_dma_unencrypted(struct device *dev);
> -- 
> 2.20.1
