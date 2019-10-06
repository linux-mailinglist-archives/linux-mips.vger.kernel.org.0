Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17BBECCD67
	for <lists+linux-mips@lfdr.de>; Sun,  6 Oct 2019 02:13:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726863AbfJFAN6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 5 Oct 2019 20:13:58 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:41520 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725947AbfJFAN6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 5 Oct 2019 20:13:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1570320835; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+/oO5mExpdmBQpEMZOy4k4kOdcpKXU38wnPGDT51Lzs=;
        b=si0hLKwZqYyO19XjTE1TZPo31nrOfRy6NDghoWyNG7sPQ6eX/gK+sjq2F4CoS5yME4Jbiz
        GSoZWzdZiF/6fo5hZwN29cjK11IRH9B4Cpyhy+4KoyVY8C9xETZhCnQHHwPA/97lny1vd/
        bDXreVkj5kBPk4u/fdpt1odH5RpLBwI=
Date:   Sun, 06 Oct 2019 02:13:49 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 1/5 v5] irqchip: ingenic: Drop redundant irq_suspend /
 irq_resume functions
To:     Zhou Yanjie <zhouyanjie@zoho.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        tglx@linutronix.de, paul.burton@mips.com,
        gregkh@linuxfoundation.org, jason@lakedaemon.net, syq@debian.org,
        marc.zyngier@arm.com, rfontana@redhat.com, armijn@tjaldur.nl,
        allison@lohutok.net
Message-Id: <1570320829.3.2@crapouillou.net>
In-Reply-To: <1570015525-27018-2-git-send-email-zhouyanjie@zoho.com>
References: <1548517123-60058-1-git-send-email-zhouyanjie@zoho.com>
        <1570015525-27018-1-git-send-email-zhouyanjie@zoho.com>
        <1570015525-27018-2-git-send-email-zhouyanjie@zoho.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,


Le mer., oct. 2, 2019 at 19:25, Zhou Yanjie <zhouyanjie@zoho.com> a=20
=E9crit :
> From: Paul Cercueil <paul@crapouillou.net>
>=20
> The same behaviour can be obtained by using the=20
> IRQCHIP_MASK_ON_SUSPEND
> flag on the IRQ chip.
>=20
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

If you sumbit a patchset that contains someone else's patches you need=20
to add your Signed-off-by too.

> ---
>  drivers/irqchip/irq-ingenic.c   | 24 +-----------------------
>  include/linux/irqchip/ingenic.h | 14 --------------
>  2 files changed, 1 insertion(+), 37 deletions(-)
>  delete mode 100644 include/linux/irqchip/ingenic.h
>=20
> diff --git a/drivers/irqchip/irq-ingenic.c=20
> b/drivers/irqchip/irq-ingenic.c
> index f126255..06fa810 100644
> --- a/drivers/irqchip/irq-ingenic.c
> +++ b/drivers/irqchip/irq-ingenic.c
> @@ -10,7 +10,6 @@
>  #include <linux/interrupt.h>
>  #include <linux/ioport.h>
>  #include <linux/irqchip.h>
> -#include <linux/irqchip/ingenic.h>
>  #include <linux/of_address.h>
>  #include <linux/of_irq.h>
>  #include <linux/timex.h>
> @@ -50,26 +49,6 @@ static irqreturn_t intc_cascade(int irq, void=20
> *data)
>  	return IRQ_HANDLED;
>  }
>=20
> -static void intc_irq_set_mask(struct irq_chip_generic *gc, uint32_t=20
> mask)
> -{
> -	struct irq_chip_regs *regs =3D &gc->chip_types->regs;
> -
> -	writel(mask, gc->reg_base + regs->enable);
> -	writel(~mask, gc->reg_base + regs->disable);
> -}
> -
> -void ingenic_intc_irq_suspend(struct irq_data *data)
> -{
> -	struct irq_chip_generic *gc =3D irq_data_get_irq_chip_data(data);
> -	intc_irq_set_mask(gc, gc->wake_active);
> -}
> -
> -void ingenic_intc_irq_resume(struct irq_data *data)
> -{
> -	struct irq_chip_generic *gc =3D irq_data_get_irq_chip_data(data);
> -	intc_irq_set_mask(gc, gc->mask_cache);
> -}
> -
>  static struct irqaction intc_cascade_action =3D {
>  	.handler =3D intc_cascade,
>  	.name =3D "SoC intc cascade interrupt",
> @@ -127,8 +106,7 @@ static int __init ingenic_intc_of_init(struct=20
> device_node *node,
>  		ct->chip.irq_mask =3D irq_gc_mask_disable_reg;
>  		ct->chip.irq_mask_ack =3D irq_gc_mask_disable_reg;
>  		ct->chip.irq_set_wake =3D irq_gc_set_wake;
> -		ct->chip.irq_suspend =3D ingenic_intc_irq_suspend;
> -		ct->chip.irq_resume =3D ingenic_intc_irq_resume;
> +		ct->chip.flags =3D IRQCHIP_MASK_ON_SUSPEND;
>=20
>  		irq_setup_generic_chip(gc, IRQ_MSK(32), 0, 0,
>  				       IRQ_NOPROBE | IRQ_LEVEL);
> diff --git a/include/linux/irqchip/ingenic.h=20
> b/include/linux/irqchip/ingenic.h
> deleted file mode 100644
> index 1465588..0000000
> --- a/include/linux/irqchip/ingenic.h
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-or-later */
> -/*
> - *  Copyright (C) 2010, Lars-Peter Clausen <lars@metafoo.de>
> - */
> -
> -#ifndef __LINUX_IRQCHIP_INGENIC_H__
> -#define __LINUX_IRQCHIP_INGENIC_H__
> -
> -#include <linux/irq.h>
> -
> -extern void ingenic_intc_irq_suspend(struct irq_data *data);
> -extern void ingenic_intc_irq_resume(struct irq_data *data);
> -
> -#endif
> --
> 2.7.4
>=20
>=20

=

