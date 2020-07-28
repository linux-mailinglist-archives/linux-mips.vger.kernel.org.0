Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98E57230C36
	for <lists+linux-mips@lfdr.de>; Tue, 28 Jul 2020 16:15:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730297AbgG1OPW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Jul 2020 10:15:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:42926 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730012AbgG1OPU (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 Jul 2020 10:15:20 -0400
Received: from kernel.org (unknown [87.71.40.38])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7BC04206F5;
        Tue, 28 Jul 2020 14:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595945719;
        bh=lUPY2x+FC7QKHEsbHiDvmWaDq+mpMmmwkd+OggYom1s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QgGc4X7YUZ1ckDx2DS7TV0wJ9kprJKWkAHEon+OMgHl2R1sb+tkMTAcVnCBfWfbCy
         0OtC+wiVDREvJNkkA1XcIE7jDME0kzNs1q63GPOaIsM59WTD15P6atSjYRp+nh+npo
         fGSf3gFWEKzBxONEs1GYYDPsR5qUaUEQHRNOUSzo=
Date:   Tue, 28 Jul 2020 17:15:04 +0300
From:   Mike Rapoport <rppt@kernel.org>
To:     Baoquan He <bhe@redhat.com>
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
        Michael Ellerman <mpe@ellerman.id.au>,
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
        uclinux-h8-devel@lists.sourceforge.jp, x86@kernel.org
Subject: Re: [PATCH 14/15] x86/numa: remove redundant iteration over
 memblock.reserved
Message-ID: <20200728141504.GC3655207@kernel.org>
References: <20200728051153.1590-1-rppt@kernel.org>
 <20200728051153.1590-15-rppt@kernel.org>
 <20200728110254.GA14854@MiWiFi-R3L-srv>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200728110254.GA14854@MiWiFi-R3L-srv>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jul 28, 2020 at 07:02:54PM +0800, Baoquan He wrote:
> On 07/28/20 at 08:11am, Mike Rapoport wrote:
> > From: Mike Rapoport <rppt@linux.ibm.com>
> > 
> > numa_clear_kernel_node_hotplug() function first traverses numa_meminfo
> > regions to set node ID in memblock.reserved and than traverses
> > memblock.reserved to update reserved_nodemask to include node IDs that were
> > set in the first loop.
> > 
> > Remove redundant traversal over memblock.reserved and update
> > reserved_nodemask while iterating over numa_meminfo.
> > 
> > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> > ---
> >  arch/x86/mm/numa.c | 26 ++++++++++----------------
> >  1 file changed, 10 insertions(+), 16 deletions(-)
> > 
> > diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
> > index 8ee952038c80..4078abd33938 100644
> > --- a/arch/x86/mm/numa.c
> > +++ b/arch/x86/mm/numa.c
> > @@ -498,31 +498,25 @@ static void __init numa_clear_kernel_node_hotplug(void)
> >  	 * and use those ranges to set the nid in memblock.reserved.
> >  	 * This will split up the memblock regions along node
> >  	 * boundaries and will set the node IDs as well.
> > +	 *
> > +	 * The nid will also be set in reserved_nodemask which is later
> > +	 * used to clear MEMBLOCK_HOTPLUG flag.
> > +	 *
> > +	 * [ Note, when booting with mem=nn[kMG] or in a kdump kernel,
> > +	 *   numa_meminfo might not include all memblock.reserved
> > +	 *   memory ranges, because quirks such as trim_snb_memory()
> > +	 *   reserve specific pages for Sandy Bridge graphics.
> > +	 *   These ranges will remain with nid == MAX_NUMNODES. ]
> >  	 */
> >  	for (i = 0; i < numa_meminfo.nr_blks; i++) {
> >  		struct numa_memblk *mb = numa_meminfo.blk + i;
> >  		int ret;
> >  
> >  		ret = memblock_set_node(mb->start, mb->end - mb->start, &memblock.reserved, mb->nid);
> > +		node_set(mb->nid, reserved_nodemask);
> 
> Really? This will set all node id into reserved_nodemask. But in the
> current code, it's setting nid into memblock reserved region which
> interleaves with numa_memoinfo, then get those nid and set it in
> reserved_nodemask. This is so different, with my understanding. Please
> correct me if I am wrong.

You are right, I've missed the intersections of numa_meminfo with
memblock.reserved.

x86 interaction with membock is so, hmm, interesting...
 
> Thanks
> Baoquan
> 
> >  		WARN_ON_ONCE(ret);
> >  	}
> >  
> > -	/*
> > -	 * Now go over all reserved memblock regions, to construct a
> > -	 * node mask of all kernel reserved memory areas.
> > -	 *
> > -	 * [ Note, when booting with mem=nn[kMG] or in a kdump kernel,
> > -	 *   numa_meminfo might not include all memblock.reserved
> > -	 *   memory ranges, because quirks such as trim_snb_memory()
> > -	 *   reserve specific pages for Sandy Bridge graphics. ]
> > -	 */
> > -	for_each_memblock(reserved, mb_region) {
> > -		int nid = memblock_get_region_node(mb_region);
> > -
> > -		if (nid != MAX_NUMNODES)
> > -			node_set(nid, reserved_nodemask);
> > -	}
> > -
> >  	/*
> >  	 * Finally, clear the MEMBLOCK_HOTPLUG flag for all memory
> >  	 * belonging to the reserved node mask.
> > -- 
> > 2.26.2
> > 
> > 
> 

-- 
Sincerely yours,
Mike.
