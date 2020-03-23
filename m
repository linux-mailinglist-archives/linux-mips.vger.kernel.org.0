Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A17118EE4E
	for <lists+linux-mips@lfdr.de>; Mon, 23 Mar 2020 04:00:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727151AbgCWC7Y (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 22 Mar 2020 22:59:24 -0400
Received: from mail.loongson.cn ([114.242.206.163]:56014 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727112AbgCWC7Y (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 22 Mar 2020 22:59:24 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxP+gDJnhedaseAA--.407S3;
        Mon, 23 Mar 2020 10:59:17 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v2 1/3] MIPS: Loongson: Get host bridge information
Date:   Mon, 23 Mar 2020 10:59:13 +0800
Message-Id: <1584932355-3642-2-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1584932355-3642-1-git-send-email-yangtiezhu@loongson.cn>
References: <1584932355-3642-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9AxP+gDJnhedaseAA--.407S3
X-Coremail-Antispam: 1UD129KBjvJXoWxAw4UJF4kZF13Zr4kGF18Grg_yoW5Jw47pa
        1Sy3W8Gr45Wr43Zrs3ArWUur1Syan8KFZrGFW2qw1FkFyDXw1FqF4kKF1UAw47CF45Ja4k
        X3sYgr48G3ZxC3DanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
        x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
        8EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxd
        M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
        v20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
        F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8JwCF04
        k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
        MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr4
        1lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l
        IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4
        A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUa-erUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Read the address of HyperTransport Configuration Space to get the vendor ID
and device ID of bridge chip, and then we can distinguish various types of
bridge chip such as Loongson 7A1000 or AMD RS780E.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/mips/include/asm/mach-loongson64/boot_param.h |  6 ++++++
 arch/mips/loongson64/env.c                         | 16 ++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/mips/include/asm/mach-loongson64/boot_param.h b/arch/mips/include/asm/mach-loongson64/boot_param.h
index 8c286be..5e8c70d 100644
--- a/arch/mips/include/asm/mach-loongson64/boot_param.h
+++ b/arch/mips/include/asm/mach-loongson64/boot_param.h
@@ -190,6 +190,11 @@ struct boot_params {
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
@@ -198,6 +203,7 @@ struct loongson_system_configuration {
 	u16 boot_cpu_id;
 	u16 reserved_cpus_mask;
 	enum loongson_cpu_type cputype;
+	enum loongson_bridge_type bridgetype;
 	u64 ht_control_base;
 	u64 pci_mem_start_addr;
 	u64 pci_mem_end_addr;
diff --git a/arch/mips/loongson64/env.c b/arch/mips/loongson64/env.c
index 0daeb7b..42542c7 100644
--- a/arch/mips/loongson64/env.c
+++ b/arch/mips/loongson64/env.c
@@ -19,6 +19,8 @@
 #include <boot_param.h>
 #include <workarounds.h>
 
+#define HT1_LO_BUS_CONFIG_BASE	0x90000efdfe000000
+
 u32 cpu_clock_freq;
 EXPORT_SYMBOL(cpu_clock_freq);
 struct efi_memory_map_loongson *loongson_memmap;
@@ -42,6 +44,8 @@ void __init prom_init_env(void)
 	struct system_loongson *esys;
 	struct efi_cpuinfo_loongson *ecpu;
 	struct irq_source_routing_table *eirq_source;
+	u32 id;
+	u16 vendor, device;
 
 	/* firmware arguments are initialized in head.S */
 	boot_p = (struct boot_params *)fw_arg2;
@@ -155,4 +159,16 @@ void __init prom_init_env(void)
 		memcpy(loongson_sysconf.sensors, esys->sensors,
 			sizeof(struct sensor_device) * loongson_sysconf.nr_sensors);
 	pr_info("CpuClock = %u\n", cpu_clock_freq);
+
+	id = readl((u32 *)HT1_LO_BUS_CONFIG_BASE);
+	vendor = id & 0xffff;
+	device = (id >> 16) & 0xffff;
+
+	if (vendor == 0x0014 && device == 0x7a00) {
+		pr_info("The bridge chip is Loongson 7A1000\n");
+		loongson_sysconf.bridgetype = LS7A1000;
+	} else {
+		pr_info("The bridge chip is AMD RS780E or SR5690\n");
+		loongson_sysconf.bridgetype = RS780E;
+	}
 }
-- 
2.1.0

