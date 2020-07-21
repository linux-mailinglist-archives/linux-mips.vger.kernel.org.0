Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87E882281D0
	for <lists+linux-mips@lfdr.de>; Tue, 21 Jul 2020 16:18:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726710AbgGUOSM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Jul 2020 10:18:12 -0400
Received: from vultr.net.flygoat.com ([149.28.68.211]:41540 "EHLO
        vultr.net.flygoat.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726522AbgGUOSM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 21 Jul 2020 10:18:12 -0400
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id D9CA61FEB6;
        Tue, 21 Jul 2020 14:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1595341091; bh=Y4wcwH4FhAY5HQrWe45y/n2ZxtE7DUn+69eLbE/MduM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tBXnRyaAcmJ5mY9w5rogQ7yKTwCCDxSvqV7GLR6yIb6f4ke4UBf4vMNQ2u0Jirx53
         z9/IB0lo/Y8jU8v3AjjmSUTfaEQuoG+mSGEXGgWzWXG+QqPxkQSoCjyN7fRhGnvr2o
         htJyXJMWt6NLvX6vroudLAafBHZ44bEKhB90ErL4e3e+NMa7FtUddLA93Bb03bDZne
         c9MzRyi0eBO158U1nCUIn0Pkk9/8EsF4TvQIyC9p411A1DD6xnVgFs09VVvP1xY7OI
         FZzG801Hm+FZ8iZD3qaNw9z+C09ETmvPTw+8oVvPFYuw9Zoj5uyTglEi0kSQ+JqY+0
         alr60L6E6Yj8A==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Paul Burton <paulburton@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] MIPS: Loongson64: Process ISA Node in DeviceTree
Date:   Tue, 21 Jul 2020 22:17:30 +0800
Message-Id: <20200721141742.996350-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.28.0.rc1
In-Reply-To: <20200721141742.996350-1-jiaxun.yang@flygoat.com>
References: <20200721141742.996350-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Previously, we're hardcoding resserved ISA I/O Space in code, now
we're processing reverved I/O via DeviceTree directly. Using the ranges
property to determine the size and address of reserved I/O space.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
--
v2: Use range_parser instead of pci_range_parser
---
 arch/mips/loongson64/init.c | 88 ++++++++++++++++++++++++++-----------
 1 file changed, 63 insertions(+), 25 deletions(-)

diff --git a/arch/mips/loongson64/init.c b/arch/mips/loongson64/init.c
index 59ddadace83f..67e95193758e 100644
--- a/arch/mips/loongson64/init.c
+++ b/arch/mips/loongson64/init.c
@@ -7,6 +7,8 @@
 #include <linux/irqchip.h>
 #include <linux/logic_pio.h>
 #include <linux/memblock.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
 #include <asm/bootinfo.h>
 #include <asm/traps.h>
 #include <asm/smp-ops.h>
@@ -63,41 +65,77 @@ void __init prom_free_prom_memory(void)
 {
 }
 
-static __init void reserve_pio_range(void)
+static int __init add_legacy_isa_io(struct fwnode_handle *fwnode, resource_size_t hw_start,
+				    resource_size_t size)
 {
+	int ret = 0;
 	struct logic_pio_hwaddr *range;
+	unsigned long vaddr;
 
 	range = kzalloc(sizeof(*range), GFP_ATOMIC);
 	if (!range)
-		return;
+		return -ENOMEM;
 
-	range->fwnode = &of_root->fwnode;
-	range->size = MMIO_LOWER_RESERVED;
-	range->hw_start = LOONGSON_PCIIO_BASE;
+	range->fwnode = fwnode;
+	range->size = size;
+	range->hw_start = hw_start;
 	range->flags = LOGIC_PIO_CPU_MMIO;
 
-	if (logic_pio_register_range(range)) {
-		pr_err("Failed to reserve PIO range for legacy ISA\n");
-		goto free_range;
+	ret = logic_pio_register_range(range);
+	if (ret) {
+		kfree(range);
+		return ret;
+	}
+
+	/* Legacy ISA must placed at the start of PCI_IOBASE */
+	if (range->io_start != 0) {
+		logic_pio_unregister_range(range);
+		kfree(range);
+		return -EINVAL;
 	}
 
-	if (WARN(range->io_start != 0,
-			"Reserved PIO range does not start from 0\n"))
-		goto unregister;
-
-	/*
-	 * i8259 would access I/O space, so mapping must be done here.
-	 * Please remove it when all drivers can be managed by logic_pio.
-	 */
-	ioremap_page_range(PCI_IOBASE, PCI_IOBASE + MMIO_LOWER_RESERVED,
-				LOONGSON_PCIIO_BASE,
-				pgprot_device(PAGE_KERNEL));
-
-	return;
-unregister:
-	logic_pio_unregister_range(range);
-free_range:
-	kfree(range);
+	vaddr = PCI_IOBASE + range->io_start;
+
+	ioremap_page_range(vaddr, vaddr + size, hw_start, pgprot_device(PAGE_KERNEL));
+
+	return 0;
+}
+
+static __init void reserve_pio_range(void)
+{
+	struct device_node *np;
+
+	for_each_node_by_name(np, "isa") {
+		struct of_range range;
+		struct of_range_parser parser;
+
+		pr_info("ISA Bridge: %pOF\n", np);
+
+		if (of_range_parser_init(&parser, np)) {
+			pr_info("Failed to parse resources.\n");
+			break;
+		}
+
+		for_each_of_range(&parser, &range) {
+			switch (range.flags & IORESOURCE_TYPE_BITS) {
+			case IORESOURCE_IO:
+				pr_info(" IO 0x%016llx..0x%016llx  ->  0x%016llx\n",
+					range.cpu_addr,
+					range.cpu_addr + range.size - 1,
+					range.bus_addr);
+				if (add_legacy_isa_io(&np->fwnode, range.cpu_addr + range.bus_addr,
+						      range.size))
+					pr_warn("Failed to reserve legacy IO in Logic PIO\n");
+				break;
+			case IORESOURCE_MEM:
+				pr_info(" MEM 0x%016llx..0x%016llx  ->  0x%016llx\n",
+					range.cpu_addr,
+					range.cpu_addr + range.size - 1,
+					range.bus_addr);
+				break;
+			}
+		}
+	}
 }
 
 void __init arch_init_irq(void)
-- 
2.28.0.rc1

