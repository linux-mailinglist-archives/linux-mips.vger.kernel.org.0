Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8C2119290E
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2020 14:00:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbgCYNAE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 25 Mar 2020 09:00:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:44724 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726969AbgCYNAE (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 25 Mar 2020 09:00:04 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9DC2F20772;
        Wed, 25 Mar 2020 13:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585141203;
        bh=10BVdmjEkYczxJmcDOG7xNE1dub7UU7afSw9H9CUwv4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=QxNckFLWO2LCHbcpQ3NdtWPb9OqvbBXtFecC8lVDZMVbCRhf0mctSW7xZwmrDjA+X
         VwhdY0C+g0se/lzW0MkO7XkEJY6soI8NMfGX7oeJ2fRJ0+aUcNW4iD8sIBh72sSBUe
         6XgF903X3IivBNH7TyM4JERsSb20cnYlIH0+UntA=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1jH5dZ-00FZbV-Ma; Wed, 25 Mar 2020 13:00:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 25 Mar 2020 13:00:01 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org,
        Huacai Chen <chenhc@lemote.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Allison Randal <allison@lohutok.net>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v8 06/11] irqchip: mips-cpu: Convert to simple domain
In-Reply-To: <20200325123742.GA9911@alpha.franken.de>
References: <20200325035537.156911-1-jiaxun.yang@flygoat.com>
 <20200325035537.156911-7-jiaxun.yang@flygoat.com>
 <20200325123742.GA9911@alpha.franken.de>
Message-ID: <a69f727d37daac6e20ac08de022245b1@kernel.org>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/1.3.10
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: tsbogend@alpha.franken.de, jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org, chenhc@lemote.com, tglx@linutronix.de, jason@lakedaemon.net, robh+dt@kernel.org, mark.rutland@arm.com, mchehab+samsung@kernel.org, davem@davemloft.net, gregkh@linuxfoundation.org, Jonathan.Cameron@huawei.com, andriy.shevchenko@linux.intel.com, allison@lohutok.net, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2020-03-25 12:37, Thomas Bogendoerfer wrote:
> On Wed, Mar 25, 2020 at 11:54:59AM +0800, Jiaxun Yang wrote:
>> The old code is using legacy domain to setup irq_domain for CPU 
>> interrupts
>> which requires irq_desc to be preallocated.
>> 
>> However, when MIPS_CPU_IRQ_BASE >= 16, irq_desc for CPU IRQs may end 
>> up
>> unallocated and lead to incorrect behavior.
>> 
>> Thus we convert the legacy domain to simple domain which can allocate
>> irq_desc during initialization.
>> 
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> Co-developed-by: Huacai Chen <chenhc@lemote.com>
>> Signed-off-by: Huacai Chen <chenhc@lemote.com>
>> Reviewed-by: Marc Zyngier <maz@kernel.org>
>> ---
>>  drivers/irqchip/irq-mips-cpu.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/irqchip/irq-mips-cpu.c 
>> b/drivers/irqchip/irq-mips-cpu.c
>> index 95d4fd8f7a96..c3cf7fa76424 100644
>> --- a/drivers/irqchip/irq-mips-cpu.c
>> +++ b/drivers/irqchip/irq-mips-cpu.c
>> @@ -251,7 +251,7 @@ static void __init __mips_cpu_irq_init(struct 
>> device_node *of_node)
>>  	clear_c0_status(ST0_IM);
>>  	clear_c0_cause(CAUSEF_IP);
>> 
>> -	irq_domain = irq_domain_add_legacy(of_node, 8, MIPS_CPU_IRQ_BASE, 0,
>> +	irq_domain = irq_domain_add_simple(of_node, 8, MIPS_CPU_IRQ_BASE,
>>  					   &mips_cpu_intc_irq_domain_ops,
>>  					   NULL);
> 
> this breaks at least IP30 and guess it will break every platform where
> MIPS_CPU_IRQ_BASE == 0. add_legacy will always do 
> irq_domain_associate_many(),
> while add_simple doesn't do it, if first_irq == 0.
> 
> Marc, what is the reason not doing it all the time ? What's the correct
> way here to work with irq_domain_add_simple() in this case ?

On a fully DT-ified platform, using non-legacy irqdomains, virtual 
interrupts
are allocated as a "random" number, depending on the order of 
allocation,
and on demand.

The first_irq hack in irq_domain_add_simple() is just a way to still 
allocate
descriptors upfront (and I wish we could drop it...).

If you have legacy code that "knows" about the relationship between 
Linux's
virtual interrupt and the hwirq (that is only meaningful to the 
interrupt
controller), you're screwed, and need to stick to the legacy irqdomain.

It feels like the MIPS code is squarely in the latter case, so I guess 
this
patch is probably the wrong thing to do for this architecture.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
