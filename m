Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26A872DB985
	for <lists+linux-mips@lfdr.de>; Wed, 16 Dec 2020 04:02:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725776AbgLPDCk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 15 Dec 2020 22:02:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbgLPDCk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 15 Dec 2020 22:02:40 -0500
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [IPv6:2002:c35c:fd02::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D22FDC0613D6;
        Tue, 15 Dec 2020 19:01:59 -0800 (PST)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kpN4c-001ZGd-E4; Wed, 16 Dec 2020 03:01:54 +0000
Date:   Wed, 16 Dec 2020 03:01:54 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     "Maciej W. Rozycki" <macro@linux-mips.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        the arch/x86 maintainers <x86@kernel.org>,
        linux-mips@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCHSET] saner elf compat
Message-ID: <20201216030154.GL3579531@ZenIV.linux.org.uk>
References: <20201203214529.GB3579531@ZenIV.linux.org.uk>
 <CAHk-=wiRNT+-ahz2KRUE7buYJMZ84bp=h_vGLrAaOKW3n_xyXQ@mail.gmail.com>
 <20201203230336.GC3579531@ZenIV.linux.org.uk>
 <alpine.LFD.2.21.2012071741280.2104409@eddie.linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.21.2012071741280.2104409@eddie.linux-mips.org>
Sender: Al Viro <viro@ftp.linux.org.uk>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Dec 07, 2020 at 06:01:43PM +0000, Maciej W. Rozycki wrote:
> On Thu, 3 Dec 2020, Al Viro wrote:
> 
> > > Linux-mips was cc'd, but I'm adding Thomas B to the cc here explicitly
> > > just so that he has a heads-up on this thing and can go and look at
> > > the mailing list in case it goes to a separate mailbox for him..
> > 
> > I would certainly appreciate review and testing - this branch sat
> > around in the "should post it someday" state since June (it was
> > one of the followups grown from regset work back then), and I'm
> > _not_ going to ask pulling it without an explicit OK from mips
> > folks.
> 
>  It may be worth pushing through GDB's gdb.threads/tls-core.exp test case, 
> making sure no UNSUPPORTED results have been produced due to resource 
> limits preventing a core from being dumped (and no FAILs, of course), with 
> o32/n32 native GDB.  This should guarantee our output is still as expected 
> by an interpreter.  Sadly I'm currently not set up for such testing though 
> eventually I mean to.

Umm...  What triple does one use for n32 gdb?
