Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 828D835E294
	for <lists+linux-mips@lfdr.de>; Tue, 13 Apr 2021 17:22:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231640AbhDMPWZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 13 Apr 2021 11:22:25 -0400
Received: from elvis.franken.de ([193.175.24.41]:48136 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231485AbhDMPWZ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 13 Apr 2021 11:22:25 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lWKrc-00025U-00; Tue, 13 Apr 2021 17:22:04 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id E2FBBC02F4; Tue, 13 Apr 2021 17:19:09 +0200 (CEST)
Date:   Tue, 13 Apr 2021 17:19:09 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     David Laight <David.Laight@ACULAB.COM>
Cc:     Jinyang He <hejinyang@loongson.cn>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MIPS: Fix strnlen_user access check
Message-ID: <20210413151909.GA13549@alpha.franken.de>
References: <1618139092-4018-1-git-send-email-hejinyang@loongson.cn>
 <cbe5e79b-ee6c-5c59-0051-28e4d1152666@loongson.cn>
 <20210412142730.GA23146@alpha.franken.de>
 <2fd31420-1f96-9165-23ea-fdccac1b522a@loongson.cn>
 <20210413111438.GA9472@alpha.franken.de>
 <069e524dbad2412f9e74fd234f40fff5@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <069e524dbad2412f9e74fd234f40fff5@AcuMS.aculab.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Apr 13, 2021 at 12:37:25PM +0000, David Laight wrote:
> From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > Sent: 13 April 2021 12:15
> ...
> > > The __access_ok() is noted with `Ensure that the range [addr, addr+size)
> > > is within the process's address space`. Does the range checked by
> > > __access_ok() on MIPS is [addr, addr+size]. So if we want to use
> > > access_ok(s, 1), should we modify __access_ok()? Or my misunderstanding?
> > 
> > you are right, I'm going to apply
> > 
> > https://patchwork.kernel.org/project/linux-mips/patch/20190209194718.1294-1-paul.burton@mips.com/
> > 
> > to fix that.
> 
> Isn't that still wrong?
> If an application does:
> 	write(fd, (void *)0xffff0000, 0);
> it should return 0, not -1 and EFAULT/SIGSEGV.

WRITE(2)                   Linux Programmer's Manual                  WRITE(2)
[...]
       If  count  is  zero  and  fd refers to a regular file, then write() may
       return a failure status if one of the errors below is detected.  If  no
       errors  are  detected,  or  error detection is not performed, 0 will be
       returned without causing any other effect.  If count  is  zero  and  fd
       refers  to a file other than a regular file, the results are not speci-
       fied.
[...]
       EFAULT buf is outside your accessible address space.

at least it's covered by the man page on my Linux system.

> There is also the question about why this makes any difference
> to the original problem of logging in via the graphical interface.

kernel/module.c:        mod->args = strndup_user(uargs, ~0UL >> 1);

and strndup_user does a strnlen_user.

> ISTM that it is very unlikely that the length passed to strnlen_user()
> is long enough to take potential buffer beyond the end of user
> address space.

see above.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
