Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07CE21CDCF7
	for <lists+linux-mips@lfdr.de>; Mon, 11 May 2020 16:20:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728000AbgEKOUm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 11 May 2020 10:20:42 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:50023 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729548AbgEKOUl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 11 May 2020 10:20:41 -0400
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 875BF200002;
        Mon, 11 May 2020 14:20:38 +0000 (UTC)
Date:   Mon, 11 May 2020 16:20:38 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Lars Povlsen <lars.povlsen@microchip.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] pinctrl: ocelot: Add platform dependency
Message-ID: <20200511142038.GP34497@piout.net>
References: <20200507114015.24461-1-geert+renesas@glider.be>
 <20200507114525.GE34497@piout.net>
 <87ftccorqd.fsf@soft-dev15.microsemi.net>
 <20200507124419.GG34497@piout.net>
 <CAMuHMdUodZQ--jHT1atL1Cmfq7kqu9c=48LXx5o0PagHVNj+RA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUodZQ--jHT1atL1Cmfq7kqu9c=48LXx5o0PagHVNj+RA@mail.gmail.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 11/05/2020 13:39:42+0200, Geert Uytterhoeven wrote:
> Hi Alexandre,
> 
> On Thu, May 7, 2020 at 2:47 PM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> > On 07/05/2020 14:27:06+0200, Lars Povlsen wrote:
> > > Alexandre Belloni writes:
> > > > On 07/05/2020 13:40:15+0200, Geert Uytterhoeven wrote:
> > > >> The Microsemi Ocelot pin controller is only present on Microsemi Ocelot
> > > >> and Jaguar2 SoCs.  Add a platform dependency to the PINCTRL_OCELOT
> > > >> config symbol, to avoid asking the user about it when configuring a
> > > >> kernel without Ocelot or Jaguar2 support.
> > > >>
> > > >
> > > > I have to NAK here because there are upcoming (hopefully this cycle)
> > > > SoCs using this driver.
> > >
> > > Not only because of that, but also an arbitrary system connecting to
> > > ocelot by PCI could be using the driver.
> >
> > Right, and that was why I removed the dependency when adding jaguar2
> 
> That is far from obvious from the description of commit da801ab56ad87489
> ("pinctrl: ocelot: add MSCC Jaguar2 support")....
> BTW, probably PINCTRL_OCELOT should have got "default y if MSCC_OCELOT",
> to avoid breaking old configs?
> 
> > support I never booted the mips core of jaguar2, I used it using PCIe.
> 
> Ah, you're using it as a PCIe endpoint. So what about ...
> 
> > > >> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > >> ---
> > > >>  drivers/pinctrl/Kconfig | 4 ++--
> > > >>  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >>
> > > >> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> > > >> index f0ce4ce3e0f52456..bed67c08a0892240 100644
> > > >> --- a/drivers/pinctrl/Kconfig
> > > >> +++ b/drivers/pinctrl/Kconfig
> > > >> @@ -394,8 +394,8 @@ config PINCTRL_RK805
> > > >>
> > > >>  config PINCTRL_OCELOT
> > > >>       bool "Pinctrl driver for the Microsemi Ocelot and Jaguar2 SoCs"
> > > >> -     depends on OF
> > > >> -     depends on HAS_IOMEM
> > > >> +     depends on OF && HAS_IOMEM
> > > >> +     depends on MSCC_OCELOT || COMPILE_TEST
> 
> ... "depends on MSCC_OCELOT || PCI || COMPILE_TEST" instead?
> 
> If other SoCs gain support, the dependency list can be extended.
> 

Hum ok, note that it can also be connected as a SPI slave but I think
this is a bit far fetched currently.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
