Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A7E15232F
	for <lists+linux-mips@lfdr.de>; Tue, 25 Jun 2019 07:53:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728536AbfFYFxL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 25 Jun 2019 01:53:11 -0400
Received: from verein.lst.de ([213.95.11.211]:59629 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727648AbfFYFxL (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 25 Jun 2019 01:53:11 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id 7E4DA68B02; Tue, 25 Jun 2019 07:52:40 +0200 (CEST)
Date:   Tue, 25 Jun 2019 07:52:40 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Ley Foon Tan <lftan@altera.com>
Cc:     Christoph Hellwig <hch@lst.de>, Michal Simek <monstr@monstr.eu>,
        linux-mips@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] nios2: use the generic uncached segment support in
 dma-direct
Message-ID: <20190625055240.GB28854@lst.de>
References: <20190603065324.9724-1-hch@lst.de> <20190603065324.9724-2-hch@lst.de> <CAFiDJ5-HwPR-SWUkYA9=Jn_iHnZ+xWzx6RrcHPNy8kA0jmeZfw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFiDJ5-HwPR-SWUkYA9=Jn_iHnZ+xWzx6RrcHPNy8kA0jmeZfw@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jun 25, 2019 at 01:29:40PM +0800, Ley Foon Tan wrote:
> On Mon, Jun 3, 2019 at 2:54 PM Christoph Hellwig <hch@lst.de> wrote:
> >
> > Stop providing our own arch alloc/free hooks and just expose the segment
> > offset and use the generic dma-direct allocator.
> >
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> Acked-by: Ley Foon Tan <ley.foon.tan@intel.com>

Thanks,

applied to dma-mapping for-next.
