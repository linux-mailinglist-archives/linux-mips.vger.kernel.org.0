Return-Path: <linux-mips+bounces-4185-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CA51E929F97
	for <lists+linux-mips@lfdr.de>; Mon,  8 Jul 2024 11:53:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55A611F24962
	for <lists+linux-mips@lfdr.de>; Mon,  8 Jul 2024 09:53:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 217B576C76;
	Mon,  8 Jul 2024 09:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XH9THa06"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B4D7581A
	for <linux-mips@vger.kernel.org>; Mon,  8 Jul 2024 09:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720432393; cv=none; b=nJu8IGNV7PDtv7OmNmUqBt1SO0kparsPe1L/5ZV/MEz8qnxBgk22jbu/hSIQPv23EmDg2q+q1CXmW40TGJJvh1l2P6jBsTOznb4SpP+NCQr8N3vlcE4OaKV4KYhPyo72D04GCsqnrq4ypDCZf4dK4KUoKaBSwNv0cEexKsfA2FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720432393; c=relaxed/simple;
	bh=1D0ZeFLSdCPOdySZLFpPq3ewPd/UeIpV8faGJ6yA+kg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=au451xTjgyTsmRYnkBUgTgjltEZdVNpMb1xNRO6oKSt8W4ItN2vLw21kE3kROfDRxsOdf5WYRu7NM0EREEofkULt6kIv94WVB6mZO9pn/UwAQ1McfclphdUhPM7EwT0guVFNURgTUOChZMM2NXbg1PiWJgYvg9RTyA0Ao5zF4Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XH9THa06; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42573d3f7e4so25594115e9.0
        for <linux-mips@vger.kernel.org>; Mon, 08 Jul 2024 02:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720432389; x=1721037189; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hbd4CF06AdDx314zRkdu6yhwP3Xtnhr/ETb0c04XqZ4=;
        b=XH9THa062jV/DHllyPB28NIQMwmSJlnFDgZqF8Qi0h6Dkthj9bAasaijEqlNwD12SK
         zBNDurSlCnF7tpF/dhp4r7UKP+ZNtOoRUU//d3u2P6NDWQh/V8le7T9wW48wwKNyt8WJ
         k3OJs/ikyIU+X2psDhNU/FL7GveJn5kM1Cs0jymGNlwKum4WrlHmFpnCLaf3yey/10AD
         eVzOznlqaVtixM4IEal53RmCe0wSrKUD+dSegMhGm9ZDUv0Cg5eOmoZVTMMHC43I51RC
         oeaBIv/lUteN33E4Xb2wVzhJc5sQu1fyzM8S6T/YBACuKLbCPKRomXW7TmqMsT2QSMwL
         w+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720432389; x=1721037189;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hbd4CF06AdDx314zRkdu6yhwP3Xtnhr/ETb0c04XqZ4=;
        b=cGpaZAm5sapmK1b8g4NMO5PQrZcW2j6nOWxT9MDBT9xeG3hk64t8+fHGu5tiCUME0A
         5qIVhOJSwAzzOhQwjBDzpCXXBvoQErqyeMFvVET7lmzPk1caTmqAGMCDyN656wRP8R8G
         eCyy/YSGLvBRBNtXq8Tg5bqE0oagHMFo+f+W+F9OnaaD6z8zeimgAFzxz1/e2nYw466w
         pDV6Qf6cCYKxaUk/k1wn7lXi1FJQythE24ro5Z1PkKUu3lNwX5/kZV1jaeY19q0eTUac
         vPIh45AudQh+oeAV5NfYPLvpTHBjLwvaP+TM67BEjGYURJ9fI+tk0m9Vk0yWhygy4Ug8
         eTeA==
X-Forwarded-Encrypted: i=1; AJvYcCU5L+K7ZW/k8TLVmudvOi5B5sPHIwDHPsyO/02vn9o6b7NsMLMMw6600ZR7IuFvlpFlB8t9D009XRgiTlt62YHVWo9wbey9HIEEWw==
X-Gm-Message-State: AOJu0YwnmGxuYqH4JF/lMTTknznK0VE5kYr1ySNdlL8HrhdMa6lmG84z
	xkHEqn0u8AnBqAxhfxLgqdArfg4qMYulvxXXWqkd3FX+8YiaWdLRXkWO84dafBc=
