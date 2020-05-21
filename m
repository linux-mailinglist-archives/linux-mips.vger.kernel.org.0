Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D2961DD0BF
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2020 17:04:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728229AbgEUPEp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 May 2020 11:04:45 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:39024 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728136AbgEUPEo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 21 May 2020 11:04:44 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id A40C0803087B;
        Thu, 21 May 2020 15:04:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Y4yBbF9D38zR; Thu, 21 May 2020 18:04:36 +0300 (MSK)
Date:   Thu, 21 May 2020 18:04:34 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>, <linux-mips@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Allison Randal <allison@lohutok.net>,
        afzal mohammed <afzal.mohd.ma@gmail.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Enrico Weigelt <info@metux.net>,
        Alexios Zavras <alexios.zavras@intel.com>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 4/7] clocksource: dw_apb_timer: Set clockevent
 any-possible-CPU mask
Message-ID: <20200521150434.deeee5fm7ixdbzbw@mobilestation>
References: <20200521005321.12129-1-Sergey.Semin@baikalelectronics.ru>
 <20200521005321.12129-5-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200521005321.12129-5-Sergey.Semin@baikalelectronics.ru>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Daniel,

On Thu, May 21, 2020 at 03:53:17AM +0300, Serge Semin wrote:
> Currently the DW APB Timer driver binds all clockevent timers to
> CPU #0. This isn't good for multiple reasons. First of all seeing
> the device is placed on APB bus (which makes it accessible from any
> CPU core), accessible over MMIO and having the DYNIRQ flag set we
> can be sure that manually binding the timer to any CPU just isn't
> correct. By doing so we just set an extra limitation on device usage.
> This also doesn't reflect the device actual capability, since by
> setting the IRQ affinity we can make it virtually local to any CPU.
> Secondly imagine if you had a real CPU-local timer with the same
> rating and the same CPU-affinity. In this case if DW APB timer was
> registered first, then due to the clockevent framework tick-timer
> selection procedure we'll end up with the real CPU-local timer being
> left unselected for clock-events tracking. But on most of the platforms
> (MIPS/ARM/etc) such timers are normally embedded into the CPU core and
> are accessible with much better performance then devices placed on APB.
> For instance in MIPS architectures there is r4k-timer, which is
> CPU-local, assigned with the same rating, and normally its
> clockevent device is registered after the platform-specific one.
> 
> So in order to fix all of these issues lets set the DW APB clockevent
> timer cpumask to be 'cpu_possible_mask'. By doing so the clockevent
> framework would prefer to select the real CPU-local timer instead
> of DW APB one. Otherwise if there is no other than DW APB device for
> clockevents tracking then it will be selected.

Hm, seems to me it has been a mistake to remove the CPU affiliation for the
timers since x86 has got a specific use-case with assigning the timers to all
detected CPUs. Though for our needs we don't need this feature. I'll make the
affiliation optional then. Like this:

> dw_apb_clockevent_init(int cpu, const char *name, unsigned rating,
>                      void __iomem *base, int irq, unsigned long freq)
> {
> ...
>       dw_ced->ced.cpumask = cpu < 0 ? cpu_possible_mask : cpumask_of(cpu);
> ...
> }

DW APB Timer OF-based devices won't make the timer affiliated to the CPU #0, but
to any possible CPU by passing -1 to the dw_apb_clockevent_init():
--- drivers/clocksource/dw_apb_timer_of.c
+++ drivers/clocksource/dw_apb_timer_of.c
-       ced = dw_apb_clockevent_init(0, event_timer->name, 300, iobase, irq,
                                     rate);
+       ced = dw_apb_clockevent_init(-1, event_timer->name, 300, iobase, irq,
                                     rate);

What do you think?

-Sergey

> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: linux-mips@vger.kernel.org
> Cc: linux-rtc@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> ---
>  drivers/clocksource/dw_apb_timer.c    | 18 +++++++-----------
>  drivers/clocksource/dw_apb_timer_of.c |  3 +--
>  include/linux/dw_apb_timer.h          |  2 +-
>  3 files changed, 9 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/clocksource/dw_apb_timer.c b/drivers/clocksource/dw_apb_timer.c
> index b207a77b0831..8ebb43916423 100644
> --- a/drivers/clocksource/dw_apb_timer.c
> +++ b/drivers/clocksource/dw_apb_timer.c
> @@ -106,6 +106,7 @@ static irqreturn_t dw_apb_clockevent_irq(int irq, void *data)
>  		dw_ced->eoi(&dw_ced->timer);
>  
>  	evt->event_handler(evt);
> +
>  	return IRQ_HANDLED;
>  }
>  
> @@ -123,8 +124,7 @@ static int apbt_shutdown(struct clock_event_device *evt)
>  	struct dw_apb_clock_event_device *dw_ced = ced_to_dw_apb_ced(evt);
>  	u32 ctrl;
>  
> -	pr_debug("%s CPU %d state=shutdown\n", __func__,
> -		 cpumask_first(evt->cpumask));
> +	pr_debug("%s state=shutdown\n", __func__);
>  
>  	ctrl = apbt_readl(&dw_ced->timer, APBTMR_N_CONTROL);
>  	ctrl &= ~APBTMR_CONTROL_ENABLE;
> @@ -137,8 +137,7 @@ static int apbt_set_oneshot(struct clock_event_device *evt)
>  	struct dw_apb_clock_event_device *dw_ced = ced_to_dw_apb_ced(evt);
>  	u32 ctrl;
>  
> -	pr_debug("%s CPU %d state=oneshot\n", __func__,
> -		 cpumask_first(evt->cpumask));
> +	pr_debug("%s state=oneshot\n", __func__);
>  
>  	ctrl = apbt_readl(&dw_ced->timer, APBTMR_N_CONTROL);
>  	/*
> @@ -170,8 +169,7 @@ static int apbt_set_periodic(struct clock_event_device *evt)
>  	unsigned long period = DIV_ROUND_UP(dw_ced->timer.freq, HZ);
>  	u32 ctrl;
>  
> -	pr_debug("%s CPU %d state=periodic\n", __func__,
> -		 cpumask_first(evt->cpumask));
> +	pr_debug("%s state=periodic\n", __func__);
>  
>  	ctrl = apbt_readl(&dw_ced->timer, APBTMR_N_CONTROL);
>  	ctrl |= APBTMR_CONTROL_MODE_PERIODIC;
> @@ -194,8 +192,7 @@ static int apbt_resume(struct clock_event_device *evt)
>  {
>  	struct dw_apb_clock_event_device *dw_ced = ced_to_dw_apb_ced(evt);
>  
> -	pr_debug("%s CPU %d state=resume\n", __func__,
> -		 cpumask_first(evt->cpumask));
> +	pr_debug("%s state=resume\n", __func__);
>  
>  	apbt_enable_int(&dw_ced->timer);
>  	return 0;
> @@ -222,7 +219,6 @@ static int apbt_next_event(unsigned long delta,
>  /**
>   * dw_apb_clockevent_init() - use an APB timer as a clock_event_device
>   *
> - * @cpu:	The CPU the events will be targeted at.
>   * @name:	The name used for the timer and the IRQ for it.
>   * @rating:	The rating to give the timer.
>   * @base:	I/O base for the timer registers.
> @@ -237,7 +233,7 @@ static int apbt_next_event(unsigned long delta,
>   * releasing the IRQ.
>   */
>  struct dw_apb_clock_event_device *
> -dw_apb_clockevent_init(int cpu, const char *name, unsigned rating,
> +dw_apb_clockevent_init(const char *name, unsigned int rating,
>  		       void __iomem *base, int irq, unsigned long freq)
>  {
>  	struct dw_apb_clock_event_device *dw_ced =
> @@ -257,7 +253,7 @@ dw_apb_clockevent_init(int cpu, const char *name, unsigned rating,
>  	dw_ced->ced.max_delta_ticks = 0x7fffffff;
>  	dw_ced->ced.min_delta_ns = clockevent_delta2ns(5000, &dw_ced->ced);
>  	dw_ced->ced.min_delta_ticks = 5000;
> -	dw_ced->ced.cpumask = cpumask_of(cpu);
> +	dw_ced->ced.cpumask = cpu_possible_mask;
>  	dw_ced->ced.features = CLOCK_EVT_FEAT_PERIODIC |
>  				CLOCK_EVT_FEAT_ONESHOT | CLOCK_EVT_FEAT_DYNIRQ;
>  	dw_ced->ced.set_state_shutdown = apbt_shutdown;
> diff --git a/drivers/clocksource/dw_apb_timer_of.c b/drivers/clocksource/dw_apb_timer_of.c
> index 8c28b127759f..0a2505b323d7 100644
> --- a/drivers/clocksource/dw_apb_timer_of.c
> +++ b/drivers/clocksource/dw_apb_timer_of.c
> @@ -73,8 +73,7 @@ static void __init add_clockevent(struct device_node *event_timer)
>  
>  	timer_get_base_and_rate(event_timer, &iobase, &rate);
>  
> -	ced = dw_apb_clockevent_init(0, event_timer->name, 300, iobase, irq,
> -				     rate);
> +	ced = dw_apb_clockevent_init(event_timer->name, 300, iobase, irq, rate);
>  	if (!ced)
>  		panic("Unable to initialise clockevent device");
>  
> diff --git a/include/linux/dw_apb_timer.h b/include/linux/dw_apb_timer.h
> index 82ebf9223948..689022bc8d17 100644
> --- a/include/linux/dw_apb_timer.h
> +++ b/include/linux/dw_apb_timer.h
> @@ -39,7 +39,7 @@ void dw_apb_clockevent_resume(struct dw_apb_clock_event_device *dw_ced);
>  void dw_apb_clockevent_stop(struct dw_apb_clock_event_device *dw_ced);
>  
>  struct dw_apb_clock_event_device *
> -dw_apb_clockevent_init(int cpu, const char *name, unsigned rating,
> +dw_apb_clockevent_init(const char *name, unsigned int rating,
>  		       void __iomem *base, int irq, unsigned long freq);
>  struct dw_apb_clocksource *
>  dw_apb_clocksource_init(unsigned rating, const char *name, void __iomem *base,
> -- 
> 2.25.1
> 
