Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A5F91AFD8C
	for <lists+linux-mips@lfdr.de>; Sun, 19 Apr 2020 21:33:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726022AbgDSTdM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 19 Apr 2020 15:33:12 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:45120 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbgDSTdL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 19 Apr 2020 15:33:11 -0400
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 03JJWuOP002819;
        Mon, 20 Apr 2020 04:32:57 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 03JJWuOP002819
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1587324777;
        bh=JC4v4U7ZXxpy8Dy/gfPJ3fIYiTG98CoBWO4VVpusmvk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=chliN8+Uk4AOG/eFaO7PX87HQ+eglZ1yoxy1abDOztoO9v5ZJSGyksrSXxBR7Is4S
         2/HxHfryZYtRDSZ6vybPXQ4oURdxAyOP7lpmENgousxggC6kuMYQ2N64ovgKEsB5fP
         2XypsSI+LmMtQP3CxzBF7qCS4PZfZ430W50MnGUuAVBV5OqX/N58Sah+agDddXRDpv
         DuM3hYq6L22850/7C2GQTlGPFcPKGIrIogtraQ/s8TWMlkTESQcUFm0RBwyDmv2U2C
         2YzkZH4j/PpIi10Gg8dQFO+/BSgdiM03UHukpH1aS9v+e9cQv/HY0Vig96rHIlnmqn
         +o9unGBFLhklw==
X-Nifty-SrcIP: [209.85.222.47]
Received: by mail-ua1-f47.google.com with SMTP id s5so2819134uad.4;
        Sun, 19 Apr 2020 12:32:57 -0700 (PDT)
X-Gm-Message-State: AGi0PuZZJGuzfbx54fhM6BqQT2caoL1cVd6rANNlQ8jvQ5/+BX1u5I3m
        Mru6K/wdxvxxaHt3/I6KGvel/fCF/RGRmq+4K2g=
X-Google-Smtp-Source: APiQypL2PG/RoQPvgZjhWTCkYg4AWZyFB1b/JsQCb172Dsjfe7/j8L2OGNzQxE8R8/8Ko4P4+B5oEfzFfBTQ+u2p+90=
X-Received: by 2002:ab0:cd:: with SMTP id 71mr4060816uaj.109.1587324775877;
 Sun, 19 Apr 2020 12:32:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200419180445.26722-1-natechancellor@gmail.com>
 <20200419180445.26722-2-natechancellor@gmail.com> <20200419181715.GA36234@ubuntu-s3-xlarge-x86>
In-Reply-To: <20200419181715.GA36234@ubuntu-s3-xlarge-x86>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 20 Apr 2020 04:32:20 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS7QHB3GuBeLDh66OHbYRMzmNQNwiueU7jH1i7v0UTAAQ@mail.gmail.com>
Message-ID: <CAK7LNAS7QHB3GuBeLDh66OHbYRMzmNQNwiueU7jH1i7v0UTAAQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] MIPS: VDSO: Do not disable VDSO when linking with ld.lld
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Dmitry Golovin <dima@golovin.in>,
        Sedat Dilek <sedat.dilek@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Apr 20, 2020 at 3:17 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Sun, Apr 19, 2020 at 11:04:45AM -0700, Nathan Chancellor wrote:
> > Currently, when linking with ld.lld, this warning pops up:
> >
> >     arch/mips/vdso/Makefile:70: MIPS VDSO requires binutils >= 2.25
> >
> > ld-ifversion calls ld-version, which calls scripts/ld-version.sh, which
> > is specific to GNU ld. ld.lld has a completely different versioning
> > scheme (as it follows LLVM's versioning) and it does not have the issue
> > mentioned in the comment above this block so it should not be subjected
> > to this check.
> >
> > With this patch, the VDSO successfully links and shows P_MIPS_PC32 in
> > vgettimeofday.o.
> >
> > $ llvm-objdump -Dr arch/mips/vdso/vgettimeofday.o | grep R_MIPS_PC32
> >                       00000024:  R_MIPS_PC32  _start
> >                       000000b0:  R_MIPS_PC32  _start
> >                       000002bc:  R_MIPS_PC32  _start
> >                       0000036c:  R_MIPS_PC32  _start
> >                       00000468:  R_MIPS_PC32  _start
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/785
> > Link: https://github.com/llvm/llvm-project/commit/e364e2e9ce50c12eb2bf093560e1a1a8544d455a
> > Reported-by: Dmitry Golovin <dima@golovin.in>
> > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> > ---
> >  arch/mips/vdso/Makefile | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
> > index d7fe8408603e..f99e583d14a1 100644
> > --- a/arch/mips/vdso/Makefile
> > +++ b/arch/mips/vdso/Makefile
> > @@ -65,9 +65,11 @@ DISABLE_VDSO := n
> >  # the comments on that file.
> >  #
> >  ifndef CONFIG_CPU_MIPSR6
> > -  ifeq ($(call ld-ifversion, -lt, 225000000, y),y)
> > -    $(warning MIPS VDSO requires binutils >= 2.25)
> > -    DISABLE_VDSO := y
> > +  ifndef CONFIG_LD_IS_LLD
> > +    ifeq ($(call ld-ifversion, -lt, 225000000, y),y)
> > +      $(warning MIPS VDSO requires binutils >= 2.25)
> > +      DISABLE_VDSO := y
> > +    endif
> >    endif
> >  endif
> >
> > --
> > 2.26.1
> >
>
> Hmmm, I still see this warning when first runing make <config>... I
> assume because this Makefile gets parsed before Kconfig runs.


I do not see the warning for 'make <config>'.

Could you tell me how to reproduce it?


For cleaning, indeed, i see the warning.


$ make ARCH=mips  LLVM=1 clean
arch/mips/vdso/Makefile:70: MIPS VDSO requires binutils >= 2.25








>
> Perhaps it would be better to check if ld-version is 0 (since that means
> we are not using GNU ld):
>
> ifneq ($(call ld-ifversion, -eq, 0, y),y)
>
> I am open to suggestions though.
>
> Cheers,
> Nathan
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20200419181715.GA36234%40ubuntu-s3-xlarge-x86.



-- 
Best Regards
Masahiro Yamada
