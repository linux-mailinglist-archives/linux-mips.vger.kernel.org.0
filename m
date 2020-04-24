Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 513571B6FBB
	for <lists+linux-mips@lfdr.de>; Fri, 24 Apr 2020 10:28:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726489AbgDXI2Z (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Apr 2020 04:28:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:40034 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726028AbgDXI2Z (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 24 Apr 2020 04:28:25 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 15A8220724;
        Fri, 24 Apr 2020 08:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587716904;
        bh=671AeezqaSdpn4DaBFsbVvETM5t+l6VPbG1sR5DenCs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=f8mLiEMMjzCrqle954gNLa0ZlIL2fhoxaNb12WQFbVCeMWVfGuGneUuHXCRsqYl6Y
         siur82anLuAw+EoNhD2GT2Qiv6bJYaddTyxc6Qf7wbvLZEVa7C5lWXWdKM2o18WogZ
         NYb5+tO3QoErU/p8WBwcEhIrLExD/nUCh+ySydnQ=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1jRth8-005zhM-C6; Fri, 24 Apr 2020 09:28:22 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 24 Apr 2020 09:28:22 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>,
        Huacai Chen <chenhc@lemote.com>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 5/6] irqchip: Add Loongson PCH MSI controller
In-Reply-To: <20200424093351.370c92e8@flygoat-x1e>
References: <20200422142428.1249684-1-jiaxun.yang@flygoat.com>
 <20200422142428.1249684-6-jiaxun.yang@flygoat.com>
 <20200423154135.38b0ec25@why> <20200424093351.370c92e8@flygoat-x1e>
Message-ID: <7c00f8964c2a83a56ae24a81ebe1c9e9@kernel.org>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/1.3.10
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org, tglx@linutronix.de, jason@lakedaemon.net, robh+dt@kernel.org, chenhc@lemote.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2020-04-24 02:33, Jiaxun Yang wrote:
> On Thu, 23 Apr 2020 15:41:35 +0100
> Marc Zyngier <maz@kernel.org> wrote:
> 
>> On Wed, 22 Apr 2020 22:24:25 +0800
>> Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>> 
>> > This controller appears on Loongson-7A family of PCH to transform
>> > interrupts from PCI MSI into HyperTransport vectorized interrrupts
>> > and send them to procrssor's HT vector controller.
>> >
>> > Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> > ---
> [...]
>> > +	ret = irq_domain_alloc_irqs_parent(domain, virq, 1,
>> > &fwspec);
>> > +	if (ret)
>> > +		return ret;
>> > +
>> > +	irq_domain_set_info(domain, virq, hwirq,
>> > +			    &middle_irq_chip, NULL,
>> > +			    handle_simple_irq, NULL, NULL);
>> 
>> No, this should at least be handle_edge_irq. More importantly, you
>> should use the flow set by the underlying irqchip, and not provide
>> your own.
> 
> Hi Marc,
> Thanks for your review.
> 
> The underlying irqchip (HTVEC) follows a simple_irq flow as it only
> has mask/unmask callback, and it doesn't have tyoe configuration. so I
> followed simple_irq flow.

Not having a type doesn't mean that it can stick to simple_irq, which is
the wrong things to use in 99% of the HW cases.

> How can I use the flow set by the underlying irqchip? Just use
> irq_domain_set_hwirq_and_chip here and set_handler in HTVEC driver?

You need to find out how the HTVEC behaves. My gut feeling is that it
is itself edge triggered, but you would need to look in the 
documentation
to find out.

> 
> 
>> 
>> > +	irq_set_probe(virq);
>> 
>> Probe? what does it mean for MSIs? I also don't see how you tell the
>> underlying irqchip that the MSI is edge triggered.
>> 
>> > +
>> > +	return 0;
>> > +}
>> > +
>> > +static int pch_msi_middle_domain_alloc(struct irq_domain *domain,
>> > +					   unsigned int virq,
>> > +					   unsigned int nr_irqs,
>> > void *args) +{
>> > +	struct pch_msi_data *priv = domain->host_data;
>> > +	int hwirq, err, i;
>> > +
>> > +	hwirq = pch_msi_allocate_hwirq(priv, nr_irqs);
>> > +	if (hwirq < 0)
>> > +		return hwirq;
>> > +
>> > +	for (i = 0; i < nr_irqs; i++) {
>> > +		err = pch_msi_parent_domain_alloc(domain, virq +
>> > i, hwirq + i);
>> > +		if (err)
>> > +			goto err_hwirq;
>> > +
>> > +		irq_domain_set_hwirq_and_chip(domain, virq + i,
>> > hwirq + i,
>> > +					      &middle_irq_chip,
>> > priv);
>> > +	}
>> > +
>> > +	return 0;
>> > +err_hwirq:
>> > +	while (--i >= 0)
>> > +		irq_domain_free_irqs_parent(domain, virq, i);
>> > +
>> > +	pch_msi_free_hwirq(priv, hwirq, nr_irqs);
>> > +	return err;
>> > +}
>> > +
>> > +static void pch_msi_middle_domain_free(struct irq_domain *domain,
>> > +					   unsigned int virq,
>> > +					   unsigned int nr_irqs)
>> > +{
>> > +	struct irq_data *d = irq_domain_get_irq_data(domain, virq);
>> > +	struct pch_msi_data *priv = irq_data_get_irq_chip_data(d);
>> > +
>> > +	irq_domain_free_irqs_parent(domain, virq, nr_irqs);
>> > +	pch_msi_free_hwirq(priv, d->hwirq, nr_irqs);
>> > +}
>> > +
>> > +static const struct irq_domain_ops pch_msi_middle_domain_ops = {
>> > +	.alloc	= pch_msi_middle_domain_alloc,
>> > +	.free	= pch_msi_middle_domain_free,
>> > +};
>> > +
>> > +static int pch_msi_init_domains(struct pch_msi_data *priv,
>> > +				struct device_node *node,
>> > +				struct device_node *parent)
>> > +{
>> > +	struct irq_domain *middle_domain, *msi_domain,
>> > *parent_domain; +
>> > +	parent_domain = irq_find_host(parent);
>> > +	if (!parent_domain) {
>> > +		pr_err("Failed to find the parent domain\n");
>> > +		return -ENXIO;
>> > +	}
>> > +
>> > +	middle_domain = irq_domain_add_tree(NULL,
>> > +
>> > &pch_msi_middle_domain_ops,
>> > +					    priv);
>> 
>> You don't really need a tree, unless your interrupt space is huge and
>> very sparse. Given that the DT example says 64, I would go with a
>> linear domain if that number is realistic.
>> 
> It can up to 192 in latest generation of chip, is it still suitable?

That's a pretty small number, really. Just stick to a linear domain.

> In the latest generation, we have a enhanced version of HTVEC which has
> another delivery system that will be able to configure affinity. That's
> why I placed set_affinity call back here and in PCH PIC driver.

Once you add support for this new version, this will make sense. at the
moment, this is pretty pointless.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
