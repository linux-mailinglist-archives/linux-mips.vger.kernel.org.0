Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6184223B84
	for <lists+linux-mips@lfdr.de>; Fri, 17 Jul 2020 14:41:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726070AbgGQMlh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 17 Jul 2020 08:41:37 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:44306 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726113AbgGQMlh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 17 Jul 2020 08:41:37 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 451B38030802;
        Fri, 17 Jul 2020 12:41:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Yl5UxSieiZz7; Fri, 17 Jul 2020 15:41:34 +0300 (MSK)
Date:   Fri, 17 Jul 2020 15:41:32 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     Thomas Gleixner <tglx@linutronix.de>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Rob Herring <robh+dt@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, James Hogan <jhogan@kernel.org>,
        <linux-mips@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 6/6] MAINTAINERS: Add maintainers for MIPS core drivers
Message-ID: <20200717124132.4zgxkcxnwbppuxm4@mobilestation>
References: <20200714125753.22466-1-Sergey.Semin@baikalelectronics.ru>
 <20200714125753.22466-7-Sergey.Semin@baikalelectronics.ru>
 <53a3785b-2f6f-35de-a5ac-565f059cd1f4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <53a3785b-2f6f-35de-a5ac-565f059cd1f4@linaro.org>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Jul 17, 2020 at 06:29:49AM +0200, Daniel Lezcano wrote:
> On 14/07/2020 14:57, Serge Semin wrote:
> > Add Thomas and myself as maintainers of the MIPS CPU and GIC IRQchip, MIPS
> > GIC timer and MIPS CPS CPUidle drivers.
> > 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > Acked-by: Marc Zyngier <maz@kernel.org>
> 

> Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Great! Thanks you very much, @Daniel.

@Thomas (Bogendoerfer), could you please merge the series in through the
kernel/git/mips/linux.git repository?

-Sergey

> 
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
> > @@ -11278,6 +11278,17 @@ F:	arch/mips/configs/generic/board-boston.config
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
> > 
> 
> 
> -- 
> <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs
> 
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog
