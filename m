Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF1A52CE247
	for <lists+linux-mips@lfdr.de>; Fri,  4 Dec 2020 00:04:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726924AbgLCXEX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 3 Dec 2020 18:04:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726897AbgLCXEW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 3 Dec 2020 18:04:22 -0500
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [IPv6:2002:c35c:fd02::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74E52C061A4F;
        Thu,  3 Dec 2020 15:03:42 -0800 (PST)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kkxdQ-00GKSn-UB; Thu, 03 Dec 2020 23:03:37 +0000
Date:   Thu, 3 Dec 2020 23:03:36 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        the arch/x86 maintainers <x86@kernel.org>,
        linux-mips@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCHSET] saner elf compat
Message-ID: <20201203230336.GC3579531@ZenIV.linux.org.uk>
References: <20201203214529.GB3579531@ZenIV.linux.org.uk>
 <CAHk-=wiRNT+-ahz2KRUE7buYJMZ84bp=h_vGLrAaOKW3n_xyXQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wiRNT+-ahz2KRUE7buYJMZ84bp=h_vGLrAaOKW3n_xyXQ@mail.gmail.com>
Sender: Al Viro <viro@ftp.linux.org.uk>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Dec 03, 2020 at 02:09:04PM -0800, Linus Torvalds wrote:
> On Thu, Dec 3, 2020 at 1:46 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
> >
> >  The answer (for mainline) is that mips compat does *NOT* want
> > COMPAT_BINFMT_ELF.  Not a problem with that series, though, so I'd
> > retested it (seems to work, both for x86_64 and mips64, execs and
> > coredumps for all ABIs alike), with centralization of Kconfig logics
> > thrown in.
> 
> Well, the diffstat looks nice:
> 
> >  26 files changed, 127 insertions(+), 317 deletions(-)
> 
> and the patches didn't trigger anything for me, but how much did this
> get tested? Do you actually have both kinds of 32-bit elf mips
> binaries around and a machine to test on?

Yes (aptitude install gcc-multilib on debian mips64el/stretch sets the toolchain
and libraries just fine, and then it's just a matter of -mabi=n32 passed
to gcc).  "Machine" is qemu-system-mips64el -machine malta -m 1024 -cpu 5KEc
and the things appear to work; I hadn't tried that on the actual hardware.
I do have a Loongson-2 box, but it would take a while to dig it out and
get it up-to-date.

> Linux-mips was cc'd, but I'm adding Thomas B to the cc here explicitly
> just so that he has a heads-up on this thing and can go and look at
> the mailing list in case it goes to a separate mailbox for him..

I would certainly appreciate review and testing - this branch sat
around in the "should post it someday" state since June (it was
one of the followups grown from regset work back then), and I'm
_not_ going to ask pulling it without an explicit OK from mips
folks.
