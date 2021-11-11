Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3786E44D02F
	for <lists+linux-mips@lfdr.de>; Thu, 11 Nov 2021 03:59:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230027AbhKKDCX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Nov 2021 22:02:23 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:28855 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229699AbhKKDCX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Nov 2021 22:02:23 -0500
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 1AB2xAYZ005831;
        Thu, 11 Nov 2021 11:59:10 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 1AB2xAYZ005831
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1636599551;
        bh=z0kB6LXNhmoFy9ipy8qdQdgFQI7I8hxlYJKZeDtbeX0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=GqNpCfwpuL9hxmApUERiBwppYyLlgSrj4gNSZ+RLG4IsaU4wvFhS8tu3KH2LmTW6B
         NvOHLDZids8ttXMZjv8H4yU+fYyveWKgd5yDF08EyM+dUUWV0sOoYTyzYaxY08WXOj
         hJMrxx+uE9DzfqaZAzTWIeadofFj030z/PN18mhxxkBtm+/43ssB7wk6b3nymqacbD
         X4YATk0fIIOfQE2CnEoXGCH/kmvQd1fjUSj86VvJJ8XWL1obkEX5tTAaFYneEYAxHn
         saXdreb1/0Lt/NfYwIE1viwenN2EP7xhLH0VCGhEY32hZq9yOEQBHMuFARF9YjhsHJ
         vI2m1C3t1zD9A==
X-Nifty-SrcIP: [209.85.215.169]
Received: by mail-pg1-f169.google.com with SMTP id g184so3934552pgc.6;
        Wed, 10 Nov 2021 18:59:10 -0800 (PST)
X-Gm-Message-State: AOAM532fXTqriu2qzT7nuYXWjZ2S1EtABnQkyDk0DFu1jM/A3jwZQvqC
        QNYf+7ZTLPXE8wzUk3BWfMuiHPZsz572aMnKxpY=
X-Google-Smtp-Source: ABdhPJzBE5dIDpx0gL6kF9s1HWpu5Wj3UbNAuOGC1zwRtfZw4rt4drO6fwnNTFaYfKqh//3XhMz37c7gKS+XF6F6JWY=
X-Received: by 2002:a05:6a00:1411:b0:4a0:3472:e438 with SMTP id
 l17-20020a056a00141100b004a03472e438mr3729520pfu.68.1636599550010; Wed, 10
 Nov 2021 18:59:10 -0800 (PST)
MIME-Version: 1.0
References: <20211105023815.85784-1-masahiroy@kernel.org> <20211110084927.GA5976@alpha.franken.de>
 <CAK7LNASKBJ6BT+PD7=KhGZ6wPfY7maEaj5g0rtkEhfmfxjxWuA@mail.gmail.com> <20211110185218.GB13827@alpha.franken.de>
In-Reply-To: <20211110185218.GB13827@alpha.franken.de>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 11 Nov 2021 11:58:32 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQV9w58=WF6wWeEgAWAPB4ZiAfDx+G7WY6gQd_jvXTq+g@mail.gmail.com>
Message-ID: <CAK7LNAQV9w58=WF6wWeEgAWAPB4ZiAfDx+G7WY6gQd_jvXTq+g@mail.gmail.com>
Subject: Re: [PATCH] mips: decompressor: do not copy source files while building
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Alexander Lobakin <alobakin@pm.me>,
        Arnd Bergmann <arnd@arndb.de>,
        Paul Cercueil <paul@crapouillou.net>,
        Xingxing Su <suxingxing@loongson.cn>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        zhaoxiao <zhaoxiao@uniontech.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Nov 11, 2021 at 3:52 AM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Thu, Nov 11, 2021 at 02:02:32AM +0900, Masahiro Yamada wrote:
