Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27B4419977E
	for <lists+linux-mips@lfdr.de>; Tue, 31 Mar 2020 15:33:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730848AbgCaNdl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 31 Mar 2020 09:33:41 -0400
Received: from mail.loongson.cn ([114.242.206.163]:37366 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730464AbgCaNdk (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 31 Mar 2020 09:33:40 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxf9+pRoNeSSIiAA--.19S3;
        Tue, 31 Mar 2020 21:33:31 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v3 1/3] MIPS: Loongson: Get host bridge information
Date:   Tue, 31 Mar 2020 21:33:26 +0800
Message-Id: <1585661608-3356-2-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1585661608-3356-1-git-send-email-yangtiezhu@loongson.cn>
References: <1585661608-3356-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9Dxf9+pRoNeSSIiAA--.19S3
X-Coremail-Antispam: 1UD129KBjvJXoWxCryDAr1Uuw4kCrWDJw48Crg_yoW5Zr4Upa
        9ay3WrGrs5Wr13urs5ArWj9r1fAan5tFsxWFW2gw1Y9F97Xw1YqFsYkF18Zr47AFs8Ga48
        X3sagr48GF43Cw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9v14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
        x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
        ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
        xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
        vE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
        r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI48JMxC20s
        026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_
        JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14
        v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xva
        j40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JV
        W8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjgTmJUUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Read the address of host bridge configuration space to get the vendor ID
and device ID of host bridge, and then we can distinguish various types
of host bridge such as Loongson 7A1000 or AMD RS780E.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---

v3:
  - Modify the macro definition HOST_BRIDGE_CONFIG_ADDR and
    add comment to make it easy to read.
  - Use PCI_VENDOR_ID_LOONGSON in pci_ids.h instead of 0x0014

  PCI_VENDOR_ID_LOONGSON depends on the mainline tree's commit:
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9acb9fe18d86

 arch/mips/include/asm/mach-loongson64/boot_param.h |  6 ++++++
 arch/mips/loongson64/env.c                         | 18 ++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/arch/mips/include/asm/mach-loongson64/boot_param.h b/arch/mips/include/asm/mach-loongson64/boot_param.h
index 2ed483e..a272427 100644
--- a/arch/mips/include/asm/mach-loongson64/boot_param.h
+++ b/arch/mips/include/asm/mach-loongson64/boot_param.h
@@ -192,6 +192,11 @@ struct boot_params {
 	struct efi_reset_system_t reset_system;
 };
 
+enum loongson_bridge_type {
+	RS780E = 1,
+	LS7A1000 = 2
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
index 2554ef1..257a9b6 100644
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
+		pr_info("The bridge chip is Loongson 7A1000\n");
+		loongson_sysconf.bridgetype = LS7A1000;
+	} else {
+		pr_info("The bridge chip is AMD RS780E or SR5690\n");
+		loongson_sysconf.bridgetype = RS780E;
+	}
 }
-- 
2.1.0

