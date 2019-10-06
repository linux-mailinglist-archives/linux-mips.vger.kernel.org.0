Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9ED87CCEEE
	for <lists+linux-mips@lfdr.de>; Sun,  6 Oct 2019 08:01:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726108AbfJFGBr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 6 Oct 2019 02:01:47 -0400
Received: from sender4-pp-o95.zoho.com ([136.143.188.95]:25576 "EHLO
        sender4-pp-o95.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726087AbfJFGBr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 6 Oct 2019 02:01:47 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1570341685; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=hAm9Rme81De9z1xNQ1uBPyWWa0Y7IFcm/3UPBBXmW8PgnRNksS4QvApEY471FXu57OJXT8wed8TRLSnV+Pn03WZZhvKqKCnKMnr8cT9lfJvguwuWZ+sVlNItbA4pxnQGZEN8IfsUrFf9JLNcIGJMTxYoc1SLttIRJYHadVyohh4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1570341685; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To:ARC-Authentication-Results; 
        bh=n/cGJbKwpvvB5SZNDZJw2dFU9sEN1hTE50JJ7IEvUQo=; 
        b=jRrE0maoIcAvtENP/MiEqQKyzWUownZRb1z5qxnotzRRD7jIqIVFMMHiZBSDqQHtsF7hNoXwy2axogcAZ7HwqxoR1ASS7FWmZH8Wb6hFGgrOqdAIS8evlbDSn0pc7IwmiPCECnNB07OXTKTe88zjSY1wdA+XZuyBzTO+CXdYbGQ=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=subject:to:references:cc:from:message-id:date:user-agent:mime-version:in-reply-to:content-type; 
  b=cDwV6hb+NyGC8VSO2EZ+EmtGX5BMCkpwJ1O8GBJzbxkyT0cWSmisM3+/O6urqWb2jEsRxpA83W/b
    Im3x1rkqZvI9vu7bBda3p9ZD3nWC9f3tnDRbFbJnLFjMpBklniCm  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1570341685;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
        l=3340; bh=n/cGJbKwpvvB5SZNDZJw2dFU9sEN1hTE50JJ7IEvUQo=;
        b=dkH9TGkknJCGeDD01ZBU7a4RmZ71pGRbfeErV5pxrOilpYSf6EiseMRm1ZKpVD/F
        Vft5zcafmCt/1eJNz3cuvMS7L4giCpvs4B9sMvD1R49eZdiaBZl9yolnxKUnuRHRaY/
        noKFQkSM7bP/Npk41gBGC1gRdkJGu049XaZh1kuo=
Received: from [192.168.88.140] (171.221.113.164 [171.221.113.164]) by mx.zohomail.com
        with SMTPS id 1570341683973773.9155199062749; Sat, 5 Oct 2019 23:01:23 -0700 (PDT)
Subject: Re: [PATCH 1/5 v5] irqchip: ingenic: Drop redundant irq_suspend /
 irq_resume functions
To:     Paul Cercueil <paul@crapouillou.net>
References: <1548517123-60058-1-git-send-email-zhouyanjie@zoho.com>
 <1570015525-27018-1-git-send-email-zhouyanjie@zoho.com>
 <1570015525-27018-2-git-send-email-zhouyanjie@zoho.com>
 <1570320829.3.2@crapouillou.net>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        tglx@linutronix.de, paul.burton@mips.com,
        gregkh@linuxfoundation.org, jason@lakedaemon.net, syq@debian.org,
        marc.zyngier@arm.com, rfontana@redhat.com, armijn@tjaldur.nl,
        allison@lohutok.net
From:   Zhou Yanjie <zhouyanjie@zoho.com>
Message-ID: <5D99832E.5060505@zoho.com>
Date:   Sun, 6 Oct 2019 14:01:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1570320829.3.2@crapouillou.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Pual,

On 2019=E5=B9=B410=E6=9C=8806=E6=97=A5 08:13, Paul Cercueil wrote:
> Hi Zhou,
>
>
> Le mer., oct. 2, 2019 at 19:25, Zhou Yanjie <zhouyanjie@zoho.com> a=20
> =C3=A9crit :
>> From: Paul Cercueil <paul@crapouillou.net>
>>
>> The same behaviour can be obtained by using the IRQCHIP_MASK_ON_SUSPEND
>> flag on the IRQ chip.
>>
>> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>
> If you sumbit a patchset that contains someone else's patches you need=20
> to add your Signed-off-by too.

Thank you for the reminder. I'll add my Signed-off-by in v6.
>
>> ---
>>  drivers/irqchip/irq-ingenic.c   | 24 +-----------------------
>>  include/linux/irqchip/ingenic.h | 14 --------------
>>  2 files changed, 1 insertion(+), 37 deletions(-)
>>  delete mode 100644 include/linux/irqchip/ingenic.h
>>
>> diff --git a/drivers/irqchip/irq-ingenic.c=20
>> b/drivers/irqchip/irq-ingenic.c
>> index f126255..06fa810 100644
>> --- a/drivers/irqchip/irq-ingenic.c
>> +++ b/drivers/irqchip/irq-ingenic.c
>> @@ -10,7 +10,6 @@
>>  #include <linux/interrupt.h>
>>  #include <linux/ioport.h>
>>  #include <linux/irqchip.h>
>> -#include <linux/irqchip/ingenic.h>
>>  #include <linux/of_address.h>
>>  #include <linux/of_irq.h>
>>  #include <linux/timex.h>
>> @@ -50,26 +49,6 @@ static irqreturn_t intc_cascade(int irq, void *data)
>>      return IRQ_HANDLED;
>>  }
>>
>> -static void intc_irq_set_mask(struct irq_chip_generic *gc, uint32_t=20
>> mask)
>> -{
>> -    struct irq_chip_regs *regs =3D &gc->chip_types->regs;
>> -
>> -    writel(mask, gc->reg_base + regs->enable);
>> -    writel(~mask, gc->reg_base + regs->disable);
>> -}
>> -
>> -void ingenic_intc_irq_suspend(struct irq_data *data)
>> -{
>> -    struct irq_chip_generic *gc =3D irq_data_get_irq_chip_data(data);
>> -    intc_irq_set_mask(gc, gc->wake_active);
>> -}
>> -
>> -void ingenic_intc_irq_resume(struct irq_data *data)
>> -{
>> -    struct irq_chip_generic *gc =3D irq_data_get_irq_chip_data(data);
>> -    intc_irq_set_mask(gc, gc->mask_cache);
>> -}
>> -
>>  static struct irqaction intc_cascade_action =3D {
>>      .handler =3D intc_cascade,
>>      .name =3D "SoC intc cascade interrupt",
>> @@ -127,8 +106,7 @@ static int __init ingenic_intc_of_init(struct=20
>> device_node *node,
>>          ct->chip.irq_mask =3D irq_gc_mask_disable_reg;
>>          ct->chip.irq_mask_ack =3D irq_gc_mask_disable_reg;
>>          ct->chip.irq_set_wake =3D irq_gc_set_wake;
>> -        ct->chip.irq_suspend =3D ingenic_intc_irq_suspend;
>> -        ct->chip.irq_resume =3D ingenic_intc_irq_resume;
>> +        ct->chip.flags =3D IRQCHIP_MASK_ON_SUSPEND;
>>
>>          irq_setup_generic_chip(gc, IRQ_MSK(32), 0, 0,
>>                         IRQ_NOPROBE | IRQ_LEVEL);
>> diff --git a/include/linux/irqchip/ingenic.h=20
>> b/include/linux/irqchip/ingenic.h
>> deleted file mode 100644
>> index 1465588..0000000
>> --- a/include/linux/irqchip/ingenic.h
>> +++ /dev/null
>> @@ -1,14 +0,0 @@
>> -/* SPDX-License-Identifier: GPL-2.0-or-later */
>> -/*
>> - *  Copyright (C) 2010, Lars-Peter Clausen <lars@metafoo.de>
>> - */
>> -
>> -#ifndef __LINUX_IRQCHIP_INGENIC_H__
>> -#define __LINUX_IRQCHIP_INGENIC_H__
>> -
>> -#include <linux/irq.h>
>> -
>> -extern void ingenic_intc_irq_suspend(struct irq_data *data);
>> -extern void ingenic_intc_irq_resume(struct irq_data *data);
>> -
>> -#endif
>> --=20
>> 2.7.4
>>
>>
>
>



