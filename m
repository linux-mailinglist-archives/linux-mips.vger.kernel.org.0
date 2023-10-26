Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5431F7D80A6
	for <lists+linux-mips@lfdr.de>; Thu, 26 Oct 2023 12:24:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230330AbjJZKYw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 26 Oct 2023 06:24:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbjJZKYv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 26 Oct 2023 06:24:51 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C66A4DC;
        Thu, 26 Oct 2023 03:24:49 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1DD8C433C8;
        Thu, 26 Oct 2023 10:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698315889;
        bh=WN2YIA4Ghusd7FbmcNZrWw/oKLuywPkap4tOfxaAQ4k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZyX3dsziPkRUXG2UWwCRe9pQvhY4J8EKCi1UMJicG8n+1K8kuqLhkCHInfodKwhzx
         IGdZJx3E0WGYfJuhn5slU+daxFVHZfLRqURf8zRCQM4mPgPcJg6TqmPoqs/pWtOypa
         aGTSZPjPNBzHwtWONSwhXj/25YMcitUcojHP1kRQ49c14Z4eV6Kpw2ampGhmL7G6Sm
         v7J3Ia4FdxDhFLmdhSb20AH9mufPj5bcJmpVjmk+yiUwvbVfd/gsYS5NT3Ej9E93W4
         br849v8H22PcC0TOPiwgXMZFArfvyVNNVM97V2kwDBdHjqJI1bEYt3iRHEo7Tm6Bk9
         Y3kn5Rw8Exupg==
Date:   Thu, 26 Oct 2023 11:24:39 +0100
From:   Will Deacon <will@kernel.org>
To:     Mike Rapoport <rppt@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        "David S. Miller" <davem@davemloft.net>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Heiko Carstens <hca@linux.ibm.com>,
        Helge Deller <deller@gmx.de>,
        Huacai Chen <chenhuacai@kernel.org>,
        Kent Overstreet <kent.overstreet@linux.dev>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nadav Amit <nadav.amit@gmail.com>,
        "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Puranjay Mohan <puranjay12@gmail.com>,
        Rick Edgecombe <rick.p.edgecombe@intel.com>,
        Russell King <linux@armlinux.org.uk>,
        Song Liu <song@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-mm@kvack.org, linux-modules@vger.kernel.org,
        linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
        netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v3 04/13] mm/execmem, arch: convert remaining overrides
 of module_alloc to execmem
Message-ID: <20231026102438.GA6924@willie-the-truck>
References: <20230918072955.2507221-1-rppt@kernel.org>
 <20230918072955.2507221-5-rppt@kernel.org>
 <20231023171420.GA4041@willie-the-truck>
 <20231026085800.GK2824@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231026085800.GK2824@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Oct 26, 2023 at 11:58:00AM +0300, Mike Rapoport wrote:
> On Mon, Oct 23, 2023 at 06:14:20PM +0100, Will Deacon wrote:
> > On Mon, Sep 18, 2023 at 10:29:46AM +0300, Mike Rapoport wrote:
> > > diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
> > > index dd851297596e..cd6320de1c54 100644
> > > --- a/arch/arm64/kernel/module.c
> > > +++ b/arch/arm64/kernel/module.c
> > > @@ -20,6 +20,7 @@
> > >  #include <linux/random.h>
> > >  #include <linux/scs.h>
> > >  #include <linux/vmalloc.h>
> > > +#include <linux/execmem.h>
> > >  
> > >  #include <asm/alternative.h>
> > >  #include <asm/insn.h>
> > > @@ -108,46 +109,38 @@ static int __init module_init_limits(void)
> > >  
> > >  	return 0;
> > >  }
> > > -subsys_initcall(module_init_limits);
> > >  
> > > -void *module_alloc(unsigned long size)
> > > +static struct execmem_params execmem_params __ro_after_init = {
> > > +	.ranges = {
> > > +		[EXECMEM_DEFAULT] = {
> > > +			.flags = EXECMEM_KASAN_SHADOW,
> > > +			.alignment = MODULE_ALIGN,
> > > +		},
> > > +	},
> > > +};
> > > +
> > > +struct execmem_params __init *execmem_arch_params(void)
> > >  {
> > > -	void *p = NULL;
> > > +	struct execmem_range *r = &execmem_params.ranges[EXECMEM_DEFAULT];
> > >  
> > > -	/*
> > > -	 * Where possible, prefer to allocate within direct branch range of the
> > > -	 * kernel such that no PLTs are necessary.
> > > -	 */
> > 
> > Why are you removing this comment? I think you could just move it next
> > to the part where we set a 128MiB range.
>  
> Oops, my bad. Will add it back.

Thanks.

> > > -	if (module_direct_base) {
> > > -		p = __vmalloc_node_range(size, MODULE_ALIGN,
> > > -					 module_direct_base,
> > > -					 module_direct_base + SZ_128M,
> > > -					 GFP_KERNEL | __GFP_NOWARN,
> > > -					 PAGE_KERNEL, 0, NUMA_NO_NODE,
> > > -					 __builtin_return_address(0));
> > > -	}
> > > +	module_init_limits();
> > 
> > Hmm, this used to be run from subsys_initcall(), but now you're running
> > it _really_ early, before random_init(), so randomization of the module
> > space is no longer going to be very random if we don't have early entropy
> > from the firmware or the CPU, which is likely to be the case on most SoCs.
> 
> Well, it will be as random as KASLR. Won't that be enough?

I don't think that's true -- we have the 'kaslr-seed' property for KASLR,
but I'm not seeing anything like that for the module randomisation and I
also don't see why we need to set these limits so early.

Will
