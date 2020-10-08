Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30FFE2870E6
	for <lists+linux-mips@lfdr.de>; Thu,  8 Oct 2020 10:44:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727628AbgJHIoO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 8 Oct 2020 04:44:14 -0400
Received: from mx2.suse.de ([195.135.220.15]:49630 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725915AbgJHIoM (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 8 Oct 2020 04:44:12 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 0DD7DAF21;
        Thu,  8 Oct 2020 08:44:08 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Hauke Mehrtens <hauke@hauke-m.de>,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        "Maciej W. Rozycki" <macro@linux-mips.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        John Crispin <john@phrozen.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] MIPS: replace add_memory_region with memblock
Date:   Thu,  8 Oct 2020 10:43:54 +0200
Message-Id: <20201008084357.42780-1-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.16.4
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

add_memory_region was the old interface for registering memory and
was already changed to used memblock internaly. Replace it by
directly calling memblock functions.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
Changes in v2:
	fixed missing memblock include in fw/sni/sniprom.c
	tested on cobalt, IP22, IP28, IP30, IP32, JAZZ, SNI

 arch/mips/alchemy/common/prom.c               |  3 +-
 arch/mips/ar7/memory.c                        |  2 +-
 arch/mips/ath25/ar2315.c                      |  3 +-
 arch/mips/ath25/ar5312.c                      |  3 +-
 arch/mips/bcm47xx/prom.c                      |  3 +-
 arch/mips/bcm47xx/setup.c                     |  2 +-
 arch/mips/bcm63xx/setup.c                     |  2 +-
 arch/mips/cavium-octeon/setup.c               | 24 ++++++-------
 arch/mips/cobalt/setup.c                      |  3 +-
 arch/mips/dec/prom/memory.c                   |  8 ++---
 arch/mips/fw/arc/memory.c                     | 28 ++++++++++-----
 arch/mips/fw/sni/sniprom.c                    |  4 +--
 arch/mips/include/asm/bootinfo.h              |  7 ----
 arch/mips/include/asm/netlogic/psb-bootinfo.h |  1 +
 arch/mips/kernel/prom.c                       | 10 ++++--
 arch/mips/kernel/setup.c                      | 50 ++++-----------------------
 arch/mips/loongson2ef/common/mem.c            | 12 ++-----
 arch/mips/loongson32/common/prom.c            |  4 +--
 arch/mips/netlogic/xlp/setup.c                |  2 +-
 arch/mips/netlogic/xlr/setup.c                |  5 +--
 arch/mips/ralink/of.c                         |  3 +-
 arch/mips/rb532/prom.c                        |  2 +-
 arch/mips/sgi-ip32/ip32-memory.c              |  3 +-
 arch/mips/sibyte/common/cfe.c                 | 16 ++++-----
 arch/mips/txx9/jmr3927/prom.c                 |  4 +--
 arch/mips/txx9/rbtx4927/prom.c                |  5 +--
 arch/mips/txx9/rbtx4938/prom.c                |  3 +-
 arch/mips/txx9/rbtx4939/prom.c                |  4 +--
 28 files changed, 89 insertions(+), 127 deletions(-)

diff --git a/arch/mips/alchemy/common/prom.c b/arch/mips/alchemy/common/prom.c
index cfa203064d3c..d910c0a64de9 100644
--- a/arch/mips/alchemy/common/prom.c
+++ b/arch/mips/alchemy/common/prom.c
@@ -35,6 +35,7 @@
 
 #include <linux/init.h>
 #include <linux/kernel.h>
+#include <linux/memblock.h>
 #include <linux/sizes.h>
 #include <linux/string.h>
 
@@ -93,7 +94,7 @@ void __init prom_init(void)
 	if (!memsize_str || kstrtoul(memsize_str, 0, &memsize))
 		memsize = SZ_64M; /* minimum memsize is 64MB RAM */
 
-	add_memory_region(0, memsize, BOOT_MEM_RAM);
+	memblock_add(0, memsize);
 }
 
 static inline unsigned char str2hexnum(unsigned char c)
diff --git a/arch/mips/ar7/memory.c b/arch/mips/ar7/memory.c
index ad6efb36ebfe..787716c5e946 100644
--- a/arch/mips/ar7/memory.c
+++ b/arch/mips/ar7/memory.c
@@ -47,7 +47,7 @@ void __init prom_meminit(void)
 	unsigned long pages;
 
 	pages = memsize() >> PAGE_SHIFT;
-	add_memory_region(PHYS_OFFSET, pages << PAGE_SHIFT, BOOT_MEM_RAM);
+	memblock_add(PHYS_OFFSET, pages << PAGE_SHIFT);
 }
 
 void __init prom_free_prom_memory(void)
