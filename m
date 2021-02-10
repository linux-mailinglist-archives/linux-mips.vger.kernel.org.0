Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D73D316912
	for <lists+linux-mips@lfdr.de>; Wed, 10 Feb 2021 15:26:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230322AbhBJOZu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Feb 2021 09:25:50 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:4404 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbhBJOZt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Feb 2021 09:25:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1612967149; x=1644503149;
  h=references:from:to:cc:subject:in-reply-to:date:
   message-id:mime-version;
  bh=F7Pd2b9DeG2r46oRjSvo1Jq81YxiehO3b+tnE31zDrg=;
  b=GI73z+d1Tnk5o6w9697gmSg89t06VzorTIaNXtMk/yXZZvdk08owH1Wi
   EVA7w18EoqLwHICt+AHoLWzglVZX1+wYf6WkTVd1z4blvktcysE2Nd3uE
   lRF5Tq/YbjDpkXvtK0DJHfq4OK1UmfKvu737qwCEnG5nnY3aAp1u/12Ap
   JdrpieyamsbsecW3SJAdjPnlCGxy/MKuHw6jGUg0hxRlUbFPPCj609YjA
   H8plBYVqYw6qCwnJpw//6ounIA4uF90PUNT/CcwcQ0UX4yTVcB/T5RQ+6
   1VZ82HLrxQ7wHnQ1p812IGSe/IddKUoRfgQ0HLIc6NrqPQb+r0yCFZJqK
   Q==;
IronPort-SDR: JwhbqzhZt55m0O+W4gvXqlgL5wIl8O2M7n3D/nevSJQ89EhPZk4NEDd+rcACbfteRJ66nxI9Bn
 Nd0ckDUNb1n5UFt2NT5aBxtsANwSzyRNOcZzfyjaEgmbKAv5ilg0pgFjjibHIW891k8Axgb0VA
 U4QlufibQpXCR1TdgSpyVl91lcYCp67kZ+iul+CqbRwgW9FwrsI8Nf2XBOrseUxMnvndlnXbxf
 9qneyjFvYBZh/XuYVue9qpD4Ok5E+EVdONiBaFOaETSXwHlBASAyj8hXd00e6ePi2c+h6K3+/Z
 uEE=
X-IronPort-AV: E=Sophos;i="5.81,168,1610434800"; 
   d="scan'208";a="108712449"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Feb 2021 07:24:32 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 10 Feb 2021 07:24:31 -0700
Received: from soft-dev10.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Wed, 10 Feb 2021 07:24:29 -0700
References: <20210210132751.1422386-1-geert+renesas@glider.be> <87mtwcujd0.fsf@microchip.com> <CAMuHMdVpHUmwfob6t_aWvaVVHpSDpF5HvLe_W5+KY9ky5A-qEw@mail.gmail.com> <20210210141728.GO351084@piout.net> <CAMuHMdXWVYB0vZ9Q3G9jGAv3J8nDReKzgSmDj4ykny6rH1cKGw@mail.gmail.com>
User-agent: mu4e 1.2.0; emacs 26.3
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Steen Hegelund" <Steen.Hegelund@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] pinctrl: PINCTRL_MICROCHIP_SGPIO should depend on ARCH_SPARX5 || SOC_VCOREIII
In-Reply-To: <CAMuHMdXWVYB0vZ9Q3G9jGAv3J8nDReKzgSmDj4ykny6rH1cKGw@mail.gmail.com>
Date:   Wed, 10 Feb 2021 15:24:28 +0100
Message-ID: <87lfbwuhk3.fsf@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


Geert Uytterhoeven writes:

> Hi Alexandre,
>
> On Wed, Feb 10, 2021 at 3:17 PM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
>> On 10/02/2021 14:53:01+0100, Geert Uytterhoeven wrote:
>> > On Wed, Feb 10, 2021 at 2:45 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:
>> > > Geert Uytterhoeven writes:
>> > > > the Microsemi/Microchip Serial GPIO device is present only Microsemi
>> > > > VCore III and Microchip Sparx5 SoCs.  Hence add a dependency on
>> > > > ARCH_SPARX5 || SOC_VCOREIII, to prevent asking the user about this
>> > > > driver when configuring a kernel without support for these SoCs.
>> > > >
>> > > > Fixes: 7e5ea974e61c8dd0 ("pinctrl: pinctrl-microchip-sgpio: Add pinctrl driver for Microsemi Serial GPIO")
>> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> > > > ---
>> > > >  drivers/pinctrl/Kconfig | 4 ++--
>> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
>> > > >
>> > > > diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
>> > > > index 113073d5f89bbf70..3b75b1d7d3d1f1b0 100644
>> > > > --- a/drivers/pinctrl/Kconfig
>> > > > +++ b/drivers/pinctrl/Kconfig
>> > > > @@ -353,8 +353,8 @@ config PINCTRL_OCELOT
>> > > >
>> > > >  config PINCTRL_MICROCHIP_SGPIO
>> > > >         bool "Pinctrl driver for Microsemi/Microchip Serial GPIO"
>> > > > -       depends on OF
>> > > > -       depends on HAS_IOMEM
>> > > > +       depends on OF && HAS_IOMEM
>> > > > +       depends on ARCH_SPARX5 || SOC_VCOREIII || COMPILE_TEST
>> > > >         select GPIOLIB
>> > > >         select GPIOLIB_IRQCHIP
>> > > >         select GENERIC_PINCONF
>> > >
>> > > Thank you for your patch. Unfortunately, it makes it impossible to use
>> > > the driver across PCIe - which is a specifically desired configuration.
>> > >
>> > > Could you add CONFIG_PCI to the || chain?
>> >
>> > Sure.
>> >
>> > Is PCIe the only other transport over which the register can be accessed?
>> > Or can this also be done over e.g. SPI, like on Ocelot[1]?
>> >
>> > [1] https://lore.kernel.org/linux-gpio/20200511145329.GV34497@piout.net/
>> >
>>
>> Yes, this driver IP is also available on Ocelot (this is SOC_VCOREIII)
>> so this is also available over SPI.
>
> Hence would you consider
>
>     depends on ARCH_SPARX5 || SOC_VCOREIII || PCI || SPI || COMPILE_TEST
>
> acceptable?  Or would that be futile, as must systems have PCI and/or
> SPI enabled anyway?
>
> Gr{oetje,eeting}s,
>
>                         Geert

Yes, that would be fine, but as you say - not have a lot of impact.

Up to you...

---Lars

-- 
Lars Povlsen,
Microchip
