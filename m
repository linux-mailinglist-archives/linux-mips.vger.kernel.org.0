Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D91C44D2C2
	for <lists+linux-mips@lfdr.de>; Thu, 11 Nov 2021 08:56:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229706AbhKKH7Z (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 11 Nov 2021 02:59:25 -0500
Received: from conssluserg-04.nifty.com ([210.131.2.83]:65413 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbhKKH7Y (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 11 Nov 2021 02:59:24 -0500
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 1AB7uDA1003690;
        Thu, 11 Nov 2021 16:56:13 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 1AB7uDA1003690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1636617373;
        bh=Yh4dHmNoLRUEfNn1E1TmtAcfvTEbIzduOLR5UEpm+ic=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=QAWPiglmzRe+4uMvMo/eqDZicK8jVuW8lCohIRUX7iWby9VTYXgC42+3p271em4ln
         YcosvMsMKGeLJ5XEL3ko5MTnbYIgZnhid7Ae4jrGf+lbWLjuD1BLMu7j9BKhqp2m5I
         AKNM7h7dNeFmJr+HXz3pn1JqzNO3w4LRb2nkVQheGYiBUd+y7SYLJIdduZIl7xMUgk
         jSMiVKvu2lu7C3kx3kyISmfCWhF2BZObVyZpj5r9xbO3hgu5+ug0Pd5ea5hpIVstqq
         Donm+9KD7+L5mCAufi+QkW+8jl5I4f1DiPSuZ/ZAsy9JczKuDszXYyva1Z8Zkx8NAm
         Otx6FFHhmBVKw==
X-Nifty-SrcIP: [209.85.214.180]
Received: by mail-pl1-f180.google.com with SMTP id u17so5111054plg.9;
        Wed, 10 Nov 2021 23:56:13 -0800 (PST)
X-Gm-Message-State: AOAM530MqpO/xA8Ex/28eLY2nmAD5aDld1pqcjj08n0H/N0kzdyhWogW
        tuHwYRDOU80yQf4adjs9PXpL0MoFv3jwyMBerL4=
X-Google-Smtp-Source: ABdhPJyonjSTNck/X7CMgvN+M7qMoB9AhvyOs+DyI8P/3wfqqpf0lnV+ZRqttBo1wWxyVVOtWQVxaCpXgKqLmoNT6yY=
X-Received: by 2002:a17:902:bc85:b0:143:954e:8548 with SMTP id
 bb5-20020a170902bc8500b00143954e8548mr3152872plb.82.1636617372510; Wed, 10
 Nov 2021 23:56:12 -0800 (PST)
MIME-Version: 1.0
References: <20211105023815.85784-1-masahiroy@kernel.org> <20211110084927.GA5976@alpha.franken.de>
 <CAK7LNASKBJ6BT+PD7=KhGZ6wPfY7maEaj5g0rtkEhfmfxjxWuA@mail.gmail.com> <20211110185218.GB13827@alpha.franken.de>
In-Reply-To: <20211110185218.GB13827@alpha.franken.de>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 11 Nov 2021 16:55:35 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQu+FMw+MxVg=roydAP+vZBvZ9-ussC5C6TN=SL6HN6NA@mail.gmail.com>
Message-ID: <CAK7LNAQu+FMw+MxVg=roydAP+vZBvZ9-ussC5C6TN=SL6HN6NA@mail.gmail.com>
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
>
> Anyway I've applied your patch to mips-next with changes to also cover
>
> https://patchwork.kernel.org/project/linux-mips/patch/20211110030944.6733-1-rdunlap@infradead.org/
>


Your conversion is wrong.

The original code:

$(obj)/bswapdi.c: $(obj)/%.c: $(srctree)/arch/mips/lib/%.c FORCE
        $(call if_changed,shipped)


copied mips-specific library code
(arch/mips/lib/bswapdi.c)


Now, you do

#include "../../../../lib/ashldi3.c"

, which wraps the generic library code
(lib/ashldi3.c)







-- 
Best Regards
Masahiro Yamada
