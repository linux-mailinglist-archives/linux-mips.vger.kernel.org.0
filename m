Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E6B9BB787
	for <lists+linux-mips@lfdr.de>; Mon, 23 Sep 2019 17:08:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726232AbfIWPIU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 23 Sep 2019 11:08:20 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:44238 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726135AbfIWPIU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 23 Sep 2019 11:08:20 -0400
Received: by mail-pl1-f193.google.com with SMTP id q15so6614862pll.11;
        Mon, 23 Sep 2019 08:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ltudtw1G9J/bpQZNPbK0eoYkbUUYAlQ+sUU/XiL/UVs=;
        b=ol3A3so6m++aALYWz8joNftNmETFG5RM+bH+icq5ZzJA4TvaK6h9fonJuzDQihPoCN
         z3KIqaZWM3QJpjliKAojrU3XimtShgjEBPF1/rJu2bUTDvA+oupCUP6ndQtDSHQR9pJQ
         obl45V9J47h9CgGY+0LaWdwf8Fg2QL0HrujIpwfeXL8MojAPDseZ/tmltHCYMnKMMrnk
         MtebwCKmXh+qltPFnci+taqUZuIiZ8E5a8AbTvyCXQOExL013a8ZUVViE+PIT3fOF0jc
         kpsfltdaZ6C4DbvWJYS+B7BZue09IBLWEW85oViaXxUKbLZTpD4i4z7NXmMjDoAmcvyK
         8mxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ltudtw1G9J/bpQZNPbK0eoYkbUUYAlQ+sUU/XiL/UVs=;
        b=ib83310n7qbXjB6AWKN+JH08hjZHKBHZ6rHRTYVL4ddjTZtWm6WBSkerDozqb7T0qi
         4LfW4bBea6TfGs8E2tBv+3SuXREbQQLa4DTzdCFyzm1lWOetMKneBZoZ9fxK7wFi0FUx
         3C6cByOZS2oFevkPsT/iqu5B0Ix3vnzONn5oGYTIB84GWw9+Ijh2zNwTFj/7Eg91+ghG
         AiXJ8ovbnAPVKMADmIERII+EwVEr8+VxyrLsbz6LzjtAJnEJ76eYLDRVU06ciDx0y/zC
         BijrPWGHWi1D0Kx9rGqRwU6xpKr7LgOdSB5q8qWqEUemLarTbQP3o6zbJigHV00sQzLe
         2wEw==
X-Gm-Message-State: APjAAAUoMgQybu74efm+jZ+qjsSZPL569Ihb+n/VmumdNQQUnrqDEVDz
        6V2HxU+mCV/hIqzAsgS34yQBnzfhcG4=
X-Google-Smtp-Source: APXvYqxD9f3jPzLMil7D5kinF+C7er/XJRdnFnaB/jtun9lw4muTSwnwEjluQbmLX0Eb3QDSGBB4Jg==
X-Received: by 2002:a17:902:a50a:: with SMTP id s10mr220458plq.336.1569251298491;
        Mon, 23 Sep 2019 08:08:18 -0700 (PDT)
Received: from [10.230.28.130] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id y2sm11139827pfe.126.2019.09.23.08.08.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Sep 2019 08:08:17 -0700 (PDT)
Subject: Re: [PATCH v2 5/5] irqchip/irq-bcm7038-l1: Support brcm,int-fwd-mask
To:     Marc Zyngier <maz@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>
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
 <fbc07e1e-8c72-8728-2acb-647db533e31b@kernel.org>
 <8b0f18ef-7b72-e6fd-9930-0f698ced270b@gmail.com>
 <7610ea17-de8a-d475-7a9e-8f314f5f34a3@kernel.org>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <59d705bc-0fda-e6e3-9234-fba7158853a7@gmail.com>
