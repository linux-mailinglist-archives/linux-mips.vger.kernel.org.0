Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CB902B5AAC
	for <lists+linux-mips@lfdr.de>; Tue, 17 Nov 2020 09:05:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726231AbgKQIFZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 17 Nov 2020 03:05:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:59382 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725863AbgKQIFZ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 17 Nov 2020 03:05:25 -0500
Received: from kernel.org (unknown [77.125.7.142])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E15E6208FE;
        Tue, 17 Nov 2020 08:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605600324;
        bh=Vh/0IhA+MvqR21aqMI4dmvPUVbdKKG3QZglHTIWwbi0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=C7Wn2nbdiGYPr/2qOOlCVeRIrSBqIjCFoN/isTfHeRAjrs4J1HqwtXxFjkfxnjYVF
         PrukUuOUOOwTSSVMKs56fMaPcVZx8HEoCcwNvlGftBEGvg7yK996qaaDUMZc4mbD+n
         1dKH5vJTHtncCQXjj00taKx8BT4pwo7e84DgtVpA=
Date:   Tue, 17 Nov 2020 10:05:18 +0200
From:   Mike Rapoport <rppt@kernel.org>
To:     Serge Semin <fancer.lancer@gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: kernel: Fix for_each_memblock conversion
Message-ID: <20201117080518.GH370813@kernel.org>
References: <20201116174516.144243-1-tsbogend@alpha.franken.de>
 <20201116200554.rhbyvfmdzmchwwbs@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201116200554.rhbyvfmdzmchwwbs@mobilestation>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Nov 16, 2020 at 11:05:54PM +0300, Serge Semin wrote:
> On Mon, Nov 16, 2020 at 06:45:15PM +0100, Thomas Bogendoerfer wrote:
> > The loop over all memblocks works with PFN numbers and not physical
> > addresses, so we need for_each_mem_pfn_range().
> 
> Great catch! Don't know how that has been working so far. Anyway

The loop is relevant only for systems with highmem, apparently there are
not many highmem users out there.

> Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
> 
> -Sergey
> 
> > 
> > Fixes: b10d6bca8720 ("arch, drivers: replace for_each_membock() with for_each_mem_range()")
> > Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > ---
> >  arch/mips/kernel/setup.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> > index 0d4253208bde..ca579deef939 100644
> > --- a/arch/mips/kernel/setup.c
> > +++ b/arch/mips/kernel/setup.c
> > @@ -262,8 +262,8 @@ static void __init bootmem_init(void)
> >  static void __init bootmem_init(void)
> >  {
> >  	phys_addr_t ramstart, ramend;
> > -	phys_addr_t start, end;
> > -	u64 i;
> > +	unsigned long start, end;
> > +	int i;
> >  
> >  	ramstart = memblock_start_of_DRAM();
> >  	ramend = memblock_end_of_DRAM();
> > @@ -300,7 +300,7 @@ static void __init bootmem_init(void)
> >  
> >  	min_low_pfn = ARCH_PFN_OFFSET;
> >  	max_pfn = PFN_DOWN(ramend);
> > -	for_each_mem_range(i, &start, &end) {
> > +	for_each_mem_pfn_range(i, MAX_NUMNODES, &start, &end, NULL) {
> >  		/*
> >  		 * Skip highmem here so we get an accurate max_low_pfn if low
> >  		 * memory stops short of high memory.
> > -- 
> > 2.16.4
> > 

-- 
Sincerely yours,
Mike.
