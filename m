Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A725B1ADBE8
	for <lists+linux-mips@lfdr.de>; Fri, 17 Apr 2020 13:12:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730115AbgDQLK1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 17 Apr 2020 07:10:27 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:60934 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729468AbgDQLK1 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 17 Apr 2020 07:10:27 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 3A4A7F3EA52CC01CAB9E;
        Fri, 17 Apr 2020 19:10:25 +0800 (CST)
Received: from [127.0.0.1] (10.166.213.7) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Fri, 17 Apr 2020
 19:10:15 +0800
Subject: Re: [PATCH] irqchip/irq-bcm7038-l1: make bcm7038_l1_of_init() static
To:     Marc Zyngier <maz@kernel.org>
CC:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        <f.fainelli@gmail.com>, <tglx@linutronix.de>,
        <jason@lakedaemon.net>, <justinpopo6@gmail.com>,
        <bcm-kernel-feedback-list@broadcom.com>,
        <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
References: <20200417074036.46594-1-yanaijie@huawei.com>
 <ecb3e3e1-7761-faa7-10fa-67da69604306@cogentembedded.com>
 <b2f6f8cd-557c-3978-f176-e615cba8b458@huawei.com>
 <a71e75e8e391c76bf2f260abbaad4f9d@kernel.org>
From:   Jason Yan <yanaijie@huawei.com>
Message-ID: <f06da401-1083-c0c7-17a9-7a3fe0476820@huawei.com>
Date:   Fri, 17 Apr 2020 19:10:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <a71e75e8e391c76bf2f260abbaad4f9d@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.166.213.7]
X-CFilter-Loop: Reflected
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



在 2020/4/17 19:07, Marc Zyngier 写道:
> On 2020-04-17 11:56, Jason Yan wrote:
>> 在 2020/4/17 18:26, Sergei Shtylyov 写道:
>>> Hello!
>>>
>>> On 17.04.2020 10:40, Jason Yan wrote:
>>>
>>>> Fix the following sparse warning:
>>>>
>>>> drivers/irqchip/irq-bcm7038-l1.c:419:12: warning: symbol
>>>> 'bcm7038_l1_of_init' was not declared. Should it be static?
>>>>
>>>> Reported-by: Hulk Robot <hulkci@huawei.com>
>>>> Signed-off-by: Jason Yan <yanaijie@huawei.com>
>>>> ---
>>>>   drivers/irqchip/irq-bcm7038-l1.c | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/irqchip/irq-bcm7038-l1.c 
>>>> b/drivers/irqchip/irq-bcm7038-l1.c
>>>> index eb9bce93cd05..fd7c537fb42a 100644
>>>> --- a/drivers/irqchip/irq-bcm7038-l1.c
>>>> +++ b/drivers/irqchip/irq-bcm7038-l1.c
>>>> @@ -416,7 +416,7 @@ static const struct irq_domain_ops 
>>>> bcm7038_l1_domain_ops = {
>>>>       .map            = bcm7038_l1_map,
>>>>   };
>>>> -int __init bcm7038_l1_of_init(struct device_node *dn,
>>>> +static int __init bcm7038_l1_of_init(struct device_node *dn,
>>>>                     struct device_node *parent)
>>>
>>>     Reindent the above line please, it should start under *struct* on 
>>> the 1st line.
>>
>> OK, will cook a new one.
> 
> Please don't bother. I've picked the patch already, and it is on its way 
> to Linus.
> 

I have send v2 before I saw this. You can just ignore it.

Thanks,

Jason

> Thanks,
> 
>          M.

