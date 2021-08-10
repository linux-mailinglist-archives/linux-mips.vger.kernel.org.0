Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 819633DFEBB
	for <lists+linux-mips@lfdr.de>; Wed,  4 Aug 2021 12:02:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237354AbhHDKCx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 4 Aug 2021 06:02:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:46428 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237347AbhHDKCw (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 4 Aug 2021 06:02:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E224061004;
        Wed,  4 Aug 2021 10:02:34 +0000 (UTC)
Date:   Wed, 4 Aug 2021 11:02:32 +0100
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Mike Rapoport <rppt@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Andy Lutomirski <luto@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Ingo Molnar <mingo@redhat.com>,
        "Kirill A. Shutemov" <kirill@shutemov.name>,
        Len Brown <lenb@kernel.org>, Marc Zyngier <maz@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Peter Zijlstra <peterz@infradead.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Rob Herring <robh+dt@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
        kvmarm@lists.cs.columbia.edu, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-mm@kvack.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        x86@kernel.org
Subject: Re: [PATCH v3] memblock: make memblock_find_in_range method private
Message-ID: <20210804100231.GA4857@arm.com>
References: <20210803064218.6611-1-rppt@kernel.org>
 <20210803180526.GD5786@arm.com>
 <YQmT+Z9QhcwI43GK@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YQmT+Z9QhcwI43GK@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Aug 03, 2021 at 10:07:37PM +0300, Mike Rapoport wrote:
> On Tue, Aug 03, 2021 at 07:05:26PM +0100, Catalin Marinas wrote:
> > On Tue, Aug 03, 2021 at 09:42:18AM +0300, Mike Rapoport wrote:
> > > diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> > > index 8490ed2917ff..0bffd2d1854f 100644
> > > --- a/arch/arm64/mm/init.c
> > > +++ b/arch/arm64/mm/init.c
> > > @@ -74,6 +74,7 @@ phys_addr_t arm64_dma_phys_limit __ro_after_init;
> > >  static void __init reserve_crashkernel(void)
> > >  {
> > >  	unsigned long long crash_base, crash_size;
> > > +	unsigned long long crash_max = arm64_dma_phys_limit;
> > >  	int ret;
> > >  
> > >  	ret = parse_crashkernel(boot_command_line, memblock_phys_mem_size(),
> > > @@ -84,33 +85,18 @@ static void __init reserve_crashkernel(void)
> > >  
> > >  	crash_size = PAGE_ALIGN(crash_size);
> > >  
> > > -	if (crash_base == 0) {
> > > -		/* Current arm64 boot protocol requires 2MB alignment */
> > > -		crash_base = memblock_find_in_range(0, arm64_dma_phys_limit,
> > > -				crash_size, SZ_2M);
> > > -		if (crash_base == 0) {
> > > -			pr_warn("cannot allocate crashkernel (size:0x%llx)\n",
> > > -				crash_size);
> > > -			return;
> > > -		}
> > > -	} else {
> > > -		/* User specifies base address explicitly. */
> > > -		if (!memblock_is_region_memory(crash_base, crash_size)) {
> > > -			pr_warn("cannot reserve crashkernel: region is not memory\n");
> > > -			return;
> > > -		}
> > > +	/* User specifies base address explicitly. */
> > > +	if (crash_base)
> > > +		crash_max = crash_base + crash_size;
> > >  
> > > -		if (memblock_is_region_reserved(crash_base, crash_size)) {
> > > -			pr_warn("cannot reserve crashkernel: region overlaps reserved memory\n");
> > > -			return;
> > > -		}
> > > -
> > > -		if (!IS_ALIGNED(crash_base, SZ_2M)) {
> > > -			pr_warn("cannot reserve crashkernel: base address is not 2MB aligned\n");
> > > -			return;
> > > -		}
> > > +	/* Current arm64 boot protocol requires 2MB alignment */
> > > +	crash_base = memblock_phys_alloc_range(crash_size, SZ_2M,
> > > +					       crash_base, crash_max);
> > > +	if (!crash_base) {
> > > +		pr_warn("cannot allocate crashkernel (size:0x%llx)\n",
> > > +			crash_size);
> > > +		return;
> > >  	}
> > > -	memblock_reserve(crash_base, crash_size);
> > 
> > We'll miss a bit on debug information provided to the user in case of a
> > wrong crash_base/size option on the command line. Not sure we care much,
> > though the alignment would probably be useful (maybe we document it
> > somewhere).
> 
> It is already documented:
> 
> Documentation/admin-guide/kdump/kdump.rst:
>    On arm64, use "crashkernel=Y[@X]".  Note that the start address of
>    the kernel, X if explicitly specified, must be aligned to 2MiB (0x200000).

Thanks for the pointer.

> > What I haven't checked is whether memblock_phys_alloc_range() aims to
> > get a 2MB aligned end (size) as well. If crash_size is not 2MB aligned,
> > crash_max wouldn't be either and the above could fail. We only care
> > about the crash_base to be aligned but the memblock_phys_alloc_range()
> > doc says that both the start and size would be aligned to this.
> 
> The doc lies :)
> 
> memblock_phys_alloc_range() boils down to 
> 
> 	for_each_free_mem_range_reverse(i, nid, flags, &this_start, &this_end,
> 					NULL) {
> 
> 		/* clamp this_{start,end} to the user defined limits */
> 
> 		cand = round_down(this_end - size, align);
> 		if (cand >= this_start)
> 			return cand;
> 	}

Alright, it should work then. For arm64:

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
