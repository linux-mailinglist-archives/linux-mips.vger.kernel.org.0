Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C8E4BAFFB
	for <lists+linux-mips@lfdr.de>; Mon, 23 Sep 2019 10:52:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731909AbfIWIwp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 23 Sep 2019 04:52:45 -0400
Received: from foss.arm.com ([217.140.110.172]:38874 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731734AbfIWIwp (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 23 Sep 2019 04:52:45 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A56D1000;
        Mon, 23 Sep 2019 01:52:44 -0700 (PDT)
Received: from [10.1.197.61] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DD0883F59C;
        Mon, 23 Sep 2019 01:52:42 -0700 (PDT)
Subject: Re: [PATCH v2 5/5] irqchip/irq-bcm7038-l1: Support brcm,int-fwd-mask
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kevin Cernekee <cernekee@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:BROADCOM BMIPS MIPS ARCHITECTURE" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "open list:BROADCOM BMIPS MIPS ARCHITECTURE" 
        <linux-mips@vger.kernel.org>
References: <20190913191542.9908-1-f.fainelli@gmail.com>
 <20190913191542.9908-6-f.fainelli@gmail.com> <20190922133805.2cdf2d99@why>
 <260e61b8-a083-743e-43fc-70b9ea644e0e@gmail.com>
From:   Marc Zyngier <maz@kernel.org>
Organization: Approximate
Message-ID: <fbc07e1e-8c72-8728-2acb-647db533e31b@kernel.org>
Date:   Mon, 23 Sep 2019 09:52:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <260e61b8-a083-743e-43fc-70b9ea644e0e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 22/09/2019 20:08, Florian Fainelli wrote:
> 
> 
> On 9/22/2019 5:38 AM, Marc Zyngier wrote:
>> On Fri, 13 Sep 2019 12:15:42 -0700
>> Florian Fainelli <f.fainelli@gmail.com> wrote:
>>
>>> On some specific chips like 7211 we need to leave some interrupts
>>> untouched/forwarded to the VPU which is another agent in the system
>>> making use of that interrupt controller hardware (goes to both ARM GIC
>>> and VPU L1 interrupt controller). Make that possible by using the
>>> existing brcm,int-fwd-mask property.
>>>
>>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>>> ---
>>>  drivers/irqchip/irq-bcm7038-l1.c | 15 +++++++++++++--
>>>  1 file changed, 13 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/irqchip/irq-bcm7038-l1.c b/drivers/irqchip/irq-bcm7038-l1.c
>>> index 0673a44bbdc2..811a34201dd4 100644
>>> --- a/drivers/irqchip/irq-bcm7038-l1.c
>>> +++ b/drivers/irqchip/irq-bcm7038-l1.c
>>> @@ -44,6 +44,7 @@ struct bcm7038_l1_chip {
>>>  	struct list_head	list;
>>>  	u32			wake_mask[MAX_WORDS];
>>>  #endif
>>> +	u32			irq_fwd_mask[MAX_WORDS];
>>>  	u8			affinity[MAX_WORDS * IRQS_PER_WORD];
>>>  };
>>>  
>>> @@ -265,6 +266,7 @@ static int __init bcm7038_l1_init_one(struct device_node *dn,
>>>  	resource_size_t sz;
>>>  	struct bcm7038_l1_cpu *cpu;
>>>  	unsigned int i, n_words, parent_irq;
>>> +	int ret;
>>>  
>>>  	if (of_address_to_resource(dn, idx, &res))
>>>  		return -EINVAL;
>>> @@ -278,6 +280,14 @@ static int __init bcm7038_l1_init_one(struct device_node *dn,
>>>  	else if (intc->n_words != n_words)
>>>  		return -EINVAL;
>>>  
>>> +	ret = of_property_read_u32_array(dn , "brcm,int-fwd-mask",
>>
>> What is the exact meaning of "fwd"? Forward? FirmWare Dementia?
> 
> Here it is meant to be "forward", we have defined this property name
> before for irq-bcm7120-l2.c and felt like reusing the same name to avoid
> multiplying properties would be appropriate, see patch #4. If you prefer
> something named brcm,firmware-configured-mask, let me know.

It's just a name, but I found it a bit confusing. Bah, never mind.

>>
>>> +					 intc->irq_fwd_mask, n_words);
>>> +	if (ret != 0 && ret != -EINVAL) {
>>> +		/* property exists but has the wrong number of words */
>>> +		pr_err("invalid brcm,int-fwd-mask property\n");
>>> +		return -EINVAL;
>>> +	}
>>> +
>>>  	cpu = intc->cpus[idx] = kzalloc(sizeof(*cpu) + n_words * sizeof(u32),
>>>  					GFP_KERNEL);
>>>  	if (!cpu)
>>> @@ -288,8 +298,9 @@ static int __init bcm7038_l1_init_one(struct device_node *dn,
>>>  		return -ENOMEM;
>>>  
>>>  	for (i = 0; i < n_words; i++) {
>>> -		l1_writel(0xffffffff, cpu->map_base + reg_mask_set(intc, i));
>>> -		cpu->mask_cache[i] = 0xffffffff;
>>> +		l1_writel(0xffffffff & ~intc->irq_fwd_mask[i],
>>> +			  cpu->map_base + reg_mask_set(intc, i));
>>> +		cpu->mask_cache[i] = 0xffffffff & ~intc->irq_fwd_mask[i];
>>
>> I seem to remember that (0xffffffff & whatever) == whatever, as long as
>> 'whatever' is a 32bit quantity. So what it this for?
> 
> It is 0xffff_ffff & ~whatever here.

Which doesn't change anything.

> In the absence of this property
> being specified, the data is all zeroed out, so we would have
> 0xffff_ffff & 0xffff_ffff which is 0xffff_ffff. If this property is
> specified, we would have one more or bits set, and it would be e.g.:
> 0x100 so we would have 0xffff_ffff & ~(0x100) = 0xffff_feff which is
> what we would want here to preserve whatever the firmware has already
> configured.

OK, I must be stupid:

#include <stdio.h>

int main(int argc, char *argv[])
{
	unsigned int v = 0x100;
	printf ("%x\n", ~v);
}
maz@filthy-habit$ ./x
fffffeff

You might as well OR it with zeroes, if you want.

	M.
-- 
Jazz is not dead, it just smells funny...
