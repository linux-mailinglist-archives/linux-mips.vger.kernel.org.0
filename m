Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFDDBBA49E
	for <lists+linux-mips@lfdr.de>; Sun, 22 Sep 2019 20:57:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403928AbfIVSu1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 22 Sep 2019 14:50:27 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:43946 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403910AbfIVSu0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 22 Sep 2019 14:50:26 -0400
Received: by mail-pl1-f193.google.com with SMTP id 4so5449090pld.10;
        Sun, 22 Sep 2019 11:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0BNIOmmvtrI1ZjVdAe3iuEcQv0UBtikT142IIjmPNbQ=;
        b=Nx1xYXUE1q2ugxgXoB8clpdAkR/4G99kfDNIVY7sVJ/YEuIOHd8UTR14UaVAHZ9qhF
         qnJ8rlLtOMOD7AASLxzxXyhKSsYjDRtD865pj7l4W+9N+HcR4eUpO4QBTSHT0sn87n3Z
         igCBAUepJgQqvQb2jgawoT7AUYSg41GmKZZ6Z6Ygx22udxGVDA/Tavo1h+EAvRNZZ2xJ
         P4/67Xn739dq08qZZcdN1vp4eXuFv7KwriPjVnizf/wOD3GNuWCExD2ti/GnJRwXFfhb
         SFPCffH1Rt6z1YbVpL53jZR8tWIAHU7Cdf0WxMpUdHyiHQ16HLJ0jmco/OM+Fpq1bnSL
         lJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0BNIOmmvtrI1ZjVdAe3iuEcQv0UBtikT142IIjmPNbQ=;
        b=fS0uhRZgJoJcOPqbEqPhGPTzSLCdw8ZxuN2JpznsOz5Qsybqu4HmWvJwsic+GKnz9u
         yZn5OWH7JRlXYhAOH4q7S2+Lkrkeisdn5gmPytannXUmTBujHf2n/bq6Yl288CnhFukN
         HK7EGcjGCuVuEzd5uC+WR1Vvvy1UG09TDh0Z+z7KxQd2epd4CncuehYDMooc9vuJk6eD
         LU7miwoBZ9w9jDiShXv6JAPpYD3zoueObghpUFjbYpolkB+0suejDml4+otB/VCoh+t/
         VZI1b90fiA3+RdUQjVJfJZQ5bC2VFfLLMQjfB8iJOu0xQrgPC25s3E2N8hI8DXsS+qmK
         yL1A==
X-Gm-Message-State: APjAAAUXQvufdQcoUTcauyBJAA/VBgcxj89zkp1fyxpgqGNsokOq/DJV
        S3UxejY6nqWeH/3HaxqxaNYA1vyKxL8=
X-Google-Smtp-Source: APXvYqz8r6n+PHUzVjtxPUvnUdqhPO+OvZMzhs2wLTvCJslp7HYB06vzqgFLNo/vgypP+Xgoq4Mj/w==
X-Received: by 2002:a17:902:a613:: with SMTP id u19mr28693996plq.122.1569178225606;
        Sun, 22 Sep 2019 11:50:25 -0700 (PDT)
Received: from [10.230.28.130] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id r18sm13438963pfc.3.2019.09.22.11.50.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Sep 2019 11:50:24 -0700 (PDT)
Subject: Re: [PATCH v2 1/5] irqchip/irq-bcm7038-l1: Add PM support
To:     Marc Zyngier <maz@kernel.org>
Cc:     linux-kernel@vger.kernel.org, Justin Chen <justinpopo6@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kevin Cernekee <cernekee@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:BROADCOM BMIPS MIPS ARCHITECTURE" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "open list:BROADCOM BMIPS MIPS ARCHITECTURE" 
        <linux-mips@vger.kernel.org>
References: <20190913191542.9908-1-f.fainelli@gmail.com>
 <20190913191542.9908-2-f.fainelli@gmail.com> <20190922133108.09211a17@why>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <3952c2c7-c619-eab6-e3ad-d8735104dace@gmail.com>
