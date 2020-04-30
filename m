Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A966B1BEE4E
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2020 04:31:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726291AbgD3CbV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Apr 2020 22:31:21 -0400
Received: from mail.loongson.cn ([114.242.206.163]:43948 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726180AbgD3CbV (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 29 Apr 2020 22:31:21 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr9psOKpeog0uAA--.11S2;
        Thu, 30 Apr 2020 10:31:08 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Christoph Hellwig <hch@infradead.org>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v6] MIPS: Loongson: Add DMA support for LS7A
Date:   Thu, 30 Apr 2020 10:31:07 +0800
Message-Id: <1588213867-32274-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dxr9psOKpeog0uAA--.11S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCr4xtry7XFykWw4UAFy7Jrb_yoWrArWkpa
        9xA3WkGr4YgF15CrZ5AFW8uryrAFZ5KrW3GF42vw15KasxZ34FqFs3GF18Xr1UAF1DG3Wx
        XFWrKw48GF1xCrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
        1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8
        JwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r
        1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij
        64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr
        0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6Fyj6rWUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
        42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUCg4hUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In the current market, the most used bridge chip on the Loongson
platform are RS780E and LS7A, the RS780E bridge chip is already
supported by the mainline kernel.

In order to use the default implementation of __phys_to_dma() and
__dma_to_phys() in dma-direct.h, remove CONFIG_ARCH_HAS_PHYS_TO_DMA
and then set the bus's DMA limit to 36 bit for RS780E to maintain
downward compatibility.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---

Hi Christoph and Jiaxun,

Thank you very much for your suggestions.

v5:
  - use the default implementation of __phys_to_dma()
    and __dma_to_phys() in dma-direct.h

v6:
  - make loongson_dma_config() static
  - put ls7a things before rs780 things

 arch/mips/Kconfig                                  |  1 -
 arch/mips/include/asm/mach-loongson64/boot_param.h |  5 +++++
 arch/mips/loongson64/dma.c                         | 22 +++++++++++-----------
 arch/mips/loongson64/env.c                         |  2 ++
 4 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 9f15539..12b6bdb 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1454,7 +1454,6 @@ choice
 config CPU_LOONGSON64
 	bool "Loongson 64-bit CPU"
 	depends on SYS_HAS_CPU_LOONGSON64
-	select ARCH_HAS_PHYS_TO_DMA
 	select CPU_MIPSR2
 	select CPU_HAS_PREFETCH
 	select CPU_SUPPORTS_64BIT_KERNEL
diff --git a/arch/mips/include/asm/mach-loongson64/boot_param.h b/arch/mips/include/asm/mach-loongson64/boot_param.h
index f082d87..0c07a96 100644
--- a/arch/mips/include/asm/mach-loongson64/boot_param.h
+++ b/arch/mips/include/asm/mach-loongson64/boot_param.h
@@ -197,6 +197,7 @@ enum loongson_bridge_type {
 	RS780E = 2
 };
 
+struct pci_dev;
 struct loongson_system_configuration {
 	u32 nr_cpus;
 	u32 nr_nodes;
@@ -221,9 +222,13 @@ struct loongson_system_configuration {
 	u32 nr_sensors;
 	struct sensor_device sensors[MAX_SENSORS];
 	u64 workarounds;
+	void (*dma_config)(struct pci_dev *pdev);
 };
 
 extern struct efi_memory_map_loongson *loongson_memmap;
 extern struct loongson_system_configuration loongson_sysconf;
 
+extern void ls7a_dma_config(struct pci_dev *pdev);
+extern void rs780e_dma_config(struct pci_dev *pdev);
+
 #endif
diff --git a/arch/mips/loongson64/dma.c b/arch/mips/loongson64/dma.c
index 5e86635..ef40b0d 100644
--- a/arch/mips/loongson64/dma.c
+++ b/arch/mips/loongson64/dma.c
@@ -1,24 +1,24 @@
 // SPDX-License-Identifier: GPL-2.0
-#include <linux/dma-direct.h>
+#include <linux/pci.h>
 #include <linux/init.h>
 #include <linux/swiotlb.h>
 
-dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
+void ls7a_dma_config(struct pci_dev *pdev)
 {
-	/* We extract 2bit node id (bit 44~47, only bit 44~45 used now) from
-	 * Loongson-3's 48bit address space and embed it into 40bit */
-	long nid = (paddr >> 44) & 0x3;
-	return ((nid << 44) ^ paddr) | (nid << 37);
 }
 
-phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t daddr)
+void rs780e_dma_config(struct pci_dev *pdev)
 {
-	/* We extract 2bit node id (bit 44~47, only bit 44~45 used now) from
-	 * Loongson-3's 48bit address space and embed it into 40bit */
-	long nid = (daddr >> 37) & 0x3;
-	return ((nid << 37) ^ daddr) | (nid << 44);
+	pdev->dev.bus_dma_limit = DMA_BIT_MASK(36);
 }
 
+static void loongson_dma_config(struct pci_dev *pdev)
+{
+	loongson_sysconf.dma_config(pdev);
+}
+
+DECLARE_PCI_FIXUP_EARLY(PCI_ANY_ID, PCI_ANY_ID, loongson_dma_config);
+
 void __init plat_swiotlb_setup(void)
 {
 	swiotlb_init(1);
diff --git a/arch/mips/loongson64/env.c b/arch/mips/loongson64/env.c
index 71f4aaf..496f401 100644
--- a/arch/mips/loongson64/env.c
+++ b/arch/mips/loongson64/env.c
@@ -192,8 +192,10 @@ void __init prom_init_env(void)
 	if (vendor == PCI_VENDOR_ID_LOONGSON && device == 0x7a00) {
 		pr_info("The bridge chip is LS7A\n");
 		loongson_sysconf.bridgetype = LS7A;
+		loongson_sysconf.dma_config = ls7a_dma_config;
 	} else {
 		pr_info("The bridge chip is RS780E or SR5690\n");
 		loongson_sysconf.bridgetype = RS780E;
+		loongson_sysconf.dma_config = rs780e_dma_config;
 	}
 }
-- 
2.1.0

