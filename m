Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 752043691EE
	for <lists+linux-mips@lfdr.de>; Fri, 23 Apr 2021 14:22:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231312AbhDWMXL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 23 Apr 2021 08:23:11 -0400
Received: from elvis.franken.de ([193.175.24.41]:38486 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229479AbhDWMXK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 23 Apr 2021 08:23:10 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lZupM-00019R-03; Fri, 23 Apr 2021 14:22:32 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id D1468C0B3B; Fri, 23 Apr 2021 13:51:40 +0200 (CEST)
Date:   Fri, 23 Apr 2021 13:51:40 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Romain Naour <romain.naour@gmail.com>
Subject: Re: [PATCH v4] mips: Do not include hi and lo in clobber list for R6
Message-ID: <20210423115140.GD8582@alpha.franken.de>
References: <20210420211210.702980-1-sudipm.mukherjee@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210420211210.702980-1-sudipm.mukherjee@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Apr 20, 2021 at 10:12:10PM +0100, Sudip Mukherjee wrote:
> From: Romain Naour <romain.naour@gmail.com>
> 
> >From [1]
> "GCC 10 (PR 91233) won't silently allow registers that are not
> architecturally available to be present in the clobber list anymore,
> resulting in build failure for mips*r6 targets in form of:
> ...
> .../sysdep.h:146:2: error: the register ‘lo’ cannot be clobbered in ‘asm’ for the current target
>   146 |  __asm__ volatile (      \
>       |  ^~~~~~~
> 
> This is because base R6 ISA doesn't define hi and lo registers w/o DSP
> extension. This patch provides the alternative clobber list for r6 targets
> that won't include those registers."
> 
> Since kernel 5.4 and mips support for generic vDSO [2], the kernel fail to
> build for mips r6 cpus with gcc 10 for the same reason as glibc.
> 
> [1] https://sourceware.org/git/?p=glibc.git;a=commit;h=020b2a97bb15f807c0482f0faee2184ed05bcad8
> [2] '24640f233b46 ("mips: Add support for generic vDSO")'
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> ---
> 
> v4: [sudip] added macro VDSO_SYSCALL_CLOBBERS and fix checkpatch errors with commit message.
> v3 Avoid duplicate code (Maciej W. Rozycki)
> v2 use MIPS_ISA_REV instead of __mips_isa_rev (Alexander Lobakin)
> 
> I have reused the original patch by Romain and have retained his s-o-b
> and author name as he is the original author of this patch. I have just
> added the macro. Build tested with gcc-10.3.1 and gcc-9.3.0.
> 
>  arch/mips/include/asm/vdso/gettimeofday.h | 26 ++++++++++++++++++-----
>  1 file changed, 21 insertions(+), 5 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
