Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3810D3108CB
	for <lists+linux-mips@lfdr.de>; Fri,  5 Feb 2021 11:17:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231131AbhBEKOb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 Feb 2021 05:14:31 -0500
Received: from mail.loongson.cn ([114.242.206.163]:40726 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230322AbhBEKMQ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 5 Feb 2021 05:12:16 -0500
Received: from loongson.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxadXPGR1gjT0FAA--.6705S2;
        Fri, 05 Feb 2021 18:11:28 +0800 (CST)
From:   Jinyang He <hejinyang@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] MIPS: relocatable: Provide kaslr_offset() to get the kernel offset
Date:   Fri,  5 Feb 2021 18:11:21 +0800
Message-Id: <1612519882-16480-1-git-send-email-hejinyang@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9AxadXPGR1gjT0FAA--.6705S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tFW5AFWfZFy5Ary5GFW5GFg_yoW5JF1kpa
        n7A3WkGrsFgrWUArZ5A34kurW3Gw4DWrWagFsFkw1rZ3ZIqF1UJ3Z5WrsrXrWjqFy0gF4I
        va4Yqr42vw4qy3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkFb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
        8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
        64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWxJVW8Jr
        1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkIecxEwVAFwVW8twCF04k2
        0xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI
        8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41l
        IxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIx
        AIcVCF04k26cxKx2IYs7xG6r4j6FyUMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2
        jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07bnMa5UUUUU=
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Provide kaslr_offset() to get the kernel offset when KASLR is enabled.
Error may occur before update_kaslr_offset(), so put it at the end of
the offset branch.

Fixes: a307a4ce9ecd ("MIPS: Loongson64: Add KASLR support")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Jinyang He <hejinyang@loongson.cn>
---
 arch/mips/include/asm/page.h |  6 ++++++
 arch/mips/kernel/relocate.c  | 10 ++++++++++
 arch/mips/kernel/setup.c     |  3 +++
 3 files changed, 19 insertions(+)

diff --git a/arch/mips/include/asm/page.h b/arch/mips/include/asm/page.h
index 6a77bc4..74082e3 100644
--- a/arch/mips/include/asm/page.h
+++ b/arch/mips/include/asm/page.h
@@ -255,6 +255,12 @@ extern bool __virt_addr_valid(const volatile void *kaddr);
 
 #define VM_DATA_DEFAULT_FLAGS	VM_DATA_FLAGS_TSK_EXEC
 
+extern unsigned long __kaslr_offset;
+static inline unsigned long kaslr_offset(void)
+{
+	return __kaslr_offset;
+}
+
 #include <asm-generic/memory_model.h>
 #include <asm-generic/getorder.h>
 
diff --git a/arch/mips/kernel/relocate.c b/arch/mips/kernel/relocate.c
index c643c81..95abb9c 100644
--- a/arch/mips/kernel/relocate.c
+++ b/arch/mips/kernel/relocate.c
@@ -300,6 +300,13 @@ static inline int __init relocation_addr_valid(void *loc_new)
 	return 1;
 }
 
+static inline void __init update_kaslr_offset(unsigned long *addr, long offset)
+{
+	unsigned long *new_addr = (unsigned long *)RELOCATED(addr);
+
+	*new_addr = (unsigned long)offset;
+}
+
 #if defined(CONFIG_USE_OF)
 void __weak *plat_get_fdt(void)
 {
@@ -410,6 +417,9 @@ void *__init relocate_kernel(void)
 
 		/* Return the new kernel's entry point */
 		kernel_entry = RELOCATED(start_kernel);
+
+		/* Error may occur before, so keep it at last */
+		update_kaslr_offset(&__kaslr_offset, offset);
 	}
 out:
 	return kernel_entry;
diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 3785c72..03c896f 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -84,6 +84,9 @@ static struct resource code_resource = { .name = "Kernel code", };
 static struct resource data_resource = { .name = "Kernel data", };
 static struct resource bss_resource = { .name = "Kernel bss", };
 
+unsigned long __kaslr_offset __ro_after_init;
+EXPORT_SYMBOL(__kaslr_offset);
+
 static void *detect_magic __initdata = detect_memory_region;
 
 #ifdef CONFIG_MIPS_AUTO_PFN_OFFSET
-- 
2.1.0

