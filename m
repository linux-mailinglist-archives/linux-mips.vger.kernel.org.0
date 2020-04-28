Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 963BA1BB3CD
	for <lists+linux-mips@lfdr.de>; Tue, 28 Apr 2020 04:16:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbgD1CQf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Apr 2020 22:16:35 -0400
Received: from vultr.net.flygoat.com ([149.28.68.211]:60470 "EHLO
        vultr.net.flygoat.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726251AbgD1CQf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 Apr 2020 22:16:35 -0400
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id B0B1A2049D;
        Tue, 28 Apr 2020 02:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1588040194; bh=tnGkIkCkT5Idq2mxbFt5cJNzJ2uwq6HAa+YVdrqU6Y0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=C5yQWd2BtRrSwv7dRJAOGHLoaoXueKZCgvkVk7qRKw2octN4jyBCk/FrUutHIICyF
         vx5h6b6pyzA8y/insy6Evq6Sn2ldnvOJAc9S8+5p8UVH+sz7QJeCmShMyzX4ZnCgvJ
         /dmO+EmYyXoCJjlBmAngnFsu9hCk/oLp0wdNJEvT9iPB3RyUndMIBduzZJ76fjrxfy
         j0DWL7C7PAghDwRzE5nLS+/9yw6/1gxE1lZWqlfaaIbulcRwP9AQPttGWkCUERmLHj
         89IgtqiySm1mZ0h5y1TuMGzyZM5E+PPpWIByNuqatvJITxTTEn25qZivMyhVM7br43
         0o9iPFAwly7MA==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     john.garry@huawei.com, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Paul Burton <paulburton@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Stephen Kitt <steve@sk2.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Daniel Silsby <dansilsby@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
        Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] MIPS: Loongson64: Enable PCI_IO_VMMAP
Date:   Tue, 28 Apr 2020 10:14:14 +0800
Message-Id: <20200428021437.2000066-4-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200428021437.2000066-1-jiaxun.yang@flygoat.com>
References: <20200428021437.2000066-1-jiaxun.yang@flygoat.com>
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
 .../include/asm/mach-loongson64/loongson.h    |  2 ++
 arch/mips/loongson64/init.c                   | 34 ++++++++++++++++---
 arch/mips/loongson64/pci.c                    |  2 +-
 4 files changed, 34 insertions(+), 5 deletions(-)

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
index da38944471f4..4592eb2f78dd 100644
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
@@ -46,7 +43,36 @@ void __init prom_free_prom_memory(void)
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
+		kfree(range);
+		return;
+	}
+
+	/*
+	 * i8259 would access I/O space, so mapping must be done here.
+	 * Please remove it when all drivers can be managed by logic_pio.
+	 */
+	ioremap_page_range(PCI_IO_START, PCI_IO_START + MMIO_LOWER_RESERVED,
+				  LOONGSON_PCIIO_BASE,
+				  pgprot_device(PAGE_KERNEL));
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