diff --git a/arch/mips/ath25/ar2315.c b/arch/mips/ath25/ar2315.c
index e7b53e3960c8..9dbed7b5ea76 100644
--- a/arch/mips/ath25/ar2315.c
+++ b/arch/mips/ath25/ar2315.c
@@ -19,6 +19,7 @@
 #include <linux/bitops.h>
 #include <linux/irqdomain.h>
 #include <linux/interrupt.h>
+#include <linux/memblock.h>
 #include <linux/platform_device.h>
 #include <linux/reboot.h>
 #include <asm/bootinfo.h>
@@ -266,7 +267,7 @@ void __init ar2315_plat_mem_setup(void)
 	memsize <<= 1 + ATH25_REG_MS(memcfg, AR2315_MEM_CFG_COL_WIDTH);
 	memsize <<= 1 + ATH25_REG_MS(memcfg, AR2315_MEM_CFG_ROW_WIDTH);
 	memsize <<= 3;
-	add_memory_region(0, memsize, BOOT_MEM_RAM);
+	memblock_add(0, memsize);
 	iounmap(sdram_base);
 
 	ar2315_rst_base = ioremap(AR2315_RST_BASE, AR2315_RST_SIZE);
diff --git a/arch/mips/ath25/ar5312.c b/arch/mips/ath25/ar5312.c
index 42bf2afb4765..23c879f4b734 100644
--- a/arch/mips/ath25/ar5312.c
+++ b/arch/mips/ath25/ar5312.c
@@ -19,6 +19,7 @@
 #include <linux/bitops.h>
 #include <linux/irqdomain.h>
 #include <linux/interrupt.h>
+#include <linux/memblock.h>
 #include <linux/platform_device.h>
 #include <linux/mtd/physmap.h>
 #include <linux/reboot.h>
@@ -363,7 +364,7 @@ void __init ar5312_plat_mem_setup(void)
 	memsize = (bank0_ac ? (1 << (bank0_ac + 1)) : 0) +
 		  (bank1_ac ? (1 << (bank1_ac + 1)) : 0);
 	memsize <<= 20;
-	add_memory_region(0, memsize, BOOT_MEM_RAM);
+	memblock_add(0, memsize);
 	iounmap(sdram_base);
 
 	ar5312_rst_base = ioremap(AR5312_RST_BASE, AR5312_RST_SIZE);
diff --git a/arch/mips/bcm47xx/prom.c b/arch/mips/bcm47xx/prom.c
index 135a5407f015..3e2a8166377f 100644
--- a/arch/mips/bcm47xx/prom.c
+++ b/arch/mips/bcm47xx/prom.c
@@ -27,6 +27,7 @@
 #include <linux/init.h>
 #include <linux/types.h>
 #include <linux/kernel.h>
+#include <linux/memblock.h>
 #include <linux/spinlock.h>
 #include <linux/ssb/ssb_driver_chipcommon.h>
 #include <linux/ssb/ssb_regs.h>
@@ -97,7 +98,7 @@ static __init void prom_init_mem(void)
 	 */
 	if (c->cputype == CPU_74K && (mem == (128  << 20)))
 		mem -= 0x1000;
-	add_memory_region(0, mem, BOOT_MEM_RAM);
+	memblock_add(0, mem);
 }
 
 /*
diff --git a/arch/mips/bcm47xx/setup.c b/arch/mips/bcm47xx/setup.c
index 82627c264964..751997eb1552 100644
--- a/arch/mips/bcm47xx/setup.c
+++ b/arch/mips/bcm47xx/setup.c
@@ -141,7 +141,7 @@ static void __init bcm47xx_register_bcma(void)
 
 /*
  * Memory setup is done in the early part of MIPS's arch_mem_init. It's supposed
- * to detect memory and record it with add_memory_region.
+ * to detect memory and record it with memblock_add.
  * Any extra initializaion performed here must not use kmalloc or bootmem.
  */
 void __init plat_mem_setup(void)
