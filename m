Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1FD98443A
	for <lists+linux-mips@lfdr.de>; Wed,  7 Aug 2019 08:04:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727145AbfHGGEk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 7 Aug 2019 02:04:40 -0400
Received: from verein.lst.de ([213.95.11.211]:34678 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726511AbfHGGEk (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 7 Aug 2019 02:04:40 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id BFD0A68CEE; Wed,  7 Aug 2019 08:04:33 +0200 (CEST)
Date:   Wed, 7 Aug 2019 08:04:32 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Shawn Anastasio <shawn@anastas.io>
Cc:     Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org,
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
Message-ID: <20190807060432.GD6627@lst.de>
References: <20190805080145.5694-1-hch@lst.de> <20190805080145.5694-2-hch@lst.de> <7df95ffb-6df3-b118-284c-ee32cad81199@anastas.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7df95ffb-6df3-b118-284c-ee32cad81199@anastas.io>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Aug 06, 2019 at 09:39:06PM +0200, Shawn Anastasio wrote:
>> -#ifdef CONFIG_ARCH_HAS_DMA_MMAP_PGPROT
>>   pgprot_t arch_dma_mmap_pgprot(struct device *dev, pgprot_t prot,
>>   		unsigned long attrs);
>> -#else
>> -# define arch_dma_mmap_pgprot(dev, prot, attrs)	pgprot_noncached(prot)
>> -#endif
>
> Nit, but maybe the prototype should still be ifdef'd here? It at least
> could prevent a reader from incorrectly thinking that the function is
> always present.

Actually it is typical modern Linux style to just provide a prototype
and then use "if (IS_ENABLED(CONFIG_FOO))" to guard the call(s) to it.

>
> Also, like Will mentioned earlier, the function name isn't entirely
> accurate anymore. I second the suggestion of using something like
> arch_dma_noncoherent_pgprot().

As mentioned I plan to remove arch_dma_mmap_pgprot for 5.4, so I'd
rather avoid churn for the short period of time.

> As for your idea of defining
> pgprot_dmacoherent for all architectures as
>
> #ifndef pgprot_dmacoherent
> #define pgprot_dmacoherent pgprot_noncached
> #endif
>
> I think that the name here is kind of misleading too, since this
> definition will only be used when there is no support for proper
> DMA coherency.

Do you have a suggestion for a better name?  I'm pretty bad at naming,
so just reusing the arm name seemed like a good way to avoid having
to make naming decisions myself.
