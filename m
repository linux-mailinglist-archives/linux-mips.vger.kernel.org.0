Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF00B1ADBD9
	for <lists+linux-mips@lfdr.de>; Fri, 17 Apr 2020 13:09:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729844AbgDQLHY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 17 Apr 2020 07:07:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:38318 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729468AbgDQLHX (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 17 Apr 2020 07:07:23 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0E3CB208E4;
        Fri, 17 Apr 2020 11:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587121643;
        bh=DmgltjBK4QKApIxoMn7dgc25Veb7MiJLv9jXdkjAQro=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=o3t5BLykt3O4YtNk20NOWGLDpJz8/j148eKWCx1KIcJh6qhiCzQYwkRo/qgIGsssN
         BBM2O815lkk6xpvScuEtaiWsA3ptDdyvFKZV+7PEgdM3uWG4sJQZT/PhMNeuq+iXe1
         whUXkJziBI0uti6u3IpoNeVK9HgFLXXBGQM/Cw6E=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1jPOq9-0049ii-EA; Fri, 17 Apr 2020 12:07:21 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Fri, 17 Apr 2020 12:07:21 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Jason Yan <yanaijie@huawei.com>
Cc:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        f.fainelli@gmail.com, tglx@linutronix.de, jason@lakedaemon.net,
        justinpopo6@gmail.com, bcm-kernel-feedback-list@broadcom.com,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH] irqchip/irq-bcm7038-l1: make bcm7038_l1_of_init() static
In-Reply-To: <b2f6f8cd-557c-3978-f176-e615cba8b458@huawei.com>
References: <20200417074036.46594-1-yanaijie@huawei.com>
 <ecb3e3e1-7761-faa7-10fa-67da69604306@cogentembedded.com>
 <b2f6f8cd-557c-3978-f176-e615cba8b458@huawei.com>
Message-ID: <a71e75e8e391c76bf2f260abbaad4f9d@kernel.org>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/1.3.10
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: yanaijie@huawei.com, sergei.shtylyov@cogentembedded.com, f.fainelli@gmail.com, tglx@linutronix.de, jason@lakedaemon.net, justinpopo6@gmail.com, bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, hulkci@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2020-04-17 11:56, Jason Yan wrote:
> 在 2020/4/17 18:26, Sergei Shtylyov 写道:
>> Hello!
>> 
>> On 17.04.2020 10:40, Jason Yan wrote:
>> 
>>> Fix the following sparse warning:
>>> 
>>> drivers/irqchip/irq-bcm7038-l1.c:419:12: warning: symbol
>>> 'bcm7038_l1_of_init' was not declared. Should it be static?
>>> 
>>> Reported-by: Hulk Robot <hulkci@huawei.com>
>>> Signed-off-by: Jason Yan <yanaijie@huawei.com>
>>> ---
>>>   drivers/irqchip/irq-bcm7038-l1.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>> 
>>> diff --git a/drivers/irqchip/irq-bcm7038-l1.c 
>>> b/drivers/irqchip/irq-bcm7038-l1.c
>>> index eb9bce93cd05..fd7c537fb42a 100644
>>> --- a/drivers/irqchip/irq-bcm7038-l1.c
>>> +++ b/drivers/irqchip/irq-bcm7038-l1.c
>>> @@ -416,7 +416,7 @@ static const struct irq_domain_ops 
>>> bcm7038_l1_domain_ops = {
>>>       .map            = bcm7038_l1_map,
>>>   };
>>> -int __init bcm7038_l1_of_init(struct device_node *dn,
>>> +static int __init bcm7038_l1_of_init(struct device_node *dn,
>>>                     struct device_node *parent)
>> 
>>     Reindent the above line please, it should start under *struct* on 
>> the 1st line.
> 
> OK, will cook a new one.

Please don't bother. I've picked the patch already, and it is on its way 
to Linus.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
