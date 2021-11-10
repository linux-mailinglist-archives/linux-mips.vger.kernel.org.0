Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD49444C5A6
	for <lists+linux-mips@lfdr.de>; Wed, 10 Nov 2021 18:03:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231612AbhKJRGL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Nov 2021 12:06:11 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:35998 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229995AbhKJRGK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Nov 2021 12:06:10 -0500
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 1AAH3ADH018807;
        Thu, 11 Nov 2021 02:03:11 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 1AAH3ADH018807
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1636563791;
        bh=eqx2h1z+6W91aA/paM9MjCJ0BZjnMQ4qAp13AQGRbeE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=E4XXbUBVeXAkGnZwmz02Jan9k6ovOFMaOWhPOo9y7gcLa1g3Fl/okFY8viRF5f5rt
         gUsIn+c9BYr6/ZoZM4eLDAm3xcRhlCCpyykfvsLs/yHHHrzfGpcArK3WJIr143H/bG
         uEPr2JPolRLVpeTGlfKyBxSAPCetMvJCegrG/w5V1nCAexoOFTKXZEGN2GmEjXv7H9
         w9PnLHz0GzY1OOqn+N1SY6B5Qv9QvGg1wTfjCkpv9Nq4jkQ8Lg5TXr9yT1D/6/OpxD
         0BFMgGIzqtirwvGnNAXZ3WiHENNFZ345IA9YtDP+pC55HkOpm/O5fTpF/tKbETljAN
         UIce5pTLeJIDw==
X-Nifty-SrcIP: [209.85.216.51]
Received: by mail-pj1-f51.google.com with SMTP id h24so2073672pjq.2;
        Wed, 10 Nov 2021 09:03:11 -0800 (PST)
X-Gm-Message-State: AOAM532PZ4zMM3CmdD+X/ki5g0nsEWqLw5lezr3O1lgbjWifg/sQWrW2
        p7mnRYoaj/tkUIKPKbzLgcMBBYSoDfCwtMQSYZU=
X-Google-Smtp-Source: ABdhPJxvdmcS7OUUiIebqY+I3qXPmj8cGP/mDgerY+4hpX6evADqnQTk5inxfqi0xbWgM/t5aFUCfT91nRKNzeXE0Ac=
X-Received: by 2002:a17:90b:1d0f:: with SMTP id on15mr401529pjb.144.1636563790191;
 Wed, 10 Nov 2021 09:03:10 -0800 (PST)
MIME-Version: 1.0
References: <20211105023815.85784-1-masahiroy@kernel.org> <20211110084927.GA5976@alpha.franken.de>
In-Reply-To: <20211110084927.GA5976@alpha.franken.de>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 11 Nov 2021 02:02:32 +0900
X-Gmail-Original-Message-ID: <CAK7LNASKBJ6BT+PD7=KhGZ6wPfY7maEaj5g0rtkEhfmfxjxWuA@mail.gmail.com>
Message-ID: <CAK7LNASKBJ6BT+PD7=KhGZ6wPfY7maEaj5g0rtkEhfmfxjxWuA@mail.gmail.com>
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

