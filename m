Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A18AA43414C
	for <lists+linux-mips@lfdr.de>; Wed, 20 Oct 2021 00:24:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229817AbhJSW0T (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 Oct 2021 18:26:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:42212 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229632AbhJSW0S (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 19 Oct 2021 18:26:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7673A60FDA;
        Tue, 19 Oct 2021 22:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634682245;
        bh=MnWoQVQ2JyZGLbQ15UMwC70ak3+mkXZWPOhHgYpY6V4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=GyBQOR+rltd+kgSCettTJMVhlwMnrnfmNPIChH6fmtumPnYUnAs59mUx4+hTq2nP4
         0HRzxqkbPh2I6FLsFD70opThQXQngSUqE6oH1Z3qkA57XTeSMfNpE990JtagGkHpCK
         jzixONAJVfoiYUqQ0C4YdSjEK5kaAQatl+bN37rr0Z7DqI5J5vceTWbpxdp6yq9rhb
         aAgYCb1g+MFa3e8so5JwnmWhd5Lo1KL7HEPwE4q9Z8XTzybzGywTpf6LAGhqlNje0O
         Sc9Qwwm48LfTfT6y1Bmou1ot+f6fnkwD5snL+L2dbYMVS3ZqTyxjH8yxVPbFHd+Pde
         HkeTYniPGgv7A==
Received: by mail-ed1-f42.google.com with SMTP id y12so20511883eda.4;
        Tue, 19 Oct 2021 15:24:05 -0700 (PDT)
X-Gm-Message-State: AOAM5334U6Ow2iRYVv6oFbw3sfOa2cyyMjDtqEzLA5Za3t1GCL0cMfqF
        zjHtxN9FDrJdchnuhiIU64KqdvU3BkrsP8yCCg==
X-Google-Smtp-Source: ABdhPJzbdHa3t+aQakxf8cVFAM0Vd3iXBqYEWUCpX0L3/NyEeN5SmxaiFvTKurE6FRSPRlVm700peFXIM+Krf4JmIls=
X-Received: by 2002:a17:907:7d8b:: with SMTP id oz11mr41803746ejc.84.1634682243846;
 Tue, 19 Oct 2021 15:24:03 -0700 (PDT)
MIME-Version: 1.0
References: <20211009022023.3796472-1-f.fainelli@gmail.com>
 <20211009022023.3796472-10-f.fainelli@gmail.com> <871r4gvggb.wl-maz@kernel.org>
In-Reply-To: <871r4gvggb.wl-maz@kernel.org>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 19 Oct 2021 17:23:52 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+CWeFHsHHaAwbb940Zk1thU50gDGcqfO6NdgWQ2FPTWA@mail.gmail.com>
Message-ID: <CAL_Jsq+CWeFHsHHaAwbb940Zk1thU50gDGcqfO6NdgWQ2FPTWA@mail.gmail.com>
Subject: Re: [PATCH v4 09/14] irqchip: Provide platform_device to of_irq_init_cb_t
To:     Marc Zyngier <maz@kernel.org>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        "maintainer:BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." 
        <bcm-kernel-feedback-list@broadcom.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Frank Rowand <frowand.list@gmail.com>,
        "moderated list:ARM SUB-ARCHITECTURES" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

 On Tue, Oct 19, 2021 at 4:43 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On Sat, 09 Oct 2021 03:20:18 +0100,
> Florian Fainelli <f.fainelli@gmail.com> wrote:
> >
> > Provide the platform device mapping to the interrupt controller node to
> > the of_irq_init_cb_t callback such that drivers can make use of it.
> >
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> > ---
> >  drivers/irqchip/irqchip.c  | 2 +-
> >  drivers/irqchip/qcom-pdc.c | 3 ++-
> >  drivers/of/irq.c           | 2 +-
> >  include/linux/of_irq.h     | 5 ++++-
> >  4 files changed, 8 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/irqchip/irqchip.c b/drivers/irqchip/irqchip.c
> > index 3570f0a588c4..289784eefd00 100644
> > --- a/drivers/irqchip/irqchip.c
> > +++ b/drivers/irqchip/irqchip.c
> > @@ -55,6 +55,6 @@ int platform_irqchip_probe(struct platform_device *pd=
ev)
> >       if (par_np && !irq_find_matching_host(par_np, DOMAIN_BUS_ANY))
> >               return -EPROBE_DEFER;
> >
> > -     return irq_init_cb(np, par_np);
> > +     return irq_init_cb(np, par_np, pdev);
> >  }
> >  EXPORT_SYMBOL_GPL(platform_irqchip_probe);
> > diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
> > index 173e6520e06e..819a93360b96 100644
> > --- a/drivers/irqchip/qcom-pdc.c
> > +++ b/drivers/irqchip/qcom-pdc.c
> > @@ -359,7 +359,8 @@ static int pdc_setup_pin_mapping(struct device_node=
 *np)
> >       return 0;
> >  }
> >
> > -static int qcom_pdc_init(struct device_node *node, struct device_node =
*parent)
> > +static int qcom_pdc_init(struct device_node *node, struct device_node =
*parent,
> > +                      struct platform_device *pdev)
> >  {
> >       struct irq_domain *parent_domain, *pdc_domain, *pdc_gpio_domain;
> >       int ret;
> > diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> > index 352e14b007e7..18f3f5c00c87 100644
> > --- a/drivers/of/irq.c
> > +++ b/drivers/of/irq.c
> > @@ -538,7 +538,7 @@ void __init of_irq_init(const struct of_device_id *=
matches)
> >                                desc->dev,
> >                                desc->dev, desc->interrupt_parent);
> >                       ret =3D desc->irq_init_cb(desc->dev,
> > -                                             desc->interrupt_parent);
> > +                                             desc->interrupt_parent, N=
ULL);
> >                       if (ret) {
> >                               of_node_clear_flag(desc->dev, OF_POPULATE=
D);
> >                               kfree(desc);
> > diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
> > index aaf219bd0354..89acc8b089f0 100644
> > --- a/include/linux/of_irq.h
> > +++ b/include/linux/of_irq.h
> > @@ -9,7 +9,10 @@
> >  #include <linux/ioport.h>
> >  #include <linux/of.h>
> >
> > -typedef int (*of_irq_init_cb_t)(struct device_node *, struct device_no=
de *);
> > +struct platform_device;
> > +
> > +typedef int (*of_irq_init_cb_t)(struct device_node *, struct device_no=
de *,
> > +                             struct platform_device *);
>
> Having added some type-checking to the IRQCHIP_MATCH() #definery, I
> end-up with warnings such as:
>
> In file included from ./include/linux/kernel.h:16,
>                  from drivers/irqchip/irq-bcm7038-l1.c:12:
> ./include/linux/minmax.h:20:28: warning: comparison of distinct pointer t=
ypes lacks a cast
>    20 |  (!!(sizeof((typeof(x) *)1 =3D=3D (typeof(y) *)1)))
>       |                            ^~
> ./include/linux/irqchip.h:41:2: note: in expansion of macro =E2=80=98__ty=
pecheck=E2=80=99
>    41 |  __typecheck(typecheck_irq_init_cb, fn) ? fn : fn
>       |  ^~~~~~~~~~~
> ./include/linux/irqchip.h:44:12: note: in expansion of macro =E2=80=98typ=
echeck_irq_init_cb=E2=80=99
>    44 |    .data =3D typecheck_irq_init_cb(fn), },
>       |            ^~~~~~~~~~~~~~~~~~~~~
> drivers/irqchip/irq-bcm7038-l1.c:459:1: note: in expansion of macro =E2=
=80=98IRQCHIP_MATCH=E2=80=99
>   459 | IRQCHIP_MATCH("brcm,bcm7038-l1-intc", bcm7038_l1_of_init)
>       | ^~~~~~~~~~~~~
>
> Clearly, you didn't update the drivers you just converted to
> IRQCHIP_MATCH(), and only fixed the QC driver.
>
> FWIW, I'm planning to take something like the hack below into the tree
> to detect this sort of stuff early.
>
>         M.
>
> diff --git a/include/linux/irqchip.h b/include/linux/irqchip.h
> index ccf32758ea85..146a9d80a6a2 100644
> --- a/include/linux/irqchip.h
> +++ b/include/linux/irqchip.h
> @@ -33,7 +33,15 @@ extern int platform_irqchip_probe(struct platform_devi=
ce *pdev);
>  #define IRQCHIP_PLATFORM_DRIVER_BEGIN(drv_name) \
>  static const struct of_device_id drv_name##_irqchip_match_table[] =3D {
>
> -#define IRQCHIP_MATCH(compat, fn) { .compatible =3D compat, .data =3D fn=
 },
> +/* Undefined on purpose */
> +int typecheck_irq_init_cb(struct device_node *, struct device_node *,
> +                         struct platform_device *);
> +
> +#define typecheck_irq_init_cb(fn)                                      \
> +       __typecheck(typecheck_irq_init_cb, fn) ? fn : fn

That's nice! Shouldn't it also be used for IRQCHIP_DECLARE?

> +#define IRQCHIP_MATCH(compat, fn) { .compatible =3D compat,      \
> +                       .data =3D typecheck_irq_init_cb(fn), },

I was going to say I wasn't really a fan of IRQCHIP_MATCH given it had
nothing irqchip specific about it, but you fixed that now...

>
>  #define IRQCHIP_PLATFORM_DRIVER_END(drv_name)                          \
>         {},                                                             \
>
> --
> Without deviation from the norm, progress is not possible.
