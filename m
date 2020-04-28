Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CB901BB3C9
	for <lists+linux-mips@lfdr.de>; Tue, 28 Apr 2020 04:16:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726359AbgD1CQH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Apr 2020 22:16:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726262AbgD1CQH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 27 Apr 2020 22:16:07 -0400
Received: from vultr.net.flygoat.com (vultr.net.flygoat.com [IPv6:2001:19f0:6001:3633:5400:2ff:fe8c:553])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1133AC03C1A8;
        Mon, 27 Apr 2020 19:16:07 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 50C5C2049E;
        Tue, 28 Apr 2020 02:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1588040166; bh=bPycrvcpFUDgrChWQ5Ufaobs1cxvSE3Ye4BGxj+JDIw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fwy8rYqlCBxQ8zYckODE3MGUA1BKHNiwRAIPcZrnCI+qc7pSTVNSuuVPVQSPzTGwM
         32BW+ocTDxG6ruMntfVAAR2S3uM1b/c3HMg29wmypsc6EXNP9R800cLYG86YD7HrJl
         VtXDEriPJ0499/VARInbFlMak5Augs0lBaV9d6v5sSFOjaupwsC7kVU8ceJv+Kp4xa
         PS2BwG7qetk/MQIN22kJVWf+YfBVY91bivjKEzuYeh2YxQ7v7vKshCRl6/PnRIU7Rp
         LiPZOgyjXHdIoO1bEhBWfdaBwR1vLiUbxBTytVrEQwoOhYXoAaKYDXbnGssvla1Hqq
         E7JFWg481g8xQ==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     john.garry@huawei.com, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Paul Burton <paulburton@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Stephen Kitt <steve@sk2.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Daniel Silsby <dansilsby@gmail.com>,
        Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>,
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] MIPS: Introduce PCI_IO_VMMAP
Date:   Tue, 28 Apr 2020 10:14:13 +0800
Message-Id: <20200428021437.2000066-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200428021437.2000066-1-jiaxun.yang@flygoat.com>
References: <20200428021437.2000066-1-jiaxun.yang@flygoat.com>
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
index 89162740951a..a39714c5fd7b 100644
--- a/arch/mips/include/asm/mach-generic/spaces.h
+++ b/arch/mips/include/asm/mach-generic/spaces.h
@@ -103,15 +103,24 @@
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

