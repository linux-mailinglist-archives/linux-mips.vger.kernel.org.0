Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 446AF101A5
	for <lists+linux-mips@lfdr.de>; Tue, 30 Apr 2019 23:16:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726559AbfD3VQM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Apr 2019 17:16:12 -0400
Received: from verein.lst.de ([213.95.11.211]:49203 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726015AbfD3VQM (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 30 Apr 2019 17:16:12 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id 2CE8867358; Tue, 30 Apr 2019 23:15:54 +0200 (CEST)
Date:   Tue, 30 Apr 2019 23:15:54 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Paul Burton <paul.burton@mips.com>
Cc:     Christoph Hellwig <hch@lst.de>, Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Ley Foon Tan <lftan@altera.com>,
        Michal Simek <monstr@monstr.eu>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH 5/7] MIPS: use the generic uncached segment support in
 dma-direct
Message-ID: <20190430211553.GA31109@lst.de>
References: <20190430110032.25301-1-hch@lst.de> <20190430110032.25301-6-hch@lst.de> <20190430201041.536amvinrcvd2wua@pburton-laptop> <20190430202947.GA30262@lst.de> <20190430211105.ielntedm46uqamca@pburton-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190430211105.ielntedm46uqamca@pburton-laptop>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Apr 30, 2019 at 09:11:07PM +0000, Paul Burton wrote:
> Right but dma_direct_alloc_pages() already checks for the PageHighMem
> case & returns before ever calling arch_dma_prep_coherent(), no?

True.  And of course it can't be remapped into the uncached segment
anyway.  So yes, we should drop it.  Eventually I want to add generic
support for DMA_ATTR_NO_KERNEL_MAPPING, but that'll involved auditing
all instances anyway.
