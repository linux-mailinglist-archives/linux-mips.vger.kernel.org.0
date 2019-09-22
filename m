Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10626BA8CC
	for <lists+linux-mips@lfdr.de>; Sun, 22 Sep 2019 21:50:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393857AbfIVTIN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 22 Sep 2019 15:08:13 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:34988 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393940AbfIVTIN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 22 Sep 2019 15:08:13 -0400
Received: by mail-pf1-f196.google.com with SMTP id 205so7670532pfw.2;
        Sun, 22 Sep 2019 12:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=j6ihdIbEezb6H/uIwxr2v6+zkYRv2caNc+xhgdDtRXQ=;
        b=A5w0lOOiaLMZXHPxikGhEOSTfhr1n2Ew1OmTFFD9NDyT+E9JHjZokik/1GRBxb7umo
         gKMYTBXdwX4tXnDnOP3IEIjqKRwtwF5cjDJ+SrwnBIFHbsb8g15mNcfTfEx1SSphoJNi
         XJLKbSy3I1Mf5Tn2hWUsMzHHBhVKis4Jn+R+5Ox/eAOuQdAl2rz32GOCeQAblZcICe6v
         yN0LOe2/Hw4hUYCbJIiFpaXVnY7EOvVqkdWsvGYv7CpLWfqh3XzERP7wrJdBacrdT0AV
         W2pryA/XYRChTTrqUXA0dipaxjeVXASXiVLG2XsqtXRpBGZ2CN2lP4rsREZNs+gpFt1A
         ayqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=j6ihdIbEezb6H/uIwxr2v6+zkYRv2caNc+xhgdDtRXQ=;
        b=qIUAo5TC0Qz8CrPS96DEdCkTNEYBUyQubHb52WtvjH42Q9vjM2v29jWNJmJPfkbDxi
         KaFMRYEKXefdETqZtnKvfS8OfFVQLQKbaY3g0EDbSdKK2xtiUWVT3cuMvnxf+MzDb001
         2mZOg25ADtBRYH0nWGM38Tbr/sLNi+ru4j4Z5/Lh+e4ojs7zw2TB5yPKA/Sl1xwv6h6t
         jr30UB5M9sP6VxMUukRFlGYEicaABPw824C8jMEFa8MhGZPrpQ60fI29G1MZQtAAE3ML
         ezFFauq5cCDujbKXdQjcfaFGu0apMFKAQSZfx2ahOYMVI36c8k6phjHjDU9xE0CCy5Uu
         oEnw==
X-Gm-Message-State: APjAAAU6AZfb8hi4eJL3Yz0jozb3vcCeicwjJhX1GmHv1wT2qGkZ8kl+
        f/RoCH43ca2ucXIJ/xROwLN1kcBYU/0=
X-Google-Smtp-Source: APXvYqxmtiztMzG+4DPbL6NnXBHk3TmKqs0UNOa6z+LVEnLYUvwELIJZ6Cfel81bmwtktrvay//rYQ==
X-Received: by 2002:a63:d909:: with SMTP id r9mr25741098pgg.381.1569179291974;
        Sun, 22 Sep 2019 12:08:11 -0700 (PDT)
