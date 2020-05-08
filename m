Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD40C1CA9E2
	for <lists+linux-mips@lfdr.de>; Fri,  8 May 2020 13:44:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727119AbgEHLoq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 May 2020 07:44:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726616AbgEHLoq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 8 May 2020 07:44:46 -0400
Received: from vultr.net.flygoat.com (vultr.net.flygoat.com [IPv6:2001:19f0:6001:3633:5400:2ff:fe8c:553])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FCD5C05BD43
        for <linux-mips@vger.kernel.org>; Fri,  8 May 2020 04:44:46 -0700 (PDT)
Received: from localhost.localdomain (unknown [142.147.94.151])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id CB6AB20497;
        Fri,  8 May 2020 11:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1588938286; bh=C5qztqPLb62cS6PC/X7EnkOWBrplQi9Fr3FAMFBeWcQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CheiP44HNEuxvXgQ/H4AtHDhdJsWFleZ3al3CwxUCnvgSQc8zdLSrf9jYAco3+UGD
         J9IQknNgyd6EPdrMEexiAjLI9Q5bibTENX3vbBDtFCj7cOHrzWJUUsOXnOn/F94HZx
         ZH2YzVSKnKuh59557nYrt1A/zO9h1Z7Y5lh70s60/pAD0xlo8YU6SwQRNOIlsDuyfI
         Z4FL1khlSiCSrw8AKT/5VhFOGtAsbMLKLICcBbyWjysWzvCgS5X14yK3F1BlGjNJeE
         Gg3TcR4Gj1pFkfzucbd4DwJdXOO1HH4B8UyzxBIG3k4nW9yQuW7Icw4RjDnGomnlbM
         Dks0mWtcSj5aQ==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, tsbogend@alpha.franken.de,
        john.garry@huawei.com, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH RESEND v3 2/3] MIPS: Introduce PCI_IO_VMMAP
Date:   Fri,  8 May 2020 19:44:37 +0800
Message-Id: <20200508114438.3092215-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200508114438.3092215-1-jiaxun.yang@flygoat.com>
References: <20200426114806.1176629-1-jiaxun.yang@flygoat.com>
 <20200508114438.3092215-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Define PCI_IOBASE for MIPS at the strat of kernel mapping segment.
That would allow virt address of I/O ports to be dynamicly mapped.
So we'll be able to combine multiple MMIO ranges into I/O ports
and thus we can take advantage of logic_pio mechanism.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/Kconfig                           |  3 ++
 arch/mips/include/asm/io.h                  | 36 ++++++++++++++++-----
 arch/mips/include/asm/mach-generic/spaces.h | 13 ++++++--
 arch/mips/kernel/setup.c                    |  2 ++
 arch/mips/lib/iomap-pci.c                   |  2 +-
 5 files changed, 45 insertions(+), 11 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 0519ca9f00f9..4e5308178649 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -3149,6 +3149,9 @@ config PCI_DRIVERS_LEGACY
 	select NO_GENERIC_PCI_IOPORT_MAP
 	select PCI_DOMAINS if PCI
 
+config PCI_IO_VMMAP
+	def_bool n
+
 #
 # ISA support is now enabled via select.  Too many systems still have the one
 # or other ISA chip on the board that users don't know about so don't expect
diff --git a/arch/mips/include/asm/io.h b/arch/mips/include/asm/io.h
index 346fffd9e972..f15ddcd27f35 100644
--- a/arch/mips/include/asm/io.h
+++ b/arch/mips/include/asm/io.h
@@ -51,17 +51,36 @@
 
 /* ioswab[bwlq], __mem_ioswab[bwlq] are defined in mangle-port.h */
 
+/*
+ * On MIPS I/O ports are memory mapped, so we access them using normal
+ * load/store instructions.
+ */
+#ifdef CONFIG_PCI_IO_VMMAP
+/*
+ * I/O port access primitives for dymatic I/O ports mapping.
+ *
+ * We'll create kmap for I/O ports in this space.
+ */
+#define arch_has_dev_port()	(1)
+#define IO_SPACE_LIMIT		(PCI_IO_SIZE - 1)
+#define PCI_IOBASE		((void __iomem *)PCI_IO_START)
+#define IOPORT_RW_BASE		PCI_IO_START
+
+#else
+
 #define IO_SPACE_LIMIT 0xffff
 
 /*
- * On MIPS I/O ports are memory mapped, so we access them using normal
- * load/store instructions. mips_io_port_base is the virtual address to
- * which all ports are being mapped.  For sake of efficiency some code
- * assumes that this is an address that can be loaded with a single lui
- * instruction, so the lower 16 bits must be zero.  Should be true on
- * on any sane architecture; generic code does not use this assumption.
+ * I/O port access primitives for fixed I/O ports mapping.
+ *
+ * mips_io_port_base is the virtual address to which all ports are
+ * being mapped.  For sake of efficiency some code assumes that this
+ * is an address that can be loaded with a single lui, instruction, so
+ * the lower 16 bits must be zero. Should be true on on any sane architecture;
+ * generic code does not use this assumption.
  */
 extern unsigned long mips_io_port_base;
