Return-Path: <linux-mips+bounces-8909-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47020AA992E
	for <lists+linux-mips@lfdr.de>; Mon,  5 May 2025 18:37:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88BAD179E5B
	for <lists+linux-mips@lfdr.de>; Mon,  5 May 2025 16:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75AAE268684;
	Mon,  5 May 2025 16:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MXxntend"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35ED8224D7
	for <linux-mips@vger.kernel.org>; Mon,  5 May 2025 16:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746462988; cv=none; b=aHiXPqQsQ5k5uZueQxorZY4fHFFg91GBfy96PBoKWQ6BpHgsnIBiiClv5K6SG9IvSrtomRxOno+uwg/0hOVtPBKqS8rLRGpBn5Guv2oUYDUweMKNEz/875Jd7sXICdo7m6xD7+aiOXUxrGZS3THQSTsw/1f3gjqHjZNfJAf56Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746462988; c=relaxed/simple;
	bh=o7vVkiBJQJMXF2PzZzzeJUMc39QxNNpzdP+v/EgFRvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z4ph1iSUYA1Jx7dN2MWcje8uuOcWyx9b3vXovT9rKFH4cdj1dJiyonufA4BVXWoLjU+MNlB38H+O9XGHsQAQ0dUtvO7BWd3E7h+wPXgyD9TVz29yh9OUQkSfBUhLfOK27kExO4qWPs/ST7AnsX+0R7Qfi2UHo6kSyIyJ3DuIJjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MXxntend; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so38451255e9.1
        for <linux-mips@vger.kernel.org>; Mon, 05 May 2025 09:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746462984; x=1747067784; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=koqGT0gVjE9PGUxoG6q0TSOc5EHYN/CahOru8Ed0etM=;
        b=MXxntendMVr5u4vTBzq8qJIfEIIl4PGojTk+vf2bq1EIVcPpkkPh1zlkGdxUnkCo1r
         hNygff58XejWqBoER+qExFqb/yUJFAIZ5CvZ18pKupQJ2DbjUjD744C0OZcqoYGuJlN1
         y+UglixgDX2Mxkc/et0hil8S07Yoe7wN8v5drTIzWlQf7QMYyzWGoGzJBVigo+/AuwqV
         ggIkx61/CW9JAWeBfO1LEmPQQjrHOCLrW6DJyZTTaVJLBZSuv3mDcKRMw08vozZFDcJ8
         2y9ZLTP7LgxRDyyOZxuAyavBHxsCt5IyceFwvPRDYPxdTKtuLPtX3wEOas8y2OnT8X2u
         ZagQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746462984; x=1747067784;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=koqGT0gVjE9PGUxoG6q0TSOc5EHYN/CahOru8Ed0etM=;
        b=fkMB/XOzGQ7tqy3G6Cix2QJOeItrO4jefCrrTEpLMVc6hzbUxmn6jZjx90LRGxaCAh
         eqmnxpNG3G10vZWJAsqnpwrIJcCnYErrdMMiHeeDQZIWAnbSIsOUF07hhmoyJOtSkeeK
         4RIB8ix99Dyx2xKHlw4cxfDgLrysmrV2uHFv55XbaUEvd3WVm0EC/Rih2T0IktMnt7xK
         bISSUwWLS89/ObfjUmzZy2go2E2MXtN/KQADn7Wx2gkgkGVNjouVaDD6q5aa1wiQPNTT
         soFjQMEkZeH4DOZmhNe5OSqZ2Mcpmf5WtWuYqnSG3/+A58gJ1xEvxaHvg6KQut/SkVzI
         7hbg==
X-Gm-Message-State: AOJu0YywhWrQymoZsoy44bgY2WnsCJf3jC9O0tH7ggRGcbqPmFhKiaxZ
	pc9J7zFEmckOV9NaxXBDEUbim3vlzNT7qwb7Ay19H4TUyMiW8e4bN+LJFrXHOaM=
