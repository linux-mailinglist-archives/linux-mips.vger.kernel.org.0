Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8F8B1BED40
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2020 02:57:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726419AbgD3A50 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Apr 2020 20:57:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726421AbgD3A50 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 29 Apr 2020 20:57:26 -0400
Received: from vultr.net.flygoat.com (vultr.net.flygoat.com [IPv6:2001:19f0:6001:3633:5400:2ff:fe8c:553])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D59EC08E859
        for <linux-mips@vger.kernel.org>; Wed, 29 Apr 2020 17:57:26 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id DD6FF20CCE;
        Thu, 30 Apr 2020 00:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1588208245; bh=1kQk/WYLAlboRq560nnxROoUXmI7jng34JcfCqZ59Eo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rU8Fjz4K2P5yzoFAPxphxpgQJDljG7tMWfKt16sPNc+aaRPvfcoAngdYgYHceE7gT
         NC2TXhTHgfeZr70Gv4ej0x+5gBkcpuuJxcY/TD95mWZZO1HafYC8AFrUg2a5wpD0oB
         hO+Ytv7DvQMC9xhhVu9j83fq8gL55d7YwaNvfxRd1lZslOJQ0o9JnWbbmJL20gPXgb
         sZEIUyf1BB172q/JDp7y8DsNc/KckF6QWi1n8f/rGbj0IbweskPTshebpLhM2Gbzjd
         P06uG1OEK+j+nIWRpMnddGpt1QiU9CUC0twTpKGJwqRoutTZqvf353tGo8CVmTdb6u
         MOt4ObltqP5jg==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, tsbogend@alpha.franken.de,
        john.garry@huawei.com, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v3 3/3] MIPS: Loongson64: Enable PCI_IO_VMMAP
Date:   Thu, 30 Apr 2020 08:57:06 +0800
Message-Id: <20200430005706.2520124-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200430005706.2520124-1-jiaxun.yang@flygoat.com>
References: <20200426114806.1176629-1-jiaxun.yang@flygoat.com>
 <20200430005706.2520124-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Finally we are able to elegantly add I/O ports for PCI host bridge
via devicetree with logic_pio.

To deal with legacy drivers that have fixed I/O ports range we
reserved 0x10000 in PCI_IOBASE, should be enough for i8259 i8042
stuff.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/Kconfig                             |  1 +
 .../include/asm/mach-loongson64/loongson.h    |  2 +
 arch/mips/loongson64/init.c                   | 43 +++++++++++++++++--
 arch/mips/loongson64/pci.c                    |  2 +-
 4 files changed, 43 insertions(+), 5 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 4e5308178649..1669735dacd8 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -479,6 +479,7 @@ config MACH_LOONGSON64
 	select I8259
 	select IRQ_MIPS_CPU
 	select NR_CPUS_DEFAULT_64
+	select PCI_IO_VMMAP
 	select USE_GENERIC_EARLY_PRINTK_8250
 	select SYS_HAS_CPU_LOONGSON64
 	select SYS_HAS_EARLY_PRINTK
diff --git a/arch/mips/include/asm/mach-loongson64/loongson.h b/arch/mips/include/asm/mach-loongson64/loongson.h
index fde1b75c45ea..94035a47be5b 100644
--- a/arch/mips/include/asm/mach-loongson64/loongson.h
+++ b/arch/mips/include/asm/mach-loongson64/loongson.h
@@ -86,6 +86,8 @@ extern int mach_i8259_irq(void);
 #define LOONGSON_PCIIO_SIZE	0x00100000	/* 1M */
 #define LOONGSON_PCIIO_TOP	(LOONGSON_PCIIO_BASE+LOONGSON_PCIIO_SIZE-1)
 
+#define MMIO_LOWER_RESERVED	0x10000
+
 /* Loongson Register Bases */
 
 #define LOONGSON_PCICONFIGBASE	0x00
diff --git a/arch/mips/loongson64/init.c b/arch/mips/loongson64/init.c
index da38944471f4..f7c80b9e5243 100644
--- a/arch/mips/loongson64/init.c
+++ b/arch/mips/loongson64/init.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/irqchip.h>
+#include <linux/logic_pio.h>
 #include <linux/memblock.h>
 #include <asm/bootinfo.h>
 #include <asm/traps.h>
@@ -29,10 +30,6 @@ void __init prom_init(void)
 	fw_init_cmdline();
 	prom_init_env();
 
-	/* init base address of io space */
-	set_io_port_base((unsigned long)
-		ioremap(LOONGSON_PCIIO_BASE, LOONGSON_PCIIO_SIZE));
-
 	prom_init_numa_memory();
 
 	/* Hardcode to CPU UART 0 */
@@ -46,7 +43,45 @@ void __init prom_free_prom_memory(void)
 {
 }
 
+static __init void reserve_pio_range(void)
+{
+	struct logic_pio_hwaddr *range;
+
+	range = kzalloc(sizeof(*range), GFP_ATOMIC);
+	if (!range)
+		return;
+
+	range->fwnode = &of_root->fwnode;
+	range->size = MMIO_LOWER_RESERVED;
+	range->hw_start = LOONGSON_PCIIO_BASE;
+	range->flags = LOGIC_PIO_CPU_MMIO;
+
+	if (logic_pio_register_range(range)) {
+		pr_err("Failed to reserve PIO range for legacy ISA\n");
+		goto free_range;
+	}
+
+	if (WARN(range->io_start != 0,
+			"Reserved PIO range does not start from 0\n"))
+		goto unregister;
+
+	/*
+	 * i8259 would access I/O space, so mapping must be done here.
+	 * Please remove it when all drivers can be managed by logic_pio.
+	 */
+	ioremap_page_range(PCI_IO_START, PCI_IO_START + MMIO_LOWER_RESERVED,
+				LOONGSON_PCIIO_BASE,
+				pgprot_device(PAGE_KERNEL));
+
+	return;
+unregister:
+	logic_pio_unregister_range(range);
+free_range:
+	kfree(range);
+}
+
 void __init arch_init_irq(void)
 {
+	reserve_pio_range();
 	irqchip_init();
 }
diff --git a/arch/mips/loongson64/pci.c b/arch/mips/loongson64/pci.c
index a440a2725a20..7aecb88dd377 100644
--- a/arch/mips/loongson64/pci.c
+++ b/arch/mips/loongson64/pci.c
@@ -37,7 +37,7 @@ extern int sbx00_acpi_init(void);
 static int __init pcibios_init(void)
 {
 
-	loongson_pci_controller.io_map_base = mips_io_port_base;
+	loongson_pci_controller.io_map_base = IOPORT_RW_BASE;
 	loongson_pci_mem_resource.start = loongson_sysconf.pci_mem_start_addr;
 	loongson_pci_mem_resource.end = loongson_sysconf.pci_mem_end_addr;
 
-- 
2.26.0.rc2

