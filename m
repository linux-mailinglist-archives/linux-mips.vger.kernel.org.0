Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 577701BC5EC
	for <lists+linux-mips@lfdr.de>; Tue, 28 Apr 2020 19:00:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728295AbgD1Q76 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Apr 2020 12:59:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:59806 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727957AbgD1Q76 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 Apr 2020 12:59:58 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0CA6420730;
        Tue, 28 Apr 2020 16:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588093197;
        bh=DDISJ5ho6h27V70q1LkBq6lxmMmBnWXMjbaptVzgKG8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=1o/irJWRdeuyfBO6VnyQX2K/e2SJPF7eXPQsrP+NcBRJCYKBdTYO77ETS7Ker7qVe
         tUNKDZSBi2Z+fT6MEsQKvwGiSUlZkwhIyhw8fEMA/2Tq3Ke9gMBNK2TwEFwV1wkxV+
         6/ybAJi94dxBL/JFT1HAhJiLFHET2PfNbhZRekh4=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=why)
        by disco-boy.misterjones.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1jTTaN-007RBo-7a; Tue, 28 Apr 2020 17:59:55 +0100
Date:   Tue, 28 Apr 2020 17:59:53 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>,
        Huacai Chen <chenhc@lemote.com>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v2 1/6] irqchip: Add Loongson HyperTransport Vector
 support
Message-ID: <20200428175953.487d23c8@why>
In-Reply-To: <20200428063247.2223499-1-jiaxun.yang@flygoat.com>
References: <20200422142428.1249684-1-jiaxun.yang@flygoat.com>
        <20200428063247.2223499-1-jiaxun.yang@flygoat.com>
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

On Tue, 28 Apr 2020 14:32:40 +0800
Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:

> This controller appears on Loongson-3 chips for receiving interrupt
> vectors from PCH's PIC and PCH's PCIe MSI interrupts.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> v2:
> 	- Style cleanup
> 	- Set ack callback and set correct edge_irq handler
> ---
>  drivers/irqchip/Kconfig              |   8 +
>  drivers/irqchip/Makefile             |   1 +
>  drivers/irqchip/irq-loongson-htvec.c | 214 +++++++++++++++++++++++++++
>  3 files changed, 223 insertions(+)
>  create mode 100644 drivers/irqchip/irq-loongson-htvec.c
> 
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index a85aada04a64..de4564e2ea88 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -532,4 +532,12 @@ config LOONGSON_HTPIC
>  	help
>  	  Support for the Loongson-3 HyperTransport PIC Controller.
>  
> +config LOONGSON_HTVEC
> +	bool "Loongson3 HyperTransport Interrupt Vector Controller"
> +	depends on MACH_LOONGSON64 || COMPILE_TEST
> +	default MACH_LOONGSON64
> +	select IRQ_DOMAIN_HIERARCHY
> +	help
> +	  Support for the Loongson3 HyperTransport Interrupt Vector Controller.
> +
>  endmenu
> diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
> index 37bbe39bf909..74561879f5a7 100644
> --- a/drivers/irqchip/Makefile
> +++ b/drivers/irqchip/Makefile
> @@ -107,3 +107,4 @@ obj-$(CONFIG_TI_SCI_INTR_IRQCHIP)	+= irq-ti-sci-intr.o
>  obj-$(CONFIG_TI_SCI_INTA_IRQCHIP)	+= irq-ti-sci-inta.o
>  obj-$(CONFIG_LOONGSON_LIOINTC)		+= irq-loongson-liointc.o
>  obj-$(CONFIG_LOONGSON_HTPIC)		+= irq-loongson-htpic.o
> +obj-$(CONFIG_LOONGSON_HTVEC)		+= irq-loongson-htvec.o
> diff --git a/drivers/irqchip/irq-loongson-htvec.c b/drivers/irqchip/irq-loongson-htvec.c
> new file mode 100644
> index 000000000000..3b6032e3bb13
> --- /dev/null
> +++ b/drivers/irqchip/irq-loongson-htvec.c
> @@ -0,0 +1,214 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + *  Copyright (C) 2020, Jiaxun Yang <jiaxun.yang@flygoat.com>
> + *  Loongson HyperTransport Interrupt Vector support
> + */
> +
> +#define pr_fmt(fmt) "htvec: " fmt
> +
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/irqchip.h>
> +#include <linux/irqdomain.h>
> +#include <linux/irqchip/chained_irq.h>
> +#include <linux/kernel.h>
> +#include <linux/platform_device.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_platform.h>
> +
> +/* Registers */
> +#define HTVEC_EN_OFF		0x20
> +#define HTVEC_MAX_PARENT_IRQ	4
> +
> +#define VEC_COUNT_PER_REG	32
> +#define VEC_REG_COUNT		4
> +#define VEC_COUNT		(VEC_COUNT_PER_REG * VEC_REG_COUNT)
> +#define VEC_REG_IDX(irq_id)	((irq_id) / VEC_COUNT_PER_REG)
> +#define VEC_REG_BIT(irq_id)	((irq_id) % VEC_COUNT_PER_REG)
> +
> +struct htvec {
> +	void __iomem		*base;
> +	struct irq_domain	*htvec_domain;
> +	raw_spinlock_t		htvec_lock;
> +};
> +
> +static void htvec_irq_dispatch(struct irq_desc *desc)
> +{
> +	struct htvec *priv = irq_desc_get_handler_data(desc);
> +	struct irq_chip *chip = irq_desc_get_chip(desc);
> +	u32 pending;
> +	bool handled = false;
> +	int i;
> +
> +	chained_irq_enter(chip, desc);
> +
> +	for (i = 0; i < VEC_REG_COUNT; i++) {
> +		pending = readl(priv->base + 4 * i);
> +		writel(pending, priv->base + 4 * i);
> +		while (pending) {
> +			int bit = __ffs(pending);
> +
> +			generic_handle_irq(irq_linear_revmap(priv->htvec_domain,
> +						bit + VEC_COUNT_PER_REG * i));
> +			pending &= ~BIT(bit);
> +			handled = true;
> +		}
> +	}
> +
> +	if (!handled)
> +		spurious_interrupt();
> +
> +	chained_irq_exit(chip, desc);
> +}
> +
> +static void htvec_ack_irq(struct irq_data *d)
> +{
> +	struct htvec *priv = irq_data_get_irq_chip_data(d);
> +	void __iomem *addr = priv->base;
> +
> +	writel(VEC_REG_BIT(d->hwirq), priv->base + VEC_REG_IDX(d->hwirq) * 4);

Are you really sure about this? All the other operations seems to be
based on a hot-bit pattern, while these particular registers seems to
be taking hwirq mod 32. I'm willing to bet this is wrong.

	M.
-- 
Jazz is not dead. It just smells funny...
