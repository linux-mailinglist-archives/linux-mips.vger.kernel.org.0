Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CFC73A407
	for <lists+linux-mips@lfdr.de>; Sun,  9 Jun 2019 08:42:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726358AbfFIGmR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 9 Jun 2019 02:42:17 -0400
Received: from mx2.mailbox.org ([80.241.60.215]:40568 "EHLO mx2.mailbox.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726178AbfFIGmR (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 9 Jun 2019 02:42:17 -0400
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:105:465:1:2:0])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mx2.mailbox.org (Postfix) with ESMTPS id 4B5CCA01A1;
        Sun,  9 Jun 2019 08:42:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
        by spamfilter02.heinlein-hosting.de (spamfilter02.heinlein-hosting.de [80.241.56.116]) (amavisd-new, port 10030)
        with ESMTP id OD3oVUJ8msXZ; Sun,  9 Jun 2019 08:42:03 +0200 (CEST)
Subject: Re: [PATCH v1 7/7] MIPS: lantiq: Add SMP support for lantiq interrupt
 controller
To:     petrcvekcz@gmail.com, john@phrozen.org
Cc:     linux-mips@vger.kernel.org, openwrt-devel@lists.openwrt.org,
        pakahmar@hotmail.com
References: <cover.1560024463.git.petrcvekcz@gmail.com>
 <07892acc26ae73c6567254a28faac7a723cedbc3.1560024463.git.petrcvekcz@gmail.com>
From:   Hauke Mehrtens <hauke@hauke-m.de>
Openpgp: preference=signencrypt
Autocrypt: addr=hauke@hauke-m.de; keydata=
 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
 U9K2P2+nz7is4sF1hNVarw==
