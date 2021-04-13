Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69A9C35DA8A
	for <lists+linux-mips@lfdr.de>; Tue, 13 Apr 2021 10:57:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244040AbhDMI6Q (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 13 Apr 2021 04:58:16 -0400
Received: from mail.loongson.cn ([114.242.206.163]:52460 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229602AbhDMI6K (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 13 Apr 2021 04:58:10 -0400
Received: from bogon.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxHcj2XHVgGnoHAA--.11050S2;
        Tue, 13 Apr 2021 16:57:27 +0800 (CST)
From:   Youling Tang <tangyouling@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Eric Biederman <ebiederm@xmission.com>,
        Dave Young <dyoung@redhat.com>, Baoquan He <bhe@redhat.com>,
        Vivek Goyal <vgoyal@redhat.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jinyang He <hejinyang@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>
Subject: [PATCH v4] MIPS: Loongson64: Add kexec/kdump support
Date:   Tue, 13 Apr 2021 16:57:23 +0800
Message-Id: <1618304243-6212-1-git-send-email-tangyouling@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9AxHcj2XHVgGnoHAA--.11050S2
X-Coremail-Antispam: 1UD129KBjvJXoW3WFyrtF43CrykWr4ktFW5Jrb_yoWfZw1rpa
        15A3WkKFs5Wr4Iyrn5X3yDu345uas5JFy3GFZFk3s5Wasagr1UXF95Xa17XFy0kr45KF4x
        WFWa9r1rKanrt3DanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBY14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
        Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r43MxAIw28IcxkI7VAKI4
        8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
        wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjx
        v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20E
        Y4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
        0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjVWlPUUUUU==
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Huacai Chen <chenhc@lemote.com>

Add kexec/kdump support for Loongson64 by:
1, Provide Loongson-specific kexec functions: loongson_kexec_prepare(),
   loongson_kexec_shutdown() and loongson_crash_shutdown();
2, Provide Loongson-specific assembly code in kexec_smp_wait();

To start Loongson64, The boot CPU needs 3 parameters:
fw_arg0: the number of arguments in cmdline (i.e., argc).
fw_arg1: structure holds cmdline such as "root=/dev/sda1 console=tty"
         (i.e., argv).
fw_arg2: environment (i.e., envp, additional boot parameters from LEFI).

Non-boot CPUs do not need one parameter as the IPI mailbox base address.
They query their own IPI mailbox to get PC, SP and GP in a loopi, until
the boot CPU brings them up.

loongson_kexec_prepare(): Setup cmdline for kexec/kdump. The kexec/kdump
cmdline comes from kexec's "append" option string. This structure will
be parsed in fw_init_cmdline() of arch/mips/fw/lib/cmdline.c. Both image
->control_code_page and the cmdline need to be in a safe memory region
(memory allocated by the old kernel may be corrupted by the new kernel).
In order to maintain compatibility for the old firmware, the low 2MB is
reserverd and safe for Loongson. So let KEXEC_CTRL_CODE and KEXEC_ARGV_
ADDR be here. LEFI parameters may be corrupted at runtime, so backup it
at mips_reboot_setup(), and then restore it at loongson_kexec_shutdown()
/loongson_crash_shutdown().

loongson_kexec_shutdown(): Wake up all present CPUs and let them go to
reboot_code_buffer. Pass the kexec parameters to kexec_args.

loongson_crash_shutdown(): Pass the kdump parameters to kexec_args.

The assembly part in kexec_smp_wait provide a routine as BIOS does, in
order to keep secondary CPUs in a querying loop.

The layout of low 2MB memory in our design:
0x80000000, the first MB, the first 64K, Exception vectors
0x80010000, the first MB, the second 64K, STR (suspend) data
0x80020000, the first MB, the third and fourth 64K, UEFI HOB
0x80040000, the first MB, the fifth 64K, RT-Thread for SMC
0x80100000, the second MB, the first 64K, KEXEC code
0x80108000, the second MB, the second 64K, KEXEC data

Cc: Eric Biederman <ebiederm@xmission.com>
Tested-by: Jinyang He <hejinyang@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@kernel.org>
Signed-off-by: Jinyang He <hejinyang@loongson.cn>
Signed-off-by: Youling Tang <tangyouling@loongson.cn>
---
v3 -> v4:
- Use the macro kexec_smp_wait_final and move the platform-specific code
  into the kernel-entry-init.h file. This suggestion comes from Thomas.

 .../asm/mach-cavium-octeon/kernel-entry-init.h     |   8 ++
 .../asm/mach-loongson64/kernel-entry-init.h        |  27 +++++
 arch/mips/kernel/relocate_kernel.S                 |   9 +-
 arch/mips/loongson64/reset.c                       | 113 +++++++++++++++++++++
 4 files changed, 152 insertions(+), 5 deletions(-)

diff --git a/arch/mips/include/asm/mach-cavium-octeon/kernel-entry-init.h b/arch/mips/include/asm/mach-cavium-octeon/kernel-entry-init.h
index c38b38c..b071a73 100644
--- a/arch/mips/include/asm/mach-cavium-octeon/kernel-entry-init.h
+++ b/arch/mips/include/asm/mach-cavium-octeon/kernel-entry-init.h
@@ -157,4 +157,12 @@
 	.macro	smp_slave_setup
 	.endm
 
+#define USE_KEXEC_SMP_WAIT_FINAL
+	.macro  kexec_smp_wait_final
+	.set push
+	.set noreorder
+	synci		0($0)
+	.set pop
+	.endm
+
 #endif /* __ASM_MACH_CAVIUM_OCTEON_KERNEL_ENTRY_H */
diff --git a/arch/mips/include/asm/mach-loongson64/kernel-entry-init.h b/arch/mips/include/asm/mach-loongson64/kernel-entry-init.h
index e4d77f4..13373c5 100644
--- a/arch/mips/include/asm/mach-loongson64/kernel-entry-init.h
+++ b/arch/mips/include/asm/mach-loongson64/kernel-entry-init.h
@@ -75,4 +75,31 @@
 	.set	pop
 	.endm
 
+#define USE_KEXEC_SMP_WAIT_FINAL
+	.macro  kexec_smp_wait_final
+	/* s0:prid s1:initfn */
+	/* a0:base t1:cpuid t2:node t9:count */
+	mfc0		t1, CP0_EBASE
+	andi		t1, MIPS_EBASE_CPUNUM
+	dins		a0, t1, 8, 2       /* insert core id*/
+	dext		t2, t1, 2, 2
+	dins		a0, t2, 44, 2      /* insert node id */
+	mfc0		s0, CP0_PRID
+	andi		s0, s0, (PRID_IMP_MASK | PRID_REV_MASK)
+	beq		s0, (PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3B_R1), 1f
+	beq		s0, (PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3B_R2), 1f
+	b		2f                 /* Loongson-3A1000/3A2000/3A3000/3A4000 */
+1:	dins		a0, t2, 14, 2      /* Loongson-3B1000/3B1500 need bit 15~14 */
+2:	li		t9, 0x100          /* wait for init loop */
+3:	addiu		t9, -1             /* limit mailbox access */
+	bnez		t9, 3b
+	lw		s1, 0x20(a0)       /* check PC as an indicator */
+	beqz		s1, 2b
+	ld		s1, 0x20(a0)       /* get PC via mailbox reg0 */
+	ld		sp, 0x28(a0)       /* get SP via mailbox reg1 */
+	ld		gp, 0x30(a0)       /* get GP via mailbox reg2 */
+	ld		a1, 0x38(a0)
+	jr		s1                 /* jump to initial PC */
+	.endm
+
 #endif /* __ASM_MACH_LOONGSON64_KERNEL_ENTRY_H */
diff --git a/arch/mips/kernel/relocate_kernel.S b/arch/mips/kernel/relocate_kernel.S
index ac87089..f3c908a 100644
--- a/arch/mips/kernel/relocate_kernel.S
+++ b/arch/mips/kernel/relocate_kernel.S
@@ -11,6 +11,8 @@
 #include <asm/stackframe.h>
 #include <asm/addrspace.h>
 
+#include <kernel-entry-init.h>
+
 LEAF(relocate_new_kernel)
 	PTR_L a0,	arg0
 	PTR_L a1,	arg1
@@ -125,11 +127,8 @@ LEAF(kexec_smp_wait)
 1:	LONG_L		s0, (t0)
 	bne		s0, zero,1b
 
-#ifdef CONFIG_CPU_CAVIUM_OCTEON
-	.set push
-	.set noreorder
-	synci		0($0)
-	.set pop
+#ifdef USE_KEXEC_SMP_WAIT_FINAL
+	kexec_smp_wait_final
 #else
 	sync
 #endif
diff --git a/arch/mips/loongson64/reset.c b/arch/mips/loongson64/reset.c
index 3bb8a1e..c97bfdc 100644
--- a/arch/mips/loongson64/reset.c
+++ b/arch/mips/loongson64/reset.c
@@ -6,9 +6,14 @@
  * Copyright (C) 2009 Lemote, Inc.
  * Author: Zhangjin Wu, wuzhangjin@gmail.com
  */
+#include <linux/cpu.h>
+#include <linux/delay.h>
 #include <linux/init.h>
+#include <linux/kexec.h>
 #include <linux/pm.h>
+#include <linux/slab.h>
 
+#include <asm/bootinfo.h>
 #include <asm/idle.h>
 #include <asm/reboot.h>
 
@@ -47,12 +52,120 @@ static void loongson_halt(void)
 	}
 }
 
+#ifdef CONFIG_KEXEC
+
+/* 0X80000000~0X80200000 is safe */
+#define MAX_ARGS	64
+#define KEXEC_CTRL_CODE	0xFFFFFFFF80100000UL
+#define KEXEC_ARGV_ADDR	0xFFFFFFFF80108000UL
+#define KEXEC_ARGV_SIZE	COMMAND_LINE_SIZE
+#define KEXEC_ENVP_SIZE	4800
+
+static int kexec_argc;
+static int kdump_argc;
+static void *kexec_argv;
+static void *kdump_argv;
+static void *kexec_envp;
+
+static int loongson_kexec_prepare(struct kimage *image)
+{
+	int i, argc = 0;
+	unsigned int *argv;
+	char *str, *ptr, *bootloader = "kexec";
+
+	/* argv at offset 0, argv[] at offset KEXEC_ARGV_SIZE/2 */
+	if (image->type == KEXEC_TYPE_DEFAULT)
+		argv = (unsigned int *)kexec_argv;
+	else
+		argv = (unsigned int *)kdump_argv;
+
+	argv[argc++] = (unsigned int)(KEXEC_ARGV_ADDR + KEXEC_ARGV_SIZE/2);
+
+	for (i = 0; i < image->nr_segments; i++) {
+		if (!strncmp(bootloader, (char *)image->segment[i].buf,
+				strlen(bootloader))) {
+			/*
+			 * convert command line string to array
+			 * of parameters (as bootloader does).
+			 */
+			int offt;
+			str = (char *)argv + KEXEC_ARGV_SIZE/2;
+			memcpy(str, image->segment[i].buf, KEXEC_ARGV_SIZE/2);
+			ptr = strchr(str, ' ');
+
+			while (ptr && (argc < MAX_ARGS)) {
+				*ptr = '\0';
+				if (ptr[1] != ' ') {
+					offt = (int)(ptr - str + 1);
+					argv[argc] = KEXEC_ARGV_ADDR + KEXEC_ARGV_SIZE/2 + offt;
+					argc++;
+				}
+				ptr = strchr(ptr + 1, ' ');
+			}
+			break;
+		}
+	}
+
+	if (image->type == KEXEC_TYPE_DEFAULT)
+		kexec_argc = argc;
+	else
+		kdump_argc = argc;
+
+	/* kexec/kdump need a safe page to save reboot_code_buffer */
+	image->control_code_page = virt_to_page((void *)KEXEC_CTRL_CODE);
+
+	return 0;
+}
+
+static void loongson_kexec_shutdown(void)
+{
+#ifdef CONFIG_SMP
+	int cpu;
+
+	/* All CPUs go to reboot_code_buffer */
+	for_each_possible_cpu(cpu)
+		if (!cpu_online(cpu))
+			cpu_device_up(get_cpu_device(cpu));
+#endif
+	kexec_args[0] = kexec_argc;
+	kexec_args[1] = fw_arg1;
+	kexec_args[2] = fw_arg2;
+	secondary_kexec_args[0] = TO_UNCAC(0x3ff01000);
+	memcpy((void *)fw_arg1, kexec_argv, KEXEC_ARGV_SIZE);
+	memcpy((void *)fw_arg2, kexec_envp, KEXEC_ENVP_SIZE);
+}
+
+static void loongson_crash_shutdown(struct pt_regs *regs)
+{
+	default_machine_crash_shutdown(regs);
+	kexec_args[0] = kdump_argc;
+	kexec_args[1] = fw_arg1;
+	kexec_args[2] = fw_arg2;
+	secondary_kexec_args[0] = TO_UNCAC(0x3ff01000);
+	memcpy((void *)fw_arg1, kdump_argv, KEXEC_ARGV_SIZE);
+	memcpy((void *)fw_arg2, kexec_envp, KEXEC_ENVP_SIZE);
+}
+
+#endif
+
 static int __init mips_reboot_setup(void)
 {
 	_machine_restart = loongson_restart;
 	_machine_halt = loongson_halt;
 	pm_power_off = loongson_poweroff;
 
+#ifdef CONFIG_KEXEC
+	kexec_argv = kmalloc(KEXEC_ARGV_SIZE, GFP_KERNEL);
+	kdump_argv = kmalloc(KEXEC_ARGV_SIZE, GFP_KERNEL);
+	kexec_envp = kmalloc(KEXEC_ENVP_SIZE, GFP_KERNEL);
+	fw_arg1 = KEXEC_ARGV_ADDR;
+	memcpy(kexec_envp, (void *)fw_arg2, KEXEC_ENVP_SIZE);
+
+	_machine_kexec_prepare = loongson_kexec_prepare;
+	_machine_kexec_shutdown = loongson_kexec_shutdown;
+	_machine_crash_shutdown = loongson_crash_shutdown;
+#endif
+
 	return 0;
 }
 
-- 
2.1.0

