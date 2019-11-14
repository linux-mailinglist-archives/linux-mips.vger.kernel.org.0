Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DC66FC1D5
	for <lists+linux-mips@lfdr.de>; Thu, 14 Nov 2019 09:48:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725920AbfKNIsv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 Nov 2019 03:48:51 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:51817 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726452AbfKNIsv (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 14 Nov 2019 03:48:51 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47DFWh1KCJz9sNT;
        Thu, 14 Nov 2019 19:48:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1573721328;
        bh=bDF+Yyy88Fi18Ty7c9txdLpa+ezncf6v+l29k9UorgE=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=h8xc1Vk45YLl9MzdGeCdPvVM/gZgFW8kGJAtTantRRnTOlPRUk++Y13aiXGqk/x0i
         +uYEKQ6YmW092dWaZrlWweY0cIjcwmDub4jkR/wcrMJYEUmFGPzEJ2z6Ihh2l9l84s
         VWu2apAPX2+lF206X5eZXVLXEk+Z4OjWoh3rvv3tb1AO83VqhnrRpa/I0Gcb49rzlo
         KnNUrtMjeae+4ZLyJp+BqjmUzhV2MqmSlAxK7/LELcl2os+oGvZOJwGpAm8mUJEh5W
         erpXofYK/ZCFPUo11Pk1SoU/EupeIr+q89BxoSTnukj3aY8zV7vWldzixXShJN/wTN
         wKlQaaHzA3RhQ==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Christoph Hellwig <hch@lst.de>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        iommu@lists.linux-foundation.org,
        Russell King <linux@armlinux.org.uk>
Cc:     linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] powerpc: remove support for NULL dev in __phys_to_dma / __dma_to_phys
In-Reply-To: <20191113073539.9660-4-hch@lst.de>
References: <20191113073539.9660-1-hch@lst.de> <20191113073539.9660-4-hch@lst.de>
Date:   Thu, 14 Nov 2019 19:48:47 +1100
Message-ID: <8736eq268g.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Christoph Hellwig <hch@lst.de> writes:
> Support for calling the DMA API functions without a valid device pointer
> was removed a while ago, so remove the stale support for that from the
> powerpc __phys_to_dma / __dma_to_phys helpers.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/powerpc/include/asm/dma-direct.h | 4 ----
>  1 file changed, 4 deletions(-)

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

cheers

> diff --git a/arch/powerpc/include/asm/dma-direct.h b/arch/powerpc/include/asm/dma-direct.h
> index e29e8a236b8d..abc154d784b0 100644
> --- a/arch/powerpc/include/asm/dma-direct.h
> +++ b/arch/powerpc/include/asm/dma-direct.h
> @@ -4,15 +4,11 @@
>  
>  static inline dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
>  {
> -	if (!dev)
> -		return paddr + PCI_DRAM_OFFSET;
>  	return paddr + dev->archdata.dma_offset;
>  }
>  
>  static inline phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t daddr)
>  {
> -	if (!dev)
> -		return daddr - PCI_DRAM_OFFSET;
>  	return daddr - dev->archdata.dma_offset;
>  }
>  #endif /* ASM_POWERPC_DMA_DIRECT_H */
> -- 
> 2.20.1