Received: from [10.230.28.130] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id fa24sm3565152pjb.13.2019.09.22.12.08.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Sep 2019 12:08:11 -0700 (PDT)
Subject: Re: [PATCH v2 5/5] irqchip/irq-bcm7038-l1: Support brcm,int-fwd-mask
To:     Marc Zyngier <maz@kernel.org>
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
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <260e61b8-a083-743e-43fc-70b9ea644e0e@gmail.com>
Date:   Sun, 22 Sep 2019 12:08:10 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190922133805.2cdf2d99@why>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 9/22/2019 5:38 AM, Marc Zyngier wrote:
> On Fri, 13 Sep 2019 12:15:42 -0700
> Florian Fainelli <f.fainelli@gmail.com> wrote:
> 
>> On some specific chips like 7211 we need to leave some interrupts
>> untouched/forwarded to the VPU which is another agent in the system
>> making use of that interrupt controller hardware (goes to both ARM GIC
>> and VPU L1 interrupt controller). Make that possible by using the
>> existing brcm,int-fwd-mask property.
>>
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>> ---
>>  drivers/irqchip/irq-bcm7038-l1.c | 15 +++++++++++++--
>>  1 file changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/irqchip/irq-bcm7038-l1.c b/drivers/irqchip/irq-bcm7038-l1.c
>> index 0673a44bbdc2..811a34201dd4 100644
>> --- a/drivers/irqchip/irq-bcm7038-l1.c
>> +++ b/drivers/irqchip/irq-bcm7038-l1.c
>> @@ -44,6 +44,7 @@ struct bcm7038_l1_chip {
>>  	struct list_head	list;
>>  	u32			wake_mask[MAX_WORDS];
>>  #endif
>> +	u32			irq_fwd_mask[MAX_WORDS];
>>  	u8			affinity[MAX_WORDS * IRQS_PER_WORD];
>>  };
>>  
>> @@ -265,6 +266,7 @@ static int __init bcm7038_l1_init_one(struct device_node *dn,
>>  	resource_size_t sz;
>>  	struct bcm7038_l1_cpu *cpu;
>>  	unsigned int i, n_words, parent_irq;
>> +	int ret;
>>  
>>  	if (of_address_to_resource(dn, idx, &res))
>>  		return -EINVAL;
>> @@ -278,6 +280,14 @@ static int __init bcm7038_l1_init_one(struct device_node *dn,
>>  	else if (intc->n_words != n_words)
>>  		return -EINVAL;
>>  
>> +	ret = of_property_read_u32_array(dn , "brcm,int-fwd-mask",
> 
> What is the exact meaning of "fwd"? Forward? FirmWare Dementia?

Here it is meant to be "forward", we have defined this property name
before for irq-bcm7120-l2.c and felt like reusing the same name to avoid
multiplying properties would be appropriate, see patch #4. If you prefer
something named brcm,firmware-configured-mask, let me know.

> 
>> +					 intc->irq_fwd_mask, n_words);
>> +	if (ret != 0 && ret != -EINVAL) {
>> +		/* property exists but has the wrong number of words */
>> +		pr_err("invalid brcm,int-fwd-mask property\n");
>> +		return -EINVAL;
>> +	}
>> +
>>  	cpu = intc->cpus[idx] = kzalloc(sizeof(*cpu) + n_words * sizeof(u32),
>>  					GFP_KERNEL);
>>  	if (!cpu)
>> @@ -288,8 +298,9 @@ static int __init bcm7038_l1_init_one(struct device_node *dn,
>>  		return -ENOMEM;
>>  
>>  	for (i = 0; i < n_words; i++) {
>> -		l1_writel(0xffffffff, cpu->map_base + reg_mask_set(intc, i));
>> -		cpu->mask_cache[i] = 0xffffffff;
>> +		l1_writel(0xffffffff & ~intc->irq_fwd_mask[i],
>> +			  cpu->map_base + reg_mask_set(intc, i));
>> +		cpu->mask_cache[i] = 0xffffffff & ~intc->irq_fwd_mask[i];
> 
> I seem to remember that (0xffffffff & whatever) == whatever, as long as
> 'whatever' is a 32bit quantity. So what it this for?

It is 0xffff_ffff & ~whatever here. In the absence of this property
being specified, the data is all zeroed out, so we would have
0xffff_ffff & 0xffff_ffff which is 0xffff_ffff. If this property is
specified, we would have one more or bits set, and it would be e.g.:
0x100 so we would have 0xffff_ffff & ~(0x100) = 0xffff_feff which is
what we would want here to preserve whatever the firmware has already
configured. In hindsight, it may be safer to make sure no one in Linux
can actually map that interrupt, so we would need something like this in
addition to what we already have in this patch:

diff --git a/drivers/irqchip/irq-bcm7038-l1.c
b/drivers/irqchip/irq-bcm7038-l1.c
index fc75c61233aa..558e74be0d60 100644
--- a/drivers/irqchip/irq-bcm7038-l1.c
+++ b/drivers/irqchip/irq-bcm7038-l1.c
@@ -300,6 +300,14 @@ static struct irq_chip bcm7038_l1_irq_chip = {
 static int bcm7038_l1_map(struct irq_domain *d, unsigned int virq,
                          irq_hw_number_t hw_irq)
 {
+       struct bcm7038_l1_chip *intc = d->host_data;
+       int i;
+
+       for (i = 0; i < intc->n_words; i++) {
+               if (intc->irq_fwd_mask[i] & BIT(hw_irq))
+                       return -EINVAL;
+       }
+
        irq_set_chip_and_handler(virq, &bcm7038_l1_irq_chip,
handle_level_irq);
        irq_set_chip_data(virq, d->host_data);
        irqd_set_single_target(irq_desc_get_irq_data(irq_to_desc(virq)));
-- 
Florian
