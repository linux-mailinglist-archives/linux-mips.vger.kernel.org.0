Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42C9328C865
	for <lists+linux-mips@lfdr.de>; Tue, 13 Oct 2020 07:55:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388680AbgJMFzQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 13 Oct 2020 01:55:16 -0400
Received: from mail.loongson.cn ([114.242.206.163]:41154 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388518AbgJMFzQ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 13 Oct 2020 01:55:16 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxX8c3QYVfhPscAA--.14939S3;
        Tue, 13 Oct 2020 13:55:05 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH 1/2] MIPS: Loongson64: Add /sys/firmware/lefi/boardinfo
Date:   Tue, 13 Oct 2020 13:55:01 +0800
Message-Id: <1602568502-18044-2-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1602568502-18044-1-git-send-email-yangtiezhu@loongson.cn>
References: <1602568502-18044-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9DxX8c3QYVfhPscAA--.14939S3
X-Coremail-Antispam: 1UD129KBjvJXoW3WF1ktr4rWFykWrWfZw17Awb_yoW7CFyxpa
        y3Aw1UGr4Ygr17ur95WrWUZryfAa95KrZFyF429r15KryqgrySqrs3Ga48ArsFyr18Ga48
        XFWrKF48CF1xCwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBS14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
        x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
        ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
        0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
        IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
        Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_GrWl42xK82
        IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
        0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMI
        IF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF
        0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87
        Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUexhLDUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add /sys/firmware/lefi/boardinfo to get mainboard and BIOS info easily
on the Loongson platform, this is useful to point out the current used
mainboard type and BIOS version when there exists problems related with
hardware or firmware.

The related structures are already defined in the interface specification
about firmware and kernel which are common requirement and specific for
Loongson64, so only add a new boardinfo.c file in arch/mips/loongson64.

E.g. with this patch:

[loongson@linux ~]$ cat /sys/firmware/lefi/boardinfo
Board Info
Manufacturer            : LEMOTE
Board Name              : LEMOTE-LS3A4000-7A1000-1w-V01-pc
Family                  : LOONGSON3

BIOS Info
Vendor                  : Kunlun
Version                 : Kunlun-A1901-V4.1.3-20200414093938
ROM Size                : 4 KB
Release Date            : 2020-04-14

By the way, using dmidecode command can get the similar info if there
exists SMBIOS in firmware, but the fact is that there is no SMBIOS on
some machines, we can see nothing when execute dmidecode, like this:

[root@linux loongson]# dmidecode
# dmidecode 2.12
# No SMBIOS nor DMI entry point found, sorry.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/mips/include/asm/mach-loongson64/boot_param.h |  4 ++
 arch/mips/loongson64/Makefile                      |  1 +
 arch/mips/loongson64/boardinfo.c                   | 48 ++++++++++++++++++++++
 arch/mips/loongson64/env.c                         | 10 +++++
 4 files changed, 63 insertions(+)
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
index 39c06f5..cc76944 100644
--- a/arch/mips/loongson64/Makefile
+++ b/arch/mips/loongson64/Makefile
@@ -11,3 +11,4 @@ obj-$(CONFIG_RS780_HPET) += hpet.o
 obj-$(CONFIG_SUSPEND) += pm.o
 obj-$(CONFIG_PCI_QUIRKS) += vbios_quirk.o
 obj-$(CONFIG_CPU_LOONGSON3_CPUCFG_EMULATION) += cpucfg-emul.o
+obj-$(CONFIG_SYSFS) += boardinfo.o
diff --git a/arch/mips/loongson64/boardinfo.c b/arch/mips/loongson64/boardinfo.c
new file mode 100644
index 0000000..280989c
--- /dev/null
+++ b/arch/mips/loongson64/boardinfo.c
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/kobject.h>
+#include <boot_param.h>
+
+static ssize_t boardinfo_show(struct kobject *kobj,
+			      struct kobj_attribute *attr, char *buf)
+{
+	char board_manufacturer[64] = {0};
+	char *tmp_board_manufacturer = board_manufacturer;
+	char bios_vendor[64] = {0};
+	char *tmp_bios_vendor = bios_vendor;
+
+	strcpy(board_manufacturer, eboard->name);
+	strcpy(bios_vendor, einter->description);
+
+	return sprintf(buf,
+		       "Board Info\n"
+		       "Manufacturer\t\t: %s\n"
+		       "Board Name\t\t: %s\n"
+		       "Family\t\t\t: LOONGSON3\n\n"
+		       "BIOS Info\n"
+		       "Vendor\t\t\t: %s\n"
+		       "Version\t\t\t: %s\n"
+		       "ROM Size\t\t: %d KB\n"
+		       "Release Date\t\t: %s\n",
+		       strsep(&tmp_board_manufacturer, "-"),
+		       eboard->name,
+		       strsep(&tmp_bios_vendor, "-"),
+		       einter->description,
+		       einter->size,
+		       especial->special_name);
+}
+static struct kobj_attribute boardinfo_attr = __ATTR(boardinfo, 0444,
+						     boardinfo_show, NULL);
+
+static int __init boardinfo_init(void)
+{
+	struct kobject *lefi_kobj;
+
+	lefi_kobj = kobject_create_and_add("lefi", firmware_kobj);
+	if (!lefi_kobj) {
+		pr_err("lefi: Firmware registration failed.\n");
+		return -ENOMEM;
+	}
+
+	return sysfs_create_file(lefi_kobj, &boardinfo_attr.attr);
+}
+late_initcall(boardinfo_init);
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