diff --git a/arch/mips/bcm63xx/setup.c b/arch/mips/bcm63xx/setup.c
index e28ee9a7cc7e..d811e3e03f81 100644
--- a/arch/mips/bcm63xx/setup.c
+++ b/arch/mips/bcm63xx/setup.c
@@ -146,7 +146,7 @@ void __init plat_time_init(void)
 
 void __init plat_mem_setup(void)
 {
-	add_memory_region(0, bcm63xx_get_memory_size(), BOOT_MEM_RAM);
+	memblock_add(0, bcm63xx_get_memory_size());
 
 	_machine_halt = bcm63xx_machine_halt;
 	_machine_restart = __bcm63xx_machine_reboot;
diff --git a/arch/mips/cavium-octeon/setup.c b/arch/mips/cavium-octeon/setup.c
index 8a357cb068c2..561389d3fadb 100644
--- a/arch/mips/cavium-octeon/setup.c
+++ b/arch/mips/cavium-octeon/setup.c
@@ -16,6 +16,7 @@
 #include <linux/export.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/memblock.h>
 #include <linux/serial.h>
 #include <linux/smp.h>
 #include <linux/types.h>
@@ -930,7 +931,7 @@ static __init void memory_exclude_page(u64 addr, u64 *mem, u64 *size)
 {
 	if (addr > *mem && addr < *mem + *size) {
 		u64 inc = addr - *mem;
-		add_memory_region(*mem, inc, BOOT_MEM_RAM);
+		memblock_add(*mem, inc);
 		*mem += inc;
 		*size -= inc;
 	}
@@ -992,19 +993,18 @@ void __init plat_mem_setup(void)
 
 /* Crashkernel ignores bootmem list. It relies on mem=X@Y option */
 #ifdef CONFIG_CRASH_DUMP
-	add_memory_region(reserve_low_mem, max_memory, BOOT_MEM_RAM);
+	memblock_add(reserve_low_mem, max_memory);
 	total += max_memory;
 #else
 #ifdef CONFIG_KEXEC
 	if (crashk_size > 0) {
-		add_memory_region(crashk_base, crashk_size, BOOT_MEM_RAM);
+		memblock_add(crashk_base, crashk_size);
 		crashk_end = crashk_base + crashk_size;
 	}
 #endif
 	/*
-	 * When allocating memory, we want incrementing addresses from
-	 * bootmem_alloc so the code in add_memory_region can merge
-	 * regions next to each other.
+	 * When allocating memory, we want incrementing addresses,
+	 * which is handled by memblock
 	 */
 	cvmx_bootmem_lock();
 	while (total < max_memory) {
@@ -1039,13 +1039,9 @@ void __init plat_mem_setup(void)
 			 */
 			if (memory < crashk_base && end >  crashk_end) {
 				/* region is fully in */
-				add_memory_region(memory,
-						  crashk_base - memory,
-						  BOOT_MEM_RAM);
+				memblock_add(memory, crashk_base - memory);
 				total += crashk_base - memory;
-				add_memory_region(crashk_end,
-						  end - crashk_end,
-						  BOOT_MEM_RAM);
+				memblock_add(crashk_end, end - crashk_end);
 				total += end - crashk_end;
 				continue;
 			}
@@ -1073,7 +1069,7 @@ void __init plat_mem_setup(void)
 				 */
 				mem_alloc_size -= end - crashk_base;
 #endif
-			add_memory_region(memory, mem_alloc_size, BOOT_MEM_RAM);
+			memblock_add(memory, mem_alloc_size);
 			total += mem_alloc_size;
 			/* Recovering mem_alloc_size */
 			mem_alloc_size = 4 << 20;
@@ -1088,7 +1084,7 @@ void __init plat_mem_setup(void)
 
 	/* Adjust for physical offset. */
 	kernel_start &= ~0xffffffff80000000ULL;
-	add_memory_region(kernel_start, kernel_size, BOOT_MEM_RAM);
+	memblock_add(kernel_start, kernel_size);
 #endif /* CONFIG_CRASH_DUMP */
 
 #ifdef CONFIG_CAVIUM_RESERVE32
diff --git a/arch/mips/cobalt/setup.c b/arch/mips/cobalt/setup.c
index c136a18c7221..46581e686882 100644
--- a/arch/mips/cobalt/setup.c
+++ b/arch/mips/cobalt/setup.c
@@ -13,6 +13,7 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/ioport.h>
+#include <linux/memblock.h>
 #include <linux/pm.h>
 
 #include <asm/bootinfo.h>
@@ -112,7 +113,7 @@ void __init prom_init(void)
 			strlcat(arcs_cmdline, " ", COMMAND_LINE_SIZE);
 	}
 
-	add_memory_region(0x0, memsz, BOOT_MEM_RAM);
+	memblock_add(0, memsz);
 
 	setup_8250_early_printk_port(CKSEG1ADDR(0x1c800000), 0, 0);
 }
diff --git a/arch/mips/dec/prom/memory.c b/arch/mips/dec/prom/memory.c
index df8e1af20eb7..44490c30d63b 100644
--- a/arch/mips/dec/prom/memory.c
+++ b/arch/mips/dec/prom/memory.c
@@ -12,7 +12,6 @@
 #include <linux/types.h>
 
 #include <asm/addrspace.h>
-#include <asm/bootinfo.h>
 #include <asm/dec/machtype.h>
 #include <asm/dec/prom.h>
 #include <asm/page.h>
@@ -50,8 +49,7 @@ static __init void pmax_setup_memory_region(void)
 	}
 	memcpy((void *)(CKSEG0 + 0x80), &old_handler, 0x80);
 
