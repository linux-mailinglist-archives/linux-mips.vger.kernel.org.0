Return-Path: <linux-mips+bounces-12445-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AE8CB46F1
	for <lists+linux-mips@lfdr.de>; Thu, 11 Dec 2025 02:35:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10C14301F5CC
	for <lists+linux-mips@lfdr.de>; Thu, 11 Dec 2025 01:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CD171A724C;
	Thu, 11 Dec 2025 01:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="gqp5YMnp"
X-Original-To: linux-mips@vger.kernel.org
Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7812080C1;
	Thu, 11 Dec 2025 01:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765416768; cv=none; b=myaFq8yS4u5ptC6htYE8tFOO+YcD67hFDIROsWUBOM11wVeOUclg5tr/CoPi9npIz/a1zMPIhltF+vNFg6Kds75WgQVmrbKw9mXnhydnEtHg1erA8AB+WruvFm6W6wza0NXoAaEBEAzbJvERarMJTKV65I1vrhKpHlEpR7IkGbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765416768; c=relaxed/simple;
	bh=6xhwZ4khl+P1mzPBhEd0FwGKWm0rObg2fIHQecnwb0w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fb5YuazQ/0HVwCH1vHsS6fTlijweBZ3jZLya6F0gBWzUvuzFuS6L2JJ1Hn6L7Az46C5QlirBuYRsk3Ez3Wa/IhtbmpAzrp2/gM+B05bSUYMu2nHrnoqPGlIn0JcN27WL/G6sj8Ng9UUV/3oku7Vy9wpAGvY9PwHBclBNfMjQEkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=gqp5YMnp; arc=none smtp.client-ip=113.46.200.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=JloQNINlepMKfdGVIwv/D2EYH1al+8w9wTxKBODGNLo=;
	b=gqp5YMnptnHVPnH2Nh9bKEErVud3/30HayCm2UviVts/TblwCAdFEa/841e58qCE5JMhNqDUO
	KBwNLAwky/33AG53FUba+WzsYCVfWgqaJhIctiZc0YXlRGoO7dZY6HDU9bs7aWCf9wBYVwDLiq0
	SzDNB4GUWpp5vlANJ+FSRNU=
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4dRZm44bH3zLlTc;
	Thu, 11 Dec 2025 09:30:44 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 23A041A0188;
	Thu, 11 Dec 2025 09:32:41 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 11 Dec 2025 09:32:40 +0800
Message-ID: <7d0e0ce8-91da-0fd4-e509-27961388af60@huawei.com>
Date: Thu, 11 Dec 2025 09:32:39 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 1/6] genirq: Remove IRQ timing tracking infrastructure
Content-Language: en-US
To: Marc Zyngier <maz@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mips@vger.kernel.org>
CC: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner
	<tglx@linutronix.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Joshua
 Kinard <kumba@gentoo.org>
References: <20251210082242.360936-1-maz@kernel.org>
 <20251210082242.360936-2-maz@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20251210082242.360936-2-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)



On 2025/12/10 16:22, Marc Zyngier wrote:
> The IRQ timing tracking infrastructure was merged in 2019, but was
> never plumbed in, is not selectable, and is therefore never used.
> 
> As Daniel agrees that there is little hope for this infrastructure
> to be completed in the near term, drop it altogether.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Link: https://lore.kernel.org/r/87zf7vex6h.wl-maz@kernel.org
> ---
>  include/linux/interrupt.h |   6 -
>  kernel/irq/Kconfig        |   3 -
>  kernel/irq/Makefile       |   4 -
>  kernel/irq/handle.c       |   2 -
>  kernel/irq/internals.h    | 110 -----
>  kernel/irq/manage.c       |   3 -
>  kernel/irq/timings.c      | 959 --------------------------------------
>  lib/Kconfig.debug         |   8 -
>  8 files changed, 1095 deletions(-)
>  delete mode 100644 kernel/irq/timings.c

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

> 
> diff --git a/include/linux/interrupt.h b/include/linux/interrupt.h
> index 266f2b39213a0..44e335b17ed64 100644
> --- a/include/linux/interrupt.h
> +++ b/include/linux/interrupt.h
> @@ -871,12 +871,6 @@ static inline void init_irq_proc(void)
>  }
>  #endif
>  
> -#ifdef CONFIG_IRQ_TIMINGS
> -void irq_timings_enable(void);
> -void irq_timings_disable(void);
> -u64 irq_timings_next_event(u64 now);
> -#endif
> -
[...]

> -
>  config TEST_LKM
>  	tristate "Test module loading with 'hello world' module"
>  	depends on m

