Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D1B28D5C1
	for <lists+linux-mips@lfdr.de>; Wed, 14 Aug 2019 16:16:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbfHNOQq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 14 Aug 2019 10:16:46 -0400
Received: from elvis.franken.de ([193.175.24.41]:33379 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726019AbfHNOQp (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 14 Aug 2019 10:16:45 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1hxu4u-0005Ou-00; Wed, 14 Aug 2019 16:16:40 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 00FE2C25B4; Wed, 14 Aug 2019 14:50:27 +0200 (CEST)
Date:   Wed, 14 Aug 2019 14:50:27 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Serge Semin <fancer.lancer@gmail.com>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org,
        paul.burton@mips.com, yasha.che3@gmail.com, aurelien@aurel32.net,
        sfr@canb.auug.org.au, matt.redfearn@mips.com, chenhc@lemote.com
Subject: Re: [PATCH 3/7] MIPS: fw: Record prom memory
Message-ID: <20190814125027.GA31891@alpha.franken.de>
References: <20190808075013.4852-1-jiaxun.yang@flygoat.com>
 <20190808075013.4852-4-jiaxun.yang@flygoat.com>
 <20190814120340.oz4kh7cbv653s5rd@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190814120340.oz4kh7cbv653s5rd@mobilestation>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Aug 14, 2019 at 03:03:41PM +0300, Serge Semin wrote:
> On Thu, Aug 08, 2019 at 03:50:09PM +0800, Jiaxun Yang wrote:
> > boot_mem_map is nolonger exist so we need to maintain a list
> > of prom memory by ourselves.
> > 
> > Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > ---
> >  arch/mips/fw/arc/memory.c | 20 ++++++++++++++------
> >  1 file changed, 14 insertions(+), 6 deletions(-)
> > 
> > diff --git a/arch/mips/fw/arc/memory.c b/arch/mips/fw/arc/memory.c
> > index 429b7f8d2aeb..02e954b3700e 100644
> > --- a/arch/mips/fw/arc/memory.c
> > +++ b/arch/mips/fw/arc/memory.c
> > @@ -27,6 +27,11 @@
> >  
> >  #undef DEBUG
> >  
> > +#define MAX_PROM_MEM 5
> > +static phys_addr_t prom_mem_base[MAX_PROM_MEM] __initdata;
> > +static phys_addr_t prom_mem_size[MAX_PROM_MEM] __initdata;
> > +static unsigned int nr_prom_mem __initdata;
> > +
> >  /*
> >   * For ARC firmware memory functions the unit of meassuring memory is always
> >   * a 4k page of memory
> > @@ -129,6 +134,7 @@ void __init prom_meminit(void)
> >  	}
> >  #endif
> >  
> > +	nr_prom_mem = 0;
> >  	p = PROM_NULL_MDESC;
> >  	while ((p = ArcGetMemoryDescriptor(p))) {
> >  		unsigned long base, size;
> > @@ -139,6 +145,12 @@ void __init prom_meminit(void)
> >  		type = prom_memtype_classify(p->type);
> >  
> >  		add_memory_region(base, size, type);
> > +
> > +		if (type == BOOT_MEM_ROM_DATA) {
> > +			prom_mem_base[nr_prom_mem] = base;
> > +			prom_mem_size[nr_prom_mem] = size;
> > +			nr_prom_mem++;
> 
> Are you sure, that five prom-mem regions is enough?

it's not enough:

ARCH: Microsoft-Jazz
PROMLIB: ARC firmware Version 1 Revision 1
CPU revision is: 00000430
FPU revision is: 00000500
Determined physical RAM map:
 memory: 00054000 @ 00000000 (reserved)
 memory: 0002c000 @ 00054000 (usable)
 memory: 0001f000 @ 007e0000 (ROM data)
 memory: 007b2000 @ 007ff000 (usable)
 memory: 0004f000 @ 00fb1000 (ROM data)
 memory: 01000000 @ 01000000 (usable)
 memory: 00323000 @ 00080000 (reserved)
 memory: 0043d000 @ 003a3000 (usable)

that's from a Olivetti M700 system.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
