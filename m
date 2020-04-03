Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6ABCA19D3B3
	for <lists+linux-mips@lfdr.de>; Fri,  3 Apr 2020 11:30:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390554AbgDCJaH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 3 Apr 2020 05:30:07 -0400
Received: from mail.loongson.cn ([114.242.206.163]:42932 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727774AbgDCJaG (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 3 Apr 2020 05:30:06 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxX2gQAodeHGAjAA--.150S4;
        Fri, 03 Apr 2020 17:30:00 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v4 2/3] MIPS: Loongson: Add DMA support for LS7A
Date:   Fri,  3 Apr 2020 17:29:50 +0800
Message-Id: <1585906191-26037-3-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1585906191-26037-1-git-send-email-yangtiezhu@loongson.cn>
References: <1585906191-26037-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9DxX2gQAodeHGAjAA--.150S4
X-Coremail-Antispam: 1UD129KBjvJXoW3Gw1xZF4rCFW3ZrWrGw1UGFg_yoW7ZrWUpa
        y7A3Z5Gr45WF1xurZ3Ary8uryrAFsxKFs7JF42gr4Y9as8X34FvFs7CFn5Xr17Ar4kX3Wx
        ZFyFgrWxWF1xCrJanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9m14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
        8EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
        0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
        IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
        Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxGrwCFx2
        IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v2
        6r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
        AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IY
        s7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr
        0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU0Lv_UUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In the current market, the most used bridge chip on the Loongson platform
are RS780E and LS7A, the RS780E bridge chip is already supported by the
mainline kernel.

If use the default implementation of __phys_to_dma() and __dma_to_phys()
in dma-direct.h when CONFIG_ARCH_HAS_PHYS_TO_DMA is not set, it works
well used with LS7A on the Loongson single-way and multi-way platform,
and also works well used with RS780E on the Loongson single-way platform,
but the DMA address will be wrong on the non-node0 used with RS780E on
the Loongson multi-way platform.

Just as the description in the code comment, the devices get node id from
40 bit of HyperTransport bus, so we extract 2 bit node id (bit 44~45) from
48 bit address space of Loongson CPU and embed it into HyperTransport bus
(bit 37-38), this operation can be done only at the software level used
with RS780E on the Loongson multi-way platform, because it has no hardware
function to translate address of node id, this is a hardware compatibility
problem.

Device
    |
    | DMA address
    |
Host Bridge
    |
    | HT bus address (40 bit)
    |
   CPU
    |
    | physical address (48 bit)
    |
   RAM

The LS7A has dma_node_id_offset field in the DMA route config register,
the hardware can use the dma_node_id_offset to translate address of
node id automatically, so we can get correct address when just use the
dma_pfn_offset field in struct device.

For the above reasons, in order to maintain downward compatibility
to support the RS780E bridge chip, it is better to use the platform
dependent implementation of __phys_to_dma() and __dma_to_phys().

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---

v3:
  - Modify the macro definition NODE_ID_OFFSET_ADDR to
    make it easy to read
  - update the commit message

v4:
  - Use LS7A instead of Loongson 7A1000 in the description
  - Use LS7A or ls7a instead of LS7A1000 or ls7a1000 in the code

 arch/mips/include/asm/mach-loongson64/boot_param.h |  5 +++++
 arch/mips/loongson64/dma.c                         |  9 ++++++---
 arch/mips/loongson64/env.c                         |  2 ++
 arch/mips/loongson64/init.c                        | 17 +++++++++++++++++
 4 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/arch/mips/include/asm/mach-loongson64/boot_param.h b/arch/mips/include/asm/mach-loongson64/boot_param.h
index fc9f14b..4ac7034 100644
--- a/arch/mips/include/asm/mach-loongson64/boot_param.h
+++ b/arch/mips/include/asm/mach-loongson64/boot_param.h
@@ -221,9 +221,14 @@ struct loongson_system_configuration {
 	u32 nr_sensors;
 	struct sensor_device sensors[MAX_SENSORS];
 	u64 workarounds;
+	void (*early_config)(void);
 };
 
 extern struct efi_memory_map_loongson *loongson_memmap;
 extern struct loongson_system_configuration loongson_sysconf;
 
+extern u32 node_id_offset;
+extern void rs780e_early_config(void);
+extern void ls7a_early_config(void);
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
index 71f4aaf..d11bc34 100644
--- a/arch/mips/loongson64/env.c
+++ b/arch/mips/loongson64/env.c
@@ -192,8 +192,10 @@ void __init prom_init_env(void)
 	if (vendor == PCI_VENDOR_ID_LOONGSON && device == 0x7a00) {
 		pr_info("The bridge chip is LS7A\n");
 		loongson_sysconf.bridgetype = LS7A;
+		loongson_sysconf.early_config = ls7a_early_config;
 	} else {
 		pr_info("The bridge chip is RS780E or SR5690\n");
 		loongson_sysconf.bridgetype = RS780E;
+		loongson_sysconf.early_config = rs780e_early_config;
 	}
 }
diff --git a/arch/mips/loongson64/init.c b/arch/mips/loongson64/init.c
index da38944..06625d6 100644
--- a/arch/mips/loongson64/init.c
+++ b/arch/mips/loongson64/init.c
@@ -13,6 +13,11 @@
 #include <asm/fw/fw.h>
 
 #include <loongson.h>
+#include <boot_param.h>
+
+#define NODE_ID_OFFSET_ADDR	((void __iomem *)TO_UNCAC(0x1001041c))
+
+u32 node_id_offset;
 
 static void __init mips_nmi_setup(void)
 {
@@ -24,6 +29,16 @@ static void __init mips_nmi_setup(void)
 	flush_icache_range((unsigned long)base, (unsigned long)base + 0x80);
 }
 
+void rs780e_early_config(void)
+{
+	node_id_offset = 37;
+}
+
+void ls7a_early_config(void)
+{
+	node_id_offset = ((readl(NODE_ID_OFFSET_ADDR) >> 8) & 0x1f) + 36;
+}
+
 void __init prom_init(void)
 {
 	fw_init_cmdline();
@@ -33,6 +48,8 @@ void __init prom_init(void)
 	set_io_port_base((unsigned long)
 		ioremap(LOONGSON_PCIIO_BASE, LOONGSON_PCIIO_SIZE));
 
+	loongson_sysconf.early_config();
+
 	prom_init_numa_memory();
 
 	/* Hardcode to CPU UART 0 */
-- 
2.1.0

