Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC3B78A416
	for <lists+linux-mips@lfdr.de>; Mon, 12 Aug 2019 19:14:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725843AbfHLROx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Aug 2019 13:14:53 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54186 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725822AbfHLROx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 12 Aug 2019 13:14:53 -0400
Received: by mail-wm1-f68.google.com with SMTP id 10so253200wmp.3;
        Mon, 12 Aug 2019 10:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=uyuxaCQlT0KbWKY6B1ulai8tYcYjc2klD2HfPgScdF0=;
        b=JQXJHyjAk7lWyWI7W23UJnM0/xNj0XYcihfDl9IHywflTohM4i+zhIhe0f5XkmnffO
         PmcXp8E32BARMv2dlUihsfO59jmkrjwuN6k0owr4xLbz6DzKHt0n7WBHo2LAc/Nq5LAN
         ewTC0PHSRjAt5JtvkEZdic4v6aFqtLf9Kq2rY0nm8QdWw3mzQ8v22Pah7C+Av99ksaz3
         YhypOl38+WM1bk7ifDb5EBIWSGDHUiyLGvmJBR3AjsXq/nPo5tRbWIFpp5gRVx3D2tau
         jvxRx/U8la00423RHGNkuBRf/p6remzgRA1RSR7h3knkpNvwo63IoZjWQ6/EyO48WUP3
         pV6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uyuxaCQlT0KbWKY6B1ulai8tYcYjc2klD2HfPgScdF0=;
        b=H+L8fyMwqIXl0CDVrHDdn9BXzkq0MvVE5rLTqqkHCQbP+1YdxBNGYJ1zVpZWM9YMdU
         LO7ZRe87D2Uptuxv2g494ps6D3RzmWVAoYUfqKS3/9xznbMqc7jtSO0GXcsHjX34z8ib
         /7yk3j8wJUXBzbYMbfqUG1kn3uu56a3qqAnLdRcWZQG0WptfJ74cllufbx4l90dkKZgi
         q6uzZvEJdOFVJf+i2FVaFWABFv/NQR41iwMwknCJpg6Zo5U/FNuT9sU4FjJozI8Ckl+q
         4I9acxe3CcYJDcfdwxBjSJSR06vODyEcnowAd8bIPmoWclL1ehLN828BtUtcckkDcYrC
         Z0jw==
X-Gm-Message-State: APjAAAXJi4TFB2hRRvDIfW5jNS8ycHx1UjYBjCeZ0bFE/0boXMusNl8w
        /ZLMm+49q8HHCHVHxSFi2ho=
X-Google-Smtp-Source: APXvYqwtZdVAubbdgW1cTuVJeqK9imDOI51oD7i00kYAvM2fCDYcdypFeXbskL8XirVHiW+gg1bjTw==
X-Received: by 2002:a1c:be15:: with SMTP id o21mr350444wmf.140.1565630090353;
        Mon, 12 Aug 2019 10:14:50 -0700 (PDT)
Received: from archlinux-threadripper ([2a01:4f8:222:2f1b::2])
        by smtp.gmail.com with ESMTPSA id d9sm125544wmb.9.2019.08.12.10.14.49
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 12 Aug 2019 10:14:49 -0700 (PDT)
Date:   Mon, 12 Aug 2019 10:14:48 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Jussi Kivilinna <jussi.kivilinna@iki.fi>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Vladimir Serbinenko <phcoder@gmail.com>
Subject: Re: [PATCH 3/5] lib/mpi: Fix for building for MIPS32 with Clang
Message-ID: <20190812171448.GA10039@archlinux-threadripper>
References: <20190812033120.43013-1-natechancellor@gmail.com>
 <20190812033120.43013-4-natechancellor@gmail.com>
 <ec4666a6-c7db-247b-de81-bb784bb9d649@iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec4666a6-c7db-247b-de81-bb784bb9d649@iki.fi>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Aug 12, 2019 at 10:35:53AM +0300, Jussi Kivilinna wrote:
> Hello,
> 
> On 12.8.2019 6.31, Nathan Chancellor wrote:
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
> 
> This is my signed-off-by for libgcrypt project, not kernel. I do not think
> signed-offs can be passed from other projects in this way.
> 
> -Jussi

Hi Jussi,

I am no signoff expert but if I am reading the developer certificate of
origin in the libgcrypt repo correctly [1], your signoff on this commit
falls under:

(d) I understand and agree that this project and the contribution
    are public and that a record of the contribution (including all
    personal information I submit with it, including my sign-off) is
    maintained indefinitely and may be redistributed consistent with
    this project or the open source license(s) involved.

This file is maintained under the LGPL because it was taken straight
from the libgcrypr repo and per (b), I can submit this commit here
with everything intact.

However, I don't want to upset you in any way though so if you are not
comfortable with that, I suppose I can remove it as if Vladimir
submitted this fix to me directly (as I got permission for his signoff).
I need to resubmit this fix to an appropriate maintainer so let me know
what you think.

[1]: https://github.com/gpg/libgcrypt/blob/3bb858551cd5d84e43b800edfa2b07d1529718a9/doc/DCO

Cheers,
Nathan
