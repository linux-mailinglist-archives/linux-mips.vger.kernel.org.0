Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FB2A1608F5
	for <lists+linux-mips@lfdr.de>; Mon, 17 Feb 2020 04:31:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727329AbgBQDbN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 16 Feb 2020 22:31:13 -0500
Received: from mail.loongson.cn ([114.242.206.163]:48766 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726498AbgBQDbN (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 16 Feb 2020 22:31:13 -0500
Received: from centos7-x86.loongson.cn (unknown [10.40.46.81])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Ax1unxCEpeCGoQAA--.0S2;
        Mon, 17 Feb 2020 11:30:57 +0800 (CST)
From:   bibo <maobibo@loongson.cn>
To:     Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: Loongson64: add header files with pathname
Date:   Mon, 17 Feb 2020 11:30:57 +0800
Message-Id: <1581910257-11647-1-git-send-email-maobibo@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: AQAAf9Ax1unxCEpeCGoQAA--.0S2
X-Coremail-Antispam: 1UD129KBjvAXoWftF48ZryDCFWrtw15uF1kAFb_yoW5GFWDuo
        Z2yFn7Kr48XFWUJF15WF15Aa18WFnaqr4Fy34fJ3yDJF9Iy3srJ3409w12qF15CF1xt3sx
        GrWrurW8Xr1Iyaykn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
        AaLaJ3UjIYCTnIWjp_UUUYn7k0a2IF6w4kM7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0
        x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj4
        1l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0
        I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjc
        xK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG
        64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r
        1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE-syl42xK
        82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGw
        C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48J
        MIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
        IF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
        6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUgVHqDUUUU
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Currently some header files are referenced with pathname prefix,
like irq.h which is located at both these two pathes:
  arch/mips/include/asm/mach-generic/
  arch/mips/include/asm/mach-xxx/
C code reference these header files without pathname such as
there is header file with the same filename in another different
path. We encounter problem if arch/mips/kvm/irq.h file is locally
reference.

Now header files specified with platform are moved to directory
arch/mips/xxx/include/mach directory, and which is referenced with
<mach/yyy.h> method.

Signed-off-by: bibo <maobibo@loongson.cn>
---
 arch/mips/Kconfig                                                 | 5 +++++
 arch/mips/Makefile                                                | 2 ++
 arch/mips/include/asm/addrspace.h                                 | 4 ++++
 arch/mips/include/asm/cache.h                                     | 4 ++++
 arch/mips/include/asm/cpu-features.h                              | 4 ++++
 arch/mips/include/asm/fixmap.h                                    | 4 ++++
 arch/mips/include/asm/i8259.h                                     | 4 ++++
 arch/mips/include/asm/io.h                                        | 5 +++++
 arch/mips/include/asm/irq.h                                       | 4 ++++
 arch/mips/include/asm/mc146818rtc.h                               | 4 ++++
 arch/mips/include/asm/mmzone.h                                    | 4 ++++
 arch/mips/include/asm/page.h                                      | 4 ++++
 arch/mips/include/asm/topology.h                                  | 4 ++++
 arch/mips/include/asm/war.h                                       | 4 ++++
 arch/mips/kernel/head.S                                           | 4 ++++
 arch/mips/loongson64/Platform                                     | 2 +-
 arch/mips/loongson64/env.c                                        | 6 +++---
 .../asm/mach-loongson64 => loongson64/include/mach}/boot_param.h  | 0
 .../include/mach}/cpu-feature-overrides.h                         | 0
 arch/mips/loongson64/include/mach/ioremap.h                       | 2 ++
 .../asm/mach-loongson64 => loongson64/include/mach}/irq.h         | 4 ++--
 .../include/mach}/kernel-entry-init.h                             | 0
 arch/mips/loongson64/include/mach/kmalloc.h                       | 2 ++
 .../asm/mach-loongson64 => loongson64/include/mach}/loongson.h    | 2 +-
 .../mach-loongson64 => loongson64/include/mach}/loongson_hwmon.h  | 0
 .../mach-loongson64 => loongson64/include/mach}/loongson_regs.h   | 0
 arch/mips/loongson64/include/mach/mangle-port.h                   | 2 ++
 .../asm/mach-loongson64 => loongson64/include/mach}/mc146818rtc.h | 0
 .../asm/mach-loongson64 => loongson64/include/mach}/mmzone.h      | 2 +-
 .../asm/mach-loongson64 => loongson64/include/mach}/pci.h         | 0
 .../asm/mach-loongson64 => loongson64/include/mach}/spaces.h      | 0
 .../asm/mach-loongson64 => loongson64/include/mach}/topology.h    | 0
 arch/mips/loongson64/include/mach/war.h                           | 2 ++
 .../asm/mach-loongson64 => loongson64/include/mach}/workarounds.h | 0
 arch/mips/loongson64/init.c                                       | 2 +-
 arch/mips/loongson64/irq.c                                        | 5 +++++
 arch/mips/loongson64/numa.c                                       | 2 +-
 arch/mips/loongson64/pci.c                                        | 6 +++---
 arch/mips/loongson64/platform.c                                   | 6 +++---
 arch/mips/loongson64/pm.c                                         | 2 +-
 arch/mips/loongson64/reset.c                                      | 4 ++--
 arch/mips/loongson64/setup.c                                      | 2 +-
 arch/mips/loongson64/smp.c                                        | 6 +++---
 arch/mips/loongson64/time.c                                       | 2 +-
 arch/mips/oprofile/op_model_loongson3.c                           | 4 ++--
 arch/mips/pci/fixup-loongson3.c                                   | 2 +-
 arch/mips/pci/ops-loongson3.c                                     | 2 +-
 drivers/gpio/gpio-loongson.c                                      | 4 ++++
 drivers/platform/mips/cpu_hwmon.c                                 | 8 ++++----
 49 files changed, 109 insertions(+), 32 deletions(-)
 rename arch/mips/{include/asm/mach-loongson64 => loongson64/include/mach}/boot_param.h (100%)
 rename arch/mips/{include/asm/mach-loongson64 => loongson64/include/mach}/cpu-feature-overrides.h (100%)
 create mode 100644 arch/mips/loongson64/include/mach/ioremap.h
 rename arch/mips/{include/asm/mach-loongson64 => loongson64/include/mach}/irq.h (96%)
 rename arch/mips/{include/asm/mach-loongson64 => loongson64/include/mach}/kernel-entry-init.h (100%)
 create mode 100644 arch/mips/loongson64/include/mach/kmalloc.h
 rename arch/mips/{include/asm/mach-loongson64 => loongson64/include/mach}/loongson.h (99%)
 rename arch/mips/{include/asm/mach-loongson64 => loongson64/include/mach}/loongson_hwmon.h (100%)
 rename arch/mips/{include/asm/mach-loongson64 => loongson64/include/mach}/loongson_regs.h (100%)
 create mode 100644 arch/mips/loongson64/include/mach/mangle-port.h
 rename arch/mips/{include/asm/mach-loongson64 => loongson64/include/mach}/mc146818rtc.h (100%)
 rename arch/mips/{include/asm/mach-loongson64 => loongson64/include/mach}/mmzone.h (96%)
 rename arch/mips/{include/asm/mach-loongson64 => loongson64/include/mach}/pci.h (100%)
 rename arch/mips/{include/asm/mach-loongson64 => loongson64/include/mach}/spaces.h (100%)
 rename arch/mips/{include/asm/mach-loongson64 => loongson64/include/mach}/topology.h (100%)
 create mode 100644 arch/mips/loongson64/include/mach/war.h
 rename arch/mips/{include/asm/mach-loongson64 => loongson64/include/mach}/workarounds.h (100%)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 08b6f34..91946e4 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -489,6 +489,7 @@ config MACH_LOONGSON64
 	select LOONGSON_MC146818
 	select ZONE_DMA32
 	select NUMA
