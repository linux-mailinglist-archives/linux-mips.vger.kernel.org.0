Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C19567920B
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jul 2019 19:25:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728062AbfG2RZx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Jul 2019 13:25:53 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:41776 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbfG2RZx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 29 Jul 2019 13:25:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1564421150; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8+qV28YYJniA0AukbbbJEysxFPjT+avEllLJr1CUVTc=;
        b=sw7qv0bBtbgyJbzjIoXXSS5FQUZvEZVn+PBWp+obxwOs3LGxECaxlAlmHs21P/b5RUAAT2
        hq6FrRaKanu/AvUQ+9uDVSKCtxex0VPrTUwZ6r9t9aKZFL10PAYPf2AkIALQERSqS8sSyJ
        P+HgUycY6IzIHqJMAUh1dl/zHZM8GZA=
Date:   Mon, 29 Jul 2019 13:25:33 -0400
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 4/4 v4] irqchip: Ingenic: Add support for new Ingenic
 Socs.
To:     Zhou Yanjie <zhouyanjie@zoho.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        paul.burton@mips.com, tglx@linutronix.de, mark.rutland@arm.com,
        jason@lakedaemon.net, marc.zyngier@arm.com
Message-Id: <1564421133.6633.1@crapouillou.net>
In-Reply-To: <1564335273-22931-5-git-send-email-zhouyanjie@zoho.com>
References: <1548517123-60058-1-git-send-email-zhouyanjie@zoho.com>
        <1564335273-22931-1-git-send-email-zhouyanjie@zoho.com>
        <1564335273-22931-5-git-send-email-zhouyanjie@zoho.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le dim. 28 juil. 2019 =E0 13:34, Zhou Yanjie <zhouyanjie@zoho.com> a=20
=E9crit :
> Add support for probing the irq-ingenic driver on the JZ4760/JZ4760B
> and the X1000/X1000E and the X1500 Socs from Ingenic.
>=20
> Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
> ---
>  drivers/irqchip/irq-ingenic.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/irqchip/irq-ingenic.c=20
> b/drivers/irqchip/irq-ingenic.c
> index 8430f5a..b72430c 100644
> --- a/drivers/irqchip/irq-ingenic.c
> +++ b/drivers/irqchip/irq-ingenic.c
> @@ -173,6 +173,11 @@ static int __init intc_2chip_of_init(struct=20
> device_node *node,
>  {
>  	return ingenic_intc_of_init(node, 2);
>  }
> +IRQCHIP_DECLARE(jz4760_intc, "ingenic,jz4760-intc",=20
> intc_2chip_of_init);
> +IRQCHIP_DECLARE(jz4760b_intc, "ingenic,jz4760b-intc",=20
> intc_2chip_of_init);
>  IRQCHIP_DECLARE(jz4770_intc, "ingenic,jz4770-intc",=20
> intc_2chip_of_init);
>  IRQCHIP_DECLARE(jz4775_intc, "ingenic,jz4775-intc",=20
> intc_2chip_of_init);
>  IRQCHIP_DECLARE(jz4780_intc, "ingenic,jz4780-intc",=20
> intc_2chip_of_init);
> +IRQCHIP_DECLARE(x1000_intc, "ingenic,x1000-intc",=20
> intc_2chip_of_init);
> +IRQCHIP_DECLARE(x1000e_intc, "ingenic,x1000e-intc",=20
> intc_2chip_of_init);
> +IRQCHIP_DECLARE(x1500_intc, "ingenic,x1500-intc",=20
> intc_2chip_of_init);

All these compatible strings point to the exact same behaviour. It was
already a mistake to have the three "ingenic,jz47[70,75,80]-intc" here;
there should have been only one, e.g. "ingenic,jz4770-intc" and the=20
other
two SoCs using it as a fallback compatible.

I think you don't need to add these, and in your devicetree just use
"ingenic,jz4780-intc" as a fallback compatible.

Cheers,
-Paul

=

