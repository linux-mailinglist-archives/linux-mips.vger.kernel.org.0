Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9FC952537
	for <lists+linux-mips@lfdr.de>; Tue, 25 Jun 2019 09:50:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727034AbfFYHum (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 25 Jun 2019 03:50:42 -0400
Received: from verein.lst.de ([213.95.11.211]:60511 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726441AbfFYHum (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 25 Jun 2019 03:50:42 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id 3125C68B02; Tue, 25 Jun 2019 09:50:09 +0200 (CEST)
Date:   Tue, 25 Jun 2019 09:50:08 +0200
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
Subject: Re: [PATCH 10/16] mm: rename CONFIG_HAVE_GENERIC_GUP to
 CONFIG_HAVE_FAST_GUP
Message-ID: <20190625075008.GE30815@lst.de>
References: <20190611144102.8848-1-hch@lst.de> <20190611144102.8848-11-hch@lst.de> <20190621142824.GP19891@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190621142824.GP19891@ziepe.ca>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Jun 21, 2019 at 11:28:24AM -0300, Jason Gunthorpe wrote:
> On Tue, Jun 11, 2019 at 04:40:56PM +0200, Christoph Hellwig wrote:
> > We only support the generic GUP now, so rename the config option to
> > be more clear, and always use the mm/Kconfig definition of the
> > symbol and select it from the arch Kconfigs.
> 
> Looks OK to me
> 
> Reviewed-by: Jason Gunthorpe <jgg@mellanox.com>
> 
> But could you also roll something like this in to the series? There is
> no longer any reason for the special __weak stuff that I can see -
> just follow the normal pattern for stubbing config controlled
> functions through the header file.

Something pretty similar is done later in this series.
