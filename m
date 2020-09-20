Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02AF9271767
	for <lists+linux-mips@lfdr.de>; Sun, 20 Sep 2020 21:15:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726342AbgITTPE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 20 Sep 2020 15:15:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:60082 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726126AbgITTPD (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 20 Sep 2020 15:15:03 -0400
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B9B412220C
        for <linux-mips@vger.kernel.org>; Sun, 20 Sep 2020 19:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600629302;
        bh=01MigO53P6iyZydtBYB0dVEV2Jvv4nS2ce79nd2bE4Q=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=PjyDniQs3KsBKfILCo6DAkzBMbsRqEcz0eTgRBTcYSLWjku25BIq5mD1QmuEZmMJQ
         jpFnkv8vioYuDopKE61DV8oByT/r3jABZCYx9qOL9qTBjh5Fdq/d2X04dY9OE6RoCq
         neDS7X/OZByM2czMdMljYSEzNV4dCdGGIVn7ZX0A=
Received: by mail-wm1-f49.google.com with SMTP id e17so10064179wme.0
        for <linux-mips@vger.kernel.org>; Sun, 20 Sep 2020 12:15:02 -0700 (PDT)
X-Gm-Message-State: AOAM531xuQDSCqTM9yd6OTXLNSdeq4mHJxIfKu83YW+ez96rxSkgrq0Q
        rTu1IyTCGzJrWFeISf6nQw/UGQkeh2ZMQO7dhTOugQ==
X-Google-Smtp-Source: ABdhPJznW7DCp463LJOKwLIqH+/ZeaOskntfIIXR0IAAA+ZM4omIXer1gN2IBUUGrBDkxuviLF20WI9Nmbt3oWZvbk0=
X-Received: by 2002:a05:600c:2183:: with SMTP id e3mr27891946wme.49.1600629301119;
 Sun, 20 Sep 2020 12:15:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200918124533.3487701-1-hch@lst.de> <20200918124533.3487701-2-hch@lst.de>
 <20200920151510.GS32101@casper.infradead.org> <20200920180742.GN3421308@ZenIV.linux.org.uk>
In-Reply-To: <20200920180742.GN3421308@ZenIV.linux.org.uk>
From:   Andy Lutomirski <luto@kernel.org>
Date:   Sun, 20 Sep 2020 12:14:49 -0700
X-Gmail-Original-Message-ID: <CALCETrWHW4wHG+Z-mxsY-kvjSi+S6gRUQ+LHd9syPcm5bhi3cw@mail.gmail.com>
Message-ID: <CALCETrWHW4wHG+Z-mxsY-kvjSi+S6gRUQ+LHd9syPcm5bhi3cw@mail.gmail.com>
Subject: Re: [PATCH 1/9] kernel: add a PF_FORCE_COMPAT flag
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     Matthew Wilcox <willy@infradead.org>,
        Christoph Hellwig <hch@lst.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jens Axboe <axboe@kernel.dk>, Arnd Bergmann <arnd@arndb.de>,
        David Howells <dhowells@redhat.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        linux-block <linux-block@vger.kernel.org>,
        Linux SCSI List <linux-scsi@vger.kernel.org>,
        Linux FS Devel <linux-fsdevel@vger.kernel.org>,
        linux-aio <linux-aio@kvack.org>, io-uring@vger.kernel.org,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        Network Development <netdev@vger.kernel.org>,
        keyrings@vger.kernel.org,
        LSM List <linux-security-module@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Sep 20, 2020 at 11:07 AM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Sun, Sep 20, 2020 at 04:15:10PM +0100, Matthew Wilcox wrote:
> > On Fri, Sep 18, 2020 at 02:45:25PM +0200, Christoph Hellwig wrote:
> > > Add a flag to force processing a syscall as a compat syscall.  This is
> > > required so that in_compat_syscall() works for I/O submitted by io_uring
> > > helper threads on behalf of compat syscalls.
> >
> > Al doesn't like this much, but my suggestion is to introduce two new
> > opcodes -- IORING_OP_READV32 and IORING_OP_WRITEV32.  The compat code
> > can translate IORING_OP_READV to IORING_OP_READV32 and then the core
> > code can know what that user pointer is pointing to.
>
> Let's separate two issues:
>         1) compat syscalls want 32bit iovecs.  Nothing to do with the
> drivers, dealt with just fine.
>         2) a few drivers are really fucked in head.  They use different
> *DATA* layouts for reads/writes, depending upon the calling process.
> IOW, if you fork/exec a 32bit binary and your stdin is one of those,
> reads from stdin in parent and child will yield different data layouts.
> On the same struct file.
>         That's what Christoph worries about (/dev/sg he'd mentioned is
> one of those).
>
>         IMO we should simply have that dozen or so of pathological files
> marked with FMODE_SHITTY_ABI; it's not about how they'd been opened -
> it describes the userland ABI provided by those.  And it's cast in stone.
>

I wonder if this is really quite cast in stone.  We could also have
FMODE_SHITTY_COMPAT and set that when a file like this is *opened* in
compat mode.  Then that particular struct file would be read and
written using the compat data format.  The change would be
user-visible, but the user that would see it would be very strange
indeed.

I don't have a strong opinion as to whether that is better or worse
than denying io_uring access to these things, but at least it moves
the special case out of io_uring.

--Andy
