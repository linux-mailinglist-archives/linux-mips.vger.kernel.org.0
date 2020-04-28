Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D25B1BBE8C
	for <lists+linux-mips@lfdr.de>; Tue, 28 Apr 2020 15:07:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726746AbgD1NHp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Apr 2020 09:07:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:48118 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726785AbgD1NHo (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 Apr 2020 09:07:44 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B943B206A1;
        Tue, 28 Apr 2020 13:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588079263;
        bh=MQoMdUceInH89eBaiNkYYgJHTBuuDfLA5YzYK9YhA14=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=BHGqWGkrUxuj1sqUvNvbrhi+mHKIgGeAEAILmH6/HvmlP0FYu2yGauQ15/wf2ii5d
         I35bv5gh79p3quSgAV+MuNzxYEGBreSfpalQmCxZfHRUu5+ur0ssYINt1zF2dr+Zky
         CW4n5NJRgAtJGp2MFFM7j6vnUjVFSndAtnIYN5W8=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=why)
        by disco-boy.misterjones.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1jTPxd-007MU2-NR; Tue, 28 Apr 2020 14:07:41 +0100
Date:   Tue, 28 Apr 2020 14:07:40 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>,
        Huacai Chen <chenhc@lemote.com>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v2 5/6] irqchip: Add Loongson PCH MSI controller
Message-ID: <20200428140740.1a417695@why>
In-Reply-To: <20200428063247.2223499-5-jiaxun.yang@flygoat.com>
References: <20200422142428.1249684-1-jiaxun.yang@flygoat.com>
        <20200428063247.2223499-1-jiaxun.yang@flygoat.com>
        <20200428063247.2223499-5-jiaxun.yang@flygoat.com>
Organization: Approximate
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: jiaxun.yang@flygoat.com, tglx@linutronix.de, jason@lakedaemon.net, robh+dt@kernel.org, chenhc@lemote.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mips@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 28 Apr 2020 14:32:44 +0800
Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:

