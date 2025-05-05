Return-Path: <linux-mips+bounces-8910-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCCDAA9B34
	for <lists+linux-mips@lfdr.de>; Mon,  5 May 2025 20:10:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BDA6188EDE0
	for <lists+linux-mips@lfdr.de>; Mon,  5 May 2025 18:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A8BE26D4E9;
	Mon,  5 May 2025 18:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="Y93Nlzht"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89F734CF5;
	Mon,  5 May 2025 18:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746468604; cv=none; b=ALr8a9eCxKQG7rWpA1ecsA1EmAfUwIQXPnyzbepMU5FE3LMxzr5+sz8EMxHbKQuVgcMljfCfGw7/W57r47dHp8hoAxluGWGerZnlBgtXu3aDy2+c2rhBLjOMrXOvEZZF+LwKYH6MLgnUlywTGENMBTqP/c6+BfHxscrAADAUctc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746468604; c=relaxed/simple;
	bh=X6WmAh88THr8C9z9mzwEovCpndgVKVF0lVExX6A49Yw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qRvVEdmIWKHjQU2FKxSjzVdTyGrJwwhm/6JQPI/rOHz8kKqit7Su1weIpB/F0N63mZp16SlQzcuQB14XtgKe2Tnzg3dnRmuxIWMFgGsvjrdc1M3sUpa/ZjJdpIs44nMhMvvPT/awZVYolEAeW/S+TxI/Oc7sKXHTetzFnUTQtbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=Y93Nlzht; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2A2A7D27C3;
	Mon,  5 May 2025 20:09:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1746468592; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=mIYHb9Si9IXtbaejOZHizAzHg3IBCVST5ALoZloHbGY=;
	b=Y93NlzhtawEHirqeYEunwMCFd29pkrveS9OEdyBDnE463PG/Yy9s2Lj7JSisAkqa5K+Idc
	oFMncNtPr+ICQcBOm4FF0WjR+cykEZLrRgRr1r3kHeJ57CxyDx2pi2oIVy7q9Lov0aghaF
	sXr40r2tKWKV8gtDETMCHaXcyaLGgoK13vKp3W5fv7RbvIad2Fvg1BIdpxzmTyhPUx+h9u
	m3R4VHMnXProWzZgfPhWH4L0vtIABLjs86xGmK8kehreL1jPLF+lBu9jdnMzgPNhba1a9y
	Rmyx6Wadkc8pD6uesvs7xH/plDgpqe8L0CBFYYMZyCtrFndKxfFQ3fKDp+UMnQ==
Message-ID: <92cd3689-3409-4d43-8db1-8633d35f779a@cjdns.fr>
Date: Mon, 5 May 2025 20:09:47 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v4 2/7] clocksource/drivers: Add EcoNet Timer HPT driver
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-mips@vger.kernel.org, tglx@linutronix.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, tsbogend@alpha.franken.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.larsson@genexis.eu, linux-mediatek@lists.infradead.org
References: <20250430133433.22222-1-cjd@cjdns.fr>
 <20250430133433.22222-3-cjd@cjdns.fr> <aBjpBpJAIP89oiit@mai.linaro.org>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <aBjpBpJAIP89oiit@mai.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3


On 05/05/2025 18:36, Daniel Lezcano wrote:
> On Wed, Apr 30, 2025 at 01:34:28PM +0000, Caleb James DeLisle wrote:
>> Introduce a clocksource driver for the so-called high-precision timer (HPT)
>> in the EcoNet EN751221 MIPS SoC.
> As a new driver, please document the timer (up - down ?, SPI/PPI, etc
> ...) that will help to understand the code more easily, especially the
> reg_* functions (purposes?).


Sure thing, I can elaborate the comment in the header of
timer-econet-en751221.c. Let me know if you'd like it described
somewhere else as well, such as the help of config ECONET_EN751221_TIMER.


