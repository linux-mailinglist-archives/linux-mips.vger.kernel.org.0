Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE49A300B3F
	for <lists+linux-mips@lfdr.de>; Fri, 22 Jan 2021 19:30:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728807AbhAVSab (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 Jan 2021 13:30:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728685AbhAVSZV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 22 Jan 2021 13:25:21 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8179DC06121F;
        Fri, 22 Jan 2021 10:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=w+YCOFAQ20hSAyDFKoDJi9oUpd/wXrc+UjaBZ8KRY6g=; b=VhhNNcH9eCkwstIUsY27bNh8JX
        FRoQeLt8IKiLqPTlZLqUJzQ0ELIadh/Oyui5aSmXQjsl4U1xpz1wRGvAyBg/Tu7ZoUjsKvoztOz+I
        7wBPWWalu55Dkb3B4gndMpF1rMzhVpPsLaBIza12DNKUD3DkY5Of+8ZQcgm1zlRXFr3g/sO9qgZNO
        Ly/u3TBi2nZuK2bsVPwkgBv6/JofWNuPvfg0PKhbqDawPH53ubXcC20oIYZ235QhjW58bzYtt+CY1
        UG5SvIhtRMPiqDloIdkkAByF+QO1IMqs0mRMCMH4I8NBMIPvB/zNQ+LsZ8TF+vmHwIZ4sTOKZ//G6
        lRQAHopg==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1l312t-0014XY-EY; Fri, 22 Jan 2021 18:20:37 +0000
Date:   Fri, 22 Jan 2021 18:20:31 +0000
From:   Christoph Hellwig <hch@infradead.org>
To:     Lauri Kasanen <cand@gmx.com>
Cc:     Keith Busch <kbusch@kernel.org>,
        Christoph Hellwig <hch@infradead.org>,
        linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        axboe@kernel.dk, linux-block@vger.kernel.org
Subject: Re: [PATCH v9] block: Add n64 cart driver
Message-ID: <20210122182031.GA255271@infradead.org>
References: <20210122110043.f36cd22df1233754753518c1@gmx.com>
 <20210122111727.GA161970@infradead.org>
 <20210122155801.a24c328b7aefdcffb7d68576@gmx.com>
 <20210122161804.GA225607@infradead.org>
 <20210122182349.c98d8599f7593afefa43c9dd@gmx.com>
 <20210122163913.GA227449@infradead.org>
 <20210122185619.980fa4f713b8f57528c3af9e@gmx.com>
 <20210122171120.GA1728441@dhcp-10-100-145-180.wdc.com>
 <20210122200117.b1b1cda46cefc840595d2b09@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210122200117.b1b1cda46cefc840595d2b09@gmx.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Jan 22, 2021 at 08:01:17PM +0200, Lauri Kasanen wrote:
> On Fri, 22 Jan 2021 09:11:20 -0800
> Keith Busch <kbusch@kernel.org> wrote:
> > Each bio_vec segment is physically contiguous.
> 
> What's the official way to get that buffer's physical address? I
> couldn't find any driver that does DMA to the bio buffer, to use as an
> example. Maybe used wrong keywords.

In Linux we never DMA to the physical address, but the DMA address.

For a bio with just a single bvec (that is a single contigous segment)
we have the dma_map_bvec helper that is only used by the nvme-pci
driver for special optimizations in the case of a single contigous
segment.
