Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 845F41B6AD4
	for <lists+linux-mips@lfdr.de>; Fri, 24 Apr 2020 03:34:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725913AbgDXBeU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Apr 2020 21:34:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725884AbgDXBeT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 23 Apr 2020 21:34:19 -0400
Received: from vultr.net.flygoat.com (vultr.net.flygoat.com [IPv6:2001:19f0:6001:3633:5400:2ff:fe8c:553])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96950C09B042;
        Thu, 23 Apr 2020 18:34:07 -0700 (PDT)
Received: from flygoat-x1e (unknown [IPv6:240e:390:49b:be80::d68])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id D76FA204F6;
        Fri, 24 Apr 2020 01:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1587692046; bh=y3UcmMZ5+BKX3Fs28CsIVIv20Sx6Su/SHtT1a7hY2AA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=W/DT2LnKH0odWP61kNgxzFDeGknUaUIUWZLE502JFlNv39JqTXGzHCW/QDsmoNgiQ
         V7mWV09/rijjGRPw+410tJ5WmoCQXK6NDSRkQjbmgpkSCDsQWePtAgh7SPDbm1hrLE
         OUvNjUgnkF8o8YoqYm8VXtKzw7qKMSH3nDS4B1nbcfgkNQMmdIxQoHFAHOqNF8i671
         pmw2dKOn+ZvVxm6eJDTKUB4vltKy2yzoksr0tBrdFqTeceSj/e5uGXmFQWHMKJUfYI
         Vca6YeZ1L5SYWxhvi9hh9dLng8XiVZQvn5ibs8jjg1B1/WepjV+mxFYuGKg86LRV9G
         ONX9rAAX/OlWw==
Date:   Fri, 24 Apr 2020 09:33:51 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     Marc Zyngier <maz@kernel.org>
Cc:     linux-mips@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>,
        Huacai Chen <chenhc@lemote.com>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 5/6] irqchip: Add Loongson PCH MSI controller
Message-ID: <20200424093351.370c92e8@flygoat-x1e>
In-Reply-To: <20200423154135.38b0ec25@why>
References: <20200422142428.1249684-1-jiaxun.yang@flygoat.com>
        <20200422142428.1249684-6-jiaxun.yang@flygoat.com>
        <20200423154135.38b0ec25@why>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 23 Apr 2020 15:41:35 +0100
Marc Zyngier <maz@kernel.org> wrote:

> On Wed, 22 Apr 2020 22:24:25 +0800
> Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
> 
> > This controller appears on Loongson-7A family of PCH to transform
> > interrupts from PCI MSI into HyperTransport vectorized interrrupts
> > and send them to procrssor's HT vector controller.
> > 
> > Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > ---
[...]
> > +	ret = irq_domain_alloc_irqs_parent(domain, virq, 1,
> > &fwspec);
> > +	if (ret)
> > +		return ret;
> > +
> > +	irq_domain_set_info(domain, virq, hwirq,
> > +			    &middle_irq_chip, NULL,
> > +			    handle_simple_irq, NULL, NULL);  
> 
> No, this should at least be handle_edge_irq. More importantly, you
> should use the flow set by the underlying irqchip, and not provide
> your own.

Hi Marc,
Thanks for your review.

The underlying irqchip (HTVEC) follows a simple_irq flow as it only
has mask/unmask callback, and it doesn't have tyoe configuration. so I
followed simple_irq flow.

How can I use the flow set by the underlying irqchip? Just use
irq_domain_set_hwirq_and_chip here and set_handler in HTVEC driver?


> 
> > +	irq_set_probe(virq);  
> 
> Probe? what does it mean for MSIs? I also don't see how you tell the
> underlying irqchip that the MSI is edge triggered.
> 
> > +
> > +	return 0;
> > +}
> > +
> > +static int pch_msi_middle_domain_alloc(struct irq_domain *domain,
> > +					   unsigned int virq,
> > +					   unsigned int nr_irqs,
> > void *args) +{
> > +	struct pch_msi_data *priv = domain->host_data;
> > +	int hwirq, err, i;
> > +
> > +	hwirq = pch_msi_allocate_hwirq(priv, nr_irqs);
> > +	if (hwirq < 0)
> > +		return hwirq;
> > +
> > +	for (i = 0; i < nr_irqs; i++) {
> > +		err = pch_msi_parent_domain_alloc(domain, virq +
> > i, hwirq + i);
> > +		if (err)
> > +			goto err_hwirq;
> > +
> > +		irq_domain_set_hwirq_and_chip(domain, virq + i,
> > hwirq + i,
> > +					      &middle_irq_chip,
> > priv);
> > +	}
> > +
> > +	return 0;
> > +err_hwirq:
> > +	while (--i >= 0)
> > +		irq_domain_free_irqs_parent(domain, virq, i);
> > +
> > +	pch_msi_free_hwirq(priv, hwirq, nr_irqs);
> > +	return err;
> > +}
> > +
> > +static void pch_msi_middle_domain_free(struct irq_domain *domain,
> > +					   unsigned int virq,
> > +					   unsigned int nr_irqs)
> > +{
> > +	struct irq_data *d = irq_domain_get_irq_data(domain, virq);
> > +	struct pch_msi_data *priv = irq_data_get_irq_chip_data(d);
> > +
> > +	irq_domain_free_irqs_parent(domain, virq, nr_irqs);
> > +	pch_msi_free_hwirq(priv, d->hwirq, nr_irqs);
> > +}
> > +
> > +static const struct irq_domain_ops pch_msi_middle_domain_ops = {
> > +	.alloc	= pch_msi_middle_domain_alloc,
> > +	.free	= pch_msi_middle_domain_free,
> > +};
> > +
> > +static int pch_msi_init_domains(struct pch_msi_data *priv,
> > +				struct device_node *node,
> > +				struct device_node *parent)
> > +{
> > +	struct irq_domain *middle_domain, *msi_domain,
> > *parent_domain; +
> > +	parent_domain = irq_find_host(parent);
> > +	if (!parent_domain) {
> > +		pr_err("Failed to find the parent domain\n");
> > +		return -ENXIO;
> > +	}
> > +
> > +	middle_domain = irq_domain_add_tree(NULL,
> > +
> > &pch_msi_middle_domain_ops,
> > +					    priv);  
> 
> You don't really need a tree, unless your interrupt space is huge and
> very sparse. Given that the DT example says 64, I would go with a
> linear domain if that number is realistic.
> 
It can up to 192 in latest generation of chip, is it still suitable?

In the latest generation, we have a enhanced version of HTVEC which has
another delivery system that will be able to configure affinity. That's
why I placed set_affinity call back here and in PCH PIC driver.

Thanks. 

[...]
> > +}
> > +
> > +IRQCHIP_DECLARE(pch_msi, "loongson,pch-msi-1.0", pch_msi_init);  
> 
> Thanks,
> 
> 	M.

--
Jiaxun Yang
