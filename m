Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B5962E1071
	for <lists+linux-mips@lfdr.de>; Wed, 23 Dec 2020 00:01:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726384AbgLVW6t (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Dec 2020 17:58:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726329AbgLVW6t (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 22 Dec 2020 17:58:49 -0500
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [IPv6:2002:c35c:fd02::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A6DFC0613D3;
        Tue, 22 Dec 2020 14:58:09 -0800 (PST)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1krqbM-003Lzr-T3; Tue, 22 Dec 2020 22:57:57 +0000
Date:   Tue, 22 Dec 2020 22:57:56 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     "Maciej W. Rozycki" <macro@linux-mips.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        the arch/x86 maintainers <x86@kernel.org>,
        linux-mips@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCHSET] saner elf compat
Message-ID: <20201222225756.GV3579531@ZenIV.linux.org.uk>
References: <20201203214529.GB3579531@ZenIV.linux.org.uk>
 <CAHk-=wiRNT+-ahz2KRUE7buYJMZ84bp=h_vGLrAaOKW3n_xyXQ@mail.gmail.com>
 <20201203230336.GC3579531@ZenIV.linux.org.uk>
 <alpine.LFD.2.21.2012071741280.2104409@eddie.linux-mips.org>
 <20201216030154.GL3579531@ZenIV.linux.org.uk>
 <alpine.LFD.2.21.2012160924010.2104409@eddie.linux-mips.org>
 <20201222200431.GT3579531@ZenIV.linux.org.uk>
 <20201222213835.GU3579531@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201222213835.GU3579531@ZenIV.linux.org.uk>
Sender: Al Viro <viro@ftp.linux.org.uk>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Dec 22, 2020 at 09:38:35PM +0000, Al Viro wrote:
> On Tue, Dec 22, 2020 at 08:04:31PM +0000, Al Viro wrote:
> 
> > FWIW, on debian/mips64el (both stretch and buster) the test fails with the
> > distro kernels (4.9- and 4.19-based) as well as with 5.10-rc1 and
> > 5.10-rc1+that series, all in the same way:
> > [Current thread is 1 (LWP 4154)]
> > (gdb) p/x foo
> > Cannot find thread-local storage for LWP 4154, executable file <pathname>
> > Cannot find thread-local variables on this target
> > 
> > buster has libc6-2.28, so that should be fine for the test in question
> > (libthread_db definitely recent enough).  That was n32 gdb; considering
> > how much time it had taken to build that sucker I hadn't tried o32
> > yet.
> > 
> > Note that it's not just with native coredumps - gcore-produced ones give
> > the same result.  That was gdb from binutils-gdb.git; I'm not familiar
> > with gdb guts to start debugging it, so if you have any suggestions
> > in that direction that do not include a full rebuild...  In any case,
> > I won't get around to that until the next week.
> > 
> > Incidentally, build time is bloody awful - 3 days, with qemu-3.1 on
> > 3.5GHz amd64 host, all spent pretty much entirely in userland (both
> > from guest and host POV).  g++-8 is atrociously slow...
> > 
> > That said, I don't see what in that series could possibly mess the
> > things up for tls, while leaving the registers working; the only
> > thing that realistically might've been fucked up is prstatus layout
> > (and possibly size), and that would've screwed the registers as
> > well.
> 
> ... and it smells like the damn thing needs n32 debug info from libthread_db.so
> and/or libpthread.so.  Which is not packaged by debian libc6 mips64el build.
> Sorry, any debugging of that crap is going to happen in January ;-/

Cute...  Completely unrelated, but there's a fun bug in mainline o32
coredumps - say readelf -a core and watch NT_FILE section dump.
Compare that for dumps done on mips32 and mips64 hosts (for the same
o32 binaries, obviously).  Or to gcore(1) results on such processes,
for that matter.

What happens there is that 2aa362c49c31 ("coredump: extend core dump note
section to contain file names of mapped files") that has introduced that
section has added
#define user_long_t            compat_long_t
to fs/compat_binfmt_elf.c, but not to arch/mips/kernel/binfmt_elfo32.c,
resulting in default (long) being used by fill_files_note().
