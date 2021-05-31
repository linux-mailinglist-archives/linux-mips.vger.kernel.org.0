Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95930395A9C
	for <lists+linux-mips@lfdr.de>; Mon, 31 May 2021 14:31:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231637AbhEaMdV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 31 May 2021 08:33:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:38740 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231580AbhEaMdM (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 31 May 2021 08:33:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 799556135C;
        Mon, 31 May 2021 12:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622464292;
        bh=Y7haZXG6LCrkyiNf4al3/zg3oLPp7ZoFJvZMl/Ul6YQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Wq4e57ItDLEqmiEcvSEIAazH6yHLyfo64u0lSaJOoctDXfqqrPCsOjjERbZhZBIVx
         ZK0WoswUqkIc0oodQhu7GQS9m8Cp5JxXTpYzjq2rIR156egj11Bx2hYUbQiwWKkY7B
         mJKQSkpud+trIX7xSxyLexZAZqn62t9FWnfr2+o6LbNDLLnOsU82S94co+4gJQ3mO/
         64R7Y9hhxOF2VJMni93fZlVUjWekIqV7nr8ng/0Aye3mzetPS/DaJ0u/ty6v2T+sgy
         amdz73Z/NgZyyrLxs6sb6DzWfPEVjfKFvPEMbaL8jst2H7E5+We7Eq5jk09RocHzGu
         NPL1iwhT2hj/w==
From:   Mike Rapoport <rppt@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Mike Rapoport <rppt@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-mm@kvack.org, linux-s390@vger.kernel.org
Subject: [RFC/RFT PATCH 5/5] arm64: switch to generic memblock_setup_resources()
Date:   Mon, 31 May 2021 15:29:59 +0300
Message-Id: <20210531122959.23499-6-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210531122959.23499-1-rppt@kernel.org>
References: <20210531122959.23499-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Mike Rapoport <rppt@linux.ibm.com>

The implementation of resource setup on arm64 takes into account NOMAP
regions and registers them as "Reserved" rather than as "System RAM".
In addition, there is an extra pass that adds regions that were reserved in
memblock to the resource tree as well.

Update the generic version of memblock_setup_resources() to take into the
account NOMAP regions and move the registration of the reserved regions to
memblock to have all the "System RAM" related resource data structures and
code close to each other.

Only enable requests for the reserved resources if an architecture selects
CONFIG_ARCH_WANT_RESERVE_MEMBLOCK_RESERVED_REGIONS.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/Kconfig              |   7 +++
 arch/arm64/Kconfig        |   1 +
 arch/arm64/kernel/setup.c | 101 +-------------------------------------
 mm/memblock.c             |  73 +++++++++++++++++++++------
 4 files changed, 68 insertions(+), 114 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index c45b770d3579..9c999dc8ab47 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1275,6 +1275,13 @@ config ARCH_SPLIT_ARG64
 config ARCH_HAS_ELFCORE_COMPAT
 	bool
 
+config ARCH_WANT_RESERVE_MEMBLOCK_RESERVED_REGIONS
+	bool
+	help
+	  If an architecture requires that memory regions reserved in
+	  memblock will appear as "Reserved" in the resource tree, select
+	  this option.
+
 source "kernel/gcov/Kconfig"
 
 source "scripts/gcc-plugins/Kconfig"
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 9f1d8566bbf9..0e1f41650a6a 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -93,6 +93,7 @@ config ARM64
 	select ARCH_WANT_FRAME_POINTERS
 	select ARCH_WANT_HUGE_PMD_SHARE if ARM64_4K_PAGES || (ARM64_16K_PAGES && !ARM64_VA_BITS_36)
 	select ARCH_WANT_LD_ORPHAN_WARN
+	select ARCH_WANT_RESERVE_MEMBLOCK_RESERVED_REGIONS
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
 	select ARM_AMBA
 	select ARM_ARCH_TIMER
diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
index 61845c0821d9..90e97cf70844 100644
--- a/arch/arm64/kernel/setup.c
+++ b/arch/arm64/kernel/setup.c
@@ -51,32 +51,8 @@
 #include <asm/xen/hypervisor.h>
 #include <asm/mmu_context.h>
 
-static int num_standard_resources;
-static struct resource *standard_resources;
-
 phys_addr_t __fdt_pointer __initdata;
 
-/*
- * Standard memory resources
- */
-static struct resource mem_res[] = {
-	{
-		.name = "Kernel code",
-		.start = 0,
-		.end = 0,
-		.flags = IORESOURCE_SYSTEM_RAM
-	},
-	{
-		.name = "Kernel data",
-		.start = 0,
-		.end = 0,
-		.flags = IORESOURCE_SYSTEM_RAM
-	}
-};
-
-#define kernel_code mem_res[0]
-#define kernel_data mem_res[1]
-
 /*
  * The recorded values of x0 .. x3 upon kernel entry.
  */
@@ -214,81 +190,6 @@ static void __init setup_machine_fdt(phys_addr_t dt_phys)
 	dump_stack_set_arch_desc("%s (DT)", name);
 }
 
