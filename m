Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 438121976A2
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2020 10:38:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729390AbgC3Ii5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Mar 2020 04:38:57 -0400
Received: from mail.loongson.cn ([114.242.206.163]:56720 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726017AbgC3Ii5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Mar 2020 04:38:57 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Ax1ukZsIFeIJchAA--.7S2;
        Mon, 30 Mar 2020 16:38:49 +0800 (CST)
From:   bibo mao <maobibo@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 01/39] MIPS: Add-mach-header-files-option
Date:   Mon, 30 Mar 2020 04:38:49 -0400
Message-Id: <1585557529-18194-1-git-send-email-maobibo@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: AQAAf9Ax1ukZsIFeIJchAA--.7S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuw1UZF4kZw1fCF17XF1rXrb_yoWfXry8pa
        1DAa1kGrZ8WryUAFyrAr929r43Jan5GrWY9Fyjga4jv3W2qF1DJrs3Krn8Ary8XFWqq3W0
        gFWfWw15Xr4Ivw7anT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9Fb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
        vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY
        62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWrXVW3AwAv7V
        C2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkI
        ecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267
        AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
        67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW7JVWDJw
        CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6Fyj6rWU
        JwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
        sGvfC2KfnxnUUI43ZEXa7IUYfR65UUUUU==
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Some header files are used without pathname prefix, it will
cause confliction if there exists the same filename locally.

This patch adds HAVE_MACH_HEAD_FILES option, with this enabled,
it will remove header files platform specific from
arch/mips/include/asm/mach-xxx to directory
arch/mips/mach-xxx/include/mach