X-Google-Smtp-Source: AGHT+IHG4ymayq+1yrJKL3U0BMu5df3ND1FqPrBL/f8W2lnWwyU5WsqJPmlqqP2c+FrMOpq/baOVig==
X-Received: by 2002:a05:600c:a69d:b0:426:6158:9b54 with SMTP id 5b1f17b1804b1-42661589b6bmr33060885e9.6.1720432388960;
        Mon, 08 Jul 2024 02:53:08 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0? ([2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4264a1d169dsm159129195e9.5.2024.07.08.02.53.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jul 2024 02:53:08 -0700 (PDT)
Message-ID: <1bd8c455-567c-4523-8d8e-0e7cbc8210fd@linaro.org>
Date: Mon, 8 Jul 2024 11:53:07 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/9] clocksource: realtek: Add timer driver for
 rtl-otto platforms
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, tglx@linutronix.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 tsbogend@alpha.franken.de, paulburton@kernel.org, peterz@infradead.org,
 mail@birger-koblitz.de, bert@biot.com, john@phrozen.org, sander@svanheule.net
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mips@vger.kernel.org, kabel@kernel.org, ericwouds@gmail.com,
 Markus Stockhausen <markus.stockhausen@gmx.de>
References: <20240705021520.2737568-1-chris.packham@alliedtelesis.co.nz>
 <20240705021520.2737568-8-chris.packham@alliedtelesis.co.nz>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240705021520.2737568-8-chris.packham@alliedtelesis.co.nz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/07/2024 04:15, Chris Packham wrote:
> The timer/counter block on the Realtek SoCs provides up to 5 timers. It
> also includes a watchdog timer which is handled by the
> realtek_otto_wdt.c driver.
> 
> One timer will be used per CPU as a local clock event generator. An
> additional timer will be used as an overal stable clocksource.

Does the mips arch have a local timer per cpu timer and a broadcast 
timer already integrated in the GIC ?

> Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>
> Signed-off-by: Sander Vanheule <sander@svanheule.net>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> 
> Notes:
>      This is derrived from openwrt[1],[2]. I've retained the original signoff
>      and added my own.
>      
>      [1] https://git.openwrt.org/?p=openwrt/openwrt.git;a=blob_plain;f=target/linux/realtek/files-5.15/drivers/clocksource/timer-rtl-otto.c;hb=HEAD
>      [2] https://git.openwrt.org/?p=openwrt/openwrt.git;a=blob_plain;f=target/linux/realtek/patches-5.15/302-clocksource-add-otto-driver.patch;hb=HEAD
>      
>      Changes in v4:
>      - Reword comment about watchdog timer
>      - Add includes for cpumask.h, io.h, jiffies.h and printk.h
>      - Remove unnecessary casts
>      Changes in v3:
>      - Remove unnecessary select COMMON_CLK
>      - Use %p when printing pointer
>      Changes in v2
>      - None
> 
>   drivers/clocksource/Kconfig          |  10 +
>   drivers/clocksource/Makefile         |   1 +
>   drivers/clocksource/timer-rtl-otto.c | 291 +++++++++++++++++++++++++++
>   include/linux/cpuhotplug.h           |   1 +
>   4 files changed, 303 insertions(+)
>   create mode 100644 drivers/clocksource/timer-rtl-otto.c
> 
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index 34faa0320ece..70ba57210862 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -134,6 +134,16 @@ config RDA_TIMER
>   	help
>   	  Enables the support for the RDA Micro timer driver.
>   
> +config REALTEK_OTTO_TIMER
> +	bool "Clocksource/timer for the Realtek Otto platform"
> +	select TIMER_OF
> +	help
> +	  This driver adds support for the timers found in the Realtek RTL83xx
> +	  and RTL93xx SoCs series. This includes chips such as RTL8380, RTL8381
> +	  and RTL832, as well as chips from the RTL839x series, such as RTL8390
> +	  RT8391, RTL8392, RTL8393 and RTL8396 and chips of the RTL930x series
> +	  such as RTL9301, RTL9302 or RTL9303.
> +
>   config SUN4I_TIMER
>   	bool "Sun4i timer driver" if COMPILE_TEST
>   	depends on HAS_IOMEM
> diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
> index 4bb856e4df55..22743785299e 100644
> --- a/drivers/clocksource/Makefile
> +++ b/drivers/clocksource/Makefile
> @@ -59,6 +59,7 @@ obj-$(CONFIG_MILBEAUT_TIMER)	+= timer-milbeaut.o
>   obj-$(CONFIG_SPRD_TIMER)	+= timer-sprd.o
>   obj-$(CONFIG_NPCM7XX_TIMER)	+= timer-npcm7xx.o
>   obj-$(CONFIG_RDA_TIMER)		+= timer-rda.o
> +obj-$(CONFIG_REALTEK_OTTO_TIMER)	+= timer-rtl-otto.o
>   
>   obj-$(CONFIG_ARC_TIMERS)		+= arc_timer.o
>   obj-$(CONFIG_ARM_ARCH_TIMER)		+= arm_arch_timer.o
> diff --git a/drivers/clocksource/timer-rtl-otto.c b/drivers/clocksource/timer-rtl-otto.c
> new file mode 100644
> index 000000000000..8a3068b36e75
> --- /dev/null
> +++ b/drivers/clocksource/timer-rtl-otto.c
> @@ -0,0 +1,291 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
> +
> +#include <linux/clk.h>
> +#include <linux/clockchips.h>
> +#include <linux/cpu.h>
> +#include <linux/cpuhotplug.h>
> +#include <linux/cpumask.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/jiffies.h>
> +#include <linux/printk.h>
> +#include <linux/sched_clock.h>
> +#include "timer-of.h"
> +
> +#define RTTM_DATA		0x0
> +#define RTTM_CNT		0x4
> +#define RTTM_CTRL		0x8
> +#define RTTM_INT		0xc
> +
> +#define RTTM_CTRL_ENABLE	BIT(28)
> +#define RTTM_INT_PENDING	BIT(16)
> +#define RTTM_INT_ENABLE		BIT(20)
> +
> +/*
> + * The Otto platform provides multiple 28 bit timers/counters with the following
> + * operating logic. If enabled the timer counts up. Per timer one can set a
> + * maximum counter value as an end marker. If end marker is reached the timer
> + * fires an interrupt. If the timer "overflows" by reaching the end marker or
> + * by adding 1 to 0x0fffffff the counter is reset to 0. When this happens and
> + * the timer is in operating mode COUNTER it stops. In mode TIMER it will
> + * continue to count up.
> + */
> +#define RTTM_CTRL_COUNTER	0
> +#define RTTM_CTRL_TIMER		BIT(24)
> +
> +#define RTTM_BIT_COUNT		28
> +#define RTTM_MIN_DELTA		8
> +#define RTTM_MAX_DELTA		CLOCKSOURCE_MASK(28)
> +
> +/*
> + * Timers are derived from the LXB clock frequency. Usually this is a fixed
> + * multiple of the 25 MHz oscillator. The 930X SOC is an exception from that.
> + * Its LXB clock has only dividers and uses the switch PLL of 2.45 GHz as its
> + * base. The only meaningful frequencies we can achieve from that are 175.000
> + * MHz and 153.125 MHz. The greatest common divisor of all explained possible
> + * speeds is 3125000. Pin the timers to this 3.125 MHz reference frequency.
> + */
> +#define RTTM_TICKS_PER_SEC	3125000
> +
> +struct rttm_cs {
> +	struct timer_of		to;
> +	struct clocksource	cs;
> +};
> +
> +/* Simple internal register functions */
> +static inline void rttm_set_counter(void __iomem *base, unsigned int counter)
> +{
> +	iowrite32(counter, base + RTTM_CNT);
> +}
> +
> +static inline unsigned int rttm_get_counter(void __iomem *base)
> +{
> +	return ioread32(base + RTTM_CNT);
> +}
> +
> +static inline void rttm_set_period(void __iomem *base, unsigned int period)
> +{
> +	iowrite32(period, base + RTTM_DATA);
> +}
> +
> +static inline void rttm_disable_timer(void __iomem *base)
> +{
> +	iowrite32(0, base + RTTM_CTRL);
> +}
> +
> +static inline void rttm_enable_timer(void __iomem *base, u32 mode, u32 divisor)
> +{
> +	iowrite32(RTTM_CTRL_ENABLE | mode | divisor, base + RTTM_CTRL);
> +}
> +
> +static inline void rttm_ack_irq(void __iomem *base)
> +{
> +	iowrite32(ioread32(base + RTTM_INT) | RTTM_INT_PENDING, base + RTTM_INT);
> +}
> +
> +static inline void rttm_enable_irq(void __iomem *base)
> +{
> +	iowrite32(RTTM_INT_ENABLE, base + RTTM_INT);
> +}
> +
> +static inline void rttm_disable_irq(void __iomem *base)
> +{
> +	iowrite32(0, base + RTTM_INT);
> +}
> +
> +/* Aggregated control functions for kernel clock framework */
> +#define RTTM_DEBUG(base)			\
> +	pr_debug("------------- %d %p\n",	\
> +		 smp_processor_id(), base)
> +
> +static irqreturn_t rttm_timer_interrupt(int irq, void *dev_id)
> +{
> +	struct clock_event_device *clkevt = dev_id;
> +	struct timer_of *to = to_timer_of(clkevt);
> +
> +	rttm_ack_irq(to->of_base.base);
> +	RTTM_DEBUG(to->of_base.base);
> +	clkevt->event_handler(clkevt);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static void rttm_stop_timer(void __iomem *base)
> +{
> +	rttm_disable_timer(base);
> +	rttm_ack_irq(base);
> +}
> +
> +static void rttm_start_timer(struct timer_of *to, u32 mode)
> +{
> +	rttm_set_counter(to->of_base.base, 0);
> +	rttm_enable_timer(to->of_base.base, mode, to->of_clk.rate / RTTM_TICKS_PER_SEC);
> +}
> +
> +static int rttm_next_event(unsigned long delta, struct clock_event_device *clkevt)
> +{
> +	struct timer_of *to = to_timer_of(clkevt);
> +
> +	RTTM_DEBUG(to->of_base.base);
> +	rttm_stop_timer(to->of_base.base);
> +	rttm_set_period(to->of_base.base, delta);
> +	rttm_start_timer(to, RTTM_CTRL_COUNTER);
> +
> +	return 0;
> +}
> +
> +static int rttm_state_oneshot(struct clock_event_device *clkevt)
> +{
> +	struct timer_of *to = to_timer_of(clkevt);
> +
> +	RTTM_DEBUG(to->of_base.base);
> +	rttm_stop_timer(to->of_base.base);
> +	rttm_set_period(to->of_base.base, RTTM_TICKS_PER_SEC / HZ);
> +	rttm_start_timer(to, RTTM_CTRL_COUNTER);
> +
> +	return 0;
> +}
> +
> +static int rttm_state_periodic(struct clock_event_device *clkevt)
> +{
> +	struct timer_of *to = to_timer_of(clkevt);
> +
> +	RTTM_DEBUG(to->of_base.base);
> +	rttm_stop_timer(to->of_base.base);
> +	rttm_set_period(to->of_base.base, RTTM_TICKS_PER_SEC / HZ);
> +	rttm_start_timer(to, RTTM_CTRL_TIMER);
> +
> +	return 0;
> +}
> +
> +static int rttm_state_shutdown(struct clock_event_device *clkevt)
> +{
> +	struct timer_of *to = to_timer_of(clkevt);
> +
> +	RTTM_DEBUG(to->of_base.base);
> +	rttm_stop_timer(to->of_base.base);
> +
> +	return 0;
> +}
> +
> +static void rttm_setup_timer(void __iomem *base)
> +{
> +	RTTM_DEBUG(base);
> +	rttm_stop_timer(base);
> +	rttm_set_period(base, 0);
> +}
> +
> +static u64 rttm_read_clocksource(struct clocksource *cs)
> +{
> +	struct rttm_cs *rcs = container_of(cs, struct rttm_cs, cs);
> +
> +	return rttm_get_counter(rcs->to.of_base.base);
> +}
> +
> +/* Module initialization part. */
> +static DEFINE_PER_CPU(struct timer_of, rttm_to) = {
> +	.flags				= TIMER_OF_BASE | TIMER_OF_CLOCK | TIMER_OF_IRQ,
> +	.of_irq = {
> +		.flags			= IRQF_PERCPU | IRQF_TIMER,
> +		.handler		= rttm_timer_interrupt,
> +	},
> +	.clkevt = {
> +		.rating			= 400,
> +		.features		= CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT,
> +		.set_state_periodic	= rttm_state_periodic,
> +		.set_state_shutdown	= rttm_state_shutdown,
> +		.set_state_oneshot	= rttm_state_oneshot,
> +		.set_next_event		= rttm_next_event
> +	},
> +};
> +
> +static int rttm_enable_clocksource(struct clocksource *cs)
> +{
> +	struct rttm_cs *rcs = container_of(cs, struct rttm_cs, cs);
> +
> +	rttm_disable_irq(rcs->to.of_base.base);
> +	rttm_setup_timer(rcs->to.of_base.base);
> +	rttm_enable_timer(rcs->to.of_base.base, RTTM_CTRL_TIMER,
> +			  rcs->to.of_clk.rate / RTTM_TICKS_PER_SEC);
> +
> +	return 0;
> +}
> +
> +struct rttm_cs rttm_cs = {
> +	.to = {
> +		.flags	= TIMER_OF_BASE | TIMER_OF_CLOCK,
> +	},
> +	.cs = {
> +		.name	= "realtek_otto_timer",
> +		.rating	= 400,
> +		.mask	= CLOCKSOURCE_MASK(RTTM_BIT_COUNT),
> +		.flags	= CLOCK_SOURCE_IS_CONTINUOUS,
> +		.read	= rttm_read_clocksource,
> +	}
> +};
> +
> +static u64 notrace rttm_read_clock(void)
> +{
> +	return rttm_get_counter(rttm_cs.to.of_base.base);
> +}
> +
> +static int rttm_cpu_starting(unsigned int cpu)
> +{
> +	struct timer_of *to = per_cpu_ptr(&rttm_to, cpu);
> +
> +	RTTM_DEBUG(to->of_base.base);
> +	to->clkevt.cpumask = cpumask_of(cpu);
> +	irq_force_affinity(to->of_irq.irq, to->clkevt.cpumask);
> +	clockevents_config_and_register(&to->clkevt, RTTM_TICKS_PER_SEC,
> +					RTTM_MIN_DELTA, RTTM_MAX_DELTA);
> +	rttm_enable_irq(to->of_base.base);
> +
> +	return 0;
> +}
> +
> +static int __init rttm_probe(struct device_node *np)
> +{
> +	unsigned int cpu, cpu_rollback;
> +	struct timer_of *to;
> +	unsigned int clkidx = num_possible_cpus();
> +
> +	/* Use the first n timers as per CPU clock event generators */
> +	for_each_possible_cpu(cpu) {
> +		to = per_cpu_ptr(&rttm_to, cpu);
> +		to->of_irq.index = to->of_base.index = cpu;
> +		if (timer_of_init(np, to)) {
> +			pr_err("setup of timer %d failed\n", cpu);
> +			goto rollback;
> +		}
> +		rttm_setup_timer(to->of_base.base);
> +	}
> +
> +	/* Activate the n'th + 1 timer as a stable CPU clocksource. */
> +	to = &rttm_cs.to;
> +	to->of_base.index = clkidx;
> +	timer_of_init(np, to);
> +	if (rttm_cs.to.of_base.base && rttm_cs.to.of_clk.rate) {
> +		rttm_enable_clocksource(&rttm_cs.cs);
> +		clocksource_register_hz(&rttm_cs.cs, RTTM_TICKS_PER_SEC);
> +		sched_clock_register(rttm_read_clock, RTTM_BIT_COUNT, RTTM_TICKS_PER_SEC);
> +	} else
> +		pr_err(" setup of timer %d as clocksource failed", clkidx);
> +
> +	return cpuhp_setup_state(CPUHP_AP_REALTEK_TIMER_STARTING,
> +				"timer/realtek:online",
> +				rttm_cpu_starting, NULL);
> +rollback:
> +	pr_err("timer registration failed\n");
> +	for_each_possible_cpu(cpu_rollback) {
> +		if (cpu_rollback == cpu)
> +			break;
> +		to = per_cpu_ptr(&rttm_to, cpu_rollback);
> +		timer_of_cleanup(to);
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +TIMER_OF_DECLARE(otto_timer, "realtek,otto-timer", rttm_probe);
> diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
> index 7a5785f405b6..56b744dc1317 100644
> --- a/include/linux/cpuhotplug.h
> +++ b/include/linux/cpuhotplug.h
> @@ -171,6 +171,7 @@ enum cpuhp_state {
>   	CPUHP_AP_ARMADA_TIMER_STARTING,
>   	CPUHP_AP_MIPS_GIC_TIMER_STARTING,
>   	CPUHP_AP_ARC_TIMER_STARTING,
> +	CPUHP_AP_REALTEK_TIMER_STARTING,
>   	CPUHP_AP_RISCV_TIMER_STARTING,
>   	CPUHP_AP_CLINT_TIMER_STARTING,
>   	CPUHP_AP_CSKY_TIMER_STARTING,

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


