Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9973288770
	for <lists+linux-mips@lfdr.de>; Fri,  9 Oct 2020 12:57:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732462AbgJIK5m (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 9 Oct 2020 06:57:42 -0400
Received: from mail.loongson.cn ([114.242.206.163]:38288 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732395AbgJIK5i (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 9 Oct 2020 06:57:38 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx2MUaQoBf2pcbAA--.2238S5;
        Fri, 09 Oct 2020 18:57:32 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH 3/3] MIPS: Loongson64: Add /proc/boardinfo
Date:   Fri,  9 Oct 2020 18:57:30 +0800
Message-Id: <1602241050-24051-4-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1602241050-24051-1-git-send-email-yangtiezhu@loongson.cn>
References: <1602241050-24051-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9Dx2MUaQoBf2pcbAA--.2238S5
X-Coremail-Antispam: 1UD129KBjvJXoW3Ar4Dur4fWry7Zw4xAw4UCFg_yoW7GrWUpa
        y3A3WrGw4Ygr17Cr95WrWUurWfAa95KrsFyFW29r15Kr90g34Iqrs3C3W8ArsFkr1UG3WU
        XFWrKF4xCFy8u3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBa14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
        ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
        xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
        vE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
        r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8twCF04k20x
        vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
        3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIx
        AIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAI
        cVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2js
        IEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUeEEUUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add /proc/boardinfo to get mainboard and BIOS info easily on the Loongson
platform, this is useful to point out the current used mainboard type and
BIOS version when there exists problems related with hardware or firmware.

E.g. with this patch:

[loongson@linux ~]$ cat /proc/boardinfo
Board Info
Manufacturer            : LEMOTE
Board Name              : LEMOTE-LS3A4000-7A1000-1w-V01-pc
Family                  : LOONGSON3

BIOS Info
Vendor                  : Kunlun
Version                 : Kunlun-A1901-V4.1.3-20200414093938
ROM Size                : 4 KB
Release Date            : 2020-04-14

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/mips/include/asm/mach-loongson64/boot_param.h |  4 +++
 arch/mips/loongson64/Makefile                      |  2 +-
 arch/mips/loongson64/boardinfo.c                   | 40 ++++++++++++++++++++++
 arch/mips/loongson64/env.c                         | 10 ++++++
 4 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 arch/mips/loongson64/boardinfo.c

diff --git a/arch/mips/include/asm/mach-loongson64/boot_param.h b/arch/mips/include/asm/mach-loongson64/boot_param.h
index afc92b7..4592841 100644
--- a/arch/mips/include/asm/mach-loongson64/boot_param.h
+++ b/arch/mips/include/asm/mach-loongson64/boot_param.h
@@ -228,6 +228,10 @@ struct loongson_system_configuration {
 extern struct efi_memory_map_loongson *loongson_memmap;
 extern struct loongson_system_configuration loongson_sysconf;
 
+extern struct board_devices *eboard;
+extern struct interface_info *einter;
+extern struct loongson_special_attribute *especial;
+
 extern u32 node_id_offset;
 extern void ls7a_early_config(void);
 extern void rs780e_early_config(void);
diff --git a/arch/mips/loongson64/Makefile b/arch/mips/loongson64/Makefile
index 39c06f5..bc77b5a 100644
--- a/arch/mips/loongson64/Makefile
+++ b/arch/mips/loongson64/Makefile
@@ -3,7 +3,7 @@
 # Makefile for Loongson-3 family machines
 #
 obj-$(CONFIG_MACH_LOONGSON64) += cop2-ex.o platform.o dma.o \
-				setup.o init.o env.o time.o reset.o \
+				setup.o init.o env.o time.o reset.o boardinfo.o\
 
 obj-$(CONFIG_SMP)	+= smp.o
 obj-$(CONFIG_NUMA)	+= numa.o
diff --git a/arch/mips/loongson64/boardinfo.c b/arch/mips/loongson64/boardinfo.c
new file mode 100644
index 0000000..2e8086b
--- /dev/null
+++ b/arch/mips/loongson64/boardinfo.c
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/fs.h>
+#include <linux/init.h>
+#include <linux/proc_fs.h>
+#include <linux/seq_file.h>
+#include <linux/module.h>
+#include <boot_param.h>
+
+static int loongson_boardinfo_proc_show(struct seq_file *m, void *v)
+{
+	char board_manufacturer[64] = {0};
+	char *tmp_board_manufacturer = board_manufacturer;
+	char bios_vendor[64] = {0};
+	char *tmp_bios_vendor = bios_vendor;
+
+	strcpy(board_manufacturer, eboard->name);
+	strcpy(bios_vendor, einter->description);
+
+	seq_puts(m, "Board Info\n");
+	seq_printf(m, "Manufacturer\t\t: %s\n", strsep(&tmp_board_manufacturer, "-"));
+	seq_printf(m, "Board Name\t\t: %s\n", eboard->name);
+	seq_puts(m, "Family\t\t\t: LOONGSON3\n");
+	seq_puts(m, "\n");
+
+	seq_puts(m, "BIOS Info\n");
+	seq_printf(m, "Vendor\t\t\t: %s\n", strsep(&tmp_bios_vendor, "-"));
+	seq_printf(m, "Version\t\t\t: %s\n", einter->description);
+	seq_printf(m, "ROM Size\t\t: %d KB\n", einter->size);
+	seq_printf(m, "Release Date\t\t: %s\n", especial->special_name);
+
+	return 0;
+}
+
+static int __init proc_boardinfo_init(void)
+{
+	proc_create_single("boardinfo", 0, NULL, loongson_boardinfo_proc_show);
+	return 0;
+}
+
+module_init(proc_boardinfo_init);
diff --git a/arch/mips/loongson64/env.c b/arch/mips/loongson64/env.c
index 134cb8e..51a5d05 100644
--- a/arch/mips/loongson64/env.c
+++ b/arch/mips/loongson64/env.c
@@ -28,6 +28,10 @@ EXPORT_SYMBOL(cpu_clock_freq);
 struct efi_memory_map_loongson *loongson_memmap;
 struct loongson_system_configuration loongson_sysconf;
 
+struct board_devices *eboard;
+struct interface_info *einter;
+struct loongson_special_attribute *especial;
+
 u64 loongson_chipcfg[MAX_PACKAGES] = {0xffffffffbfc00180};
 u64 loongson_chiptemp[MAX_PACKAGES];
 u64 loongson_freqctrl[MAX_PACKAGES];
@@ -57,6 +61,12 @@ void __init prom_init_env(void)
 		((u64)loongson_p + loongson_p->system_offset);
 	ecpu = (struct efi_cpuinfo_loongson *)
 		((u64)loongson_p + loongson_p->cpu_offset);
+	eboard = (struct board_devices *)
+		((u64)loongson_p + loongson_p->boarddev_table_offset);
+	einter = (struct interface_info *)
+		((u64)loongson_p + loongson_p->interface_offset);
+	especial = (struct loongson_special_attribute *)
+		((u64)loongson_p + loongson_p->special_offset);
 	eirq_source = (struct irq_source_routing_table *)
 		((u64)loongson_p + loongson_p->irq_offset);
 	loongson_memmap = (struct efi_memory_map_loongson *)
-- 
2.1.0

