Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E844F21151B
	for <lists+linux-mips@lfdr.de>; Wed,  1 Jul 2020 23:28:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727098AbgGAV2K (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 1 Jul 2020 17:28:10 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:49774 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726144AbgGAV2J (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 1 Jul 2020 17:28:09 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 9F98A803202A;
        Wed,  1 Jul 2020 21:28:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id g3WW4EqKCj7G; Thu,  2 Jul 2020 00:28:03 +0300 (MSK)
Date:   Thu, 2 Jul 2020 00:28:00 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
CC:     Thomas Gleixner <tglx@linutronix.de>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marc Zyngier <maz@kernel.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        <linux-mips@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 6/6] MAINTAINERS: Add maintainers for MIPS core drivers
Message-ID: <20200701212800.r7ue36dp2qnmmsmm@mobilestation>
References: <20200617223201.23259-1-Sergey.Semin@baikalelectronics.ru>
 <20200617223201.23259-7-Sergey.Semin@baikalelectronics.ru>
 <e29c9643-db5c-2d89-ff56-0900091770ea@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e29c9643-db5c-2d89-ff56-0900091770ea@linaro.org>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello Daniel

On Wed, Jul 01, 2020 at 09:00:03AM +0200, Daniel Lezcano wrote:
> On 18/06/2020 00:32, Serge Semin wrote:
> > Add Thomas and myself as maintainers of the MIPS CPU and GIC IRQchip, MIPS
> > GIC timer and MIPS CPS CPUidle drivers.
> 

> Why will you add yourself in the MAINTAINERS file for those drivers when
> git shows just one contribution for the mips-gic-timer for the timer
> stability ?
> 
> git shortlog --numbered --summary drivers/cpuidle/cpuidle-cps.c
>      4  Paul Burton
>      1  Daniel Lezcano
>      1  Marcin Nowakowski
>      1  Matt Redfearn
>      1  Thomas Gleixner
> 
> git shortlog --numbered --summary drivers/clocksource/mips-gic-timer.c
>     11  Andrew Bresticker
>      4  Ezequiel Garcia
>      4  Matt Redfearn
>      4  Paul Burton
>      3  Daniel Lezcano
>      3  Thomas Gleixner
>      2  Linus Torvalds
>      1  Alex Smith
>      1  Christophe Jaillet
>      1  Felix Fietkau
>      1  Ingo Molnar
>      1  Markos Chandras
>      1  Paul Gortmaker
>      1  Rafał Miłecki
>      1  Richard Cochran
>      1  Serge Semin
>      1  Viresh Kumar
>      1  YueHaibing

I suppose that the number of commits isn't a main criteria to make someone of
being a maintainer of a particular driver, though it might be a sufficient
condition why someone could be appointed with the role. Anyway as I said in
the cover letter that was a mere suggestion:

> > Suggestion.
> > Since Paul isn't looking after the MIPS arch code anymore, Ralf hasn't
> > been seen maintaining MIPS for a long time, Thomas is only responsible
> > for the next part of it:
> >         F:      Documentation/devicetree/bindings/mips/
> >         F:      Documentation/mips/
> >         F:      arch/mips/
> >         F:      drivers/platform/mips/
> > the MIPS-specific drivers like:
> >         F:      drivers/bus/mips_cdmm.c
> >         F:      drivers/irqchip/irq-mips-cpu.c
> >         F:      drivers/irqchip/irq-mips-gic.c
> >         F:      drivers/clocksource/mips-gic-timer.c
> >         F:      drivers/cpuidle/cpuidle-cps.c
> > seem to be left for the subsystems maintainers to support. So if you don't
> > mind or unless there is a better alternative, I can help with looking
> > after them to ease the maintainers review burden and since I'll be working
> > on our MIPS-based SoC drivers integrating into the mainline kernel repo
> > anyway. Thomas agreed to join in maintaining that drivers."

Primarily I've propose my help with looking after those drivers, since I'll be
working on our SoC drivers with those components installed anyway.

Another reason why I've decided to create this patch is that I've discovered there
is noone looking after the drivers/bus/mips_cdmm.c driver. Noone responded to
accept/decline the CDMM-related changes proposed in this patchset
(mips_cdmm.c driver), noone except Rob responded to the DT bindings conversion
patches (irq-mips-gic.c, mips_cdmm.c drivers):
  68d4fa5d0bb8 dt-bindings: bus: Add MIPS CDMM controller
  7256641fe15e dt-bindings: interrupt-controller: Convert mti,gic to DT schema
  da16cdddd947 dt-bindings: power: Convert mti,mips-cpc to DT schema
Finally I didn't say it in the cover letter, but cpuidle-cps wasn't working for
our SoC, so I'll have to dig into that driver anyway. Moreover It seems to me
that cpuidle-cps.c will be abandoned by the author since Paul Burton stopped
working for MIPS. So based on that I collected all MIPS-related but scattered
around the kernel subsystems drivers (MIPS CDMM, MIPS CPU/GIC IRQ-chip,
MIPS GIC-timer and MIPS CPU-idle CPS) in the dedicated maintainers entry and
proposed my help with their maintenance. By Marc' suggestion Thomas agreed to
join in.

If you don't need our help in maintaining the mips-gic-timer.c and cpuidle-cps.c
drivers, then just say so. I'll discard them from the maintenance entry created
by this patch. Though in that case the list won't be full.)

> 
> Also, in the cpuidle-cps.c history, there is no signed-off from Rafael,
> neither an Acked-by when it was merged. That make me think the patch
> went through another path than the linux-pm tree without a cpuidle
> framework maintainer acknowledgement.
> 
> Perhaps it is a mistake and the patch was actually acked-by, but I would
> like to remind the patches have to be acked by the upper maintainers and
> being listed in the MAINTAINERS file does not give the right of override
> this rule.

Sorry. I don't really get it what patch you are talking about. But I
totally aware of the rule you've mentioned.

-Sergey

> 
> 
> 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > Acked-by: Marc Zyngier <maz@kernel.org>
> > Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> > Cc: linux-mips@vger.kernel.org
> > Cc: devicetree@vger.kernel.org
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
