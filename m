Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A239C316857
	for <lists+linux-mips@lfdr.de>; Wed, 10 Feb 2021 14:54:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229706AbhBJNx6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Feb 2021 08:53:58 -0500
Received: from mail-oi1-f175.google.com ([209.85.167.175]:33565 "EHLO
        mail-oi1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbhBJNxy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Feb 2021 08:53:54 -0500
Received: by mail-oi1-f175.google.com with SMTP id g84so2079407oib.0;
        Wed, 10 Feb 2021 05:53:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MFikpXfhNdl/eEzw3oQhEBfIDumYf2JlVlOqmQDedOI=;
        b=Ognr5ljrmxUK7qbMTcFvter/n1ysZLlKlDbvTbdAlfrUgO1ykMuYvBf/iTgVymb4lH
         /tQhwXchzdS7DrL+GuxtMlJUMTHXt/wCGUQ/E8j9IY++fIqVMmhye/UsMt/boidDYWk/
         G0X5sw4Vr02W548SSX6pipT4w68a9Yk+NgwsPoNN0WhNfaHkaW3kQhBTWIoaQ9/XCxHI
         jgr9V72iT0CTJYN9AGORu6o5wmM2RPbzDFqf2Z3jiarW4RrPiSNwXdMwWEFH7GkWbkMz
         oNcA0L5o0veErYfLFSf10vfE1OwLFHP0EUQL3ZfqQK9LudtK5FMT1LSWg/oSHqy2kEUx
         64Sw==
X-Gm-Message-State: AOAM530HN5m7TJOSdNWMWC1quz0I6RNFP62FtEbNyt1Ok5ESBnPvYvRT
        eUn7713m21PEnTk5gc/3XmTyetsNXJ1bFYXRAyoK5RVIf5E=
X-Google-Smtp-Source: ABdhPJwgsM3k99jHtl8LWwiECKTK5AVq9Jm35syK4gPBHb1a8creoTJSnEuLotWNjQdpB470ixXnRbQtCmpaLYsG5dU=
X-Received: by 2002:a54:4e88:: with SMTP id c8mr2058595oiy.148.1612965192777;
 Wed, 10 Feb 2021 05:53:12 -0800 (PST)
MIME-Version: 1.0
References: <20210210132751.1422386-1-geert+renesas@glider.be> <87mtwcujd0.fsf@microchip.com>
In-Reply-To: <87mtwcujd0.fsf@microchip.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 10 Feb 2021 14:53:01 +0100
Message-ID: <CAMuHMdVpHUmwfob6t_aWvaVVHpSDpF5HvLe_W5+KY9ky5A-qEw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: PINCTRL_MICROCHIP_SGPIO should depend on
 ARCH_SPARX5 || SOC_VCOREIII
To:     Lars Povlsen <lars.povlsen@microchip.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
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

On Wed, Feb 10, 2021 at 2:45 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:
> Geert Uytterhoeven writes:
> > the Microsemi/Microchip Serial GPIO device is present only Microsemi
> > VCore III and Microchip Sparx5 SoCs.  Hence add a dependency on
> > ARCH_SPARX5 || SOC_VCOREIII, to prevent asking the user about this
> > driver when configuring a kernel without support for these SoCs.
> >
> > Fixes: 7e5ea974e61c8dd0 ("pinctrl: pinctrl-microchip-sgpio: Add pinctrl driver for Microsemi Serial GPIO")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  drivers/pinctrl/Kconfig | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> > index 113073d5f89bbf70..3b75b1d7d3d1f1b0 100644
> > --- a/drivers/pinctrl/Kconfig
> > +++ b/drivers/pinctrl/Kconfig
> > @@ -353,8 +353,8 @@ config PINCTRL_OCELOT
> >
> >  config PINCTRL_MICROCHIP_SGPIO
> >         bool "Pinctrl driver for Microsemi/Microchip Serial GPIO"
> > -       depends on OF
> > -       depends on HAS_IOMEM
> > +       depends on OF && HAS_IOMEM
> > +       depends on ARCH_SPARX5 || SOC_VCOREIII || COMPILE_TEST
> >         select GPIOLIB
> >         select GPIOLIB_IRQCHIP
> >         select GENERIC_PINCONF
>
> Thank you for your patch. Unfortunately, it makes it impossible to use
> the driver across PCIe - which is a specifically desired configuration.
>
> Could you add CONFIG_PCI to the || chain?

Sure.

Is PCIe the only other transport over which the register can be accessed?
Or can this also be done over e.g. SPI, like on Ocelot[1]?

[1] https://lore.kernel.org/linux-gpio/20200511145329.GV34497@piout.net/

Thanks!

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
