Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E73523304E4
	for <lists+linux-mips@lfdr.de>; Sun,  7 Mar 2021 22:49:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233156AbhCGVtJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 7 Mar 2021 16:49:09 -0500
Received: from mail.baikalelectronics.com ([87.245.175.226]:55794 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233079AbhCGVs2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 7 Mar 2021 16:48:28 -0500
Date:   Mon, 8 Mar 2021 00:47:40 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Mike Rapoport <rppt@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Roman Gushchin <guro@fb.com>, <linux-mips@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [PATCH v2] MIPS: kernel: Reserve exception base early to prevent
 corruption
Message-ID: <20210307214740.blgsti6mr546bm43@mobilestation>
References: <20210306082910.3472-1-tsbogend@alpha.franken.de>
 <20210307200612.6ftvptnj4txaf2uy@mobilestation>
 <20210307212001.GA7835@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210307212001.GA7835@alpha.franken.de>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Mar 07, 2021 at 10:20:01PM +0100, Thomas Bogendoerfer wrote:
> On Sun, Mar 07, 2021 at 11:06:12PM +0300, Serge Semin wrote:
> > > +
> > > +	if (cpu_has_mips_r2_r6)
> > > +		reserve_exception_space(0, 0x400);
> > 
> > Are you sure it shouldn't be (!cpu_has_mips_r2_r6)?. What I see here
> > contradicts to what is said in Changelog v2.
> 
> d'oh, of course it has to be !cpu_has_mips_r2_r6.
> 
> > Anyway regarding the problem in general. AFAICS the next code uses the
> > lowest memory to place some specific exception handlers:
> > board_cache_error_setup pointer:
> >   arch/mips/mm/c-r4k.c: r4k_cache_error_setup() - SiByte CPUs: CPU_SB1, CPU_SB1A (up to 0x180)
> >   arch/mips/mm/c-octeon.c: octeon_cache_error_setup() - Cavium CPU: CPU_CAVIUM_OCTEON (up to 0x180)
> > board_nmi_handler_setup pointer:
> >   arch/mips/kernel/smp-bmips.c: bmips_nmi_handler_setup() - Broadcom CPU: CPU_BMIPS (up to 0x400)
> >   arch/mips/loongson2ef/common/init.c: mips_nmi_setup() - Loongson 2E CPU: MACH_LOONGSON2EF (up to 0x400)
> >   arch/mips/loongson64/init.c: mips_nmi_setup() - Loongson 64 CPU: MACH_LOONGSON64 (up to 0x400, VEIC:0xB00)
> >   arch/mips/mti-malta/malta-init.c: mips_nmi_setup() - Malta CPU: MIPS_MALTA (up to 0x400, VEIC: 0xB00)
> >   arch/mips/pistachio/init.c: mips_nmi_setup() - Pistachio CPU: MACH_PISTACHIO (up to 0x400, VEIC: 0xB00)
> > board_ejtag_handler_setup:
> >   arch/mips/mti-malta/malta-init.c: mips_ejtag_setup() - Malta CPU: MIPS_MALTA (up to 0x380, VEIC: 0xa80)
> >   arch/mips/pistachio/init.c: mips_ejtag_setup() - Pistachio CPU: MACH_PISTACHIO (up to 0x380, VEIC: 0xa80)
> > bmips_ebase_setup:
> >   arch/mips/kernel/smp-bmips.c: bmips_ebase_setup() - Broadcom CPU: CPU_BMIPS (up to 0x400 - NMI/reset, and 0x1000 - normal)
> > plat_mem_setup:
> >   arch/mips/bmips/setup.c: bcm63xx_fixup_cpu1() - Broadcom CPU: CPU_BMIPS (up to 0x220)
> >   
> > 
> > Are you sure all of them have "cpu_has_mips_r2_r6" macro returning
> > true (false) in order to safely use the lowest region in accordance
> > with the conditional statement you've added?
> 

> some of them are not R2 (SB1), others are. So best bet would be to
> simply reserve the first 0x1000 bytes for every CPU and special handling
> for the BMIPS case. Does this cover all cases ?

I can't say for sure whether it will cover all the cases/platforms. I
visually analysed all the
board_{nmi_handler,ejtag_handler,ebase,cache_error}_setup callbacks
implementation in MIPS arch to create the list above. Exception vectors or
some other stuff can be setup in some other platform-specific manner. But at
least reserving a memory below PAGE_SIZE would get the situation partly back
to before the memory below the kernel stopped being reserved. Hopefully
one page will be enough for the platforms, which relied on that rule. The
rest or them sooner or later will manifest itself as it has happened with
Broadcom.

-Sergey

> 
> Thomas.
> 
> -- 
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]
