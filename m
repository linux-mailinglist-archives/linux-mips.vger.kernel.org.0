Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24FF015D90
	for <lists+linux-mips@lfdr.de>; Tue,  7 May 2019 08:36:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726412AbfEGGgj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 7 May 2019 02:36:39 -0400
Received: from verein.lst.de ([213.95.11.211]:57698 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726313AbfEGGgj (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 7 May 2019 02:36:39 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id 0A8B967358; Tue,  7 May 2019 08:36:19 +0200 (CEST)
Date:   Tue, 7 May 2019 08:36:18 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     Christoph Hellwig <hch@lst.de>, Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Ley Foon Tan <lftan@altera.com>,
        Michal Simek <monstr@monstr.eu>, linux-mips@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 2/7] au1100fb: fix DMA API abuse
Message-ID: <20190507063618.GA28147@lst.de>
References: <20190430110032.25301-1-hch@lst.de> <CGME20190430110118epcas2p24019c7551331cc6390e5b5e07b381dd9@epcas2p2.samsung.com> <20190430110032.25301-3-hch@lst.de> <7a63eeae-4ec3-c82e-c497-8adc7bcb3cea@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a63eeae-4ec3-c82e-c497-8adc7bcb3cea@samsung.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, May 06, 2019 at 03:49:35PM +0200, Bartlomiej Zolnierkiewicz wrote:
> 
> On 04/30/2019 01:00 PM, Christoph Hellwig wrote:
> > Virtual addresses return from dma(m)_alloc_coherent are opaque in what
> > backs then, and drivers must not poke into them.  Switch the driver
> > to use the generic DMA API mmap helper to avoid these games.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> Acked-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Given this actually fixes issues with the current driver, what do you
think of taking it for 5.2 through your tree?  Also au1200fb has
basically the same issues, just without abusing the CAC_ADDR helper,
I could send you a patch for that one as well.
