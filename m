Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99A0C13C35F
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jan 2020 14:40:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729009AbgAONke (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 15 Jan 2020 08:40:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:51866 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726474AbgAONke (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 15 Jan 2020 08:40:34 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2DB9D222C3;
        Wed, 15 Jan 2020 13:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579095633;
        bh=yEvYDgP0hc8sIQw49jsuC8Li1BERDoQiLHX4I+8npEU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=yUBid8+OSRibkxQojKsX7U3nIkQ7ueJEq+o1uKTakja28wR4D9oyApWN9B7jIKciZ
         UOxa2zAJNDRE2yc5+w91idP+kk9v4zoYM5Q7Tz33MW0wHXmyI0h/aQf/EIxXp3jqHl
         g2S/w8EfgByVvLY3hywPz6T2VPLlDqmXjYeTBUv8=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1iriuN-0008Ry-FJ; Wed, 15 Jan 2020 13:40:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Wed, 15 Jan 2020 13:40:31 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     Paul Burton <paulburton@kernel.org>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org,
        chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de,
        jason@lakedaemon.net, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] irqchip: mips-cpu: Remove eoi operation
In-Reply-To: <20200114233025.y4azwvivqo7kg7i5@pburton-laptop>
References: <20200113101251.37471-1-jiaxun.yang@flygoat.com>
 <20200114233025.y4azwvivqo7kg7i5@pburton-laptop>
Message-ID: <9cd8df72fc3a7dfcdd88eb1fb56bbe35@kernel.org>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/1.3.8
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: paulburton@kernel.org, jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org, chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de, jason@lakedaemon.net, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2020-01-14 23:30, Paul Burton wrote:
> Hi Jiaxun,
> 
> On Mon, Jan 13, 2020 at 06:12:51PM +0800, Jiaxun Yang wrote:
>> The eoi opreation in mips_cpu_irq_controller caused chained_irq_enter
>> falsely consider CPU IP interrupt as a FastEOI type IRQ. So the 
>> interrupt
>> won't be masked during in handler. Which might lead to spurious 
>> interrupt.
>> 
>> Thus we simply remove eoi operation for mips_cpu_irq_controller,
>> 
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---
>>  drivers/irqchip/irq-mips-cpu.c | 1 -
>>  1 file changed, 1 deletion(-)
>> 
>> diff --git a/drivers/irqchip/irq-mips-cpu.c 
>> b/drivers/irqchip/irq-mips-cpu.c
>> index 95d4fd8f7a96..0ad7f1f9a58b 100644
>> --- a/drivers/irqchip/irq-mips-cpu.c
>> +++ b/drivers/irqchip/irq-mips-cpu.c
>> @@ -55,7 +55,6 @@ static struct irq_chip mips_cpu_irq_controller = {
>>  	.irq_mask	= mask_mips_irq,
>>  	.irq_mask_ack	= mask_mips_irq,
>>  	.irq_unmask	= unmask_mips_irq,
>> -	.irq_eoi	= unmask_mips_irq,
>>  	.irq_disable	= mask_mips_irq,
>>  	.irq_enable	= unmask_mips_irq,
>>  };
> 
> This one scares me; something doesn't seem right. The irq_eoi (née eoi)
> callback was first added way back in commit 1417836e81c0 ("[MIPS] use
> generic_handle_irq, handle_level_irq, handle_percpu_irq"). The commit
> message there states that the motivation was to allow use of
> handle_percpu_irq(), and indeed handle_percpu_irq() does:
> 
>     irq_ack() (ie. mask)
>     invoke the handler(s)
>     irq_eoi() (ie. unmask)
> 
> By removing the irq_eoi callback I don't see how we'd ever unmask the
> interrupt again..?

To be completely blunt, the fact that unmask and eoi are implemented the
same way is a clear sign that this is a bit broken.

irq_eoi is used if the irqchip tracks the IRQ life-cycle in HW, and it's
not obvious that this is the case. The fact that ack is also mapped to 
mask
just adds to my feeling...

         M.
-- 
Jazz is not dead. It just smells funny...
