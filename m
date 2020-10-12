Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7555F28B253
	for <lists+linux-mips@lfdr.de>; Mon, 12 Oct 2020 12:38:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387595AbgJLKiS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Oct 2020 06:38:18 -0400
Received: from elvis.franken.de ([193.175.24.41]:58426 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387597AbgJLKiS (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 12 Oct 2020 06:38:18 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kRvDc-0008KW-00; Mon, 12 Oct 2020 12:38:16 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 15B15C1129; Mon, 12 Oct 2020 12:01:17 +0200 (CEST)
Date:   Mon, 12 Oct 2020 12:01:17 +0200
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
Message-ID: <20201012100117.GA6959@alpha.franken.de>
References: <20201008084357.42780-1-tsbogend@alpha.franken.de>
 <20201008152006.4khkbzsxqmmz76rw@mobilestation>
 <20201009120752.GA10588@alpha.franken.de>
 <20201009141537.ijj4cr45zqtkh4yz@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201009141537.ijj4cr45zqtkh4yz@mobilestation>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Oct 09, 2020 at 05:15:37PM +0300, Serge Semin wrote:
> On Fri, Oct 09, 2020 at 02:07:52PM +0200, Thomas Bogendoerfer wrote:
> > On Thu, Oct 08, 2020 at 06:20:06PM +0300, Serge Semin wrote:
> > > > @@ -426,13 +387,14 @@ static int __init early_parse_memmap(char *p)
> > > >  
> > > >  	if (*p == '@') {
> > > >  		start_at = memparse(p+1, &p);
> > > > -		add_memory_region(start_at, mem_size, BOOT_MEM_RAM);
> > > > +		memblock_add(start_at, mem_size);
> > > >  	} else if (*p == '#') {
> > > >  		pr_err("\"memmap=nn#ss\" (force ACPI data) invalid on MIPS\n");
> > > >  		return -EINVAL;
> > > >  	} else if (*p == '$') {
> > > >  		start_at = memparse(p+1, &p);
> > > 
> > > > -		add_memory_region(start_at, mem_size, BOOT_MEM_RESERVED);
> > > > +		memblock_add(start_at, mem_size);
> > > > +		memblock_reserve(start_at, mem_size);
> > > 
> > > I suppose we could remove the memory addition from here too. What do you think?
> > 
> 
> > I'm not sure about that, add_memory_region() did a memblock_add
> > and then memblock_reserve for BOOT_MEM_RESERVED, that's why I changed
> > it that way.
> 
> The main question here whether we need to preserve the MIPS-specific semantics
> of the kernel 'memmap' parameter. Currently the memmap parameter passed with
> '$' specifier will be perceived as a reserved RAM region, while, for instance, 
> the same parameter on x86 will be converted to a region, which won't be
> registered in memblock at all, so the system won't be able to reuse it if it's
> needed to be (see parse_memmap_one() and e820__memblock_setup() for details).
> 
> I don't really know what approach is correct... 
> Documentation/admin-guide/kernel-parameters.txt isn't certain about that. It
> says that the region must be reserved, but no words whether it is supposed to be
> mappable or non-mappable.

I leave it as in v3 of the patch for now. If we come to the point what
the correct semantic should be, we can change it.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
