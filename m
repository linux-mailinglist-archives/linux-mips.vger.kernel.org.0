Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 114882CD58B
	for <lists+linux-mips@lfdr.de>; Thu,  3 Dec 2020 13:34:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728940AbgLCMdv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 3 Dec 2020 07:33:51 -0500
Received: from mail.loongson.cn ([114.242.206.163]:54092 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388080AbgLCMdt (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 3 Dec 2020 07:33:49 -0500
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxqtH92shfdmcZAA--.56444S2;
        Thu, 03 Dec 2020 20:33:01 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Youling Tang <tangyouling@loongson.cn>,
        Jinyang He <hejinyang@loongson.cn>
Subject: [PATCH] MIPS: Loongson64: Give chance to build under !CONFIG_NUMA and !CONFIG_SMP
Date:   Thu,  3 Dec 2020 20:32:52 +0800
Message-Id: <1606998772-5904-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9AxqtH92shfdmcZAA--.56444S2
X-Coremail-Antispam: 1UD129KBjvJXoWxtw4rCw48XF1rKrWUtF17GFg_yoW3Xr1xpr
        WfA348Gr45XwnrCFWfKrykurZ5Jas5CwsrJF42yryDZFyDJ34Ivr1rtF1jq3yUJrWvqF1j
        grZ5KF17Ka1Sk3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6ryU
        MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
        0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0E
        wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
        W8JwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
        IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbtxhPUUUU
        U==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In the current code, we can not build under !CONFIG_NUMA and !CONFIG_SMP
on the Loongson64 platform, it seems bad for the users who just want to
use pure single core (not nosmp) to debug, so do the following things to
give them a chance:

(1) Do not select NUMA and SMP for MACH_LOONGSON64 in Kconfig, make NUMA
depends on SMP, and then just set them in the loongson3_defconfig.
(2) Move szmem() from numa.c to init.c and add prom_init_memory() under
!CONFIG_NUMA.
(3) Clean up szmem() due to the statements of case SYSTEM_RAM_LOW and
SYSTEM_RAM_HIGH are the same.
(4) Remove the useless declaration of prom_init_memory() and add the
declaration of szmem() in loongson.h to avoid build error.

Signed-off-by: Youling Tang <tangyouling@loongson.cn>
Signed-off-by: Jinyang He <hejinyang@loongson.cn>
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/mips/Kconfig                                |  3 +-
 arch/mips/configs/loongson3_defconfig            |  2 +
 arch/mips/include/asm/mach-loongson64/loongson.h |  2 +-
 arch/mips/loongson64/init.c                      | 49 ++++++++++++++++++++++
 arch/mips/loongson64/numa.c                      | 52 +-----------------------
 5 files changed, 54 insertions(+), 54 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 44a47ad..2034c66 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -490,8 +490,6 @@ config MACH_LOONGSON64
 	select SYS_SUPPORTS_ZBOOT
 	select SYS_SUPPORTS_RELOCATABLE
 	select ZONE_DMA32
-	select NUMA
-	select SMP
 	select COMMON_CLK
 	select USE_OF
 	select BUILTIN_DTB
@@ -2755,6 +2753,7 @@ config ARCH_SPARSEMEM_ENABLE
 config NUMA
 	bool "NUMA Support"
 	depends on SYS_SUPPORTS_NUMA
+	depends on SMP
 	help
 	  Say Y to compile the kernel to support NUMA (Non-Uniform Memory
 	  Access).  This option improves performance on systems with more
diff --git a/arch/mips/configs/loongson3_defconfig b/arch/mips/configs/loongson3_defconfig
index 38a817e..93cdbb9 100644
--- a/arch/mips/configs/loongson3_defconfig
+++ b/arch/mips/configs/loongson3_defconfig
@@ -31,6 +31,8 @@ CONFIG_PERF_EVENTS=y
 CONFIG_MACH_LOONGSON64=y
 CONFIG_CPU_HAS_MSA=y
 CONFIG_NR_CPUS=16
+CONFIG_NUMA=y
+CONFIG_SMP=y
 CONFIG_HZ_256=y
 CONFIG_KEXEC=y
 CONFIG_MIPS32_O32=y
diff --git a/arch/mips/include/asm/mach-loongson64/loongson.h b/arch/mips/include/asm/mach-loongson64/loongson.h
index fde1b75..ac1c20e 100644
--- a/arch/mips/include/asm/mach-loongson64/loongson.h
+++ b/arch/mips/include/asm/mach-loongson64/loongson.h
@@ -23,8 +23,8 @@ extern u32 memsize, highmemsize;
 extern const struct plat_smp_ops loongson3_smp_ops;
 
 /* loongson-specific command line, env and memory initialization */
-extern void __init prom_init_memory(void);
 extern void __init prom_init_env(void);
+extern void __init szmem(unsigned int node);
 extern void *loongson_fdt_blob;
 
 /* irq operation functions */
diff --git a/arch/mips/loongson64/init.c b/arch/mips/loongson64/init.c
index ed75f79..e13f704 100644
--- a/arch/mips/loongson64/init.c
+++ b/arch/mips/loongson64/init.c
@@ -47,6 +47,51 @@ void virtual_early_config(void)
 	node_id_offset = 44;
 }
 
+void __init szmem(unsigned int node)
+{
+	u32 i, mem_type;
+	static unsigned long num_physpages;
+	u64 node_id, node_psize, start_pfn, end_pfn, mem_start, mem_size;
+
+	/* Parse memory information and activate */
+	for (i = 0; i < loongson_memmap->nr_map; i++) {
+		node_id = loongson_memmap->map[i].node_id;
+		if (node_id != node)
+			continue;
+
+		mem_type = loongson_memmap->map[i].mem_type;
+		mem_size = loongson_memmap->map[i].mem_size;
+		mem_start = loongson_memmap->map[i].mem_start;
+
+		switch (mem_type) {
+		case SYSTEM_RAM_LOW:
+		case SYSTEM_RAM_HIGH:
+			start_pfn = ((node_id << 44) + mem_start) >> PAGE_SHIFT;
+			node_psize = (mem_size << 20) >> PAGE_SHIFT;
+			end_pfn  = start_pfn + node_psize;
+			num_physpages += node_psize;
+			pr_info("Node%d: mem_type:%d, mem_start:0x%llx, mem_size:0x%llx MB\n",
+				(u32)node_id, mem_type, mem_start, mem_size);
+			pr_info("       start_pfn:0x%llx, end_pfn:0x%llx, num_physpages:0x%lx\n",
+				start_pfn, end_pfn, num_physpages);
+			memblock_add_node(PFN_PHYS(start_pfn), PFN_PHYS(node_psize), node);
+			break;
+		case SYSTEM_RAM_RESERVED:
+			pr_info("Node%d: mem_type:%d, mem_start:0x%llx, mem_size:0x%llx MB\n",
+				(u32)node_id, mem_type, mem_start, mem_size);
+			memblock_reserve(((node_id << 44) + mem_start), mem_size << 20);
+			break;
+		}
+	}
+}
+
+#ifndef CONFIG_NUMA
+static void __init prom_init_memory(void)
+{
+	szmem(0);
+}
+#endif
+
 void __init prom_init(void)
 {
 	fw_init_cmdline();
@@ -57,7 +102,11 @@ void __init prom_init(void)
 
 	loongson_sysconf.early_config();
 
+#ifdef CONFIG_NUMA
 	prom_init_numa_memory();
+#else
+	prom_init_memory();
+#endif
 
 	/* Hardcode to CPU UART 0 */
 	setup_8250_early_printk_port(TO_UNCAC(LOONGSON_REG_BASE + 0x1e0), 0, 1024);
diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
index c6f0c48..a8f57bf 100644
--- a/arch/mips/loongson64/numa.c
+++ b/arch/mips/loongson64/numa.c
@@ -25,6 +25,7 @@
 #include <asm/time.h>
 #include <asm/wbflush.h>
 #include <boot_param.h>
+#include <loongson.h>
 
 static struct pglist_data prealloc__node_data[MAX_NUMNODES];
 unsigned char __node_distances[MAX_NUMNODES][MAX_NUMNODES];
@@ -81,57 +82,6 @@ static void __init init_topology_matrix(void)
 	}
 }
 
