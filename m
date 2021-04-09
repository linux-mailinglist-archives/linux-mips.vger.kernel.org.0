Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A92F23597DF
	for <lists+linux-mips@lfdr.de>; Fri,  9 Apr 2021 10:31:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231756AbhDIIbX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 9 Apr 2021 04:31:23 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:27236 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229696AbhDIIbW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 9 Apr 2021 04:31:22 -0400
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 1398UoLo028916;
        Fri, 9 Apr 2021 17:30:50 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 1398UoLo028916
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1617957050;
        bh=4DPbQPolecYqkeipjN6IbicIpzKHyxoMtxzkJQlAg60=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=RN8d0n4JT0CbY1XvacP2Pz5w6wYfOsaPLG0sQEFj0mWn1ScSj9Pdm3Fts7qKd7iZN
         XuEufEBsANEa+OOifZ8lfRiifwxzVIZKTkmS8PClqVmnjW2/sA0kyhIrg15r3MZL+u
         ePeuzUlv8iMyxClAjrqR4SX3XexWoJ840lOIpiVUiklewz+wnL77mmrmNUqn3Fytr8
         RSOGgOIV5IaCFtyiC/Fxb58nJSykOFjqoEtS3b1RUvhpiQJSTznaKagUMK0I/1ytT+
         6hHAI1vtLu/3EP0vfMSRRpnIIQQKi5tyLOy3AOGcUg2UPYnZmhLNp+m8s/ed5a+gmW
         xwKkdTQTwgIKA==
X-Nifty-SrcIP: [209.85.214.181]
Received: by mail-pl1-f181.google.com with SMTP id g10so2382430plt.8;
        Fri, 09 Apr 2021 01:30:50 -0700 (PDT)
X-Gm-Message-State: AOAM533+RYVVoZ6onFvbpLLZPP1Uh9ihA86ltmps7++6zYwqptcdCqZo
        n5LcRv8jWrdepgi3VpsoM4ZfdUz3zHYnQtPxh4Q=
X-Google-Smtp-Source: ABdhPJzIwGaozIcdxNHN9CwdcUDqmLwmGw01l6ZjPQcbr8YMvuRLXUuw3qdNSOb1NufrTEdNtan6cQJejtOtx0xdBb8=
X-Received: by 2002:a17:90a:f68a:: with SMTP id cl10mr12726688pjb.87.1617957049393;
 Fri, 09 Apr 2021 01:30:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210408205858.51751-1-masahiroy@kernel.org> <20210408205858.51751-2-masahiroy@kernel.org>
 <YXEARQ.LGKNU44HTZP01@crapouillou.net>
In-Reply-To: <YXEARQ.LGKNU44HTZP01@crapouillou.net>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 9 Apr 2021 17:30:12 +0900
X-Gmail-Original-Message-ID: <CAK7LNATzaKiUewn-ixnDEAWbfQUy8xZL4yjkR1BxrhV3G1=Zng@mail.gmail.com>
Message-ID: <CAK7LNATzaKiUewn-ixnDEAWbfQUy8xZL4yjkR1BxrhV3G1=Zng@mail.gmail.com>
Subject: Re: [PATCH 1/2] linux/kconfig.h: replace IF_ENABLED() with PTR_IF()
 in <linux/kernel.h>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Apr 9, 2021 at 5:15 PM Paul Cercueil <paul@crapouillou.net> wrote:
>
> Hi Masahiro,
>
> Le ven. 9 avril 2021 =C3=A0 5:58, Masahiro Yamada <masahiroy@kernel.org> =
a
> =C3=A9crit :
> > <linux/kconfig.h> is included from all the kernel-space source files,
> > including C, assembly, linker scripts. It is intended to contain
> > minimal
> > set of macros to evaluate CONFIG options.
> >
> > IF_ENABLED() is an intruder here because (x ? y : z) is C code, which
> > should not be included from assembly files or linker scripts.
> >
> > Also, <linux/kconfig.h> is no longer self-contained because NULL is
> > defined in <linux/stddef.h>.
> >
> > Move IF_ENABLED() out to <linux/kernel.h> as PTR_IF().
> >
> > PTR_IF(IS_ENABLED(CONFIG_FOO), ...) is slightly longer than
> > IF_ENABLED(CONFIG_FOO, ...), but it is not a big deal because
> > sub-systems often define dedicated macros such as of_match_ptr(),
> > pm_ptr() etc. for common use-cases.
>
> What's the idea behind changing IF_ENABLED() to PTR_IF()? You didn't
> explain that. What's wrong with IF_ENABLED()?


PTR_IF() is a more generalized variant, which I believe is
a better fit in <linux/kernel.h>
The first parameter does not need to be a CONFIG option,
but any expression.







