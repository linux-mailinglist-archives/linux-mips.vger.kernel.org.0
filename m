Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61EA9316924
	for <lists+linux-mips@lfdr.de>; Wed, 10 Feb 2021 15:30:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230522AbhBJO3L (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Feb 2021 09:29:11 -0500
Received: from mail-ot1-f53.google.com ([209.85.210.53]:38035 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230148AbhBJO3J (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Feb 2021 09:29:09 -0500
Received: by mail-ot1-f53.google.com with SMTP id e4so1923083ote.5;
        Wed, 10 Feb 2021 06:28:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l+FMKdogybytiCkMrs3l9jkw+j5EvHY3xnJ8wJxtfsE=;
        b=b0TIuSGX/Y28NkSTN6ZSqdqYa/Jn5ZSGEr/7itUBx9Kat0J+nALZoVlELKXQ6bYmT/
         WS3YpHkIatPWHs5C/FEySum0c4MtpAfbMKQwyMcuV/fY7y6HNE9HhI/bdmOWNZ098K/s
         dVIieRNBoiM5wMHFiiF8O9RhQlUIhALb/5yrLe69hWiDm3RyQk2XObVN7g62aLsvvJzw
         xVFDIufgdLxIwbr53q1/r56yisW/1SRWPxZnunF3nJSC/c/hU9Twm2umA6qJDGKIPljL
         cgpHlt97YFiqq2UoOTGe++nDcsNusANdsSqNuwsGiCElDRbfX0k8GgzfUyBfrvCJtCCR
         X62A==
X-Gm-Message-State: AOAM533xLiPj0VfThSoBCW+GCC27WhcWYL86/EgJqGVEYCxa5Da48IgJ
        y17XsIyBIqJw1EEAFG+msiAHCB3kucepm3zh8Yg=
X-Google-Smtp-Source: ABdhPJzquSomxMniJa6eP9I0SPVtK32a5kfKd/MOw6b9YfTbTTGB3xUwoR5vPZbt8SkWeSvA+tIjct/2A1y6OcrQNPk=
X-Received: by 2002:a9d:77d6:: with SMTP id w22mr2271445otl.145.1612967307417;
 Wed, 10 Feb 2021 06:28:27 -0800 (PST)
MIME-Version: 1.0
References: <20210210132751.1422386-1-geert+renesas@glider.be>
 <87mtwcujd0.fsf@microchip.com> <CAMuHMdVpHUmwfob6t_aWvaVVHpSDpF5HvLe_W5+KY9ky5A-qEw@mail.gmail.com>
 <20210210141728.GO351084@piout.net> <CAMuHMdXWVYB0vZ9Q3G9jGAv3J8nDReKzgSmDj4ykny6rH1cKGw@mail.gmail.com>
 <87lfbwuhk3.fsf@microchip.com>
In-Reply-To: <87lfbwuhk3.fsf@microchip.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 10 Feb 2021 15:28:16 +0100
Message-ID: <CAMuHMdXVob60P+RXv3i-2-h6FRksSsfgc+2vmX1PfXtCZh26-g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: PINCTRL_MICROCHIP_SGPIO should depend on
 ARCH_SPARX5 || SOC_VCOREIII
To:     Lars Povlsen <lars.povlsen@microchip.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Lars,

On Wed, Feb 10, 2021 at 3:24 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:
> Geert Uytterhoeven writes:
> > On Wed, Feb 10, 2021 at 3:17 PM Alexandre Belloni
> > <alexandre.belloni@bootlin.com> wrote:
> >> On 10/02/2021 14:53:01+0100, Geert Uytterhoeven wrote:
> >> > On Wed, Feb 10, 2021 at 2:45 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:
> >> > > Geert Uytterhoeven writes:
> >> > > > the Microsemi/Microchip Serial GPIO device is present only Microsemi
> >> > > > VCore III and Microchip Sparx5 SoCs.  Hence add a dependency on
> >> > > > ARCH_SPARX5 || SOC_VCOREIII, to prevent asking the user about this
> >> > > > driver when configuring a kernel without support for these SoCs.
> >> > > >
> >> > > > Fixes: 7e5ea974e61c8dd0 ("pinctrl: pinctrl-microchip-sgpio: Add pinctrl driver for Microsemi Serial GPIO")
> >> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >> > > > ---
> >> > > >  drivers/pinctrl/Kconfig | 4 ++--
> >> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> >> > > >
> >> > > > diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> >> > > > index 113073d5f89bbf70..3b75b1d7d3d1f1b0 100644
> >> > > > --- a/drivers/pinctrl/Kconfig
> >> > > > +++ b/drivers/pinctrl/Kconfig
> >> > > > @@ -353,8 +353,8 @@ config PINCTRL_OCELOT
> >> > > >
> >> > > >  config PINCTRL_MICROCHIP_SGPIO
> >> > > >         bool "Pinctrl driver for Microsemi/Microchip Serial GPIO"
> >> > > > -       depends on OF
> >> > > > -       depends on HAS_IOMEM
> >> > > > +       depends on OF && HAS_IOMEM
> >> > > > +       depends on ARCH_SPARX5 || SOC_VCOREIII || COMPILE_TEST
> >> > > >         select GPIOLIB
> >> > > >         select GPIOLIB_IRQCHIP
> >> > > >         select GENERIC_PINCONF
> >> > >
> >> > > Thank you for your patch. Unfortunately, it makes it impossible to use
> >> > > the driver across PCIe - which is a specifically desired configuration.
> >> > >
> >> > > Could you add CONFIG_PCI to the || chain?
> >> >
> >> > Sure.
> >> >
> >> > Is PCIe the only other transport over which the register can be accessed?
> >> > Or can this also be done over e.g. SPI, like on Ocelot[1]?
> >> >
> >> > [1] https://lore.kernel.org/linux-gpio/20200511145329.GV34497@piout.net/
> >> >
> >>
> >> Yes, this driver IP is also available on Ocelot (this is SOC_VCOREIII)
> >> so this is also available over SPI.
> >
> > Hence would you consider
> >
> >     depends on ARCH_SPARX5 || SOC_VCOREIII || PCI || SPI || COMPILE_TEST
> >
> > acceptable?  Or would that be futile, as must systems have PCI and/or
> > SPI enabled anyway?
> >
> > Gr{oetje,eeting}s,
> >
> >                         Geert
>
> Yes, that would be fine, but as you say - not have a lot of impact.
>
> Up to you...

OK, I'll drop this.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
