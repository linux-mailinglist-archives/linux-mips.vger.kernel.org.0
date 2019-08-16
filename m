Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F3ED906ED
	for <lists+linux-mips@lfdr.de>; Fri, 16 Aug 2019 19:32:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727347AbfHPRbZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 16 Aug 2019 13:31:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:53278 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726824AbfHPRbY (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 16 Aug 2019 13:31:24 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7983D2086C;
        Fri, 16 Aug 2019 17:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565976683;
        bh=7UbpCD1eMEdhuE0pVTSmVthW5ADpKtqL/oqKqCN+HEw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LaAnW7Hy029sRfOJ26P9ooRMDVttHdguTvMjat5nc99EUXzMN+g9WMxOwM1dXJPb5
         bzS+jtNUqmYhQDy0h+E7F6sfWJBaB+AAIxRpe05xEh7d5AcpaSW6E2fETpzfwyN7Jv
         fjwn73EdjqvOR3Xn6IGkIW6zAlcnUI3ffOP7Clmo=
Date:   Fri, 16 Aug 2019 18:31:18 +0100
From:   Will Deacon <will@kernel.org>
To:     Christoph Hellwig <hch@lst.de>
Cc:     iommu@lists.linux-foundation.org, Guan Xuetao <gxt@pku.edu.cn>,
        Shawn Anastasio <shawn@anastas.io>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] arm64: document the choice of page attributes for
 pgprot_dmacoherent
Message-ID: <20190816173118.4rbbzuogfamfa554@willie-the-truck>
References: <20190816070754.15653-1-hch@lst.de>
 <20190816070754.15653-7-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190816070754.15653-7-hch@lst.de>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Christoph,

Thanks for spinning this into a patch.

On Fri, Aug 16, 2019 at 09:07:54AM +0200, Christoph Hellwig wrote:
> Based on an email from Will Deacon.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/arm64/include/asm/pgtable.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 6700371227d1..6ff221d9a631 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -435,6 +435,14 @@ static inline pmd_t pmd_mkdevmap(pmd_t pmd)
>  	__pgprot_modify(prot, PTE_ATTRINDX_MASK, PTE_ATTRINDX(MT_NORMAL_NC) | PTE_PXN | PTE_UXN)
>  #define pgprot_device(prot) \
>  	__pgprot_modify(prot, PTE_ATTRINDX_MASK, PTE_ATTRINDX(MT_DEVICE_nGnRE) | PTE_PXN | PTE_UXN)
> +/*
> + * DMA allocations for non-coherent devices use what the Arm architecture calls
> + * "Normal non-cacheable" memory, which permits speculation, unaligned accesses
> + * and merging of writes.  This is different from "Strongly Ordered" memory
> + * which is intended for MMIO and thus forbids speculation, preserves access
> + * size, requires strict alignment and also forces write responses to come from
> + * the endpoint.
> + */

Mind if I tweak the second sentence to be:

  This is different from "Device-nGnR[nE]" memory which is intended for MMIO
  and thus forbids speculation, preserves access size, requires strict
  alignment and can also force write responses to come from the endpoint.

? It's a small change, but it better fits with the arm64 terminology
("strongly ordered" is no longer used in the architecture).

If you're happy with that, I can make the change and queue this patch
for 5.4.

Thanks,

Will
