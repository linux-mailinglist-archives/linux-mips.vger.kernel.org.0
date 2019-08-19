Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B86E79269C
	for <lists+linux-mips@lfdr.de>; Mon, 19 Aug 2019 16:24:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726242AbfHSOYZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 19 Aug 2019 10:24:25 -0400
Received: from forward103p.mail.yandex.net ([77.88.28.106]:38373 "EHLO
        forward103p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726186AbfHSOYZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 19 Aug 2019 10:24:25 -0400
Received: from mxback12g.mail.yandex.net (mxback12g.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:91])
        by forward103p.mail.yandex.net (Yandex) with ESMTP id B9C4118C1581;
        Mon, 19 Aug 2019 17:24:09 +0300 (MSK)
Received: from smtp1o.mail.yandex.net (smtp1o.mail.yandex.net [2a02:6b8:0:1a2d::25])
        by mxback12g.mail.yandex.net (nwsmtp/Yandex) with ESMTP id QvbIpRDnyQ-O8kG6Bax;
        Mon, 19 Aug 2019 17:24:09 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1566224649;
        bh=TfgqmzhlPfa6hwXfq+1w++/5bki8hWp/D3gbSAE8xXc=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=i+/wlSelJMvHk/iNJHLCevOxo6KeUm26xt/UrXzkOB/KrvFR6RNlhXkbHOvAOr1An
         iQocfye1KDrmCn0wUZvfv3xGgrwF1m1lDi0+HEbE3EbVhe6qnHoQOktkJf4M/4kTE3
         Ut0q7/x9W79gpK+9V6yxdld8QHubKB1sTq8neOL8=
Authentication-Results: mxback12g.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp1o.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id StE3L42zOl-O4UmxVjP;
        Mon, 19 Aug 2019 17:24:07 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     paul.burton@mips.com, yasha.che3@gmail.com, aurelien@aurel32.net,
        sfr@canb.auug.org.au, fancer.lancer@gmail.com,
        matt.redfearn@mips.com, chenhc@lemote.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v1 8/8] MIPS: init: Drop boot_mem_map
Date:   Mon, 19 Aug 2019 22:23:13 +0800
Message-Id: <20190819142313.3535-9-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190819142313.3535-1-jiaxun.yang@flygoat.com>
References: <20190819142313.3535-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

boot_mem_map was introduced very early and cannot handle memory maps
with nid. Nowadays, memblock can exactly replace boot_mem_map.

Detect pfn info and setup resources with memblock maps.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/bootinfo.h |  16 --
 arch/mips/kernel/setup.c         | 355 ++++++++-----------------------
 2 files changed, 85 insertions(+), 286 deletions(-)

diff --git a/arch/mips/include/asm/bootinfo.h b/arch/mips/include/asm/bootinfo.h
index 235bc2f52113..4e296c38b6e6 100644
--- a/arch/mips/include/asm/bootinfo.h
+++ b/arch/mips/include/asm/bootinfo.h
@@ -87,28 +87,12 @@ const char *get_system_type(void);
 
 extern unsigned long mips_machtype;
 
-#define BOOT_MEM_MAP_MAX	32
 #define BOOT_MEM_RAM		1
 #define BOOT_MEM_ROM_DATA	2
 #define BOOT_MEM_RESERVED	3
 #define BOOT_MEM_INIT_RAM	4
 #define BOOT_MEM_NOMAP		5
 
-/*
- * A memory map that's built upon what was determined
- * or specified on the command line.
- */
-struct boot_mem_map {
-	int nr_map;
-	struct boot_mem_map_entry {
-		phys_addr_t addr;	/* start of memory segment */
-		phys_addr_t size;	/* size of memory segment */
-		long type;		/* type of memory segment */
-	} map[BOOT_MEM_MAP_MAX];
-};
-
-extern struct boot_mem_map boot_mem_map;
-
 extern void add_memory_region(phys_addr_t start, phys_addr_t size, long type);
 extern void detect_memory_region(phys_addr_t start, phys_addr_t sz_min,  phys_addr_t sz_max);
 
diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index ab349d2381c3..0307325ce6e8 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -63,8 +63,6 @@ unsigned long mips_machtype __read_mostly = MACH_UNKNOWN;
 
 EXPORT_SYMBOL(mips_machtype);
 
-struct boot_mem_map boot_mem_map;
-
 static char __initdata command_line[COMMAND_LINE_SIZE];
 char __initdata arcs_cmdline[COMMAND_LINE_SIZE];
 
@@ -92,8 +90,10 @@ EXPORT_SYMBOL(ARCH_PFN_OFFSET);
 
 void __init add_memory_region(phys_addr_t start, phys_addr_t size, long type)
 {
-	int x = boot_mem_map.nr_map;
-	int i;
+	/*
+	 * Note: This function only exists for historical reason,
+	 * new code should use memblock_add or memblock_add_node instead.
+	 */
 
 	/*
 	 * If the region reaches the top of the physical address space, adjust
@@ -108,38 +108,20 @@ void __init add_memory_region(phys_addr_t start, phys_addr_t size, long type)
 		return;
 	}
 
-	/*
-	 * Try to merge with existing entry, if any.
-	 */
-	for (i = 0; i < boot_mem_map.nr_map; i++) {
-		struct boot_mem_map_entry *entry = boot_mem_map.map + i;
-		unsigned long top;
-
-		if (entry->type != type)
-			continue;
-
-		if (start + size < entry->addr)
-			continue;			/* no overlap */
+	memblock_add(start, size);
+	/* Reserve any memory except the ordinary RAM ranges. */
+	switch (type) {
+	case BOOT_MEM_RAM:
+		break;
 
-		if (entry->addr + entry->size < start)
-			continue;			/* no overlap */
+	case BOOT_MEM_NOMAP: /* Discard the range from the system. */
+		memblock_remove(start, size);
+		break;
 
-		top = max(entry->addr + entry->size, start + size);
-		entry->addr = min(entry->addr, start);
-		entry->size = top - entry->addr;
-
-		return;
+	default: /* Reserve the rest of the memory types at boot time */
+		memblock_reserve(start, size);
+		break;
 	}
-
-	if (boot_mem_map.nr_map == BOOT_MEM_MAP_MAX) {
-		pr_err("Ooops! Too many entries in the memory map!\n");
-		return;
-	}
-
-	boot_mem_map.map[x].addr = start;
-	boot_mem_map.map[x].size = size;
-	boot_mem_map.map[x].type = type;
-	boot_mem_map.nr_map++;
 }
 
 void __init detect_memory_region(phys_addr_t start, phys_addr_t sz_min, phys_addr_t sz_max)
@@ -161,70 +143,6 @@ void __init detect_memory_region(phys_addr_t start, phys_addr_t sz_min, phys_add
 	add_memory_region(start, size, BOOT_MEM_RAM);
 }
 
-static bool __init __maybe_unused memory_region_available(phys_addr_t start,
-							  phys_addr_t size)
-{
-	int i;
-	bool in_ram = false, free = true;
-
-	for (i = 0; i < boot_mem_map.nr_map; i++) {
-		phys_addr_t start_, end_;
-
-		start_ = boot_mem_map.map[i].addr;
-		end_ = boot_mem_map.map[i].addr + boot_mem_map.map[i].size;
-
-		switch (boot_mem_map.map[i].type) {
-		case BOOT_MEM_RAM:
-			if (start >= start_ && start + size <= end_)
-				in_ram = true;
-			break;
-		case BOOT_MEM_RESERVED:
-		case BOOT_MEM_NOMAP:
-			if ((start >= start_ && start < end_) ||
-			    (start < start_ && start + size >= start_))
-				free = false;
-			break;
-		default:
-			continue;
-		}
-	}
-
-	return in_ram && free;
-}
-
-static void __init print_memory_map(void)
-{
-	int i;
-	const int field = 2 * sizeof(unsigned long);
-
-	for (i = 0; i < boot_mem_map.nr_map; i++) {
-		printk(KERN_INFO " memory: %0*Lx @ %0*Lx ",
-		       field, (unsigned long long) boot_mem_map.map[i].size,
-		       field, (unsigned long long) boot_mem_map.map[i].addr);
-
-		switch (boot_mem_map.map[i].type) {
-		case BOOT_MEM_RAM:
-			printk(KERN_CONT "(usable)\n");
-			break;
-		case BOOT_MEM_INIT_RAM:
-			printk(KERN_CONT "(usable after init)\n");
-			break;
-		case BOOT_MEM_ROM_DATA:
-			printk(KERN_CONT "(ROM data)\n");
-			break;
-		case BOOT_MEM_RESERVED:
-			printk(KERN_CONT "(reserved)\n");
-			break;
-		case BOOT_MEM_NOMAP:
-			printk(KERN_CONT "(nomap)\n");
-			break;
-		default:
-			printk(KERN_CONT "type %lu\n", boot_mem_map.map[i].type);
-			break;
-		}
-	}
-}
-
 /*
  * Manage initrd
  */
@@ -376,8 +294,11 @@ static void __init bootmem_init(void)
 
 static void __init bootmem_init(void)
 {
-	phys_addr_t ramstart = PHYS_ADDR_MAX;
-	int i;
+	struct memblock_region *mem;
+	phys_addr_t ramstart, ramend;
+
+	ramstart = memblock_start_of_DRAM();
+	ramend = memblock_end_of_DRAM();
 
 	/*
 	 * Sanity check any INITRD first. We don't take it into account
@@ -391,122 +312,66 @@ static void __init bootmem_init(void)
 	memblock_reserve(__pa_symbol(&_text),
 			__pa_symbol(&_end) - __pa_symbol(&_text));
 
+	/* max_low_pfn is not a number of pages but the end pfn of low mem */
+
+#ifdef CONFIG_MIPS_AUTO_PFN_OFFSET
+	ARCH_PFN_OFFSET = PFN_UP(ramstart);
+#else
 	/*
-	 * max_low_pfn is not a number of pages. The number of pages
-	 * of the system is given by 'max_low_pfn - min_low_pfn'.
+	 * Reserve any memory between the start of RAM and PHYS_OFFSET
 	 */
-	min_low_pfn = ~0UL;
-	max_low_pfn = 0;
-
-	/* Find the highest and lowest page frame numbers we have available. */
-	for (i = 0; i < boot_mem_map.nr_map; i++) {
-		unsigned long start, end;
-
-		if (boot_mem_map.map[i].type != BOOT_MEM_RAM)
-			continue;
+	if (ramstart > PHYS_OFFSET)
+		memblock_reserve(PHYS_OFFSET, PFN_UP(ramstart) - PHYS_OFFSET);
 
-		start = PFN_UP(boot_mem_map.map[i].addr);
-		end = PFN_DOWN(boot_mem_map.map[i].addr
-				+ boot_mem_map.map[i].size);
+	if (PFN_UP(ramstart) > ARCH_PFN_OFFSET) {
+		pr_info("Wasting %lu bytes for tracking %lu unused pages\n",
+			(unsigned long)((PFN_UP(ramstart) - ARCH_PFN_OFFSET) * sizeof(struct page)),
+			(unsigned long)(PFN_UP(ramstart) - ARCH_PFN_OFFSET));
+	}
+#endif
 
-		ramstart = min(ramstart, boot_mem_map.map[i].addr);
+	min_low_pfn = ARCH_PFN_OFFSET;
+	max_pfn = PFN_DOWN(ramend);
+	for_each_memblock(memory, mem) {
+		unsigned long start = memblock_region_memory_base_pfn(mem);
+		unsigned long end = memblock_region_memory_end_pfn(mem);
 
-#ifndef CONFIG_HIGHMEM
 		/*
 		 * Skip highmem here so we get an accurate max_low_pfn if low
 		 * memory stops short of high memory.
 		 * If the region overlaps HIGHMEM_START, end is clipped so
 		 * max_pfn excludes the highmem portion.
 		 */
+		if (memblock_is_nomap(mem))
+			continue;
 		if (start >= PFN_DOWN(HIGHMEM_START))
 			continue;
 		if (end > PFN_DOWN(HIGHMEM_START))
 			end = PFN_DOWN(HIGHMEM_START);
-#endif
-
 		if (end > max_low_pfn)
 			max_low_pfn = end;
-		if (start < min_low_pfn)
-			min_low_pfn = start;
 	}
 
 	if (min_low_pfn >= max_low_pfn)
 		panic("Incorrect memory mapping !!!");
 
-#ifdef CONFIG_MIPS_AUTO_PFN_OFFSET
-	ARCH_PFN_OFFSET = PFN_UP(ramstart);
-#else
-	/*
-	 * Reserve any memory between the start of RAM and PHYS_OFFSET
-	 */
-	if (ramstart > PHYS_OFFSET) {
-		add_memory_region(PHYS_OFFSET, ramstart - PHYS_OFFSET,
-				  BOOT_MEM_RESERVED);
-		memblock_reserve(PHYS_OFFSET, ramstart - PHYS_OFFSET);
-	}
-
-	if (min_low_pfn > ARCH_PFN_OFFSET) {
-		pr_info("Wasting %lu bytes for tracking %lu unused pages\n",
-			(min_low_pfn - ARCH_PFN_OFFSET) * sizeof(struct page),
-			min_low_pfn - ARCH_PFN_OFFSET);
-	} else if (ARCH_PFN_OFFSET - min_low_pfn > 0UL) {
-		pr_info("%lu free pages won't be used\n",
-			ARCH_PFN_OFFSET - min_low_pfn);
-	}
-	min_low_pfn = ARCH_PFN_OFFSET;
-#endif
-
-	/*
-	 * Determine low and high memory ranges
-	 */
-	max_pfn = max_low_pfn;
-	if (max_low_pfn > PFN_DOWN(HIGHMEM_START)) {
+	if (max_pfn > PFN_DOWN(HIGHMEM_START)) {
 #ifdef CONFIG_HIGHMEM
 		highstart_pfn = PFN_DOWN(HIGHMEM_START);
-		highend_pfn = max_low_pfn;
-#endif
+		highend_pfn = max_pfn;
+#else
 		max_low_pfn = PFN_DOWN(HIGHMEM_START);
-	}
-
-	/* Install all valid RAM ranges to the memblock memory region */
-	for (i = 0; i < boot_mem_map.nr_map; i++) {
-		unsigned long start, end;
-
-		start = PFN_UP(boot_mem_map.map[i].addr);
-		end = PFN_DOWN(boot_mem_map.map[i].addr
-				+ boot_mem_map.map[i].size);
-
-		if (start < min_low_pfn)
-			start = min_low_pfn;
-#ifndef CONFIG_HIGHMEM
-		/* Ignore highmem regions if highmem is unsupported */
-		if (end > max_low_pfn)
-			end = max_low_pfn;
+		max_pfn = max_low_pfn;
 #endif
-		if (end <= start)
-			continue;
-
-		memblock_add_node(PFN_PHYS(start), PFN_PHYS(end - start), 0);
+	}
 
-		/* Reserve any memory except the ordinary RAM ranges. */
-		switch (boot_mem_map.map[i].type) {
-		case BOOT_MEM_RAM:
-			break;
-		case BOOT_MEM_NOMAP: /* Discard the range from the system. */
-			memblock_remove(PFN_PHYS(start), PFN_PHYS(end - start));
-			continue;
-		default: /* Reserve the rest of the memory types at boot time */
-			memblock_reserve(PFN_PHYS(start), PFN_PHYS(end - start));
-			break;
-		}
 
-		/*
-		 * In any case the added to the memblock memory regions
-		 * (highmem/lowmem, available/reserved, etc) are considered
-		 * as present, so inform sparsemem about them.
-		 */
-		memory_present(0, start, end);
-	}
+	/*
+	 * In any case the added to the memblock memory regions
+	 * (highmem/lowmem, available/reserved, etc) are considered
+	 * as present, so inform sparsemem about them.
+	 */
+	memblocks_present();
 
 	/*
 	 * Reserve initrd memory if needed.
@@ -528,8 +393,9 @@ static int __init early_parse_mem(char *p)
 	 * size.
 	 */
 	if (usermem == 0) {
-		boot_mem_map.nr_map = 0;
 		usermem = 1;
+		memblock_remove(memblock_start_of_DRAM(),
+			memblock_end_of_DRAM() - memblock_start_of_DRAM());
 	}
 	start = 0;
 	size = memparse(p, &p);
@@ -586,14 +452,13 @@ early_param("memmap", early_parse_memmap);
 unsigned long setup_elfcorehdr, setup_elfcorehdr_size;
 static int __init early_parse_elfcorehdr(char *p)
 {
-	int i;
+	struct memblock_region *mem;
 
 	setup_elfcorehdr = memparse(p, &p);
 
-	for (i = 0; i < boot_mem_map.nr_map; i++) {
-		unsigned long start = boot_mem_map.map[i].addr;
-		unsigned long end = (boot_mem_map.map[i].addr +
-				     boot_mem_map.map[i].size);
+	 for_each_memblock(memory, mem) {
+		unsigned long start = mem->base;
+		unsigned long end = mem->end;
 		if (setup_elfcorehdr >= start && setup_elfcorehdr < end) {
 			/*
 			 * Reserve from the elf core header to the end of
@@ -613,47 +478,20 @@ static int __init early_parse_elfcorehdr(char *p)
 early_param("elfcorehdr", early_parse_elfcorehdr);
 #endif
 
-static void __init arch_mem_addpart(phys_addr_t mem, phys_addr_t end, int type)
-{
-	phys_addr_t size;
-	int i;
-
-	size = end - mem;
-	if (!size)
-		return;
-
-	/* Make sure it is in the boot_mem_map */
-	for (i = 0; i < boot_mem_map.nr_map; i++) {
-		if (mem >= boot_mem_map.map[i].addr &&
-		    mem < (boot_mem_map.map[i].addr +
-			   boot_mem_map.map[i].size))
-			return;
-	}
-	add_memory_region(mem, size, type);
-}
-
 #ifdef CONFIG_KEXEC
-static inline unsigned long long get_total_mem(void)
-{
-	unsigned long long total;
-
-	total = max_pfn - min_low_pfn;
-	return total << PAGE_SHIFT;
-}
-
 static void __init mips_parse_crashkernel(void)
 {
 	unsigned long long total_mem;
 	unsigned long long crash_size, crash_base;
 	int ret;
 
-	total_mem = get_total_mem();
+	total_mem = memblock_phys_mem_size();
 	ret = parse_crashkernel(boot_command_line, total_mem,
 				&crash_size, &crash_base);
 	if (ret != 0 || crash_size <= 0)
 		return;
 
-	if (!memory_region_available(crash_base, crash_size)) {
+	if (!memblock_find_in_range(crash_base, crash_base + crash_size, crash_size, 0)) {
 		pr_warn("Invalid memory region reserved for crash kernel\n");
 		return;
 	}
@@ -686,6 +524,17 @@ static void __init request_crashkernel(struct resource *res)
 }
 #endif /* !defined(CONFIG_KEXEC)  */
 
+static void __init check_kernel_sections_mem(void)
+{
+	phys_addr_t start = PFN_PHYS(PFN_DOWN(__pa_symbol(&_text)));
+	phys_addr_t size = PFN_PHYS(PFN_UP(__pa_symbol(&_end)) - start);
+
+	if (!memblock_is_region_memory(start, size)) {
+		pr_info("Kernel sections are not in the memory maps\n");
+		memblock_add(start, size);
+	}
+}
+
 #define USE_PROM_CMDLINE	IS_ENABLED(CONFIG_MIPS_CMDLINE_FROM_BOOTLOADER)
 #define USE_DTB_CMDLINE		IS_ENABLED(CONFIG_MIPS_CMDLINE_FROM_DTB)
 #define EXTEND_WITH_PROM	IS_ENABLED(CONFIG_MIPS_CMDLINE_DTB_EXTEND)
@@ -731,25 +580,6 @@ static void __init arch_mem_init(char **cmdline_p)
 	plat_mem_setup();
 	memblock_set_bottom_up(true);
 
-	/*
-	 * Make sure all kernel memory is in the maps.  The "UP" and
-	 * "DOWN" are opposite for initdata since if it crosses over
-	 * into another memory section you don't want that to be
-	 * freed when the initdata is freed.
-	 */
-	arch_mem_addpart(PFN_DOWN(__pa_symbol(&_text)) << PAGE_SHIFT,
-			 PFN_UP(__pa_symbol(&_edata)) << PAGE_SHIFT,
-			 BOOT_MEM_RAM);
-	arch_mem_addpart(PFN_UP(__pa_symbol(&__init_begin)) << PAGE_SHIFT,
-			 PFN_DOWN(__pa_symbol(&__init_end)) << PAGE_SHIFT,
-			 BOOT_MEM_INIT_RAM);
-	arch_mem_addpart(PFN_DOWN(__pa_symbol(&__bss_start)) << PAGE_SHIFT,
-			 PFN_UP(__pa_symbol(&__bss_stop)) << PAGE_SHIFT,
-			 BOOT_MEM_RAM);
-
-	pr_info("Determined physical RAM map:\n");
-	print_memory_map();
-
 #if defined(CONFIG_CMDLINE_BOOL) && defined(CONFIG_CMDLINE_OVERRIDE)
 	strlcpy(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
 #else
@@ -783,14 +613,17 @@ static void __init arch_mem_init(char **cmdline_p)
 
 	parse_early_param();
 
-	if (usermem) {
-		pr_info("User-defined physical RAM map:\n");
-		print_memory_map();
-	}
+	if (usermem)
+		pr_info("User-defined physical RAM map overwrite\n");
+
+	check_kernel_sections_mem();
 
 	early_init_fdt_reserve_self();
 	early_init_fdt_scan_reserved_mem();
 
+#ifndef CONFIG_NUMA
+	memblock_set_node(0, PHYS_ADDR_MAX, &memblock.memory, 0);
+#endif
 	bootmem_init();
 
 	/*
@@ -830,12 +663,12 @@ static void __init arch_mem_init(char **cmdline_p)
 
 	memblock_dump_all();
 
-	early_memtest(PFN_PHYS(min_low_pfn), PFN_PHYS(max_low_pfn));
+	early_memtest(PFN_PHYS(ARCH_PFN_OFFSET), PFN_PHYS(max_low_pfn));
 }
 
 static void __init resource_init(void)
 {
-	int i;
+	struct memblock_region *region;
 
 	if (UNCAC_BASE != IO_BASE)
 		return;
@@ -847,16 +680,10 @@ static void __init resource_init(void)
 	bss_resource.start = __pa_symbol(&__bss_start);
 	bss_resource.end = __pa_symbol(&__bss_stop) - 1;
 
-	for (i = 0; i < boot_mem_map.nr_map; i++) {
+	for_each_memblock(memory, region) {
+		phys_addr_t start = PFN_PHYS(memblock_region_memory_base_pfn(region));
+		phys_addr_t end = PFN_PHYS(memblock_region_memory_end_pfn(region)) - 1;
 		struct resource *res;
-		unsigned long start, end;
-
-		start = boot_mem_map.map[i].addr;
-		end = boot_mem_map.map[i].addr + boot_mem_map.map[i].size - 1;
-		if (start >= HIGHMEM_START)
-			continue;
-		if (end >= HIGHMEM_START)
-			end = HIGHMEM_START - 1;
 
 		res = memblock_alloc(sizeof(struct resource), SMP_CACHE_BYTES);
 		if (!res)
@@ -865,20 +692,8 @@ static void __init resource_init(void)
 
 		res->start = start;
 		res->end = end;
-		res->flags = IORESOURCE_MEM | IORESOURCE_BUSY;
-
-		switch (boot_mem_map.map[i].type) {
-		case BOOT_MEM_RAM:
-		case BOOT_MEM_INIT_RAM:
-		case BOOT_MEM_ROM_DATA:
-			res->name = "System RAM";
-			res->flags |= IORESOURCE_SYSRAM;
-			break;
-		case BOOT_MEM_RESERVED:
-		case BOOT_MEM_NOMAP:
-		default:
-			res->name = "reserved";
-		}
+		res->flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
+		res->name = "System RAM";
 
 		request_resource(&iomem_resource, res);
 
-- 
2.22.0

