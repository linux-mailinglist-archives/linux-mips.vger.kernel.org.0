Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 674AD1B5DAA
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2020 16:23:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726377AbgDWOXw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Apr 2020 10:23:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:60422 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726183AbgDWOXw (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 23 Apr 2020 10:23:52 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 768D6206ED;
        Thu, 23 Apr 2020 14:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587651831;
        bh=zlnjze7dAJ71hes0fMnmoTf9cH4Vak3p90j4C4dQrSE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=m3JmlGXBqxs+5jikuoAKWAVrAyMOqquhhc+YFZxxH8MTdVTgX5G+pf3tlc11BrXVX
         5i+k0Yr8KgCg0iv3HmvZ+k+JwE/1a3z5aMuzS2bT2jj5vxvfC1l8aJjNuQEkhzggsI
         44ppAXKtTGexKY79jI6fEw5wuSpZDKkd8fH/U1HA=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=why)
        by disco-boy.misterjones.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1jRclZ-005nED-Pv; Thu, 23 Apr 2020 15:23:49 +0100
Date:   Thu, 23 Apr 2020 15:23:48 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>,
        Huacai Chen <chenhc@lemote.com>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 3/6] irqchip: Add Loongson PCH PIC controller
Message-ID: <20200423152348.6f6f2b7b@why>
In-Reply-To: <20200422142428.1249684-4-jiaxun.yang@flygoat.com>
References: <20200422142428.1249684-1-jiaxun.yang@flygoat.com>
        <20200422142428.1249684-4-jiaxun.yang@flygoat.com>
Organization: Approximate
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org, tglx@linutronix.de, jason@lakedaemon.net, robh+dt@kernel.org, chenhc@lemote.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 22 Apr 2020 22:24:23 +0800
Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:

> This controller appears on Loongson-7A family of PCH to transform
> interrupts from devices into HyperTransport vectorized interrrupts
> and send them to procrssor's HT vector controller.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  drivers/irqchip/Kconfig                |   8 +
>  drivers/irqchip/Makefile               |   1 +
>  drivers/irqchip/irq-loongson-pch-pic.c | 256 +++++++++++++++++++++++++
>  3 files changed, 265 insertions(+)
>  create mode 100644 drivers/irqchip/irq-loongson-pch-pic.c
> 
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index de4564e2ea88..4ab7a9b1a5c2 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -540,4 +540,12 @@ config LOONGSON_HTVEC
>  	help
>  	  Support for the Loongson3 HyperTransport Interrupt Vector Controller.
>  
> +config LOONGSON_PCH_PIC
> +	bool "Loongson PCH PIC Controller"
> +	depends on MACH_LOONGSON64 || COMPILE_TEST
> +	default MACH_LOONGSON64
> +	select IRQ_DOMAIN_HIERARCHY
> +	help
> +	  Support for the Loongson PCH PIC Controller.
> +
>  endmenu
> diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
> index 74561879f5a7..acc72331cec8 100644
> --- a/drivers/irqchip/Makefile
> +++ b/drivers/irqchip/Makefile
> @@ -108,3 +108,4 @@ obj-$(CONFIG_TI_SCI_INTA_IRQCHIP)	+= irq-ti-sci-inta.o
>  obj-$(CONFIG_LOONGSON_LIOINTC)		+= irq-loongson-liointc.o
>  obj-$(CONFIG_LOONGSON_HTPIC)		+= irq-loongson-htpic.o
>  obj-$(CONFIG_LOONGSON_HTVEC)		+= irq-loongson-htvec.o
> +obj-$(CONFIG_LOONGSON_PCH_PIC)		+= irq-loongson-pch-pic.o
> diff --git a/drivers/irqchip/irq-loongson-pch-pic.c b/drivers/irqchip/irq-loongson-pch-pic.c
> new file mode 100644
> index 000000000000..717ab8335074
> --- /dev/null
> +++ b/drivers/irqchip/irq-loongson-pch-pic.c
> @@ -0,0 +1,256 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + *  Copyright (C) 2020, Jiaxun Yang <jiaxun.yang@flygoat.com>
> + *  Loongson PCH PIC support
> + */
> +
> +#define pr_fmt(fmt) "pch-pic: " fmt
> +
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/irqchip.h>
> +#include <linux/irqdomain.h>
> +#include <linux/kernel.h>
> +#include <linux/platform_device.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_platform.h>
> +
> +/* Registers */
> +#define PCH_PIC_MASK		0x20
> +#define PCH_PIC_HTMSI_EN	0x40
> +#define PCH_PIC_EDGE		0x60
> +#define PCH_PIC_CLR			0x80
> +#define PCH_PIC_AUTO0		0xc0
> +#define PCH_PIC_AUTO1		0xe0
> +#define PCH_INT_ROUTE(irq)	(0x100 + irq)
> +#define PCH_INT_HTVEC(irq)	(0x200 + irq)
> +#define PCH_PIC_POL			0x3e0
> +
> +#define PIC_COUNT_PER_REG	32
> +#define PIC_REG_COUNT		2
> +#define PIC_COUNT			(PIC_COUNT_PER_REG * PIC_REG_COUNT)
> +#define PIC_REG_IDX(irq_id)	((irq_id) / PIC_COUNT_PER_REG)
> +#define PIC_REG_BIT(irq_id)	((irq_id) % PIC_COUNT_PER_REG)
> +
> +struct pch_pic {
> +	void __iomem *base;
> +	struct irq_domain *pic_domain;
> +	int	ht_vec_base;
> +	raw_spinlock_t pic_lock;
> +};

