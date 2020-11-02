Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0A4D2A2BFD
	for <lists+linux-mips@lfdr.de>; Mon,  2 Nov 2020 14:51:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725928AbgKBNvM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 2 Nov 2020 08:51:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:47994 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725797AbgKBNvK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 2 Nov 2020 08:51:10 -0500
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8C0442231B;
        Mon,  2 Nov 2020 13:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604325067;
        bh=9qIUbE3lwH4ZvgtTC9bbV3+9hXUEaYm6WiiqQ4WE/Co=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rpbg/1lEiVgNn9Ysvs/9LknHZYACC7zXQOCGCw264IRu8ax1gLK6WH9zSjr+uRe43
         j5PkmmIzKYvzuR6uPdj0UxdnGNyDn2tiAsnr4m+Rc6wtDwZreVMVedmDOCqs8DpK24
         uLH4O6s20Bi63bMTeguJmmwdpc+o+rm+otUlIokQ=
Date:   Mon, 2 Nov 2020 14:52:02 +0100
From:   'Greg KH' <gregkh@linuxfoundation.org>
To:     David Laight <David.Laight@aculab.com>
Cc:     'David Hildenbrand' <david@redhat.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Christoph Hellwig <hch@lst.de>,
        "kernel-team@android.com" <kernel-team@android.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jens Axboe <axboe@kernel.dk>, Arnd Bergmann <arnd@arndb.de>,
        David Howells <dhowells@redhat.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
        "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
        "linux-aio@kvack.org" <linux-aio@kvack.org>,
        "io-uring@vger.kernel.org" <io-uring@vger.kernel.org>,
        "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>,
        "linux-security-module@vger.kernel.org" 
        <linux-security-module@vger.kernel.org>
Subject: Re: Buggy commit tracked to: "Re: [PATCH 2/9] iov_iter: move
 rw_copy_check_uvector() into lib/iov_iter.c"
Message-ID: <20201102135202.GA1016272@kroah.com>
References: <20201022121849.GA1664412@kroah.com>
 <98d9df88-b7ef-fdfb-7d90-2fa7a9d7bab5@redhat.com>
 <20201022125759.GA1685526@kroah.com>
 <20201022135036.GA1787470@kroah.com>
 <134f162d711d466ebbd88906fae35b33@AcuMS.aculab.com>
 <935f7168-c2f5-dd14-7124-412b284693a2@redhat.com>
 <999e2926-9a75-72fd-007a-1de0af341292@redhat.com>
 <35d0ec90ef4f4a35a75b9df7d791f719@AcuMS.aculab.com>
 <20201023144718.GA2525489@kroah.com>
 <0ab5ac71f28d459db2f350c2e07b88ca@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ab5ac71f28d459db2f350c2e07b88ca@AcuMS.aculab.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Nov 02, 2020 at 09:06:38AM +0000, David Laight wrote:
> From: 'Greg KH'
> > Sent: 23 October 2020 15:47
> > 
> > On Fri, Oct 23, 2020 at 02:39:24PM +0000, David Laight wrote:
> > > From: David Hildenbrand
> > > > Sent: 23 October 2020 15:33
> > > ...
> > > > I just checked against upstream code generated by clang 10 and it
> > > > properly discards the upper 32bit via a mov w23 w2.
> > > >
> > > > So at least clang 10 indeed properly assumes we could have garbage and
> > > > masks it off.
> > > >
> > > > Maybe the issue is somewhere else, unrelated to nr_pages ... or clang 11
> > > > behaves differently.
> > >
> > > We'll need the disassembly from a failing kernel image.
> > > It isn't that big to hand annotate.
> > 
> > I've worked around the merge at the moment in the android tree, but it
> > is still quite reproducable, and will try to get a .o file to
> > disassemble on Monday or so...
> 
> Did this get properly resolved?

For some reason, 5.10-rc2 fixed all of this up.  I backed out all of the
patches I had to revert to get 5.10-rc1 to work properly, and then did
the merge and all is well.

It must have been something to do with the compat changes in this same
area that went in after 5.10-rc1, and something got reorganized in the
files somehow.  I really do not know, and at the moment, don't have the
time to track it down anymore.  So for now, I'd say it's all good, sorry
for the noise.

greg k-h
