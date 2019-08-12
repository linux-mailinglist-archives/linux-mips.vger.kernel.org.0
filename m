Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F09DD8A753
	for <lists+linux-mips@lfdr.de>; Mon, 12 Aug 2019 21:38:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726940AbfHLTiB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Aug 2019 15:38:01 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:39865 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726882AbfHLTiB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 12 Aug 2019 15:38:01 -0400
Received: by mail-pf1-f193.google.com with SMTP id f17so46211415pfn.6
        for <linux-mips@vger.kernel.org>; Mon, 12 Aug 2019 12:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WR1xNMurBLLA6YfMYoKDYGfmPGWBmM4BYdMt2Nd0Jy4=;
        b=T5u3brS8PDizcepwvlE+y29UANfuDWnRqgZwWb1XLHJPSfsHuW8VepYHOnbgyqnwcX
         KxNd/FS7ZwS6bQn+N3FMgL1SdrqGgVAOTQ8a6SgK6j0KW25NRiGbua+tqvdOXavCRaxy
         ysQ4nF+nqUkAz7bKPwK5civoSaMqRom5soxPONTpJzza+DKERaNMJy8fDBjQsIoywRvz
         ccjSmoFKVV2nqU44IQReP/kA8F4QYiDvVj1c7zw6PgtMWcre+leLK58uoKN7Ukxm5WD6
         zXKsgqkfs4P4077QRTA9AlTMNPVlpwJPL4p/4tYUiJ5UBLGw0jzTE4U1oAqTxXG+wTHq
         rx/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WR1xNMurBLLA6YfMYoKDYGfmPGWBmM4BYdMt2Nd0Jy4=;
        b=JDC2rglpbh5FCKzKYAjyv0BalHQfY8IVachYOjMZpCLQpYtJsqf4gX1/Q6CllV9NM4
         Qj443yUvkz2pCEkUBksUzSa1MiBZFWvWijw05vadoU4d2sVJRzMHoYaAZR3KDR7x8UjN
         6q1PnWXEbOtKybeDnL1llCqqkLLkA0cncURk7sgCNMixiZUywdcKEx6+bU16RDv2vAE/
         GQEOaRFGTgMkqtDQ3HFJJJLvLafh1YAwZNBXq9JvyFNZ2/tCD5VOfa8l7GnWJumC7fRK
         vAGpGbRUySkCzsR/fmLPR2E5Gn7hl8b87hc9WiD6NZwVtuoE5h6Swc700WGseDsZK+nq
         ChTw==
X-Gm-Message-State: APjAAAV8m+WCJRtu+AOFBkgdA6/YR4b7B1BwQ4roWPePZFGmaK2GXsJw
        VPS+k4pu36AEGmmuddUKdeOKhT5EtBsPll2zq0sxRA==
X-Google-Smtp-Source: APXvYqymx0WwYkoqYrEt9Rm0iUVkV7VpPVoYSGOIzq24JC7wLNajuws27Vy+jaADp5jIo8WQBMm41EoWnfnf2OJgMj0=
X-Received: by 2002:aa7:8085:: with SMTP id v5mr19988296pff.165.1565638679763;
 Mon, 12 Aug 2019 12:37:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190812193256.55103-1-natechancellor@gmail.com>
In-Reply-To: <20190812193256.55103-1-natechancellor@gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 12 Aug 2019 12:37:48 -0700
Message-ID: <CAKwvOdkScTZpiCnb_HBcnMLssBZ-WT7g+ir5R+uMWWZE_QA2Vw@mail.gmail.com>
Subject: Re: [PATCH v2] lib/mpi: Eliminate unused umul_ppmm definitions for MIPS
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        linux-mips@vger.kernel.org,
        "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" 
        <linux-crypto@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Aug 12, 2019 at 12:36 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
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

LGTM thanks Nathan.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

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
>
> diff --git a/lib/mpi/longlong.h b/lib/mpi/longlong.h
> index 3bb6260d8f42..2dceaca27489 100644
> --- a/lib/mpi/longlong.h
> +++ b/lib/mpi/longlong.h
> @@ -639,30 +639,12 @@ do { \
>         **************  MIPS  *****************
>         ***************************************/
>  #if defined(__mips__) && W_TYPE_SIZE == 32
> -#if (__GNUC__ >= 5) || (__GNUC__ >= 4 && __GNUC_MINOR__ >= 4)
>  #define umul_ppmm(w1, w0, u, v)                        \
>  do {                                           \
>         UDItype __ll = (UDItype)(u) * (v);      \
>         w1 = __ll >> 32;                        \
>         w0 = __ll;                              \
>  } while (0)
> -#elif __GNUC__ > 2 || __GNUC_MINOR__ >= 7
> -#define umul_ppmm(w1, w0, u, v) \
> -       __asm__ ("multu %2,%3" \
> -       : "=l" ((USItype)(w0)), \
> -            "=h" ((USItype)(w1)) \
> -       : "d" ((USItype)(u)), \
> -            "d" ((USItype)(v)))
> -#else
> -#define umul_ppmm(w1, w0, u, v) \
> -       __asm__ ("multu %2,%3\n" \
> -          "mflo %0\n" \
> -          "mfhi %1" \
> -       : "=d" ((USItype)(w0)), \
> -            "=d" ((USItype)(w1)) \
> -       : "d" ((USItype)(u)), \
> -            "d" ((USItype)(v)))
> -#endif
>  #define UMUL_TIME 10
>  #define UDIV_TIME 100
>  #endif /* __mips__ */
> @@ -687,7 +669,7 @@ do {                                                                        \
>                  : "d" ((UDItype)(u)),                                  \
>                    "d" ((UDItype)(v)));                                 \
>  } while (0)
> -#elif (__GNUC__ >= 5) || (__GNUC__ >= 4 && __GNUC_MINOR__ >= 4)
> +#else
>  #define umul_ppmm(w1, w0, u, v) \
>  do {                                                                   \
>         typedef unsigned int __ll_UTItype __attribute__((mode(TI)));    \
> @@ -695,22 +677,6 @@ do {                                                                       \
>         w1 = __ll >> 64;                                                \
>         w0 = __ll;                                                      \
>  } while (0)
> -#elif __GNUC__ > 2 || __GNUC_MINOR__ >= 7
> -#define umul_ppmm(w1, w0, u, v) \
> -       __asm__ ("dmultu %2,%3" \
> -       : "=l" ((UDItype)(w0)), \
> -            "=h" ((UDItype)(w1)) \
> -       : "d" ((UDItype)(u)), \
> -            "d" ((UDItype)(v)))
> -#else
> -#define umul_ppmm(w1, w0, u, v) \
> -       __asm__ ("dmultu %2,%3\n" \
> -          "mflo %0\n" \
> -          "mfhi %1" \
> -       : "=d" ((UDItype)(w0)), \
> -            "=d" ((UDItype)(w1)) \
> -       : "d" ((UDItype)(u)), \
> -            "d" ((UDItype)(v)))
>  #endif
>  #define UMUL_TIME 20
>  #define UDIV_TIME 140
> --
> 2.23.0.rc2
>


-- 
Thanks,
~Nick Desaulniers
