Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B23C5323FC0
	for <lists+linux-mips@lfdr.de>; Wed, 24 Feb 2021 16:21:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233115AbhBXOTf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Feb 2021 09:19:35 -0500
Received: from mail.loongson.cn ([114.242.206.163]:58252 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235458AbhBXNC5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Feb 2021 08:02:57 -0500
Received: from loongson.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxP_FKTjZgNJ0OAA--.1828S2;
        Wed, 24 Feb 2021 21:02:03 +0800 (CST)
From:   Jinyang He <hejinyang@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        John Crispin <john@phrozen.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RFC] MIPS: Remove detect_memory_region()
Date:   Wed, 24 Feb 2021 21:02:00 +0800
Message-Id: <1614171720-13221-1-git-send-email-hejinyang@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9DxP_FKTjZgNJ0OAA--.1828S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGFy3Xr4UJryfAFWrCryDWrg_yoWrAFy8p3
        9xAF97Gr4UWr97Z3yrAw1kZrW5Zwn5GFWa9FW7CrykZ3Wqqr1kAF4rX3srAFyktrZYq3W0
        g3WFqry0qa1vkaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkYb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
        A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
        w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F4UMc
        vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE14v_Xr4l42xK82IY
        c2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s
        026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF
        0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0x
        vE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2
        jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU5_b15UUUUU==
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

detect_memory_region() was committed by Commit 4d9f77d25268 ("MIPS: add
detect_memory_region()"). Then it was equipped by Commit dd63b00804a5
("MIPS: ralink: make use of the new memory detection code") and
Commit 9b75733b7b5e ("MIPS: ath79: make use of the new memory detection
code"). Its code is based on early ath79 platform code.

What puzzles me is that how memcmp() detect the memory region. If `break`
was touched, the function could make sense. That means memcmp() should
return zero. Otherwise, the loop will be end by size > sz_max.

I have tested detect_memory_region() on Loongson64 3A3000. On our design,
kseg0 low 256MB maps real memory and kseg0 high 256MB maps IO/PCI. The
function runs and last stopped on kseg1 where is uncached. In this process
memcmp also returned non-zero when detected kseg0 high 256MB. Then I did
another thing. memcpy first and test memcmp then (after &_end). It works
well on 3A3000 but badly on 3A4000. Maybe because kseg0 high 256MB maps
IO/PCI and it is dangerous to write like write memory.

At last, read memory from where is not memory region may always return 0.
(Or trigger exception.) This function have been used several years and
seems no error occur. Maybe it's a fallback way.

Signed-off-by: Jinyang He <hejinyang@loongson.cn>
---
 arch/mips/ath79/setup.c          |  2 +-
 arch/mips/include/asm/bootinfo.h |  2 --
 arch/mips/kernel/setup.c         | 21 ---------------------
 arch/mips/ralink/of.c            |  5 ++---
 4 files changed, 3 insertions(+), 27 deletions(-)

diff --git a/arch/mips/ath79/setup.c b/arch/mips/ath79/setup.c
index 891f495..d2a41fb 100644
--- a/arch/mips/ath79/setup.c
+++ b/arch/mips/ath79/setup.c
@@ -232,7 +232,7 @@ void __init plat_mem_setup(void)
 	ath79_detect_sys_type();
 	ath79_ddr_ctrl_init();
 
-	detect_memory_region(0, ATH79_MEM_SIZE_MIN, ATH79_MEM_SIZE_MAX);
+	memblock_add(0, ATH79_MEM_SIZE_MAX);
 
 	_machine_restart = ath79_restart;
 	_machine_halt = ath79_halt;
diff --git a/arch/mips/include/asm/bootinfo.h b/arch/mips/include/asm/bootinfo.h
index 5be10ece..0d5637e 100644
--- a/arch/mips/include/asm/bootinfo.h
+++ b/arch/mips/include/asm/bootinfo.h
@@ -90,8 +90,6 @@ const char *get_system_type(void);
 
 extern unsigned long mips_machtype;
 
-extern void detect_memory_region(phys_addr_t start, phys_addr_t sz_min,  phys_addr_t sz_max);
-
 extern void prom_init(void);
 extern void prom_free_prom_memory(void);
 extern void prom_cleanup(void);
diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 279be01..fbbc51e 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -86,32 +86,11 @@ static struct resource bss_resource = { .name = "Kernel bss", };
 unsigned long __kaslr_offset __ro_after_init;
 EXPORT_SYMBOL(__kaslr_offset);
 
-static void *detect_magic __initdata = detect_memory_region;
-
 #ifdef CONFIG_MIPS_AUTO_PFN_OFFSET
 unsigned long ARCH_PFN_OFFSET;
 EXPORT_SYMBOL(ARCH_PFN_OFFSET);
 #endif
 
-void __init detect_memory_region(phys_addr_t start, phys_addr_t sz_min, phys_addr_t sz_max)
-{
-	void *dm = &detect_magic;
-	phys_addr_t size;
-
-	for (size = sz_min; size < sz_max; size <<= 1) {
-		if (!memcmp(dm, dm + size, sizeof(detect_magic)))
-			break;
-	}
-
-	pr_debug("Memory: %lluMB of RAM detected at 0x%llx (min: %lluMB, max: %lluMB)\n",
-		((unsigned long long) size) / SZ_1M,
-		(unsigned long long) start,
-		((unsigned long long) sz_min) / SZ_1M,
-		((unsigned long long) sz_max) / SZ_1M);
-
-	memblock_add(start, size);
-}
-
 /*
  * Manage initrd
  */
diff --git a/arch/mips/ralink/of.c b/arch/mips/ralink/of.c
index 8286c35..2de0075 100644
--- a/arch/mips/ralink/of.c
+++ b/arch/mips/ralink/of.c
@@ -81,9 +81,8 @@ void __init plat_mem_setup(void)
 	else if (soc_info.mem_size)
 		memblock_add(soc_info.mem_base, soc_info.mem_size * SZ_1M);
 	else
-		detect_memory_region(soc_info.mem_base,
-				     soc_info.mem_size_min * SZ_1M,
-				     soc_info.mem_size_max * SZ_1M);
+		memblock_add(soc_info.mem_base,
+			     soc_info.mem_size_max * SZ_1M);
 }
 
 static int __init plat_of_setup(void)
-- 
2.1.0