-	add_memory_region(0, (unsigned long)memory_page - CKSEG1 - CHUNK_SIZE,
-			  BOOT_MEM_RAM);
+	memblock_add(0, (unsigned long)memory_page - CKSEG1 - CHUNK_SIZE);
 }
 
 /*
@@ -76,13 +74,13 @@ static __init void rex_setup_memory_region(void)
 		else if (!mem_size)
 			mem_start += (8 * bm->pagesize);
 		else {
-			add_memory_region(mem_start, mem_size, BOOT_MEM_RAM);
+			memblock_add(mem_start, mem_size);
 			mem_start += mem_size + (8 * bm->pagesize);
 			mem_size = 0;
 		}
 	}
 	if (mem_size)
-		add_memory_region(mem_start, mem_size, BOOT_MEM_RAM);
+		memblock_add(mem_start, mem_size);
 }
 
 void __init prom_meminit(u32 magic)
diff --git a/arch/mips/fw/arc/memory.c b/arch/mips/fw/arc/memory.c
index da0712ad85f5..37625ae5e35d 100644
--- a/arch/mips/fw/arc/memory.c
+++ b/arch/mips/fw/arc/memory.c
@@ -68,20 +68,24 @@ static char *arc_mtypes[8] = {
 						: arc_mtypes[a.arc]
 #endif
 
+enum {
+	mem_free, mem_prom_used, mem_reserved
+};
+
 static inline int memtype_classify_arcs(union linux_memtypes type)
 {
 	switch (type.arcs) {
 	case arcs_fcontig:
 	case arcs_free:
-		return BOOT_MEM_RAM;
+		return mem_free;
 	case arcs_atmp:
-		return BOOT_MEM_ROM_DATA;
+		return mem_prom_used;
 	case arcs_eblock:
 	case arcs_rvpage:
 	case arcs_bmem:
 	case arcs_prog:
 	case arcs_aperm:
-		return BOOT_MEM_RESERVED;
+		return mem_reserved;
 	default:
 		BUG();
 	}
@@ -93,15 +97,15 @@ static inline int memtype_classify_arc(union linux_memtypes type)
 	switch (type.arc) {
 	case arc_free:
 	case arc_fcontig:
-		return BOOT_MEM_RAM;
+		return mem_free;
 	case arc_atmp:
-		return BOOT_MEM_ROM_DATA;
+		return mem_prom_used;
 	case arc_eblock:
 	case arc_rvpage:
 	case arc_bmem:
 	case arc_prog:
 	case arc_aperm:
-		return BOOT_MEM_RESERVED;
+		return mem_reserved;
 	default:
 		BUG();
 	}
@@ -143,9 +147,17 @@ void __weak __init prom_meminit(void)
 		size = p->pages << ARC_PAGE_SHIFT;
 		type = prom_memtype_classify(p->type);
 
-		add_memory_region(base, size, type);
+		/* ignore mirrored RAM on IP28/IP30 */
+		if (base < PHYS_OFFSET)
+			continue;
+
+		memblock_add(base, size);
+
+		if (type == mem_reserved)
+			memblock_reserve(base, size);
 
-		if (type == BOOT_MEM_ROM_DATA) {
+		if (type == mem_prom_used) {
+			memblock_reserve(base, size);
 			if (nr_prom_mem >= 5) {
 				pr_err("Too many ROM DATA regions");
 				continue;
diff --git a/arch/mips/fw/sni/sniprom.c b/arch/mips/fw/sni/sniprom.c
index 80112f2298b6..8f6730376a42 100644
--- a/arch/mips/fw/sni/sniprom.c
+++ b/arch/mips/fw/sni/sniprom.c
@@ -11,6 +11,7 @@
 
 #include <linux/kernel.h>
 #include <linux/init.h>
+#include <linux/memblock.h>
 #include <linux/string.h>
 #include <linux/console.h>
 
@@ -131,8 +132,7 @@ static void __init sni_mem_init(void)
 		}
 		pr_debug("Bank%d: %08x @ %08x\n", i,
 			memconf[i].size, memconf[i].base);
-		add_memory_region(memconf[i].base, memconf[i].size,
-				  BOOT_MEM_RAM);
+		memblock_add(memconf[i].base, memconf[i].size);
 	}
 }
 
