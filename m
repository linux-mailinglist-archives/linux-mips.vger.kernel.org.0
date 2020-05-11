Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EC021CDDA1
	for <lists+linux-mips@lfdr.de>; Mon, 11 May 2020 16:48:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730235AbgEKOsP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 11 May 2020 10:48:15 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:38399 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729463AbgEKOsP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 11 May 2020 10:48:15 -0400
Received: by mail-ot1-f67.google.com with SMTP id m33so7735471otc.5;
        Mon, 11 May 2020 07:48:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I53wtGF7ExqZO1oHW4EJMSb62A02nVxRDcsd0YPTnyc=;
        b=kgLf5jgAWg4xCyGxkkZgm97pW67dx4T86OZHc8HNR4hE5tygTZjpTRu8vpEHpJrlmj
         dALuOebKpj6vvWZ4DSTCD70VNdfc7+gMWAqtW6p6mwELuph+leShIGXSDx2s8gt641A2
         tEur7kI9VHBfdIIzaX3juFz7orQa6aHxcxuRf86MVCfANXp7+z59uP5GhOYnZoJb6qcb
         V7zIH/n2DfnQlhZ2nE1KrqI1ZCt0g9EDyGsI1g767TC00YVFPjqhi5gobIjNaYBnrDoS
         e1105Yl7UOqxteQ7nyE16TwF2Id4+T7EL4OV5qAss52MuVURlFuVN6Cl++q8mLkrqt3B
         6XfA==
X-Gm-Message-State: AGi0Pubak75SZw10xM9ulnNkKiD/ZuE8H8/ObZnUAjH4bpi8Hr4cI5wI
        MFFLCbC/s8R5xW/DjJc7wa3VFqwDafMrzlmeI74=
X-Google-Smtp-Source: APiQypLbQvBf4G4mmcjUqqj3mbQibbWN7tgqkKpqekEwxxTFfjivprjK40sBPUyaFKLdyuNtOMKc90iLyoRDV1UIVs4=
X-Received: by 2002:a9d:63da:: with SMTP id e26mr12131701otl.107.1589208493024;
 Mon, 11 May 2020 07:48:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200507114015.24461-1-geert+renesas@glider.be>
 <20200507114525.GE34497@piout.net> <87ftccorqd.fsf@soft-dev15.microsemi.net>
 <20200507124419.GG34497@piout.net> <CAMuHMdUodZQ--jHT1atL1Cmfq7kqu9c=48LXx5o0PagHVNj+RA@mail.gmail.com>
 <20200511142038.GP34497@piout.net>
In-Reply-To: <20200511142038.GP34497@piout.net>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 11 May 2020 16:48:01 +0200
Message-ID: <CAMuHMdXZMeY_Oz5fruxhfmS=6Tro0C3P+RoGiRZHpmACFrYXLg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: ocelot: Add platform dependency
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Lars Povlsen <lars.povlsen@microchip.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi  Alexandre,

On Mon, May 11, 2020 at 4:20 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> On 11/05/2020 13:39:42+0200, Geert Uytterhoeven wrote:
> > On Thu, May 7, 2020 at 2:47 PM Alexandre Belloni
> > <alexandre.belloni@bootlin.com> wrote:
> > > On 07/05/2020 14:27:06+0200, Lars Povlsen wrote:
> > > > Alexandre Belloni writes:
> > > > > On 07/05/2020 13:40:15+0200, Geert Uytterhoeven wrote:
> > > > >> The Microsemi Ocelot pin controller is only present on Microsemi Ocelot
> > > > >> and Jaguar2 SoCs.  Add a platform dependency to the PINCTRL_OCELOT
> > > > >> config symbol, to avoid asking the user about it when configuring a
> > > > >> kernel without Ocelot or Jaguar2 support.
> > > > >>
> > > > >
> > > > > I have to NAK here because there are upcoming (hopefully this cycle)
> > > > > SoCs using this driver.
> > > >
> > > > Not only because of that, but also an arbitrary system connecting to
> > > > ocelot by PCI could be using the driver.
> > >
> > > Right, and that was why I removed the dependency when adding jaguar2
> >
> > That is far from obvious from the description of commit da801ab56ad87489
> > ("pinctrl: ocelot: add MSCC Jaguar2 support")....
> > BTW, probably PINCTRL_OCELOT should have got "default y if MSCC_OCELOT",
> > to avoid breaking old configs?
> >
> > > support I never booted the mips core of jaguar2, I used it using PCIe.
> >
> > Ah, you're using it as a PCIe endpoint. So what about ...
> >
> > > > >> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > >> ---
> > > > >>  drivers/pinctrl/Kconfig | 4 ++--
> > > > >>  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > >>
> > > > >> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> > > > >> index f0ce4ce3e0f52456..bed67c08a0892240 100644
> > > > >> --- a/drivers/pinctrl/Kconfig
> > > > >> +++ b/drivers/pinctrl/Kconfig
> > > > >> @@ -394,8 +394,8 @@ config PINCTRL_RK805
> > > > >>
> > > > >>  config PINCTRL_OCELOT
> > > > >>       bool "Pinctrl driver for the Microsemi Ocelot and Jaguar2 SoCs"
> > > > >> -     depends on OF
> > > > >> -     depends on HAS_IOMEM
> > > > >> +     depends on OF && HAS_IOMEM
> > > > >> +     depends on MSCC_OCELOT || COMPILE_TEST
> >
> > ... "depends on MSCC_OCELOT || PCI || COMPILE_TEST" instead?
> >
> > If other SoCs gain support, the dependency list can be extended.
>
> Hum ok, note that it can also be connected as a SPI slave but I think
> this is a bit far fetched currently.

I can connect whatever other system using SPI, i2c, CAN, or Ethernet ;-)
That doesn't mean I will directly program the other system's pin controller
over that link, using the standard (MMIO) pinctrl driver.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
