Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4479B2D1815
	for <lists+linux-mips@lfdr.de>; Mon,  7 Dec 2020 19:02:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726069AbgLGSCT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 7 Dec 2020 13:02:19 -0500
Received: from [157.25.102.26] ([157.25.102.26]:35966 "EHLO orcam.me.uk"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725917AbgLGSCT (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 7 Dec 2020 13:02:19 -0500
Received: from bugs.linux-mips.org (eddie.linux-mips.org [IPv6:2a01:4f8:201:92aa::3])
        by orcam.me.uk (Postfix) with ESMTPS id 2DAD52BE0EC;
        Mon,  7 Dec 2020 18:01:46 +0000 (GMT)
Date:   Mon, 7 Dec 2020 18:01:43 +0000 (GMT)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Al Viro <viro@zeniv.linux.org.uk>
cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        the arch/x86 maintainers <x86@kernel.org>,
        linux-mips@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCHSET] saner elf compat
In-Reply-To: <20201203230336.GC3579531@ZenIV.linux.org.uk>
Message-ID: <alpine.LFD.2.21.2012071741280.2104409@eddie.linux-mips.org>
References: <20201203214529.GB3579531@ZenIV.linux.org.uk> <CAHk-=wiRNT+-ahz2KRUE7buYJMZ84bp=h_vGLrAaOKW3n_xyXQ@mail.gmail.com> <20201203230336.GC3579531@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 3 Dec 2020, Al Viro wrote:

> > Linux-mips was cc'd, but I'm adding Thomas B to the cc here explicitly
> > just so that he has a heads-up on this thing and can go and look at
> > the mailing list in case it goes to a separate mailbox for him..
> 
> I would certainly appreciate review and testing - this branch sat
> around in the "should post it someday" state since June (it was
> one of the followups grown from regset work back then), and I'm
> _not_ going to ask pulling it without an explicit OK from mips
> folks.

 It may be worth pushing through GDB's gdb.threads/tls-core.exp test case, 
making sure no UNSUPPORTED results have been produced due to resource 
limits preventing a core from being dumped (and no FAILs, of course), with 
o32/n32 native GDB.  This should guarantee our output is still as expected 
by an interpreter.  Sadly I'm currently not set up for such testing though 
eventually I mean to.

  Maciej
