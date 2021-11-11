Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 360AB44D304
	for <lists+linux-mips@lfdr.de>; Thu, 11 Nov 2021 09:14:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbhKKIRb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 11 Nov 2021 03:17:31 -0500
Received: from elvis.franken.de ([193.175.24.41]:41876 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231675AbhKKIRb (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 11 Nov 2021 03:17:31 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1ml5EF-0001Sm-00; Thu, 11 Nov 2021 09:14:39 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 3ABB6C2C80; Thu, 11 Nov 2021 09:14:29 +0100 (CET)
Date:   Thu, 11 Nov 2021 09:14:29 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Alexander Lobakin <alobakin@pm.me>,
        Arnd Bergmann <arnd@arndb.de>,
        Paul Cercueil <paul@crapouillou.net>,
        Xingxing Su <suxingxing@loongson.cn>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        zhaoxiao <zhaoxiao@uniontech.com>
Subject: Re: [PATCH] mips: decompressor: do not copy source files while
 building
Message-ID: <20211111081429.GA4865@alpha.franken.de>
References: <20211105023815.85784-1-masahiroy@kernel.org>
 <20211110084927.GA5976@alpha.franken.de>
 <CAK7LNASKBJ6BT+PD7=KhGZ6wPfY7maEaj5g0rtkEhfmfxjxWuA@mail.gmail.com>
 <20211110185218.GB13827@alpha.franken.de>
 <CAK7LNAQu+FMw+MxVg=roydAP+vZBvZ9-ussC5C6TN=SL6HN6NA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAQu+FMw+MxVg=roydAP+vZBvZ9-ussC5C6TN=SL6HN6NA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Nov 11, 2021 at 04:55:35PM +0900, Masahiro Yamada wrote:
> On Thu, Nov 11, 2021 at 3:52 AM Thomas Bogendoerfer
> <tsbogend@alpha.franken.de> wrote:
> >
> > On Thu, Nov 11, 2021 at 02:02:32AM +0900, Masahiro Yamada wrote:
> > > On Wed, Nov 10, 2021 at 5:56 PM Thomas Bogendoerfer
> > > <tsbogend@alpha.franken.de> wrote:
> > > >
> > > > On Fri, Nov 05, 2021 at 11:38:14AM +0900, Masahiro Yamada wrote:
> > > > > As commit 7ae4a78daacf ("ARM: 8969/1: decompressor: simplify libfdt
> > > > > builds") stated, copying source files during the build time may not
> > > > > end up with as clean code as expected.
> > > > >
> > > > > Do similar for mips to clean up the Makefile and .gitignore.
> > > > >
> > > > > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > > > > ---
> > > > >
> > > > >  arch/mips/boot/compressed/.gitignore   |  3 ---
> > > > >  arch/mips/boot/compressed/Makefile     | 12 ------------
> > > > >  arch/mips/boot/compressed/ashldi3.c    |  2 ++
> > > > >  arch/mips/boot/compressed/bswapsi.c    |  2 ++
> > > > >  arch/mips/boot/compressed/uart-ath79.c |  2 ++
> > > > >  scripts/remove-stale-files             |  5 +++++
> > > > >  6 files changed, 11 insertions(+), 15 deletions(-)
> > > > >  delete mode 100644 arch/mips/boot/compressed/.gitignore
> > > > >  create mode 100644 arch/mips/boot/compressed/ashldi3.c
> > > > >  create mode 100644 arch/mips/boot/compressed/bswapsi.c
> > > > >  create mode 100644 arch/mips/boot/compressed/uart-ath79.c
> > > > >
> > > > > diff --git a/arch/mips/boot/compressed/.gitignore b/arch/mips/boot/compressed/.gitignore
> > > > > deleted file mode 100644
> > > > > index d358395614c9..000000000000
> > > > > --- a/arch/mips/boot/compressed/.gitignore
> > > > > +++ /dev/null
> > > > > @@ -1,3 +0,0 @@
> > > > > -# SPDX-License-Identifier: GPL-2.0-only
> > > > > -ashldi3.c
> > > > > -bswapsi.c
> > > > > diff --git a/arch/mips/boot/compressed/Makefile b/arch/mips/boot/compressed/Makefile
> > > > > index 3548b3b45269..e6584dab2360 100644
> > > > > --- a/arch/mips/boot/compressed/Makefile
> > > > > +++ b/arch/mips/boot/compressed/Makefile
> > > > > @@ -50,20 +50,8 @@ vmlinuzobjs-$(CONFIG_MIPS_ALCHEMY)            += $(obj)/uart-alchemy.o
> > > > >  vmlinuzobjs-$(CONFIG_ATH79)                     += $(obj)/uart-ath79.o
> > > > >  endif
> > > > >
> > > > > -extra-y += uart-ath79.c
> > > > > -$(obj)/uart-ath79.c: $(srctree)/arch/mips/ath79/early_printk.c
> > > > > -     $(call cmd,shipped)
> > > > > -
> > > > >  vmlinuzobjs-$(CONFIG_KERNEL_XZ) += $(obj)/ashldi3.o
> > > > >
> > > > > -extra-y += ashldi3.c
> > > > > -$(obj)/ashldi3.c: $(obj)/%.c: $(srctree)/lib/%.c FORCE
> > > > > -     $(call if_changed,shipped)
> > > > > -
> > > > > -extra-y += bswapsi.c
> > > > > -$(obj)/bswapsi.c: $(obj)/%.c: $(srctree)/arch/mips/lib/%.c FORCE
> > > > > -     $(call if_changed,shipped)
> > > > > -
> > > > >  targets := $(notdir $(vmlinuzobjs-y))
> > > > >
> > > > >  targets += vmlinux.bin
> > > > > diff --git a/arch/mips/boot/compressed/ashldi3.c b/arch/mips/boot/compressed/ashldi3.c
> > > > > new file mode 100644
> > > > > index 000000000000..f7bf6a7aae31
> > > > > --- /dev/null
> > > > > +++ b/arch/mips/boot/compressed/ashldi3.c
> > > > > @@ -0,0 +1,2 @@
> > > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > > +#include "../../../../lib/ashldi3.c"
> > > > > diff --git a/arch/mips/boot/compressed/bswapsi.c b/arch/mips/boot/compressed/bswapsi.c
> > > > > new file mode 100644
> > > > > index 000000000000..fdb9c6476904
> > > > > --- /dev/null
> > > > > +++ b/arch/mips/boot/compressed/bswapsi.c
> > > > > @@ -0,0 +1,2 @@
> > > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > > +#include "../../lib/bswapsi.c"
> > > > > diff --git a/arch/mips/boot/compressed/uart-ath79.c b/arch/mips/boot/compressed/uart-ath79.c
> > > > > new file mode 100644
> > > > > index 000000000000..d686820921be
> > > > > --- /dev/null
> > > > > +++ b/arch/mips/boot/compressed/uart-ath79.c
> > > > > @@ -0,0 +1,2 @@
> > > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > > +#include "../../ath79/early_printk.c"
> > > > > diff --git a/scripts/remove-stale-files b/scripts/remove-stale-files
> > > > > index eb630ee287c3..c534fe1eac16 100755
> > > > > --- a/scripts/remove-stale-files
> > > > > +++ b/scripts/remove-stale-files
> > > > > @@ -28,4 +28,9 @@ if [ -n "${building_out_of_srctree}" ]; then
> > > > >       do
> > > > >               rm -f arch/arm/boot/compressed/${f}
> > > > >       done
> > > > > +
> > > > > +     for f in uart-ath79.c ashldi3.c bswapsi.c
> > > > > +     do
> > > > > +             rm -f arch/mips/boot/compressed/${f}
> > > > > +     done
> > > >
> > > > hmm, isn't this the wrong action now that these files have been added
> > > > to git ?
> > > >
> > > > Thomas.
> > >
> > >
> > > Please note that the entire code block is enclosed by:
> > >
> > > if [ -n "${building_out_of_srctree}" ]; then
> > >            ...
> > > fi
> > >
> > >
> > > "building_out_of_srctree" is set when you are doing
> > > out-of-tree build  (O=<output-dir>).
> > >
> > > So, only the generated files are removed.
> >
> > but there aren't copied/generated any longer or I'm missing someting ?
> >
> > Anyway I've applied your patch to mips-next with changes to also cover
> >
> > https://patchwork.kernel.org/project/linux-mips/patch/20211110030944.6733-1-rdunlap@infradead.org/
> >
> 
> 
> Your conversion is wrong.
> 
> The original code:
> 
> $(obj)/bswapdi.c: $(obj)/%.c: $(srctree)/arch/mips/lib/%.c FORCE
>         $(call if_changed,shipped)
> 
> 
> copied mips-specific library code
> (arch/mips/lib/bswapdi.c)
> 
> 
> Now, you do
> 
> #include "../../../../lib/ashldi3.c"
> 
> , which wraps the generic library code
> (lib/ashldi3.c)

arch/mips/boot/compressed/bswapdi.c in my tree is 

diff --git a/arch/mips/boot/compressed/bswapdi.c b/arch/mips/boot/compressed/bswapdi.c
new file mode 100644
index 000000000000..acb28aebb025
--- /dev/null
+++ b/arch/mips/boot/compressed/bswapdi.c
@@ -0,0 +1,2 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include "../../lib/bswapdi.c"

which looks correct to me.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
