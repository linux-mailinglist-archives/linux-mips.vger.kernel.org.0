Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 713C326C03C
	for <lists+linux-mips@lfdr.de>; Wed, 16 Sep 2020 11:14:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726243AbgIPJOW convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Wed, 16 Sep 2020 05:14:22 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3538 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726129AbgIPJOV (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 16 Sep 2020 05:14:21 -0400
Received: from DGGEMM404-HUB.china.huawei.com (unknown [172.30.72.55])
        by Forcepoint Email with ESMTP id 3DC80E41686E63E88B37;
        Wed, 16 Sep 2020 17:14:17 +0800 (CST)
Received: from dggemi761-chm.china.huawei.com (10.1.198.147) by
 DGGEMM404-HUB.china.huawei.com (10.3.20.212) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Wed, 16 Sep 2020 17:14:17 +0800
Received: from dggemi761-chm.china.huawei.com (10.1.198.147) by
 dggemi761-chm.china.huawei.com (10.1.198.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Wed, 16 Sep 2020 17:14:16 +0800
Received: from dggemi761-chm.china.huawei.com ([10.9.49.202]) by
 dggemi761-chm.china.huawei.com ([10.9.49.202]) with mapi id 15.01.1913.007;
 Wed, 16 Sep 2020 17:14:16 +0800
From:   "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
To:     Mike Kravetz <mike.kravetz@oracle.com>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Roman Gushchin <guro@fb.com>, Mike Rapoport <rppt@kernel.org>,
        Joonsoo Kim <js1304@gmail.com>,
        Rik van Riel <riel@surriel.com>,
        Aslan Bakirov <aslan@fb.com>, Michal Hocko <mhocko@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Will Deacon <will@kernel.org>
Subject: RE: [PATCH] cma: make number of CMA areas dynamic, remove
 CONFIG_CMA_AREAS
Thread-Topic: [PATCH] cma: make number of CMA areas dynamic, remove
 CONFIG_CMA_AREAS
Thread-Index: AQHWi6MmbaTsa4oYpkCWXNyUO1XFb6lqyD6wgAAxSgA=
Date:   Wed, 16 Sep 2020 09:14:16 +0000
Message-ID: <4b7b14c9eb6a42509f8324f7ed84b46f@hisilicon.com>
References: <20200915205703.34572-1-mike.kravetz@oracle.com> 
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.203.18]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



> -----Original Message-----
> From: Song Bao Hua (Barry Song)
> Sent: Wednesday, September 16, 2020 6:18 PM
> To: 'Mike Kravetz' <mike.kravetz@oracle.com>; linux-mm@kvack.org;
> linux-kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> linux-mips@vger.kernel.org
> Cc: Roman Gushchin <guro@fb.com>; Mike Rapoport <rppt@kernel.org>;
> Joonsoo Kim <js1304@gmail.com>; Rik van Riel <riel@surriel.com>; Aslan
> Bakirov <aslan@fb.com>; Michal Hocko <mhocko@kernel.org>; Andrew
> Morton <akpm@linux-foundation.org>
> Subject: RE: [PATCH] cma: make number of CMA areas dynamic, remove
> CONFIG_CMA_AREAS
> 
> 
> 
> > -----Original Message-----
> > From: Mike Kravetz [mailto:mike.kravetz@oracle.com]
> > Sent: Wednesday, September 16, 2020 8:57 AM
> > To: linux-mm@kvack.org; linux-kernel@vger.kernel.org;
> > linux-arm-kernel@lists.infradead.org; linux-mips@vger.kernel.org
> > Cc: Roman Gushchin <guro@fb.com>; Song Bao Hua (Barry Song)
> > <song.bao.hua@hisilicon.com>; Mike Rapoport <rppt@kernel.org>; Joonsoo
> > Kim <js1304@gmail.com>; Rik van Riel <riel@surriel.com>; Aslan Bakirov
> > <aslan@fb.com>; Michal Hocko <mhocko@kernel.org>; Andrew Morton
> > <akpm@linux-foundation.org>; Mike Kravetz <mike.kravetz@oracle.com>
> > Subject: [PATCH] cma: make number of CMA areas dynamic, remove
> > CONFIG_CMA_AREAS
> >
> > The number of distinct CMA areas is limited by the constant
> > CONFIG_CMA_AREAS.  In most environments, this was set to a default
> > value of 7.  Not too long ago, support was added to allocate hugetlb
> > gigantic pages from CMA.  More recent changes to make
> dma_alloc_coherent
> > NUMA-aware on arm64 added more potential users of CMA areas.  Along
> > with the dma_alloc_coherent changes, the default value of CMA_AREAS
> > was bumped up to 19 if NUMA is enabled.
> >
> > It seems that the number of CMA users is likely to grow.  Instead of
> > using a static array for cma areas, use a simple linked list.  These
> > areas are used before normal memory allocators, so use the memblock
> > allocator.
> >
> > Acked-by: Roman Gushchin <guro@fb.com>
> > Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
> > ---
> > rfc->v1
> >   - Made minor changes suggested by Song Bao Hua (Barry Song)
> >   - Removed check for late calls to cma_init_reserved_mem that was part
> >     of RFC.
> >   - Added ACK from Roman Gushchin
> >   - Still in need of arm testing
> 
> Unfortunately, the test result on my arm64 board is negative, Linux can't boot
> after applying
> this patch.
> 
> I guess we have to hold on this patch for a while till this is fixed. BTW, Mike, do
> you have
> a qemu-based arm64 numa system to debug? It is very easy to reproduce, we
> don't need to
> use hugetlb_cma and pernuma_cma. Just the default cma will make the boot
> hang.

Hi Mike,
I spent some time on debugging the boot issue and sent a patch here:
https://lore.kernel.org/linux-mm/20200916085933.25220-1-song.bao.hua@hisilicon.com/
All details and knic oops can be found there.
pls feel free to merge my patch into your v2 if you want. And we probably need ack from
arm maintainers.

Also,  +Will,

Hi Will, the whole story is that Mike tried to remove the cma array with CONFIG_CMA_AREAS
and moved to use memblock_alloc() to allocate cma area, so that the number of cma areas
could be dynamic. It turns out it causes a kernel panic on arm64 during system boot as the
returned address from memblock_alloc is invalid before paging_init() is done on arm64.

> 
> >
> >  arch/arm/mm/dma-mapping.c              | 28 ++++++++++++-------
> >  arch/mips/configs/cu1000-neo_defconfig |  1 -
> >  arch/mips/configs/cu1830-neo_defconfig |  1 -
> >  include/linux/cma.h                    | 12 ---------
> >  mm/Kconfig                             | 12 ---------
> >  mm/cma.c                               | 37
> +++++++++++---------------
> >  mm/cma.h                               |  4 +--
> >  mm/cma_debug.c                         |  6 ++---
> >  8 files changed, 39 insertions(+), 62 deletions(-)
> >
> > diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
> > index 8a8949174b1c..764286637a0b 100644
> > --- a/arch/arm/mm/dma-mapping.c
> > +++ b/arch/arm/mm/dma-mapping.c
> > @@ -383,25 +383,33 @@ postcore_initcall(atomic_pool_init);
> >  struct dma_contig_early_reserve {
> >  	phys_addr_t base;
> >  	unsigned long size;
> > +	struct list_head areas;
> >  };
> >
> > -static struct dma_contig_early_reserve
> dma_mmu_remap[MAX_CMA_AREAS]
> > __initdata;
> > -
> > -static int dma_mmu_remap_num __initdata;
> > +static __initdata LIST_HEAD(dma_mmu_remap_areas);
> >
> >  void __init dma_contiguous_early_fixup(phys_addr_t base, unsigned long
> > size)
> >  {
> > -	dma_mmu_remap[dma_mmu_remap_num].base = base;
> > -	dma_mmu_remap[dma_mmu_remap_num].size = size;
> > -	dma_mmu_remap_num++;
> > +	struct dma_contig_early_reserve *d;
> > +
> > +	d = memblock_alloc(sizeof(*d), sizeof(void *));
> > +	if (!d) {
> > +		pr_err("Unable to allocate dma_contig_early_reserve struct!\n");
> > +		return;
> > +	}
> > +
> > +	d->base = base;
> > +	d->size = size;
> > +	list_add_tail(&d->areas, &dma_mmu_remap_areas);
> >  }
> >
> >  void __init dma_contiguous_remap(void)
> >  {
> > -	int i;
> > -	for (i = 0; i < dma_mmu_remap_num; i++) {
> > -		phys_addr_t start = dma_mmu_remap[i].base;
> > -		phys_addr_t end = start + dma_mmu_remap[i].size;
> > +	struct dma_contig_early_reserve *d;
> > +
> > +	list_for_each_entry(d, &dma_mmu_remap_areas, areas) {
> > +		phys_addr_t start = d->base;
> > +		phys_addr_t end = start + d->size;
> >  		struct map_desc map;
> >  		unsigned long addr;
> >
> > diff --git a/arch/mips/configs/cu1000-neo_defconfig
> > b/arch/mips/configs/cu1000-neo_defconfig
> > index e924c817f73d..b86f3fd420f2 100644
> > --- a/arch/mips/configs/cu1000-neo_defconfig
> > +++ b/arch/mips/configs/cu1000-neo_defconfig
> > @@ -31,7 +31,6 @@ CONFIG_HZ_100=y
> >  # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
> >  # CONFIG_COMPACTION is not set
> >  CONFIG_CMA=y
> > -CONFIG_CMA_AREAS=7
> >  CONFIG_NET=y
> >  CONFIG_PACKET=y
> >  CONFIG_UNIX=y
> > diff --git a/arch/mips/configs/cu1830-neo_defconfig
> > b/arch/mips/configs/cu1830-neo_defconfig
> > index cbfb62900273..98a31334fc57 100644
> > --- a/arch/mips/configs/cu1830-neo_defconfig
> > +++ b/arch/mips/configs/cu1830-neo_defconfig
> > @@ -31,7 +31,6 @@ CONFIG_HZ_100=y
> >  # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
> >  # CONFIG_COMPACTION is not set
> >  CONFIG_CMA=y
> > -CONFIG_CMA_AREAS=7
> >  CONFIG_NET=y
> >  CONFIG_PACKET=y
> >  CONFIG_UNIX=y
> > diff --git a/include/linux/cma.h b/include/linux/cma.h
> > index 217999c8a762..ea9a3dab0c20 100644
> > --- a/include/linux/cma.h
> > +++ b/include/linux/cma.h
> > @@ -6,18 +6,6 @@
> >  #include <linux/types.h>
> >  #include <linux/numa.h>
> >
> > -/*
> > - * There is always at least global CMA area and a few optional
> > - * areas configured in kernel .config.
> > - */
> > -#ifdef CONFIG_CMA_AREAS
> > -#define MAX_CMA_AREAS	(1 + CONFIG_CMA_AREAS)
> > -
> > -#else
> > -#define MAX_CMA_AREAS	(0)
> > -
> > -#endif
> > -
> >  #define CMA_MAX_NAME 64
> >
> >  struct cma;
> > diff --git a/mm/Kconfig b/mm/Kconfig
> > index 7d56281ff41e..a52345093f4d 100644
> > --- a/mm/Kconfig
> > +++ b/mm/Kconfig
> > @@ -513,18 +513,6 @@ config CMA_DEBUGFS
> >  	help
> >  	  Turns on the DebugFS interface for CMA.
> >
> > -config CMA_AREAS
> > -	int "Maximum count of the CMA areas"
> > -	depends on CMA
> > -	default 19 if NUMA
> > -	default 7
> > -	help
> > -	  CMA allows to create CMA areas for particular purpose, mainly,
> > -	  used as device private area. This parameter sets the maximum
> > -	  number of CMA area in the system.
> > -
> > -	  If unsure, leave the default value "7" in UMA and "19" in NUMA.
> > -
> >  config MEM_SOFT_DIRTY
> >  	bool "Track memory changes"
> >  	depends on CHECKPOINT_RESTORE && HAVE_ARCH_SOFT_DIRTY &&
> > PROC_FS
> > diff --git a/mm/cma.c b/mm/cma.c
> > index 7f415d7cda9f..f3a983acf70e 100644
> > --- a/mm/cma.c
> > +++ b/mm/cma.c
> > @@ -36,8 +36,9 @@
> >
> >  #include "cma.h"
> >
> > -struct cma cma_areas[MAX_CMA_AREAS];
> > -unsigned cma_area_count;
> > +/* modify here */
> > +LIST_HEAD(cma_areas);
> > +static unsigned int cma_area_count;
> >  static DEFINE_MUTEX(cma_mutex);
> >
> >  phys_addr_t cma_get_base(const struct cma *cma)
> > @@ -143,10 +144,10 @@ static void __init cma_activate_area(struct cma
> > *cma)
> >
> >  static int __init cma_init_reserved_areas(void)
> >  {
> > -	int i;
> > +	struct cma *c;
> >
> > -	for (i = 0; i < cma_area_count; i++)
> > -		cma_activate_area(&cma_areas[i]);
> > +	list_for_each_entry(c, &cma_areas, areas)
> > +		cma_activate_area(c);
> >
> >  	return 0;
> >  }
> > @@ -172,12 +173,6 @@ int __init cma_init_reserved_mem(phys_addr_t
> base,
> > phys_addr_t size,
> >  	struct cma *cma;
> >  	phys_addr_t alignment;
> >
> > -	/* Sanity checks */
> > -	if (cma_area_count == ARRAY_SIZE(cma_areas)) {
> > -		pr_err("Not enough slots for CMA reserved regions!\n");
> > -		return -ENOSPC;
> > -	}
> > -
> >  	if (!size || !memblock_is_region_reserved(base, size))
> >  		return -EINVAL;
> >
> > @@ -192,12 +187,17 @@ int __init cma_init_reserved_mem(phys_addr_t
> > base, phys_addr_t size,
> >  	if (ALIGN(base, alignment) != base || ALIGN(size, alignment) != size)
> >  		return -EINVAL;
> >
> > +	cma = memblock_alloc(sizeof(*cma), sizeof(long));
> > +	if (!cma) {
> > +		pr_err("Unable to allocate CMA descriptor!\n");
> > +		return -ENOSPC;
> > +	}
> > +	list_add_tail(&cma->areas, &cma_areas);
> > +
> >  	/*
> >  	 * Each reserved area must be initialised later, when more kernel
> >  	 * subsystems (like slab allocator) are available.
> >  	 */
> > -	cma = &cma_areas[cma_area_count];
> > -
> >  	if (name)
> >  		snprintf(cma->name, CMA_MAX_NAME, name);
> >  	else
> > @@ -253,11 +253,6 @@ int __init
> cma_declare_contiguous_nid(phys_addr_t
> > base,
> >  	pr_debug("%s(size %pa, base %pa, limit %pa alignment %pa)\n",
> >  		__func__, &size, &base, &limit, &alignment);
> >
> > -	if (cma_area_count == ARRAY_SIZE(cma_areas)) {
> > -		pr_err("Not enough slots for CMA reserved regions!\n");
> > -		return -ENOSPC;
> > -	}
> > -
> >  	if (!size)
> >  		return -EINVAL;
> >
> > @@ -530,10 +525,10 @@ bool cma_release(struct cma *cma, const struct
> > page *pages, unsigned int count)
> >
> >  int cma_for_each_area(int (*it)(struct cma *cma, void *data), void *data)
> >  {
> > -	int i;
> > +	struct cma *c;
> >
> > -	for (i = 0; i < cma_area_count; i++) {
> > -		int ret = it(&cma_areas[i], data);
> > +	list_for_each_entry(c, &cma_areas, areas) {
> > +		int ret = it(c, data);
> >
> >  		if (ret)
> >  			return ret;
> > diff --git a/mm/cma.h b/mm/cma.h
> > index 42ae082cb067..fed800b63819 100644
> > --- a/mm/cma.h
> > +++ b/mm/cma.h
> > @@ -15,11 +15,11 @@ struct cma {
> >  	spinlock_t mem_head_lock;
> >  	struct debugfs_u32_array dfs_bitmap;
> >  #endif
> > +	struct list_head areas;
> >  	char name[CMA_MAX_NAME];
> >  };
> >
> > -extern struct cma cma_areas[MAX_CMA_AREAS];
> > -extern unsigned cma_area_count;
> > +extern struct list_head cma_areas;
> >
> >  static inline unsigned long cma_bitmap_maxno(struct cma *cma)
> >  {
> > diff --git a/mm/cma_debug.c b/mm/cma_debug.c
> > index d5bf8aa34fdc..c39695d50224 100644
> > --- a/mm/cma_debug.c
> > +++ b/mm/cma_debug.c
> > @@ -188,12 +188,12 @@ static void cma_debugfs_add_one(struct cma
> *cma,
> > struct dentry *root_dentry)
> >  static int __init cma_debugfs_init(void)
> >  {
> >  	struct dentry *cma_debugfs_root;
> > -	int i;
> > +	struct cma *c;
> >
> >  	cma_debugfs_root = debugfs_create_dir("cma", NULL);
> >
> > -	for (i = 0; i < cma_area_count; i++)
> > -		cma_debugfs_add_one(&cma_areas[i], cma_debugfs_root);
> > +	list_for_each_entry(c, &cma_areas, areas)
> > +		cma_debugfs_add_one(c, cma_debugfs_root);
> >
> >  	return 0;
> >  }
> > --
> > 2.25.4

Thanks
Barry

