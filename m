Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1AB932D179
	for <lists+linux-mips@lfdr.de>; Thu,  4 Mar 2021 12:03:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239323AbhCDLCZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 4 Mar 2021 06:02:25 -0500
Received: from mail.loongson.cn ([114.242.206.163]:59822 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239167AbhCDLBv (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 4 Mar 2021 06:01:51 -0500
Received: from localhost.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn_DpvUBgUFAUAA--.3851S3;
        Thu, 04 Mar 2021 19:01:00 +0800 (CST)
From:   Qing Zhang <zhangqing@loongson.cn>
To:     Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] MIPS: Loongson64: Remove unused sysconf members
Date:   Thu,  4 Mar 2021 19:00:56 +0800
Message-Id: <20210304110057.22144-2-zhangqing@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210304110057.22144-1-zhangqing@loongson.cn>
References: <20210304110057.22144-1-zhangqing@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxn_DpvUBgUFAUAA--.3851S3
X-Coremail-Antispam: 1UD129KBjvJXoW3WFWrGr45tFy5tFWktFy7Wrg_yoW7uFWfp3
        y3Aw1xWrs5Wr1xZr95JrWjkr15Ca9xtFs7tF42qw4j93srXryjqFZ5GF18JF47Ar1DG3W8
        ZrySgrs3GF4rGwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBYb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
        8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK0II2c7xJM28CjxkF
        64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcV
        CY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIE
        c7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I
        8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCF
        s4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE14v_Gw4l42xK82IYc2Ij64
        vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
        jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2I
        x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK
        8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x
        0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8E38UUUUUU==
X-CM-SenderInfo: x2kd0wptlqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

We don't need them anymore, They are uniform on all Loongson64 systems
and have been fixed in DeviceTree.loongson3_platform_init is replaced
with DTS + driver.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
---
 .../include/asm/mach-loongson64/boot_param.h  |  9 ----
 arch/mips/loongson64/Makefile                 |  2 +-
 arch/mips/loongson64/env.c                    | 20 ---------
 arch/mips/loongson64/platform.c               | 42 -------------------
 4 files changed, 1 insertion(+), 72 deletions(-)
 delete mode 100644 arch/mips/loongson64/platform.c

diff --git a/arch/mips/include/asm/mach-loongson64/boot_param.h b/arch/mips/include/asm/mach-loongson64/boot_param.h
index 4592841b6b0c..1c1cdf57137e 100644
--- a/arch/mips/include/asm/mach-loongson64/boot_param.h
+++ b/arch/mips/include/asm/mach-loongson64/boot_param.h
@@ -207,20 +207,11 @@ struct loongson_system_configuration {
 	u16 reserved_cpus_mask;
 	enum loongson_cpu_type cputype;
 	enum loongson_bridge_type bridgetype;
-	u64 ht_control_base;
-	u64 pci_mem_start_addr;
-	u64 pci_mem_end_addr;
-	u64 pci_io_base;
 	u64 restart_addr;
 	u64 poweroff_addr;
 	u64 suspend_addr;
 	u64 vgabios_addr;
 	u32 dma_mask_bits;
-	char ecname[32];
-	u32 nr_uarts;
-	struct uart_device uarts[MAX_UARTS];
-	u32 nr_sensors;
-	struct sensor_device sensors[MAX_SENSORS];
 	u64 workarounds;
 	void (*early_config)(void);
 };
diff --git a/arch/mips/loongson64/Makefile b/arch/mips/loongson64/Makefile
index cc76944b1a9d..e806280bbb85 100644
--- a/arch/mips/loongson64/Makefile
+++ b/arch/mips/loongson64/Makefile
@@ -2,7 +2,7 @@
 #
 # Makefile for Loongson-3 family machines
 #
-obj-$(CONFIG_MACH_LOONGSON64) += cop2-ex.o platform.o dma.o \
+obj-$(CONFIG_MACH_LOONGSON64) += cop2-ex.o dma.o \
 				setup.o init.o env.o time.o reset.o \
 
 obj-$(CONFIG_SMP)	+= smp.o
diff --git a/arch/mips/loongson64/env.c b/arch/mips/loongson64/env.c
index 51a5d050a94c..1821d461b606 100644
--- a/arch/mips/loongson64/env.c
+++ b/arch/mips/loongson64/env.c
@@ -95,7 +95,6 @@ void __init prom_init_env(void)
 		loongson_freqctrl[1] = 0x900010001fe001d0;
 		loongson_freqctrl[2] = 0x900020001fe001d0;
 		loongson_freqctrl[3] = 0x900030001fe001d0;
-		loongson_sysconf.ht_control_base = 0x90000EFDFB000000;
 		loongson_sysconf.workarounds = WORKAROUND_CPUFREQ;
 		break;
 	case Legacy_3B:
@@ -118,7 +117,6 @@ void __init prom_init_env(void)
 		loongson_freqctrl[1] = 0x900020001fe001d0;
 		loongson_freqctrl[2] = 0x900040001fe001d0;
 		loongson_freqctrl[3] = 0x900060001fe001d0;
-		loongson_sysconf.ht_control_base = 0x90001EFDFB000000;
 		loongson_sysconf.workarounds = WORKAROUND_CPUHOTPLUG;
 		break;
 	default:
@@ -136,9 +134,6 @@ void __init prom_init_env(void)
 		loongson_sysconf.cores_per_node - 1) /
 		loongson_sysconf.cores_per_node;
 
