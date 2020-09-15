Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAD1E26AF0D
	for <lists+linux-mips@lfdr.de>; Tue, 15 Sep 2020 23:00:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728060AbgIOVAl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 15 Sep 2020 17:00:41 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:37824 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726485AbgIOVAj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 15 Sep 2020 17:00:39 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08FKtCOv067771;
        Tue, 15 Sep 2020 20:59:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2020-01-29; bh=YGEt7QcKfNZtoOEOiLkr/H95yDxTHC70I6d+8/+mmkw=;
 b=AzBJBtXutcJ99ughp/XGVBUT+xrh8YHDn54srera5SPLIKM0Tph459J+5oA3207ERA37
 B8arsi2nSImxgdoiqlHxr/rFOWWuFG62TpXT2/y3nCPNlAXPOMRZS3OMBz/eQZi6Xg4g
 w4J9hY+Nkrjzb7g80958O1AcTtoNbTO2ShjhcxKUmnEQqptDrhx4uKQftGM01/idR3D5
 WNli2n1Lx+9gg9y8anddMTf7ubP6iqwdtPpIlGWj9ocSCSU3sv14Q2tR19uiBQ/ie5SB
 LAivtaAmghc4iJvflmqhCrzkBLk2ajuZTvKaw0g2PZZWE+0fbTnPk0mnAmQ6PjpyEFVA 0A== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 33j91dh6pd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 15 Sep 2020 20:59:14 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08FKsgaX104334;
        Tue, 15 Sep 2020 20:57:14 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3030.oracle.com with ESMTP id 33h8900wpm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 15 Sep 2020 20:57:14 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 08FKvA98004541;
        Tue, 15 Sep 2020 20:57:10 GMT
Received: from monkey.oracle.com (/50.38.35.18)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 15 Sep 2020 20:57:10 +0000
From:   Mike Kravetz <mike.kravetz@oracle.com>
To:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org
Cc:     Roman Gushchin <guro@fb.com>,
        Barry Song <song.bao.hua@hisilicon.com>,
        Mike Rapoport <rppt@kernel.org>,
        Joonsoo Kim <js1304@gmail.com>,
        Rik van Riel <riel@surriel.com>,
        Aslan Bakirov <aslan@fb.com>, Michal Hocko <mhocko@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Kravetz <mike.kravetz@oracle.com>
Subject: [PATCH] cma: make number of CMA areas dynamic, remove CONFIG_CMA_AREAS
Date:   Tue, 15 Sep 2020 13:57:03 -0700
Message-Id: <20200915205703.34572-1-mike.kravetz@oracle.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9745 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009150164
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9745 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 mlxlogscore=999
 clxscore=1011 adultscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009150164
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The number of distinct CMA areas is limited by the constant
CONFIG_CMA_AREAS.  In most environments, this was set to a default
value of 7.  Not too long ago, support was added to allocate hugetlb
gigantic pages from CMA.  More recent changes to make dma_alloc_coherent
NUMA-aware on arm64 added more potential users of CMA areas.  Along
with the dma_alloc_coherent changes, the default value of CMA_AREAS
was bumped up to 19 if NUMA is enabled.

It seems that the number of CMA users is likely to grow.  Instead of
using a static array for cma areas, use a simple linked list.  These
areas are used before normal memory allocators, so use the memblock
allocator.

Acked-by: Roman Gushchin <guro@fb.com>
Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
---
rfc->v1
  - Made minor changes suggested by Song Bao Hua (Barry Song)
  - Removed check for late calls to cma_init_reserved_mem that was part
    of RFC.
  - Added ACK from Roman Gushchin
  - Still in need of arm testing

 arch/arm/mm/dma-mapping.c              | 28 ++++++++++++-------
 arch/mips/configs/cu1000-neo_defconfig |  1 -
 arch/mips/configs/cu1830-neo_defconfig |  1 -
 include/linux/cma.h                    | 12 ---------
 mm/Kconfig                             | 12 ---------
 mm/cma.c                               | 37 +++++++++++---------------
 mm/cma.h                               |  4 +--
 mm/cma_debug.c                         |  6 ++---
 8 files changed, 39 insertions(+), 62 deletions(-)

diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index 8a8949174b1c..764286637a0b 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -383,25 +383,33 @@ postcore_initcall(atomic_pool_init);
 struct dma_contig_early_reserve {
 	phys_addr_t base;
 	unsigned long size;
+	struct list_head areas;
 };
 
