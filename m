Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 813D5420293
	for <lists+linux-mips@lfdr.de>; Sun,  3 Oct 2021 18:09:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231184AbhJCQLY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 3 Oct 2021 12:11:24 -0400
Received: from elvis.franken.de ([193.175.24.41]:57367 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230426AbhJCQLW (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 3 Oct 2021 12:11:22 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mX43M-0005aq-03; Sun, 03 Oct 2021 18:09:28 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id D5F13C1D2B; Sun,  3 Oct 2021 18:09:05 +0200 (CEST)
Date:   Sun, 3 Oct 2021 18:09:05 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        "maintainer:BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." 
        <bcm-kernel-feedback-list@broadcom.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        "moderated list:ARM SUB-ARCHITECTURES" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH v3 01/14] MIPS: BMIPS: Remove use of irq_cpu_offline
Message-ID: <20211003160905.GD4984@alpha.franken.de>
References: <20210928182139.652896-1-f.fainelli@gmail.com>
 <20210928182139.652896-2-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210928182139.652896-2-f.fainelli@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Sep 28, 2021 at 11:21:26AM -0700, Florian Fainelli wrote:
> irq_cpu_offline() is only used by MIPS and we should instead use
> irq_migrate_all_off_this_cpu(). This will be helpful in order to remove
> drivers/irqchip/irq-bcm7038-l1.c irq_cpu_offline callback which would
> have got in the way of making this driver modular.
> 
> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  arch/mips/Kconfig            | 1 +
>  arch/mips/kernel/smp-bmips.c | 3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 771ca53af06d..2c03b27cec02 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -1782,6 +1782,7 @@ config CPU_BMIPS
>  	select CPU_HAS_PREFETCH
>  	select CPU_SUPPORTS_CPUFREQ
>  	select MIPS_EXTERNAL_TIMER
> +	select GENERIC_IRQ_MIGRATION if HOTPLUG_CPU
>  	help
>  	  Support for BMIPS32/3300/4350/4380 and BMIPS5000 processors.
>  
> diff --git a/arch/mips/kernel/smp-bmips.c b/arch/mips/kernel/smp-bmips.c
> index b6ef5f7312cf..f5d7bfa3472a 100644
> --- a/arch/mips/kernel/smp-bmips.c
> +++ b/arch/mips/kernel/smp-bmips.c
> @@ -26,6 +26,7 @@
>  #include <linux/bug.h>
>  #include <linux/kernel.h>
>  #include <linux/kexec.h>
> +#include <linux/irq.h>
>  
>  #include <asm/time.h>
>  #include <asm/processor.h>
> @@ -373,7 +374,7 @@ static int bmips_cpu_disable(void)
>  
>  	set_cpu_online(cpu, false);
>  	calculate_cpu_foreign_map();
> -	irq_cpu_offline();
> +	irq_migrate_all_off_this_cpu();
>  	clear_c0_status(IE_IRQ5);
>  
>  	local_flush_tlb_all();

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
