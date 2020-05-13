Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A1001D124F
	for <lists+linux-mips@lfdr.de>; Wed, 13 May 2020 14:07:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731051AbgEMMHI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 May 2020 08:07:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727778AbgEMMHI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 13 May 2020 08:07:08 -0400
Received: from Galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D12C9C061A0C;
        Wed, 13 May 2020 05:07:07 -0700 (PDT)
Received: from p5de0bf0b.dip0.t-ipconnect.de ([93.224.191.11] helo=nanos.tec.linutronix.de)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tglx@linutronix.de>)
        id 1jYqA3-0001gY-Hy; Wed, 13 May 2020 14:06:55 +0200
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
        id BAED7100605; Wed, 13 May 2020 14:06:54 +0200 (CEST)
From:   Thomas Gleixner <tglx@linutronix.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>, maz@kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>,
        Huacai Chen <chenhc@lemote.com>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v3 1/6] irqchip: Add Loongson HyperTransport Vector support
In-Reply-To: <20200501092139.2988670-1-jiaxun.yang@flygoat.com>
References: <20200422142428.1249684-1-jiaxun.yang@flygoat.com> <20200501092139.2988670-1-jiaxun.yang@flygoat.com>
Date:   Wed, 13 May 2020 14:06:54 +0200
Message-ID: <87a72c3uox.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Jiaxun Yang <jiaxun.yang@flygoat.com> writes:
> +static void htvec_mask_irq(struct irq_data *d)
> +{
> +	struct htvec *priv = irq_data_get_irq_chip_data(d);
> +	void __iomem *addr = priv->base + HTVEC_EN_OFF;
> +	unsigned long flags;
> +	u32 reg;
> +
> +	raw_spin_lock_irqsave(&priv->htvec_lock, flags);

No need for irqsave() these functions are called with interrupts disabled.

> +	addr += VEC_REG_IDX(d->hwirq) * 4;
> +	reg = readl(addr);
> +	reg &= ~BIT(VEC_REG_BIT(d->hwirq));
> +	writel(reg, addr);
> +	raw_spin_unlock_irqrestore(&priv->htvec_lock, flags);
> +}

> +static int htvec_domain_alloc(struct irq_domain *domain, unsigned int virq,
> +				  unsigned int nr_irqs, void *arg)
> +{
> +	struct htvec *priv = domain->host_data;
> +	unsigned long hwirq;
> +	unsigned int type, i;
> +
> +	irq_domain_translate_onecell(domain, arg, &hwirq, &type);
> +
> +	for (i = 0; i < nr_irqs; i++)
> +		irq_domain_set_info(domain, virq + i, hwirq + i, &htvec_irq_chip,
> +					priv, handle_edge_irq, NULL, NULL);

This wants curly brackets and the second line of arguments wants to be
aligned with the first argument:

	for (i = 0; i < nr_irqs; i++) {
		irq_domain_set_info(domain, virq + i, hwirq + i, &htvec_irq_chip,
				    priv, handle_edge_irq, NULL, NULL);
	}

See https://lore.kernel.org/lkml/alpine.DEB.2.20.1701171956290.3645@nanos/

The alignment of arguments wants to be fixed all over the place.

> +static int htvec_of_init(struct device_node *node,
> +				struct device_node *parent)
> +{
> +	struct htvec *priv;
> +	int err, parent_irq[4], num_parents = 0, i;

Please order the variable declaration in reverse fir tree length order:

	int err, parent_irq[4], num_parents = 0, i;
	struct htvec *priv;

That's way better readable than the above. All over the place please.

> +	priv->htvec_domain = irq_domain_create_linear(of_node_to_fwnode(node),
> +						   VEC_COUNT,
> +						   &htvec_domain_ops,
> +						   priv);
> +	if (!priv->htvec_domain) {
> +		pr_err("Failed to create IRQ domain\n");
> +		err = -ENOMEM;
> +		goto iounmap_base;
> +	}
> +
> +	htvec_reset(priv);
> +
> +	for (i = 0; i < num_parents; i++)
> +		irq_set_chained_handler_and_data(parent_irq[i],
> +						htvec_irq_dispatch, priv);

See above.

Thanks,

        tglx
