Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28EAD1EC608
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jun 2020 02:03:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726894AbgFCADX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 2 Jun 2020 20:03:23 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:57926 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbgFCADX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 2 Jun 2020 20:03:23 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 0A4898030835;
        Wed,  3 Jun 2020 00:03:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 8X9nTlsCVJw4; Wed,  3 Jun 2020 03:03:20 +0300 (MSK)
Date:   Wed, 3 Jun 2020 03:03:18 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Marc Zyngier <maz@kernel.org>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paul.burton@imgtec.com>,
        Rob Herring <robh+dt@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jason Cooper <jason@lakedaemon.net>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        James Hogan <jhogan@kernel.org>, <linux-mips@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 6/6] MAINTAINERS: Add maintainers for MIPS core drivers
Message-ID: <20200603000318.2xgizrgwauw2ywwu@mobilestation>
References: <20200602100921.1155-1-Sergey.Semin@baikalelectronics.ru>
 <20200602100921.1155-7-Sergey.Semin@baikalelectronics.ru>
 <61afd4bd10ac644fa623e218f947328e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <61afd4bd10ac644fa623e218f947328e@kernel.org>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jun 02, 2020 at 11:12:31AM +0100, Marc Zyngier wrote:
> On 2020-06-02 11:09, Serge Semin wrote:
> > Add Thomas and myself as maintainers of the MIPS CPU and GIC IRQchip,
> > MIPS
> > GIC timer and MIPS CPS CPUidle drivers.
> > 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > 
> > ---
> > 
> > Changelog v3:
> > - Keep the files list alphabetically ordered.
> > - Add Thomas as the co-maintainer of the designated drivers.
> > ---
> >  MAINTAINERS | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 2926327e4976..20532e0287d7 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -11278,6 +11278,17 @@
> > F:	arch/mips/configs/generic/board-boston.config
> >  F:	drivers/clk/imgtec/clk-boston.c
> >  F:	include/dt-bindings/clock/boston-clock.h
> > 
> > +MIPS CORE DRIVERS
> > +M:	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > +M:	Serge Semin <fancer.lancer@gmail.com>
> > +L:	linux-mips@vger.kernel.org
> > +S:	Supported
> > +F:	drivers/bus/mips_cdmm.c
> > +F:	drivers/clocksource/mips-gic-timer.c
> > +F:	drivers/cpuidle/cpuidle-cps.c
> > +F:	drivers/irqchip/irq-mips-cpu.c
> > +F:	drivers/irqchip/irq-mips-gic.c
> > +
> >  MIPS GENERIC PLATFORM
> >  M:	Paul Burton <paulburton@kernel.org>
> >  L:	linux-mips@vger.kernel.org
> 
> Acked-by: Marc Zyngier <maz@kernel.org>
> 
> I assume this will go via the MIPS tree.

Yes, I also think so. Though I suppose first we have to get acks from
Rafael J. Wysocki (CPU IDLE) or Daniel Lezcano (CPU IDLE,
CLOCKSOURCE/CLOCKEVENT) or Thomas Gleixner (CLOCKSOURCE, CLOCKEVENT)
since we are going to maintain the drivers from the subsystems they
support. Am I right?

-Sergey

> 
> Thanks,
> 
>         M.
> -- 
> Jazz is not dead. It just smells funny...
