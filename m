Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBD1C3223A2
	for <lists+linux-mips@lfdr.de>; Tue, 23 Feb 2021 02:24:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231219AbhBWBXw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Feb 2021 20:23:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:37912 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230380AbhBWBXI (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 22 Feb 2021 20:23:08 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A8BC86023B;
        Tue, 23 Feb 2021 01:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614043347;
        bh=QyNsljerVpDiDO+K9/ltiFTkhVqcxc/0Ay2CXZ1z8vI=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=qT9uEWGJgqYzpURFhCR6u+Wbw6bbsJzfvEpXt+qOvRpZBeHHsRUnipN3HQHDDB3E3
         gCjXrJz0oOmy8eLfkAtbzisTgVdrdP8aPT65rPgULTDiPO+qGgU3kXayVSCi7szBX/
         MfxWKKRGZmJ1Y0ya3KFks5fDwYLPA+LP36j6egOWcx+zZZlUCQVI7We8WcL7pgLfTc
         aFyNR7YKXv/dZO9DLIrqsrZIWF99Xag6MDO0N1HuYflfFdk0rqJHeOrj3VhyML8MHz
         tVChYYBBryvSqBDuB2Mo5J/NvyYzT12d/wTuwUUZX0GTHVvNU/omP5eYzJ827lYJXw
         ABjqJ4JGM8RZA==
Date:   Mon, 22 Feb 2021 17:22:24 -0800 (PST)
From:   Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To:     Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
cc:     Christoph Hellwig <hch@lst.de>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>, jgross@suse.com,
        Dongli Zhang <dongli.zhang@oracle.com>,
        dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        iommu@lists.linux-foundation.org, linux-mips@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-pci@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, nouveau@lists.freedesktop.org,
        x86@kernel.org, xen-devel@lists.xenproject.org,
        linux-kernel@vger.kernel.org, adrian.hunter@intel.com,
        akpm@linux-foundation.org, benh@kernel.crashing.org,
        bskeggs@redhat.com, bhelgaas@google.com, bp@alien8.de,
        chris@chris-wilson.co.uk, daniel@ffwll.ch, airlied@linux.ie,
        hpa@zytor.com, mingo@kernel.org, mingo@redhat.com,
        jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
        m.szyprowski@samsung.com, matthew.auld@intel.com,
        mpe@ellerman.id.au, rppt@kernel.org, paulus@samba.org,
        peterz@infradead.org, robin.murphy@arm.com, rodrigo.vivi@intel.com,
        sstabellini@kernel.org, bauerman@linux.ibm.com,
        tsbogend@alpha.franken.de, tglx@linutronix.de,
        ulf.hansson@linaro.org, joe.jin@oracle.com, thomas.lendacky@amd.com
Subject: Re: [PATCH RFC v1 5/6] xen-swiotlb: convert variables to arrays
In-Reply-To: <YDAgT2ZIdncNwNlf@Konrads-MacBook-Pro.local>
Message-ID: <alpine.DEB.2.21.2102221511360.3234@sstabellini-ThinkPad-T480s>
References: <20210203233709.19819-1-dongli.zhang@oracle.com> <20210203233709.19819-6-dongli.zhang@oracle.com> <20210204084023.GA32328@lst.de> <20210207155601.GA25111@lst.de> <YDAgT2ZIdncNwNlf@Konrads-MacBook-Pro.local>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 19 Feb 2021, Konrad Rzeszutek Wilk wrote:
> On Sun, Feb 07, 2021 at 04:56:01PM +0100, Christoph Hellwig wrote:
> > On Thu, Feb 04, 2021 at 09:40:23AM +0100, Christoph Hellwig wrote:
> > > So one thing that has been on my mind for a while:  I'd really like
> > > to kill the separate dma ops in Xen swiotlb.  If we compare xen-swiotlb
> > > to swiotlb the main difference seems to be:
> > > 
> > >  - additional reasons to bounce I/O vs the plain DMA capable
> > >  - the possibility to do a hypercall on arm/arm64
> > >  - an extra translation layer before doing the phys_to_dma and vice
> > >    versa
> > >  - an special memory allocator
> > > 
> > > I wonder if inbetween a few jump labels or other no overhead enablement
> > > options and possibly better use of the dma_range_map we could kill
> > > off most of swiotlb-xen instead of maintaining all this code duplication?
> > 
> > So I looked at this a bit more.
> > 
> > For x86 with XENFEAT_auto_translated_physmap (how common is that?)
> 
> Juergen, Boris please correct me if I am wrong, but that XENFEAT_auto_translated_physmap
> only works for PVH guests?

ARM is always XENFEAT_auto_translated_physmap


> > pfn_to_gfn is a nop, so plain phys_to_dma/dma_to_phys do work as-is.
> > 
> > xen_arch_need_swiotlb always returns true for x86, and
> > range_straddles_page_boundary should never be true for the
> > XENFEAT_auto_translated_physmap case.
> 
> Correct. The kernel should have no clue of what the real MFNs are
> for PFNs.

On ARM, Linux knows the MFNs because for local pages MFN == PFN and for
foreign pages it keeps track in arch/arm/xen/p2m.c. More on this below.

xen_arch_need_swiotlb only returns true on ARM in rare situations where
bouncing on swiotlb buffers is required. Today it only happens on old
versions of Xen that don't support the cache flushing hypercall but
there could be more cases in the future.


> > 
> > So as far as I can tell the mapping fast path for the
> > XENFEAT_auto_translated_physmap can be trivially reused from swiotlb.
> > 
> > That leaves us with the next more complicated case, x86 or fully cache
> > coherent arm{,64} without XENFEAT_auto_translated_physmap.  In that case
> > we need to patch in a phys_to_dma/dma_to_phys that performs the MFN
> > lookup, which could be done using alternatives or jump labels.
> > I think if that is done right we should also be able to let that cover
> > the foreign pages in is_xen_swiotlb_buffer/is_swiotlb_buffer, but
> > in that worst case that would need another alternative / jump label.
> > 
> > For non-coherent arm{,64} we'd also need to use alternatives or jump
> > labels to for the cache maintainance ops, but that isn't a hard problem
> > either.

With the caveat that ARM is always XENFEAT_auto_translated_physmap, what
you wrote looks correct. I am writing down a brief explanation on how
swiotlb-xen is used on ARM.


pfn: address as seen by the guest, pseudo-physical address in ARM terminology
mfn (or bfn): real address, physical address in ARM terminology


On ARM dom0 is auto_translated (so Xen sets up the stage2 translation
in the MMU) and the translation is 1:1. So pfn == mfn for Dom0.

However, when another domain shares a page with Dom0, that page is not
1:1. Swiotlb-xen is used to retrieve the mfn for the foreign page at
xen_swiotlb_map_page. It does that with xen_phys_to_bus -> pfn_to_bfn.
It is implemented with a rbtree in arch/arm/xen/p2m.c.

In addition, swiotlb-xen is also used to cache-flush the page via
hypercall at xen_swiotlb_unmap_page. That is done because dev_addr is
really the mfn at unmap_page and we don't know the pfn for it. We can do
pfn-to-mfn but we cannot do mfn-to-pfn (there are good reasons for it
unfortunately). The only way to cache-flush by mfn is by issuing a
hypercall. The hypercall is implemented in arch/arm/xen/mm.c.

The pfn != bfn and pfn_valid() checks are used to detect if the page is
local (of dom0) or foreign; they work thanks to the fact that Dom0 is
1:1 mapped.


Getting back to what you wrote, yes if we had a way to do MFN lookups in
phys_to_dma, and a way to call the hypercall at unmap_page if the page
is foreign (e.g. if it fails a pfn_valid check) then I think we would be
good from an ARM perspective. The only exception is when
xen_arch_need_swiotlb returns true, in which case we need to actually
bounce on swiotlb buffers.
