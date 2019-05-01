Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D86BC10C68
	for <lists+linux-mips@lfdr.de>; Wed,  1 May 2019 19:49:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726106AbfEARtZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 1 May 2019 13:49:25 -0400
Received: from verein.lst.de ([213.95.11.211]:54199 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726069AbfEARtZ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 1 May 2019 13:49:25 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id BB11B68AFE; Wed,  1 May 2019 19:49:05 +0200 (CEST)
Date:   Wed, 1 May 2019 19:49:05 +0200
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
Subject: Re: [PATCH 4/7] dma-direct: provide generic support for uncached
 kernel segments
Message-ID: <20190501174905.GA20458@lst.de>
References: <20190430110032.25301-1-hch@lst.de> <20190430110032.25301-5-hch@lst.de> <20190501171857.chfxqntvm6r4xrr4@pburton-laptop> <20190501172912.GA19375@lst.de> <20190501174033.6rj5aiopdeo4uqpw@pburton-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190501174033.6rj5aiopdeo4uqpw@pburton-laptop>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, May 01, 2019 at 05:40:34PM +0000, Paul Burton wrote:
> > > If it is necessary then as-is this code will clear the allocated memory
> > > using uncached writes which will be pretty slow. It would be much more
> > > efficient to perform the memset before arch_dma_prep_coherent() & before
> > > converting ret to an uncached address.
> > 
> > Yes, we could do that.
> 
> Great; using cached writes would match the existing MIPS behavior.

Can you test the stack with the two updated patches and ack them if
they are fine?  That would allow getting at least the infrastructure
and mips in for this merge window.