+	select HAVE_ARCH_HEAD_FILES
 	help
 	  This enables the support of Loongson-2/3 family of machines.
 
@@ -1112,6 +1113,10 @@ config SCHED_OMIT_FRAME_POINTER
 	bool
 	default y
 
+config HAVE_ARCH_HEAD_FILES
+	bool
+	default n
+
 #
 # Select some configuration options automatically based on user selections.
 #
diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index e1c44ae..b73c8f6 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -263,7 +263,9 @@ load-y					= $(CONFIG_PHYSICAL_START)
 endif
 
 entry-y				= $(shell $(objtree)/arch/mips/tools/elf-entry vmlinux)
+ifndef CONFIG_HAVE_ARCH_HEAD_FILES
 cflags-y			+= -I$(srctree)/arch/mips/include/asm/mach-generic
+endif
 drivers-$(CONFIG_PCI)		+= arch/mips/pci/
 
 #
diff --git a/arch/mips/include/asm/addrspace.h b/arch/mips/include/asm/addrspace.h
index 59a48c6..9640a54 100644
--- a/arch/mips/include/asm/addrspace.h
+++ b/arch/mips/include/asm/addrspace.h
@@ -10,7 +10,11 @@
 #ifndef _ASM_ADDRSPACE_H
 #define _ASM_ADDRSPACE_H
 
