Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B18B14582B6
	for <lists+linux-mips@lfdr.de>; Sun, 21 Nov 2021 10:25:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237964AbhKUJ2T (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 21 Nov 2021 04:28:19 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:31892 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237930AbhKUJ2P (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 21 Nov 2021 04:28:15 -0500
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.55])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HxlHF09J3zcZxc;
        Sun, 21 Nov 2021 17:20:09 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sun, 21 Nov 2021 17:25:07 +0800
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sun, 21 Nov 2021 17:25:05 +0800
From:   Kefeng Wang <wangkefeng.wang@huawei.com>
To:     <dennis@kernel.org>, <akpm@linux-foundation.org>,
        <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>
CC:     <tj@kernel.org>, <gregkh@linuxfoundation.org>, <cl@linux.com>,
        <catalin.marinas@arm.com>, <will@kernel.org>,
        <tsbogend@alpha.franken.de>, <mpe@ellerman.id.au>,
        <benh@kernel.crashing.org>, <paulus@samba.org>,
        <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <davem@davemloft.net>,
        <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
        <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-ia64@vger.kernel.org>, <linux-mips@vger.kernel.org>,
        <linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
        <sparclinux@vger.kernel.org>, <x86@kernel.org>,
        Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: [PATCH RFC 2/4] mm: percpu: Add pcpu_fc_cpu_to_node_fn_t typedef
Date:   Sun, 21 Nov 2021 17:35:55 +0800
Message-ID: <20211121093557.139034-3-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211121093557.139034-1-wangkefeng.wang@huawei.com>
References: <20211121093557.139034-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add pcpu_fc_cpu_to_node_fn_t and pass it into pcpu_fc_alloc_fn_t,
pcpu first chunk allocation will call it to alloc memblock on the
corresponding node by it.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/mips/mm/init.c            | 12 +++++++++---
 arch/powerpc/kernel/setup_64.c | 14 +++++++++++---
 arch/sparc/kernel/smp_64.c     |  8 +++++---
 arch/x86/kernel/setup_percpu.c | 18 +++++++++++++-----
 drivers/base/arch_numa.c       |  8 +++++---
 include/linux/percpu.h         |  7 +++++--
 mm/percpu.c                    | 14 +++++++++-----
 7 files changed, 57 insertions(+), 24 deletions(-)

diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
index 325e1552cbea..ebbf6923532c 100644
--- a/arch/mips/mm/init.c
+++ b/arch/mips/mm/init.c
@@ -519,12 +519,17 @@ static int __init pcpu_cpu_distance(unsigned int from, unsigned int to)
 	return node_distance(cpu_to_node(from), cpu_to_node(to));
 }
 
-static void * __init pcpu_fc_alloc(unsigned int cpu, size_t size,
-				       size_t align)
+static int __init pcpu_cpu_to_node(int cpu)
+{
+	return cpu_to_node(cpu);
+}
+
+static void * __init pcpu_fc_alloc(unsigned int cpu, size_t size, size_t align,
+				   pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn)
 {
 	return memblock_alloc_try_nid(size, align, __pa(MAX_DMA_ADDRESS),
 				      MEMBLOCK_ALLOC_ACCESSIBLE,
-				      cpu_to_node(cpu));
+				      cpu_to_nd_fun(cpu));
 }
 
 static void __init pcpu_fc_free(void *ptr, size_t size)
@@ -545,6 +550,7 @@ void __init setup_per_cpu_areas(void)
 	rc = pcpu_embed_first_chunk(PERCPU_MODULE_RESERVE,
 				    PERCPU_DYNAMIC_RESERVE, PAGE_SIZE,
 				    pcpu_cpu_distance,
+				    pcpu_cpu_to_node,
 				    pcpu_fc_alloc, pcpu_fc_free);
 	if (rc < 0)
 		panic("Failed to initialize percpu areas.");
diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index 6052f5d5ded3..9a5609c821df 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -771,6 +771,12 @@ void __init emergency_stack_init(void)
 }
 
 #ifdef CONFIG_SMP
+
+static __init int pcpu_cpu_to_node(int cpu)
+{
+	return IS_ENABLED(CONFIG_NUMA) ? early_cpu_to_node(cpu) : NUMA_NO_NODE;
+}
+
 /**
  * pcpu_alloc_bootmem - NUMA friendly alloc_bootmem wrapper for percpu
  * @cpu: cpu to allocate for
@@ -784,12 +790,12 @@ void __init emergency_stack_init(void)
  * RETURNS:
  * Pointer to the allocated area on success, NULL on failure.
  */