diff --git a/arch/mips/include/asm/bootinfo.h b/arch/mips/include/asm/bootinfo.h
index 6dd173a22aeb..aa03b1237155 100644
--- a/arch/mips/include/asm/bootinfo.h
+++ b/arch/mips/include/asm/bootinfo.h
@@ -90,13 +90,6 @@ const char *get_system_type(void);
 
 extern unsigned long mips_machtype;
 
-#define BOOT_MEM_RAM		1
-#define BOOT_MEM_ROM_DATA	2
-#define BOOT_MEM_RESERVED	3
-#define BOOT_MEM_INIT_RAM	4
-#define BOOT_MEM_NOMAP		5
-
-extern void add_memory_region(phys_addr_t start, phys_addr_t size, long type);
 extern void detect_memory_region(phys_addr_t start, phys_addr_t sz_min,  phys_addr_t sz_max);
 
 extern void prom_init(void);
diff --git a/arch/mips/include/asm/netlogic/psb-bootinfo.h b/arch/mips/include/asm/netlogic/psb-bootinfo.h
index 272544b55ceb..c716e9397113 100644
--- a/arch/mips/include/asm/netlogic/psb-bootinfo.h
+++ b/arch/mips/include/asm/netlogic/psb-bootinfo.h
@@ -87,6 +87,7 @@ struct nlm_boot_mem_map {
 		uint32_t type;		/* type of memory segment */
 	} map[NLM_BOOT_MEM_MAP_MAX];
 };
+#define NLM_BOOT_MEM_RAM	1
 
 /* Pointer to saved boot loader info */
 extern struct psb_info nlm_prom_info;
diff --git a/arch/mips/kernel/prom.c b/arch/mips/kernel/prom.c
index 9e50dc8df2f6..fab532cb5a11 100644
--- a/arch/mips/kernel/prom.c
+++ b/arch/mips/kernel/prom.c
@@ -50,14 +50,18 @@ void __init early_init_dt_add_memory_arch(u64 base, u64 size)
 		size = PHYS_ADDR_MAX - base;
 	}
 
-	add_memory_region(base, size, BOOT_MEM_RAM);
+	memblock_add(base, size);
 }
 
 int __init early_init_dt_reserve_memory_arch(phys_addr_t base,
 					phys_addr_t size, bool nomap)
 {
-	add_memory_region(base, size,
-			  nomap ? BOOT_MEM_NOMAP : BOOT_MEM_RESERVED);
+	if (nomap) {
+		memblock_remove(base, size);
+	} else {
+		memblock_add(base, size);
+		memblock_reserve(base, size);
+	}
 
 	return 0;
 }
diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 4c04a86f075b..fb05b66e111f 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -91,45 +91,6 @@ unsigned long ARCH_PFN_OFFSET;
 EXPORT_SYMBOL(ARCH_PFN_OFFSET);
 #endif
 
