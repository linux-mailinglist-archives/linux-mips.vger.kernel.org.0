Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71FE482ABB
	for <lists+linux-mips@lfdr.de>; Tue,  6 Aug 2019 07:12:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726076AbfHFFMq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 6 Aug 2019 01:12:46 -0400
Received: from verein.lst.de ([213.95.11.211]:53003 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726036AbfHFFMq (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 6 Aug 2019 01:12:46 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 8410D68B05; Tue,  6 Aug 2019 07:12:42 +0200 (CEST)
Date:   Tue, 6 Aug 2019 07:12:42 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Gavin Li <gavinli@thegavinli.com>
Cc:     Christoph Hellwig <hch@lst.de>, Shawn Anastasio <shawn@anastas.io>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linuxppc-dev@lists.ozlabs.org,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Gavin Li <git@thegavinli.com>
Subject: Re: [PATCH 1/2] dma-mapping: fix page attributes for dma_mmap_*
Message-ID: <20190806051242.GA13269@lst.de>
References: <20190805080145.5694-1-hch@lst.de> <20190805080145.5694-2-hch@lst.de> <CAP_+7SzPdNCMKuuXMjHjpCzxsey2YWR_e6mTAWtNSZ6kKBvKFw@mail.gmail.com> <CA+GxvY5C_rrukCzC5K-h72bePyW8PS_Rfj3uxh-K6UrcAextUQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+GxvY5C_rrukCzC5K-h72bePyW8PS_Rfj3uxh-K6UrcAextUQ@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Aug 05, 2019 at 07:55:44PM -0700, Gavin Li wrote:
> >         /* create a coherent mapping */
> >         ret = dma_common_contiguous_remap(page, size, VM_USERMAP,
> > -                       arch_dma_mmap_pgprot(dev, PAGE_KERNEL, attrs),
> > +                       dma_pgprot(dev, PAGE_KERNEL, attrs),
> >                         __builtin_return_address(0));
> >         if (!ret) {
> >                 __dma_direct_free_pages(dev, size, page);
> 
> Is dma_common_contiguous_remap() still necessary in the
> DMA_ATTR_NON_CONSISTENT case? I would presume it would be fine to just
> return a linearly mapped address in that case.

It would not be required for a real DMA_ATTR_NON_CONSISTENT
implementation.  But only parisc and mips actually properly implement
DMA_ATTR_NON_CONSISTENT, everyone ignores it.  Given that the API is
a little ill defined and I have a better replacement in the pipeline
I don't want to start implementing it for other architectures now.
