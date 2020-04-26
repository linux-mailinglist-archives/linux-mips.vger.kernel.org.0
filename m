Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0BE51B8F8E
	for <lists+linux-mips@lfdr.de>; Sun, 26 Apr 2020 13:51:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726154AbgDZLvQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 26 Apr 2020 07:51:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726135AbgDZLvP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 26 Apr 2020 07:51:15 -0400
Received: from vultr.net.flygoat.com (vultr.net.flygoat.com [IPv6:2001:19f0:6001:3633:5400:2ff:fe8c:553])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C71BC061A0E;
        Sun, 26 Apr 2020 04:51:15 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 18F8420CE7;
        Sun, 26 Apr 2020 11:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1587901875; bh=FIpkVgCcZIOSR5LDhY/QsB4UvPKGRBmMbi5Ln6/hcIA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QpyOxyFtVI9AhdwU/EaFyuJLre0YiMrOJR0N9E5ACBf3t3cAamMrKv1Numq1ZYnSg
         UNd1r3qGxmz1+UjGqIPmYlXNHhxNniEg/7Q1Tngn+hkS9UYJC3JOBdcsi12mBBQZoy
         HYY1RvPxMU9zuPuA3RL1RHBacPUF3aTZQkUxyW6t1g9NnYz/ZySf/oTuflKjsrzVgL
         HYYKp2NFhYIQU1bMCapxhBZKH4eYLvClvEEpMMUPGHrNIhXQBa3U8J8mJISSWsdmhE
         n94sJoMn2WP+OYWD/0pF7C80f0HHwAawkSyuq8GT4doBiZGRd5fLbpAK7k58zmCekV
         cLW7rxDJBp5Ew==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Paul Burton <paulburton@kernel.org>,
        Stephen Kitt <steve@sk2.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Daniel Silsby <dansilsby@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Wei Xu <xuwei5@hisilicon.com>,
        John Garry <john.garry@huawei.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] MIPS: Loongson64: Enable PCI_IO_VMMAP
Date:   Sun, 26 Apr 2020 19:47:37 +0800
Message-Id: <20200426114806.1176629-5-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200426114806.1176629-1-jiaxun.yang@flygoat.com>
References: <20200426114806.1176629-1-jiaxun.yang@flygoat.com>
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
 arch/mips/Kconfig           |  1 +
 arch/mips/include/asm/io.h  |  4 ++++
 arch/mips/loongson64/init.c | 12 ++++++++----
 arch/mips/loongson64/pci.c  |  2 +-
 4 files changed, 14 insertions(+), 5 deletions(-)

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
diff --git a/arch/mips/include/asm/io.h b/arch/mips/include/asm/io.h
index f15ddcd27f35..7f9716c95aa0 100644
--- a/arch/mips/include/asm/io.h
+++ b/arch/mips/include/asm/io.h
@@ -66,6 +66,10 @@
 #define PCI_IOBASE		((void __iomem *)PCI_IO_START)
 #define IOPORT_RW_BASE		PCI_IO_START
 
+#ifdef CONFIG_MACH_LOONGSON64
+#define MMIO_LOWER_RESERVED	0x10000
+#endif
+
 #else
 
 #define IO_SPACE_LIMIT 0xffff
diff --git a/arch/mips/loongson64/init.c b/arch/mips/loongson64/init.c
index da38944471f4..3117edbbea46 100644
--- a/arch/mips/loongson64/init.c
+++ b/arch/mips/loongson64/init.c
@@ -29,10 +29,6 @@ void __init prom_init(void)
 	fw_init_cmdline();
 	prom_init_env();
 
-	/* init base address of io space */
-	set_io_port_base((unsigned long)
-		ioremap(LOONGSON_PCIIO_BASE, LOONGSON_PCIIO_SIZE));
-
 	prom_init_numa_memory();
 
 	/* Hardcode to CPU UART 0 */
@@ -48,5 +44,13 @@ void __init prom_free_prom_memory(void)
 
 void __init arch_init_irq(void)
 {
+	/*
+	 * i8259 would access I/O space, so mapping must be done here.
+	 * Please remove it when all drivers can be managed by logic_pio.
+	 */
+	ioremap_page_range(PCI_IO_START, PCI_IO_START + MMIO_LOWER_RESERVED,
+				  LOONGSON_PCIIO_BASE,
+				  pgprot_device(PAGE_KERNEL));
+
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