+#ifdef CONFIG_HAVE_ARCH_HEAD_FILES
+#include <mach/spaces.h>
+#else
 #include <spaces.h>
+#endif
 
 /*
  *  Configure language
diff --git a/arch/mips/include/asm/cache.h b/arch/mips/include/asm/cache.h
index 8b14c27..3e21ef936 100644
--- a/arch/mips/include/asm/cache.h
+++ b/arch/mips/include/asm/cache.h
@@ -9,7 +9,11 @@
 #ifndef _ASM_CACHE_H
 #define _ASM_CACHE_H
 
+#ifdef CONFIG_HAVE_ARCH_HEAD_FILES
+#include <mach/kmalloc.h>
+#else
 #include <kmalloc.h>
+#endif
 
 #define L1_CACHE_SHIFT		CONFIG_MIPS_L1_CACHE_SHIFT
 #define L1_CACHE_BYTES		(1 << L1_CACHE_SHIFT)
diff --git a/arch/mips/include/asm/cpu-features.h b/arch/mips/include/asm/cpu-features.h
index de44c92..d13b09b 100644
--- a/arch/mips/include/asm/cpu-features.h
+++ b/arch/mips/include/asm/cpu-features.h
@@ -12,7 +12,11 @@
 #include <asm/cpu.h>
 #include <asm/cpu-info.h>
 #include <asm/isa-rev.h>
+#ifdef CONFIG_HAVE_ARCH_HEAD_FILES
+#include <mach/cpu-feature-overrides.h>
+#else
 #include <cpu-feature-overrides.h>
+#endif
 
 #define __ase(ase)			(cpu_data[0].ases & (ase))
 #define __isa(isa)			(cpu_data[0].isa_level & (isa))
diff --git a/arch/mips/include/asm/fixmap.h b/arch/mips/include/asm/fixmap.h
index 1784d43..8b034c4 100644
--- a/arch/mips/include/asm/fixmap.h
+++ b/arch/mips/include/asm/fixmap.h
@@ -14,7 +14,11 @@
 #define _ASM_FIXMAP_H
 
 #include <asm/page.h>
+#ifdef CONFIG_HAVE_ARCH_HEAD_FILES
+#include <mach/spaces.h>
+#else
 #include <spaces.h>
+#endif
 #ifdef CONFIG_HIGHMEM
 #include <linux/threads.h>
 #include <asm/kmap_types.h>
diff --git a/arch/mips/include/asm/i8259.h b/arch/mips/include/asm/i8259.h
index 97a5e41..78639a7 100644
--- a/arch/mips/include/asm/i8259.h
+++ b/arch/mips/include/asm/i8259.h
@@ -14,7 +14,11 @@
 #include <linux/spinlock.h>
 
 #include <asm/io.h>
+#ifdef CONFIG_HAVE_ARCH_HEAD_FILES
+#include <mach/irq.h>
+#else
 #include <irq.h>
+#endif
 
 /* i8259A PIC registers */
 #define PIC_MASTER_CMD		0x20
diff --git a/arch/mips/include/asm/io.h b/arch/mips/include/asm/io.h
index 3f6ce74..899076a 100644
--- a/arch/mips/include/asm/io.h
+++ b/arch/mips/include/asm/io.h
@@ -31,8 +31,13 @@
 #include <asm/processor.h>
 #include <asm/string.h>
 
+#ifdef CONFIG_HAVE_ARCH_HEAD_FILES
+#include <mach/ioremap.h>
+#include <mach/mangle-port.h>
+#else
 #include <ioremap.h>
 #include <mangle-port.h>
