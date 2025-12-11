Return-Path: <linux-mips+bounces-12446-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF44CB475A
	for <lists+linux-mips@lfdr.de>; Thu, 11 Dec 2025 02:47:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D064D300E03F
	for <lists+linux-mips@lfdr.de>; Thu, 11 Dec 2025 01:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5573F189F43;
	Thu, 11 Dec 2025 01:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="c5/L4Lyf"
X-Original-To: linux-mips@vger.kernel.org
Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F9719CC0C;
	Thu, 11 Dec 2025 01:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765417584; cv=none; b=EknZ2y1zGQLKu2WqxcdF6cUjPuUvi48wyL947GkjP6TWzmkD1k+SI0EbMN1rvYq1epkICGYX0KdcJxBNhuf1BmfGJ1scUsfdNrSEpLRdVQGz+MvDSFi1GkGvCRUQ4paIdBQvEC0ixRoZVYWNANUYPWV3apGBNQ8zBwvYArluMK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765417584; c=relaxed/simple;
	bh=EYm4GIkKjNzsm4v5aofzhuD5prxGBc8SzvNofLBRo2c=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fvUd9LvLTLxmKy5N2Q2LlGzLDWri5lyeZSa0n4Fhp0KVAhvap5nJVeUAfZRh1ZvBImeLU5j5oF92cVTeK2NFMvWjpyR/vG1hHgrruyeDJIp46Lqa+QUS7UYc/ivY4k1rZHv/MRSr1t1zd5h8LY5uRRsPe36M3NFFGU1KuKKY0Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=c5/L4Lyf; arc=none smtp.client-ip=113.46.200.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=KPgLVwuNpaDOrXY1PdwZUs57i0Ot4DbOYJC+UcP5L1w=;
	b=c5/L4Lyf16A1prwB7A9KBy+K3XNSibPoX4gYVCsl4xPDDKHZOgyJVrNYv5dUonw0bUlBAAxHX
	ehUW7CPWWaANnvWRX+gDiMhprs3w7eoElV6Fg5Kdv5uPHMSLLtduTu9mwFLtL9YQDEArjNDRaZs
	2y+3Qlo41usU59Q+IBELLzc=
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4dRb2p29v8zcZxm;
	Thu, 11 Dec 2025 09:43:30 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 323AF1401F3;
	Thu, 11 Dec 2025 09:46:12 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 11 Dec 2025 09:46:11 +0800
Message-ID: <4091884c-e499-ba2f-104d-022786a95648@huawei.com>
Date: Thu, 11 Dec 2025 09:46:10 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 2/6] genirq: Remove __request_percpu_irq() helper
Content-Language: en-US
To: Marc Zyngier <maz@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mips@vger.kernel.org>
CC: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner
	<tglx@linutronix.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Joshua
 Kinard <kumba@gentoo.org>
References: <20251210082242.360936-1-maz@kernel.org>
 <20251210082242.360936-3-maz@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20251210082242.360936-3-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)