>
>> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
>> ---
>>   drivers/clocksource/Kconfig                 |   8 +
>>   drivers/clocksource/Makefile                |   1 +
>>   drivers/clocksource/timer-econet-en751221.c | 216 ++++++++++++++++++++
>>   3 files changed, 225 insertions(+)
>>   create mode 100644 drivers/clocksource/timer-econet-en751221.c
>>
>> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
>> index 487c85259967..976afb0b2312 100644
>> --- a/drivers/clocksource/Kconfig
>> +++ b/drivers/clocksource/Kconfig
>> @@ -73,6 +73,14 @@ config DW_APB_TIMER_OF
>>   	select DW_APB_TIMER
>>   	select TIMER_OF
>>   
>> +config ECONET_EN751221_TIMER
>> +	bool "EcoNet EN751221 High Precision Timer" if COMPILE_TEST
>> +	depends on HAS_IOMEM
>> +	select CLKSRC_MMIO
>> +	select TIMER_OF
>> +	help
>> +	  Support for CPU timer found on EcoNet MIPS based SoCs.
>> +
>>   config FTTMR010_TIMER
>>   	bool "Faraday Technology timer driver" if COMPILE_TEST
>>   	depends on HAS_IOMEM
>> diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
>> index 43ef16a4efa6..d2998601eda5 100644
>> --- a/drivers/clocksource/Makefile
>> +++ b/drivers/clocksource/Makefile
>> @@ -17,6 +17,7 @@ obj-$(CONFIG_CLKBLD_I8253)	+= i8253.o
>>   obj-$(CONFIG_CLKSRC_MMIO)	+= mmio.o
>>   obj-$(CONFIG_DAVINCI_TIMER)	+= timer-davinci.o
>>   obj-$(CONFIG_DIGICOLOR_TIMER)	+= timer-digicolor.o
>> +obj-$(CONFIG_ECONET_EN751221_TIMER)	+= timer-econet-en751221.o
>>   obj-$(CONFIG_OMAP_DM_TIMER)	+= timer-ti-dm.o
>>   obj-$(CONFIG_OMAP_DM_SYSTIMER)	+= timer-ti-dm-systimer.o
>>   obj-$(CONFIG_DW_APB_TIMER)	+= dw_apb_timer.o
>> diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocksource/timer-econet-en751221.c
>> new file mode 100644
>> index 000000000000..9cfeead09377
>> --- /dev/null
>> +++ b/drivers/clocksource/timer-econet-en751221.c
>> @@ -0,0 +1,216 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Timer present on EcoNet EN75xx MIPS based SoCs.
>> + *
>> + * Copyright (C) 2025 by Caleb James DeLisle <cjd@cjdns.fr>
>> + */
>> +
>> +#include <linux/io.h>
>> +#include <linux/cpumask.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/clockchips.h>
>> +#include <linux/sched_clock.h>
>> +#include <linux/of.h>
>> +#include <linux/of_irq.h>
>> +#include <linux/of_address.h>
>> +#include <linux/cpuhotplug.h>
>> +#include <linux/clk.h>
>> +
>> +#define ECONET_BITS			32
>> +#define ECONET_MIN_DELTA		0x00001000
>> +#define ECONET_MAX_DELTA		GENMASK(ECONET_BITS - 2, 0)
>> +/* 34Kc hardware has 1 block and 1004Kc has 2. */
>> +#define ECONET_NUM_BLOCKS		DIV_ROUND_UP(NR_CPUS, 2)
>> +
>> +static struct {
>> +	void __iomem	*membase[ECONET_NUM_BLOCKS];
>> +	u32		freq_hz;
>> +} econet_timer __ro_after_init;
>> +
>> +static DEFINE_PER_CPU(struct clock_event_device, econet_timer_pcpu);
>> +
>> +/* Each memory block has 2 timers, the order of registers is:
>> + * CTL, CMR0, CNT0, CMR1, CNT1
>> + */
>> +static inline void __iomem *reg_ctl(u32 timer_n)
>> +{
>> +	return econet_timer.membase[timer_n >> 1];
>> +}
>> +
>> +static inline void __iomem *reg_compare(u32 timer_n)
>> +{
>> +	return econet_timer.membase[timer_n >> 1] + (timer_n & 1) * 0x08 + 0x04;
>> +}
>> +
>> +static inline void __iomem *reg_count(u32 timer_n)
>> +{
>> +	return econet_timer.membase[timer_n >> 1] + (timer_n & 1) * 0x08 + 0x08;
>> +}
>> +
>> +static inline u32 ctl_bit_enabled(u32 timer_n)
>> +{
>> +	return 1U << (timer_n & 1);
>> +}
>> +
>> +static inline u32 ctl_bit_pending(u32 timer_n)
>> +{
>> +	return 1U << ((timer_n & 1) + 16);
>> +}
>> +
>> +static bool cevt_is_pending(int cpu_id)
>> +{
>> +	return ioread32(reg_ctl(cpu_id)) & ctl_bit_pending(cpu_id);
>> +}
>> +
>> +static irqreturn_t cevt_interrupt(int irq, void *dev_id)
>> +{
>> +	struct clock_event_device *dev = this_cpu_ptr(&econet_timer_pcpu);
>> +	int cpu = cpumask_first(dev->cpumask);
>> +
>> +	if (!cevt_is_pending(cpu)) {
>> +		pr_debug("%s IRQ %d on CPU %d is not pending\n", __func__, irq, cpu);
>> +		return IRQ_NONE;
>> +	}
> How this can happen ? Can this interrupt be shared ?
To my knowledge it can't, but vendor code does it and I wasn't feeling
bold enough to gamble.
> The system will account this as a spurious interrupt, the debug
> message is not needed.
Good point, will remove.
>
>> +	iowrite32(ioread32(reg_count(cpu)), reg_compare(cpu));
>> +	dev->event_handler(dev);
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static int cevt_set_next_event(ulong delta, struct clock_event_device *dev)
>> +{
>> +	u32 next;
>> +	int cpu;
>> +
>> +	cpu = cpumask_first(dev->cpumask);
>> +	next = ioread32(reg_count(cpu)) + delta;
>> +	iowrite32(next, reg_compare(cpu));
>> +
>> +	if ((s32)(next - ioread32(reg_count(cpu))) < ECONET_MIN_DELTA / 2)
>> +		return -ETIME;
>> +
>> +	return 0;
>> +}
>> +
>> +static int cevt_init_cpu(uint cpu)
>> +{
>> +	struct clock_event_device *cd = &per_cpu(econet_timer_pcpu, cpu);
>> +	u32 reg;
>> +
>> +	pr_info("%s: Setting up clockevent for CPU %d\n", cd->name, cpu);
> That is more debug information
Fair enough, will change.
>> +	reg = ioread32(reg_ctl(cpu)) | ctl_bit_enabled(cpu);
>> +	iowrite32(reg, reg_ctl(cpu));
>> +
>> +	enable_percpu_irq(cd->irq, IRQ_TYPE_NONE);
>> +
>> +	/* Do this last because it synchronously configures the timer */
>> +	clockevents_config_and_register(
>> +		cd, econet_timer.freq_hz,
>> +		ECONET_MIN_DELTA, ECONET_MAX_DELTA);
>> +
>> +	return 0;
>> +}
>> +
>> +static u64 notrace sched_clock_read(void)
>> +{
>> +	/* Always read from clock zero no matter the CPU */
>> +	return (u64)ioread32(reg_count(0));
>> +}
>> +
>> +/* Init */
>> +
>> +static void __init cevt_dev_init(uint cpu)
>> +{
>> +	iowrite32(0, reg_count(cpu));
>> +	iowrite32(U32_MAX, reg_compare(cpu));
>> +}
>> +
>> +static int __init cevt_init(struct device_node *np)
>> +{
>> +	int i, irq, ret;
>> +
>> +	irq = irq_of_parse_and_map(np, 0);
>> +	if (irq <= 0) {
>> +		pr_err("%pOFn: irq_of_parse_and_map failed", np);
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret = request_percpu_irq(irq, cevt_interrupt, np->name, &econet_timer_pcpu);
>> +
>> +	if (ret < 0) {
>> +		pr_err("%pOFn: IRQ %d setup failed (%d)\n", np, irq, ret);
>> +		goto err_unmap_irq;
>> +	}
>> +
>> +	for_each_possible_cpu(i) {
>> +		struct clock_event_device *cd = &per_cpu(econet_timer_pcpu, i);
>> +
>> +		cd->rating		= 310,
>> +		cd->features		= CLOCK_EVT_FEAT_ONESHOT |
>> +					  CLOCK_EVT_FEAT_C3STOP |
>> +					  CLOCK_EVT_FEAT_PERCPU;
>> +		cd->set_next_event	= cevt_set_next_event;
>> +		cd->irq			= irq;
>> +		cd->cpumask		= cpumask_of(i);
>> +		cd->name		= np->name;
>> +
>> +		cevt_dev_init(i);
>> +	}
>> +
>> +	cpuhp_setup_state(CPUHP_AP_MIPS_GIC_TIMER_STARTING,
>> +			  "clockevents/en75/timer:starting",
>> +			  cevt_init_cpu, NULL);
> cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, ... ) ?

I see that Ingenic does this. This is the only timer so until it's up,
sleeping causes a hang. If sleeping is prior to CPUHP_AP_ONLINE_DYN is
considered a bug then this should be okay, but I'm not informed enough
to say whether that is the case so I'll follow your guidance here.


Thanks,

Caleb


>
>> +	return 0;
>> +
>> +err_unmap_irq:
>> +	irq_dispose_mapping(irq);
>> +	return ret;
>> +}
>> +
>> +static int __init timer_init(struct device_node *np)
>> +{
>> +	int num_blocks = DIV_ROUND_UP(num_possible_cpus(), 2);
>> +	struct clk *clk;
>> +	int ret;
>> +
>> +	clk = of_clk_get(np, 0);
>> +	if (IS_ERR(clk)) {
>> +		pr_err("%pOFn: Failed to get CPU clock from DT %ld\n", np, PTR_ERR(clk));
>> +		return PTR_ERR(clk);
>> +	}
>> +
>> +	econet_timer.freq_hz = clk_get_rate(clk);
>> +
>> +	for (int i = 0; i < num_blocks; i++) {
>> +		econet_timer.membase[i] = of_iomap(np, i);
>> +		if (!econet_timer.membase[i]) {
>> +			pr_err("%pOFn: failed to map register [%d]\n", np, i);
>> +			return -ENXIO;
>> +		}
>> +	}
>> +
>> +	/* For clocksource purposes always read clock zero, whatever the CPU */
>> +	ret = clocksource_mmio_init(reg_count(0), np->name,
>> +				    econet_timer.freq_hz, 301, ECONET_BITS,
>> +				    clocksource_mmio_readl_up);
>> +	if (ret) {
>> +		pr_err("%pOFn: clocksource_mmio_init failed: %d", np, ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = cevt_init(np);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	sched_clock_register(sched_clock_read, ECONET_BITS,
>> +			     econet_timer.freq_hz);
>> +
>> +	pr_info("%pOFn: using %u.%03u MHz high precision timer\n", np,
>> +		econet_timer.freq_hz / 1000000,
>> +		(econet_timer.freq_hz / 1000) % 1000);
>> +
>> +	return 0;
>> +}
>> +
>> +TIMER_OF_DECLARE(econet_timer_hpt, "econet,en751221-timer", timer_init);
>> -- 
>> 2.39.5
>>

