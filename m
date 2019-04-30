Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB3E5100CF
	for <lists+linux-mips@lfdr.de>; Tue, 30 Apr 2019 22:30:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726030AbfD3UaH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Apr 2019 16:30:07 -0400
Received: from verein.lst.de ([213.95.11.211]:48956 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726028AbfD3UaH (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 30 Apr 2019 16:30:07 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id 9E22067358; Tue, 30 Apr 2019 22:29:47 +0200 (CEST)
Date:   Tue, 30 Apr 2019 22:29:47 +0200
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
Message-ID: <20190430202947.GA30262@lst.de>
References: <20190430110032.25301-1-hch@lst.de> <20190430110032.25301-6-hch@lst.de> <20190430201041.536amvinrcvd2wua@pburton-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190430201041.536amvinrcvd2wua@pburton-laptop>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Apr 30, 2019 at 08:10:43PM +0000, Paul Burton wrote:
> This series looks like a nice cleanup to me - the one thing that puzzles
> me is the !PageHighMem check above.
> 
> As far as I can see arch_dma_prep_coherent() should never be called with
> a highmem page, so would it make more sense to either drop this check or
> perhaps wrap it in a WARN_ON()?

dma_alloc_from_contigous can return highmem pages depending on where
the CMA area is located.  But given that these pages don't have a
direct kernel mapping we also shouldn't have to flush the caches
for them.
