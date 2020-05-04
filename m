Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CFB21C4A41
	for <lists+linux-mips@lfdr.de>; Tue,  5 May 2020 01:27:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728223AbgEDX12 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 4 May 2020 19:27:28 -0400
Received: from mga06.intel.com ([134.134.136.31]:31042 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726911AbgEDX11 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 4 May 2020 19:27:27 -0400
IronPort-SDR: lbnx4feHI1aVj/ziqVyEYLXW9QTn6RLW7Ylz3d/TDHq+iGPZHtqN7StH7FOQmR4Z7118MeuafW
 whneddWFOKZw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2020 16:27:27 -0700
IronPort-SDR: FfmHJ+ZXo1f5ZQiiqbjWS0lOXVjHvUwnQi1XbTU0n32Bds1d2LVvsjbZwDRAuatgMzoWj4tKIj
 rnIe76RxdCiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,353,1583222400"; 
   d="scan'208";a="248380428"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.147])
  by orsmga007.jf.intel.com with ESMTP; 04 May 2020 16:27:26 -0700
Date:   Mon, 4 May 2020 16:27:26 -0700
From:   Ira Weiny <ira.weiny@intel.com>
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Christian Koenig <christian.koenig@amd.com>,
        Huang Rui <ray.huang@amd.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        "David S. Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Dan Williams <dan.j.williams@intel.com>,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH V2 00/11] Subject: Remove duplicated kmap code
Message-ID: <20200504232725.GA1084304@iweiny-DESK2.sc.intel.com>
References: <20200504010912.982044-1-ira.weiny@intel.com>
 <20200504013509.GU23230@ZenIV.linux.org.uk>
 <20200504050447.GA979899@iweiny-DESK2.sc.intel.com>
 <20200504053357.GV23230@ZenIV.linux.org.uk>
 <20200504201740.GA985739@iweiny-DESK2.sc.intel.com>
 <20200504210225.GW23230@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200504210225.GW23230@ZenIV.linux.org.uk>
User-Agent: Mutt/1.11.1 (2018-12-01)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, May 04, 2020 at 10:02:25PM +0100, Al Viro wrote:
> On Mon, May 04, 2020 at 01:17:41PM -0700, Ira Weiny wrote:
> 
> > > || * arm: much, much worse.  We have several files that pull linux/highmem.h:
> > > || arch/arm/mm/cache-feroceon-l2.c, arch/arm/mm/cache-xsc3l2.c,
> > > || arch/arm/mm/copypage-*.c, arch/arm/mm/dma-mapping.c, arch/arm/mm/flush.c,
> > > || arch/arm/mm/highmem.c, arch/arm/probes/uprobes/core.c,
> > > || arch/arm/include/asm/kvm_mmu.h (kmap_atomic_pfn()).
> > > || Those are fine, but we also have this:
> > > || arch/arm/include/asm/pgtable.h:200:#define __pte_map(pmd)               (pte_t *)kmap_atomic(pmd_page(*(pmd)))
> > > || arch/arm/include/asm/pgtable.h:208:#define pte_offset_map(pmd,addr)     (__pte_map(pmd) + pte_index(addr))
> > > || and sure as hell, asm/pgtable.h does *NOT* pull linux/highmem.h.
> > 
> > It does not pull asm/highmem.h either...
> 
> No, but the users of those macros need to be considered.

Agreed, I was trying to point out that highmem.h was being pulled from
somewhere else prior to my series, sorry.

> 
> > > || #define pte_offset_map(dir, addr)               \
> > > ||         ((pte_t *) kmap_atomic(pmd_page(*(dir))) + pte_index(addr))
> > > ||         One pte_offset_map user in arch/microblaze:
> > > || arch/microblaze/kernel/signal.c:207:    ptep = pte_offset_map(pmdp, address);
> > > || Messy, but doesn't require any changes (we have asm/pgalloc.h included
> > > || there, and that pull linux/highmem.h).
> > 
> > AFAICS asm/pgtable.h does not include asm/highmem.h here...
> > 
> > So looks like arch/microblaze/kernel/signal.c will need linux/highmem.h
> 
> See above - line 39 in there is
> #include <asm/pgalloc.h>
> and line 14 in arch/microblaze/include/asm/pgalloc.h is
> #include <linux/highmem.h>
> It's conditional upon CONFIG_MMU in there, but so's the use of
> pte_offset_map() in arch/microblaze/kernel/signal.c 
> 
> So it shouldn't be a problem.

Ah ok, I did not see that one.  Ok I'll drop that change and this series should
be good.

I was setting up to submit another version with 3 more patches you have
suggested:

kmap: Remove kmap_atomic_to_page()
parisc/kmap: Remove duplicate kmap code
sparc: Remove unnecessary includes

Would you like to see those folded in?  I submitted 2 of the above as a
separate series already.

> 
> > > || * xtensa: users in arch/xtensa/kernel/pci-dma.c, arch/xtensa/mm/highmem.c,
> > > || arch/xtensa/mm/cache.c and arch/xtensa/platforms/iss/simdisk.c (all pull
> > > || linux/highmem.h).
> > 
> > Actually
> > 
> > arch/xtensa/mm/cache.c gets linux/highmem.h from linux/pagemap.h
> > 
> > arch/xtensa/platforms/iss/simdisk.c may have an issue?
> > 	linux/blkdev.h -> CONFIG_BLOCK -> linux/pagemap.h -> linux/highmem.h
> > 	But simdisk.c requires BLK_DEV_SIMDISK -> CONFIG_BLOCK...
> > 	<sigh>
> 
> Yep - see above re major chain of indirect includes conditional upon CONFIG_BLOCK
> and its uses in places that only build with such configs.  There's a plenty of
> similar considerations outside of arch/*, unfortunately...

Indeed.

FWIW the last 2 versions of this series have had no build failures with 0-day.

This series in particular just finished 164 configs without issue.

Would you like me to submit a new series?  With your additional patches?

Ira