On Wed, Nov 10, 2021 at 5:56 PM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Fri, Nov 05, 2021 at 11:38:14AM +0900, Masahiro Yamada wrote:
> > As commit 7ae4a78daacf ("ARM: 8969/1: decompressor: simplify libfdt
> > builds") stated, copying source files during the build time may not
> > end up with as clean code as expected.
> >
> > Do similar for mips to clean up the Makefile and .gitignore.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  arch/mips/boot/compressed/.gitignore   |  3 ---
> >  arch/mips/boot/compressed/Makefile     | 12 ------------
> >  arch/mips/boot/compressed/ashldi3.c    |  2 ++
> >  arch/mips/boot/compressed/bswapsi.c    |  2 ++
> >  arch/mips/boot/compressed/uart-ath79.c |  2 ++
> >  scripts/remove-stale-files             |  5 +++++
> >  6 files changed, 11 insertions(+), 15 deletions(-)
> >  delete mode 100644 arch/mips/boot/compressed/.gitignore
> >  create mode 100644 arch/mips/boot/compressed/ashldi3.c
> >  create mode 100644 arch/mips/boot/compressed/bswapsi.c
> >  create mode 100644 arch/mips/boot/compressed/uart-ath79.c
> >
> > diff --git a/arch/mips/boot/compressed/.gitignore b/arch/mips/boot/compressed/.gitignore
> > deleted file mode 100644
> > index d358395614c9..000000000000
> > --- a/arch/mips/boot/compressed/.gitignore
> > +++ /dev/null
> > @@ -1,3 +0,0 @@
> > -# SPDX-License-Identifier: GPL-2.0-only
> > -ashldi3.c
> > -bswapsi.c
> > diff --git a/arch/mips/boot/compressed/Makefile b/arch/mips/boot/compressed/Makefile
> > index 3548b3b45269..e6584dab2360 100644
> > --- a/arch/mips/boot/compressed/Makefile
> > +++ b/arch/mips/boot/compressed/Makefile
> > @@ -50,20 +50,8 @@ vmlinuzobjs-$(CONFIG_MIPS_ALCHEMY)            += $(obj)/uart-alchemy.o
> >  vmlinuzobjs-$(CONFIG_ATH79)                     += $(obj)/uart-ath79.o
> >  endif
> >
> > -extra-y += uart-ath79.c
> > -$(obj)/uart-ath79.c: $(srctree)/arch/mips/ath79/early_printk.c
> > -     $(call cmd,shipped)
> > -
> >  vmlinuzobjs-$(CONFIG_KERNEL_XZ) += $(obj)/ashldi3.o
> >
> > -extra-y += ashldi3.c
> > -$(obj)/ashldi3.c: $(obj)/%.c: $(srctree)/lib/%.c FORCE
> > -     $(call if_changed,shipped)
> > -
> > -extra-y += bswapsi.c
> > -$(obj)/bswapsi.c: $(obj)/%.c: $(srctree)/arch/mips/lib/%.c FORCE
> > -     $(call if_changed,shipped)
> > -
> >  targets := $(notdir $(vmlinuzobjs-y))
> >
> >  targets += vmlinux.bin
> > diff --git a/arch/mips/boot/compressed/ashldi3.c b/arch/mips/boot/compressed/ashldi3.c
> > new file mode 100644
> > index 000000000000..f7bf6a7aae31
> > --- /dev/null
> > +++ b/arch/mips/boot/compressed/ashldi3.c
> > @@ -0,0 +1,2 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +#include "../../../../lib/ashldi3.c"
> > diff --git a/arch/mips/boot/compressed/bswapsi.c b/arch/mips/boot/compressed/bswapsi.c
> > new file mode 100644
> > index 000000000000..fdb9c6476904
> > --- /dev/null
> > +++ b/arch/mips/boot/compressed/bswapsi.c
> > @@ -0,0 +1,2 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +#include "../../lib/bswapsi.c"
> > diff --git a/arch/mips/boot/compressed/uart-ath79.c b/arch/mips/boot/compressed/uart-ath79.c
> > new file mode 100644
> > index 000000000000..d686820921be
> > --- /dev/null
> > +++ b/arch/mips/boot/compressed/uart-ath79.c
> > @@ -0,0 +1,2 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +#include "../../ath79/early_printk.c"
> > diff --git a/scripts/remove-stale-files b/scripts/remove-stale-files
> > index eb630ee287c3..c534fe1eac16 100755
> > --- a/scripts/remove-stale-files
> > +++ b/scripts/remove-stale-files
> > @@ -28,4 +28,9 @@ if [ -n "${building_out_of_srctree}" ]; then
> >       do
> >               rm -f arch/arm/boot/compressed/${f}
> >       done
> > +
> > +     for f in uart-ath79.c ashldi3.c bswapsi.c
> > +     do
> > +             rm -f arch/mips/boot/compressed/${f}
> > +     done
>
> hmm, isn't this the wrong action now that these files have been added
> to git ?
>
> Thomas.


Please note that the entire code block is enclosed by:

if [ -n "${building_out_of_srctree}" ]; then
           ...
fi


"building_out_of_srctree" is set when you are doing
out-of-tree build  (O=<output-dir>).

So, only the generated files are removed.




-- 
Best Regards
Masahiro Yamada