X-Gm-Gg: ASbGnctNSCkehMk055FePibPy+HMWEcF/EFB8BaS0t0Xi3pPmYrodNybkmeyP2DlvJP
	ZRItxGV0rer1QSJV0Am7EJb5jRqDUaEzgq2IDJti+tMw5+9z6amjvhcvBBse+nW9RLVVV3k2MWG
	qxwr72Pg8LHIkr2ER6hcxOCDIvpUMswWdDURmRXIP47ev6OO8H/stJgquz5dV/SRrpSWG+6deRt
	10teVJhxM2WlEAlX0ps8nU/B4x0YzRmlD4vVVwyxQZpu3p+ICU6ESTRie69C0WcoakJ21N/qSgL
	fBu/lm2nvf/50T4wfyAS1XUM076gF/B0fvytdfLmJq7jRLrn2H4VjxUJCup4XtxL/Tr8BHEbscb
	jNUZtLtnc3Xojxw==
X-Google-Smtp-Source: AGHT+IFchRoVKF/xsztzmfNA9fw/Ao/ExThSQoz71pUINx5xaDyoilrc0corCct8iZlxbPSgK6N83Q==
X-Received: by 2002:a05:600c:3494:b0:43c:f5fe:5c26 with SMTP id 5b1f17b1804b1-441c48aa314mr78001765e9.4.1746462984537;
        Mon, 05 May 2025 09:36:24 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b23c5e14sm132222885e9.0.2025.05.05.09.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 09:36:23 -0700 (PDT)
Date: Mon, 5 May 2025 18:36:22 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-mips@vger.kernel.org, tglx@linutronix.de, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, tsbogend@alpha.franken.de,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	benjamin.larsson@genexis.eu, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 2/7] clocksource/drivers: Add EcoNet Timer HPT driver
Message-ID: <aBjpBpJAIP89oiit@mai.linaro.org>
References: <20250430133433.22222-1-cjd@cjdns.fr>
 <20250430133433.22222-3-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250430133433.22222-3-cjd@cjdns.fr>

On Wed, Apr 30, 2025 at 01:34:28PM +0000, Caleb James DeLisle wrote:
> Introduce a clocksource driver for the so-called high-precision timer (HPT)
> in the EcoNet EN751221 MIPS SoC.

As a new driver, please document the timer (up - down ?, SPI/PPI, etc
...) that will help to understand the code more easily, especially the
reg_* functions (purposes?).

> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---
>  drivers/clocksource/Kconfig                 |   8 +
>  drivers/clocksource/Makefile                |   1 +
>  drivers/clocksource/timer-econet-en751221.c | 216 ++++++++++++++++++++
>  3 files changed, 225 insertions(+)
>  create mode 100644 drivers/clocksource/timer-econet-en751221.c
> 
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index 487c85259967..976afb0b2312 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -73,6 +73,14 @@ config DW_APB_TIMER_OF
>  	select DW_APB_TIMER
>  	select TIMER_OF
>  
> +config ECONET_EN751221_TIMER
> +	bool "EcoNet EN751221 High Precision Timer" if COMPILE_TEST
> +	depends on HAS_IOMEM
> +	select CLKSRC_MMIO
> +	select TIMER_OF
> +	help
> +	  Support for CPU timer found on EcoNet MIPS based SoCs.
> +
>  config FTTMR010_TIMER
>  	bool "Faraday Technology timer driver" if COMPILE_TEST
>  	depends on HAS_IOMEM
> diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
> index 43ef16a4efa6..d2998601eda5 100644
> --- a/drivers/clocksource/Makefile
> +++ b/drivers/clocksource/Makefile
> @@ -17,6 +17,7 @@ obj-$(CONFIG_CLKBLD_I8253)	+= i8253.o
>  obj-$(CONFIG_CLKSRC_MMIO)	+= mmio.o
>  obj-$(CONFIG_DAVINCI_TIMER)	+= timer-davinci.o
>  obj-$(CONFIG_DIGICOLOR_TIMER)	+= timer-digicolor.o
> +obj-$(CONFIG_ECONET_EN751221_TIMER)	+= timer-econet-en751221.o
>  obj-$(CONFIG_OMAP_DM_TIMER)	+= timer-ti-dm.o
>  obj-$(CONFIG_OMAP_DM_SYSTIMER)	+= timer-ti-dm-systimer.o
>  obj-$(CONFIG_DW_APB_TIMER)	+= dw_apb_timer.o
> diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocksource/timer-econet-en751221.c
> new file mode 100644
> index 000000000000..9cfeead09377
> --- /dev/null
> +++ b/drivers/clocksource/timer-econet-en751221.c
> @@ -0,0 +1,216 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Timer present on EcoNet EN75xx MIPS based SoCs.
> + *
> + * Copyright (C) 2025 by Caleb James DeLisle <cjd@cjdns.fr>
> + */
> +
> +#include <linux/io.h>
> +#include <linux/cpumask.h>
> +#include <linux/interrupt.h>
> +#include <linux/clockchips.h>
> +#include <linux/sched_clock.h>
> +#include <linux/of.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_address.h>
> +#include <linux/cpuhotplug.h>
> +#include <linux/clk.h>
> +
> +#define ECONET_BITS			32
> +#define ECONET_MIN_DELTA		0x00001000
> +#define ECONET_MAX_DELTA		GENMASK(ECONET_BITS - 2, 0)
> +/* 34Kc hardware has 1 block and 1004Kc has 2. */
> +#define ECONET_NUM_BLOCKS		DIV_ROUND_UP(NR_CPUS, 2)
> +
> +static struct {
> +	void __iomem	*membase[ECONET_NUM_BLOCKS];
> +	u32		freq_hz;
> +} econet_timer __ro_after_init;
> +
> +static DEFINE_PER_CPU(struct clock_event_device, econet_timer_pcpu);
> +
> +/* Each memory block has 2 timers, the order of registers is:
> + * CTL, CMR0, CNT0, CMR1, CNT1
> + */
> +static inline void __iomem *reg_ctl(u32 timer_n)
> +{
> +	return econet_timer.membase[timer_n >> 1];
> +}
> +
> +static inline void __iomem *reg_compare(u32 timer_n)
> +{
> +	return econet_timer.membase[timer_n >> 1] + (timer_n & 1) * 0x08 + 0x04;
> +}
> +
> +static inline void __iomem *reg_count(u32 timer_n)
> +{
> +	return econet_timer.membase[timer_n >> 1] + (timer_n & 1) * 0x08 + 0x08;
> +}
> +
> +static inline u32 ctl_bit_enabled(u32 timer_n)
> +{
> +	return 1U << (timer_n & 1);
> +}
> +
> +static inline u32 ctl_bit_pending(u32 timer_n)
> +{
> +	return 1U << ((timer_n & 1) + 16);
> +}
> +
> +static bool cevt_is_pending(int cpu_id)
> +{
> +	return ioread32(reg_ctl(cpu_id)) & ctl_bit_pending(cpu_id);
> +}
> +
> +static irqreturn_t cevt_interrupt(int irq, void *dev_id)
> +{
> +	struct clock_event_device *dev = this_cpu_ptr(&econet_timer_pcpu);
> +	int cpu = cpumask_first(dev->cpumask);
> +
> +	if (!cevt_is_pending(cpu)) {
> +		pr_debug("%s IRQ %d on CPU %d is not pending\n", __func__, irq, cpu);
> +		return IRQ_NONE;
> +	}

How this can happen ? Can this interrupt be shared ?

The system will account this as a spurious interrupt, the debug
message is not needed.

> +	iowrite32(ioread32(reg_count(cpu)), reg_compare(cpu));
> +	dev->event_handler(dev);
> +	return IRQ_HANDLED;
> +}
> +
> +static int cevt_set_next_event(ulong delta, struct clock_event_device *dev)
> +{
> +	u32 next;
> +	int cpu;
> +
> +	cpu = cpumask_first(dev->cpumask);
> +	next = ioread32(reg_count(cpu)) + delta;
> +	iowrite32(next, reg_compare(cpu));
> +
> +	if ((s32)(next - ioread32(reg_count(cpu))) < ECONET_MIN_DELTA / 2)
> +		return -ETIME;
> +
> +	return 0;
> +}
> +
> +static int cevt_init_cpu(uint cpu)
> +{
> +	struct clock_event_device *cd = &per_cpu(econet_timer_pcpu, cpu);
> +	u32 reg;
> +
> +	pr_info("%s: Setting up clockevent for CPU %d\n", cd->name, cpu);

That is more debug information

> +	reg = ioread32(reg_ctl(cpu)) | ctl_bit_enabled(cpu);
> +	iowrite32(reg, reg_ctl(cpu));
> +
> +	enable_percpu_irq(cd->irq, IRQ_TYPE_NONE);
> +
> +	/* Do this last because it synchronously configures the timer */
> +	clockevents_config_and_register(
> +		cd, econet_timer.freq_hz,
> +		ECONET_MIN_DELTA, ECONET_MAX_DELTA);
> +
> +	return 0;
> +}
> +
> +static u64 notrace sched_clock_read(void)
> +{
> +	/* Always read from clock zero no matter the CPU */
> +	return (u64)ioread32(reg_count(0));
> +}
> +
> +/* Init */
> +
> +static void __init cevt_dev_init(uint cpu)
> +{
> +	iowrite32(0, reg_count(cpu));
> +	iowrite32(U32_MAX, reg_compare(cpu));
> +}
> +
> +static int __init cevt_init(struct device_node *np)
> +{
> +	int i, irq, ret;
> +
> +	irq = irq_of_parse_and_map(np, 0);
> +	if (irq <= 0) {
> +		pr_err("%pOFn: irq_of_parse_and_map failed", np);
> +		return -EINVAL;
> +	}
> +
> +	ret = request_percpu_irq(irq, cevt_interrupt, np->name, &econet_timer_pcpu);
> +
> +	if (ret < 0) {
> +		pr_err("%pOFn: IRQ %d setup failed (%d)\n", np, irq, ret);
> +		goto err_unmap_irq;
> +	}
> +
> +	for_each_possible_cpu(i) {
> +		struct clock_event_device *cd = &per_cpu(econet_timer_pcpu, i);
> +
> +		cd->rating		= 310,
> +		cd->features		= CLOCK_EVT_FEAT_ONESHOT |
> +					  CLOCK_EVT_FEAT_C3STOP |
> +					  CLOCK_EVT_FEAT_PERCPU;
> +		cd->set_next_event	= cevt_set_next_event;
> +		cd->irq			= irq;
> +		cd->cpumask		= cpumask_of(i);
> +		cd->name		= np->name;
> +
> +		cevt_dev_init(i);
> +	}
> +
> +	cpuhp_setup_state(CPUHP_AP_MIPS_GIC_TIMER_STARTING,
> +			  "clockevents/en75/timer:starting",
> +			  cevt_init_cpu, NULL);

cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, ... ) ?