-static void __init szmem(unsigned int node)
-{
-	u32 i, mem_type;
-	static unsigned long num_physpages;
-	u64 node_id, node_psize, start_pfn, end_pfn, mem_start, mem_size;
-
-	/* Parse memory information and activate */
-	for (i = 0; i < loongson_memmap->nr_map; i++) {
-		node_id = loongson_memmap->map[i].node_id;
-		if (node_id != node)
-			continue;
-
-		mem_type = loongson_memmap->map[i].mem_type;
-		mem_size = loongson_memmap->map[i].mem_size;
-		mem_start = loongson_memmap->map[i].mem_start;
-
-		switch (mem_type) {
-		case SYSTEM_RAM_LOW:
-			start_pfn = ((node_id << 44) + mem_start) >> PAGE_SHIFT;
-			node_psize = (mem_size << 20) >> PAGE_SHIFT;
-			end_pfn  = start_pfn + node_psize;
-			num_physpages += node_psize;
-			pr_info("Node%d: mem_type:%d, mem_start:0x%llx, mem_size:0x%llx MB\n",
-				(u32)node_id, mem_type, mem_start, mem_size);
-			pr_info("       start_pfn:0x%llx, end_pfn:0x%llx, num_physpages:0x%lx\n",
-				start_pfn, end_pfn, num_physpages);
-			memblock_add_node(PFN_PHYS(start_pfn),
-				PFN_PHYS(node_psize), node);
-			break;
-		case SYSTEM_RAM_HIGH:
-			start_pfn = ((node_id << 44) + mem_start) >> PAGE_SHIFT;
-			node_psize = (mem_size << 20) >> PAGE_SHIFT;
-			end_pfn  = start_pfn + node_psize;
-			num_physpages += node_psize;
-			pr_info("Node%d: mem_type:%d, mem_start:0x%llx, mem_size:0x%llx MB\n",
-				(u32)node_id, mem_type, mem_start, mem_size);
-			pr_info("       start_pfn:0x%llx, end_pfn:0x%llx, num_physpages:0x%lx\n",
-				start_pfn, end_pfn, num_physpages);
-			memblock_add_node(PFN_PHYS(start_pfn),
-				PFN_PHYS(node_psize), node);
-			break;
-		case SYSTEM_RAM_RESERVED:
-			pr_info("Node%d: mem_type:%d, mem_start:0x%llx, mem_size:0x%llx MB\n",
-				(u32)node_id, mem_type, mem_start, mem_size);
-			memblock_reserve(((node_id << 44) + mem_start),
-				mem_size << 20);
-			break;
-		}
-	}
-}
-
 static void __init node_mem_init(unsigned int node)
 {
 	unsigned long node_addrspace_offset;
-- 
2.1.0

