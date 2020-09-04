Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2415A25CF2D
	for <lists+linux-mips@lfdr.de>; Fri,  4 Sep 2020 03:58:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729507AbgIDB60 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Thu, 3 Sep 2020 21:58:26 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:3499 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728484AbgIDB6Z (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 3 Sep 2020 21:58:25 -0400
Received: from DGGEMM406-HUB.china.huawei.com (unknown [172.30.72.55])
        by Forcepoint Email with ESMTP id 405E8A5929C0D77BF2C8;
        Fri,  4 Sep 2020 09:58:21 +0800 (CST)
Received: from dggemi712-chm.china.huawei.com (10.3.20.111) by
 DGGEMM406-HUB.china.huawei.com (10.3.20.214) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Fri, 4 Sep 2020 09:58:20 +0800
Received: from dggemi761-chm.china.huawei.com (10.1.198.147) by
 dggemi712-chm.china.huawei.com (10.3.20.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Fri, 4 Sep 2020 09:58:20 +0800
Received: from dggemi761-chm.china.huawei.com ([10.9.49.202]) by
 dggemi761-chm.china.huawei.com ([10.9.49.202]) with mapi id 15.01.1913.007;
 Fri, 4 Sep 2020 09:58:20 +0800
From:   "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
To:     Mike Kravetz <mike.kravetz@oracle.com>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Roman Gushchin <guro@fb.com>, Joonsoo Kim <js1304@gmail.com>,
        Rik van Riel <riel@surriel.com>,
        Aslan Bakirov <aslan@fb.com>, Michal Hocko <mhocko@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: RE: [RFC PATCH] cma: make number of CMA areas dynamic, remove
 CONFIG_CMA_AREAS
Thread-Topic: [RFC PATCH] cma: make number of CMA areas dynamic, remove
 CONFIG_CMA_AREAS
Thread-Index: AQHWgZ6q5kW1Gz5+A0q7Q/uhiyJlbalXnXHA
Date:   Fri, 4 Sep 2020 01:58:20 +0000
Message-ID: <6b4f0324c6db41a7975267f2ec42e577@hisilicon.com>
References: <20200903030204.253433-1-mike.kravetz@oracle.com>
In-Reply-To: <20200903030204.253433-1-mike.kravetz@oracle.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.203.41]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



> -----Original Message-----
> From: Mike Kravetz [mailto:mike.kravetz@oracle.com]
> Sent: Thursday, September 3, 2020 3:02 PM
> To: linux-mm@kvack.org; linux-kernel@vger.kernel.org;
> linux-arm-kernel@lists.infradead.org; linux-mips@vger.kernel.org
> Cc: Roman Gushchin <guro@fb.com>; Song Bao Hua (Barry Song)
> <song.bao.hua@hisilicon.com>; Joonsoo Kim <js1304@gmail.com>; Rik van
> Riel <riel@surriel.com>; Aslan Bakirov <aslan@fb.com>; Michal Hocko
> <mhocko@kernel.org>; Andrew Morton <akpm@linux-foundation.org>; Mike
> Kravetz <mike.kravetz@oracle.com>
> Subject: [RFC PATCH] cma: make number of CMA areas dynamic, remove
> CONFIG_CMA_AREAS
> 
> The number of distinct CMA areas is limited by the constant
> CONFIG_CMA_AREAS.  In most environments, this was set to a default
> value of 7.  Not too long ago, support was added to allocate hugetlb
> gigantic pages from CMA.  More recent changes to make dma_alloc_coherent
> NUMA-aware on arm64 added more potential users of CMA areas.  Along
> with the dma_alloc_coherent changes, the default value of CMA_AREAS
> was bumped up to 19 if NUMA is enabled.
> 
> It seems that the number of CMA users is likely to grow.  Instead of
> using a static array for cma areas, use a simple linked list.  These
> areas are used before normal memory allocators, so use the memblock
> allocator.

Hello Mike, It seems it is a good idea. Thanks for addressing this.

I was focusing on per-numa cma feature in my patchset and I didn't take care of this
while I thought we should do something for the number of cma areas.

> 
> Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
> ---
>  arch/arm/mm/dma-mapping.c              | 29 ++++++++++++-------
>  arch/mips/configs/cu1000-neo_defconfig |  1 -
>  arch/mips/configs/cu1830-neo_defconfig |  1 -
>  include/linux/cma.h                    | 12 --------
>  mm/Kconfig                             | 12 --------
>  mm/cma.c                               | 40 +++++++++++++-------------
>  mm/cma.h                               |  4 +--
>  mm/cma_debug.c                         |  6 ++--
>  8 files changed, 44 insertions(+), 61 deletions(-)
> 
> diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
> index 8a8949174b1c..a35a760cc0f4 100644
> --- a/arch/arm/mm/dma-mapping.c
> +++ b/arch/arm/mm/dma-mapping.c
> @@ -383,25 +383,34 @@ postcore_initcall(atomic_pool_init);
>  struct dma_contig_early_reserve {
>  	phys_addr_t base;
>  	unsigned long size;
> +	struct list_head areas;
>  };
> 
> -static struct dma_contig_early_reserve dma_mmu_remap[MAX_CMA_AREAS]
> __initdata;
> -
> -static int dma_mmu_remap_num __initdata;
> +static __initdata LIST_HEAD(dma_mmu_remap_areas);
> 
>  void __init dma_contiguous_early_fixup(phys_addr_t base, unsigned long
> size)
>  {
> -	dma_mmu_remap[dma_mmu_remap_num].base = base;
> -	dma_mmu_remap[dma_mmu_remap_num].size = size;
> -	dma_mmu_remap_num++;
> +	struct dma_contig_early_reserve *d;
> +
> +	d = memblock_alloc(sizeof(struct dma_contig_early_reserve),

sizeof(*d)?

> +			sizeof(void *));
> +	if (!d) {
> +		pr_err("Unable to allocate dma_contig_early_reserve struct!\n");
> +		return;
> +	}
> +
> +	d->base = base;
> +	d->size = size;
> +	list_add_tail(&d->areas, &dma_mmu_remap_areas);
>  }
> 
>  void __init dma_contiguous_remap(void)
>  {
> -	int i;
> -	for (i = 0; i < dma_mmu_remap_num; i++) {
> -		phys_addr_t start = dma_mmu_remap[i].base;
> -		phys_addr_t end = start + dma_mmu_remap[i].size;
> +	struct dma_contig_early_reserve *d;
> +
> +	list_for_each_entry(d, &dma_mmu_remap_areas, areas) {
> +		phys_addr_t start = d->base;
> +		phys_addr_t end = start + d->size;
>  		struct map_desc map;
>  		unsigned long addr;
> 
> diff --git a/arch/mips/configs/cu1000-neo_defconfig
> b/arch/mips/configs/cu1000-neo_defconfig
> index e924c817f73d..b86f3fd420f2 100644
> --- a/arch/mips/configs/cu1000-neo_defconfig
> +++ b/arch/mips/configs/cu1000-neo_defconfig
> @@ -31,7 +31,6 @@ CONFIG_HZ_100=y
>  # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
>  # CONFIG_COMPACTION is not set
>  CONFIG_CMA=y
> -CONFIG_CMA_AREAS=7
>  CONFIG_NET=y
>  CONFIG_PACKET=y
>  CONFIG_UNIX=y
> diff --git a/arch/mips/configs/cu1830-neo_defconfig
> b/arch/mips/configs/cu1830-neo_defconfig
> index cbfb62900273..98a31334fc57 100644
> --- a/arch/mips/configs/cu1830-neo_defconfig
> +++ b/arch/mips/configs/cu1830-neo_defconfig
> @@ -31,7 +31,6 @@ CONFIG_HZ_100=y
>  # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
>  # CONFIG_COMPACTION is not set
>  CONFIG_CMA=y
> -CONFIG_CMA_AREAS=7
>  CONFIG_NET=y
>  CONFIG_PACKET=y
>  CONFIG_UNIX=y
> diff --git a/include/linux/cma.h b/include/linux/cma.h
> index 217999c8a762..ea9a3dab0c20 100644
> --- a/include/linux/cma.h
> +++ b/include/linux/cma.h
> @@ -6,18 +6,6 @@
>  #include <linux/types.h>
>  #include <linux/numa.h>
> 
> -/*
> - * There is always at least global CMA area and a few optional
> - * areas configured in kernel .config.
> - */
> -#ifdef CONFIG_CMA_AREAS
> -#define MAX_CMA_AREAS	(1 + CONFIG_CMA_AREAS)
> -
> -#else
> -#define MAX_CMA_AREAS	(0)
> -
> -#endif
> -
>  #define CMA_MAX_NAME 64
> 
>  struct cma;
> diff --git a/mm/Kconfig b/mm/Kconfig
> index 7d56281ff41e..a52345093f4d 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -513,18 +513,6 @@ config CMA_DEBUGFS
>  	help
>  	  Turns on the DebugFS interface for CMA.
> 
> -config CMA_AREAS
> -	int "Maximum count of the CMA areas"
> -	depends on CMA
> -	default 19 if NUMA
> -	default 7
> -	help
> -	  CMA allows to create CMA areas for particular purpose, mainly,
> -	  used as device private area. This parameter sets the maximum
> -	  number of CMA area in the system.
> -
> -	  If unsure, leave the default value "7" in UMA and "19" in NUMA.
> -
>  config MEM_SOFT_DIRTY
>  	bool "Track memory changes"
>  	depends on CHECKPOINT_RESTORE && HAVE_ARCH_SOFT_DIRTY &&
> PROC_FS
> diff --git a/mm/cma.c b/mm/cma.c
> index 7f415d7cda9f..2bd61137b2ca 100644
> --- a/mm/cma.c
> +++ b/mm/cma.c
> @@ -36,8 +36,9 @@
> 
>  #include "cma.h"
> 
> -struct cma cma_areas[MAX_CMA_AREAS];
> -unsigned cma_area_count;
> +/* modify here */
> +LIST_HEAD(cma_areas);
> +static unsigned int cma_area_count;
>  static DEFINE_MUTEX(cma_mutex);
> 
>  phys_addr_t cma_get_base(const struct cma *cma)
> @@ -143,10 +144,10 @@ static void __init cma_activate_area(struct cma
> *cma)
> 
>  static int __init cma_init_reserved_areas(void)
>  {
> -	int i;
> +	struct cma *c;
> 
> -	for (i = 0; i < cma_area_count; i++)
> -		cma_activate_area(&cma_areas[i]);
> +	list_for_each_entry(c, &cma_areas, areas)
> +		cma_activate_area(c);
> 
>  	return 0;
>  }
> @@ -172,15 +173,14 @@ int __init cma_init_reserved_mem(phys_addr_t
> base, phys_addr_t size,
>  	struct cma *cma;
>  	phys_addr_t alignment;
> 
> -	/* Sanity checks */
> -	if (cma_area_count == ARRAY_SIZE(cma_areas)) {
> -		pr_err("Not enough slots for CMA reserved regions!\n");
> -		return -ENOSPC;
> -	}
> +	/* Do not attempt allocations after memblock allocator is torn down */
> +	if (slab_is_available())
> +		return -EINVAL;
> 
>  	if (!size || !memblock_is_region_reserved(base, size))
>  		return -EINVAL;
> 
> +

Is this empty line relevant?

>  	/* ensure minimal alignment required by mm core */
>  	alignment = PAGE_SIZE <<
>  			max_t(unsigned long, MAX_ORDER - 1, pageblock_order);
> @@ -192,12 +192,17 @@ int __init cma_init_reserved_mem(phys_addr_t
> base, phys_addr_t size,
>  	if (ALIGN(base, alignment) != base || ALIGN(size, alignment) != size)
>  		return -EINVAL;
> 
> +	cma = memblock_alloc(sizeof(struct cma), sizeof(long));

sizeof(*cma)?

It seems we are going to write cma-> count, order_per_bit, debugfs fields.
To avoid false sharing of the cacheline of struct cma, it is better to align with
SMP_CACHE_BYTES.

On the other hand, it seems we are unlikely to write the cma 
> +	if (!cma) {
> +		pr_err("Unable to allocate CMA descriptor!\n");
> +		return -ENOSPC;
> +	}
> +	list_add_tail(&cma->areas, &cma_areas);
> +
>  	/*
>  	 * Each reserved area must be initialised later, when more kernel
>  	 * subsystems (like slab allocator) are available.
>  	 */
> -	cma = &cma_areas[cma_area_count];
> -
>  	if (name)
>  		snprintf(cma->name, CMA_MAX_NAME, name);
>  	else
> @@ -253,11 +258,6 @@ int __init cma_declare_contiguous_nid(phys_addr_t
> base,
>  	pr_debug("%s(size %pa, base %pa, limit %pa alignment %pa)\n",
>  		__func__, &size, &base, &limit, &alignment);
> 
> -	if (cma_area_count == ARRAY_SIZE(cma_areas)) {
> -		pr_err("Not enough slots for CMA reserved regions!\n");
> -		return -ENOSPC;
> -	}
> -
>  	if (!size)
>  		return -EINVAL;
> 
> @@ -530,10 +530,10 @@ bool cma_release(struct cma *cma, const struct
> page *pages, unsigned int count)
> 
>  int cma_for_each_area(int (*it)(struct cma *cma, void *data), void *data)
>  {
> -	int i;
> +	struct cma *c;
> 
> -	for (i = 0; i < cma_area_count; i++) {
> -		int ret = it(&cma_areas[i], data);
> +	list_for_each_entry(c, &cma_areas, areas) {
> +		int ret = it(c, data);
> 
>  		if (ret)
>  			return ret;
> diff --git a/mm/cma.h b/mm/cma.h
> index 42ae082cb067..fed800b63819 100644
> --- a/mm/cma.h
> +++ b/mm/cma.h
> @@ -15,11 +15,11 @@ struct cma {
>  	spinlock_t mem_head_lock;
>  	struct debugfs_u32_array dfs_bitmap;
>  #endif
> +	struct list_head areas;
>  	char name[CMA_MAX_NAME];
>  };
> 
> -extern struct cma cma_areas[MAX_CMA_AREAS];
> -extern unsigned cma_area_count;
> +extern struct list_head cma_areas;
> 
>  static inline unsigned long cma_bitmap_maxno(struct cma *cma)
>  {
> diff --git a/mm/cma_debug.c b/mm/cma_debug.c
> index d5bf8aa34fdc..c39695d50224 100644
> --- a/mm/cma_debug.c
> +++ b/mm/cma_debug.c
> @@ -188,12 +188,12 @@ static void cma_debugfs_add_one(struct cma *cma,
> struct dentry *root_dentry)
>  static int __init cma_debugfs_init(void)
>  {
>  	struct dentry *cma_debugfs_root;
> -	int i;
> +	struct cma *c;
> 
>  	cma_debugfs_root = debugfs_create_dir("cma", NULL);
> 
> -	for (i = 0; i < cma_area_count; i++)
> -		cma_debugfs_add_one(&cma_areas[i], cma_debugfs_root);
> +	list_for_each_entry(c, &cma_areas, areas)
> +		cma_debugfs_add_one(c, cma_debugfs_root);
> 
>  	return 0;
>  }
> --
> 2.25.4

Thanks
Barry