-void __init add_memory_region(phys_addr_t start, phys_addr_t size, long type)
-{
-	/*
-	 * Note: This function only exists for historical reason,
-	 * new code should use memblock_add or memblock_add_node instead.
-	 */
-
-	/*
-	 * If the region reaches the top of the physical address space, adjust
-	 * the size slightly so that (start + size) doesn't overflow
-	 */
-	if (start + size - 1 == PHYS_ADDR_MAX)
-		--size;
-
-	/* Sanity check */
-	if (start + size < start) {
-		pr_warn("Trying to add an invalid memory region, skipped\n");
-		return;
-	}
-
-	if (start < PHYS_OFFSET)
-		return;
-
-	memblock_add(start, size);
-	/* Reserve any memory except the ordinary RAM ranges. */
-	switch (type) {
-	case BOOT_MEM_RAM:
-		break;
-
-	case BOOT_MEM_NOMAP: /* Discard the range from the system. */
-		memblock_remove(start, size);
-		break;
-
-	default: /* Reserve the rest of the memory types at boot time */
-		memblock_reserve(start, size);
-		break;
-	}
-}
-
 void __init detect_memory_region(phys_addr_t start, phys_addr_t sz_min, phys_addr_t sz_max)
 {
 	void *dm = &detect_magic;
@@ -146,7 +107,7 @@ void __init detect_memory_region(phys_addr_t start, phys_addr_t sz_min, phys_add
 		((unsigned long long) sz_min) / SZ_1M,
 		((unsigned long long) sz_max) / SZ_1M);
 
-	add_memory_region(start, size, BOOT_MEM_RAM);
+	memblock_add(start, size);
 }
 
 /*
@@ -400,7 +361,7 @@ static int __init early_parse_mem(char *p)
 	if (*p == '@')
 		start = memparse(p + 1, &p);
 
-	add_memory_region(start, size, BOOT_MEM_RAM);
+	memblock_add(start, size);
 
 	return 0;
 }
@@ -426,13 +387,14 @@ static int __init early_parse_memmap(char *p)
 
 	if (*p == '@') {
 		start_at = memparse(p+1, &p);
-		add_memory_region(start_at, mem_size, BOOT_MEM_RAM);
+		memblock_add(start_at, mem_size);
 	} else if (*p == '#') {
 		pr_err("\"memmap=nn#ss\" (force ACPI data) invalid on MIPS\n");
 		return -EINVAL;
 	} else if (*p == '$') {
 		start_at = memparse(p+1, &p);
-		add_memory_region(start_at, mem_size, BOOT_MEM_RESERVED);
+		memblock_add(start_at, mem_size);
+		memblock_reserve(start_at, mem_size);
 	} else {
 		pr_err("\"memmap\" invalid format!\n");
 		return -EINVAL;
@@ -644,7 +606,7 @@ static void __init bootcmdline_init(void)
  * arch_mem_init - initialize memory management subsystem
  *
  *  o plat_mem_setup() detects the memory configuration and will record detected
- *    memory areas using add_memory_region.
+ *    memory areas using memblock_add.
  *
  * At this stage the memory configuration of the system is known to the
  * kernel but generic memory management system is still entirely uninitialized.
diff --git a/arch/mips/loongson2ef/common/mem.c b/arch/mips/loongson2ef/common/mem.c
index ae21f1c62baa..057d58bb470e 100644
--- a/arch/mips/loongson2ef/common/mem.c
+++ b/arch/mips/loongson2ef/common/mem.c
@@ -17,10 +17,7 @@ u32 memsize, highmemsize;
 
 void __init prom_init_memory(void)
 {
-	add_memory_region(0x0, (memsize << 20), BOOT_MEM_RAM);
-
-	add_memory_region(memsize << 20, LOONGSON_PCI_MEM_START - (memsize <<
-				20), BOOT_MEM_RESERVED);
+	memblock_add(0x0, (memsize << 20));
 
 #ifdef CONFIG_CPU_SUPPORTS_ADDRWINCFG
 	{
@@ -41,12 +38,7 @@ void __init prom_init_memory(void)
 
 #ifdef CONFIG_64BIT
 	if (highmemsize > 0)
-		add_memory_region(LOONGSON_HIGHMEM_START,
-				  highmemsize << 20, BOOT_MEM_RAM);
-
-	add_memory_region(LOONGSON_PCI_MEM_END + 1, LOONGSON_HIGHMEM_START -
-			  LOONGSON_PCI_MEM_END - 1, BOOT_MEM_RESERVED);
-
+		memblock_add(LOONGSON_HIGHMEM_START, highmemsize << 20);
 #endif /* !CONFIG_64BIT */
 }
 
diff --git a/arch/mips/loongson32/common/prom.c b/arch/mips/loongson32/common/prom.c
index fd76114fa3b0..c133b5adf34e 100644
--- a/arch/mips/loongson32/common/prom.c
+++ b/arch/mips/loongson32/common/prom.c
@@ -7,8 +7,8 @@
 
 #include <linux/io.h>
 #include <linux/init.h>
+#include <linux/memblock.h>
 #include <linux/serial_reg.h>
-#include <asm/bootinfo.h>
 #include <asm/fw/fw.h>
 
 #include <loongson1.h>
@@ -42,5 +42,5 @@ void __init prom_free_prom_memory(void)
 
 void __init plat_mem_setup(void)
 {
-	add_memory_region(0x0, (memsize << 20), BOOT_MEM_RAM);
+	memblock_add(0x0, (memsize << 20));
 }
diff --git a/arch/mips/netlogic/xlp/setup.c b/arch/mips/netlogic/xlp/setup.c
index 1a0fc5b62ba4..230adaf93e11 100644
--- a/arch/mips/netlogic/xlp/setup.c
+++ b/arch/mips/netlogic/xlp/setup.c
@@ -89,7 +89,7 @@ static void __init xlp_init_mem_from_bars(void)
 		if (map[i] > 0x10000000 && map[i] < 0x20000000)
 			map[i] = 0x20000000;
 
-		add_memory_region(map[i], map[i+1] - map[i], BOOT_MEM_RAM);
+		memblock_add(map[i], map[i+1] - map[i]);
 	}
 }
 
diff --git a/arch/mips/netlogic/xlr/setup.c b/arch/mips/netlogic/xlr/setup.c
index 72ceddc9a03f..627e88101316 100644
--- a/arch/mips/netlogic/xlr/setup.c
+++ b/arch/mips/netlogic/xlr/setup.c
@@ -34,6 +34,7 @@
 
 #include <linux/kernel.h>
 #include <linux/serial_8250.h>