+#endif
 
 /*
  * Raw operations are never swapped in software.  OTOH values that raw
diff --git a/arch/mips/include/asm/irq.h b/arch/mips/include/asm/irq.h
index c5d3517..883f49d 100644
--- a/arch/mips/include/asm/irq.h
+++ b/arch/mips/include/asm/irq.h
@@ -15,7 +15,11 @@
 
 #include <asm/mipsmtregs.h>
 
+#ifdef CONFIG_HAVE_ARCH_HEAD_FILES
+#include <mach/irq.h>
+#else
 #include <irq.h>
+#endif
 
 #define IRQ_STACK_SIZE			THREAD_SIZE
 #define IRQ_STACK_START			(IRQ_STACK_SIZE - 16)
diff --git a/arch/mips/include/asm/mc146818rtc.h b/arch/mips/include/asm/mc146818rtc.h
index 68b4da6..5f5d878 100644
--- a/arch/mips/include/asm/mc146818rtc.h
+++ b/arch/mips/include/asm/mc146818rtc.h
@@ -11,6 +11,10 @@
 #ifndef _ASM_MC146818RTC_H
 #define _ASM_MC146818RTC_H
 
+#ifdef CONFIG_HAVE_ARCH_HEAD_FILES
+#include <mach/mc146818rtc.h>
+#else
 #include <mc146818rtc.h>
+#endif
 
 #endif /* _ASM_MC146818RTC_H */
diff --git a/arch/mips/include/asm/mmzone.h b/arch/mips/include/asm/mmzone.h
index b826b84..7f5ca0a 100644
--- a/arch/mips/include/asm/mmzone.h
+++ b/arch/mips/include/asm/mmzone.h
@@ -9,8 +9,12 @@
 #include <asm/page.h>
 
 #ifdef CONFIG_NEED_MULTIPLE_NODES
+#ifdef CONFIG_HAVE_ARCH_HEAD_FILES
+#include <mach/mmzone.h>
+#else
 # include <mmzone.h>
 #endif
+#endif
 
 #ifndef pa_to_nid
 #define pa_to_nid(addr) 0
diff --git a/arch/mips/include/asm/page.h b/arch/mips/include/asm/page.h
index 0ba4ce6..73cfa6a 100644
--- a/arch/mips/include/asm/page.h
+++ b/arch/mips/include/asm/page.h
@@ -9,7 +9,11 @@
 #ifndef _ASM_PAGE_H
 #define _ASM_PAGE_H
 
+#ifdef CONFIG_HAVE_ARCH_HEAD_FILES
+#include <mach/spaces.h>
+#else
 #include <spaces.h>
+#endif
 #include <linux/const.h>
 #include <linux/kernel.h>
 #include <asm/mipsregs.h>
diff --git a/arch/mips/include/asm/topology.h b/arch/mips/include/asm/topology.h
index 0673d2d..764a73f 100644
--- a/arch/mips/include/asm/topology.h
+++ b/arch/mips/include/asm/topology.h
@@ -8,7 +8,11 @@
 #ifndef __ASM_TOPOLOGY_H
 #define __ASM_TOPOLOGY_H
 
+#ifdef CONFIG_HAVE_ARCH_HEAD_FILES
+#include <mach/topology.h>
+#else
 #include <topology.h>
+#endif
 #include <linux/smp.h>
 
 #ifdef CONFIG_SMP
diff --git a/arch/mips/include/asm/war.h b/arch/mips/include/asm/war.h
index 1eedd59..1baebc3 100644
--- a/arch/mips/include/asm/war.h
+++ b/arch/mips/include/asm/war.h
@@ -9,7 +9,11 @@
 #ifndef _ASM_WAR_H
 #define _ASM_WAR_H
 
+#ifdef CONFIG_HAVE_ARCH_HEAD_FILES
+#include <mach/war.h>
+#else
 #include <war.h>
