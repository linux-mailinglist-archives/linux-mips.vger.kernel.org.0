Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4DCD2DB4B0
	for <lists+linux-mips@lfdr.de>; Tue, 15 Dec 2020 20:55:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726022AbgLOTzV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 15 Dec 2020 14:55:21 -0500
Received: from elvis.franken.de ([193.175.24.41]:42806 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727833AbgLOTzP (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 15 Dec 2020 14:55:15 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kpGP4-0005zz-00; Tue, 15 Dec 2020 20:54:34 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 1A13EC03B6; Tue, 15 Dec 2020 20:54:14 +0100 (CET)
Date:   Tue, 15 Dec 2020 20:54:14 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        the arch/x86 maintainers <x86@kernel.org>,
        linux-mips@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCHSET] saner elf compat
Message-ID: <20201215195414.GA15551@alpha.franken.de>
References: <20201203214529.GB3579531@ZenIV.linux.org.uk>
 <CAHk-=wiRNT+-ahz2KRUE7buYJMZ84bp=h_vGLrAaOKW3n_xyXQ@mail.gmail.com>
 <20201203230336.GC3579531@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203230336.GC3579531@ZenIV.linux.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Dec 03, 2020 at 11:03:36PM +0000, Al Viro wrote:
> On Thu, Dec 03, 2020 at 02:09:04PM -0800, Linus Torvalds wrote:
> > On Thu, Dec 3, 2020 at 1:46 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
> > >
> > >  The answer (for mainline) is that mips compat does *NOT* want
> > > COMPAT_BINFMT_ELF.  Not a problem with that series, though, so I'd
> > > retested it (seems to work, both for x86_64 and mips64, execs and
> > > coredumps for all ABIs alike), with centralization of Kconfig logics
> > > thrown in.
> > 
> > Well, the diffstat looks nice:
> > 
> > >  26 files changed, 127 insertions(+), 317 deletions(-)
> > 
> > and the patches didn't trigger anything for me, but how much did this
> > get tested? Do you actually have both kinds of 32-bit elf mips
> > binaries around and a machine to test on?
> 
> Yes (aptitude install gcc-multilib on debian mips64el/stretch sets the toolchain
> and libraries just fine, and then it's just a matter of -mabi=n32 passed
> to gcc).  "Machine" is qemu-system-mips64el -machine malta -m 1024 -cpu 5KEc
> and the things appear to work; I hadn't tried that on the actual hardware.
> I do have a Loongson-2 box, but it would take a while to dig it out and
> get it up-to-date.
> 
> > Linux-mips was cc'd, but I'm adding Thomas B to the cc here explicitly
> > just so that he has a heads-up on this thing and can go and look at
> > the mailing list in case it goes to a separate mailbox for him..
> 
> I would certainly appreciate review and testing - this branch sat
> around in the "should post it someday" state since June (it was
> one of the followups grown from regset work back then), and I'm
> _not_ going to ask pulling it without an explicit OK from mips
> folks.

I've tested it on real hardware and so far everything looks good.

You can add my

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

for the MIPS part.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
