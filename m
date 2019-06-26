Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 636BD561E0
	for <lists+linux-mips@lfdr.de>; Wed, 26 Jun 2019 07:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726525AbfFZFuI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 26 Jun 2019 01:50:08 -0400
Received: from verein.lst.de ([213.95.11.211]:40248 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725790AbfFZFuI (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 26 Jun 2019 01:50:08 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id 1443D68B05; Wed, 26 Jun 2019 07:49:35 +0200 (CEST)
Date:   Wed, 26 Jun 2019 07:49:34 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Andrew Morton <akpm@linux-foundation.org>
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
Subject: Re: [PATCH 14/16] mm: move the powerpc hugepd code to mm/gup.c
Message-ID: <20190626054934.GA23547@lst.de>
References: <20190625143715.1689-1-hch@lst.de> <20190625143715.1689-15-hch@lst.de> <20190625123757.ec7e886747bb5a9bc364107d@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190625123757.ec7e886747bb5a9bc364107d@linux-foundation.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jun 25, 2019 at 12:37:57PM -0700, Andrew Morton wrote:
> On Tue, 25 Jun 2019 16:37:13 +0200 Christoph Hellwig <hch@lst.de> wrote:
> 
> > +static int gup_huge_pd(hugepd_t hugepd
> 
> Naming nitlet: we have hugepd and we also have huge_pd.  We have
> hugepte and we also have huge_pte.  It make things a bit hard to
> remember and it would be nice to make it all consistent sometime.
> 
> We're consistent with huge_pud and almost consistent with huge_pmd.
> 
> To be fully consistent I guess we should make all of them have the
> underscore.  Or not have it.  

Either way is fine with me.  Feel free to fix up per your preference.