-static void __init request_standard_resources(void)
-{
-	struct memblock_region *region;
-	struct resource *res;
-	unsigned long i = 0;
-	size_t res_size;
-
-	kernel_code.start   = __pa_symbol(_stext);
-	kernel_code.end     = __pa_symbol(__init_begin - 1);
-	kernel_data.start   = __pa_symbol(_sdata);
-	kernel_data.end     = __pa_symbol(_end - 1);
-
-	num_standard_resources = memblock.memory.cnt;
-	res_size = num_standard_resources * sizeof(*standard_resources);
-	standard_resources = memblock_alloc(res_size, SMP_CACHE_BYTES);
-	if (!standard_resources)
-		panic("%s: Failed to allocate %zu bytes\n", __func__, res_size);
-
-	for_each_mem_region(region) {
-		res = &standard_resources[i++];
-		if (memblock_is_nomap(region)) {
-			res->name  = "reserved";
-			res->flags = IORESOURCE_MEM;
-		} else {
-			res->name  = "System RAM";
-			res->flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
-		}
-		res->start = __pfn_to_phys(memblock_region_memory_base_pfn(region));
-		res->end = __pfn_to_phys(memblock_region_memory_end_pfn(region)) - 1;
-
-		request_resource(&iomem_resource, res);
-
-		if (kernel_code.start >= res->start &&
-		    kernel_code.end <= res->end)
-			request_resource(res, &kernel_code);
-		if (kernel_data.start >= res->start &&
-		    kernel_data.end <= res->end)
-			request_resource(res, &kernel_data);
-#ifdef CONFIG_KEXEC_CORE
-		/* Userspace will find "Crash kernel" region in /proc/iomem. */
-		if (crashk_res.end && crashk_res.start >= res->start &&
-		    crashk_res.end <= res->end)
-			request_resource(res, &crashk_res);
-#endif
-	}
-}
-
-static int __init reserve_memblock_reserved_regions(void)
-{
-	u64 i, j;
-
-	for (i = 0; i < num_standard_resources; ++i) {
-		struct resource *mem = &standard_resources[i];
-		phys_addr_t r_start, r_end, mem_size = resource_size(mem);
-
-		if (!memblock_is_region_reserved(mem->start, mem_size))
-			continue;
-
-		for_each_reserved_mem_range(j, &r_start, &r_end) {
-			resource_size_t start, end;
-
-			start = max(PFN_PHYS(PFN_DOWN(r_start)), mem->start);
-			end = min(PFN_PHYS(PFN_UP(r_end)) - 1, mem->end);
-
-			if (start > mem->end || end < mem->start)
-				continue;
-
-			reserve_region_with_split(mem, start, end, "reserved");
-		}
-	}
-
-	return 0;
-}
-arch_initcall(reserve_memblock_reserved_regions);
-
 u64 __cpu_logical_map[NR_CPUS] = { [0 ... NR_CPUS-1] = INVALID_HWID };
 
 u64 cpu_logical_map(unsigned int cpu)
@@ -359,7 +260,7 @@ void __init __no_sanitize_address setup_arch(char **cmdline_p)
 
 	kasan_init();
 
