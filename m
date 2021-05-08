Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FC85376F5B
	for <lists+linux-mips@lfdr.de>; Sat,  8 May 2021 06:24:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229749AbhEHEZf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 8 May 2021 00:25:35 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:47271 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbhEHEZb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 8 May 2021 00:25:31 -0400
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 1484NxlY026356;
        Sat, 8 May 2021 13:24:00 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 1484NxlY026356
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1620447840;
        bh=l8xuoRsinTPWN4SHF9tl3R6iJKM57CZKG9ugElv2VtU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=MjdiOrAal7hg/kt81cuTa8wWsp/HW/ap9vbSqzRhyRub1a0PqZHV6NdfUFSfyDg3+
         ZishGnAJ2zsip771KIScipObuCnSbAaE0S+xUbiUUVW+umHevSi4bbxnxtiErcZlHe
         p6VkAQeotIs7qpR50ci0t56HFe1FOk0/mdlWeOsrMCBVcxVT5+VomRMrFmgGC85lWy
         0FK7AO0Eq8k546qZjvHlIoOajNdW6AVf9jRRYXTakV7a6NJ64TGCqOeS/FDWVraDsb
         1z/JuiSyeJATqTgTzZn6kbmIAKj4dZFsYM3X70AMKnqyhy7dRXFoceixIEqd/18GRB
         lr3NXHBzsLaBw==
X-Nifty-SrcIP: [209.85.216.52]
Received: by mail-pj1-f52.google.com with SMTP id b14-20020a17090a6e0eb0290155c7f6a356so5662414pjk.0;
        Fri, 07 May 2021 21:24:00 -0700 (PDT)
X-Gm-Message-State: AOAM530+uOMTmxk+KDvRgH62AlRMkxe+PGbGPnbcqIohoomAc2Ntv5ZR
        niKbiud+DQ7kJBoY3S8tUFEL4MSjElG3nZqaxRY=
X-Google-Smtp-Source: ABdhPJw45L5QPBl/aOPryvtG9a8cjld46ihGEiYAcse27hvLzksN2CGGTxEA4a2yHPfDbYHofYB14iqloDB5loSih7w=
X-Received: by 2002:a17:90a:5207:: with SMTP id v7mr27059530pjh.87.1620447839406;
 Fri, 07 May 2021 21:23:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210505174515.87565-1-masahiroy@kernel.org> <20210508115943.5dbf76f2@canb.auug.org.au>
In-Reply-To: <20210508115943.5dbf76f2@canb.auug.org.au>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 8 May 2021 13:23:21 +0900
X-Gmail-Original-Message-ID: <CAK7LNATR1MXkbb0XdTbEzdigpznARv6VFfMDsHWstb3qp2vzvA@mail.gmail.com>
Message-ID: <CAK7LNATR1MXkbb0XdTbEzdigpznARv6VFfMDsHWstb3qp2vzvA@mail.gmail.com>
Subject: Re: [PATCH v2] linux/kconfig.h: replace IF_ENABLED() with PTR_IF() in <linux/kernel.h>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        "Guilherme G. Piccoli" <gpiccoli@canonical.com>,
        Kars Mulder <kerneldev@karsmulder.nl>,
        Kees Cook <keescook@chromium.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>, chao <chao@eero.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Stephen,


On Sat, May 8, 2021 at 10:59 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Masahiro,
>
> On Thu,  6 May 2021 02:45:15 +0900 Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > <linux/kconfig.h> is included from all the kernel-space source files,
> > including C, assembly, linker scripts. It is intended to contain a
> > minimal set of macros to evaluate CONFIG options.
> >
> > IF_ENABLED() is an intruder here because (x ? y : z) is C code, which
> > should not be included from assembly files or linker scripts.
>
> Except it doesn't matter unless IF_ENABLED() is used by one of those.

Yes. This is rather coding policy of <linux/kconfig.h>

> > Also, <linux/kconfig.h> is no longer self-contained because NULL is
> > defined in <linux/stddef.h>.
>
> Again, it doesn't matter unless IF_ENABLED() is used.

If you want to use IF_ENABLED(), you  must understand that
it is internally using NULL and include <linux/stddef.h>.

It is the reason why we should make headers self-contained.



>
> > Move IF_ENABLED() out to <linux/kernel.h> as PTR_IF(). PTF_IF()
> > takes the general boolean expression instead of a CONFIG option
> > so that it fits better in <linux/kernel.h>.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> > Changes in v2:
> >   - Keep PTF_IF macro in pinctrl-ingenic.c
> >
> >  drivers/pinctrl/pinctrl-ingenic.c | 2 ++
> >  include/linux/kconfig.h           | 6 ------
> >  include/linux/kernel.h            | 2 ++
> >  3 files changed, 4 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
> > index 651a36b9dcc0..0ee69f8e20b2 100644
> > --- a/drivers/pinctrl/pinctrl-ingenic.c
> > +++ b/drivers/pinctrl/pinctrl-ingenic.c
> > @@ -3854,6 +3854,8 @@ static int __init ingenic_pinctrl_probe(struct platform_device *pdev)
> >       return 0;
> >  }
> >
> > +#define IF_ENABLED(cfg, ptr) PTR_IF(IS_ENABLED(cfg), (ptr))
> > +
> >  static const struct of_device_id ingenic_pinctrl_of_match[] = {
> >       {
> >               .compatible = "ingenic,jz4730-pinctrl",
>
> You also need to include linux/kernel.h in
> drivers/pinctrl/pinctrl-ingenic.c (for completeness).

<linux/kernel.h> is too widely used, so some other headers
would have already included it eventually.
But, correct, it is better to include it explicitly for completeness.


>
> Also, I don't understand why the use of IF_ENABLED doesn't produce
> "defined but not used" warnings (if the function "ptr" is not marked as
> __maybe_unused) ...

The function is optimized out by the compiler, not by the pre-processor.
So, -Wunused-but-set-variable does not complain about it.


> Also, if there is only one user of IF_ENABLED (and therefore PTR_IF),
> why not just put it in that file and save me rebuilding the world again
> every day because kernel.h is changed (again).  I guess that is going
> to happen just because kconfig.h is being changed and that is also
> included by everything :-(

I understand, but this is a one-time fix.

<linux/kconfig.h> is not changed so often.

I believe this will be useful for SET_SYSTEM_SLEEP_PM_OPS cleanups.
So, the macro must be placed in a public header.


> Also, is anyone else ever going to use PTR_IF() without having to also
> use IS_ENABLED()?

Yes or no. I am not sure about the future of this.

I prefer this in a more general expression,
so IS_REACHABLE or the combination of two CONFIG options
will work.

  PTR_IF(IS_REACHABLE(CONFIG_FOO),  ...)

  PTR_IF( IS_ENABLED(CONFIG_FOO) && IS_ENABLED(CONFIG_BAR), ...)





>
> So, in case it is not obvious, I consider this patch unnecessary churn
> (as was probably the patch that introduced IF_ENABLED in the first
> place).
>
> As an aside, this should not have been added to the kbuild tree in
> linux-next until after -rc1 was released ...

Rather, I was considering sending a pull req before -rc1.

Otherwise, other drivers may start to use it.



>
> --
> Cheers,
> Stephen Rothwell



--
Best Regards
Masahiro Yamada
