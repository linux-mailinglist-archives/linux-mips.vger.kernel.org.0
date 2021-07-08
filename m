Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5C8D3BF7C0
	for <lists+linux-mips@lfdr.de>; Thu,  8 Jul 2021 11:46:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231336AbhGHJs4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 8 Jul 2021 05:48:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230079AbhGHJs4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 8 Jul 2021 05:48:56 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 629F2C061574;
        Thu,  8 Jul 2021 02:46:13 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id c28so13453035lfp.11;
        Thu, 08 Jul 2021 02:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zfG1OEbM0Q/wHXPD5yKp65Ks0yVn6DHIJgdFIHHsq6w=;
        b=cK7dnxi7CrvsO3JrDD2RszLHLNpL4TuiIcn3rwMF6RCbc5RyhjTjwLFAzEQ6qEYuH1
         0OZ2LAo/Nx6gprlUvx93J90XF3EovqBg53LVA/OwNTz5nJCp1sw5WUJ+yBGq77QqtA7k
         lYeoPA0w4Hxyb2mtje/J6ytD3GK5u6Ym/qateB8S/lpKYYgziwHmklWAvVmoRRXFPdUE
         NRbfiC3UQQfJ1x3J2unGBmfTP8YyNb1MjA2zfJ2iPQGO6DwVkqH/6Z3ciQasu0wdY4bL
         7z16dTZl8UhVHYCCYzjZvSkTQGM3ZT8AZBFzeo+LZEKoX6+g1YttpdGJYz/w/LelGz+r
         EgCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zfG1OEbM0Q/wHXPD5yKp65Ks0yVn6DHIJgdFIHHsq6w=;
        b=dI2Sn5j+KS4RYC0/Ewu0DvFlj5UvppskH4NZdsiZRteE/uXqKZfiiHP6fypgCDjxok
         LG9ipUVMuTjdkQg/NrdNLpCJGITciHsS5OCduhTUIdV/PHgcYJlyEu7pZqgzMNBuHVLH
         3FXCuvu7+nc5OXxZvR7yZIPDyuh6eGS4Wjd/p+yo+kCPqq8xiLFCLgovXFglBB2nU2Xx
         pBgCSEelTru5E0+tNElETIRFdrEynSOet+WJKYhuLhIFbf8puJ0iEDXDwGbdC8Yl0Kvo
         Zaj8ju/Fc52DNM2HJqPyLUklrXeeRz+PCERRTTi8u8VXoIp5J7/f3tqbcKc+XJRxFqhl
         wLAw==
X-Gm-Message-State: AOAM533Y9TLeqdHbicrsMqq1tZ1bPI/4ge3uI1wcpL7j/MrF9wNvukBq
        bSwe8YUCqZJTRE97xNDWkl0=
X-Google-Smtp-Source: ABdhPJxvrfXxKOX6fDmusNsC/y3QUsbJvjQJWe+yeeqerPE2OqfrhecTd6Gs4B1RwqX0BZ4AlnZGpQ==
X-Received: by 2002:a05:6512:3744:: with SMTP id a4mr22850364lfs.112.1625737570703;
        Thu, 08 Jul 2021 02:46:10 -0700 (PDT)
Received: from mobilestation ([95.79.127.110])
        by smtp.gmail.com with ESMTPSA id u14sm77438lfn.47.2021.07.08.02.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 02:46:10 -0700 (PDT)
Date:   Thu, 8 Jul 2021 12:46:08 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Marc Zyngier <maz@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>, kernel-team@android.com,
        Guenter Roeck <linux@roeck-us.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [PATCH] irqchip/mips: Fix RCU violation when using irqdomain
 lookup on interrupt entry
Message-ID: <20210708094608.anrgynyzu6h233pr@mobilestation>
References: <20210706110647.3979002-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210706110647.3979002-1-maz@kernel.org>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Marc,
Thanks for the fix.

On Tue, Jul 06, 2021 at 12:06:47PM +0100, Marc Zyngier wrote:
> Since d4a45c68dc81 ("irqdomain: Protect the linear revmap with RCU"),
> any irqdomain lookup requires the RCU read lock to be held.
> 
> This assumes that the architecture code will be structured such as
> irq_enter() will be called *before* the interrupt is looked up
> in the irq domain. However, this isn't the case for MIPS, and a number
> of drivers are structured to do it the other way around when handling
> an interrupt in their root irqchip (secondary irqchips are OK by
> construction).
> 
> This results in a RCU splat on a lockdep-enabled kernel when the kernel
> takes an interrupt from idle, as reported by Guenter Roeck.

Alas I am still on 5.12-rc4, so can't test it out at the moment. Soon
after getting further on the modern kernel version I'll give this
patch a try on my hw and send a report.

Regards
-Sergey

