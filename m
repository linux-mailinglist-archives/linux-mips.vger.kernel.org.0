Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E29A33A4A7
	for <lists+linux-mips@lfdr.de>; Sun,  9 Jun 2019 12:12:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728177AbfFIKMH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 9 Jun 2019 06:12:07 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45338 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728152AbfFIKMH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 9 Jun 2019 06:12:07 -0400
Received: by mail-wr1-f68.google.com with SMTP id f9so6216276wre.12
        for <linux-mips@vger.kernel.org>; Sun, 09 Jun 2019 03:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SApRd9fr9ds8+TGU24DsjP8xvCPp2NWvhZdIkXgDGLk=;
        b=aS1oAe3IsPs6Cia++1TTvi+TDsmzMMSzZnMihhZ7qF4MOjQXsvlYPpJ4BPe1NG3752
         ke+MxwdA9aamAE+k+AVA5Jv0TgBgUzNJT/5NRROozgbC15uM3shuXBWRqmL6KpmvWELT
         QSIlfdicQd69Ra8QkXpbVAn4gRWW7Y685UehiJExy1po/vEbx2O6HfvZaKokegLLNUJm
         8y2Dc1NG5As44wmZkexZyUR4DiULY/DxOZz63r3X+kv1/5urfIgb/4KbYDPCfdBKxxOZ
         oJpv9izVZnl4GEUrsOIOc13nwvuj/2+lV5uFCS7KGYPaDWpHpdQ4ZoeOrsffK71kyGwF
         TJQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SApRd9fr9ds8+TGU24DsjP8xvCPp2NWvhZdIkXgDGLk=;
        b=MkSDLsHZJLuUwbPS3lAoFnfjej3awAvxLLxhoyE9OEZBypQFbfPD4T6w5kGGUFRUf8
         HJ2KzxPXHqz2z9LD7CQ5D2o5eH8pfkBZGHXMtTeeGxjMOiHVfW1x+0r5TkUW/I4XsWQs
         bO70q8oqYgoXfvffPdsuvU/zyEC4ZRspsXmogqrqb/KxUX3HzFaIpEy0Y2ukXKn67Qzk
         HOX3BbSySsDc8WAB9FYN9h1S2RL/av2Vnrhx4v58desZoz7C2BlbRKdod67uLTCCcYwx
         uhsKM/OP9PQf2mr8d+QFmnwt5bTymUtQtpiz/iJdmFbsxprHjG3EuaiF6ilrEUayeWQs
         8Qbw==
X-Gm-Message-State: APjAAAViBq1Cg9IRG3ipp4Gzm9mVNP4297g3yApToEo3GwXXk/jon77g
        I3FMktWjAOZTr5R+/jlHEMGDBGgi
X-Google-Smtp-Source: APXvYqyXsavu+UeYN+MgVT1EbvGEmfTa15ViHNk0ZUeVlVwgnsHu4ycHU6HbNg22mEDrY8840Qqs0A==
X-Received: by 2002:adf:ce11:: with SMTP id p17mr10506779wrn.58.1560075124472;
        Sun, 09 Jun 2019 03:12:04 -0700 (PDT)
Received: from kontron.lan (2001-1ae9-0ff1-f191-e87d-6b88-fa9c-e0e4.ip6.tmcz.cz. [2001:1ae9:ff1:f191:e87d:6b88:fa9c:e0e4])
        by smtp.gmail.com with ESMTPSA id p16sm11083119wrg.49.2019.06.09.03.12.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 09 Jun 2019 03:12:03 -0700 (PDT)
Subject: Re: [PATCH v1 7/7] MIPS: lantiq: Add SMP support for lantiq interrupt
 controller
To:     Hauke Mehrtens <hauke@hauke-m.de>, john@phrozen.org
Cc:     linux-mips@vger.kernel.org, openwrt-devel@lists.openwrt.org,
        pakahmar@hotmail.com
References: <cover.1560024463.git.petrcvekcz@gmail.com>
 <07892acc26ae73c6567254a28faac7a723cedbc3.1560024463.git.petrcvekcz@gmail.com>
 <b2d8730b-e98e-55c9-609a-aeeeea911415@hauke-m.de>
