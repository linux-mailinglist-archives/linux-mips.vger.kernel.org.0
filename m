Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA36881FB2
	for <lists+linux-mips@lfdr.de>; Mon,  5 Aug 2019 17:03:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727259AbfHEPDO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 5 Aug 2019 11:03:14 -0400
Received: from foss.arm.com ([217.140.110.172]:50452 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728043AbfHEPDO (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 5 Aug 2019 11:03:14 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B9A8337;
        Mon,  5 Aug 2019 08:03:13 -0700 (PDT)
Received: from [10.1.197.61] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7BCC13F706;
        Mon,  5 Aug 2019 08:03:11 -0700 (PDT)
Subject: Re: [PATCH 3/5] MIPS: lantiq: add an irq_domain and irq_chip for EBU
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     tglx@linutronix.de, jason@lakedaemon.net, ralf@linux-mips.org,
        paul.burton@mips.com, jhogan@kernel.org, robh+dt@kernel.org,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mark.rutland@arm.com,
        john@phrozen.org, Hauke Mehrtens <hauke@hauke-m.de>
References: <20190727175315.28834-1-martin.blumenstingl@googlemail.com>
 <20190727175315.28834-4-martin.blumenstingl@googlemail.com>
 <86y30imq9p.wl-marc.zyngier@arm.com>
 <CAFBinCCb4aTfuxaSrUp8xbUjjefi_qHOUJLjzH+acUTLY+6Geg@mail.gmail.com>
 <86o916mx2m.wl-maz@kernel.org>
 <CAFBinCDRBmG39Pa4XBa2Bu8K6GH7iz_YyKoJ795XKTnEz2b4VQ@mail.gmail.com>
From:   Marc Zyngier <maz@kernel.org>
Organization: Approximate
Message-ID: <f779fc72-ec40-214b-eb81-d21d6b15d5b3@kernel.org>
Date:   Mon, 5 Aug 2019 16:03:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCDRBmG39Pa4XBa2Bu8K6GH7iz_YyKoJ795XKTnEz2b4VQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 03/08/2019 18:33, Martin Blumenstingl wrote:
> Hi Marc,
> 
> On Sat, Aug 3, 2019 at 11:12 AM Marc Zyngier <maz@kernel.org> wrote:
>>
>> Hi Martin,
>>
>> On Thu, 01 Aug 2019 18:42:42 +0100,
>> Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:
>>
>> [...]
>>
>>>>> +static void ltq_ebu_irq_handler(struct irq_desc *desc)
>>>>> +{
>>>>> +     struct irq_domain *domain = irq_desc_get_handler_data(desc);
>>>>> +     struct irq_chip *irqchip = irq_desc_get_chip(desc);
>>>>> +
>>>>> +     chained_irq_enter(irqchip, desc);
>>>>> +
>>>>> +     generic_handle_irq(irq_find_mapping(domain, 0));
>>>>
>>>> Having an irqdomain for a single interrupt is a bit over the top... Is
>>>> that for the convenience of the DT infrastructure?
>>> yes, I did it to get DT support
>>> please let me know if there's a "better" way (preferably with another
>>> driver as example)
>>
>> To be honest, the chained handler is what troubles me the most. You
>> normally would use such a construct if you had a multiplexer. In your
>> case, you have a 1:1 relationship between input and output. It is just
>> that this irqchip allows the trigger to be adapted, which normally
>> calls for a hierarchical implementation.
>>
>> In your case, with only a single interrupt, it doesn't matter much
>> though.
> I see, thank you for the explanation
> 
> can you name a driver for a hierarchical irqchip driver that you
> consider "clean" which I could use as reference?

Finding a "clean" driver is a challenge, as the world of IRQ controllers
is where both HW and SW engineers (me included) love to "innovate" ;-).

I'd recommend you have a look at drivers/irqchip/irq-mtk-cirq.c, which
is almost as simple as it gets.

Thanks,

	M.
-- 
Jazz is not dead, it just smells funny...
