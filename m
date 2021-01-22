Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A37D930094A
	for <lists+linux-mips@lfdr.de>; Fri, 22 Jan 2021 18:10:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729763AbhAVRKB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 Jan 2021 12:10:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729716AbhAVRJt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 22 Jan 2021 12:09:49 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD31AC0613D6;
        Fri, 22 Jan 2021 09:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=Kn1OlpBQDYWZT+0I2GkDluChJoJejgjTMBYvRcZadvw=; b=SaZB18OkS7E6YPXfoEdJtC32y3
        smA0U2M+8+Dn6tLcXxP3T06Z7EXlCMo76qMrtqH09U5K6qaSWB3VAFXxKMFLl2qRQWOpeTo0PUuLH
        H1xtrksc/fRcF1kCobFSXh5TQcdGidLQaeOhj8/YfmDRd+pqEZ4x7UYeWlcaEelzf52jk/RHm1bEu
        V5jAN5h+VwR2xGDQ0YmK1+sHBI2EYNY9jT5Dsf9fkg50FBqWKrdLprst4vzRIWeCl6UP+DwXe9GGx
        XCWK2DDEEBHAvF3XVl5W6bM06f5NvUwrUNervI0XN3crVOyq8CLxqLtvlczfKJgBVIg2ZrTqcaLR7
        /joEKXVg==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1l2zvA-000zmj-7d; Fri, 22 Jan 2021 17:08:29 +0000
Date:   Fri, 22 Jan 2021 17:08:28 +0000
From:   Christoph Hellwig <hch@infradead.org>
To:     Lauri Kasanen <cand@gmx.com>
Cc:     Christoph Hellwig <hch@infradead.org>, linux-mips@vger.kernel.org,
        tsbogend@alpha.franken.de, axboe@kernel.dk,
        linux-block@vger.kernel.org, Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH v9] block: Add n64 cart driver
Message-ID: <20210122170828.GA237009@infradead.org>
References: <20210122110043.f36cd22df1233754753518c1@gmx.com>
 <20210122111727.GA161970@infradead.org>
 <20210122155801.a24c328b7aefdcffb7d68576@gmx.com>
 <20210122161804.GA225607@infradead.org>
 <20210122182349.c98d8599f7593afefa43c9dd@gmx.com>
 <20210122163913.GA227449@infradead.org>
 <20210122185619.980fa4f713b8f57528c3af9e@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210122185619.980fa4f713b8f57528c3af9e@gmx.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Jan 22, 2021 at 06:56:19PM +0200, Lauri Kasanen wrote:
> > What alignment does the hardware require?
> 
> It requires 8-byte alignment, but the buffer must also be physically
> contiguous.

If you want a single contiguous buffer you must use the
blk_queue_max_segments() API to ask for a single contiguous segment.

> I grepped around, but apparently no driver under drivers/block does
> direct DMA to the bio buffer. They all use their own buffer and memcpy,
> like this patch. ps3vram, ps3disk, amiflop, etc etc.
> 
> If all existing drivers use their own buffer, why is a different
> approach required for new drivers?

That selections is a bunch of weirdo legacy drivers.  If you want
to look at something reasonably modern but still simple take a look
at drivers/block/virtio_blk.c.
