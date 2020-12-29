Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 459F82E719D
	for <lists+linux-mips@lfdr.de>; Tue, 29 Dec 2020 16:14:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726670AbgL2PKY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 29 Dec 2020 10:10:24 -0500
Received: from elvis.franken.de ([193.175.24.41]:45052 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726281AbgL2PKY (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 29 Dec 2020 10:10:24 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kuGd4-0006mx-01; Tue, 29 Dec 2020 16:09:42 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 0C7C4C07BE; Tue, 29 Dec 2020 16:09:25 +0100 (CET)
Date:   Tue, 29 Dec 2020 16:09:25 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     "Maciej W. Rozycki" <macro@linux-mips.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        the arch/x86 maintainers <x86@kernel.org>,
        linux-mips@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
        Denys Vlasenko <dvlasenk@redhat.com>
Subject: Re: [RFC][PATCH] NT_FILE/NT_SIGINFO breakage on mips compat coredumps
Message-ID: <20201229150924.GB7832@alpha.franken.de>
References: <20201203214529.GB3579531@ZenIV.linux.org.uk>
 <CAHk-=wiRNT+-ahz2KRUE7buYJMZ84bp=h_vGLrAaOKW3n_xyXQ@mail.gmail.com>
 <20201203230336.GC3579531@ZenIV.linux.org.uk>
 <alpine.LFD.2.21.2012071741280.2104409@eddie.linux-mips.org>
 <20201216030154.GL3579531@ZenIV.linux.org.uk>
 <alpine.LFD.2.21.2012160924010.2104409@eddie.linux-mips.org>
 <20201223070320.GW3579531@ZenIV.linux.org.uk>
 <20201223071213.GX3579531@ZenIV.linux.org.uk>
 <20201224194438.GY3579531@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201224194438.GY3579531@ZenIV.linux.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Dec 24, 2020 at 07:44:38PM +0000, Al Viro wrote:
> [mips] fix malformed NT_FILE and NT_SIGINFO in 32bit coredumps
> 
> 	Patches that introduced NT_FILE and NT_SIGINFO notes back in 2012
> had taken care of native (fs/binfmt_elf.c) and compat (fs/compat_binfmt_elf.c)
> coredumps; unfortunately, compat on mips (which does not go through the
> usual compat_binfmt_elf.c) had not been noticed.
> 
> 	As the result, both N32 and O32 coredumps on 64bit mips kernels
> have those sections malformed enough to confuse the living hell out of
> all gdb and readelf versions (up to and including the tip of binutils-gdb.git).
> 
> 	Longer term solution is to make both O32 and N32 compat use the
> regular compat_binfmt_elf.c, but that's too much for backports.  The minimal
> solution is to do in arch/mips/kernel/binfmt_elf[on]32.c the same thing
> those patches have done in fs/compat_binfmt_elf.c
> 
> Cc: stable@kernel.org # v3.7+
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
> ---
> diff --git a/arch/mips/kernel/binfmt_elfn32.c b/arch/mips/kernel/binfmt_elfn32.c
> index 6ee3f7218c67..c4441416e96b 100644
> --- a/arch/mips/kernel/binfmt_elfn32.c
> +++ b/arch/mips/kernel/binfmt_elfn32.c
> @@ -103,4 +103,11 @@ jiffies_to_old_timeval32(unsigned long jiffies, struct old_timeval32 *value)
>  #undef ns_to_kernel_old_timeval
>  #define ns_to_kernel_old_timeval ns_to_old_timeval32
>  
> +/*
> + * Some data types as stored in coredump.
> + */
> +#define user_long_t             compat_long_t
> +#define user_siginfo_t          compat_siginfo_t
> +#define copy_siginfo_to_external        copy_siginfo_to_external32
> +
>  #include "../../../fs/binfmt_elf.c"
> diff --git a/arch/mips/kernel/binfmt_elfo32.c b/arch/mips/kernel/binfmt_elfo32.c
> index 6dd103d3cebb..7b2a23f48c1a 100644
> --- a/arch/mips/kernel/binfmt_elfo32.c
> +++ b/arch/mips/kernel/binfmt_elfo32.c
> @@ -106,4 +106,11 @@ jiffies_to_old_timeval32(unsigned long jiffies, struct old_timeval32 *value)
>  #undef ns_to_kernel_old_timeval
>  #define ns_to_kernel_old_timeval ns_to_old_timeval32
>  
> +/*
> + * Some data types as stored in coredump.
> + */
> +#define user_long_t             compat_long_t
> +#define user_siginfo_t          compat_siginfo_t
> +#define copy_siginfo_to_external        copy_siginfo_to_external32
> +
>  #include "../../../fs/binfmt_elf.c"

LGTM, I've applied it to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
