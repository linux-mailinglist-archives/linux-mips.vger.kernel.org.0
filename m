Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7740A356BB4
	for <lists+linux-mips@lfdr.de>; Wed,  7 Apr 2021 14:03:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238405AbhDGMDJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 7 Apr 2021 08:03:09 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:22355 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234967AbhDGMDI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 7 Apr 2021 08:03:08 -0400
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 137C2id5015311;
        Wed, 7 Apr 2021 21:02:45 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 137C2id5015311
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1617796965;
        bh=OjNI0DZH9/urCXQpfEs6TSNCboxu+3bxvdFvcM1Qw4Q=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=XM1KIBS7XaynQPE//VYVuS5fbdljnPZ5rLD2RuUdS53DAHVkq17Izn+qR7y4roc9F
         7h+nkzSllGw/y3E2FHOtI602T+yxJ8PHIf1+0nVzip59KMKHcYWzvMkgS6bdG1Iekm
         wa03FEcm5E6FtMEgz0+CmWAfaltGkAiRtvPhCmkhYs/fLYLCkMQcgvEV9afLkxdbkZ
         NR/mHnv0AdNdzn+x5eYbguJujHTYupPSE/5HSziCyq8/zC0YoIg2speRpclDwS256S
         6RpNmGvjSAgdVosHsHI7RrKQ69LRPWo/3JVgtfQUbB1KZk9GjSI/aXp9eMc09QXdgu
         FZOwUkA9CbzqQ==
X-Nifty-SrcIP: [209.85.214.178]
Received: by mail-pl1-f178.google.com with SMTP id ay2so9223585plb.3;
        Wed, 07 Apr 2021 05:02:45 -0700 (PDT)
X-Gm-Message-State: AOAM53217KgjQB4ov2lnV12pHSvWvX3MWLTpDGMGxu0qoZZ+aADJ/e7E
        V7mTLvmbbd5gQwKmeqJEY4hTTY9XnSbUPXxgsoQ=
X-Google-Smtp-Source: ABdhPJxcutXnV7hi1NrYhaybjzexpYlqcIHbZqpVSIEgWPHYj22WsAiK2VNMYHaWgD5L5HGQrdp4EMONsZWtwF2/Z+8=
X-Received: by 2002:a17:902:d645:b029:e8:ec90:d097 with SMTP id
 y5-20020a170902d645b02900e8ec90d097mr2679684plh.47.1617796964118; Wed, 07 Apr
 2021 05:02:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210313194836.372585-1-masahiroy@kernel.org> <20210313194836.372585-11-masahiroy@kernel.org>
 <20210331171238.GA141362@roeck-us.net> <CAKwvOdmNUMJTjyc7hAhNRzmWmRQa5TCayTSpwiiVnO4HH-YTOQ@mail.gmail.com>