> > On Wed, Nov 10, 2021 at 5:56 PM Thomas Bogendoerfer
> > <tsbogend@alpha.franken.de> wrote:
> > >
> > > On Fri, Nov 05, 2021 at 11:38:14AM +0900, Masahiro Yamada wrote:
> > > > As commit 7ae4a78daacf ("ARM: 8969/1: decompressor: simplify libfdt
> > > > builds") stated, copying source files during the build time may not
> > > > end up with as clean code as expected.
> > > >
> > > > Do similar for mips to clean up the Makefile and .gitignore.
> > > >
> > > > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > > > ---
> > > >
> > > >  arch/mips/boot/compressed/.gitignore   |  3 ---
> > > >  arch/mips/boot/compressed/Makefile     | 12 ------------
> > > >  arch/mips/boot/compressed/ashldi3.c    |  2 ++
> > > >  arch/mips/boot/compressed/bswapsi.c    |  2 ++
> > > >  arch/mips/boot/compressed/uart-ath79.c |  2 ++
> > > >  scripts/remove-stale-files             |  5 +++++
> > > >  6 files changed, 11 insertions(+), 15 deletions(-)
> > > >  delete mode 100644 arch/mips/boot/compressed/.gitignore
> > > >  create mode 100644 arch/mips/boot/compressed/ashldi3.c
> > > >  create mode 100644 arch/mips/boot/compressed/bswapsi.c
> > > >  create mode 100644 arch/mips/boot/compressed/uart-ath79.c
> > > >
> > > > diff --git a/arch/mips/boot/compressed/.gitignore b/arch/mips/boot/compressed/.gitignore
> > > > deleted file mode 100644
> > > > index d358395614c9..000000000000
> > > > --- a/arch/mips/boot/compressed/.gitignore
> > > > +++ /dev/null
> > > > @@ -1,3 +0,0 @@
> > > > -# SPDX-License-Identifier: GPL-2.0-only
> > > > -ashldi3.c
> > > > -bswapsi.c
> > > > diff --git a/arch/mips/boot/compressed/Makefile b/arch/mips/boot/compressed/Makefile
> > > > index 3548b3b45269..e6584dab2360 100644
> > > > --- a/arch/mips/boot/compressed/Makefile
> > > > +++ b/arch/mips/boot/compressed/Makefile
> > > > @@ -50,20 +50,8 @@ vmlinuzobjs-$(CONFIG_MIPS_ALCHEMY)            += $(obj)/uart-alchemy.o
> > > >  vmlinuzobjs-$(CONFIG_ATH79)                     += $(obj)/uart-ath79.o
> > > >  endif
> > > >
> > > > -extra-y += uart-ath79.c
> > > > -$(obj)/uart-ath79.c: $(srctree)/arch/mips/ath79/early_printk.c
> > > > -     $(call cmd,shipped)
> > > > -
> > > >  vmlinuzobjs-$(CONFIG_KERNEL_XZ) += $(obj)/ashldi3.o
> > > >
> > > > -extra-y += ashldi3.c
> > > > -$(obj)/ashldi3.c: $(obj)/%.c: $(srctree)/lib/%.c FORCE
> > > > -     $(call if_changed,shipped)
> > > > -
> > > > -extra-y += bswapsi.c
> > > > -$(obj)/bswapsi.c: $(obj)/%.c: $(srctree)/arch/mips/lib/%.c FORCE
> > > > -     $(call if_changed,shipped)
> > > > -
> > > >  targets := $(notdir $(vmlinuzobjs-y))
> > > >
> > > >  targets += vmlinux.bin
> > > > diff --git a/arch/mips/boot/compressed/ashldi3.c b/arch/mips/boot/compressed/ashldi3.c
> > > > new file mode 100644
> > > > index 000000000000..f7bf6a7aae31
> > > > --- /dev/null
> > > > +++ b/arch/mips/boot/compressed/ashldi3.c
> > > > @@ -0,0 +1,2 @@
> > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > +#include "../../../../lib/ashldi3.c"
> > > > diff --git a/arch/mips/boot/compressed/bswapsi.c b/arch/mips/boot/compressed/bswapsi.c
> > > > new file mode 100644
> > > > index 000000000000..fdb9c6476904
> > > > --- /dev/null
> > > > +++ b/arch/mips/boot/compressed/bswapsi.c
> > > > @@ -0,0 +1,2 @@
> > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > +#include "../../lib/bswapsi.c"
> > > > diff --git a/arch/mips/boot/compressed/uart-ath79.c b/arch/mips/boot/compressed/uart-ath79.c
> > > > new file mode 100644
> > > > index 000000000000..d686820921be
> > > > --- /dev/null
> > > > +++ b/arch/mips/boot/compressed/uart-ath79.c
> > > > @@ -0,0 +1,2 @@
> > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > +#include "../../ath79/early_printk.c"
> > > > diff --git a/scripts/remove-stale-files b/scripts/remove-stale-files
> > > > index eb630ee287c3..c534fe1eac16 100755
> > > > --- a/scripts/remove-stale-files
> > > > +++ b/scripts/remove-stale-files
> > > > @@ -28,4 +28,9 @@ if [ -n "${building_out_of_srctree}" ]; then
> > > >       do
> > > >               rm -f arch/arm/boot/compressed/${f}
> > > >       done
> > > > +
> > > > +     for f in uart-ath79.c ashldi3.c bswapsi.c
> > > > +     do
> > > > +             rm -f arch/mips/boot/compressed/${f}
> > > > +     done
> > >
> > > hmm, isn't this the wrong action now that these files have been added
> > > to git ?
> > >
> > > Thomas.
> >
> >
> > Please note that the entire code block is enclosed by:
> >
> > if [ -n "${building_out_of_srctree}" ]; then
> >            ...
> > fi
> >
> >
> > "building_out_of_srctree" is set when you are doing
> > out-of-tree build  (O=<output-dir>).
> >
> > So, only the generated files are removed.
>
> but there aren't copied/generated any longer or I'm missing someting ?


People do "git pull" without cleaning the tree.
(and we should not require users to do "make clean")


[1]  ashldi3.c and bswapsi.c will be remaining
      in the build directory, which were generated
      by an older commit

[2] ashldi3.c and bswapsi.c will be added to the
     source tree when people pull this commit



[1] takes precedence over [2].

So, old files will be compiled. This is a problem.

That's why I am removing [1] for O= builds.




>
> Anyway I've applied your patch to mips-next with changes to also cover
>
> https://patchwork.kernel.org/project/linux-mips/patch/20211110030944.6733-1-rdunlap@infradead.org/
>
> Thomas.
>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]



-- 
Best Regards
Masahiro Yamada
