Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D34E2ED535
	for <lists+linux-mips@lfdr.de>; Thu,  7 Jan 2021 18:11:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728733AbhAGRLa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 Jan 2021 12:11:30 -0500
Received: from elvis.franken.de ([193.175.24.41]:34844 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728033AbhAGRLa (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 7 Jan 2021 12:11:30 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kxYoD-0000nE-00; Thu, 07 Jan 2021 18:10:49 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 02C67C0815; Thu,  7 Jan 2021 18:10:35 +0100 (CET)
Date:   Thu, 7 Jan 2021 18:10:35 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Lauri Kasanen <cand@gmx.com>
Cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH 2/6] mips: Add N64 machine type
Message-ID: <20210107171035.GA13117@alpha.franken.de>
References: <20210104154357.6cf126150407ba4839630177@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210104154357.6cf126150407ba4839630177@gmx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jan 04, 2021 at 03:43:57PM +0200, Lauri Kasanen wrote:
> [..]
>  	select GPIOLIB
> 
> +config MACH_NINTENDO64
> +	bool "Nintendo 64 console"
> +	select CEVT_R4K
> +	select CSRC_R4K
> +	select SYS_HAS_CPU_R4300
> +	select SYS_SUPPORTS_BIG_ENDIAN
> +	select SYS_SUPPORTS_ZBOOT
> +	select SYS_SUPPORTS_32BIT_KERNEL

32BIT kernel don't compile, because you use TO_UNCAC which only
exists for 64bit kernels. One solution would be to use CKSEG1 to
convert from physical to an uncached address. But I'd prefer if
you add resources to your platform device and do ioremap in device
drivers. This way there is also no need to export the interrupt
defines outside.

> diff --git a/arch/mips/include/asm/mach-n64/irq.h b/arch/mips/include/asm/mach-n64/irq.h
> new file mode 100644
> index 0000000..4d4a1ea
> --- /dev/null
> +++ b/arch/mips/include/asm/mach-n64/irq.h
> @@ -0,0 +1,9 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __ASM_MACH_N64_IRQ_H
> +#define __ASM_MACH_N64_IRQ_H
> +
> +#include <asm/n64/irq.h> /* for MIPS_CPU_IRQ_BASE */

the only thing, which should be here is the override of NR_IRQS

> +#define MIPS_CPU_IRQ_BASE	0

that's default, no need to define.

> +#define MIPS_CPU_IRQ(x)		(MIPS_CPU_IRQ_BASE + (x))
> +#define MIPS_SOFTINT0_IRQ	MIPS_CPU_IRQ(0)
> +#define MIPS_SOFTINT1_IRQ	MIPS_CPU_IRQ(1)

I doubt you need the SOFTINT defines

> +#define RCP_IRQ			MIPS_CPU_IRQ(2)
> +#define CART_IRQ		MIPS_CPU_IRQ(3)
> +#define PRENMI_IRQ		MIPS_CPU_IRQ(4)
> +#define RDBR_IRQ		MIPS_CPU_IRQ(5)
> +#define RDBW_IRQ		MIPS_CPU_IRQ(6)
> +#define TIMER_IRQ		MIPS_CPU_IRQ(7)

and this IMHO also unsed, so no need to define it.

With the approach of using a platform irq resource you don't
even need this header file as there is only a single plays,
which deals with irq assignment.

> +void __init prom_free_prom_memory(void)
> +{
> +}
> +

you can drop that now with current mips-next.

> +void __init plat_time_init(void)
> +{
> +	// 93.75 MHz cpu, count register runs at half rate

no C++ comments please.

> +	mips_hpt_frequency = 93750000 / 2;
> +}

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