In-Reply-To: <CAKwvOdmNUMJTjyc7hAhNRzmWmRQa5TCayTSpwiiVnO4HH-YTOQ@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 7 Apr 2021 21:02:06 +0900
X-Gmail-Original-Message-ID: <CAK7LNARjBJ4GqXyy7=fT1SSqTDYm4se6ahegvFb1-RuY48N3oA@mail.gmail.com>
Message-ID: <CAK7LNARjBJ4GqXyy7=fT1SSqTDYm4se6ahegvFb1-RuY48N3oA@mail.gmail.com>
Subject: Re: [PATCH 11/13] kconfig: do not use allnoconfig_y option
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Howells <dhowells@redhat.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        KP Singh <kpsingh@google.com>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Terrell <terrelln@fb.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        LKML <linux-kernel@vger.kernel.org>, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Apr 1, 2021 at 3:25 AM Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> On Wed, Mar 31, 2021 at 10:12 AM Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > On Sun, Mar 14, 2021 at 04:48:34AM +0900, Masahiro Yamada wrote:
> > > allnoconfig_y is a bad hack that sets a symbol to 'y' by allnoconfig.
> > >
> > > allnoconfig does not mean a minimum set of CONFIG options because a
> > > bunch of prompts are hidden by 'if EMBEDDED' or 'if EXPERT', but I do
> > > not like to do a workaround this way.
> > >
> > > Use the pre-existing feature, KCONFIG_ALLCONFIG, to provide a one
> > > liner config fragment. CONFIG_EMBEDDED=y is still forced under
> > > allnoconfig.
> > >
> > > No change in the .config file produced by 'make tinyconfig'.
> > >
> > > The output of 'make allnoconfig' will be changed; we will get
> > > CONFIG_EMBEDDED=n because allnoconfig literally sets all symbols to n.
> > >
> > > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> >
> > With this patch in place, mips:allnoconfig fails to build with
> > the following error.
> >
> > Error log:
> > WARNING: modpost: vmlinux.o(.text+0x9c70): Section mismatch in reference from the function reserve_exception_space() to the function .meminit.text:memblock_reserve()
> > The function reserve_exception_space() references
> > the function __meminit memblock_reserve().
> > This is often because reserve_exception_space lacks a __meminit
> > annotation or the annotation of memblock_reserve is wrong.
> > ERROR: modpost: Section mismatches detected.
> > Set CONFIG_SECTION_MISMATCH_WARN_ONLY=y to allow them.
> > make[2]: *** [scripts/Makefile.modpost:62: vmlinux.symvers] Error 1
> > make[2]: *** Deleting file 'vmlinux.symvers'
> > make[1]: *** [Makefile:1292: vmlinux] Error 2
> > make: *** [Makefile:222: __sub-make] Error 2
>
> Thanks for the report. I suspect this is related to allnoconfig
> disabling CONFIG_ARCH_KEEP_MEMBLOCK, which changes the definition of
> __init_memblock in include/linux/memblock.h.
>
> So allnoconfig would unselect CONFIG_ARCH_KEEP_MEMBLOCK, making
> __init_memblock equivalent to __meminit triggering the above warning.
>
> arch/mips/Kconfig
> 14:     select ARCH_KEEP_MEMBLOCK if DEBUG_KERNEL
>
> so DEBUG_KERNEL is probably also disabled by allnoconfig.
>
> commit a8c0f1c634507 ("MIPS: Select ARCH_KEEP_MEMBLOCK if DEBUG_KERNEL
> to enable sysfs memblock debug")
>
> probably should drop the `if DEBUG_KERNEL` part.


Thanks.
Could you please send a patch to mips ML?




> >
> > Guenter
> >
> > > ---
> > >
> > >  init/Kconfig                    | 1 -
> > >  kernel/configs/tiny-base.config | 1 +
> > >  scripts/kconfig/Makefile        | 3 ++-
> > >  3 files changed, 3 insertions(+), 2 deletions(-)
> > >  create mode 100644 kernel/configs/tiny-base.config
> > >
> > > diff --git a/init/Kconfig b/init/Kconfig
> > > index 46b87ad73f6a..beb8314fdf96 100644
> > > --- a/init/Kconfig
> > > +++ b/init/Kconfig
> > > @@ -1769,7 +1769,6 @@ config DEBUG_RSEQ
> > >
> > >  config EMBEDDED
> > >       bool "Embedded system"
> > > -     option allnoconfig_y
> > >       select EXPERT
> > >       help
> > >         This option should be enabled if compiling the kernel for
> > > diff --git a/kernel/configs/tiny-base.config b/kernel/configs/tiny-base.config
> > > new file mode 100644
> > > index 000000000000..2f0e6bf6db2c
> > > --- /dev/null
> > > +++ b/kernel/configs/tiny-base.config
> > > @@ -0,0 +1 @@
> > > +CONFIG_EMBEDDED=y
> > > diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> > > index 7df3c0e4c52e..46f2465177f0 100644
> > > --- a/scripts/kconfig/Makefile
> > > +++ b/scripts/kconfig/Makefile
> > > @@ -102,7 +102,8 @@ configfiles=$(wildcard $(srctree)/kernel/configs/$@ $(srctree)/arch/$(SRCARCH)/c
> > >
> > >  PHONY += tinyconfig
> > >  tinyconfig:
> > > -     $(Q)$(MAKE) -f $(srctree)/Makefile allnoconfig tiny.config
> > > +     $(Q)KCONFIG_ALLCONFIG=kernel/configs/tiny-base.config $(MAKE) -f $(srctree)/Makefile allnoconfig
> > > +     $(Q)$(MAKE) -f $(srctree)/Makefile tiny.config
> > >
> > >  # CHECK: -o cache_dir=<path> working?
> > >  PHONY += testconfig
> > > --
> > > 2.27.0
> > >
>
>
>
> --
> Thanks,
> ~Nick Desaulniers



-- 
Best Regards
Masahiro Yamada
