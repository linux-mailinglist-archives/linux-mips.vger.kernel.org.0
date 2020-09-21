Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9C2927232F
	for <lists+linux-mips@lfdr.de>; Mon, 21 Sep 2020 13:56:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726402AbgIUL4a (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 21 Sep 2020 07:56:30 -0400
Received: from mail.loongson.cn ([114.242.206.163]:46626 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726326AbgIUL4a (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 21 Sep 2020 07:56:30 -0400
Received: from bogon.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxP9zolGhfDc8WAA--.1715S2;
        Mon, 21 Sep 2020 19:56:24 +0800 (CST)
From:   Jinyang He <hejinyang@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: Loongson64: Fix cmdline parsing "mem=" and "memmap="
Date:   Mon, 21 Sep 2020 19:56:24 +0800
Message-Id: <1600689384-11032-1-git-send-email-hejinyang@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9DxP9zolGhfDc8WAA--.1715S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXw43JFy7Cr17uFy5uw4DJwb_yoW5AF4fpr
        ZrCwn5Gr4rWFZ7Za4rtry8ur4rA3sYgFWfuFW7CF18uas5Zry7Ar4fG3WUXF1jqrW8t3WY
        qF1Fq3y7tanFkaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkab7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
        C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
        0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Cr0_Gr
        1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE14v_Gw4l42xK
        82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGw
        C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48J
        MIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
        IF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvE
        x4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07bYkskUUUUU=
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Commit a94e4f24ec83 ("MIPS: init: Drop boot_mem_map") left
add_memory_region() for historical reason. Machine cannot start normally
when use "mem=" on the Loongson64 platform because parsing "mem=" calls
memblock_add() by add_memory_region(). Loongson64 always enable NUMA and
need memblock_add_node().

Replace add_memory_rigion(start, size, BOOT_MEM_RAM) with a weak function
which named mips_memblock_add. For Loongson64, override mips_memblock_add
at loongson64/numa.c. "memmap=" is similar to "mem=", replace it too.

Signed-off-by: Jinyang He <hejinyang@loongson.cn>
---
 arch/mips/include/asm/bootinfo.h | 1 +
 arch/mips/kernel/setup.c         | 9 +++++++--
 arch/mips/loongson64/numa.c      | 8 ++++++++
 3 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/bootinfo.h b/arch/mips/include/asm/bootinfo.h
index 147c932..66fef4c 100644
--- a/arch/mips/include/asm/bootinfo.h
+++ b/arch/mips/include/asm/bootinfo.h
@@ -96,6 +96,7 @@ extern unsigned long mips_machtype;
 
 extern void add_memory_region(phys_addr_t start, phys_addr_t size, long type);
 extern void detect_memory_region(phys_addr_t start, phys_addr_t sz_min,  phys_addr_t sz_max);
+extern void mips_memblock_add(phys_addr_t start, phys_addr_t size);
 
 extern void prom_init(void);
 extern void prom_free_prom_memory(void);
diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index bf5f5ac..ef84b4d 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -149,6 +149,11 @@ void __init detect_memory_region(phys_addr_t start, phys_addr_t sz_min, phys_add
 	add_memory_region(start, size, BOOT_MEM_RAM);
 }
 
+void __init __weak mips_memblock_add(phys_addr_t start, phys_addr_t size)
+{
+	memblock_add(start, size);
+}
+
 /*
  * Manage initrd
  */
@@ -400,7 +405,7 @@ static int __init early_parse_mem(char *p)
 	if (*p == '@')
 		start = memparse(p + 1, &p);
 
-	add_memory_region(start, size, BOOT_MEM_RAM);
+	mips_memblock_add(start, size);
 
 	return 0;
 }
@@ -426,7 +431,7 @@ static int __init early_parse_memmap(char *p)
 
 	if (*p == '@') {
 		start_at = memparse(p+1, &p);
-		add_memory_region(start_at, mem_size, BOOT_MEM_RAM);
+		mips_memblock_add(start_at, mem_size);
 	} else if (*p == '#') {
 		pr_err("\"memmap=nn#ss\" (force ACPI data) invalid on MIPS\n");
 		return -EINVAL;
diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
index ea8bb1b..d8ecdf2 100644
--- a/arch/mips/loongson64/numa.c
+++ b/arch/mips/loongson64/numa.c
@@ -257,6 +257,14 @@ void __init mem_init(void)
 	mem_init_print_info(NULL);
 }
 
+void __init mips_memblock_add(phys_addr_t start, phys_addr_t size)
+{
+	u64 node_id;
+
+	node_id = (start >> 44) & 3;
+	memblock_add_node(start, size, node_id);
+}
+
 /* All PCI device belongs to logical Node-0 */
 int pcibus_to_node(struct pci_bus *bus)
 {
-- 
2.1.0

