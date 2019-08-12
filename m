Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 138AA896BC
	for <lists+linux-mips@lfdr.de>; Mon, 12 Aug 2019 07:25:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725852AbfHLFZO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Aug 2019 01:25:14 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:32965 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbfHLFZO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 12 Aug 2019 01:25:14 -0400
Received: by mail-wm1-f68.google.com with SMTP id p77so10081075wme.0;
        Sun, 11 Aug 2019 22:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Zrtq/OcTTH2eTqgcPRB8HJQQ2tKzQ93zxFStLVLHmTY=;
        b=bsytUiVNjuHfD5451Er/N7M+xKh8KR2IcZNAGYyPGJz8AtbPvL3Nz2rw6SJe6ZiXZ6
         02alEgiz+lIk/zsGqgoKFoFZ7zAflyiSqoKUzRlPuCOpnnOPH0ftNoUoab3oVv9jDyqS
         O8kko4MJad/MEqV75UvKTcPeH5QOQJRUiA4lCQxCZH+f24f8YH5tfW9CK+sEPDL7WI4G
         g9BYc1vupND+NncvDXBGbSiKDdlpB3CGM2TWL+YOWcLv7C3btbkNkNskSMsOq1SzgfmO
         1ZBXFN4VDqkA7bDfPl/G3TcK6NH7N5S7RVqiJ45gpyJv5DqocL1ng77PcrvQVKAmtT/d
         hkPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Zrtq/OcTTH2eTqgcPRB8HJQQ2tKzQ93zxFStLVLHmTY=;
        b=C6XqpTn9PxOCjdW7R2J28oJ+74hbuhVU2hwT2Z8j3PZVF6KajgMXoaU0nhlz5mBHMD
         FhmW4xhOh9kEiAo8GlrlwR6pNJm+jo70jDGdnh37xtXIun6tBb7F3hkWhb5tt1vyauGe
         oRr/hHGKAleLR1pDdOEOC5T242wWD0iNTOMa8n48AfpVmzlCw+PEd9ABh3a5F+qzTRZ6
         thehgqk/FFx3rbsBQUAM/noK6W3eo4WzdGDfsX3VHlpq3DzYDxNObYG4IZYxu82iAgKm
         iMVml0RwysXnJQ35unppDkWdtD8h6Ib/HuSl2gVd7PNbEO+YQtKZLvDG7zO+r4+6wM75
         Kp2g==
X-Gm-Message-State: APjAAAV19aN9FFcyr3YFuzkm8/mn4Ig2QtAqKIRebqzJWFaG+EzpLfxp
        eTF7/3/FdfDulhpjE8usKYo=
X-Google-Smtp-Source: APXvYqxPuQLt4ofFq+HJRhd39c5bbJiwk9jUy3hBNvLdMEmf8iWOlSB0NzxdbbkEkZciV2+wP9+YEw==
X-Received: by 2002:a7b:cd09:: with SMTP id f9mr24341011wmj.64.1565587512105;
        Sun, 11 Aug 2019 22:25:12 -0700 (PDT)
Received: from archlinux-threadripper ([2a01:4f8:222:2f1b::2])
        by smtp.gmail.com with ESMTPSA id 74sm3588349wma.15.2019.08.11.22.25.11
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 11 Aug 2019 22:25:11 -0700 (PDT)
Date:   Sun, 11 Aug 2019 22:25:10 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com, Werner Koch <wk@gnupg.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH 4/5] lib/mpi: Fix for building for MIPS64 with Clang
Message-ID: <20190812052510.GB47342@archlinux-threadripper>
References: <20190812033120.43013-1-natechancellor@gmail.com>
 <20190812033120.43013-5-natechancellor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190812033120.43013-5-natechancellor@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Aug 11, 2019 at 08:31:19PM -0700, Nathan Chancellor wrote:
> From: Werner Koch <wk@gnupg.org>
> 
> * mpi/longlong.h [MIPS64][__clang__]: Use the C version like we
> already do for 32 bit MIPS
> 
> clang errors:
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
> Fixes: 5ce3e312ec5c ("crypto: GnuPG based MPI lib - header files (part 2)")
> Link: https://github.com/ClangBuiltLinux/linux/issues/605
> Link: https://github.com/gpg/libgcrypt/commit/e7ae0ae243c8978a67c802169183187d88557be8
> Signed-off-by: Werner Koch <wk@gnupg.org>
> [nc: Added build error and tags to commit message
>      Modified subject line
>      Removed GnuPG-bug-id
>      Removed space between defined and (__clang__)]
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>  lib/mpi/longlong.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/mpi/longlong.h b/lib/mpi/longlong.h
> index 8a1507fc94dd..5636e6a09f7a 100644
> --- a/lib/mpi/longlong.h
> +++ b/lib/mpi/longlong.h
> @@ -688,7 +688,8 @@ do {									\
>  		 : "d" ((UDItype)(u)),					\
>  		   "d" ((UDItype)(v)));					\
>  } while (0)
> -#elif (__GNUC__ >= 5) || (__GNUC__ >= 4 && __GNUC_MINOR__ >= 4)
> +#elif defined(__clang__) || (__GNUC__ >= 5) || (__GNUC__ == 4 && \
> +						__GNUC_MINOR__ >= 4)
>  #define umul_ppmm(w1, w0, u, v) \
>  do {									\
>  	typedef unsigned int __ll_UTItype __attribute__((mode(TI)));	\
> -- 
> 2.23.0.rc2
> 

Hi Paul,

I noticed you didn't pick up this patch with the other ones you applied.
I just wanted to make sure it wasn't because it was sent to the wrong
person. This set of files doesn't appear to have an owner in
MAINTAINERS, I guess based on git history either Andrew or Hubert (on
CC) pick up patches for this set of files? If I need to, I can resend it
to the proper people.

Cheers,
Nathan
