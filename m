Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28B5E3168FF
	for <lists+linux-mips@lfdr.de>; Wed, 10 Feb 2021 15:22:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229465AbhBJOV5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Feb 2021 09:21:57 -0500
Received: from mail-ot1-f44.google.com ([209.85.210.44]:39424 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230328AbhBJOV4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Feb 2021 09:21:56 -0500
Received: by mail-ot1-f44.google.com with SMTP id d7so1896961otq.6;
        Wed, 10 Feb 2021 06:21:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QWv25sZTzfQsa6EKZRYZsW4Xzm4uyOUtOgHrp6KoZsw=;
        b=ooalySMRcwom6fuadO+5m2/ehhVisTMnZ7MCYkhU/o0EK1rrYcavF4A7ZslOoTt1mC
         h2bUDTBU1oyak2bNPmVSqNEYFX/gv73znAA6ok6UNFduxCB1Mcay58F55yj6WVr9biTQ
         0RiqWaGLmFcpprsgEyl77cQrJcQ+gBwegczNk4BQHxP/29EtJHRUeO4MbKPrZvWZtTFt
         coSVb82uogkGDY36RKxPCg4y1AnLvm3dsdEj+JklRMdu/LWloYujvygjWY8wfbWuMR1k
         fAg1okWOCbl4PNNMByzDhgHs3xnXosNJXo+aoiLQFihAaRK/loJbS35x8iugNo2DEwF1
         e6Vg==
X-Gm-Message-State: AOAM531F5iGzYAbWQrx567osCbuuCwN3zWugqqmPh06Fezv5WjWGG52U
        TdTKAIXw0ZWsVOedEXYvUq1Z/5rUDDdj4CiS2RI=
X-Google-Smtp-Source: ABdhPJyHmgLG/wJNJM+uoRRAPNtNaZj+QytW6s4cvQKIGCjtm/DCckSOggT59JBOjwi2k9kpLrwL4qRlWYNL6TEuW38=
X-Received: by 2002:a9d:77d6:: with SMTP id w22mr2245205otl.145.1612966875162;
 Wed, 10 Feb 2021 06:21:15 -0800 (PST)
MIME-Version: 1.0
References: <20210210132751.1422386-1-geert+renesas@glider.be>
 <87mtwcujd0.fsf@microchip.com> <CAMuHMdVpHUmwfob6t_aWvaVVHpSDpF5HvLe_W5+KY9ky5A-qEw@mail.gmail.com>
 <20210210141728.GO351084@piout.net>
In-Reply-To: <20210210141728.GO351084@piout.net>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 10 Feb 2021 15:21:04 +0100
Message-ID: <CAMuHMdXWVYB0vZ9Q3G9jGAv3J8nDReKzgSmDj4ykny6rH1cKGw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: PINCTRL_MICROCHIP_SGPIO should depend on
 ARCH_SPARX5 || SOC_VCOREIII
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Lars Povlsen <lars.povlsen@microchip.com>,
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

Hi Alexandre,

On Wed, Feb 10, 2021 at 3:17 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> On 10/02/2021 14:53:01+0100, Geert Uytterhoeven wrote:
> > On Wed, Feb 10, 2021 at 2:45 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:
> > > Geert Uytterhoeven writes:
> > > > the Microsemi/Microchip Serial GPIO device is present only Microsemi
> > > > VCore III and Microchip Sparx5 SoCs.  Hence add a dependency on
> > > > ARCH_SPARX5 || SOC_VCOREIII, to prevent asking the user about this
> > > > driver when configuring a kernel without support for these SoCs.
> > > >
> > > > Fixes: 7e5ea974e61c8dd0 ("pinctrl: pinctrl-microchip-sgpio: Add pinctrl driver for Microsemi Serial GPIO")
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > ---
> > > >  drivers/pinctrl/Kconfig | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> > > > index 113073d5f89bbf70..3b75b1d7d3d1f1b0 100644
> > > > --- a/drivers/pinctrl/Kconfig
> > > > +++ b/drivers/pinctrl/Kconfig
> > > > @@ -353,8 +353,8 @@ config PINCTRL_OCELOT
> > > >
> > > >  config PINCTRL_MICROCHIP_SGPIO
> > > >         bool "Pinctrl driver for Microsemi/Microchip Serial GPIO"
> > > > -       depends on OF
> > > > -       depends on HAS_IOMEM
> > > > +       depends on OF && HAS_IOMEM
> > > > +       depends on ARCH_SPARX5 || SOC_VCOREIII || COMPILE_TEST
> > > >         select GPIOLIB
> > > >         select GPIOLIB_IRQCHIP
> > > >         select GENERIC_PINCONF
> > >
> > > Thank you for your patch. Unfortunately, it makes it impossible to use
> > > the driver across PCIe - which is a specifically desired configuration.
> > >
> > > Could you add CONFIG_PCI to the || chain?
> >
> > Sure.
> >
> > Is PCIe the only other transport over which the register can be accessed?
> > Or can this also be done over e.g. SPI, like on Ocelot[1]?
> >
> > [1] https://lore.kernel.org/linux-gpio/20200511145329.GV34497@piout.net/
> >
>
> Yes, this driver IP is also available on Ocelot (this is SOC_VCOREIII)
> so this is also available over SPI.

Hence would you consider

    depends on ARCH_SPARX5 || SOC_VCOREIII || PCI || SPI || COMPILE_TEST

acceptable?  Or would that be futile, as must systems have PCI and/or
SPI enabled anyway?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
