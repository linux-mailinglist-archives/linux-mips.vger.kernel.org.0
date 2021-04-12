Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C36A35C635
	for <lists+linux-mips@lfdr.de>; Mon, 12 Apr 2021 14:28:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240792AbhDLM2w (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Apr 2021 08:28:52 -0400
Received: from mail.loongson.cn ([114.242.206.163]:59218 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239412AbhDLM2w (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 12 Apr 2021 08:28:52 -0400
Received: from loongson.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxzcjsPHRgCyoHAA--.9793S4;
        Mon, 12 Apr 2021 20:28:29 +0800 (CST)
From:   Jinyang He <hejinyang@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] MIPS: relocate: Use CONFIG_RANDOMIZE_BASE to enable kaslr
Date:   Mon, 12 Apr 2021 20:28:11 +0800
Message-Id: <1618230494-6207-3-git-send-email-hejinyang@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1618230494-6207-1-git-send-email-hejinyang@loongson.cn>
References: <1618230494-6207-1-git-send-email-hejinyang@loongson.cn>
X-CM-TRANSID: AQAAf9AxzcjsPHRgCyoHAA--.9793S4
X-Coremail-Antispam: 1UD129KBjvJXoWxtF4DWw4xWw1DXw48AF4rAFb_yoWxXr45pr
        s5Ar4kJay8Wr1xJ3yFv34kur98Aan5WryS9a1DK34rX3WSq3W8XFnYqr1kXryvqFW0ka1S
        gF97Wry2yw4FyaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUB0b7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
        8067AKxVWUXwA2048vs2IY020Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK0II2c7xJM28CjxkF
        64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcV
        CY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIE
        c7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I
        8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCF
        s4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE14v_Xr1l42xK82IYc2Ij64
        vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
        jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2I
        x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK
        8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I
        0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUyC38DUUUU
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Currently, the difference between using CONFIG_RELOCATABLE and
CONFIG_RANDOMIZE_BASE is determine_relocation_address().
CONFIG_RANDOMIZE_BASE achieves randomization. CONFIG_RELOCATABLE
relocate the kernel is very limited, currently returns a constant.
Therefore, drop determine_relocation_address() if CONFIG_RELOCATABLE.
Rename relocate.c to kaslr.c and use CONFIG_RANDOMIZE_BASE to enable
the kaslr function.

Signed-off-by: Jinyang He <hejinyang@loongson.cn>
---
 arch/mips/cavium-octeon/smp.c                             |  8 ++++----
 arch/mips/generic/init.c                                  |  4 ++--
 arch/mips/include/asm/bootinfo.h                          |  4 ++--
 .../include/asm/mach-cavium-octeon/kernel-entry-init.h    |  4 ++--
 arch/mips/kernel/Makefile                                 |  2 +-
 arch/mips/kernel/head.S                                   |  6 +++---
 arch/mips/kernel/{relocate.c => kaslr.c}                  | 15 ---------------
 7 files changed, 14 insertions(+), 29 deletions(-)
 rename arch/mips/kernel/{relocate.c => kaslr.c} (97%)

diff --git a/arch/mips/cavium-octeon/smp.c b/arch/mips/cavium-octeon/smp.c
index 66ce552..dfdbc79 100644
--- a/arch/mips/cavium-octeon/smp.c
+++ b/arch/mips/cavium-octeon/smp.c
@@ -28,9 +28,9 @@
 volatile unsigned long octeon_processor_boot = 0xff;
 volatile unsigned long octeon_processor_sp;
 volatile unsigned long octeon_processor_gp;
-#ifdef CONFIG_RELOCATABLE
+#ifdef CONFIG_RANDOMIZE_BASE
 volatile unsigned long octeon_processor_relocated_kernel_entry;
-#endif /* CONFIG_RELOCATABLE */
+#endif /* CONFIG_RANDOMIZE_BASE */
 
 #ifdef CONFIG_HOTPLUG_CPU
 uint64_t octeon_bootloader_entry_addr;
@@ -190,7 +190,7 @@ static void __init octeon_smp_setup(void)
 }
 
 
-#ifdef CONFIG_RELOCATABLE
+#ifdef CONFIG_RANDOMIZE_BASE
 int plat_post_relocation(long offset)
 {
 	unsigned long entry = (unsigned long)kernel_entry;
@@ -200,7 +200,7 @@ int plat_post_relocation(long offset)
 
 	return 0;
 }
-#endif /* CONFIG_RELOCATABLE */
+#endif /* CONFIG_RANDOMIZE_BASE */
 
 /**
  * Firmware CPU startup hook
diff --git a/arch/mips/generic/init.c b/arch/mips/generic/init.c
index 1842cdd..f7a4e29 100644
--- a/arch/mips/generic/init.c
+++ b/arch/mips/generic/init.c
@@ -82,7 +82,7 @@ void __init *plat_get_fdt(void)
 	return (void *)fdt;
 }
 
-#ifdef CONFIG_RELOCATABLE
+#ifdef CONFIG_RANDOMIZE_BASE
 
 void __init plat_fdt_relocated(void *new_location)
 {
@@ -97,7 +97,7 @@ void __init plat_fdt_relocated(void *new_location)
 		fw_arg1 = (unsigned long)new_location;
 }
 
-#endif /* CONFIG_RELOCATABLE */
+#endif /* CONFIG_RANDOMIZE_BASE */
 
 void __init plat_mem_setup(void)
 {
diff --git a/arch/mips/include/asm/bootinfo.h b/arch/mips/include/asm/bootinfo.h
index 5be10ece..6b37663 100644
--- a/arch/mips/include/asm/bootinfo.h
+++ b/arch/mips/include/asm/bootinfo.h
@@ -169,7 +169,7 @@ static inline void plat_swiotlb_setup(void) {}
  */
 extern void *plat_get_fdt(void);
 
-#ifdef CONFIG_RELOCATABLE
+#ifdef CONFIG_RANDOMIZE_BASE
 
 /**
  * plat_fdt_relocated() - Update platform's information about relocated dtb
@@ -180,7 +180,7 @@ extern void *plat_get_fdt(void);
  */
 void plat_fdt_relocated(void *new_location);
 
-#endif /* CONFIG_RELOCATABLE */
+#endif /* CONFIG_RANDOMIZE_BASE */
 #endif /* CONFIG_USE_OF */
 
 #endif /* _ASM_BOOTINFO_H */
diff --git a/arch/mips/include/asm/mach-cavium-octeon/kernel-entry-init.h b/arch/mips/include/asm/mach-cavium-octeon/kernel-entry-init.h
index c38b38c..e66767d 100644
--- a/arch/mips/include/asm/mach-cavium-octeon/kernel-entry-init.h
+++ b/arch/mips/include/asm/mach-cavium-octeon/kernel-entry-init.h
@@ -100,7 +100,7 @@
 	#
 
 octeon_spin_wait_boot:
-#ifdef CONFIG_RELOCATABLE
+#ifdef CONFIG_RANDOMIZE_BASE
 	PTR_LA	t0, octeon_processor_relocated_kernel_entry
 	LONG_L	t0, (t0)
 	beq	zero, t0, 1f
@@ -109,7 +109,7 @@
 	jr	t0
 	nop
 1:
-#endif /* CONFIG_RELOCATABLE */
+#endif /* CONFIG_RANDOMIZE_BASE */
 
 	# This is the variable where the next core to boot is stored
 	PTR_LA	t0, octeon_processor_boot
diff --git a/arch/mips/kernel/Makefile b/arch/mips/kernel/Makefile
index b4a57f1..bf7ac86 100644
--- a/arch/mips/kernel/Makefile
+++ b/arch/mips/kernel/Makefile
@@ -92,7 +92,7 @@ obj-$(CONFIG_I8253)		+= i8253.o
 
 obj-$(CONFIG_GPIO_TXX9)		+= gpio_txx9.o
 
-obj-$(CONFIG_RELOCATABLE)	+= relocate.o
+obj-$(CONFIG_RANDOMIZE_BASE)	+= kaslr.o
 
 obj-$(CONFIG_KEXEC)		+= machine_kexec.o relocate_kernel.o crash.o
 obj-$(CONFIG_CRASH_DUMP)	+= crash_dump.o
diff --git a/arch/mips/kernel/head.S b/arch/mips/kernel/head.S
index b825ed4..a25af1d 100644
--- a/arch/mips/kernel/head.S
+++ b/arch/mips/kernel/head.S
@@ -118,7 +118,7 @@ NESTED(kernel_entry, 16, sp)			# kernel entry point
 	set_saved_sp	sp, t0, t1
 	PTR_SUBU	sp, 4 * SZREG		# init stack pointer
 
-#ifdef CONFIG_RELOCATABLE
+#ifdef CONFIG_RANDOMIZE_BASE
 	/* Copy kernel and apply the relocations */
 	jal		relocate_kernel
 
@@ -136,9 +136,9 @@ NESTED(kernel_entry, 16, sp)			# kernel entry point
 	 * newly sync'd icache.
 	 */
 	jr.hb		v0
-#else  /* !CONFIG_RELOCATABLE */
+#else  /* !CONFIG_RANDOMIZE_BASE */
 	j		start_kernel
-#endif /* !CONFIG_RELOCATABLE */
+#endif /* !CONFIG_RANDOMIZE_BASE */
 	END(kernel_entry)
 
 #ifdef CONFIG_SMP
diff --git a/arch/mips/kernel/relocate.c b/arch/mips/kernel/kaslr.c
similarity index 97%
rename from arch/mips/kernel/relocate.c
rename to arch/mips/kernel/kaslr.c
index 499a535..6742d58 100644
--- a/arch/mips/kernel/relocate.c
+++ b/arch/mips/kernel/kaslr.c
@@ -188,8 +188,6 @@ static int __init relocate_exception_table(long offset)
 	return 0;
 }
 
-#ifdef CONFIG_RANDOMIZE_BASE
-
 static inline __init unsigned long rotate_xor(unsigned long hash,
 					      const void *area, size_t size)
 {
@@ -280,19 +278,6 @@ static inline void __init *determine_relocation_address(void)
 	return RELOCATED(dest);
 }
 
-#else
-
-static inline void __init *determine_relocation_address(void)
-{
-	/*
-	 * Choose a new address for the kernel
-	 * For now we'll hard code the destination
-	 */
-	return (void *)0xffffffff81000000;
-}
-
-#endif
-
 static inline int __init relocation_addr_valid(void *loc_new)
 {
 	if ((unsigned long)loc_new & 0x0000ffff) {
-- 
2.1.0