> This controller appears on Loongson LS7A family of PCH to transform
> interrupts from PCI MSI into HyperTransport vectorized interrrupts
> and send them to procrssor's HT vector controller.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> --
> v2:
> 	- Style clean-ups
> 	- Add ack callback
> 	- Use bitmap_find_free_region
> ---
>  drivers/irqchip/Kconfig                |  10 +
>  drivers/irqchip/Makefile               |   1 +
>  drivers/irqchip/irq-loongson-pch-msi.c | 259 +++++++++++++++++++++++++
>  3 files changed, 270 insertions(+)
>  create mode 100644 drivers/irqchip/irq-loongson-pch-msi.c
> 
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index 5524a621638c..0b6b826dd843 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -549,4 +549,14 @@ config LOONGSON_PCH_PIC
>  	help
>  	  Support for the Loongson PCH PIC Controller.
>  
> +config LOONGSON_PCH_MSI
> +	bool "Loongson PCH PIC Controller"
> +	depends on MACH_LOONGSON64 || COMPILE_TEST
> +	depends on PCI
> +	default MACH_LOONGSON64
> +	select IRQ_DOMAIN_HIERARCHY
> +	select PCI_MSI
> +	help
> +	  Support for the Loongson PCH MSI Controller.
> +
>  endmenu
> diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
> index acc72331cec8..3a4ce283189a 100644
> --- a/drivers/irqchip/Makefile
> +++ b/drivers/irqchip/Makefile
> @@ -109,3 +109,4 @@ obj-$(CONFIG_LOONGSON_LIOINTC)		+= irq-loongson-liointc.o
>  obj-$(CONFIG_LOONGSON_HTPIC)		+= irq-loongson-htpic.o
>  obj-$(CONFIG_LOONGSON_HTVEC)		+= irq-loongson-htvec.o
>  obj-$(CONFIG_LOONGSON_PCH_PIC)		+= irq-loongson-pch-pic.o
> +obj-$(CONFIG_LOONGSON_PCH_MSI)		+= irq-loongson-pch-msi.o
> diff --git a/drivers/irqchip/irq-loongson-pch-msi.c b/drivers/irqchip/irq-loongson-pch-msi.c
> new file mode 100644
> index 000000000000..5b4d607a899e
> --- /dev/null
> +++ b/drivers/irqchip/irq-loongson-pch-msi.c
> @@ -0,0 +1,259 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + *  Copyright (C) 2020, Jiaxun Yang <jiaxun.yang@flygoat.com>
> + *  Loongson PCH MSI support
> + */
> +
> +#define pr_fmt(fmt) "pch-msi: " fmt
> +
> +#include <linux/irqchip.h>
> +#include <linux/msi.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_pci.h>
> +#include <linux/pci.h>
> +#include <linux/slab.h>
> +
> +struct pch_msi_data {
> +	spinlock_t		msi_map_lock;
> +	phys_addr_t		doorbell;
> +	u32			irq_first;	/* The vector number that MSIs starts */
> +	u32			num_irqs;	/* The number of vectors for MSIs */
> +	unsigned long		*msi_map;
> +};
> +
> +static void pch_msi_mask_msi_irq(struct irq_data *d)
> +{
> +	pci_msi_mask_irq(d);
> +	irq_chip_mask_parent(d);
> +}
> +
> +static void pch_msi_unmask_msi_irq(struct irq_data *d)
> +{
> +	pci_msi_unmask_irq(d);
> +	irq_chip_unmask_parent(d);
> +}
> +
> +static struct irq_chip pch_msi_irq_chip = {
> +	.name			= "PCH MSI",
> +	.irq_mask		= pch_msi_mask_msi_irq,
> +	.irq_unmask		= pch_msi_unmask_msi_irq,
> +	.irq_ack		= irq_chip_ack_parent,
> +	.irq_set_affinity	= irq_chip_set_affinity_parent,
> +};
> +
> +static int pch_msi_allocate_hwirq(struct pch_msi_data *priv, int num_req)
> +{
> +	int first;
> +
> +	spin_lock(&priv->msi_map_lock);

Why does it have to be a spinlock? As far as I can tell, we never
allocate MSIs from non-preemptible contexts.

> +
> +	first = bitmap_find_free_region(priv->msi_map, priv->num_irqs,
> +					get_count_order(num_req));
> +	if (first < 0) {
> +		spin_unlock(&priv->msi_map_lock);
> +		return -ENOSPC;
> +	}
> +
> +	bitmap_set(priv->msi_map, first, num_req);

What is that for? bitmap_find_free_region has already done the work for
you.

> +	spin_unlock(&priv->msi_map_lock);
> +
> +	return priv->irq_first + first;
> +}
> +
> +static void pch_msi_free_hwirq(struct pch_msi_data *priv,
> +				int hwirq, int num_req)
> +{
> +	int first = hwirq - priv->irq_first;
> +
> +	spin_lock(&priv->msi_map_lock);
> +	bitmap_clear(priv->msi_map, first, num_req);

bitmap_clear doesn't reverse the effects of bitmap_find_free_region.

> +	spin_unlock(&priv->msi_map_lock);
> +}
> +
> +static void pch_msi_compose_msi_msg(struct irq_data *data,
> +					struct msi_msg *msg)
> +{
> +	struct pch_msi_data *priv = irq_data_get_irq_chip_data(data);
> +
> +	msg->address_hi = upper_32_bits(priv->doorbell);
> +	msg->address_lo = lower_32_bits(priv->doorbell);
> +	msg->data = data->hwirq;
> +}
> +
> +static struct msi_domain_info pch_msi_domain_info = {
> +	.flags		= MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS |
> +			  MSI_FLAG_MULTI_PCI_MSI | MSI_FLAG_PCI_MSIX,
> +	.chip	= &pch_msi_irq_chip,
> +};
> +
> +static struct irq_chip middle_irq_chip = {
> +	.name			= "PCH MSI Middle",

This "middle" thing doesn't mean anything. What it really implements is
a generic MSI irqchip. What you call PCH MSI seems to be PCI-MSI. Pretty
confusing.

> +	.irq_mask		= irq_chip_mask_parent,
> +	.irq_unmask		= irq_chip_unmask_parent,
> +	.irq_ack		= irq_chip_ack_parent,
> +	.irq_set_affinity	= irq_chip_set_affinity_parent,
> +	.irq_compose_msi_msg	= pch_msi_compose_msi_msg,
> +};
> +
> +static int pch_msi_parent_domain_alloc(struct irq_domain *domain,
> +					unsigned int virq, int hwirq)
> +{
> +	struct irq_fwspec fwspec;
> +	int ret;
> +
> +	fwspec.fwnode = domain->parent->fwnode;
> +	fwspec.param_count = 1;
> +	fwspec.param[0] = hwirq;
> +
> +	ret = irq_domain_alloc_irqs_parent(domain, virq, 1, &fwspec);
> +	if (ret)
> +		return ret;
> +
> +	irq_domain_set_hwirq_and_chip(domain, virq, hwirq,
> +					&middle_irq_chip, NULL);
> +
> +	return 0;
> +}
> +
> +static int pch_msi_middle_domain_alloc(struct irq_domain *domain,
> +					   unsigned int virq,
> +					   unsigned int nr_irqs, void *args)
> +{
> +	struct pch_msi_data *priv = domain->host_data;
> +	int hwirq, err, i;
> +
> +	hwirq = pch_msi_allocate_hwirq(priv, nr_irqs);
> +	if (hwirq < 0)
> +		return hwirq;
> +
> +	for (i = 0; i < nr_irqs; i++) {
> +		err = pch_msi_parent_domain_alloc(domain, virq + i, hwirq + i);
> +		if (err)
> +			goto err_hwirq;
> +
> +		irq_domain_set_hwirq_and_chip(domain, virq + i, hwirq + i,
> +					      &middle_irq_chip, priv);

So you're doing that twice per MSI. I think once is enough.

> +	}
> +
> +	return 0;
> +
> +err_hwirq:
> +	while (--i >= 0)
> +		irq_domain_free_irqs_parent(domain, virq, i);

This looks very wrong. Why isn't it just:

	irq_domain_free_irqs_parent(domain, virq, i - 1);

?

> +
> +	pch_msi_free_hwirq(priv, hwirq, nr_irqs);

And when you look at the whole error handling (once fixed), it is
exactly pch_msi_middle_domain_free(). So why not calling this directly?

> +	return err;
> +}
> +
> +static void pch_msi_middle_domain_free(struct irq_domain *domain,
> +					   unsigned int virq,
> +					   unsigned int nr_irqs)
> +{
> +	struct irq_data *d = irq_domain_get_irq_data(domain, virq);
> +	struct pch_msi_data *priv = irq_data_get_irq_chip_data(d);
> +
> +	irq_domain_free_irqs_parent(domain, virq, nr_irqs);
> +	pch_msi_free_hwirq(priv, d->hwirq, nr_irqs);
> +}
> +
> +static const struct irq_domain_ops pch_msi_middle_domain_ops = {
> +	.alloc	= pch_msi_middle_domain_alloc,
> +	.free	= pch_msi_middle_domain_free,
> +};
> +
> +static int pch_msi_init_domains(struct pch_msi_data *priv,
> +				struct device_node *node,
> +				struct device_node *parent)
> +{
> +	struct irq_domain *middle_domain, *msi_domain,
> *parent_domain; +
> +	parent_domain = irq_find_host(parent);
> +	if (!parent_domain) {
> +		pr_err("Failed to find the parent domain\n");
> +		return -ENXIO;
> +	}

Can't you check this early in the probe routine and bail out?

> +
> +	middle_domain = irq_domain_add_linear(NULL, priv->num_irqs,
> +						&pch_msi_middle_domain_ops,
> +						priv);

NULL isn't an acceptable parameter. This irqdomain really belongs to
the node. See irq_domain_update_bus_token() to specialize the domain so
that its allocation doesn't clash with the PCI domain that you allocate
below (DOMAIN_BUS_NEXUS is used by quite a few drivers).

Also, please use irq_domain_create_linear instead, in order
to be consistent with the rest of the API usage in this file.

> +	if (!middle_domain) {
> +		pr_err("Failed to create the MSI middle domain\n");
> +		return -ENOMEM;
> +	}
> +
> +	middle_domain->parent = parent_domain;
> +
> +	msi_domain = pci_msi_create_irq_domain(of_node_to_fwnode(node),
> +					       &pch_msi_domain_info,
> +					       middle_domain);
> +	if (!msi_domain) {
> +		pr_err("Failed to create MSI domain\n");
> +		irq_domain_remove(middle_domain);
> +		return -ENOMEM;
> +	}
> +
> +	return 0;
> +}
> +
> +static int pch_msi_init(struct device_node *node,
> +			    struct device_node *parent)
> +{
> +	struct pch_msi_data *priv;
> +	struct resource res;
> +	int ret;
> +
> +	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	spin_lock_init(&priv->msi_map_lock);
> +
> +	ret = of_address_to_resource(node, 0, &res);
> +	if (ret) {
> +		pr_err("Failed to allocate resource\n");
> +		goto err_priv;
> +	}
> +
> +	priv->doorbell = res.start;
> +
> +	if (of_property_read_u32(node, "loongson,msi-base-vec",
> +				&priv->irq_first)) {
> +		pr_err("Unable to parse MSI vec base\n");
> +		ret = -EINVAL;
> +		goto err_priv;
> +	}
> +
> +	if (of_property_read_u32(node, "loongson,msi-num-vecs",
> +				&priv->num_irqs)) {
> +		pr_err("Unable to parse MSI vec number\n");
> +		ret = -EINVAL;
> +		goto err_priv;
> +	}
> +
> +	priv->msi_map = kcalloc(BITS_TO_LONGS(priv->num_irqs),
> +				sizeof(*priv->msi_map),
> +				GFP_KERNEL);

We have bitmap_alloc() that should already do the right thing.

> +	if (!priv->msi_map) {
> +		ret = -ENOMEM;
> +		goto err_priv;
> +	}
> +
> +	pr_debug("Registering %d MSIs, starting at %d\n",
> +		 priv->num_irqs, priv->irq_first);
> +
> +	ret = pch_msi_init_domains(priv, node, parent);
> +	if (ret)
> +		goto err_map;
> +
> +	return 0;
> +
> +err_map:
> +	kfree(priv->msi_map);
> +err_priv:
> +	kfree(priv);
> +	return ret;
> +}
> +
> +IRQCHIP_DECLARE(pch_msi, "loongson,pch-msi-1.0", pch_msi_init);


Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