Message-ID: <b2d8730b-e98e-55c9-609a-aeeeea911415@hauke-m.de>
Date:   Sun, 9 Jun 2019 08:42:02 +0200
MIME-Version: 1.0
In-Reply-To: <07892acc26ae73c6567254a28faac7a723cedbc3.1560024463.git.petrcvekcz@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 6/8/19 10:48 PM, petrcvekcz@gmail.com wrote:
> From: Petr Cvek <petrcvekcz@gmail.com>
> 
> Some lantiq devices have two ICU controllers. Both are respectively
> routed to the individual VPEs. The patch adds the support for the second
> ICU.
> 
> The patch changes a register definition of the driver. Instead of an
> individual IM, the whole ICU is defined. This will only affects openwrt
> patched kernel (vanilla doesn't have additional .dts files).

There is one dtsi file for this driver in the mainline kernel in
arch/mips/boot/dts/lantiq/danube.dtsi

I am not aware that any of the SoCs which uses this IRQ controller
provides the dtb from the bootloader to the kernel, if they use device
tree it is always patched or appended to the kernel, so this change
should be ok.

> Also spinlocks has been added, both cores can RMW different bitfields
> in the same register. Added affinity set function. The new VPE cpumask
> will take into the action at the irq enable.
> 
> The driver can rotate the preset VPEs affinity cpumask. Either by
> an automatic cycling or just by using the first VPE from the affinity
> cpumask. This can be switched by macro AUTO_AFFINITY_ROTATION. The
> automatic rotation can be switched off from userspace by limiting the IRQ
> to only one VPE.
> 
> The rotation was taken from MIPS loongson64's ht_irqdispatch().
> 
> The functionality was tested on 4.14 openwrt kernel and TP-W9980B modem.
> 
> Signed-off-by: Petr Cvek <petrcvekcz@gmail.com>
> ---
>  arch/mips/lantiq/irq.c | 155 ++++++++++++++++++++++++++++++++++-------
>  1 file changed, 131 insertions(+), 24 deletions(-)
> 
> diff --git a/arch/mips/lantiq/irq.c b/arch/mips/lantiq/irq.c
> index b9ca20ff07d5..0cdb7e88bfe5 100644
> --- a/arch/mips/lantiq/irq.c
> +++ b/arch/mips/lantiq/irq.c
> @@ -21,6 +21,15 @@
>  #include <lantiq_soc.h>
>  #include <irq.h>
>  
> +/*
> + * If defined, every IRQ enable call will switch the interrupt to
> + * the other VPE. You can limit used VPEs from the userspace.
> + *
> + * If not defined, only the first configured VPE from the userspace
> + * will be used.
> + */
> +#define AUTO_AFFINITY_ROTATION
> +
>  /* register definitions - internal irqs */
>  #define LTQ_ICU_ISR		0x0000
>  #define LTQ_ICU_IER		0x0008
> @@ -46,8 +55,11 @@
>   */
>  #define LTQ_ICU_EBU_IRQ		22
>  
> -#define ltq_icu_w32(m, x, y)	ltq_w32((x), ltq_icu_membase[m] + (y))
> -#define ltq_icu_r32(m, x)	ltq_r32(ltq_icu_membase[m] + (x))
> +#define ltq_icu_w32(vpe, m, x, y)	\
> +	ltq_w32((x), ltq_icu_membase[vpe] + m*0x28 + (y))

Please use a define for the 0x28

> +
> +#define ltq_icu_r32(vpe, m, x)		\
> +	ltq_r32(ltq_icu_membase[vpe] + m*0x28 + (x))
>  
>  #define ltq_eiu_w32(x, y)	ltq_w32((x), ltq_eiu_membase + (y))
>  #define ltq_eiu_r32(x)		ltq_r32(ltq_eiu_membase + (x))
> @@ -55,11 +67,15 @@
>  /* we have a cascade of 8 irqs */
>  #define MIPS_CPU_IRQ_CASCADE		8
>  
> +#define MAX_VPES 2
> +
>  static int exin_avail;
>  static u32 ltq_eiu_irq[MAX_EIU];
> -static void __iomem *ltq_icu_membase[MAX_IM];
> +static void __iomem *ltq_icu_membase[MAX_VPES];
>  static void __iomem *ltq_eiu_membase;
>  static struct irq_domain *ltq_domain;
> +static DEFINE_SPINLOCK(ltq_eiu_lock);
> +static DEFINE_RAW_SPINLOCK(ltq_icu_lock);
>  static int ltq_perfcount_irq;
>  
>  int ltq_eiu_get_irq(int exin)
> @@ -73,45 +89,98 @@ void ltq_disable_irq(struct irq_data *d)
>  {
>  	unsigned long offset = d->hwirq - MIPS_CPU_IRQ_CASCADE;
>  	unsigned long im = offset / INT_NUM_IM_OFFSET;
> +	unsigned long flags;
> +	int vpe;
>  
>  	offset %= INT_NUM_IM_OFFSET;
> -	ltq_icu_w32(im, ltq_icu_r32(im, LTQ_ICU_IER) & ~BIT(offset),
> -		    LTQ_ICU_IER);
> +
> +	raw_spin_lock_irqsave(&ltq_icu_lock, flags);
> +	for_each_present_cpu(vpe) {
> +		ltq_icu_w32(vpe, im,
> +			    ltq_icu_r32(vpe, im, LTQ_ICU_IER) & ~BIT(offset),
> +			    LTQ_ICU_IER);
> +	}
> +	raw_spin_unlock_irqrestore(&ltq_icu_lock, flags);
>  }
>  
>  void ltq_mask_and_ack_irq(struct irq_data *d)
>  {
>  	unsigned long offset = d->hwirq - MIPS_CPU_IRQ_CASCADE;
>  	unsigned long im = offset / INT_NUM_IM_OFFSET;
> +	unsigned long flags;
> +	int vpe;
>  
>  	offset %= INT_NUM_IM_OFFSET;
> -	ltq_icu_w32(im, ltq_icu_r32(im, LTQ_ICU_IER) & ~BIT(offset),
> -		    LTQ_ICU_IER);
> -	ltq_icu_w32(im, BIT(offset), LTQ_ICU_ISR);
> +
> +	raw_spin_lock_irqsave(&ltq_icu_lock, flags);
> +	for_each_present_cpu(vpe) {
> +		ltq_icu_w32(vpe, im,
> +			    ltq_icu_r32(vpe, im, LTQ_ICU_IER) & ~BIT(offset),
> +			    LTQ_ICU_IER);
> +		ltq_icu_w32(vpe, im, BIT(offset), LTQ_ICU_ISR);
> +	}
> +	raw_spin_unlock_irqrestore(&ltq_icu_lock, flags);
>  }
>  
>  static void ltq_ack_irq(struct irq_data *d)
>  {
>  	unsigned long offset = d->hwirq - MIPS_CPU_IRQ_CASCADE;
>  	unsigned long im = offset / INT_NUM_IM_OFFSET;
> +	unsigned long flags;
> +	int vpe;
>  
>  	offset %= INT_NUM_IM_OFFSET;
> -	ltq_icu_w32(im, BIT(offset), LTQ_ICU_ISR);
> +
> +	raw_spin_lock_irqsave(&ltq_icu_lock, flags);
> +	for_each_present_cpu(vpe) {
> +		ltq_icu_w32(vpe, im, BIT(offset), LTQ_ICU_ISR);
> +	}
> +	raw_spin_unlock_irqrestore(&ltq_icu_lock, flags);
>  }
>  
>  void ltq_enable_irq(struct irq_data *d)
>  {
>  	unsigned long offset = d->hwirq - MIPS_CPU_IRQ_CASCADE;
>  	unsigned long im = offset / INT_NUM_IM_OFFSET;
> +	unsigned long flags;
> +	int vpe;
>  
>  	offset %= INT_NUM_IM_OFFSET;
> -	ltq_icu_w32(im, ltq_icu_r32(im, LTQ_ICU_IER) | BIT(offset),
> +
> +#if defined(AUTO_AFFINITY_ROTATION)

I do not like such a define. Is there some other way to automatically
distribute the IRQs over the available CPUs?

> +	vpe = cpumask_next(smp_processor_id(),
> +			   irq_data_get_effective_affinity_mask(d));
> +
> +	/*
> +	 * There is a theoretical race condition if affinity gets changed
> +	 * meanwhile, but it would only caused a wrong VPE to be used until
> +	 * the next IRQ enable. Also the SoC has only 2 VPEs which fits
> +	 * the single u32. You can move spinlock before first mask readout
> +	 * and add it to ltq_icu_irq_set_affinity.
> +	 */
> +
> +	if (vpe >= nr_cpu_ids)
> +		vpe = cpumask_first(irq_data_get_effective_affinity_mask(d));
> +#else
> +	vpe = cpumask_first(irq_data_get_effective_affinity_mask(d));
> +#endif
> +
> +	/* This shouldn't be even possible, maybe during CPU hotplug spam */
> +	if (unlikely(vpe >= nr_cpu_ids))
> +		vpe = smp_processor_id();
> +
> +	raw_spin_lock_irqsave(&ltq_icu_lock, flags);
> +
> +	ltq_icu_w32(vpe, im, ltq_icu_r32(vpe, im, LTQ_ICU_IER) | BIT(offset),
>  		    LTQ_ICU_IER);
> +
> +	raw_spin_unlock_irqrestore(&ltq_icu_lock, flags);
>  }
>  
>  static int ltq_eiu_settype(struct irq_data *d, unsigned int type)
>  {
>  	int i;
> +	unsigned long flags;
>  
>  	for (i = 0; i < exin_avail; i++) {
>  		if (d->hwirq == ltq_eiu_irq[i]) {
> @@ -148,9 +217,11 @@ static int ltq_eiu_settype(struct irq_data *d, unsigned int type)
>  			if (edge)
>  				irq_set_handler(d->hwirq, handle_edge_irq);
>  
> +			spin_lock_irqsave(&ltq_eiu_lock, flags);
>  			ltq_eiu_w32((ltq_eiu_r32(LTQ_EIU_EXIN_C) &
>  				    (~(7 << (i * 4)))) | (val << (i * 4)),
>  				    LTQ_EIU_EXIN_C);
> +			spin_unlock_irqrestore(&ltq_eiu_lock, flags);
>  		}
>  	}
>  
> @@ -194,6 +265,21 @@ static void ltq_shutdown_eiu_irq(struct irq_data *d)
>  	}
>  }
>  
> +#if defined(CONFIG_SMP)
> +static int ltq_icu_irq_set_affinity(struct irq_data *d,
> +				    const struct cpumask *cpumask, bool force)
> +{
> +	struct cpumask tmask;
> +
> +	if (!cpumask_and(&tmask, cpumask, cpu_online_mask))
> +		return -EINVAL;
> +
> +	irq_data_update_effective_affinity(d, &tmask);
> +
> +	return IRQ_SET_MASK_OK;
> +}
> +#endif
> +
>  static struct irq_chip ltq_irq_type = {
>  	.name = "icu",
>  	.irq_enable = ltq_enable_irq,
> @@ -202,6 +288,9 @@ static struct irq_chip ltq_irq_type = {
>  	.irq_ack = ltq_ack_irq,
>  	.irq_mask = ltq_disable_irq,
>  	.irq_mask_ack = ltq_mask_and_ack_irq,
> +#if defined(CONFIG_SMP)
> +	.irq_set_affinity = ltq_icu_irq_set_affinity,
> +#endif
>  };
>  
>  static struct irq_chip ltq_eiu_type = {
> @@ -215,6 +304,9 @@ static struct irq_chip ltq_eiu_type = {
>  	.irq_mask = ltq_disable_irq,
>  	.irq_mask_ack = ltq_mask_and_ack_irq,
>  	.irq_set_type = ltq_eiu_settype,
> +#if defined(CONFIG_SMP)
> +	.irq_set_affinity = ltq_icu_irq_set_affinity,
> +#endif

This looks strange to me. As far as I understood this, the eiu is an
extra IRQ controller whith its own configuration.

>  };
>  
>  static void ltq_hw_irq_handler(struct irq_desc *desc)
> @@ -222,8 +314,9 @@ static void ltq_hw_irq_handler(struct irq_desc *desc)
>  	unsigned int module = irq_desc_get_irq(desc) - 2;
>  	u32 irq;
>  	irq_hw_number_t hwirq;
> +	int vpe = smp_processor_id();
>  
> -	irq = ltq_icu_r32(module, LTQ_ICU_IOSR);
> +	irq = ltq_icu_r32(vpe, module, LTQ_ICU_IOSR);
>  	if (irq == 0)
>  		return;
>  
> @@ -244,6 +337,7 @@ static void ltq_hw_irq_handler(struct irq_desc *desc)
>  static int icu_map(struct irq_domain *d, unsigned int irq, irq_hw_number_t hw)
>  {
>  	struct irq_chip *chip = &ltq_irq_type;
> +	struct irq_data *data;
>  	int i;
>  
>  	if (hw < MIPS_CPU_IRQ_CASCADE)
> @@ -253,6 +347,10 @@ static int icu_map(struct irq_domain *d, unsigned int irq, irq_hw_number_t hw)
>  		if (hw == ltq_eiu_irq[i])
>  			chip = &ltq_eiu_type;
>  
> +	data = irq_get_irq_data(irq);
> +
> +	irq_data_update_effective_affinity(data, cpumask_of(0));
> +
>  	irq_set_chip_and_handler(irq, chip, handle_level_irq);
>  
>  	return 0;
> @@ -267,28 +365,37 @@ int __init icu_of_init(struct device_node *node, struct device_node *parent)
>  {
>  	struct device_node *eiu_node;
>  	struct resource res;
> -	int i, ret;
> +	int i, ret, vpe;
>  
> -	for (i = 0; i < MAX_IM; i++) {
> -		if (of_address_to_resource(node, i, &res))
> -			panic("Failed to get icu memory range");
> +	/* load register regions of available ICUs */
> +	for_each_possible_cpu(vpe) {
> +		if (of_address_to_resource(node, vpe, &res))
> +			panic("Failed to get icu%i memory range", vpe);
>  >  		if (!request_mem_region(res.start, resource_size(&res),
>  					res.name))
> -			pr_err("Failed to request icu memory");
> +			pr_err("Failed to request icu%i memory\n", vpe);
>  
> -		ltq_icu_membase[i] = ioremap_nocache(res.start,
> +		ltq_icu_membase[vpe] = ioremap_nocache(res.start,
>  					resource_size(&res));

Please check that you do not write over the the end of the
ltq_icu_membase array.

> -		if (!ltq_icu_membase[i])
> -			panic("Failed to remap icu memory");
> +
> +		if (!ltq_icu_membase[vpe])
> +			panic("Failed to remap icu%i memory", vpe);
>  	}
>  
>  	/* turn off all irqs by default */
> -	for (i = 0; i < MAX_IM; i++) {
> -		/* make sure all irqs are turned off by default */
> -		ltq_icu_w32(i, 0, LTQ_ICU_IER);
> -		/* clear all possibly pending interrupts */
> -		ltq_icu_w32(i, ~0, LTQ_ICU_ISR);
> +	for_each_possible_cpu(vpe) {
> +		for (i = 0; i < MAX_IM; i++) {
> +			/* make sure all irqs are turned off by default */
> +			ltq_icu_w32(vpe, i, 0, LTQ_ICU_IER);
> +
> +			/* clear all possibly pending interrupts */
> +			ltq_icu_w32(vpe, i, ~0, LTQ_ICU_ISR);
> +			ltq_icu_w32(vpe, i, ~0, LTQ_ICU_IMR);
> +
> +			/* clear resend */
> +			ltq_icu_w32(vpe, i, 0, LTQ_ICU_IRSR);
> +		}
>  	}
>  
>  	mips_cpu_irq_init();
> 

