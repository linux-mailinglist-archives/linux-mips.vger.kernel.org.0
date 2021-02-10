Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC3BD3168F1
	for <lists+linux-mips@lfdr.de>; Wed, 10 Feb 2021 15:18:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230331AbhBJOST (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Feb 2021 09:18:19 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:58681 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbhBJOSQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Feb 2021 09:18:16 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 399F660019;
        Wed, 10 Feb 2021 14:17:29 +0000 (UTC)
Date:   Wed, 10 Feb 2021 15:17:28 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Lars Povlsen <lars.povlsen@microchip.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] pinctrl: PINCTRL_MICROCHIP_SGPIO should depend on
 ARCH_SPARX5 || SOC_VCOREIII
Message-ID: <20210210141728.GO351084@piout.net>
References: <20210210132751.1422386-1-geert+renesas@glider.be>
 <87mtwcujd0.fsf@microchip.com>
 <CAMuHMdVpHUmwfob6t_aWvaVVHpSDpF5HvLe_W5+KY9ky5A-qEw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVpHUmwfob6t_aWvaVVHpSDpF5HvLe_W5+KY9ky5A-qEw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/02/2021 14:53:01+0100, Geert Uytterhoeven wrote:
> Hi Lars,
> 
> On Wed, Feb 10, 2021 at 2:45 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:
> > Geert Uytterhoeven writes:
> > > the Microsemi/Microchip Serial GPIO device is present only Microsemi
> > > VCore III and Microchip Sparx5 SoCs.  Hence add a dependency on
> > > ARCH_SPARX5 || SOC_VCOREIII, to prevent asking the user about this
> > > driver when configuring a kernel without support for these SoCs.
> > >
> > > Fixes: 7e5ea974e61c8dd0 ("pinctrl: pinctrl-microchip-sgpio: Add pinctrl driver for Microsemi Serial GPIO")
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > >  drivers/pinctrl/Kconfig | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> > > index 113073d5f89bbf70..3b75b1d7d3d1f1b0 100644
> > > --- a/drivers/pinctrl/Kconfig
> > > +++ b/drivers/pinctrl/Kconfig
> > > @@ -353,8 +353,8 @@ config PINCTRL_OCELOT
> > >
> > >  config PINCTRL_MICROCHIP_SGPIO
> > >         bool "Pinctrl driver for Microsemi/Microchip Serial GPIO"
> > > -       depends on OF
> > > -       depends on HAS_IOMEM
> > > +       depends on OF && HAS_IOMEM
> > > +       depends on ARCH_SPARX5 || SOC_VCOREIII || COMPILE_TEST
> > >         select GPIOLIB
> > >         select GPIOLIB_IRQCHIP
> > >         select GENERIC_PINCONF
> >
> > Thank you for your patch. Unfortunately, it makes it impossible to use
> > the driver across PCIe - which is a specifically desired configuration.
> >
> > Could you add CONFIG_PCI to the || chain?
> 
> Sure.
> 
> Is PCIe the only other transport over which the register can be accessed?
> Or can this also be done over e.g. SPI, like on Ocelot[1]?
> 
> [1] https://lore.kernel.org/linux-gpio/20200511145329.GV34497@piout.net/
> 

Yes, this driver IP is also available on Ocelot (this is SOC_VCOREIII)
so this is also available over SPI.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