+#include <linux/memblock.h>
 #include <linux/pm.h>
 
 #include <asm/idle.h>
@@ -149,7 +150,7 @@ static void prom_add_memory(void)
 
 	bootm = (void *)(long)nlm_prom_info.psb_mem_map;
 	for (i = 0; i < bootm->nr_map; i++) {
-		if (bootm->map[i].type != BOOT_MEM_RAM)
+		if (bootm->map[i].type != NLM_BOOT_MEM_RAM)
 			continue;
 		start = bootm->map[i].addr;
 		size   = bootm->map[i].size;
@@ -158,7 +159,7 @@ static void prom_add_memory(void)
 		if (i == 0 && start == 0 && size == 0x0c000000)
 			size = 0x0ff00000;
 
-		add_memory_region(start, size - pref_backup, BOOT_MEM_RAM);
+		memblock_add(start, size - pref_backup);
 	}
 }
 
diff --git a/arch/mips/ralink/of.c b/arch/mips/ralink/of.c
index 90c6d4a11c5d..cbae9d23ab7f 100644
--- a/arch/mips/ralink/of.c
+++ b/arch/mips/ralink/of.c
@@ -84,8 +84,7 @@ void __init plat_mem_setup(void)
 	if (memory_dtb)
 		of_scan_flat_dt(early_init_dt_scan_memory, NULL);
 	else if (soc_info.mem_size)
-		add_memory_region(soc_info.mem_base, soc_info.mem_size * SZ_1M,
-				  BOOT_MEM_RAM);
+		memblock_add(soc_info.mem_base, soc_info.mem_size * SZ_1M);
 	else
 		detect_memory_region(soc_info.mem_base,
 				     soc_info.mem_size_min * SZ_1M,
diff --git a/arch/mips/rb532/prom.c b/arch/mips/rb532/prom.c
index 303cc3dc1749..a9d1f2019dc3 100644
--- a/arch/mips/rb532/prom.c
+++ b/arch/mips/rb532/prom.c
@@ -126,5 +126,5 @@ void __init prom_init(void)
 
 	/* give all RAM to boot allocator,
 	 * except for the first 0x400 and the last 0x200 bytes */
-	add_memory_region(ddrbase + 0x400, memsize - 0x600, BOOT_MEM_RAM);
+	memblock_add(ddrbase + 0x400, memsize - 0x600);
 }
diff --git a/arch/mips/sgi-ip32/ip32-memory.c b/arch/mips/sgi-ip32/ip32-memory.c
index 62b956cc2d1d..0f53fed39da6 100644
--- a/arch/mips/sgi-ip32/ip32-memory.c
+++ b/arch/mips/sgi-ip32/ip32-memory.c
@@ -9,6 +9,7 @@
 #include <linux/types.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
+#include <linux/memblock.h>
 #include <linux/mm.h>
 
 #include <asm/ip32/crime.h>
@@ -36,7 +37,7 @@ void __init prom_meminit(void)
 
 		printk("CRIME MC: bank %u base 0x%016Lx size %LuMiB\n",
 			bank, base, size >> 20);
-		add_memory_region(base, size, BOOT_MEM_RAM);
+		memblock_add(base, size);
 	}
 }
 
diff --git a/arch/mips/sibyte/common/cfe.c b/arch/mips/sibyte/common/cfe.c
index cbf5939ed53a..89f7fca45152 100644
--- a/arch/mips/sibyte/common/cfe.c
+++ b/arch/mips/sibyte/common/cfe.c
@@ -114,16 +114,14 @@ static __init void prom_meminit(void)
 			if (initrd_start) {
 				if ((initrd_pstart > addr) &&
 				    (initrd_pstart < (addr + size))) {
-					add_memory_region(addr,
-							  initrd_pstart - addr,
-							  BOOT_MEM_RAM);
+					memblock_add(addr,
+						     initrd_pstart - addr);
 					rd_flag = 1;
 				}
 				if ((initrd_pend > addr) &&
 				    (initrd_pend < (addr + size))) {
-					add_memory_region(initrd_pend,
-						(addr + size) - initrd_pend,
-						 BOOT_MEM_RAM);
+					memblock_add(initrd_pend,
+						(addr + size) - initrd_pend);
 					rd_flag = 1;
 				}
 			}
@@ -142,7 +140,7 @@ static __init void prom_meminit(void)
 				 */
 				if (size > 512)
 					size -= 512;
-				add_memory_region(addr, size, BOOT_MEM_RAM);
+				memblock_add(addr, size);
 			}
 			board_mem_region_addrs[board_mem_region_count] = addr;
 			board_mem_region_sizes[board_mem_region_count] = size;
