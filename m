Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F666288951
	for <lists+linux-mips@lfdr.de>; Fri,  9 Oct 2020 14:52:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387800AbgJIMvx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 9 Oct 2020 08:51:53 -0400
Received: from elvis.franken.de ([193.175.24.41]:53485 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387784AbgJIMvs (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 9 Oct 2020 08:51:48 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kQrs7-0002EF-00; Fri, 09 Oct 2020 14:51:43 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 44BC7C1121; Fri,  9 Oct 2020 14:07:52 +0200 (CEST)
Date:   Fri, 9 Oct 2020 14:07:52 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Serge Semin <fancer.lancer@gmail.com>
Cc:     Hauke Mehrtens <hauke@hauke-m.de>,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        "Maciej W. Rozycki" <macro@linux-mips.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        John Crispin <john@phrozen.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] MIPS: replace add_memory_region with memblock
Message-ID: <20201009120752.GA10588@alpha.franken.de>
References: <20201008084357.42780-1-tsbogend@alpha.franken.de>
 <20201008152006.4khkbzsxqmmz76rw@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201008152006.4khkbzsxqmmz76rw@mobilestation>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Oct 08, 2020 at 06:20:06PM +0300, Serge Semin wrote:
> > Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > ---
> > Changes in v2:
> > 	fixed missing memblock include in fw/sni/sniprom.c
> > 	tested on cobalt, IP22, IP28, IP30, IP32, JAZZ, SNI
> 
> ...
> 
> > diff --git a/arch/mips/kernel/prom.c b/arch/mips/kernel/prom.c
> > index 9e50dc8df2f6..fab532cb5a11 100644
> > --- a/arch/mips/kernel/prom.c
> > +++ b/arch/mips/kernel/prom.c
> > @@ -50,14 +50,18 @@ void __init early_init_dt_add_memory_arch(u64 base, u64 size)
> >  		size = PHYS_ADDR_MAX - base;
> >  	}
> >  
> > -	add_memory_region(base, size, BOOT_MEM_RAM);
> > +	memblock_add(base, size);
> >  }
> >  
> >  int __init early_init_dt_reserve_memory_arch(phys_addr_t base,
> >  					phys_addr_t size, bool nomap)
> >  {
> > -	add_memory_region(base, size,
> > -			  nomap ? BOOT_MEM_NOMAP : BOOT_MEM_RESERVED);
> > +	if (nomap) {
> > +		memblock_remove(base, size);
> > +	} else {
> > +		memblock_add(base, size);
> > +		memblock_reserve(base, size);
> > +	}
> >  
> >  	return 0;
> >  }
> 
> I guess originally the arch-specific early_init_dt_add_memory_arch() and
> early_init_dt_reserve_memory_arch() methods have been added since MIPS's got its
> own memory types declarations (BOOT_MEM_RAM, BOOT_MEM_RESERVED, etc) and had had
> a specific internal system memory regions mapping (add_memory_region(),
> boot_mem_map, etc). Since the leftover of that framework is going to be removed,
> we can freely use the standard early_init_dt_add_memory_arch() and
> early_init_dt_reserve_memory_arch() implementations from drivers/of/fdt.c:1102
> drivers/of/fdt.c:1149 .

perfect, I'll remove it in my next version.

> > @@ -426,13 +387,14 @@ static int __init early_parse_memmap(char *p)
> >  
> >  	if (*p == '@') {
> >  		start_at = memparse(p+1, &p);
> > -		add_memory_region(start_at, mem_size, BOOT_MEM_RAM);
> > +		memblock_add(start_at, mem_size);
> >  	} else if (*p == '#') {
> >  		pr_err("\"memmap=nn#ss\" (force ACPI data) invalid on MIPS\n");
> >  		return -EINVAL;
> >  	} else if (*p == '$') {
> >  		start_at = memparse(p+1, &p);
> 
> > -		add_memory_region(start_at, mem_size, BOOT_MEM_RESERVED);
> > +		memblock_add(start_at, mem_size);
> > +		memblock_reserve(start_at, mem_size);
> 
> I suppose we could remove the memory addition from here too. What do you think?

I'm not sure about that, add_memory_region() did a memblock_add
and then memblock_reserve for BOOT_MEM_RESERVED, that's why I changed
it that way.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
