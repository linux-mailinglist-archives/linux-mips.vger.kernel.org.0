Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10EB319288B
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2020 13:39:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727406AbgCYMjV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 25 Mar 2020 08:39:21 -0400
Received: from elvis.franken.de ([193.175.24.41]:34061 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727316AbgCYMjV (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 25 Mar 2020 08:39:21 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jH5JN-0002o0-00; Wed, 25 Mar 2020 13:39:09 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id B928DC09A5; Wed, 25 Mar 2020 13:37:42 +0100 (CET)
Date:   Wed, 25 Mar 2020 13:37:42 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, Huacai Chen <chenhc@lemote.com>,
        Marc Zyngier <maz@kernel.org>,
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
Message-ID: <20200325123742.GA9911@alpha.franken.de>
References: <20200325035537.156911-1-jiaxun.yang@flygoat.com>
 <20200325035537.156911-7-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200325035537.156911-7-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Mar 25, 2020 at 11:54:59AM +0800, Jiaxun Yang wrote:
> The old code is using legacy domain to setup irq_domain for CPU interrupts
> which requires irq_desc to be preallocated.
> 
> However, when MIPS_CPU_IRQ_BASE >= 16, irq_desc for CPU IRQs may end up
> unallocated and lead to incorrect behavior.
> 
> Thus we convert the legacy domain to simple domain which can allocate
> irq_desc during initialization.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Co-developed-by: Huacai Chen <chenhc@lemote.com>
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> Reviewed-by: Marc Zyngier <maz@kernel.org>
> ---
>  drivers/irqchip/irq-mips-cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/irq-mips-cpu.c b/drivers/irqchip/irq-mips-cpu.c
> index 95d4fd8f7a96..c3cf7fa76424 100644
> --- a/drivers/irqchip/irq-mips-cpu.c
> +++ b/drivers/irqchip/irq-mips-cpu.c
> @@ -251,7 +251,7 @@ static void __init __mips_cpu_irq_init(struct device_node *of_node)
>  	clear_c0_status(ST0_IM);
>  	clear_c0_cause(CAUSEF_IP);
>  
> -	irq_domain = irq_domain_add_legacy(of_node, 8, MIPS_CPU_IRQ_BASE, 0,
> +	irq_domain = irq_domain_add_simple(of_node, 8, MIPS_CPU_IRQ_BASE,
>  					   &mips_cpu_intc_irq_domain_ops,
>  					   NULL);

this breaks at least IP30 and guess it will break every platform where
MIPS_CPU_IRQ_BASE == 0. add_legacy will always do irq_domain_associate_many(),
while add_simple doesn't do it, if first_irq == 0.

Marc, what is the reason not doing it all the time ? What's the correct
way here to work with irq_domain_add_simple() in this case ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
