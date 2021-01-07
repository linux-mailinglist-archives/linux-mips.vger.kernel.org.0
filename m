Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40C142ED44F
	for <lists+linux-mips@lfdr.de>; Thu,  7 Jan 2021 17:29:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728589AbhAGQ3q (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 Jan 2021 11:29:46 -0500
Received: from elvis.franken.de ([193.175.24.41]:34726 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726441AbhAGQ3q (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 7 Jan 2021 11:29:46 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kxY9o-0000Mi-03; Thu, 07 Jan 2021 17:29:04 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 87160C080E; Thu,  7 Jan 2021 17:27:18 +0100 (CET)
Date:   Thu, 7 Jan 2021 17:27:18 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
Subject: Re: [PATCH] MIPS: c-r4k: Fix section mismatch for loongson2_sc_init
Message-ID: <20210107162718.GD11882@alpha.franken.de>
References: <20210105203456.98148-1-natechancellor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210105203456.98148-1-natechancellor@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jan 05, 2021 at 01:34:56PM -0700, Nathan Chancellor wrote:
> When building with clang, the following section mismatch warning occurs:
> 
> WARNING: modpost: vmlinux.o(.text+0x24490): Section mismatch in
> reference from the function r4k_cache_init() to the function
> .init.text:loongson2_sc_init()
> 
> This should have been fixed with commit ad4fddef5f23 ("mips: fix Section
> mismatch in reference") but it was missed. Remove the improper __init
> annotation like that commit did.
> 
> Fixes: 078a55fc824c ("MIPS: Delete __cpuinit/__CPUINIT usage from MIPS code")
> Link: https://github.com/ClangBuiltLinux/linux/issues/787
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>  arch/mips/mm/c-r4k.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
