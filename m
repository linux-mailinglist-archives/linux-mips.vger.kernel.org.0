Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B0FD1DCF9A
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2020 16:23:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729532AbgEUOW3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 May 2020 10:22:29 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:38780 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728207AbgEUOW1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 21 May 2020 10:22:27 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 376CF8030776;
        Thu, 21 May 2020 14:22:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 8PSENPxDhIuf; Thu, 21 May 2020 17:22:21 +0300 (MSK)
Date:   Thu, 21 May 2020 17:22:19 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Paul Cercueil <paul@crapouillou.net>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Randy Dunlap <rdunlap@infradead.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Maarten ter Huurne <maarten@treewalker.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 7/7] clocksource: mips-gic-timer: Mark GIC timer as
 unstable if ref clock changes
Message-ID: <20200521142219.ejsl4y5eaqqfsp5k@mobilestation>
References: <20200521005321.12129-1-Sergey.Semin@baikalelectronics.ru>
 <20200521005321.12129-8-Sergey.Semin@baikalelectronics.ru>
 <CAMuHMdW5TqfDTZZCscXCK-Fkd7Gq1Ciyu1_sDzzR0B+_W-2hfg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAMuHMdW5TqfDTZZCscXCK-Fkd7Gq1Ciyu1_sDzzR0B+_W-2hfg@mail.gmail.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 21, 2020 at 11:09:50AM +0200, Geert Uytterhoeven wrote:
> Hi Serge,
> 
> On Thu, May 21, 2020 at 2:54 AM Serge Semin
> <Sergey.Semin@baikalelectronics.ru> wrote:
> > Currently clocksource framework doesn't support the clocks with variable
> > frequency. Since MIPS GIC timer ticks rate might be unstable on some
> > platforms, we must make sure that it justifies the clocksource
> > requirements. MIPS GIC timer is incremented with the CPU cluster reference
> > clocks rate. So in case if CPU frequency changes, the MIPS GIC tick rate
> > changes synchronously. Due to this the clocksource subsystem can't rely on
> > the timer to measure system clocks anymore. This commit marks the MIPS GIC
> > based clocksource as unstable if reference clock (normally it's a CPU
> > reference clocks) rate changes. The clocksource will execute a watchdog
> > thread, which lowers the MIPS GIC timer rating to zero and fallbacks to a
> > new stable one.
> >
> > Note we don't need to set the CLOCK_SOURCE_MUST_VERIFY flag to the MIPS
> > GIC clocksource since normally the timer is stable. The only reason why
> > it gets unstable is due to the ref clock rate change, which event we
> > detect here in the driver by means of the clocks event notifier.
> >
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> Thanks for your patch!
> 
> > --- a/drivers/clocksource/mips-gic-timer.c
> > +++ b/drivers/clocksource/mips-gic-timer.c
> > @@ -24,6 +24,9 @@
> >  static DEFINE_PER_CPU(struct clock_event_device, gic_clockevent_device);
> >  static int gic_timer_irq;
> >  static unsigned int gic_frequency;
> > +static bool __read_mostly gic_clock_unstable;
> > +
> > +static void git_clocksource_unstable(char *reason);
> 
> gic_clocksource_unstable? (everywhere)

This is the most used word lately. So my hands write git everywhere by itself.)
Thanks for noticing this.

-Sergey

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
