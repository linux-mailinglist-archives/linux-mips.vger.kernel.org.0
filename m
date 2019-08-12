Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DC03896C3
	for <lists+linux-mips@lfdr.de>; Mon, 12 Aug 2019 07:26:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725852AbfHLF05 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Aug 2019 01:26:57 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53054 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbfHLF05 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 12 Aug 2019 01:26:57 -0400
Received: by mail-wm1-f66.google.com with SMTP id s3so10969898wms.2;
        Sun, 11 Aug 2019 22:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OQM0ZOIQ1BSyIC7OgvYQ9aFeaUJwMYXx4azwY8i6euk=;
        b=f9XpAxW4go7mJBxdcpfPN1nOzK1cu4DC2K+1MIJP2DlOPV87LUoRcpOZG4/NSTHAJv
         JH76et6MF2U7smJ+N/yq3X4rYtsHUsepKD/+BcMSMde64ZTg8lA7PMKhfF9WT3yCs14e
         ETbsAuXcbZmHsVg4xrqwCeyjzbqRij6/S0JXWo0WHfavFLSdTcqoe4ShqTlbeLBK1GyG
         2q4XHT9t/r8CeVpOMoBbKX87qEF3mkrK1A4Sy5BLTWkTo6f5ME6Mwq9GcqTOKP6Mc590
         tb07MnbIn7o17BLvsZu5RTGWAvbG2nHXY+bChKIJiR15ZghgM2ZR9/CkG5wjJQDWEuAb
         VKXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OQM0ZOIQ1BSyIC7OgvYQ9aFeaUJwMYXx4azwY8i6euk=;
        b=tLlG8y2sqLVkai02Ju/uYJFu01ENFOljko4Xg703a2FVw/CpMjeVxmL/SK5m6VJrau
         b39k43bnCfilECUM9wEQJ8KgJPpxN77+7pRqnJU5JebUao6SUnf0CLb/JvoLKjOr9Ot5
         E25iYJyMrlvbIB/KnFcTfHAapa1h1Hqq13CG5nNG71jP7jqzveST3ymdQ1U+aIhtqbhY
         lWkWob1ocKyl/Zgk+bw7gUHn4Yu5gMzJmd5Oy1pNIfCpXldsWxEWZDgng6iOWG5lnKLB
         XI8GLFzdWJdRk9YAIbPzml7bFpqjkgDV7r0U/y0aSMpdGT+JtaNDimjPVPJR5qvCvhVN
         7JHQ==
X-Gm-Message-State: APjAAAWHNEgtq0yoL5MYJ161E1b7PU83LezajD8RnanYCr1nb4tAgyJi
        wp/MhLuzetm68pRBCWAQGMw=
X-Google-Smtp-Source: APXvYqx5KnEAVxcKNz1wNG81JUVOQ4p9+2ZiwoQZxwRfZ1rv58SU9xvHhrekF/2V7/Dw5mgCBOYqrg==
X-Received: by 2002:a1c:6145:: with SMTP id v66mr24893650wmb.42.1565587615182;
        Sun, 11 Aug 2019 22:26:55 -0700 (PDT)
Received: from archlinux-threadripper ([2a01:4f8:222:2f1b::2])
        by smtp.gmail.com with ESMTPSA id 39sm11003737wrc.45.2019.08.11.22.26.54
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 11 Aug 2019 22:26:54 -0700 (PDT)
Date:   Sun, 11 Aug 2019 22:26:53 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Vladimir Serbinenko <phcoder@gmail.com>,
        Jussi Kivilinna <jussi.kivilinna@iki.fi>,
        Andrew Morton <akpm@linux-foundation.org>,
        Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH 3/5] lib/mpi: Fix for building for MIPS32 with Clang
