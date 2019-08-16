Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E93D290708
	for <lists+linux-mips@lfdr.de>; Fri, 16 Aug 2019 19:36:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727347AbfHPRgF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 16 Aug 2019 13:36:05 -0400
Received: from foss.arm.com ([217.140.110.172]:59492 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726900AbfHPRgF (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 16 Aug 2019 13:36:05 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1FB0928;
        Fri, 16 Aug 2019 10:36:04 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1BA173F694;
        Fri, 16 Aug 2019 10:36:02 -0700 (PDT)
Date:   Fri, 16 Aug 2019 18:36:00 +0100
From:   Mark Rutland <mark.rutland@arm.com>
To:     Will Deacon <will@kernel.org>
Cc:     Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org,
        Guan Xuetao <gxt@pku.edu.cn>,
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
Message-ID: <20190816173559.GB7417@lakrids.cambridge.arm.com>
References: <20190816070754.15653-1-hch@lst.de>
 <20190816070754.15653-7-hch@lst.de>
 <20190816173118.4rbbzuogfamfa554@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190816173118.4rbbzuogfamfa554@willie-the-truck>
User-Agent: Mutt/1.11.1+11 (2f07cb52) (2018-12-01)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Aug 16, 2019 at 06:31:18PM +0100, Will Deacon wrote:
> Hi Christoph,
> 
> Thanks for spinning this into a patch.
> 
> On Fri, Aug 16, 2019 at 09:07:54AM +0200, Christoph Hellwig wrote:
> > Based on an email from Will Deacon.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > ---
> >  arch/arm64/include/asm/pgtable.h | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> > index 6700371227d1..6ff221d9a631 100644
> > --- a/arch/arm64/include/asm/pgtable.h
> > +++ b/arch/arm64/include/asm/pgtable.h
> > @@ -435,6 +435,14 @@ static inline pmd_t pmd_mkdevmap(pmd_t pmd)
> >  	__pgprot_modify(prot, PTE_ATTRINDX_MASK, PTE_ATTRINDX(MT_NORMAL_NC) | PTE_PXN | PTE_UXN)
> >  #define pgprot_device(prot) \
> >  	__pgprot_modify(prot, PTE_ATTRINDX_MASK, PTE_ATTRINDX(MT_DEVICE_nGnRE) | PTE_PXN | PTE_UXN)
> > +/*
> > + * DMA allocations for non-coherent devices use what the Arm architecture calls
> > + * "Normal non-cacheable" memory, which permits speculation, unaligned accesses
> > + * and merging of writes.  This is different from "Strongly Ordered" memory
> > + * which is intended for MMIO and thus forbids speculation, preserves access
> > + * size, requires strict alignment and also forces write responses to come from
> > + * the endpoint.
> > + */
> 
> Mind if I tweak the second sentence to be:
> 
>   This is different from "Device-nGnR[nE]" memory which is intended for MMIO
>   and thus forbids speculation, preserves access size, requires strict
>   alignment and can also force write responses to come from the endpoint.
> 
> ? It's a small change, but it better fits with the arm64 terminology
> ("strongly ordered" is no longer used in the architecture).
> 
> If you're happy with that, I can make the change and queue this patch
> for 5.4.

FWIW, with that wording:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.
