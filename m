Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 583AE896B1
	for <lists+linux-mips@lfdr.de>; Mon, 12 Aug 2019 07:24:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726484AbfHLFYA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Aug 2019 01:24:00 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:32890 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725822AbfHLFYA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 12 Aug 2019 01:24:00 -0400
Received: by mail-wm1-f67.google.com with SMTP id p77so10079636wme.0;
        Sun, 11 Aug 2019 22:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3G+7nnAoIeoj8pl8gwLC4j538STzFlKu9JRfT8QamrY=;
        b=Cmt25JmBFBzRZH9o6r2weMvR9QbDFlaOqk0pEQmjPcr7R42kFqy188ZbvpjM1j2kxU
         tiOfSjCYJFeMtz8Ip60cjoY9Ki8f2oUSfJDudk/hU1MTf8e1KhIaXMDNNFN6+eQJNu+B
         zs4BW1qoyT8sJUQ3ESU+ZvP0s2ARsQlyQLrXn/BNZnHQi6sftgtP+AHi+wePV4Pex9Z5
         cGExYLpYW9425m3ofGrhaiw5tkUh/mKnv4bfRzqS44/0N5ywXEYUrGcWFGorxx6BuTBb
         zykE9yGxTmVyPNURdXdExoiwEP9fu5Hs+QkwkNPeMpmtwCg/gIwlatkACV4k60XYhno9
         wckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3G+7nnAoIeoj8pl8gwLC4j538STzFlKu9JRfT8QamrY=;
        b=egHngYetJmfPsL9EtFMHJO/5voEfuB7piuZMDCfuYkYf2hQmqCS2mxXkXnvoUC14lC
         AqF7X0FIajPb4F1mZiGotHQwJCfRZptnTPGPcOvBdzBrWDodKY8d8Y8YCgS+Ce7RdPR2
         VOUBAf698hg+jqjpxd0hxluEG+RhqnMD64MLdSSU1lwWgu+AsgZ8qIYqF0XEZCXdS7ro
         iC/lMaiSqeudocclH0rZm/HPFJXATwf2RXuC9jfL+04MMMs6cRsGN/wf6XdHL/riyhfn
         5ihhMDREh0/OIUIWn3w14w1AbDHvVwbkrfRYuob4f2RhbyayBgXKYfsEazWQxyC9PL37
         LoOQ==
X-Gm-Message-State: APjAAAVw6dzMWmhgArFzyt7AeP5ewSPwUt/I4vHaswPHYYZpfA2axQtL
        MKm8TjwrJ3XaCPVLWGI8SBk=
X-Google-Smtp-Source: APXvYqzxBT1GjR+HXBUYMH2naomA6rQ/kLlkfxmJfBUdVOcOstXLOPPWqkW9YZ8HvdkZ8wrIwYaUCg==
X-Received: by 2002:a7b:c928:: with SMTP id h8mr26234799wml.93.1565587438068;
        Sun, 11 Aug 2019 22:23:58 -0700 (PDT)
Received: from archlinux-threadripper ([2a01:4f8:222:2f1b::2])
        by smtp.gmail.com with ESMTPSA id f17sm17575259wmf.27.2019.08.11.22.23.57
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 11 Aug 2019 22:23:57 -0700 (PDT)
Date:   Sun, 11 Aug 2019 22:23:55 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Vladimir Serbinenko <phcoder@gmail.com>,
        Jussi Kivilinna <jussi.kivilinna@iki.fi>
Subject: Re: [PATCH 3/5] lib/mpi: Fix for building for MIPS32 with Clang
Message-ID: <20190812052355.GA47342@archlinux-threadripper>
References: <20190812033120.43013-1-natechancellor@gmail.com>
 <20190812033120.43013-4-natechancellor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190812033120.43013-4-natechancellor@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Aug 11, 2019 at 08:31:18PM -0700, Nathan Chancellor wrote:
> From: Vladimir Serbinenko <phcoder@gmail.com>
> 
> clang doesn't recognise =l / =h assembly operand specifiers but apparently
> handles C version well.
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
> Link: https://github.com/gpg/libgcrypt/commit/1ecbd0bca31d462719a2a6590c1d03244e76ef89
> Signed-off-by: Vladimir Serbinenko <phcoder@gmail.com>
> [jk: add changelog, rebase on libgcrypt repository, reformat changed
>  line so it does not go over 80 characters]
> Signed-off-by: Jussi Kivilinna <jussi.kivilinna@iki.fi>
> [nc: Added build error and tags to commit message
>      Added Vladimir's signoff with his permission
>      Adjusted Jussi's comment to wrap at 73 characters
>      Modified commit subject to mirror MIPS64 commit
>      Removed space between defined and (__clang__)]
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>  lib/mpi/longlong.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/mpi/longlong.h b/lib/mpi/longlong.h
> index 3bb6260d8f42..8a1507fc94dd 100644
> --- a/lib/mpi/longlong.h
> +++ b/lib/mpi/longlong.h
> @@ -639,7 +639,8 @@ do { \
>  	**************  MIPS  *****************
>  	***************************************/
>  #if defined(__mips__) && W_TYPE_SIZE == 32
> -#if (__GNUC__ >= 5) || (__GNUC__ >= 4 && __GNUC_MINOR__ >= 4)
> +#if defined(__clang__) || (__GNUC__ >= 5) || (__GNUC__ == 4 && \
> +					      __GNUC_MINOR__ >= 4)
>  #define umul_ppmm(w1, w0, u, v)			\
>  do {						\
>  	UDItype __ll = (UDItype)(u) * (v);	\
> -- 
> 2.23.0.rc2
> 

 Hi Paul,

 I noticed you didn't pick up this patch with the other ones you
 applied. I just wanted to make sure it wasn't because it was sent to
 the wrong person. This set of files doesn't appear to have an owner in
 MAINTAINERS, I guess based on git history either Andrew or Hubert (on
 CC) pick up patches for this set of files? If I need to, I can resend
 it to the proper people.

 Cheers,
 Nathan
