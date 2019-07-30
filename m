Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06A347A4E1
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jul 2019 11:42:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728954AbfG3Jmq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Jul 2019 05:42:46 -0400
Received: from sender4-pp-o95.zoho.com ([136.143.188.95]:25573 "EHLO
        sender4-pp-o95.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725913AbfG3Jmq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 30 Jul 2019 05:42:46 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1564479744; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=m6bddyU1sSWB8wiikFmRJv9gxJDDOTpeAsqU3oM3ZOtxfUmBvgApLZW11T6TlePwWPVPqFIz2N7Nf7QtL249/f33A9J9gr+kTQ9YtsZett3YJmBoCUxaivrjya/XRK+w2/o965AMLiceknVqJWuYqob32j/Kp65xZ16h7h1xRf8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1564479744; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To:ARC-Authentication-Results; 
        bh=HLmCrP4ULrKbvvk4a8AJfmX5vMCyk3Zk5GM0GHXF3GM=; 
        b=Bc5DFElQr0eoEeE0bdSRUe7Q4gZF1u0EcB03aVOwiyDBC82YR2+9KqkVVP4antb9tSQZrXExVt2MIMH+hmmanjwLtb/E2lIoqNFLjYVE2IMuuZ/WR6tIO3/KL/ib/51QMJsADAUN8dtPKQg6txJY1h8T7xfCS4gVRqTK10wF3ZQ=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=subject:to:references:cc:from:message-id:date:user-agent:mime-version:in-reply-to:content-type; 
  b=TkiwR87RIZ65Yp7lUfivayEM4YpeX8luJWFAXzL8F1+LtW0VOFDoJpoFjbI5ixRuJbVauzgZV267
    t6ggdHaf5/+54lt1fKgXZbPE0LAyBu6sP70pGlzn34aEC2QRSlfx  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1564479744;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
        l=3647; bh=HLmCrP4ULrKbvvk4a8AJfmX5vMCyk3Zk5GM0GHXF3GM=;
        b=hHG6ryHSlhfdFpuWW/dDGM8Vd/AOaUXe8/RTYXFGXxG2ygJMWUAgIn7J+iPfbVk8
        oozI/w27zhe8J34oA7HPEpjUttUz5jWNKBng+OA5nR84z+FQWX6N7e9ZrY+wPyfdiFe
        iL9LNRp68BlmWtidTLvSFroF8Ny/OAr8Mx3Vkexw=
Received: from [192.168.88.139] (171.221.113.137 [171.221.113.137]) by mx.zohomail.com
        with SMTPS id 1564479742761900.7600390367637; Tue, 30 Jul 2019 02:42:22 -0700 (PDT)
Subject: Re: [PATCH 1/4 v4] irqchip: Ingenic: Change interrupt handling form
 cascade to chained_irq.
To:     Paul Cercueil <paul@crapouillou.net>
References: <1548517123-60058-1-git-send-email-zhouyanjie@zoho.com>
 <1564335273-22931-1-git-send-email-zhouyanjie@zoho.com>
 <1564335273-22931-2-git-send-email-zhouyanjie@zoho.com>
 <1564420754.6633.0@crapouillou.net>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        paul.burton@mips.com, tglx@linutronix.de, mark.rutland@arm.com,
        jason@lakedaemon.net, marc.zyngier@arm.com
From:   Zhou Yanjie <zhouyanjie@zoho.com>
Message-ID: <5D3FE6B4.6040602@zoho.com>
Date:   Tue, 30 Jul 2019 14:41:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1564420754.6633.0@crapouillou.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,
Thanks for your suggestion, and after receiving Marc's comments,
if this patch can be continued, I'll use for_each_set_bit() to simplify
code in v5.

On 2019=E5=B9=B407=E6=9C=8830=E6=97=A5 01:19, Paul Cercueil wrote:
> Hi Zhou,
>
>
>
> Le dim. 28 juil. 2019 =C3=A0 13:34, Zhou Yanjie <zhouyanjie@zoho.com> a=
=20
> =C3=A9crit :
>> The interrupt handling method is changed from old-style cascade to
>> chained_irq which is more appropriate. Also, it can process the
>> corner situation that more than one irq is coming to a single
>> chip at the same time.
>>
>> Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
>> ---
>>  drivers/irqchip/irq-ingenic.c | 37=20
>> +++++++++++++++++++++++--------------
>>  1 file changed, 23 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/irqchip/irq-ingenic.c=20
>> b/drivers/irqchip/irq-ingenic.c
>> index f126255..49f7685 100644
>> --- a/drivers/irqchip/irq-ingenic.c
>> +++ b/drivers/irqchip/irq-ingenic.c
>> @@ -1,7 +1,7 @@
>>  // SPDX-License-Identifier: GPL-2.0-or-later
>>  /*
>>   *  Copyright (C) 2009-2010, Lars-Peter Clausen <lars@metafoo.de>
>> - *  JZ4740 platform IRQ support
>> + *  Ingenic XBurst platform IRQ support
>>   */
>>
>>  #include <linux/errno.h>
>> @@ -10,6 +10,7 @@
>>  #include <linux/interrupt.h>
>>  #include <linux/ioport.h>
>>  #include <linux/irqchip.h>
>> +#include <linux/irqchip/chained_irq.h>
>>  #include <linux/irqchip/ingenic.h>
>>  #include <linux/of_address.h>
>>  #include <linux/of_irq.h>
>> @@ -32,22 +33,34 @@ struct ingenic_intc_data {
>>  #define JZ_REG_INTC_PENDING    0x10
>>  #define CHIP_SIZE        0x20
>>
>> -static irqreturn_t intc_cascade(int irq, void *data)
>> +static void ingenic_chained_handle_irq(struct irq_desc *desc)
>>  {
>> -    struct ingenic_intc_data *intc =3D irq_get_handler_data(irq);
>> -    uint32_t irq_reg;
>> +    struct ingenic_intc_data *intc =3D irq_desc_get_handler_data(desc);
>> +    struct irq_chip *chip =3D irq_desc_get_chip(desc);
>> +    bool have_irq =3D false;
>> +    uint32_t pending;
>>      unsigned i;
>>
>> +    chained_irq_enter(chip, desc);
>>      for (i =3D 0; i < intc->num_chips; i++) {
>> -        irq_reg =3D readl(intc->base + (i * CHIP_SIZE) +
>> +        pending =3D readl(intc->base + (i * CHIP_SIZE) +
>>                  JZ_REG_INTC_PENDING);
>> -        if (!irq_reg)
>> +        if (!pending)
>>              continue;
>>
>> -        generic_handle_irq(__fls(irq_reg) + (i * 32) +=20
>> JZ4740_IRQ_BASE);
>> +        have_irq =3D true;
>> +        while (pending) {
>> +            int bit =3D __fls(pending);
>
> Use the for_each_set_bit() macro here, that will be simpler.
>
>
>> +
>> +            generic_handle_irq(bit + (i * 32) + JZ4740_IRQ_BASE);
>> +            pending &=3D ~BIT(bit);
>> +        }
>>      }
>>
>> -    return IRQ_HANDLED;
>> +    if (!have_irq)
>> +        spurious_interrupt();
>> +
>> +    chained_irq_exit(chip, desc);
>>  }
>>
>>  static void intc_irq_set_mask(struct irq_chip_generic *gc, uint32_t=20
>> mask)
>> @@ -70,11 +83,6 @@ void ingenic_intc_irq_resume(struct irq_data *data)
>>      intc_irq_set_mask(gc, gc->mask_cache);
>>  }
>>
>> -static struct irqaction intc_cascade_action =3D {
>> -    .handler =3D intc_cascade,
>> -    .name =3D "SoC intc cascade interrupt",
>> -};
>> -
>>  static int __init ingenic_intc_of_init(struct device_node *node,
>>                         unsigned num_chips)
>>  {
>> @@ -139,7 +147,8 @@ static int __init ingenic_intc_of_init(struct=20
>> device_node *node,
>>      if (!domain)
>>          pr_warn("unable to register IRQ domain\n");
>>
>> -    setup_irq(parent_irq, &intc_cascade_action);
>> +    irq_set_chained_handler_and_data(parent_irq,
>> +                    ingenic_chained_handle_irq, intc);
>>      return 0;
>>
>>  out_unmap_irq:
>> --=20
>> 2.7.4
>
>



