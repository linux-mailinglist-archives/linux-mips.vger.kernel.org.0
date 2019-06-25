Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7BE352599
	for <lists+linux-mips@lfdr.de>; Tue, 25 Jun 2019 09:57:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726587AbfFYH5Y (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 25 Jun 2019 03:57:24 -0400
Received: from verein.lst.de ([213.95.11.211]:60598 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726531AbfFYH5Y (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 25 Jun 2019 03:57:24 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id 1831068B02; Tue, 25 Jun 2019 09:56:51 +0200 (CEST)
Date:   Tue, 25 Jun 2019 09:56:50 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Nicholas Piggin <npiggin@gmail.com>,
        Khalid Aziz <khalid.aziz@oracle.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-mips@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-mm@kvack.org, x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/16] mm: consolidate the get_user_pages*
 implementations
Message-ID: <20190625075650.GF30815@lst.de>
References: <20190611144102.8848-1-hch@lst.de> <20190611144102.8848-12-hch@lst.de> <20190621144131.GQ19891@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190621144131.GQ19891@ziepe.ca>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Jun 21, 2019 at 11:41:31AM -0300, Jason Gunthorpe wrote:
> >  static bool gup_fast_permitted(unsigned long start, unsigned long end)
> >  {
> > -	return true;
> > +	return IS_ENABLED(CONFIG_HAVE_FAST_GUP) ? true : false;
> 
> The ?: is needed with IS_ENABLED?

It shouldn't, I'll fix it up.

> I'd suggest to revise this block a tiny bit:
> 
> -#ifndef gup_fast_permitted
> +#if !IS_ENABLED(CONFIG_HAVE_FAST_GUP) || !defined(gup_fast_permitted)
>  /*
>   * Check if it's allowed to use __get_user_pages_fast() for the range, or
>   * we need to fall back to the slow version:
>   */
> -bool gup_fast_permitted(unsigned long start, int nr_pages)
> +static bool gup_fast_permitted(unsigned long start, int nr_pages)
>  {
> 
> Just in case some future arch code mismatches the header and kconfig..

IS_ENABLED outside a function doesn't really make sense.  But I'll
just life the IS_ENABLED(CONFIG_HAVE_FAST_GUP) checks into the two
callers.