-	request_standard_resources();
+	memblock_setup_resources();
 
 	early_ioremap_reset();
 
diff --git a/mm/memblock.c b/mm/memblock.c
index 504435753259..82d4b0f5bf5e 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -2094,12 +2094,15 @@ static struct resource __initdata *standard_resources[] = {
 #endif
 };
 
+static int num_resources;
+static struct resource *resources;
+
 void __init memblock_setup_resources(void)
 {
 	struct resource *res, *kres, *sub_res;
-	phys_addr_t start, end;
-	int j;
-	u64 i;
+	struct memblock_region *region;
+	size_t res_size;
+	int i;
 
 	code_resource.start = __pa_symbol(_text);
 	code_resource.end = __pa_symbol(_etext)-1;
@@ -2110,26 +2113,36 @@ void __init memblock_setup_resources(void)
 	bss_resource.start = __pa_symbol(__bss_start);
 	bss_resource.end = __pa_symbol(__bss_stop)-1;
 
-	for_each_mem_range(i, &start, &end) {
-		res = memblock_alloc(sizeof(*res), 8);
-		if (!res)
-			panic("%s: Failed to allocate %zu bytes align=0x%x\n",
-			      __func__, sizeof(*res), 8);
-		res->flags = IORESOURCE_BUSY | IORESOURCE_SYSTEM_RAM;
+	num_resources = memblock.memory.cnt;
+	res_size = num_resources * sizeof(*resources);
+	resources = memblock_alloc(res_size, SMP_CACHE_BYTES);
 
-		res->name = "System RAM";
-		res->start = start;
+	if (!resources)
+		panic("%s: Failed to allocate %zu bytes align=0x%x\n",
+		      __func__, res_size, 8);
+
+	res = resources;
+	for_each_mem_region(region) {
+		if (memblock_is_nomap(region)) {
+			res->name  = "reserved";
+			res->flags = IORESOURCE_MEM;
+		} else {
+			res->name  = "System RAM";
+			res->flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
+		}
 
+		res->start = region->base;
 		/*
 		 * In memblock, end points to the first byte after the
 		 * range while in resourses, end points to the last byte in
 		 * the range.
 		 */
-		res->end = end - 1;
+		res->end = region->base + region->size - 1;
+
 		request_resource(&iomem_resource, res);
 
-		for (j = 0; j < ARRAY_SIZE(standard_resources); j++) {
-			kres = standard_resources[j];
+		for (i = 0; i < ARRAY_SIZE(standard_resources); i++) {
+			kres = standard_resources[i];
 			if (!kres->end || kres->start < res->start ||
 			    kres->start > res->end)
 				continue;
@@ -2146,9 +2159,41 @@ void __init memblock_setup_resources(void)
 				request_resource(res, kres);
 			}
 		}
+
+		res++;
 	}
 }
 
+#ifdef CONFIG_ARCH_WANT_RESERVE_MEMBLOCK_RESERVED_REGIONS
+static int __init reserve_memblock_reserved_regions(void)
+{
+	u64 i, j;
+
+	for (i = 0; i < num_resources; ++i) {
+		struct resource *mem = &resources[i];
+		phys_addr_t r_start, r_end, mem_size = resource_size(mem);
+
+		if (!memblock_is_region_reserved(mem->start, mem_size))
+			continue;
+
+		for_each_reserved_mem_range(j, &r_start, &r_end) {
+			resource_size_t start, end;
+
+			start = max(PFN_PHYS(PFN_DOWN(r_start)), mem->start);
+			end = min(PFN_PHYS(PFN_UP(r_end)) - 1, mem->end);
+
+			if (start > mem->end || end < mem->start)
+				continue;
+
+			reserve_region_with_split(mem, start, end, "reserved");
+		}
+	}
+
+	return 0;
+}
+arch_initcall(reserve_memblock_reserved_regions);
+#endif
+
 #if defined(CONFIG_DEBUG_FS) && defined(CONFIG_ARCH_KEEP_MEMBLOCK)
 
 static int memblock_debug_show(struct seq_file *m, void *private)
-- 
2.28.0

