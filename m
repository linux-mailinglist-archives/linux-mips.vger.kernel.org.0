Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D9F628C784
	for <lists+linux-mips@lfdr.de>; Tue, 13 Oct 2020 05:19:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728874AbgJMDTv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Oct 2020 23:19:51 -0400
Received: from mail.loongson.cn ([114.242.206.163]:41320 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727831AbgJMDTu (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 12 Oct 2020 23:19:50 -0400
Received: from bogon.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxGMbPHIVfyvIcAA--.4326S2;
        Tue, 13 Oct 2020 11:19:43 +0800 (CST)
From:   Jinyang He <hejinyang@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: Add set_memory_node()
Date:   Tue, 13 Oct 2020 11:19:43 +0800
Message-Id: <1602559183-12225-1-git-send-email-hejinyang@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9DxGMbPHIVfyvIcAA--.4326S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWw4rZry5Gr4xGw4kuw4fuFg_yoWrZF1xpr
        47ur95Gr48Wrn7W3yfJryDurWrJwnYkFW3CFW7AryDX3ZrXr17Arn3tF13CryUtrW8t3WS
        gF1Fgry2gan2k3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkIb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
        vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
        Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJV
        W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK67AK6r48MxAI
        w28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr
        4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxG
        rwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8Jw
        CI42IY6xAIw20EY4v20xvaj40_Zr0_Wr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvE
        x4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU5Gjg3UUUUU==
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Commit e7ae8d174eec ("MIPS: replace add_memory_region with memblock")
replaced add_memory_region(, , BOOT_MEM_RAM) with memblock_add(). But
it doesn't work well on some platforms which have NUMA like Loongson64.
Because memblock_add() calls memblock_add_range() and sets memory at
MAX_NUMNODES. As mm/memblock.c says, assign the region to a NUMA node
later by using memblock_set_node(). This patch provides a NUMA port
set_memory_node() and provides Loongson64 specific function.

The one of examples as follows,
cmdline + "mem=220M@2M"

arch/mips/kernel/setup.c:
	parse_early_param();
+	__memblock_dump_all();
	if (usermem)

Without this patch:
...
[    0.000000] MEMBLOCK configuration:
[    0.000000]  memory size = 0x000000000dc00000 reserved size = 0x0000000003d74000
[    0.000000]  memory.cnt  = 0x1
[    0.000000]  memory[0x0]	[0x0000000000200000-0x000000000ddfffff], 0x000000000dc00000 bytes flags: 0x0
...
and stopped starting.

With this patch:
...
[    0.000000] MEMBLOCK configuration:
[    0.000000]  memory size = 0x000000000dc00000 reserved size = 0x0000000003d74000
[    0.000000]  memory.cnt  = 0x1
[    0.000000]  memory[0x0]	[0x0000000000200000-0x000000000ddfffff], 0x000000000dc00000 bytes on node 0 flags: 0x0
...
and started well.

Signed-off-by: Jinyang He <hejinyang@loongson.cn>
---
 arch/mips/include/asm/bootinfo.h |  4 ++++
 arch/mips/kernel/setup.c         | 12 ++++++++++++
 arch/mips/loongson64/numa.c      |  8 ++++++++
 arch/mips/sgi-ip27/ip27-memory.c |  5 +++++
 4 files changed, 29 insertions(+)

diff --git a/arch/mips/include/asm/bootinfo.h b/arch/mips/include/asm/bootinfo.h
index aa03b12..29e2d9c 100644
--- a/arch/mips/include/asm/bootinfo.h
+++ b/arch/mips/include/asm/bootinfo.h
@@ -92,6 +92,10 @@ extern unsigned long mips_machtype;
 
 extern void detect_memory_region(phys_addr_t start, phys_addr_t sz_min,  phys_addr_t sz_max);
 
+#ifdef CONFIG_NUMA
+extern void set_memory_node(phys_addr_t start, phys_addr_t size);
+#endif
+
 extern void prom_init(void);
 extern void prom_free_prom_memory(void);
 extern void prom_cleanup(void);
diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index fb05b66..c1e282d 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -362,6 +362,9 @@ static int __init early_parse_mem(char *p)
 		start = memparse(p + 1, &p);
 
 	memblock_add(start, size);
+#ifdef CONFIG_NUMA
+	set_memory_node(start, size);
+#endif
 
 	return 0;
 }
@@ -388,12 +391,18 @@ static int __init early_parse_memmap(char *p)
 	if (*p == '@') {
 		start_at = memparse(p+1, &p);
 		memblock_add(start_at, mem_size);
+#ifdef CONFIG_NUMA
+		set_memory_node(start_at, mem_size);
+#endif
 	} else if (*p == '#') {
 		pr_err("\"memmap=nn#ss\" (force ACPI data) invalid on MIPS\n");
 		return -EINVAL;
 	} else if (*p == '$') {
 		start_at = memparse(p+1, &p);
 		memblock_add(start_at, mem_size);
+#ifdef CONFIG_NUMA
+		set_memory_node(start_at, mem_size);
+#endif
 		memblock_reserve(start_at, mem_size);
 	} else {
 		pr_err("\"memmap\" invalid format!\n");
@@ -509,6 +518,9 @@ static void __init check_kernel_sections_mem(void)
 	if (!memblock_is_region_memory(start, size)) {
 		pr_info("Kernel sections are not in the memory maps\n");
 		memblock_add(start, size);
+#ifdef CONFIG_NUMA
+		set_memory_node(start, size);
+#endif
 	}
 }
 
diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
index cf9459f..d428058 100644
--- a/arch/mips/loongson64/numa.c
+++ b/arch/mips/loongson64/numa.c
@@ -234,6 +234,14 @@ void __init mem_init(void)
 	mem_init_print_info(NULL);
 }
 
+void __init set_memory_node(phys_addr_t start, phys_addr_t size)
+{
+	u64 node_id;
+
+	node_id = (start >> 44) & 3;
+	memblock_set_node(start, size, &memblock.memory, node_id);
+}
+
 /* All PCI device belongs to logical Node-0 */
 int pcibus_to_node(struct pci_bus *bus)
 {
diff --git a/arch/mips/sgi-ip27/ip27-memory.c b/arch/mips/sgi-ip27/ip27-memory.c
index d411e0a..f0ed2d4 100644
--- a/arch/mips/sgi-ip27/ip27-memory.c
+++ b/arch/mips/sgi-ip27/ip27-memory.c
@@ -427,3 +427,8 @@ void __init mem_init(void)
 	setup_zero_pages();	/* This comes from node 0 */
 	mem_init_print_info(NULL);
 }
+
+void __init set_memory_node(phys_addr_t start, phys_addr_t size)
+{
+
+}
-- 
2.1.0

