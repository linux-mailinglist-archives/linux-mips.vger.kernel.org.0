Return-Path: <linux-mips+bounces-12447-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 577F6CB47F0
	for <lists+linux-mips@lfdr.de>; Thu, 11 Dec 2025 02:58:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D5743014632
	for <lists+linux-mips@lfdr.de>; Thu, 11 Dec 2025 01:58:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CAB027587D;
	Thu, 11 Dec 2025 01:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="ZDHOSyFM"
X-Original-To: linux-mips@vger.kernel.org
Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463102737F3;
	Thu, 11 Dec 2025 01:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765418293; cv=none; b=t2aWNvQWH/V8x5kAwvf3h5jR8lBgpMcYeFaoUYAm83ql8ar2c82+6JNpveEe0Jkl1/1PUx+eCCTR6ZLKCBuXwbLX6RZPo/ZU36fXGsX+dJSDf7ozIAd9WT1BRJalgR4P5bd7AowZpJI26kVLi2d3Hmw9Fyybq/Af1NpKXCtQVC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765418293; c=relaxed/simple;
	bh=4Uy+hd2xMPAjARMaMXGWkErcniuZkSkMzFnfIfIIURY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Rjzy25CzETFu48I87cx/ZAWmECXahIHX9bmqhmhnR6IwNLSrYEbMN5Okr+awapYS0AUXk/0hDW48LgkVjM/e3sP3vukb5gWmUknqTpUqG08QE4XplighoWj8xisGSZ2W5JhlshsIablDLeGRLMoSQ0tuSBy/59dN4kygaDAk8vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=ZDHOSyFM; arc=none smtp.client-ip=113.46.200.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=bR3ei3t6sIbfDA84Be9oAU8AIKfIUMK5ffu0ANrlMDE=;
	b=ZDHOSyFM6PO0jHOgMVo5RwZLxIIGlO2+pnLKS+bGRiILJuIHkU/EK/FaAij9kgopGVZ5F50Sw
	B1NAnvTgYBLTfgIb9TO0FYcG0FxKepjH5Ub5J8UUl0TfydaYvkSEK4TkeDSquRpq1K3Yj9VvHZ9
	CkMmi/UZ/PrzuOBz6TRoQvU=
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4dRbKQ6LJtzLlTc;
	Thu, 11 Dec 2025 09:56:10 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 622051A016C;
	Thu, 11 Dec 2025 09:58:07 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 11 Dec 2025 09:58:06 +0800
Message-ID: <b6526cfc-a0a7-7c31-d39d-8f2195d1ceec@huawei.com>
Date: Thu, 11 Dec 2025 09:58:06 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 3/6] mips: Move IP30 timer to request_percpu_irq()
Content-Language: en-US
To: Marc Zyngier <maz@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mips@vger.kernel.org>
CC: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner
	<tglx@linutronix.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Joshua
 Kinard <kumba@gentoo.org>
References: <20251210082242.360936-1-maz@kernel.org>
 <20251210082242.360936-4-maz@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20251210082242.360936-4-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500011.china.huawei.com (7.185.36.131)



On 2025/12/10 16:22, Marc Zyngier wrote:
> Teach the SGI IP30 timer about request_percpu_irq(), which ultimately
> will allow for the removal of the antiquated setup_percpu_irq() API.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/mips/include/asm/cevt-r4k.h |  1 -
>  arch/mips/kernel/cevt-r4k.c      | 11 -----------
>  arch/mips/sgi-ip30/ip30-timer.c  |  5 ++---
>  3 files changed, 2 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/mips/include/asm/cevt-r4k.h b/arch/mips/include/asm/cevt-r4k.h
> index 2e13a038d2600..5229eb34f28a4 100644
> --- a/arch/mips/include/asm/cevt-r4k.h
> +++ b/arch/mips/include/asm/cevt-r4k.h
> @@ -23,7 +23,6 @@ void mips_event_handler(struct clock_event_device *dev);
>  int c0_compare_int_usable(void);
>  irqreturn_t c0_compare_interrupt(int, void *);
>  
> -extern struct irqaction c0_compare_irqaction;
>  extern int cp0_timer_irq_installed;
>  
>  #endif /* __ASM_CEVT_R4K_H */
> diff --git a/arch/mips/kernel/cevt-r4k.c b/arch/mips/kernel/cevt-r4k.c
> index 5f6e9e2ebbdbb..f58325f9bd2bc 100644
> --- a/arch/mips/kernel/cevt-r4k.c
> +++ b/arch/mips/kernel/cevt-r4k.c
> @@ -159,17 +159,6 @@ irqreturn_t c0_compare_interrupt(int irq, void *dev_id)
>  	return IRQ_NONE;
>  }
>  
> -struct irqaction c0_compare_irqaction = {
> -	.handler = c0_compare_interrupt,
> -	/*
> -	 * IRQF_SHARED: The timer interrupt may be shared with other interrupts
> -	 * such as perf counter and FDC interrupts.
> -	 */
> -	.flags = IRQF_PERCPU | IRQF_TIMER | IRQF_SHARED,

The flags will add a "IRQF_NO_SUSPEND" when using request_percpu_irq(),
is there any change?

> -	.name = "timer",
> -};
> -
> -
>  void mips_event_handler(struct clock_event_device *dev)
>  {
>  }
> diff --git a/arch/mips/sgi-ip30/ip30-timer.c b/arch/mips/sgi-ip30/ip30-timer.c
> index 7652f72f0daf6..294e1f7e6d8a6 100644
> --- a/arch/mips/sgi-ip30/ip30-timer.c
> +++ b/arch/mips/sgi-ip30/ip30-timer.c
> @@ -52,11 +52,10 @@ void __init plat_time_init(void)
>  	int irq = get_c0_compare_int();
>  
>  	cp0_timer_irq_installed = 1;
> -	c0_compare_irqaction.percpu_dev_id = &mips_clockevent_device;
> -	c0_compare_irqaction.flags &= ~IRQF_SHARED;
>  	irq_set_handler(irq, handle_percpu_devid_irq);
>  	irq_set_percpu_devid(irq);
> -	setup_percpu_irq(irq, &c0_compare_irqaction);
> +	WARN_ON(request_percpu_irq(irq, c0_compare_interrupt,
> +				   "timer", &mips_clockevent_device));
>  	enable_percpu_irq(irq, IRQ_TYPE_NONE);
>  
>  	ip30_heart_clocksource_init();

