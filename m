Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4ACD9FB07
	for <lists+linux-mips@lfdr.de>; Wed, 28 Aug 2019 08:59:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726445AbfH1G75 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Wed, 28 Aug 2019 02:59:57 -0400
Received: from inca-roads.misterjones.org ([213.251.177.50]:53406 "EHLO
        inca-roads.misterjones.org" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726209AbfH1G74 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 28 Aug 2019 02:59:56 -0400
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=why)
        by cheepnis.misterjones.org with esmtpsa (TLSv1.2:AES256-GCM-SHA384:256)
        (Exim 4.80)
        (envelope-from <maz@kernel.org>)
        id 1i2rvi-0002v3-Uy; Wed, 28 Aug 2019 08:59:43 +0200
Date:   Wed, 28 Aug 2019 07:59:40 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, chenhc@lemote.com,
        paul.burton@mips.com, tglx@linutronix.de, jason@lakedaemon.net,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.co, devicetree@vger.kernel.org
Subject: Re: [PATCH 04/13] irqchip: Add driver for Loongson-3 I/O interrupt
 controller
Message-ID: <20190828075940.549e1983@why>
In-Reply-To: <82c4b9ed-7270-74ce-6e10-165182e540dd@flygoat.com>
References: <20190827085302.5197-1-jiaxun.yang@flygoat.com>
        <20190827085302.5197-5-jiaxun.yang@flygoat.com>
        <e6a5862f-0f6c-cab0-9f4a-51b7889d38e7@kernel.org>
        <82c4b9ed-7270-74ce-6e10-165182e540dd@flygoat.com>
Organization: Approximate
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org, chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de, jason@lakedaemon.net, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.co, devicetree@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on cheepnis.misterjones.org); SAEximRunCond expanded to false
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 28 Aug 2019 08:27:05 +0800
Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:

