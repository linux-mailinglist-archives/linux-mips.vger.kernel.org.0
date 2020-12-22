Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A99082E0F2B
	for <lists+linux-mips@lfdr.de>; Tue, 22 Dec 2020 21:06:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727376AbgLVUFU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Dec 2020 15:05:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726039AbgLVUFT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 22 Dec 2020 15:05:19 -0500
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [IPv6:2002:c35c:fd02::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37238C061793;
        Tue, 22 Dec 2020 12:04:39 -0800 (PST)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1krntX-003JZt-E3; Tue, 22 Dec 2020 20:04:31 +0000
Date:   Tue, 22 Dec 2020 20:04:31 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     "Maciej W. Rozycki" <macro@linux-mips.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        the arch/x86 maintainers <x86@kernel.org>,
        linux-mips@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCHSET] saner elf compat
Message-ID: <20201222200431.GT3579531@ZenIV.linux.org.uk>
References: <20201203214529.GB3579531@ZenIV.linux.org.uk>
 <CAHk-=wiRNT+-ahz2KRUE7buYJMZ84bp=h_vGLrAaOKW3n_xyXQ@mail.gmail.com>
 <20201203230336.GC3579531@ZenIV.linux.org.uk>
 <alpine.LFD.2.21.2012071741280.2104409@eddie.linux-mips.org>
 <20201216030154.GL3579531@ZenIV.linux.org.uk>
 <alpine.LFD.2.21.2012160924010.2104409@eddie.linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.21.2012160924010.2104409@eddie.linux-mips.org>
Sender: Al Viro <viro@ftp.linux.org.uk>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Dec 16, 2020 at 09:44:53AM +0000, Maciej W. Rozycki wrote:
> On Wed, 16 Dec 2020, Al Viro wrote:
> 
> > >  It may be worth pushing through GDB's gdb.threads/tls-core.exp test case, 
> > > making sure no UNSUPPORTED results have been produced due to resource 
> > > limits preventing a core from being dumped (and no FAILs, of course), with 
> > > o32/n32 native GDB.  This should guarantee our output is still as expected 
> > > by an interpreter.  Sadly I'm currently not set up for such testing though 
> > > eventually I mean to.
> > 
> > Umm...  What triple does one use for n32 gdb?
> 
>  I don't think there's a standardised one, just configure with CC/CXX set 
> for n32 compilation, e.g.:
> 
> $ /path/to/configure CC="gcc -mabi=n32" CXX="g++ -mabi=n32"
> 
> (and any other options set as usually).  This has to be with CC/CXX rather 
> than CFLAGS/CXXFLAGS so that it is guaranteed to be never overridden with 
> any logic that might do any fiddling with compilation options.  This will 
> set up the test suite accordingly.
> 
>  NB this may already be the compiler's default, depending on how it was 
> configured, i.e. if `--with-abi=n32' was used, in which case no extra 
> options will be required.  I don't know if any standard MIPS distribution 
> does it though; 64-bit MIPS/Debian might.  This will be reported with `gcc 
> --help -v', somewhere along the way.
> 
>  Let me know if there are issues with this approach.

FWIW, on debian/mips64el (both stretch and buster) the test fails with the
distro kernels (4.9- and 4.19-based) as well as with 5.10-rc1 and
5.10-rc1+that series, all in the same way:
[Current thread is 1 (LWP 4154)]
(gdb) p/x foo
Cannot find thread-local storage for LWP 4154, executable file <pathname>
Cannot find thread-local variables on this target

buster has libc6-2.28, so that should be fine for the test in question
(libthread_db definitely recent enough).  That was n32 gdb; considering
how much time it had taken to build that sucker I hadn't tried o32
yet.

Note that it's not just with native coredumps - gcore-produced ones give
the same result.  That was gdb from binutils-gdb.git; I'm not familiar
with gdb guts to start debugging it, so if you have any suggestions
in that direction that do not include a full rebuild...  In any case,
I won't get around to that until the next week.

Incidentally, build time is bloody awful - 3 days, with qemu-3.1 on
3.5GHz amd64 host, all spent pretty much entirely in userland (both
from guest and host POV).  g++-8 is atrociously slow...

That said, I don't see what in that series could possibly mess the
things up for tls, while leaving the registers working; the only
thing that realistically might've been fucked up is prstatus layout
(and possibly size), and that would've screwed the registers as
well.
