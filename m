Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8FE552516
	for <lists+linux-mips@lfdr.de>; Tue, 25 Jun 2019 09:44:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727571AbfFYHo1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 25 Jun 2019 03:44:27 -0400
Received: from verein.lst.de ([213.95.11.211]:60434 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726321AbfFYHo1 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 25 Jun 2019 03:44:27 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id 5891C68B02; Tue, 25 Jun 2019 09:43:54 +0200 (CEST)
Date:   Tue, 25 Jun 2019 09:43:53 +0200
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
Subject: Re: [PATCH 01/16] mm: use untagged_addr() for get_user_pages_fast
 addresses
Message-ID: <20190625074353.GC30815@lst.de>
References: <20190611144102.8848-1-hch@lst.de> <20190611144102.8848-2-hch@lst.de> <20190621133911.GL19891@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190621133911.GL19891@ziepe.ca>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Jun 21, 2019 at 10:39:11AM -0300, Jason Gunthorpe wrote:
> Hmm, this function, and the other, goes on to do:
> 
>         if (unlikely(!access_ok((void __user *)start, len)))
>                 return 0;
> 
> and I thought that access_ok takes in the tagged pointer?
> 
> How about re-order it a bit?

Actually..  I we reorder this we'd need to to duplicate a few things
due to the zero/negative length checking.  Given the feedback from
Khalid I'd thus rather skip the reorder for now.  If we have a good
reason we could add it back, but it would be a bit involved.
