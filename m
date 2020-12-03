Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABE3B2CD1ED
	for <lists+linux-mips@lfdr.de>; Thu,  3 Dec 2020 10:00:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387756AbgLCI6f (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 3 Dec 2020 03:58:35 -0500
Received: from mail.loongson.cn ([114.242.206.163]:33520 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728037AbgLCI6e (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 3 Dec 2020 03:58:34 -0500
Received: from bogon.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx73+LqMhf01sZAA--.41290S4;
        Thu, 03 Dec 2020 16:57:49 +0800 (CST)
From:   Jinyang He <hejinyang@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] MIPS: Add fix_range_node after parse "mem=" parameter
Date:   Thu,  3 Dec 2020 16:57:47 +0800
Message-Id: <1606985867-9791-3-git-send-email-hejinyang@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1606985867-9791-1-git-send-email-hejinyang@loongson.cn>
References: <1606985867-9791-1-git-send-email-hejinyang@loongson.cn>
X-CM-TRANSID: AQAAf9Dx73+LqMhf01sZAA--.41290S4
X-Coremail-Antispam: 1UD129KBjvJXoWxZrW5Zr1rWr1kXr18AryDAwb_yoW5Wry3pa
        9rAas5Gr4DWFn7Za4ft348urWrAws5KFWfuay7Cr95Z3ZIqr9rJr4SqF15Zr1jqrWrK3WF
        vF10g3y29a12kaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBYb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
        8067AKxVWUXwA2048vs2IY020Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK0II2c7xJM28CjxkF
        64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcV
        CY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv
        6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
        02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE
        4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK67AK6r43MxAIw28IcxkI7V
        AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
        r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6x
        IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAI
        w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
        0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUY8sqtUUUUU==
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This problem may only occur on NUMA platforms. When machine start
with the "mem=" parameter on Loongson64, it cannot boot. When parsing the
"mem=" parameter, first all the RAM was removed, and then the memory was
not added by memblock_add_node(), which caused the newly added memory to
be on MAX_NUMNODES. The key to solve this problem is to fix these memory
nodes through memblock_set_node() before bootmem_init() or earlier. So
it would be better to fix it before check_kernel_sections_mem().
The check_kernel_sections_mem() will check whether the current RAM can be
used by the kernel. If this fix is added after that, it will do a redundant
memblock_add operation. Adding the fixup_region_node() function can also
provide a reference for future platforms using NUMA when encountering
such problems.

Signed-off-by: Jinyang He <hejinyang@loongson.cn>
---
 arch/mips/include/asm/bootinfo.h |  1 +
 arch/mips/kernel/setup.c         |  6 +++++-
 arch/mips/loongson64/numa.c      | 11 +++++++++++
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/bootinfo.h b/arch/mips/include/asm/bootinfo.h
index aa03b12..ddc17b1 100644
--- a/arch/mips/include/asm/bootinfo.h
+++ b/arch/mips/include/asm/bootinfo.h
@@ -91,6 +91,7 @@ const char *get_system_type(void);
 extern unsigned long mips_machtype;
 
 extern void detect_memory_region(phys_addr_t start, phys_addr_t sz_min,  phys_addr_t sz_max);
+extern void fixup_region_node(void);
 
 extern void prom_init(void);
 extern void prom_free_prom_memory(void);
diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index b3a711e..fe93882 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -110,6 +110,8 @@ void __init detect_memory_region(phys_addr_t start, phys_addr_t sz_min, phys_add
 	memblock_add(start, size);
 }
 
+void __weak fixup_region_node(void) {}
+
 /*
  * Manage initrd
  */
@@ -631,8 +633,10 @@ static void __init arch_mem_init(char **cmdline_p)
 
 	parse_early_param();
 
-	if (usermem)
+	if (usermem) {
 		pr_info("User-defined physical RAM map overwrite\n");
+		fixup_region_node();
+	}
 
 	check_kernel_sections_mem();
 
diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
index c6f0c48..d8661cc 100644
--- a/arch/mips/loongson64/numa.c
+++ b/arch/mips/loongson64/numa.c
@@ -220,6 +220,17 @@ void __init mem_init(void)
 	mem_init_print_info(NULL);
 }
 
+void __init fixup_region_node(void)
+{
+	phys_addr_t start, end;
+	u64 i;
+
+	for_each_mem_range(i, &start, &end) {
+		memblock_set_node(start, end - start,
+				  &memblock.memory, pa_to_nid(start));
+	}
+}
+
 /* All PCI device belongs to logical Node-0 */
 int pcibus_to_node(struct pci_bus *bus)
 {
-- 
2.1.0