> 
> Note that this could have fired previously if any driver had used
> tree-based irqdomain, which always had the RCU requirement.
> 
> To solve this, provide a MIPS-specific helper (do_domain_IRQ())
> as the pendent of do_IRQ() that will do thing in the right order
> (and maybe save some cycles in the process).
> 
> Ideally, MIPS would be moved over to using handle_domain_irq(),
> but that's much more ambitious.
> 
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Tested-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Serge Semin <fancer.lancer@gmail.com>
> Link: https://lore.kernel.org/r/20210705172352.GA56304@roeck-us.net
> ---
>  arch/mips/include/asm/irq.h      |  3 +++
>  arch/mips/kernel/irq.c           | 14 ++++++++++++++
>  drivers/irqchip/irq-mips-cpu.c   | 10 ++++++----
>  drivers/irqchip/irq-mips-gic.c   |  8 ++++----
>  drivers/irqchip/irq-pic32-evic.c |  5 ++---
>  5 files changed, 29 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/mips/include/asm/irq.h b/arch/mips/include/asm/irq.h
> index d1477ecb1af9..57561e0e6e8d 100644
> --- a/arch/mips/include/asm/irq.h
> +++ b/arch/mips/include/asm/irq.h
> @@ -57,6 +57,9 @@ asmlinkage void plat_irq_dispatch(void);
>  
>  extern void do_IRQ(unsigned int irq);
>  
> +struct irq_domain;
> +extern void do_domain_IRQ(struct irq_domain *domain, unsigned int irq);
> +
>  extern void arch_init_irq(void);
>  extern void spurious_interrupt(void);
>  
> diff --git a/arch/mips/kernel/irq.c b/arch/mips/kernel/irq.c
> index 85b6c60f285d..c76005cd3b79 100644
> --- a/arch/mips/kernel/irq.c
> +++ b/arch/mips/kernel/irq.c
> @@ -21,6 +21,7 @@
>  #include <linux/kallsyms.h>
>  #include <linux/kgdb.h>
>  #include <linux/ftrace.h>
> +#include <linux/irqdomain.h>
>  
>  #include <linux/atomic.h>
>  #include <linux/uaccess.h>
> @@ -107,3 +108,16 @@ void __irq_entry do_IRQ(unsigned int irq)
>  	irq_exit();
>  }
>  
> +void __irq_entry do_domain_IRQ(struct irq_domain *domain, unsigned int hwirq)
> +{
> +	struct irq_desc *desc;
> +
> +	irq_enter();
> +	check_stack_overflow();
> +
> +	desc = irq_resolve_mapping(domain, hwirq);
> +	if (likely(desc))
> +		handle_irq_desc(desc);
> +
> +	irq_exit();
> +}
> diff --git a/drivers/irqchip/irq-mips-cpu.c b/drivers/irqchip/irq-mips-cpu.c
> index 0bbb0b2d0dd5..0c7ae71a0af0 100644
> --- a/drivers/irqchip/irq-mips-cpu.c
> +++ b/drivers/irqchip/irq-mips-cpu.c
> @@ -127,7 +127,6 @@ static struct irq_chip mips_mt_cpu_irq_controller = {
>  asmlinkage void __weak plat_irq_dispatch(void)
>  {
>  	unsigned long pending = read_c0_cause() & read_c0_status() & ST0_IM;
> -	unsigned int virq;
>  	int irq;
>  
>  	if (!pending) {
> @@ -137,12 +136,15 @@ asmlinkage void __weak plat_irq_dispatch(void)
>  
>  	pending >>= CAUSEB_IP;
>  	while (pending) {
> +		struct irq_domain *d;
> +
>  		irq = fls(pending) - 1;
>  		if (IS_ENABLED(CONFIG_GENERIC_IRQ_IPI) && irq < 2)
> -			virq = irq_linear_revmap(ipi_domain, irq);
> +			d = ipi_domain;
>  		else
> -			virq = irq_linear_revmap(irq_domain, irq);
> -		do_IRQ(virq);
> +			d = irq_domain;
> +
> +		do_domain_IRQ(d, irq);
>  		pending &= ~BIT(irq);
>  	}
>  }
> diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
> index b146e069bf5b..54c7092cc61d 100644
> --- a/drivers/irqchip/irq-mips-gic.c
> +++ b/drivers/irqchip/irq-mips-gic.c
> @@ -169,8 +169,8 @@ static void gic_handle_shared_int(bool chained)
>  			generic_handle_domain_irq(gic_irq_domain,
>  						  GIC_SHARED_TO_HWIRQ(intr));
>  		else
> -			do_IRQ(irq_find_mapping(gic_irq_domain,
> -						GIC_SHARED_TO_HWIRQ(intr)));
> +			do_domain_IRQ(gic_irq_domain,
> +				      GIC_SHARED_TO_HWIRQ(intr));
>  	}
>  }
>  
> @@ -320,8 +320,8 @@ static void gic_handle_local_int(bool chained)
>  			generic_handle_domain_irq(gic_irq_domain,
>  						  GIC_LOCAL_TO_HWIRQ(intr));
>  		else
> -			do_IRQ(irq_find_mapping(gic_irq_domain,
> -						GIC_LOCAL_TO_HWIRQ(intr)));
> +			do_domain_IRQ(gic_irq_domain,
> +				      GIC_LOCAL_TO_HWIRQ(intr));
>  	}
>  }
>  
> diff --git a/drivers/irqchip/irq-pic32-evic.c b/drivers/irqchip/irq-pic32-evic.c
> index 34c4b4ffacd1..1d9bb28d13e5 100644
> --- a/drivers/irqchip/irq-pic32-evic.c
> +++ b/drivers/irqchip/irq-pic32-evic.c
> @@ -42,11 +42,10 @@ static void __iomem *evic_base;
>  
>  asmlinkage void __weak plat_irq_dispatch(void)
>  {
> -	unsigned int irq, hwirq;
> +	unsigned int hwirq;
>  
>  	hwirq = readl(evic_base + REG_INTSTAT) & 0xFF;
> -	irq = irq_linear_revmap(evic_irq_domain, hwirq);
> -	do_IRQ(irq);
> +	do_domain_IRQ(evic_irq_domain, hwirq);
>  }
>  
>  static struct evic_chip_data *irqd_to_priv(struct irq_data *data)
> -- 
> 2.30.2
> 