On 2025/12/10 16:22, Marc Zyngier wrote:
> With the IRQ timing stuff being gone, there is no need to specify
> a flag when requesting a percpu interrupt. Not only IRQF_TIMER was
> the only flag (set of flags actually) allowed, but nobody ever
> passed it.
> 
> Get rid of __request_percpu_irq(), which was only getting 0 as flags,
> and promote request_percpu_irq_affinity() as its replacement.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  include/linux/interrupt.h | 18 ++++--------------
>  kernel/irq/manage.c       | 16 ++++++----------
>  2 files changed, 10 insertions(+), 24 deletions(-)
> 
> diff --git a/include/linux/interrupt.h b/include/linux/interrupt.h
> index 44e335b17ed64..00c01b0a43be1 100644
> --- a/include/linux/interrupt.h
> +++ b/include/linux/interrupt.h
> @@ -181,9 +181,8 @@ request_any_context_irq(unsigned int irq, irq_handler_t handler,
>  			unsigned long flags, const char *name, void *dev_id);
>  
>  extern int __must_check
> -__request_percpu_irq(unsigned int irq, irq_handler_t handler,
> -		     unsigned long flags, const char *devname,
> -		     const cpumask_t *affinity, void __percpu *percpu_dev_id);
> +request_percpu_irq_affinity(unsigned int irq, irq_handler_t handler, const char *devname,
> +			    const cpumask_t *affinity, void __percpu *percpu_dev_id);
>  
>  extern int __must_check
>  request_nmi(unsigned int irq, irq_handler_t handler, unsigned long flags,
> @@ -193,17 +192,8 @@ static inline int __must_check
>  request_percpu_irq(unsigned int irq, irq_handler_t handler,
>  		   const char *devname, void __percpu *percpu_dev_id)
>  {
> -	return __request_percpu_irq(irq, handler, 0,
> -				    devname, NULL, percpu_dev_id);
> -}
> -
> -static inline int __must_check
> -request_percpu_irq_affinity(unsigned int irq, irq_handler_t handler,
> -			    const char *devname, const cpumask_t *affinity,
> -			    void __percpu *percpu_dev_id)
> -{
> -	return __request_percpu_irq(irq, handler, 0,
> -				    devname, affinity, percpu_dev_id);
> +	return request_percpu_irq_affinity(irq, handler, devname,
> +					   NULL, percpu_dev_id);
>  }
>  
>  extern int __must_check
> diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
> index 7b25ffc5c43a4..1c858be09ba13 100644
> --- a/kernel/irq/manage.c
> +++ b/kernel/irq/manage.c
> @@ -2510,10 +2510,9 @@ struct irqaction *create_percpu_irqaction(irq_handler_t handler, unsigned long f
>  }
>  
>  /**
> - * __request_percpu_irq - allocate a percpu interrupt line
> + * request_percpu_irq_affinity - allocate a percpu interrupt line
>   * @irq:	Interrupt line to allocate
>   * @handler:	Function to be called when the IRQ occurs.
> - * @flags:	Interrupt type flags (IRQF_TIMER only)
>   * @devname:	An ascii name for the claiming device
>   * @affinity:	A cpumask describing the target CPUs for this interrupt
>   * @dev_id:	A percpu cookie passed back to the handler function
> @@ -2526,9 +2525,9 @@ struct irqaction *create_percpu_irqaction(irq_handler_t handler, unsigned long f
>   * the handler gets called with the interrupted CPU's instance of
>   * that variable.
>   */
> -int __request_percpu_irq(unsigned int irq, irq_handler_t handler,
> -			 unsigned long flags, const char *devname,
> -			 const cpumask_t *affinity, void __percpu *dev_id)
> +int request_percpu_irq_affinity(unsigned int irq, irq_handler_t handler,
> +				const char *devname, const cpumask_t *affinity,
> +				void __percpu *dev_id)
>  {
>  	struct irqaction *action;
>  	struct irq_desc *desc;
> @@ -2542,10 +2541,7 @@ int __request_percpu_irq(unsigned int irq, irq_handler_t handler,
>  	    !irq_settings_is_per_cpu_devid(desc))
>  		return -EINVAL;
>  
> -	if (flags && flags != IRQF_TIMER)
> -		return -EINVAL;
> -
> -	action = create_percpu_irqaction(handler, flags, devname, affinity, dev_id);
> +	action = create_percpu_irqaction(handler, 0, devname, affinity, dev_id);

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  	if (!action)
>  		return -ENOMEM;
>  
> @@ -2564,7 +2560,7 @@ int __request_percpu_irq(unsigned int irq, irq_handler_t handler,
>  
>  	return retval;
>  }
> -EXPORT_SYMBOL_GPL(__request_percpu_irq);
> +EXPORT_SYMBOL(request_percpu_irq_affinity);
>  
>  /**
>   * request_percpu_nmi - allocate a percpu interrupt line for NMI delivery

