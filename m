Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DF4126B83A
	for <lists+linux-mips@lfdr.de>; Wed, 16 Sep 2020 02:39:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726644AbgIPAj3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 15 Sep 2020 20:39:29 -0400
Received: from mail.loongson.cn ([114.242.206.163]:33712 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726506AbgIONIi (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 15 Sep 2020 09:08:38 -0400
Received: from bogon.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxSMSsvGBfsXoVAA--.162S2;
        Tue, 15 Sep 2020 21:07:57 +0800 (CST)
From:   Jinyang He <hejinyang@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Youling Tang <tangyouling@loongson.cn>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, kexec@lists.infradead.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH] MIPS: Loongson64: Add kexec/kdump support
Date:   Tue, 15 Sep 2020 21:07:43 +0800
Message-Id: <1600175263-7872-1-git-send-email-hejinyang@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9DxSMSsvGBfsXoVAA--.162S2
X-Coremail-Antispam: 1UD129KBjvJXoW3XrWDKr43Kw4kurW8ury7trb_yoW7XFWfpa
        1UC3WDKr4rAr47trn3XrWDZ345ua95JFy7JF4aka95Wa4DKryUZFyrWF1fXFZ7Ar45KF47
        XFyFvr18WF43J3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_Xr4l
        42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
        WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAK
        I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
        4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
        0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUcSdkUUUUU=
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add loongson_kexec_prepare(), loongson_kexec_shutdown() and
loongson_kexec_crashdown() for passing the parameters of kexec_args.

To start loongson64, CPU0 needs 3 parameters:
fw_arg0: the number of cmd.
fw_arg1: cmd structure which seems strange, the cmd array[index]'s
         value is cmd string's address, index >= 1.
fw_arg2: environment.

Secondary CPUs do not need parameter at once. They query their
mailbox to get PC, SP and GP in a loop before CPU0 brings them up
and passes these parameters via mailbox.

loongson_kexec_prepare(): Alloc new memory to save cmd for kexec.
Combine the kexec append option string as cmd structure, and the cmd
struct will be parsed in fw_init_cmdline() of arch/mips/fw/lib/cmdline.c.
image->control_code_page need pointing to a safe memory page. In order to
maintain compatibility for the old firmware the low 2MB is reserverd
and safe for Loongson. So let it points here.

loongson_kexec_shutdown(): Wake up all present CPUs and let them go
to reboot_code_buffer. Pass the kexec parameters to kexec_args.

loongson_crash_shutdown(): Pass the kdump parameters to kexec_args.

The assembly part provide a way like BIOS doing to keep secondary
CPUs in a querying loop.

This patch referenced [1][2][3].

[1] arch/mips/cavium-octeon/setup.c
[2] https://patchwork.kernel.org/patch/10799217/
[3] https://gitee.com/loongsonlab/qemu/blob/master/hw/mips/loongson3a_rom.h

Co-developed-by: Youling Tang <tangyouling@loongson.cn>
Signed-off-by: Youling Tang <tangyouling@loongson.cn>
Signed-off-by: Jinyang He <hejinyang@loongson.cn>
---
 arch/mips/kernel/relocate_kernel.S | 19 ++++++++
 arch/mips/loongson64/reset.c       | 88 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 107 insertions(+)

diff --git a/arch/mips/kernel/relocate_kernel.S b/arch/mips/kernel/relocate_kernel.S
index ac87089..061cbfb 100644
--- a/arch/mips/kernel/relocate_kernel.S
+++ b/arch/mips/kernel/relocate_kernel.S
@@ -133,6 +133,25 @@ LEAF(kexec_smp_wait)
 #else
 	sync
 #endif
+
+#ifdef CONFIG_CPU_LOONGSON64
+#define MAILBOX_BASE 0x900000003ff01000
+	mfc0  t1, CP0_EBASE
+	andi  t1, MIPS_EBASE_CPUNUM
+	dli   t0, MAILBOX_BASE
+	andi  t3, t1, 0x3
+	sll   t3, 8
+	or    t0, t0, t3	/* insert core id */
+	andi  t2, t1, 0xc
+	dsll  t2, 42
+	or    t0, t0, t2	/* insert node id */
+1:	ld    s1, 0x20(t0)	/* get PC via mailbox0 */
+	beqz  s1, 1b
+	ld    sp, 0x28(t0)	/* get SP via mailbox1 */
+	ld    gp, 0x30(t0)	/* get GP via mailbox2 */
+	ld    a1, 0x38(t0)
+	jr    s1
+#endif
 	j		s1
 	END(kexec_smp_wait)
 #endif
diff --git a/arch/mips/loongson64/reset.c b/arch/mips/loongson64/reset.c
index 3bb8a1e..322c326 100644
--- a/arch/mips/loongson64/reset.c
+++ b/arch/mips/loongson64/reset.c
@@ -47,12 +47,100 @@ static void loongson_halt(void)
 	}
 }
 