@@ -158,8 +156,8 @@ static __init void prom_meminit(void)
 	}
 #ifdef CONFIG_BLK_DEV_INITRD
 	if (initrd_start) {
-		add_memory_region(initrd_pstart, initrd_pend - initrd_pstart,
-				  BOOT_MEM_RESERVED);
+		memblock_add(initrd_pstart, initrd_pend - initrd_pstart);
+		memblock_reserve(initrd_pstart, initrd_pend - initrd_pstart);
 	}
 #endif
 }
diff --git a/arch/mips/txx9/jmr3927/prom.c b/arch/mips/txx9/jmr3927/prom.c
index 68a96473c134..53c68de54d30 100644
--- a/arch/mips/txx9/jmr3927/prom.c
+++ b/arch/mips/txx9/jmr3927/prom.c
@@ -37,7 +37,7 @@
  */
 #include <linux/init.h>
 #include <linux/kernel.h>
-#include <asm/bootinfo.h>
+#include <linux/memblock.h>
 #include <asm/txx9/generic.h>
 #include <asm/txx9/jmr3927.h>
 
@@ -47,6 +47,6 @@ void __init jmr3927_prom_init(void)
 	if ((tx3927_ccfgptr->ccfg & TX3927_CCFG_TLBOFF) == 0)
 		pr_err("TX3927 TLB off\n");
 
-	add_memory_region(0, JMR3927_SDRAM_SIZE, BOOT_MEM_RAM);
+	memblock_add(0, JMR3927_SDRAM_SIZE);
 	txx9_sio_putchar_init(TX3927_SIO_REG(1));
 }
diff --git a/arch/mips/txx9/rbtx4927/prom.c b/arch/mips/txx9/rbtx4927/prom.c
index fe6d0b54763f..9b4acff826eb 100644
--- a/arch/mips/txx9/rbtx4927/prom.c
+++ b/arch/mips/txx9/rbtx4927/prom.c
@@ -29,13 +29,14 @@
  *  with this program; if not, write to the Free Software Foundation, Inc.,
  *  675 Mass Ave, Cambridge, MA 02139, USA.
  */
+
 #include <linux/init.h>
-#include <asm/bootinfo.h>
+#include <linux/memblock.h>
 #include <asm/txx9/generic.h>
 #include <asm/txx9/rbtx4927.h>
 
 void __init rbtx4927_prom_init(void)
 {
-	add_memory_region(0, tx4927_get_mem_size(), BOOT_MEM_RAM);
+	memblock_add(0, tx4927_get_mem_size());
 	txx9_sio_putchar_init(TX4927_SIO_REG(0) & 0xfffffffffULL);
 }
diff --git a/arch/mips/txx9/rbtx4938/prom.c b/arch/mips/txx9/rbtx4938/prom.c
index 2b36a2ee744c..0de84716a428 100644
--- a/arch/mips/txx9/rbtx4938/prom.c
+++ b/arch/mips/txx9/rbtx4938/prom.c
@@ -12,12 +12,11 @@
 
 #include <linux/init.h>
 #include <linux/memblock.h>
-#include <asm/bootinfo.h>
 #include <asm/txx9/generic.h>
 #include <asm/txx9/rbtx4938.h>
 
 void __init rbtx4938_prom_init(void)
 {
-	add_memory_region(0, tx4938_get_mem_size(), BOOT_MEM_RAM);
+	memblock_add(0, tx4938_get_mem_size());
 	txx9_sio_putchar_init(TX4938_SIO_REG(0) & 0xfffffffffULL);
 }
diff --git a/arch/mips/txx9/rbtx4939/prom.c b/arch/mips/txx9/rbtx4939/prom.c
index 1dc47ce81c92..ba25ba1bd2ec 100644
--- a/arch/mips/txx9/rbtx4939/prom.c
+++ b/arch/mips/txx9/rbtx4939/prom.c
@@ -7,7 +7,7 @@
  */
 
 #include <linux/init.h>
-#include <asm/bootinfo.h>
+#include <linux/memblock.h>
 #include <asm/txx9/generic.h>
 #include <asm/txx9/rbtx4939.h>
 
@@ -23,7 +23,7 @@ void __init rbtx4939_prom_init(void)
 		win = ____raw_readq(&tx4939_ddrcptr->win[i]);
 		start = (unsigned long)(win >> 48);
 		size = (((unsigned long)(win >> 32) & 0xffff) + 1) - start;
-		add_memory_region(start << 20, size << 20, BOOT_MEM_RAM);
+		memblock_add(start << 20, size << 20);
 	}
 	txx9_sio_putchar_init(TX4939_SIO_REG(0) & 0xfffffffffULL);
 }
-- 
2.16.4