+#endif
 
 /*
  * Work around certain R4000 CPU errata (as implemented by GCC):
diff --git a/arch/mips/kernel/head.S b/arch/mips/kernel/head.S
index 351d40f..2973a4c 100644
--- a/arch/mips/kernel/head.S
+++ b/arch/mips/kernel/head.S
@@ -24,7 +24,11 @@
 #include <asm/mipsregs.h>
 #include <asm/stackframe.h>
 
+#ifdef CONFIG_HAVE_ARCH_HEAD_FILES
+#include <mach/kernel-entry-init.h>
+#else
 #include <kernel-entry-init.h>
+#endif
 
 	/*
 	 * For the moment disable interrupts, mark the kernel mode and
diff --git a/arch/mips/loongson64/Platform b/arch/mips/loongson64/Platform
index d5eb94c..aa0e112 100644
--- a/arch/mips/loongson64/Platform
+++ b/arch/mips/loongson64/Platform
@@ -56,5 +56,5 @@ cflags-y += $(call cc-option,-mno-loongson-mmi)
 #
 
 platform-$(CONFIG_MACH_LOONGSON64) += loongson64/
-cflags-$(CONFIG_MACH_LOONGSON64) += -I$(srctree)/arch/mips/include/asm/mach-loongson64 -mno-branch-likely
+cflags-$(CONFIG_MACH_LOONGSON64) += -I$(srctree)/arch/mips/loongson64/include -mno-branch-likely
 load-$(CONFIG_CPU_LOONGSON64) += 0xffffffff80200000
diff --git a/arch/mips/loongson64/env.c b/arch/mips/loongson64/env.c
index 0daeb7b..abec737 100644
--- a/arch/mips/loongson64/env.c
+++ b/arch/mips/loongson64/env.c
@@ -15,9 +15,9 @@
  */
 #include <linux/export.h>
 #include <asm/bootinfo.h>
-#include <loongson.h>
-#include <boot_param.h>
-#include <workarounds.h>
+#include <mach/loongson.h>
+#include <mach/boot_param.h>
+#include <mach/workarounds.h>
 
 u32 cpu_clock_freq;
 EXPORT_SYMBOL(cpu_clock_freq);
diff --git a/arch/mips/include/asm/mach-loongson64/boot_param.h b/arch/mips/loongson64/include/mach/boot_param.h
similarity index 100%
rename from arch/mips/include/asm/mach-loongson64/boot_param.h
rename to arch/mips/loongson64/include/mach/boot_param.h
diff --git a/arch/mips/include/asm/mach-loongson64/cpu-feature-overrides.h b/arch/mips/loongson64/include/mach/cpu-feature-overrides.h
similarity index 100%
rename from arch/mips/include/asm/mach-loongson64/cpu-feature-overrides.h
rename to arch/mips/loongson64/include/mach/cpu-feature-overrides.h
diff --git a/arch/mips/loongson64/include/mach/ioremap.h b/arch/mips/loongson64/include/mach/ioremap.h
new file mode 100644
index 0000000..2369393
--- /dev/null
+++ b/arch/mips/loongson64/include/mach/ioremap.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/ioremap.h>
diff --git a/arch/mips/include/asm/mach-loongson64/irq.h b/arch/mips/loongson64/include/mach/irq.h
similarity index 96%
rename from arch/mips/include/asm/mach-loongson64/irq.h
rename to arch/mips/loongson64/include/mach/irq.h
index 73a8991..8641e6c 100644
--- a/arch/mips/include/asm/mach-loongson64/irq.h
+++ b/arch/mips/loongson64/include/mach/irq.h
@@ -2,7 +2,7 @@
 #ifndef __ASM_MACH_LOONGSON64_IRQ_H_
 #define __ASM_MACH_LOONGSON64_IRQ_H_
 
-#include <boot_param.h>
+#include <mach/boot_param.h>
 
 /* cpu core interrupt numbers */
 #define MIPS_CPU_IRQ_BASE 56
@@ -36,5 +36,5 @@
 extern void fixup_irqs(void);
 extern void loongson3_ipi_interrupt(struct pt_regs *regs);
 
-#include_next <irq.h>
+#include <asm/mach-generic/irq.h>
 #endif /* __ASM_MACH_LOONGSON64_IRQ_H_ */
diff --git a/arch/mips/include/asm/mach-loongson64/kernel-entry-init.h b/arch/mips/loongson64/include/mach/kernel-entry-init.h
similarity index 100%
rename from arch/mips/include/asm/mach-loongson64/kernel-entry-init.h
rename to arch/mips/loongson64/include/mach/kernel-entry-init.h
diff --git a/arch/mips/loongson64/include/mach/kmalloc.h b/arch/mips/loongson64/include/mach/kmalloc.h
new file mode 100644
index 0000000..4f056db
--- /dev/null
+++ b/arch/mips/loongson64/include/mach/kmalloc.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kmalloc.h>
diff --git a/arch/mips/include/asm/mach-loongson64/loongson.h b/arch/mips/loongson64/include/mach/loongson.h
similarity index 99%
rename from arch/mips/include/asm/mach-loongson64/loongson.h
rename to arch/mips/loongson64/include/mach/loongson.h
index a8fce11..fb3f172 100644
--- a/arch/mips/include/asm/mach-loongson64/loongson.h
+++ b/arch/mips/loongson64/include/mach/loongson.h
@@ -10,7 +10,7 @@
 #include <linux/io.h>
 #include <linux/init.h>
 #include <linux/irq.h>
