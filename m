Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0D4F191F13
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2020 03:32:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727275AbgCYCct (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 24 Mar 2020 22:32:49 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17833 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727259AbgCYCct (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 24 Mar 2020 22:32:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1585103515;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:To:CC:From:Message-ID;
        bh=IrhqHZkIgBzBX0NyQ/AdHmhnZ5Hiqdy+Ikjqv3i39Yo=;
        b=UarPfnSOcQ4sjXrN8oKc7mlQTD0HEm33Qx8s6HXUka0Z4prsBLK6HU8zxXq88j3G
        4W9MGjhQ8vnuw9SyB9ou2bTaJC8pEKR1ek9/mdl/CQZ4yGD4Pf4fGV5SDSqVpgdQjaj
        yQFc1h4wr5SQ4i3m89+VtFwnmaU2xmWJCkMhHwSE=
Received: from [10.233.233.252] (183.157.60.227 [183.157.60.227]) by mx.zoho.com.cn
        with SMTPS id 15851035137201004.1544709728074; Wed, 25 Mar 2020 10:31:53 +0800 (CST)
Date:   Wed, 25 Mar 2020 10:31:50 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <CAAhV-H7__WmeWZ4w8Kc37WztRZ+-du9nKbVkRJeK7=ZhPaVY3g@mail.gmail.com>
References: <20200324153624.23109-1-jiaxun.yang@flygoat.com> <20200324153624.23109-3-jiaxun.yang@flygoat.com> <CAAhV-H7__WmeWZ4w8Kc37WztRZ+-du9nKbVkRJeK7=ZhPaVY3g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 02/11] irqchip: loongson-liointc: Workaround LPC IRQ Errata
To:     Huacai Chen <chenhc@lemote.com>
CC:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <C87B57FD-F4C2-4464-9692-A28DE343FDDB@flygoat.com>
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B43=E6=9C=8825=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=889=
:52:26, Huacai Chen <chenhc@lemote=2Ecom> =E5=86=99=E5=88=B0:
>Hi, Jiaxun,
>
>On Tue, Mar 24, 2020 at 11:39 PM Jiaxun Yang <jiaxun=2Eyang@flygoat=2Ecom=
>
>wrote:
>>
>> The 1=2E0 version of that controller has a bug that status bit
>> of LPC IRQ sometimes doesn't get set correctly=2E
>>
>> So we can always blame LPC IRQ when spurious interrupt happens
>> at the parent interrupt line which LPC IRQ supposed to route
>> to=2E
>>
>> Co-developed-by: Huacai Chen <chenhc@lemote=2Ecom>
>> Signed-off-by: Jiaxun Yang <jiaxun=2Eyang@flygoat=2Ecom>
>> ---
>>  drivers/irqchip/irq-loongson-liointc=2Ec | 16 ++++++++++++++--
>>  1 file changed, 14 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/irqchip/irq-loongson-liointc=2Ec
>b/drivers/irqchip/irq-loongson-liointc=2Ec
>> index 8b6d7b8ddaca=2E=2Ed5054e90eab8 100644
>> --- a/drivers/irqchip/irq-loongson-liointc=2Ec
>> +++ b/drivers/irqchip/irq-loongson-liointc=2Ec
>> @@ -32,6 +32,8 @@
>>
>>  #define LIOINTC_SHIFT_INTx     4
>>
>> +#define LIOINTC_ERRATA_IRQ     10
>> +
>>  struct liointc_handler_data {
>>         struct liointc_priv     *priv;
>>         u32                     parent_int_map;
>> @@ -41,6 +43,7 @@ struct liointc_priv {
>>         struct irq_chip_generic         *gc;
>>         struct liointc_handler_data     handler[LIOINTC_NUM_PARENT];
>>         u8                              map_cache[LIOINTC_CHIP_IRQ];
>> +       bool                            have_lpc_irq_errata;
>Maybe has_lpc_irq_errata?

Fixed, thanks=2E

>
>>  };
>>
>>  static void liointc_chained_handle_irq(struct irq_desc *desc)
>> @@ -54,8 +57,14 @@ static void liointc_chained_handle_irq(struct
>irq_desc *desc)
>>
>>         pending =3D readl(gc->reg_base + LIOINTC_REG_INTC_STATUS);
>>
>> -       if (!pending)
>> -               spurious_interrupt();
>> +       if (!pending) {
>> +               /* Always blame LPC IRQ if we have that bug and LPC
>IRQ is enabled */
>> +               if (handler->priv->have_lpc_irq_errata &&
>> +                       (handler->parent_int_map & ~gc->mask_cache &
>BIT(LIOINTC_ERRATA_IRQ)))
>> +                       pending =3D BIT(LIOINTC_ERRATA_IRQ);
>> +               else
>> +                       spurious_interrupt();
>> +       }
>>
>>         while (pending) {
>>                 int bit =3D __ffs(pending);
>> @@ -164,6 +173,9 @@ int __init liointc_of_init(struct device_node
>*node,
>>                 goto out_iounmap;
>>         }
>>
>> +       if (of_device_is_compatible(node, "loongson,liointc-1=2E0"))
>> +               priv->have_lpc_irq_errata =3D true;
>> +
>>         sz =3D of_property_read_variable_u32_array(node,
>"loongson,parent_int_map",
>>                                               =20
>&of_parent_int_map[0], LIOINTC_NUM_PARENT,
>>                                                 LIOINTC_NUM_PARENT);
>> --
>> 2=2E26=2E0=2Erc2
>>
>>
>
>Regards,
>Huacai Chen

--=20
Jiaxun Yang
