Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 574FD3008E4
	for <lists+linux-mips@lfdr.de>; Fri, 22 Jan 2021 17:46:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728718AbhAVQlq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 Jan 2021 11:41:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728487AbhAVQlC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 22 Jan 2021 11:41:02 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9690CC06178B;
        Fri, 22 Jan 2021 08:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=SMuI+JN9JhZogfIpHxGQxmytOjKEK/WColKvy7oEXQQ=; b=nmTtkyET+pvLqy6/pX4Mw7VEXF
        Nr5ItHGqVtReKAA/2SgWLq9UdDXSG2E0EQI3nOSy/hCI5iBt5hy6VqUOXI3gqWJLDkgCrCdJZow8f
        +jk35Dlp3GtzuTbOdwuMcQ5Bs2dwYKGmnoKqKSEfXFR9c9I35Z5D3TjKTpZCF91kwq7e1RGkB20Y/
        nGNLg9zqOzex53rNNcYXQGMTvBkvul+Gk6QIkQhHn0mWI60yC/evpD6NfgApzTuUt6NiFmo6UdT8z
        luZJHrFTFrIDvYW/Fju+kJhJPtM5AHNKQQKwbgw7PHSnX2dPkGyudksTf+iCkLmr3V53J0yr61AVo
        qMPJfGug==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1l2zSr-000y3v-In; Fri, 22 Jan 2021 16:39:29 +0000
Date:   Fri, 22 Jan 2021 16:39:13 +0000
From:   Christoph Hellwig <hch@infradead.org>
To:     Lauri Kasanen <cand@gmx.com>
Cc:     Christoph Hellwig <hch@infradead.org>, linux-mips@vger.kernel.org,
        tsbogend@alpha.franken.de, axboe@kernel.dk,
        linux-block@vger.kernel.org, Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH v9] block: Add n64 cart driver
Message-ID: <20210122163913.GA227449@infradead.org>
References: <20210122110043.f36cd22df1233754753518c1@gmx.com>
 <20210122111727.GA161970@infradead.org>
 <20210122155801.a24c328b7aefdcffb7d68576@gmx.com>
 <20210122161804.GA225607@infradead.org>
 <20210122182349.c98d8599f7593afefa43c9dd@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210122182349.c98d8599f7593afefa43c9dd@gmx.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Jan 22, 2021 at 06:23:49PM +0200, Lauri Kasanen wrote:
> > Your driver can communicate the required alignment using the
> > blk_queue_update_dma_alignment API.
> 
> Is it guaranteed to be physically contiguous?

The alignment requirement applies to each bio_vec.

What alignment does the hardware require?
