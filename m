Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A799543788C
	for <lists+linux-mips@lfdr.de>; Fri, 22 Oct 2021 15:58:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233236AbhJVOAV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 Oct 2021 10:00:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233131AbhJVN75 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 22 Oct 2021 09:59:57 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA03AC061227;
        Fri, 22 Oct 2021 06:57:39 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id w23so1785713lje.7;
        Fri, 22 Oct 2021 06:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6fLS1JO7zsxW7Z2Kfv8Wr2ag0OrluFFsUbpXIuB+m/Y=;
        b=l3lrJlb2M2EtK5287jXBMcWS1vitGrf8c9kpL339NI4WEf31UD44TEcbljzEVoFphe
         20VgIrqQC+6N9Mv5ggl9pHlvQobU1KOAOGNW3zLIoWxY96R20Vf4j6HWbvo9uS3g5p3+
         XDZAQJpzAv0LhK1mohA30R7fCbROm/oehMmGOeOoAxQWaJNf/lrJ8u1gezrBpvHOa8cK
         UuEX/V9gF4az1jN88S2deFYKtS4M7c/LYap64xuFF94IkvRS1Ep3dzvh2yw8YUmR225Q
         IFaXJnPZmausQzIed049RPsb4NPpv8rzRyu/YysszfwFr1CLwH4pGxuihdKk3C8IBNr4
         D9Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6fLS1JO7zsxW7Z2Kfv8Wr2ag0OrluFFsUbpXIuB+m/Y=;
        b=Y0nOMJKe+yL39wbWS027kqzPa3YIIuEFnSqn9c1blPhWUfpnqHqfQNyxQDOeUP+46G
         /Ow/zuksS0acWr62Xt8fiIcIdYrWFGyQORMZEhATHd8s6xpwcWbt/M3nGZEWlJjoPsbv
         PSjyicuOnKYOOoKDl5vW+jaJ1AutZwbP/Iix26hfBJlEu0OvLQ5949GMUSAlIMFa1W7H
         sE5406CyOLBvXXTnPEBDfmeU4BWZa6jcYSa8i3rfcmj/o/zw087biFTCbh7EHSXDugMM
         AyqZwnqMptN00QoQZdBR+lm2SQvFvfKX2P9So2IATyXKzS8EjPKz8j2kSOSLLHtmI+JV
         uakw==
X-Gm-Message-State: AOAM533YZq5/dZve6rOatZSCWNtkCwlCMFaT2wOpDc3601jY4W6SlxJL
        I+2jes8QnD0SGQvWUkIJ/dY=
X-Google-Smtp-Source: ABdhPJzOrzhPSH6UZcwJe1t4Lv1xEd3CAbPew4RUvstf9+eIa+kuDIn/404Fxl6Wkz4mMSr3CH+5oQ==
X-Received: by 2002:a2e:a48c:: with SMTP id h12mr174072lji.252.1634911058260;
        Fri, 22 Oct 2021 06:57:38 -0700 (PDT)
Received: from mobilestation ([95.79.132.211])
        by smtp.gmail.com with ESMTPSA id f8sm743028lfq.168.2021.10.22.06.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Oct 2021 06:57:37 -0700 (PDT)
Date:   Fri, 22 Oct 2021 16:57:35 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Marc Zyngier <maz@kernel.org>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>, f.fainelli@gmail.com,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 2/3] irqchip/mips-gic: Get rid of the reliance on
 irq_cpu_online()
Message-ID: <20211022135735.d6irp3hrolz2svhs@mobilestation>
References: <20211021170414.3341522-1-maz@kernel.org>
 <20211021170414.3341522-3-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211021170414.3341522-3-maz@kernel.org>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Oct 21, 2021 at 06:04:13PM +0100, Marc Zyngier wrote:
