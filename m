Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDB93288A7D
	for <lists+linux-mips@lfdr.de>; Fri,  9 Oct 2020 16:15:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726471AbgJIOPm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 9 Oct 2020 10:15:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726211AbgJIOPl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 9 Oct 2020 10:15:41 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CCB6C0613D2;
        Fri,  9 Oct 2020 07:15:41 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id 184so10854598lfd.6;
        Fri, 09 Oct 2020 07:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2SOjSVsZj4y5DllWpc73jGbnCekSH562sthD5ZVKuL4=;
        b=GhGWMmc+doqcyjTjpCfSu0AebZgoYmTfXEk4gY+gylj9m2LeO6LG6e5uwsD//C/axX
         sZFvefqvUgqQSZm/Q+E92hJj3yw2EHbWEDNR720Mj7TFKs1kDFYnDPz8yEul0B2qv1M5
         J7W8OzLTn4w1K68D6gG80bk9zftKyov41p6Wk2OVTI4mXpBiTLpjrPDdx/kP5KhDaMGU
         B43TFh/cS5PhBX+hLH3ybJFS533nxEnX3Yb1CeIivfd+4azFbqcUXEWAinm21XjRHW6j
         KqpbSbtIVkodk/0tvHw9OHi6vjOmSh59r3lUW7c4KoNomRcCJqRDzgNZn+xe3yVwG7as
         00UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2SOjSVsZj4y5DllWpc73jGbnCekSH562sthD5ZVKuL4=;
        b=dYGkfZfswNLwO73+FB7sE2hoGVYJqJoSqly784atOrKZjYTy01iAzFRHaIoyZYPvUI
         7NeXDrwdM0iuhQ6CUIrvRa/QULOaixEj2lq85lMMtg0mIKNXINyJP857DX33Mrw59FzN
         E54C3r/xs0iNv+nlwuPCUL7gru7mHE6a6MuLwF2XNxH/8wy3BWmnPv8oaNDlPtP06Hnx
         +XIgodawlb+5x1AuVkT3RDDdGB62o8EIHAH4FqfjXj142Sri7t/SGOHntA/dQbfjYSGH
         rhTCaF8DNPsOGoIY26pnCNy/eoue3fGzOKrbYoqwYuT7pbPWQEsyphGKldGa8fwGRquL
         d3kg==
X-Gm-Message-State: AOAM530UmxaCSXNRPlXp7/66UbOwBLGIkoo3PVyISBhXcVNul1mQwMwW
        COcryTS6T1TxQ821TT0WGlM=
X-Google-Smtp-Source: ABdhPJx4WJSAOgpTvL/HLI8QeZfiDx/jSv+WN3zoqZRA+OQW49tulwRobM1KAxZK5kJlsS6rDtmrhw==
X-Received: by 2002:a19:e342:: with SMTP id c2mr4676169lfk.519.1602252939969;
        Fri, 09 Oct 2020 07:15:39 -0700 (PDT)
Received: from mobilestation ([95.79.141.114])
        by smtp.gmail.com with ESMTPSA id g184sm555306lfd.257.2020.10.09.07.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 07:15:39 -0700 (PDT)
Date:   Fri, 9 Oct 2020 17:15:37 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
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
Message-ID: <20201009141537.ijj4cr45zqtkh4yz@mobilestation>
References: <20201008084357.42780-1-tsbogend@alpha.franken.de>
 <20201008152006.4khkbzsxqmmz76rw@mobilestation>
 <20201009120752.GA10588@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201009120752.GA10588@alpha.franken.de>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Oct 09, 2020 at 02:07:52PM +0200, Thomas Bogendoerfer wrote:
> On Thu, Oct 08, 2020 at 06:20:06PM +0300, Serge Semin wrote:
> > > Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > > ---
> > > Changes in v2:
> > > 	fixed missing memblock include in fw/sni/sniprom.c
> > > 	tested on cobalt, IP22, IP28, IP30, IP32, JAZZ, SNI
> > 
> > ...
> > 
> > > diff --git a/arch/mips/kernel/prom.c b/arch/mips/kernel/prom.c
> > > index 9e50dc8df2f6..fab532cb5a11 100644
> > > --- a/arch/mips/kernel/prom.c
> > > +++ b/arch/mips/kernel/prom.c
> > > @@ -50,14 +50,18 @@ void __init early_init_dt_add_memory_arch(u64 base, u64 size)
> > >  		size = PHYS_ADDR_MAX - base;
> > >  	}
> > >  
> > > -	add_memory_region(base, size, BOOT_MEM_RAM);
> > > +	memblock_add(base, size);
> > >  }
> > >  
> > >  int __init early_init_dt_reserve_memory_arch(phys_addr_t base,
> > >  					phys_addr_t size, bool nomap)
> > >  {
> > > -	add_memory_region(base, size,
> > > -			  nomap ? BOOT_MEM_NOMAP : BOOT_MEM_RESERVED);
> > > +	if (nomap) {
> > > +		memblock_remove(base, size);
> > > +	} else {
> > > +		memblock_add(base, size);
> > > +		memblock_reserve(base, size);
> > > +	}
> > >  
> > >  	return 0;
> > >  }
> > 
> > I guess originally the arch-specific early_init_dt_add_memory_arch() and
> > early_init_dt_reserve_memory_arch() methods have been added since MIPS's got its
> > own memory types declarations (BOOT_MEM_RAM, BOOT_MEM_RESERVED, etc) and had had
> > a specific internal system memory regions mapping (add_memory_region(),
> > boot_mem_map, etc). Since the leftover of that framework is going to be removed,
> > we can freely use the standard early_init_dt_add_memory_arch() and
> > early_init_dt_reserve_memory_arch() implementations from drivers/of/fdt.c:1102
> > drivers/of/fdt.c:1149 .
> 
> perfect, I'll remove it in my next version.
> 
> > > @@ -426,13 +387,14 @@ static int __init early_parse_memmap(char *p)
> > >  
> > >  	if (*p == '@') {
> > >  		start_at = memparse(p+1, &p);
> > > -		add_memory_region(start_at, mem_size, BOOT_MEM_RAM);
> > > +		memblock_add(start_at, mem_size);
> > >  	} else if (*p == '#') {
> > >  		pr_err("\"memmap=nn#ss\" (force ACPI data) invalid on MIPS\n");
> > >  		return -EINVAL;
> > >  	} else if (*p == '$') {
> > >  		start_at = memparse(p+1, &p);
> > 
> > > -		add_memory_region(start_at, mem_size, BOOT_MEM_RESERVED);
> > > +		memblock_add(start_at, mem_size);
> > > +		memblock_reserve(start_at, mem_size);
> > 
> > I suppose we could remove the memory addition from here too. What do you think?
> 

> I'm not sure about that, add_memory_region() did a memblock_add
> and then memblock_reserve for BOOT_MEM_RESERVED, that's why I changed
> it that way.

The main question here whether we need to preserve the MIPS-specific semantics
of the kernel 'memmap' parameter. Currently the memmap parameter passed with
'$' specifier will be perceived as a reserved RAM region, while, for instance, 
the same parameter on x86 will be converted to a region, which won't be
registered in memblock at all, so the system won't be able to reuse it if it's
needed to be (see parse_memmap_one() and e820__memblock_setup() for details).

I don't really know what approach is correct... 
Documentation/admin-guide/kernel-parameters.txt isn't certain about that. It
says that the region must be reserved, but no words whether it is supposed to be
mappable or non-mappable.

-Sergey

> 
> Thomas.
> 
> -- 
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]
