Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F214D100C
	for <lists+linux-mips@lfdr.de>; Wed,  9 Oct 2019 15:28:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731465AbfJIN1d (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 9 Oct 2019 09:27:33 -0400
Received: from mx2.suse.de ([195.135.220.15]:47496 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731152AbfJIN1d (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 9 Oct 2019 09:27:33 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id D2A20B182;
        Wed,  9 Oct 2019 13:27:29 +0000 (UTC)
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] MIPS: SGI-IP22/28: Use PROM for memory detection
Date:   Wed,  9 Oct 2019 15:27:17 +0200
Message-Id: <20191009132718.25346-7-tbogendoerfer@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191009132718.25346-1-tbogendoerfer@suse.de>
References: <20191009132718.25346-1-tbogendoerfer@suse.de>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

EARLY_PRINTK uses ArcWrite (via prom_putchar) on IP22/28, which needs
to not mess up PROMs data structures. ARC PROM gives out a list of
memory chunks, which are used and which are free. This fixes the
problem of not working early printk.

By using XKPHYS spaces more than 256MB memory on Indigo2 R4k machines
is working now, too.

Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
---
 arch/mips/Kconfig                        | 20 ++-------
 arch/mips/fw/arc/memory.c                |  9 ++++
 arch/mips/include/asm/bootinfo.h         |  1 +
 arch/mips/include/asm/mach-ip22/spaces.h |  9 ----
 arch/mips/sgi-ip22/ip22-mc.c             | 74 +++++++++-----------------------
 5 files changed, 34 insertions(+), 79 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 37336d4ab969..4d403be641bb 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -633,6 +633,7 @@ config RALINK
 
 config SGI_IP22
 	bool "SGI IP22 (Indy/Indigo2)"
+	select ARC_MEMORY
 	select ARC_PROMLIB
 	select FW_ARC
 	select FW_ARC32
@@ -657,14 +658,7 @@ config SGI_IP22
 	select SWAP_IO_SPACE
 	select SYS_HAS_CPU_R4X00
 	select SYS_HAS_CPU_R5000
-	#
-	# Disable EARLY_PRINTK for now since it leads to overwritten prom
-	# memory during early boot on some machines.
-	#
-	# See http://www.linux-mips.org/cgi-bin/mesg.cgi?a=linux-mips&i=20091119164009.GA15038%40deprecation.cyrius.com
-	# for a more details discussion
-	#
-	# select SYS_HAS_EARLY_PRINTK
+	select SYS_HAS_EARLY_PRINTK
 	select SYS_SUPPORTS_32BIT_KERNEL
 	select SYS_SUPPORTS_64BIT_KERNEL
 	select SYS_SUPPORTS_BIG_ENDIAN
@@ -702,6 +696,7 @@ config SGI_IP27
 
 config SGI_IP28
 	bool "SGI IP28 (Indigo2 R10k)"
+	select ARC_MEMORY
 	select ARC_PROMLIB
 	select FW_ARC
 	select FW_ARC64
@@ -724,14 +719,7 @@ config SGI_IP28
 	select SGI_HAS_ZILOG
 	select SWAP_IO_SPACE
 	select SYS_HAS_CPU_R10000
-	#
-	# Disable EARLY_PRINTK for now since it leads to overwritten prom
-	# memory during early boot on some machines.
-	#
-	# See http://www.linux-mips.org/cgi-bin/mesg.cgi?a=linux-mips&i=20091119164009.GA15038%40deprecation.cyrius.com
-	# for a more details discussion
-	#
-	# select SYS_HAS_EARLY_PRINTK
+	select SYS_HAS_EARLY_PRINTK
 	select SYS_SUPPORTS_64BIT_KERNEL
 	select SYS_SUPPORTS_BIG_ENDIAN
 	select MIPS_L1_CACHE_SHIFT_7
diff --git a/arch/mips/fw/arc/memory.c b/arch/mips/fw/arc/memory.c
index b4328b3b5288..dbbcddc82823 100644
--- a/arch/mips/fw/arc/memory.c
+++ b/arch/mips/fw/arc/memory.c
@@ -158,6 +158,10 @@ void __init prom_meminit(void)
 	}
 }
 
+void __weak __init prom_cleanup(void)
+{
+}
+
 void __init prom_free_prom_memory(void)
 {
 	int i;
@@ -169,4 +173,9 @@ void __init prom_free_prom_memory(void)
 		free_init_pages("prom memory",
 			prom_mem_base[i], prom_mem_base[i] + prom_mem_size[i]);
 	}
+	/*
+	 * at this point it isn't safe to call PROM functions
+	 * give platforms a way to do PROM cleanups
+	 */
+	prom_cleanup();
 }