Message-ID: <20190812052653.GA47439@archlinux-threadripper>
References: <20190812033120.43013-1-natechancellor@gmail.com>
 <20190812033120.43013-4-natechancellor@gmail.com>
 <20190812052355.GA47342@archlinux-threadripper>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190812052355.GA47342@archlinux-threadripper>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Aug 11, 2019 at 10:23:55PM -0700, Nathan Chancellor wrote:
> On Sun, Aug 11, 2019 at 08:31:18PM -0700, Nathan Chancellor wrote:
> > From: Vladimir Serbinenko <phcoder@gmail.com>
> > 
> > clang doesn't recognise =l / =h assembly operand specifiers but apparently
> > handles C version well.
> > 
> > lib/mpi/generic_mpih-mul1.c:37:24: error: invalid use of a cast in a
> > inline asm context requiring an l-value: remove the cast or build with
> > -fheinous-gnu-extensions
> >                 umul_ppmm(prod_high, prod_low, s1_ptr[j], s2_limb);
> >                 ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > lib/mpi/longlong.h:652:20: note: expanded from macro 'umul_ppmm'
> >         : "=l" ((USItype)(w0)), \
> >                 ~~~~~~~~~~^~~
> > lib/mpi/generic_mpih-mul1.c:37:3: error: invalid output constraint '=h'
> > in asm
> >                 umul_ppmm(prod_high, prod_low, s1_ptr[j], s2_limb);
> >                 ^
> > lib/mpi/longlong.h:653:7: note: expanded from macro 'umul_ppmm'
> >              "=h" ((USItype)(w1)) \
> >              ^
> > 2 errors generated.
> > 
> > Fixes: 5ce3e312ec5c ("crypto: GnuPG based MPI lib - header files (part 2)")
> > Link: https://github.com/ClangBuiltLinux/linux/issues/605
> > Link: https://github.com/gpg/libgcrypt/commit/1ecbd0bca31d462719a2a6590c1d03244e76ef89
> > Signed-off-by: Vladimir Serbinenko <phcoder@gmail.com>
> > [jk: add changelog, rebase on libgcrypt repository, reformat changed
> >  line so it does not go over 80 characters]
> > Signed-off-by: Jussi Kivilinna <jussi.kivilinna@iki.fi>
> > [nc: Added build error and tags to commit message
> >      Added Vladimir's signoff with his permission
> >      Adjusted Jussi's comment to wrap at 73 characters
> >      Modified commit subject to mirror MIPS64 commit
> >      Removed space between defined and (__clang__)]
> > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> > ---
> >  lib/mpi/longlong.h | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/lib/mpi/longlong.h b/lib/mpi/longlong.h
> > index 3bb6260d8f42..8a1507fc94dd 100644
> > --- a/lib/mpi/longlong.h
> > +++ b/lib/mpi/longlong.h
> > @@ -639,7 +639,8 @@ do { \
> >  	**************  MIPS  *****************
> >  	***************************************/
> >  #if defined(__mips__) && W_TYPE_SIZE == 32
> > -#if (__GNUC__ >= 5) || (__GNUC__ >= 4 && __GNUC_MINOR__ >= 4)
> > +#if defined(__clang__) || (__GNUC__ >= 5) || (__GNUC__ == 4 && \
> > +					      __GNUC_MINOR__ >= 4)
> >  #define umul_ppmm(w1, w0, u, v)			\
> >  do {						\
> >  	UDItype __ll = (UDItype)(u) * (v);	\
> > -- 
> > 2.23.0.rc2
> > 
> 
>  Hi Paul,
> 
>  I noticed you didn't pick up this patch with the other ones you
>  applied. I just wanted to make sure it wasn't because it was sent to
>  the wrong person. This set of files doesn't appear to have an owner in
>  MAINTAINERS, I guess based on git history either Andrew or Hubert (on
>  CC) pick up patches for this set of files? If I need to, I can resend
>  it to the proper people.
> 
>  Cheers,
>  Nathan

Sigh, actually add Andrew and Herbert and get his name right, sorry :(