-	loongson_sysconf.pci_mem_start_addr = eirq_source->pci_mem_start_addr;
-	loongson_sysconf.pci_mem_end_addr = eirq_source->pci_mem_end_addr;
-	loongson_sysconf.pci_io_base = eirq_source->pci_io_start_addr;
 	loongson_sysconf.dma_mask_bits = eirq_source->dma_mask_bits;
 	if (loongson_sysconf.dma_mask_bits < 32 ||
 		loongson_sysconf.dma_mask_bits > 64)
@@ -153,23 +148,8 @@ void __init prom_init_env(void)
 		loongson_sysconf.poweroff_addr, loongson_sysconf.restart_addr,
 		loongson_sysconf.vgabios_addr);
 
-	memset(loongson_sysconf.ecname, 0, 32);
-	if (esys->has_ec)
-		memcpy(loongson_sysconf.ecname, esys->ec_name, 32);
 	loongson_sysconf.workarounds |= esys->workarounds;
 
-	loongson_sysconf.nr_uarts = esys->nr_uarts;
-	if (esys->nr_uarts < 1 || esys->nr_uarts > MAX_UARTS)
-		loongson_sysconf.nr_uarts = 1;
-	memcpy(loongson_sysconf.uarts, esys->uarts,
-		sizeof(struct uart_device) * loongson_sysconf.nr_uarts);
-
-	loongson_sysconf.nr_sensors = esys->nr_sensors;
-	if (loongson_sysconf.nr_sensors > MAX_SENSORS)
-		loongson_sysconf.nr_sensors = 0;
-	if (loongson_sysconf.nr_sensors)
-		memcpy(loongson_sysconf.sensors, esys->sensors,
-			sizeof(struct sensor_device) * loongson_sysconf.nr_sensors);
 	pr_info("CpuClock = %u\n", cpu_clock_freq);
 
 	/* Read the ID of PCI host bridge to detect bridge type */
diff --git a/arch/mips/loongson64/platform.c b/arch/mips/loongson64/platform.c
deleted file mode 100644
index 9674ae1361a8..000000000000
--- a/arch/mips/loongson64/platform.c
+++ /dev/null
@@ -1,42 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Copyright (C) 2009 Lemote Inc.
- * Author: Wu Zhangjin, wuzhangjin@gmail.com
- *         Xiang Yu, xiangy@lemote.com
- *         Chen Huacai, chenhc@lemote.com
- */
-
-#include <linux/err.h>
-#include <linux/slab.h>
-#include <linux/platform_device.h>
-#include <asm/bootinfo.h>
-#include <boot_param.h>
-#include <loongson_hwmon.h>
-#include <workarounds.h>
-
-static int __init loongson3_platform_init(void)
-{
-	int i;
-	struct platform_device *pdev;
-
-	if (loongson_sysconf.ecname[0] != '\0')
-		platform_device_register_simple(loongson_sysconf.ecname, -1, NULL, 0);
-
-	for (i = 0; i < loongson_sysconf.nr_sensors; i++) {
-		if (loongson_sysconf.sensors[i].type > SENSOR_FAN)
-			continue;
-
-		pdev = kzalloc(sizeof(struct platform_device), GFP_KERNEL);
-		if (!pdev)
-			return -ENOMEM;
-
-		pdev->name = loongson_sysconf.sensors[i].name;
-		pdev->id = loongson_sysconf.sensors[i].id;
-		pdev->dev.platform_data = &loongson_sysconf.sensors[i];
-		platform_device_register(pdev);
-	}
-
-	return 0;
-}
-
-arch_initcall(loongson3_platform_init);
-- 
2.20.1