> Cheers,
> -Paul
>
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  drivers/pinctrl/pinctrl-ingenic.c | 20 ++++++++++----------
> >  include/linux/kconfig.h           |  6 ------
> >  include/linux/kernel.h            |  2 ++
> >  3 files changed, 12 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/pinctrl/pinctrl-ingenic.c
> > b/drivers/pinctrl/pinctrl-ingenic.c
> > index f2746125b077..b21e2ae4528d 100644
> > --- a/drivers/pinctrl/pinctrl-ingenic.c
> > +++ b/drivers/pinctrl/pinctrl-ingenic.c
> > @@ -2496,43 +2496,43 @@ static int __init
> > ingenic_pinctrl_probe(struct platform_device *pdev)
> >  static const struct of_device_id ingenic_pinctrl_of_match[] =3D {
> >       {
> >               .compatible =3D "ingenic,jz4740-pinctrl",
> > -             .data =3D IF_ENABLED(CONFIG_MACH_JZ4740, &jz4740_chip_inf=
o)
> > +             .data =3D PTR_IF(IS_ENABLED(CONFIG_MACH_JZ4740), &jz4740_=
chip_info)
> >       },
> >       {
> >               .compatible =3D "ingenic,jz4725b-pinctrl",
> > -             .data =3D IF_ENABLED(CONFIG_MACH_JZ4725B, &jz4725b_chip_i=
nfo)
> > +             .data =3D PTR_IF(IS_ENABLED(CONFIG_MACH_JZ4725B), &jz4725=
b_chip_info)
> >       },
> >       {
> >               .compatible =3D "ingenic,jz4760-pinctrl",
> > -             .data =3D IF_ENABLED(CONFIG_MACH_JZ4760, &jz4760_chip_inf=
o)
> > +             .data =3D PTR_IF(IS_ENABLED(CONFIG_MACH_JZ4760), &jz4760_=
chip_info)
> >       },
> >       {
> >               .compatible =3D "ingenic,jz4760b-pinctrl",
> > -             .data =3D IF_ENABLED(CONFIG_MACH_JZ4760, &jz4760_chip_inf=
o)
> > +             .data =3D PTR_IF(IS_ENABLED(CONFIG_MACH_JZ4760), &jz4760_=
chip_info)
> >       },
> >       {
> >               .compatible =3D "ingenic,jz4770-pinctrl",
> > -             .data =3D IF_ENABLED(CONFIG_MACH_JZ4770, &jz4770_chip_inf=
o)
> > +             .data =3D PTR_IF(IS_ENABLED(CONFIG_MACH_JZ4770), &jz4770_=
chip_info)
> >       },
> >       {
> >               .compatible =3D "ingenic,jz4780-pinctrl",
> > -             .data =3D IF_ENABLED(CONFIG_MACH_JZ4780, &jz4780_chip_inf=
o)
> > +             .data =3D PTR_IF(IS_ENABLED(CONFIG_MACH_JZ4780), &jz4780_=
chip_info)
> >       },
> >       {
> >               .compatible =3D "ingenic,x1000-pinctrl",
> > -             .data =3D IF_ENABLED(CONFIG_MACH_X1000, &x1000_chip_info)
> > +             .data =3D PTR_IF(IS_ENABLED(CONFIG_MACH_X1000), &x1000_ch=
ip_info)
> >       },
> >       {
> >               .compatible =3D "ingenic,x1000e-pinctrl",
> > -             .data =3D IF_ENABLED(CONFIG_MACH_X1000, &x1000_chip_info)
> > +             .data =3D PTR_IF(IS_ENABLED(CONFIG_MACH_X1000), &x1000_ch=
ip_info)
> >       },
> >       {
> >               .compatible =3D "ingenic,x1500-pinctrl",
> > -             .data =3D IF_ENABLED(CONFIG_MACH_X1500, &x1500_chip_info)
> > +             .data =3D PTR_IF(IS_ENABLED(CONFIG_MACH_X1500), &x1500_ch=
ip_info)
> >       },
> >       {
> >               .compatible =3D "ingenic,x1830-pinctrl",
> > -             .data =3D IF_ENABLED(CONFIG_MACH_X1830, &x1830_chip_info)
> > +             .data =3D PTR_IF(IS_ENABLED(CONFIG_MACH_X1830), &x1830_ch=
ip_info)
> >       },
> >       { /* sentinel */ },
> >  };
> > diff --git a/include/linux/kconfig.h b/include/linux/kconfig.h
> > index 24a59cb06963..cc8fa109cfa3 100644
> > --- a/include/linux/kconfig.h
> > +++ b/include/linux/kconfig.h
> > @@ -70,10 +70,4 @@
> >   */
> >  #define IS_ENABLED(option) __or(IS_BUILTIN(option),
> > IS_MODULE(option))
> >
> > -/*
> > - * IF_ENABLED(CONFIG_FOO, ptr) evaluates to (ptr) if CONFIG_FOO is
> > set to 'y'
> > - * or 'm', NULL otherwise.
> > - */
> > -#define IF_ENABLED(option, ptr) (IS_ENABLED(option) ? (ptr) : NULL)
> > -
> >  #endif /* __LINUX_KCONFIG_H */
> > diff --git a/include/linux/kernel.h b/include/linux/kernel.h
> > index 5b7ed6dc99ac..8685ca4cf287 100644
> > --- a/include/linux/kernel.h
> > +++ b/include/linux/kernel.h
> > @@ -38,6 +38,8 @@
> >  #define PTR_ALIGN_DOWN(p, a) ((typeof(p))ALIGN_DOWN((unsigned
> > long)(p), (a)))
> >  #define IS_ALIGNED(x, a)             (((x) & ((typeof(x))(a) - 1)) =3D=
=3D 0)
> >
> > +#define PTR_IF(cond, ptr)    ((cond) ? (ptr) : NULL)
> > +
> >  /* generic data direction definitions */
> >  #define READ                 0
> >  #define WRITE                        1
> > --
> > 2.27.0
> >
>
>


--=20
Best Regards
Masahiro Yamada