> +	return 0;
> +
> +err_unmap_irq:
> +	irq_dispose_mapping(irq);
> +	return ret;
> +}
> +
> +static int __init timer_init(struct device_node *np)
> +{
> +	int num_blocks = DIV_ROUND_UP(num_possible_cpus(), 2);
> +	struct clk *clk;
> +	int ret;
> +
> +	clk = of_clk_get(np, 0);
> +	if (IS_ERR(clk)) {
> +		pr_err("%pOFn: Failed to get CPU clock from DT %ld\n", np, PTR_ERR(clk));
> +		return PTR_ERR(clk);
> +	}
> +
> +	econet_timer.freq_hz = clk_get_rate(clk);
> +
> +	for (int i = 0; i < num_blocks; i++) {
> +		econet_timer.membase[i] = of_iomap(np, i);
> +		if (!econet_timer.membase[i]) {
> +			pr_err("%pOFn: failed to map register [%d]\n", np, i);
> +			return -ENXIO;
> +		}
> +	}
> +
> +	/* For clocksource purposes always read clock zero, whatever the CPU */
> +	ret = clocksource_mmio_init(reg_count(0), np->name,
> +				    econet_timer.freq_hz, 301, ECONET_BITS,
> +				    clocksource_mmio_readl_up);
> +	if (ret) {
> +		pr_err("%pOFn: clocksource_mmio_init failed: %d", np, ret);
> +		return ret;
> +	}
> +
> +	ret = cevt_init(np);
> +	if (ret < 0)
> +		return ret;
> +
> +	sched_clock_register(sched_clock_read, ECONET_BITS,
> +			     econet_timer.freq_hz);
> +
> +	pr_info("%pOFn: using %u.%03u MHz high precision timer\n", np,
> +		econet_timer.freq_hz / 1000000,
> +		(econet_timer.freq_hz / 1000) % 1000);
> +
> +	return 0;
> +}
> +
> +TIMER_OF_DECLARE(econet_timer_hpt, "econet,en751221-timer", timer_init);
> -- 
> 2.39.5
> 

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

