Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE98B2D9AED
	for <lists+linux-mips@lfdr.de>; Mon, 14 Dec 2020 16:28:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731528AbgLNP2H (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 14 Dec 2020 10:28:07 -0500
Received: from elvis.franken.de ([193.175.24.41]:40266 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406208AbgLNP2G (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 14 Dec 2020 10:28:06 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kopkv-0006Cf-02; Mon, 14 Dec 2020 16:27:21 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 60377C037B; Mon, 14 Dec 2020 16:24:47 +0100 (CET)
Date:   Mon, 14 Dec 2020 16:24:47 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Anders Roxell <anders.roxell@linaro.org>
Cc:     natechancellor@gmail.com, ndesaulniers@google.com,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
Subject: Re: [PATCH v2] mips: lib: uncached: fix non-standard usage of
 variable 'sp'
Message-ID: <20201214152447.GC9149@alpha.franken.de>
References: <20201211102437.3929348-1-anders.roxell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201211102437.3929348-1-anders.roxell@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Dec 11, 2020 at 11:24:37AM +0100, Anders Roxell wrote:
> When building mips tinyconfig with clang the following warning show up:
> 
> arch/mips/lib/uncached.c:45:6: warning: variable 'sp' is uninitialized when used here [-Wuninitialized]
>         if (sp >= (long)CKSEG0 && sp < (long)CKSEG2)
>             ^~
> arch/mips/lib/uncached.c:40:18: note: initialize the variable 'sp' to silence this warning
>         register long sp __asm__("$sp");
>                         ^
>                          = 0
> 1 warning generated.
> 
> Rework to make an explicit inline move, instead of the non-standard use
> of specifying registers for local variables. This is what's written
> from the gcc-10 manual [1] about specifying registers for local
> variables:
> 
> "6.47.5.2 Specifying Registers for Local Variables
> .................................................
> [...]
> 
> "The only supported use for this feature is to specify registers for
> input and output operands when calling Extended 'asm' (*note Extended
> Asm::).  [...]".
> 
> [1] https://docs.w3cub.com/gcc~10/local-register-variables
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> ---
>  arch/mips/lib/uncached.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
