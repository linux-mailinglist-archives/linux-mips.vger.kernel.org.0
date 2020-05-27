Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B64D01E4350
	for <lists+linux-mips@lfdr.de>; Wed, 27 May 2020 15:17:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730210AbgE0NR6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 May 2020 09:17:58 -0400
Received: from vultr.net.flygoat.com ([149.28.68.211]:34470 "EHLO
        vultr.net.flygoat.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbgE0NR6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 27 May 2020 09:17:58 -0400
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 904A020CF5;
        Wed, 27 May 2020 13:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1590585477; bh=TyCh2oo8yxVUWVWyl+bhaPPjK8SpeLsyRuP1msgd7cg=;
        h=From:To:Cc:Subject:Date:From;
        b=cBI5XsnIeyj7lwzzV2iYA3chZAGVzVdgsI3q3zj55bLXmvU1dJXEsAuWBBv0kXdiM
         Z+7cZW/8C2h6qx2gQYLsk8yG1yjq7AYvugaFjkmSBcS8QdEduwoBzxMA5Y9Vpz92Sl
         VYkfD9f3FWYTUn/TPLBWfKacpXz66C+6oREpqd1gv4JiiVKFrzmeS0TsopE65OVD8/
         bzVQoGSVeHaUBwizx/XisXpjZkrHtUthjpIAnwQ4unLZVgGQzySw0iY1ObUqYZDkxL
         FvU5xMMGdO2uTMOZozYYIL+xs77q33uw82gGsxw4GyFxOJRxo0jTtuClC0Qi2YqqK+
         JIPkMuHwlXZKw==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: Loongson64: Define PCI_IOBASE
Date:   Wed, 27 May 2020 21:17:21 +0800
Message-Id: <20200527131721.646926-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.27.0.rc0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

PCI_IOBASE is used to create VM maps for PCI I/O ports, it is
required by generic PCI drivers to make memory mapped I/O range
work.

To deal with legacy drivers that have fixed I/O ports range we
reserved 0x10000 in PCI_IOBASE, should be enough for i8259 i8042
stuff.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 .../mips/include/asm/mach-loongson64/spaces.h |  8 ++++
 arch/mips/loongson64/init.c                   | 42 ++++++++++++++++++-
 2 files changed, 48 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/mach-loongson64/spaces.h b/arch/mips/include/asm/mach-loongson64/spaces.h
index e85bc1d9c4f2..3de0ac9d8829 100644
--- a/arch/mips/include/asm/mach-loongson64/spaces.h
+++ b/arch/mips/include/asm/mach-loongson64/spaces.h
@@ -6,5 +6,13 @@
 #define CAC_BASE        _AC(0x9800000000000000, UL)
 #endif /* CONFIG_64BIT */
 
+/* Skip 128k to trap NULL pointer dereferences */
+#define PCI_IOBASE	_AC(0xc000000000000000 + SZ_128K, UL)
+#define PCI_IOSIZE	SZ_16M
+#define MAP_BASE	(PCI_IOBASE + PCI_IOSIZE)
+
+/* Reserved at the start of PCI_IOBASE for legacy drivers */
+#define MMIO_LOWER_RESERVED	0x10000
+
 #include <asm/mach-generic/spaces.h>
 #endif
diff --git a/arch/mips/loongson64/init.c b/arch/mips/loongson64/init.c
index 23eeb85b1abf..59ddadace83f 100644
--- a/arch/mips/loongson64/init.c
+++ b/arch/mips/loongson64/init.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/irqchip.h>
+#include <linux/logic_pio.h>
 #include <linux/memblock.h>
 #include <asm/bootinfo.h>
 #include <asm/traps.h>
@@ -45,8 +46,7 @@ void __init prom_init(void)
 	prom_init_env();
 
 	/* init base address of io space */
-	set_io_port_base((unsigned long)
-		ioremap(LOONGSON_PCIIO_BASE, LOONGSON_PCIIO_SIZE));
+	set_io_port_base(PCI_IOBASE);
 
 	loongson_sysconf.early_config();
 
@@ -63,7 +63,45 @@ void __init prom_free_prom_memory(void)
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
+	ioremap_page_range(PCI_IOBASE, PCI_IOBASE + MMIO_LOWER_RESERVED,
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
-- 
2.27.0.rc0

