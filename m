Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 787FE35EEF1
	for <lists+linux-mips@lfdr.de>; Wed, 14 Apr 2021 10:07:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348323AbhDNH7l (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 14 Apr 2021 03:59:41 -0400
Received: from elvis.franken.de ([193.175.24.41]:49467 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231868AbhDNH7k (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 14 Apr 2021 03:59:40 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lWaQe-0000mp-00; Wed, 14 Apr 2021 09:59:16 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id D2B0EC0311; Wed, 14 Apr 2021 09:59:00 +0200 (CEST)
Date:   Wed, 14 Apr 2021 09:59:00 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     David Laight <David.Laight@ACULAB.COM>
Cc:     Jinyang He <hejinyang@loongson.cn>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MIPS: Fix strnlen_user access check
Message-ID: <20210414075900.GA6073@alpha.franken.de>
References: <1618139092-4018-1-git-send-email-hejinyang@loongson.cn>
 <cbe5e79b-ee6c-5c59-0051-28e4d1152666@loongson.cn>
 <20210412142730.GA23146@alpha.franken.de>
 <2fd31420-1f96-9165-23ea-fdccac1b522a@loongson.cn>
 <20210413111438.GA9472@alpha.franken.de>
 <069e524dbad2412f9e74fd234f40fff5@AcuMS.aculab.com>
 <20210413151909.GA13549@alpha.franken.de>
 <c2d2980ede424038ac0e1e5184857407@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c2d2980ede424038ac0e1e5184857407@AcuMS.aculab.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Apr 13, 2021 at 04:01:13PM +0000, David Laight wrote:
> From: Thomas Bogendoerfer
> > Sent: 13 April 2021 16:19
> > 
> > On Tue, Apr 13, 2021 at 12:37:25PM +0000, David Laight wrote:
> > > From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > > > Sent: 13 April 2021 12:15
> > > ...
> > > > > The __access_ok() is noted with `Ensure that the range [addr, addr+size)
> > > > > is within the process's address space`. Does the range checked by
> > > > > __access_ok() on MIPS is [addr, addr+size]. So if we want to use
> > > > > access_ok(s, 1), should we modify __access_ok()? Or my misunderstanding?
> > > >
> > > > you are right, I'm going to apply
> > > >
> > > > https://patchwork.kernel.org/project/linux-mips/patch/20190209194718.1294-1-paul.burton@mips.com/
> > > >
> > > > to fix that.
> > >
> > > Isn't that still wrong?
> > > If an application does:
> > > 	write(fd, (void *)0xffff0000, 0);
> > > it should return 0, not -1 and EFAULT/SIGSEGV.
> > 
> > WRITE(2)                   Linux Programmer's Manual                  WRITE(2)
> > [...]
> >        If  count  is  zero  and  fd refers to a regular file, then write() may
> >        return a failure status if one of the errors below is detected.  If  no
> >        errors  are  detected,  or  error detection is not performed, 0 will be
> >        returned without causing any other effect.  If count  is  zero  and  fd
> >        refers  to a file other than a regular file, the results are not speci-
> >        fied.
> > [...]
> >        EFAULT buf is outside your accessible address space.
> > 
> > at least it's covered by the man page on my Linux system.
> 
> Something related definitely caused grief in the setsockopt() changes.
> 
> > > There is also the question about why this makes any difference
> > > to the original problem of logging in via the graphical interface.
> > 
> > kernel/module.c:        mod->args = strndup_user(uargs, ~0UL >> 1);
> > 
> > and strndup_user does a strnlen_user.
> 
> That call is just gross.
> Why did it work before the removal of set_fs() etc.

strnlen_user just did the equivalent of access_ok(s, 0) and I copy&pasted
the wrong access_ok() statement :-( 

> Or was there another change that affected strndup_user() ?

no, just the change in strnlen_user.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
