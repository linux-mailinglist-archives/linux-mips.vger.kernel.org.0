Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB2EA3050CF
	for <lists+linux-mips@lfdr.de>; Wed, 27 Jan 2021 05:28:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238665AbhA0E1j (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 Jan 2021 23:27:39 -0500
Received: from mail.loongson.cn ([114.242.206.163]:41940 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238353AbhA0ENh (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 26 Jan 2021 23:13:37 -0500
Received: from loongson.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxS+Qp6BBg750NAA--.21121S2;
        Wed, 27 Jan 2021 12:12:25 +0800 (CST)
From:   Jinyang He <hejinyang@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: relocatable: Provide kaslr_offset() to get the kernel offset
Date:   Wed, 27 Jan 2021 12:12:25 +0800
Message-Id: <1611720745-8256-1-git-send-email-hejinyang@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9DxS+Qp6BBg750NAA--.21121S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCF43tw48XFWDKF43Jw43Jrb_yoW5GFyfpa
        nrA3Z5Kr4jgry5X3yrZ34kury3Wwn5WrWaganFk3yrZ3W2qF1UJFn5WrnrZrW8trW0gF40
        qFyYqr12yw4vya7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkIb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
        C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
        0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr
        1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkIecxEwVAFwVW8XwCF04k2
        0xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI
        8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41l
        IxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIx
        AIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvE
        x4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IUYj9aPUUUUU==
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Use kimage_vaddr to indicate kernel start address. Provide kaslr_offset()
to get the kernel offset when KASLR is enabled. Error may occur before
update_kimage_vaddr(), so put it at the end of the offset branch.

Fixes: a307a4ce9ecd ("MIPS: Loongson64: Add KASLR support")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Jinyang He <hejinyang@loongson.cn>
---
 arch/mips/include/asm/page.h |  6 ++++++
 arch/mips/kernel/relocate.c  | 12 ++++++++++++
 arch/mips/kernel/setup.c     |  3 +++
 3 files changed, 21 insertions(+)

diff --git a/arch/mips/include/asm/page.h b/arch/mips/include/asm/page.h
index 6a77bc4..9429520 100644
--- a/arch/mips/include/asm/page.h
+++ b/arch/mips/include/asm/page.h
@@ -255,6 +255,12 @@ extern bool __virt_addr_valid(const volatile void *kaddr);
 
 #define VM_DATA_DEFAULT_FLAGS	VM_DATA_FLAGS_TSK_EXEC
 
+extern unsigned long kimage_vaddr;
+static inline unsigned long kaslr_offset(void)
+{
+	return kimage_vaddr - VMLINUX_LOAD_ADDRESS;
+}
+
 #include <asm-generic/memory_model.h>
 #include <asm-generic/getorder.h>
 
diff --git a/arch/mips/kernel/relocate.c b/arch/mips/kernel/relocate.c
index c643c81..2cbc3b1 100644
--- a/arch/mips/kernel/relocate.c
+++ b/arch/mips/kernel/relocate.c
@@ -300,6 +300,15 @@ static inline int __init relocation_addr_valid(void *loc_new)
 	return 1;
 }
 
+static inline void __init update_kimage_vaddr(unsigned long value,
+					      unsigned long *addr, long offset)
+{
+	unsigned long new_value = value + offset;
+	unsigned long *new_addr = (void *)addr + offset;
+
+	*new_addr = new_value;
+}
+
 #if defined(CONFIG_USE_OF)
 void __weak *plat_get_fdt(void)
 {
@@ -410,6 +419,9 @@ void *__init relocate_kernel(void)
 
 		/* Return the new kernel's entry point */
 		kernel_entry = RELOCATED(start_kernel);
+
+		/* Error may occur before, so keep it at last */
+		update_kimage_vaddr(kimage_vaddr, &kimage_vaddr, offset);
 	}
 out:
 	return kernel_entry;
diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 7e1f8e2..ad37b24 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -84,6 +84,9 @@ static struct resource code_resource = { .name = "Kernel code", };
 static struct resource data_resource = { .name = "Kernel data", };
 static struct resource bss_resource = { .name = "Kernel bss", };
 
+unsigned long kimage_vaddr __initdata = VMLINUX_LOAD_ADDRESS;
+EXPORT_SYMBOL(kimage_vaddr);
+
 static void *detect_magic __initdata = detect_memory_region;
 
 #ifdef CONFIG_MIPS_AUTO_PFN_OFFSET
-- 
2.1.0