> The MIPS GIC driver uses irq_cpu_online() to go and program the
> per-CPU interrupts. However, this method iterates over all IRQs
> in the system, despite only 3 per-CPU interrupts being of interest.
> 
> Let's be terribly bold and do the iteration ourselves. To ensure
> mutual exclusion, hold the gic_lock spinlock that is otherwise
> taken while dealing with these interrupts.

Please consider a nitpick below. Other than that looks good:
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  drivers/irqchip/irq-mips-gic.c | 37 ++++++++++++++++++++++++----------
>  1 file changed, 26 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
> index 54c7092cc61d..45c83dd804a0 100644
> --- a/drivers/irqchip/irq-mips-gic.c
> +++ b/drivers/irqchip/irq-mips-gic.c
> @@ -381,24 +381,35 @@ static void gic_unmask_local_irq_all_vpes(struct irq_data *d)
>  	spin_unlock_irqrestore(&gic_lock, flags);
>  }
>  
> -static void gic_all_vpes_irq_cpu_online(struct irq_data *d)
> +static void gic_all_vpes_irq_cpu_online(void)
>  {
> -	struct gic_all_vpes_chip_data *cd;
> -	unsigned int intr;

> +	static unsigned int local_intrs[] = {

What about adding 'const' here?

-Sergey

> +		GIC_LOCAL_INT_TIMER,
> +		GIC_LOCAL_INT_PERFCTR,
> +		GIC_LOCAL_INT_FDC,
> +	};
> +	unsigned long flags;
> +	int i;
>  
> -	intr = GIC_HWIRQ_TO_LOCAL(d->hwirq);
> -	cd = irq_data_get_irq_chip_data(d);
> +	spin_lock_irqsave(&gic_lock, flags);
>  
> -	write_gic_vl_map(mips_gic_vx_map_reg(intr), cd->map);
> -	if (cd->mask)
> -		write_gic_vl_smask(BIT(intr));
> +	for (i = 0; i < ARRAY_SIZE(local_intrs); i++) {
> +		unsigned int intr = local_intrs[i];
> +		struct gic_all_vpes_chip_data *cd;
> +
> +		cd = &gic_all_vpes_chip_data[intr];
> +		write_gic_vl_map(mips_gic_vx_map_reg(intr), cd->map);
> +		if (cd->mask)
> +			write_gic_vl_smask(BIT(intr));
> +	}
> +
> +	spin_unlock_irqrestore(&gic_lock, flags);
>  }
>  
>  static struct irq_chip gic_all_vpes_local_irq_controller = {
>  	.name			= "MIPS GIC Local",
>  	.irq_mask		= gic_mask_local_irq_all_vpes,
>  	.irq_unmask		= gic_unmask_local_irq_all_vpes,
> -	.irq_cpu_online		= gic_all_vpes_irq_cpu_online,
>  };
>  
>  static void __gic_irq_dispatch(void)
> @@ -477,6 +488,10 @@ static int gic_irq_domain_map(struct irq_domain *d, unsigned int virq,
>  	intr = GIC_HWIRQ_TO_LOCAL(hwirq);
>  	map = GIC_MAP_PIN_MAP_TO_PIN | gic_cpu_pin;
>  
> +	/*
> +	 * If adding support for more per-cpu interrupts, keep the the
> +	 * array in gic_all_vpes_irq_cpu_online() in sync.
> +	 */
>  	switch (intr) {
>  	case GIC_LOCAL_INT_TIMER:
>  		/* CONFIG_MIPS_CMP workaround (see __gic_init) */
> @@ -663,8 +678,8 @@ static int gic_cpu_startup(unsigned int cpu)
>  	/* Clear all local IRQ masks (ie. disable all local interrupts) */
>  	write_gic_vl_rmask(~0);
>  
> -	/* Invoke irq_cpu_online callbacks to enable desired interrupts */
> -	irq_cpu_online();
> +	/* Enable desired interrupts */
> +	gic_all_vpes_irq_cpu_online();
>  
>  	return 0;
>  }
> -- 
> 2.30.2
> 
