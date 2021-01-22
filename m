Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 806F0300995
	for <lists+linux-mips@lfdr.de>; Fri, 22 Jan 2021 18:23:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729626AbhAVQ4a (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 Jan 2021 11:56:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729504AbhAVQTO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 22 Jan 2021 11:19:14 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8FCAC0613D6;
        Fri, 22 Jan 2021 08:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=UjJ6kxc55YH2vlKrgOGDEBcQx9lEFDcVHbyNVK56NIw=; b=Nlz6o4LImTvlsn+z1TO6pUtyvD
        FNEX8XAsCmh1Zl4sTwL8+8u/+DRMS9EJZVVoToIGgcz+uQtXgMZUEwJkMsWcwvI3drtnyIrnwxqLY
        94ubEE+XvxNTbdVaqlP1SlAirtZ2YflFtxnnXsMs0fCIge1roOcJ4hnouQM9YVnM9jm5ghleQYcc6
        Q3XVRuCiLv2v75dF4Unw38V9fXiO5yq/mpqFVvNzZZqrpPkaVXCICdDmVqUInRcfeX3SgyzjGqFHP
        Q+YlHeuYu00cGjkK9nTYr+Mip1M5TeU0mHWfNDoRZ9J3xYcfecIYj+R0bm0r3KcJ6PK5HqiJRee7e
        wzAAAW6w==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1l2z8O-000wzc-5N; Fri, 22 Jan 2021 16:18:12 +0000
Date:   Fri, 22 Jan 2021 16:18:04 +0000
From:   Christoph Hellwig <hch@infradead.org>
To:     Lauri Kasanen <cand@gmx.com>
Cc:     Christoph Hellwig <hch@infradead.org>, linux-mips@vger.kernel.org,
        tsbogend@alpha.franken.de, axboe@kernel.dk,
        linux-block@vger.kernel.org, Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH v9] block: Add n64 cart driver
Message-ID: <20210122161804.GA225607@infradead.org>
References: <20210122110043.f36cd22df1233754753518c1@gmx.com>
 <20210122111727.GA161970@infradead.org>
 <20210122155801.a24c328b7aefdcffb7d68576@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210122155801.a24c328b7aefdcffb7d68576@gmx.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Jan 22, 2021 at 03:58:01PM +0200, Lauri Kasanen wrote:
> On Fri, 22 Jan 2021 11:17:27 +0000
> Christoph Hellwig <hch@infradead.org> wrote:
> 
> > Sorry for not noticing this earlier, but why do you need the bounce
> > buffer vs just mapping the data buffer?
> 
> I think I've answered this once already a few iterations before. DMA
> alignment restrictions, not sure what guarantees the bio buffer has.

Your driver can communicate the required alignment using the
blk_queue_update_dma_alignment API.