Same comment about the layout of the data structure.

> +
> +static void pch_pic_bitset(void __iomem *addr, int bit)
> +{
> +	u32 reg;
> +
> +	addr += PIC_REG_IDX(bit) * 4;
> +	reg = readl(addr);
> +	reg |= BIT(PIC_REG_BIT(bit));
> +	writel(reg, addr);
> +}
> +
> +static void pch_pic_bitclr(void __iomem *addr, int bit)
> +{
> +	u32 reg;
> +
> +	addr += PIC_REG_IDX(bit) * 4;
> +	reg = readl(addr);
> +	reg &= ~BIT(PIC_REG_BIT(bit));
> +	writel(reg, addr);
> +}
> +
> +static void pch_pic_eoi_irq(struct irq_data *d)
> +{
> +	struct pch_pic *priv = irq_data_get_irq_chip_data(d);
> +	u32 idx = PIC_REG_IDX(d->hwirq);
> +
> +	writel(BIT(PIC_REG_BIT(d->hwirq)),
> +			priv->base + PCH_PIC_CLR + idx * 4);
> +}
> +
> +static void pch_pic_mask_irq(struct irq_data *d)
> +{
> +	struct pch_pic *priv = irq_data_get_irq_chip_data(d);
> +	unsigned long flags;
> +
> +	raw_spin_lock_irqsave(&priv->pic_lock, flags);
> +	pch_pic_bitset(priv->base + PCH_PIC_MASK, d->hwirq);
> +	raw_spin_unlock_irqrestore(&priv->pic_lock, flags);
> +	irq_chip_mask_parent(d);
> +}
> +
> +static void pch_pic_unmask_irq(struct irq_data *d)
> +{
> +	struct pch_pic *priv = irq_data_get_irq_chip_data(d);
> +	unsigned long flags;
> +
> +	raw_spin_lock_irqsave(&priv->pic_lock, flags);
> +	pch_pic_bitclr(priv->base + PCH_PIC_MASK, d->hwirq);
> +	raw_spin_unlock_irqrestore(&priv->pic_lock, flags);
> +	irq_chip_unmask_parent(d);
> +}
> +
> +static int pch_pic_set_type(struct irq_data *d, unsigned int type)
> +{
> +	struct pch_pic *priv = irq_data_get_irq_chip_data(d);
> +	int ret = 0;
> +	unsigned long flags;
> +
> +	raw_spin_lock_irqsave(&priv->pic_lock, flags);
> +	switch (type) {
> +	case IRQ_TYPE_EDGE_RISING:
> +		pch_pic_bitset(priv->base + PCH_PIC_EDGE, d->hwirq);
> +		pch_pic_bitclr(priv->base + PCH_PIC_POL, d->hwirq);
> +		break;
> +	case IRQ_TYPE_EDGE_FALLING:
> +		pch_pic_bitset(priv->base + PCH_PIC_EDGE, d->hwirq);
> +		pch_pic_bitset(priv->base + PCH_PIC_POL, d->hwirq);
> +		break;
> +	case IRQ_TYPE_LEVEL_HIGH:
> +		pch_pic_bitclr(priv->base + PCH_PIC_EDGE, d->hwirq);
> +		pch_pic_bitclr(priv->base + PCH_PIC_POL, d->hwirq);
> +		break;
> +	case IRQ_TYPE_LEVEL_LOW:
> +		pch_pic_bitclr(priv->base + PCH_PIC_EDGE, d->hwirq);
> +		pch_pic_bitset(priv->base + PCH_PIC_POL, d->hwirq);
> +		break;
> +	default:
> +		ret = -EINVAL;
> +		break;
> +	}
> +	raw_spin_unlock_irqrestore(&priv->pic_lock, flags);

It would make a lot more sense if the locking was done in the
bitclr/bitset functions, unless there is a reason for wanting larger
critical sections (but I can't see it at the moment).

> +
> +	return ret;
> +}
> +
> +static void pch_pic_enable_irq(struct irq_data *d)
> +{
> +	struct pch_pic *priv = irq_data_get_irq_chip_data(d);
> +	u8 htvec = d->hwirq + priv->ht_vec_base;
> +	unsigned long flags;
> +
> +	raw_spin_lock_irqsave(&priv->pic_lock, flags);
> +	writeb(htvec, priv->base + PCH_INT_HTVEC(d->hwirq));
> +	/* Hardcode to HT0 Lo */
> +	writeb(1, priv->base + PCH_INT_ROUTE(d->hwirq));
> +	/* Clear auto bounce, we don't need that */
> +	pch_pic_bitclr(priv->base + PCH_PIC_AUTO0, d->hwirq);
> +	pch_pic_bitclr(priv->base + PCH_PIC_AUTO1, d->hwirq);
> +	/* Enable HTMSI transformer */
> +	pch_pic_bitset(priv->base + PCH_PIC_HTMSI_EN, d->hwirq);
> +	raw_spin_unlock_irqrestore(&priv->pic_lock, flags);
> +	pch_pic_unmask_irq(d);

This looks wrong. enable/disable should not call unmask/mask. It is
also odd that you don't have a proper disable callback that does the
opposite of enable (you call the mask callback, which is also wrong).

I suggest you kill enable/disable altogether, and move this code to the
the probe (or reset) function.

> +}
> +
> +static struct irq_chip pch_pic_irq_chip = {
> +	.name			= "PCH PIC",
> +	.irq_eoi		= pch_pic_eoi_irq,
> +	.irq_mask		= pch_pic_mask_irq,
> +	.irq_unmask		= pch_pic_unmask_irq,
> +	.irq_enable		= pch_pic_enable_irq,
> +	.irq_disable	= pch_pic_mask_irq,
> +	.irq_set_affinity	= irq_chip_set_affinity_parent,

Given that this plugs into the HTVEC irqchip, which doesn't implement
an affinity method (nor that it could, given that it is itself a
chained irqchip), I don't see the point...

> +	.irq_set_type		= pch_pic_set_type,
> +};
> +
> +static int pch_pic_alloc(struct irq_domain *domain, unsigned int virq,
> +			      unsigned int nr_irqs, void *arg)
> +{
> +	struct pch_pic *priv = domain->host_data;
> +	struct irq_fwspec fwspec;
> +	unsigned long hwirq;
> +	unsigned int type;
> +	int err;
> +
> +	irq_domain_translate_twocell(domain, arg, &hwirq, &type);
> +
> +	fwspec.fwnode = domain->parent->fwnode;
> +	fwspec.param_count = 1;
> +	fwspec.param[0] = hwirq + priv->ht_vec_base;
> +
> +	err = irq_domain_alloc_irqs_parent(domain, virq, 1, &fwspec);
> +	if (err)
> +		return err;
> +
> +	irq_domain_set_info(domain, virq, hwirq,
> +			    &pch_pic_irq_chip, priv,
> +			    handle_fasteoi_irq, NULL, NULL);
> +	irq_set_probe(virq);
> +
> +	return 0;
> +}
> +
> +static const struct irq_domain_ops pch_pic_domain_ops = {
> +	.translate = irq_domain_translate_twocell,
> +	.alloc	= pch_pic_alloc,
> +	.free	= irq_domain_free_irqs_parent,
> +};
> +
> +static void pch_pic_reset(struct pch_pic *priv)
> +{
> +	u32 idx;
> +
> +	/* Clear IRQ cause registers, mask all interrupts */
> +	for (idx = 0; idx < PIC_REG_COUNT; idx++) {
> +		writel_relaxed(0xFFFFFFFF, priv->base + PCH_PIC_MASK + 4 * idx);
> +		writel_relaxed(0xFFFFFFFF, priv->base + PCH_PIC_CLR + 4 * idx);
> +	}
> +}
> +
> +static int pch_pic_of_init(struct device_node *node,
> +				struct device_node *parent)
> +{
> +	struct pch_pic *priv;
> +	struct irq_domain *parent_domain;
> +	int err;
> +	u32 ht_vec_base;
> +
> +	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	raw_spin_lock_init(&priv->pic_lock);
> +	priv->base = of_iomap(node, 0);
> +	if (!priv->base) {
> +		err = -ENOMEM;
> +		goto free_priv;
> +	}
> +
> +	parent_domain = irq_find_host(parent);
> +	if (!parent_domain) {
> +		pr_err("Failed to find the parent domain\n");
> +		err = -ENXIO;
> +		goto iounmap_base;
> +	}
> +
> +	if (of_property_read_u32(node, "loongson,pic-base-vec",
> +				&ht_vec_base))
> +		priv->ht_vec_base = 64;

The binding doesn't describe the property as being optional.

> +	else
> +		priv->ht_vec_base = ht_vec_base;
> +
> +	priv->pic_domain = irq_domain_create_hierarchy(parent_domain, 0,
> +						     PIC_COUNT,
> +						     of_node_to_fwnode(node),
> +						     &pch_pic_domain_ops,
> +						     priv);
> +	if (!priv->pic_domain) {
> +		pr_err("Failed to create IRQ domain\n");
> +		err = -ENOMEM;
> +		goto iounmap_base;
> +	}
> +
> +	pch_pic_reset(priv);
> +
> +	return 0;
> +
> +iounmap_base:
> +	iounmap(priv->base);
> +free_priv:
> +	kfree(priv);
> +
> +	return err;
> +}
> +
> +IRQCHIP_DECLARE(pch_pic, "loongson,pch-pic-1.0", pch_pic_of_init);

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