> On 2019/8/28 上午12:45, Marc Zyngier wrote:
> > On 27/08/2019 09:52, Jiaxun Yang wrote:  
> >> This controller appeared on Loongson-3 family of chips as the primary
> >> package interrupt source.
> >>
> >> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> >> ---
> >>   drivers/irqchip/Kconfig          |   9 ++
> >>   drivers/irqchip/Makefile         |   1 +
> >>   drivers/irqchip/irq-ls3-iointc.c | 216 +++++++++++++++++++++++++++++++
> >>   3 files changed, 226 insertions(+)
> >>   create mode 100644 drivers/irqchip/irq-ls3-iointc.c
> >>
> >> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> >> index 80e10f4e213a..8d9eac5fd4a7 100644
> >> --- a/drivers/irqchip/Kconfig
> >> +++ b/drivers/irqchip/Kconfig
> >> @@ -471,6 +471,15 @@ config TI_SCI_INTA_IRQCHIP
> >>   	  If you wish to use interrupt aggregator irq resources managed by the
> >>   	  TI System Controller, say Y here. Otherwise, say N.  
> >>   >> +config LS3_IOINTC  
> >> +	bool "Loongson3 I/O Interrupt Controller"
> >> +	depends on MACH_LOONGSON64
> >> +	default y
> >> +	select IRQ_DOMAIN
> >> +	select GENERIC_IRQ_CHIP
> >> +	help
> >> +	  Support for the Loongson-3 I/O Interrupt Controller.
> >> +
> >>   endmenu  
> >>   >>   config SIFIVE_PLIC  
> >> diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
> >> index 8d0fcec6ab23..49ecb8d38138 100644
> >> --- a/drivers/irqchip/Makefile
> >> +++ b/drivers/irqchip/Makefile
> >> @@ -102,3 +102,4 @@ obj-$(CONFIG_MADERA_IRQ)		+= irq-madera.o
> >>   obj-$(CONFIG_LS1X_IRQ)			+= irq-ls1x.o
> >>   obj-$(CONFIG_TI_SCI_INTR_IRQCHIP)	+= irq-ti-sci-intr.o
> >>   obj-$(CONFIG_TI_SCI_INTA_IRQCHIP)	+= irq-ti-sci-inta.o
> >> +obj-$(CONFIG_LS3_IOINTC)			+= irq-ls3-iointc.o
> >> diff --git a/drivers/irqchip/irq-ls3-iointc.c b/drivers/irqchip/irq-ls3-iointc.c
> >> new file mode 100644
> >> index 000000000000..1fc3c41c57d9
> >> --- /dev/null
> >> +++ b/drivers/irqchip/irq-ls3-iointc.c
> >> @@ -0,0 +1,216 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +/*
> >> + *  Copyright (C) 2019, Jiaxun Yang <jiaxun.yang@flygoat.com>
> >> + *  Loongson-3 IOINTC IRQ support
> >> + */
> >> +
> >> +#include <linux/errno.h>
> >> +#include <linux/init.h>
> >> +#include <linux/types.h>
> >> +#include <linux/interrupt.h>
> >> +#include <linux/ioport.h>
> >> +#include <linux/irqchip.h>
> >> +#include <linux/of_address.h>
> >> +#include <linux/of_irq.h>
> >> +#include <linux/io.h>
> >> +#include <linux/smp.h>
> >> +#include <linux/irqchip/chained_irq.h>
> >> +
> >> +
> >> +#define LS3_CHIP_IRQ	32
> >> +
> >> +#define LS3_INTC_CHIP_START	0x20
> >> +
> >> +#define LS3_REG_INTC_STATUS	0x00
> >> +#define LS3_REG_INTC_EN_STATUS	0x04
> >> +#define LS3_REG_INTC_ENABLE	0x08
> >> +#define LS3_REG_INTC_DISABLE	0x0c
> >> +#define LS3_REG_INTC_POL	0x10
> >> +#define LS3_REG_INTC_EDGE	0x18
> >> +
> >> +#define LS3_MAP_CORE_INT(x, y)	(u8)(BIT(x) | (BIT(y) << 4))
> >> +
> >> +
> >> +struct ls3_iointc_priv {
> >> +	struct irq_domain	*domain;
> >> +	void __iomem		*intc_base;
> >> +};
> >> +
> >> +
> >> +static void ls3_io_chained_handle_irq(struct irq_desc *desc)
> >> +{
> >> +	struct ls3_iointc_priv *priv = irq_desc_get_handler_data(desc);
> >> +	struct irq_chip *chip = irq_desc_get_chip(desc);
> >> +	u32 pending;
> >> +
> >> +	chained_irq_enter(chip, desc);
> >> +
> >> +	pending = readl(priv->intc_base + LS3_REG_INTC_EN_STATUS) &
> >> +		readl(priv->intc_base + LS3_REG_INTC_STATUS);  
> > Reading the enabled status from the HW on each interrupt? I'm sure
> > that's pretty cheap...  
> Seems expensive but to deal with a buggy hardware... That's worthy.

How broken is it? You very much seem to rely on the HW being correct
here, since you trust it exclusively. I'd expect the enable mask to be
a SW construct if you didn't blindly trust it.

And if this is truly the right way to do it, please document the
various problems with the controller so that we don't break it at a
later time.

> >  
> >> +
> >> +	if (!pending)
> >> +		spurious_interrupt();
> >> +
> >> +	while (pending) {
> >> +		int bit = __ffs(pending);
> >> +
> >> +		generic_handle_irq(irq_find_mapping(priv->domain, bit));
> >> +		pending &= ~BIT(bit);
> >> +	}
> >> +
> >> +	chained_irq_exit(chip, desc);
> >> +}
> >> +
> >> +
> >> +static void ls_intc_set_bit(struct irq_chip_generic *gc,
> >> +							unsigned int offset,
> >> +							u32 mask, bool set)
> >> +{
> >> +	if (set)
> >> +		writel(readl(gc->reg_base + offset) | mask,
> >> +		gc->reg_base + offset);  
> > Please correctly align the second line.
> >  
> >> +	else
> >> +		writel(readl(gc->reg_base + offset) & ~mask,
> >> +		gc->reg_base + offset);
> >> +}  
> > Have you tried this on a SMP system? A RMW without locking is unlikely
> > to go down very well.
> >  
> >> +
> >> +static int ls_intc_set_type(struct irq_data *data, unsigned int type)
> >> +{
> >> +	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(data);
> >> +	u32 mask = data->mask;
> >> +
> >> +	switch (type) {
> >> +	case IRQ_TYPE_LEVEL_HIGH:
> >> +		ls_intc_set_bit(gc, LS3_REG_INTC_EDGE, mask, false);
> >> +		ls_intc_set_bit(gc, LS3_REG_INTC_POL, mask, true);
> >> +		break;
> >> +	case IRQ_TYPE_LEVEL_LOW:
> >> +		ls_intc_set_bit(gc, LS3_REG_INTC_EDGE, mask, false);
> >> +		ls_intc_set_bit(gc, LS3_REG_INTC_POL, mask, false);
> >> +		break;
> >> +	case IRQ_TYPE_EDGE_RISING:
> >> +		ls_intc_set_bit(gc, LS3_REG_INTC_EDGE, mask, true);
> >> +		ls_intc_set_bit(gc, LS3_REG_INTC_POL, mask, true);
> >> +		break;
> >> +	case IRQ_TYPE_EDGE_FALLING:
> >> +		ls_intc_set_bit(gc, LS3_REG_INTC_EDGE, mask, true);
> >> +		ls_intc_set_bit(gc, LS3_REG_INTC_POL, mask, false);
> >> +		break;
> >> +	default:
> >> +		return -EINVAL;
> >> +	}
> >> +
> >> +	irqd_set_trigger_type(data, type);
> >> +	return 0;
> >> +}
> >> +
> >> +int __init ls3_iointc_of_init(struct device_node *node,
> >> +				       struct device_node *parent)
> >> +{
> >> +	struct irq_chip_generic *gc;
> >> +	struct irq_chip_type *ct;
> >> +	struct ls3_iointc_priv *priv;
> >> +	int parent_irq, err = 0;
> >> +	int core = cpu_logical_map(smp_processor_id());  
> > Are you guaranteed to be in a non-preemptible section here?  
> Yes, as irqchip will be initialized even earlier than clockevent. There must be non-preemptible.
> >  
> >> +	int ip = 0;
> >> +	int i;
> >> +	const u32 *map_ip, *map_core;
> >> +
> >> +	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
> >> +	if (!priv)
> >> +		return -ENOMEM;
> >> +
> >> +	priv->intc_base = of_iomap(node, 0);
> >> +	if (!priv->intc_base) {
> >> +		err = -ENODEV;
> >> +		goto out_free_priv;
> >> +	}
> >> +
> >> +	map_ip = of_get_property(node, "loongson,map-ip", NULL);
> >> +	if (!map_ip)
> >> +		goto no_ip;
> >> +	else if ((*map_ip) > 5)
> >> +		pr_err("* %pOF loongson,map-ip is invalid\n", node);
> >> +	else
> >> +		ip = (*map_ip);  
> > What is this "ip"?  
> The interrupt line number of CPU (parent intc). As MIPS called CPU interrupt registers "CAUSE_IP".

Then how comes this comes from the irqchip's DT node? This should be
part of the endpoint's interrupt specifier.

> >> +no_ip:
> >> +
> >> +	/* If this property does not exist or invalid,
> >> +	 * we map all IRQs to bootcore.
> >> +	 */  
> > Comment format.
> >  
> >> +	map_core = of_get_property(node, "loongson,map-core", NULL);
> >> +	if (!map_core)
> >> +		goto no_core;
> >> +	else if ((*map_core) > 3)
> >> +		pr_err("* %pOF loongson,map-core is invalid\n", node);
> >> +	else
> >> +		core = (*map_core);
> >> +no_core:
> >> +
> >> +	parent_irq = irq_of_parse_and_map(node, 0);
> >> +	if (!parent_irq) {
> >> +		pr_err("ls3-iointc: unable to get parent irq\n");
> >> +		err =  -ENODEV;
> >> +		goto out_iounmap;
> >> +	}
> >> +	/* Set up an IRQ domain */
> >> +	priv->domain = irq_domain_add_linear(node, 32, &irq_generic_chip_ops,
> >> +					     NULL);
> >> +	if (!priv->domain) {
> >> +		pr_err("ls3-iointc: cannot add IRQ domain\n");
> >> +		err = -ENOMEM;
> >> +		goto out_iounmap;
> >> +	}
> >> +
> >> +	err = irq_alloc_domain_generic_chips(priv->domain, 32, 1,
> >> +		node->full_name, handle_level_irq,
> >> +		IRQ_NOPROBE, 0, 0);
> >> +	if (err) {
> >> +		pr_err("ls3-iointc: unable to register IRQ domain\n");
> >> +		err = -ENOMEM;
> >> +		goto out_free_domain;
> >> +	}
> >> +
> >> +	/*
> >> +	 * Q: Why don't we set IRQ affinity by these registers?
> >> +	 * A: Hardware IRQ delivery is seriously broken,
> >> +	 *    so we map all IRQs to a fixed core.
> >> +	 */
> >> +	pr_info("ls3-iointc: Mapping All ls3-iointc IRQ to core %d, IP %d\n", core, ip);
> >> +	for (i = 0; i < LS3_CHIP_IRQ; i++)
> >> +		writeb(LS3_MAP_CORE_INT(core, ip), priv->intc_base + 0x1 * i);  
> > This doesn't make much sense. If this is a chained irqchip, all
> > interrupts end-up on a single CPU (the one that handle the parent IRQ).
> > So how comes there is even a choice of picking a target CPU?  
> 
> It's parent IRQ (mti,cpu-interrupt-controller) is a percpu IRQ.

But then why is that interrupt described using the "core" property? It
should be an interrupt specifier, just like any other interrupt.

> In design, it allows us to decide affinity at runtime but actually hardware is seriously broken.

I understand the HW is terrible. But the binding looks pretty bad too.
This needs fixing.

	M.
-- 
Without deviation from the norm, progress is not possible.
