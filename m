Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F318798B03
	for <lists+linux-mips@lfdr.de>; Thu, 22 Aug 2019 07:59:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731485AbfHVFzt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 22 Aug 2019 01:55:49 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:58378 "EHLO fornost.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726857AbfHVFzs (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 22 Aug 2019 01:55:48 -0400
Received: from gondolin.me.apana.org.au ([192.168.0.6] helo=gondolin.hengli.com.au)
        by fornost.hmeau.com with esmtps (Exim 4.89 #2 (Debian))
        id 1i0g4T-0002wN-LB; Thu, 22 Aug 2019 15:55:41 +1000
Received: from herbert by gondolin.hengli.com.au with local (Exim 4.80)
        (envelope-from <herbert@gondor.apana.org.au>)
        id 1i0g4P-00011O-Qy; Thu, 22 Aug 2019 15:55:37 +1000
Date:   Thu, 22 Aug 2019 15:55:37 +1000
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH v2] lib/mpi: Eliminate unused umul_ppmm definitions for
 MIPS
Message-ID: <20190822055537.GC3860@gondor.apana.org.au>
References: <20190812193256.55103-1-natechancellor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190812193256.55103-1-natechancellor@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Aug 12, 2019 at 12:32:57PM -0700, Nathan Chancellor wrote:
> Clang errors out when building this macro:
> 
> lib/mpi/generic_mpih-mul1.c:37:24: error: invalid use of a cast in a
> inline asm context requiring an l-value: remove the cast or build with
> -fheinous-gnu-extensions
>                 umul_ppmm(prod_high, prod_low, s1_ptr[j], s2_limb);
>                 ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> lib/mpi/longlong.h:652:20: note: expanded from macro 'umul_ppmm'
>         : "=l" ((USItype)(w0)), \
>                 ~~~~~~~~~~^~~
> lib/mpi/generic_mpih-mul1.c:37:3: error: invalid output constraint '=h'
> in asm
>                 umul_ppmm(prod_high, prod_low, s1_ptr[j], s2_limb);
>                 ^
> lib/mpi/longlong.h:653:7: note: expanded from macro 'umul_ppmm'
>              "=h" ((USItype)(w1)) \
>              ^
> 2 errors generated.
> 
> The C version that is used for GCC 4.4 and up works well with clang;
> however, it is not currently being used because Clang masks itself
> as GCC 4.2.1 for compatibility reasons. As Nick points out, we require
> GCC 4.6 and newer in the kernel so we can eliminate all of the
> versioning checks and just use the C version of umul_ppmm for all
> supported compilers.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/605
> Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
> 
> This supersedes the following two patches:
> 
> https://lore.kernel.org/lkml/20190812033120.43013-4-natechancellor@gmail.com/
> 
> https://lore.kernel.org/lkml/20190812033120.43013-5-natechancellor@gmail.com/
> 
> I labelled this as a v2 so those don't get applied.
> 
>  lib/mpi/longlong.h | 36 +-----------------------------------
>  1 file changed, 1 insertion(+), 35 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
