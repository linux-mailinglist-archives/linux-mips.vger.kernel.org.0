Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CA21CCD69
	for <lists+linux-mips@lfdr.de>; Sun,  6 Oct 2019 02:15:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726896AbfJFAPM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 5 Oct 2019 20:15:12 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:42752 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726706AbfJFAPM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 5 Oct 2019 20:15:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1570320910; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gZM7V1pkH0sVB7y2myY/TYuHFbDtv9G72fDIOvzaLsI=;
        b=chUAnj05zQ5vNyLBoF9jajibOPfItnCbzq4P9+cz9QNSsJ6HGN1hmbA+BTRtZLTEQCGv//
        PAiQqVEVh3SjyjJeZSX+ADQe/1K9n5dxDJhKCnVQSW5crpA4PAaiIPXJIvUq66Sww0JyWy
        dK4G2VP2RlNus+5B6vI/vMz3dFcXruk=
Date:   Sun, 06 Oct 2019 02:15:05 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 5/5 v5] irqchip: Ingenic: Add process for more than one
 irq at the same time.
To:     Zhou Yanjie <zhouyanjie@zoho.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        tglx@linutronix.de, paul.burton@mips.com,
        gregkh@linuxfoundation.org, jason@lakedaemon.net, syq@debian.org,
        marc.zyngier@arm.com, rfontana@redhat.com, armijn@tjaldur.nl,
        allison@lohutok.net
Message-Id: <1570320905.3.3@crapouillou.net>
In-Reply-To: <1570015525-27018-6-git-send-email-zhouyanjie@zoho.com>
References: <1548517123-60058-1-git-send-email-zhouyanjie@zoho.com>
        <1570015525-27018-1-git-send-email-zhouyanjie@zoho.com>
        <1570015525-27018-6-git-send-email-zhouyanjie@zoho.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le mer., oct. 2, 2019 at 19:25, Zhou Yanjie <zhouyanjie@zoho.com> a=20
=E9crit :
> Add process for the situation that more than one irq is coming to
> a single chip at the same time. The original code will only respond
> to the lowest setted bit in JZ_REG_INTC_PENDING, and then exit the
> interrupt dispatch function. After exiting the interrupt dispatch
> function, since the second interrupt has not yet responded, the
> interrupt dispatch function is again entered to process the second
> interrupt. This creates additional unnecessary overhead, and the
> more interrupts that occur at the same time, the more overhead is
> added. The improved method in this patch is to check whether there
> are still unresponsive interrupts after processing the lowest
> setted bit interrupt. If there are any, the processing will be
> processed according to the bit in JZ_REG_INTC_PENDING, and the
> interrupt dispatch function will be exited until all processing
> is completed.
>=20
> Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>

Looks good to me.

Reviewed-by: Paul Cercueil <paul@crapouillou.net>


> ---
>  drivers/irqchip/irq-ingenic.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-ingenic.c=20
> b/drivers/irqchip/irq-ingenic.c
> index 06ab3ad..c1be3d5 100644
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
> @@ -37,18 +37,23 @@ static irqreturn_t intc_cascade(int irq, void=20
> *data)
>  	struct ingenic_intc_data *intc =3D irq_get_handler_data(irq);
>  	struct irq_domain *domain =3D intc->domain;
>  	struct irq_chip_generic *gc;
> -	uint32_t irq_reg;
> +	uint32_t pending;
>  	unsigned i;
>=20
>  	for (i =3D 0; i < intc->num_chips; i++) {
>  		gc =3D irq_get_domain_generic_chip(domain, i * 32);
>=20
> -		irq_reg =3D irq_reg_readl(gc, JZ_REG_INTC_PENDING);
> -		if (!irq_reg)
> +		pending =3D irq_reg_readl(gc, JZ_REG_INTC_PENDING);
> +		if (!pending)
>  			continue;
>=20
> -		irq =3D irq_find_mapping(domain, __fls(irq_reg) + (i * 32));
> -		generic_handle_irq(irq);
> +		while (pending) {
> +			int bit =3D __fls(pending);
> +
> +			irq =3D irq_find_mapping(domain, bit + (i * 32));
> +			generic_handle_irq(irq);
> +			pending &=3D ~BIT(bit);
> +		}
>  	}
>=20
>  	return IRQ_HANDLED;
> --
> 2.7.4
>=20
>=20

=

