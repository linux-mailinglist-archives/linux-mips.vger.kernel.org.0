Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0219BA2AA
	for <lists+linux-mips@lfdr.de>; Sun, 22 Sep 2019 14:38:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728986AbfIVMiM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 22 Sep 2019 08:38:12 -0400
Received: from inca-roads.misterjones.org ([213.251.177.50]:45505 "EHLO
        inca-roads.misterjones.org" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728826AbfIVMiM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 22 Sep 2019 08:38:12 -0400
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=why)
        by cheepnis.misterjones.org with esmtpsa (TLSv1.2:AES256-GCM-SHA384:256)
        (Exim 4.80)
        (envelope-from <maz@kernel.org>)
        id 1iC17v-0003vt-Fm; Sun, 22 Sep 2019 14:38:07 +0200
Date:   Sun, 22 Sep 2019 13:38:05 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kevin Cernekee <cernekee@gmail.com>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        bcm-kernel-feedback-list@broadcom.com (open list:BROADCOM BMIPS MIPS
        ARCHITECTURE),
        linux-mips@vger.kernel.org (open list:BROADCOM BMIPS MIPS ARCHITECTURE)
Subject: Re: [PATCH v2 5/5] irqchip/irq-bcm7038-l1: Support
 brcm,int-fwd-mask
Message-ID: <20190922133805.2cdf2d99@why>
In-Reply-To: <20190913191542.9908-6-f.fainelli@gmail.com>
References: <20190913191542.9908-1-f.fainelli@gmail.com>
        <20190913191542.9908-6-f.fainelli@gmail.com>
Organization: Approximate
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: f.fainelli@gmail.com, linux-kernel@vger.kernel.org, tglx@linutronix.de, jason@lakedaemon.net, robh+dt@kernel.org, mark.rutland@arm.com, cernekee@gmail.com, devicetree@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on cheepnis.misterjones.org); SAEximRunCond expanded to false
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 13 Sep 2019 12:15:42 -0700
Florian Fainelli <f.fainelli@gmail.com> wrote:

> On some specific chips like 7211 we need to leave some interrupts
> untouched/forwarded to the VPU which is another agent in the system
> making use of that interrupt controller hardware (goes to both ARM GIC
> and VPU L1 interrupt controller). Make that possible by using the
> existing brcm,int-fwd-mask property.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  drivers/irqchip/irq-bcm7038-l1.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-bcm7038-l1.c b/drivers/irqchip/irq-bcm7038-l1.c
> index 0673a44bbdc2..811a34201dd4 100644
> --- a/drivers/irqchip/irq-bcm7038-l1.c
> +++ b/drivers/irqchip/irq-bcm7038-l1.c
> @@ -44,6 +44,7 @@ struct bcm7038_l1_chip {
>  	struct list_head	list;
>  	u32			wake_mask[MAX_WORDS];
>  #endif
> +	u32			irq_fwd_mask[MAX_WORDS];
>  	u8			affinity[MAX_WORDS * IRQS_PER_WORD];
>  };
>  
> @@ -265,6 +266,7 @@ static int __init bcm7038_l1_init_one(struct device_node *dn,
>  	resource_size_t sz;
>  	struct bcm7038_l1_cpu *cpu;
>  	unsigned int i, n_words, parent_irq;
> +	int ret;
>  
>  	if (of_address_to_resource(dn, idx, &res))
>  		return -EINVAL;
> @@ -278,6 +280,14 @@ static int __init bcm7038_l1_init_one(struct device_node *dn,
>  	else if (intc->n_words != n_words)
>  		return -EINVAL;
>  
> +	ret = of_property_read_u32_array(dn , "brcm,int-fwd-mask",

What is the exact meaning of "fwd"? Forward? FirmWare Dementia?

> +					 intc->irq_fwd_mask, n_words);
> +	if (ret != 0 && ret != -EINVAL) {
> +		/* property exists but has the wrong number of words */
> +		pr_err("invalid brcm,int-fwd-mask property\n");
> +		return -EINVAL;
> +	}
> +
>  	cpu = intc->cpus[idx] = kzalloc(sizeof(*cpu) + n_words * sizeof(u32),
>  					GFP_KERNEL);
>  	if (!cpu)
> @@ -288,8 +298,9 @@ static int __init bcm7038_l1_init_one(struct device_node *dn,
>  		return -ENOMEM;
>  
>  	for (i = 0; i < n_words; i++) {
> -		l1_writel(0xffffffff, cpu->map_base + reg_mask_set(intc, i));
> -		cpu->mask_cache[i] = 0xffffffff;
> +		l1_writel(0xffffffff & ~intc->irq_fwd_mask[i],
> +			  cpu->map_base + reg_mask_set(intc, i));
> +		cpu->mask_cache[i] = 0xffffffff & ~intc->irq_fwd_mask[i];

I seem to remember that (0xffffffff & whatever) == whatever, as long as
'whatever' is a 32bit quantity. So what it this for?

	M.
-- 
Without deviation from the norm, progress is not possible.
