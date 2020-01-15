Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC0CB13C75B
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jan 2020 16:22:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbgAOPW0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 15 Jan 2020 10:22:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:37598 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726165AbgAOPWZ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 15 Jan 2020 10:22:25 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D267C222C3;
        Wed, 15 Jan 2020 15:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579101745;
        bh=cvfRqz1ibhGwd9Bfq/ipsNjUM/YLm6PWajSturlDpO8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=xGMd7qdbDcW1VDnyBCw2hPfD+W9TQNoiAvP9y8xdKT11kvcJo8JgawblBxEbP2678
         jFLFvUCAT2PfIKBVMQOHVku0RoTHaAK1vCbDTQQ3F/jPpwhlWKSPGb63cj6re2PGoz
         uVom/N0+FPpx4gPipu8HWG6SeKiaMNfVOMZFefPk=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1irkUx-00026g-4Y; Wed, 15 Jan 2020 15:22:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Wed, 15 Jan 2020 15:22:23 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Paul Burton <paulburton@kernel.org>, linux-mips@vger.kernel.org,
        chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de,
        jason@lakedaemon.net, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] irqchip: mips-cpu: Remove eoi operation
In-Reply-To: <C7C70199-38CC-473E-B20D-C1782F08CA2E@flygoat.com>
References: <20200113101251.37471-1-jiaxun.yang@flygoat.com>
 <20200114233025.y4azwvivqo7kg7i5@pburton-laptop>
 <9cd8df72fc3a7dfcdd88eb1fb56bbe35@kernel.org>
 <C7C70199-38CC-473E-B20D-C1782F08CA2E@flygoat.com>
Message-ID: <f6ebc43da6de4e7e346ac4c807748ae8@kernel.org>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/1.3.8
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: jiaxun.yang@flygoat.com, paulburton@kernel.org, linux-mips@vger.kernel.org, chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de, jason@lakedaemon.net, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2020-01-15 14:23, Jiaxun Yang wrote:
> 于 2020年1月15日 GMT+08:00 下午9:40:31, Marc Zyngier <maz@kernel.org> 写到:
>> On 2020-01-14 23:30, Paul Burton wrote:
>>> Hi Jiaxun,
>>> 
>>> On Mon, Jan 13, 2020 at 06:12:51PM +0800, Jiaxun Yang wrote:
>>>> The eoi opreation in mips_cpu_irq_controller caused
>> chained_irq_enter
>>>> falsely consider CPU IP interrupt as a FastEOI type IRQ. So the
>>>> interrupt
>>>> won't be masked during in handler. Which might lead to spurious
>>>> interrupt.
>>>> 
>>>> Thus we simply remove eoi operation for mips_cpu_irq_controller,
>>>> 
>>>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>>> ---
>>>>  drivers/irqchip/irq-mips-cpu.c | 1 -
>>>>  1 file changed, 1 deletion(-)
>>>> 
>>>> diff --git a/drivers/irqchip/irq-mips-cpu.c
>>>> b/drivers/irqchip/irq-mips-cpu.c
>>>> index 95d4fd8f7a96..0ad7f1f9a58b 100644
>>>> --- a/drivers/irqchip/irq-mips-cpu.c
>>>> +++ b/drivers/irqchip/irq-mips-cpu.c
>>>> @@ -55,7 +55,6 @@ static struct irq_chip mips_cpu_irq_controller = {
>>>>  	.irq_mask	= mask_mips_irq,
>>>>  	.irq_mask_ack	= mask_mips_irq,
>>>>  	.irq_unmask	= unmask_mips_irq,
>>>> -	.irq_eoi	= unmask_mips_irq,
>>>>  	.irq_disable	= mask_mips_irq,
>>>>  	.irq_enable	= unmask_mips_irq,
>>>>  };
>>> 
>>> This one scares me; something doesn't seem right. The irq_eoi (née
>> eoi)
>>> callback was first added way back in commit 1417836e81c0 ("[MIPS] use
>>> generic_handle_irq, handle_level_irq, handle_percpu_irq"). The commit
>>> message there states that the motivation was to allow use of
>>> handle_percpu_irq(), and indeed handle_percpu_irq() does:
>>> 
>>>     irq_ack() (ie. mask)
>>>     invoke the handler(s)
>>>     irq_eoi() (ie. unmask)
>>> 
>>> By removing the irq_eoi callback I don't see how we'd ever unmask the
>>> interrupt again..?
>> 
>> To be completely blunt, the fact that unmask and eoi are implemented
>> the
>> same way is a clear sign that this is a bit broken.
>> 
>> irq_eoi is used if the irqchip tracks the IRQ life-cycle in HW, and
>> it's
>> not obvious that this is the case. The fact that ack is also mapped to
>> mask
> 
> It's just a kind of hack to workaround the fact that our current
> percpu irq handler assumed
> all percpu irqs are edge triggered or fasteoi type.
> 
> However MIPS processor implemented it in level triggered way.
> 
> My solution would be add a check. If neither ack nor eoi exist for the 
> chip,
> than we assume it's level triggered and process precpu irq in 
> mask/unmask way.
> 
> Could it be a possible option?

Post the patch, and we'll discuss it.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
