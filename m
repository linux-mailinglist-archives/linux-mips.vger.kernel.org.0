Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B378F2B5B8C
	for <lists+linux-mips@lfdr.de>; Tue, 17 Nov 2020 10:14:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726297AbgKQJMl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 17 Nov 2020 04:12:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725947AbgKQJMl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 17 Nov 2020 04:12:41 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB92EC0613CF;
        Tue, 17 Nov 2020 01:12:40 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id l11so17024060lfg.0;
        Tue, 17 Nov 2020 01:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=R/grZXeeQBbyIRmHKwTjb+NXuOPdZoPUr6jxYZAJ9Oo=;
        b=LN9hXE4iTXsI1UPR8/RwRNDh1jzttL1eDWT16/0t7pHmec9POqsUJ7NZC/bEK3it+r
         75uWRo8S1GSQ1cnVVbcL8c2DNaPA2pa3bNLseatrQmZn8k7KqVX5QB7MhAmgOcO7VzRZ
         iY1TuPDWxwXpvePEImjrKqf6q7b5MhnDVS3kF2Kjc7ZRl2Xw/CYDutuLVxZO11V/Uh3m
         J5EUVAfdxJZ2wHSm/Z46V1ogbhfMDfqSCv+H1fs8dGUbnjIa+4Q/0snIeVH/5G4jg2hx
         TTBl+bfElYcifLIPJ2Xw/X0M9mc9o5N8lKaG3ObC7Lk4BZ957lwjsNIlnbA9hSUfaUGh
         UKWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=R/grZXeeQBbyIRmHKwTjb+NXuOPdZoPUr6jxYZAJ9Oo=;
        b=UQCC63xoaNAkUv2r2SZDktQDTfJVJAF5ZC8ulAQhLm8uGuX5DkNcYBdIgXl1jk7rv9
         Dj0A7BH94DuSOgSeRJIK7k+wKP1m61uWd5Q6RRIqiFUBswTQ0gDRtZTTyYnVGG/Pxcb0
         RiseQ3d8IlcrMeZpeNhPVXlxnHefeh6kZP3Wvl3vFBqAxGjz0QSCexGZPk3k4TVKHeg+
         lUxbyzpFqQVoyFHDQShmP2L/yWHTLXU0/nnZwTk0DSm89D7AkQR9ez+o48MLtdcxM+pp
         yQ0jo8SgWCmDPEFddF+02YYR61TlA6Sh665qo1+jJjWcIAN28IqQNt1XBlr9keThanKE
         X68g==
X-Gm-Message-State: AOAM533Ic6rMAm3qHUChvAbVzM+tKMR75raQgx4zmglOZn3Of977qzgo
        6yrgOdUP/CrxjqP3hgXo5itpc0fJuh6mTUyf
X-Google-Smtp-Source: ABdhPJzek9GQJWfg8c0Ahjd6dZbhNwvenQvCScEtcBtHUB2Hm0UsjS+p8w0qmv/KKhGC/ooNYVtn/A==
X-Received: by 2002:ac2:5e91:: with SMTP id b17mr1292343lfq.442.1605604359353;
        Tue, 17 Nov 2020 01:12:39 -0800 (PST)
Received: from mobilestation ([95.79.141.114])
        by smtp.gmail.com with ESMTPSA id t22sm3123567lfb.180.2020.11.17.01.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 01:12:38 -0800 (PST)
Date:   Tue, 17 Nov 2020 12:12:34 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Mike Rapoport <rppt@kernel.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: kernel: Fix for_each_memblock conversion
Message-ID: <20201117091234.zeq655p7lo6cxzny@mobilestation>
References: <20201116174516.144243-1-tsbogend@alpha.franken.de>
 <20201116200554.rhbyvfmdzmchwwbs@mobilestation>
 <20201117080518.GH370813@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201117080518.GH370813@kernel.org>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Nov 17, 2020 at 10:05:18AM +0200, Mike Rapoport wrote:
> On Mon, Nov 16, 2020 at 11:05:54PM +0300, Serge Semin wrote:
> > On Mon, Nov 16, 2020 at 06:45:15PM +0100, Thomas Bogendoerfer wrote:
> > > The loop over all memblocks works with PFN numbers and not physical
> > > addresses, so we need for_each_mem_pfn_range().
> > 
> > Great catch! Don't know how that has been working so far. Anyway
> 

> The loop is relevant only for systems with highmem, apparently there are
> not many highmem users out there.

That has been mostly a rhetorical question. The thing is that our
platform is 32bit and it is active user of highmem.) So I am very
puzzled how I haven't noticed a effect caused by that bug before.
Most likely that happened due to our platform having a first memory
chunk starting with physical address 0x0. That's why we always have a
low memory defined.

-Sergey

> 
> > Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
> > 
> > -Sergey
> > 
> > > 
> > > Fixes: b10d6bca8720 ("arch, drivers: replace for_each_membock() with for_each_mem_range()")
> > > Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > > ---
> > >  arch/mips/kernel/setup.c | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> > > index 0d4253208bde..ca579deef939 100644
> > > --- a/arch/mips/kernel/setup.c
> > > +++ b/arch/mips/kernel/setup.c
> > > @@ -262,8 +262,8 @@ static void __init bootmem_init(void)
> > >  static void __init bootmem_init(void)
> > >  {
> > >  	phys_addr_t ramstart, ramend;
> > > -	phys_addr_t start, end;
> > > -	u64 i;
> > > +	unsigned long start, end;
> > > +	int i;
> > >  
> > >  	ramstart = memblock_start_of_DRAM();
> > >  	ramend = memblock_end_of_DRAM();
> > > @@ -300,7 +300,7 @@ static void __init bootmem_init(void)
> > >  
> > >  	min_low_pfn = ARCH_PFN_OFFSET;
> > >  	max_pfn = PFN_DOWN(ramend);
> > > -	for_each_mem_range(i, &start, &end) {
> > > +	for_each_mem_pfn_range(i, MAX_NUMNODES, &start, &end, NULL) {
> > >  		/*
> > >  		 * Skip highmem here so we get an accurate max_low_pfn if low
> > >  		 * memory stops short of high memory.
> > > -- 
> > > 2.16.4
> > > 
> 
> -- 
> Sincerely yours,
> Mike.