-#include <boot_param.h>
+#include <mach/boot_param.h>
 
 
 /* machine-specific reboot/halt operation */
diff --git a/arch/mips/include/asm/mach-loongson64/loongson_hwmon.h b/arch/mips/loongson64/include/mach/loongson_hwmon.h
similarity index 100%
rename from arch/mips/include/asm/mach-loongson64/loongson_hwmon.h
rename to arch/mips/loongson64/include/mach/loongson_hwmon.h
diff --git a/arch/mips/include/asm/mach-loongson64/loongson_regs.h b/arch/mips/loongson64/include/mach/loongson_regs.h
similarity index 100%
rename from arch/mips/include/asm/mach-loongson64/loongson_regs.h
rename to arch/mips/loongson64/include/mach/loongson_regs.h
diff --git a/arch/mips/loongson64/include/mach/mangle-port.h b/arch/mips/loongson64/include/mach/mangle-port.h
new file mode 100644
index 0000000..b9736e3
--- /dev/null
+++ b/arch/mips/loongson64/include/mach/mangle-port.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/mangle-port.h>
diff --git a/arch/mips/include/asm/mach-loongson64/mc146818rtc.h b/arch/mips/loongson64/include/mach/mc146818rtc.h
similarity index 100%
rename from arch/mips/include/asm/mach-loongson64/mc146818rtc.h
rename to arch/mips/loongson64/include/mach/mc146818rtc.h
diff --git a/arch/mips/include/asm/mach-loongson64/mmzone.h b/arch/mips/loongson64/include/mach/mmzone.h
similarity index 96%
rename from arch/mips/include/asm/mach-loongson64/mmzone.h
rename to arch/mips/loongson64/include/mach/mmzone.h
index 3a25dbd..57f7375 100644
--- a/arch/mips/include/asm/mach-loongson64/mmzone.h
+++ b/arch/mips/loongson64/include/mach/mmzone.h
@@ -9,7 +9,7 @@
 #ifndef _ASM_MACH_LOONGSON64_MMZONE_H
 #define _ASM_MACH_LOONGSON64_MMZONE_H
 
-#include <boot_param.h>
+#include <mach/boot_param.h>
 #define NODE_ADDRSPACE_SHIFT 44
 #define NODE0_ADDRSPACE_OFFSET 0x000000000000UL
 #define NODE1_ADDRSPACE_OFFSET 0x100000000000UL
diff --git a/arch/mips/include/asm/mach-loongson64/pci.h b/arch/mips/loongson64/include/mach/pci.h
similarity index 100%
rename from arch/mips/include/asm/mach-loongson64/pci.h
rename to arch/mips/loongson64/include/mach/pci.h
diff --git a/arch/mips/include/asm/mach-loongson64/spaces.h b/arch/mips/loongson64/include/mach/spaces.h
similarity index 100%
rename from arch/mips/include/asm/mach-loongson64/spaces.h
rename to arch/mips/loongson64/include/mach/spaces.h
diff --git a/arch/mips/include/asm/mach-loongson64/topology.h b/arch/mips/loongson64/include/mach/topology.h
similarity index 100%
rename from arch/mips/include/asm/mach-loongson64/topology.h
rename to arch/mips/loongson64/include/mach/topology.h
diff --git a/arch/mips/loongson64/include/mach/war.h b/arch/mips/loongson64/include/mach/war.h
new file mode 100644
index 0000000..5b0422a
--- /dev/null
+++ b/arch/mips/loongson64/include/mach/war.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/war.h>
diff --git a/arch/mips/include/asm/mach-loongson64/workarounds.h b/arch/mips/loongson64/include/mach/workarounds.h
similarity index 100%
rename from arch/mips/include/asm/mach-loongson64/workarounds.h
rename to arch/mips/loongson64/include/mach/workarounds.h
diff --git a/arch/mips/loongson64/init.c b/arch/mips/loongson64/init.c
index 5ac1a0f..6df4e14 100644
--- a/arch/mips/loongson64/init.c
+++ b/arch/mips/loongson64/init.c
@@ -11,7 +11,7 @@
 #include <asm/cacheflush.h>
 #include <asm/fw/fw.h>
 
