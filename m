Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30CE4230E10
	for <lists+linux-mips@lfdr.de>; Tue, 28 Jul 2020 17:38:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731021AbgG1Phk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Jul 2020 11:37:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730979AbgG1Phk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 Jul 2020 11:37:40 -0400
Received: from vultr.net.flygoat.com (vultr.net.flygoat.com [IPv6:2001:19f0:6001:3633:5400:2ff:fe8c:553])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41C41C061794;
        Tue, 28 Jul 2020 08:37:40 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 128D51FF10;
        Tue, 28 Jul 2020 15:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1595950660; bh=Dq9Fd1D4T3cB1coSZCOwx/CX9dxAaAo3bdZhd0RaPvw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bICUAXN8jX7oP8ISzKwh4hbY2CxNn4SC7TQh2wDtnERpIY0pX7u4msmd3325IR+Vr
         MtQtCMAi7ZsjCwFkqXpxRu41GAxcLg81EjHLTNoT3xTRtIH+Ek0DBihoggaiMwxZ+K
         mPe6UWk7dql1yB60F71t9vEBJ9fzmLgF1Nn3qbg8g1bb23t6ouleKJAStL+tb5JtBB
         VvQoMon625mkPbQ0SLITQpM4gIqGZGv5hrxoVneTuzLwPX5+Z/7mB0N8KbmChQ2Ccg
         1PNQ/lnKeiUCxmrIhlxsG1TxWvlXhcQjWgPYoTidaSsgEN1mvYJalZYIHTHYKk9bHi
         u6fZlCYbw5XUw==
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
Subject: [PATCH v4 2/5] MIPS: Loongson64: Process ISA Node in DeviceTree
Date:   Tue, 28 Jul 2020 23:36:56 +0800
Message-Id: <20200728153708.1296374-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.28.0.rc1
In-Reply-To: <20200728153708.1296374-1-jiaxun.yang@flygoat.com>
References: <20200728153708.1296374-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Previously, we're hardcoding reserved ISA I/O Space in, now
we're processing it I/O via DeviceTree directly.
The ranges property if ISA node is used to determine the size and address
of reserved I/O space.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
--
v2: Use range_parser instead of pci_range_parser
v4: Fix typos & grammar problem thanks to Xuerui.
---
 arch/mips/loongson64/init.c | 87 ++++++++++++++++++++++++++-----------
 1 file changed, 62 insertions(+), 25 deletions(-)

diff --git a/arch/mips/loongson64/init.c b/arch/mips/loongson64/init.c
index 59ddadace83f..8ba22c30f312 100644
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
@@ -63,41 +65,76 @@ void __init prom_free_prom_memory(void)
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
+				if (add_legacy_isa_io(&np->fwnode, range.cpu_addr, range.size))
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