diff --git a/arch/mips/include/asm/bootinfo.h b/arch/mips/include/asm/bootinfo.h
index 34d62229dea5..a9250f5c964f 100644
--- a/arch/mips/include/asm/bootinfo.h
+++ b/arch/mips/include/asm/bootinfo.h
@@ -99,6 +99,7 @@ extern void detect_memory_region(phys_addr_t start, phys_addr_t sz_min,  phys_ad
 
 extern void prom_init(void);
 extern void prom_free_prom_memory(void);
+extern void prom_cleanup(void);
 
 extern void free_init_pages(const char *what,
 			    unsigned long begin, unsigned long end);
diff --git a/arch/mips/include/asm/mach-ip22/spaces.h b/arch/mips/include/asm/mach-ip22/spaces.h
index 78d0335f5f2e..24fe92cb5313 100644
--- a/arch/mips/include/asm/mach-ip22/spaces.h
+++ b/arch/mips/include/asm/mach-ip22/spaces.h
@@ -12,15 +12,6 @@
 
 #define PHYS_OFFSET     _AC(0x08000000, UL)
 
-#ifdef CONFIG_64BIT
-
-#define CAC_BASE		0xffffffff80000000
-#define IO_BASE			0xffffffffa0000000
-#define UNCAC_BASE		0xffffffffa0000000
-#define MAP_BASE		0xc000000000000000
-
-#endif /* CONFIG_64BIT */
-
 #include <asm/mach-generic/spaces.h>
 
 #endif /* __ASM_MACH_IP22_SPACES_H */
diff --git a/arch/mips/sgi-ip22/ip22-mc.c b/arch/mips/sgi-ip22/ip22-mc.c
index 1944d41507ef..74e5b9e27d6c 100644
--- a/arch/mips/sgi-ip22/ip22-mc.c
+++ b/arch/mips/sgi-ip22/ip22-mc.c
@@ -11,6 +11,7 @@
 #include <linux/init.h>
 #include <linux/export.h>
 #include <linux/kernel.h>
+#include <linux/memblock.h>
 #include <linux/spinlock.h>
 
 #include <asm/io.h>
@@ -40,70 +41,36 @@ static inline unsigned int get_bank_config(int bank)
 	return bank % 2 ? res & 0xffff : res >> 16;
 }
 
-struct mem {
-	unsigned long addr;
-	unsigned long size;
-};
-
+#if defined(CONFIG_SGI_IP28) || defined(CONFIG_32BIT)
+static void __init probe_memory(void)
+{
+	/* prom detects all usable memory */
+}
+#else
 /*
- * Detect installed memory, do some sanity checks and notify kernel about it
+ * Detect installed memory, which PROM misses
  */
 static void __init probe_memory(void)
 {
-	int i, j, found, cnt = 0;
-	struct mem bank[4];
-	struct mem space[2] = {{SGIMC_SEG0_BADDR, 0}, {SGIMC_SEG1_BADDR, 0}};
+	unsigned long addr, size;
+	int i;
 
 	printk(KERN_INFO "MC: Probing memory configuration:\n");
-	for (i = 0; i < ARRAY_SIZE(bank); i++) {
+	for (i = 0; i < 4; i++) {
 		unsigned int tmp = get_bank_config(i);
 		if (!(tmp & SGIMC_MCONFIG_BVALID))
 			continue;
 
-		bank[cnt].size = get_bank_size(tmp);
-		bank[cnt].addr = get_bank_addr(tmp);
+		size = get_bank_size(tmp);
+		addr = get_bank_addr(tmp);
 		printk(KERN_INFO " bank%d: %3ldM @ %08lx\n",
-			i, bank[cnt].size / 1024 / 1024, bank[cnt].addr);
-		cnt++;
-	}
+			i, size / 1024 / 1024, addr);
 
-	/* And you thought bubble sort is dead algorithm... */
-	do {
-		unsigned long addr, size;
-
-		found = 0;
-		for (i = 1; i < cnt; i++)
-			if (bank[i-1].addr > bank[i].addr) {
-				addr = bank[i].addr;
-				size = bank[i].size;
-				bank[i].addr = bank[i-1].addr;
-				bank[i].size = bank[i-1].size;
-				bank[i-1].addr = addr;
-				bank[i-1].size = size;
-				found = 1;
-			}
-	} while (found);
-
-	/* Figure out how are memory banks mapped into spaces */
-	for (i = 0; i < cnt; i++) {
-		found = 0;
-		for (j = 0; j < ARRAY_SIZE(space) && !found; j++)
-			if (space[j].addr + space[j].size == bank[i].addr) {
-				space[j].size += bank[i].size;
-				found = 1;
-			}
-		/* There is either hole or overlapping memory */
-		if (!found)
-			printk(KERN_CRIT "MC: Memory configuration mismatch "
-					 "(%08lx), expect Bus Error soon\n",
-					 bank[i].addr);
+		if (addr >= SGIMC_SEG1_BADDR)
+			memblock_add(addr, size);
 	}
-
-	for (i = 0; i < ARRAY_SIZE(space); i++)
-		if (space[i].size)
-			add_memory_region(space[i].addr, space[i].size,
-					  BOOT_MEM_RAM);
 }
+#endif
 
 void __init sgimc_init(void)
 {
@@ -205,10 +172,9 @@ void __init sgimc_init(void)
 	probe_memory();
 }
 
-void __init prom_meminit(void) {}
-void __init prom_free_prom_memory(void)
-{
 #ifdef CONFIG_SGI_IP28
+void __init prom_cleanup(void)
+{
 	u32 mconfig1;
 	unsigned long flags;
 	spinlock_t lock;
@@ -233,5 +199,5 @@ void __init prom_free_prom_memory(void)
 	sgimc->mconfig1 = mconfig1;
 	iob();
 	spin_unlock_irqrestore(&lock, flags);
-#endif
 }
+#endif
-- 
2.16.4

