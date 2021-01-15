Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE82F2F7E86
	for <lists+linux-mips@lfdr.de>; Fri, 15 Jan 2021 15:48:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728974AbhAOOru (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 Jan 2021 09:47:50 -0500
Received: from elvis.franken.de ([193.175.24.41]:53927 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728559AbhAOOru (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 15 Jan 2021 09:47:50 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l0QNY-0006aU-01; Fri, 15 Jan 2021 15:47:08 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 1EE9FC057E; Fri, 15 Jan 2021 15:39:01 +0100 (CET)
Date:   Fri, 15 Jan 2021 15:39:01 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] MIPS: Compare __SYNC_loongson3_war against 0
Message-ID: <20210115143901.GB15166@alpha.franken.de>
References: <20210114173416.738455-1-natechancellor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210114173416.738455-1-natechancellor@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jan 14, 2021 at 10:34:16AM -0700, Nathan Chancellor wrote:
> When building with clang when CONFIG_CPU_LOONGSON3_WORKAROUNDS is
> enabled:
> 
>  In file included from lib/errseq.c:4:
>  In file included from ./include/linux/atomic.h:7:
>  ./arch/mips/include/asm/atomic.h:52:1: warning: converting the result of
>  '<<' to a boolean always evaluates to true
>  [-Wtautological-constant-compare]
>  ATOMIC_OPS(atomic64, s64)
>  ^
>  ./arch/mips/include/asm/atomic.h:40:9: note: expanded from macro
>  'ATOMIC_OPS'
>          return cmpxchg(&v->counter, o, n);
>                 ^
>  ./arch/mips/include/asm/cmpxchg.h:194:7: note: expanded from macro
>  'cmpxchg'
>          if (!__SYNC_loongson3_war)
>               ^
>  ./arch/mips/include/asm/sync.h:147:34: note: expanded from macro
>  '__SYNC_loongson3_war'
>  # define __SYNC_loongson3_war   (1 << 31)
>                                     ^
> 
> While it is not wrong that the result of this shift is always true in a
> boolean context, it is not a problem here. Regardless, the warning is
> really noisy so rather than making the shift a boolean implicitly, use
> it in an equality comparison so the shift is used as an integer value.
> 
> Fixes: 4d1dbfe6cbec ("MIPS: atomic: Emit Loongson3 sync workarounds within asm")
> Fixes: a91f2a1dba44 ("MIPS: cmpxchg: Omit redundant barriers for Loongson3")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>  arch/mips/include/asm/atomic.h  | 2 +-
>  arch/mips/include/asm/cmpxchg.h | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)

applied ti mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