Date:   Sun, 22 Sep 2019 11:50:23 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190922133108.09211a17@why>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 9/22/2019 5:31 AM, Marc Zyngier wrote:
>> +#ifdef CONFIG_PM_SLEEP
>> +static int bcm7038_l1_suspend(void)
>> +{
>> +	struct bcm7038_l1_chip *intc;
>> +	unsigned long flags;
>> +	int boot_cpu, word;
>> +
>> +	/* Wakeup interrupt should only come from the boot cpu */
>> +	boot_cpu = cpu_logical_map(smp_processor_id());
> 
> What guarantees that you're actually running on the boot CPU at this
> point? If that's actually the case, why isn't cpu_logical_map(0) enough?

This is executed from syscore_suspend() which is executed after
suspend_disable_secondary_cpus(), so we are guaranteed to be
uni-processor at that point. Good point about using 0 for addressing the
boot CPU.

> 
>> +
>> +	list_for_each_entry(intc, &bcm7038_l1_intcs_list, list) {
>> +		raw_spin_lock_irqsave(&intc->lock, flags);
> 
> And if this can only run on a single CPU, what's the purpose of this
> lock?

Humm, yes, we probably do not need that lock, syscore_suspend() is after
arch_suspend_disable_irqs().

> 
>> +		for (word = 0; word < intc->n_words; word++) {
>> +			l1_writel(~intc->wake_mask[word],
>> +				intc->cpus[boot_cpu]->map_base +
>> +				reg_mask_set(intc, word));
>> +			l1_writel(intc->wake_mask[word],
>> +				intc->cpus[boot_cpu]->map_base +
>> +				reg_mask_clr(intc, word));
> 
> nit: Please don't split the write address across two lines, it makes it
> harder to read.
> 
>> +		}
>> +		raw_spin_unlock_irqrestore(&intc->lock, flags);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void bcm7038_l1_resume(void)
>> +{
>> +	struct bcm7038_l1_chip *intc;
>> +	unsigned long flags;
>> +	int boot_cpu, word;
>> +
>> +	boot_cpu = cpu_logical_map(smp_processor_id());
>> +
>> +	list_for_each_entry(intc, &bcm7038_l1_intcs_list, list) {
>> +		raw_spin_lock_irqsave(&intc->lock, flags);
>> +		for (word = 0; word < intc->n_words; word++) {
>> +			l1_writel(intc->cpus[boot_cpu]->mask_cache[word],
>> +				intc->cpus[boot_cpu]->map_base +
>> +				reg_mask_set(intc, word));
>> +			l1_writel(~intc->cpus[boot_cpu]->mask_cache[word],
>> +				intc->cpus[boot_cpu]->map_base +
>> +				reg_mask_clr(intc, word));
>> +		}
>> +		raw_spin_unlock_irqrestore(&intc->lock, flags);
>> +	}
>> +}
>> +
>> +static struct syscore_ops bcm7038_l1_syscore_ops = {
>> +	.suspend	= bcm7038_l1_suspend,
>> +	.resume		= bcm7038_l1_resume,
>> +};
>> +
>> +static int bcm7038_l1_set_wake(struct irq_data *d, unsigned int on)
>> +{
>> +	struct bcm7038_l1_chip *intc = irq_data_get_irq_chip_data(d);
>> +	unsigned long flags;
>> +	u32 word = d->hwirq / IRQS_PER_WORD;
>> +	u32 mask = BIT(d->hwirq % IRQS_PER_WORD);
>> +
>> +	raw_spin_lock_irqsave(&intc->lock, flags);
>> +	if (on)
>> +		intc->wake_mask[word] |= mask;
>> +	else
>> +		intc->wake_mask[word] &= ~mask;
>> +	raw_spin_unlock_irqrestore(&intc->lock, flags);
>> +
>> +	return 0;
>> +}
>> +#endif
>> +
>>  static struct irq_chip bcm7038_l1_irq_chip = {
>>  	.name			= "bcm7038-l1",
>>  	.irq_mask		= bcm7038_l1_mask,
>> @@ -295,6 +382,9 @@ static struct irq_chip bcm7038_l1_irq_chip = {
>>  #ifdef CONFIG_SMP
>>  	.irq_cpu_offline	= bcm7038_l1_cpu_offline,
>>  #endif
>> +#ifdef CONFIG_PM_SLEEP
>> +	.irq_set_wake		= bcm7038_l1_set_wake,
>> +#endif
>>  };
>>  
>>  static int bcm7038_l1_map(struct irq_domain *d, unsigned int virq,
>> @@ -340,6 +430,14 @@ int __init bcm7038_l1_of_init(struct device_node *dn,
>>  		goto out_unmap;
>>  	}
>>  
>> +#ifdef CONFIG_PM_SLEEP
>> +	/* Add bcm7038_l1_chip into a list */
>> +	INIT_LIST_HEAD(&intc->list);
>> +	list_add_tail(&intc->list, &bcm7038_l1_intcs_list);
> 
> No locking to manipulate this list? Is that safe?

It is safe, by virtue of of_irq_init() having being called at init_IRQ()
and that interrupt controller being initialized early on boot, but it
does not feel safe to assume that, I will add relevant protection to the
list.

> 
>> +
>> +	register_syscore_ops(&bcm7038_l1_syscore_ops);
> 
> Do you really register the syscore_ops for each and every L1 irqchip?

We do not need, indeed thanks, I will fix those things in v3.
-- 
Florian
