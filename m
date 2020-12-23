Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2270E2E1935
	for <lists+linux-mips@lfdr.de>; Wed, 23 Dec 2020 08:05:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727147AbgLWHEI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 23 Dec 2020 02:04:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727246AbgLWHEH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 23 Dec 2020 02:04:07 -0500
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [IPv6:2002:c35c:fd02::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 589B5C0613D3;
        Tue, 22 Dec 2020 23:03:27 -0800 (PST)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kryB6-003SN9-UT; Wed, 23 Dec 2020 07:03:21 +0000
Date:   Wed, 23 Dec 2020 07:03:20 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     "Maciej W. Rozycki" <macro@linux-mips.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        the arch/x86 maintainers <x86@kernel.org>,
        linux-mips@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
        Denys Vlasenko <dvlasenk@redhat.com>
Subject: Re: [PATCHSET] saner elf compat
Message-ID: <20201223070320.GW3579531@ZenIV.linux.org.uk>
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

[Denys Vlasenko cc'd]

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

One issue is that testsuite doesn't care about $CC, $CFLAGS or anything
of that sort.  What I'd done was
cat >~/bin/cc-n32 <<'EOF'
#!/bin/sh
exec /usr/bin/gcc -mabi=n32 "$@"
EOF
chmod +x ~/bin/cc-n32
and add CC_FOR_TARGET="/home/al/bin/cc-n32" in RUNTESTFLAGS.

With that it works.  Moreover, it fixes a test failure on mainline.
Mainline kernel (5.10, same behaviour as debian/buster mips64el one):
Test run by al on Tue Dec 22 21:23:09 2020
Native configuration is mips64el-unknown-linux-gnuabin32

                === gdb tests ===

Schedule of variations:
    unix

Running target unix
Using /usr/share/dejagnu/baseboards/unix.exp as board description file for target.
Using /usr/share/dejagnu/config/unix.exp as generic interface file for target.
Using /home/al/binutils-gdb/gdb/testsuite/config/unix.exp as tool-and-target-specific interface file.
Running /home/al/binutils-gdb/gdb/testsuite/gdb.threads/tls-core.exp ...
FAIL: gdb.threads/tls-core.exp: native: print thread-local storage variable
                === gdb Summary ===

# of expected passes            5
# of unexpected failures        1

vfs.git #work.elf-compat:
Test run by al on Tue Dec 22 21:31:14 2020
Native configuration is mips64el-unknown-linux-gnuabin32

                === gdb tests ===

Schedule of variations:
    unix

Running target unix
Using /usr/share/dejagnu/baseboards/unix.exp as board description file for target.
Using /usr/share/dejagnu/config/unix.exp as generic interface file for target.
Using /home/al/binutils-gdb/gdb/testsuite/config/unix.exp as tool-and-target-specific interface file.
Running /home/al/binutils-gdb/gdb/testsuite/gdb.threads/tls-core.exp ...

                === gdb Summary ===

# of expected passes            6


Which is bloody embarrassing, since I'd completely missed the
behaviour change - this series was supposed to be an equivalent
transformation.

Anyway, the minimal patch fixing that failure is this one-liner and
unlike the elf-compat series it's trivial to backport:

[mips] fix n32 coredump breakage

Back in 2012, 49ae4d4b113b ("coredump: add a new elf note with siginfo
of the signal") has introduced a new ELF coredump note - NT_FILE.  It contains
a mix of strings and addresses, and addresses are 32bit for 32bit targets
and 64bit for 64bit ones.  Eventually gdb has come to use it.

Biarch targets had been taken care of from the very beginning - the
same commit has added a macro (user_long_t) with default being long
and fs/compat_binfmt_elf.c overriding it to compat_long_t.

Unfortunately, Denis had missed the mips weirdness.  As the result,
on mips64 both o32 and n32 ended up using 64-bit layout.  readelf(1)
is not happy.  More importantly, neither is gdb(1); as the matter
of fact, gdb.thread/tls-core.exp kept complaining.  Note that gcore(1)
is using 32bit layout for n32 case - it's only the kernel n32 coredumps
that get broken NT_FILE note.

NOTE: similar patch is almost certainly needed for o32; I have only
tested it with n32 gdb, though.

Fixes: 49ae4d4b113b ("coredump: add a new elf note with siginfo of the signal")
Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
diff --git a/arch/mips/kernel/binfmt_elfn32.c b/arch/mips/kernel/binfmt_elfn32.c
index 6ee3f7218c67..c073136968e8 100644
--- a/arch/mips/kernel/binfmt_elfn32.c
+++ b/arch/mips/kernel/binfmt_elfn32.c
@@ -103,4 +103,6 @@ jiffies_to_old_timeval32(unsigned long jiffies, struct old_timeval32 *value)
 #undef ns_to_kernel_old_timeval
 #define ns_to_kernel_old_timeval ns_to_old_timeval32
 
+#define user_long_t compat_long_t
+
 #include "../../../fs/binfmt_elf.c"