Date:   Mon, 23 Sep 2019 08:08:16 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <7610ea17-de8a-d475-7a9e-8f314f5f34a3@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 9/23/2019 7:57 AM, Marc Zyngier wrote:
> On 23/09/2019 15:39, Florian Fainelli wrote:
>>
>>
>> On 9/23/2019 1:52 AM, Marc Zyngier wrote:
>>> On 22/09/2019 20:08, Florian Fainelli wrote:
>>>>
>>>>
>>>> On 9/22/2019 5:38 AM, Marc Zyngier wrote:
>>>>> On Fri, 13 Sep 2019 12:15:42 -0700
>>>>> Florian Fainelli <f.fainelli@gmail.com> wrote:
>>>>>
>>>>>> On some specific chips like 7211 we need to leave some interrupts
>>>>>> untouched/forwarded to the VPU which is another agent in the system
>>>>>> making use of that interrupt controller hardware (goes to both ARM GIC
>>>>>> and VPU L1 interrupt controller). Make that possible by using the
>>>>>> existing brcm,int-fwd-mask property.
>>>>>>
>>>>>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>>>>>> ---
>>>>>>  drivers/irqchip/irq-bcm7038-l1.c | 15 +++++++++++++--
>>>>>>  1 file changed, 13 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/irqchip/irq-bcm7038-l1.c b/drivers/irqchip/irq-bcm7038-l1.c
>>>>>> index 0673a44bbdc2..811a34201dd4 100644
>>>>>> --- a/drivers/irqchip/irq-bcm7038-l1.c
>>>>>> +++ b/drivers/irqchip/irq-bcm7038-l1.c
>>>>>> @@ -44,6 +44,7 @@ struct bcm7038_l1_chip {
>>>>>>  	struct list_head	list;
>>>>>>  	u32			wake_mask[MAX_WORDS];
>>>>>>  #endif
>>>>>> +	u32			irq_fwd_mask[MAX_WORDS];
>>>>>>  	u8			affinity[MAX_WORDS * IRQS_PER_WORD];
>>>>>>  };
>>>>>>  
>>>>>> @@ -265,6 +266,7 @@ static int __init bcm7038_l1_init_one(struct device_node *dn,
>>>>>>  	resource_size_t sz;
>>>>>>  	struct bcm7038_l1_cpu *cpu;
>>>>>>  	unsigned int i, n_words, parent_irq;
>>>>>> +	int ret;
>>>>>>  
>>>>>>  	if (of_address_to_resource(dn, idx, &res))
>>>>>>  		return -EINVAL;
>>>>>> @@ -278,6 +280,14 @@ static int __init bcm7038_l1_init_one(struct device_node *dn,
>>>>>>  	else if (intc->n_words != n_words)
>>>>>>  		return -EINVAL;
>>>>>>  
>>>>>> +	ret = of_property_read_u32_array(dn , "brcm,int-fwd-mask",
>>>>>
>>>>> What is the exact meaning of "fwd"? Forward? FirmWare Dementia?
>>>>
>>>> Here it is meant to be "forward", we have defined this property name
>>>> before for irq-bcm7120-l2.c and felt like reusing the same name to avoid
>>>> multiplying properties would be appropriate, see patch #4. If you prefer
>>>> something named brcm,firmware-configured-mask, let me know.
>>>
>>> It's just a name, but I found it a bit confusing. Bah, never mind.
>>>
>>>>>
>>>>>> +					 intc->irq_fwd_mask, n_words);
>>>>>> +	if (ret != 0 && ret != -EINVAL) {
>>>>>> +		/* property exists but has the wrong number of words */
>>>>>> +		pr_err("invalid brcm,int-fwd-mask property\n");
>>>>>> +		return -EINVAL;
>>>>>> +	}
>>>>>> +
>>>>>>  	cpu = intc->cpus[idx] = kzalloc(sizeof(*cpu) + n_words * sizeof(u32),
>>>>>>  					GFP_KERNEL);
>>>>>>  	if (!cpu)
>>>>>> @@ -288,8 +298,9 @@ static int __init bcm7038_l1_init_one(struct device_node *dn,
>>>>>>  		return -ENOMEM;
>>>>>>  
>>>>>>  	for (i = 0; i < n_words; i++) {
>>>>>> -		l1_writel(0xffffffff, cpu->map_base + reg_mask_set(intc, i));
>>>>>> -		cpu->mask_cache[i] = 0xffffffff;
>>>>>> +		l1_writel(0xffffffff & ~intc->irq_fwd_mask[i],
>>>>>> +			  cpu->map_base + reg_mask_set(intc, i));
>>>>>> +		cpu->mask_cache[i] = 0xffffffff & ~intc->irq_fwd_mask[i];
>>>>>
>>>>> I seem to remember that (0xffffffff & whatever) == whatever, as long as
>>>>> 'whatever' is a 32bit quantity. So what it this for?
>>>>
>>>> It is 0xffff_ffff & ~whatever here.
>>>
>>> Which doesn't change anything.
>>>
>>>> In the absence of this property
>>>> being specified, the data is all zeroed out, so we would have
>>>> 0xffff_ffff & 0xffff_ffff which is 0xffff_ffff. If this property is
>>>> specified, we would have one more or bits set, and it would be e.g.:
>>>> 0x100 so we would have 0xffff_ffff & ~(0x100) = 0xffff_feff which is
>>>> what we would want here to preserve whatever the firmware has already
>>>> configured.
>>>
>>> OK, I must be stupid:
>>>
>>> #include <stdio.h>
>>>
>>> int main(int argc, char *argv[])
>>> {
>>> 	unsigned int v = 0x100;
>>> 	printf ("%x\n", ~v);
>>> }
>>> maz@filthy-habit$ ./x
>>> fffffeff
>>>
>>> You might as well OR it with zeroes, if you want.
>>
>> Not sure I understand your point here.
>>
>> We used to write 0xffff_ffff to both the hardware and the mask cache to
>> have all interrupts masked by default. Now we want to have some bits
>> optionally set to 0 (unmasked), based on the brcm,int-fwd-mask property,
>> which is what this patch achieves (or tries to). If we write, say
>> 0xffff_feff to the hardware, which has a Write Only register behavior,
>> then we also want to have the mask cache be set to the same value for
>> consistency if nothing else. Am I failing at doing what I just described
>> and also failing at see it?
> 
> You write this:
> 
>>  	for (i = 0; i < n_words; i++) {
>> -		l1_writel(0xffffffff, cpu->map_base + reg_mask_set(intc, i));
>> -		cpu->mask_cache[i] = 0xffffffff;
>> +		l1_writel(0xffffffff & ~intc->irq_fwd_mask[i],
>> +			  cpu->map_base + reg_mask_set(intc, i));
>> +		cpu->mask_cache[i] = 0xffffffff & ~intc->irq_fwd_mask[i];
>>  	}
> 
> And I'm saying that this is strictly equivalent to:
> 
>  	for (i = 0; i < n_words; i++) {
> 		l1_writel(~intc->irq_fwd_mask[i],
> 			  cpu->map_base + reg_mask_set(intc, i));
> 		cpu->mask_cache[i] = ~intc->irq_fwd_mask[i];
>  	}
> 
> without this 0xffffffff that does exactly nothing (I'm pretty sure the
> compiler drops it anyway).

I understand quickly, you just need to repeat many times, thanks for
bearing with me, this is indeed simpler and clearer.
-- 
Florian
