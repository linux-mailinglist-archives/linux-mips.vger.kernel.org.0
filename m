Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C3D61C48BA
	for <lists+linux-mips@lfdr.de>; Mon,  4 May 2020 23:02:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbgEDVCm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 4 May 2020 17:02:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726334AbgEDVCm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 4 May 2020 17:02:42 -0400
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [IPv6:2002:c35c:fd02::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F5A5C061A0E;
        Mon,  4 May 2020 14:02:42 -0700 (PDT)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jViEL-0010Kx-57; Mon, 04 May 2020 21:02:25 +0000
Date:   Mon, 4 May 2020 22:02:25 +0100
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     Ira Weiny <ira.weiny@intel.com>
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
Message-ID: <20200504210225.GW23230@ZenIV.linux.org.uk>
References: <20200504010912.982044-1-ira.weiny@intel.com>
 <20200504013509.GU23230@ZenIV.linux.org.uk>
 <20200504050447.GA979899@iweiny-DESK2.sc.intel.com>
 <20200504053357.GV23230@ZenIV.linux.org.uk>
 <20200504201740.GA985739@iweiny-DESK2.sc.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200504201740.GA985739@iweiny-DESK2.sc.intel.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, May 04, 2020 at 01:17:41PM -0700, Ira Weiny wrote:

> > || * arm: much, much worse.  We have several files that pull linux/highmem.h:
> > || arch/arm/mm/cache-feroceon-l2.c, arch/arm/mm/cache-xsc3l2.c,
> > || arch/arm/mm/copypage-*.c, arch/arm/mm/dma-mapping.c, arch/arm/mm/flush.c,
> > || arch/arm/mm/highmem.c, arch/arm/probes/uprobes/core.c,
> > || arch/arm/include/asm/kvm_mmu.h (kmap_atomic_pfn()).
> > || Those are fine, but we also have this:
> > || arch/arm/include/asm/pgtable.h:200:#define __pte_map(pmd)               (pte_t *)kmap_atomic(pmd_page(*(pmd)))
> > || arch/arm/include/asm/pgtable.h:208:#define pte_offset_map(pmd,addr)     (__pte_map(pmd) + pte_index(addr))
> > || and sure as hell, asm/pgtable.h does *NOT* pull linux/highmem.h.
> 
> It does not pull asm/highmem.h either...

No, but the users of those macros need to be considered.

> > || #define pte_offset_map(dir, addr)               \
> > ||         ((pte_t *) kmap_atomic(pmd_page(*(dir))) + pte_index(addr))
> > ||         One pte_offset_map user in arch/microblaze:
> > || arch/microblaze/kernel/signal.c:207:    ptep = pte_offset_map(pmdp, address);
> > || Messy, but doesn't require any changes (we have asm/pgalloc.h included
> > || there, and that pull linux/highmem.h).
> 
> AFAICS asm/pgtable.h does not include asm/highmem.h here...
> 
> So looks like arch/microblaze/kernel/signal.c will need linux/highmem.h

See above - line 39 in there is
#include <asm/pgalloc.h>
and line 14 in arch/microblaze/include/asm/pgalloc.h is
#include <linux/highmem.h>
It's conditional upon CONFIG_MMU in there, but so's the use of
pte_offset_map() in arch/microblaze/kernel/signal.c 

So it shouldn't be a problem.

> > || * xtensa: users in arch/xtensa/kernel/pci-dma.c, arch/xtensa/mm/highmem.c,
> > || arch/xtensa/mm/cache.c and arch/xtensa/platforms/iss/simdisk.c (all pull
> > || linux/highmem.h).
> 
> Actually
> 
> arch/xtensa/mm/cache.c gets linux/highmem.h from linux/pagemap.h
> 
> arch/xtensa/platforms/iss/simdisk.c may have an issue?
> 	linux/blkdev.h -> CONFIG_BLOCK -> linux/pagemap.h -> linux/highmem.h
> 	But simdisk.c requires BLK_DEV_SIMDISK -> CONFIG_BLOCK...
> 	<sigh>

Yep - see above re major chain of indirect includes conditional upon CONFIG_BLOCK
and its uses in places that only build with such configs.  There's a plenty of
similar considerations outside of arch/*, unfortunately...
