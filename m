Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B85E1791E6
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jul 2019 19:19:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727903AbfG2RTd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Jul 2019 13:19:33 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:40900 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726601AbfG2RTd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 29 Jul 2019 13:19:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1564420771; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=n8E4jxEmkny3KYi/27FNI9LuXpecTWt4GD8+XB/Ki9w=;
        b=ld68ao2693if3y+5k9n2v4iD3Tr1wo1bSDYqyRtQDHGrjbRHNm7d9GIybz2nt4o9eaDwU8
        rBzd0kmXRaz+ZaRywMxBbQbxdD8JPP/VqzC9w2NwU3ftcutP1d5G4iVUZ+TWOe0JqExRww
        wohj74rYHgC/H7/SaegAykIc20AFXuc=
Date:   Mon, 29 Jul 2019 13:19:14 -0400
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 1/4 v4] irqchip: Ingenic: Change interrupt handling form
 cascade to chained_irq.
To:     Zhou Yanjie <zhouyanjie@zoho.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        paul.burton@mips.com, tglx@linutronix.de, mark.rutland@arm.com,
        jason@lakedaemon.net, marc.zyngier@arm.com
Message-Id: <1564420754.6633.0@crapouillou.net>
In-Reply-To: <1564335273-22931-2-git-send-email-zhouyanjie@zoho.com>
References: <1548517123-60058-1-git-send-email-zhouyanjie@zoho.com>
        <1564335273-22931-1-git-send-email-zhouyanjie@zoho.com>
        <1564335273-22931-2-git-send-email-zhouyanjie@zoho.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,



Le dim. 28 juil. 2019 =E0 13:34, Zhou Yanjie <zhouyanjie@zoho.com> a=20
=E9crit :
> The interrupt handling method is changed from old-style cascade to
> chained_irq which is more appropriate. Also, it can process the
> corner situation that more than one irq is coming to a single
> chip at the same time.
>=20
> Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
> ---
>  drivers/irqchip/irq-ingenic.c | 37=20
> +++++++++++++++++++++++--------------
>  1 file changed, 23 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-ingenic.c=20
> b/drivers/irqchip/irq-ingenic.c
> index f126255..49f7685 100644
> --- a/drivers/irqchip/irq-ingenic.c
> +++ b/drivers/irqchip/irq-ingenic.c
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
>  /*
>   *  Copyright (C) 2009-2010, Lars-Peter Clausen <lars@metafoo.de>
> - *  JZ4740 platform IRQ support
> + *  Ingenic XBurst platform IRQ support
>   */
>=20
>  #include <linux/errno.h>
> @@ -10,6 +10,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/ioport.h>
>  #include <linux/irqchip.h>
> +#include <linux/irqchip/chained_irq.h>
>  #include <linux/irqchip/ingenic.h>
>  #include <linux/of_address.h>
>  #include <linux/of_irq.h>
> @@ -32,22 +33,34 @@ struct ingenic_intc_data {
>  #define JZ_REG_INTC_PENDING	0x10
>  #define CHIP_SIZE		0x20
>=20
> -static irqreturn_t intc_cascade(int irq, void *data)
> +static void ingenic_chained_handle_irq(struct irq_desc *desc)
>  {
> -	struct ingenic_intc_data *intc =3D irq_get_handler_data(irq);
> -	uint32_t irq_reg;
> +	struct ingenic_intc_data *intc =3D irq_desc_get_handler_data(desc);
> +	struct irq_chip *chip =3D irq_desc_get_chip(desc);
> +	bool have_irq =3D false;
> +	uint32_t pending;
>  	unsigned i;
>=20
> +	chained_irq_enter(chip, desc);
>  	for (i =3D 0; i < intc->num_chips; i++) {
> -		irq_reg =3D readl(intc->base + (i * CHIP_SIZE) +
> +		pending =3D readl(intc->base + (i * CHIP_SIZE) +
>  				JZ_REG_INTC_PENDING);
> -		if (!irq_reg)
> +		if (!pending)
>  			continue;
>=20
> -		generic_handle_irq(__fls(irq_reg) + (i * 32) + JZ4740_IRQ_BASE);
> +		have_irq =3D true;
> +		while (pending) {
> +			int bit =3D __fls(pending);

Use the for_each_set_bit() macro here, that will be simpler.


> +
> +			generic_handle_irq(bit + (i * 32) + JZ4740_IRQ_BASE);
> +			pending &=3D ~BIT(bit);
> +		}
>  	}
>=20
> -	return IRQ_HANDLED;
> +	if (!have_irq)
> +		spurious_interrupt();
> +
> +	chained_irq_exit(chip, desc);
>  }
>=20
>  static void intc_irq_set_mask(struct irq_chip_generic *gc, uint32_t=20
> mask)
> @@ -70,11 +83,6 @@ void ingenic_intc_irq_resume(struct irq_data *data)
>  	intc_irq_set_mask(gc, gc->mask_cache);
>  }
>=20
> -static struct irqaction intc_cascade_action =3D {
> -	.handler =3D intc_cascade,
> -	.name =3D "SoC intc cascade interrupt",
> -};
> -
>  static int __init ingenic_intc_of_init(struct device_node *node,
>  				       unsigned num_chips)
>  {
> @@ -139,7 +147,8 @@ static int __init ingenic_intc_of_init(struct=20
> device_node *node,
>  	if (!domain)
>  		pr_warn("unable to register IRQ domain\n");
>=20
> -	setup_irq(parent_irq, &intc_cascade_action);
> +	irq_set_chained_handler_and_data(parent_irq,
> +					ingenic_chained_handle_irq, intc);
>  	return 0;
>=20
>  out_unmap_irq:
> --
> 2.7.4

=