+#ifdef CONFIG_KEXEC
+#include <linux/cpu.h>
+#include <linux/kexec.h>
+
+#include <asm/bootinfo.h>
+
+#define CONTROL_CODE_PAGE    0xFFFFFFFF80000000UL
+static int kexec_argc;
+static int kdump_argc;
+static void *kexec_argv;
+static void *kdump_argv;
+
+static int loongson_kexec_prepare(struct kimage *image)
+{
+	int i, offt, argc = 0;
+	int *argv;
+	char *str, *ptr, *bootloader = "kexec";
+
+	argv = kmalloc(COMMAND_LINE_SIZE, GFP_KERNEL);
+	if (!argv)
+		return -ENOMEM;
+
+	for (i = 0; i < image->nr_segments; i++) {
+		if (!strncmp(bootloader, (char *)image->segment[i].buf,
+				strlen(bootloader))) {
+			argv[argc++] = fw_arg1 + COMMAND_LINE_SIZE/2;
+			str = (char *)argv + COMMAND_LINE_SIZE/2;
+			memcpy(str, image->segment[i].buf, COMMAND_LINE_SIZE/2);
+			ptr = strchr(str, ' ');
+			while (ptr) {
+				*ptr = '\0';
+				if (ptr[1] != ' ') {
+					offt = (int)(ptr - str + 1);
+					argv[argc++] = fw_arg1 + COMMAND_LINE_SIZE/2 + offt;
+				}
+				ptr = strchr(ptr + 1, ' ');
+			}
+			break;
+		}
+	}
+
+	/* Kexec/kdump needs a safe page to save reboot_code_buffer. */
+	image->control_code_page = virt_to_page((void *)CONTROL_CODE_PAGE);
+
+	if (image->type == KEXEC_TYPE_CRASH) {
+		kfree(kdump_argv);
+		kdump_argc = argc;
+		kdump_argv = argv;
+	} else {
+		kfree(kexec_argv);
+		kexec_argc = argc;
+		kexec_argv = argv;
+	}
+
+	return 0;
+}
+
+static void loongson_kexec_shutdown(void)
+{
+#ifdef CONFIG_SMP
+	bringup_nonboot_cpus(loongson_sysconf.nr_cpus);
+#endif
+	fw_arg0 = kexec_argc;
+	memcpy((void *)fw_arg1, kexec_argv, COMMAND_LINE_SIZE);
+
+	kexec_args[0] = fw_arg0;
+	kexec_args[1] = fw_arg1;
+	kexec_args[2] = fw_arg2;
+}
+
+static void loongson_crash_shutdown(struct pt_regs *regs)
+{
+	default_machine_crash_shutdown(regs);
+	fw_arg0 = kdump_argc;
+	memcpy((void *)fw_arg1, kdump_argv, COMMAND_LINE_SIZE);
+
+	kexec_args[0] = fw_arg0;
+	kexec_args[1] = fw_arg1;
+	kexec_args[2] = fw_arg2;
+}
+#endif
+
 static int __init mips_reboot_setup(void)
 {
 	_machine_restart = loongson_restart;
 	_machine_halt = loongson_halt;
 	pm_power_off = loongson_poweroff;
 
+#ifdef CONFIG_KEXEC
+	_machine_kexec_prepare = loongson_kexec_prepare;
+	_machine_kexec_shutdown = loongson_kexec_shutdown;
+	_machine_crash_shutdown = loongson_crash_shutdown;
+#endif
+
 	return 0;
 }
 
-- 
2.1.0

