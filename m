Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDDB02351A0
	for <lists+linux-mips@lfdr.de>; Sat,  1 Aug 2020 12:19:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728816AbgHAKTL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 1 Aug 2020 06:19:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:43666 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726888AbgHAKTL (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 1 Aug 2020 06:19:11 -0400
Received: from kernel.org (unknown [87.70.91.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5ED692087C;
        Sat,  1 Aug 2020 10:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596277150;
        bh=jQD0i2dEJRPR8dDJK6vZOAFdpUe2Ho5YLvcSFtENhXg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BOX5CM31age4ZqR8WpA9Tu6Sib3TWB8q0axiVZJ9476Af21jQMyZgnRXNsbolGSGn
         pWpwQlO3I1Ym/ZhVqWnuEZ70zJ8p8UgBgfsl0uitfuYMEFBB9GFeRHX0dU8VC7876G
         1GC7zC28lCBEAGXT18VZfRnXSGNcrY6WFAZx7Yv0=
Date:   Sat, 1 Aug 2020 13:18:54 +0300
From:   Mike Rapoport <rppt@kernel.org>
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Andy Lutomirski <luto@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christoph Hellwig <hch@lst.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Ingo Molnar <mingo@redhat.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Michal Simek <monstr@monstr.eu>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Mackerras <paulus@samba.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Russell King <linux@armlinux.org.uk>,
        Stafford Horne <shorne@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Will Deacon <will@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        clang-built-linux@googlegroups.com,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-mm@kvack.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, linuxppc-dev@lists.ozlabs.org,
        openrisc@lists.librecores.org, sparclinux@vger.kernel.org,
        uclinux-h8-devel@lists.sourceforge.jp, x86@kernel.org,
        Hari Bathini <hbathini@in.ibm.com>
Subject: Re: [PATCH 06/15] powerpc: fadamp: simplify
 fadump_reserve_crash_area()
Message-ID: <20200801101854.GD534153@kernel.org>
References: <20200728051153.1590-1-rppt@kernel.org>
 <20200728051153.1590-7-rppt@kernel.org>
 <87d04d5hda.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87d04d5hda.fsf@mpe.ellerman.id.au>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jul 30, 2020 at 10:15:13PM +1000, Michael Ellerman wrote:
> Mike Rapoport <rppt@kernel.org> writes:
> > From: Mike Rapoport <rppt@linux.ibm.com>
> >
> > fadump_reserve_crash_area() reserves memory from a specified base address
> > till the end of the RAM.
> >
> > Replace iteration through the memblock.memory with a single call to
> > memblock_reserve() with appropriate  that will take care of proper memory
>                                      ^
>                                      parameters?
> > reservation.
> >
> > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> > ---
> >  arch/powerpc/kernel/fadump.c | 20 +-------------------
> >  1 file changed, 1 insertion(+), 19 deletions(-)
> 
> I think this looks OK to me, but I don't have a setup to test it easily.
> I've added Hari to Cc who might be able to.
> 
> But I'll give you an ack in the hope that it works :)

Actually, I did some digging in the git log and the traversal was added
there on purpose by the commit b71a693d3db3 ("powerpc/fadump: exclude
memory holes while reserving memory in second kernel")
Presuming this is still reqruired I'm going to drop this patch and will
simply replace for_each_memblock() with for_each_mem_range() in v2.
 
> Acked-by: Michael Ellerman <mpe@ellerman.id.au>
> 
> 
> > diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
> > index 78ab9a6ee6ac..2446a61e3c25 100644
> > --- a/arch/powerpc/kernel/fadump.c
> > +++ b/arch/powerpc/kernel/fadump.c
> > @@ -1658,25 +1658,7 @@ int __init fadump_reserve_mem(void)
> >  /* Preserve everything above the base address */
> >  static void __init fadump_reserve_crash_area(u64 base)
> >  {
> > -	struct memblock_region *reg;
> > -	u64 mstart, msize;
> > -
> > -	for_each_memblock(memory, reg) {
> > -		mstart = reg->base;
> > -		msize  = reg->size;
> > -
> > -		if ((mstart + msize) < base)
> > -			continue;
> > -
> > -		if (mstart < base) {
> > -			msize -= (base - mstart);
> > -			mstart = base;
> > -		}
> > -
> > -		pr_info("Reserving %lluMB of memory at %#016llx for preserving crash data",
> > -			(msize >> 20), mstart);
> > -		memblock_reserve(mstart, msize);
> > -	}
> > +	memblock_reserve(base, memblock_end_of_DRAM() - base);
> >  }
> >  
> >  unsigned long __init arch_reserved_kernel_pages(void)
> > -- 
> > 2.26.2

-- 
Sincerely yours,
Mike.
