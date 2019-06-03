Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E74CC329DF
	for <lists+linux-mips@lfdr.de>; Mon,  3 Jun 2019 09:41:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726606AbfFCHlu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 3 Jun 2019 03:41:50 -0400
Received: from verein.lst.de ([213.95.11.211]:55187 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726179AbfFCHlu (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 3 Jun 2019 03:41:50 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id B4E2E67358; Mon,  3 Jun 2019 09:41:21 +0200 (CEST)
Date:   Mon, 3 Jun 2019 09:41:21 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Christoph Hellwig <hch@lst.de>, Paul Burton <paul.burton@mips.com>,
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
        linux-mips@vger.kernel.org,
        Linux-sh list <linux-sh@vger.kernel.org>,
        sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Linux-MM <linux-mm@kvack.org>,
        the arch/x86 maintainers <x86@kernel.org>,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 03/16] mm: simplify gup_fast_permitted
Message-ID: <20190603074121.GA22920@lst.de>
References: <20190601074959.14036-1-hch@lst.de> <20190601074959.14036-4-hch@lst.de> <CAHk-=whusWKhS=SYoC9f9HjVmPvR5uP51Mq=ZCtktqTBT2qiBw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whusWKhS=SYoC9f9HjVmPvR5uP51Mq=ZCtktqTBT2qiBw@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Jun 01, 2019 at 09:14:17AM -0700, Linus Torvalds wrote:
> On Sat, Jun 1, 2019 at 12:50 AM Christoph Hellwig <hch@lst.de> wrote:
> >
> > Pass in the already calculated end value instead of recomputing it, and
> > leave the end > start check in the callers instead of duplicating them
> > in the arch code.
> 
> Good cleanup, except it's wrong.
> 
> > -       if (nr_pages <= 0)
> > +       if (end < start)
> >                 return 0;
> 
> You moved the overflow test to generic code - good.
> 
> You removed the sign and zero test on nr_pages - bad.

I only removed a duplicate of it.  The full (old) code in
get_user_pages_fast() looks like this:

	if (nr_pages <= 0)
		return 0;

	if (unlikely(!access_ok((void __user *)start, len)))
		return -EFAULT;

	if (gup_fast_permitted(start, nr_pages)) {