From:   Petr Cvek <petrcvekcz@gmail.com>
Message-ID: <7158cc31-e050-583d-9a35-1b1c4908a750@gmail.com>
Date:   Sun, 9 Jun 2019 12:12:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <b2d8730b-e98e-55c9-609a-aeeeea911415@hauke-m.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Dne 09. 06. 19 v 8:42 Hauke Mehrtens napsal(a):
> On 6/8/19 10:48 PM, petrcvekcz@gmail.com wrote:
>> From: Petr Cvek <petrcvekcz@gmail.com>
>>
>> Some lantiq devices have two ICU controllers. Both are respectively
>> routed to the individual VPEs. The patch adds the support for the second
>> ICU.
>>
>> The patch changes a register definition of the driver. Instead of an
>> individual IM, the whole ICU is defined. This will only affects openwrt
>> patched kernel (vanilla doesn't have additional .dts files).
> 
> There is one dtsi file for this driver in the mainline kernel in
> arch/mips/boot/dts/lantiq/danube.dtsi
> 

Danube seems to be already in the compatible format.

>> +
>> +#define ltq_icu_r32(vpe, m, x)		\
>> +	ltq_r32(ltq_icu_membase[vpe] + m*0x28 + (x))
>>  
>>  #define ltq_eiu_w32(x, y)	ltq_w32((x), ltq_eiu_membase + (y))
>>  #define ltq_eiu_r32(x)		ltq_r32(ltq_eiu_membase + (x))
>> @@ -55,11 +67,15 @@
>>  /* we have a cascade of 8 irqs */
>>  #define MIPS_CPU_IRQ_CASCADE		8
>>  
>> +#define MAX_VPES 2
>> +
>>  static int exin_avail;
>>  static u32 ltq_eiu_irq[MAX_EIU];
>> -static void __iomem *ltq_icu_membase[MAX_IM];
>> +static void __iomem *ltq_icu_membase[MAX_VPES];
>>  static void __iomem *ltq_eiu_membase;
>>  static struct irq_domain *ltq_domain;
>> +static DEFINE_SPINLOCK(ltq_eiu_lock);
>> +static DEFINE_RAW_SPINLOCK(ltq_icu_lock);
>>  static int ltq_perfcount_irq;
>>  
>>  int ltq_eiu_get_irq(int exin)
>> @@ -73,45 +89,98 @@ void ltq_disable_irq(struct irq_data *d)
>>  {
>>  	unsigned long offset = d->hwirq - MIPS_CPU_IRQ_CASCADE;
>>  	unsigned long im = offset / INT_NUM_IM_OFFSET;
>> +	unsigned long flags;
>> +	int vpe;
>>  
>>  	offset %= INT_NUM_IM_OFFSET;
>> -	ltq_icu_w32(im, ltq_icu_r32(im, LTQ_ICU_IER) & ~BIT(offset),
>> -		    LTQ_ICU_IER);
>> +
>> +	raw_spin_lock_irqsave(&ltq_icu_lock, flags);
>> +	for_each_present_cpu(vpe) {
>> +		ltq_icu_w32(vpe, im,
>> +			    ltq_icu_r32(vpe, im, LTQ_ICU_IER) & ~BIT(offset),
>> +			    LTQ_ICU_IER);
>> +	}
>> +	raw_spin_unlock_irqrestore(&ltq_icu_lock, flags);
>>  }
>>  
>>  void ltq_mask_and_ack_irq(struct irq_data *d)
>>  {
>>  	unsigned long offset = d->hwirq - MIPS_CPU_IRQ_CASCADE;
>>  	unsigned long im = offset / INT_NUM_IM_OFFSET;
>> +	unsigned long flags;
>> +	int vpe;
>>  
>>  	offset %= INT_NUM_IM_OFFSET;
>> -	ltq_icu_w32(im, ltq_icu_r32(im, LTQ_ICU_IER) & ~BIT(offset),
>> -		    LTQ_ICU_IER);
>> -	ltq_icu_w32(im, BIT(offset), LTQ_ICU_ISR);
>> +
>> +	raw_spin_lock_irqsave(&ltq_icu_lock, flags);
>> +	for_each_present_cpu(vpe) {
>> +		ltq_icu_w32(vpe, im,
>> +			    ltq_icu_r32(vpe, im, LTQ_ICU_IER) & ~BIT(offset),
>> +			    LTQ_ICU_IER);
>> +		ltq_icu_w32(vpe, im, BIT(offset), LTQ_ICU_ISR);
>> +	}
>> +	raw_spin_unlock_irqrestore(&ltq_icu_lock, flags);
>>  }
>>  
>>  static void ltq_ack_irq(struct irq_data *d)
>>  {
>>  	unsigned long offset = d->hwirq - MIPS_CPU_IRQ_CASCADE;
>>  	unsigned long im = offset / INT_NUM_IM_OFFSET;
>> +	unsigned long flags;
>> +	int vpe;
>>  
>>  	offset %= INT_NUM_IM_OFFSET;
>> -	ltq_icu_w32(im, BIT(offset), LTQ_ICU_ISR);
>> +
>> +	raw_spin_lock_irqsave(&ltq_icu_lock, flags);
>> +	for_each_present_cpu(vpe) {
>> +		ltq_icu_w32(vpe, im, BIT(offset), LTQ_ICU_ISR);
>> +	}
>> +	raw_spin_unlock_irqrestore(&ltq_icu_lock, flags);
>>  }
>>  
>>  void ltq_enable_irq(struct irq_data *d)
>>  {
>>  	unsigned long offset = d->hwirq - MIPS_CPU_IRQ_CASCADE;
>>  	unsigned long im = offset / INT_NUM_IM_OFFSET;
>> +	unsigned long flags;
>> +	int vpe;
>>  
>>  	offset %= INT_NUM_IM_OFFSET;
>> -	ltq_icu_w32(im, ltq_icu_r32(im, LTQ_ICU_IER) | BIT(offset),
>> +
>> +#if defined(AUTO_AFFINITY_ROTATION)
> 
> I do not like such a define. Is there some other way to automatically
> distribute the IRQs over the available CPUs?
> 

It can be initially statically distributed in icu_map(), but it will
be something like: all even IRQs -> VPE0, all odd IRQs -> VPE1. It could
be done in devicetree probably. Only other way is from userspace, via some boot
script (statically) or some daemon (I was testting irqbalance in openwrt, but it
seems to not work with MIPS, irqbalance is trying to measure time spent in
individual interrupts).

I can remove one of the code paths, but I don't know which one would be best.
The variant without any rotation fully depends on the userspace to assign
the interrupts right.

>> +	vpe = cpumask_next(smp_processor_id(),
>> +			   irq_data_get_effective_affinity_mask(d));
>> +
>> +	/*
>> +	 * There is a theoretical race condition if affinity gets changed
>> +	 * meanwhile, but it would only caused a wrong VPE to be used until
>> +	 * the next IRQ enable. Also the SoC has only 2 VPEs which fits
>> +	 * the single u32. You can move spinlock before first mask readout
>> +	 * and add it to ltq_icu_irq_set_affinity.
>> +	 */
>> +
>> +	if (vpe >= nr_cpu_ids)
>> +		vpe = cpumask_first(irq_data_get_effective_affinity_mask(d));
>> +#else
>> +	vpe = cpumask_first(irq_data_get_effective_affinity_mask(d));
>> +#endif
>> +
>> +	/* This shouldn't be even possible, maybe during CPU hotplug spam */
>> +	if (unlikely(vpe >= nr_cpu_ids))
>> +		vpe = smp_processor_id();
>> +
>> +	raw_spin_lock_irqsave(&ltq_icu_lock, flags);
>> +
>> +	ltq_icu_w32(vpe, im, ltq_icu_r32(vpe, im, LTQ_ICU_IER) | BIT(offset),
>>  		    LTQ_ICU_IER);
>> +
>> +	raw_spin_unlock_irqrestore(&ltq_icu_lock, flags);
>>  }
>>  
>>  static int ltq_eiu_settype(struct irq_data *d, unsigned int type)
>>  {
>>  	int i;
>> +	unsigned long flags;
>>  
>>  	for (i = 0; i < exin_avail; i++) {
>>  		if (d->hwirq == ltq_eiu_irq[i]) {
>> @@ -148,9 +217,11 @@ static int ltq_eiu_settype(struct irq_data *d, unsigned int type)
>>  			if (edge)
>>  				irq_set_handler(d->hwirq, handle_edge_irq);
>>  
>> +			spin_lock_irqsave(&ltq_eiu_lock, flags);
>>  			ltq_eiu_w32((ltq_eiu_r32(LTQ_EIU_EXIN_C) &
>>  				    (~(7 << (i * 4)))) | (val << (i * 4)),
>>  				    LTQ_EIU_EXIN_C);
>> +			spin_unlock_irqrestore(&ltq_eiu_lock, flags);
>>  		}
>>  	}
>>  
>> @@ -194,6 +265,21 @@ static void ltq_shutdown_eiu_irq(struct irq_data *d)
>>  	}
>>  }
>>  
>> +#if defined(CONFIG_SMP)
>> +static int ltq_icu_irq_set_affinity(struct irq_data *d,
>> +				    const struct cpumask *cpumask, bool force)
>> +{
>> +	struct cpumask tmask;
>> +
>> +	if (!cpumask_and(&tmask, cpumask, cpu_online_mask))
>> +		return -EINVAL;
>> +
>> +	irq_data_update_effective_affinity(d, &tmask);
>> +
>> +	return IRQ_SET_MASK_OK;
>> +}
>> +#endif
>> +
>>  static struct irq_chip ltq_irq_type = {
>>  	.name = "icu",
>>  	.irq_enable = ltq_enable_irq,
>> @@ -202,6 +288,9 @@ static struct irq_chip ltq_irq_type = {
>>  	.irq_ack = ltq_ack_irq,
>>  	.irq_mask = ltq_disable_irq,
>>  	.irq_mask_ack = ltq_mask_and_ack_irq,
>> +#if defined(CONFIG_SMP)
>> +	.irq_set_affinity = ltq_icu_irq_set_affinity,
>> +#endif
>>  };
>>  
>>  static struct irq_chip ltq_eiu_type = {
>> @@ -215,6 +304,9 @@ static struct irq_chip ltq_eiu_type = {
>>  	.irq_mask = ltq_disable_irq,
>>  	.irq_mask_ack = ltq_mask_and_ack_irq,
>>  	.irq_set_type = ltq_eiu_settype,
>> +#if defined(CONFIG_SMP)
>> +	.irq_set_affinity = ltq_icu_irq_set_affinity,
>> +#endif
> 
> This looks strange to me. As far as I understood this, the eiu is an
> extra IRQ controller whith its own configuration.
> 

I'm not sure about that too (I think I don't use any peripheral which is connected
to EIU), but the EIU controller's IRQs are enabled by ltq_enable_irq() as well,
so it must be routed through the both ICUs.

Isn't EIU just a something like a frontend for formating the external IRQs
for the internal controller? I don't have any datasheets for the SoC sadly.

>>  };
>>  
>>  static void ltq_hw_irq_handler(struct irq_desc *desc)
>> @@ -222,8 +314,9 @@ static void ltq_hw_irq_handler(struct irq_desc *desc)
>>  	unsigned int module = irq_desc_get_irq(desc) - 2;
>>  	u32 irq;
>>  	irq_hw_number_t hwirq;
>> +	int vpe = smp_processor_id();
>>  
>> -	irq = ltq_icu_r32(module, LTQ_ICU_IOSR);
>> +	irq = ltq_icu_r32(vpe, module, LTQ_ICU_IOSR);
>>  	if (irq == 0)
>>  		return;
>>  
>> @@ -244,6 +337,7 @@ static void ltq_hw_irq_handler(struct irq_desc *desc)
>>  static int icu_map(struct irq_domain *d, unsigned int irq, irq_hw_number_t hw)
>>  {
>>  	struct irq_chip *chip = &ltq_irq_type;
>> +	struct irq_data *data;
>>  	int i;
>>  
>>  	if (hw < MIPS_CPU_IRQ_CASCADE)
>> @@ -253,6 +347,10 @@ static int icu_map(struct irq_domain *d, unsigned int irq, irq_hw_number_t hw)
>>  		if (hw == ltq_eiu_irq[i])
>>  			chip = &ltq_eiu_type;
>>  
>> +	data = irq_get_irq_data(irq);
>> +
>> +	irq_data_update_effective_affinity(data, cpumask_of(0));
>> +
>>  	irq_set_chip_and_handler(irq, chip, handle_level_irq);
>>  
>>  	return 0;
>> @@ -267,28 +365,37 @@ int __init icu_of_init(struct device_node *node, struct device_node *parent)
>>  {
>>  	struct device_node *eiu_node;
>>  	struct resource res;
>> -	int i, ret;
>> +	int i, ret, vpe;
>>  
>> -	for (i = 0; i < MAX_IM; i++) {
>> -		if (of_address_to_resource(node, i, &res))
>> -			panic("Failed to get icu memory range");
>> +	/* load register regions of available ICUs */
>> +	for_each_possible_cpu(vpe) {
>> +		if (of_address_to_resource(node, vpe, &res))
>> +			panic("Failed to get icu%i memory range", vpe);
>>  >  		if (!request_mem_region(res.start, resource_size(&res),
>>  					res.name))
>> -			pr_err("Failed to request icu memory");
>> +			pr_err("Failed to request icu%i memory\n", vpe);
>>  
>> -		ltq_icu_membase[i] = ioremap_nocache(res.start,
>> +		ltq_icu_membase[vpe] = ioremap_nocache(res.start,
>>  					resource_size(&res));
> 
> Please check that you do not write over the the end of the
> ltq_icu_membase array.
> 

I'm gonna change the length of the ltq_icu_membase array to NR_CPUS,
this should cause for_each_possible_cpu() to never overflow the pointer.

Some other ideas before I'll send v2?

Petr