Signed-off-by: bibo mao <maobibo@loongson.cn>
---
 arch/mips/Kconfig                    | 4 ++++
 arch/mips/Makefile                   | 2 ++
 arch/mips/include/asm/addrspace.h    | 4 ++++
 arch/mips/include/asm/cache.h        | 4 ++++
 arch/mips/include/asm/cpu-features.h | 4 ++++
 arch/mips/include/asm/fixmap.h       | 4 ++++
 arch/mips/include/asm/floppy.h       | 4 ++++
 arch/mips/include/asm/i8259.h        | 4 ++++
 arch/mips/include/asm/ide.h          | 6 ++++++
 arch/mips/include/asm/io.h           | 5 +++++
 arch/mips/include/asm/irq.h          | 4 ++++
 arch/mips/include/asm/mc146818rtc.h  | 4 ++++
 arch/mips/include/asm/mmzone.h       | 4 ++++
 arch/mips/include/asm/page.h         | 4 ++++
 arch/mips/include/asm/topology.h     | 4 ++++
 arch/mips/include/asm/war.h          | 4 ++++
 arch/mips/kernel/head.S              | 4 ++++
 17 files changed, 69 insertions(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index a1f973c..12f05bb 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1117,6 +1117,10 @@ config SCHED_OMIT_FRAME_POINTER
 	bool
 	default y
 
+config HAVE_MACH_HEAD_FILES
+	bool
+	default n
+
 #
 # Select some configuration options automatically based on user selections.
 #
diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index e1c44ae..dae3d53 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -263,7 +263,9 @@ load-y					= $(CONFIG_PHYSICAL_START)
 endif
 
 entry-y				= $(shell $(objtree)/arch/mips/tools/elf-entry vmlinux)
+ifndef CONFIG_HAVE_MACH_HEAD_FILES
 cflags-y			+= -I$(srctree)/arch/mips/include/asm/mach-generic
+endif
 drivers-$(CONFIG_PCI)		+= arch/mips/pci/
 
 #
diff --git a/arch/mips/include/asm/addrspace.h b/arch/mips/include/asm/addrspace.h
index 59a48c6..9cf7926 100644
--- a/arch/mips/include/asm/addrspace.h
+++ b/arch/mips/include/asm/addrspace.h
@@ -10,7 +10,11 @@
 #ifndef _ASM_ADDRSPACE_H
 #define _ASM_ADDRSPACE_H
 
+#ifdef CONFIG_HAVE_MACH_HEAD_FILES
+#include <mach/spaces.h>
+#else
 #include <spaces.h>
+#endif
 
 /*
  *  Configure language
diff --git a/arch/mips/include/asm/cache.h b/arch/mips/include/asm/cache.h
index 8b14c27..a0867f9 100644
--- a/arch/mips/include/asm/cache.h
+++ b/arch/mips/include/asm/cache.h
@@ -9,7 +9,11 @@
 #ifndef _ASM_CACHE_H
 #define _ASM_CACHE_H
 
+#ifdef CONFIG_HAVE_MACH_HEAD_FILES
+#include <mach/kmalloc.h>
+#else
 #include <kmalloc.h>
+#endif
 
 #define L1_CACHE_SHIFT		CONFIG_MIPS_L1_CACHE_SHIFT
 #define L1_CACHE_BYTES		(1 << L1_CACHE_SHIFT)
diff --git a/arch/mips/include/asm/cpu-features.h b/arch/mips/include/asm/cpu-features.h
index de44c92..facd189 100644
--- a/arch/mips/include/asm/cpu-features.h
+++ b/arch/mips/include/asm/cpu-features.h
@@ -12,7 +12,11 @@
 #include <asm/cpu.h>
 #include <asm/cpu-info.h>
 #include <asm/isa-rev.h>
+#ifdef CONFIG_HAVE_MACH_HEAD_FILES
+#include <mach/cpu-feature-overrides.h>
+#else
 #include <cpu-feature-overrides.h>
+#endif
 
 #define __ase(ase)			(cpu_data[0].ases & (ase))
 #define __isa(isa)			(cpu_data[0].isa_level & (isa))
diff --git a/arch/mips/include/asm/fixmap.h b/arch/mips/include/asm/fixmap.h
index 1784d43..1723929 100644
--- a/arch/mips/include/asm/fixmap.h
+++ b/arch/mips/include/asm/fixmap.h
@@ -14,7 +14,11 @@
 #define _ASM_FIXMAP_H
 
 #include <asm/page.h>
+#ifdef CONFIG_HAVE_MACH_HEAD_FILES
+#include <mach/spaces.h>
+#else
 #include <spaces.h>
+#endif
 #ifdef CONFIG_HIGHMEM
 #include <linux/threads.h>
 #include <asm/kmap_types.h>
diff --git a/arch/mips/include/asm/floppy.h b/arch/mips/include/asm/floppy.h
index 021d09a..55fb950 100644
--- a/arch/mips/include/asm/floppy.h
+++ b/arch/mips/include/asm/floppy.h
@@ -51,6 +51,10 @@ static inline void fd_cacheflush(char * addr, long size)
 
 #define EXTRA_FLOPPY_PARAMS
 
+#ifdef CONFIG_HAVE_MACH_HEAD_FILES
+#include <mach/floppy.h>
+#else
 #include <floppy.h>
+#endif
 
 #endif /* _ASM_FLOPPY_H */
diff --git a/arch/mips/include/asm/i8259.h b/arch/mips/include/asm/i8259.h
index a54b964..f9b6518 100644
--- a/arch/mips/include/asm/i8259.h
+++ b/arch/mips/include/asm/i8259.h
@@ -14,7 +14,11 @@
 #include <linux/spinlock.h>
 
 #include <asm/io.h>
+#ifdef CONFIG_HAVE_MACH_HEAD_FILES
+#include <mach/irq.h>
+#else
 #include <irq.h>
+#endif
 
 /* i8259A PIC registers */
 #define PIC_MASTER_CMD		0x20
diff --git a/arch/mips/include/asm/ide.h b/arch/mips/include/asm/ide.h
index bb674c3..1302c7d 100644
--- a/arch/mips/include/asm/ide.h
+++ b/arch/mips/include/asm/ide.h
@@ -8,6 +8,12 @@
 #ifndef __ASM_IDE_H
 #define __ASM_IDE_H
 
+#ifdef CONFIG_HAVE_MACH_HEAD_FILES
+#include <mach/ide.h>
+#else
 #include <ide.h>
+#endif
 
 #endif /* __ASM_IDE_H */
diff --git a/arch/mips/include/asm/io.h b/arch/mips/include/asm/io.h
index cf1f2a4..fe8f4a9 100644
--- a/arch/mips/include/asm/io.h
+++ b/arch/mips/include/asm/io.h
@@ -31,8 +31,13 @@
 #include <asm/processor.h>
 #include <asm/string.h>
 
+#ifdef CONFIG_HAVE_MACH_HEAD_FILES
+#include <mach/ioremap.h>
+#include <mach/mangle-port.h>
+#else
 #include <ioremap.h>
 #include <mangle-port.h>
+#endif
 
 /*
  * Raw operations are never swapped in software.  OTOH values that raw
diff --git a/arch/mips/include/asm/irq.h b/arch/mips/include/asm/irq.h
index c5d3517..c8cab02 100644
--- a/arch/mips/include/asm/irq.h
+++ b/arch/mips/include/asm/irq.h
@@ -15,7 +15,11 @@
 
 #include <asm/mipsmtregs.h>
 
+#ifdef CONFIG_HAVE_MACH_HEAD_FILES
+#include <mach/irq.h>
+#else
 #include <irq.h>
+#endif
 
 #define IRQ_STACK_SIZE			THREAD_SIZE
 #define IRQ_STACK_START			(IRQ_STACK_SIZE - 16)
diff --git a/arch/mips/include/asm/mc146818rtc.h b/arch/mips/include/asm/mc146818rtc.h
index 68b4da6..a0e1d91 100644
--- a/arch/mips/include/asm/mc146818rtc.h
+++ b/arch/mips/include/asm/mc146818rtc.h
@@ -11,6 +11,10 @@
 #ifndef _ASM_MC146818RTC_H
 #define _ASM_MC146818RTC_H
 
+#ifdef CONFIG_HAVE_MACH_HEAD_FILES
+#include <mach/mc146818rtc.h>
+#else
 #include <mc146818rtc.h>
+#endif
 
 #endif /* _ASM_MC146818RTC_H */
diff --git a/arch/mips/include/asm/mmzone.h b/arch/mips/include/asm/mmzone.h
index b826b84..043f88c 100644
--- a/arch/mips/include/asm/mmzone.h
+++ b/arch/mips/include/asm/mmzone.h
@@ -9,8 +9,12 @@
 #include <asm/page.h>
 
 #ifdef CONFIG_NEED_MULTIPLE_NODES
+#ifdef CONFIG_HAVE_MACH_HEAD_FILES
+#include <mach/mmzone.h>
+#else
 # include <mmzone.h>
 #endif
+#endif
 
 #ifndef pa_to_nid
 #define pa_to_nid(addr) 0
diff --git a/arch/mips/include/asm/page.h b/arch/mips/include/asm/page.h
index 0ba4ce6..4fb4ee2 100644
--- a/arch/mips/include/asm/page.h
+++ b/arch/mips/include/asm/page.h
@@ -9,7 +9,11 @@
 #ifndef _ASM_PAGE_H
 #define _ASM_PAGE_H
 
+#ifdef CONFIG_HAVE_MACH_HEAD_FILES
+#include <mach/spaces.h>
+#else
 #include <spaces.h>
+#endif
 #include <linux/const.h>
 #include <linux/kernel.h>
 #include <asm/mipsregs.h>
diff --git a/arch/mips/include/asm/topology.h b/arch/mips/include/asm/topology.h
index 0673d2d..ed955bb 100644
--- a/arch/mips/include/asm/topology.h
+++ b/arch/mips/include/asm/topology.h
@@ -8,7 +8,11 @@
 #ifndef __ASM_TOPOLOGY_H
 #define __ASM_TOPOLOGY_H
 
+#ifdef CONFIG_HAVE_MACH_HEAD_FILES
+#include <mach/topology.h>
+#else
 #include <topology.h>
+#endif
 #include <linux/smp.h>
 
 #ifdef CONFIG_SMP
diff --git a/arch/mips/include/asm/war.h b/arch/mips/include/asm/war.h
index 1eedd59..66264e1 100644
--- a/arch/mips/include/asm/war.h
+++ b/arch/mips/include/asm/war.h
@@ -9,7 +9,11 @@
 #ifndef _ASM_WAR_H
 #define _ASM_WAR_H
 
+#ifdef CONFIG_HAVE_MACH_HEAD_FILES
+#include <mach/war.h>
+#else
 #include <war.h>
+#endif
 
 /*
  * Work around certain R4000 CPU errata (as implemented by GCC):
diff --git a/arch/mips/kernel/head.S b/arch/mips/kernel/head.S
index 351d40f..a45cdae 100644
--- a/arch/mips/kernel/head.S
+++ b/arch/mips/kernel/head.S
@@ -24,7 +24,11 @@
 #include <asm/mipsregs.h>
 #include <asm/stackframe.h>
 
+#ifdef CONFIG_HAVE_MACH_HEAD_FILES
+#include <mach/kernel-entry-init.h>
+#else
 #include <kernel-entry-init.h>
+#endif
 
 	/*
 	 * For the moment disable interrupts, mark the kernel mode and
-- 
1.8.3.1