-static struct dma_contig_early_reserve dma_mmu_remap[MAX_CMA_AREAS] __initdata;
-
-static int dma_mmu_remap_num __initdata;
+static __initdata LIST_HEAD(dma_mmu_remap_areas);
 
 void __init dma_contiguous_early_fixup(phys_addr_t base, unsigned long size)
 {
-	dma_mmu_remap[dma_mmu_remap_num].base = base;
-	dma_mmu_remap[dma_mmu_remap_num].size = size;
-	dma_mmu_remap_num++;
+	struct dma_contig_early_reserve *d;
+
+	d = memblock_alloc(sizeof(*d), sizeof(void *));
+	if (!d) {
+		pr_err("Unable to allocate dma_contig_early_reserve struct!\n");
+		return;
+	}
+
+	d->base = base;
+	d->size = size;
+	list_add_tail(&d->areas, &dma_mmu_remap_areas);
 }
 
 void __init dma_contiguous_remap(void)
 {
-	int i;
-	for (i = 0; i < dma_mmu_remap_num; i++) {
-		phys_addr_t start = dma_mmu_remap[i].base;
-		phys_addr_t end = start + dma_mmu_remap[i].size;
+	struct dma_contig_early_reserve *d;
+
+	list_for_each_entry(d, &dma_mmu_remap_areas, areas) {
+		phys_addr_t start = d->base;
+		phys_addr_t end = start + d->size;
 		struct map_desc map;
 		unsigned long addr;
 
diff --git a/arch/mips/configs/cu1000-neo_defconfig b/arch/mips/configs/cu1000-neo_defconfig
index e924c817f73d..b86f3fd420f2 100644
--- a/arch/mips/configs/cu1000-neo_defconfig
+++ b/arch/mips/configs/cu1000-neo_defconfig
@@ -31,7 +31,6 @@ CONFIG_HZ_100=y
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 # CONFIG_COMPACTION is not set
 CONFIG_CMA=y
-CONFIG_CMA_AREAS=7
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
diff --git a/arch/mips/configs/cu1830-neo_defconfig b/arch/mips/configs/cu1830-neo_defconfig
index cbfb62900273..98a31334fc57 100644
--- a/arch/mips/configs/cu1830-neo_defconfig
+++ b/arch/mips/configs/cu1830-neo_defconfig
@@ -31,7 +31,6 @@ CONFIG_HZ_100=y
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 # CONFIG_COMPACTION is not set
 CONFIG_CMA=y
-CONFIG_CMA_AREAS=7
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
diff --git a/include/linux/cma.h b/include/linux/cma.h
index 217999c8a762..ea9a3dab0c20 100644
--- a/include/linux/cma.h
+++ b/include/linux/cma.h
@@ -6,18 +6,6 @@
 #include <linux/types.h>
 #include <linux/numa.h>
 
-/*
- * There is always at least global CMA area and a few optional
- * areas configured in kernel .config.
- */
-#ifdef CONFIG_CMA_AREAS
-#define MAX_CMA_AREAS	(1 + CONFIG_CMA_AREAS)
-
-#else
-#define MAX_CMA_AREAS	(0)
-
-#endif
-
 #define CMA_MAX_NAME 64
 
 struct cma;
diff --git a/mm/Kconfig b/mm/Kconfig
index 7d56281ff41e..a52345093f4d 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -513,18 +513,6 @@ config CMA_DEBUGFS
 	help
 	  Turns on the DebugFS interface for CMA.
 
-config CMA_AREAS
-	int "Maximum count of the CMA areas"
-	depends on CMA
-	default 19 if NUMA
-	default 7
-	help
-	  CMA allows to create CMA areas for particular purpose, mainly,
-	  used as device private area. This parameter sets the maximum
-	  number of CMA area in the system.
-
-	  If unsure, leave the default value "7" in UMA and "19" in NUMA.
-
 config MEM_SOFT_DIRTY
 	bool "Track memory changes"
 	depends on CHECKPOINT_RESTORE && HAVE_ARCH_SOFT_DIRTY && PROC_FS
diff --git a/mm/cma.c b/mm/cma.c
index 7f415d7cda9f..f3a983acf70e 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -36,8 +36,9 @@
 
 #include "cma.h"
 
-struct cma cma_areas[MAX_CMA_AREAS];
-unsigned cma_area_count;
+/* modify here */
+LIST_HEAD(cma_areas);
+static unsigned int cma_area_count;
 static DEFINE_MUTEX(cma_mutex);
 
 phys_addr_t cma_get_base(const struct cma *cma)
@@ -143,10 +144,10 @@ static void __init cma_activate_area(struct cma *cma)
 
 static int __init cma_init_reserved_areas(void)
 {
-	int i;
+	struct cma *c;
 
-	for (i = 0; i < cma_area_count; i++)
-		cma_activate_area(&cma_areas[i]);
+	list_for_each_entry(c, &cma_areas, areas)
+		cma_activate_area(c);
 
 	return 0;
 }
@@ -172,12 +173,6 @@ int __init cma_init_reserved_mem(phys_addr_t base, phys_addr_t size,
 	struct cma *cma;
 	phys_addr_t alignment;
 
-	/* Sanity checks */
-	if (cma_area_count == ARRAY_SIZE(cma_areas)) {
-		pr_err("Not enough slots for CMA reserved regions!\n");
-		return -ENOSPC;
-	}
-
 	if (!size || !memblock_is_region_reserved(base, size))
 		return -EINVAL;
 
@@ -192,12 +187,17 @@ int __init cma_init_reserved_mem(phys_addr_t base, phys_addr_t size,
 	if (ALIGN(base, alignment) != base || ALIGN(size, alignment) != size)
 		return -EINVAL;
 
+	cma = memblock_alloc(sizeof(*cma), sizeof(long));
+	if (!cma) {
+		pr_err("Unable to allocate CMA descriptor!\n");
+		return -ENOSPC;
+	}
+	list_add_tail(&cma->areas, &cma_areas);
+
 	/*
 	 * Each reserved area must be initialised later, when more kernel
 	 * subsystems (like slab allocator) are available.
 	 */
-	cma = &cma_areas[cma_area_count];
-
 	if (name)
 		snprintf(cma->name, CMA_MAX_NAME, name);
 	else
@@ -253,11 +253,6 @@ int __init cma_declare_contiguous_nid(phys_addr_t base,
 	pr_debug("%s(size %pa, base %pa, limit %pa alignment %pa)\n",
 		__func__, &size, &base, &limit, &alignment);
 
-	if (cma_area_count == ARRAY_SIZE(cma_areas)) {
-		pr_err("Not enough slots for CMA reserved regions!\n");
-		return -ENOSPC;
-	}
-
 	if (!size)
 		return -EINVAL;
 
@@ -530,10 +525,10 @@ bool cma_release(struct cma *cma, const struct page *pages, unsigned int count)
 
 int cma_for_each_area(int (*it)(struct cma *cma, void *data), void *data)
 {
-	int i;
+	struct cma *c;
 
-	for (i = 0; i < cma_area_count; i++) {
-		int ret = it(&cma_areas[i], data);
+	list_for_each_entry(c, &cma_areas, areas) {
+		int ret = it(c, data);
 
 		if (ret)
 			return ret;
diff --git a/mm/cma.h b/mm/cma.h
index 42ae082cb067..fed800b63819 100644
--- a/mm/cma.h
+++ b/mm/cma.h
@@ -15,11 +15,11 @@ struct cma {
 	spinlock_t mem_head_lock;
 	struct debugfs_u32_array dfs_bitmap;
 #endif
+	struct list_head areas;
 	char name[CMA_MAX_NAME];
 };
 
-extern struct cma cma_areas[MAX_CMA_AREAS];
-extern unsigned cma_area_count;
+extern struct list_head cma_areas;
 
 static inline unsigned long cma_bitmap_maxno(struct cma *cma)
 {
diff --git a/mm/cma_debug.c b/mm/cma_debug.c
index d5bf8aa34fdc..c39695d50224 100644
--- a/mm/cma_debug.c
+++ b/mm/cma_debug.c
@@ -188,12 +188,12 @@ static void cma_debugfs_add_one(struct cma *cma, struct dentry *root_dentry)
 static int __init cma_debugfs_init(void)
 {
 	struct dentry *cma_debugfs_root;
-	int i;
+	struct cma *c;
 
 	cma_debugfs_root = debugfs_create_dir("cma", NULL);
 
-	for (i = 0; i < cma_area_count; i++)
-		cma_debugfs_add_one(&cma_areas[i], cma_debugfs_root);
+	list_for_each_entry(c, &cma_areas, areas)
+		cma_debugfs_add_one(c, cma_debugfs_root);
 
 	return 0;
 }
-- 
2.25.4

