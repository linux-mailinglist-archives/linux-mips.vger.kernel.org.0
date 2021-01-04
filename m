Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B36A2E990E
	for <lists+linux-mips@lfdr.de>; Mon,  4 Jan 2021 16:44:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727182AbhADPnr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 4 Jan 2021 10:43:47 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:50167 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727407AbhADPnr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 4 Jan 2021 10:43:47 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 2453A60005;
        Mon,  4 Jan 2021 15:43:04 +0000 (UTC)
Date:   Mon, 4 Jan 2021 16:43:03 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH 1/2] rtc: goldfish: Remove GOLDFISH dependency
Message-ID: <20210104154303.GD3313@piout.net>
References: <20201114130921.651882-1-jiaxun.yang@flygoat.com>
 <20201114130921.651882-2-jiaxun.yang@flygoat.com>
 <CAMuHMdXo9o9af-YBt5g53QHRhuLxdSy_C9n4wdEEh7yzDidr-w@mail.gmail.com>
 <20210104144841.GC3313@piout.net>
 <CAMuHMdWGnBcYvXLnydSnkxcmG6GksZLfq1aWADuWg8ibZ3V8Lg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWGnBcYvXLnydSnkxcmG6GksZLfq1aWADuWg8ibZ3V8Lg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 04/01/2021 16:21:31+0100, Geert Uytterhoeven wrote:
> Hi Alexandre,
> 
> On Mon, Jan 4, 2021 at 3:48 PM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> > On 04/01/2021 14:28:26+0100, Geert Uytterhoeven wrote:
> > > On Sat, Nov 14, 2020 at 2:20 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
> > > > Goldfish platform is covered with dust.
> > > > However the goldfish-rtc had been used as virtualized RTC
> > > > in QEMU for RISC-V virt hw and MIPS loongson3-virt hw, thus
> > > > we can drop other parts of goldfish but leave goldfish-rtc here.
> > > >
> > > > Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > >
> > > Thanks for your patch!
> > >
> > > > --- a/drivers/rtc/Kconfig
> > > > +++ b/drivers/rtc/Kconfig
> > > > @@ -1935,7 +1935,6 @@ config RTC_DRV_HID_SENSOR_TIME
> > > >  config RTC_DRV_GOLDFISH
> > > >         tristate "Goldfish Real Time Clock"
> > > >         depends on OF && HAS_IOMEM
> > > > -       depends on GOLDFISH || COMPILE_TEST
> > > >         help
> > > >           Say yes to enable RTC driver for the Goldfish based virtual platform.
> > >
> > > I was just looking to see if someone had already sent a patch to add
> > > "depends on GOLDFISH || COMPILE_TEST", before sending one myself, when I
> > > noticed your patch had removed it...
> > >
> > > What about
> > >
> > >     depends on CPU_LOONGSON64 || GOLDFISH || RISCV || COMPILE_TEST
> > >
> > > instead?
> > >
> >
> > But this driver also works on ARM, is it really important to restrict to
> > a few architectures ?
> 
> Is it used on ARM platforms?
> qemu:hw/riscv/Kconfig selects GOLDFISH_RTC, but that's it?
> 

My understanding is that this was used on the original ARM based goldfish
android emulator but I don't think this was ever upstreamed.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