-#include <loongson.h>
+#include <mach/loongson.h>
 
 static void __init mips_nmi_setup(void)
 {
diff --git a/arch/mips/loongson64/irq.c b/arch/mips/loongson64/irq.c
index 79ad797..64c344c 100644
--- a/arch/mips/loongson64/irq.c
+++ b/arch/mips/loongson64/irq.c
@@ -1,6 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0
+#ifdef CONFIG_HAVE_ARCH_HEAD_FILES
+#include <mach/loongson.h>
+#include <mach/irq.h>
+#else
 #include <loongson.h>
 #include <irq.h>
+#endif
 #include <linux/interrupt.h>
 #include <linux/init.h>
 
diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
index e5b40c5..719f3ce 100644
--- a/arch/mips/loongson64/numa.c
+++ b/arch/mips/loongson64/numa.c
@@ -24,7 +24,7 @@
 #include <asm/mc146818-time.h>
 #include <asm/time.h>
 #include <asm/wbflush.h>
-#include <boot_param.h>
+#include <mach/boot_param.h>
 
 static struct pglist_data prealloc__node_data[MAX_NUMNODES];
 unsigned char __node_distances[MAX_NUMNODES][MAX_NUMNODES];
diff --git a/arch/mips/loongson64/pci.c b/arch/mips/loongson64/pci.c
index e84ae20..7011d88 100644
--- a/arch/mips/loongson64/pci.c
+++ b/arch/mips/loongson64/pci.c
@@ -5,9 +5,9 @@
  */
 #include <linux/pci.h>
 
-#include <pci.h>
-#include <loongson.h>
-#include <boot_param.h>
+#include <mach/pci.h>
+#include <mach/loongson.h>
+#include <mach/boot_param.h>
 
 static struct resource loongson_pci_mem_resource = {
 	.name	= "pci memory space",
diff --git a/arch/mips/loongson64/platform.c b/arch/mips/loongson64/platform.c
index 9674ae1..2cd8b9b 100644
--- a/arch/mips/loongson64/platform.c
+++ b/arch/mips/loongson64/platform.c
@@ -10,9 +10,9 @@
 #include <linux/slab.h>
 #include <linux/platform_device.h>
 #include <asm/bootinfo.h>
-#include <boot_param.h>
-#include <loongson_hwmon.h>
-#include <workarounds.h>
+#include <mach/boot_param.h>
+#include <mach/loongson_hwmon.h>
+#include <mach/workarounds.h>
 
 static int __init loongson3_platform_init(void)
 {
diff --git a/arch/mips/loongson64/pm.c b/arch/mips/loongson64/pm.c
index 7c8556f..b05c6dd 100644
--- a/arch/mips/loongson64/pm.c
+++ b/arch/mips/loongson64/pm.c
@@ -12,7 +12,7 @@
 #include <asm/i8259.h>
 #include <asm/mipsregs.h>
 
-#include <loongson.h>
+#include <mach/loongson.h>
 
 static unsigned int __maybe_unused cached_master_mask;	/* i8259A */
 static unsigned int __maybe_unused cached_slave_mask;
diff --git a/arch/mips/loongson64/reset.c b/arch/mips/loongson64/reset.c
index 88b3bd5..374ea50 100644
--- a/arch/mips/loongson64/reset.c
+++ b/arch/mips/loongson64/reset.c
@@ -12,8 +12,8 @@
 #include <asm/idle.h>
 #include <asm/reboot.h>
 
-#include <loongson.h>
-#include <boot_param.h>
+#include <mach/loongson.h>
+#include <mach/boot_param.h>
 
 static inline void loongson_reboot(void)
 {
diff --git a/arch/mips/loongson64/setup.c b/arch/mips/loongson64/setup.c
index 4fd27f4..6fb9f9f 100644
--- a/arch/mips/loongson64/setup.c
+++ b/arch/mips/loongson64/setup.c
@@ -9,7 +9,7 @@
 #include <asm/wbflush.h>
 #include <asm/bootinfo.h>
 
-#include <loongson.h>
+#include <mach/loongson.h>
 
 static void wbflush_loongson(void)
 {
diff --git a/arch/mips/loongson64/smp.c b/arch/mips/loongson64/smp.c
index de8e074..573c9d4 100644
--- a/arch/mips/loongson64/smp.c
+++ b/arch/mips/loongson64/smp.c
@@ -17,9 +17,9 @@
 #include <asm/clock.h>
 #include <asm/tlbflush.h>
 #include <asm/cacheflush.h>
-#include <loongson.h>
-#include <loongson_regs.h>
-#include <workarounds.h>
+#include <mach/loongson.h>
+#include <mach/loongson_regs.h>
+#include <mach/workarounds.h>
 
 #include "smp.h"
 
diff --git a/arch/mips/loongson64/time.c b/arch/mips/loongson64/time.c
index 1245f22..4f8fdf8 100644
--- a/arch/mips/loongson64/time.c
+++ b/arch/mips/loongson64/time.c
@@ -10,7 +10,7 @@
 #include <asm/time.h>
 #include <asm/hpet.h>
 
-#include <loongson.h>
+#include <mach/loongson.h>
 
 void __init plat_time_init(void)
 {
diff --git a/arch/mips/oprofile/op_model_loongson3.c b/arch/mips/oprofile/op_model_loongson3.c
index 436b1fc..9ca6432 100644
--- a/arch/mips/oprofile/op_model_loongson3.c
+++ b/arch/mips/oprofile/op_model_loongson3.c
@@ -12,8 +12,8 @@
 #include <linux/spinlock.h>
 #include <linux/interrupt.h>
 #include <linux/uaccess.h>
-#include <irq.h>
-#include <loongson.h>
+#include <mach/irq.h>
+#include <mach/loongson.h>
 #include "op_impl.h"
 
 #define LOONGSON3_PERFCNT_OVERFLOW	(1ULL << 63)
diff --git a/arch/mips/pci/fixup-loongson3.c b/arch/mips/pci/fixup-loongson3.c
index 8a741c2..6c63c30 100644
--- a/arch/mips/pci/fixup-loongson3.c
+++ b/arch/mips/pci/fixup-loongson3.c
@@ -24,7 +24,7 @@
  */
 
 #include <linux/pci.h>
-#include <boot_param.h>
+#include <mach/boot_param.h>
 
 static void print_fixup_info(const struct pci_dev *pdev)
 {
diff --git a/arch/mips/pci/ops-loongson3.c b/arch/mips/pci/ops-loongson3.c
index 2f6ad36..f40b805 100644
--- a/arch/mips/pci/ops-loongson3.c
+++ b/arch/mips/pci/ops-loongson3.c
@@ -5,7 +5,7 @@
 
 #include <asm/mips-boards/bonito64.h>
 
-#include <loongson.h>
+#include <mach/loongson.h>
 
 #define PCI_ACCESS_READ  0
 #define PCI_ACCESS_WRITE 1
diff --git a/drivers/gpio/gpio-loongson.c b/drivers/gpio/gpio-loongson.c
index a421458..42dbdc9 100644
--- a/drivers/gpio/gpio-loongson.c
+++ b/drivers/gpio/gpio-loongson.c
@@ -17,7 +17,11 @@
 #include <linux/platform_device.h>
 #include <linux/bitops.h>
 #include <asm/types.h>
+#ifdef CONFIG_HAVE_ARCH_HEAD_FILES
+#include <mach/loongson.h>
+#else
 #include <loongson.h>
+#endif
 
 #define STLS2F_N_GPIO		4
 #define STLS3A_N_GPIO		16
diff --git a/drivers/platform/mips/cpu_hwmon.c b/drivers/platform/mips/cpu_hwmon.c
index 0d27cb7..4bb71af 100644
--- a/drivers/platform/mips/cpu_hwmon.c
+++ b/drivers/platform/mips/cpu_hwmon.c
@@ -6,10 +6,10 @@
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
 
-#include <loongson.h>
-#include <boot_param.h>
-#include <loongson_hwmon.h>
-#include <loongson_regs.h>
+#include <mach/loongson.h>
+#include <mach/boot_param.h>
+#include <mach/loongson_hwmon.h>
+#include <mach/loongson_regs.h>
 
 static int csr_temp_enable = 0;
 
-- 
1.8.3.1

