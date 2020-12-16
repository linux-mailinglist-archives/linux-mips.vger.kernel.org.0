Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAED32DBDEF
	for <lists+linux-mips@lfdr.de>; Wed, 16 Dec 2020 10:47:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725940AbgLPJrQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 16 Dec 2020 04:47:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725890AbgLPJrP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 16 Dec 2020 04:47:15 -0500
Received: from orcam.me.uk (unknown [IPv6:2001:4190:8020::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 70A4FC0613D6;
        Wed, 16 Dec 2020 01:46:35 -0800 (PST)
Received: from bugs.linux-mips.org (eddie.linux-mips.org [IPv6:2a01:4f8:201:92aa::3])
        by orcam.me.uk (Postfix) with ESMTPS id 8A9112BE0EC;
        Wed, 16 Dec 2020 09:46:33 +0000 (GMT)
Date:   Wed, 16 Dec 2020 09:44:53 +0000 (GMT)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Al Viro <viro@zeniv.linux.org.uk>
cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        the arch/x86 maintainers <x86@kernel.org>,
        linux-mips@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCHSET] saner elf compat
In-Reply-To: <20201216030154.GL3579531@ZenIV.linux.org.uk>
Message-ID: <alpine.LFD.2.21.2012160924010.2104409@eddie.linux-mips.org>
References: <20201203214529.GB3579531@ZenIV.linux.org.uk> <CAHk-=wiRNT+-ahz2KRUE7buYJMZ84bp=h_vGLrAaOKW3n_xyXQ@mail.gmail.com> <20201203230336.GC3579531@ZenIV.linux.org.uk> <alpine.LFD.2.21.2012071741280.2104409@eddie.linux-mips.org>
 <20201216030154.GL3579531@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 16 Dec 2020, Al Viro wrote:

> >  It may be worth pushing through GDB's gdb.threads/tls-core.exp test case, 
> > making sure no UNSUPPORTED results have been produced due to resource 
> > limits preventing a core from being dumped (and no FAILs, of course), with 
> > o32/n32 native GDB.  This should guarantee our output is still as expected 
> > by an interpreter.  Sadly I'm currently not set up for such testing though 
> > eventually I mean to.
> 
> Umm...  What triple does one use for n32 gdb?

 I don't think there's a standardised one, just configure with CC/CXX set 
for n32 compilation, e.g.:

$ /path/to/configure CC="gcc -mabi=n32" CXX="g++ -mabi=n32"

(and any other options set as usually).  This has to be with CC/CXX rather 
than CFLAGS/CXXFLAGS so that it is guaranteed to be never overridden with 
any logic that might do any fiddling with compilation options.  This will 
set up the test suite accordingly.

 NB this may already be the compiler's default, depending on how it was 
configured, i.e. if `--with-abi=n32' was used, in which case no extra 
options will be required.  I don't know if any standard MIPS distribution 
does it though; 64-bit MIPS/Debian might.  This will be reported with `gcc 
--help -v', somewhere along the way.

 Let me know if there are issues with this approach.

  Maciej

