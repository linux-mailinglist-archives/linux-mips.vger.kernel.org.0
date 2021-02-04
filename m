Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59BBE30EAA9
	for <lists+linux-mips@lfdr.de>; Thu,  4 Feb 2021 04:08:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234489AbhBDDIA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Feb 2021 22:08:00 -0500
Received: from mail.loongson.cn ([114.242.206.163]:42728 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234488AbhBDDH7 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 3 Feb 2021 22:07:59 -0500
Received: from loongson.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxedXhZBtgMi4DAA--.4072S2;
        Thu, 04 Feb 2021 11:07:14 +0800 (CST)
From:   Jinyang He <hejinyang@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: Use common way to parse elfcorehdr
Date:   Thu,  4 Feb 2021 11:07:13 +0800
Message-Id: <1612408033-5446-1-git-send-email-hejinyang@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9AxedXhZBtgMi4DAA--.4072S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXryxur13CryfZFy8uFyfZwb_yoW5GF47pr
        1fAw10yr95Crnrt3yFyr1qvrZ5J3W8Ja4jqFW7Ca1kXF13Aw13Xry09F1I9r90krWIga4q
        gFZa9r4rua9xJrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkab7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
        vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
        Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJV
        W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK67AK6r48MxAI
        w28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr
        4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxG
        rwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8Jw
        CI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
        6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07br739UUUUU=
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

"elfcorehdr" can be parsed at kernel/crash_dump.c

Signed-off-by: Jinyang He <hejinyang@loongson.cn>
---
 arch/mips/kernel/setup.c | 49 +++++++++++++++++++++---------------------------
 1 file changed, 21 insertions(+), 28 deletions(-)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 7e1f8e2..4d2f915 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -29,6 +29,7 @@
 #include <linux/of_fdt.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/dmi.h>
+#include <linux/crash_dump.h>
 
 #include <asm/addrspace.h>
 #include <asm/bootinfo.h>
@@ -404,34 +405,32 @@ static int __init early_parse_memmap(char *p)
 }
 early_param("memmap", early_parse_memmap);
 
-#ifdef CONFIG_PROC_VMCORE
-static unsigned long setup_elfcorehdr, setup_elfcorehdr_size;
-static int __init early_parse_elfcorehdr(char *p)
+static void __init mips_reserve_vmcore(void)
 {
+#ifdef CONFIG_PROC_VMCORE
 	phys_addr_t start, end;
 	u64 i;
 
-	setup_elfcorehdr = memparse(p, &p);
-
-	for_each_mem_range(i, &start, &end) {
-		if (setup_elfcorehdr >= start && setup_elfcorehdr < end) {
-			/*
-			 * Reserve from the elf core header to the end of
-			 * the memory segment, that should all be kdump
-			 * reserved memory.
-			 */
-			setup_elfcorehdr_size = end - setup_elfcorehdr;
-			break;
+	if (!elfcorehdr_size) {
+		for_each_mem_range(i, &start, &end) {
+			if (elfcorehdr_addr >= start && elfcorehdr_addr < end) {
+				/*
+				 * Reserve from the elf core header to the end of
+				 * the memory segment, that should all be kdump
+				 * reserved memory.
+				 */
+				elfcorehdr_size = end - elfcorehdr_addr;
+				break;
+			}
 		}
 	}
-	/*
-	 * If we don't find it in the memory map, then we shouldn't
-	 * have to worry about it, as the new kernel won't use it.
-	 */
-	return 0;
-}
-early_param("elfcorehdr", early_parse_elfcorehdr);
+
+	pr_info("Reserving %ldKB of memory at %ldKB for kdump\n",
+		(unsigned long)elfcorehdr_size >> 10, (unsigned long)elfcorehdr_addr >> 10);
+
+	memblock_reserve(elfcorehdr_addr, elfcorehdr_size);
 #endif
+}
 
 #ifdef CONFIG_KEXEC
 
@@ -653,13 +652,7 @@ static void __init arch_mem_init(char **cmdline_p)
 	 */
 	memblock_set_current_limit(PFN_PHYS(max_low_pfn));
 
-#ifdef CONFIG_PROC_VMCORE
-	if (setup_elfcorehdr && setup_elfcorehdr_size) {
-		printk(KERN_INFO "kdump reserved memory at %lx-%lx\n",
-		       setup_elfcorehdr, setup_elfcorehdr_size);
-		memblock_reserve(setup_elfcorehdr, setup_elfcorehdr_size);
-	}
-#endif
+	mips_reserve_vmcore();
 
 	mips_parse_crashkernel();
 #ifdef CONFIG_KEXEC
-- 
2.1.0

