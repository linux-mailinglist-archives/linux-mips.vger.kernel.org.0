Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31C0935BBEA
	for <lists+linux-mips@lfdr.de>; Mon, 12 Apr 2021 10:16:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237222AbhDLIQ7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Apr 2021 04:16:59 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:30755 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236973AbhDLIQy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 12 Apr 2021 04:16:54 -0400
X-Greylist: delayed 65972 seconds by postgrey-1.27 at vger.kernel.org; Mon, 12 Apr 2021 04:16:53 EDT
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 13C8GChR010666;
        Mon, 12 Apr 2021 17:16:13 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 13C8GChR010666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1618215373;
        bh=uDdOFoatKT+5zEWWAiJzJLrdDEXYwLFG1mwLVDQeZSg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ChatkEem71FPJE1307DkBwk3EPN3NFOpzdXEboxnGfQ3DRCYX8wc4wg9Ihk3ndQb5
         RFUazZAR9nNmJcwhJIvJV1T/Y12+8RCbGkYJS64SQ4g9fDYtJcIid3UnlN7jRZW5mM
         kq1Foetoi6isuFQcp4M4PW8YDsrCiy/AG++mRyyu+VyqPU+XT7xVrfFVC15QVKq+Gg
         ZEEhMg0jObJB08TbnX2+tovpffpLkluDGnNlPElN+JT2E6fLFzYMT73bi/H4crUpGS
         6tUqPA9Cy1ovNGsl09vTE+KpBs9rVQtDOWRJQoKwEJIVh3sTj0Duu5nOEkUsMABc1C
         LUgQh95SyPgNw==
X-Nifty-SrcIP: [209.85.210.174]
Received: by mail-pf1-f174.google.com with SMTP id i190so8693841pfc.12;
        Mon, 12 Apr 2021 01:16:12 -0700 (PDT)
X-Gm-Message-State: AOAM532Yadje13LzX39f3A1PiCPxysZBZm2ANqEF+d+B8/U4bPiygaNi
        JNkJdTi0GDu/i5jiIDLelNunET8kKZLqVNZynEo=
X-Google-Smtp-Source: ABdhPJwQIkyZ0y/uMUlvB54CDG4omqvVnzcbv+RlS3hqxhdudrm8EDbUg9sZzv6Fn9SFbxY9GFmI5rHOYOeaY6T9tTM=
X-Received: by 2002:a63:181c:: with SMTP id y28mr26531445pgl.175.1618215372220;
 Mon, 12 Apr 2021 01:16:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210411135532.219797-1-masahiroy@kernel.org> <CAMuHMdUtqSv6PUfLtuGoBSgqqM4CkwSkT3nKstXRKN1tuXrQ_g@mail.gmail.com>
In-Reply-To: <CAMuHMdUtqSv6PUfLtuGoBSgqqM4CkwSkT3nKstXRKN1tuXrQ_g@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 12 Apr 2021 17:15:35 +0900
X-Gmail-Original-Message-ID: <CAK7LNATozxbhq1Q4HtiOrE87KKFEmdC7Hfp-biXYG1e_eFzHvw@mail.gmail.com>
Message-ID: <CAK7LNATozxbhq1Q4HtiOrE87KKFEmdC7Hfp-biXYG1e_eFzHvw@mail.gmail.com>
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

On Mon, Apr 12, 2021 at 4:44 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Yamada-san,
>
> On Sun, Apr 11, 2021 at 3:56 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > Use ?= operator to let arch/*/Makefile to assign CROSS_COMPILE only
> > when CROSS_COMPILE is undefined.
> >
> > This allows arch-Makefiles to drop the ifeq ($(CROSS_COMPILE),)
> > conditional.
> >
> > This slightly changes the behavior; the arch-Makefile previously
> > overrode CROSS_COMPILE when CROSS_COMPILE has already been made empty
> > via an environment variable as in 'export CROSS_COMPILE='.
> >
> > With this commit, arch-Makefle will respect the user's environment
> > set-up, which seems to be a more correct behavior.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> Thanks for your patch!
>
> > ---
> >
> >  arch/arc/Makefile    | 4 +---
> >  arch/h8300/Makefile  | 4 +---
> >  arch/m68k/Makefile   | 4 +---
> >  arch/mips/Makefile   | 4 +---
> >  arch/parisc/Makefile | 6 ++----
> >  arch/sh/Makefile     | 4 +---
>
> What about arch/xtensa/Makefile?
>
> > --- a/arch/m68k/Makefile
> > +++ b/arch/m68k/Makefile
> > @@ -17,10 +17,8 @@
> >  KBUILD_DEFCONFIG := multi_defconfig
> >
> >  ifneq ($(SUBARCH),$(ARCH))
> > -       ifeq ($(CROSS_COMPILE),)
> > -               CROSS_COMPILE := $(call cc-cross-prefix, \
> > +       CROSS_COMPILE ?= $(call cc-cross-prefix, \
> >                         m68k-linux-gnu- m68k-linux- m68k-unknown-linux-gnu-)
> > -       endif
> >  endif
>
> This does not seem to work as expected: my standard build scripts
> (using "make ARCH=m68k") no longer pick up the cross-compiler,
> but fall back to the native compiler, thus breaking the build.


Agh, sorry, this patch does not work
because the top Makefile exports CROSS_COMPILE.

export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS
CROSS_COMPILE LD CC



Removing CROSS_COMPILE from that makes ?= work,
but it would break other parts.


Please ignore this patch.




> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds



-- 
Best Regards
Masahiro Yamada
