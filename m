Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87E4319D3B5
	for <lists+linux-mips@lfdr.de>; Fri,  3 Apr 2020 11:30:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390505AbgDCJaH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 3 Apr 2020 05:30:07 -0400
Received: from mail.loongson.cn ([114.242.206.163]:42908 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727431AbgDCJaG (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 3 Apr 2020 05:30:06 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxX2gQAodeHGAjAA--.150S3;
        Fri, 03 Apr 2020 17:29:58 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v4 1/3] MIPS: Loongson: Get host bridge information
Date:   Fri,  3 Apr 2020 17:29:49 +0800
Message-Id: <1585906191-26037-2-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1585906191-26037-1-git-send-email-yangtiezhu@loongson.cn>
References: <1585906191-26037-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9DxX2gQAodeHGAjAA--.150S3
X-Coremail-Antispam: 1UD129KBjvJXoWxCryDAr1DCF4UZw1UZw43Wrg_yoW5ZFW3pa
        9Fyw15Grs5Wr13ur4fArWj9r13Aan5tFW3WFW2gw1Y9r9xXw1YqFsYkF18Zr17AF45Ga48
        Xasagr48GF17Cw7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9m14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
        x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
        8EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
        0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
        IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
        Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxGrwCFx2
        IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v2
        6r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
        AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IY
        s7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr
        0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU39NfUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Read the address of host bridge configuration space to get the vendor ID
and device ID of host bridge, and then we can distinguish various types
of host bridge such as LS7A or RS780E.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---

v3:
  - Modify the macro definition HOST_BRIDGE_CONFIG_ADDR and
    add comment to make it easy to read.
  - Use PCI_VENDOR_ID_LOONGSON in pci_ids.h instead of 0x0014

  PCI_VENDOR_ID_LOONGSON depends on the mainline tree's commit:
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9acb9fe18d86

v4:
  - Use LS7A instead of Loongson 7A1000 in the description
  - Use LS7A or ls7a instead of LS7A1000 or ls7a1000 in the code

 arch/mips/include/asm/mach-loongson64/boot_param.h |  6 ++++++
 arch/mips/loongson64/env.c                         | 18 ++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/arch/mips/include/asm/mach-loongson64/boot_param.h b/arch/mips/include/asm/mach-loongson64/boot_param.h
index 2ed483e..fc9f14b 100644
--- a/arch/mips/include/asm/mach-loongson64/boot_param.h
+++ b/arch/mips/include/asm/mach-loongson64/boot_param.h
@@ -192,6 +192,11 @@ struct boot_params {
 	struct efi_reset_system_t reset_system;
 };
 
+enum loongson_bridge_type {
+	RS780E = 1,
+	LS7A = 2
+};
+
 struct loongson_system_configuration {
 	u32 nr_cpus;
 	u32 nr_nodes;
@@ -200,6 +205,7 @@ struct loongson_system_configuration {
 	u16 boot_cpu_id;
 	u16 reserved_cpus_mask;
 	enum loongson_cpu_type cputype;
+	enum loongson_bridge_type bridgetype;
 	u64 ht_control_base;
 	u64 pci_mem_start_addr;
 	u64 pci_mem_end_addr;
diff --git a/arch/mips/loongson64/env.c b/arch/mips/loongson64/env.c
index 2554ef1..71f4aaf 100644
--- a/arch/mips/loongson64/env.c
+++ b/arch/mips/loongson64/env.c
@@ -14,12 +14,15 @@
  * Author: Wu Zhangjin, wuzhangjin@gmail.com
  */
 #include <linux/export.h>
+#include <linux/pci_ids.h>
 #include <asm/bootinfo.h>
 #include <loongson.h>
 #include <boot_param.h>
 #include <builtin_dtbs.h>
 #include <workarounds.h>
 
+#define HOST_BRIDGE_CONFIG_ADDR	((void __iomem *)TO_UNCAC(0x1a000000))
+
 u32 cpu_clock_freq;
 EXPORT_SYMBOL(cpu_clock_freq);
 struct efi_memory_map_loongson *loongson_memmap;
@@ -43,6 +46,8 @@ void __init prom_init_env(void)
 	struct system_loongson *esys;
 	struct efi_cpuinfo_loongson *ecpu;
 	struct irq_source_routing_table *eirq_source;
+	u32 id;
+	u16 vendor, device;
 
 	/* firmware arguments are initialized in head.S */
 	boot_p = (struct boot_params *)fw_arg2;
@@ -178,4 +183,17 @@ void __init prom_init_env(void)
 		memcpy(loongson_sysconf.sensors, esys->sensors,
 			sizeof(struct sensor_device) * loongson_sysconf.nr_sensors);
 	pr_info("CpuClock = %u\n", cpu_clock_freq);
+
+	/* Read the ID of PCI host bridge to detect bridge type */
+	id = readl(HOST_BRIDGE_CONFIG_ADDR);
+	vendor = id & 0xffff;
+	device = (id >> 16) & 0xffff;
+
+	if (vendor == PCI_VENDOR_ID_LOONGSON && device == 0x7a00) {
+		pr_info("The bridge chip is LS7A\n");
+		loongson_sysconf.bridgetype = LS7A;
+	} else {
+		pr_info("The bridge chip is RS780E or SR5690\n");
+		loongson_sysconf.bridgetype = RS780E;
+	}
 }
-- 
2.1.0