-static void * __init pcpu_alloc_bootmem(unsigned int cpu, size_t size,
-					size_t align)
+static void * __init pcpu_alloc_bootmem(unsigned int cpu, size_t size, size_t align,
+					pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn)
 {
 	const unsigned long goal = __pa(MAX_DMA_ADDRESS);
 #ifdef CONFIG_NUMA
-	int node = early_cpu_to_node(cpu);
+	int node = cpu_to_nd_fun(cpu);
 	void *ptr;
 
 	if (!node_online(node) || !NODE_DATA(node)) {
@@ -891,6 +897,7 @@ void __init setup_per_cpu_areas(void)
 
 	if (pcpu_chosen_fc != PCPU_FC_PAGE) {
 		rc = pcpu_embed_first_chunk(0, dyn_size, atom_size, pcpu_cpu_distance,
+					    pcpu_cpu_to_node,
 					    pcpu_alloc_bootmem, pcpu_free_bootmem);
 		if (rc)
 			pr_warn("PERCPU: %s allocator failed (%d), "
@@ -900,6 +907,7 @@ void __init setup_per_cpu_areas(void)
 
 	if (rc < 0)
 		rc = pcpu_page_first_chunk(0, pcpu_alloc_bootmem, pcpu_free_bootmem,
+					   pcpu_cpu_to_node,
 					   pcpu_populate_pte);
 	if (rc < 0)
 		panic("cannot initialize percpu area (err=%d)", rc);
diff --git a/arch/sparc/kernel/smp_64.c b/arch/sparc/kernel/smp_64.c
index b98a7bbe6728..026aa3ccbc30 100644
--- a/arch/sparc/kernel/smp_64.c
+++ b/arch/sparc/kernel/smp_64.c
@@ -1539,12 +1539,12 @@ void smp_send_stop(void)
  * RETURNS:
  * Pointer to the allocated area on success, NULL on failure.
  */
-static void * __init pcpu_alloc_bootmem(unsigned int cpu, size_t size,
-					size_t align)
+static void * __init pcpu_alloc_bootmem(unsigned int cpu, size_t size, size_t align,
+					pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn)
 {
 	const unsigned long goal = __pa(MAX_DMA_ADDRESS);
 #ifdef CONFIG_NUMA
-	int node = cpu_to_node(cpu);
+	int node = cpu_to_nd_fn(cpu);
 	void *ptr;
 
 	if (!node_online(node) || !NODE_DATA(node)) {
@@ -1641,6 +1641,7 @@ void __init setup_per_cpu_areas(void)
 		rc = pcpu_embed_first_chunk(PERCPU_MODULE_RESERVE,
 					    PERCPU_DYNAMIC_RESERVE, 4 << 20,
 					    pcpu_cpu_distance,
+					    cpu_to_node,
 					    pcpu_alloc_bootmem,
 					    pcpu_free_bootmem);
 		if (rc)
@@ -1652,6 +1653,7 @@ void __init setup_per_cpu_areas(void)
 		rc = pcpu_page_first_chunk(PERCPU_MODULE_RESERVE,
 					   pcpu_alloc_bootmem,
 					   pcpu_free_bootmem,
+					   cpu_to_node,
 					   pcpu_populate_pte);
 	if (rc < 0)
 		panic("cannot initialize percpu area (err=%d)", rc);
diff --git a/arch/x86/kernel/setup_percpu.c b/arch/x86/kernel/setup_percpu.c
index 7b65275544b2..bba4fa174a16 100644
--- a/arch/x86/kernel/setup_percpu.c
+++ b/arch/x86/kernel/setup_percpu.c
@@ -97,12 +97,12 @@ static bool __init pcpu_need_numa(void)
  * RETURNS:
  * Pointer to the allocated area on success, NULL on failure.
  */
-static void * __init pcpu_alloc_bootmem(unsigned int cpu, unsigned long size,
-					unsigned long align)
+static void * __init pcpu_alloc_bootmem(unsigned int cpu, unsigned long size, unsigned long align,
+					pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn)
 {
 	const unsigned long goal = __pa(MAX_DMA_ADDRESS);
 #ifdef CONFIG_NUMA
-	int node = early_cpu_to_node(cpu);
+	int node = cpu_to_nd_fn(cpu);
 	void *ptr;
 
 	if (!node_online(node) || !NODE_DATA(node)) {
@@ -128,9 +128,10 @@ static void * __init pcpu_alloc_bootmem(unsigned int cpu, unsigned long size,
 /*
  * Helpers for first chunk memory allocation
  */
-static void * __init pcpu_fc_alloc(unsigned int cpu, size_t size, size_t align)
+static void * __init pcpu_fc_alloc(unsigned int cpu, size_t size, size_t align,
+				   pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn)
 {
-	return pcpu_alloc_bootmem(cpu, size, align);
+	return pcpu_alloc_bootmem(cpu, size, align, cpu_to_nd_fn);
 }
 
 static void __init pcpu_fc_free(void *ptr, size_t size)
@@ -150,6 +151,11 @@ static int __init pcpu_cpu_distance(unsigned int from, unsigned int to)
 #endif
 }
 
+static int __init pcpu_cpu_to_node(int cpu)
+{
+	return IS_ENABLED(CONFIG_NUMA) ? early_cpu_to_node(cpu) : NUMA_NO_NODE;
+}
+
 static void __init pcpup_populate_pte(unsigned long addr)
 {
 	populate_extra_pte(addr);
@@ -205,6 +211,7 @@ void __init setup_per_cpu_areas(void)
 		rc = pcpu_embed_first_chunk(PERCPU_FIRST_CHUNK_RESERVE,
 					    dyn_size, atom_size,
 					    pcpu_cpu_distance,
+					    pcpu_cpu_to_node,
 					    pcpu_fc_alloc, pcpu_fc_free);
 		if (rc < 0)
 			pr_warn("%s allocator failed (%d), falling back to page size\n",
@@ -213,6 +220,7 @@ void __init setup_per_cpu_areas(void)
 	if (rc < 0)
 		rc = pcpu_page_first_chunk(PERCPU_FIRST_CHUNK_RESERVE,
 					   pcpu_fc_alloc, pcpu_fc_free,
+					   pcpu_cpu_to_node,
 					   pcpup_populate_pte);
 	if (rc < 0)
 		panic("cannot initialize percpu area (err=%d)", rc);
diff --git a/drivers/base/arch_numa.c b/drivers/base/arch_numa.c
index bc1876915457..273543d9ff85 100644
--- a/drivers/base/arch_numa.c
+++ b/drivers/base/arch_numa.c
@@ -155,10 +155,10 @@ static int __init pcpu_cpu_distance(unsigned int from, unsigned int to)
 	return node_distance(early_cpu_to_node(from), early_cpu_to_node(to));
 }
 
-static void * __init pcpu_fc_alloc(unsigned int cpu, size_t size,
-				       size_t align)
+static void * __init pcpu_fc_alloc(unsigned int cpu, size_t size, size_t align,
+				   pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn)
 {
-	int nid = early_cpu_to_node(cpu);
+	int nid = cpu_to_nd_fn(cpu);
 
 	return  memblock_alloc_try_nid(size, align,
 			__pa(MAX_DMA_ADDRESS), MEMBLOCK_ALLOC_ACCESSIBLE, nid);
@@ -229,6 +229,7 @@ void __init setup_per_cpu_areas(void)
 		rc = pcpu_embed_first_chunk(PERCPU_MODULE_RESERVE,
 					    PERCPU_DYNAMIC_RESERVE, PAGE_SIZE,
 					    pcpu_cpu_distance,
+					    early_cpu_to_node,
 					    pcpu_fc_alloc, pcpu_fc_free);
 #ifdef CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK
 		if (rc < 0)
@@ -242,6 +243,7 @@ void __init setup_per_cpu_areas(void)
 		rc = pcpu_page_first_chunk(PERCPU_MODULE_RESERVE,
 					   pcpu_fc_alloc,
 					   pcpu_fc_free,
+					   early_cpu_to_node,
 					   pcpu_populate_pte);
 #endif
 	if (rc < 0)
diff --git a/include/linux/percpu.h b/include/linux/percpu.h
index ae4004e7957e..41bb54715b0c 100644
--- a/include/linux/percpu.h
+++ b/include/linux/percpu.h
@@ -94,8 +94,9 @@ extern const char * const pcpu_fc_names[PCPU_FC_NR];
 
 extern enum pcpu_fc pcpu_chosen_fc;
 
-typedef void * (*pcpu_fc_alloc_fn_t)(unsigned int cpu, size_t size,
-				     size_t align);
+typedef int (pcpu_fc_cpu_to_node_fn_t)(int cpu);
+typedef void * (*pcpu_fc_alloc_fn_t)(unsigned int cpu, size_t size, size_t align,
+				     pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn);
 typedef void (*pcpu_fc_free_fn_t)(void *ptr, size_t size);
 typedef void (*pcpu_fc_populate_pte_fn_t)(unsigned long addr);
 typedef int (pcpu_fc_cpu_distance_fn_t)(unsigned int from, unsigned int to);
@@ -111,6 +112,7 @@ extern void __init pcpu_setup_first_chunk(const struct pcpu_alloc_info *ai,
 extern int __init pcpu_embed_first_chunk(size_t reserved_size, size_t dyn_size,
 				size_t atom_size,
 				pcpu_fc_cpu_distance_fn_t cpu_distance_fn,
+				pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn,
 				pcpu_fc_alloc_fn_t alloc_fn,
 				pcpu_fc_free_fn_t free_fn);
 #endif
@@ -119,6 +121,7 @@ extern int __init pcpu_embed_first_chunk(size_t reserved_size, size_t dyn_size,
 extern int __init pcpu_page_first_chunk(size_t reserved_size,
 				pcpu_fc_alloc_fn_t alloc_fn,
 				pcpu_fc_free_fn_t free_fn,
+				pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn,
 				pcpu_fc_populate_pte_fn_t populate_pte_fn);
 #endif
 
diff --git a/mm/percpu.c b/mm/percpu.c
index f5b2c2ea5a54..3f6cf1ff0be2 100644
--- a/mm/percpu.c
+++ b/mm/percpu.c
@@ -3001,6 +3001,7 @@ static struct pcpu_alloc_info * __init __flatten pcpu_build_alloc_info(
  * @dyn_size: minimum free size for dynamic allocation in bytes
  * @atom_size: allocation atom size
  * @cpu_distance_fn: callback to determine distance between cpus, optional
+ * @cpu_to_nd_fn: callback to convert cpu to it's node, optional
  * @alloc_fn: function to allocate percpu page
  * @free_fn: function to free percpu page
  *
@@ -3030,6 +3031,7 @@ static struct pcpu_alloc_info * __init __flatten pcpu_build_alloc_info(
 int __init pcpu_embed_first_chunk(size_t reserved_size, size_t dyn_size,
 				  size_t atom_size,
 				  pcpu_fc_cpu_distance_fn_t cpu_distance_fn,
+				  pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn,
 				  pcpu_fc_alloc_fn_t alloc_fn,
 				  pcpu_fc_free_fn_t free_fn)
 {
@@ -3066,7 +3068,7 @@ int __init pcpu_embed_first_chunk(size_t reserved_size, size_t dyn_size,
 		BUG_ON(cpu == NR_CPUS);
 
 		/* allocate space for the whole group */
-		ptr = alloc_fn(cpu, gi->nr_units * ai->unit_size, atom_size);
+		ptr = alloc_fn(cpu, gi->nr_units * ai->unit_size, atom_size, cpu_to_nd_fn);
 		if (!ptr) {
 			rc = -ENOMEM;
 			goto out_free_areas;
@@ -3145,6 +3147,7 @@ int __init pcpu_embed_first_chunk(size_t reserved_size, size_t dyn_size,
  * @reserved_size: the size of reserved percpu area in bytes
  * @alloc_fn: function to allocate percpu page, always called with PAGE_SIZE
  * @free_fn: function to free percpu page, always called with PAGE_SIZE
+ * @cpu_to_nd_fn: callback to convert cpu to it's node, optional
  * @populate_pte_fn: function to populate pte
  *
  * This is a helper to ease setting up page-remapped first percpu
@@ -3159,6 +3162,7 @@ int __init pcpu_embed_first_chunk(size_t reserved_size, size_t dyn_size,
 int __init pcpu_page_first_chunk(size_t reserved_size,
 				 pcpu_fc_alloc_fn_t alloc_fn,
 				 pcpu_fc_free_fn_t free_fn,
+				 pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn,
 				 pcpu_fc_populate_pte_fn_t populate_pte_fn)
 {
 	static struct vm_struct vm;
@@ -3201,7 +3205,7 @@ int __init pcpu_page_first_chunk(size_t reserved_size,
 		for (i = 0; i < unit_pages; i++) {
 			void *ptr;
 
-			ptr = alloc_fn(cpu, PAGE_SIZE, PAGE_SIZE);
+			ptr = alloc_fn(cpu, PAGE_SIZE, PAGE_SIZE, cpu_to_nd_fn);
 			if (!ptr) {
 				pr_warn("failed to allocate %s page for cpu%u\n",
 						psize_str, cpu);
@@ -3278,8 +3282,8 @@ int __init pcpu_page_first_chunk(size_t reserved_size,
 unsigned long __per_cpu_offset[NR_CPUS] __read_mostly;
 EXPORT_SYMBOL(__per_cpu_offset);
 
-static void * __init pcpu_dfl_fc_alloc(unsigned int cpu, size_t size,
-				       size_t align)
+static void * __init pcpu_dfl_fc_alloc(unsigned int cpu, size_t size, size_t align,
+				       pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn)
 {
 	return  memblock_alloc_from(size, align, __pa(MAX_DMA_ADDRESS));
 }
@@ -3300,7 +3304,7 @@ void __init setup_per_cpu_areas(void)
 	 * what the legacy allocator did.
 	 */
 	rc = pcpu_embed_first_chunk(PERCPU_MODULE_RESERVE,
-				    PERCPU_DYNAMIC_RESERVE, PAGE_SIZE, NULL,
+				    PERCPU_DYNAMIC_RESERVE, PAGE_SIZE, NULL, NULL,
 				    pcpu_dfl_fc_alloc, pcpu_dfl_fc_free);
 	if (rc < 0)
 		panic("Failed to initialize percpu areas.");
-- 
2.26.2

