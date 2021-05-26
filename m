Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 887E2391665
	for <lists+linux-mips@lfdr.de>; Wed, 26 May 2021 13:44:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231622AbhEZLpi convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Wed, 26 May 2021 07:45:38 -0400
Received: from aposti.net ([89.234.176.197]:37136 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230499AbhEZLpi (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 26 May 2021 07:45:38 -0400
Date:   Wed, 26 May 2021 12:43:52 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] clocksource: Ingenic: Add SMP/SMT support for sysost
 driver.
To:     =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
Cc:     daniel.lezcano@linaro.org, tglx@linutronix.de,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sihui.liu@ingenic.com,
        jun.jiang@ingenic.com, sernia.zhou@foxmail.com
Message-Id: <4XPPTQ.AM74BCKXPWDR@crapouillou.net>
In-Reply-To: <1621963596-78952-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1621963596-78952-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,

Le mer., mai 26 2021 at 01:26:36 +0800, 周琰杰 (Zhou Yanjie) 
<zhouyanjie@wanyeetech.com> a écrit :
> The OST in Ingenic XBurst®2 SoCs such as X2000 and X2100, has a 
> global
> timer and two or four percpu timers, add support for the percpu 
> timers.

That means X2100 is a quad-core? :)

> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> ---
>  drivers/clocksource/ingenic-sysost.c | 324 
> ++++++++++++++++++++++++++---------
>  1 file changed, 246 insertions(+), 78 deletions(-)
> 
> diff --git a/drivers/clocksource/ingenic-sysost.c 
> b/drivers/clocksource/ingenic-sysost.c
> index e77d584..f35e0a3 100644
> --- a/drivers/clocksource/ingenic-sysost.c
> +++ b/drivers/clocksource/ingenic-sysost.c
> @@ -13,6 +13,8 @@
>  #include <linux/mfd/syscon.h>
>  #include <linux/of_address.h>
>  #include <linux/of_irq.h>
> +#include <linux/of_platform.h>
> +#include <linux/overflow.h>
>  #include <linux/sched_clock.h>
>  #include <linux/slab.h>
>  #include <linux/syscore_ops.h>
> @@ -21,10 +23,14 @@
> 
>  /* OST register offsets */
>  #define OST_REG_OSTCCR			0x00
> +#define OST_REG_OSTER			0x04
>  #define OST_REG_OSTCR			0x08
>  #define OST_REG_OSTFR			0x0c
> +#define OST_REG_OSTCNTH			0x0c
>  #define OST_REG_OSTMR			0x10
> +#define OST_REG_OSTCNTL			0x10
>  #define OST_REG_OST1DFR			0x14
> +#define OST_REG_OSTCNTB			0x14
>  #define OST_REG_OST1CNT			0x18
>  #define OST_REG_OST2CNTL		0x20
>  #define OST_REG_OSTCNT2HBUF		0x24
> @@ -55,13 +61,24 @@
>  #define OSTECR_OST1ENC			BIT(0)
>  #define OSTECR_OST2ENC			BIT(1)
> 
> +enum ingenic_ost_version {
> +	ID_X1000,
> +	ID_X2000,
> +};
> +
>  struct ingenic_soc_info {
> +	enum ingenic_ost_version version;
> +	const struct ingenic_ost_clk_info *clk_info;
> +
>  	unsigned int num_channels;
> +	unsigned int base_offset;
>  };
> 
>  struct ingenic_ost_clk_info {
>  	struct clk_init_data init_data;
> -	u8 ostccr_reg;
> +	unsigned int idx;
> +	u32 ostccr_reg;
> +	u32 ostcntl_reg;
>  };
> 
>  struct ingenic_ost_clk {
> @@ -71,15 +88,27 @@ struct ingenic_ost_clk {
>  	const struct ingenic_ost_clk_info *info;
>  };
> 
> +struct ingenic_ost_timer {
> +	void __iomem *base;
> +	unsigned int cpu;
> +	unsigned int channel;
> +	struct clock_event_device cevt;
> +	struct clk *clk;
> +	char name[20];
> +	spinlock_t	lock;

Use a regular space instead of the tab.

> +};
> +
>  struct ingenic_ost {
>  	void __iomem *base;
>  	const struct ingenic_soc_info *soc_info;
> -	struct clk *clk, *percpu_timer_clk, *global_timer_clk;
> -	struct clock_event_device cevt;
> +	struct clk *clk, *global_timer_clk;
> +	struct device_node *np;
>  	struct clocksource cs;
> -	char name[20];
> 
>  	struct clk_hw_onecell_data *clocks;
> +	struct ingenic_ost_timer __percpu *timers;
> +
> +	int irq;
>  };
> 
>  static struct ingenic_ost *ingenic_ost;
> @@ -94,9 +123,10 @@ static unsigned long 
> ingenic_ost_percpu_timer_recalc_rate(struct clk_hw *hw,
>  {
>  	struct ingenic_ost_clk *ost_clk = to_ost_clk(hw);
>  	const struct ingenic_ost_clk_info *info = ost_clk->info;
> +	struct ingenic_ost_timer *timer = per_cpu_ptr(ost_clk->ost->timers, 
> info->idx);
>  	unsigned int prescale;
> 
> -	prescale = readl(ost_clk->ost->base + info->ostccr_reg);
> +	prescale = readl(timer->base + info->ostccr_reg);
> 
>  	prescale = (prescale & OSTCCR_PRESCALE1_MASK) >> 
> OSTCCR_PRESCALE1_LSB;
> 
> @@ -108,11 +138,12 @@ static unsigned long 
> ingenic_ost_global_timer_recalc_rate(struct clk_hw *hw,
>  {
>  	struct ingenic_ost_clk *ost_clk = to_ost_clk(hw);
>  	const struct ingenic_ost_clk_info *info = ost_clk->info;
> +	struct ingenic_ost_timer *timer = per_cpu_ptr(ost_clk->ost->timers, 
> info->idx);
>  	unsigned int prescale;
> 
> -	prescale = readl(ost_clk->ost->base + info->ostccr_reg);
> +	prescale = readl(timer->base + info->ostccr_reg);
> 
> -	prescale = (prescale & OSTCCR_PRESCALE2_MASK) >> 
> OSTCCR_PRESCALE2_LSB;
> +	prescale = (prescale & OSTCCR_PRESCALE1_MASK) >> 
> OSTCCR_PRESCALE1_LSB;

This looks bogus to me, especially when looking at 
ingenic_ost_global_timer_set_rate().

Also, use FIELD_GET() from <linux/bitfield.h>, then you can drop the 
*_LSB macros (maybe do that in a first patch).

> 
>  	return parent_rate >> (prescale * 2);
>  }
> @@ -147,12 +178,13 @@ static int 
> ingenic_ost_percpu_timer_set_rate(struct clk_hw *hw, unsigned long re
>  {
>  	struct ingenic_ost_clk *ost_clk = to_ost_clk(hw);
>  	const struct ingenic_ost_clk_info *info = ost_clk->info;
> +	struct ingenic_ost_timer *timer = per_cpu_ptr(ost_clk->ost->timers, 
> info->idx);
>  	u8 prescale = ingenic_ost_get_prescale(parent_rate, req_rate);
>  	int val;
> 
> -	val = readl(ost_clk->ost->base + info->ostccr_reg);
> +	val = readl(timer->base + info->ostccr_reg);
>  	val = (val & ~OSTCCR_PRESCALE1_MASK) | (prescale << 
> OSTCCR_PRESCALE1_LSB);
> -	writel(val, ost_clk->ost->base + info->ostccr_reg);
> +	writel(val, timer->base + info->ostccr_reg);
> 
>  	return 0;
>  }
> @@ -162,12 +194,16 @@ static int 
> ingenic_ost_global_timer_set_rate(struct clk_hw *hw, unsigned long re
>  {
>  	struct ingenic_ost_clk *ost_clk = to_ost_clk(hw);
>  	const struct ingenic_ost_clk_info *info = ost_clk->info;
> +	struct ingenic_ost_timer *timer = per_cpu_ptr(ost_clk->ost->timers, 
> info->idx);
>  	u8 prescale = ingenic_ost_get_prescale(parent_rate, req_rate);
>  	int val;
> 
> -	val = readl(ost_clk->ost->base + info->ostccr_reg);
> -	val = (val & ~OSTCCR_PRESCALE2_MASK) | (prescale << 
> OSTCCR_PRESCALE2_LSB);
> -	writel(val, ost_clk->ost->base + info->ostccr_reg);
> +	val = readl(timer->base + info->ostccr_reg);
> +	if (ost_clk->ost->soc_info->version >= ID_X2000)
> +		val = (val & ~OSTCCR_PRESCALE1_MASK) | (prescale << 
> OSTCCR_PRESCALE1_LSB);
> +	else
> +		val = (val & ~OSTCCR_PRESCALE2_MASK) | (prescale << 
> OSTCCR_PRESCALE2_LSB);
> +	writel(val, timer->base + info->ostccr_reg);
> 
>  	return 0;
>  }
> @@ -186,7 +222,19 @@ static const struct clk_ops 
> ingenic_ost_global_timer_ops = {
> 
>  static const char * const ingenic_ost_clk_parents[] = { "ext" };
> 
> -static const struct ingenic_ost_clk_info ingenic_ost_clk_info[] = {
> +static const struct ingenic_ost_clk_info x1000_ost_clk_info[] = {
> +	[OST_CLK_GLOBAL_TIMER] = {
> +		.init_data = {
> +			.name = "global timer",
> +			.parent_names = ingenic_ost_clk_parents,
> +			.num_parents = ARRAY_SIZE(ingenic_ost_clk_parents),
> +			.ops = &ingenic_ost_global_timer_ops,
> +			.flags = CLK_SET_RATE_UNGATE,
> +		},
> +		.ostccr_reg = OST_REG_OSTCCR,
> +		.ostcntl_reg = OST_REG_OST2CNTL,
> +	},

Here you add "global timer" support for the X1000 SoC, correct? Then 
this is unrelated to this commit and should be done separately, I think.

> +
>  	[OST_CLK_PERCPU_TIMER] = {
>  		.init_data = {
>  			.name = "percpu timer",
> @@ -195,9 +243,12 @@ static const struct ingenic_ost_clk_info 
> ingenic_ost_clk_info[] = {
>  			.ops = &ingenic_ost_percpu_timer_ops,
>  			.flags = CLK_SET_RATE_UNGATE,
>  		},
> +		.idx = 0,
>  		.ostccr_reg = OST_REG_OSTCCR,
>  	},
> +};
> 
> +static const struct ingenic_ost_clk_info x2000_ost_clk_info[] = {
>  	[OST_CLK_GLOBAL_TIMER] = {
>  		.init_data = {
>  			.name = "global timer",
> @@ -207,6 +258,31 @@ static const struct ingenic_ost_clk_info 
> ingenic_ost_clk_info[] = {
>  			.flags = CLK_SET_RATE_UNGATE,
>  		},
>  		.ostccr_reg = OST_REG_OSTCCR,
> +		.ostcntl_reg = OST_REG_OSTCNTL,
> +	},
> +
> +	[OST_CLK_PERCPU_TIMER0] = {
> +		.init_data = {
> +			.name = "percpu timer0",
> +			.parent_names = ingenic_ost_clk_parents,
> +			.num_parents = ARRAY_SIZE(ingenic_ost_clk_parents),
> +			.ops = &ingenic_ost_percpu_timer_ops,
> +			.flags = CLK_SET_RATE_UNGATE,
> +		},
> +		.idx = 0,
> +		.ostccr_reg = OST_REG_OSTCCR,
> +	},
> +
> +	[OST_CLK_PERCPU_TIMER1] = {
> +		.init_data = {
> +			.name = "percpu timer1",
> +			.parent_names = ingenic_ost_clk_parents,
> +			.num_parents = ARRAY_SIZE(ingenic_ost_clk_parents),
> +			.ops = &ingenic_ost_percpu_timer_ops,
> +			.flags = CLK_SET_RATE_UNGATE,
> +		},
> +		.idx = 1,
> +		.ostccr_reg = OST_REG_OSTCCR,
>  	},
>  };
> 
> @@ -215,7 +291,7 @@ static u64 notrace 
> ingenic_ost_global_timer_read_cntl(void)
>  	struct ingenic_ost *ost = ingenic_ost;
>  	unsigned int count;
> 
> -	count = readl(ost->base + OST_REG_OST2CNTL);
> +	count = readl(ost->base + ost->soc_info->clk_info->ostcntl_reg);
> 
>  	return count;
>  }
> @@ -225,16 +301,21 @@ static u64 notrace 
> ingenic_ost_clocksource_read(struct clocksource *cs)
>  	return ingenic_ost_global_timer_read_cntl();
>  }
> 
> -static inline struct ingenic_ost *to_ingenic_ost(struct 
> clock_event_device *evt)
> +static inline struct ingenic_ost_timer *
> +to_ingenic_ost_timer(struct clock_event_device *evt)
>  {
> -	return container_of(evt, struct ingenic_ost, cevt);
> +	return container_of(evt, struct ingenic_ost_timer, cevt);
>  }
> 
>  static int ingenic_ost_cevt_set_state_shutdown(struct 
> clock_event_device *evt)
>  {
> -	struct ingenic_ost *ost = to_ingenic_ost(evt);
> +	struct ingenic_ost_timer *timer = to_ingenic_ost_timer(evt);
> +	struct ingenic_ost *ost = ingenic_ost;

You should avoid referencing the global 'ingenic_ost' variable if you 
can. You could instead add a backpointer to the ingenic_ost structure 
in your 'ingenic_ost_timer'.

> 
> -	writel(OSTECR_OST1ENC, ost->base + OST_REG_OSTECR);
> +	if (ost->soc_info->version >= ID_X2000)
> +		writel(0, timer->base + OST_REG_OSTER);
> +	else
> +		writel(OSTECR_OST1ENC, timer->base + OST_REG_OSTECR);
> 
>  	return 0;
>  }
> @@ -242,26 +323,44 @@ static int 
> ingenic_ost_cevt_set_state_shutdown(struct clock_event_device *evt)
>  static int ingenic_ost_cevt_set_next(unsigned long next,
>  				     struct clock_event_device *evt)
>  {
> -	struct ingenic_ost *ost = to_ingenic_ost(evt);
> +	struct ingenic_ost_timer *timer = to_ingenic_ost_timer(evt);
> +	struct ingenic_ost *ost = ingenic_ost;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&timer->lock, flags);
> 
> -	writel((u32)~OSTFR_FFLAG, ost->base + OST_REG_OSTFR);
> -	writel(next, ost->base + OST_REG_OST1DFR);
> -	writel(OSTCR_OST1CLR, ost->base + OST_REG_OSTCR);
> -	writel(OSTESR_OST1ENS, ost->base + OST_REG_OSTESR);
> -	writel((u32)~OSTMR_FMASK, ost->base + OST_REG_OSTMR);
> +	writel((u32)~OSTFR_FFLAG, timer->base + OST_REG_OSTFR);
> +	writel(next, timer->base + OST_REG_OST1DFR);
> +	writel(OSTCR_OST1CLR, timer->base + OST_REG_OSTCR);
> +
> +	if (ost->soc_info->version >= ID_X2000) {
> +		writel(OSTESR_OST1ENS, timer->base + OST_REG_OSTER);
> +	} else {
> +		writel(OSTESR_OST1ENS, timer->base + OST_REG_OSTESR);
> +		writel((u32)~OSTMR_FMASK, timer->base + OST_REG_OSTMR);
> +	}
> +
> +	spin_unlock_irqrestore(&timer->lock, flags);
> 
>  	return 0;
>  }
> 
>  static irqreturn_t ingenic_ost_cevt_cb(int irq, void *dev_id)
>  {
> -	struct clock_event_device *evt = dev_id;
> -	struct ingenic_ost *ost = to_ingenic_ost(evt);
> +	struct ingenic_ost *ost = ingenic_ost;
> +	struct ingenic_ost_timer *timer = dev_id;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&timer->lock, flags);

You're doing only one writel() here - I *think* it should be fine 
without the spinlock.

> +
> +	if (ost->soc_info->version >= ID_X2000)
> +		writel(0, timer->base + OST_REG_OSTER);
> +	else
> +		writel(OSTECR_OST1ENC, timer->base + OST_REG_OSTECR);
> 
> -	writel(OSTECR_OST1ENC, ost->base + OST_REG_OSTECR);
> +	spin_unlock_irqrestore(&timer->lock, flags);
> 
> -	if (evt->event_handler)
> -		evt->event_handler(evt);
> +	timer->cevt.event_handler(&timer->cevt);
> 
>  	return IRQ_HANDLED;
>  }
> @@ -271,6 +370,7 @@ static int __init 
> ingenic_ost_register_clock(struct ingenic_ost *ost,
>  			struct clk_hw_onecell_data *clocks)
>  {
>  	struct ingenic_ost_clk *ost_clk;
> +	struct ingenic_ost_timer *timer = per_cpu_ptr(ost->timers, 
> info->idx);
>  	int val, err;
> 
>  	ost_clk = kzalloc(sizeof(*ost_clk), GFP_KERNEL);
> @@ -283,9 +383,9 @@ static int __init 
> ingenic_ost_register_clock(struct ingenic_ost *ost,
>  	ost_clk->ost = ost;
> 
>  	/* Reset clock divider */
> -	val = readl(ost->base + info->ostccr_reg);
> -	val &= ~(OSTCCR_PRESCALE1_MASK | OSTCCR_PRESCALE2_MASK);
> -	writel(val, ost->base + info->ostccr_reg);
> +	val = readl(timer->base + info->ostccr_reg);
> +	val &= ~(OSTCCR_PRESCALE1_MASK);
> +	writel(val, timer->base + info->ostccr_reg);
> 
>  	err = clk_hw_register(NULL, &ost_clk->hw);
>  	if (err) {
> @@ -309,57 +409,53 @@ static struct clk * __init 
> ingenic_ost_get_clock(struct device_node *np, int id)
>  	return of_clk_get_from_provider(&args);
>  }
> 
> -static int __init ingenic_ost_percpu_timer_init(struct device_node 
> *np,
> -					 struct ingenic_ost *ost)
> +static int __init ingenic_ost_setup_cevt(unsigned int cpu)
>  {
> -	unsigned int timer_virq, channel = OST_CLK_PERCPU_TIMER;
> +	struct ingenic_ost *ost = ingenic_ost;
> +	struct ingenic_ost_timer *timer = this_cpu_ptr(ost->timers);
>  	unsigned long rate;
>  	int err;
> 
> -	ost->percpu_timer_clk = ingenic_ost_get_clock(np, channel);
> -	if (IS_ERR(ost->percpu_timer_clk))
> -		return PTR_ERR(ost->percpu_timer_clk);
> +	timer->clk = ingenic_ost_get_clock(ost->np, timer->channel);
> +	if (IS_ERR(timer->clk))
> +		return PTR_ERR(timer->clk);
> 
> -	err = clk_prepare_enable(ost->percpu_timer_clk);
> +	err = clk_prepare_enable(timer->clk);
>  	if (err)
>  		goto err_clk_put;
> 
> -	rate = clk_get_rate(ost->percpu_timer_clk);
> +	rate = clk_get_rate(timer->clk);
>  	if (!rate) {
>  		err = -EINVAL;
>  		goto err_clk_disable;
>  	}
> 
> -	timer_virq = of_irq_get(np, 0);
> -	if (!timer_virq) {
> -		err = -EINVAL;
> -		goto err_clk_disable;
> -	}
> +	snprintf(timer->name, sizeof(timer->name), "OST percpu timer%u", 
> cpu);
> 
> -	snprintf(ost->name, sizeof(ost->name), "OST percpu timer");
> +	/* Unmask full comparison match interrupt */
> +	writel((u32)~OSTMR_FMASK, timer->base + OST_REG_OSTMR);
> 
> -	err = request_irq(timer_virq, ingenic_ost_cevt_cb, IRQF_TIMER,
> -			  ost->name, &ost->cevt);
> -	if (err)
> -		goto err_irq_dispose_mapping;
> +	timer->cpu = smp_processor_id();
> +	timer->cevt.cpumask = cpumask_of(smp_processor_id());
> +	timer->cevt.features = CLOCK_EVT_FEAT_ONESHOT;
> +	timer->cevt.name = timer->name;
> +	timer->cevt.rating = 400;
> +	timer->cevt.set_state_shutdown = 
> ingenic_ost_cevt_set_state_shutdown;
> +	timer->cevt.set_next_event = ingenic_ost_cevt_set_next;
> +
> +	clockevents_config_and_register(&timer->cevt, rate, 4, 0xffffffff);
> 
> -	ost->cevt.cpumask = cpumask_of(smp_processor_id());
> -	ost->cevt.features = CLOCK_EVT_FEAT_ONESHOT;
> -	ost->cevt.name = ost->name;
> -	ost->cevt.rating = 400;
> -	ost->cevt.set_state_shutdown = ingenic_ost_cevt_set_state_shutdown;
> -	ost->cevt.set_next_event = ingenic_ost_cevt_set_next;
> +	if (ost->soc_info->version >= ID_X2000)
> +		enable_percpu_irq(ost->irq, IRQ_TYPE_NONE);
> 
> -	clockevents_config_and_register(&ost->cevt, rate, 4, 0xffffffff);
> +	spin_lock_init(&timer->lock);
> 
>  	return 0;
> 
> -err_irq_dispose_mapping:
> -	irq_dispose_mapping(timer_virq);
>  err_clk_disable:
> -	clk_disable_unprepare(ost->percpu_timer_clk);
> +	clk_disable_unprepare(timer->clk);
>  err_clk_put:
> -	clk_put(ost->percpu_timer_clk);
> +	clk_put(timer->clk);
>  	return err;
>  }
> 
> @@ -385,11 +481,14 @@ static int __init 
> ingenic_ost_global_timer_init(struct device_node *np,
>  		goto err_clk_disable;
>  	}
> 
> -	/* Clear counter CNT registers */
> -	writel(OSTCR_OST2CLR, ost->base + OST_REG_OSTCR);
> -
> -	/* Enable OST channel */
> -	writel(OSTESR_OST2ENS, ost->base + OST_REG_OSTESR);
> +	/* Clear counter CNT registers and enable OST channel */
> +	if (ost->soc_info->version >= ID_X2000) {
> +		writel(OSTCR_OST1CLR, ost->base + OST_REG_OSTCR);
> +		writel(OSTESR_OST1ENS, ost->base + OST_REG_OSTER);
> +	} else {
> +		writel(OSTCR_OST2CLR, ost->base + OST_REG_OSTCR);
> +		writel(OSTESR_OST2ENS, ost->base + OST_REG_OSTESR);
> +	}
> 
>  	cs->name = "ingenic-ost";
>  	cs->rating = 400;
> @@ -411,18 +510,33 @@ static int __init 
> ingenic_ost_global_timer_init(struct device_node *np,
>  }
> 
>  static const struct ingenic_soc_info x1000_soc_info = {
> +	.version = ID_X1000,
> +	.clk_info = x1000_ost_clk_info,
> +
>  	.num_channels = 2,
>  };
> 
> -static const struct of_device_id __maybe_unused 
> ingenic_ost_of_match[] __initconst = {
> -	{ .compatible = "ingenic,x1000-ost", .data = &x1000_soc_info, },
> +static const struct ingenic_soc_info x2000_soc_info = {
> +	.version = ID_X2000,
> +	.clk_info = x2000_ost_clk_info,
> +
> +	.num_channels = 3,
> +	.base_offset = 0x100,
> +};
> +
> +static const struct of_device_id __maybe_unused 
> ingenic_ost_of_matches[] __initconst = {
> +	{ .compatible = "ingenic,x1000-ost", .data = &x1000_soc_info },
> +	{ .compatible = "ingenic,x2000-ost", .data = &x2000_soc_info },
>  	{ /* sentinel */ }
>  };
> 
>  static int __init ingenic_ost_probe(struct device_node *np)
>  {
> -	const struct of_device_id *id = of_match_node(ingenic_ost_of_match, 
> np);
> +	const struct of_device_id *id = 
> of_match_node(ingenic_ost_of_matches, np);

Avoid any changes unrelated to the commit - for instance renaming 
'ingenic_ost_of_match' or removing the comma after the .data field, 
there's just no need and it artificially grows the patch.

Please be extra careful to make the smallest patch possible by not 
adding unrelated changes; smaller patches are easier to review, and are 
more likely to be accepted sooner.

> +	struct ingenic_ost_timer *timer;
>  	struct ingenic_ost *ost;
> +	void __iomem *base;
> +	unsigned int cpu;
>  	unsigned int i;
>  	int ret;
> 
> @@ -430,18 +544,43 @@ static int __init ingenic_ost_probe(struct 
> device_node *np)
>  	if (!ost)
>  		return -ENOMEM;
> 
> +	ost->timers = alloc_percpu(struct ingenic_ost_timer);
> +	if (!ost->timers) {
> +		ret = -ENOMEM;
> +		goto err_free_ost;
> +	}
> +
> +	ost->np = np;
> +	ost->soc_info = id->data;

This was moved but didn't have to, as far as I can see.

> +
>  	ost->base = of_io_request_and_map(np, 0, of_node_full_name(np));
>  	if (IS_ERR(ost->base)) {
>  		pr_err("%s: Failed to map OST registers\n", __func__);
>  		ret = PTR_ERR(ost->base);
> -		goto err_free_ost;
> +		goto err_free_timers;
> +	}
> +
> +	if (ost->soc_info->version >= ID_X2000) {
> +		base = of_io_request_and_map(np, 1, of_node_full_name(np));
> +		if (IS_ERR(base)) {
> +			pr_err("%s: Failed to map OST registers\n", __func__);
> +			ret = PTR_ERR(base);
> +			goto err_free_timers;
> +		}
> +	}
> +
> +	ost->irq = irq_of_parse_and_map(np, 0);
> +	if (ost->irq < 0) {
> +		pr_crit("%s: Cannot to get OST IRQ\n", __func__);
> +		ret = -EINVAL;

ret = ost->irq?

> +		goto err_free_timers;
>  	}
> 
>  	ost->clk = of_clk_get_by_name(np, "ost");
>  	if (IS_ERR(ost->clk)) {
> -		ret = PTR_ERR(ost->clk);
>  		pr_crit("%s: Cannot get OST clock\n", __func__);
> -		goto err_free_ost;
> +		ret = PTR_ERR(ost->clk);
> +		goto err_free_timers;
>  	}
> 
>  	ret = clk_prepare_enable(ost->clk);
> @@ -450,8 +589,6 @@ static int __init ingenic_ost_probe(struct 
> device_node *np)
>  		goto err_put_clk;
>  	}
> 
> -	ost->soc_info = id->data;
> -
>  	ost->clocks = kzalloc(struct_size(ost->clocks, hws, 
> ost->soc_info->num_channels),
>  			      GFP_KERNEL);
>  	if (!ost->clocks) {
> @@ -461,8 +598,20 @@ static int __init ingenic_ost_probe(struct 
> device_node *np)
> 
>  	ost->clocks->num = ost->soc_info->num_channels;
> 
> -	for (i = 0; i < ost->clocks->num; i++) {
> -		ret = ingenic_ost_register_clock(ost, i, &ingenic_ost_clk_info[i], 
> ost->clocks);
> +	for (cpu = 0; cpu < num_possible_cpus(); cpu++) {
> +		timer = per_cpu_ptr(ost->timers, cpu);
> +
> +		if (ost->soc_info->version >= ID_X2000)
> +			timer->base = base + ost->soc_info->base_offset * cpu;
> +		else
> +			timer->base = ost->base;
> +
> +		timer->cpu = cpu;
> +		timer->channel = OST_CLK_PERCPU_TIMER + cpu;
> +	}
> +
> +	for (i = 0; i < num_possible_cpus() + 1; i++) {
> +		ret = ingenic_ost_register_clock(ost, i, 
> &ost->soc_info->clk_info[i], ost->clocks);

This won't work. Your 'clk_info' array only has 2-3 entries. 
num_possible_cpus() returns the maximum number of CPUs that is 
supported by the kernel, which could be way more than the number of 
cores you actually have. I think you want num_online_cpus() here, as 
the number of online CPUs is guaranteed to be lower or equal to the 
actual number of cores.

>  		if (ret) {
>  			pr_crit("%s: Cannot register clock %d\n", __func__, i);
>  			goto err_unregister_ost_clocks;
> @@ -488,6 +637,8 @@ static int __init ingenic_ost_probe(struct 
> device_node *np)
>  	clk_disable_unprepare(ost->clk);
>  err_put_clk:
>  	clk_put(ost->clk);
> +err_free_timers:
> +	free_percpu(ost->timers);
>  err_free_ost:
>  	kfree(ost);
>  	return ret;
> @@ -517,9 +668,25 @@ static int __init ingenic_ost_init(struct 
> device_node *np)
>  		goto err_free_ingenic_ost;
>  	}
> 
> -	ret = ingenic_ost_percpu_timer_init(np, ost);
> -	if (ret)
> +	if (ost->soc_info->version >= ID_X2000)
> +		ret = request_percpu_irq(ost->irq, ingenic_ost_cevt_cb,
> +				  "OST percpu timer", ost->timers);
> +	else
> +		ret = request_irq(ost->irq, ingenic_ost_cevt_cb, IRQF_TIMER,
> +				  "OST percpu timer", ost->timers);
> +
> +	if (ret) {
> +		pr_crit("%s: Unable to request percpu IRQ: %x\n", __func__, ret);

You mean %d?

>  		goto err_ost_global_timer_cleanup;
> +	}
> +
> +	/* Setup clock events on each CPU core */
> +	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "Ingenic XBurst: 
> online",
> +				ingenic_ost_setup_cevt, NULL);
> +	if (ret < 0) {
> +		pr_crit("%s: Unable to init percpu timers: %x\n", __func__, ret);

Same here.

Cheers,
-Paul

> +		goto err_ost_global_timer_cleanup;
> +	}
> 
>  	/* Register the sched_clock at the end as there's no way to undo it 
> */
>  	rate = clk_get_rate(ost->global_timer_clk);
> @@ -537,3 +704,4 @@ static int __init ingenic_ost_init(struct 
> device_node *np)
>  }
> 
>  TIMER_OF_DECLARE(x1000_ost,  "ingenic,x1000-ost",  ingenic_ost_init);
> +TIMER_OF_DECLARE(x2000_ost,  "ingenic,x2000-ost",  ingenic_ost_init);
> --
> 2.7.4
> 


