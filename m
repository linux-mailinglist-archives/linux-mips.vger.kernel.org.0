Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DBBE35BC1F
	for <lists+linux-mips@lfdr.de>; Mon, 12 Apr 2021 10:28:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237332AbhDLI2g (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Apr 2021 04:28:36 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:58888 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236974AbhDLI2f (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 12 Apr 2021 04:28:35 -0400
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 13C8RqFb018652;
        Mon, 12 Apr 2021 17:27:52 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 13C8RqFb018652
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1618216072;
        bh=c1IhrGLvzsIx4560qVz2GUCgMBQOnPKbvKurVuhpDpw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=NiP0X6hMLWgq+VYGZSmYki//AUH/ZBzK9e7UqX3Nc7waxrNwbhFxyHEB725a+o63q
         MPvrXc5TZXyNKoEXWhNBdaaU6sonVZvU6fp4Ao7AfArNLzNSk1lOHTLKEGJlPqPMqE
         evVy1V3/D1bkxH0uVx8fo0P+QN509ovV6WIsosGbENBhwEzLf7XE9QmcVBTEG0r98z
         NeOAU7Kk4vaKG80BfEnKZFQXPd0KJEmsBbjZcyo8w72cm76FWc+zKpa3U7zEdTKcSG
         LWJC8CYgmxyMIEYpliHBuk9SWZCew30ov29G2k7Mveywh3R4ic2sWoU5vPsOyQbZwT
         /7zDZ4gcwaVtw==
X-Nifty-SrcIP: [209.85.215.175]
Received: by mail-pg1-f175.google.com with SMTP id t22so8833009pgu.0;
        Mon, 12 Apr 2021 01:27:52 -0700 (PDT)
X-Gm-Message-State: AOAM533mukzeWiU4Wj0gTWJO0km05feiGgh+Akd4u5TNypcTpI9+Iru/
        BSVhF1X3CjVTCyVB4RbebWc7CPBg9orB2cy5nqE=
X-Google-Smtp-Source: ABdhPJxWu5eo6g5XkG8nagihI3vcZ1wy4ZPqpby27+EDqBuxW+ScHk7SWuoOKXUtPxm8cR3FKZlQdNvUi9T5ym2y7JQ=
X-Received: by 2002:a65:45cf:: with SMTP id m15mr16557488pgr.7.1618216071763;
 Mon, 12 Apr 2021 01:27:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210411135532.219797-1-masahiroy@kernel.org> <CAMuHMdUtqSv6PUfLtuGoBSgqqM4CkwSkT3nKstXRKN1tuXrQ_g@mail.gmail.com>
 <CAK7LNATozxbhq1Q4HtiOrE87KKFEmdC7Hfp-biXYG1e_eFzHvw@mail.gmail.com>
In-Reply-To: <CAK7LNATozxbhq1Q4HtiOrE87KKFEmdC7Hfp-biXYG1e_eFzHvw@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 12 Apr 2021 17:27:14 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR4AqtqHzDnscMtXV1KGzgHy7ZDoFFcZ=QNSv1fT+wKFg@mail.gmail.com>
Message-ID: <CAK7LNAR4AqtqHzDnscMtXV1KGzgHy7ZDoFFcZ=QNSv1fT+wKFg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: use ?= to assign CROSS_COMPILE by arch-Makefile
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-kbuild <linux-kbuild@vger.kernel.org>,
        Helge Deller <deller@gmx.de>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Rich Felker <dalias@libc.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vineet Gupta <vgupta@synopsys.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        arcml <linux-snps-arc@lists.infradead.org>,
        "moderated list:H8/300 ARCHITECTURE" 
        <uclinux-h8-devel@lists.sourceforge.jp>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Apr 12, 2021 at 5:15 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Mon, Apr 12, 2021 at 4:44 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >
> > Hi Yamada-san,
> >
> > On Sun, Apr 11, 2021 at 3:56 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > > Use ?= operator to let arch/*/Makefile to assign CROSS_COMPILE only
> > > when CROSS_COMPILE is undefined.
> > >
> > > This allows arch-Makefiles to drop the ifeq ($(CROSS_COMPILE),)
> > > conditional.
> > >
> > > This slightly changes the behavior; the arch-Makefile previously
> > > overrode CROSS_COMPILE when CROSS_COMPILE has already been made empty
> > > via an environment variable as in 'export CROSS_COMPILE='.
> > >
> > > With this commit, arch-Makefle will respect the user's environment
> > > set-up, which seems to be a more correct behavior.
> > >
> > > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> >
> > Thanks for your patch!
> >
> > > ---
> > >
> > >  arch/arc/Makefile    | 4 +---
> > >  arch/h8300/Makefile  | 4 +---
> > >  arch/m68k/Makefile   | 4 +---
> > >  arch/mips/Makefile   | 4 +---
> > >  arch/parisc/Makefile | 6 ++----
> > >  arch/sh/Makefile     | 4 +---
> >
> > What about arch/xtensa/Makefile?
> >
> > > --- a/arch/m68k/Makefile
> > > +++ b/arch/m68k/Makefile
> > > @@ -17,10 +17,8 @@
> > >  KBUILD_DEFCONFIG := multi_defconfig
> > >
> > >  ifneq ($(SUBARCH),$(ARCH))
> > > -       ifeq ($(CROSS_COMPILE),)
> > > -               CROSS_COMPILE := $(call cc-cross-prefix, \
> > > +       CROSS_COMPILE ?= $(call cc-cross-prefix, \
> > >                         m68k-linux-gnu- m68k-linux- m68k-unknown-linux-gnu-)
> > > -       endif
> > >  endif
> >
> > This does not seem to work as expected: my standard build scripts
> > (using "make ARCH=m68k") no longer pick up the cross-compiler,
> > but fall back to the native compiler, thus breaking the build.
>
>
> Agh, sorry, this patch does not work
> because the top Makefile exports CROSS_COMPILE.
>
> export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS
> CROSS_COMPILE LD CC
>
>
>
> Removing CROSS_COMPILE from that makes ?= work,
> but it would break other parts.
>
>
> Please ignore this patch.
>
>
>
>
> > Gr{oetje,eeting}s,
> >
> >                         Geert
> >
> > --
> > Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> >
> > In personal conversations with technical people, I call myself a hacker. But
> > when I'm talking to journalists I just say "programmer" or something like that.
> >                                 -- Linus Torvalds
>


The following will make this patch work, but probably it is better to
not do this...




diff --git a/Makefile b/Makefile
index cc77fd45ca64..26bf482f0d88 100644
--- a/Makefile
+++ b/Makefile
@@ -506,7 +506,7 @@ KBUILD_LDFLAGS_MODULE :=
 KBUILD_LDFLAGS :=
 CLANG_FLAGS :=

-export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS
CROSS_COMPILE LD CC
+export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS LD CC
 export CPP AR NM STRIP OBJCOPY OBJDUMP READELF PAHOLE RESOLVE_BTFIDS
LEX YACC AWK INSTALLKERNEL
 export PERL PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
 export KGZIP KBZIP2 KLZOP LZMA LZ4 XZ ZSTD
@@ -681,6 +681,8 @@ export RETPOLINE_VDSO_CFLAGS

 include arch/$(SRCARCH)/Makefile

+export CROSS_COMPILE
+
 ifdef need-config
 ifdef may-sync-config
 # Read in dependencies to all Kconfig* files, make sure to run syncconfig if






-- 
Best Regards
Masahiro Yamada