+#define IOPORT_RW_BASE		mips_io_port_base
 
 static inline void set_io_port_base(unsigned long base)
 {
@@ -78,6 +97,7 @@ static inline void set_io_port_base(unsigned long base)
 #define PIO_OFFSET	mips_io_port_base
 #define PIO_MASK	IO_SPACE_LIMIT
 #define PIO_RESERVED	0x0UL
+#endif
 
 /*
  * Enforce in-order execution of data I/O.  In the MIPS architecture
@@ -308,7 +328,7 @@ static inline void pfx##out##bwlq##p(type val, unsigned long port)	\
 	else								\
 		war_io_reorder_wmb();					\
 									\
-	__addr = (void *)__swizzle_addr_##bwlq(mips_io_port_base + port); \
+	__addr = (void *)__swizzle_addr_##bwlq(IOPORT_RW_BASE + port); \
 									\
 	__val = pfx##ioswab##bwlq(__addr, val);				\
 									\
@@ -323,7 +343,7 @@ static inline type pfx##in##bwlq##p(unsigned long port)			\
 	volatile type *__addr;						\
 	type __val;							\
 									\
-	__addr = (void *)__swizzle_addr_##bwlq(mips_io_port_base + port); \
+	__addr = (void *)__swizzle_addr_##bwlq(IOPORT_RW_BASE + port); \
 									\
 	BUILD_BUG_ON(sizeof(type) > sizeof(unsigned long));		\
 									\
diff --git a/arch/mips/include/asm/mach-generic/spaces.h b/arch/mips/include/asm/mach-generic/spaces.h
index 44fefde46a10..adf559db50cd 100644
--- a/arch/mips/include/asm/mach-generic/spaces.h
+++ b/arch/mips/include/asm/mach-generic/spaces.h
@@ -104,15 +104,24 @@
 #endif
 #endif
 
+#ifdef CONFIG_PCI_IO_VMMAP
+#define PCI_IO_SIZE		SZ_16M
+#else
+#define PCI_IO_SIZE		0
+#endif
+
 #ifdef CONFIG_64BIT
 /*
  * TLB refill handlers also map the vmalloc area into xuseg.  Avoid
  * the first couple of pages so NULL pointer dereferences will still
  * reliably trap.
  */
-#define VMALLOC_START		(MAP_BASE + (2 * PAGE_SIZE))
+#define PCI_IO_START		(MAP_BASE + (2 * PAGE_SIZE))
 #else
-#define VMALLOC_START	  MAP_BASE
+#define PCI_IO_START		MAP_BASE
 #endif
 
+#define PCI_IO_END		(PCI_IO_START + PCI_IO_SIZE)
+#define VMALLOC_START		PCI_IO_END
+
 #endif /* __ASM_MACH_GENERIC_SPACES_H */
diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 8db533cd816c..99225539de3c 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -73,12 +73,14 @@ static const char builtin_cmdline[] __initconst = CONFIG_CMDLINE;
 static const char builtin_cmdline[] __initconst = "";
 #endif
 
+#ifndef CONFIG_PCI_IO_VMMAP
 /*
  * mips_io_port_base is the begin of the address space to which x86 style
  * I/O ports are mapped.
  */
 unsigned long mips_io_port_base = -1;
 EXPORT_SYMBOL(mips_io_port_base);
+#endif
 
 static struct resource code_resource = { .name = "Kernel code", };
 static struct resource data_resource = { .name = "Kernel data", };
diff --git a/arch/mips/lib/iomap-pci.c b/arch/mips/lib/iomap-pci.c
index 210f5a95ecb1..f28924aaac1d 100644
--- a/arch/mips/lib/iomap-pci.c
+++ b/arch/mips/lib/iomap-pci.c
@@ -27,7 +27,7 @@ void __iomem *__pci_ioport_map(struct pci_dev *dev,
 		while (bus->parent)
 			bus = bus->parent;
 
-		ctrl->io_map_base = base = mips_io_port_base;
+		ctrl->io_map_base = base = IOPORT_RW_BASE;
 
 		sprintf(name, "%04x:%02x", pci_domain_nr(bus), bus->number);
 		printk(KERN_WARNING "io_map_base of root PCI bus %s unset.  "
-- 
2.26.0.rc2

