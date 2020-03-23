Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3260C18EE4B
	for <lists+linux-mips@lfdr.de>; Mon, 23 Mar 2020 03:59:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727122AbgCWC7Y (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 22 Mar 2020 22:59:24 -0400
Received: from mail.loongson.cn ([114.242.206.163]:56012 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726983AbgCWC7Y (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 22 Mar 2020 22:59:24 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxP+gDJnhedaseAA--.407S4;
        Mon, 23 Mar 2020 10:59:18 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v2 2/3] MIPS: Loongson: Add DMA support for 7A1000
Date:   Mon, 23 Mar 2020 10:59:14 +0800
Message-Id: <1584932355-3642-3-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1584932355-3642-1-git-send-email-yangtiezhu@loongson.cn>
References: <1584932355-3642-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9AxP+gDJnhedaseAA--.407S4
X-Coremail-Antispam: 1UD129KBjvJXoWxGr4kXFykCry8XrW7KrWruFg_yoWrXrWkpa
        9xA3WkGr45WF13Cr93Ary8uryrAa9xKFs2qF429r1j9asFv34FvFs7GFn5Jr12yr4DGa48
        ZFWFgr1xGF1xCaDanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBv14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
        8EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxd
        M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
        v20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
        F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8JwCF04
        k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
        MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr4
        1lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l
        IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4
        A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUnqXdUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Implement __phys_to_dma() and __dma_to_phys() according to the
node id offset in the 7A1000 DMA route config register.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/mips/include/asm/mach-loongson64/boot_param.h |  5 +++++
 arch/mips/loongson64/dma.c                         |  9 ++++++---
 arch/mips/loongson64/env.c                         |  2 ++
 arch/mips/loongson64/init.c                        | 17 +++++++++++++++++
 4 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/arch/mips/include/asm/mach-loongson64/boot_param.h b/arch/mips/include/asm/mach-loongson64/boot_param.h
index 5e8c70d..c759b7c 100644
--- a/arch/mips/include/asm/mach-loongson64/boot_param.h
+++ b/arch/mips/include/asm/mach-loongson64/boot_param.h
@@ -219,9 +219,14 @@ struct loongson_system_configuration {
 	u32 nr_sensors;
 	struct sensor_device sensors[MAX_SENSORS];
 	u64 workarounds;
+	void (*early_config)(void);
 };
 
 extern struct efi_memory_map_loongson *loongson_memmap;
 extern struct loongson_system_configuration loongson_sysconf;
 
+extern u32 node_id_offset;
+extern void rs780e_early_config(void);
+extern void ls7a1000_early_config(void);
+
 #endif
diff --git a/arch/mips/loongson64/dma.c b/arch/mips/loongson64/dma.c
index 5e86635..dbfe6e8 100644
--- a/arch/mips/loongson64/dma.c
+++ b/arch/mips/loongson64/dma.c
@@ -2,21 +2,24 @@
 #include <linux/dma-direct.h>
 #include <linux/init.h>
 #include <linux/swiotlb.h>
+#include <boot_param.h>
 
 dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
 {
 	/* We extract 2bit node id (bit 44~47, only bit 44~45 used now) from
 	 * Loongson-3's 48bit address space and embed it into 40bit */
 	long nid = (paddr >> 44) & 0x3;
-	return ((nid << 44) ^ paddr) | (nid << 37);
+
+	return ((nid << 44) ^ paddr) | (nid << node_id_offset);
 }
 
 phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t daddr)
 {
 	/* We extract 2bit node id (bit 44~47, only bit 44~45 used now) from
 	 * Loongson-3's 48bit address space and embed it into 40bit */
-	long nid = (daddr >> 37) & 0x3;
-	return ((nid << 37) ^ daddr) | (nid << 44);
+	long nid = (daddr >> node_id_offset) & 0x3;
+
+	return ((nid << node_id_offset) ^ daddr) | (nid << 44);
 }
 
 void __init plat_swiotlb_setup(void)
diff --git a/arch/mips/loongson64/env.c b/arch/mips/loongson64/env.c
index 42542c7..32a3822 100644
--- a/arch/mips/loongson64/env.c
+++ b/arch/mips/loongson64/env.c
@@ -167,8 +167,10 @@ void __init prom_init_env(void)
 	if (vendor == 0x0014 && device == 0x7a00) {
 		pr_info("The bridge chip is Loongson 7A1000\n");
 		loongson_sysconf.bridgetype = LS7A1000;
+		loongson_sysconf.early_config = ls7a1000_early_config;
 	} else {
 		pr_info("The bridge chip is AMD RS780E or SR5690\n");
 		loongson_sysconf.bridgetype = RS780E;
+		loongson_sysconf.early_config = rs780e_early_config;
 	}
 }
diff --git a/arch/mips/loongson64/init.c b/arch/mips/loongson64/init.c
index 5ac1a0f..0b6493b 100644
--- a/arch/mips/loongson64/init.c
+++ b/arch/mips/loongson64/init.c
@@ -12,6 +12,11 @@
 #include <asm/fw/fw.h>
 
 #include <loongson.h>
+#include <boot_param.h>
+
+#define NODE_ID_OFFSET_ADDR     0x90000e001001041c
+
+u32 node_id_offset;
 
 static void __init mips_nmi_setup(void)
 {
@@ -23,6 +28,16 @@ static void __init mips_nmi_setup(void)
 	flush_icache_range((unsigned long)base, (unsigned long)base + 0x80);
 }
 
+void rs780e_early_config(void)
+{
+	node_id_offset = 37;
+}
+
+void ls7a1000_early_config(void)
+{
+	node_id_offset = ((readl((u32 *)NODE_ID_OFFSET_ADDR) >> 8) & 0x1f) + 36;
+}
+
 void __init prom_init(void)
 {
 	fw_init_cmdline();
@@ -32,6 +47,8 @@ void __init prom_init(void)
 	set_io_port_base((unsigned long)
 		ioremap(LOONGSON_PCIIO_BASE, LOONGSON_PCIIO_SIZE));
 
+	loongson_sysconf.early_config();
+
 	prom_init_numa_memory();
 
 	/* Hardcode to CPU UART 0 */
-- 
2.1.0

