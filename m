Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41FDC2E1948
	for <lists+linux-mips@lfdr.de>; Wed, 23 Dec 2020 08:14:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbgLWHM7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 23 Dec 2020 02:12:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726960AbgLWHM7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 23 Dec 2020 02:12:59 -0500
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [IPv6:2002:c35c:fd02::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB0E8C0613D3;
        Tue, 22 Dec 2020 23:12:18 -0800 (PST)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kryJh-003SSq-KZ; Wed, 23 Dec 2020 07:12:13 +0000
Date:   Wed, 23 Dec 2020 07:12:13 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     "Maciej W. Rozycki" <macro@linux-mips.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        the arch/x86 maintainers <x86@kernel.org>,
        linux-mips@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
        Denys Vlasenko <dvlasenk@redhat.com>
Subject: Re: [PATCHSET] saner elf compat
Message-ID: <20201223071213.GX3579531@ZenIV.linux.org.uk>
References: <20201203214529.GB3579531@ZenIV.linux.org.uk>
 <CAHk-=wiRNT+-ahz2KRUE7buYJMZ84bp=h_vGLrAaOKW3n_xyXQ@mail.gmail.com>
 <20201203230336.GC3579531@ZenIV.linux.org.uk>
 <alpine.LFD.2.21.2012071741280.2104409@eddie.linux-mips.org>
 <20201216030154.GL3579531@ZenIV.linux.org.uk>
 <alpine.LFD.2.21.2012160924010.2104409@eddie.linux-mips.org>
 <20201223070320.GW3579531@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201223070320.GW3579531@ZenIV.linux.org.uk>
Sender: Al Viro <viro@ftp.linux.org.uk>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Dec 23, 2020 at 07:03:20AM +0000, Al Viro wrote:

	Argh....  Wrong commit blamed - the parent of the correct one.
It's actually 2aa362c49c31 ("coredump: extend core dump note section to
contain file names of mapped files").  My apologies - fat-fingered
cut'n'paste...

	siginfo commit does suffer the same problem, but it becomes an issue
only for 32bit processes under mips64 big-endian kernel (there it yields
e.g. zero .__sigfault.si_addr in $_siginfo when using gdb with a coredump
of 32bit process, whatever the actual faulting address had been).  And
b-e mips64 is rather uncommon, so that's less of an issue.
