Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4C0F351905
	for <lists+linux-mips@lfdr.de>; Thu,  1 Apr 2021 19:51:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234884AbhDARtA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 1 Apr 2021 13:49:00 -0400
Received: from mail.loongson.cn ([114.242.206.163]:43914 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234959AbhDARq4 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 1 Apr 2021 13:46:56 -0400
Received: from loongson.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxX8s0ymVgtFkDAA--.7389S2;
        Thu, 01 Apr 2021 21:27:16 +0800 (CST)
From:   Jinyang He <hejinyang@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RFC 0/3] Some update for relocate
Date:   Thu,  1 Apr 2021 21:27:10 +0800
Message-Id: <1617283633-18598-1-git-send-email-hejinyang@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9DxX8s0ymVgtFkDAA--.7389S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCF4kZw4DCr4ftr48Kw4Durg_yoWrAw48pw
        s7Cw1xtw4vgrW8tw4fJryj9w13Jr95J3yYgFnrKryrJ3WagFn7Xr1SkrnxWrWUJryFqa9Y
        934qgrWxCr4SyaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkYb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
        8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
        64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8JVWxJw
        Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK67AK6ry8MxAIw28I
        cxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2
        IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI
        42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42
        IY6xAIw20EY4v20xvaj40_Zr0_Wr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2
        jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IUY8nY7UUUUU==
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Two questions at least here,

1. cavium-octeon platform seems start with smp cpus, it may broke this function
2. Commit 15ad838d281b ("[MIPS] Always do the ARC64_TWIDDLE_PC thing."), I don't
   know whether broken it.

So RFC to get helps. Thanks!

And Patch3 can be tested by vmlinuz. e.g. Use the follow patch,

diff --git a/arch/mips/boot/compressed/Makefile b/arch/mips/boot/compressed/Makefile
index f93f72b..499b38d 100644
--- a/arch/mips/boot/compressed/Makefile
+++ b/arch/mips/boot/compressed/Makefile
@@ -28,12 +28,11 @@ KBUILD_CFLAGS := $(filter-out -march=loongson3a, $(KBUILD_CFLAGS)) -march=mips64
 endif
 
 KBUILD_CFLAGS := $(KBUILD_CFLAGS) -D__KERNEL__ -D__DISABLE_EXPORTS \
-	-DBOOT_HEAP_SIZE=$(BOOT_HEAP_SIZE) -D"VMLINUX_LOAD_ADDRESS_ULL=$(VMLINUX_LOAD_ADDRESS)ull"
-
-KBUILD_AFLAGS := $(KBUILD_AFLAGS) -D__ASSEMBLY__ \
-	-DBOOT_HEAP_SIZE=$(BOOT_HEAP_SIZE) \
+	-DBOOT_HEAP_SIZE=$(BOOT_HEAP_SIZE) -D"VMLINUX_LOAD_ADDRESS_ULL=$(VMLINUX_LOAD_ADDRESS)ull"	\
 	-DKERNEL_ENTRY=$(VMLINUX_ENTRY_ADDRESS)
 
+KBUILD_AFLAGS := $(KBUILD_AFLAGS) -D__ASSEMBLY__ -DBOOT_HEAP_SIZE=$(BOOT_HEAP_SIZE)
+
 # Prevents link failures: __sanitizer_cov_trace_pc() is not linked in.
 KCOV_INSTRUMENT		:= n
 GCOV_PROFILE := n
diff --git a/arch/mips/boot/compressed/decompress.c b/arch/mips/boot/compressed/decompress.c
index 3d70d15..3f5cac9 100644
--- a/arch/mips/boot/compressed/decompress.c
+++ b/arch/mips/boot/compressed/decompress.c
@@ -85,9 +85,11 @@ void __stack_chk_fail(void)
 	error("stack-protector: Kernel stack is corrupted\n");
 }
 
-void decompress_kernel(unsigned long boot_heap_start)
+unsigned long decompress_kernel(unsigned long boot_heap_start)
 {
 	unsigned long zimage_start, zimage_size;
+	unsigned long offset = 0x8000000;
+	unsigned long long load_address = VMLINUX_LOAD_ADDRESS_ULL + offset;
 
 	zimage_start = (unsigned long)(&__image_begin);
 	zimage_size = (unsigned long)(&__image_end) -
@@ -105,12 +107,12 @@ void decompress_kernel(unsigned long boot_heap_start)
 
 	/* Display standard Linux/MIPS boot prompt */
 	puts("Uncompressing Linux at load address ");
-	puthex(VMLINUX_LOAD_ADDRESS_ULL);
+	puthex(load_address);
 	puts("\n");
 
 	/* Decompress the kernel with according algorithm */
 	__decompress((char *)zimage_start, zimage_size, 0, 0,
-		   (void *)VMLINUX_LOAD_ADDRESS_ULL, 0, 0, error);
+		   (void *)load_address, 0, 0, error);
 
 	if (IS_ENABLED(CONFIG_MIPS_RAW_APPENDED_DTB) &&
 	    fdt_magic((void *)&__appended_dtb) == FDT_MAGIC) {
@@ -125,14 +127,16 @@ void decompress_kernel(unsigned long boot_heap_start)
 		image_size = ALIGN(image_size, STRUCT_ALIGNMENT);
 
 		puts("Copy device tree to address  ");
-		puthex(VMLINUX_LOAD_ADDRESS_ULL + image_size);
+		puthex(load_address + image_size);
 		puts("\n");
 
 		/* copy dtb to where the booted kernel will expect it */
-		memcpy((void *)VMLINUX_LOAD_ADDRESS_ULL + image_size,
+		memcpy((void *)load_address + image_size,
 		       __appended_dtb, dtb_size);
 	}
 
 	/* FIXME: should we flush cache here? */
 	puts("Now, booting the kernel...\n");
+
+	return (KERNEL_ENTRY + offset);
 }
diff --git a/arch/mips/boot/compressed/head.S b/arch/mips/boot/compressed/head.S
index 5795d0a..36c5809 100644
--- a/arch/mips/boot/compressed/head.S
+++ b/arch/mips/boot/compressed/head.S
@@ -40,8 +40,7 @@
 	move	a1, s1
 	move	a2, s2
 	move	a3, s3
-	PTR_LI	t9, KERNEL_ENTRY
-	jalr	t9
+	jalr	v0
 
 3:
 	b	3b

Jinyang He (3):
  MIPS: relocate: Only compile relocs when CONFIG_RELOCATABLE is enabled
  MIPS: relocate: Use CONFIG_RANDOMIZE_BASE to configure kaslr
  MIPS: relocate: Add support to relocate kernel auto

 arch/mips/Makefile                                 |   2 +
 arch/mips/cavium-octeon/smp.c                      |   8 +-
 arch/mips/generic/init.c                           |   4 +-
 arch/mips/include/asm/bootinfo.h                   |   4 +-
 .../asm/mach-cavium-octeon/kernel-entry-init.h     |   4 +-
 arch/mips/kernel/Makefile                          |   2 +-
 arch/mips/kernel/head.S                            | 155 ++++++++++++++++++++-
 arch/mips/kernel/{relocate.c => kaslr.c}           |  15 --
 8 files changed, 165 insertions(+), 29 deletions(-)
 rename arch/mips/kernel/{relocate.c => kaslr.c} (97%)

-- 
2.1.0

